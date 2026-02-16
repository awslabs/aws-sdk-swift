package software.amazon.smithy.aws.swift.codegen.awsjson

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.TestContext
import software.amazon.smithy.aws.swift.codegen.TestUtils
import software.amazon.smithy.aws.swift.codegen.protocols.awsjson.AWSJSON1_0ProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.shouldSyntacticSanityCheck
import software.amazon.smithy.aws.traits.protocols.AwsJson1_0Trait

class AWSJsonHttpInitialRequestTests {
    @Test
    fun `004 makeInitialRequestMessage method gets generated for input struct in extension`() {
        val context =
            setupTests(
                "awsjson/initial-request.smithy",
                "com.test#InitialRequestTest",
            )
        val contents =
            TestUtils.getFileContents(
                context.manifest,
                "Sources/Example/models/EventStreamOpInput+MakeInitialRequestMessage.swift",
            )
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
extension EventStreamOpInput {
    func makeInitialRequestMessage() throws -> SmithyEventStreamsAPI.Message {
        let writer = SmithyJSON.Writer(nodeInfo: "")
        try writer.write(self, with: EventStreamOpInput.write(value:to:))
        let initialRequestPayload = try writer.data()
        let initialRequestMessage = SmithyEventStreamsAPI.Message(
            headers: [
                SmithyEventStreamsAPI.Header(name: ":message-type", value: .string("event")),
                SmithyEventStreamsAPI.Header(name: ":event-type", value: .string("initial-request")),
                SmithyEventStreamsAPI.Header(name: ":content-type", value: .string("application/x-amz-json-1.0"))
            ],
            payload: initialRequestPayload
        )
        return initialRequestMessage
    }
}
"""
        contents.shouldContainOnlyOnce(expectedContents)
    }

    private fun setupTests(
        smithyFile: String,
        serviceShapeId: String,
    ): TestContext {
        val context = TestUtils.executeDirectedCodegen(smithyFile, serviceShapeId, AwsJson1_0Trait.ID)
        AWSJSON1_0ProtocolGenerator().run {
            generateMessageMarshallable(context.ctx)
            generateSerializers(context.ctx)
            initializeMiddleware(context.ctx)
            generateProtocolClient(context.ctx)
        }
        context.ctx.delegator.flushWriters()
        return context
    }
}
