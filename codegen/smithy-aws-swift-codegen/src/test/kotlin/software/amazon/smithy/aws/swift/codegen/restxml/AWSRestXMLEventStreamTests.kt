package software.amazon.smithy.aws.swift.codegen.restxml

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
        """.trimIndent()
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
                        payload = try SmithyXML.XMLReadWrite.documentWritingClosure(rootNodeInfo: "Audio")(value, EventStreamTestClientTypes.Audio.writingClosure(_:to:))
                    case .sdkUnknown(_):
                        throw ClientRuntime.ClientError.unknownError("cannot serialize the unknown event type!")
                    }
                    return ClientRuntime.EventStream.Message(headers: headers, payload: payload ?? .init())
                }
            }
        }
        """.trimIndent()
    }

    @Test
    fun `003 closures get generated for specific event of streaming union`() {
        val context = setupTests(
            "restxml/xml-event-stream.smithy",
            "com.test#EventStreamTest"
        )
        val contents = TestUtils.getFileContents(
            context.manifest,
            "/Example/models/MessageWithAudio+Codable.swift"
        )
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
        extension EventStreamTestClientTypes.MessageWithAudio {

            static func writingClosure(_ value: EventStreamTestClientTypes.MessageWithAudio?, to writer: SmithyXML.Writer) throws {
                guard let value else { writer.detach(); return }
                try writer["audio"].write(value.audio, writingClosure: EventStreamTestClientTypes.Audio.writingClosure(_:to:))
                try writer["exampleHeader"].write(value.exampleHeader)
            }

            static var readingClosure: SmithyReadWrite.ReadingClosure<EventStreamTestClientTypes.MessageWithAudio, SmithyXML.Reader> {
                return { reader in
                    guard reader.content != nil || Mirror(reflecting: self).children.isEmpty else { return nil }
                    var value = EventStreamTestClientTypes.MessageWithAudio()
                    value.exampleHeader = try reader["exampleHeader"].readIfPresent()
                    value.audio = try reader["audio"].readIfPresent(readingClosure: EventStreamTestClientTypes.Audio.readingClosure)
                    return value
                }
            }
        }
        """.trimIndent()
    }

    @Test
    fun `004 closures get generated for nested struct of an event`() {
        val context = setupTests(
            "restxml/xml-event-stream.smithy",
            "com.test#EventStreamTest"
        )
        val contents = TestUtils.getFileContents(
            context.manifest,
            "/Example/models/Audio+Codable.swift"
        )
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
        extension EventStreamTestClientTypes.Audio {

            static func writingClosure(_ value: EventStreamTestClientTypes.Audio?, to writer: SmithyXML.Writer) throws {
                guard let value else { writer.detach(); return }
                try writer["rawAudio"].write(value.rawAudio)
            }

            static var readingClosure: SmithyReadWrite.ReadingClosure<EventStreamTestClientTypes.Audio, SmithyXML.Reader> {
                return { reader in
                    guard reader.content != nil || Mirror(reflecting: self).children.isEmpty else { return nil }
                    var value = EventStreamTestClientTypes.Audio()
                    value.rawAudio = try reader["rawAudio"].readIfPresent()
                    return value
                }
            }
        }
        """.trimIndent()
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
