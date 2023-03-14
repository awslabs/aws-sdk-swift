//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Algorithms
import ArgumentParser
import Foundation
import PackageDescription

struct Test: ParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "Builds the package and executes its tests",
        discussion: "swift test --parallel"
    )
    
    @Argument(help: "The path to the aws-sdk-swift repository")
    var repoPath: String
    
    @Option(help: "The number of batches to break out the tests.")
    var batches: UInt = 1
    
    func run() throws {
        try FileManager.changeWorkingDirectory(repoPath)
        
        // If batches is 1, then run `swift test --parallel` with the current Package.swift
        guard batches > 1 else {
            print("Testing Package.swift...")
            let task = Process("swift", "test", "--parallel")
            try _run(task)
            task.waitUntilExit()
            return
        }
        
        print("Creating \(batches) batches...")
        let services = try enabledServices()
        let chunkSize = services.count / Int(batches)
        let serviceBatches = services.chunks(ofCount: chunkSize)
        
        var packageManifests: [String] = []
        
        for (index, serviceList) in serviceBatches.enumerated() {
            // Create the package manifest for each batch
            let packageManifest = "Package.TestBatch\(index + 1).swift"
            let services = Array(serviceList)
            let command = GeneratePackageManifest(
                packageFileName: packageManifest,
                services: services
            )
            try command.run()
            packageManifests.append(packageManifest)
            print("""
            Created batch \(index + 1)
                * Manifest: \(packageManifest)
                * Size: \(services.count)
                * First Service: \(services.first!)
                * Last Service: \(services.last!)
            """)
        }
        
        // Move the current Package.swift to a new file to be restored later
        try FileManager.default.moveItem(atPath: "Package.swift", toPath: "Package.Release.swift")
        
        try packageManifests.forEach { package in
            print("Testing \(package)...")
            // Set this package as the Package.swift and run tests
            try FileManager.default.moveItem(atPath: package, toPath: "Package.swift")
            let task = Process("swift", "test", "--parallel")
            try _run(task)
            task.waitUntilExit()
            try FileManager.default.removeItem(atPath: "Package.swift")
        }
        
        // Restore the original Package.swift
        try FileManager.default.moveItem(atPath: "Package.Release.swift", toPath: "Package.swift")
    }
}

extension Test {
    func enabledServices() throws -> [String] {
        try FileManager.default
            .contentsOfDirectory(atPath: "Sources/Services")
            .sorted()
    }
}

extension GeneratePackageManifest {
    init(
        packageFileName: String,
        services: [String]
    ) {
        self.init()
        self.repoPath = "."
        self.packageFileName = packageFileName
        self.services = services
        self.clientRuntimeVersion = nil
        self.crtVersion = nil
    }
}
