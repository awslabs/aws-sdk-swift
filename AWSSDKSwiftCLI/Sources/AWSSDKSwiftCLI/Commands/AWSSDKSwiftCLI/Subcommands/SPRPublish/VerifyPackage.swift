//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

extension SPRPublish {

    func verifyPackage() throws {
        let description = try getPackageDescription()
        guard description.name == name else {
            throw Error("Supplied name does not match package")
        }
    }

    private func getPackageDescription() throws -> Describe {
        guard let stdout = try _runReturningStdOut(Process.SPR.describe(packagePath: packagePath)) else {
            throw Error("no stdout from Describe command")
        }
        return try JSONDecoder().decode(Describe.self, from: Data(stdout.utf8))
    }
}
