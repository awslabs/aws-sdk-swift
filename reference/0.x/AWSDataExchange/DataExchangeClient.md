# DataExchangeClient

``` swift
public class DataExchangeClient 
```

## Inheritance

[`DataExchangeClientProtocol`](/aws-sdk-swift/reference/0.x/AWSDataExchange/DataExchangeClientProtocol)

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

### `cancelJob(input:completion:)`

This operation cancels a job. Jobs can be cancelled only when they are in the WAITING state.

``` swift
public func cancelJob(input: CancelJobInput, completion: @escaping (ClientRuntime.SdkResult<CancelJobOutputResponse, CancelJobOutputError>) -> Void)
```

### `createDataSet(input:completion:)`

This operation creates a data set.

``` swift
public func createDataSet(input: CreateDataSetInput, completion: @escaping (ClientRuntime.SdkResult<CreateDataSetOutputResponse, CreateDataSetOutputError>) -> Void)
```

### `createEventAction(input:completion:)`

This operation creates an event action.

``` swift
public func createEventAction(input: CreateEventActionInput, completion: @escaping (ClientRuntime.SdkResult<CreateEventActionOutputResponse, CreateEventActionOutputError>) -> Void)
```

### `createJob(input:completion:)`

This operation creates a job.

``` swift
public func createJob(input: CreateJobInput, completion: @escaping (ClientRuntime.SdkResult<CreateJobOutputResponse, CreateJobOutputError>) -> Void)
```

### `createRevision(input:completion:)`

This operation creates a revision for a data set.

``` swift
public func createRevision(input: CreateRevisionInput, completion: @escaping (ClientRuntime.SdkResult<CreateRevisionOutputResponse, CreateRevisionOutputError>) -> Void)
```

### `deleteAsset(input:completion:)`

This operation deletes an asset.

``` swift
public func deleteAsset(input: DeleteAssetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAssetOutputResponse, DeleteAssetOutputError>) -> Void)
```

### `deleteDataSet(input:completion:)`

This operation deletes a data set.

``` swift
public func deleteDataSet(input: DeleteDataSetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDataSetOutputResponse, DeleteDataSetOutputError>) -> Void)
```

### `deleteEventAction(input:completion:)`

This operation deletes the event action.

``` swift
public func deleteEventAction(input: DeleteEventActionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteEventActionOutputResponse, DeleteEventActionOutputError>) -> Void)
```

### `deleteRevision(input:completion:)`

This operation deletes a revision.

``` swift
public func deleteRevision(input: DeleteRevisionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRevisionOutputResponse, DeleteRevisionOutputError>) -> Void)
```

### `getAsset(input:completion:)`

This operation returns information about an asset.

``` swift
public func getAsset(input: GetAssetInput, completion: @escaping (ClientRuntime.SdkResult<GetAssetOutputResponse, GetAssetOutputError>) -> Void)
```

### `getDataSet(input:completion:)`

This operation returns information about a data set.

``` swift
public func getDataSet(input: GetDataSetInput, completion: @escaping (ClientRuntime.SdkResult<GetDataSetOutputResponse, GetDataSetOutputError>) -> Void)
```

### `getEventAction(input:completion:)`

This operation retrieves information about an event action.

``` swift
public func getEventAction(input: GetEventActionInput, completion: @escaping (ClientRuntime.SdkResult<GetEventActionOutputResponse, GetEventActionOutputError>) -> Void)
```

### `getJob(input:completion:)`

This operation returns information about a job.

``` swift
public func getJob(input: GetJobInput, completion: @escaping (ClientRuntime.SdkResult<GetJobOutputResponse, GetJobOutputError>) -> Void)
```

### `getRevision(input:completion:)`

This operation returns information about a revision.

``` swift
public func getRevision(input: GetRevisionInput, completion: @escaping (ClientRuntime.SdkResult<GetRevisionOutputResponse, GetRevisionOutputError>) -> Void)
```

### `listDataSetRevisions(input:completion:)`

This operation lists a data set's revisions sorted by CreatedAt in descending order.

``` swift
public func listDataSetRevisions(input: ListDataSetRevisionsInput, completion: @escaping (ClientRuntime.SdkResult<ListDataSetRevisionsOutputResponse, ListDataSetRevisionsOutputError>) -> Void)
```

### `listDataSets(input:completion:)`

This operation lists your data sets. When listing by origin OWNED, results are sorted by CreatedAt in descending order. When listing by origin ENTITLED, there is no order and the maxResults parameter is ignored.

``` swift
public func listDataSets(input: ListDataSetsInput, completion: @escaping (ClientRuntime.SdkResult<ListDataSetsOutputResponse, ListDataSetsOutputError>) -> Void)
```

### `listEventActions(input:completion:)`

This operation lists your event actions.

``` swift
public func listEventActions(input: ListEventActionsInput, completion: @escaping (ClientRuntime.SdkResult<ListEventActionsOutputResponse, ListEventActionsOutputError>) -> Void)
```

### `listJobs(input:completion:)`

This operation lists your jobs sorted by CreatedAt in descending order.

``` swift
public func listJobs(input: ListJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListJobsOutputResponse, ListJobsOutputError>) -> Void)
```

### `listRevisionAssets(input:completion:)`

This operation lists a revision's assets sorted alphabetically in descending order.

``` swift
public func listRevisionAssets(input: ListRevisionAssetsInput, completion: @escaping (ClientRuntime.SdkResult<ListRevisionAssetsOutputResponse, ListRevisionAssetsOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

This operation lists the tags on the resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `startJob(input:completion:)`

This operation starts a job.

``` swift
public func startJob(input: StartJobInput, completion: @escaping (ClientRuntime.SdkResult<StartJobOutputResponse, StartJobOutputError>) -> Void)
```

### `tagResource(input:completion:)`

This operation tags a resource.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

This operation removes one or more tags from a resource.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateAsset(input:completion:)`

This operation updates an asset.

``` swift
public func updateAsset(input: UpdateAssetInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAssetOutputResponse, UpdateAssetOutputError>) -> Void)
```

### `updateDataSet(input:completion:)`

This operation updates a data set.

``` swift
public func updateDataSet(input: UpdateDataSetInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDataSetOutputResponse, UpdateDataSetOutputError>) -> Void)
```

### `updateEventAction(input:completion:)`

This operation updates the event action.

``` swift
public func updateEventAction(input: UpdateEventActionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateEventActionOutputResponse, UpdateEventActionOutputError>) -> Void)
```

### `updateRevision(input:completion:)`

This operation updates a revision.

``` swift
public func updateRevision(input: UpdateRevisionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRevisionOutputResponse, UpdateRevisionOutputError>) -> Void)
```
