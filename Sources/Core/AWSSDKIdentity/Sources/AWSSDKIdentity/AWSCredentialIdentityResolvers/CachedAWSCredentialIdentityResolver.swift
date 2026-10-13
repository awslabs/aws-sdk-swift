//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import protocol ClientRuntime.ServiceError
import struct Foundation.Date
import struct Foundation.TimeInterval
import struct Smithy.Attributes
import struct Smithy.SwiftLogger
import protocol SmithyIdentity.AWSCredentialIdentityResolver

///  A credential identity resolver that caches the credentials sourced from the provided resolver.
public actor CachedAWSCredentialIdentityResolver: AWSCredentialIdentityResolver {
    /// CachedCredentials holds the cached credentials, their advisory window, and any refresh backoff.
    private struct CachedCredentials {
        var credentials: AWSCredentialIdentity
        var fetchedAt: Date
        var effectiveExpiration: Date?
        var advisoryWindow: TimeInterval
        var nextRefreshAllowedAt: Date?
        var mandatoryWindow: TimeInterval { min(60, advisoryWindow) }
    }

    /// CachedError holds a non-recoverable error and when it stops being re-raised.
    private struct CachedError {
        var error: any Error
        var expiresAt: Date
    }

    private let underlyingResolver: any AWSCredentialIdentityResolver
    private let refreshTime: TimeInterval?
    private let logger = SwiftLogger(label: "CachedAWSCredentialIdentityResolver")
    private var cached: CachedCredentials?
    private var inFlight: Task<AWSCredentialIdentity, Error>?
    private var cachedError: CachedError?

    /// advisoryWindow is the advisory window of the cached credentials.
    var advisoryWindow: TimeInterval? { cached?.advisoryWindow } // swiftlint:disable:this unused_declaration

    /// - Parameters:
    ///   - source: The source credential identity resolver to get the credentials.
    ///   - refreshTime: The number of seconds that must pass before new credentials will be fetched again.
    public init(
        source: any AWSCredentialIdentityResolver,
        refreshTime: TimeInterval
    ) throws {
        self.underlyingResolver = source
        self.refreshTime = refreshTime
    }

    init(source: any AWSCredentialIdentityResolver) {
        self.underlyingResolver = source
        self.refreshTime = nil
    }

    public func getIdentity(identityProperties: Attributes?) async throws -> AWSCredentialIdentity {
        guard let cached else {
            return try await waitForRetrieve(identityProperties)
        }
        guard refreshNeeded(cached) else { return cached.credentials }
        if rateLimited { return cached.credentials }
        if mandatoryRefreshNeeded(cached) {
            return try await waitForRetrieve(identityProperties)
        }
        return try await advisoryRefresh(identityProperties)
    }

    /// advisoryRefresh starts a singleRetrieve if none is in flight; callers that find one in flight don't wait and get the cached credentials.
    private func advisoryRefresh(_ properties: Attributes?) async throws -> AWSCredentialIdentity {
        if inFlight != nil, let cached { return cached.credentials }

        let task = refreshTask(properties)
        inFlight = task
        do {
            return try await task.value
        } catch let error as NonRecoverableCredentialError {
            throw error
        } catch {
            if let cached { return cached.credentials }
            throw error
        }
    }

    /// waitForRetrieve starts a singleRetrieve if none is in flight and waits for it
    private func waitForRetrieve(_ properties: Attributes?) async throws -> AWSCredentialIdentity {
        let task = inFlight ?? refreshTask(properties)
        inFlight = task
        do {
            return try await task.value
        } catch let error as NonRecoverableCredentialError {
            throw error
        } catch {
            if let cached { return cached.credentials }
            throw error
        }
    }

    /// refreshTask is unstructured so a cancelled caller doesn't cancel a refresh others are waiting on.
    private func refreshTask(_ properties: Attributes?) -> Task<AWSCredentialIdentity, Error> {
        Task { try await self.singleRetrieve(properties) }
    }

    /// singleRetrieve fetches new credentials and caches them; if that fails it keeps the old ones and backs off, or raises a non-recoverable error right away.
    private func singleRetrieve(_ properties: Attributes?) async throws -> AWSCredentialIdentity {
        defer { inFlight = nil }

        if let cached, !refreshNeeded(cached) { return cached.credentials }
        if let cachedError, now() < cachedError.expiresAt {
            throw cachedError.error
        }
        if let cached, rateLimited { return cached.credentials }

        let credentials: AWSCredentialIdentity
        do {
            credentials = try await underlyingResolver.getIdentity(identityProperties: properties)
        } catch let error as NonRecoverableCredentialError {
            cachedError = CachedError(error: error, expiresAt: now().addingTimeInterval(.random(in: 1...5)))
            throw error
        } catch {
            return try failedRefresh(error)
        }

        if let expiration = credentials.expiration, expiration <= now() {
            return try failedRefresh(AWSCredentialIdentityResolverError.failedToResolveAWSCredentials(
                "CachedAWSCredentialIdentityResolver: credential source returned credentials that have already expired."
            ))
        }

        store(credentials)
        cachedError = nil
        return credentials
    }

    /// failedRefresh backs off and returns the cached credentials; with nothing cached it throws the error so the next call tries again right away.
    private func failedRefresh(_ error: any Error) throws -> AWSCredentialIdentity {
        guard let cached else { throw error }

        let backoff = CredentialRefreshTesting.fixedBackoff ?? TimeInterval.random(in: 300...600)
        self.cached?.nextRefreshAllowedAt = now().addingTimeInterval(backoff)
        logger.info(
            "Credential refresh failed: \(error). The SDK will continue using cached credentials. "
            + "A refresh of these credentials will be attempted again after \(Int(backoff)) seconds."
        )
        return cached.credentials
    }

    /// store caches new credentials with an advisory window picked from their remaining lifetime.
    private func store(_ credentials: AWSCredentialIdentity) {
        let lifetime = credentials.expiration?.timeIntervalSince(now())
        let advisory = Self.advisoryWindow(forLifetime: lifetime)
        cached = CachedCredentials(
            credentials: credentials,
            fetchedAt: now(),
            effectiveExpiration: credentials.expiration,
            advisoryWindow: advisory
        )
    }

    /// invalidate marks the cached credentials for refresh if a service rejected them with `ExpiredToken`
    /// or `InvalidToken`, keeping them and any backoff in place.
    public func invalidate(_ identity: AWSCredentialIdentity, error: any Error) async {
        guard let code = (error as? ServiceError)?.errorCode,
              code == "ExpiredToken" || code == "InvalidToken" else { return }
        guard var current = cached, current.credentials.accessKey == identity.accessKey else { return }
        current.effectiveExpiration = now()
        current.fetchedAt = .distantPast
        cached = current
    }

    /// refreshNeeded reports whether the credentials are in the advisory window, or `refreshTime` has passed since the last fetch.
    private func refreshNeeded(_ cached: CachedCredentials) -> Bool {
        if let refreshTime {
            return now() >= cached.fetchedAt.addingTimeInterval(refreshTime)
        }
        guard let expiration = cached.effectiveExpiration else { return false }
        return now() >= expiration.addingTimeInterval(-cached.advisoryWindow)
    }

    /// mandatoryRefreshNeeded reports whether the credentials are in the mandatory window; with `refreshTime` it's the same as refreshNeeded.
    private func mandatoryRefreshNeeded(_ cached: CachedCredentials) -> Bool {
        if refreshTime != nil { return refreshNeeded(cached) }
        guard let expiration = cached.effectiveExpiration else { return false }
        return now() >= expiration.addingTimeInterval(-cached.mandatoryWindow)
    }

    /// rateLimited reports whether the backoff from a failed refresh is still active.
    var rateLimited: Bool {
        guard let nextRefreshAllowedAt = cached?.nextRefreshAllowedAt else { return false }
        return now() < nextRefreshAllowedAt
    }

    /// now returns the current time, or the test clock if one is set.
    private func now() -> Date { CredentialRefreshTesting.now?() ?? Date() }

    /// advisoryWindow returns 5, 15, or 60 minutes based on how long the credentials last, or 0 if they never expire.
    private static func advisoryWindow(forLifetime lifetime: TimeInterval?) -> TimeInterval {
        guard let lifetime else { return 0 }
        if lifetime <= 20 * 60 { return 5 * 60 }
        if lifetime < 90 * 60 { return 15 * 60 }
        return 60 * 60
    }
}

/// CredentialRefreshTesting lets tests set the clock and the refresh backoff; both are nil outside tests.
enum CredentialRefreshTesting {
    nonisolated(unsafe) static var now: (@Sendable () -> Date)?
    nonisolated(unsafe) static var fixedBackoff: TimeInterval?
}
