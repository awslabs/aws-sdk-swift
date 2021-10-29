# PersonalizeClient

``` swift
public class PersonalizeClient 
```

## Inheritance

[`PersonalizeClientProtocol`](/aws-sdk-swift/reference/0.x/AWSPersonalize/PersonalizeClientProtocol)

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
public static let clientName = "PersonalizeClient"
```

## Methods

### `createBatchInferenceJob(input:completion:)`

Creates a batch inference job. The operation can handle up to 50 million records and the input file must be in JSON format. For more information, see \[recommendations-batch\].

``` swift
public func createBatchInferenceJob(input: CreateBatchInferenceJobInput, completion: @escaping (ClientRuntime.SdkResult<CreateBatchInferenceJobOutputResponse, CreateBatchInferenceJobOutputError>) -> Void)
```

### `createCampaign(input:completion:)`

Creates a campaign by deploying a solution version. When a client calls the [GetRecommendations](https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html) and [GetPersonalizedRanking](https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetPersonalizedRanking.html) APIs, a campaign is specified in the request. Minimum Provisioned TPS and Auto-Scaling A transaction is a single GetRecommendations or GetPersonalizedRanking call. Transactions per second (TPS) is the throughput and unit of billing for Amazon Personalize. The minimum provisioned TPS (minProvisionedTPS) specifies the baseline throughput provisioned by Amazon Personalize, and thus, the minimum billing charge. If your TPS increases beyond minProvisionedTPS, Amazon Personalize auto-scales the provisioned capacity up and down, but never below minProvisionedTPS. There's a short time delay while the capacity is increased that might cause loss of transactions. The actual TPS used is calculated as the average requests/second within a 5-minute window. You pay for maximum of either the minimum provisioned TPS or the actual TPS. We recommend starting with a low minProvisionedTPS, track your usage using Amazon CloudWatch metrics, and then increase the minProvisionedTPS as necessary. Status A campaign can be in one of the following states:

``` swift
public func createCampaign(input: CreateCampaignInput, completion: @escaping (ClientRuntime.SdkResult<CreateCampaignOutputResponse, CreateCampaignOutputError>) -> Void)
```

  - CREATE PENDING \> CREATE IN\_PROGRESS \> ACTIVE -or- CREATE FAILED

  - DELETE PENDING \> DELETE IN\_PROGRESS

To get the campaign status, call \[DescribeCampaign\]. Wait until the status of the campaign is ACTIVE before asking the campaign for recommendations. Related APIs

  - \[ListCampaigns\]

  - \[DescribeCampaign\]

  - \[UpdateCampaign\]

  - \[DeleteCampaign\]

### `createDataset(input:completion:)`

Creates an empty dataset and adds it to the specified dataset group. Use \[CreateDatasetImportJob\] to import your training data to a dataset. There are three types of datasets:

``` swift
public func createDataset(input: CreateDatasetInput, completion: @escaping (ClientRuntime.SdkResult<CreateDatasetOutputResponse, CreateDatasetOutputError>) -> Void)
```

  - Interactions

  - Items

  - Users

Each dataset type has an associated schema with required field types. Only the Interactions dataset is required in order to train a model (also referred to as creating a solution). A dataset can be in one of the following states:

  - CREATE PENDING \> CREATE IN\_PROGRESS \> ACTIVE -or- CREATE FAILED

  - DELETE PENDING \> DELETE IN\_PROGRESS

To get the status of the dataset, call \[DescribeDataset\]. Related APIs

  - \[CreateDatasetGroup\]

  - \[ListDatasets\]

  - \[DescribeDataset\]

  - \[DeleteDataset\]

### `createDatasetExportJob(input:completion:)`

Creates a job that exports data from your dataset to an Amazon S3 bucket. To allow Amazon Personalize to export the training data, you must specify an service-linked IAM role that gives Amazon Personalize PutObject permissions for your Amazon S3 bucket. For information, see [Exporting a dataset](https://docs.aws.amazon.com/personalize/latest/dg/export-data.html) in the Amazon Personalize developer guide. Status A dataset export job can be in one of the following states:

``` swift
public func createDatasetExportJob(input: CreateDatasetExportJobInput, completion: @escaping (ClientRuntime.SdkResult<CreateDatasetExportJobOutputResponse, CreateDatasetExportJobOutputError>) -> Void)
```

  - CREATE PENDING \> CREATE IN\_PROGRESS \> ACTIVE -or- CREATE FAILED

To get the status of the export job, call \[DescribeDatasetExportJob\], and specify the Amazon Resource Name (ARN) of the dataset export job. The dataset export is complete when the status shows as ACTIVE. If the status shows as CREATE FAILED, the response includes a failureReason key, which describes why the job failed.

### `createDatasetGroup(input:completion:)`

Creates an empty dataset group. A dataset group contains related datasets that supply data for training a model. A dataset group can contain at most three datasets, one for each type of dataset:

``` swift
public func createDatasetGroup(input: CreateDatasetGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateDatasetGroupOutputResponse, CreateDatasetGroupOutputError>) -> Void)
```

  - Interactions

  - Items

  - Users

To train a model (create a solution), a dataset group that contains an Interactions dataset is required. Call \[CreateDataset\] to add a dataset to the group. A dataset group can be in one of the following states:

  - CREATE PENDING \> CREATE IN\_PROGRESS \> ACTIVE -or- CREATE FAILED

  - DELETE PENDING

To get the status of the dataset group, call \[DescribeDatasetGroup\]. If the status shows as CREATE FAILED, the response includes a failureReason key, which describes why the creation failed. You must wait until the status of the dataset group is ACTIVE before adding a dataset to the group. You can specify an Key Management Service (KMS) key to encrypt the datasets in the group. If you specify a KMS key, you must also include an Identity and Access Management (IAM) role that has permission to access the key. APIs that require a dataset group ARN in the request

  - \[CreateDataset\]

  - \[CreateEventTracker\]

  - \[CreateSolution\]

Related APIs

  - \[ListDatasetGroups\]

  - \[DescribeDatasetGroup\]

  - \[DeleteDatasetGroup\]

### `createDatasetImportJob(input:completion:)`

Creates a job that imports training data from your data source (an Amazon S3 bucket) to an Amazon Personalize dataset. To allow Amazon Personalize to import the training data, you must specify an IAM service role that has permission to read from the data source, as Amazon Personalize makes a copy of your data and processes it internally. For information on granting access to your Amazon S3 bucket, see [Giving Amazon Personalize Access to Amazon S3 Resources](https://docs.aws.amazon.com/personalize/latest/dg/granting-personalize-s3-access.html). The dataset import job replaces any existing data in the dataset that you imported in bulk. Status A dataset import job can be in one of the following states:

``` swift
public func createDatasetImportJob(input: CreateDatasetImportJobInput, completion: @escaping (ClientRuntime.SdkResult<CreateDatasetImportJobOutputResponse, CreateDatasetImportJobOutputError>) -> Void)
```

  - CREATE PENDING \> CREATE IN\_PROGRESS \> ACTIVE -or- CREATE FAILED

To get the status of the import job, call \[DescribeDatasetImportJob\], providing the Amazon Resource Name (ARN) of the dataset import job. The dataset import is complete when the status shows as ACTIVE. If the status shows as CREATE FAILED, the response includes a failureReason key, which describes why the job failed. Importing takes time. You must wait until the status shows as ACTIVE before training a model using the dataset. Related APIs

  - \[ListDatasetImportJobs\]

  - \[DescribeDatasetImportJob\]

### `createEventTracker(input:completion:)`

Creates an event tracker that you use when adding event data to a specified dataset group using the [PutEvents](https://docs.aws.amazon.com/personalize/latest/dg/API_UBS_PutEvents.html) API. Only one event tracker can be associated with a dataset group. You will get an error if you call CreateEventTracker using the same dataset group as an existing event tracker. When you create an event tracker, the response includes a tracking ID, which you pass as a parameter when you use the [PutEvents](https://docs.aws.amazon.com/personalize/latest/dg/API_UBS_PutEvents.html) operation. Amazon Personalize then appends the event data to the Interactions dataset of the dataset group you specify in your event tracker. The event tracker can be in one of the following states:

``` swift
public func createEventTracker(input: CreateEventTrackerInput, completion: @escaping (ClientRuntime.SdkResult<CreateEventTrackerOutputResponse, CreateEventTrackerOutputError>) -> Void)
```

  - CREATE PENDING \> CREATE IN\_PROGRESS \> ACTIVE -or- CREATE FAILED

  - DELETE PENDING \> DELETE IN\_PROGRESS

To get the status of the event tracker, call \[DescribeEventTracker\]. The event tracker must be in the ACTIVE state before using the tracking ID. Related APIs

  - \[ListEventTrackers\]

  - \[DescribeEventTracker\]

  - \[DeleteEventTracker\]

### `createFilter(input:completion:)`

Creates a recommendation filter. For more information, see \[filter\].

``` swift
public func createFilter(input: CreateFilterInput, completion: @escaping (ClientRuntime.SdkResult<CreateFilterOutputResponse, CreateFilterOutputError>) -> Void)
```

### `createSchema(input:completion:)`

Creates an Amazon Personalize schema from the specified schema string. The schema you create must be in Avro JSON format. Amazon Personalize recognizes three schema variants. Each schema is associated with a dataset type and has a set of required field and keywords. You specify a schema when you call \[CreateDataset\]. Related APIs

``` swift
public func createSchema(input: CreateSchemaInput, completion: @escaping (ClientRuntime.SdkResult<CreateSchemaOutputResponse, CreateSchemaOutputError>) -> Void)
```

  - \[ListSchemas\]

  - \[DescribeSchema\]

  - \[DeleteSchema\]

### `createSolution(input:completion:)`

Creates the configuration for training a model. A trained model is known as a solution. After the configuration is created, you train the model (create a solution) by calling the \[CreateSolutionVersion\] operation. Every time you call CreateSolutionVersion, a new version of the solution is created. After creating a solution version, you check its accuracy by calling \[GetSolutionMetrics\]. When you are satisfied with the version, you deploy it using \[CreateCampaign\]. The campaign provides recommendations to a client through the [GetRecommendations](https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html) API. To train a model, Amazon Personalize requires training data and a recipe. The training data comes from the dataset group that you provide in the request. A recipe specifies the training algorithm and a feature transformation. You can specify one of the predefined recipes provided by Amazon Personalize. Alternatively, you can specify performAutoML and Amazon Personalize will analyze your data and select the optimum USER\_PERSONALIZATION recipe for you. Amazon Personalize doesn't support configuring the hpoObjective for solution hyperparameter optimization at this time. Status A solution can be in one of the following states:

``` swift
public func createSolution(input: CreateSolutionInput, completion: @escaping (ClientRuntime.SdkResult<CreateSolutionOutputResponse, CreateSolutionOutputError>) -> Void)
```

  - CREATE PENDING \> CREATE IN\_PROGRESS \> ACTIVE -or- CREATE FAILED

  - DELETE PENDING \> DELETE IN\_PROGRESS

To get the status of the solution, call \[DescribeSolution\]. Wait until the status shows as ACTIVE before calling CreateSolutionVersion. Related APIs

  - \[ListSolutions\]

  - \[CreateSolutionVersion\]

  - \[DescribeSolution\]

  - \[DeleteSolution\]

  - \[ListSolutionVersions\]

  - \[DescribeSolutionVersion\]

### `createSolutionVersion(input:completion:)`

Trains or retrains an active solution. A solution is created using the \[CreateSolution\] operation and must be in the ACTIVE state before calling CreateSolutionVersion. A new version of the solution is created every time you call this operation. Status A solution version can be in one of the following states:

``` swift
public func createSolutionVersion(input: CreateSolutionVersionInput, completion: @escaping (ClientRuntime.SdkResult<CreateSolutionVersionOutputResponse, CreateSolutionVersionOutputError>) -> Void)
```

  - CREATE PENDING

  - CREATE IN\_PROGRESS

  - ACTIVE

  - CREATE FAILED

  - CREATE STOPPING

  - CREATE STOPPED

To get the status of the version, call \[DescribeSolutionVersion\]. Wait until the status shows as ACTIVE before calling CreateCampaign. If the status shows as CREATE FAILED, the response includes a failureReason key, which describes why the job failed. Related APIs

  - \[ListSolutionVersions\]

  - \[DescribeSolutionVersion\]

  - \[ListSolutions\]

  - \[CreateSolution\]

  - \[DescribeSolution\]

  - \[DeleteSolution\]

### `deleteCampaign(input:completion:)`

Removes a campaign by deleting the solution deployment. The solution that the campaign is based on is not deleted and can be redeployed when needed. A deleted campaign can no longer be specified in a [GetRecommendations](https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html) request. For more information on campaigns, see \[CreateCampaign\].

``` swift
public func deleteCampaign(input: DeleteCampaignInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCampaignOutputResponse, DeleteCampaignOutputError>) -> Void)
```

### `deleteDataset(input:completion:)`

Deletes a dataset. You can't delete a dataset if an associated DatasetImportJob or SolutionVersion is in the CREATE PENDING or IN PROGRESS state. For more information on datasets, see \[CreateDataset\].

``` swift
public func deleteDataset(input: DeleteDatasetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDatasetOutputResponse, DeleteDatasetOutputError>) -> Void)
```

### `deleteDatasetGroup(input:completion:)`

Deletes a dataset group. Before you delete a dataset group, you must delete the following:

``` swift
public func deleteDatasetGroup(input: DeleteDatasetGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDatasetGroupOutputResponse, DeleteDatasetGroupOutputError>) -> Void)
```

  - All associated event trackers.

  - All associated solutions.

  - All datasets in the dataset group.

### `deleteEventTracker(input:completion:)`

Deletes the event tracker. Does not delete the event-interactions dataset from the associated dataset group. For more information on event trackers, see \[CreateEventTracker\].

``` swift
public func deleteEventTracker(input: DeleteEventTrackerInput, completion: @escaping (ClientRuntime.SdkResult<DeleteEventTrackerOutputResponse, DeleteEventTrackerOutputError>) -> Void)
```

### `deleteFilter(input:completion:)`

Deletes a filter.

``` swift
public func deleteFilter(input: DeleteFilterInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFilterOutputResponse, DeleteFilterOutputError>) -> Void)
```

### `deleteSchema(input:completion:)`

Deletes a schema. Before deleting a schema, you must delete all datasets referencing the schema. For more information on schemas, see \[CreateSchema\].

``` swift
public func deleteSchema(input: DeleteSchemaInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSchemaOutputResponse, DeleteSchemaOutputError>) -> Void)
```

### `deleteSolution(input:completion:)`

Deletes all versions of a solution and the Solution object itself. Before deleting a solution, you must delete all campaigns based on the solution. To determine what campaigns are using the solution, call \[ListCampaigns\] and supply the Amazon Resource Name (ARN) of the solution. You can't delete a solution if an associated SolutionVersion is in the CREATE PENDING or IN PROGRESS state. For more information on solutions, see \[CreateSolution\].

``` swift
public func deleteSolution(input: DeleteSolutionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSolutionOutputResponse, DeleteSolutionOutputError>) -> Void)
```

### `describeAlgorithm(input:completion:)`

Describes the given algorithm.

``` swift
public func describeAlgorithm(input: DescribeAlgorithmInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAlgorithmOutputResponse, DescribeAlgorithmOutputError>) -> Void)
```

### `describeBatchInferenceJob(input:completion:)`

Gets the properties of a batch inference job including name, Amazon Resource Name (ARN), status, input and output configurations, and the ARN of the solution version used to generate the recommendations.

``` swift
public func describeBatchInferenceJob(input: DescribeBatchInferenceJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBatchInferenceJobOutputResponse, DescribeBatchInferenceJobOutputError>) -> Void)
```

### `describeCampaign(input:completion:)`

Describes the given campaign, including its status. A campaign can be in one of the following states:

``` swift
public func describeCampaign(input: DescribeCampaignInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCampaignOutputResponse, DescribeCampaignOutputError>) -> Void)
```

  - CREATE PENDING \> CREATE IN\_PROGRESS \> ACTIVE -or- CREATE FAILED

  - DELETE PENDING \> DELETE IN\_PROGRESS

When the status is CREATE FAILED, the response includes the failureReason key, which describes why. For more information on campaigns, see \[CreateCampaign\].

### `describeDataset(input:completion:)`

Describes the given dataset. For more information on datasets, see \[CreateDataset\].

``` swift
public func describeDataset(input: DescribeDatasetInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDatasetOutputResponse, DescribeDatasetOutputError>) -> Void)
```

### `describeDatasetExportJob(input:completion:)`

Describes the dataset export job created by \[CreateDatasetExportJob\], including the export job status.

``` swift
public func describeDatasetExportJob(input: DescribeDatasetExportJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDatasetExportJobOutputResponse, DescribeDatasetExportJobOutputError>) -> Void)
```

### `describeDatasetGroup(input:completion:)`

Describes the given dataset group. For more information on dataset groups, see \[CreateDatasetGroup\].

``` swift
public func describeDatasetGroup(input: DescribeDatasetGroupInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDatasetGroupOutputResponse, DescribeDatasetGroupOutputError>) -> Void)
```

### `describeDatasetImportJob(input:completion:)`

Describes the dataset import job created by \[CreateDatasetImportJob\], including the import job status.

``` swift
public func describeDatasetImportJob(input: DescribeDatasetImportJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDatasetImportJobOutputResponse, DescribeDatasetImportJobOutputError>) -> Void)
```

### `describeEventTracker(input:completion:)`

Describes an event tracker. The response includes the trackingId and status of the event tracker. For more information on event trackers, see \[CreateEventTracker\].

``` swift
public func describeEventTracker(input: DescribeEventTrackerInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEventTrackerOutputResponse, DescribeEventTrackerOutputError>) -> Void)
```

### `describeFeatureTransformation(input:completion:)`

Describes the given feature transformation.

``` swift
public func describeFeatureTransformation(input: DescribeFeatureTransformationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFeatureTransformationOutputResponse, DescribeFeatureTransformationOutputError>) -> Void)
```

### `describeFilter(input:completion:)`

Describes a filter's properties.

``` swift
public func describeFilter(input: DescribeFilterInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFilterOutputResponse, DescribeFilterOutputError>) -> Void)
```

### `describeRecipe(input:completion:)`

Describes a recipe. A recipe contains three items:

``` swift
public func describeRecipe(input: DescribeRecipeInput, completion: @escaping (ClientRuntime.SdkResult<DescribeRecipeOutputResponse, DescribeRecipeOutputError>) -> Void)
```

  - An algorithm that trains a model.

  - Hyperparameters that govern the training.

  - Feature transformation information for modifying the input data before training.

Amazon Personalize provides a set of predefined recipes. You specify a recipe when you create a solution with the \[CreateSolution\] API. CreateSolution trains a model by using the algorithm in the specified recipe and a training dataset. The solution, when deployed as a campaign, can provide recommendations using the [GetRecommendations](https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html) API.

### `describeSchema(input:completion:)`

Describes a schema. For more information on schemas, see \[CreateSchema\].

``` swift
public func describeSchema(input: DescribeSchemaInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSchemaOutputResponse, DescribeSchemaOutputError>) -> Void)
```

### `describeSolution(input:completion:)`

Describes a solution. For more information on solutions, see \[CreateSolution\].

``` swift
public func describeSolution(input: DescribeSolutionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSolutionOutputResponse, DescribeSolutionOutputError>) -> Void)
```

### `describeSolutionVersion(input:completion:)`

Describes a specific version of a solution. For more information on solutions, see \[CreateSolution\].

``` swift
public func describeSolutionVersion(input: DescribeSolutionVersionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSolutionVersionOutputResponse, DescribeSolutionVersionOutputError>) -> Void)
```

### `getSolutionMetrics(input:completion:)`

Gets the metrics for the specified solution version.

``` swift
public func getSolutionMetrics(input: GetSolutionMetricsInput, completion: @escaping (ClientRuntime.SdkResult<GetSolutionMetricsOutputResponse, GetSolutionMetricsOutputError>) -> Void)
```

### `listBatchInferenceJobs(input:completion:)`

Gets a list of the batch inference jobs that have been performed off of a solution version.

``` swift
public func listBatchInferenceJobs(input: ListBatchInferenceJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListBatchInferenceJobsOutputResponse, ListBatchInferenceJobsOutputError>) -> Void)
```

### `listCampaigns(input:completion:)`

Returns a list of campaigns that use the given solution. When a solution is not specified, all the campaigns associated with the account are listed. The response provides the properties for each campaign, including the Amazon Resource Name (ARN). For more information on campaigns, see \[CreateCampaign\].

``` swift
public func listCampaigns(input: ListCampaignsInput, completion: @escaping (ClientRuntime.SdkResult<ListCampaignsOutputResponse, ListCampaignsOutputError>) -> Void)
```

### `listDatasetExportJobs(input:completion:)`

Returns a list of dataset export jobs that use the given dataset. When a dataset is not specified, all the dataset export jobs associated with the account are listed. The response provides the properties for each dataset export job, including the Amazon Resource Name (ARN). For more information on dataset export jobs, see \[CreateDatasetExportJob\]. For more information on datasets, see \[CreateDataset\].

``` swift
public func listDatasetExportJobs(input: ListDatasetExportJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListDatasetExportJobsOutputResponse, ListDatasetExportJobsOutputError>) -> Void)
```

### `listDatasetGroups(input:completion:)`

Returns a list of dataset groups. The response provides the properties for each dataset group, including the Amazon Resource Name (ARN). For more information on dataset groups, see \[CreateDatasetGroup\].

``` swift
public func listDatasetGroups(input: ListDatasetGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListDatasetGroupsOutputResponse, ListDatasetGroupsOutputError>) -> Void)
```

### `listDatasetImportJobs(input:completion:)`

Returns a list of dataset import jobs that use the given dataset. When a dataset is not specified, all the dataset import jobs associated with the account are listed. The response provides the properties for each dataset import job, including the Amazon Resource Name (ARN). For more information on dataset import jobs, see \[CreateDatasetImportJob\]. For more information on datasets, see \[CreateDataset\].

``` swift
public func listDatasetImportJobs(input: ListDatasetImportJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListDatasetImportJobsOutputResponse, ListDatasetImportJobsOutputError>) -> Void)
```

### `listDatasets(input:completion:)`

Returns the list of datasets contained in the given dataset group. The response provides the properties for each dataset, including the Amazon Resource Name (ARN). For more information on datasets, see \[CreateDataset\].

``` swift
public func listDatasets(input: ListDatasetsInput, completion: @escaping (ClientRuntime.SdkResult<ListDatasetsOutputResponse, ListDatasetsOutputError>) -> Void)
```

### `listEventTrackers(input:completion:)`

Returns the list of event trackers associated with the account. The response provides the properties for each event tracker, including the Amazon Resource Name (ARN) and tracking ID. For more information on event trackers, see \[CreateEventTracker\].

``` swift
public func listEventTrackers(input: ListEventTrackersInput, completion: @escaping (ClientRuntime.SdkResult<ListEventTrackersOutputResponse, ListEventTrackersOutputError>) -> Void)
```

### `listFilters(input:completion:)`

Lists all filters that belong to a given dataset group.

``` swift
public func listFilters(input: ListFiltersInput, completion: @escaping (ClientRuntime.SdkResult<ListFiltersOutputResponse, ListFiltersOutputError>) -> Void)
```

### `listRecipes(input:completion:)`

Returns a list of available recipes. The response provides the properties for each recipe, including the recipe's Amazon Resource Name (ARN).

``` swift
public func listRecipes(input: ListRecipesInput, completion: @escaping (ClientRuntime.SdkResult<ListRecipesOutputResponse, ListRecipesOutputError>) -> Void)
```

### `listSchemas(input:completion:)`

Returns the list of schemas associated with the account. The response provides the properties for each schema, including the Amazon Resource Name (ARN). For more information on schemas, see \[CreateSchema\].

``` swift
public func listSchemas(input: ListSchemasInput, completion: @escaping (ClientRuntime.SdkResult<ListSchemasOutputResponse, ListSchemasOutputError>) -> Void)
```

### `listSolutionVersions(input:completion:)`

Returns a list of solution versions for the given solution. When a solution is not specified, all the solution versions associated with the account are listed. The response provides the properties for each solution version, including the Amazon Resource Name (ARN). For more information on solutions, see \[CreateSolution\].

``` swift
public func listSolutionVersions(input: ListSolutionVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListSolutionVersionsOutputResponse, ListSolutionVersionsOutputError>) -> Void)
```

### `listSolutions(input:completion:)`

Returns a list of solutions that use the given dataset group. When a dataset group is not specified, all the solutions associated with the account are listed. The response provides the properties for each solution, including the Amazon Resource Name (ARN). For more information on solutions, see \[CreateSolution\].

``` swift
public func listSolutions(input: ListSolutionsInput, completion: @escaping (ClientRuntime.SdkResult<ListSolutionsOutputResponse, ListSolutionsOutputError>) -> Void)
```

### `stopSolutionVersionCreation(input:completion:)`

Stops creating a solution version that is in a state of CREATE\_PENDING or CREATE IN\_PROGRESS. Depending on the current state of the solution version, the solution version state changes as follows:

``` swift
public func stopSolutionVersionCreation(input: StopSolutionVersionCreationInput, completion: @escaping (ClientRuntime.SdkResult<StopSolutionVersionCreationOutputResponse, StopSolutionVersionCreationOutputError>) -> Void)
```

  - CREATE\_PENDING \> CREATE\_STOPPED or

  - CREATE\_IN\_PROGRESS \> CREATE\_STOPPING \> CREATE\_STOPPED

You are billed for all of the training completed up until you stop the solution version creation. You cannot resume creating a solution version once it has been stopped.

### `updateCampaign(input:completion:)`

Updates a campaign by either deploying a new solution or changing the value of the campaign's minProvisionedTPS parameter. To update a campaign, the campaign status must be ACTIVE or CREATE FAILED. Check the campaign status using the \[DescribeCampaign\] API. You must wait until the status of the updated campaign is ACTIVE before asking the campaign for recommendations. For more information on campaigns, see \[CreateCampaign\].

``` swift
public func updateCampaign(input: UpdateCampaignInput, completion: @escaping (ClientRuntime.SdkResult<UpdateCampaignOutputResponse, UpdateCampaignOutputError>) -> Void)
```
