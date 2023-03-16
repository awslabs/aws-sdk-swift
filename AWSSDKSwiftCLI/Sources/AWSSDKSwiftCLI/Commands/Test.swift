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
    
    private var packageFileName: String { "Package.swift" }
    private var copiedPackageFileName: String { "Package.copy.swift" }
    
    func run() throws {
        try FileManager.default.changeWorkingDirectory(repoPath)
        
        // If batches is 1, then run `swift test --parallel` with the current Package.swift
        guard batches > 1 else {
            log("Testing Package.swift...")
            let task = Process.swift.test()
            try _run(task)
            task.waitUntilExit()
            return
        }

        // Create batches of services
        let serviceBatches = try createBatches(Int(batches))
        
        // Create package manifests for each batch
        let packageManifests = try createPackageManifests(serviceBatches)
        
        // Test each package manifest
        try testAllPackages(packageManifests)
    }
}

extension Test {
    /// Creates `n` batches of services where `n` is the provided `batches` value.
    func createBatches(_ batches: Int) throws -> ChunksOfCountCollection<[String]> {
        log("Creating \(batches) batches...")
        let services = try FileManager.default.enabledServices()
        let chunkSize = services.count / batches
        let serviceBatches = services.chunks(ofCount: chunkSize)
        return serviceBatches
    }
    
    /// Creates package manifests for each batch in the provided list.
    /// Returns a list of the package manifests file names
    func createPackageManifests(_ serviceBatches: ChunksOfCountCollection<[String]>) throws -> [String] {
        var packageManifests: [String] = []
        
        for (index, serviceList) in serviceBatches.enumerated() {
            // Create the package manifest for each batch
            let packageManifest = "Package.TestBatch\(index + 1).swift"
            let services = Array(serviceList)
            let command = GeneratePackageManifest.standard(
                repoPath: ".",
                packageFileName: packageManifest,
                services: services
            )
            try command.run()
            packageManifests.append(packageManifest)
            log("""
            Created batch \(index + 1)
                * Manifest: \(packageManifest)
                * Size: \(services.count)
                * First Service: \(services.first!)
                * Last Service: \(services.last!)
            """)
        }
        
        return packageManifests
    }
    
    /// Runs tests for each package manifest in the provided list
    func testAllPackages(_ packageManifests: [String]) throws {
        // Move the current Package.swift to a new file to be restored later
        try renamePackageManifest()
        
        // Run 'swift test' for each package manifest
        try packageManifests.forEach(testPackage)
        
        // Restor the original package manifest
        try restorePackageManifest()
    }
    
    /// Runs tests using the provided package manifest
    ///
    /// This renames the provided package to `Package.swift` and then runs `swift test --parallel`
    /// When finished, it renames `Package.swift` back to the provided package file name.
    ///
    func testPackage(_ package: String) throws {
        log("Testing \(package)...")
        // Set this package as the Package.swift
        try FileManager.default.moveItem(
            atPath: package,
            toPath: packageFileName
        )
        let task = Process.swift.test()
        try _run(task)
        task.waitUntilExit()
    
        // Move the file back when we are finished
        try FileManager.default.moveItem(
            atPath: packageFileName,
            toPath: package
        )
    }
    
    /// Moves the original `Package.swift` to `Package.copy.swift`
    func renamePackageManifest() throws {
        try FileManager.default.moveItem(
            atPath: packageFileName,
            toPath: copiedPackageFileName
        )
    }
    
    /// Restores the original package manifest to `Package.swift`
    func restorePackageManifest() throws {
        try FileManager.default.moveItem(
            atPath: copiedPackageFileName,
            toPath: packageFileName
        )
    }
}
