//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
@testable import Performance
@_spi(SmithyReadWrite) import SmithyReadWrite
@_spi(SmithyReadWrite) import SmithyJSON

typealias TestStructure = PerformanceClientTypes.TestStructure

final class PerformanceTests: XCTestCase {

    static var array10: [TestStructure] = []
    static var data10: Data = Data()
    static var array100: [TestStructure] = []
    static var data100: Data = Data()
    static var array1000: [TestStructure] = []
    static var data1000: Data = Data()

    override static func setUp() {
        (Self.array10, Self.data10) = try! generateData(n: 10)
        (Self.array100, Self.data100) = try! generateData(n: 100)
        (Self.array1000, Self.data1000) = try! generateData(n: 1000)
    }

    // MARK: - Schema performance tests

    func test_schema_10() throws {
        try run_test_schema(original: Self.array10, data: Self.data10)
    }

    func test_schema_100() throws {
        try run_test_schema(original: Self.array100, data: Self.data100)
    }

    func test_schema_1000() throws {
        try run_test_schema(original: Self.array1000, data: Self.data1000)
    }

    func run_test_schema(original: [TestStructure], data: Data, file: StaticString = #file, line: UInt = #line) throws {
        var dup = [TestStructure]()
        measure {
            do {
                let reader = try Reader.from(data: data)
                dup = try reader.readListNonNull(schema: schema__namespace_aws_smithy_swift_performance__name_TestStructureList)
            } catch {
                XCTFail("Threw error: \(error)", file: file, line: line)
            }
        }
        XCTAssert(original == dup)
    }

    // MARK: - ReadWrite performance tests

    func test_readWrite_10() throws {
        try run_test_readWrite(original: Self.array10, data: Self.data10)
    }

    func test_readWrite_100() throws {
        try run_test_readWrite(original: Self.array100, data: Self.data100)
    }

    func test_readWrite_1000() throws {
        try run_test_readWrite(original: Self.array1000, data: Self.data1000)
    }

    func run_test_readWrite(original: [TestStructure], data: Data, file: StaticString = #file, line: UInt = #line) throws {
        var dup = [TestStructure]()
        measure {
            do {
                let reader = try Reader.from(data: data)
                dup = try reader.readList(memberReadingClosure: TestStructure.read(from:), memberNodeInfo: "member", isFlattened: false)
            } catch {
                XCTFail("Threw error: \(error)", file: file, line: line)
            }
        }
        XCTAssert(original == dup)
    }

    // MARK: - Swift Decodable performance tests

    func test_decodable_10() throws {
        try run_test_decodable(original: Self.array10, data: Self.data10)
    }

    func test_decodable_100() throws {
        try run_test_decodable(original: Self.array100, data: Self.data100)
    }

    func test_decodable_1000() throws {
        try run_test_decodable(original: Self.array1000, data: Self.data1000)
    }

    func run_test_decodable(original: [TestStructure], data: Data, file: StaticString = #file, line: UInt = #line) throws {
        var dup = [TestStructure]()
        measure {
            do {
                dup = try JSONDecoder().decode([TestStructure].self, from: data)
            } catch {
                XCTFail("Threw error: \(error)", file: file, line: line)
            }
        }
        XCTAssertEqual(original, dup)
    }

    // MARK: - Test data generation

    private static func generateData(n: Int) throws -> ([TestStructure], Data) {
        let array = (0..<n).map { i in
            let arrayOfInts = (0..<100).map { _ in Int.random(in: 0...1000) }
            let mapOfDoubles = Dictionary(uniqueKeysWithValues: (
                (0..<100).map { _ in (UUID().uuidString, Double.random(in: 0...10)) }
            ))
            return TestStructure(
                bool: Bool.random(),
                int: i,
                listOfInts: arrayOfInts,
                mapOfDoubles: mapOfDoubles,
                string: UUID().uuidString
            )
        }
        let writer = Writer(nodeInfo: "")
        try writer.write(array, with: listWritingClosure(memberWritingClosure: TestStructure.write(value:to:), memberNodeInfo: "member", isFlattened: false))
        let data = try writer.data()
        return (array, data)
    }
}

// MARK: - TestStructure extensions

// Here is TestStructure:

//public struct TestStructure: Swift.Sendable {
//    public var bool: Swift.Bool?
//    public var int: Swift.Int?
//    public var listOfInts: [Swift.Int]?
//    public var mapOfDoubles: [Swift.String: Swift.Double]?
//    public var string: Swift.String?
//}

extension TestStructure {

    static func read(from reader: Reader) throws -> TestStructure {
        guard reader.hasContent else { throw ReaderError.requiredValueNotPresent }
        var value = TestStructure()
        value.int = try reader["int"].readIfPresent()
        value.string = try reader["string"].readIfPresent()
        value.bool = try reader["bool"].readIfPresent()
        value.listOfInts = try reader["ListOfInts"].readListIfPresent(memberReadingClosure: ReadingClosures.readInt(from:), memberNodeInfo: "member", isFlattened: false)
        value.mapOfDoubles = try reader["MapOfDoubles"].readMapIfPresent(valueReadingClosure: ReadingClosures.readDouble(from:), keyNodeInfo: "key", valueNodeInfo: "value", isFlattened: false)
        return value
    }
}

extension TestStructure: Codable {

    public init(from decoder: any Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.int = try container.decodeIfPresent(Int.self, forKey: .int)
        self.string = try container.decodeIfPresent(String.self, forKey: .string)
        self.bool = try container.decodeIfPresent(Bool.self, forKey: .bool)
        self.listOfInts = try container.decodeIfPresent([Int].self, forKey: .listOfInts)
        self.mapOfDoubles = try container.decodeIfPresent([String: Double].self, forKey: .mapOfDoubles)
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(int, forKey: .int)
        try container.encodeIfPresent(string, forKey: .string)
        try container.encodeIfPresent(bool, forKey: .bool)
        try container.encodeIfPresent(listOfInts, forKey: .listOfInts)
        try container.encodeIfPresent(mapOfDoubles, forKey: .mapOfDoubles)
    }

    enum CodingKeys: String, CodingKey {
        case int
        case string
        case bool
        case listOfInts = "ListOfInts"
        case mapOfDoubles = "MapOfDoubles"
    }
}

extension TestStructure: Equatable {

    public static func ==(lhs: PerformanceClientTypes.TestStructure, rhs: PerformanceClientTypes.TestStructure) -> Bool {
        if lhs.int != rhs.int { return false }
        if lhs.string != rhs.string { return false }
        if lhs.bool != rhs.bool { return false }
        if lhs.listOfInts != rhs.listOfInts { return false }
        if lhs.mapOfDoubles != rhs.mapOfDoubles { return false }
        return true
    }
}
