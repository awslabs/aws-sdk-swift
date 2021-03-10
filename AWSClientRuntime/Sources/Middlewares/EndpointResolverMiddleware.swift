// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0.
import ClientRuntime

// TODO: this struct is unfinished. proper endpoint resolving will need to be added futuristically
public struct EndpointResolverMiddleware<OperationStackOutput: HttpResponseBinding,
                                         OperationStackError: HttpResponseBinding>: Middleware {
    
    public let id: String = "EndpointResolver"
    public let endpointResolver: EndpointResolver
    public let serviceId: String
    
    public init(endpointResolver: EndpointResolver, serviceId: String) {
        self.endpointResolver = endpointResolver
        self.serviceId = serviceId
    }
    
    public func handle<H>(context: Context,
                          input: SdkHttpRequestBuilder,
                          next: H) -> Result<OperationOutput<OperationStackOutput, OperationStackError>, Error>
    where H: Handler,
          Self.MInput == H.Input,
          Self.MOutput == H.Output,
          Self.Context == H.Context {
        
        let region = context.getRegion()
        do {
            let awsEndpoint = try endpointResolver.resolve(serviceId: serviceId,
                                                           region: region)
            let host = "\(context.getHostPrefix())\(awsEndpoint.endpoint.host)"
            
            if let protocolType = awsEndpoint.endpoint.protocolType {
                input.withProtocol(protocolType)
            }
            
            input.withMethod(context.getMethod())
                .withHost(host)
                .withPort(awsEndpoint.endpoint.port)
                .withPath(context.getPath())
                .withHeader(name: "Host", value: host)
            
            return next.handle(context: context, input: input)
        } catch let err {
            return .failure(err)
        }
    }
    
    public typealias MInput = SdkHttpRequestBuilder
    public typealias MOutput = OperationOutput<OperationStackOutput, OperationStackError>
    public typealias Context = HttpContext
}
