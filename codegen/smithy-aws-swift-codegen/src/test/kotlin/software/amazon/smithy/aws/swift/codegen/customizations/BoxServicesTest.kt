package software.amazon.smithy.aws.swift.codegen.customizations

import org.junit.jupiter.api.Assertions.assertFalse
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.awsjson.AwsJson1_0_ProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.customization.BoxServices
import software.amazon.smithy.aws.swift.codegen.newTestContext
import software.amazon.smithy.aws.swift.codegen.toSmithyModel
import software.amazon.smithy.model.shapes.StructureShape
import software.amazon.smithy.model.traits.BoxTrait
import software.amazon.smithy.swift.codegen.model.AddOperationShapes
import software.amazon.smithy.swift.codegen.model.expectShape
import software.amazon.smithy.swift.codegen.model.hasTrait
import software.amazon.smithy.swift.codegen.model.isNumberShape

class BoxServicesTest {
    @Test
    fun testPrimitiveShapesAreBoxed() {
        val smithy = """
            namespace com.test
            service Example { 
                version: "1.0.0",
                operations: [Foo]
            }
            
            operation Foo {
                input: Primitives
            }
            
            structure Primitives {
                int: PrimitiveInteger,
                bool: PrimitiveBoolean,
                long: PrimitiveLong,
                double: PrimitiveDouble,
                boxedAlready: BoxedField,
                notBoxed: NotBoxedField,
                other: Other
            }
            
            @box
            integer BoxedField
            
            structure Other {}
            
            integer NotBoxedField
        """
        val model = smithy.toSmithyModel()
        val ctx = model.newTestContext("com.test#Example", AwsJson1_0_ProtocolGenerator()).ctx
        val operationTransform = AddOperationShapes.execute(model, ctx.service, ctx.settings.moduleName)
        val transformed = BoxServices().preprocessModel(operationTransform, ctx.settings)

        // get the synthetic input which is the one that will be transformed
        val struct = transformed.expectShape<StructureShape>("smithy.swift.synthetic#FooInput")
        struct.members().forEach {
            val target = transformed.expectShape(it.target)
            if (target.isBooleanShape || target.isNumberShape) {
                assertTrue(it.hasTrait<BoxTrait>())
            } else {
                assertFalse(target.hasTrait<BoxTrait>())
                assertFalse(it.hasTrait<BoxTrait>())
            }
        }
    }
}
