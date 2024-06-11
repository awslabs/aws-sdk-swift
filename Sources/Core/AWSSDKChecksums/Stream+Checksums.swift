//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import protocol Smithy.Stream

/*
 * Chunk size used by 'aws-chunked' encoding
 */
public let CHUNK_SIZE_BYTES: Int = 65_536

/*
 * The minimum size of a streaming body before the SDK will begin using aws-chunked content encoding
 */
public let AWS_CHUNKED_THRESHOLD = CHUNK_SIZE_BYTES * 16

public extension Stream {
    /*
     * Return a Bool representing if the ByteStream (request body) is eligible to send via aws-chunked content encoding
     */
    var isEligibleForAwsChunkedStreaming: Bool {
        if let length = self.length, length >= AWS_CHUNKED_THRESHOLD {
            return true
        } else {
            return false
        }
    }
}
