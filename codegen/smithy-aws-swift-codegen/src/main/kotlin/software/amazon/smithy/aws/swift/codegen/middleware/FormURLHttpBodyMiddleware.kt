///*
// * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// * SPDX-License-Identifier: Apache-2.0.
// */
//
//package software.amazon.smithy.aws.swift.codegen.middleware
//
//import software.amazon.smithy.codegen.core.Symbol
//import software.amazon.smithy.swift.codegen.ClientRuntimeTypes
//import software.amazon.smithy.swift.codegen.Middleware
//import software.amazon.smithy.swift.codegen.SwiftWriter
//import software.amazon.smithy.swift.codegen.integration.HttpBindingDescriptor
//import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
//import software.amazon.smithy.swift.codegen.integration.steps.OperationSerializeStep
//
//class FormURLHttpBodyMiddleware(
//    private val writer: SwiftWriter,
//    ctx: ProtocolGenerator.GenerationContext,
//    inputSymbol: Symbol,
//    outputSymbol: Symbol,
//    outputErrorSymbol: Symbol,
//    requestBindings: List<HttpBindingDescriptor>
//) : Middleware(writer, inputSymbol, OperationSerializeStep(inputSymbol, outputSymbol, outputErrorSymbol)) {
//
//    override val typeName = "${inputSymbol.name}BodyMiddleware"
//
//    override fun generateMiddlewareClosure() {
//        writer.openBlock("do {", "} catch let err {") {
//            writer.write("let encoder = context.getEncoder()")
//            writer.write("let data = try encoder.encode(input.operationInput)")
//            writer.write("let body = \$N.data(data)", ClientRuntimeTypes.Http.HttpBody)
//            writer.write("input.builder.withBody(body)")
//        }
//        writer.indent()
//        writer.write("return .failure(.client(\$N.serializationFailed(err.localizedDescription)))", ClientRuntimeTypes.Core.ClientError)
//        writer.dedent()
//        writer.write("}")
//    }
//
//    override fun generateInit() {
//        writer.write("public init() {}")
//    }
//}
