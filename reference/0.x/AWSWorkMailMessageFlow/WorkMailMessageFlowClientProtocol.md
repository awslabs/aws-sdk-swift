# WorkMailMessageFlowClientProtocol

The WorkMail Message Flow API provides access to email messages as they are being sent and received by a WorkMail organization.

``` swift
public protocol WorkMailMessageFlowClientProtocol 
```

## Requirements

### getRawMessageContent(input:completion:)

Retrieves the raw content of an in-transit email message, in MIME format.

``` swift
func getRawMessageContent(input: GetRawMessageContentInput, completion: @escaping (ClientRuntime.SdkResult<GetRawMessageContentOutputResponse, GetRawMessageContentOutputError>) -> Void)
```

### putRawMessageContent(input:completion:)

Updates the raw content of an in-transit email message, in MIME format. This example describes how to update in-transit email message. For more information and examples for using this API, see [ Updating message content with AWS Lambda](https://docs.aws.amazon.com/workmail/latest/adminguide/update-with-lambda.html). Updates to an in-transit message only appear when you call PutRawMessageContent from an AWS Lambda function configured with a synchronous [ Run Lambda](https://docs.aws.amazon.com/workmail/latest/adminguide/lambda.html#synchronous-rules) rule. If you call PutRawMessageContent on a delivered or sent message, the message remains unchanged, even though [GetRawMessageContent](https://docs.aws.amazon.com/workmail/latest/APIReference/API_messageflow_GetRawMessageContent.html) returns an updated message.

``` swift
func putRawMessageContent(input: PutRawMessageContentInput, completion: @escaping (ClientRuntime.SdkResult<PutRawMessageContentOutputResponse, PutRawMessageContentOutputError>) -> Void)
```
