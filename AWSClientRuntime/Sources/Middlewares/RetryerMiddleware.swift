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
                          next: H) -> Result<OperationOutput<Output>, SdkError<OutputError>>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError {
        
        guard let region = context.getRegion(), !region.isEmpty else {
            return .failure(.client(ClientError.unknownError(("Region is unable to be resolved"))))
        }
        do {
            let partitionId = "\(context.getServiceName()) - \(region))"
            let token = try retryer.acquireToken(partitionId: partitionId)
            return try tryRequest(token: token, partitionId: partitionId, context: context, input: input, next: next)
            
        } catch let err {
            return .failure(.client(ClientError.retryError(err)))
        }
    }
    
    func tryRequest<H>(token: RetryToken,
                       errorType: RetryError? = nil,
                       partitionId: String,
                       context: Context,
                       input: SdkHttpRequestBuilder,
                       next: H) throws -> Result<OperationOutput<Output>, SdkError<OutputError>>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError {
        defer { retryer.releaseToken(token: token)}
        
        let serviceResponse = next.handle(context: context, input: input)
        
        switch serviceResponse {
        case .failure(let error):
            if retryer.isErrorRetryable(error: error) {
                let errorType = retryer.getErrorType(error: error)
                let newToken = try retryer.scheduleRetry(token: token, error: errorType)
                // TODO: rewind the stream once streaming is properly implemented
                return try tryRequest(token: newToken, partitionId: partitionId, context: context, input: input, next: next)
            } else {
                return serviceResponse
            }
        case .success:
            retryer.recordSuccess(token: token)
            return serviceResponse
        }
    }
    
    public typealias MInput = SdkHttpRequestBuilder
    public typealias MOutput = OperationOutput<Output>
    public typealias Context = HttpContext
    public typealias MError = SdkError<OutputError>
}
