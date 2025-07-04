$version: "2.0"

namespace aws.smithy.swift.performance

use aws.protocols#restJson1
use aws.api#service

// A service which has a GET operation with waiters defined upon it.
// The acceptor in each waiter serves as subject for unit testing,
// to ensure that the logic in code-generated acceptors works as
// expected.
@service(sdkId: "Performance")
@restJson1
service Performance {
    version: "2022-11-30",
    operations: [GetWidget]
}

@http(uri: "/widget", method: "POST")
operation GetWidget {
    input: IO,
    output: IO
    errors: []
}

structure IO {
    list: TestStructureList
}

list TestStructureList {
    member: TestStructure
}

structure TestStructure {
    int: Integer
    string: String
    bool: Boolean
    ListOfInts: ListOfIntegers
    MapOfDoubles: MapOfDoubles
}

list ListOfIntegers {
    member: Integer
}

map MapOfDoubles {
    key: String
    value: Double
}
