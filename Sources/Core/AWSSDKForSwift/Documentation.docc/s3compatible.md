# Using with "S3-like" services

## Background

Recently, AWS SDK for Swift dropped MD5 for payload checksums, in favor of more
modern and secure algorithms.  This has caused problems when accessing certain
operations on "S3-like" services that claim to be API-compatible with AWS S3.
To our knowledge, this affects only the S3 `DeleteObjects` operation.

## Example Code

If you are having issues with accessing such services, the following interceptor
code can be used to force your SDK to sign `DeleteObjects` requests with MD5:

```swift
class DeleteObjectsMD5InterceptorProvider: HttpInterceptorProvider {

    class DeleteObjectsMD5Interceptor<InputType, OutputType>: Interceptor {
        typealias RequestType = HTTPRequest
        typealias ResponseType = HTTPResponse

        let MD5_HEADER = "Content-MD5"
        let OTHER_CHECKSUMS_PREFIX = "x-amz-checksum-"
        let OTHER_CHECKSUMS_SDK_PREFIX = "x-amz-sdk-checksum-"

        func readAfterSerialization(context: some AfterSerialization<InputType, HTTPRequest>) async throws {
            let request = context.getRequest()

            // Read the request body into memory.  Note that this may cause excess memory usage
            // when used with large request bodies.
            let bodyData: Data?
            switch request.body {
            case .stream(let stream):
                bodyData = try await stream.readToEndAsync()
            case .data:
                return  // body is already in-memory data, no change needed
            case .noStream:
                bodyData = nil
            }

            // Re-assign the request body using in-memory data instead of a stream.
            request.body = .data(bodyData)
        }

        func modifyBeforeSigning(context: some MutableRequest<InputType, HTTPRequest>) async throws {
            let attributes = context.getAttributes()
            let request = context.getRequest()
            let body = request.body

            // Leave request unmodified if not S3 DeleteObjects
            guard attributes.getServiceName() == "S3", attributes.getOperation() == "deleteObjects" else { return }

            // Remove all checksum-related headers & trailing headers
            let checksumHeaders = request.headers.headers.map { $0.name }.filter { $0.hasPrefix(OTHER_CHECKSUMS_PREFIX) }
            checksumHeaders.forEach { request.headers.remove(name: $0) }
            let checksumSDKHeaders = request.headers.headers.map { $0.name }.filter { $0.hasPrefix(OTHER_CHECKSUMS_SDK_PREFIX) }
            checksumSDKHeaders.forEach { request.headers.remove(name: $0) }
            let checksumTrailingHeaders = request.trailingHeaders.headers.map { $0.name }.filter { $0.hasPrefix(OTHER_CHECKSUMS_PREFIX) }
            checksumTrailingHeaders.forEach { request.headers.remove(name: $0) }

            // If the body is in-memory data, set a MD5 header for the data.
            if case .data(let data) = body, let data {
                let md5data = try data.computeMD5()
                request.headers.add(name: MD5_HEADER, value: md5data.base64EncodedString())
            }
        }
    }

    func create<InputType, OutputType>() -> any Interceptor<InputType, OutputType, HTTPRequest, HTTPResponse> {
        return DeleteObjectsMD5Interceptor()
    }
}
```

Using this interceptor, configure your S3 client as follows:
```swift
let config = try await S3Client.Config(
    region: "us-east-1",  // substitute your region here
    httpInterceptorProviders: [DeleteObjectsMD5InterceptorProvider()]
)
let client = S3Client(config: config)
```
