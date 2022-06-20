// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0.

import AwsCommonRuntimeKit
import ClientRuntime
import AwsCCal

public struct Sha256TreeHashMiddleware<OperationStackOutput: HttpResponseBinding,
                                       OperationStackError: HttpResponseBinding>: Middleware {
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
                      let sha256 = ByteBuffer(data: data).sha256().encodeToHexString()
                      input.withHeader(name: X_AMZ_CONTENT_SHA256_HEADER_NAME, value: sha256)
                  }
              case .stream(let stream):
                  let streamBytes = stream.toBytes()
                  guard streamBytes.length > 0 else {
                      return try await next.handle(context: context, input: input)
                  }
                  let (linearHash, treeHash) = computeHashes(bytes: streamBytes)
                  if let treeHash = treeHash, let linearHash = linearHash {
                      input.withHeader(name: X_AMZ_SHA256_TREE_HASH_HEADER_NAME, value: treeHash)
                      input.withHeader(name: X_AMZ_CONTENT_SHA256_HEADER_NAME, value: linearHash)
                  }
              case .empty, .none:
                  break
              }
              
              return try await next.handle(context: context, input: input)
          }
    
    /// Computes the tree-hash and linear hash of a `ByteBuffer`.
    /// See http://docs.aws.amazon.com/amazonglacier/latest/dev/checksum-calculations.html for more information.
    private func computeHashes(bytes: ByteBuffer) -> (String?, String?) {
        let bufferSize = 1024 * 1024
        var hashes = [[UInt8]]()
        
        while true {
            var oneMbTempBuffer = ByteBuffer(size: bufferSize)
            let bytesRead = bytes.readIntoBuffer(buffer: &oneMbTempBuffer)
            if bytesRead == 0 {
                break
            }
            let hash = oneMbTempBuffer.sha256()
            hashes.append(hash.toByteArray())
        }
        
        return (bytes.sha256().encodeToHexString(), computeTreeHash(hashes: hashes))
    }
    
    /// Builds a tree hash root node given a slice of hashes. Glacier tree hash to be derived from SHA256 hashes
    /// of 1MB chunks of the data.
    /// See http://docs.aws.amazon.com/amazonglacier/latest/dev/checksum-calculations.html
    /// for more information.
    private func computeTreeHash(hashes: [[UInt8]]) -> String? {
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
                    let concatenatedLevelHashByteBuffer = ByteBuffer(bytes: concatenatedLevelHash)
                    
                    let md = concatenatedLevelHashByteBuffer.sha256()
                    currentLevelHashes.append(md.toByteArray())
                    
                } else {
                    currentLevelHashes.append(previousLevelHashes[index])
                }
            }
            previousLevelHashes = currentLevelHashes
        }
        
        let byteBuf = ByteBuffer(bytes: previousLevelHashes[0])
        return byteBuf.encodeToHexString()
    }
    
    public typealias MInput = SdkHttpRequestBuilder
    public typealias MOutput = OperationOutput<OperationStackOutput>
    public typealias Context = HttpContext
    public typealias MError = SdkError<OperationStackError>
}
