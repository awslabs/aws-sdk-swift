//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct AWSSDKIdentityAPI.S3ExpressIdentity
@_spi(ClientConfigWrapper) import enum ClientRuntime.IdentityPropertyKeys
import struct Foundation.Date
import struct Foundation.TimeInterval
import struct Foundation.UUID
import struct Smithy.Attributes

final actor S3ExpressIdentityCachedElement {

    struct CacheKey: Hashable {
        let bucket: String

        init(identityProperties: Attributes) throws {
            guard let bucket = identityProperties.get(key: AWSIdentityPropertyKeys.bucket) else {
                throw S3ExpressClientError.bucketNotProvided
            }
            self.bucket = bucket
        }
    }

    enum Status {
        case initial
        case unaccessed
        case accessed
    }

    // The amount of time before credentials expire that the refresh task is scheduled for.
    private static let buffer: TimeInterval = 30.0

    private weak var resolver: DefaultS3ExpressIdentityResolver?
    private let identityProperties: Attributes
    private let cacheKey: CacheKey
    private var retrieveTask: Task<S3ExpressIdentity, Error>
    private var refreshTask: Task<Void, Error>?
    private var status: Status

    init(resolver: DefaultS3ExpressIdentityResolver, identityProperties: Attributes) throws {
        self.resolver = resolver
        self.identityProperties = identityProperties
        self.cacheKey = try CacheKey(identityProperties: identityProperties)
        self.status = .initial
        self.retrieveTask = Self.newRetrieveTask(identityProperties: identityProperties)
        Task {
            // This is performed in its own Task so as to keep the initializer synchronous.
            await scheduleRefreshTask()
        }
    }

    deinit {
        // Cancel the current refresh task so it does not schedule further tasks after its wait.
        refreshTask?.cancel()
    }

    func accessIdentity() async throws -> S3ExpressIdentity {
        do {
            let identity = try await retrieveTask.value
            status = .accessed
            return identity
        } catch {
            // If there was an error retrieving credentials, throw it to the caller
            // and remove this cached element.
            // A subsequent request will create a new cached element.
            await removeSelfFromCache()
            throw error
        }
    }

    private static func newRetrieveTask(identityProperties: Attributes) -> Task<S3ExpressIdentity, Error> {
        // Note that this task does not capture self, so that the task can be assigned to
        // the retrieveTask property without causing a reference cycle.
        return Task {
            guard let wrapper = identityProperties.get(key: IdentityPropertyKeys.clientConfigWrapper) else {
                throw S3ExpressClientError.clientConfigNotProvided
            }
            guard let client = identityProperties.get(key: AWSIdentityPropertyKeys.s3ExpressClient) else {
                throw S3ExpressClientError.clientNotProvided
            }
            guard let bucket = identityProperties.get(key: AWSIdentityPropertyKeys.bucket) else {
                throw S3ExpressClientError.bucketNotProvided
            }
            return try await client.createSession(clientConfig: wrapper.clientConfig, bucket: bucket)
        }
    }

    private func scheduleRefreshTask() {
        // Cancel any previous refresh task
        self.refreshTask?.cancel()

        // Task captures self weakly, to prevent refreshing a cache that has been purged.
        // self is then bound strongly both before & after the credential refresh wait.
        self.refreshTask = Task { [weak self] in
            guard let selfBeforeWait = self else { return }
            let expiration: Date
            do {
                expiration = try await selfBeforeWait.retrieveTask.value.expiration ?? Date.distantPast
            } catch {
                // If there was an error retrieving credentials, throw it to the caller
                // and remove this cached element.
                // A subsequent access to credentials will create a new cached element.
                await selfBeforeWait.removeSelfFromCache()
                throw error
            }

            // Asynchronously wait until the credentials are within buffer time of expiring.
            // Use the modern `ContinuousClock` time measurement if available.
            let now = Date()
            if #available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *) {
                let interval = expiration.timeIntervalSince(now) - Self.buffer
                let duration = Duration(secondsComponent: Int64(interval), attosecondsComponent: 0)
                let clock = ContinuousClock.now.advanced(by: duration)
                let tolerance = Duration(secondsComponent: 1, attosecondsComponent: 0)
                try await Task.sleep(until: clock, tolerance: tolerance, clock: .continuous)
            } else {
                let interval = expiration.timeIntervalSince(now) - Self.buffer
                try await Task.sleep(nanoseconds: UInt64(interval) * 1_000_000_000)
            }

            // wait has now passed.  Perform the credential refresh if credentials have been accessed,
            // else this cached element will be purged for not being used.
            guard !Task.isCancelled, let selfAfterWait = self else { return }
            await selfAfterWait.performRefreshIfNeeded()
        }
    }

    private func performRefreshIfNeeded() async {
        switch status {
        case .initial:
            // This is the very first access to these credentials.
            // If there isn't another access before refresh, these credentials will get purged.
            status = .unaccessed
        case .unaccessed:
            // Credential hasn't been accessed since initial access.
            // Purge this cached element from the cache.
            await removeSelfFromCache()
        case .accessed:
            // Credential has been accessed since last refresh
            // Refresh again.
            self.status = .unaccessed
            retrieveTask = Self.newRetrieveTask(identityProperties: identityProperties)
            scheduleRefreshTask()
        }
    }

    private func removeSelfFromCache() async {
        await resolver?.remove(element: self, cacheKey: cacheKey)
    }
}
