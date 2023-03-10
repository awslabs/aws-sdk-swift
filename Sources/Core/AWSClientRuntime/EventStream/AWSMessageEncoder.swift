//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import ClientRuntime

extension AWSEventStream {

    /// Encodes a `Message` into a `Data` object
    /// to be sent over the wire.
    struct AWSMessageEncoder: MessageEncoder {

        /// Encodes a `Message` into a `Data` object
        public func encode(message: EventStream.Message) throws -> Data {
            let crtMessage = message.toCRTMessage()
            return try crtMessage.getEncoded()
        }
    }
}
