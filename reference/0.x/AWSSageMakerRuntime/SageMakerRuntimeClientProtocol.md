# SageMakerRuntimeClientProtocol

The Amazon SageMaker runtime API.

``` swift
public protocol SageMakerRuntimeClientProtocol 
```

## Requirements

### invokeEndpoint(input:​completion:​)

After you deploy a model into production using Amazon SageMaker hosting services, your
client applications use this API to get inferences from the model hosted at the
specified endpoint.
For an overview of Amazon SageMaker, see <a href="https:​//docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html">How It Works.
Amazon SageMaker strips all POST headers except those supported by the API. Amazon SageMaker might add
additional headers. You should not rely on the behavior of headers outside those
enumerated in the request syntax.
Calls to InvokeEndpoint are authenticated by using AWS Signature Version
4\. For information, see <a href="https:​//docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html">Authenticating
Requests (AWS Signature Version 4) in the Amazon S3 API
Reference.
A customer's model containers must respond to requests within 60 seconds. The model
itself can have a maximum processing time of 60 seconds before responding to
invocations. If your model is going to take 50-60 seconds of processing time, the SDK
socket timeout should be set to be 70 seconds.

``` swift
func invokeEndpoint(input: InvokeEndpointInput, completion: @escaping (ClientRuntime.SdkResult<InvokeEndpointOutputResponse, InvokeEndpointOutputError>) -> Void)
```

``` 
        Endpoints are scoped to an individual account, and are not public. The URL does
            not contain the account ID, but Amazon SageMaker determines the account ID from the
            authentication token that is supplied by the caller.
```

### invokeEndpointAsync(input:​completion:​)

After you deploy a model into production using Amazon SageMaker hosting services,
your client applications use this API to get inferences from the model hosted at
the specified endpoint in an asynchronous manner.

``` swift
func invokeEndpointAsync(input: InvokeEndpointAsyncInput, completion: @escaping (ClientRuntime.SdkResult<InvokeEndpointAsyncOutputResponse, InvokeEndpointAsyncOutputError>) -> Void)
```

``` 
    Inference requests sent to this API are enqueued for asynchronous processing.
        The processing of the inference request may or may not complete before the
        you receive a response from this API. The response from this API will
        not contain the result of the inference request but contain information
        about where you can locate it.

    Amazon SageMaker strips all POST headers except those supported by the API.
        Amazon SageMaker might add additional headers. You should not rely on the behavior
        of headers outside those enumerated in the request syntax.

    Calls to InvokeEndpointAsync are authenticated by using AWS Signature
        Version 4. For information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html">Authenticating Requests (AWS Signature Version 4) in the Amazon S3 API
            Reference.
```
