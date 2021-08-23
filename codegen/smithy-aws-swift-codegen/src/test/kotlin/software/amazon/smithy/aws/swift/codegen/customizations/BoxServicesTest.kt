package software.amazon.smithy.aws.swift.codegen.customizations

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
                notPrimitive: NotPrimitiveField,
                other: Other
            }
            
            @box
            integer BoxedField
            
            structure Other {}
            
            integer NotPrimitiveField
        """
        val model = smithy.toSmithyModel()
        val ctx = model.newTestContext("com.test#Example", AwsJson1_0_ProtocolGenerator()).ctx
        val operationTransform = AddOperationShapes.execute(model, ctx.service, ctx.settings.moduleName)
        val transformed = BoxServices().preprocessModel(operationTransform, ctx.settings)

        // get the synthetic input which is the one that will be transformed
        val struct = transformed.expectShape<StructureShape>("smithy.swift.synthetic#FooInput")
        val intMember = struct.getMember("int")
        val boolMember = struct.getMember("bool")
        val longMember = struct.getMember("long")
        val notPrimitiveMember = struct.getMember("notPrimitive")
        assertTrue(intMember.get().hasTrait<BoxTrait>())
        assertTrue(boolMember.get().hasTrait<BoxTrait>())
        assertTrue(longMember.get().hasTrait<BoxTrait>())
        assertTrue(notPrimitiveMember.get().hasTrait<BoxTrait>())
    }
}
