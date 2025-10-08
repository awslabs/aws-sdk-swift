$version: "2"
namespace aws.protocoltests.eventstream

use aws.protocols#restJson1
use aws.api#service
use aws.auth#sigv4

@restJson1
@sigv4(name: "event-stream-test")
@service(sdkId: "EventStreamTest")
service TestService { version: "123", operations: [TestStreamOp] }

@http(method: "POST", uri: "/test")
operation TestStreamOp {
    input: TestStreamInputOutput,
    output: TestStreamInputOutput,
    errors: [SomeError],
}

structure TestStreamInputOutput {
    @httpPayload
    @required
    value: TestStream
}

@error("client")
structure SomeError {
    Message: String,
}

union TestUnion {
    Foo: String,
    Bar: Integer,
}

structure TestStruct {
    someString: String,
    someInt: Integer,
}

enum TestEnum {
    A
    B
    C
}

intEnum TestIntEnum {
    A = 0
    B = 1
    C = 2
}

structure MessageWithBlob { @eventPayload data: Blob }

structure MessageWithString { @eventPayload data: String }

structure MessageWithStruct { @eventPayload someStruct: TestStruct }

structure MessageWithUnion { @eventPayload someUnion: TestUnion }

structure MessageWithHeaders {
    @eventHeader blob: Blob,
    @eventHeader boolean: Boolean,
    @eventHeader byte: Byte,
    @eventHeader int: Integer,
    @eventHeader intEnum: TestIntEnum,
    @eventHeader long: Long,
    @eventHeader short: Short,
    @eventHeader string: String,
    @eventHeader enum: TestEnum,
    @eventHeader timestamp: Timestamp,
}
structure MessageWithHeaderAndPayload {
    @eventHeader header: String,
    @eventPayload payload: Blob,
}
structure MessageWithNoHeaderPayloadTraits {
    someInt: Integer,
    someString: String,
}

structure MessageWithUnboundPayloadTraits {
    @eventHeader header: String,
    unboundString: String,
}

@streaming
union TestStream {
    MessageWithBlob: MessageWithBlob,
    MessageWithString: MessageWithString,
    MessageWithStruct: MessageWithStruct,
    MessageWithUnion: MessageWithUnion,
    MessageWithHeaders: MessageWithHeaders,
    MessageWithHeaderAndPayload: MessageWithHeaderAndPayload,
    MessageWithNoHeaderPayloadTraits: MessageWithNoHeaderPayloadTraits,
    MessageWithUnboundPayloadTraits: MessageWithUnboundPayloadTraits,
    SomeError: SomeError,
}
