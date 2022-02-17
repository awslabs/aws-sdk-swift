/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import AWSS3
import Foundation
import ClientRuntime

@main
struct TestSdk {
    static func main() async throws {
        
        let s3Client = try await S3Client(region: "us-west-1")
        guard let path = Bundle._module.path(forResource: "4kimage", ofType: "jpg") else {
            print("why is path empty")
            fatalError()
        }
        guard let data = FileManager.default.contents(atPath: path) else {
            print("why is data empty")
            fatalError()
        }
       //REPLACEME: replace with your own bucket and key in the correct region above for testing the locally generated sdk.
        let input = PutObjectInput(body: ByteStream.from(data: data),
                                   bucket: "nickijustinsite", key: "4kimage.jpg")
        
        _ = try await s3Client.putObject(input: input)
    }
}

