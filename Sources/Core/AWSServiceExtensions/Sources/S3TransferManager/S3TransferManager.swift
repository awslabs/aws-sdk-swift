//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSS3
import class Foundation.DispatchSemaphore
import struct Foundation.URL
import struct Smithy.SwiftLogger

/// The Transfer Manager for S3. S3TM for short.
/// The S3TM is an out-of-the-box solution for performant uploads & downloads for both single and multiple files (local directory / S3 bucket).
///
/// The S3 Transfer Manager (S3TM) for Swift supports the following features:
///  - Upload a single object to S3
///  - Download a single object from S3
///  - Upload a local directory to S3
///  - Download everything in a S3 bucket into a local directory
///  - Track transfer progress for all the operations above
///
/// For object(s) bigger than the threshold size specified in the config:
///  - For uploads, S3TM uses S3's multipart upload & Swift concurrency.
///  - For downloads, S3TM uses range GET or part GET as specified in config & Swift concurrency.
/// For directory uploads, you can configure whether to upload everything in the directory recursively or not.
///
/// All operations return immediately with a `Task` that can be optionally waited on for the operation result.
public class S3TransferManager {
    let config: S3TransferManagerConfig
    let logger: SwiftLogger
    internal let semaphoreManager = S3TMSemaphoreManager()

    /// Creates the S3 Transfer Manager using a default transfer manager config with a default S3 client.
    public init() async throws {
        self.config = try await S3TransferManagerConfig()
        logger = SwiftLogger(label: "S3TransferManager")
    }

    /// Creates the S3 Transfer Manager with the provided config.
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

    // Helper function to make semaphore.wait() async.
    internal func wait(_ semaphore: DispatchSemaphore) async {
        await withUnsafeContinuation { continuation in
            semaphore.wait()
            continuation.resume()
        }
    }
}
