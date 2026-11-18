$version: "2.0"

namespace aws.endpointtests.bdd

use aws.api#service
use aws.protocols#restJson1
use smithy.rules#clientContextParams
use smithy.rules#endpointBdd
use smithy.rules#endpointTests

// Endpoint BDD test model required by the Endpoints BDD SEP.
// Has only the endpointBdd trait (no endpointRuleSet).
//
// Differs from the SEP's model in one way: Region uses builtIn "AWS::Region" (like every AWS model)
// instead of being a client context param, because Swift codegen does not support required client
// context params without a default. The test cases' operation inputs set the AWS::Region built-in to
// match; their params and expected endpoints are unchanged.
@clientContextParams(
    UseFips: { type: "boolean", documentation: "docs" }
)
@endpointBdd({
    version: "1.1"
    parameters: {
        Region: { builtIn: "AWS::Region", required: true, documentation: "The AWS region", type: "string" }
        UseFips: { required: true, default: false, documentation: "Use FIPS endpoints", type: "boolean" }
    }
    conditions: [
        {
            fn: "booleanEquals"
            argv: [
                {
                    ref: "UseFips"
                }
                true
            ]
        }
    ]
    results: [
        {
            conditions: []
            endpoint: {
                url: "https://service-fips.{Region}.amazonaws.com"
                properties: {}
                headers: {}
            }
            type: "endpoint"
        }
        {
            conditions: []
            endpoint: {
                url: "https://service.{Region}.amazonaws.com"
                properties: {}
                headers: {}
            }
            type: "endpoint"
        }
    ]
    root: 2
    nodeCount: 2
    nodes: "/////wAAAAH/////AAAAAAX14QEF9eEC"
})
@endpointTests({
    version: "1.0"
    testCases: [
        {
            documentation: "Region properly added in url."
            params: { Region: "test-region" }
            operationInputs: [
                {
                    operationName: "Echo"
                    operationParams: { string: "Foo" }
                    builtInParams: { "AWS::Region": "test-region" }
                }
            ]
            expect: {
                endpoint: {
                    url: "https://service.test-region.amazonaws.com"
                    properties: {}
                }
            }
        }
        {
            documentation: "Fips properly added in url."
            params: { Region: "test-region", UseFips: true }
            operationInputs: [
                {
                    operationName: "Echo"
                    operationParams: { string: "Foo" }
                    builtInParams: { "AWS::Region": "test-region" }
                }
            ]
            expect: {
                endpoint: {
                    url: "https://service-fips.test-region.amazonaws.com"
                    properties: {}
                }
            }
        }
    ]
})
@service(sdkId: "ServiceWithEndpointBdd")
@restJson1
service ServiceWithEndpointBdd {
    version: "2022-01-01"
    operations: [
        Echo
    ]
}

@http(method: "PUT", uri: "/echo")
operation Echo {
    input := {
        string: String
    }
    output := {
        string: String
    }
}
