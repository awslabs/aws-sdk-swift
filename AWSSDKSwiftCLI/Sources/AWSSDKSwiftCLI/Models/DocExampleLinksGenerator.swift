//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import AWSCLIUtils

struct DocExampleLinksGenerator {
    private let inputPath: String
    private let sdkPath: String

    init(inputPath: String, sdkPath: String) {
        self.inputPath = inputPath
        self.sdkPath = sdkPath
    }

    func generate() throws {
        log("Reading examples metadata from \(inputPath)")
        let meta = try loadExampleMeta()

        let knownSdkIds = try readSdkIds()
        let examples = parseExamples(meta: meta, knownSdkIds: knownSdkIds)
        try writeExamples(examples: examples, meta: meta)
    }

    private func loadExampleMeta() throws -> ExampleMeta {
        let data = try Data(contentsOf: URL(fileURLWithPath: inputPath))
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(ExampleMeta.self, from: data)
    }

    private func parseExamples(meta: ExampleMeta, knownSdkIds: Set<String>) -> [ExampleDoc] {
        return meta.examples.values
            .filter { $0.isSwiftSpecific }
            .flatMap { example in
                examplesByService(example: example, meta: meta, knownSdkIds: knownSdkIds)
            }
    }

    private func examplesByService(example: Example, meta: ExampleMeta, knownSdkIds: Set<String>) -> [ExampleDoc] {
        return example.services.keys.compactMap { metaServiceName in
            guard !metaServiceName.isEmpty,
                  let sdkId = try? meta.sdkId(serviceName: metaServiceName),
                  !sdkId.isEmpty,
                  knownSdkIds.contains(sdkId),
                  let servicePage = example.docFilenames.servicePages[metaServiceName],
                  !servicePage.isEmpty else {
                return nil
            }

            return ExampleDoc(
                sdkId: sdkId,
                category: (example.category ?? "Other").normalizeCategory(),
                title: example.title.sanitizeToMarkdown(),
                link: servicePage
            )
        }
    }

    private func readSdkIds() throws -> Set<String> {
        let modelsPath = URL(fileURLWithPath: sdkPath).appendingPathComponent("codegen/sdk-codegen/aws-models")
        log("Reading sdkIDs from \(modelsPath.path)/*.json")

        let fileManager = FileManager.default
        let jsonFiles = try fileManager.contentsOfDirectory(at: modelsPath, includingPropertiesForKeys: nil)
            .filter { $0.pathExtension == "json" }

        return Set(try jsonFiles.map { try readSdkId(from: $0) })
    }

    private func readSdkId(from path: URL) throws -> String {
        do {
            let data = try Data(contentsOf: path)
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]

            guard let shapes = json?["shapes"] as? [String: Any] else {
                throw DocExampleLinksError.invalidModelFile(path.path)
            }

            let serviceShape = shapes.values.first { shape in
                guard let shapeDict = shape as? [String: Any],
                      let type = shapeDict["type"] as? String else { return false }
                return type == "service"
            }

            guard let serviceDict = serviceShape as? [String: Any],
                  let traits = serviceDict["traits"] as? [String: Any],
                  let awsService = traits["aws.api#service"] as? [String: Any],
                  let sdkId = awsService["sdkId"] as? String else {
                throw DocExampleLinksError.invalidModelFile(path.path)
            }

            return sdkId
        } catch {
            throw DocExampleLinksError.unableToReadSdkId(path.path, error)
        }
    }

    private func writeExamples(examples: [ExampleDoc], meta: ExampleMeta) throws {
        log("Processing \(examples.count) examples")

        var serviceExamples: [String: [ExampleDoc]] = [:]
        for example in examples {
            if serviceExamples[example.sdkId] == nil {
                serviceExamples[example.sdkId] = []
            }
            serviceExamples[example.sdkId]?.append(example)
        }

        log("Writing examples:")

        let exampleCounts = try serviceExamples.map { (sdkId, examples) -> Int in
            let packageName = "AWS\(sdkId.filter { !$0.isWhitespace }.capitalizeFirst())"
            let servicePath = URL(fileURLWithPath: sdkPath)
                .appendingPathComponent("Sources/Services/\(packageName)/Sources/\(packageName)")

            if !FileManager.default.fileExists(atPath: servicePath.path) {
                log("  Service \(packageName) path \(servicePath.path) does not exist; skipping")
                return 0
            }

            let count = try writeServiceExamples(
                sdkId: sdkId,
                packageName: packageName,
                servicePath: servicePath,
                examples: examples,
                meta: meta
            )
            log("  Wrote \(count) examples for \(packageName)")
            return count
        }

        log("Wrote \(exampleCounts.reduce(0, +)) total examples across \(exampleCounts.count) services")
    }

    private func writeServiceExamples(
        sdkId: String,
        packageName: String,
        servicePath: URL,
        examples: [ExampleDoc],
        meta: ExampleMeta
    ) throws -> Int {
        guard !sdkId.isEmpty else {
            log("Skipping empty sdkId")
            return 0
        }

        let serviceName = try meta.serviceName(sdkId: sdkId)
        let rootLink = "https://docs.aws.amazon.com/code-library/latest/ug/swift_1_\(serviceName)_code_examples.html"

        let docDir = servicePath.appendingPathComponent("Documentation.docc")
        try FileManager.default.createDirectory(at: docDir, withIntermediateDirectories: true)

        let docFile = docDir.appendingPathComponent("CodeExamples.md")
        var content = """
        # \(packageName) Code examples

        The code examples for \(packageName).

        Explore code examples in the [AWS SDK Code Examples Code Library](\(rootLink)).
        """

        let categories = Dictionary(grouping: examples) { $0.category }

        // Show all categories with headers regardless of count
        for (category, categoryExamples) in categories {
            content += "\n\n## \(category)\n\n"
            content += formatExampleLinks(categoryExamples)
        }

        try content.write(to: docFile, atomically: true, encoding: .utf8)
        return examples.count
    }

    private func formatExampleLinks(_ examples: [ExampleDoc]) -> String {
        return examples.sorted { $0.title < $1.title }
            .map { "* [\($0.title)](\($0.link))" }
            .joined(separator: "\n")
    }
}

private extension String {
    func sanitizeToMarkdown() -> String {
        return self.replacingOccurrences(of: "<code>", with: "`")
                   .replacingOccurrences(of: "</code>", with: "`")
    }

    func capitalizeFirst() -> String {
        guard !isEmpty else { return self }
        return String(prefix(1).uppercased() + dropFirst())
    }

    func normalizeCategory() -> String {
        switch self {
        case "Api":
            return "API"
        case "IAMPolicy":
            return "IAM Policy"
        default:
            return self
        }
    }
}

enum DocExampleLinksError: Swift.Error {
    case invalidModelFile(String)
    case unableToReadSdkId(String, Swift.Error)
}