$version: "1.0"

namespace smithy.example

use aws.api#service
use smithy.rules#clientContextParams
use smithy.rules#staticContextParams
use smithy.rules#contextParam
use smithy.rules#endpointRuleSet

@clientContextParams(
    stringFoo: {type: "string", documentation: "a client string parameter"},
    boolFoo: {type: "boolean", documentation: "a client boolean parameter"}
)
@service(
    sdkId: "Json Protocol",
    arnNamespace: "jsonprotocol",
    cloudFormationName: "JsonProtocol",
    cloudTrailEventSource: "jsonprotocol.amazonaws.com",
)
service ExampleService {
    version: "2022-01-01",
    operations: [GetThing]
}

apply ExampleService @endpointRuleSet({
    version: "1.0",
    parameters: {
        stringFoo: {type: "string"},
        stringBar: {type: "string"},
        stringBaz: {type: "string"},
        endpoint: {type: "string", builtIn: "SDK::Endpoint"},
        boolFoo: {type: "boolean", required: true},
        boolBar: {type: "boolean"},
        boolBaz: {type: "string"},
        region: {type: "string", builtIn: "AWS::Region", required: true},
    },
    rules: []
})

@readonly
@staticContextParams(
    stringBar: {value: "some value"},
    boolBar: {value: true}
)
@http(method: "POST", uri: "/endpointtest/getthing")
operation GetThing {
    input: GetThingInput
}

@input
structure GetThingInput {
    fizz: String,

    @contextParam(name: "stringBaz")
    buzz: String,

    @contextParam(name: "boolBaz")
    fuzz: String,
}
