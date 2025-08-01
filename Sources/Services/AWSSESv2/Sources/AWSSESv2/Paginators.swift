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

extension SESv2Client {
    /// Paginate over `[GetDedicatedIpsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[GetDedicatedIpsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `GetDedicatedIpsOutput`
    public func getDedicatedIpsPaginated(input: GetDedicatedIpsInput) -> ClientRuntime.PaginatorSequence<GetDedicatedIpsInput, GetDedicatedIpsOutput> {
        return ClientRuntime.PaginatorSequence<GetDedicatedIpsInput, GetDedicatedIpsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.getDedicatedIps(input:))
    }
}

extension GetDedicatedIpsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> GetDedicatedIpsInput {
        return GetDedicatedIpsInput(
            nextToken: token,
            pageSize: self.pageSize,
            poolName: self.poolName
        )}
}
extension SESv2Client {
    /// Paginate over `[ListConfigurationSetsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListConfigurationSetsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListConfigurationSetsOutput`
    public func listConfigurationSetsPaginated(input: ListConfigurationSetsInput) -> ClientRuntime.PaginatorSequence<ListConfigurationSetsInput, ListConfigurationSetsOutput> {
        return ClientRuntime.PaginatorSequence<ListConfigurationSetsInput, ListConfigurationSetsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listConfigurationSets(input:))
    }
}

extension ListConfigurationSetsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListConfigurationSetsInput {
        return ListConfigurationSetsInput(
            nextToken: token,
            pageSize: self.pageSize
        )}
}
extension SESv2Client {
    /// Paginate over `[ListContactListsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListContactListsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListContactListsOutput`
    public func listContactListsPaginated(input: ListContactListsInput) -> ClientRuntime.PaginatorSequence<ListContactListsInput, ListContactListsOutput> {
        return ClientRuntime.PaginatorSequence<ListContactListsInput, ListContactListsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listContactLists(input:))
    }
}

extension ListContactListsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListContactListsInput {
        return ListContactListsInput(
            nextToken: token,
            pageSize: self.pageSize
        )}
}
extension SESv2Client {
    /// Paginate over `[ListContactsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListContactsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListContactsOutput`
    public func listContactsPaginated(input: ListContactsInput) -> ClientRuntime.PaginatorSequence<ListContactsInput, ListContactsOutput> {
        return ClientRuntime.PaginatorSequence<ListContactsInput, ListContactsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listContacts(input:))
    }
}

extension ListContactsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListContactsInput {
        return ListContactsInput(
            contactListName: self.contactListName,
            filter: self.filter,
            nextToken: token,
            pageSize: self.pageSize
        )}
}
extension SESv2Client {
    /// Paginate over `[ListCustomVerificationEmailTemplatesOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListCustomVerificationEmailTemplatesInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListCustomVerificationEmailTemplatesOutput`
    public func listCustomVerificationEmailTemplatesPaginated(input: ListCustomVerificationEmailTemplatesInput) -> ClientRuntime.PaginatorSequence<ListCustomVerificationEmailTemplatesInput, ListCustomVerificationEmailTemplatesOutput> {
        return ClientRuntime.PaginatorSequence<ListCustomVerificationEmailTemplatesInput, ListCustomVerificationEmailTemplatesOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listCustomVerificationEmailTemplates(input:))
    }
}

extension ListCustomVerificationEmailTemplatesInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListCustomVerificationEmailTemplatesInput {
        return ListCustomVerificationEmailTemplatesInput(
            nextToken: token,
            pageSize: self.pageSize
        )}
}
extension SESv2Client {
    /// Paginate over `[ListDedicatedIpPoolsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListDedicatedIpPoolsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListDedicatedIpPoolsOutput`
    public func listDedicatedIpPoolsPaginated(input: ListDedicatedIpPoolsInput) -> ClientRuntime.PaginatorSequence<ListDedicatedIpPoolsInput, ListDedicatedIpPoolsOutput> {
        return ClientRuntime.PaginatorSequence<ListDedicatedIpPoolsInput, ListDedicatedIpPoolsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listDedicatedIpPools(input:))
    }
}

extension ListDedicatedIpPoolsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListDedicatedIpPoolsInput {
        return ListDedicatedIpPoolsInput(
            nextToken: token,
            pageSize: self.pageSize
        )}
}
extension SESv2Client {
    /// Paginate over `[ListDeliverabilityTestReportsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListDeliverabilityTestReportsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListDeliverabilityTestReportsOutput`
    public func listDeliverabilityTestReportsPaginated(input: ListDeliverabilityTestReportsInput) -> ClientRuntime.PaginatorSequence<ListDeliverabilityTestReportsInput, ListDeliverabilityTestReportsOutput> {
        return ClientRuntime.PaginatorSequence<ListDeliverabilityTestReportsInput, ListDeliverabilityTestReportsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listDeliverabilityTestReports(input:))
    }
}

extension ListDeliverabilityTestReportsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListDeliverabilityTestReportsInput {
        return ListDeliverabilityTestReportsInput(
            nextToken: token,
            pageSize: self.pageSize
        )}
}
extension SESv2Client {
    /// Paginate over `[ListDomainDeliverabilityCampaignsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListDomainDeliverabilityCampaignsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListDomainDeliverabilityCampaignsOutput`
    public func listDomainDeliverabilityCampaignsPaginated(input: ListDomainDeliverabilityCampaignsInput) -> ClientRuntime.PaginatorSequence<ListDomainDeliverabilityCampaignsInput, ListDomainDeliverabilityCampaignsOutput> {
        return ClientRuntime.PaginatorSequence<ListDomainDeliverabilityCampaignsInput, ListDomainDeliverabilityCampaignsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listDomainDeliverabilityCampaigns(input:))
    }
}

extension ListDomainDeliverabilityCampaignsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListDomainDeliverabilityCampaignsInput {
        return ListDomainDeliverabilityCampaignsInput(
            endDate: self.endDate,
            nextToken: token,
            pageSize: self.pageSize,
            startDate: self.startDate,
            subscribedDomain: self.subscribedDomain
        )}
}
extension SESv2Client {
    /// Paginate over `[ListEmailIdentitiesOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListEmailIdentitiesInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListEmailIdentitiesOutput`
    public func listEmailIdentitiesPaginated(input: ListEmailIdentitiesInput) -> ClientRuntime.PaginatorSequence<ListEmailIdentitiesInput, ListEmailIdentitiesOutput> {
        return ClientRuntime.PaginatorSequence<ListEmailIdentitiesInput, ListEmailIdentitiesOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listEmailIdentities(input:))
    }
}

extension ListEmailIdentitiesInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListEmailIdentitiesInput {
        return ListEmailIdentitiesInput(
            nextToken: token,
            pageSize: self.pageSize
        )}
}
extension SESv2Client {
    /// Paginate over `[ListEmailTemplatesOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListEmailTemplatesInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListEmailTemplatesOutput`
    public func listEmailTemplatesPaginated(input: ListEmailTemplatesInput) -> ClientRuntime.PaginatorSequence<ListEmailTemplatesInput, ListEmailTemplatesOutput> {
        return ClientRuntime.PaginatorSequence<ListEmailTemplatesInput, ListEmailTemplatesOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listEmailTemplates(input:))
    }
}

extension ListEmailTemplatesInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListEmailTemplatesInput {
        return ListEmailTemplatesInput(
            nextToken: token,
            pageSize: self.pageSize
        )}
}
extension SESv2Client {
    /// Paginate over `[ListExportJobsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListExportJobsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListExportJobsOutput`
    public func listExportJobsPaginated(input: ListExportJobsInput) -> ClientRuntime.PaginatorSequence<ListExportJobsInput, ListExportJobsOutput> {
        return ClientRuntime.PaginatorSequence<ListExportJobsInput, ListExportJobsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listExportJobs(input:))
    }
}

extension ListExportJobsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListExportJobsInput {
        return ListExportJobsInput(
            exportSourceType: self.exportSourceType,
            jobStatus: self.jobStatus,
            nextToken: token,
            pageSize: self.pageSize
        )}
}
extension SESv2Client {
    /// Paginate over `[ListImportJobsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListImportJobsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListImportJobsOutput`
    public func listImportJobsPaginated(input: ListImportJobsInput) -> ClientRuntime.PaginatorSequence<ListImportJobsInput, ListImportJobsOutput> {
        return ClientRuntime.PaginatorSequence<ListImportJobsInput, ListImportJobsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listImportJobs(input:))
    }
}

extension ListImportJobsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListImportJobsInput {
        return ListImportJobsInput(
            importDestinationType: self.importDestinationType,
            nextToken: token,
            pageSize: self.pageSize
        )}
}
extension SESv2Client {
    /// Paginate over `[ListMultiRegionEndpointsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListMultiRegionEndpointsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListMultiRegionEndpointsOutput`
    public func listMultiRegionEndpointsPaginated(input: ListMultiRegionEndpointsInput) -> ClientRuntime.PaginatorSequence<ListMultiRegionEndpointsInput, ListMultiRegionEndpointsOutput> {
        return ClientRuntime.PaginatorSequence<ListMultiRegionEndpointsInput, ListMultiRegionEndpointsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listMultiRegionEndpoints(input:))
    }
}

extension ListMultiRegionEndpointsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListMultiRegionEndpointsInput {
        return ListMultiRegionEndpointsInput(
            nextToken: token,
            pageSize: self.pageSize
        )}
}

extension PaginatorSequence where OperationStackInput == ListMultiRegionEndpointsInput, OperationStackOutput == ListMultiRegionEndpointsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listMultiRegionEndpointsPaginated`
    /// to access the nested member `[SESv2ClientTypes.MultiRegionEndpoint]`
    /// - Returns: `[SESv2ClientTypes.MultiRegionEndpoint]`
    public func multiRegionEndpoints() async throws -> [SESv2ClientTypes.MultiRegionEndpoint] {
        return try await self.asyncCompactMap { item in item.multiRegionEndpoints }
    }
}
extension SESv2Client {
    /// Paginate over `[ListRecommendationsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListRecommendationsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListRecommendationsOutput`
    public func listRecommendationsPaginated(input: ListRecommendationsInput) -> ClientRuntime.PaginatorSequence<ListRecommendationsInput, ListRecommendationsOutput> {
        return ClientRuntime.PaginatorSequence<ListRecommendationsInput, ListRecommendationsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listRecommendations(input:))
    }
}

extension ListRecommendationsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListRecommendationsInput {
        return ListRecommendationsInput(
            filter: self.filter,
            nextToken: token,
            pageSize: self.pageSize
        )}
}
extension SESv2Client {
    /// Paginate over `[ListReputationEntitiesOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListReputationEntitiesInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListReputationEntitiesOutput`
    public func listReputationEntitiesPaginated(input: ListReputationEntitiesInput) -> ClientRuntime.PaginatorSequence<ListReputationEntitiesInput, ListReputationEntitiesOutput> {
        return ClientRuntime.PaginatorSequence<ListReputationEntitiesInput, ListReputationEntitiesOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listReputationEntities(input:))
    }
}

extension ListReputationEntitiesInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListReputationEntitiesInput {
        return ListReputationEntitiesInput(
            filter: self.filter,
            nextToken: token,
            pageSize: self.pageSize
        )}
}

extension PaginatorSequence where OperationStackInput == ListReputationEntitiesInput, OperationStackOutput == ListReputationEntitiesOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listReputationEntitiesPaginated`
    /// to access the nested member `[SESv2ClientTypes.ReputationEntity]`
    /// - Returns: `[SESv2ClientTypes.ReputationEntity]`
    public func reputationEntities() async throws -> [SESv2ClientTypes.ReputationEntity] {
        return try await self.asyncCompactMap { item in item.reputationEntities }
    }
}
extension SESv2Client {
    /// Paginate over `[ListResourceTenantsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListResourceTenantsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListResourceTenantsOutput`
    public func listResourceTenantsPaginated(input: ListResourceTenantsInput) -> ClientRuntime.PaginatorSequence<ListResourceTenantsInput, ListResourceTenantsOutput> {
        return ClientRuntime.PaginatorSequence<ListResourceTenantsInput, ListResourceTenantsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listResourceTenants(input:))
    }
}

extension ListResourceTenantsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListResourceTenantsInput {
        return ListResourceTenantsInput(
            nextToken: token,
            pageSize: self.pageSize,
            resourceArn: self.resourceArn
        )}
}

extension PaginatorSequence where OperationStackInput == ListResourceTenantsInput, OperationStackOutput == ListResourceTenantsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listResourceTenantsPaginated`
    /// to access the nested member `[SESv2ClientTypes.ResourceTenantMetadata]`
    /// - Returns: `[SESv2ClientTypes.ResourceTenantMetadata]`
    public func resourceTenants() async throws -> [SESv2ClientTypes.ResourceTenantMetadata] {
        return try await self.asyncCompactMap { item in item.resourceTenants }
    }
}
extension SESv2Client {
    /// Paginate over `[ListSuppressedDestinationsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListSuppressedDestinationsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListSuppressedDestinationsOutput`
    public func listSuppressedDestinationsPaginated(input: ListSuppressedDestinationsInput) -> ClientRuntime.PaginatorSequence<ListSuppressedDestinationsInput, ListSuppressedDestinationsOutput> {
        return ClientRuntime.PaginatorSequence<ListSuppressedDestinationsInput, ListSuppressedDestinationsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listSuppressedDestinations(input:))
    }
}

extension ListSuppressedDestinationsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListSuppressedDestinationsInput {
        return ListSuppressedDestinationsInput(
            endDate: self.endDate,
            nextToken: token,
            pageSize: self.pageSize,
            reasons: self.reasons,
            startDate: self.startDate
        )}
}
extension SESv2Client {
    /// Paginate over `[ListTenantResourcesOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListTenantResourcesInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListTenantResourcesOutput`
    public func listTenantResourcesPaginated(input: ListTenantResourcesInput) -> ClientRuntime.PaginatorSequence<ListTenantResourcesInput, ListTenantResourcesOutput> {
        return ClientRuntime.PaginatorSequence<ListTenantResourcesInput, ListTenantResourcesOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listTenantResources(input:))
    }
}

extension ListTenantResourcesInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListTenantResourcesInput {
        return ListTenantResourcesInput(
            filter: self.filter,
            nextToken: token,
            pageSize: self.pageSize,
            tenantName: self.tenantName
        )}
}

extension PaginatorSequence where OperationStackInput == ListTenantResourcesInput, OperationStackOutput == ListTenantResourcesOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listTenantResourcesPaginated`
    /// to access the nested member `[SESv2ClientTypes.TenantResource]`
    /// - Returns: `[SESv2ClientTypes.TenantResource]`
    public func tenantResources() async throws -> [SESv2ClientTypes.TenantResource] {
        return try await self.asyncCompactMap { item in item.tenantResources }
    }
}
extension SESv2Client {
    /// Paginate over `[ListTenantsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListTenantsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListTenantsOutput`
    public func listTenantsPaginated(input: ListTenantsInput) -> ClientRuntime.PaginatorSequence<ListTenantsInput, ListTenantsOutput> {
        return ClientRuntime.PaginatorSequence<ListTenantsInput, ListTenantsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listTenants(input:))
    }
}

extension ListTenantsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListTenantsInput {
        return ListTenantsInput(
            nextToken: token,
            pageSize: self.pageSize
        )}
}

extension PaginatorSequence where OperationStackInput == ListTenantsInput, OperationStackOutput == ListTenantsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listTenantsPaginated`
    /// to access the nested member `[SESv2ClientTypes.TenantInfo]`
    /// - Returns: `[SESv2ClientTypes.TenantInfo]`
    public func tenants() async throws -> [SESv2ClientTypes.TenantInfo] {
        return try await self.asyncCompactMap { item in item.tenants }
    }
}
