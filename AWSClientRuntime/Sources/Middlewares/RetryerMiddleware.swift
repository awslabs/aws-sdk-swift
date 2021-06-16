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
    
    let retryer: Retryer

    
    public init(retryer: Retryer) {
        self.retryer = retryer
    }
    
    public func handle<H>(context: Context,
                          input: SdkHttpRequest,
                          next: H) -> Result<OperationOutput<Output>, SdkError<OutputError>>
    where H: Handler,
          Self.MInput == H.Input,
          Self.MOutput == H.Output,
          Self.Context == H.Context,
          Self.MError == H.MiddlewareError {
        
        do {
            let partitionId = "\(context.getServiceName()) - \(context.getRegion())"
            let token = try retryer.acquireToken(partitionId: partitionId)
            return try tryRequest(token: token, partitionId: partitionId, context: context, input: input, next: next)
            
        } catch let err {
            return .failure(.client(ClientError.retryError(err)))
        }
    }
    
    func tryRequest<H>(token: AWSRetryToken,
                       errorType: AWSRetryError? = nil,
                       partitionId: String,
                       context: Context,
                       input: SdkHttpRequest,
                       next: H) throws -> Result<OperationOutput<Output>, SdkError<OutputError>>
    where H: Handler,
          Self.MInput == H.Input,
          Self.MOutput == H.Output,
          Self.Context == H.Context,
          Self.MError == H.MiddlewareError {
        
        defer { retryer.releaseToken(token: token)}
        // first call to this function is the first time we make the request
        let response = next.handle(context: context, input: input)
        
        switch response {
        case .failure(let error):
            //can retry if its a network error
            if retryer.isErrorRetryable(error: error) {
                let errorType = retryer.getErrorType(error: error)
                let newToken = try retryer.scheduleRetry(token: token, error: errorType)
                //TODO: rewind the stream once streaming is properly implemented
                return try tryRequest(token: newToken, partitionId: partitionId, context: context, input: input, next: next)
            } else {
                return response
            }
        case .success(_):
            retryer.recordSuccess(token: token)
            return response
        }
    }
    

    
    public typealias MInput = SdkHttpRequest
    public typealias MOutput = OperationOutput<Output>
    public typealias Context = HttpContext
    public typealias MError = SdkError<OutputError>
}
