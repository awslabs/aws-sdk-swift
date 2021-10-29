# IoTAnalyticsClientProtocol

IoT Analytics allows you to collect large amounts of device data, process messages, and store them. You can then query the data and run sophisticated analytics on it. IoT Analytics enables advanced data exploration through integration with Jupyter Notebooks and data visualization through integration with Amazon QuickSight. Traditional analytics and business intelligence tools are designed to process structured data. IoT data often comes from devices that record noisy processes (such as temperature, motion, or sound). As a result the data from these devices can have significant gaps, corrupted messages, and false readings that must be cleaned up before analysis can occur. Also, IoT data is often only meaningful in the context of other data from external sources. IoT Analytics automates the steps required to analyze data from IoT devices. IoT Analytics filters, transforms, and enriches IoT data before storing it in a time-series data store for analysis. You can set up the service to collect only the data you need from your devices, apply mathematical transforms to process the data, and enrich the data with device-specific metadata such as device type and location before storing it. Then, you can analyze your data by running queries using the built-in SQL query engine, or perform more complex analytics and machine learning inference. IoT Analytics includes pre-built models for common IoT use cases so you can answer questions like which devices are about to fail or which customers are at risk of abandoning their wearable devices.

``` swift
public protocol IoTAnalyticsClientProtocol 
```

## Requirements

### batchPutMessage(input:completion:)

Sends messages to a channel.

``` swift
func batchPutMessage(input: BatchPutMessageInput, completion: @escaping (ClientRuntime.SdkResult<BatchPutMessageOutputResponse, BatchPutMessageOutputError>) -> Void)
```

### cancelPipelineReprocessing(input:completion:)

Cancels the reprocessing of data through the pipeline.

``` swift
func cancelPipelineReprocessing(input: CancelPipelineReprocessingInput, completion: @escaping (ClientRuntime.SdkResult<CancelPipelineReprocessingOutputResponse, CancelPipelineReprocessingOutputError>) -> Void)
```

### createChannel(input:completion:)

Used to create a channel. A channel collects data from an MQTT topic and archives the raw, unprocessed messages before publishing the data to a pipeline.

``` swift
func createChannel(input: CreateChannelInput, completion: @escaping (ClientRuntime.SdkResult<CreateChannelOutputResponse, CreateChannelOutputError>) -> Void)
```

### createDataset(input:completion:)

Used to create a dataset. A dataset stores data retrieved from a data store by applying a queryAction (a SQL query) or a containerAction (executing a containerized application). This operation creates the skeleton of a dataset. The dataset can be populated manually by calling CreateDatasetContent or automatically according to a trigger you specify.

``` swift
func createDataset(input: CreateDatasetInput, completion: @escaping (ClientRuntime.SdkResult<CreateDatasetOutputResponse, CreateDatasetOutputError>) -> Void)
```

### createDatasetContent(input:completion:)

Creates the content of a dataset by applying a queryAction (a SQL query) or a containerAction (executing a containerized application).

``` swift
func createDatasetContent(input: CreateDatasetContentInput, completion: @escaping (ClientRuntime.SdkResult<CreateDatasetContentOutputResponse, CreateDatasetContentOutputError>) -> Void)
```

### createDatastore(input:completion:)

Creates a data store, which is a repository for messages.

``` swift
func createDatastore(input: CreateDatastoreInput, completion: @escaping (ClientRuntime.SdkResult<CreateDatastoreOutputResponse, CreateDatastoreOutputError>) -> Void)
```

### createPipeline(input:completion:)

Creates a pipeline. A pipeline consumes messages from a channel and allows you to process the messages before storing them in a data store. You must specify both a channel and a datastore activity and, optionally, as many as 23 additional activities in the pipelineActivities array.

``` swift
func createPipeline(input: CreatePipelineInput, completion: @escaping (ClientRuntime.SdkResult<CreatePipelineOutputResponse, CreatePipelineOutputError>) -> Void)
```

### deleteChannel(input:completion:)

Deletes the specified channel.

``` swift
func deleteChannel(input: DeleteChannelInput, completion: @escaping (ClientRuntime.SdkResult<DeleteChannelOutputResponse, DeleteChannelOutputError>) -> Void)
```

### deleteDataset(input:completion:)

Deletes the specified dataset. You do not have to delete the content of the dataset before you perform this operation.

``` swift
func deleteDataset(input: DeleteDatasetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDatasetOutputResponse, DeleteDatasetOutputError>) -> Void)
```

### deleteDatasetContent(input:completion:)

Deletes the content of the specified dataset.

``` swift
func deleteDatasetContent(input: DeleteDatasetContentInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDatasetContentOutputResponse, DeleteDatasetContentOutputError>) -> Void)
```

### deleteDatastore(input:completion:)

Deletes the specified data store.

``` swift
func deleteDatastore(input: DeleteDatastoreInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDatastoreOutputResponse, DeleteDatastoreOutputError>) -> Void)
```

### deletePipeline(input:completion:)

Deletes the specified pipeline.

``` swift
func deletePipeline(input: DeletePipelineInput, completion: @escaping (ClientRuntime.SdkResult<DeletePipelineOutputResponse, DeletePipelineOutputError>) -> Void)
```

### describeChannel(input:completion:)

Retrieves information about a channel.

``` swift
func describeChannel(input: DescribeChannelInput, completion: @escaping (ClientRuntime.SdkResult<DescribeChannelOutputResponse, DescribeChannelOutputError>) -> Void)
```

### describeDataset(input:completion:)

Retrieves information about a dataset.

``` swift
func describeDataset(input: DescribeDatasetInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDatasetOutputResponse, DescribeDatasetOutputError>) -> Void)
```

### describeDatastore(input:completion:)

Retrieves information about a data store.

``` swift
func describeDatastore(input: DescribeDatastoreInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDatastoreOutputResponse, DescribeDatastoreOutputError>) -> Void)
```

### describeLoggingOptions(input:completion:)

Retrieves the current settings of the IoT Analytics logging options.

``` swift
func describeLoggingOptions(input: DescribeLoggingOptionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLoggingOptionsOutputResponse, DescribeLoggingOptionsOutputError>) -> Void)
```

### describePipeline(input:completion:)

Retrieves information about a pipeline.

``` swift
func describePipeline(input: DescribePipelineInput, completion: @escaping (ClientRuntime.SdkResult<DescribePipelineOutputResponse, DescribePipelineOutputError>) -> Void)
```

### getDatasetContent(input:completion:)

Retrieves the contents of a dataset as presigned URIs.

``` swift
func getDatasetContent(input: GetDatasetContentInput, completion: @escaping (ClientRuntime.SdkResult<GetDatasetContentOutputResponse, GetDatasetContentOutputError>) -> Void)
```

### listChannels(input:completion:)

Retrieves a list of channels.

``` swift
func listChannels(input: ListChannelsInput, completion: @escaping (ClientRuntime.SdkResult<ListChannelsOutputResponse, ListChannelsOutputError>) -> Void)
```

### listDatasetContents(input:completion:)

Lists information about dataset contents that have been created.

``` swift
func listDatasetContents(input: ListDatasetContentsInput, completion: @escaping (ClientRuntime.SdkResult<ListDatasetContentsOutputResponse, ListDatasetContentsOutputError>) -> Void)
```

### listDatasets(input:completion:)

Retrieves information about datasets.

``` swift
func listDatasets(input: ListDatasetsInput, completion: @escaping (ClientRuntime.SdkResult<ListDatasetsOutputResponse, ListDatasetsOutputError>) -> Void)
```

### listDatastores(input:completion:)

Retrieves a list of data stores.

``` swift
func listDatastores(input: ListDatastoresInput, completion: @escaping (ClientRuntime.SdkResult<ListDatastoresOutputResponse, ListDatastoresOutputError>) -> Void)
```

### listPipelines(input:completion:)

Retrieves a list of pipelines.

``` swift
func listPipelines(input: ListPipelinesInput, completion: @escaping (ClientRuntime.SdkResult<ListPipelinesOutputResponse, ListPipelinesOutputError>) -> Void)
```

### listTagsForResource(input:completion:)

Lists the tags (metadata) that you have assigned to the resource.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### putLoggingOptions(input:completion:)

Sets or updates the IoT Analytics logging options. If you update the value of any loggingOptions field, it takes up to one minute for the change to take effect. Also, if you change the policy attached to the role you specified in the roleArn field (for example, to correct an invalid policy), it takes up to five minutes for that change to take effect.

``` swift
func putLoggingOptions(input: PutLoggingOptionsInput, completion: @escaping (ClientRuntime.SdkResult<PutLoggingOptionsOutputResponse, PutLoggingOptionsOutputError>) -> Void)
```

### runPipelineActivity(input:completion:)

Simulates the results of running a pipeline activity on a message payload.

``` swift
func runPipelineActivity(input: RunPipelineActivityInput, completion: @escaping (ClientRuntime.SdkResult<RunPipelineActivityOutputResponse, RunPipelineActivityOutputError>) -> Void)
```

### sampleChannelData(input:completion:)

Retrieves a sample of messages from the specified channel ingested during the specified timeframe. Up to 10 messages can be retrieved.

``` swift
func sampleChannelData(input: SampleChannelDataInput, completion: @escaping (ClientRuntime.SdkResult<SampleChannelDataOutputResponse, SampleChannelDataOutputError>) -> Void)
```

### startPipelineReprocessing(input:completion:)

Starts the reprocessing of raw message data through the pipeline.

``` swift
func startPipelineReprocessing(input: StartPipelineReprocessingInput, completion: @escaping (ClientRuntime.SdkResult<StartPipelineReprocessingOutputResponse, StartPipelineReprocessingOutputError>) -> Void)
```

### tagResource(input:completion:)

Adds to or modifies the tags of the given resource. Tags are metadata that can be used to manage a resource.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:completion:)

Removes the given tags (metadata) from the resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateChannel(input:completion:)

Used to update the settings of a channel.

``` swift
func updateChannel(input: UpdateChannelInput, completion: @escaping (ClientRuntime.SdkResult<UpdateChannelOutputResponse, UpdateChannelOutputError>) -> Void)
```

### updateDataset(input:completion:)

Updates the settings of a dataset.

``` swift
func updateDataset(input: UpdateDatasetInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDatasetOutputResponse, UpdateDatasetOutputError>) -> Void)
```

### updateDatastore(input:completion:)

Used to update the settings of a data store.

``` swift
func updateDatastore(input: UpdateDatastoreInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDatastoreOutputResponse, UpdateDatastoreOutputError>) -> Void)
```

### updatePipeline(input:completion:)

Updates the settings of a pipeline. You must specify both a channel and a datastore activity and, optionally, as many as 23 additional activities in the pipelineActivities array.

``` swift
func updatePipeline(input: UpdatePipelineInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePipelineOutputResponse, UpdatePipelineOutputError>) -> Void)
```
