//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import class Foundation.DispatchSemaphore

/*
    Manages the semaphores used by S3TM operation invocations.
    Each semaphore limits number of concurrent tasks for a given bucket (host of the request).
    This prevents request timeouts by preventing child task (that appends request to HTTP client by calling S3 API with underlying S3 client) from running in the first place if there's no capacity.
    Because each child task will make a single request with payload size smaller than or equal to config.targetPartSizeBytes, making use of built-in FIFO queue on semaphore waits & built-in request FIFO queue on HTTP client should work well enough to prevent request timeouts while being performant.
 */
internal actor S3TMSemaphoreManager {
    private struct SemaphoreInfo {
        let semaphore: DispatchSemaphore
        var useCount: Int
    }

    // Optimizations & configurability for elaborate concurrent task limit are additive work.
    private enum Device {
        static let maxConcurrentTasksPerBucket: Int = {
            #if os(macOS) || os(Linux)
                return 6 // Default maximum connections per host for URLSession.
            #elseif os(watchOS)
                return 2
            #else  // iOS, iPadOS, tvOS
                return 4
            #endif
        }()
    }

    private var semaphores: [String: SemaphoreInfo] = [:]
    private let maxConcurrentTasksPerBucket = Device.maxConcurrentTasksPerBucket

    internal func getSemaphoreInstance(forBucket bucketName: String) -> DispatchSemaphore {
        if let info = semaphores[bucketName] {
            // Existing semaphore; increment usage count and return.
            semaphores[bucketName] = SemaphoreInfo(
                semaphore: info.semaphore,
                useCount: info.useCount + 1
            )
            return info.semaphore
        } else {
            // Create new semaphore and return.
            let newSemaphore = DispatchSemaphore(value: maxConcurrentTasksPerBucket)
            semaphores[bucketName] = SemaphoreInfo(
                semaphore: newSemaphore,
                useCount: 1
            )
            return newSemaphore
        }
    }

    internal func releaseSemaphoreInstance(forBucket bucketName: String) {
        guard let info = semaphores[bucketName] else { return }
        let newCount = info.useCount - 1
        if newCount <= 0 {
            // No more users, remove the semaphore.
            semaphores.removeValue(forKey: bucketName)
        } else {
            // Update use count.
            semaphores[bucketName] = SemaphoreInfo(
                semaphore: info.semaphore,
                useCount: newCount
            )
        }
    }
}
