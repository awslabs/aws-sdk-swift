# OpenSearchClient

``` swift
public class OpenSearchClient 
```

## Inheritance

[`OpenSearchClientProtocol`](/aws-sdk-swift/reference/0.x/AWSOpenSearch/OpenSearchClientProtocol)

## Initializers

### `init(config:)`

``` swift
public init(config: AWSClientRuntime.AWSClientConfiguration) 
```

### `init(region:)`

``` swift
public convenience init(region: Swift.String? = nil) throws 
```

## Methods

### `acceptInboundConnection(input:completion:)`

Allows the remote domain owner to accept an inbound cross-cluster connection request.

``` swift
public func acceptInboundConnection(input: AcceptInboundConnectionInput, completion: @escaping (ClientRuntime.SdkResult<AcceptInboundConnectionOutputResponse, AcceptInboundConnectionOutputError>) -> Void)
```

### `addTags(input:completion:)`

Attaches tags to an existing domain. Tags are a set of case-sensitive key value pairs. An
domain can have up to 10 tags. See
<a href="http:​//docs.aws.amazon.com/opensearch-service/latest/developerguide/managedomains.html#managedomains-awsresorcetagging" target="_blank">
Tagging Amazon OpenSearch Service domains for more information.

``` swift
public func addTags(input: AddTagsInput, completion: @escaping (ClientRuntime.SdkResult<AddTagsOutputResponse, AddTagsOutputError>) -> Void)
```

### `associatePackage(input:completion:)`

Associates a package with an Amazon OpenSearch Service domain.

``` swift
public func associatePackage(input: AssociatePackageInput, completion: @escaping (ClientRuntime.SdkResult<AssociatePackageOutputResponse, AssociatePackageOutputError>) -> Void)
```

### `cancelServiceSoftwareUpdate(input:completion:)`

Cancels a scheduled service software update for an Amazon OpenSearch Service domain. You can only perform this operation before
the AutomatedUpdateDate and when the UpdateStatus is in the PENDING\_UPDATE state.

``` swift
public func cancelServiceSoftwareUpdate(input: CancelServiceSoftwareUpdateInput, completion: @escaping (ClientRuntime.SdkResult<CancelServiceSoftwareUpdateOutputResponse, CancelServiceSoftwareUpdateOutputError>) -> Void)
```

### `createDomain(input:completion:)`

Creates a new Amazon OpenSearch Service domain. For more information,
see <a href="http:​//docs.aws.amazon.com/opensearch-service/latest/developerguide/createupdatedomains.html" target="_blank">Creating and managing Amazon OpenSearch Service domains
in the Amazon OpenSearch Service Developer Guide.

``` swift
public func createDomain(input: CreateDomainInput, completion: @escaping (ClientRuntime.SdkResult<CreateDomainOutputResponse, CreateDomainOutputError>) -> Void)
```

### `createOutboundConnection(input:completion:)`

Creates a new cross-cluster connection from a local OpenSearch domain to a remote OpenSearch domain.

``` swift
public func createOutboundConnection(input: CreateOutboundConnectionInput, completion: @escaping (ClientRuntime.SdkResult<CreateOutboundConnectionOutputResponse, CreateOutboundConnectionOutputError>) -> Void)
```

### `createPackage(input:completion:)`

Create a package for use with Amazon OpenSearch Service domains.

``` swift
public func createPackage(input: CreatePackageInput, completion: @escaping (ClientRuntime.SdkResult<CreatePackageOutputResponse, CreatePackageOutputError>) -> Void)
```

### `deleteDomain(input:completion:)`

Permanently deletes the specified domain and all of its data. Once a domain is deleted, it cannot
be recovered.

``` swift
public func deleteDomain(input: DeleteDomainInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDomainOutputResponse, DeleteDomainOutputError>) -> Void)
```

### `deleteInboundConnection(input:completion:)`

Allows the remote domain owner to delete an existing inbound cross-cluster connection.

``` swift
public func deleteInboundConnection(input: DeleteInboundConnectionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteInboundConnectionOutputResponse, DeleteInboundConnectionOutputError>) -> Void)
```

### `deleteOutboundConnection(input:completion:)`

Allows the local domain owner to delete an existing outbound cross-cluster connection.

``` swift
public func deleteOutboundConnection(input: DeleteOutboundConnectionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteOutboundConnectionOutputResponse, DeleteOutboundConnectionOutputError>) -> Void)
```

### `deletePackage(input:completion:)`

Deletes the package.

``` swift
public func deletePackage(input: DeletePackageInput, completion: @escaping (ClientRuntime.SdkResult<DeletePackageOutputResponse, DeletePackageOutputError>) -> Void)
```

### `describeDomain(input:completion:)`

Returns domain configuration information about the specified domain, including the domain ID,
domain endpoint, and domain ARN.

``` swift
public func describeDomain(input: DescribeDomainInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDomainOutputResponse, DescribeDomainOutputError>) -> Void)
```

### `describeDomainAutoTunes(input:completion:)`

Provides scheduled Auto-Tune action details for the domain, such as Auto-Tune action type,
description, severity, and scheduled date.

``` swift
public func describeDomainAutoTunes(input: DescribeDomainAutoTunesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDomainAutoTunesOutputResponse, DescribeDomainAutoTunesOutputError>) -> Void)
```

### `describeDomainConfig(input:completion:)`

Provides cluster configuration information about the specified domain, such as the state, creation
date, update version, and update date for cluster options.

``` swift
public func describeDomainConfig(input: DescribeDomainConfigInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDomainConfigOutputResponse, DescribeDomainConfigOutputError>) -> Void)
```

### `describeDomains(input:completion:)`

Returns domain configuration information about the specified domains, including the domain ID,
domain endpoint, and domain ARN.

``` swift
public func describeDomains(input: DescribeDomainsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDomainsOutputResponse, DescribeDomainsOutputError>) -> Void)
```

### `describeInboundConnections(input:completion:)`

Lists all the inbound cross-cluster connections for a remote domain.

``` swift
public func describeInboundConnections(input: DescribeInboundConnectionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeInboundConnectionsOutputResponse, DescribeInboundConnectionsOutputError>) -> Void)
```

### `describeInstanceTypeLimits(input:completion:)`

Describe the limits for a given instance type and OpenSearch or Elasticsearch version.
When modifying an existing domain, specify the

``` swift
public func describeInstanceTypeLimits(input: DescribeInstanceTypeLimitsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeInstanceTypeLimitsOutputResponse, DescribeInstanceTypeLimitsOutputError>) -> Void)
```

DomainName

to see which limits you can modify.

### `describeOutboundConnections(input:completion:)`

Lists all the outbound cross-cluster connections for a local domain.

``` swift
public func describeOutboundConnections(input: DescribeOutboundConnectionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeOutboundConnectionsOutputResponse, DescribeOutboundConnectionsOutputError>) -> Void)
```

### `describePackages(input:completion:)`

Describes all packages available to Amazon OpenSearch Service domains. Includes options for filtering, limiting the number of results,
and pagination.

``` swift
public func describePackages(input: DescribePackagesInput, completion: @escaping (ClientRuntime.SdkResult<DescribePackagesOutputResponse, DescribePackagesOutputError>) -> Void)
```

### `describeReservedInstanceOfferings(input:completion:)`

Lists available reserved OpenSearch instance offerings.

``` swift
public func describeReservedInstanceOfferings(input: DescribeReservedInstanceOfferingsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeReservedInstanceOfferingsOutputResponse, DescribeReservedInstanceOfferingsOutputError>) -> Void)
```

### `describeReservedInstances(input:completion:)`

Returns information about reserved OpenSearch instances for this account.

``` swift
public func describeReservedInstances(input: DescribeReservedInstancesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeReservedInstancesOutputResponse, DescribeReservedInstancesOutputError>) -> Void)
```

### `dissociatePackage(input:completion:)`

Dissociates a package from the Amazon OpenSearch Service domain.

``` swift
public func dissociatePackage(input: DissociatePackageInput, completion: @escaping (ClientRuntime.SdkResult<DissociatePackageOutputResponse, DissociatePackageOutputError>) -> Void)
```

### `getCompatibleVersions(input:completion:)`

Returns a list of upgrade-compatible versions of OpenSearch/Elasticsearch.
You can optionally pass a

``` swift
public func getCompatibleVersions(input: GetCompatibleVersionsInput, completion: @escaping (ClientRuntime.SdkResult<GetCompatibleVersionsOutputResponse, GetCompatibleVersionsOutputError>) -> Void)
```

DomainName

to get all upgrade-compatible versions of OpenSearch/Elasticsearch for that specific domain.

### `getPackageVersionHistory(input:completion:)`

Returns a list of package versions, along with their creation time and commit message.

``` swift
public func getPackageVersionHistory(input: GetPackageVersionHistoryInput, completion: @escaping (ClientRuntime.SdkResult<GetPackageVersionHistoryOutputResponse, GetPackageVersionHistoryOutputError>) -> Void)
```

### `getUpgradeHistory(input:completion:)`

Retrieves the complete history of the last 10 upgrades performed on the domain.

``` swift
public func getUpgradeHistory(input: GetUpgradeHistoryInput, completion: @escaping (ClientRuntime.SdkResult<GetUpgradeHistoryOutputResponse, GetUpgradeHistoryOutputError>) -> Void)
```

### `getUpgradeStatus(input:completion:)`

Retrieves the latest status of the last upgrade or upgrade eligibility check performed on the domain.

``` swift
public func getUpgradeStatus(input: GetUpgradeStatusInput, completion: @escaping (ClientRuntime.SdkResult<GetUpgradeStatusOutputResponse, GetUpgradeStatusOutputError>) -> Void)
```

### `listDomainNames(input:completion:)`

Returns the names of all domains owned by the current user's account.

``` swift
public func listDomainNames(input: ListDomainNamesInput, completion: @escaping (ClientRuntime.SdkResult<ListDomainNamesOutputResponse, ListDomainNamesOutputError>) -> Void)
```

### `listDomainsForPackage(input:completion:)`

Lists all Amazon OpenSearch Service domains associated with the package.

``` swift
public func listDomainsForPackage(input: ListDomainsForPackageInput, completion: @escaping (ClientRuntime.SdkResult<ListDomainsForPackageOutputResponse, ListDomainsForPackageOutputError>) -> Void)
```

### `listInstanceTypeDetails(input:completion:)`

``` swift
public func listInstanceTypeDetails(input: ListInstanceTypeDetailsInput, completion: @escaping (ClientRuntime.SdkResult<ListInstanceTypeDetailsOutputResponse, ListInstanceTypeDetailsOutputError>) -> Void)
```

### `listPackagesForDomain(input:completion:)`

Lists all packages associated with the Amazon OpenSearch Service domain.

``` swift
public func listPackagesForDomain(input: ListPackagesForDomainInput, completion: @escaping (ClientRuntime.SdkResult<ListPackagesForDomainOutputResponse, ListPackagesForDomainOutputError>) -> Void)
```

### `listTags(input:completion:)`

Returns all tags for the given domain.

``` swift
public func listTags(input: ListTagsInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsOutputResponse, ListTagsOutputError>) -> Void)
```

### `listVersions(input:completion:)`

List all supported versions of OpenSearch and Elasticsearch.

``` swift
public func listVersions(input: ListVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListVersionsOutputResponse, ListVersionsOutputError>) -> Void)
```

### `purchaseReservedInstanceOffering(input:completion:)`

Allows you to purchase reserved OpenSearch instances.

``` swift
public func purchaseReservedInstanceOffering(input: PurchaseReservedInstanceOfferingInput, completion: @escaping (ClientRuntime.SdkResult<PurchaseReservedInstanceOfferingOutputResponse, PurchaseReservedInstanceOfferingOutputError>) -> Void)
```

### `rejectInboundConnection(input:completion:)`

Allows the remote domain owner to reject an inbound cross-cluster connection request.

``` swift
public func rejectInboundConnection(input: RejectInboundConnectionInput, completion: @escaping (ClientRuntime.SdkResult<RejectInboundConnectionOutputResponse, RejectInboundConnectionOutputError>) -> Void)
```

### `removeTags(input:completion:)`

Removes the specified set of tags from the given domain.

``` swift
public func removeTags(input: RemoveTagsInput, completion: @escaping (ClientRuntime.SdkResult<RemoveTagsOutputResponse, RemoveTagsOutputError>) -> Void)
```

### `startServiceSoftwareUpdate(input:completion:)`

Schedules a service software update for an Amazon OpenSearch Service domain.

``` swift
public func startServiceSoftwareUpdate(input: StartServiceSoftwareUpdateInput, completion: @escaping (ClientRuntime.SdkResult<StartServiceSoftwareUpdateOutputResponse, StartServiceSoftwareUpdateOutputError>) -> Void)
```

### `updateDomainConfig(input:completion:)`

Modifies the cluster configuration of the specified domain, such as setting the instance type
and the number of instances.

``` swift
public func updateDomainConfig(input: UpdateDomainConfigInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDomainConfigOutputResponse, UpdateDomainConfigOutputError>) -> Void)
```

### `updatePackage(input:completion:)`

Updates a package for use with Amazon OpenSearch Service domains.

``` swift
public func updatePackage(input: UpdatePackageInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePackageOutputResponse, UpdatePackageOutputError>) -> Void)
```

### `upgradeDomain(input:completion:)`

Allows you to either upgrade your domain or perform an upgrade eligibility check to a compatible version of OpenSearch or Elasticsearch.

``` swift
public func upgradeDomain(input: UpgradeDomainInput, completion: @escaping (ClientRuntime.SdkResult<UpgradeDomainOutputResponse, UpgradeDomainOutputError>) -> Void)
```
