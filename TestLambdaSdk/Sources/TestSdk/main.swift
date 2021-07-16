import S3
import Foundation
import ClientRuntime

let config = try! S3Client.S3ClientConfiguration.default()
let s3Client = S3Client(config: config)
let data = "hello".data(using: .utf8)
let input = PutObjectInput(body: ByteStream.from(data: data!),
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

