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

extension MediaConnectClient {

    static func flowActiveWaiterConfig() throws -> SmithyWaitersAPI.WaiterConfiguration<DescribeFlowInput, DescribeFlowOutput> {
        let acceptors: [SmithyWaitersAPI.WaiterConfiguration<DescribeFlowInput, DescribeFlowOutput>.Acceptor] = [
            .init(state: .success, matcher: { (input: DescribeFlowInput, result: Swift.Result<DescribeFlowOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "Flow.Status"
                // JMESPath comparator: "stringEquals"
                // JMESPath expected value: "ACTIVE"
                guard case .success(let output) = result else { return false }
                let flow = output.flow
                let status = flow?.status
                return SmithyWaitersAPI.JMESUtils.compare(status, ==, "ACTIVE")
            }),
            .init(state: .retry, matcher: { (input: DescribeFlowInput, result: Swift.Result<DescribeFlowOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "Flow.Status"
                // JMESPath comparator: "stringEquals"
                // JMESPath expected value: "STARTING"
                guard case .success(let output) = result else { return false }
                let flow = output.flow
                let status = flow?.status
                return SmithyWaitersAPI.JMESUtils.compare(status, ==, "STARTING")
            }),
            .init(state: .retry, matcher: { (input: DescribeFlowInput, result: Swift.Result<DescribeFlowOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "Flow.Status"
                // JMESPath comparator: "stringEquals"
                // JMESPath expected value: "UPDATING"
                guard case .success(let output) = result else { return false }
                let flow = output.flow
                let status = flow?.status
                return SmithyWaitersAPI.JMESUtils.compare(status, ==, "UPDATING")
            }),
            .init(state: .retry, matcher: { (input: DescribeFlowInput, result: Swift.Result<DescribeFlowOutput, Swift.Error>) -> Bool in
                guard case .failure(let error) = result else { return false }
                return (error as? ClientRuntime.ServiceError)?.typeName == "InternalServerErrorException"
            }),
            .init(state: .retry, matcher: { (input: DescribeFlowInput, result: Swift.Result<DescribeFlowOutput, Swift.Error>) -> Bool in
                guard case .failure(let error) = result else { return false }
                return (error as? ClientRuntime.ServiceError)?.typeName == "ServiceUnavailableException"
            }),
            .init(state: .failure, matcher: { (input: DescribeFlowInput, result: Swift.Result<DescribeFlowOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "Flow.Status"
                // JMESPath comparator: "stringEquals"
                // JMESPath expected value: "ERROR"
                guard case .success(let output) = result else { return false }
                let flow = output.flow
                let status = flow?.status
                return SmithyWaitersAPI.JMESUtils.compare(status, ==, "ERROR")
            }),
        ]
        return try SmithyWaitersAPI.WaiterConfiguration<DescribeFlowInput, DescribeFlowOutput>(acceptors: acceptors, minDelay: 3.0, maxDelay: 120.0)
    }

    /// Initiates waiting for the FlowActive event on the describeFlow operation.
    /// The operation will be tried and (if necessary) retried until the wait succeeds, fails, or times out.
    /// Returns a `WaiterOutcome` asynchronously on waiter success, throws an error asynchronously on
    /// waiter failure or timeout.
    /// - Parameters:
    ///   - options: `WaiterOptions` to be used to configure this wait.
    ///   - input: The `DescribeFlowInput` object to be used as a parameter when performing the operation.
    /// - Returns: A `WaiterOutcome` with the result of the final, successful performance of the operation.
    /// - Throws: `WaiterFailureError` if the waiter fails due to matching an `Acceptor` with state `failure`
    /// or there is an error not handled by any `Acceptor.`
    /// `WaiterTimeoutError` if the waiter times out.
    public func waitUntilFlowActive(options: SmithyWaitersAPI.WaiterOptions, input: DescribeFlowInput) async throws -> SmithyWaitersAPI.WaiterOutcome<DescribeFlowOutput> {
        let waiter = SmithyWaitersAPI.Waiter(config: try Self.flowActiveWaiterConfig(), operation: self.describeFlow(input:))
        return try await waiter.waitUntil(options: options, input: input)
    }

    static func flowDeletedWaiterConfig() throws -> SmithyWaitersAPI.WaiterConfiguration<DescribeFlowInput, DescribeFlowOutput> {
        let acceptors: [SmithyWaitersAPI.WaiterConfiguration<DescribeFlowInput, DescribeFlowOutput>.Acceptor] = [
            .init(state: .success, matcher: { (input: DescribeFlowInput, result: Swift.Result<DescribeFlowOutput, Swift.Error>) -> Bool in
                guard case .failure(let error) = result else { return false }
                return (error as? ClientRuntime.ServiceError)?.typeName == "NotFoundException"
            }),
            .init(state: .retry, matcher: { (input: DescribeFlowInput, result: Swift.Result<DescribeFlowOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "Flow.Status"
                // JMESPath comparator: "stringEquals"
                // JMESPath expected value: "DELETING"
                guard case .success(let output) = result else { return false }
                let flow = output.flow
                let status = flow?.status
                return SmithyWaitersAPI.JMESUtils.compare(status, ==, "DELETING")
            }),
            .init(state: .retry, matcher: { (input: DescribeFlowInput, result: Swift.Result<DescribeFlowOutput, Swift.Error>) -> Bool in
                guard case .failure(let error) = result else { return false }
                return (error as? ClientRuntime.ServiceError)?.typeName == "InternalServerErrorException"
            }),
            .init(state: .retry, matcher: { (input: DescribeFlowInput, result: Swift.Result<DescribeFlowOutput, Swift.Error>) -> Bool in
                guard case .failure(let error) = result else { return false }
                return (error as? ClientRuntime.ServiceError)?.typeName == "ServiceUnavailableException"
            }),
            .init(state: .failure, matcher: { (input: DescribeFlowInput, result: Swift.Result<DescribeFlowOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "Flow.Status"
                // JMESPath comparator: "stringEquals"
                // JMESPath expected value: "ERROR"
                guard case .success(let output) = result else { return false }
                let flow = output.flow
                let status = flow?.status
                return SmithyWaitersAPI.JMESUtils.compare(status, ==, "ERROR")
            }),
        ]
        return try SmithyWaitersAPI.WaiterConfiguration<DescribeFlowInput, DescribeFlowOutput>(acceptors: acceptors, minDelay: 3.0, maxDelay: 120.0)
    }

    /// Initiates waiting for the FlowDeleted event on the describeFlow operation.
    /// The operation will be tried and (if necessary) retried until the wait succeeds, fails, or times out.
    /// Returns a `WaiterOutcome` asynchronously on waiter success, throws an error asynchronously on
    /// waiter failure or timeout.
    /// - Parameters:
    ///   - options: `WaiterOptions` to be used to configure this wait.
    ///   - input: The `DescribeFlowInput` object to be used as a parameter when performing the operation.
    /// - Returns: A `WaiterOutcome` with the result of the final, successful performance of the operation.
    /// - Throws: `WaiterFailureError` if the waiter fails due to matching an `Acceptor` with state `failure`
    /// or there is an error not handled by any `Acceptor.`
    /// `WaiterTimeoutError` if the waiter times out.
    public func waitUntilFlowDeleted(options: SmithyWaitersAPI.WaiterOptions, input: DescribeFlowInput) async throws -> SmithyWaitersAPI.WaiterOutcome<DescribeFlowOutput> {
        let waiter = SmithyWaitersAPI.Waiter(config: try Self.flowDeletedWaiterConfig(), operation: self.describeFlow(input:))
        return try await waiter.waitUntil(options: options, input: input)
    }

    static func flowStandbyWaiterConfig() throws -> SmithyWaitersAPI.WaiterConfiguration<DescribeFlowInput, DescribeFlowOutput> {
        let acceptors: [SmithyWaitersAPI.WaiterConfiguration<DescribeFlowInput, DescribeFlowOutput>.Acceptor] = [
            .init(state: .success, matcher: { (input: DescribeFlowInput, result: Swift.Result<DescribeFlowOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "Flow.Status"
                // JMESPath comparator: "stringEquals"
                // JMESPath expected value: "STANDBY"
                guard case .success(let output) = result else { return false }
                let flow = output.flow
                let status = flow?.status
                return SmithyWaitersAPI.JMESUtils.compare(status, ==, "STANDBY")
            }),
            .init(state: .retry, matcher: { (input: DescribeFlowInput, result: Swift.Result<DescribeFlowOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "Flow.Status"
                // JMESPath comparator: "stringEquals"
                // JMESPath expected value: "STOPPING"
                guard case .success(let output) = result else { return false }
                let flow = output.flow
                let status = flow?.status
                return SmithyWaitersAPI.JMESUtils.compare(status, ==, "STOPPING")
            }),
            .init(state: .retry, matcher: { (input: DescribeFlowInput, result: Swift.Result<DescribeFlowOutput, Swift.Error>) -> Bool in
                guard case .failure(let error) = result else { return false }
                return (error as? ClientRuntime.ServiceError)?.typeName == "InternalServerErrorException"
            }),
            .init(state: .retry, matcher: { (input: DescribeFlowInput, result: Swift.Result<DescribeFlowOutput, Swift.Error>) -> Bool in
                guard case .failure(let error) = result else { return false }
                return (error as? ClientRuntime.ServiceError)?.typeName == "ServiceUnavailableException"
            }),
            .init(state: .failure, matcher: { (input: DescribeFlowInput, result: Swift.Result<DescribeFlowOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "Flow.Status"
                // JMESPath comparator: "stringEquals"
                // JMESPath expected value: "ERROR"
                guard case .success(let output) = result else { return false }
                let flow = output.flow
                let status = flow?.status
                return SmithyWaitersAPI.JMESUtils.compare(status, ==, "ERROR")
            }),
        ]
        return try SmithyWaitersAPI.WaiterConfiguration<DescribeFlowInput, DescribeFlowOutput>(acceptors: acceptors, minDelay: 3.0, maxDelay: 120.0)
    }

    /// Initiates waiting for the FlowStandby event on the describeFlow operation.
    /// The operation will be tried and (if necessary) retried until the wait succeeds, fails, or times out.
    /// Returns a `WaiterOutcome` asynchronously on waiter success, throws an error asynchronously on
    /// waiter failure or timeout.
    /// - Parameters:
    ///   - options: `WaiterOptions` to be used to configure this wait.
    ///   - input: The `DescribeFlowInput` object to be used as a parameter when performing the operation.
    /// - Returns: A `WaiterOutcome` with the result of the final, successful performance of the operation.
    /// - Throws: `WaiterFailureError` if the waiter fails due to matching an `Acceptor` with state `failure`
    /// or there is an error not handled by any `Acceptor.`
    /// `WaiterTimeoutError` if the waiter times out.
    public func waitUntilFlowStandby(options: SmithyWaitersAPI.WaiterOptions, input: DescribeFlowInput) async throws -> SmithyWaitersAPI.WaiterOutcome<DescribeFlowOutput> {
        let waiter = SmithyWaitersAPI.Waiter(config: try Self.flowStandbyWaiterConfig(), operation: self.describeFlow(input:))
        return try await waiter.waitUntil(options: options, input: input)
    }
}
