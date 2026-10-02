$version: "2.0"

namespace com.test

use aws.auth#sigv4
use aws.protocols#restJson1
use aws.api#service
use smithy.rules#endpointRuleSet

@restJson1
@sigv4(name: "events")
@auth([sigv4])
@service(sdkId: "EventBridge")
@endpointRuleSet({
    version: "1.0",
    parameters: {
        Region: {type: "string", builtIn: "AWS::Region", required: false},
        UseFIPS: {type: "boolean", builtIn: "AWS::UseFIPS", required: true, default: false}
    },
    rules: []
})
service EventBridge {
    version: "2015-10-07"
    operations: [PutEvents]
}

@http(method: "POST", uri: "/PutEvents")
operation PutEvents {}
