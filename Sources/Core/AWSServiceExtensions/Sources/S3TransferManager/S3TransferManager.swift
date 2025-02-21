//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSS3
import class Foundation.DispatchQueue
import class Foundation.DispatchSemaphore
import struct Smithy.SwiftLogger

/// The Transfer Manager for AWS S3, S3TM for short.
/// The S3TM is an out-of-the-box solution for performant and reliable uploads & downloads to and from AWS S3 buckets.
///
/// The S3 Transfer Manager (S3TM) for Swift supports the following features:
///  - Upload a single object to S3
///  - Download a single object from S3
///  - Upload a local directory to S3
///  - Download everything in a S3 bucket into a local directory
///  - Track transfer progress for all of the above
///
/// All operations return immediately with a `Task` that can be optionally waited on for the operation output.
///
/// For information on what options there are for each operation, go to the input type documentation (e.g., `UploadObjectInput`).
public class S3TransferManager {
    internal let config: S3TransferManagerConfig
    internal let logger: SwiftLogger
    internal let semaphoreManager = S3TMSemaphoreManager()

    /// Initializes `S3TransferManager` with default configurations.
    public init() async throws {
        self.config = try await S3TransferManagerConfig()
        logger = SwiftLogger(label: "S3TransferManager")
    }

    /// Initializes `S3TransferManager` with the provided config.
    ///
    /// - Parameters:
    ///   - config: An instance of `S3TransferManagerConfig`.
    public init(
        config: S3TransferManagerConfig
    ) {
        self.config = config
        logger = SwiftLogger(label: "S3TransferManager")
    }

    // Helper function used by UploadDirectory & DownloadBucket.
    internal func defaultPathSeparator() -> String {
        return "/" // Default path separator for all apple platforms & Linux distros.
    }

    // Helper function that makes semaphore.wait() async.
    internal func wait(_ semaphore: DispatchSemaphore) async {
        await withCheckedContinuation { continuation in
            DispatchQueue.global().async {  // Run on a separate GCD thread to prevent deadlock.
                semaphore.wait()
                continuation.resume()
            }
        }
    }
}
