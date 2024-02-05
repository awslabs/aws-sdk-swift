package software.amazon.smithy.aws.swift.codegen

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator.Companion.getFileContents
import software.amazon.smithy.aws.swift.codegen.restjson.AWSRestJson1ProtocolGenerator
import software.amazon.smithy.aws.traits.protocols.RestJson1Trait

class EventStreamTests {
    @Test
    fun `test MessageMarshallable`() {
        val context = setupTests("eventstream.smithy", "aws.protocoltests.restjson#TestService")
        val contents = getFileContents(context.manifest, "/Example/models/TestStream+MessageMarshallable.swift")
        val expected = """
extension EventStreamTestClientTypes.TestStream: ClientRuntime.MessageMarshallable {
    public func marshall(encoder: ClientRuntime.RequestEncoder) throws -> ClientRuntime.EventStream.Message {
        var headers: [ClientRuntime.EventStream.Header] = [.init(name: ":message-type", value: .string("event"))]
        var payload: ClientRuntime.Data? = nil
        switch self {
        case .messagewithblob(let value):
            headers.append(.init(name: ":event-type", value: .string("MessageWithBlob")))
            headers.append(.init(name: ":content-type", value: .string("application/octet-stream")))
            payload = value.data
        case .messagewithstring(let value):
            headers.append(.init(name: ":event-type", value: .string("MessageWithString")))
            headers.append(.init(name: ":content-type", value: .string("text/plain")))
            payload = value.data?.data(using: .utf8)
        case .messagewithstruct(let value):
            headers.append(.init(name: ":event-type", value: .string("MessageWithStruct")))
            headers.append(.init(name: ":content-type", value: .string("application/json")))
            payload = try encoder.encode(value)
        case .messagewithunion(let value):
            headers.append(.init(name: ":event-type", value: .string("MessageWithUnion")))
            headers.append(.init(name: ":content-type", value: .string("application/json")))
            payload = try encoder.encode(value)
        case .messagewithheaders(let value):
            headers.append(.init(name: ":event-type", value: .string("MessageWithHeaders")))
            if let headerValue = value.blob {
                headers.append(.init(name: "blob", value: .byteArray(headerValue)))
            }
            if let headerValue = value.boolean {
                headers.append(.init(name: "boolean", value: .bool(headerValue)))
            }
            if let headerValue = value.byte {
                headers.append(.init(name: "byte", value: .byte(headerValue)))
            }
            if let headerValue = value.int {
                headers.append(.init(name: "int", value: .int32(Int32(headerValue))))
            }
            if let headerValue = value.long {
                headers.append(.init(name: "long", value: .int64(Int64(headerValue))))
            }
            if let headerValue = value.short {
                headers.append(.init(name: "short", value: .int16(headerValue)))
            }
            if let headerValue = value.string {
                headers.append(.init(name: "string", value: .string(headerValue)))
            }
            if let headerValue = value.timestamp {
                headers.append(.init(name: "timestamp", value: .timestamp(headerValue)))
            }
        case .messagewithheaderandpayload(let value):
            headers.append(.init(name: ":event-type", value: .string("MessageWithHeaderAndPayload")))
            if let headerValue = value.header {
                headers.append(.init(name: "header", value: .string(headerValue)))
            }
            headers.append(.init(name: ":content-type", value: .string("application/octet-stream")))
            payload = value.payload
        case .messagewithnoheaderpayloadtraits(let value):
            headers.append(.init(name: ":event-type", value: .string("MessageWithNoHeaderPayloadTraits")))
            headers.append(.init(name: ":content-type", value: .string("application/json")))
            payload = try ClientRuntime.JSONReadWrite.documentWritingClosure(encoder: encoder)(value, JSONReadWrite.writingClosure())
        case .messagewithunboundpayloadtraits(let value):
            headers.append(.init(name: ":event-type", value: .string("MessageWithUnboundPayloadTraits")))
            if let headerValue = value.header {
                headers.append(.init(name: "header", value: .string(headerValue)))
            }
            headers.append(.init(name: ":content-type", value: .string("application/json")))
            payload = try ClientRuntime.JSONReadWrite.documentWritingClosure(encoder: encoder)(value, JSONReadWrite.writingClosure())
        case .sdkUnknown(_):
            throw ClientRuntime.ClientError.unknownError("cannot serialize the unknown event type!")
        }
        return ClientRuntime.EventStream.Message(headers: headers, payload: payload ?? .init())
    }
}
        """.trimIndent()
        contents.shouldContainOnlyOnce(expected)
    }

    @Test
    fun `test MessageUnmarshallable`() {
        val context = setupTests("eventstream.smithy", "aws.protocoltests.restjson#TestService")
        val contents = getFileContents(context.manifest, "/Example/models/TestStream+MessageUnmarshallable.swift")
        val expected = """
extension EventStreamTestClientTypes.TestStream: ClientRuntime.MessageUnmarshallable {
    public init(message: ClientRuntime.EventStream.Message, decoder: ClientRuntime.ResponseDecoder) throws {
        switch try message.type() {
        case .event(let params):
            switch params.eventType {
            case "MessageWithBlob":
                var event = EventStreamTestClientTypes.MessageWithBlob()
                event.data = message.payload
                self = .messagewithblob(event)
            case "MessageWithString":
                var event = EventStreamTestClientTypes.MessageWithString()
                event.data = String(data: message.payload, encoding: .utf8)
                self = .messagewithstring(event)
            case "MessageWithStruct":
                var event = EventStreamTestClientTypes.MessageWithStruct()
                event.someStruct = .init(try decoder.decode(responseBody: message.payload))
                self = .messagewithstruct(event)
            case "MessageWithUnion":
                var event = EventStreamTestClientTypes.MessageWithUnion()
                event.someUnion = .init(try decoder.decode(responseBody: message.payload))
                self = .messagewithunion(event)
            case "MessageWithHeaders":
                var event = EventStreamTestClientTypes.MessageWithHeaders()
                if case let .byteArray(value) = message.headers.value(name: "blob") {
                    event.blob = value
                }
                if case let .bool(value) = message.headers.value(name: "boolean") {
                    event.boolean = value
                }
                if case let .byte(value) = message.headers.value(name: "byte") {
                    event.byte = value
                }
                if case let .int32(value) = message.headers.value(name: "int") {
                    event.int = Int(value)
                }
                if case let .int64(value) = message.headers.value(name: "long") {
                    event.long = Int(value)
                }
                if case let .int16(value) = message.headers.value(name: "short") {
                    event.short = value
                }
                if case let .string(value) = message.headers.value(name: "string") {
                    event.string = value
                }
                if case let .timestamp(value) = message.headers.value(name: "timestamp") {
                    event.timestamp = value
                }
                self = .messagewithheaders(event)
            case "MessageWithHeaderAndPayload":
                var event = EventStreamTestClientTypes.MessageWithHeaderAndPayload()
                if case let .string(value) = message.headers.value(name: "header") {
                    event.header = value
                }
                event.payload = message.payload
                self = .messagewithheaderandpayload(event)
            case "MessageWithNoHeaderPayloadTraits":
                self = .messagewithnoheaderpayloadtraits(try decoder.decode(responseBody: message.payload))
            case "MessageWithUnboundPayloadTraits":
                var event = EventStreamTestClientTypes.MessageWithUnboundPayloadTraits()
                if case let .string(value) = message.headers.value(name: "header") {
                    event.header = value
                }
                event.unboundString = try decoder.decode(responseBody: message.payload)
                self = .messagewithunboundpayloadtraits(event)
            default:
                self = .sdkUnknown("error processing event stream, unrecognized event: \(params.eventType)")
            }
        case .exception(let params):
            let makeError: (ClientRuntime.EventStream.Message, ClientRuntime.EventStream.MessageType.ExceptionParams) throws -> Swift.Error = { message, params in
                switch params.exceptionType {
                case "SomeError":
                    return try decoder.decode(responseBody: message.payload) as SomeError
                default:
                    let httpResponse = HttpResponse(body: .data(message.payload), statusCode: .ok)
                    return AWSClientRuntime.UnknownAWSHTTPServiceError(httpResponse: httpResponse, message: "error processing event stream, unrecognized ':exceptionType': \(params.exceptionType); contentType: \(params.contentType ?? "nil")", requestID: nil, typeName: nil)
                }
            }
            let error = try makeError(message, params)
            throw error
        case .error(let params):
            let httpResponse = HttpResponse(body: .data(message.payload), statusCode: .ok)
            throw AWSClientRuntime.UnknownAWSHTTPServiceError(httpResponse: httpResponse, message: "error processing event stream, unrecognized ':errorType': \(params.errorCode); message: \(params.message ?? "nil")", requestID: nil, typeName: nil)
        case .unknown(messageType: let messageType):
            throw ClientRuntime.ClientError.unknownError("unrecognized event stream message ':message-type': \(messageType)")
        }
    }
}
        """.trimIndent()
        contents.shouldContainOnlyOnce(expected)
    }

    @Test
    fun `operation stack`() {
        val context = setupTests("eventstream.smithy", "aws.protocoltests.restjson#TestService")
        val contents = getFileContents(context.manifest, "/Example/EventStreamTestClient.swift")
        var expected = """
    public func testStreamOp(input: TestStreamOpInput) async throws -> TestStreamOpOutput {
        let context = ClientRuntime.HttpContextBuilder()
                      .withEncoder(value: encoder)
                      .withDecoder(value: decoder)
                      .withMethod(value: .post)
                      .withServiceName(value: serviceName)
                      .withOperation(value: "testStreamOp")
                      .withIdempotencyTokenGenerator(value: config.idempotencyTokenGenerator)
                      .withLogger(value: config.logger)
                      .withPartitionID(value: config.partitionID)
                      .withCredentialsProvider(value: config.credentialsProvider)
                      .withRegion(value: config.region)
                      .withSigningName(value: "event-stream-test")
                      .withSigningRegion(value: config.signingRegion)
                      .build()
        try context.setupBidirectionalStreaming()
        var operation = ClientRuntime.OperationStack<TestStreamOpInput, TestStreamOpOutput>(id: "testStreamOp")
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLPathMiddleware<TestStreamOpInput, TestStreamOpOutput>(TestStreamOpInput.urlPathProvider(_:)))
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLHostMiddleware<TestStreamOpInput, TestStreamOpOutput>())
        let endpointParams = EndpointParams()
        operation.buildStep.intercept(position: .before, middleware: EndpointResolverMiddleware<TestStreamOpOutput>(endpointResolver: config.serviceSpecific.endpointResolver, endpointParams: endpointParams))
        operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.UserAgentMiddleware(metadata: AWSClientRuntime.AWSUserAgentMetadata.fromConfig(serviceID: serviceName, version: "1.0.0", config: config)))
        operation.serializeStep.intercept(position: .after, middleware: ContentTypeMiddleware<TestStreamOpInput, TestStreamOpOutput>(contentType: "application/json"))
        operation.serializeStep.intercept(position: .after, middleware: ClientRuntime.EventStreamBodyMiddleware<TestStreamOpInput, TestStreamOpOutput, EventStreamTestClientTypes.TestStream>(keyPath: \.value, defaultBody: "{}"))
        operation.finalizeStep.intercept(position: .before, middleware: ClientRuntime.ContentLengthMiddleware())
        operation.finalizeStep.intercept(position: .after, middleware: ClientRuntime.RetryMiddleware<ClientRuntime.DefaultRetryStrategy, AWSClientRuntime.AWSRetryErrorInfoProvider, TestStreamOpOutput>(options: config.retryStrategyOptions))
        let sigv4Config = AWSClientRuntime.SigV4Config(unsignedBody: false, signingAlgorithm: .sigv4)
        operation.finalizeStep.intercept(position: .before, middleware: AWSClientRuntime.SigV4Middleware<TestStreamOpOutput>(config: sigv4Config))
        operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.DeserializeMiddleware<TestStreamOpOutput>(responseClosure(decoder: decoder), responseErrorClosure(TestStreamOpOutputError.self, decoder: decoder)))
        operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.LoggerMiddleware<TestStreamOpOutput>(clientLogMode: config.clientLogMode))
        let result = try await operation.handleMiddleware(context: context, input: input, next: client.getHandler())
        return result
    }
"""
        contents.shouldContainOnlyOnce(expected)
    }

    private fun setupTests(smithyFile: String, serviceShapeId: String): TestContext {
        val context = TestContextGenerator.initContextFrom(smithyFile, serviceShapeId, RestJson1Trait.ID)

        val generator = AWSRestJson1ProtocolGenerator()
        generator.generateProtocolUnitTests(context.ctx)
        context.ctx.delegator.flushWriters()
        return context
    }
}
