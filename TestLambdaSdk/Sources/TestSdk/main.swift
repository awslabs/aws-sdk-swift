/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import S3
import Foundation
import ClientRuntime

do {
    
    let s3Client = try S3Client(region: "us-east-1")
    guard let data = "hello".data(using: .utf8) else {
        print("why is data empty")
        fatalError()
    }
    let input = PutObjectInput(body: ByteStream.from(data: data),
                               bucket: "nickijustinsite", key: "index.html")
    
    s3Client.putObject(input: input) { completion in
        switch completion {
        case .failure(let error):
            print(error)
        case .success(let object):
            print("success")
            print(object)
        }
    }
    
} catch let err {
    print(err)
}
