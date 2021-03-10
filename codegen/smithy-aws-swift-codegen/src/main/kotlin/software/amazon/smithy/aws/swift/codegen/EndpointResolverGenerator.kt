package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.model.node.Node
import software.amazon.smithy.model.node.ObjectNode
import software.amazon.smithy.model.node.StringNode
import software.amazon.smithy.swift.codegen.SwiftWriter
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

        writer.openBlock("struct DefaultEndpointResolver : EndpointResolver {", "}") {
            writer.openBlock("func resolve(serviceId: String, region: String) throws -> AWSEndpoint {", "}") {
                writer.write("return try AWSEndpoint.resolveEndpoint(partitions: servicePartitions, region: region)")
            }
        }
    }

    private fun renderInternalEndpointsModel(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter) {
        val partitionsData = endpointData.expectArrayMember("partitions").getElementsAs(Node::expectObjectNode)

        val comparePartitions = object : Comparator<PartitionNode> {
            override fun compare(x: PartitionNode, y: PartitionNode): Int {
                // always sort standard aws partition first
                if (x.id == "aws") return -1
                return x.id.compareTo(y.id)
            }
        }

        val partitions = partitionsData.map {
            PartitionNode(ctx.service.endpointPrefix, it)
        }.sortedWith(comparePartitions)

        writer.addImport(AWSSwiftDependency.AWS_CLIENT_RUNTIME.target)
        writer.write("")
        writer.openBlock("private let servicePartitions = [", "]") {
            partitions.forEach { renderPartition(writer, it) }
        }
    }

    private fun renderPartition(writer: SwiftWriter, partitionNode: PartitionNode) {
        writer.openBlock("Partition(", "),") {
            writer.write("id: \$S,", partitionNode.id)
                .write("regionRegex: \$S,", partitionNode.config.expectStringMember("regionRegex").value)
                .write("partitionEndpoint: \$S,", partitionNode.partitionEndpoint ?: "")
                .write("isRegionalized: \$L,", partitionNode.partitionEndpoint == null)
                .openBlock("defaults: ServiceEndpointMetadata(", "),") {
                    renderEndpointDefinition(writer, partitionNode.defaults)
                }
                .openBlock("endpoints: [", "]") {
                    if (partitionNode.endpoints.members.count() == 0) {
                        writer.write(":")
                    }
                    partitionNode.endpoints.members.forEach {
                        val definitionNode = it.value.expectObjectNode()
                        if (definitionNode.members.isEmpty()) {
                            writer.write("\$S: ServiceEndpointMetadata(),", it.key.value)
                        } else {
                            writer.openBlock("\$S: ServiceEndpointMetadata(", "),", it.key.value) {
                                renderEndpointDefinition(writer, it.value.expectObjectNode())
                            }
                        }
                    }
                }
        }
    }

    private fun renderEndpointDefinition(writer: SwiftWriter, endpointNode: ObjectNode) {
        endpointNode.getStringMember("hostname").ifPresent {
            writer.write("hostName: \$S,", it)
        }

        endpointNode.getArrayMember("protocols").ifPresent {
            writer.writeInline("protocols: [")
            val delimiter = if (it.count() == 1) "" else ", "
            it.forEach {
                writer.writeInline("\"\$L$delimiter\"", it.expectStringNode().value)
            }
            writer.write("],")
        }

        endpointNode.getObjectMember("credentialScope").ifPresent {
            writer.writeInline("credentialScope: CredentialScope(")
            it.getStringMember("region").ifPresent {
                writer.writeInline("region: \$S,", it.value)
            }
            it.getStringMember("service").ifPresent {
                writer.writeInline("serviceId: \$S", it.value)
            }
            writer.write("),")
        }

        endpointNode.getArrayMember("signatureVersions").ifPresent {
            writer.writeInline("signatureVersions: [")
            val delimiter = if (it.count() == 1) "" else ", "
            it.forEach { writer.writeInline("\$S$delimiter", it.expectStringNode().value) }
            writer.write("]")
        }
    }

    private class PartitionNode(endpointPrefix: String, val config: ObjectNode) {
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
            service.getStringMember("partitionEndpoint").map(StringNode::getValue).get()
        }
    }
}
