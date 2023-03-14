//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ArgumentParser
import Foundation
import PackageDescription

struct GenerateSDK: ParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "Generates the SDK"
    )
    
    @Argument(help: "The path to the aws-sdk-swift repository")
    var repoPath: String
    
    @Option(help: "The names of the services to include in the SDK. This defaults to all services that are succefully generated.")
    var services: [String] = []
    
    func run() throws {
        try FileManager.changeWorkingDirectory(repoPath)
        try codegenServices()
//        try moveServicesToSources()
//        try mergeServiceFiles()
//        try generatePackageManifest()
    }
}

extension GenerateSDK {
    func codegenServices() throws {
        print("Generating Services...")
        let task = Process("./gradlew", "-p", "codegen/sdk-codegen", "build", "--console=plain")
        let standardOutput = Pipe()
        let standardError = Pipe()
        task.standardOutput = standardOutput
        task.standardError = standardError

        standardOutput.fileHandleForReading.readabilityHandler = { fileHandle in
            Task { @MainActor in
                if let line = String(data: fileHandle.availableData, encoding: .utf8) {
                    let lineNormalized = line.trimmingCharacters(in: .whitespacesAndNewlines)
                    if !lineNormalized.isEmpty {
                        print(lineNormalized)
                    }
                }
            }
        }
        
        standardError.fileHandleForReading.readabilityHandler = { fileHandle in
            Task { @MainActor in
                if let line = String(data: fileHandle.availableData, encoding: .utf8) {
                    let lineNormalized = line.trimmingCharacters(in: .whitespacesAndNewlines)
                    if !lineNormalized.isEmpty {
                        print(lineNormalized)
                    }
                }
            }
        }
        
        try _run(task)
        print("Waiting for task to exit")
        task.waitUntilExit()
        print("epau --- Task finished: \(task.terminationStatus)")
        standardOutput.fileHandleForReading.readabilityHandler = nil
        standardError.fileHandleForReading.readabilityHandler = nil
        standardOutput.fileHandleForReading.closeFile()
        standardError.fileHandleForReading.closeFile()
    }
    
    func moveServicesToSources() throws {
        print("Moving generated services to Sources/Services...")
        let task = Process("./gradlew", "-p", "codegen/sdk-codegen", "stageSdks")
        try _run(task)
        task.waitUntilExit()
    }
    
    func mergeServiceFiles() throws {
        print("Merging service files...")
        let task = Process("./scripts/mergeModels.sh", "Sources/Services")
        try _run(task)
        task.waitUntilExit()
    }
    
    func generatePackageManifest() throws {
        print("Generating package manifest...")
        let command = GeneratePackageManifest(repoPath: .init(wrappedValue: "."))
        try command.run()
    }
}
