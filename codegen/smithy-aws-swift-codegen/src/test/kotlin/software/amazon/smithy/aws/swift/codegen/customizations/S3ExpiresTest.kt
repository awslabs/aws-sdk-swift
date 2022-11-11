package software.amazon.smithy.aws.swift.codegen.customizations

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.TestContext
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator
import software.amazon.smithy.aws.swift.codegen.restjson.AWSRestJson1ProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.shouldSyntacticSanityCheck
import software.amazon.smithy.aws.traits.protocols.RestJson1Trait

class S3ExpiresTest {

    @Test
    fun `001 test S3 output members named expires are changed to string type`() {
        val context = setupTests("s3-expires.smithy", "com.amazonaws.s3#S3", "S3")
        val contents = TestContextGenerator.getFileContents(context.manifest, "/Example/models/FooOutputResponse.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            public struct FooOutputResponse: Swift.Equatable {
                public var expires: Swift.String?
                public var payload1: Swift.String?
            
                public init (
                    expires: Swift.String? = nil,
                    payload1: Swift.String? = nil
                )
                {
                    self.expires = expires
                    self.payload1 = payload1
                }
            }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `002 test S3 input members named expires are not changed`() {
        val context = setupTests("s3-expires.smithy", "com.amazonaws.s3#S3", "S3")
        val contents = TestContextGenerator.getFileContents(context.manifest, "/Example/models/FooInput.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            public struct FooInput: Swift.Equatable {
                public var expires: ClientRuntime.Date?
                public var payload1: Swift.String?
            
                public init (
                    expires: ClientRuntime.Date? = nil,
                    payload1: Swift.String? = nil
                )
                {
                    self.expires = expires
                    self.payload1 = payload1
                }
            }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `003 test non-S3 output members named expires are not changed`() {
        val context = setupTests("s3-expires.smithy", "com.amazonaws.s3#Bar", "Bar")
        val contents = TestContextGenerator.getFileContents(context.manifest, "/Example/models/FooOutputResponse.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            public struct FooOutputResponse: Swift.Equatable {
                public var expires: ClientRuntime.Date?
                public var payload1: Swift.String?
            
                public init (
                    expires: ClientRuntime.Date? = nil,
                    payload1: Swift.String? = nil
                )
                {
                    self.expires = expires
                    self.payload1 = payload1
                }
            }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    private fun setupTests(smithyFile: String, serviceShapeId: String, sdkID: String): TestContext {
        val context =
            TestContextGenerator.initContextFrom(smithyFile, serviceShapeId, RestJson1Trait.ID, sdkID, sdkID)

        val generator = AWSRestJson1ProtocolGenerator()
        generator.generateProtocolUnitTests(context.ctx)
        context.ctx.delegator.flushWriters()
        return context
    }
}
