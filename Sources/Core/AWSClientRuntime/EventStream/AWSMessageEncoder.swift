//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct SmithyEventStreamsAPI.Message
import protocol SmithyEventStreamsAPI.MessageEncoder
import ClientRuntime
import struct Foundation.Data

    /// Encodes a `Message` into a `Data` object
    /// to be sent over the wire.
    public struct AWSMessageEncoder: MessageEncoder {
        public init() {}

        /// Encodes a `Message` into a `Data` object
        public func encode(message: Message) throws -> Data {
            let crtMessage = message.toCRTMessage()
            return try crtMessage.getEncoded()
        }
    }
