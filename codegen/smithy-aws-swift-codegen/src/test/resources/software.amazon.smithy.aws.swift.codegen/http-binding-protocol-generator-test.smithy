$version: "1.0"
namespace com.test

use aws.protocols#restJson1

@restJson1
service Example {
    version: "1.0.0",
    operations: [
        SmokeTest,
        DuplicateInputTest,
        ExplicitString,
        ExplicitBlob,
        ExplicitBlobStream,
        ExplicitStruct,
        ListInput,
        MapInput,
        EnumInput
    ]
}

@http(method: "POST", uri: "/smoketest/{label1}/foo")
operation SmokeTest {
    input: SmokeTestRequest,
    output: SmokeTestResponse,
    errors: [SmokeTestError]
}

@http(method: "POST", uri: "/smoketest-duplicate/{label1}/foo")
operation DuplicateInputTest {
    // uses the same input type as another operation. Ensure that we only generate one instance of the serializer
    input: SmokeTestRequest
}

structure SmokeTestRequest {
    @httpHeader("X-Header1")
    header1: String,

    @httpHeader("X-Header2")
    header2: String,

    @httpQuery("Query1")
    query1: String,

    @required
    @httpLabel
    label1: String,

    payload1: String,
    payload2: Integer,
    payload3: Nested
}

structure Nested {
    member1: String,
    member2: String
}

structure SmokeTestResponse {

}

@error("client")
structure SmokeTestError {}


@http(method: "POST", uri: "/explicit/string")
operation ExplicitString {
    input: ExplicitStringRequest
}

structure ExplicitStringRequest {
    @httpPayload
    payload1: String
}

@http(method: "POST", uri: "/explicit/blob")
operation ExplicitBlob {
    input: ExplicitBlobRequest
}

structure ExplicitBlobRequest {
    @httpPayload
    payload1: Blob
}

@streaming
blob BodyStream

@http(method: "POST", uri: "/explicit/blobstream")
operation ExplicitBlobStream {
    input: ExplicitBlobStreamRequest
}

structure ExplicitBlobStreamRequest {
    @httpPayload
    payload1: BodyStream
}

@http(method: "POST", uri: "/explicit/struct")
operation ExplicitStruct {
    input: ExplicitStructRequest
}

structure Nested4 {
    member1: Integer,
    // sanity check, member serialization for non top-level (bound to the operation input) aggregate shapes
    intList: IntList,
    intMap: IntMap
}

structure Nested3 {
    member1: String,
    member2: String,
    member3: Nested4
}

structure Nested2 {
    moreNesting: Nested3
}

structure ExplicitStructRequest {
    @httpPayload
    payload1: Nested2
}

list IntList {
    member: Integer
}

list StructList {
    member: Nested
}

// A list of lists of integers
list NestedIntList {
    member: IntList
}

@http(method: "POST", uri: "/input/list")
operation ListInput {
    input: ListInputRequest
}

structure ListInputRequest {
    intList: IntList,
    structList: StructList,
    nestedIntList: NestedIntList
}

map IntMap {
    key: String,
    value: Integer
}

map StructMap {
    key: String,
    value: Nested
}

@http(method: "POST", uri: "/input/map")
operation MapInput {
    input: MapInputRequest
}

structure MapInputRequest {
    intMap: IntMap,
    structMap: StructMap
}


@http(method: "POST", uri: "/input/enum")
operation EnumInput {
    input: EnumInputRequest
}

@enum([
    {
        value: "rawValue1",
        name: "Variant1"
    },
    {
        value: "rawValue2",
        name: "Variant2"
    }
])
string MyEnum

structure NestedEnum {
    myEnum: MyEnum
}

structure EnumInputRequest {
    nestedWithEnum: NestedEnum,

    @httpHeader("X-EnumHeader")
    enumHeader: MyEnum
}
