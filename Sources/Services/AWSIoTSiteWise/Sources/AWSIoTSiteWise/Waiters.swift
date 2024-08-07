//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// Code generated by smithy-swift-codegen. DO NOT EDIT!

import class SmithyWaitersAPI.Waiter
import enum SmithyWaitersAPI.JMESUtils
import protocol ClientRuntime.ServiceError
import struct SmithyWaitersAPI.WaiterConfiguration
import struct SmithyWaitersAPI.WaiterOptions
import struct SmithyWaitersAPI.WaiterOutcome

extension IoTSiteWiseClient {

    static func assetActiveWaiterConfig() throws -> SmithyWaitersAPI.WaiterConfiguration<DescribeAssetInput, DescribeAssetOutput> {
        let acceptors: [SmithyWaitersAPI.WaiterConfiguration<DescribeAssetInput, DescribeAssetOutput>.Acceptor] = [
            .init(state: .success, matcher: { (input: DescribeAssetInput, result: Swift.Result<DescribeAssetOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "assetStatus.state"
                // JMESPath comparator: "stringEquals"
                // JMESPath expected value: "ACTIVE"
                guard case .success(let output) = result else { return false }
                let assetStatus = output.assetStatus
                let state = assetStatus?.state
                return SmithyWaitersAPI.JMESUtils.compare(state, ==, "ACTIVE")
            }),
            .init(state: .failure, matcher: { (input: DescribeAssetInput, result: Swift.Result<DescribeAssetOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "assetStatus.state"
                // JMESPath comparator: "stringEquals"
                // JMESPath expected value: "FAILED"
                guard case .success(let output) = result else { return false }
                let assetStatus = output.assetStatus
                let state = assetStatus?.state
                return SmithyWaitersAPI.JMESUtils.compare(state, ==, "FAILED")
            }),
        ]
        return try SmithyWaitersAPI.WaiterConfiguration<DescribeAssetInput, DescribeAssetOutput>(acceptors: acceptors, minDelay: 3.0, maxDelay: 120.0)
    }

    /// Initiates waiting for the AssetActive event on the describeAsset operation.
    /// The operation will be tried and (if necessary) retried until the wait succeeds, fails, or times out.
    /// Returns a `WaiterOutcome` asynchronously on waiter success, throws an error asynchronously on
    /// waiter failure or timeout.
    /// - Parameters:
    ///   - options: `WaiterOptions` to be used to configure this wait.
    ///   - input: The `DescribeAssetInput` object to be used as a parameter when performing the operation.
    /// - Returns: A `WaiterOutcome` with the result of the final, successful performance of the operation.
    /// - Throws: `WaiterFailureError` if the waiter fails due to matching an `Acceptor` with state `failure`
    /// or there is an error not handled by any `Acceptor.`
    /// `WaiterTimeoutError` if the waiter times out.
    public func waitUntilAssetActive(options: SmithyWaitersAPI.WaiterOptions, input: DescribeAssetInput) async throws -> SmithyWaitersAPI.WaiterOutcome<DescribeAssetOutput> {
        let waiter = SmithyWaitersAPI.Waiter(config: try Self.assetActiveWaiterConfig(), operation: self.describeAsset(input:))
        return try await waiter.waitUntil(options: options, input: input)
    }

    static func assetNotExistsWaiterConfig() throws -> SmithyWaitersAPI.WaiterConfiguration<DescribeAssetInput, DescribeAssetOutput> {
        let acceptors: [SmithyWaitersAPI.WaiterConfiguration<DescribeAssetInput, DescribeAssetOutput>.Acceptor] = [
            .init(state: .success, matcher: { (input: DescribeAssetInput, result: Swift.Result<DescribeAssetOutput, Swift.Error>) -> Bool in
                guard case .failure(let error) = result else { return false }
                return (error as? ClientRuntime.ServiceError)?.typeName == "ResourceNotFoundException"
            }),
        ]
        return try SmithyWaitersAPI.WaiterConfiguration<DescribeAssetInput, DescribeAssetOutput>(acceptors: acceptors, minDelay: 3.0, maxDelay: 120.0)
    }

    /// Initiates waiting for the AssetNotExists event on the describeAsset operation.
    /// The operation will be tried and (if necessary) retried until the wait succeeds, fails, or times out.
    /// Returns a `WaiterOutcome` asynchronously on waiter success, throws an error asynchronously on
    /// waiter failure or timeout.
    /// - Parameters:
    ///   - options: `WaiterOptions` to be used to configure this wait.
    ///   - input: The `DescribeAssetInput` object to be used as a parameter when performing the operation.
    /// - Returns: A `WaiterOutcome` with the result of the final, successful performance of the operation.
    /// - Throws: `WaiterFailureError` if the waiter fails due to matching an `Acceptor` with state `failure`
    /// or there is an error not handled by any `Acceptor.`
    /// `WaiterTimeoutError` if the waiter times out.
    public func waitUntilAssetNotExists(options: SmithyWaitersAPI.WaiterOptions, input: DescribeAssetInput) async throws -> SmithyWaitersAPI.WaiterOutcome<DescribeAssetOutput> {
        let waiter = SmithyWaitersAPI.Waiter(config: try Self.assetNotExistsWaiterConfig(), operation: self.describeAsset(input:))
        return try await waiter.waitUntil(options: options, input: input)
    }

    static func assetModelActiveWaiterConfig() throws -> SmithyWaitersAPI.WaiterConfiguration<DescribeAssetModelInput, DescribeAssetModelOutput> {
        let acceptors: [SmithyWaitersAPI.WaiterConfiguration<DescribeAssetModelInput, DescribeAssetModelOutput>.Acceptor] = [
            .init(state: .success, matcher: { (input: DescribeAssetModelInput, result: Swift.Result<DescribeAssetModelOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "assetModelStatus.state"
                // JMESPath comparator: "stringEquals"
                // JMESPath expected value: "ACTIVE"
                guard case .success(let output) = result else { return false }
                let assetModelStatus = output.assetModelStatus
                let state = assetModelStatus?.state
                return SmithyWaitersAPI.JMESUtils.compare(state, ==, "ACTIVE")
            }),
            .init(state: .failure, matcher: { (input: DescribeAssetModelInput, result: Swift.Result<DescribeAssetModelOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "assetModelStatus.state"
                // JMESPath comparator: "stringEquals"
                // JMESPath expected value: "FAILED"
                guard case .success(let output) = result else { return false }
                let assetModelStatus = output.assetModelStatus
                let state = assetModelStatus?.state
                return SmithyWaitersAPI.JMESUtils.compare(state, ==, "FAILED")
            }),
        ]
        return try SmithyWaitersAPI.WaiterConfiguration<DescribeAssetModelInput, DescribeAssetModelOutput>(acceptors: acceptors, minDelay: 3.0, maxDelay: 120.0)
    }

    /// Initiates waiting for the AssetModelActive event on the describeAssetModel operation.
    /// The operation will be tried and (if necessary) retried until the wait succeeds, fails, or times out.
    /// Returns a `WaiterOutcome` asynchronously on waiter success, throws an error asynchronously on
    /// waiter failure or timeout.
    /// - Parameters:
    ///   - options: `WaiterOptions` to be used to configure this wait.
    ///   - input: The `DescribeAssetModelInput` object to be used as a parameter when performing the operation.
    /// - Returns: A `WaiterOutcome` with the result of the final, successful performance of the operation.
    /// - Throws: `WaiterFailureError` if the waiter fails due to matching an `Acceptor` with state `failure`
    /// or there is an error not handled by any `Acceptor.`
    /// `WaiterTimeoutError` if the waiter times out.
    public func waitUntilAssetModelActive(options: SmithyWaitersAPI.WaiterOptions, input: DescribeAssetModelInput) async throws -> SmithyWaitersAPI.WaiterOutcome<DescribeAssetModelOutput> {
        let waiter = SmithyWaitersAPI.Waiter(config: try Self.assetModelActiveWaiterConfig(), operation: self.describeAssetModel(input:))
        return try await waiter.waitUntil(options: options, input: input)
    }

    static func assetModelNotExistsWaiterConfig() throws -> SmithyWaitersAPI.WaiterConfiguration<DescribeAssetModelInput, DescribeAssetModelOutput> {
        let acceptors: [SmithyWaitersAPI.WaiterConfiguration<DescribeAssetModelInput, DescribeAssetModelOutput>.Acceptor] = [
            .init(state: .success, matcher: { (input: DescribeAssetModelInput, result: Swift.Result<DescribeAssetModelOutput, Swift.Error>) -> Bool in
                guard case .failure(let error) = result else { return false }
                return (error as? ClientRuntime.ServiceError)?.typeName == "ResourceNotFoundException"
            }),
        ]
        return try SmithyWaitersAPI.WaiterConfiguration<DescribeAssetModelInput, DescribeAssetModelOutput>(acceptors: acceptors, minDelay: 3.0, maxDelay: 120.0)
    }

    /// Initiates waiting for the AssetModelNotExists event on the describeAssetModel operation.
    /// The operation will be tried and (if necessary) retried until the wait succeeds, fails, or times out.
    /// Returns a `WaiterOutcome` asynchronously on waiter success, throws an error asynchronously on
    /// waiter failure or timeout.
    /// - Parameters:
    ///   - options: `WaiterOptions` to be used to configure this wait.
    ///   - input: The `DescribeAssetModelInput` object to be used as a parameter when performing the operation.
    /// - Returns: A `WaiterOutcome` with the result of the final, successful performance of the operation.
    /// - Throws: `WaiterFailureError` if the waiter fails due to matching an `Acceptor` with state `failure`
    /// or there is an error not handled by any `Acceptor.`
    /// `WaiterTimeoutError` if the waiter times out.
    public func waitUntilAssetModelNotExists(options: SmithyWaitersAPI.WaiterOptions, input: DescribeAssetModelInput) async throws -> SmithyWaitersAPI.WaiterOutcome<DescribeAssetModelOutput> {
        let waiter = SmithyWaitersAPI.Waiter(config: try Self.assetModelNotExistsWaiterConfig(), operation: self.describeAssetModel(input:))
        return try await waiter.waitUntil(options: options, input: input)
    }

    static func portalActiveWaiterConfig() throws -> SmithyWaitersAPI.WaiterConfiguration<DescribePortalInput, DescribePortalOutput> {
        let acceptors: [SmithyWaitersAPI.WaiterConfiguration<DescribePortalInput, DescribePortalOutput>.Acceptor] = [
            .init(state: .success, matcher: { (input: DescribePortalInput, result: Swift.Result<DescribePortalOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "portalStatus.state"
                // JMESPath comparator: "stringEquals"
                // JMESPath expected value: "ACTIVE"
                guard case .success(let output) = result else { return false }
                let portalStatus = output.portalStatus
                let state = portalStatus?.state
                return SmithyWaitersAPI.JMESUtils.compare(state, ==, "ACTIVE")
            }),
        ]
        return try SmithyWaitersAPI.WaiterConfiguration<DescribePortalInput, DescribePortalOutput>(acceptors: acceptors, minDelay: 3.0, maxDelay: 120.0)
    }

    /// Initiates waiting for the PortalActive event on the describePortal operation.
    /// The operation will be tried and (if necessary) retried until the wait succeeds, fails, or times out.
    /// Returns a `WaiterOutcome` asynchronously on waiter success, throws an error asynchronously on
    /// waiter failure or timeout.
    /// - Parameters:
    ///   - options: `WaiterOptions` to be used to configure this wait.
    ///   - input: The `DescribePortalInput` object to be used as a parameter when performing the operation.
    /// - Returns: A `WaiterOutcome` with the result of the final, successful performance of the operation.
    /// - Throws: `WaiterFailureError` if the waiter fails due to matching an `Acceptor` with state `failure`
    /// or there is an error not handled by any `Acceptor.`
    /// `WaiterTimeoutError` if the waiter times out.
    public func waitUntilPortalActive(options: SmithyWaitersAPI.WaiterOptions, input: DescribePortalInput) async throws -> SmithyWaitersAPI.WaiterOutcome<DescribePortalOutput> {
        let waiter = SmithyWaitersAPI.Waiter(config: try Self.portalActiveWaiterConfig(), operation: self.describePortal(input:))
        return try await waiter.waitUntil(options: options, input: input)
    }

    static func portalNotExistsWaiterConfig() throws -> SmithyWaitersAPI.WaiterConfiguration<DescribePortalInput, DescribePortalOutput> {
        let acceptors: [SmithyWaitersAPI.WaiterConfiguration<DescribePortalInput, DescribePortalOutput>.Acceptor] = [
            .init(state: .success, matcher: { (input: DescribePortalInput, result: Swift.Result<DescribePortalOutput, Swift.Error>) -> Bool in
                guard case .failure(let error) = result else { return false }
                return (error as? ClientRuntime.ServiceError)?.typeName == "ResourceNotFoundException"
            }),
        ]
        return try SmithyWaitersAPI.WaiterConfiguration<DescribePortalInput, DescribePortalOutput>(acceptors: acceptors, minDelay: 3.0, maxDelay: 120.0)
    }

    /// Initiates waiting for the PortalNotExists event on the describePortal operation.
    /// The operation will be tried and (if necessary) retried until the wait succeeds, fails, or times out.
    /// Returns a `WaiterOutcome` asynchronously on waiter success, throws an error asynchronously on
    /// waiter failure or timeout.
    /// - Parameters:
    ///   - options: `WaiterOptions` to be used to configure this wait.
    ///   - input: The `DescribePortalInput` object to be used as a parameter when performing the operation.
    /// - Returns: A `WaiterOutcome` with the result of the final, successful performance of the operation.
    /// - Throws: `WaiterFailureError` if the waiter fails due to matching an `Acceptor` with state `failure`
    /// or there is an error not handled by any `Acceptor.`
    /// `WaiterTimeoutError` if the waiter times out.
    public func waitUntilPortalNotExists(options: SmithyWaitersAPI.WaiterOptions, input: DescribePortalInput) async throws -> SmithyWaitersAPI.WaiterOutcome<DescribePortalOutput> {
        let waiter = SmithyWaitersAPI.Waiter(config: try Self.portalNotExistsWaiterConfig(), operation: self.describePortal(input:))
        return try await waiter.waitUntil(options: options, input: input)
    }
}
