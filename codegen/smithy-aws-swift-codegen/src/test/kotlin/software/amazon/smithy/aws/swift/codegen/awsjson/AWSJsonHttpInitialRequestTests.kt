package software.amazon.smithy.aws.swift.codegen.awsjson

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.TestContext
import software.amazon.smithy.aws.swift.codegen.TestUtils
import software.amazon.smithy.aws.swift.codegen.shouldSyntacticSanityCheck
import software.amazon.smithy.aws.traits.protocols.AwsJson1_0Trait

class AWSJsonHttpInitialRequestTests {
    @Test
    fun `001 Conformance to MessageMarshallable gets generated correctly`() {
        val context = setupTests(
            "awsjson/initial-request.smithy",
            "com.test#InitialRequestTest"
        )
        val contents = TestUtils.getFileContents(
            context.manifest,
            "/Example/models/TestStream+MessageMarshallable.swift"
        )
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            extension InitialRequestTestClientTypes.TestStream: ClientRuntime.MessageMarshallable {
                public func marshall(encoder: ClientRuntime.RequestEncoder) throws -> ClientRuntime.EventStream.Message {
                    var headers: [ClientRuntime.EventStream.Header] = [.init(name: ":message-type", value: .string("event"))]
                    var payload: ClientRuntime.Data? = nil
                    switch self {
                    case .messagewithstring(let value):
                        headers.append(.init(name: ":event-type", value: .string("MessageWithString")))
                        headers.append(.init(name: ":content-type", value: .string("text/plain")))
                        payload = value.data?.data(using: .utf8)
                    case .sdkUnknown(_):
                        throw ClientRuntime.ClientError.unknownError("cannot serialize the unknown event type!")
                    }
                    return ClientRuntime.EventStream.Message(headers: headers, payload: payload ?? .init())
                }
            }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `002 EventStreamBodyMiddleware gets generated into operation stack with initialRequestMessage`() {
        val context = setupTests(
            "awsjson/initial-request.smithy",
            "com.test#InitialRequestTest"
        )
        val contents = TestUtils.getFileContents(
            context.manifest,
            "/Example/InitialRequestTestClient.swift"
        )
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
        operation.serializeStep.intercept(position: .after, middleware: ClientRuntime.EventStreamBodyMiddleware<EventStreamOpInput, EventStreamOpOutput, InitialRequestTestClientTypes.TestStream>(keyPath: \.eventStream, defaultBody: "{}", marshalClosure: jsonMarshalClosure(requestEncoder: encoder), initialRequestMessage: try input.makeInitialRequestMessage(encoder: encoder)))
        """
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `003 Encodable conformance is generated for input struct with streaming union member with streaming member excluded`() {
        val context = setupTests(
            "awsjson/initial-request.smithy",
            "com.test#InitialRequestTest"
        )
        val contents = TestUtils.getFileContents(
            context.manifest,
            "/Example/models/EventStreamOpInput+Encodable.swift"
        )
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
        extension EventStreamOpInput: Swift.Encodable {
            enum CodingKeys: Swift.String, Swift.CodingKey {
                case inputMember1
                case inputMember2
            }

            public func encode(to encoder: Swift.Encoder) throws {
                var encodeContainer = encoder.container(keyedBy: CodingKeys.self)
                if let inputMember1 = self.inputMember1 {
                    try encodeContainer.encode(inputMember1, forKey: .inputMember1)
                }
                if let inputMember2 = self.inputMember2 {
                    try encodeContainer.encode(inputMember2, forKey: .inputMember2)
                }
            }
        }
        """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `004 makeInitialRequestMessage method gets generated for input struct in extension`() {
        val context = setupTests(
            "awsjson/initial-request.smithy",
            "com.test#InitialRequestTest"
        )
        val contents = TestUtils.getFileContents(
            context.manifest,
            "/Example/models/EventStreamOpInput+MakeInitialRequestMessage.swift"
        )
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
        extension EventStreamOpInput {
            func makeInitialRequestMessage(encoder: ClientRuntime.RequestEncoder) throws -> EventStream.Message {
                let initialRequestPayload = try ClientRuntime.JSONReadWrite.documentWritingClosure(encoder: encoder)(self, JSONReadWrite.writingClosure())
                let initialRequestMessage = EventStream.Message(
                    headers: [
                        EventStream.Header(name: ":message-type", value: .string("event")),
                        EventStream.Header(name: ":event-type", value: .string("initial-request")),
                        EventStream.Header(name: ":content-type", value: .string("application/x-amz-json-1.0"))
                    ],
                    payload: initialRequestPayload
                )
                return initialRequestMessage
            }
        }
        """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }
    private fun setupTests(smithyFile: String, serviceShapeId: String): TestContext {
        val context = TestUtils.executeDirectedCodegen(smithyFile, serviceShapeId, AwsJson1_0Trait.ID)
        AwsJson1_0_ProtocolGenerator().run {
            generateMessageMarshallable(context.ctx)
            generateSerializers(context.ctx)
            initializeMiddleware(context.ctx)
            generateProtocolClient(context.ctx)
        }
        context.ctx.delegator.flushWriters()
        return context
    }
}
