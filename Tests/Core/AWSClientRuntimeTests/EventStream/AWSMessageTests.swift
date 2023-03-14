//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import ClientRuntime
@testable import AWSClientRuntime

final class AWSMessageTests: XCTestCase {
    func testType_NormalMessage() {
        let message = EventStream.Message(headers: [.init(name: ":message-type", value: .string("event")),
                                                    .init(name: ":event-type", value: .string("Foo")),
                                                    .init(name: ":content-type", value: .string("application/json"))],
                                          payload: "test".data(using: .utf8)!)

        guard case let .event(param)  = try! message.type() else {
            XCTFail()
            return
        }

        XCTAssertEqual(param.eventType, "Foo")
        XCTAssertEqual(param.contentType, "application/json")
    }

    func testType_ExceptionMessage() {
        let message = EventStream.Message(headers: [.init(name: ":message-type", value: .string("exception")),
                                                    .init(name: ":exception-type", value: .string("BadRequestException")),
                                                    .init(name: ":content-type", value: .string("application/json"))],
                                          payload: "test".data(using: .utf8)!)

        guard case let .exception(param)  = try! message.type() else {
            XCTFail()
            return
        }

        XCTAssertEqual(param.exceptionType, "BadRequestException")
        XCTAssertEqual(param.contentType, "application/json")
    }

    func testType_MissingExceptionType() {
        let message = EventStream.Message(headers: [.init(name: ":message-type", value: .string("exception")),
                                                    .init(name: ":content-type", value: .string("application/json"))],
                                          payload: "test".data(using: .utf8)!)

        XCTAssertThrowsError(try message.type()) { error in
            guard case let AWSEventStreamError.invalidMessage(message) = error else {
                XCTFail()
                return
            }

            XCTAssertEqual("Invalid `exception` message: `:exception-type` header is missing", message)
        }
    }

    func testType_MissingEventType() {
        let message = EventStream.Message(headers: [.init(name: ":message-type", value: .string("event")),
                                                    .init(name: ":content-type", value: .string("application/json"))],
                                          payload: "test".data(using: .utf8)!)

        XCTAssertThrowsError(try message.type()) { error in
            guard case let AWSEventStreamError.invalidMessage(message) = error else {
                XCTFail()
                return
            }

            XCTAssertEqual("Invalid `event` message: `:event-type` header is missing", message)
        }
    }

    func testType_MissingMessageType() {
        let message = EventStream.Message(headers: [.init(name: ":event-type", value: .string("Foo")),
                                                    .init(name: ":content-type", value: .string("application/json"))],
                                          payload: "test".data(using: .utf8)!)

        XCTAssertThrowsError(try message.type()) { error in
            guard case let AWSEventStreamError.invalidMessage(message) = error else {
                XCTFail()
                return
            }

            XCTAssertEqual("Invalid `event` message: `:message-type` header is missing", message)
        }
    }

    func testType_MissingContentType() {
        let message = EventStream.Message(headers: [.init(name: ":message-type", value: .string("event")),
                                                    .init(name: ":event-type", value: .string("Foo"))],
                                          payload: "test".data(using: .utf8)!)

        guard case let .event(param)  = try! message.type() else {
            XCTFail()
            return
        }

        XCTAssertEqual(param.eventType, "Foo")
        XCTAssertNil(param.contentType)
    }

    func testType_ErrorMessage() {
        let message = EventStream.Message(headers: [.init(name: ":message-type", value: .string("error")),
                                                    .init(name: ":error-code", value: .string("InternalError")),
                                                    .init(name: ":error-message", value: .string("An internal server error occurred"))],
                                          payload: "test".data(using: .utf8)!)

        guard case let .error(param)  = try! message.type() else {
            XCTFail()
            return
        }

        XCTAssertEqual(param.errorCode, "InternalError")
        XCTAssertEqual(param.message, "An internal server error occurred")
    }

    func testType_MissingErrorMessage() {
        let message = EventStream.Message(headers: [.init(name: ":message-type", value: .string("error")),
                                                    .init(name: ":error-code", value: .string("InternalError"))],
                                          payload: "test".data(using: .utf8)!)

        guard case let .error(param)  = try! message.type() else {
            XCTFail()
            return
        }

        XCTAssertEqual(param.errorCode, "InternalError")
        XCTAssertNil(param.message)
    }

    func testType_Unknown() {
        let message = EventStream.Message(headers: [.init(name: ":message-type", value: .string("foo"))])

        guard case let .unknown(messageType)  = try! message.type() else {
            XCTFail()
            return
        }

        XCTAssertEqual(messageType, "foo")
    }
}
