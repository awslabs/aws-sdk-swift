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

    var array: [TestStructure] = []
    var data: Data = Data()

    override func setUp() async throws {
        try await super.setUp()
        self.array = (0..<10000).map { i in
            let arrayOfInts = (0..<10).map { _ in Int.random(in: 0...1000) }
            let mapOfDoubles = Dictionary(
                uniqueKeysWithValues: (
                    (0..<10).map { _ in
                        (
                            UUID().uuidString,
                            Double.random(in: 0.0...1000.0)
                        )
                    }
                )
            )
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
        self.data = try writer.data()
    }

    override func tearDown() async throws {
        self.array = []
        self.data = Data()
        try await super.tearDown()
    }

    func xtest_schema() throws {
        var dup = [TestStructure]()
        measure {
            do {
                let reader = try Reader.from(data: self.data)
                dup = try reader.readListNonNull(schema: schema__namespace_aws_smithy_swift_performance__name_TestStructureList)
            } catch {
                XCTFail("Threw error: \(error)")
            }
        }
        XCTAssert(array == dup)
    }

    func xtest_readWrite() throws {
        var dup = [TestStructure]()
        measure {
            do {
                let reader = try Reader.from(data: self.data)
                dup = try reader.readList(memberReadingClosure: TestStructure.read(from:), memberNodeInfo: "member", isFlattened: false)
            } catch {
                XCTFail("Threw error: \(error)")
            }
        }
        XCTAssert(array == dup)
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
