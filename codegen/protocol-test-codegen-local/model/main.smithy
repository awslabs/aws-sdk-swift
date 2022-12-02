$version: "1.0"

namespace aws.protocoltests.restjson

use smithy.waiters#waitable
use aws.protocols#restJson1
use aws.api#service
use smithy.test#httpRequestTests
use smithy.test#httpResponseTests

apply QueryPrecedence @httpRequestTests([
    {
        id: "UrlParamsKeyEncoding",
        documentation: "Keys and values must be url encoded",
        protocol: restJson1,
        method: "POST",
        uri: "/Precedence",
        body: "",
        queryParams: ["bar=%26%F0%9F%90%B1", "hello%20there=how%27s%20your%20encoding%3F", "a%20%26%20b%20%26%20c=better%20encode%20%3D%20this"],
        params: {
            foo: "&🐱",
            baz: {
                "hello there": "how's your encoding?",
                "a & b & c": "better encode = this"
            }
        },
        appliesTo: "client",
    },
    {
        id: "RestJsonQueryPrecedenceForbid",
        documentation: "Prefer named query parameters when serializing",
        protocol: restJson1,
        method: "POST",
        uri: "/Precedence",
        body: "",
        queryParams: [
            "bar=named",
            "qux=alsoFromMap"
        ],
        forbidQueryParams: ["bar=fromMap"],
        params: {
            foo: "named",
            baz: {
                bar: "fromMap",
                qux: "alsoFromMap"
            }
        },
        appliesTo: "client",
    }]
)

/// A REST JSON service that sends JSON requests and responses.
@service(sdkId: "Rest Json Protocol")
@restJson1
service RestJsonExtras {
    version: "2019-12-16",
    operations: [EnumPayload, StringPayload, PrimitiveIntHeader, EnumQuery]
}

@http(uri: "/EnumPayload", method: "POST")
@httpRequestTests([
    {
        id: "EnumPayload",
        uri: "/EnumPayload",
        body: "enumvalue",
        params: { payload: "enumvalue" },
        method: "POST",
        protocol: "aws.protocols#restJson1"
    }
])
operation EnumPayload {
    input: EnumPayloadInput,
    output: EnumPayloadInput
}

structure EnumPayloadInput {
    @httpPayload
    payload: StringEnum
}

@http(uri: "/StringPayload", method: "POST")
@httpRequestTests([
    {
        id: "StringPayload",
        uri: "/StringPayload",
        body: "rawstring",
        params: { payload: "rawstring" },
        method: "POST",
        protocol: "aws.protocols#restJson1"
    }
])
operation StringPayload {
    input: StringPayloadInput,
    output: StringPayloadInput
}

structure StringPayloadInput {
    @httpPayload
    payload: String
}

@httpResponseTests([
    {
        id: "DeserPrimitiveHeader",
        protocol: "aws.protocols#restJson1",
        code: 200,
        headers: { "x-field": "123" },
        params: { field: 123 }
    }
])
@http(uri: "/primitive", method: "POST")
operation PrimitiveIntHeader {
    output: PrimitiveIntHeaderInput
}

integer PrimitiveInt

structure PrimitiveIntHeaderInput {
    @httpHeader("x-field")
    @required
    field: PrimitiveInt
}

@http(uri: "/foo/{enum}", method: "GET")
@httpRequestTests([
    {
        id: "EnumQueryRequest",
        uri: "/foo/enumvalue",
        params: { enum: "enumvalue" },
        method: "GET",
        protocol: "aws.protocols#restJson1"
    }
])
operation EnumQuery {
    input: EnumQueryInput
}

structure EnumQueryInput {
    @httpLabel
    @required
    enum: StringEnum
}

// A service which has a GET operation with waiters defined upon it.
// The acceptor in each waiter serves as subject for unit testing,
// to ensure that the logic in code-generated acceptors works as
// expected.
@service(sdkId: "Waiters")
@restJson1
service Waiters {
    version: "2022-11-30",
    operations: [GetWidget]
}

@http(uri: "/widget", method: "POST")
@waitable(
    SuccessTrueMatcher: {
        documentation: "Acceptor matches on successful request"
        acceptors: [
            {
                state: "success"
                matcher: {
                    success: true
                }
            }
        ]
    }
    SuccessFalseMatcher: {
        documentation: "Acceptor matches on unsuccessful request"
        acceptors: [
            {
                state: "success"
                matcher: {
                    success: false
                }
            }
        ]
    }
    ErrorTypeMatcher: {
        documentation: "Acceptor matches on receipt of specified error"
        acceptors: [
            {
                state: "success"
                matcher: {
                    errorType: "MyError"
                }
            }
        ]
    }
    OutputStringPropertyMatcher: {
        documentation: "Acceptor matches on output payload property"
        acceptors: [
            {
                state: "success"
                matcher: {
                    output: {
                        path: "stringProperty"
                        expected: "payload property contents"
                        comparator: "stringEquals"
                    }
                }
            }
        ]
    }
    OutputStringArrayAllPropertyMatcher: {
        documentation: "Acceptor matches on output payload property"
        acceptors: [
            {
                state: "success"
                matcher: {
                    output: {
                        path: "stringArrayProperty"
                        expected: "payload property contents"
                        comparator: "allStringEquals"
                    }
                }
            }
        ]
    }
    OutputStringArrayAnyPropertyMatcher: {
        documentation: "Acceptor matches on output payload property"
        acceptors: [
            {
                state: "success"
                matcher: {
                    output: {
                        path: "stringArrayProperty"
                        expected: "payload property contents"
                        comparator: "anyStringEquals"
                    }
                }
            }
        ]
    }
    OutputBooleanPropertyMatcher: {
        documentation: "Acceptor matches on output payload property"
        acceptors: [
            {
                state: "success"
                matcher: {
                    output: {
                        path: "booleanProperty"
                        expected: "false"
                        comparator: "booleanEquals"
                    }
                }
            }
        ]
    }
    InputOutputPropertyMatcher: {
        documentation: "Acceptor matches on input property equaling output property"
        acceptors: [
            {
                state: "success"
                matcher: {
                    inputOutput: {
                        path: "input.stringProperty == output.stringProperty"
                        expected: "true"
                        comparator: "booleanEquals"
                    }
                }
            }
        ]
    }
    FlattenMatcher: {
        documentation: "Matches when any grandchild has name 'expected name'"
        acceptors: [
            {
                state: "success"
                matcher: {
                    output: {
                        path: "children[].grandchildren[].name"
                        expected: "expected name"
                        comparator: "anyStringEquals"
                    }
                }
            }
        ]
    }
    FlattenLengthMatcher: {
        documentation: "Matches when there are 6 grandchildren total"
        acceptors: [
            {
                state: "success"
                matcher: {
                    output: {
                        path: "length(children[].grandchildren[]) == `6`"
                        expected: "true"
                        comparator: "booleanEquals"
                    }
                }
            }
        ]
    }
    ProjectedLengthMatcher: {
        documentation: "Matches when exactly one child has 3 grandchildren"
        acceptors: [
            {
                state: "success"
                matcher: {
                    output: {
                        path: "length(children[?length(grandchildren) == `3`]) == `1`"
                        expected: "true"
                        comparator: "booleanEquals"
                    }
                }
            }
        ]
    }
    FilterMatcher: {
        documentation: "Matches when exactly 3 grandchildren have numbers above 4"
        acceptors: [
            {
                state: "success"
                matcher: {
                    output: {
                        path: "length((children[].grandchildren[])[?number > `4`]) == `3`"
                        expected: "true"
                        comparator: "booleanEquals"
                    }
                }
            }
        ]
    }
)
operation GetWidget {
    input: WidgetInput,
    output: WidgetOutput
    errors: [MyError]
}

structure WidgetInput {
    stringProperty: String
}

structure WidgetOutput {
    stringProperty: String
    stringArrayProperty: StringArray
    booleanProperty: Boolean
    booleanArrayProperty: BooleanArray
    children: ChildArray
}

structure Child {
    grandchildren: GrandchildArray
}

structure Grandchild {
    name: String
    number: Integer
}

list StringArray{
    member: String
}

list BooleanArray{
    member: Boolean
}

list ChildArray {
    member: Child
}

list GrandchildArray {
    member: Grandchild
}

@error("client")
structure MyError {
    message: String
}
