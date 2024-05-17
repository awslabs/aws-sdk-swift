//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import AWSS3
import XCTest
import AWSIntegrationTestUtils

class S3EventStreamTests: S3XCTestCase {
    private let objectKey = "integ-test-json-object"

    override func setUp() async throws {
        // Create S3 client & unique bucket with UUID.
        try await super.setUp()
        // Put a JSON object to the bucket.
        try await putObject(
            body: """
            { "Rules": [ {"id": "1"}, {"expr": "y > x"}, {"id": "2", "expr": "z = DEBUG"} ]}
            { "created": "June 27", "modified": "July 6" }
            """,
            key: objectKey
        )
    }

    // Tests event stream output in restXml protocol using S3::SelectObjectContent.
    func test_eventStreamOutput() async throws {
        let result = try await client.selectObjectContent(input: SelectObjectContentInput(
            bucket: bucketName,
            // Gets the two ID objects from the S3 object content.
            expression: "SELECT id FROM S3Object[*].Rules[*].id WHERE id IS NOT MISSING",
            expressionType: .sql,
            inputSerialization: S3ClientTypes.InputSerialization(
                json: S3ClientTypes.JSONInput(type: .document)
            ),
            key: objectKey,
            outputSerialization: S3ClientTypes.OutputSerialization(json: S3ClientTypes.JSONOutput())
        ))

        let outputStream = result.payload
        var actualOutput = ""

        for try await event in outputStream! {
            switch event {
            case .records(let record):
                actualOutput = actualOutput + (String(data: record.payload ?? Data(), encoding: .utf8) ?? "")
            case .stats, .end:
                continue
            case .sdkUnknown(let data):
                XCTFail(data)
            default:
                XCTFail("Encountered an unexpected event in output stream.")
            }
        }

        // Check returned record event's payload was successfully received.
        let expectedOutput = "{\"id\":\"1\"}\n{\"id\":\"2\"}\n"
        XCTAssertEqual(expectedOutput, actualOutput)
    }

    // Run the test above, but do it 100x in concurrent tasks.
    func test_100x_eventStreamOutput() async throws {
        try await repeatConcurrently(count: 100, test: test_eventStreamOutput)
    }
}
