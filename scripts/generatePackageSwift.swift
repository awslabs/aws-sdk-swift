#!/usr/bin/swift

/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import Foundation

struct VersionDeps: Codable {
    var awsCRTSwiftVersion: String
    var clientRuntimeVersion: String
}
let plistFile = "versionDependencies.plist"
let rootURL = URL(fileURLWithPath: #file).deletingLastPathComponent()

func loadVersions() -> VersionDeps {
    guard let versionsPlist = FileManager.default.contents(atPath: plistFile),
          let deps = try? PropertyListDecoder().decode(VersionDeps.self, from: versionsPlist) else {
        print("Failed to get version dependencies")
        print("  Unable to to read: '\(plistFile)'")
        exit(1)
    }
    return deps
}

func loadTemplate() -> String {
    let fileManager = FileManager.default
    let templateFileURL = rootURL.appendingPathComponent("Template-Package.swift")

    guard fileManager.fileExists(atPath: templateFileURL.path),
        let data = try? Data(contentsOf: templateFileURL),
        let template = String(data: data, encoding: .utf8) else {
        print("Failed to load template: \(templateFileURL.absoluteString)")
        exit(1)
    }

    return template
}

let template = loadTemplate()
let versions = loadVersions()
let output = template
    .replacingOccurrences(of: "<% AwsCrtVersion %>", with: "\(versions.awsCRTSwiftVersion)")
    .replacingOccurrences(of: "<% ClientRuntimeVersion %>", with: "\(versions.clientRuntimeVersion)")
print(output)
