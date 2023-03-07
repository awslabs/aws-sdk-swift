#!/usr/bin/swift

/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

#if os(Linux)
import Glibc
#else
import Darwin
#endif
import class Foundation.PropertyListDecoder
import class Foundation.ProcessInfo
import class Foundation.FileManager

// MARK: - Main

/**
Updates the the version located at the provided file path. 
The file stored at the path should be a plain text file that only contains the version. 
The version should be a simple semver formatted version number e.g. MAJOR.MINOR.PATCH
*/
func main() {
  guard CommandLine.arguments.count == 2, let filePath = CommandLine.arguments.last else {
    printError("A file path must be provided.")
    return
  }

  guard let fileContents = FileManager.default.contents(atPath: filePath) else {
    printError("Failed to retrieve data for file at path \(filePath)")
    return
  }

  guard let versionString = String(data: fileContents, encoding: .utf8) else {
    printError("Failed to retrieve string from file at path: \(filePath)")
    return
  }

  guard let version = Version(versionString) else {
    printError("Failed to parse version from \(versionString)")
    return
  }

  var newVersion = version
  newVersion.incrementMinor()

  do {
    try newVersion.versionString.write(toFile: filePath , atomically: true, encoding: .utf8)
  } catch {
    printError("Failed to write version \(newVersion.versionString) to path \(filePath)")
  }
}

// MARK: - Helpers

func printError(_ message: String) {
  print(message)
  exit(1)
}

struct Version {
  var major: Int
  var minor: Int
  var patch: Int

  init?(_ versionString: String)  {
      let versions = versionString.components(separatedBy: ".")
      guard
        versions.count == 3,
        let major = Int(versions[0]),
        let minor = Int(versions[1]),
        let patch = Int(versions[2])
      else { return nil }
      
      self.major = major
      self.minor = minor
      self.patch = patch
  }

  var versionString: String { "\(major).\(minor).\(patch)" }

  mutating func incrementMajor() {
    major += 1
    minor = 0
    patch = 0
  }

  mutating func incrementMinor() {
    minor += 1
    patch = 0
  }

  mutating func incrementPatch() {
    patch += 1
  }
}

// MARK: - Run

main()