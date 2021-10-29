# MarketplaceCatalogClientProtocol

Catalog API actions allow you to manage your entities through list, describe, and update capabilities. An entity can be a product or an offer on AWS Marketplace. You can automate your entity update process by integrating the AWS Marketplace Catalog API with your AWS Marketplace product build or deployment pipelines. You can also create your own applications on top of the Catalog API to manage your products on AWS Marketplace.

``` swift
public protocol MarketplaceCatalogClientProtocol 
```

## Requirements

### cancelChangeSet(input:completion:)

Used to cancel an open change request. Must be sent before the status of the request changes to APPLYING, the final stage of completing your change request. You can describe a change during the 60-day request history retention period for API calls.

``` swift
func cancelChangeSet(input: CancelChangeSetInput, completion: @escaping (ClientRuntime.SdkResult<CancelChangeSetOutputResponse, CancelChangeSetOutputError>) -> Void)
```

### describeChangeSet(input:completion:)

Provides information about a given change set.

``` swift
func describeChangeSet(input: DescribeChangeSetInput, completion: @escaping (ClientRuntime.SdkResult<DescribeChangeSetOutputResponse, DescribeChangeSetOutputError>) -> Void)
```

### describeEntity(input:completion:)

Returns the metadata and content of the entity.

``` swift
func describeEntity(input: DescribeEntityInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEntityOutputResponse, DescribeEntityOutputError>) -> Void)
```

### listChangeSets(input:completion:)

Returns the list of change sets owned by the account being used to make the call. You can filter this list by providing any combination of entityId, ChangeSetName, and status. If you provide more than one filter, the API operation applies a logical AND between the filters. You can describe a change during the 60-day request history retention period for API calls.

``` swift
func listChangeSets(input: ListChangeSetsInput, completion: @escaping (ClientRuntime.SdkResult<ListChangeSetsOutputResponse, ListChangeSetsOutputError>) -> Void)
```

### listEntities(input:completion:)

Provides the list of entities of a given type.

``` swift
func listEntities(input: ListEntitiesInput, completion: @escaping (ClientRuntime.SdkResult<ListEntitiesOutputResponse, ListEntitiesOutputError>) -> Void)
```

### startChangeSet(input:completion:)

This operation allows you to request changes for your entities. Within a single ChangeSet, you cannot start the same change type against the same entity multiple times. Additionally, when a ChangeSet is running, all the entities targeted by the different changes are locked until the ChangeSet has completed (either succeeded, cancelled, or failed). If you try to start a ChangeSet containing a change against an entity that is already locked, you will receive a ResourceInUseException. For example, you cannot start the ChangeSet described in the [example](https://docs.aws.amazon.com/marketplace-catalog/latest/api-reference/API_StartChangeSet.html#API_StartChangeSet_Examples) later in this topic, because it contains two changes to execute the same change type (AddRevisions) against the same entity (entity-id@1). For more information about working with change sets, see [ Working with change sets](https://docs.aws.amazon.com/marketplace-catalog/latest/api-reference/welcome.html#working-with-change-sets).

``` swift
func startChangeSet(input: StartChangeSetInput, completion: @escaping (ClientRuntime.SdkResult<StartChangeSetOutputResponse, StartChangeSetOutputError>) -> Void)
```
