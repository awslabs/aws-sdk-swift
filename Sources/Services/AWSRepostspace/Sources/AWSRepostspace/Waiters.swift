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

extension RepostspaceClient {

    static func channelCreatedWaiterConfig() throws -> SmithyWaitersAPI.WaiterConfiguration<GetChannelInput, GetChannelOutput> {
        let acceptors: [SmithyWaitersAPI.WaiterConfiguration<GetChannelInput, GetChannelOutput>.Acceptor] = [
            .init(state: .success, matcher: { (input: GetChannelInput, result: Swift.Result<GetChannelOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "channelStatus"
                // JMESPath comparator: "stringEquals"
                // JMESPath expected value: "CREATED"
                guard case .success(let output) = result else { return false }
                let channelStatus = output.channelStatus
                return SmithyWaitersAPI.JMESUtils.compare(channelStatus, ==, "CREATED")
            }),
            .init(state: .failure, matcher: { (input: GetChannelInput, result: Swift.Result<GetChannelOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "channelStatus"
                // JMESPath comparator: "stringEquals"
                // JMESPath expected value: "CREATE_FAILED"
                guard case .success(let output) = result else { return false }
                let channelStatus = output.channelStatus
                return SmithyWaitersAPI.JMESUtils.compare(channelStatus, ==, "CREATE_FAILED")
            }),
            .init(state: .retry, matcher: { (input: GetChannelInput, result: Swift.Result<GetChannelOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "channelStatus"
                // JMESPath comparator: "stringEquals"
                // JMESPath expected value: "CREATING"
                guard case .success(let output) = result else { return false }
                let channelStatus = output.channelStatus
                return SmithyWaitersAPI.JMESUtils.compare(channelStatus, ==, "CREATING")
            }),
        ]
        return try SmithyWaitersAPI.WaiterConfiguration<GetChannelInput, GetChannelOutput>(acceptors: acceptors, minDelay: 2.0, maxDelay: 120.0)
    }

    /// Initiates waiting for the ChannelCreated event on the getChannel operation.
    /// The operation will be tried and (if necessary) retried until the wait succeeds, fails, or times out.
    /// Returns a `WaiterOutcome` asynchronously on waiter success, throws an error asynchronously on
    /// waiter failure or timeout.
    /// - Parameters:
    ///   - options: `WaiterOptions` to be used to configure this wait.
    ///   - input: The `GetChannelInput` object to be used as a parameter when performing the operation.
    /// - Returns: A `WaiterOutcome` with the result of the final, successful performance of the operation.
    /// - Throws: `WaiterFailureError` if the waiter fails due to matching an `Acceptor` with state `failure`
    /// or there is an error not handled by any `Acceptor.`
    /// `WaiterTimeoutError` if the waiter times out.
    public func waitUntilChannelCreated(options: SmithyWaitersAPI.WaiterOptions, input: GetChannelInput) async throws -> SmithyWaitersAPI.WaiterOutcome<GetChannelOutput> {
        let waiter = SmithyWaitersAPI.Waiter(config: try Self.channelCreatedWaiterConfig(), operation: self.getChannel(input:))
        return try await waiter.waitUntil(options: options, input: input)
    }

    static func channelDeletedWaiterConfig() throws -> SmithyWaitersAPI.WaiterConfiguration<GetChannelInput, GetChannelOutput> {
        let acceptors: [SmithyWaitersAPI.WaiterConfiguration<GetChannelInput, GetChannelOutput>.Acceptor] = [
            .init(state: .success, matcher: { (input: GetChannelInput, result: Swift.Result<GetChannelOutput, Swift.Error>) -> Bool in
                guard case .failure(let error) = result else { return false }
                return (error as? ClientRuntime.ServiceError)?.typeName == "ResourceNotFoundException"
            }),
            .init(state: .success, matcher: { (input: GetChannelInput, result: Swift.Result<GetChannelOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "channelStatus"
                // JMESPath comparator: "stringEquals"
                // JMESPath expected value: "DELETED"
                guard case .success(let output) = result else { return false }
                let channelStatus = output.channelStatus
                return SmithyWaitersAPI.JMESUtils.compare(channelStatus, ==, "DELETED")
            }),
            .init(state: .failure, matcher: { (input: GetChannelInput, result: Swift.Result<GetChannelOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "channelStatus"
                // JMESPath comparator: "stringEquals"
                // JMESPath expected value: "DELETE_FAILED"
                guard case .success(let output) = result else { return false }
                let channelStatus = output.channelStatus
                return SmithyWaitersAPI.JMESUtils.compare(channelStatus, ==, "DELETE_FAILED")
            }),
            .init(state: .retry, matcher: { (input: GetChannelInput, result: Swift.Result<GetChannelOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "channelStatus"
                // JMESPath comparator: "stringEquals"
                // JMESPath expected value: "DELETING"
                guard case .success(let output) = result else { return false }
                let channelStatus = output.channelStatus
                return SmithyWaitersAPI.JMESUtils.compare(channelStatus, ==, "DELETING")
            }),
        ]
        return try SmithyWaitersAPI.WaiterConfiguration<GetChannelInput, GetChannelOutput>(acceptors: acceptors, minDelay: 2.0, maxDelay: 120.0)
    }

    /// Initiates waiting for the ChannelDeleted event on the getChannel operation.
    /// The operation will be tried and (if necessary) retried until the wait succeeds, fails, or times out.
    /// Returns a `WaiterOutcome` asynchronously on waiter success, throws an error asynchronously on
    /// waiter failure or timeout.
    /// - Parameters:
    ///   - options: `WaiterOptions` to be used to configure this wait.
    ///   - input: The `GetChannelInput` object to be used as a parameter when performing the operation.
    /// - Returns: A `WaiterOutcome` with the result of the final, successful performance of the operation.
    /// - Throws: `WaiterFailureError` if the waiter fails due to matching an `Acceptor` with state `failure`
    /// or there is an error not handled by any `Acceptor.`
    /// `WaiterTimeoutError` if the waiter times out.
    public func waitUntilChannelDeleted(options: SmithyWaitersAPI.WaiterOptions, input: GetChannelInput) async throws -> SmithyWaitersAPI.WaiterOutcome<GetChannelOutput> {
        let waiter = SmithyWaitersAPI.Waiter(config: try Self.channelDeletedWaiterConfig(), operation: self.getChannel(input:))
        return try await waiter.waitUntil(options: options, input: input)
    }

    static func spaceCreatedWaiterConfig() throws -> SmithyWaitersAPI.WaiterConfiguration<GetSpaceInput, GetSpaceOutput> {
        let acceptors: [SmithyWaitersAPI.WaiterConfiguration<GetSpaceInput, GetSpaceOutput>.Acceptor] = [
            .init(state: .success, matcher: { (input: GetSpaceInput, result: Swift.Result<GetSpaceOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "status"
                // JMESPath comparator: "stringEquals"
                // JMESPath expected value: "CREATED"
                guard case .success(let output) = result else { return false }
                let status = output.status
                return SmithyWaitersAPI.JMESUtils.compare(status, ==, "CREATED")
            }),
            .init(state: .failure, matcher: { (input: GetSpaceInput, result: Swift.Result<GetSpaceOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "status"
                // JMESPath comparator: "stringEquals"
                // JMESPath expected value: "CREATE_FAILED"
                guard case .success(let output) = result else { return false }
                let status = output.status
                return SmithyWaitersAPI.JMESUtils.compare(status, ==, "CREATE_FAILED")
            }),
            .init(state: .retry, matcher: { (input: GetSpaceInput, result: Swift.Result<GetSpaceOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "status"
                // JMESPath comparator: "stringEquals"
                // JMESPath expected value: "CREATING"
                guard case .success(let output) = result else { return false }
                let status = output.status
                return SmithyWaitersAPI.JMESUtils.compare(status, ==, "CREATING")
            }),
        ]
        return try SmithyWaitersAPI.WaiterConfiguration<GetSpaceInput, GetSpaceOutput>(acceptors: acceptors, minDelay: 300.0, maxDelay: 7200.0)
    }

    /// Initiates waiting for the SpaceCreated event on the getSpace operation.
    /// The operation will be tried and (if necessary) retried until the wait succeeds, fails, or times out.
    /// Returns a `WaiterOutcome` asynchronously on waiter success, throws an error asynchronously on
    /// waiter failure or timeout.
    /// - Parameters:
    ///   - options: `WaiterOptions` to be used to configure this wait.
    ///   - input: The `GetSpaceInput` object to be used as a parameter when performing the operation.
    /// - Returns: A `WaiterOutcome` with the result of the final, successful performance of the operation.
    /// - Throws: `WaiterFailureError` if the waiter fails due to matching an `Acceptor` with state `failure`
    /// or there is an error not handled by any `Acceptor.`
    /// `WaiterTimeoutError` if the waiter times out.
    public func waitUntilSpaceCreated(options: SmithyWaitersAPI.WaiterOptions, input: GetSpaceInput) async throws -> SmithyWaitersAPI.WaiterOutcome<GetSpaceOutput> {
        let waiter = SmithyWaitersAPI.Waiter(config: try Self.spaceCreatedWaiterConfig(), operation: self.getSpace(input:))
        return try await waiter.waitUntil(options: options, input: input)
    }

    static func spaceDeletedWaiterConfig() throws -> SmithyWaitersAPI.WaiterConfiguration<GetSpaceInput, GetSpaceOutput> {
        let acceptors: [SmithyWaitersAPI.WaiterConfiguration<GetSpaceInput, GetSpaceOutput>.Acceptor] = [
            .init(state: .success, matcher: { (input: GetSpaceInput, result: Swift.Result<GetSpaceOutput, Swift.Error>) -> Bool in
                guard case .failure(let error) = result else { return false }
                return (error as? ClientRuntime.ServiceError)?.typeName == "ResourceNotFoundException"
            }),
            .init(state: .success, matcher: { (input: GetSpaceInput, result: Swift.Result<GetSpaceOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "status"
                // JMESPath comparator: "stringEquals"
                // JMESPath expected value: "DELETED"
                guard case .success(let output) = result else { return false }
                let status = output.status
                return SmithyWaitersAPI.JMESUtils.compare(status, ==, "DELETED")
            }),
            .init(state: .failure, matcher: { (input: GetSpaceInput, result: Swift.Result<GetSpaceOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "status"
                // JMESPath comparator: "stringEquals"
                // JMESPath expected value: "DELETE_FAILED"
                guard case .success(let output) = result else { return false }
                let status = output.status
                return SmithyWaitersAPI.JMESUtils.compare(status, ==, "DELETE_FAILED")
            }),
            .init(state: .retry, matcher: { (input: GetSpaceInput, result: Swift.Result<GetSpaceOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "status"
                // JMESPath comparator: "stringEquals"
                // JMESPath expected value: "DELETING"
                guard case .success(let output) = result else { return false }
                let status = output.status
                return SmithyWaitersAPI.JMESUtils.compare(status, ==, "DELETING")
            }),
        ]
        return try SmithyWaitersAPI.WaiterConfiguration<GetSpaceInput, GetSpaceOutput>(acceptors: acceptors, minDelay: 300.0, maxDelay: 7200.0)
    }

    /// Initiates waiting for the SpaceDeleted event on the getSpace operation.
    /// The operation will be tried and (if necessary) retried until the wait succeeds, fails, or times out.
    /// Returns a `WaiterOutcome` asynchronously on waiter success, throws an error asynchronously on
    /// waiter failure or timeout.
    /// - Parameters:
    ///   - options: `WaiterOptions` to be used to configure this wait.
    ///   - input: The `GetSpaceInput` object to be used as a parameter when performing the operation.
    /// - Returns: A `WaiterOutcome` with the result of the final, successful performance of the operation.
    /// - Throws: `WaiterFailureError` if the waiter fails due to matching an `Acceptor` with state `failure`
    /// or there is an error not handled by any `Acceptor.`
    /// `WaiterTimeoutError` if the waiter times out.
    public func waitUntilSpaceDeleted(options: SmithyWaitersAPI.WaiterOptions, input: GetSpaceInput) async throws -> SmithyWaitersAPI.WaiterOutcome<GetSpaceOutput> {
        let waiter = SmithyWaitersAPI.Waiter(config: try Self.spaceDeletedWaiterConfig(), operation: self.getSpace(input:))
        return try await waiter.waitUntil(options: options, input: input)
    }
}
