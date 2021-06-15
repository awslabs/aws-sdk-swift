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
        var token: AWSRetryToken?
   
        do {
            token = try retryer.acquireToken(partitionId: partitionId)
            defer { retryer.releaseToken(token: token.unsafelyUnwrapped)}
            let response = next.handle(context: context, input: input) // call handler to get http response
            
            let result = try response.get()
            guard let error = result.error else {
                retryer.recordSuccess(token: token.unsafelyUnwrapped)
                return .success(result)
            }
            //test if error is retryable
            //if it is schedule a retry and then retry on return of the new token.
            // repeat until error
            

            
        } catch ClientError.networkError(let err) {
            //can retry if its a network error
            let token = try retryer.scheduleRetry(token: token.unsafelyUnwrapped, error: .clientError)
            let response = next.handle(context: context, input: input)
            let result = try response.get()
        } catch let err {
            return .failure(ClientError.retryerError(err))
        }
        
    }
    
    public typealias MInput = SdkHttpRequest
    public typealias MOutput = OperationOutput<Output, OutputError>
    public typealias Context = HttpContext
}
