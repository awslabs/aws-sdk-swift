# ElasticsearchClient

``` swift
public class ElasticsearchClient 
```

## Inheritance

[`ElasticsearchClientProtocol`](/aws-sdk-swift/reference/0.x/AWSElasticsearchService/ElasticsearchClientProtocol)

## Initializers

### `init(config:)`

``` swift
public init(config: AWSClientRuntime.AWSClientConfiguration) 
```

### `init(region:)`

``` swift
public convenience init(region: Swift.String? = nil) throws 
```

## Properties

### `clientName`

``` swift
public static let clientName = "ElasticsearchClient"
```

## Methods

### `acceptInboundCrossClusterSearchConnection(input:completion:)`

Allows the destination domain owner to accept an inbound cross-cluster search connection request.

``` swift
public func acceptInboundCrossClusterSearchConnection(input: AcceptInboundCrossClusterSearchConnectionInput, completion: @escaping (ClientRuntime.SdkResult<AcceptInboundCrossClusterSearchConnectionOutputResponse, AcceptInboundCrossClusterSearchConnectionOutputError>) -> Void)
```

### `addTags(input:completion:)`

Attaches tags to an existing Elasticsearch domain. Tags are a set of case-sensitive key value pairs. An Elasticsearch domain may have up to 10 tags. See [ Tagging Amazon Elasticsearch Service Domains for more information.](http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-managedomains.html#es-managedomains-awsresorcetagging)

``` swift
public func addTags(input: AddTagsInput, completion: @escaping (ClientRuntime.SdkResult<AddTagsOutputResponse, AddTagsOutputError>) -> Void)
```

### `associatePackage(input:completion:)`

Associates a package with an Amazon ES domain.

``` swift
public func associatePackage(input: AssociatePackageInput, completion: @escaping (ClientRuntime.SdkResult<AssociatePackageOutputResponse, AssociatePackageOutputError>) -> Void)
```

### `cancelElasticsearchServiceSoftwareUpdate(input:completion:)`

Cancels a scheduled service software update for an Amazon ES domain. You can only perform this operation before the AutomatedUpdateDate and when the UpdateStatus is in the PENDING\_UPDATE state.

``` swift
public func cancelElasticsearchServiceSoftwareUpdate(input: CancelElasticsearchServiceSoftwareUpdateInput, completion: @escaping (ClientRuntime.SdkResult<CancelElasticsearchServiceSoftwareUpdateOutputResponse, CancelElasticsearchServiceSoftwareUpdateOutputError>) -> Void)
```

### `createElasticsearchDomain(input:completion:)`

Creates a new Elasticsearch domain. For more information, see [Creating Elasticsearch Domains](http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomains) in the Amazon Elasticsearch Service Developer Guide.

``` swift
public func createElasticsearchDomain(input: CreateElasticsearchDomainInput, completion: @escaping (ClientRuntime.SdkResult<CreateElasticsearchDomainOutputResponse, CreateElasticsearchDomainOutputError>) -> Void)
```

### `createOutboundCrossClusterSearchConnection(input:completion:)`

Creates a new cross-cluster search connection from a source domain to a destination domain.

``` swift
public func createOutboundCrossClusterSearchConnection(input: CreateOutboundCrossClusterSearchConnectionInput, completion: @escaping (ClientRuntime.SdkResult<CreateOutboundCrossClusterSearchConnectionOutputResponse, CreateOutboundCrossClusterSearchConnectionOutputError>) -> Void)
```

### `createPackage(input:completion:)`

Create a package for use with Amazon ES domains.

``` swift
public func createPackage(input: CreatePackageInput, completion: @escaping (ClientRuntime.SdkResult<CreatePackageOutputResponse, CreatePackageOutputError>) -> Void)
```

### `deleteElasticsearchDomain(input:completion:)`

Permanently deletes the specified Elasticsearch domain and all of its data. Once a domain is deleted, it cannot be recovered.

``` swift
public func deleteElasticsearchDomain(input: DeleteElasticsearchDomainInput, completion: @escaping (ClientRuntime.SdkResult<DeleteElasticsearchDomainOutputResponse, DeleteElasticsearchDomainOutputError>) -> Void)
```

### `deleteElasticsearchServiceRole(input:completion:)`

Deletes the service-linked role that Elasticsearch Service uses to manage and maintain VPC domains. Role deletion will fail if any existing VPC domains use the role. You must delete any such Elasticsearch domains before deleting the role. See [Deleting Elasticsearch Service Role](http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html#es-enabling-slr) in VPC Endpoints for Amazon Elasticsearch Service Domains.

``` swift
public func deleteElasticsearchServiceRole(input: DeleteElasticsearchServiceRoleInput, completion: @escaping (ClientRuntime.SdkResult<DeleteElasticsearchServiceRoleOutputResponse, DeleteElasticsearchServiceRoleOutputError>) -> Void)
```

### `deleteInboundCrossClusterSearchConnection(input:completion:)`

Allows the destination domain owner to delete an existing inbound cross-cluster search connection.

``` swift
public func deleteInboundCrossClusterSearchConnection(input: DeleteInboundCrossClusterSearchConnectionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteInboundCrossClusterSearchConnectionOutputResponse, DeleteInboundCrossClusterSearchConnectionOutputError>) -> Void)
```

### `deleteOutboundCrossClusterSearchConnection(input:completion:)`

Allows the source domain owner to delete an existing outbound cross-cluster search connection.

``` swift
public func deleteOutboundCrossClusterSearchConnection(input: DeleteOutboundCrossClusterSearchConnectionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteOutboundCrossClusterSearchConnectionOutputResponse, DeleteOutboundCrossClusterSearchConnectionOutputError>) -> Void)
```

### `deletePackage(input:completion:)`

Delete the package.

``` swift
public func deletePackage(input: DeletePackageInput, completion: @escaping (ClientRuntime.SdkResult<DeletePackageOutputResponse, DeletePackageOutputError>) -> Void)
```

### `describeDomainAutoTunes(input:completion:)`

Provides scheduled Auto-Tune action details for the Elasticsearch domain, such as Auto-Tune action type, description, severity, and scheduled date.

``` swift
public func describeDomainAutoTunes(input: DescribeDomainAutoTunesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDomainAutoTunesOutputResponse, DescribeDomainAutoTunesOutputError>) -> Void)
```

### `describeElasticsearchDomain(input:completion:)`

Returns domain configuration information about the specified Elasticsearch domain, including the domain ID, domain endpoint, and domain ARN.

``` swift
public func describeElasticsearchDomain(input: DescribeElasticsearchDomainInput, completion: @escaping (ClientRuntime.SdkResult<DescribeElasticsearchDomainOutputResponse, DescribeElasticsearchDomainOutputError>) -> Void)
```

### `describeElasticsearchDomainConfig(input:completion:)`

Provides cluster configuration information about the specified Elasticsearch domain, such as the state, creation date, update version, and update date for cluster options.

``` swift
public func describeElasticsearchDomainConfig(input: DescribeElasticsearchDomainConfigInput, completion: @escaping (ClientRuntime.SdkResult<DescribeElasticsearchDomainConfigOutputResponse, DescribeElasticsearchDomainConfigOutputError>) -> Void)
```

### `describeElasticsearchDomains(input:completion:)`

Returns domain configuration information about the specified Elasticsearch domains, including the domain ID, domain endpoint, and domain ARN.

``` swift
public func describeElasticsearchDomains(input: DescribeElasticsearchDomainsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeElasticsearchDomainsOutputResponse, DescribeElasticsearchDomainsOutputError>) -> Void)
```

### `describeElasticsearchInstanceTypeLimits(input:completion:)`

Describe Elasticsearch Limits for a given InstanceType and ElasticsearchVersion. When modifying existing Domain, specify the \[DomainName\] to know what Limits are supported for modifying.

``` swift
public func describeElasticsearchInstanceTypeLimits(input: DescribeElasticsearchInstanceTypeLimitsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeElasticsearchInstanceTypeLimitsOutputResponse, DescribeElasticsearchInstanceTypeLimitsOutputError>) -> Void)
```

### `describeInboundCrossClusterSearchConnections(input:completion:)`

Lists all the inbound cross-cluster search connections for a destination domain.

``` swift
public func describeInboundCrossClusterSearchConnections(input: DescribeInboundCrossClusterSearchConnectionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeInboundCrossClusterSearchConnectionsOutputResponse, DescribeInboundCrossClusterSearchConnectionsOutputError>) -> Void)
```

### `describeOutboundCrossClusterSearchConnections(input:completion:)`

Lists all the outbound cross-cluster search connections for a source domain.

``` swift
public func describeOutboundCrossClusterSearchConnections(input: DescribeOutboundCrossClusterSearchConnectionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeOutboundCrossClusterSearchConnectionsOutputResponse, DescribeOutboundCrossClusterSearchConnectionsOutputError>) -> Void)
```

### `describePackages(input:completion:)`

Describes all packages available to Amazon ES. Includes options for filtering, limiting the number of results, and pagination.

``` swift
public func describePackages(input: DescribePackagesInput, completion: @escaping (ClientRuntime.SdkResult<DescribePackagesOutputResponse, DescribePackagesOutputError>) -> Void)
```

### `describeReservedElasticsearchInstanceOfferings(input:completion:)`

Lists available reserved Elasticsearch instance offerings.

``` swift
public func describeReservedElasticsearchInstanceOfferings(input: DescribeReservedElasticsearchInstanceOfferingsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeReservedElasticsearchInstanceOfferingsOutputResponse, DescribeReservedElasticsearchInstanceOfferingsOutputError>) -> Void)
```

### `describeReservedElasticsearchInstances(input:completion:)`

Returns information about reserved Elasticsearch instances for this account.

``` swift
public func describeReservedElasticsearchInstances(input: DescribeReservedElasticsearchInstancesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeReservedElasticsearchInstancesOutputResponse, DescribeReservedElasticsearchInstancesOutputError>) -> Void)
```

### `dissociatePackage(input:completion:)`

Dissociates a package from the Amazon ES domain.

``` swift
public func dissociatePackage(input: DissociatePackageInput, completion: @escaping (ClientRuntime.SdkResult<DissociatePackageOutputResponse, DissociatePackageOutputError>) -> Void)
```

### `getCompatibleElasticsearchVersions(input:completion:)`

Returns a list of upgrade compatible Elastisearch versions. You can optionally pass a \[DomainName\] to get all upgrade compatible Elasticsearch versions for that specific domain.

``` swift
public func getCompatibleElasticsearchVersions(input: GetCompatibleElasticsearchVersionsInput, completion: @escaping (ClientRuntime.SdkResult<GetCompatibleElasticsearchVersionsOutputResponse, GetCompatibleElasticsearchVersionsOutputError>) -> Void)
```

### `getPackageVersionHistory(input:completion:)`

Returns a list of versions of the package, along with their creation time and commit message.

``` swift
public func getPackageVersionHistory(input: GetPackageVersionHistoryInput, completion: @escaping (ClientRuntime.SdkResult<GetPackageVersionHistoryOutputResponse, GetPackageVersionHistoryOutputError>) -> Void)
```

### `getUpgradeHistory(input:completion:)`

Retrieves the complete history of the last 10 upgrades that were performed on the domain.

``` swift
public func getUpgradeHistory(input: GetUpgradeHistoryInput, completion: @escaping (ClientRuntime.SdkResult<GetUpgradeHistoryOutputResponse, GetUpgradeHistoryOutputError>) -> Void)
```

### `getUpgradeStatus(input:completion:)`

Retrieves the latest status of the last upgrade or upgrade eligibility check that was performed on the domain.

``` swift
public func getUpgradeStatus(input: GetUpgradeStatusInput, completion: @escaping (ClientRuntime.SdkResult<GetUpgradeStatusOutputResponse, GetUpgradeStatusOutputError>) -> Void)
```

### `listDomainNames(input:completion:)`

Returns the name of all Elasticsearch domains owned by the current user's account.

``` swift
public func listDomainNames(input: ListDomainNamesInput, completion: @escaping (ClientRuntime.SdkResult<ListDomainNamesOutputResponse, ListDomainNamesOutputError>) -> Void)
```

### `listDomainsForPackage(input:completion:)`

Lists all Amazon ES domains associated with the package.

``` swift
public func listDomainsForPackage(input: ListDomainsForPackageInput, completion: @escaping (ClientRuntime.SdkResult<ListDomainsForPackageOutputResponse, ListDomainsForPackageOutputError>) -> Void)
```

### `listElasticsearchInstanceTypes(input:completion:)`

List all Elasticsearch instance types that are supported for given ElasticsearchVersion

``` swift
public func listElasticsearchInstanceTypes(input: ListElasticsearchInstanceTypesInput, completion: @escaping (ClientRuntime.SdkResult<ListElasticsearchInstanceTypesOutputResponse, ListElasticsearchInstanceTypesOutputError>) -> Void)
```

### `listElasticsearchVersions(input:completion:)`

List all supported Elasticsearch versions

``` swift
public func listElasticsearchVersions(input: ListElasticsearchVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListElasticsearchVersionsOutputResponse, ListElasticsearchVersionsOutputError>) -> Void)
```

### `listPackagesForDomain(input:completion:)`

Lists all packages associated with the Amazon ES domain.

``` swift
public func listPackagesForDomain(input: ListPackagesForDomainInput, completion: @escaping (ClientRuntime.SdkResult<ListPackagesForDomainOutputResponse, ListPackagesForDomainOutputError>) -> Void)
```

### `listTags(input:completion:)`

Returns all tags for the given Elasticsearch domain.

``` swift
public func listTags(input: ListTagsInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsOutputResponse, ListTagsOutputError>) -> Void)
```

### `purchaseReservedElasticsearchInstanceOffering(input:completion:)`

Allows you to purchase reserved Elasticsearch instances.

``` swift
public func purchaseReservedElasticsearchInstanceOffering(input: PurchaseReservedElasticsearchInstanceOfferingInput, completion: @escaping (ClientRuntime.SdkResult<PurchaseReservedElasticsearchInstanceOfferingOutputResponse, PurchaseReservedElasticsearchInstanceOfferingOutputError>) -> Void)
```

### `rejectInboundCrossClusterSearchConnection(input:completion:)`

Allows the destination domain owner to reject an inbound cross-cluster search connection request.

``` swift
public func rejectInboundCrossClusterSearchConnection(input: RejectInboundCrossClusterSearchConnectionInput, completion: @escaping (ClientRuntime.SdkResult<RejectInboundCrossClusterSearchConnectionOutputResponse, RejectInboundCrossClusterSearchConnectionOutputError>) -> Void)
```

### `removeTags(input:completion:)`

Removes the specified set of tags from the specified Elasticsearch domain.

``` swift
public func removeTags(input: RemoveTagsInput, completion: @escaping (ClientRuntime.SdkResult<RemoveTagsOutputResponse, RemoveTagsOutputError>) -> Void)
```

### `startElasticsearchServiceSoftwareUpdate(input:completion:)`

Schedules a service software update for an Amazon ES domain.

``` swift
public func startElasticsearchServiceSoftwareUpdate(input: StartElasticsearchServiceSoftwareUpdateInput, completion: @escaping (ClientRuntime.SdkResult<StartElasticsearchServiceSoftwareUpdateOutputResponse, StartElasticsearchServiceSoftwareUpdateOutputError>) -> Void)
```

### `updateElasticsearchDomainConfig(input:completion:)`

Modifies the cluster configuration of the specified Elasticsearch domain, setting as setting the instance type and the number of instances.

``` swift
public func updateElasticsearchDomainConfig(input: UpdateElasticsearchDomainConfigInput, completion: @escaping (ClientRuntime.SdkResult<UpdateElasticsearchDomainConfigOutputResponse, UpdateElasticsearchDomainConfigOutputError>) -> Void)
```

### `updatePackage(input:completion:)`

Updates a package for use with Amazon ES domains.

``` swift
public func updatePackage(input: UpdatePackageInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePackageOutputResponse, UpdatePackageOutputError>) -> Void)
```

### `upgradeElasticsearchDomain(input:completion:)`

Allows you to either upgrade your domain or perform an Upgrade eligibility check to a compatible Elasticsearch version.

``` swift
public func upgradeElasticsearchDomain(input: UpgradeElasticsearchDomainInput, completion: @escaping (ClientRuntime.SdkResult<UpgradeElasticsearchDomainOutputResponse, UpgradeElasticsearchDomainOutputError>) -> Void)
```
