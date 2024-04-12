package software.amazon.smithy.aws.swift.codegen.restxml

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.TestContext
import software.amazon.smithy.aws.swift.codegen.TestUtils
import software.amazon.smithy.aws.swift.codegen.shouldSyntacticSanityCheck
import software.amazon.smithy.aws.traits.protocols.RestXmlTrait

class AWSRestXMLEventStreamTests {
    @Test
    fun `001 EventStreamBodyMiddleware passes in marshal closure argument`() {
        val context = setupTests(
            "restxml/xml-event-stream.smithy",
            "com.test#EventStreamTest"
        )
        val contents = TestUtils.getFileContents(
            context.manifest,
            "/Example/EventStreamTestClient.swift"
        )
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
        operation.serializeStep.intercept(position: .after, middleware: ClientRuntime.EventStreamBodyMiddleware<EventStreamOpInput, EventStreamOpOutput, EventStreamTestClientTypes.TestEvents>(keyPath: \.eventStream, defaultBody: nil, marshalClosure: EventStreamTestClientTypes.TestEvents.marshal))
"""
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `002 marshal static function variable gets generated for streaming union shape`() {
        val context = setupTests(
            "restxml/xml-event-stream.smithy",
            "com.test#EventStreamTest"
        )
        val contents = TestUtils.getFileContents(
            context.manifest,
            "/Example/models/TestEvents+MessageMarshallable.swift"
        )
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
extension EventStreamTestClientTypes.TestEvents {
    static var marshal: ClientRuntime.MarshalClosure<EventStreamTestClientTypes.TestEvents> {
        { (self) in
            var headers: [ClientRuntime.EventStream.Header] = [.init(name: ":message-type", value: .string("event"))]
            var payload: ClientRuntime.Data? = nil
            switch self {
            case messageevent(let value):
                headers.append(.init(name: ":event-type", value: .string("MessageEvent")))
                headers.append(.init(name: ":content-type", value: .string("text/plain")))
                payload = value.data?.data(using: .utf8)
            case audioevent(let value):
                headers.append(.init(name: ":event-type", value: .string("AudioEvent")))
                if let headerValue = value.exampleHeader {
                    headers.append(.init(name: "exampleHeader", value: .string(headerValue)))
                }
                headers.append(.init(name: ":content-type", value: .string("application/xml")))
                payload = try SmithyReadWrite.documentWritingClosure(rootNodeInfo: "Audio")(value, EventStreamTestClientTypes.Audio.write(value:to:))
            case .sdkUnknown(_):
                throw ClientRuntime.ClientError.unknownError("cannot serialize the unknown event type!")
            }
            return ClientRuntime.EventStream.Message(headers: headers, payload: payload ?? .init())
        }
    }
}
"""
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `003 closures get generated for specific event of streaming union`() {
        val context = setupTests(
            "restxml/xml-event-stream.smithy",
            "com.test#EventStreamTest"
        )
        val contents = TestUtils.getFileContents(
            context.manifest,
            "/Example/models/MessageWithAudio+ReadWrite.swift"
        )
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
extension EventStreamTestClientTypes.MessageWithAudio {

    static func write(value: EventStreamTestClientTypes.MessageWithAudio?, to writer: SmithyXML.Writer) throws {
        guard let value else { writer.detach(); return }
        try writer["audio"].write(value.audio, writingClosure: EventStreamTestClientTypes.Audio.write(value:to:))
        try writer["exampleHeader"].write(value.exampleHeader)
    }

    static func read(from reader: SmithyXML.Reader) throws -> EventStreamTestClientTypes.MessageWithAudio {
        guard reader.hasContent else { throw SmithyReadWrite.ReaderError.requiredValueNotPresent }
        var value = EventStreamTestClientTypes.MessageWithAudio()
        value.exampleHeader = try reader["exampleHeader"].readIfPresent()
        value.audio = try reader["audio"].readIfPresent(with: EventStreamTestClientTypes.Audio.read(from:))
        return value
    }
}
        """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `004 closures get generated for nested struct of an event`() {
        val context = setupTests(
            "restxml/xml-event-stream.smithy",
            "com.test#EventStreamTest"
        )
        val contents = TestUtils.getFileContents(
            context.manifest,
            "/Example/models/Audio+ReadWrite.swift"
        )
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
extension EventStreamTestClientTypes.Audio {

    static func write(value: EventStreamTestClientTypes.Audio?, to writer: SmithyXML.Writer) throws {
        guard let value else { writer.detach(); return }
        try writer["rawAudio"].write(value.rawAudio)
    }

    static func read(from reader: SmithyXML.Reader) throws -> EventStreamTestClientTypes.Audio {
        guard reader.hasContent else { throw SmithyReadWrite.ReaderError.requiredValueNotPresent }
        var value = EventStreamTestClientTypes.Audio()
        value.rawAudio = try reader["rawAudio"].readIfPresent()
        return value
    }
}
        """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    private fun setupTests(smithyFile: String, serviceShapeId: String): TestContext {
        val context = TestUtils.executeDirectedCodegen(smithyFile, serviceShapeId, RestXmlTrait.ID)
        RestXmlProtocolGenerator().run {
            generateMessageMarshallable(context.ctx)
            generateSerializers(context.ctx)
            initializeMiddleware(context.ctx)
            generateProtocolClient(context.ctx)
        }
        context.ctx.delegator.flushWriters()
        return context
    }
}
