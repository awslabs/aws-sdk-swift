//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// Code generated by smithy-swift-codegen. DO NOT EDIT!

import protocol ClientRuntime.PaginateToken
import struct ClientRuntime.PaginatorSequence

extension DataExchangeClient {
    /// Paginate over `[ListDataGrantsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListDataGrantsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListDataGrantsOutput`
    public func listDataGrantsPaginated(input: ListDataGrantsInput) -> ClientRuntime.PaginatorSequence<ListDataGrantsInput, ListDataGrantsOutput> {
        return ClientRuntime.PaginatorSequence<ListDataGrantsInput, ListDataGrantsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listDataGrants(input:))
    }
}

extension ListDataGrantsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListDataGrantsInput {
        return ListDataGrantsInput(
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListDataGrantsInput, OperationStackOutput == ListDataGrantsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listDataGrantsPaginated`
    /// to access the nested member `[DataExchangeClientTypes.DataGrantSummaryEntry]`
    /// - Returns: `[DataExchangeClientTypes.DataGrantSummaryEntry]`
    public func dataGrantSummaries() async throws -> [DataExchangeClientTypes.DataGrantSummaryEntry] {
        return try await self.asyncCompactMap { item in item.dataGrantSummaries }
    }
}
extension DataExchangeClient {
    /// Paginate over `[ListDataSetRevisionsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListDataSetRevisionsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListDataSetRevisionsOutput`
    public func listDataSetRevisionsPaginated(input: ListDataSetRevisionsInput) -> ClientRuntime.PaginatorSequence<ListDataSetRevisionsInput, ListDataSetRevisionsOutput> {
        return ClientRuntime.PaginatorSequence<ListDataSetRevisionsInput, ListDataSetRevisionsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listDataSetRevisions(input:))
    }
}

extension ListDataSetRevisionsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListDataSetRevisionsInput {
        return ListDataSetRevisionsInput(
            dataSetId: self.dataSetId,
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListDataSetRevisionsInput, OperationStackOutput == ListDataSetRevisionsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listDataSetRevisionsPaginated`
    /// to access the nested member `[DataExchangeClientTypes.RevisionEntry]`
    /// - Returns: `[DataExchangeClientTypes.RevisionEntry]`
    public func revisions() async throws -> [DataExchangeClientTypes.RevisionEntry] {
        return try await self.asyncCompactMap { item in item.revisions }
    }
}
extension DataExchangeClient {
    /// Paginate over `[ListDataSetsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListDataSetsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListDataSetsOutput`
    public func listDataSetsPaginated(input: ListDataSetsInput) -> ClientRuntime.PaginatorSequence<ListDataSetsInput, ListDataSetsOutput> {
        return ClientRuntime.PaginatorSequence<ListDataSetsInput, ListDataSetsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listDataSets(input:))
    }
}

extension ListDataSetsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListDataSetsInput {
        return ListDataSetsInput(
            maxResults: self.maxResults,
            nextToken: token,
            origin: self.origin
        )}
}

extension PaginatorSequence where OperationStackInput == ListDataSetsInput, OperationStackOutput == ListDataSetsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listDataSetsPaginated`
    /// to access the nested member `[DataExchangeClientTypes.DataSetEntry]`
    /// - Returns: `[DataExchangeClientTypes.DataSetEntry]`
    public func dataSets() async throws -> [DataExchangeClientTypes.DataSetEntry] {
        return try await self.asyncCompactMap { item in item.dataSets }
    }
}
extension DataExchangeClient {
    /// Paginate over `[ListEventActionsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListEventActionsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListEventActionsOutput`
    public func listEventActionsPaginated(input: ListEventActionsInput) -> ClientRuntime.PaginatorSequence<ListEventActionsInput, ListEventActionsOutput> {
        return ClientRuntime.PaginatorSequence<ListEventActionsInput, ListEventActionsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listEventActions(input:))
    }
}

extension ListEventActionsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListEventActionsInput {
        return ListEventActionsInput(
            eventSourceId: self.eventSourceId,
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListEventActionsInput, OperationStackOutput == ListEventActionsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listEventActionsPaginated`
    /// to access the nested member `[DataExchangeClientTypes.EventActionEntry]`
    /// - Returns: `[DataExchangeClientTypes.EventActionEntry]`
    public func eventActions() async throws -> [DataExchangeClientTypes.EventActionEntry] {
        return try await self.asyncCompactMap { item in item.eventActions }
    }
}
extension DataExchangeClient {
    /// Paginate over `[ListJobsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListJobsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListJobsOutput`
    public func listJobsPaginated(input: ListJobsInput) -> ClientRuntime.PaginatorSequence<ListJobsInput, ListJobsOutput> {
        return ClientRuntime.PaginatorSequence<ListJobsInput, ListJobsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listJobs(input:))
    }
}

extension ListJobsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListJobsInput {
        return ListJobsInput(
            dataSetId: self.dataSetId,
            maxResults: self.maxResults,
            nextToken: token,
            revisionId: self.revisionId
        )}
}

extension PaginatorSequence where OperationStackInput == ListJobsInput, OperationStackOutput == ListJobsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listJobsPaginated`
    /// to access the nested member `[DataExchangeClientTypes.JobEntry]`
    /// - Returns: `[DataExchangeClientTypes.JobEntry]`
    public func jobs() async throws -> [DataExchangeClientTypes.JobEntry] {
        return try await self.asyncCompactMap { item in item.jobs }
    }
}
extension DataExchangeClient {
    /// Paginate over `[ListReceivedDataGrantsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListReceivedDataGrantsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListReceivedDataGrantsOutput`
    public func listReceivedDataGrantsPaginated(input: ListReceivedDataGrantsInput) -> ClientRuntime.PaginatorSequence<ListReceivedDataGrantsInput, ListReceivedDataGrantsOutput> {
        return ClientRuntime.PaginatorSequence<ListReceivedDataGrantsInput, ListReceivedDataGrantsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listReceivedDataGrants(input:))
    }
}

extension ListReceivedDataGrantsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListReceivedDataGrantsInput {
        return ListReceivedDataGrantsInput(
            acceptanceState: self.acceptanceState,
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListReceivedDataGrantsInput, OperationStackOutput == ListReceivedDataGrantsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listReceivedDataGrantsPaginated`
    /// to access the nested member `[DataExchangeClientTypes.ReceivedDataGrantSummariesEntry]`
    /// - Returns: `[DataExchangeClientTypes.ReceivedDataGrantSummariesEntry]`
    public func dataGrantSummaries() async throws -> [DataExchangeClientTypes.ReceivedDataGrantSummariesEntry] {
        return try await self.asyncCompactMap { item in item.dataGrantSummaries }
    }
}
extension DataExchangeClient {
    /// Paginate over `[ListRevisionAssetsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListRevisionAssetsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListRevisionAssetsOutput`
    public func listRevisionAssetsPaginated(input: ListRevisionAssetsInput) -> ClientRuntime.PaginatorSequence<ListRevisionAssetsInput, ListRevisionAssetsOutput> {
        return ClientRuntime.PaginatorSequence<ListRevisionAssetsInput, ListRevisionAssetsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listRevisionAssets(input:))
    }
}

extension ListRevisionAssetsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListRevisionAssetsInput {
        return ListRevisionAssetsInput(
            dataSetId: self.dataSetId,
            maxResults: self.maxResults,
            nextToken: token,
            revisionId: self.revisionId
        )}
}

extension PaginatorSequence where OperationStackInput == ListRevisionAssetsInput, OperationStackOutput == ListRevisionAssetsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listRevisionAssetsPaginated`
    /// to access the nested member `[DataExchangeClientTypes.AssetEntry]`
    /// - Returns: `[DataExchangeClientTypes.AssetEntry]`
    public func assets() async throws -> [DataExchangeClientTypes.AssetEntry] {
        return try await self.asyncCompactMap { item in item.assets }
    }
}
