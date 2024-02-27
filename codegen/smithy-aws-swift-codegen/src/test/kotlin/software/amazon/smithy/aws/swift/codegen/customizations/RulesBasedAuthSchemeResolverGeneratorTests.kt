package software.amazon.smithy.aws.swift.codegen.customizations

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.TestContext
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator
import software.amazon.smithy.aws.swift.codegen.restjson.AWSRestJson1ProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.shouldSyntacticSanityCheck
import software.amazon.smithy.aws.traits.protocols.RestJson1Trait

class RulesBasedAuthSchemeResolverGeneratorTests {
    // Note that there's no region field in
    //  auth scheme resolver params despite the service using SigV4 as one of its auth schemes,
    //  because no endpoint ruleset was provided for this test case.
    //  It's assumed in codden that endopint ruleset has the region field contained within.
    @Test
    fun `rules based auth scheme resolver generation test with fake S3 smithy model`() {
        val context = setupTests("rules-based-auth-resolver-test.smithy", "com.test#S3")
        val contents =
            TestContextGenerator.getFileContents(context.manifest, "Example/AuthSchemeResolver.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
"""
public struct S3AuthSchemeResolverParameters: ClientRuntime.AuthSchemeResolverParameters {
    public let operation: String
}

public protocol S3AuthSchemeResolver: ClientRuntime.AuthSchemeResolver {
    // Intentionally empty.
    // This is the parent protocol that all auth scheme resolver implementations of
    // the service S3 must conform to.
}

private struct InternalModeledS3AuthSchemeResolver: S3AuthSchemeResolver {
    public func resolveAuthScheme(params: ClientRuntime.AuthSchemeResolverParameters) throws -> [AuthOption] {
        var validAuthOptions = [AuthOption]()
        guard let serviceParams = params as? S3AuthSchemeResolverParameters else {
            throw ClientError.authError("Service specific auth scheme parameters type must be passed to auth scheme resolver.")
        }
        switch serviceParams.operation {
            case "onlyHttpApiKeyAuth":
                validAuthOptions.append(AuthOption(schemeID: "smithy.api#httpApiKeyAuth"))
            case "onlyHttpApiKeyAuthOptional":
                validAuthOptions.append(AuthOption(schemeID: "smithy.api#httpApiKeyAuth"))
                validAuthOptions.append(AuthOption(schemeID: "smithy.api#noAuth"))
            case "onlyHttpBearerAuth":
                validAuthOptions.append(AuthOption(schemeID: "smithy.api#httpBearerAuth"))
            case "onlyHttpBearerAuthOptional":
                validAuthOptions.append(AuthOption(schemeID: "smithy.api#httpBearerAuth"))
                validAuthOptions.append(AuthOption(schemeID: "smithy.api#noAuth"))
            case "onlyHttpApiKeyAndBearerAuth":
                validAuthOptions.append(AuthOption(schemeID: "smithy.api#httpApiKeyAuth"))
                validAuthOptions.append(AuthOption(schemeID: "smithy.api#httpBearerAuth"))
            case "onlyHttpApiKeyAndBearerAuthReversed":
                validAuthOptions.append(AuthOption(schemeID: "smithy.api#httpBearerAuth"))
                validAuthOptions.append(AuthOption(schemeID: "smithy.api#httpApiKeyAuth"))
            case "onlySigv4Auth":
                var sigV4Option = AuthOption(schemeID: "aws.auth#sigv4")
                sigV4Option.signingProperties.set(key: AttributeKeys.signingName, value: "weather")
                guard let region = serviceParams.region else {
                    throw ClientError.authError("Missing region in auth scheme parameters for SigV4 auth scheme.")
                }
                sigV4Option.signingProperties.set(key: AttributeKeys.signingRegion, value: region)
                validAuthOptions.append(sigV4Option)
            case "onlySigv4AuthOptional":
                var sigV4Option = AuthOption(schemeID: "aws.auth#sigv4")
                sigV4Option.signingProperties.set(key: AttributeKeys.signingName, value: "weather")
                guard let region = serviceParams.region else {
                    throw ClientError.authError("Missing region in auth scheme parameters for SigV4 auth scheme.")
                }
                sigV4Option.signingProperties.set(key: AttributeKeys.signingRegion, value: region)
                validAuthOptions.append(sigV4Option)
                validAuthOptions.append(AuthOption(schemeID: "smithy.api#noAuth"))
            case "onlyCustomAuth":
                validAuthOptions.append(AuthOption(schemeID: "com.test#customAuth"))
            case "onlyCustomAuthOptional":
                validAuthOptions.append(AuthOption(schemeID: "com.test#customAuth"))
                validAuthOptions.append(AuthOption(schemeID: "smithy.api#noAuth"))
            default:
                var sigV4Option = AuthOption(schemeID: "aws.auth#sigv4")
                sigV4Option.signingProperties.set(key: AttributeKeys.signingName, value: "weather")
                guard let region = serviceParams.region else {
                    throw ClientError.authError("Missing region in auth scheme parameters for SigV4 auth scheme.")
                }
                sigV4Option.signingProperties.set(key: AttributeKeys.signingRegion, value: region)
                validAuthOptions.append(sigV4Option)
        }
        return validAuthOptions
    }

    public func constructParameters(context: HttpContext) throws -> ClientRuntime.AuthSchemeResolverParameters {
        return try DefaultS3AuthSchemeResolver().constructParameters(context: context)
    }
}

public struct DefaultS3AuthSchemeResolver: S3AuthSchemeResolver {
    public func resolveAuthScheme(params: ClientRuntime.AuthSchemeResolverParameters) throws -> [AuthOption] {
        var validAuthOptions = [AuthOption]()
        guard let serviceParams = params as? S3AuthSchemeResolverParameters else {
            throw ClientError.authError("Service specific auth scheme parameters type must be passed to auth scheme resolver.")
        }
        let endpointParams = EndpointParams(authSchemeParams: serviceParams)
        let endpoint = try DefaultEndpointResolver().resolve(params: endpointParams)
        guard let authSchemes = endpoint.authSchemes() else {
            return try InternalModeledS3AuthSchemeResolver().resolveAuthScheme(params: params)
        }
        let schemes = try authSchemes.map { (input) -> AWSClientRuntime.AuthScheme in try AWSClientRuntime.AuthScheme(from: input) }
        for scheme in schemes {
            switch scheme {
                case .sigV4(let param):
                    var sigV4Option = AuthOption(schemeID: "aws.auth#sigv4")
                    sigV4Option.signingProperties.set(key: AttributeKeys.signingName, value: param.signingName)
                    sigV4Option.signingProperties.set(key: AttributeKeys.signingRegion, value: param.signingRegion)
                    validAuthOptions.append(sigV4Option)
                case .sigV4A(let param):
                    var sigV4Option = AuthOption(schemeID: "aws.auth#sigv4a")
                    sigV4Option.signingProperties.set(key: AttributeKeys.signingName, value: param.signingName)
                    sigV4Option.signingProperties.set(key: AttributeKeys.signingRegion, value: param.signingRegionSet?[0])
                    validAuthOptions.append(sigV4Option)
                default:
                    throw ClientError.authError("Unknown auth scheme name: \(scheme.name)")
            }
        }
        return validAuthOptions
    }

    public func constructParameters(context: HttpContext) throws -> ClientRuntime.AuthSchemeResolverParameters {
        guard let opName = context.getOperation() else {
            throw ClientError.dataNotFound("Operation name not configured in middleware context for auth scheme resolver params construction.")
        }
        guard let endpointParam = context.attributes.get(key: AttributeKey<EndpointParams>(name: "EndpointParams")) else {
            throw ClientError.dataNotFound("Endpoint param not configured in middleware context for rules-based auth scheme resolver params construction.")
        }
        return S3AuthSchemeResolverParameters(operation: opName)
    }
}
"""
        contents.shouldContainOnlyOnce(expectedContents)
    }

    private fun setupTests(smithyFile: String, serviceShapeId: String): TestContext {
        val context = TestContextGenerator.initContextFrom(smithyFile, serviceShapeId, RestJson1Trait.ID)

        val generator = AWSRestJson1ProtocolGenerator()
        generator.initializeMiddleware(context.ctx)
        generator.generateProtocolClient(context.ctx)
        generator.generateSerializers(context.ctx)
        context.ctx.delegator.flushWriters()
        return context
    }
}
