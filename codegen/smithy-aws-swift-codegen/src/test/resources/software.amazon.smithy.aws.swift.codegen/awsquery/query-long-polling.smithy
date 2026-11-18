$version: "1.0"

namespace aws.protocoltests.query

use aws.api#service
use aws.protocols#awsQuery

@service(sdkId: "SQS")
@awsQuery
@xmlNamespace(uri: "https://example.com/")
service AwsQuery {
    version: "2020-01-08",
    operations: [
        ReceiveMessage
    ]
}

operation ReceiveMessage {
    input: ReceiveMessageInput,
    output: ReceiveMessageOutput
}

@input
structure ReceiveMessageInput {}

@output
structure ReceiveMessageOutput {}
