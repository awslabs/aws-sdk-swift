//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// Code generated by smithy-swift-codegen. DO NOT EDIT!

import class SmithyWaitersAPI.Waiter
import enum SmithyWaitersAPI.JMESUtils
import struct SmithyWaitersAPI.WaiterConfiguration
import struct SmithyWaitersAPI.WaiterOptions
import struct SmithyWaitersAPI.WaiterOutcome

extension Macie2Client {

    static func findingRevealedWaiterConfig() throws -> SmithyWaitersAPI.WaiterConfiguration<GetSensitiveDataOccurrencesInput, GetSensitiveDataOccurrencesOutput> {
        let acceptors: [SmithyWaitersAPI.WaiterConfiguration<GetSensitiveDataOccurrencesInput, GetSensitiveDataOccurrencesOutput>.Acceptor] = [
            .init(state: .success, matcher: { (input: GetSensitiveDataOccurrencesInput, result: Swift.Result<GetSensitiveDataOccurrencesOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "status"
                // JMESPath comparator: "stringEquals"
                // JMESPath expected value: "SUCCESS"
                guard case .success(let output) = result else { return false }
                let status = output.status
                return SmithyWaitersAPI.JMESUtils.compare(status, ==, "SUCCESS")
            }),
            .init(state: .success, matcher: { (input: GetSensitiveDataOccurrencesInput, result: Swift.Result<GetSensitiveDataOccurrencesOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "status"
                // JMESPath comparator: "stringEquals"
                // JMESPath expected value: "ERROR"
                guard case .success(let output) = result else { return false }
                let status = output.status
                return SmithyWaitersAPI.JMESUtils.compare(status, ==, "ERROR")
            }),
        ]
        return try SmithyWaitersAPI.WaiterConfiguration<GetSensitiveDataOccurrencesInput, GetSensitiveDataOccurrencesOutput>(acceptors: acceptors, minDelay: 2.0, maxDelay: 120.0)
    }

    /// Initiates waiting for the FindingRevealed event on the getSensitiveDataOccurrences operation.
    /// The operation will be tried and (if necessary) retried until the wait succeeds, fails, or times out.
    /// Returns a `WaiterOutcome` asynchronously on waiter success, throws an error asynchronously on
    /// waiter failure or timeout.
    /// - Parameters:
    ///   - options: `WaiterOptions` to be used to configure this wait.
    ///   - input: The `GetSensitiveDataOccurrencesInput` object to be used as a parameter when performing the operation.
    /// - Returns: A `WaiterOutcome` with the result of the final, successful performance of the operation.
    /// - Throws: `WaiterFailureError` if the waiter fails due to matching an `Acceptor` with state `failure`
    /// or there is an error not handled by any `Acceptor.`
    /// `WaiterTimeoutError` if the waiter times out.
    public func waitUntilFindingRevealed(options: SmithyWaitersAPI.WaiterOptions, input: GetSensitiveDataOccurrencesInput) async throws -> SmithyWaitersAPI.WaiterOutcome<GetSensitiveDataOccurrencesOutput> {
        let waiter = SmithyWaitersAPI.Waiter(config: try Self.findingRevealedWaiterConfig(), operation: self.getSensitiveDataOccurrences(input:))
        return try await waiter.waitUntil(options: options, input: input)
    }
}
