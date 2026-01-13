/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.aws.swift.codegen.middleware.AWSOperationEndpointResolverMiddleware
import software.amazon.smithy.aws.swift.codegen.middleware.UserAgentMiddleware
import software.amazon.smithy.aws.swift.codegen.protocols.awsjson.AWSJSON1_0ProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.protocols.awsjson.AWSJSON1_1ProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.protocols.awsquery.AWSQueryProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.protocols.ec2query.EC2QueryProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.protocols.restjson.AWSRestJson1ProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.protocols.restxml.RestXMLProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.protocols.rpcv2cbor.AWSRpcV2CborCustomizations
import software.amazon.smithy.aws.swift.codegen.swiftmodules.AWSSDKRPCv2CBORTypes
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.protocols.rpcv2cbor.RpcV2CborProtocolGenerator

/**
 * Integration that registers protocol generators this package provides
 */
class AddProtocols : SwiftIntegration {
    /**
     * Gets the sort order of the customization from -128 to 127, with lowest
     * executed first.
     *
     * @return Returns the sort order, defaults to -10.
     */
    override val order: Byte = -10

    override val protocolGenerators: List<ProtocolGenerator>
        get() {
            // Configure smithy-swift RPCv2CBOR for use with AWS
            val cborProtocol = RpcV2CborProtocolGenerator(
                customizations = AWSRpcV2CborCustomizations(),
                operationEndpointResolverMiddlewareFactory = { ctx, endpointMiddlewareSymbol ->
                    AWSOperationEndpointResolverMiddleware(ctx, endpointMiddlewareSymbol)
                },
                userAgentMiddlewareFactory = { ctx ->
                    UserAgentMiddleware(
                        ctx.settings,
                    )
                },
            )
            cborProtocol.configuratorSymbol = AWSSDKRPCv2CBORTypes.Configurator

            // Return the list of all supported protocols
            return listOf(
                AWSRestJson1ProtocolGenerator(),
                AWSJSON1_0ProtocolGenerator(),
                AWSJSON1_1ProtocolGenerator(),
                RestXMLProtocolGenerator(),
                AWSQueryProtocolGenerator(),
                EC2QueryProtocolGenerator(),
                cborProtocol
            )
        }
}
