// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0.

import AwsCommonRuntimeKit
import ClientRuntime
import AwsCCal

public struct Sha256TreeHashMiddleware<OperationStackOutput: HttpResponseBinding,
                                       OperationStackError: HttpResponseBinding>: Middleware {
    public let id: String = "Sha256TreeHash"
    
    private let sha256TreeHashHeaderName = "X-Amz-Sha256-Tree-Hash"
    
    private let sha256HashHeaderName = "X-Amz-Content-Sha256"
    
    public init() {}
    
    public func handle<H>(context: Context,
                          input: MInput,
                          next: H) -> Result<MOutput, MError>
    where H: Handler,
          Self.MInput == H.Input,
          Self.MOutput == H.Output,
          Self.Context == H.Context,
          Self.MError == H.MiddlewareError {
              let request = input.build()
              
              switch request.body {
              case .data(let data):
                  guard let data = data else {
                            return next.handle(context: context, input: input)
                        }
                  if !input.currentHeaders.exists(name: sha256HashHeaderName) {
                      let base64Encoded = ByteBuffer(data: data).base64EncodedSha256()
                      input.withHeader(name: sha256TreeHashHeaderName, value: base64Encoded)
                  }
              case .stream(let stream):
                  let streamBytes = stream.toBytes()
                  guard streamBytes.length > 0 else {
                      return next.handle(context: context, input: input)
                  }
                  let (linearHash, treeHash) = computeHashes(bytes: streamBytes)
                  if let treeHash = treeHash {
                      input.withHeader(name: sha256TreeHashHeaderName, value: treeHash)
                  }
                  if let linearHash = linearHash {
                      input.withHeader(name: sha256HashHeaderName, value: linearHash)
                  }
                  
                  return next.handle(context: context, input: input)
                  
              case .empty, .none:
                  return next.handle(context: context, input: input)
              }
              
              return next.handle(context: context, input: input)
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
            let hash: ByteBuffer = oneMbTempBuffer.sha256()
            hashes.append(hash.toByteArray())
        }

        return (bytes.base64EncodedSha256(), computeTreeHash(hashes: hashes))
    }
    
    /// Builds a tree hash root node given a slice of hashes. Glacier tree hash to be derived from SHA256 hashes of 1MBm chunks of the data.
    /// See http://docs.aws.amazon.com/amazonglacier/latest/dev/checksum-calculations.html for more information.
    private func computeTreeHash(hashes: [[UInt8]]) -> String? {
        guard !hashes.isEmpty else {
            return nil
        }
        let hashCount = hashes.count
        
        if hashCount == 1 {
            let byteArray = hashes[0]
            let byteBuffer = ByteBuffer(bytes: byteArray)
            return byteBuffer.toData().base64EncodedString()
        }
        var tempHashes = [[UInt8]]()
        for index in stride(from: 0, to: hashCount, by: 2) {
            if index + 1 <= hashCount - 1 {
                var tempHashArray = [UInt8]()
                tempHashArray.append(contentsOf: hashes[index])
                tempHashArray.append(contentsOf: hashes[index + 1])
                let tempByteBuffer = ByteBuffer(bytes: tempHashArray)
                
                let tempSha256: ByteBuffer = tempByteBuffer.sha256()
                tempHashes.append(tempSha256.toByteArray())
                
            } else {
                tempHashes.append(hashes[index])
            }
        }
        let byteBuf = ByteBuffer(bytes: tempHashes[0])
       
        return byteBuf.sha256().toData().base64EncodedString()
    }
    
    public typealias MInput = SdkHttpRequestBuilder
    public typealias MOutput = OperationOutput<OperationStackOutput>
    public typealias Context = HttpContext
    public typealias MError = SdkError<OperationStackError>
}


