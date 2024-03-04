package software.amazon.smithy.aws.swift.codegen.awsjson

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.TestContext
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator
import software.amazon.smithy.aws.swift.codegen.shouldSyntacticSanityCheck
import software.amazon.smithy.aws.traits.protocols.AwsJson1_0Trait

class AWSJsonHttpInitialRequestTests {
    @Test
    fun `001 Conformance to MessageMarshallable gets generated correctly`() {
        val context = setupTests(
            "awsjson/initial-request.smithy",
            "com.test#InitialRequestTest"
        )
        val contents = TestContextGenerator.getFileContents(
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
    fun `002 EventStreamBodyMiddleware gets generated into operation stack`() {
        val context = setupTests(
            "awsjson/initial-request.smithy",
            "com.test#InitialRequestTest"
        )
        val contents = TestContextGenerator.getFileContents(
            context.manifest,
            "/Example/InitialRequestTestClient.swift"
        )
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            operation.serializeStep.intercept(position: .after, middleware: ClientRuntime.EventStreamBodyMiddleware<EventStreamOpInput, EventStreamOpOutput, InitialRequestTestClientTypes.TestStream>(keyPath: \.eventStream, defaultBody: "{}", sendInitialRequest: true))
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    private fun setupTests(smithyFile: String, serviceShapeId: String): TestContext {
        val context = TestContextGenerator.initContextFrom(smithyFile, serviceShapeId, AwsJson1_0Trait.ID)
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
