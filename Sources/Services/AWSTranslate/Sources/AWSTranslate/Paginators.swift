//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// Code generated by smithy-swift-codegen. DO NOT EDIT!

import protocol ClientRuntime.PaginateToken
import struct ClientRuntime.PaginatorSequence

extension TranslateClient {
    /// Paginate over `[ListLanguagesOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListLanguagesInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListLanguagesOutput`
    public func listLanguagesPaginated(input: ListLanguagesInput) -> ClientRuntime.PaginatorSequence<ListLanguagesInput, ListLanguagesOutput> {
        return ClientRuntime.PaginatorSequence<ListLanguagesInput, ListLanguagesOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listLanguages(input:))
    }
}

extension ListLanguagesInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListLanguagesInput {
        return ListLanguagesInput(
            displayLanguageCode: self.displayLanguageCode,
            maxResults: self.maxResults,
            nextToken: token
        )}
}
extension TranslateClient {
    /// Paginate over `[ListParallelDataOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListParallelDataInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListParallelDataOutput`
    public func listParallelDataPaginated(input: ListParallelDataInput) -> ClientRuntime.PaginatorSequence<ListParallelDataInput, ListParallelDataOutput> {
        return ClientRuntime.PaginatorSequence<ListParallelDataInput, ListParallelDataOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listParallelData(input:))
    }
}

extension ListParallelDataInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListParallelDataInput {
        return ListParallelDataInput(
            maxResults: self.maxResults,
            nextToken: token
        )}
}
extension TranslateClient {
    /// Paginate over `[ListTerminologiesOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListTerminologiesInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListTerminologiesOutput`
    public func listTerminologiesPaginated(input: ListTerminologiesInput) -> ClientRuntime.PaginatorSequence<ListTerminologiesInput, ListTerminologiesOutput> {
        return ClientRuntime.PaginatorSequence<ListTerminologiesInput, ListTerminologiesOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listTerminologies(input:))
    }
}

extension ListTerminologiesInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListTerminologiesInput {
        return ListTerminologiesInput(
            maxResults: self.maxResults,
            nextToken: token
        )}
}
extension TranslateClient {
    /// Paginate over `[ListTextTranslationJobsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListTextTranslationJobsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListTextTranslationJobsOutput`
    public func listTextTranslationJobsPaginated(input: ListTextTranslationJobsInput) -> ClientRuntime.PaginatorSequence<ListTextTranslationJobsInput, ListTextTranslationJobsOutput> {
        return ClientRuntime.PaginatorSequence<ListTextTranslationJobsInput, ListTextTranslationJobsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listTextTranslationJobs(input:))
    }
}

extension ListTextTranslationJobsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListTextTranslationJobsInput {
        return ListTextTranslationJobsInput(
            filter: self.filter,
            maxResults: self.maxResults,
            nextToken: token
        )}
}
