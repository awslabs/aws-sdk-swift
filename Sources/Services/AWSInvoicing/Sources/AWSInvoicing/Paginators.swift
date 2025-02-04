//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// Code generated by smithy-swift-codegen. DO NOT EDIT!

import Foundation
import protocol ClientRuntime.PaginateToken
import struct ClientRuntime.PaginatorSequence

extension InvoicingClient {
    /// Paginate over `[ListInvoiceUnitsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListInvoiceUnitsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListInvoiceUnitsOutput`
    public func listInvoiceUnitsPaginated(input: ListInvoiceUnitsInput) -> ClientRuntime.PaginatorSequence<ListInvoiceUnitsInput, ListInvoiceUnitsOutput> {
        return ClientRuntime.PaginatorSequence<ListInvoiceUnitsInput, ListInvoiceUnitsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listInvoiceUnits(input:))
    }
}

extension ListInvoiceUnitsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListInvoiceUnitsInput {
        return ListInvoiceUnitsInput(
            asOf: self.asOf,
            filters: self.filters,
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListInvoiceUnitsInput, OperationStackOutput == ListInvoiceUnitsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listInvoiceUnitsPaginated`
    /// to access the nested member `[InvoicingClientTypes.InvoiceUnit]`
    /// - Returns: `[InvoicingClientTypes.InvoiceUnit]`
    public func invoiceUnits() async throws -> [InvoicingClientTypes.InvoiceUnit] {
        return try await self.asyncCompactMap { item in item.invoiceUnits }
    }
}
