# IoTAnalyticsClient

``` swift
public class IoTAnalyticsClient 
```

## Inheritance

[`IoTAnalyticsClientProtocol`](/aws-sdk-swift/reference/0.x/AWSIoTAnalytics/IoTAnalyticsClientProtocol)

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

### `batchPutMessage(input:completion:)`

Sends messages to a channel.

``` swift
public func batchPutMessage(input: BatchPutMessageInput, completion: @escaping (ClientRuntime.SdkResult<BatchPutMessageOutputResponse, BatchPutMessageOutputError>) -> Void)
```

### `cancelPipelineReprocessing(input:completion:)`

Cancels the reprocessing of data through the pipeline.

``` swift
public func cancelPipelineReprocessing(input: CancelPipelineReprocessingInput, completion: @escaping (ClientRuntime.SdkResult<CancelPipelineReprocessingOutputResponse, CancelPipelineReprocessingOutputError>) -> Void)
```

### `createChannel(input:completion:)`

Used to create a channel. A channel collects data from an MQTT topic and archives the raw,
unprocessed messages before publishing the data to a pipeline.

``` swift
public func createChannel(input: CreateChannelInput, completion: @escaping (ClientRuntime.SdkResult<CreateChannelOutputResponse, CreateChannelOutputError>) -> Void)
```

### `createDataset(input:completion:)`

Used to create a dataset. A dataset stores data retrieved from a data store by applying a
queryAction (a SQL query) or a containerAction (executing a
containerized application). This operation creates the skeleton of a dataset. The dataset can
be populated manually by calling CreateDatasetContent or automatically according
to a trigger you specify.

``` swift
public func createDataset(input: CreateDatasetInput, completion: @escaping (ClientRuntime.SdkResult<CreateDatasetOutputResponse, CreateDatasetOutputError>) -> Void)
```

### `createDatasetContent(input:completion:)`

Creates the content of a dataset by applying a queryAction (a SQL query) or a
containerAction (executing a containerized application).

``` swift
public func createDatasetContent(input: CreateDatasetContentInput, completion: @escaping (ClientRuntime.SdkResult<CreateDatasetContentOutputResponse, CreateDatasetContentOutputError>) -> Void)
```

### `createDatastore(input:completion:)`

Creates a data store, which is a repository for messages.

``` swift
public func createDatastore(input: CreateDatastoreInput, completion: @escaping (ClientRuntime.SdkResult<CreateDatastoreOutputResponse, CreateDatastoreOutputError>) -> Void)
```

### `createPipeline(input:completion:)`

Creates a pipeline. A pipeline consumes messages from a channel and allows you to process
the messages before storing them in a data store. You must specify both a channel
and a datastore activity and, optionally, as many as 23 additional activities in
the pipelineActivities array.

``` swift
public func createPipeline(input: CreatePipelineInput, completion: @escaping (ClientRuntime.SdkResult<CreatePipelineOutputResponse, CreatePipelineOutputError>) -> Void)
```

### `deleteChannel(input:completion:)`

Deletes the specified channel.

``` swift
public func deleteChannel(input: DeleteChannelInput, completion: @escaping (ClientRuntime.SdkResult<DeleteChannelOutputResponse, DeleteChannelOutputError>) -> Void)
```

### `deleteDataset(input:completion:)`

Deletes the specified dataset.
You do not have to delete the content of the dataset before you perform this
operation.

``` swift
public func deleteDataset(input: DeleteDatasetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDatasetOutputResponse, DeleteDatasetOutputError>) -> Void)
```

### `deleteDatasetContent(input:completion:)`

Deletes the content of the specified dataset.

``` swift
public func deleteDatasetContent(input: DeleteDatasetContentInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDatasetContentOutputResponse, DeleteDatasetContentOutputError>) -> Void)
```

### `deleteDatastore(input:completion:)`

Deletes the specified data store.

``` swift
public func deleteDatastore(input: DeleteDatastoreInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDatastoreOutputResponse, DeleteDatastoreOutputError>) -> Void)
```

### `deletePipeline(input:completion:)`

Deletes the specified pipeline.

``` swift
public func deletePipeline(input: DeletePipelineInput, completion: @escaping (ClientRuntime.SdkResult<DeletePipelineOutputResponse, DeletePipelineOutputError>) -> Void)
```

### `describeChannel(input:completion:)`

Retrieves information about a channel.

``` swift
public func describeChannel(input: DescribeChannelInput, completion: @escaping (ClientRuntime.SdkResult<DescribeChannelOutputResponse, DescribeChannelOutputError>) -> Void)
```

### `describeDataset(input:completion:)`

Retrieves information about a dataset.

``` swift
public func describeDataset(input: DescribeDatasetInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDatasetOutputResponse, DescribeDatasetOutputError>) -> Void)
```

### `describeDatastore(input:completion:)`

Retrieves information about a data store.

``` swift
public func describeDatastore(input: DescribeDatastoreInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDatastoreOutputResponse, DescribeDatastoreOutputError>) -> Void)
```

### `describeLoggingOptions(input:completion:)`

Retrieves the current settings of the IoT Analytics logging options.

``` swift
public func describeLoggingOptions(input: DescribeLoggingOptionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLoggingOptionsOutputResponse, DescribeLoggingOptionsOutputError>) -> Void)
```

### `describePipeline(input:completion:)`

Retrieves information about a pipeline.

``` swift
public func describePipeline(input: DescribePipelineInput, completion: @escaping (ClientRuntime.SdkResult<DescribePipelineOutputResponse, DescribePipelineOutputError>) -> Void)
```

### `getDatasetContent(input:completion:)`

Retrieves the contents of a dataset as presigned URIs.

``` swift
public func getDatasetContent(input: GetDatasetContentInput, completion: @escaping (ClientRuntime.SdkResult<GetDatasetContentOutputResponse, GetDatasetContentOutputError>) -> Void)
```

### `listChannels(input:completion:)`

Retrieves a list of channels.

``` swift
public func listChannels(input: ListChannelsInput, completion: @escaping (ClientRuntime.SdkResult<ListChannelsOutputResponse, ListChannelsOutputError>) -> Void)
```

### `listDatasetContents(input:completion:)`

Lists information about dataset contents that have been created.

``` swift
public func listDatasetContents(input: ListDatasetContentsInput, completion: @escaping (ClientRuntime.SdkResult<ListDatasetContentsOutputResponse, ListDatasetContentsOutputError>) -> Void)
```

### `listDatasets(input:completion:)`

Retrieves information about datasets.

``` swift
public func listDatasets(input: ListDatasetsInput, completion: @escaping (ClientRuntime.SdkResult<ListDatasetsOutputResponse, ListDatasetsOutputError>) -> Void)
```

### `listDatastores(input:completion:)`

Retrieves a list of data stores.

``` swift
public func listDatastores(input: ListDatastoresInput, completion: @escaping (ClientRuntime.SdkResult<ListDatastoresOutputResponse, ListDatastoresOutputError>) -> Void)
```

### `listPipelines(input:completion:)`

Retrieves a list of pipelines.

``` swift
public func listPipelines(input: ListPipelinesInput, completion: @escaping (ClientRuntime.SdkResult<ListPipelinesOutputResponse, ListPipelinesOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Lists the tags (metadata) that you have assigned to the resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `putLoggingOptions(input:completion:)`

Sets or updates the IoT Analytics logging options.
If you update the value of any loggingOptions field, it takes up to one
minute for the change to take effect. Also, if you change the policy attached to the role you
specified in the roleArn field (for example, to correct an invalid policy), it
takes up to five minutes for that change to take effect.

``` swift
public func putLoggingOptions(input: PutLoggingOptionsInput, completion: @escaping (ClientRuntime.SdkResult<PutLoggingOptionsOutputResponse, PutLoggingOptionsOutputError>) -> Void)
```

### `runPipelineActivity(input:completion:)`

Simulates the results of running a pipeline activity on a message payload.

``` swift
public func runPipelineActivity(input: RunPipelineActivityInput, completion: @escaping (ClientRuntime.SdkResult<RunPipelineActivityOutputResponse, RunPipelineActivityOutputError>) -> Void)
```

### `sampleChannelData(input:completion:)`

Retrieves a sample of messages from the specified channel ingested during the specified
timeframe. Up to 10 messages can be retrieved.

``` swift
public func sampleChannelData(input: SampleChannelDataInput, completion: @escaping (ClientRuntime.SdkResult<SampleChannelDataOutputResponse, SampleChannelDataOutputError>) -> Void)
```

### `startPipelineReprocessing(input:completion:)`

Starts the reprocessing of raw message data through the pipeline.

``` swift
public func startPipelineReprocessing(input: StartPipelineReprocessingInput, completion: @escaping (ClientRuntime.SdkResult<StartPipelineReprocessingOutputResponse, StartPipelineReprocessingOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Adds to or modifies the tags of the given resource. Tags are metadata that can be used to
manage a resource.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes the given tags (metadata) from the resource.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateChannel(input:completion:)`

Used to update the settings of a channel.

``` swift
public func updateChannel(input: UpdateChannelInput, completion: @escaping (ClientRuntime.SdkResult<UpdateChannelOutputResponse, UpdateChannelOutputError>) -> Void)
```

### `updateDataset(input:completion:)`

Updates the settings of a dataset.

``` swift
public func updateDataset(input: UpdateDatasetInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDatasetOutputResponse, UpdateDatasetOutputError>) -> Void)
```

### `updateDatastore(input:completion:)`

Used to update the settings of a data store.

``` swift
public func updateDatastore(input: UpdateDatastoreInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDatastoreOutputResponse, UpdateDatastoreOutputError>) -> Void)
```

### `updatePipeline(input:completion:)`

Updates the settings of a pipeline. You must specify both a channel and a
datastore activity and, optionally, as many as 23 additional activities in the
pipelineActivities array.

``` swift
public func updatePipeline(input: UpdatePipelineInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePipelineOutputResponse, UpdatePipelineOutputError>) -> Void)
```
