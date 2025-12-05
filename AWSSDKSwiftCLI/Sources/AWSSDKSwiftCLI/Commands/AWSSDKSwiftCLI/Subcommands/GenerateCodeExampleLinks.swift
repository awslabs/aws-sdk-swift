//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ArgumentParser
import Foundation

struct GenerateCodeExampleLinksCommand: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "generate-code-example-links",
        abstract: "Generates CodeExamples.md files with links to code examples from example_meta.json"
    )

    @Argument(help: "The path to the example_meta.json file")
    var input: String

    func run() throws {
        let sdkPath = "../"
        try DocExampleLinksGenerator(inputPath: input, sdkPath: sdkPath).generate()
    }
}