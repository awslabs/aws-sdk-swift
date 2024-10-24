//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

@testable import AWSSDKSwiftCLI
import AWSCLIUtils
import XCTest

class GeneratePackageManifestTests: CLITestCase {
    
    // MARK: - Helpers
    
    func createPackageDependencies(
        crtVersion: String,
        clientRuntimeVersion: String
    ) throws {
        let packageDependencies = try PackageDependencies(
            awsCRTSwiftVersion: .init(crtVersion),
            clientRuntimeVersion: .init(clientRuntimeVersion)
        )
        try! packageDependencies.save()
    }
    
    func createServiceFolders(_ services: [String]) {
        services.forEach {
            try! FileManager.default.createDirectory(
                atPath: "Sources/Services/\($0)",
                withIntermediateDirectories: true
            )
        }
        try! FileManager.default.createDirectory(
            atPath: "IntegrationTests/Services",
            withIntermediateDirectories: true
        )
    }
    
    // MARK: - Tests
    
    // MARK: Golden Path
    
    func testGoldenPath() throws {
        let packageScope = "abc-def-ghi"
        let clientRuntimeVersion = "1.2.3"
        let crtVersion = "3.2.1"
        let services = ["EC2", "S3"]
        try createPackageDependencies(
            crtVersion: crtVersion,
            clientRuntimeVersion: clientRuntimeVersion
        )
        createServiceFolders(services)
        
        let subject = GeneratePackageManifest.mock(packageScope: packageScope, buildPackageManifest: { _packageScope, _clientRuntimeVersion, _crtVersion, services in
            "\(_packageScope)-\(_clientRuntimeVersion)-\(_crtVersion)-\(services.map(\.name).joined(separator: "-"))"
        })
        try! subject.run()
        let result = try! String(contentsOfFile: "Package.swift", encoding: .utf8)
        XCTAssertEqual(result, "abc-def-ghi-1.2.3-3.2.1-EC2-S3")
    }
    
    // MARK: resolveVersions()
    
    func testResolveVersionsRetrievesVersionsFromPackageDependencies() throws {
        let clientRuntimeVersion = "1.2.3"
        let crtVersion = "3.2.1"
        try createPackageDependencies(
            crtVersion: crtVersion,
            clientRuntimeVersion: clientRuntimeVersion
        )
        let subject = GeneratePackageManifest.mock()
        let versions = try! subject.resolveVersions()
        XCTAssertEqual(versions.clientRuntime.description, clientRuntimeVersion)
        XCTAssertEqual(versions.crt.description, crtVersion)
    }
    
    func testResolveVersionsWithExplicitVersions() throws {
        let clientRuntimeVersion = "1.2.3"
        let crtVersion = "3.2.1"
        let subject = try GeneratePackageManifest.mock(
            clientRuntimeVersion: .init(clientRuntimeVersion),
            crtVersion: .init(crtVersion)
        )
        let versions = try! subject.resolveVersions()
        XCTAssertEqual(versions.clientRuntime.description, clientRuntimeVersion)
        XCTAssertEqual(versions.crt.description, crtVersion)
    }
    
    // MARK: resolveServices()
    
    func testResolveServicesRetrievesServicesFromDisk() {
        let packageScope = ""
        let services = ["EC2", "S3"]
        createServiceFolders(services)
        
        let subject = GeneratePackageManifest.mock()
        let result = try! subject.resolveServices(packageScope: packageScope)
        XCTAssertEqual(result, services)
    }
    
    func testResolveServicesWithExplicitServices() {
        let packageScope = ""
        let services = ["One", "Two", "Three"]
        let subject = GeneratePackageManifest.mock(services: services)
        let result = try! subject.resolveServices(packageScope: packageScope)
        XCTAssertEqual(result, services)
    }
}

// MARK: - Mocks

extension GeneratePackageManifest {
    static func mock(
        repoPath: String = ".",
        packageScope: String = "",
        packageFileName: String = "Package.swift",
        clientRuntimeVersion: Version? = nil,
        crtVersion: Version? = nil,
        services: [String]? = nil,
        excludeRuntimeTests: Bool = false,
        buildPackageManifest: @escaping BuildPackageManifest = { (_,_,_,_) throws -> String in "" }
    ) -> GeneratePackageManifest {
        GeneratePackageManifest(
            repoPath: repoPath, packageScope: packageScope,
            packageFileName: packageFileName,
            clientRuntimeVersion: clientRuntimeVersion,
            crtVersion: crtVersion,
            services: services,
            excludeRuntimeTests: excludeRuntimeTests,
            buildPackageManifest: buildPackageManifest
        )
    }
}
