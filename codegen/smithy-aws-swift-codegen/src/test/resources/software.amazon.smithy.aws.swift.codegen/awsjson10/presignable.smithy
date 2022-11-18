namespace smithy.swift.traits

use aws.protocols#awsJson1_0
use aws.auth#sigv4
use aws.api#service
@trait(selector: "*")

structure presignable { }

@awsJson1_0
@sigv4(name: "example-signing-name")
@service(sdkId: "example")
service Example {
    version: "1.0.0",
    operations: [GetFoo, PostFoo, PutFoo]
}

@presignable
@http(method: "POST", uri: "/foo")
operation PostFoo {
    input: GetFooInput
}

@presignable
@readonly
@http(method: "GET", uri: "/foo")
operation GetFoo { }

@presignable
@http(method: "PUT", uri: "/foo")
@idempotent
operation PutFoo {
    input: GetFooInput
}

structure GetFooInput {
    payload: String
}

// This section is used to check S3-specific presigner configuration.

@service(sdkId: "S3")
@sigv4(name: "s3")
service S3 {
    version: "1.0.0",
    operations: [PutObject]
}

@presignable
@http(method: "PUT", uri: "/foo")
operation PutObject {
    input: PutObjectInput
}

structure PutObjectInput {
    payload: String
}
