# LookoutEquipmentClientProtocol

Amazon Lookout for Equipment is a machine learning service that uses advanced analytics to identify anomalies in machines from sensor data for use in predictive maintenance.

``` swift
public protocol LookoutEquipmentClientProtocol 
```

## Requirements

### createDataset(input:completion:)

Creates a container for a collection of data being ingested for analysis. The dataset contains the metadata describing where the data is and what the data actually looks like. In other words, it contains the location of the data source, the data schema, and other information. A dataset also contains any tags associated with the ingested data.

``` swift
func createDataset(input: CreateDatasetInput, completion: @escaping (ClientRuntime.SdkResult<CreateDatasetOutputResponse, CreateDatasetOutputError>) -> Void)
```

### createInferenceScheduler(input:completion:)

Creates a scheduled inference. Scheduling an inference is setting up a continuous real-time inference plan to analyze new measurement data. When setting up the schedule, you provide an S3 bucket location for the input data, assign it a delimiter between separate entries in the data, set an offset delay if desired, and set the frequency of inferencing. You must also provide an S3 bucket location for the output data.

``` swift
func createInferenceScheduler(input: CreateInferenceSchedulerInput, completion: @escaping (ClientRuntime.SdkResult<CreateInferenceSchedulerOutputResponse, CreateInferenceSchedulerOutputError>) -> Void)
```

### createModel(input:completion:)

Creates an ML model for data inference. A machine-learning (ML) model is a mathematical model that finds patterns in your data. In Amazon Lookout for Equipment, the model learns the patterns of normal behavior and detects abnormal behavior that could be potential equipment failure (or maintenance events). The models are made by analyzing normal data and abnormalities in machine behavior that have already occurred. Your model is trained using a portion of the data from your dataset and uses that data to learn patterns of normal behavior and abnormal patterns that lead to equipment failure. Another portion of the data is used to evaluate the model's accuracy.

``` swift
func createModel(input: CreateModelInput, completion: @escaping (ClientRuntime.SdkResult<CreateModelOutputResponse, CreateModelOutputError>) -> Void)
```

### deleteDataset(input:completion:)

Deletes a dataset and associated artifacts. The operation will check to see if any inference scheduler or data ingestion job is currently using the dataset, and if there isn't, the dataset, its metadata, and any associated data stored in S3 will be deleted. This does not affect any models that used this dataset for training and evaluation, but does prevent it from being used in the future.

``` swift
func deleteDataset(input: DeleteDatasetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDatasetOutputResponse, DeleteDatasetOutputError>) -> Void)
```

### deleteInferenceScheduler(input:completion:)

Deletes an inference scheduler that has been set up. Already processed output results are not affected.

``` swift
func deleteInferenceScheduler(input: DeleteInferenceSchedulerInput, completion: @escaping (ClientRuntime.SdkResult<DeleteInferenceSchedulerOutputResponse, DeleteInferenceSchedulerOutputError>) -> Void)
```

### deleteModel(input:completion:)

Deletes an ML model currently available for Amazon Lookout for Equipment. This will prevent it from being used with an inference scheduler, even one that is already set up.

``` swift
func deleteModel(input: DeleteModelInput, completion: @escaping (ClientRuntime.SdkResult<DeleteModelOutputResponse, DeleteModelOutputError>) -> Void)
```

### describeDataIngestionJob(input:completion:)

Provides information on a specific data ingestion job such as creation time, dataset ARN, status, and so on.

``` swift
func describeDataIngestionJob(input: DescribeDataIngestionJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDataIngestionJobOutputResponse, DescribeDataIngestionJobOutputError>) -> Void)
```

### describeDataset(input:completion:)

Provides a JSON description of the data that is in each time series dataset, including names, column names, and data types.

``` swift
func describeDataset(input: DescribeDatasetInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDatasetOutputResponse, DescribeDatasetOutputError>) -> Void)
```

### describeInferenceScheduler(input:completion:)

Specifies information about the inference scheduler being used, including name, model, status, and associated metadata

``` swift
func describeInferenceScheduler(input: DescribeInferenceSchedulerInput, completion: @escaping (ClientRuntime.SdkResult<DescribeInferenceSchedulerOutputResponse, DescribeInferenceSchedulerOutputError>) -> Void)
```

### describeModel(input:completion:)

Provides a JSON containing the overall information about a specific ML model, including model name and ARN, dataset, training and evaluation information, status, and so on.

``` swift
func describeModel(input: DescribeModelInput, completion: @escaping (ClientRuntime.SdkResult<DescribeModelOutputResponse, DescribeModelOutputError>) -> Void)
```

### listDataIngestionJobs(input:completion:)

Provides a list of all data ingestion jobs, including dataset name and ARN, S3 location of the input data, status, and so on.

``` swift
func listDataIngestionJobs(input: ListDataIngestionJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListDataIngestionJobsOutputResponse, ListDataIngestionJobsOutputError>) -> Void)
```

### listDatasets(input:completion:)

Lists all datasets currently available in your account, filtering on the dataset name.

``` swift
func listDatasets(input: ListDatasetsInput, completion: @escaping (ClientRuntime.SdkResult<ListDatasetsOutputResponse, ListDatasetsOutputError>) -> Void)
```

### listInferenceExecutions(input:completion:)

Lists all inference executions that have been performed by the specified inference scheduler.

``` swift
func listInferenceExecutions(input: ListInferenceExecutionsInput, completion: @escaping (ClientRuntime.SdkResult<ListInferenceExecutionsOutputResponse, ListInferenceExecutionsOutputError>) -> Void)
```

### listInferenceSchedulers(input:completion:)

Retrieves a list of all inference schedulers currently available for your account.

``` swift
func listInferenceSchedulers(input: ListInferenceSchedulersInput, completion: @escaping (ClientRuntime.SdkResult<ListInferenceSchedulersOutputResponse, ListInferenceSchedulersOutputError>) -> Void)
```

### listModels(input:completion:)

Generates a list of all models in the account, including model name and ARN, dataset, and status.

``` swift
func listModels(input: ListModelsInput, completion: @escaping (ClientRuntime.SdkResult<ListModelsOutputResponse, ListModelsOutputError>) -> Void)
```

### listTagsForResource(input:completion:)

Lists all the tags for a specified resource, including key and value.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### startDataIngestionJob(input:completion:)

Starts a data ingestion job. Amazon Lookout for Equipment returns the job status.

``` swift
func startDataIngestionJob(input: StartDataIngestionJobInput, completion: @escaping (ClientRuntime.SdkResult<StartDataIngestionJobOutputResponse, StartDataIngestionJobOutputError>) -> Void)
```

### startInferenceScheduler(input:completion:)

Starts an inference scheduler.

``` swift
func startInferenceScheduler(input: StartInferenceSchedulerInput, completion: @escaping (ClientRuntime.SdkResult<StartInferenceSchedulerOutputResponse, StartInferenceSchedulerOutputError>) -> Void)
```

### stopInferenceScheduler(input:completion:)

Stops an inference scheduler.

``` swift
func stopInferenceScheduler(input: StopInferenceSchedulerInput, completion: @escaping (ClientRuntime.SdkResult<StopInferenceSchedulerOutputResponse, StopInferenceSchedulerOutputError>) -> Void)
```

### tagResource(input:completion:)

Associates a given tag to a resource in your account. A tag is a key-value pair which can be added to an Amazon Lookout for Equipment resource as metadata. Tags can be used for organizing your resources as well as helping you to search and filter by tag. Multiple tags can be added to a resource, either when you create it, or later. Up to 50 tags can be associated with each resource.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:completion:)

Removes a specific tag from a given resource. The tag is specified by its key.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateInferenceScheduler(input:completion:)

Updates an inference scheduler.

``` swift
func updateInferenceScheduler(input: UpdateInferenceSchedulerInput, completion: @escaping (ClientRuntime.SdkResult<UpdateInferenceSchedulerOutputResponse, UpdateInferenceSchedulerOutputError>) -> Void)
```
