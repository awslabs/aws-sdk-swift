//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// Code generated by smithy-swift-codegen. DO NOT EDIT!

import protocol ClientRuntime.PaginateToken
import struct ClientRuntime.PaginatorSequence

extension OdbClient {
    /// Paginate over `[ListDbSystemShapesOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListDbSystemShapesInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListDbSystemShapesOutput`
    public func listDbSystemShapesPaginated(input: ListDbSystemShapesInput) -> ClientRuntime.PaginatorSequence<ListDbSystemShapesInput, ListDbSystemShapesOutput> {
        return ClientRuntime.PaginatorSequence<ListDbSystemShapesInput, ListDbSystemShapesOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listDbSystemShapes(input:))
    }
}

extension ListDbSystemShapesInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListDbSystemShapesInput {
        return ListDbSystemShapesInput(
            availabilityZone: self.availabilityZone,
            availabilityZoneId: self.availabilityZoneId,
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListDbSystemShapesInput, OperationStackOutput == ListDbSystemShapesOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listDbSystemShapesPaginated`
    /// to access the nested member `[OdbClientTypes.DbSystemShapeSummary]`
    /// - Returns: `[OdbClientTypes.DbSystemShapeSummary]`
    public func dbSystemShapes() async throws -> [OdbClientTypes.DbSystemShapeSummary] {
        return try await self.asyncCompactMap { item in item.dbSystemShapes }
    }
}
extension OdbClient {
    /// Paginate over `[ListGiVersionsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListGiVersionsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListGiVersionsOutput`
    public func listGiVersionsPaginated(input: ListGiVersionsInput) -> ClientRuntime.PaginatorSequence<ListGiVersionsInput, ListGiVersionsOutput> {
        return ClientRuntime.PaginatorSequence<ListGiVersionsInput, ListGiVersionsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listGiVersions(input:))
    }
}

extension ListGiVersionsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListGiVersionsInput {
        return ListGiVersionsInput(
            maxResults: self.maxResults,
            nextToken: token,
            shape: self.shape
        )}
}

extension PaginatorSequence where OperationStackInput == ListGiVersionsInput, OperationStackOutput == ListGiVersionsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listGiVersionsPaginated`
    /// to access the nested member `[OdbClientTypes.GiVersionSummary]`
    /// - Returns: `[OdbClientTypes.GiVersionSummary]`
    public func giVersions() async throws -> [OdbClientTypes.GiVersionSummary] {
        return try await self.asyncCompactMap { item in item.giVersions }
    }
}
extension OdbClient {
    /// Paginate over `[ListSystemVersionsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListSystemVersionsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListSystemVersionsOutput`
    public func listSystemVersionsPaginated(input: ListSystemVersionsInput) -> ClientRuntime.PaginatorSequence<ListSystemVersionsInput, ListSystemVersionsOutput> {
        return ClientRuntime.PaginatorSequence<ListSystemVersionsInput, ListSystemVersionsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listSystemVersions(input:))
    }
}

extension ListSystemVersionsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListSystemVersionsInput {
        return ListSystemVersionsInput(
            giVersion: self.giVersion,
            maxResults: self.maxResults,
            nextToken: token,
            shape: self.shape
        )}
}

extension PaginatorSequence where OperationStackInput == ListSystemVersionsInput, OperationStackOutput == ListSystemVersionsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listSystemVersionsPaginated`
    /// to access the nested member `[OdbClientTypes.SystemVersionSummary]`
    /// - Returns: `[OdbClientTypes.SystemVersionSummary]`
    public func systemVersions() async throws -> [OdbClientTypes.SystemVersionSummary] {
        return try await self.asyncCompactMap { item in item.systemVersions }
    }
}
