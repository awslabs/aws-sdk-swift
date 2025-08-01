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

extension RedshiftClient {

    static func clusterAvailableWaiterConfig() throws -> SmithyWaitersAPI.WaiterConfiguration<DescribeClustersInput, DescribeClustersOutput> {
        let acceptors: [SmithyWaitersAPI.WaiterConfiguration<DescribeClustersInput, DescribeClustersOutput>.Acceptor] = [
            .init(state: .success, matcher: { (input: DescribeClustersInput, result: Swift.Result<DescribeClustersOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "Clusters[].ClusterStatus"
                // JMESPath comparator: "allStringEquals"
                // JMESPath expected value: "available"
                guard case .success(let output) = result else { return false }
                let clusters = output.clusters
                let projection: [Swift.String]? = clusters?.compactMap { original in
                    let clusterStatus = original.clusterStatus
                    return clusterStatus
                }
                return (projection?.count ?? 0) >= 1 && (projection?.allSatisfy { SmithyWaitersAPI.JMESUtils.compare($0, ==, "available") } ?? false)
            }),
            .init(state: .failure, matcher: { (input: DescribeClustersInput, result: Swift.Result<DescribeClustersOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "Clusters[].ClusterStatus"
                // JMESPath comparator: "anyStringEquals"
                // JMESPath expected value: "deleting"
                guard case .success(let output) = result else { return false }
                let clusters = output.clusters
                let projection: [Swift.String]? = clusters?.compactMap { original in
                    let clusterStatus = original.clusterStatus
                    return clusterStatus
                }
                return projection?.contains(where: { SmithyWaitersAPI.JMESUtils.compare($0, ==, "deleting") }) ?? false
            }),
            .init(state: .retry, matcher: { (input: DescribeClustersInput, result: Swift.Result<DescribeClustersOutput, Swift.Error>) -> Bool in
                guard case .failure(let error) = result else { return false }
                return (error as? ClientRuntime.ServiceError)?.typeName == "ClusterNotFound"
            }),
        ]
        return try SmithyWaitersAPI.WaiterConfiguration<DescribeClustersInput, DescribeClustersOutput>(acceptors: acceptors, minDelay: 60.0, maxDelay: 120.0)
    }

    /// Initiates waiting for the ClusterAvailable event on the describeClusters operation.
    /// The operation will be tried and (if necessary) retried until the wait succeeds, fails, or times out.
    /// Returns a `WaiterOutcome` asynchronously on waiter success, throws an error asynchronously on
    /// waiter failure or timeout.
    /// - Parameters:
    ///   - options: `WaiterOptions` to be used to configure this wait.
    ///   - input: The `DescribeClustersInput` object to be used as a parameter when performing the operation.
    /// - Returns: A `WaiterOutcome` with the result of the final, successful performance of the operation.
    /// - Throws: `WaiterFailureError` if the waiter fails due to matching an `Acceptor` with state `failure`
    /// or there is an error not handled by any `Acceptor.`
    /// `WaiterTimeoutError` if the waiter times out.
    public func waitUntilClusterAvailable(options: SmithyWaitersAPI.WaiterOptions, input: DescribeClustersInput) async throws -> SmithyWaitersAPI.WaiterOutcome<DescribeClustersOutput> {
        let waiter = SmithyWaitersAPI.Waiter(config: try Self.clusterAvailableWaiterConfig(), operation: self.describeClusters(input:))
        return try await waiter.waitUntil(options: options, input: input)
    }

    static func clusterDeletedWaiterConfig() throws -> SmithyWaitersAPI.WaiterConfiguration<DescribeClustersInput, DescribeClustersOutput> {
        let acceptors: [SmithyWaitersAPI.WaiterConfiguration<DescribeClustersInput, DescribeClustersOutput>.Acceptor] = [
            .init(state: .success, matcher: { (input: DescribeClustersInput, result: Swift.Result<DescribeClustersOutput, Swift.Error>) -> Bool in
                guard case .failure(let error) = result else { return false }
                return (error as? ClientRuntime.ServiceError)?.typeName == "ClusterNotFound"
            }),
            .init(state: .failure, matcher: { (input: DescribeClustersInput, result: Swift.Result<DescribeClustersOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "Clusters[].ClusterStatus"
                // JMESPath comparator: "anyStringEquals"
                // JMESPath expected value: "creating"
                guard case .success(let output) = result else { return false }
                let clusters = output.clusters
                let projection: [Swift.String]? = clusters?.compactMap { original in
                    let clusterStatus = original.clusterStatus
                    return clusterStatus
                }
                return projection?.contains(where: { SmithyWaitersAPI.JMESUtils.compare($0, ==, "creating") }) ?? false
            }),
            .init(state: .failure, matcher: { (input: DescribeClustersInput, result: Swift.Result<DescribeClustersOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "Clusters[].ClusterStatus"
                // JMESPath comparator: "anyStringEquals"
                // JMESPath expected value: "modifying"
                guard case .success(let output) = result else { return false }
                let clusters = output.clusters
                let projection: [Swift.String]? = clusters?.compactMap { original in
                    let clusterStatus = original.clusterStatus
                    return clusterStatus
                }
                return projection?.contains(where: { SmithyWaitersAPI.JMESUtils.compare($0, ==, "modifying") }) ?? false
            }),
        ]
        return try SmithyWaitersAPI.WaiterConfiguration<DescribeClustersInput, DescribeClustersOutput>(acceptors: acceptors, minDelay: 60.0, maxDelay: 120.0)
    }

    /// Initiates waiting for the ClusterDeleted event on the describeClusters operation.
    /// The operation will be tried and (if necessary) retried until the wait succeeds, fails, or times out.
    /// Returns a `WaiterOutcome` asynchronously on waiter success, throws an error asynchronously on
    /// waiter failure or timeout.
    /// - Parameters:
    ///   - options: `WaiterOptions` to be used to configure this wait.
    ///   - input: The `DescribeClustersInput` object to be used as a parameter when performing the operation.
    /// - Returns: A `WaiterOutcome` with the result of the final, successful performance of the operation.
    /// - Throws: `WaiterFailureError` if the waiter fails due to matching an `Acceptor` with state `failure`
    /// or there is an error not handled by any `Acceptor.`
    /// `WaiterTimeoutError` if the waiter times out.
    public func waitUntilClusterDeleted(options: SmithyWaitersAPI.WaiterOptions, input: DescribeClustersInput) async throws -> SmithyWaitersAPI.WaiterOutcome<DescribeClustersOutput> {
        let waiter = SmithyWaitersAPI.Waiter(config: try Self.clusterDeletedWaiterConfig(), operation: self.describeClusters(input:))
        return try await waiter.waitUntil(options: options, input: input)
    }

    static func clusterRestoredWaiterConfig() throws -> SmithyWaitersAPI.WaiterConfiguration<DescribeClustersInput, DescribeClustersOutput> {
        let acceptors: [SmithyWaitersAPI.WaiterConfiguration<DescribeClustersInput, DescribeClustersOutput>.Acceptor] = [
            .init(state: .success, matcher: { (input: DescribeClustersInput, result: Swift.Result<DescribeClustersOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "Clusters[].RestoreStatus.Status"
                // JMESPath comparator: "allStringEquals"
                // JMESPath expected value: "completed"
                guard case .success(let output) = result else { return false }
                let clusters = output.clusters
                let projection: [Swift.String]? = clusters?.compactMap { original in
                    let restoreStatus = original.restoreStatus
                    let status = restoreStatus?.status
                    return status
                }
                return (projection?.count ?? 0) >= 1 && (projection?.allSatisfy { SmithyWaitersAPI.JMESUtils.compare($0, ==, "completed") } ?? false)
            }),
            .init(state: .failure, matcher: { (input: DescribeClustersInput, result: Swift.Result<DescribeClustersOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "Clusters[].ClusterStatus"
                // JMESPath comparator: "anyStringEquals"
                // JMESPath expected value: "deleting"
                guard case .success(let output) = result else { return false }
                let clusters = output.clusters
                let projection: [Swift.String]? = clusters?.compactMap { original in
                    let clusterStatus = original.clusterStatus
                    return clusterStatus
                }
                return projection?.contains(where: { SmithyWaitersAPI.JMESUtils.compare($0, ==, "deleting") }) ?? false
            }),
        ]
        return try SmithyWaitersAPI.WaiterConfiguration<DescribeClustersInput, DescribeClustersOutput>(acceptors: acceptors, minDelay: 60.0, maxDelay: 120.0)
    }

    /// Initiates waiting for the ClusterRestored event on the describeClusters operation.
    /// The operation will be tried and (if necessary) retried until the wait succeeds, fails, or times out.
    /// Returns a `WaiterOutcome` asynchronously on waiter success, throws an error asynchronously on
    /// waiter failure or timeout.
    /// - Parameters:
    ///   - options: `WaiterOptions` to be used to configure this wait.
    ///   - input: The `DescribeClustersInput` object to be used as a parameter when performing the operation.
    /// - Returns: A `WaiterOutcome` with the result of the final, successful performance of the operation.
    /// - Throws: `WaiterFailureError` if the waiter fails due to matching an `Acceptor` with state `failure`
    /// or there is an error not handled by any `Acceptor.`
    /// `WaiterTimeoutError` if the waiter times out.
    public func waitUntilClusterRestored(options: SmithyWaitersAPI.WaiterOptions, input: DescribeClustersInput) async throws -> SmithyWaitersAPI.WaiterOutcome<DescribeClustersOutput> {
        let waiter = SmithyWaitersAPI.Waiter(config: try Self.clusterRestoredWaiterConfig(), operation: self.describeClusters(input:))
        return try await waiter.waitUntil(options: options, input: input)
    }

    static func snapshotAvailableWaiterConfig() throws -> SmithyWaitersAPI.WaiterConfiguration<DescribeClusterSnapshotsInput, DescribeClusterSnapshotsOutput> {
        let acceptors: [SmithyWaitersAPI.WaiterConfiguration<DescribeClusterSnapshotsInput, DescribeClusterSnapshotsOutput>.Acceptor] = [
            .init(state: .success, matcher: { (input: DescribeClusterSnapshotsInput, result: Swift.Result<DescribeClusterSnapshotsOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "Snapshots[].Status"
                // JMESPath comparator: "allStringEquals"
                // JMESPath expected value: "available"
                guard case .success(let output) = result else { return false }
                let snapshots = output.snapshots
                let projection: [Swift.String]? = snapshots?.compactMap { original in
                    let status = original.status
                    return status
                }
                return (projection?.count ?? 0) >= 1 && (projection?.allSatisfy { SmithyWaitersAPI.JMESUtils.compare($0, ==, "available") } ?? false)
            }),
            .init(state: .failure, matcher: { (input: DescribeClusterSnapshotsInput, result: Swift.Result<DescribeClusterSnapshotsOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "Snapshots[].Status"
                // JMESPath comparator: "anyStringEquals"
                // JMESPath expected value: "failed"
                guard case .success(let output) = result else { return false }
                let snapshots = output.snapshots
                let projection: [Swift.String]? = snapshots?.compactMap { original in
                    let status = original.status
                    return status
                }
                return projection?.contains(where: { SmithyWaitersAPI.JMESUtils.compare($0, ==, "failed") }) ?? false
            }),
            .init(state: .failure, matcher: { (input: DescribeClusterSnapshotsInput, result: Swift.Result<DescribeClusterSnapshotsOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "Snapshots[].Status"
                // JMESPath comparator: "anyStringEquals"
                // JMESPath expected value: "deleted"
                guard case .success(let output) = result else { return false }
                let snapshots = output.snapshots
                let projection: [Swift.String]? = snapshots?.compactMap { original in
                    let status = original.status
                    return status
                }
                return projection?.contains(where: { SmithyWaitersAPI.JMESUtils.compare($0, ==, "deleted") }) ?? false
            }),
        ]
        return try SmithyWaitersAPI.WaiterConfiguration<DescribeClusterSnapshotsInput, DescribeClusterSnapshotsOutput>(acceptors: acceptors, minDelay: 15.0, maxDelay: 120.0)
    }

    /// Initiates waiting for the SnapshotAvailable event on the describeClusterSnapshots operation.
    /// The operation will be tried and (if necessary) retried until the wait succeeds, fails, or times out.
    /// Returns a `WaiterOutcome` asynchronously on waiter success, throws an error asynchronously on
    /// waiter failure or timeout.
    /// - Parameters:
    ///   - options: `WaiterOptions` to be used to configure this wait.
    ///   - input: The `DescribeClusterSnapshotsInput` object to be used as a parameter when performing the operation.
    /// - Returns: A `WaiterOutcome` with the result of the final, successful performance of the operation.
    /// - Throws: `WaiterFailureError` if the waiter fails due to matching an `Acceptor` with state `failure`
    /// or there is an error not handled by any `Acceptor.`
    /// `WaiterTimeoutError` if the waiter times out.
    public func waitUntilSnapshotAvailable(options: SmithyWaitersAPI.WaiterOptions, input: DescribeClusterSnapshotsInput) async throws -> SmithyWaitersAPI.WaiterOutcome<DescribeClusterSnapshotsOutput> {
        let waiter = SmithyWaitersAPI.Waiter(config: try Self.snapshotAvailableWaiterConfig(), operation: self.describeClusterSnapshots(input:))
        return try await waiter.waitUntil(options: options, input: input)
    }
}
