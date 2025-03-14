//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// Code generated by smithy-swift-codegen. DO NOT EDIT!

import protocol ClientRuntime.PaginateToken
import struct ClientRuntime.PaginatorSequence

extension KeyspacesClient {
    /// Paginate over `[ListKeyspacesOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListKeyspacesInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListKeyspacesOutput`
    public func listKeyspacesPaginated(input: ListKeyspacesInput) -> ClientRuntime.PaginatorSequence<ListKeyspacesInput, ListKeyspacesOutput> {
        return ClientRuntime.PaginatorSequence<ListKeyspacesInput, ListKeyspacesOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listKeyspaces(input:))
    }
}

extension ListKeyspacesInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListKeyspacesInput {
        return ListKeyspacesInput(
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListKeyspacesInput, OperationStackOutput == ListKeyspacesOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listKeyspacesPaginated`
    /// to access the nested member `[KeyspacesClientTypes.KeyspaceSummary]`
    /// - Returns: `[KeyspacesClientTypes.KeyspaceSummary]`
    public func keyspaces() async throws -> [KeyspacesClientTypes.KeyspaceSummary] {
        return try await self.asyncCompactMap { item in item.keyspaces }
    }
}
extension KeyspacesClient {
    /// Paginate over `[ListTablesOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListTablesInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListTablesOutput`
    public func listTablesPaginated(input: ListTablesInput) -> ClientRuntime.PaginatorSequence<ListTablesInput, ListTablesOutput> {
        return ClientRuntime.PaginatorSequence<ListTablesInput, ListTablesOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listTables(input:))
    }
}

extension ListTablesInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListTablesInput {
        return ListTablesInput(
            keyspaceName: self.keyspaceName,
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListTablesInput, OperationStackOutput == ListTablesOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listTablesPaginated`
    /// to access the nested member `[KeyspacesClientTypes.TableSummary]`
    /// - Returns: `[KeyspacesClientTypes.TableSummary]`
    public func tables() async throws -> [KeyspacesClientTypes.TableSummary] {
        return try await self.asyncCompactMap { item in item.tables }
    }
}
extension KeyspacesClient {
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
            maxResults: self.maxResults,
            nextToken: token,
            resourceArn: self.resourceArn
        )}
}

extension PaginatorSequence where OperationStackInput == ListTagsForResourceInput, OperationStackOutput == ListTagsForResourceOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listTagsForResourcePaginated`
    /// to access the nested member `[KeyspacesClientTypes.Tag]`
    /// - Returns: `[KeyspacesClientTypes.Tag]`
    public func tags() async throws -> [KeyspacesClientTypes.Tag] {
        return try await self.asyncCompactMap { item in item.tags }
    }
}
extension KeyspacesClient {
    /// Paginate over `[ListTypesOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListTypesInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListTypesOutput`
    public func listTypesPaginated(input: ListTypesInput) -> ClientRuntime.PaginatorSequence<ListTypesInput, ListTypesOutput> {
        return ClientRuntime.PaginatorSequence<ListTypesInput, ListTypesOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listTypes(input:))
    }
}

extension ListTypesInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListTypesInput {
        return ListTypesInput(
            keyspaceName: self.keyspaceName,
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListTypesInput, OperationStackOutput == ListTypesOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listTypesPaginated`
    /// to access the nested member `[Swift.String]`
    /// - Returns: `[Swift.String]`
    public func types() async throws -> [Swift.String] {
        return try await self.asyncCompactMap { item in item.types }
    }
}
