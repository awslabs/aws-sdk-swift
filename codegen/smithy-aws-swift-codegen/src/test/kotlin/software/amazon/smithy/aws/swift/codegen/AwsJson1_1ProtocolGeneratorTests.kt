package software.amazon.smithy.aws.swift.codegen

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.awsjson.AwsJson1_1_ProtocolGenerator
import software.amazon.smithy.build.MockManifest
import software.amazon.smithy.codegen.core.SymbolProvider
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.swift.codegen.AddOperationShapes
import software.amazon.smithy.swift.codegen.SwiftCodegenPlugin
import software.amazon.smithy.swift.codegen.SwiftDelegator
import software.amazon.smithy.swift.codegen.SwiftSettings
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration

class AwsJson1_1ProtocolGeneratorTests : TestsBase() {
    var model = createModelFromSmithy("awsJson1_1.smithy")

    data class TestContext(
        val ctx: ProtocolGenerator.GenerationContext,
        val manifest: MockManifest,
        val generator: AwsJson1_1_ProtocolGenerator
    )

    private fun newTestContext(): TestContext {
        val manifest = MockManifest()
        val provider: SymbolProvider = SwiftCodegenPlugin.createSymbolProvider(model, "Example", "Example")
        val serviceShapeIdWithNamespace = "com.test#Example"
        val service = model.getShape(ShapeId.from(serviceShapeIdWithNamespace)).get().asServiceShape().get()
        val settings = SwiftSettings.from(model, buildDefaultSwiftSettingsObjectNode(serviceShapeIdWithNamespace))
        model = AddOperationShapes.execute(model, settings.getService(model), settings.moduleName)
        val integrations = mutableListOf<SwiftIntegration>()
        val delegator = SwiftDelegator(settings, model, manifest, provider, integrations)
        val generator = AwsJson1_1_ProtocolGenerator()

        val ctx = ProtocolGenerator.GenerationContext(settings, model, service, provider, integrations, generator.protocol, delegator)
        return TestContext(ctx, manifest, generator)
    }

    val newTestContext = newTestContext()

    init {
        newTestContext.generator.generateSerializers(newTestContext.ctx)
        newTestContext.generator.generateProtocolClient(newTestContext.ctx)
        newTestContext.generator.generateDeserializers(newTestContext.ctx)
        newTestContext.generator.generateProtocolUnitTests(newTestContext.ctx)
        newTestContext.ctx.delegator.flushWriters()
    }

    fun getTestFileContents(namespace: String, filename: String, manifest: MockManifest): String {
        return manifest.expectFileString("${namespace}Tests/$filename")
    }

    @Test
    fun `encodable for KitchenSink`() {
        val contents = getModelFileContents("Example", "KitchenSink+Encodable.swift", newTestContext.manifest)
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
                extension KitchenSink: Encodable, Reflection {
                    private enum CodingKeys: String, CodingKey {
                        case blob = "Blob"
                        case boolean = "Boolean"
                        case double = "Double"
                        case emptyStruct = "EmptyStruct"
                        case float = "Float"
                        case httpdateTimestamp = "HttpdateTimestamp"
                        case integer = "Integer"
                        case iso8601Timestamp = "Iso8601Timestamp"
                        case jsonValue = "JsonValue"
                        case listOfLists = "ListOfLists"
                        case listOfMapsOfStrings = "ListOfMapsOfStrings"
                        case listOfStrings = "ListOfStrings"
                        case listOfStructs = "ListOfStructs"
                        case long = "Long"
                        case mapOfListsOfStrings = "MapOfListsOfStrings"
                        case mapOfMaps = "MapOfMaps"
                        case mapOfStrings = "MapOfStrings"
                        case mapOfStructs = "MapOfStructs"
                        case recursiveList = "RecursiveList"
                        case recursiveMap = "RecursiveMap"
                        case recursiveStruct = "RecursiveStruct"
                        case simpleStruct = "SimpleStruct"
                        case string = "String"
                        case structWithLocationName = "StructWithLocationName"
                        case timestamp = "Timestamp"
                        case unixTimestamp = "UnixTimestamp"
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: CodingKeys.self)
                        if let blob = blob {
                            try container.encode(blob.base64EncodedString(), forKey: .blob)
                        }
                        if let boolean = boolean {
                            try container.encode(boolean, forKey: .boolean)
                        }
                        if let double = double {
                            try container.encode(double, forKey: .double)
                        }
                        if let emptyStruct = emptyStruct {
                            try container.encode(emptyStruct, forKey: .emptyStruct)
                        }
                        if let float = float {
                            try container.encode(float, forKey: .float)
                        }
                        if let httpdateTimestamp = httpdateTimestamp {
                            try container.encode(httpdateTimestamp.rfc5322(), forKey: .httpdateTimestamp)
                        }
                        if let integer = integer {
                            try container.encode(integer, forKey: .integer)
                        }
                        if let iso8601Timestamp = iso8601Timestamp {
                            try container.encode(iso8601Timestamp.iso8601WithoutFractionalSeconds(), forKey: .iso8601Timestamp)
                        }
                        if let jsonValue = jsonValue {
                            try container.encode(jsonValue, forKey: .jsonValue)
                        }
                        if let listOfLists = listOfLists {
                            var listOfListsContainer = container.nestedUnkeyedContainer(forKey: .listOfLists)
                            for listoflistofstrings0 in listOfLists {
                                var listoflistofstrings0Container = listOfListsContainer.nestedUnkeyedContainer()
                                if let listoflistofstrings0 = listoflistofstrings0 {
                                    for listofstrings1 in listoflistofstrings0 {
                                        try listoflistofstrings0Container.encode(listofstrings1)
                                    }
                                }
                            }
                        }
                        if let listOfMapsOfStrings = listOfMapsOfStrings {
                            var listOfMapsOfStringsContainer = container.nestedUnkeyedContainer(forKey: .listOfMapsOfStrings)
                            for listofmapsofstrings0 in listOfMapsOfStrings {
                                var listofmapsofstrings0Container = listOfMapsOfStringsContainer.nestedContainer(keyedBy: Key.self)
                                if let listofmapsofstrings0 = listofmapsofstrings0 {
                                    for (key1, mapofstrings1) in listofmapsofstrings0 {
                                        try listofmapsofstrings0Container.encode(mapofstrings1, forKey: Key(stringValue: key1))
                                    }
                                }
                            }
                        }
                        if let listOfStrings = listOfStrings {
                            var listOfStringsContainer = container.nestedUnkeyedContainer(forKey: .listOfStrings)
                            for listofstrings0 in listOfStrings {
                                try listOfStringsContainer.encode(listofstrings0)
                            }
                        }
                        if let listOfStructs = listOfStructs {
                            var listOfStructsContainer = container.nestedUnkeyedContainer(forKey: .listOfStructs)
                            for listofstructs0 in listOfStructs {
                                try listOfStructsContainer.encode(listofstructs0)
                            }
                        }
                        if let long = long {
                            try container.encode(long, forKey: .long)
                        }
                        if let mapOfListsOfStrings = mapOfListsOfStrings {
                            var mapOfListsOfStringsContainer = container.nestedContainer(keyedBy: Key.self, forKey: .mapOfListsOfStrings)
                            for (key0, mapoflistsofstrings0) in mapOfListsOfStrings {
                                try mapOfListsOfStringsContainer.encode(mapoflistsofstrings0, forKey: Key(stringValue: key0))
                            }
                        }
                        if let mapOfMaps = mapOfMaps {
                            var mapOfMapsContainer = container.nestedContainer(keyedBy: Key.self, forKey: .mapOfMaps)
                            for (key0, mapofmapofstrings0) in mapOfMaps {
                                try mapOfMapsContainer.encode(mapofmapofstrings0, forKey: Key(stringValue: key0))
                            }
                        }
                        if let mapOfStrings = mapOfStrings {
                            var mapOfStringsContainer = container.nestedContainer(keyedBy: Key.self, forKey: .mapOfStrings)
                            for (key0, mapofstrings0) in mapOfStrings {
                                try mapOfStringsContainer.encode(mapofstrings0, forKey: Key(stringValue: key0))
                            }
                        }
                        if let mapOfStructs = mapOfStructs {
                            var mapOfStructsContainer = container.nestedContainer(keyedBy: Key.self, forKey: .mapOfStructs)
                            for (key0, mapofstructs0) in mapOfStructs {
                                try mapOfStructsContainer.encode(mapofstructs0, forKey: Key(stringValue: key0))
                            }
                        }
                        if let recursiveList = recursiveList {
                            var recursiveListContainer = container.nestedUnkeyedContainer(forKey: .recursiveList)
                            for listofkitchensinks0 in recursiveList {
                                try recursiveListContainer.encode(listofkitchensinks0)
                            }
                        }
                        if let recursiveMap = recursiveMap {
                            var recursiveMapContainer = container.nestedContainer(keyedBy: Key.self, forKey: .recursiveMap)
                            for (key0, mapofkitchensinks0) in recursiveMap {
                                try recursiveMapContainer.encode(mapofkitchensinks0, forKey: Key(stringValue: key0))
                            }
                        }
                        if let recursiveStruct = recursiveStruct {
                            try container.encode(recursiveStruct, forKey: .recursiveStruct)
                        }
                        if let simpleStruct = simpleStruct {
                            try container.encode(simpleStruct, forKey: .simpleStruct)
                        }
                        if let string = string {
                            try container.encode(string, forKey: .string)
                        }
                        if let structWithLocationName = structWithLocationName {
                            try container.encode(structWithLocationName, forKey: .structWithLocationName)
                        }
                        if let timestamp = timestamp {
                            try container.encode(timestamp.timeIntervalSince1970, forKey: .timestamp)
                        }
                        if let unixTimestamp = unixTimestamp {
                            try container.encode(unixTimestamp.timeIntervalSince1970, forKey: .unixTimestamp)
                        }
                    }
                }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `encodable for KitchenSinkOperationInput`() {
        val contents = getModelFileContents("Example", "KitchenSinkOperationInput+Encodable.swift", newTestContext.manifest)
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
                extension KitchenSinkOperationInput: Encodable, Reflection {
                    private enum CodingKeys: String, CodingKey {
                        case blob = "Blob"
                        case boolean = "Boolean"
                        case double = "Double"
                        case emptyStruct = "EmptyStruct"
                        case float = "Float"
                        case httpdateTimestamp = "HttpdateTimestamp"
                        case integer = "Integer"
                        case iso8601Timestamp = "Iso8601Timestamp"
                        case jsonValue = "JsonValue"
                        case listOfLists = "ListOfLists"
                        case listOfMapsOfStrings = "ListOfMapsOfStrings"
                        case listOfStrings = "ListOfStrings"
                        case listOfStructs = "ListOfStructs"
                        case long = "Long"
                        case mapOfListsOfStrings = "MapOfListsOfStrings"
                        case mapOfMaps = "MapOfMaps"
                        case mapOfStrings = "MapOfStrings"
                        case mapOfStructs = "MapOfStructs"
                        case recursiveList = "RecursiveList"
                        case recursiveMap = "RecursiveMap"
                        case recursiveStruct = "RecursiveStruct"
                        case simpleStruct = "SimpleStruct"
                        case string = "String"
                        case structWithLocationName = "StructWithLocationName"
                        case timestamp = "Timestamp"
                        case unixTimestamp = "UnixTimestamp"
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: CodingKeys.self)
                        if let blob = blob {
                            try container.encode(blob.base64EncodedString(), forKey: .blob)
                        }
                        if let boolean = boolean {
                            try container.encode(boolean, forKey: .boolean)
                        }
                        if let double = double {
                            try container.encode(double, forKey: .double)
                        }
                        if let emptyStruct = emptyStruct {
                            try container.encode(emptyStruct, forKey: .emptyStruct)
                        }
                        if let float = float {
                            try container.encode(float, forKey: .float)
                        }
                        if let httpdateTimestamp = httpdateTimestamp {
                            try container.encode(httpdateTimestamp.rfc5322(), forKey: .httpdateTimestamp)
                        }
                        if let integer = integer {
                            try container.encode(integer, forKey: .integer)
                        }
                        if let iso8601Timestamp = iso8601Timestamp {
                            try container.encode(iso8601Timestamp.iso8601WithoutFractionalSeconds(), forKey: .iso8601Timestamp)
                        }
                        if let jsonValue = jsonValue {
                            try container.encode(jsonValue, forKey: .jsonValue)
                        }
                        if let listOfLists = listOfLists {
                            var listOfListsContainer = container.nestedUnkeyedContainer(forKey: .listOfLists)
                            for listoflistofstrings0 in listOfLists {
                                var listoflistofstrings0Container = listOfListsContainer.nestedUnkeyedContainer()
                                if let listoflistofstrings0 = listoflistofstrings0 {
                                    for listofstrings1 in listoflistofstrings0 {
                                        try listoflistofstrings0Container.encode(listofstrings1)
                                    }
                                }
                            }
                        }
                        if let listOfMapsOfStrings = listOfMapsOfStrings {
                            var listOfMapsOfStringsContainer = container.nestedUnkeyedContainer(forKey: .listOfMapsOfStrings)
                            for listofmapsofstrings0 in listOfMapsOfStrings {
                                var listofmapsofstrings0Container = listOfMapsOfStringsContainer.nestedContainer(keyedBy: Key.self)
                                if let listofmapsofstrings0 = listofmapsofstrings0 {
                                    for (key1, mapofstrings1) in listofmapsofstrings0 {
                                        try listofmapsofstrings0Container.encode(mapofstrings1, forKey: Key(stringValue: key1))
                                    }
                                }
                            }
                        }
                        if let listOfStrings = listOfStrings {
                            var listOfStringsContainer = container.nestedUnkeyedContainer(forKey: .listOfStrings)
                            for listofstrings0 in listOfStrings {
                                try listOfStringsContainer.encode(listofstrings0)
                            }
                        }
                        if let listOfStructs = listOfStructs {
                            var listOfStructsContainer = container.nestedUnkeyedContainer(forKey: .listOfStructs)
                            for listofstructs0 in listOfStructs {
                                try listOfStructsContainer.encode(listofstructs0)
                            }
                        }
                        if let long = long {
                            try container.encode(long, forKey: .long)
                        }
                        if let mapOfListsOfStrings = mapOfListsOfStrings {
                            var mapOfListsOfStringsContainer = container.nestedContainer(keyedBy: Key.self, forKey: .mapOfListsOfStrings)
                            for (key0, mapoflistsofstrings0) in mapOfListsOfStrings {
                                try mapOfListsOfStringsContainer.encode(mapoflistsofstrings0, forKey: Key(stringValue: key0))
                            }
                        }
                        if let mapOfMaps = mapOfMaps {
                            var mapOfMapsContainer = container.nestedContainer(keyedBy: Key.self, forKey: .mapOfMaps)
                            for (key0, mapofmapofstrings0) in mapOfMaps {
                                try mapOfMapsContainer.encode(mapofmapofstrings0, forKey: Key(stringValue: key0))
                            }
                        }
                        if let mapOfStrings = mapOfStrings {
                            var mapOfStringsContainer = container.nestedContainer(keyedBy: Key.self, forKey: .mapOfStrings)
                            for (key0, mapofstrings0) in mapOfStrings {
                                try mapOfStringsContainer.encode(mapofstrings0, forKey: Key(stringValue: key0))
                            }
                        }
                        if let mapOfStructs = mapOfStructs {
                            var mapOfStructsContainer = container.nestedContainer(keyedBy: Key.self, forKey: .mapOfStructs)
                            for (key0, mapofstructs0) in mapOfStructs {
                                try mapOfStructsContainer.encode(mapofstructs0, forKey: Key(stringValue: key0))
                            }
                        }
                        if let recursiveList = recursiveList {
                            var recursiveListContainer = container.nestedUnkeyedContainer(forKey: .recursiveList)
                            for listofkitchensinks0 in recursiveList {
                                try recursiveListContainer.encode(listofkitchensinks0)
                            }
                        }
                        if let recursiveMap = recursiveMap {
                            var recursiveMapContainer = container.nestedContainer(keyedBy: Key.self, forKey: .recursiveMap)
                            for (key0, mapofkitchensinks0) in recursiveMap {
                                try recursiveMapContainer.encode(mapofkitchensinks0, forKey: Key(stringValue: key0))
                            }
                        }
                        if let recursiveStruct = recursiveStruct {
                            try container.encode(recursiveStruct, forKey: .recursiveStruct)
                        }
                        if let simpleStruct = simpleStruct {
                            try container.encode(simpleStruct, forKey: .simpleStruct)
                        }
                        if let string = string {
                            try container.encode(string, forKey: .string)
                        }
                        if let structWithLocationName = structWithLocationName {
                            try container.encode(structWithLocationName, forKey: .structWithLocationName)
                        }
                        if let timestamp = timestamp {
                            try container.encode(timestamp.timeIntervalSince1970, forKey: .timestamp)
                        }
                        if let unixTimestamp = unixTimestamp {
                            try container.encode(unixTimestamp.timeIntervalSince1970, forKey: .unixTimestamp)
                        }
                    }
                }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `encodable for EmptyStruct`() {
        val contents = getModelFileContents("Example", "EmptyStruct+Encodable.swift", newTestContext.manifest)
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
                extension EmptyStruct: Encodable, Reflection {

                    public func encode(to encoder: Encoder) throws {
                    }
                }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `decodable for EmptyStruct`() {
        val contents = getModelFileContents("Example", "EmptyStruct+Decodable.swift", newTestContext.manifest)
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
                extension EmptyStruct: Decodable {

                    public init (from decoder: Decoder) throws {
                    }
                }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `decodable for KitchenSinkOperationOutputBody`() {
        val contents = getModelFileContents("Example", "KitchenSinkOperationOutputBody+Decodable.swift", newTestContext.manifest)
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
struct KitchenSinkOperationOutputBody: Equatable {
    public let blob: Data?
    public let boolean: Bool?
    public let double: Double?
    public let emptyStruct: EmptyStruct?
    public let float: Float?
    public let httpdateTimestamp: Date?
    public let integer: Int?
    public let iso8601Timestamp: Date?
    public let jsonValue: String?
    public let listOfLists: [[String]?]?
    public let listOfMapsOfStrings: [[String:String]?]?
    public let listOfStrings: [String]?
    public let listOfStructs: [SimpleStruct]?
    public let long: Int?
    public let mapOfListsOfStrings: [String:[String]?]?
    public let mapOfMaps: [String:[String:String]?]?
    public let mapOfStrings: [String:String]?
    public let mapOfStructs: [String:SimpleStruct]?
    public let recursiveList: [KitchenSink]?
    public let recursiveMap: [String:KitchenSink]?
    public let recursiveStruct: KitchenSink?
    public let simpleStruct: SimpleStruct?
    public let string: String?
    public let structWithLocationName: StructWithLocationName?
    public let timestamp: Date?
    public let unixTimestamp: Date?
}

extension KitchenSinkOperationOutputBody: Decodable {
    private enum CodingKeys: String, CodingKey {
        case blob = "Blob"
        case boolean = "Boolean"
        case double = "Double"
        case emptyStruct = "EmptyStruct"
        case float = "Float"
        case httpdateTimestamp = "HttpdateTimestamp"
        case integer = "Integer"
        case iso8601Timestamp = "Iso8601Timestamp"
        case jsonValue = "JsonValue"
        case listOfLists = "ListOfLists"
        case listOfMapsOfStrings = "ListOfMapsOfStrings"
        case listOfStrings = "ListOfStrings"
        case listOfStructs = "ListOfStructs"
        case long = "Long"
        case mapOfListsOfStrings = "MapOfListsOfStrings"
        case mapOfMaps = "MapOfMaps"
        case mapOfStrings = "MapOfStrings"
        case mapOfStructs = "MapOfStructs"
        case recursiveList = "RecursiveList"
        case recursiveMap = "RecursiveMap"
        case recursiveStruct = "RecursiveStruct"
        case simpleStruct = "SimpleStruct"
        case string = "String"
        case structWithLocationName = "StructWithLocationName"
        case timestamp = "Timestamp"
        case unixTimestamp = "UnixTimestamp"
    }

    public init (from decoder: Decoder) throws {
        let containerValues = try decoder.container(keyedBy: CodingKeys.self)
        let blobDecoded = try containerValues.decodeIfPresent(Data.self, forKey: .blob)
        blob = blobDecoded
        let booleanDecoded = try containerValues.decodeIfPresent(Bool.self, forKey: .boolean)
        boolean = booleanDecoded
        let doubleDecoded = try containerValues.decodeIfPresent(Double.self, forKey: .double)
        double = doubleDecoded
        let emptyStructDecoded = try containerValues.decodeIfPresent(EmptyStruct.self, forKey: .emptyStruct)
        emptyStruct = emptyStructDecoded
        let floatDecoded = try containerValues.decodeIfPresent(Float.self, forKey: .float)
        float = floatDecoded
        let httpdateTimestampDateString = try containerValues.decodeIfPresent(String.self, forKey: .httpdateTimestamp)
        var httpdateTimestampDecoded: Date? = nil
        if let httpdateTimestampDateString = httpdateTimestampDateString {
            let httpdateTimestampFormatter = DateFormatter.rfc5322DateFormatter
            httpdateTimestampDecoded = httpdateTimestampFormatter.date(from: httpdateTimestampDateString)
        }
        httpdateTimestamp = httpdateTimestampDecoded
        let integerDecoded = try containerValues.decodeIfPresent(Int.self, forKey: .integer)
        integer = integerDecoded
        let iso8601TimestampDateString = try containerValues.decodeIfPresent(String.self, forKey: .iso8601Timestamp)
        var iso8601TimestampDecoded: Date? = nil
        if let iso8601TimestampDateString = iso8601TimestampDateString {
            let iso8601TimestampFormatter = DateFormatter.iso8601DateFormatterWithoutFractionalSeconds
            iso8601TimestampDecoded = iso8601TimestampFormatter.date(from: iso8601TimestampDateString)
        }
        iso8601Timestamp = iso8601TimestampDecoded
        let jsonValueDecoded = try containerValues.decodeIfPresent(String.self, forKey: .jsonValue)
        jsonValue = jsonValueDecoded
        let listOfListsContainer = try containerValues.decodeIfPresent([[String]?].self, forKey: .listOfLists)
        var listOfListsDecoded0:[[String]?]? = nil
        if let listOfListsContainer = listOfListsContainer {
            listOfListsDecoded0 = [[String]?]()
            for list0 in listOfListsContainer {
                var list0Decoded0 = [String]()
                if let list0 = list0 {
                    for string1 in list0 {
                        list0Decoded0.append(string1)
                    }
                }
                listOfListsDecoded0?.append(list0Decoded0)
            }
        }
        listOfLists = listOfListsDecoded0
        let listOfMapsOfStringsContainer = try containerValues.decodeIfPresent([[String:String]?].self, forKey: .listOfMapsOfStrings)
        var listOfMapsOfStringsDecoded0:[[String:String]?]? = nil
        if let listOfMapsOfStringsContainer = listOfMapsOfStringsContainer {
            listOfMapsOfStringsDecoded0 = [[String:String]?]()
            for map0 in listOfMapsOfStringsContainer {
                var listOfMapsOfStringsContainerDecoded0 = [String:String]()
                if let map0 = map0 {
                    for (key1, string1) in map0 {
                        listOfMapsOfStringsContainerDecoded0[key1] = string1
                    }
                }
                listOfMapsOfStringsDecoded0?.append(listOfMapsOfStringsContainerDecoded0)
            }
        }
        listOfMapsOfStrings = listOfMapsOfStringsDecoded0
        let listOfStringsContainer = try containerValues.decodeIfPresent([String].self, forKey: .listOfStrings)
        var listOfStringsDecoded0:[String]? = nil
        if let listOfStringsContainer = listOfStringsContainer {
            listOfStringsDecoded0 = [String]()
            for string0 in listOfStringsContainer {
                listOfStringsDecoded0?.append(string0)
            }
        }
        listOfStrings = listOfStringsDecoded0
        let listOfStructsContainer = try containerValues.decodeIfPresent([SimpleStruct].self, forKey: .listOfStructs)
        var listOfStructsDecoded0:[SimpleStruct]? = nil
        if let listOfStructsContainer = listOfStructsContainer {
            listOfStructsDecoded0 = [SimpleStruct]()
            for structure0 in listOfStructsContainer {
                listOfStructsDecoded0?.append(structure0)
            }
        }
        listOfStructs = listOfStructsDecoded0
        let longDecoded = try containerValues.decodeIfPresent(Int.self, forKey: .long)
        long = longDecoded
        let mapOfListsOfStringsContainer = try containerValues.decodeIfPresent([String:[String]?].self, forKey: .mapOfListsOfStrings)
        var mapOfListsOfStringsDecoded0: [String:[String]?]? = nil
        if let mapOfListsOfStringsContainer = mapOfListsOfStringsContainer {
            mapOfListsOfStringsDecoded0 = [String:[String]?]()
            for (key0, listofstrings0) in mapOfListsOfStringsContainer {
                var listofstrings0Decoded0 = [String]()
                if let listofstrings0 = listofstrings0 {
                    for string1 in listofstrings0 {
                        listofstrings0Decoded0.append(string1)
                    }
                }
                mapOfListsOfStringsDecoded0?[key0] = listofstrings0Decoded0
            }
        }
        mapOfListsOfStrings = mapOfListsOfStringsDecoded0
        let mapOfMapsContainer = try containerValues.decodeIfPresent([String:[String:String]?].self, forKey: .mapOfMaps)
        var mapOfMapsDecoded0: [String:[String:String]?]? = nil
        if let mapOfMapsContainer = mapOfMapsContainer {
            mapOfMapsDecoded0 = [String:[String:String]?]()
            for (key0, mapofstrings0) in mapOfMapsContainer {
                var mapofstrings0Decoded0 = [String:String]()
                if let mapofstrings0 = mapofstrings0 {
                    for (key1, string1) in mapofstrings0 {
                        mapofstrings0Decoded0[key1] = string1
                    }
                }
                mapOfMapsDecoded0?[key0] = mapofstrings0Decoded0
            }
        }
        mapOfMaps = mapOfMapsDecoded0
        let mapOfStringsContainer = try containerValues.decodeIfPresent([String:String].self, forKey: .mapOfStrings)
        var mapOfStringsDecoded0: [String:String]? = nil
        if let mapOfStringsContainer = mapOfStringsContainer {
            mapOfStringsDecoded0 = [String:String]()
            for (key0, string0) in mapOfStringsContainer {
                mapOfStringsDecoded0?[key0] = string0
            }
        }
        mapOfStrings = mapOfStringsDecoded0
        let mapOfStructsContainer = try containerValues.decodeIfPresent([String:SimpleStruct].self, forKey: .mapOfStructs)
        var mapOfStructsDecoded0: [String:SimpleStruct]? = nil
        if let mapOfStructsContainer = mapOfStructsContainer {
            mapOfStructsDecoded0 = [String:SimpleStruct]()
            for (key0, simplestruct0) in mapOfStructsContainer {
                mapOfStructsDecoded0?[key0] = simplestruct0
            }
        }
        mapOfStructs = mapOfStructsDecoded0
        let recursiveListContainer = try containerValues.decodeIfPresent([KitchenSink].self, forKey: .recursiveList)
        var recursiveListDecoded0:[KitchenSink]? = nil
        if let recursiveListContainer = recursiveListContainer {
            recursiveListDecoded0 = [KitchenSink]()
            for structure0 in recursiveListContainer {
                recursiveListDecoded0?.append(structure0)
            }
        }
        recursiveList = recursiveListDecoded0
        let recursiveMapContainer = try containerValues.decodeIfPresent([String:KitchenSink].self, forKey: .recursiveMap)
        var recursiveMapDecoded0: [String:KitchenSink]? = nil
        if let recursiveMapContainer = recursiveMapContainer {
            recursiveMapDecoded0 = [String:KitchenSink]()
            for (key0, kitchensink0) in recursiveMapContainer {
                recursiveMapDecoded0?[key0] = kitchensink0
            }
        }
        recursiveMap = recursiveMapDecoded0
        let recursiveStructDecoded = try containerValues.decodeIfPresent(KitchenSink.self, forKey: .recursiveStruct)
        recursiveStruct = recursiveStructDecoded
        let simpleStructDecoded = try containerValues.decodeIfPresent(SimpleStruct.self, forKey: .simpleStruct)
        simpleStruct = simpleStructDecoded
        let stringDecoded = try containerValues.decodeIfPresent(String.self, forKey: .string)
        string = stringDecoded
        let structWithLocationNameDecoded = try containerValues.decodeIfPresent(StructWithLocationName.self, forKey: .structWithLocationName)
        structWithLocationName = structWithLocationNameDecoded
        let timestampDecoded = try containerValues.decodeIfPresent(Date.self, forKey: .timestamp)
        timestamp = timestampDecoded
        let unixTimestampDecoded = try containerValues.decodeIfPresent(Date.self, forKey: .unixTimestamp)
        unixTimestamp = unixTimestampDecoded
    }
}
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `decodable for KitchenSink`() {
        val contents = getModelFileContents("Example", "KitchenSink+Decodable.swift", newTestContext.manifest)
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
extension KitchenSink: Decodable {
    private enum CodingKeys: String, CodingKey {
        case blob = "Blob"
        case boolean = "Boolean"
        case double = "Double"
        case emptyStruct = "EmptyStruct"
        case float = "Float"
        case httpdateTimestamp = "HttpdateTimestamp"
        case integer = "Integer"
        case iso8601Timestamp = "Iso8601Timestamp"
        case jsonValue = "JsonValue"
        case listOfLists = "ListOfLists"
        case listOfMapsOfStrings = "ListOfMapsOfStrings"
        case listOfStrings = "ListOfStrings"
        case listOfStructs = "ListOfStructs"
        case long = "Long"
        case mapOfListsOfStrings = "MapOfListsOfStrings"
        case mapOfMaps = "MapOfMaps"
        case mapOfStrings = "MapOfStrings"
        case mapOfStructs = "MapOfStructs"
        case recursiveList = "RecursiveList"
        case recursiveMap = "RecursiveMap"
        case recursiveStruct = "RecursiveStruct"
        case simpleStruct = "SimpleStruct"
        case string = "String"
        case structWithLocationName = "StructWithLocationName"
        case timestamp = "Timestamp"
        case unixTimestamp = "UnixTimestamp"
    }

    public init (from decoder: Decoder) throws {
        let containerValues = try decoder.container(keyedBy: CodingKeys.self)
        let blobDecoded = try containerValues.decodeIfPresent(Data.self, forKey: .blob)
        blob = blobDecoded
        let booleanDecoded = try containerValues.decodeIfPresent(Bool.self, forKey: .boolean)
        boolean = booleanDecoded
        let doubleDecoded = try containerValues.decodeIfPresent(Double.self, forKey: .double)
        double = doubleDecoded
        let emptyStructDecoded = try containerValues.decodeIfPresent(EmptyStruct.self, forKey: .emptyStruct)
        emptyStruct = emptyStructDecoded
        let floatDecoded = try containerValues.decodeIfPresent(Float.self, forKey: .float)
        float = floatDecoded
        let httpdateTimestampDateString = try containerValues.decodeIfPresent(String.self, forKey: .httpdateTimestamp)
        var httpdateTimestampDecoded: Date? = nil
        if let httpdateTimestampDateString = httpdateTimestampDateString {
            let httpdateTimestampFormatter = DateFormatter.rfc5322DateFormatter
            httpdateTimestampDecoded = httpdateTimestampFormatter.date(from: httpdateTimestampDateString)
        }
        httpdateTimestamp = httpdateTimestampDecoded
        let integerDecoded = try containerValues.decodeIfPresent(Int.self, forKey: .integer)
        integer = integerDecoded
        let iso8601TimestampDateString = try containerValues.decodeIfPresent(String.self, forKey: .iso8601Timestamp)
        var iso8601TimestampDecoded: Date? = nil
        if let iso8601TimestampDateString = iso8601TimestampDateString {
            let iso8601TimestampFormatter = DateFormatter.iso8601DateFormatterWithoutFractionalSeconds
            iso8601TimestampDecoded = iso8601TimestampFormatter.date(from: iso8601TimestampDateString)
        }
        iso8601Timestamp = iso8601TimestampDecoded
        let jsonValueDecoded = try containerValues.decodeIfPresent(String.self, forKey: .jsonValue)
        jsonValue = jsonValueDecoded
        let listOfListsContainer = try containerValues.decodeIfPresent([[String]?].self, forKey: .listOfLists)
        var listOfListsDecoded0:[[String]?]? = nil
        if let listOfListsContainer = listOfListsContainer {
            listOfListsDecoded0 = [[String]?]()
            for list0 in listOfListsContainer {
                var list0Decoded0 = [String]()
                if let list0 = list0 {
                    for string1 in list0 {
                        list0Decoded0.append(string1)
                    }
                }
                listOfListsDecoded0?.append(list0Decoded0)
            }
        }
        listOfLists = listOfListsDecoded0
        let listOfMapsOfStringsContainer = try containerValues.decodeIfPresent([[String:String]?].self, forKey: .listOfMapsOfStrings)
        var listOfMapsOfStringsDecoded0:[[String:String]?]? = nil
        if let listOfMapsOfStringsContainer = listOfMapsOfStringsContainer {
            listOfMapsOfStringsDecoded0 = [[String:String]?]()
            for map0 in listOfMapsOfStringsContainer {
                var listOfMapsOfStringsContainerDecoded0 = [String:String]()
                if let map0 = map0 {
                    for (key1, string1) in map0 {
                        listOfMapsOfStringsContainerDecoded0[key1] = string1
                    }
                }
                listOfMapsOfStringsDecoded0?.append(listOfMapsOfStringsContainerDecoded0)
            }
        }
        listOfMapsOfStrings = listOfMapsOfStringsDecoded0
        let listOfStringsContainer = try containerValues.decodeIfPresent([String].self, forKey: .listOfStrings)
        var listOfStringsDecoded0:[String]? = nil
        if let listOfStringsContainer = listOfStringsContainer {
            listOfStringsDecoded0 = [String]()
            for string0 in listOfStringsContainer {
                listOfStringsDecoded0?.append(string0)
            }
        }
        listOfStrings = listOfStringsDecoded0
        let listOfStructsContainer = try containerValues.decodeIfPresent([SimpleStruct].self, forKey: .listOfStructs)
        var listOfStructsDecoded0:[SimpleStruct]? = nil
        if let listOfStructsContainer = listOfStructsContainer {
            listOfStructsDecoded0 = [SimpleStruct]()
            for structure0 in listOfStructsContainer {
                listOfStructsDecoded0?.append(structure0)
            }
        }
        listOfStructs = listOfStructsDecoded0
        let longDecoded = try containerValues.decodeIfPresent(Int.self, forKey: .long)
        long = longDecoded
        let mapOfListsOfStringsContainer = try containerValues.decodeIfPresent([String:[String]?].self, forKey: .mapOfListsOfStrings)
        var mapOfListsOfStringsDecoded0: [String:[String]?]? = nil
        if let mapOfListsOfStringsContainer = mapOfListsOfStringsContainer {
            mapOfListsOfStringsDecoded0 = [String:[String]?]()
            for (key0, listofstrings0) in mapOfListsOfStringsContainer {
                var listofstrings0Decoded0 = [String]()
                if let listofstrings0 = listofstrings0 {
                    for string1 in listofstrings0 {
                        listofstrings0Decoded0.append(string1)
                    }
                }
                mapOfListsOfStringsDecoded0?[key0] = listofstrings0Decoded0
            }
        }
        mapOfListsOfStrings = mapOfListsOfStringsDecoded0
        let mapOfMapsContainer = try containerValues.decodeIfPresent([String:[String:String]?].self, forKey: .mapOfMaps)
        var mapOfMapsDecoded0: [String:[String:String]?]? = nil
        if let mapOfMapsContainer = mapOfMapsContainer {
            mapOfMapsDecoded0 = [String:[String:String]?]()
            for (key0, mapofstrings0) in mapOfMapsContainer {
                var mapofstrings0Decoded0 = [String:String]()
                if let mapofstrings0 = mapofstrings0 {
                    for (key1, string1) in mapofstrings0 {
                        mapofstrings0Decoded0[key1] = string1
                    }
                }
                mapOfMapsDecoded0?[key0] = mapofstrings0Decoded0
            }
        }
        mapOfMaps = mapOfMapsDecoded0
        let mapOfStringsContainer = try containerValues.decodeIfPresent([String:String].self, forKey: .mapOfStrings)
        var mapOfStringsDecoded0: [String:String]? = nil
        if let mapOfStringsContainer = mapOfStringsContainer {
            mapOfStringsDecoded0 = [String:String]()
            for (key0, string0) in mapOfStringsContainer {
                mapOfStringsDecoded0?[key0] = string0
            }
        }
        mapOfStrings = mapOfStringsDecoded0
        let mapOfStructsContainer = try containerValues.decodeIfPresent([String:SimpleStruct].self, forKey: .mapOfStructs)
        var mapOfStructsDecoded0: [String:SimpleStruct]? = nil
        if let mapOfStructsContainer = mapOfStructsContainer {
            mapOfStructsDecoded0 = [String:SimpleStruct]()
            for (key0, simplestruct0) in mapOfStructsContainer {
                mapOfStructsDecoded0?[key0] = simplestruct0
            }
        }
        mapOfStructs = mapOfStructsDecoded0
        let recursiveListContainer = try containerValues.decodeIfPresent([KitchenSink].self, forKey: .recursiveList)
        var recursiveListDecoded0:[KitchenSink]? = nil
        if let recursiveListContainer = recursiveListContainer {
            recursiveListDecoded0 = [KitchenSink]()
            for structure0 in recursiveListContainer {
                recursiveListDecoded0?.append(structure0)
            }
        }
        recursiveList = recursiveListDecoded0
        let recursiveMapContainer = try containerValues.decodeIfPresent([String:KitchenSink].self, forKey: .recursiveMap)
        var recursiveMapDecoded0: [String:KitchenSink]? = nil
        if let recursiveMapContainer = recursiveMapContainer {
            recursiveMapDecoded0 = [String:KitchenSink]()
            for (key0, kitchensink0) in recursiveMapContainer {
                recursiveMapDecoded0?[key0] = kitchensink0
            }
        }
        recursiveMap = recursiveMapDecoded0
        let recursiveStructDecoded = try containerValues.decodeIfPresent(KitchenSink.self, forKey: .recursiveStruct)
        recursiveStruct = recursiveStructDecoded
        let simpleStructDecoded = try containerValues.decodeIfPresent(SimpleStruct.self, forKey: .simpleStruct)
        simpleStruct = simpleStructDecoded
        let stringDecoded = try containerValues.decodeIfPresent(String.self, forKey: .string)
        string = stringDecoded
        let structWithLocationNameDecoded = try containerValues.decodeIfPresent(StructWithLocationName.self, forKey: .structWithLocationName)
        structWithLocationName = structWithLocationNameDecoded
        let timestampDecoded = try containerValues.decodeIfPresent(Date.self, forKey: .timestamp)
        timestamp = timestampDecoded
        let unixTimestampDecoded = try containerValues.decodeIfPresent(Date.self, forKey: .unixTimestamp)
        unixTimestamp = unixTimestampDecoded
    }
}
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `body in KitchenSinkOperationRequestTest`() {
        val contents = getTestFileContents("Example", "KitchenSinkOperationRequestTest.swift", newTestContext.manifest)
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
class KitchenSinkOperationRequestTest: HttpRequestTestBase {
    let host = "my-api.us-east-2.amazonaws.com"
    /// Serializes string shapes
    func testserializes_string_shapes() {
        let expected = buildExpectedHttpRequest(
            method: .post,
            path: "/",
            headers: [
                "Content-Type": "application/x-amz-json-1.1"
            ],
            queryParams: [String](),
            body: ""${'"'}
            {"String":"abc xyz"}
            ""${'"'},
            host: host
        )

        let deserializeMiddleware = expectation(description: "deserializeMiddleware")

        let input = KitchenSinkOperationInput(
            string: "abc xyz"
        )
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .secondsSince1970
        let context = HttpContextBuilder()
                      .withEncoder(value: encoder)
                      .build()
        var operationStack = OperationStack<KitchenSinkOperationInput, KitchenSinkOperationOutput, KitchenSinkOperationError>(id: "serializes_string_shapes")
        operationStack.serializeStep.intercept(position: .before, middleware: KitchenSinkOperationInputHeadersMiddleware())
        operationStack.serializeStep.intercept(position: .before, middleware: KitchenSinkOperationInputQueryItemMiddleware())
        operationStack.serializeStep.intercept(position: .before, middleware: KitchenSinkOperationInputBodyMiddleware())
        operationStack.serializeStep.intercept(position: .before, middleware: ContentTypeMiddleware<KitchenSinkOperationInput, KitchenSinkOperationOutput, KitchenSinkOperationError>(contentType: "application/x-amz-json-1.1"))
        operationStack.buildStep.intercept(position: .before, middleware: ContentLengthMiddleware<KitchenSinkOperationOutput, KitchenSinkOperationError>())
        operationStack.deserializeStep.intercept(position: .after,
                     middleware: MockDeserializeMiddleware<KitchenSinkOperationOutput, KitchenSinkOperationError>(
                             id: "TestDeserializeMiddleware"){ context, actual in
            let requiredHeaders = ["Content-Length"]
            // assert required headers do exist
            for requiredHeader in requiredHeaders {
                XCTAssertTrue(
                    self.headerExists(requiredHeader, in: actual.headers.headers),
                    "Required Header:\(requiredHeader) does not exist in headers"
                )
            }
            self.assertEqual(expected, actual, { (expectedHttpBody, actualHttpBody) -> Void in
                XCTAssertNotNil(actualHttpBody, "The actual HttpBody is nil")
                XCTAssertNotNil(expectedHttpBody, "The expected HttpBody is nil")
                self.extractHttpBodyJSONData(expectedHttpBody!, actualHttpBody!) { expectedData, actualData in
                    do {
                        let decoder = JSONDecoder()
                        let expectedObj = try decoder.decode(KitchenSinkOperationInputBody.self, from: expectedData)
                        let actualObj = try decoder.decode(KitchenSinkOperationInputBody.self, from: actualData)
                        XCTAssertEqual(expectedObj, actualObj)
                    } catch let err {
                        XCTFail("Failed to verify body \(err)")
                    }
                }
            })
            let response = HttpResponse(body: HttpBody.none, statusCode: .ok)
            let mockOutput = try! KitchenSinkOperationOutput(httpResponse: response, decoder: nil)
            let output = OperationOutput<KitchenSinkOperationOutput, KitchenSinkOperationError>(httpResponse: response, output: mockOutput)
            deserializeMiddleware.fulfill()
            return .success(output)
        })
        _ = operationStack.handleMiddleware(context: context, input: input, next: MockHandler(){ (context, request) in
            XCTFail("Deserialize was mocked out, this should fail")
            return .failure(try! MockMiddlewareError(httpResponse: HttpResponse(body: .none, statusCode: .badRequest)))
        })
        wait(for: [deserializeMiddleware], timeout: 0.3)
    }
    /// Serializes string shapes with jsonvalue trait
    func testserializes_string_shapes_with_jsonvalue_trait() {
        let expected = buildExpectedHttpRequest(
            method: .post,
            path: "/",
            headers: [
                "Content-Type": "application/x-amz-json-1.1"
            ],
            queryParams: [String](),
            body: ""${'"'}
            {"JsonValue":"{\\"string\\":\\"value\\",\\"number\\":1234.5,\\"boolTrue\\":true,\\"boolFalse\\":false,\\"array\\":[1,2,3,4],\\"object\\":{\\"key\\":\\"value\\"},\\"null\\":null}"}
            ""${'"'},
            host: host
        )

        let deserializeMiddleware = expectation(description: "deserializeMiddleware")

        let input = KitchenSinkOperationInput(
            jsonValue: "{\"string\":\"value\",\"number\":1234.5,\"boolTrue\":true,\"boolFalse\":false,\"array\":[1,2,3,4],\"object\":{\"key\":\"value\"},\"null\":null}"
        )
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .secondsSince1970
        let context = HttpContextBuilder()
                      .withEncoder(value: encoder)
                      .build()
        var operationStack = OperationStack<KitchenSinkOperationInput, KitchenSinkOperationOutput, KitchenSinkOperationError>(id: "serializes_string_shapes_with_jsonvalue_trait")
        operationStack.serializeStep.intercept(position: .before, middleware: KitchenSinkOperationInputHeadersMiddleware())
        operationStack.serializeStep.intercept(position: .before, middleware: KitchenSinkOperationInputQueryItemMiddleware())
        operationStack.serializeStep.intercept(position: .before, middleware: KitchenSinkOperationInputBodyMiddleware())
        operationStack.serializeStep.intercept(position: .before, middleware: ContentTypeMiddleware<KitchenSinkOperationInput, KitchenSinkOperationOutput, KitchenSinkOperationError>(contentType: "application/x-amz-json-1.1"))
        operationStack.buildStep.intercept(position: .before, middleware: ContentLengthMiddleware<KitchenSinkOperationOutput, KitchenSinkOperationError>())
        operationStack.deserializeStep.intercept(position: .after,
                     middleware: MockDeserializeMiddleware<KitchenSinkOperationOutput, KitchenSinkOperationError>(
                             id: "TestDeserializeMiddleware"){ context, actual in
            let requiredHeaders = ["Content-Length"]
            // assert required headers do exist
            for requiredHeader in requiredHeaders {
                XCTAssertTrue(
                    self.headerExists(requiredHeader, in: actual.headers.headers),
                    "Required Header:\(requiredHeader) does not exist in headers"
                )
            }
            self.assertEqual(expected, actual, { (expectedHttpBody, actualHttpBody) -> Void in
                XCTAssertNotNil(actualHttpBody, "The actual HttpBody is nil")
                XCTAssertNotNil(expectedHttpBody, "The expected HttpBody is nil")
                self.extractHttpBodyJSONData(expectedHttpBody!, actualHttpBody!) { expectedData, actualData in
                    do {
                        let decoder = JSONDecoder()
                        let expectedObj = try decoder.decode(KitchenSinkOperationInputBody.self, from: expectedData)
                        let actualObj = try decoder.decode(KitchenSinkOperationInputBody.self, from: actualData)
                        XCTAssertEqual(expectedObj, actualObj)
                    } catch let err {
                        XCTFail("Failed to verify body \(err)")
                    }
                }
            })
            let response = HttpResponse(body: HttpBody.none, statusCode: .ok)
            let mockOutput = try! KitchenSinkOperationOutput(httpResponse: response, decoder: nil)
            let output = OperationOutput<KitchenSinkOperationOutput, KitchenSinkOperationError>(httpResponse: response, output: mockOutput)
            deserializeMiddleware.fulfill()
            return .success(output)
        })
        _ = operationStack.handleMiddleware(context: context, input: input, next: MockHandler(){ (context, request) in
            XCTFail("Deserialize was mocked out, this should fail")
            return .failure(try! MockMiddlewareError(httpResponse: HttpResponse(body: .none, statusCode: .badRequest)))
        })
        wait(for: [deserializeMiddleware], timeout: 0.3)
    }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `timestamps in KitchenSinkOperationRequestTest`() {
        val contents = getTestFileContents("Example", "KitchenSinkOperationResponseTest.swift", newTestContext.manifest)
        contents.shouldSyntacticSanityCheck()
        contents.shouldContainOnlyOnce("{\"HttpdateTimestamp\":\"Sun, 02 Jan 2000 20:34:56 GMT\"}")
        contents.shouldContainOnlyOnce("{\"Iso8601Timestamp\":\"2000-01-02T20:34:56Z\"}")
    }
}
