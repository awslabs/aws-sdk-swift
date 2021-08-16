/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.model.node.Node
import software.amazon.smithy.model.node.ObjectNode
import software.amazon.smithy.model.node.StringNode
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.getOrNull
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator

/**
 * Generates a per/service endpoint resolver (internal to the generated SDK) using endpoints.json
 * @param endpointData Parsed endpoints.json [ObjectNode]
 */
class EndpointResolverGenerator(private val endpointData: ObjectNode) {
    fun render(ctx: ProtocolGenerator.GenerationContext) {
        val rootNamespace = ctx.settings.moduleName
        ctx.delegator.useFileWriter("./$rootNamespace/internal/DefaultEndpointResolver.swift") {
            renderResolver(it)
            renderInternalEndpointsModel(ctx, it)
        }
    }

    private fun renderResolver(writer: SwiftWriter) {
        writer.addImport(AWSSwiftDependency.AWS_CLIENT_RUNTIME.target)

        writer.openBlock("struct DefaultEndpointResolver : \$N {", "}", AWSClientRuntimeTypes.Core.EndpointResolver) {
            writer.openBlock("func resolve(serviceId: String, region: String) throws -> \$N {", "}", AWSClientRuntimeTypes.Core.AWSEndpoint) {
                writer.write("return try \$N.resolveEndpoint(partitions: servicePartitions, region: region)", AWSClientRuntimeTypes.Core.AWSEndpoint)
            }
        }
    }

    private fun renderInternalEndpointsModel(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter) {
        val partitionsData = endpointData.expectArrayMember("partitions").getElementsAs(Node::expectObjectNode)

        val partitions = partitionsData.map {
            PartitionNode(ctx.service.endpointPrefix, it)
        }.sortedWith(PartitionNode.comparePartitions)

        writer.addImport(AWSSwiftDependency.AWS_CLIENT_RUNTIME.target)
        writer.write("")
        writer.openBlock("private let servicePartitions = [", "]") {
            partitions.forEach { renderPartition(writer, it) }
        }
    }

    private fun renderPartition(writer: SwiftWriter, partitionNode: PartitionNode) {
        writer.openBlock("\$N(", "),", AWSClientRuntimeTypes.Core.Partition) {
            writer.write("id: \$S,", partitionNode.id)
                .write("regionRegex: \$S,", partitionNode.config.expectStringMember("regionRegex").value)
                .write("partitionEndpoint: \$S,", partitionNode.partitionEndpoint ?: "")
                .write("isRegionalized: \$L,", partitionNode.partitionEndpoint == null)
                .openBlock("defaults: \$N(", "),", AWSClientRuntimeTypes.Core.ServiceEndpointMetadata) {
                    renderServiceEndpointMetadata(writer, partitionNode.defaults)
                }
                .openBlock("endpoints: [", "]") {
                    renderEndpoints(writer, partitionNode)
                }
        }
    }

    private fun renderEndpoints(writer: SwiftWriter, partitionNode: PartitionNode) {
        if (partitionNode.endpoints.members.count() == 0) {
            writer.write(":")
        }
        partitionNode.endpoints.members.forEach {
            val definitionNode = it.value.expectObjectNode()
            if (definitionNode.members.isEmpty()) {
                writer.write("\$S: \$N(),", it.key.value, AWSClientRuntimeTypes.Core.ServiceEndpointMetadata)
            } else {
                writer.openBlock("\$S: \$N(", "),", it.key.value, AWSClientRuntimeTypes.Core.ServiceEndpointMetadata) {
                    renderServiceEndpointMetadata(writer, it.value.expectObjectNode())
                }
            }
        }
    }

    private fun renderServiceEndpointMetadata(writer: SwiftWriter, endpointNode: ObjectNode) {
        val hostname = endpointNode.getStringMember("hostname")
        val protocols = endpointNode.getArrayMember("protocols")
        val credentialScope = endpointNode.getObjectMember("credentialScope")
        val signatureVersions = endpointNode.getArrayMember("signatureVersions")
        hostname.ifPresent {
            val delimiter = if (protocols.isPresent || credentialScope.isPresent || signatureVersions.isPresent) "," else ""
            writer.write("hostName: \$S$delimiter", it)
        }

        protocols.ifPresent {
            writer.writeInline("protocols: [")
            val delimiter = if (it.count() == 1) "" else ", "
            it.forEach {
                writer.writeInline("\$S$delimiter", it.expectStringNode().value)
            }
            val paramDelimiter = if (credentialScope.isPresent || signatureVersions.isPresent) "," else ""
            writer.write("]$paramDelimiter")
        }

        credentialScope.ifPresent {
            writer.writeInline("credentialScope: \$N(", AWSClientRuntimeTypes.Core.CredentialScope)
            val region = it.getStringMember("region")
            val service = it.getStringMember("service")
            region.ifPresent {
                writer.writeInline("region: \$S", it.value)
            }
            if (region.isPresent && service.isPresent) {
                writer.write(", ")
            }
            service.ifPresent {
                writer.writeInline("serviceId: \$S", it.value)
            }
            val paramDelimiter = if (signatureVersions.isPresent) "," else ""
            writer.write(")$paramDelimiter")
        }

        signatureVersions.ifPresent {
            writer.writeInline("signatureVersions: [")
            val delimiter = if (it.count() == 1) "" else ", "
            it.forEach { writer.writeInline("\$S$delimiter", it.expectStringNode().value) }
            writer.write("]")
        }
    }

    private class PartitionNode(endpointPrefix: String, val config: ObjectNode) {
        companion object {
            val comparePartitions = object : Comparator<PartitionNode> {
                override fun compare(x: PartitionNode, y: PartitionNode): Int {
                    // always sort standard aws partition first
                    if (x.id == "aws") return -1
                    return x.id.compareTo(y.id)
                }
            }
        }
        // the partition id/name (e.g. "aws")
        val id = config.expectStringMember("partition").value

        // the node associated with [endpointPrefix] (or empty node)
        val service: ObjectNode = config
            .getObjectMember("services").orElse(Node.objectNode())
            .getObjectMember(endpointPrefix).orElse(Node.objectNode())

        // endpoints belonging to the service with the given [endpointPrefix] (or empty node)
        val endpoints: ObjectNode = service.getObjectMember("endpoints").orElse(Node.objectNode())

        val dnsSuffix: String = config.expectStringMember("dnsSuffix").value

        // service specific defaults
        val defaults: ObjectNode
        init {

            val partitionDefaults = config.expectObjectMember("defaults")
            val serviceDefaults = service.getObjectMember("defaults").orElse(Node.objectNode())
            val mergedDefaults = partitionDefaults.merge(serviceDefaults)

            val hostnameTemplate = mergedDefaults.expectStringMember("hostname").value
                .replace("{service}", endpointPrefix)
                .replace("{dnsSuffix}", dnsSuffix)

            defaults = mergedDefaults.withMember("hostname", hostnameTemplate)
        }

        // regionalized services always use regionalized endpoints
        val partitionEndpoint: String? = if (service.getBooleanMemberOrDefault("isRegionalized", true)) {
            null
        } else {
            service.getStringMember("partitionEndpoint").map(StringNode::getValue).getOrNull()
        }
    }
}
