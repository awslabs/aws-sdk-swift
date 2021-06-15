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
                          next: H) -> Result<OperationOutput<Output, OutputError>, Error> 
    where H: Handler,
          Self.MInput == H.Input,
          Self.MOutput == H.Output,
          Self.Context == H.Context {
        let partitionId = "\(context.getServiceName()) - \(context.getRegion())"
        do {
            var token = try retryer.acquireToken(partitionId: partitionId)
            defer { retryer.releaseToken(token: token)}
            let response = next.handle(context: context, input: input) // call handler to get http response
            
            switch response {
            case .failure(let error):
                //can retry if its a network error
                token = try scheduleRetry(token: token,
                                          errorType: .clientError,
                                          context: context,
                                          input: input,
                                          next: next)
                
            case .success(let operationOutput):
                guard let error = operationOutput.error else {
                    retryer.recordSuccess(token: token)
                    return response
                }
                //test if error is retryable
                //if it is schedule a retry and then retry on return of the new token.
                // repeat until error
                if error._retryable {
                    let retriedResponse = next.handle(context: context, input: input)
                    token = try scheduleRetry(token: token, errorType: .serverError, context: context, input: input, next: next)
                }
               
            }
            
            
        } catch let err {
            return .failure(ClientError.retryerError(err))
        }
        
    }
    
    func scheduleRetry<H>(token: AWSRetryToken,
                          errorType: AWSRetryError,
                          context: Context,
                          input: SdkHttpRequest,
                          next: H) throws -> AWSRetryToken
    where H: Handler,
          Self.MInput == H.Input,
          Self.MOutput == H.Output,
          Self.Context == H.Context {
        let newToken = try retryer.scheduleRetry(token: token, error: errorType)
        let response = next.handle(context: context, input: input)
        return newToken
    }
    

    
    public typealias MInput = SdkHttpRequest
    public typealias MOutput = OperationOutput<Output, OutputError>
    public typealias Context = HttpContext
}
