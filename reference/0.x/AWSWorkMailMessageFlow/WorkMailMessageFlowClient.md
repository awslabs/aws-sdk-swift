# WorkMailMessageFlowClient

``` swift
public class WorkMailMessageFlowClient 
```

## Inheritance

[`WorkMailMessageFlowClientProtocol`](/aws-sdk-swift/reference/0.x/AWSWorkMailMessageFlow/WorkMailMessageFlowClientProtocol)

## Initializers

### `init(config:)`

``` swift
public init(config: AWSClientRuntime.AWSClientConfiguration) 
```

### `init(region:)`

``` swift
public convenience init(region: Swift.String? = nil) throws 
```

## Methods

### `getRawMessageContent(input:completion:)`

Retrieves the raw content of an in-transit email message, in MIME format.

``` swift
public func getRawMessageContent(input: GetRawMessageContentInput, completion: @escaping (ClientRuntime.SdkResult<GetRawMessageContentOutputResponse, GetRawMessageContentOutputError>) -> Void)
```

### `putRawMessageContent(input:completion:)`

Updates the raw content of an in-transit email message, in MIME format.
This example describes how to update in-transit email message. For more information and examples for using this API, see
<a href="https:​//docs.aws.amazon.com/workmail/latest/adminguide/update-with-lambda.html">
Updating message content with AWS Lambda.

``` swift
public func putRawMessageContent(input: PutRawMessageContentInput, completion: @escaping (ClientRuntime.SdkResult<PutRawMessageContentOutputResponse, PutRawMessageContentOutputError>) -> Void)
```

``` 
        Updates to an in-transit message only appear when you call PutRawMessageContent from an AWS Lambda function
  configured with a  synchronous <a href="https://docs.aws.amazon.com/workmail/latest/adminguide/lambda.html#synchronous-rules">
    Run Lambda rule. If you call PutRawMessageContent on a delivered or sent message, the message remains unchanged,
  even though <a href="https://docs.aws.amazon.com/workmail/latest/APIReference/API_messageflow_GetRawMessageContent.html">GetRawMessageContent returns an updated
    message.
```
