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
            let path = "Sources/Services/\($0)"
            try! FileManager.default.createDirectory(
                atPath: path,
                withIntermediateDirectories: true
            )
            createDependencyJSON(service: $0, path: path)
        }

        let internalServices = ["AWSSTS", "AWSSSO", "AWSSSOOIDC", "AWSCognitoIdentity", "AWSSignin"]
        internalServices.forEach {
            let path = "Sources/Core/AWSSDKIdentity/InternalClients/Internal\($0)"
            try! FileManager.default.createDirectory(
                atPath: path,
                withIntermediateDirectories: true
            )
            createDependencyJSON(service: $0, path: path)
        }

        try! FileManager.default.createDirectory(
            atPath: "IntegrationTests/Services",
            withIntermediateDirectories: true
        )
    }

    func createDependencyJSON(service: String, path: String) {
        let json = Data("""
            {
              "modelPath": "codegen/sdk-codegen/aws-models/\(service.lowercased()).json",
              "dependencies": []
            }
            """.utf8)
        FileManager.default.createFile(atPath: "\(path)/Dependencies.json", contents: json)
    }

    // MARK: - Tests
    
    // MARK: Golden Path
    
    func testGoldenPath() throws {
        let clientRuntimeVersion = "1.2.3"
        let crtVersion = "3.2.1"
        let services = ["EC2", "S3"]
        try createPackageDependencies(
            crtVersion: crtVersion,
            clientRuntimeVersion: clientRuntimeVersion
        )
        createServiceFolders(services)

        let subject = GeneratePackageManifest.mock(buildPackageManifest: { _clientRuntimeVersion, _crtVersion, services in
            "\(_clientRuntimeVersion)-\(_crtVersion)-\(services.map(\.moduleName).joined(separator: "-"))"
        })
        try! subject.run()
        let result = try! String(contentsOfFile: "Package.swift", encoding: .utf8)
        XCTAssertEqual(result, "1.2.3-3.2.1-EC2-S3-InternalAWSCognitoIdentity-InternalAWSSSO-InternalAWSSSOOIDC-InternalAWSSTS-InternalAWSSignin")
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
        let services = ["EC2", "S3"]
        createServiceFolders(services)
        
        let subject = GeneratePackageManifest.mock()
        let result = try! subject.resolveServices()
        XCTAssertEqual(result, services)
    }
    
    func testResolveServicesWithExplicitServices() {
        let services = ["One", "Two", "Three"]
        let subject = GeneratePackageManifest.mock(services: services)
        let result = try! subject.resolveServices()
        XCTAssertEqual(result, services)
    }
}

// MARK: - Mocks

extension GeneratePackageManifest {
    static func mock(
        repoPath: String = ".",
        packageFileName: String = "Package.swift",
        clientRuntimeVersion: Version? = nil,
        crtVersion: Version? = nil,
        services: [String]? = nil,
        excludeRuntimeTests: Bool = false,
        previewBuild: Bool = false,
        buildPackageManifest: @escaping BuildPackageManifest = { (_,_,_) throws -> String in "" }
    ) -> GeneratePackageManifest {
        GeneratePackageManifest(
            repoPath: repoPath,
            packageFileName: packageFileName,
            clientRuntimeVersion: clientRuntimeVersion,
            crtVersion: crtVersion,
            services: services,
            excludeRuntimeTests: excludeRuntimeTests,
            previewBuild: previewBuild,
            buildPackageManifest: buildPackageManifest
        )
    }
}
