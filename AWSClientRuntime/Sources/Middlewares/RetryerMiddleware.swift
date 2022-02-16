//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime

public struct RetryerMiddleware<Output: HttpResponseBinding,
                                OutputError: HttpResponseBinding>: Middleware {
    
    public var id: String = "Retryer"
    
    let retryer: SDKRetryer
    
    public init(retryer: SDKRetryer) {
        self.retryer = retryer
    }
    
    public func handle<H>(context: Context,
                          input: SdkHttpRequestBuilder,
                          next: H) async throws -> OperationOutput<Output>
    where H: Handler,
          Self.MInput == H.Input,
          Self.MOutput == H.Output,
          Self.Context == H.Context {
              
              guard let region = context.getRegion(), !region.isEmpty else {
                  throw SdkError<OutputError>.client(ClientError.unknownError(("Region is unable to be resolved")))
              }
              do {
                  let partitionId = "\(context.getServiceName()) - \(region))"
                  let token = try await retryer.acquireToken(partitionId: partitionId)
                  return try await tryRequest(token: token,
                                              partitionId: partitionId,
                                              context: context,
                                              input: input,
                                              next: next)
                  
              } catch let err {
                  throw SdkError<OutputError>.client(ClientError.retryError(err))
              }
          }
    
    func tryRequest<H>(token: RetryToken,
                       errorType: RetryError? = nil,
                       partitionId: String,
                       context: Context,
                       input: SdkHttpRequestBuilder,
                       next: H) async throws -> OperationOutput<Output>
    where H: Handler,
          Self.MInput == H.Input,
          Self.MOutput == H.Output,
          Self.Context == H.Context {
              defer { retryer.releaseToken(token: token)}
              do {
                  let serviceResponse = try await next.handle(context: context, input: input)
                  retryer.recordSuccess(token: token)
                  return serviceResponse
              } catch let error as SdkError<OutputError> where retryer.isErrorRetryable(error: error) {
                  
                  let errorType = retryer.getErrorType(error: error)
                  let newToken = try await retryer.scheduleRetry(token: token, error: errorType)
                  // TODO: rewind the stream once streaming is properly implemented
                  return try await tryRequest(token: newToken,
                                              partitionId: partitionId,
                                              context: context,
                                              input: input,
                                              next: next)
              } catch {
                  throw error
              }
          }
    
    public typealias MInput = SdkHttpRequestBuilder
    public typealias MOutput = OperationOutput<Output>
    public typealias Context = HttpContext
}
