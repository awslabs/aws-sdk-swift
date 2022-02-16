/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.aws.swift.codegen.AWSClientRuntimeTypes
import software.amazon.smithy.aws.swift.codegen.AWSClientRuntimeTypes.Signing.SigV4Config
import software.amazon.smithy.aws.traits.auth.SigV4Trait
import software.amazon.smithy.aws.traits.auth.UnsignedPayloadTrait
import software.amazon.smithy.codegen.core.SymbolProvider
import software.amazon.smithy.model.Model
import software.amazon.smithy.model.knowledge.ServiceIndex
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.model.traits.OptionalAuthTrait
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.middlewares.handlers.MiddlewareShapeUtils
import software.amazon.smithy.swift.codegen.middleware.MiddlewarePosition
import software.amazon.smithy.swift.codegen.middleware.MiddlewareRenderable
import software.amazon.smithy.swift.codegen.middleware.MiddlewareStep
import software.amazon.smithy.swift.codegen.model.expectTrait
import software.amazon.smithy.swift.codegen.model.hasTrait

typealias AWSSigningMiddlewareParamsCallback = (OperationShape) -> String

open class AWSSigningMiddleware(
    private val paramsCallback: AWSSigningMiddlewareParamsCallback? = null,
    val model: Model,
    val symbolProvider: SymbolProvider
) : MiddlewareRenderable {

    override val name = "AWSSigningMiddleware"

    override val middlewareStep = MiddlewareStep.FINALIZESTEP

    override val position = MiddlewarePosition.BEFORE

    override fun render(
        writer: SwiftWriter,
        op: OperationShape,
        operationStackName: String,
    ) {
        renderConfigDeclaration(writer, op)
        val output = MiddlewareShapeUtils.outputSymbol(symbolProvider, model, op)
        val outputError = MiddlewareShapeUtils.outputErrorSymbol(op)
        writer.write(
            "$operationStackName.${middlewareStep.stringValue()}.intercept(position: ${position.stringValue()}, middleware: \$N<\$N, \$N>(config: sigv4Config))",
            AWSClientRuntimeTypes.Signing.SigV4Middleware, output, outputError
        )
    }

    private fun renderConfigDeclaration(writer: SwiftWriter, op: OperationShape) {
        writer.addImport(SigV4Config)
        writer.write("let sigv4Config = \$N(${middlewareParamsString(op)})", SigV4Config)
    }

    private fun middlewareParamsString(op: OperationShape): String {
        paramsCallback?.let {
            return it(op)
        } ?: run {
            val hasUnsignedPayload = op.hasTrait<UnsignedPayloadTrait>()
            return "unsignedBody: $hasUnsignedPayload"
        }
    }

    companion object {
        /**
         * Returns if the SigV4Trait is a auth scheme supported by the service.
         *
         * @param model        model definition
         * @param serviceShape service shape for the API
         * @return if the SigV4 trait is used by the service.
         */
        fun isSupportedAuthentication(model: Model, serviceShape: ServiceShape): Boolean =
            ServiceIndex
                .of(model)
                .getAuthSchemes(serviceShape)
                .values
                .any { it.javaClass == SigV4Trait::class.java }
        /**
         * Get the SigV4Trait auth name to sign request for
         *
         * @param serviceShape service shape for the API
         * @return the service name to use in the credential scope to sign for
         */
        fun signingServiceName(serviceShape: ServiceShape): String {
            val sigv4Trait = serviceShape.expectTrait<SigV4Trait>()
            return sigv4Trait.name
        }

        /**
         * Returns if the SigV4Trait is an auth scheme for the service and operation.
         *
         * @param model     model definition
         * @param service   service shape for the API
         * @param operation operation shape
         * @return if SigV4Trait is an auth scheme for the operation and service.
         */
        fun hasSigV4AuthScheme(model: Model, service: ServiceShape, operation: OperationShape): Boolean {
            val auth = ServiceIndex.of(model).getEffectiveAuthSchemes(service.id, operation.id)
            return auth.containsKey(SigV4Trait.ID) && !operation.hasTrait<OptionalAuthTrait>()
        }
    }
}
