//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// Code generated by smithy-swift-codegen. DO NOT EDIT!

import protocol ClientRuntime.PaginateToken
import struct ClientRuntime.PaginatorSequence

extension TransferClient {
    /// Paginate over `[ListAccessesOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListAccessesInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListAccessesOutput`
    public func listAccessesPaginated(input: ListAccessesInput) -> ClientRuntime.PaginatorSequence<ListAccessesInput, ListAccessesOutput> {
        return ClientRuntime.PaginatorSequence<ListAccessesInput, ListAccessesOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listAccesses(input:))
    }
}

extension ListAccessesInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListAccessesInput {
        return ListAccessesInput(
            maxResults: self.maxResults,
            nextToken: token,
            serverId: self.serverId
        )}
}

extension PaginatorSequence where OperationStackInput == ListAccessesInput, OperationStackOutput == ListAccessesOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listAccessesPaginated`
    /// to access the nested member `[TransferClientTypes.ListedAccess]`
    /// - Returns: `[TransferClientTypes.ListedAccess]`
    public func accesses() async throws -> [TransferClientTypes.ListedAccess] {
        return try await self.asyncCompactMap { item in item.accesses }
    }
}
extension TransferClient {
    /// Paginate over `[ListExecutionsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListExecutionsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListExecutionsOutput`
    public func listExecutionsPaginated(input: ListExecutionsInput) -> ClientRuntime.PaginatorSequence<ListExecutionsInput, ListExecutionsOutput> {
        return ClientRuntime.PaginatorSequence<ListExecutionsInput, ListExecutionsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listExecutions(input:))
    }
}

extension ListExecutionsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListExecutionsInput {
        return ListExecutionsInput(
            maxResults: self.maxResults,
            nextToken: token,
            workflowId: self.workflowId
        )}
}

extension PaginatorSequence where OperationStackInput == ListExecutionsInput, OperationStackOutput == ListExecutionsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listExecutionsPaginated`
    /// to access the nested member `[TransferClientTypes.ListedExecution]`
    /// - Returns: `[TransferClientTypes.ListedExecution]`
    public func executions() async throws -> [TransferClientTypes.ListedExecution] {
        return try await self.asyncCompactMap { item in item.executions }
    }
}
extension TransferClient {
    /// Paginate over `[ListFileTransferResultsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListFileTransferResultsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListFileTransferResultsOutput`
    public func listFileTransferResultsPaginated(input: ListFileTransferResultsInput) -> ClientRuntime.PaginatorSequence<ListFileTransferResultsInput, ListFileTransferResultsOutput> {
        return ClientRuntime.PaginatorSequence<ListFileTransferResultsInput, ListFileTransferResultsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listFileTransferResults(input:))
    }
}

extension ListFileTransferResultsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListFileTransferResultsInput {
        return ListFileTransferResultsInput(
            connectorId: self.connectorId,
            maxResults: self.maxResults,
            nextToken: token,
            transferId: self.transferId
        )}
}

extension PaginatorSequence where OperationStackInput == ListFileTransferResultsInput, OperationStackOutput == ListFileTransferResultsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listFileTransferResultsPaginated`
    /// to access the nested member `[TransferClientTypes.ConnectorFileTransferResult]`
    /// - Returns: `[TransferClientTypes.ConnectorFileTransferResult]`
    public func fileTransferResults() async throws -> [TransferClientTypes.ConnectorFileTransferResult] {
        return try await self.asyncCompactMap { item in item.fileTransferResults }
    }
}
extension TransferClient {
    /// Paginate over `[ListSecurityPoliciesOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListSecurityPoliciesInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListSecurityPoliciesOutput`
    public func listSecurityPoliciesPaginated(input: ListSecurityPoliciesInput) -> ClientRuntime.PaginatorSequence<ListSecurityPoliciesInput, ListSecurityPoliciesOutput> {
        return ClientRuntime.PaginatorSequence<ListSecurityPoliciesInput, ListSecurityPoliciesOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listSecurityPolicies(input:))
    }
}

extension ListSecurityPoliciesInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListSecurityPoliciesInput {
        return ListSecurityPoliciesInput(
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListSecurityPoliciesInput, OperationStackOutput == ListSecurityPoliciesOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listSecurityPoliciesPaginated`
    /// to access the nested member `[Swift.String]`
    /// - Returns: `[Swift.String]`
    public func securityPolicyNames() async throws -> [Swift.String] {
        return try await self.asyncCompactMap { item in item.securityPolicyNames }
    }
}
extension TransferClient {
    /// Paginate over `[ListTagsForResourceOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListTagsForResourceInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListTagsForResourceOutput`
    public func listTagsForResourcePaginated(input: ListTagsForResourceInput) -> ClientRuntime.PaginatorSequence<ListTagsForResourceInput, ListTagsForResourceOutput> {
        return ClientRuntime.PaginatorSequence<ListTagsForResourceInput, ListTagsForResourceOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listTagsForResource(input:))
    }
}

extension ListTagsForResourceInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListTagsForResourceInput {
        return ListTagsForResourceInput(
            arn: self.arn,
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListTagsForResourceInput, OperationStackOutput == ListTagsForResourceOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listTagsForResourcePaginated`
    /// to access the nested member `[TransferClientTypes.Tag]`
    /// - Returns: `[TransferClientTypes.Tag]`
    public func tags() async throws -> [TransferClientTypes.Tag] {
        return try await self.asyncCompactMap { item in item.tags }
    }
}
