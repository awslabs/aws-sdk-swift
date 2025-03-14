import Foundation
import ClientRuntime

enum OperatingSystem: String {
    case macOS = "macOS"
    case Linux = "Linux"
    case Unknown = "Unknown"

    static var current: OperatingSystem {
    #if os(macOS)
        return .macOS
    #elseif os(Linux)
        return .Linux
    #else
        return .Unknown
    #endif
    }
}

struct ProcessRunner {
    static func runProcess(
        executable: String = "/usr/bin/env",
        arguments: [String]
    ) -> String {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: executable)
        process.arguments = arguments

        let outputPipe = Pipe()
        process.standardOutput = outputPipe
        process.standardError = Pipe()

        do {
            try process.run()
            process.waitUntilExit()
            let outputData = outputPipe.fileHandleForReading.readDataToEndOfFile()
            return String(data: outputData, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        } catch {
            print("ProcessRunner Error: \(error.localizedDescription)")
            return ""
        }
    }
}

struct BenchmarkResult: Codable {
    let name: String
    let description: String
    let unit: String
    let date: Int
    let measurements: [Double]
    let dimensions: [Dimension]?
    var publishToCloudWatch: Bool? = nil
}

struct Dimension: Codable {
    let name: String
    let value: String
}

struct BenchmarkReport: Codable {
    let productId: String
    let sdkVersion: String?
    let commitId: String
    let results: [BenchmarkResult]
}

final class BenchmarkRunner {
    
    /// Executes the given test multiple times
    func runBenchmark(
        name: String,
        description: String,
        unit: String,
        dimensions: [Dimension]? = nil,
        test: () async throws -> Double
    ) async throws -> BenchmarkResult {
        var measurements: [Double] = []

        for _ in 0..<5 {
            measurements.append(try await test())
        }

        let timestamp = Int(Date().timeIntervalSince1970)
        return BenchmarkResult(
            name: name,
            description: description,
            unit: unit,
            date: timestamp,
            measurements: measurements,
            dimensions: dimensions
        )
    }

    /// Retrieves the current Git commit ID.
    func getGitCommitId() -> String {
        return ProcessRunner.runProcess(arguments: ["git", "rev-parse", "HEAD"])
    }

    /// Retrieves the SDK version from a file.
    func getSdkVersion() -> String {
        return ProcessRunner.runProcess(arguments: ["cat", "../../aws-sdk-swift/Package.version"])
    }
}

// MARK: - Main Entry Point

@main
struct PerformanceTestRun {
    static func main() async throws {
        let runner = BenchmarkRunner()
        let commitId = runner.getGitCommitId()
        let sdkVersion = runner.getSdkVersion()
        let currentOS = OperatingSystem.current.rawValue

        let benchmarks: [BenchmarkResult] = [
            try await runner.runBenchmark(
                name: "sts.getcalleridentity.latency",
                description: "The total time between initiating a GetCallerIdentity and reading the last byte of the object.",
                unit: "Milliseconds",
                dimensions: [
                    Dimension(name: "OS", value: currentOS),
                ],
                test: AWSSTSTests.getCallerIdentity
            )
        ]

        let report = BenchmarkReport(
            productId: "AWS SDK for Swift",
            sdkVersion: sdkVersion,
            commitId: commitId,
            results: benchmarks
        )

        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted

        if let jsonData = try? jsonEncoder.encode(report),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            print(jsonString)
        } else {
            print("Error encoding JSON")
        }
    }
}
