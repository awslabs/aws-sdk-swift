//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime

extension EventStream {
    /// The type of the `EventStream.Message`
    /// It allows for the message to be decoded into the correct type.
    public enum MessageType {
        /// Represents an `event` message type.
        /// All events include the headers
        /// `:message-type`: Always `event`
        /// `:event-type`: (Required) Identifies the event shape from the event stream union.
        ///     This is the member name from the union.
        /// `:content-type`: (Optional) Identifies the content type of the event payload.
        /// Example:
        /// ```
        ///     :message-type: event
        ///     :event-type: MyStruct
        ///     :content-type: application/json
        /// ```
        case event(EventParams)

        /// Represents an `exception` message type.
        /// All exceptions include the headers
        /// `:message-type`: Always `exception`
        /// `:exception-type`: (Required) Identifies the exception shape from the event stream union.
        ///     This is the member name from the union.
        /// `:content-type`: (Optional) Identifies the content type of the exception payload.
        /// Example:
        /// ```
        ///     :message-type: exception
        ///     :exception-type: FooException
        ///     :content-type: application/json
        /// ```
        case exception(ExceptionParams)

        /// Represents an `error` message type.
        /// Errors are like exceptions, but they are not modeled and have fixed
        /// set of fields.
        /// All errors include the headers
        /// `:message-type`: Always `error`
        /// `:error-code`: (Required) Identifies the error code.
        /// `:error-message`: (Optional) Identifies the error message.
        /// Example:
        /// ```
        ///     :message-type: error
        ///     :error-code: InternalServerError
        ///     :error-message: An internal server error occurred
        /// ```
        case error(ErrorParams)

        /// Represents an unknown message type.
        /// This is used when the message type is not recognized.
        case unknown(messageType: String)

        /// Represents associated type parameter for `event` message type.
        public struct EventParams {
            /// Event type name defined in the event stream union.
            /// eg. `MyStruct`
            public let eventType: String

            /// Content type of the event payload.
            /// This can be used to deserialize the payload.
            /// eg. `application/json`
            public let contentType: String?
        }

        /// Represents associated type parameter for `exception` message type.
        public struct ExceptionParams {
            /// Exception type name defined in the event stream union.
            /// eg. `FooException`
            public let exceptionType: String

            /// Content type of the exception payload.
            /// This can be used to deserialize the payload.
            /// eg. `application/json`
            public let contentType: String?
        }

        /// Represents associated type parameter for `error` message type.
        public struct ErrorParams {
            /// Error code which identifies the error.
            /// This may not be defined in the service model.
            /// eg. `InternalServerError`
            public let errorCode: String

            /// Human readable error message.
            /// eg. `An internal server error occurred`
            public let message: String?
        }
    }
}

extension EventStream.Message {
    /// Parses the protocol level headers into a `MessageType`
    public func type() throws -> EventStream.MessageType {
        let headersByName = Dictionary(grouping: headers, by: \.name)
        // look for messageType header
        guard let messageTypeHeader = headersByName[":message-type"]?.first,
              case let .string(messageType) = messageTypeHeader.value else {
            throw AWSEventStreamError.invalidMessage("Invalid `event` message: `:message-type` header is missing")
        }

        switch messageType {
        case "event":
            guard let eventTypeHeader = headersByName[":event-type"]?.first,
                    case let .string(eventType) = eventTypeHeader.value else {
                throw AWSEventStreamError.invalidMessage("Invalid `event` message: `:event-type` header is missing")
            }

            let contentType: String?
            if let contentTypeHeader = headersByName[":content-type"]?.first,
                    case let .string(ct) = contentTypeHeader.value {
                contentType = ct
            } else {
                contentType = nil
            }
            return .event(.init(eventType: eventType, contentType: contentType))
        case "exception":
            guard let exceptionTypeHeader = headersByName[":exception-type"]?.first,
                    case let .string(exceptionType) = exceptionTypeHeader.value else {
                throw AWSEventStreamError.invalidMessage("""
                Invalid `exception` message: `:exception-type` header is missing
                """)
            }

            let contentType: String?
            if let contentTypeHeader = headersByName[":content-type"]?.first,
                    case let .string(ct) = contentTypeHeader.value {
                contentType = ct
            } else {
                contentType = nil
            }
            return .exception(.init(exceptionType: exceptionType, contentType: contentType))
        case "error":
            guard let errorCodeHeader = headersByName[":error-code"]?.first,
                    case let .string(errorCode) = errorCodeHeader.value else {
                throw AWSEventStreamError.invalidMessage("Invalid `error` message: `:error-code` header is missing")
            }

            let message: String?
            if let messageHeader = headersByName[":error-message"]?.first,
                    case let .string(msg) = messageHeader.value {
                message = msg
            } else {
                message = nil
            }
            return .error(.init(errorCode: errorCode, message: message))
        default:
            return .unknown(messageType: messageType)
        }
    }
}

extension ClientRuntime.EventStream.Message {
    func toCRTMessage() -> EventStreamMessage {
        let crtHeaders = headers.map { header in
            header.toCRTHeader()
        }
        return EventStreamMessage(headers: crtHeaders, payload: payload)
    }
}
