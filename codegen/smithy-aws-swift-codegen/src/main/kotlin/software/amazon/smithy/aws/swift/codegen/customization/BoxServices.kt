package software.amazon.smithy.aws.swift.codegen.customization

import software.amazon.smithy.codegen.core.CodegenException
import software.amazon.smithy.model.Model
import software.amazon.smithy.model.neighbor.Walker
import software.amazon.smithy.model.shapes.AbstractShapeBuilder
import software.amazon.smithy.model.shapes.BigDecimalShape
import software.amazon.smithy.model.shapes.BigIntegerShape
import software.amazon.smithy.model.shapes.BooleanShape
import software.amazon.smithy.model.shapes.ByteShape
import software.amazon.smithy.model.shapes.DoubleShape
import software.amazon.smithy.model.shapes.FloatShape
import software.amazon.smithy.model.shapes.IntegerShape
import software.amazon.smithy.model.shapes.LongShape
import software.amazon.smithy.model.shapes.MemberShape
import software.amazon.smithy.model.shapes.NumberShape
import software.amazon.smithy.model.shapes.Shape
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.model.shapes.ShortShape
import software.amazon.smithy.model.traits.BoxTrait
import software.amazon.smithy.model.transform.ModelTransformer
import software.amazon.smithy.swift.codegen.SwiftSettings
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.model.isNumberShape
import software.amazon.smithy.utils.ToSmithyBuilder

/**
 * Integration that pre-processes the model to box all unboxed primitives.
 *
 * See: https://github.com/awslabs/aws-sdk-swift/issues/272
 *
 * EC2 incorrectly models primitive shapes as unboxed when they actually
 * need to be boxed for the API to work properly (e.g. sending default values). The
 * rest of these services are at risk of similar behavior because they aren't true coral services
 */
class BoxServices : SwiftIntegration {
    override val order: Byte = -127

    private val serviceIds = listOf(
        "com.amazonaws.ec2#AmazonEC2",
        "com.amazonaws.nimble#nimble",
        "com.amazonaws.amplifybackend#AmplifyBackend",
        "com.amazonaws.apigatewaymanagementapi#ApiGatewayManagementApi",
        "com.amazonaws.apigatewayv2#ApiGatewayV2",
        "com.amazonaws.dataexchange#DataExchange",
        "com.amazonaws.greengrass#Greengrass",
        "com.amazonaws.iot1clickprojects#AWSIoT1ClickProjects",
        "com.amazonaws.kafka#Kafka",
        "com.amazonaws.macie2#Macie2",
        "com.amazonaws.mediaconnect#MediaConnect",
        "com.amazonaws.mediaconvert#MediaConvert",
        "com.amazonaws.medialive#MediaLive",
        "com.amazonaws.mediapackage#MediaPackage",
        "com.amazonaws.mediapackagevod#MediaPackageVod",
        "com.amazonaws.mediatailor#MediaTailor",
        "com.amazonaws.pinpoint#Pinpoint",
        "com.amazonaws.pinpointsmsvoice#PinpointSMSVoice",
        "com.amazonaws.serverlessapplicationrepository#ServerlessApplicationRepository",
        "com.amazonaws.mq#mq",
        "com.amazonaws.schemas#schemas",
    ).map(ShapeId::from)

    override fun enabledForService(model: Model, settings: SwiftSettings): Boolean =
        serviceIds.any { it == settings.service }

    override fun preprocessModel(model: Model, settings: SwiftSettings): Model {
        val serviceClosure = Walker(model).walkShapes(model.expectShape(settings.service))

        return ModelTransformer.create().mapShapes(model) {
            if (it in serviceClosure && !it.id.namespace.startsWith("smithy.api")) {
                boxPrimitives(model, it)
            } else {
                it
            }
        }
    }

    private fun boxPrimitives(model: Model, shape: Shape): Shape {
        val target = when (shape) {
            is MemberShape -> model.expectShape(shape.target)
            else -> shape
        }

        return when {
            shape is MemberShape && target.isPrimitiveShape -> box(shape)
            shape is NumberShape -> boxNumber(shape)
            shape is BooleanShape -> box(shape)
            else -> shape
        }
    }

    private val Shape.isPrimitiveShape: Boolean
        get() = isBooleanShape || isNumberShape

    private fun <T> box(shape: T): Shape where T : Shape, T : ToSmithyBuilder<T> {
        return (shape.toBuilder() as AbstractShapeBuilder<*, T>).addTrait(BoxTrait()).build()
    }

    private fun boxNumber(shape: NumberShape): Shape = when (shape) {
        is ByteShape -> box(shape)
        is IntegerShape -> box(shape)
        is LongShape -> box(shape)
        is ShortShape -> box(shape)
        is FloatShape -> box(shape)
        is DoubleShape -> box(shape)
        is BigDecimalShape -> box(shape)
        is BigIntegerShape -> box(shape)
        else -> throw CodegenException("unhandled numeric shape: $shape")
    }
}
