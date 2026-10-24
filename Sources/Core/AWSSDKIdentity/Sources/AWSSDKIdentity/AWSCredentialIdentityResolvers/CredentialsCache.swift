//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct Foundation.Date
import struct Foundation.TimeInterval
import struct Smithy.Attributes
import struct Smithy.SwiftLogger
import protocol SmithyIdentity.AWSCredentialIdentityResolver
import protocol SmithyIdentityAPI.IdentityInvalidator

// Refresh timing values for the credentials cache.
private let refreshBackoffMin: TimeInterval = 300
private let refreshBackoffMax: TimeInterval = 600
private let nonRecoverableErrTTLMin: TimeInterval = 1
private let nonRecoverableErrTTLMax: TimeInterval = 5
private let mandatoryRefreshWindow: TimeInterval = 60
private let shortLifetimeMax: TimeInterval = 20 * 60
private let mediumLifetimeMax: TimeInterval = 90 * 60
private let shortAdvisoryWindow: TimeInterval = 5 * 60
private let mediumAdvisoryWindow: TimeInterval = 15 * 60
private let longAdvisoryWindow: TimeInterval = 60 * 60

/// CredentialsCache caches the credentials from an SDK credential resolver and refreshes them before they expire.
actor CredentialsCache: AWSCredentialIdentityResolver, IdentityInvalidator {
    /// CacheEntry holds the cached credentials, their advisory window, any refresh backoff, and any cached non-recoverable error.
    private struct CacheEntry {
        var credentials: AWSCredentialIdentity?
        var effectiveExpiration: Date?
        var advisoryWindow: TimeInterval = 0
        var nextRefreshAllowedAt: Date?
        var error: (any Error)?
        var errorExpiresAt: Date?

        var mandatoryWindow: TimeInterval { min(mandatoryRefreshWindow, advisoryWindow) }

        func refreshNeeded(_ now: Date) -> Bool {
            guard let effectiveExpiration else { return false }
            return now >= effectiveExpiration.addingTimeInterval(-advisoryWindow)
        }

        func mandatoryRefreshNeeded(_ now: Date) -> Bool {
            guard let effectiveExpiration else { return false }
            return now >= effectiveExpiration.addingTimeInterval(-mandatoryWindow)
        }

        func rateLimited(_ now: Date) -> Bool {
            guard let nextRefreshAllowedAt else { return false }
            return now < nextRefreshAllowedAt
        }

        /// nonRecoverableError returns the cached non-recoverable error, or nil if none is cached or it has expired.
        func nonRecoverableError(_ now: Date) -> (any Error)? {
            guard let error, let errorExpiresAt, now < errorExpiresAt else { return nil }
            return error
        }
    }

    /// RefreshStatus is whether a refresh is in flight, and the task doing it.
    private enum RefreshStatus {
        case idle
        case refreshing(Task<AWSCredentialIdentity, Error>)
    }

    private let underlyingResolver: any AWSCredentialIdentityResolver
    private let now: @Sendable () -> Date
    private let fixedBackoff: TimeInterval?
    private let logger = SwiftLogger(label: "CredentialsCache")
    private var entry: CacheEntry?
    private var status: RefreshStatus = .idle
    private var resetCount = 0

    /// advisoryWindow is the advisory window of the cached credentials.
    var advisoryWindow: TimeInterval? { entry?.advisoryWindow } // swiftlint:disable:this unused_declaration

    /// rateLimited reports whether the backoff from a failed refresh is still active.
    var rateLimited: Bool { entry?.rateLimited(now()) ?? false } // swiftlint:disable:this unused_declaration

    init(
        source: any AWSCredentialIdentityResolver,
        now: @escaping @Sendable () -> Date = { Date() },
        fixedBackoff: TimeInterval? = nil
    ) {
        self.underlyingResolver = source
        self.now = now
        self.fixedBackoff = fixedBackoff
    }

    func getIdentity(identityProperties: Attributes?) async throws -> AWSCredentialIdentity {
        let now = self.now()
        guard let entry, let credentials = entry.credentials else {
            return try await waitForRetrieve(identityProperties)
        }
        guard entry.refreshNeeded(now) else { return credentials }
        if entry.rateLimited(now) { return credentials }
        if entry.mandatoryRefreshNeeded(now) {
            return try await waitForRetrieve(identityProperties)
        }
        return try await advisoryRefresh(identityProperties)
    }

    /// advisoryRefresh starts a singleRetrieve if none is in flight; callers that find one in flight don't wait and get the cached credentials.
    private func advisoryRefresh(_ properties: Attributes?) async throws -> AWSCredentialIdentity {
        if case .refreshing = status, let credentials = entry?.credentials { return credentials }
        return try await wait(for: joinRefresh(properties))
    }

    /// waitForRetrieve starts a singleRetrieve if none is in flight and waits for it
    private func waitForRetrieve(_ properties: Attributes?) async throws -> AWSCredentialIdentity {
        try await wait(for: joinRefresh(properties))
    }

    /// joinRefresh returns the refresh in flight, or starts one; the task is unstructured so a cancelled caller doesn't cancel it.
    private func joinRefresh(_ properties: Attributes?) -> Task<AWSCredentialIdentity, Error> {
        if case .refreshing(let task) = status { return task }
        let task = Task { try await self.singleRetrieve(properties) }
        status = .refreshing(task)
        return task
    }

    /// wait returns the refresh's result and marks it finished, unless a newer refresh has already replaced it.
    private func wait(for task: Task<AWSCredentialIdentity, Error>) async throws -> AWSCredentialIdentity {
        defer {
            if case .refreshing(let current) = status, current == task { status = .idle }
        }
        return try await task.value
    }

    /// singleRetrieve fetches new credentials and caches them; if that fails it keeps the old ones and backs off, or raises a non-recoverable error right away.
    private func singleRetrieve(_ properties: Attributes?) async throws -> AWSCredentialIdentity {
        let startCount = resetCount
        let now = self.now()
        let currCreds = entry?.credentials

        if let entry, let currCreds, !entry.refreshNeeded(now) { return currCreds }
        if let error = entry?.nonRecoverableError(now) { throw error }
        if let entry, let currCreds, entry.rateLimited(now) { return currCreds }

        var properties = properties ?? Attributes()
        if let currCreds {
            properties.set(key: AWSIdentityPropertyKeys.staleAccessKeyID, value: currCreds.accessKey)
        }

        let credentials: AWSCredentialIdentity
        do {
            credentials = try await underlyingResolver.getIdentity(identityProperties: properties)
        } catch let error as NonRecoverableCredentialError {
            if resetCount == startCount {
                var next = entry ?? CacheEntry()
                next.error = error
                next.errorExpiresAt = self.now().addingTimeInterval(
                    .random(in: nonRecoverableErrTTLMin...nonRecoverableErrTTLMax)
                )
                entry = next
            }
            throw error
        } catch {
            guard resetCount == startCount else { throw error }
            return try failedRefresh(error)
        }

        // A reset during the fetch means these credentials are for the old logins, so they aren't cached.
        guard resetCount == startCount else { return credentials }

        if let expiration = credentials.expiration, expiration <= self.now() {
            return try failedRefresh(AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "CredentialsCache: credential source returned credentials that have already expired."
            ))
        }

        store(credentials)
        return credentials
    }

    /// failedRefresh backs off and returns the cached credentials; with nothing cached it throws the error so the next call tries again right away.
    private func failedRefresh(_ error: any Error) throws -> AWSCredentialIdentity {
        guard let currCreds = entry?.credentials else { throw error }

        let backoff = fixedBackoff ?? TimeInterval.random(in: refreshBackoffMin...refreshBackoffMax)
        entry?.nextRefreshAllowedAt = now().addingTimeInterval(backoff)
        logger.info(
            "Credential refresh failed: \(error). The SDK will continue using cached credentials. "
            + "A refresh of these credentials will be attempted again after \(Int(backoff)) seconds."
        )
        return currCreds
    }

    /// store caches new credentials with an advisory window picked from their remaining lifetime.
    private func store(_ credentials: AWSCredentialIdentity) {
        let lifetime = credentials.expiration?.timeIntervalSince(now())
        entry = CacheEntry(
            credentials: credentials,
            effectiveExpiration: credentials.expiration,
            advisoryWindow: Self.advisoryWindow(forLifetime: lifetime)
        )
    }

    /// invalidate marks the cached credentials for refresh if they're the ones a service rejected, keeping them and any backoff in place.
    func invalidate(_ identity: AWSCredentialIdentity) async {
        guard entry?.credentials?.accessKey == identity.accessKey else { return }
        entry?.effectiveExpiration = now()
    }

    /// reset drops the cached credentials and error, so the next call fetches from the source.
    func reset() {
        resetCount += 1
        entry = nil
        status = .idle
    }

    /// advisoryWindow returns 5, 15, or 60 minutes based on how long the credentials last, or 0 if they never expire.
    private static func advisoryWindow(forLifetime lifetime: TimeInterval?) -> TimeInterval {
        guard let lifetime else { return 0 }
        if lifetime <= shortLifetimeMax { return shortAdvisoryWindow }
        if lifetime < mediumLifetimeMax { return mediumAdvisoryWindow }
        return longAdvisoryWindow
    }
}
