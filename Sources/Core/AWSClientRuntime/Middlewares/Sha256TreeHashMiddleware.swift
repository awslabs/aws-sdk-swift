// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0.

import AwsCommonRuntimeKit
import ClientRuntime
import AwsCCal

public struct Sha256TreeHashMiddleware<OperationStackOutput>: Middleware {
    public let id: String = "Sha256TreeHash"

    private let X_AMZ_SHA256_TREE_HASH_HEADER_NAME = "X-Amz-Sha256-Tree-Hash"

    private let X_AMZ_CONTENT_SHA256_HEADER_NAME = "X-Amz-Content-Sha256"

    public init() {}

    public func handle<H>(context: Context,
                          input: MInput,
                          next: H) async throws -> MOutput
    where H: Handler,
          Self.MInput == H.Input,
          Self.MOutput == H.Output,
          Self.Context == H.Context {
              let request = input.build()

              switch request.body {
              case .data(let data):
                  guard let data = data else {
                      return try await next.handle(context: context, input: input)
                  }
                  if !request.headers.exists(name: X_AMZ_CONTENT_SHA256_HEADER_NAME) {
                      let sha256 = try data.computeSHA256().encodeToHexString()
                      input.withHeader(name: X_AMZ_CONTENT_SHA256_HEADER_NAME, value: sha256)
                  }
              case .stream(let stream):
                  let streamBytes: Data?
                  let currentPosition = stream.position
                  if stream.isSeekable {
                      streamBytes = try await stream.readToEndAsync()
                      try stream.seek(toOffset: currentPosition)
                  } else {
                      // If the stream is not seekable, we need to cache the stream in memory
                      // so we can compute the hash and still be able to send the stream to the service.
                      // This is not ideal, but it is the best we can do.
                      streamBytes = try await stream.readToEndAsync()
                      input.withBody(.data(streamBytes))
                  }
                  guard let streamBytes = streamBytes, !streamBytes.isEmpty else {
                      return try await next.handle(context: context, input: input)
                  }
                  let (linearHash, treeHash) = try computeHashes(data: streamBytes)
                  if let treeHash = treeHash, let linearHash = linearHash {
                      input.withHeader(name: X_AMZ_SHA256_TREE_HASH_HEADER_NAME, value: treeHash)
                      input.withHeader(name: X_AMZ_CONTENT_SHA256_HEADER_NAME, value: linearHash)
                  }
              case .empty:
                  break
              case .noStream:
                  break
              }

              return try await next.handle(context: context, input: input)
          }

    /// Computes the tree-hash and linear hash of Data.
    /// See http://docs.aws.amazon.com/amazonglacier/latest/dev/checksum-calculations.html for more information.
    private func computeHashes(data: Data) throws -> (String?, String?) {
        let ONE_MB = 1024 * 1024
        let hashes: [[UInt8]] = try data.chunked(size: ONE_MB).map { try $0.computeSHA256().bytes() }
        return try (data.computeSHA256().encodeToHexString(), computeTreeHash(hashes: hashes))
    }

    /// Builds a tree hash root node given a slice of hashes. Glacier tree hash to be derived from SHA256 hashes
    /// of 1MB chunks of the data.
    /// See http://docs.aws.amazon.com/amazonglacier/latest/dev/checksum-calculations.html
    /// for more information.
    private func computeTreeHash(hashes: [[UInt8]]) throws -> String? {
        guard !hashes.isEmpty else {
            return nil
        }
        var previousLevelHashes = hashes
        while previousLevelHashes.count > 1 {
            var currentLevelHashes = [[UInt8]]()
            for index in stride(from: 0, to: previousLevelHashes.count, by: 2) {
                if previousLevelHashes.count - index > 1 {
                    var concatenatedLevelHash = [UInt8]()
                    concatenatedLevelHash.append(contentsOf: previousLevelHashes[index])
                    concatenatedLevelHash.append(contentsOf: previousLevelHashes[index + 1])
                    let data = Data(concatenatedLevelHash)
                    currentLevelHashes.append(try data.computeSHA256().bytes())

                } else {
                    currentLevelHashes.append(previousLevelHashes[index])
                }
            }
            previousLevelHashes = currentLevelHashes
        }

        let data = Data(previousLevelHashes[0])
        return data.encodeToHexString()
    }

    public typealias MInput = SdkHttpRequestBuilder
    public typealias MOutput = OperationOutput<OperationStackOutput>
    public typealias Context = HttpContext
}
