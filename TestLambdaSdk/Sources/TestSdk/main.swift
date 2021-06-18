import S3
import Foundation
import ClientRuntime

let config = try! S3Client.S3ClientConfiguration.default()
let s3Client = S3Client(config: config)
let data = "hello".data(using: .utf8)
let input = PutObjectInput(body: data, bucket: "nickijustinsite", key: "index.html")

let fileProvider = StreamSourceProvider.fromData(data: data!)

s3Client.putObject(input: input, streamSource: fileProvider.unwrap()) { completion in
    switch completion {
    case .failure(let error):
        print(error)
    case .success(let object):
        print("success")
        print(object)
    }
}

