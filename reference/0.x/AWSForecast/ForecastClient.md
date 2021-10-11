# ForecastClient

``` swift
public class ForecastClient 
```

## Inheritance

[`ForecastClientProtocol`](/aws-sdk-swift/reference/0.x/AWSForecast/ForecastClientProtocol)

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

### `createDataset(input:completion:)`

Creates an Amazon Forecast dataset. The information about the dataset that you provide helps
Forecast understand how to consume the data for model training. This includes the
following:​

``` swift
public func createDataset(input: CreateDatasetInput, completion: @escaping (ClientRuntime.SdkResult<CreateDatasetOutputResponse, CreateDatasetOutputError>) -> Void)
```

``` 
                 DataFrequency
               - How frequently your historical
      time-series data is collected.




                 Domain
               and

                 DatasetType
               - Each dataset has an associated dataset
      domain and a type within the domain. Amazon Forecast provides a list of predefined domains and
      types within each domain. For each unique dataset domain and type within the domain,
      Amazon Forecast requires your data to include a minimum set of predefined fields.




                 Schema
               - A schema specifies the fields in the dataset,
      including the field name and data type.


     After creating a dataset, you import your training data into it and add the dataset to a
  dataset group. You use the dataset group to create a predictor. For more information, see
    howitworks-datasets-groups.
     To get a list of all your datasets, use the ListDatasets
  operation.
     For example Forecast datasets, see the <a href="https://github.com/aws-samples/amazon-forecast-samples">Amazon Forecast Sample GitHub
    repository.

        The Status of a dataset must be ACTIVE before you can import
    training data. Use the DescribeDataset operation to get the status.
```

### `createDatasetGroup(input:completion:)`

Creates a dataset group, which holds a collection of related datasets. You can add
datasets to the dataset group when you create the dataset group, or later by using the UpdateDatasetGroup operation.
After creating a dataset group and adding datasets, you use the dataset group when you
create a predictor. For more information, see howitworks-datasets-groups.
To get a list of all your datasets groups, use the ListDatasetGroups
operation.

``` swift
public func createDatasetGroup(input: CreateDatasetGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateDatasetGroupOutputResponse, CreateDatasetGroupOutputError>) -> Void)
```

``` 
        The Status of a dataset group must be ACTIVE before you can
    use the dataset group to create a predictor. To get the status, use the DescribeDatasetGroup operation.
```

### `createDatasetImportJob(input:completion:)`

Imports your training data to an Amazon Forecast dataset. You provide the location of your
training data in an Amazon Simple Storage Service (Amazon S3) bucket and the Amazon Resource Name (ARN) of the dataset
that you want to import the data to.
You must specify a DataSource object that includes an AWS Identity and Access Management (IAM)
role that Amazon Forecast can assume to access the data, as Amazon Forecast makes a copy of your data and
processes it in an internal AWS system. For more information, see aws-forecast-iam-roles.
The training data must be in CSV format. The delimiter must be a comma (,).
You can specify the path to a specific CSV file, the S3 bucket, or to a folder in the S3
bucket. For the latter two cases, Amazon Forecast imports all files up to the limit of 10,000
files.

``` swift
public func createDatasetImportJob(input: CreateDatasetImportJobInput, completion: @escaping (ClientRuntime.SdkResult<CreateDatasetImportJobOutputResponse, CreateDatasetImportJobOutputError>) -> Void)
```

``` 
     Because dataset imports are not aggregated, your most recent dataset import is the one
  that is used when training a predictor or generating a forecast. Make sure that your most
  recent dataset import contains all of the data you want to model off of, and not just the new
  data collected since the previous import.


     To get a list of all your dataset import jobs, filtered by specified criteria, use the
    ListDatasetImportJobs operation.
```

### `createForecast(input:completion:)`

Creates a forecast for each item in the TARGET\_TIME\_SERIES dataset that was
used to train the predictor. This is known as inference. To retrieve the forecast for a single
item at low latency, use the  operation. To
export the complete forecast into your Amazon Simple Storage Service (Amazon S3) bucket, use the CreateForecastExportJob operation.
The range of the forecast is determined by the ForecastHorizon value, which
you specify in the CreatePredictor request. When you query a forecast, you
can request a specific date range within the forecast.
To get a list of all your forecasts, use the ListForecasts
operation.

``` swift
public func createForecast(input: CreateForecastInput, completion: @escaping (ClientRuntime.SdkResult<CreateForecastOutputResponse, CreateForecastOutputError>) -> Void)
```

``` 
        The forecasts generated by Amazon Forecast are in the same time zone as the dataset that was
    used to create the predictor.

     For more information, see howitworks-forecast.

        The Status of the forecast must be ACTIVE before you can query
    or export the forecast. Use the DescribeForecast operation to get the
    status.
```

### `createForecastExportJob(input:completion:)`

Exports a forecast created by the CreateForecast operation to your
Amazon Simple Storage Service (Amazon S3) bucket. The forecast file name will match the following conventions:​
<ForecastExportJobName>*<ExportTimestamp>*<PartNumber>
where the <ExportTimestamp> component is in Java SimpleDateFormat
(yyyy-MM-ddTHH-mm-ssZ).
You must specify a DataDestination object that includes an AWS Identity and Access Management
(IAM) role that Amazon Forecast can assume to access the Amazon S3 bucket. For more information, see
aws-forecast-iam-roles.
For more information, see howitworks-forecast.
To get a list of all your forecast export jobs, use the ListForecastExportJobs operation.

``` swift
public func createForecastExportJob(input: CreateForecastExportJobInput, completion: @escaping (ClientRuntime.SdkResult<CreateForecastExportJobOutputResponse, CreateForecastExportJobOutputError>) -> Void)
```

``` 
        The Status of the forecast export job must be ACTIVE before
    you can access the forecast in your Amazon S3 bucket. To get the status, use the DescribeForecastExportJob operation.
```

### `createPredictor(input:completion:)`

Creates an Amazon Forecast predictor.
In the request, provide a dataset group and either specify an algorithm or let
Amazon Forecast choose an algorithm for you using AutoML. If you specify an algorithm, you also can
override algorithm-specific hyperparameters.
Amazon Forecast uses the algorithm to train a predictor using the latest version of the
datasets in the specified dataset group. You can then generate a
forecast using the CreateForecast operation.

``` swift
public func createPredictor(input: CreatePredictorInput, completion: @escaping (ClientRuntime.SdkResult<CreatePredictorOutputResponse, CreatePredictorOutputError>) -> Void)
```

``` 
  To see the evaluation metrics, use the GetAccuracyMetrics operation.

     You can specify a featurization configuration to fill and aggregate the data
  fields in the TARGET_TIME_SERIES dataset to improve model training. For more
  information, see FeaturizationConfig.
     For RELATED_TIME_SERIES datasets, CreatePredictor verifies that the
    DataFrequency specified when the dataset was created matches the
    ForecastFrequency. TARGET_TIME_SERIES datasets don't have this restriction.
  Amazon Forecast also verifies the delimiter and timestamp format. For more information, see howitworks-datasets-groups.
     By default, predictors are trained and evaluated at the 0.1 (P10), 0.5 (P50), and 0.9
  (P90) quantiles. You can choose custom forecast types to train and evaluate your predictor
  by setting the ForecastTypes.


        AutoML

     If you want Amazon Forecast to evaluate each algorithm and choose the one that minimizes the
    objective function, set PerformAutoML to true. The
    objective function is defined as the mean of the weighted losses over the
  forecast types. By default, these are the p10, p50, and p90
  quantile losses. For more information, see EvaluationResult.
     When AutoML is enabled, the following properties are disallowed:



              AlgorithmArn




              HPOConfig




              PerformHPO




              TrainingParameters






     To get a list of all of your predictors, use the ListPredictors
  operation.

        Before you can use the predictor to create a forecast, the Status of the
    predictor must be ACTIVE, signifying that training has completed. To get the
    status, use the DescribePredictor operation.
```

### `createPredictorBacktestExportJob(input:completion:)`

Exports backtest forecasts and accuracy metrics generated by the CreatePredictor operation. Two folders containing CSV files are exported
to your specified S3 bucket.
The export file names will match the following conventions:​

``` swift
public func createPredictorBacktestExportJob(input: CreatePredictorBacktestExportJobInput, completion: @escaping (ClientRuntime.SdkResult<CreatePredictorBacktestExportJobOutputResponse, CreatePredictorBacktestExportJobOutputError>) -> Void)
```

``` 
        <ExportJobName>_<ExportTimestamp>_<PartNumber>.csv

    The <ExportTimestamp> component is in Java SimpleDate format
        (yyyy-MM-ddTHH-mm-ssZ).
    You must specify a DataDestination object that includes an Amazon S3
        bucket and an AWS Identity and Access Management (IAM) role that Amazon Forecast can assume to access the Amazon S3
        bucket. For more information, see aws-forecast-iam-roles.

        The Status of the export job must be ACTIVE before
            you can access the export in your Amazon S3 bucket. To get the status, use the DescribePredictorBacktestExportJob operation.
```

### `deleteDataset(input:completion:)`

Deletes an Amazon Forecast dataset that was created using the CreateDataset
operation. You can only delete datasets that have a status of ACTIVE or
CREATE\_FAILED. To get the status use the DescribeDataset
operation.

``` swift
public func deleteDataset(input: DeleteDatasetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDatasetOutputResponse, DeleteDatasetOutputError>) -> Void)
```

``` 
        Forecast does not automatically update any dataset groups that contain the deleted dataset.
    In order to update the dataset group, use the
    operation, omitting the deleted dataset's ARN.
```

### `deleteDatasetGroup(input:completion:)`

Deletes a dataset group created using the CreateDatasetGroup operation.
You can only delete dataset groups that have a status of ACTIVE,
CREATE\_FAILED, or UPDATE\_FAILED. To get the status, use the DescribeDatasetGroup operation.
This operation deletes only the dataset group, not the datasets in the group.

``` swift
public func deleteDatasetGroup(input: DeleteDatasetGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDatasetGroupOutputResponse, DeleteDatasetGroupOutputError>) -> Void)
```

### `deleteDatasetImportJob(input:completion:)`

Deletes a dataset import job created using the CreateDatasetImportJob
operation. You can delete only dataset import jobs that have a status of ACTIVE
or CREATE\_FAILED. To get the status, use the DescribeDatasetImportJob operation.

``` swift
public func deleteDatasetImportJob(input: DeleteDatasetImportJobInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDatasetImportJobOutputResponse, DeleteDatasetImportJobOutputError>) -> Void)
```

### `deleteForecast(input:completion:)`

Deletes a forecast created using the CreateForecast operation. You can
delete only forecasts that have a status of ACTIVE or CREATE\_FAILED.
To get the status, use the DescribeForecast operation.
You can't delete a forecast while it is being exported. After a forecast is deleted, you
can no longer query the forecast.

``` swift
public func deleteForecast(input: DeleteForecastInput, completion: @escaping (ClientRuntime.SdkResult<DeleteForecastOutputResponse, DeleteForecastOutputError>) -> Void)
```

### `deleteForecastExportJob(input:completion:)`

Deletes a forecast export job created using the CreateForecastExportJob
operation. You can delete only export jobs that have a status of ACTIVE or
CREATE\_FAILED. To get the status, use the DescribeForecastExportJob operation.

``` swift
public func deleteForecastExportJob(input: DeleteForecastExportJobInput, completion: @escaping (ClientRuntime.SdkResult<DeleteForecastExportJobOutputResponse, DeleteForecastExportJobOutputError>) -> Void)
```

### `deletePredictor(input:completion:)`

Deletes a predictor created using the CreatePredictor operation. You can
delete only predictor that have a status of ACTIVE or CREATE\_FAILED.
To get the status, use the DescribePredictor operation.

``` swift
public func deletePredictor(input: DeletePredictorInput, completion: @escaping (ClientRuntime.SdkResult<DeletePredictorOutputResponse, DeletePredictorOutputError>) -> Void)
```

### `deletePredictorBacktestExportJob(input:completion:)`

Deletes a predictor backtest export job.

``` swift
public func deletePredictorBacktestExportJob(input: DeletePredictorBacktestExportJobInput, completion: @escaping (ClientRuntime.SdkResult<DeletePredictorBacktestExportJobOutputResponse, DeletePredictorBacktestExportJobOutputError>) -> Void)
```

### `deleteResourceTree(input:completion:)`

Deletes an entire resource tree. This operation will delete the parent resource and
its child resources.
Child resources are resources that were created from another resource. For example,
when a forecast is generated from a predictor, the forecast is the child resource and
the predictor is the parent resource.
Amazon Forecast resources possess the following parent-child resource hierarchies:​

``` swift
public func deleteResourceTree(input: DeleteResourceTreeInput, completion: @escaping (ClientRuntime.SdkResult<DeleteResourceTreeOutputResponse, DeleteResourceTreeOutputError>) -> Void)
```

``` 
              Dataset: dataset import jobs



              Dataset Group: predictors, predictor backtest
                export jobs, forecasts, forecast export jobs



              Predictor: predictor backtest export jobs,
                forecasts, forecast export jobs



              Forecast: forecast export jobs




           DeleteResourceTree will only delete Amazon Forecast resources, and will not
            delete datasets or exported files stored in Amazon S3.
```

### `describeDataset(input:completion:)`

Describes an Amazon Forecast dataset created using the CreateDataset
operation.
In addition to listing the parameters specified in the CreateDataset request,
this operation includes the following dataset properties:​

``` swift
public func describeDataset(input: DescribeDatasetInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDatasetOutputResponse, DescribeDatasetOutputError>) -> Void)
```

``` 
              CreationTime




              LastModificationTime




              Status
```

### `describeDatasetGroup(input:completion:)`

Describes a dataset group created using the CreateDatasetGroup
operation.
In addition to listing the parameters provided in the CreateDatasetGroup
request, this operation includes the following properties:​

``` swift
public func describeDatasetGroup(input: DescribeDatasetGroupInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDatasetGroupOutputResponse, DescribeDatasetGroupOutputError>) -> Void)
```

``` 
              DatasetArns - The datasets belonging to the group.



              CreationTime




              LastModificationTime




              Status
```

### `describeDatasetImportJob(input:completion:)`

Describes a dataset import job created using the CreateDatasetImportJob
operation.
In addition to listing the parameters provided in the CreateDatasetImportJob
request, this operation includes the following properties:​

``` swift
public func describeDatasetImportJob(input: DescribeDatasetImportJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDatasetImportJobOutputResponse, DescribeDatasetImportJobOutputError>) -> Void)
```

``` 
              CreationTime




              LastModificationTime




              DataSize




              FieldStatistics




              Status




              Message - If an error occurred, information about the error.
```

### `describeForecast(input:completion:)`

Describes a forecast created using the CreateForecast operation.
In addition to listing the properties provided in the CreateForecast request,
this operation lists the following properties:​

``` swift
public func describeForecast(input: DescribeForecastInput, completion: @escaping (ClientRuntime.SdkResult<DescribeForecastOutputResponse, DescribeForecastOutputError>) -> Void)
```

``` 
              DatasetGroupArn - The dataset group that provided the training
      data.



              CreationTime




              LastModificationTime




              Status




              Message - If an error occurred, information about the error.
```

### `describeForecastExportJob(input:completion:)`

Describes a forecast export job created using the CreateForecastExportJob operation.
In addition to listing the properties provided by the user in the
CreateForecastExportJob request, this operation lists the following
properties:​

``` swift
public func describeForecastExportJob(input: DescribeForecastExportJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeForecastExportJobOutputResponse, DescribeForecastExportJobOutputError>) -> Void)
```

``` 
              CreationTime




              LastModificationTime




              Status




              Message - If an error occurred, information about the error.
```

### `describePredictor(input:completion:)`

Describes a predictor created using the CreatePredictor
operation.
In addition to listing the properties provided in the CreatePredictor
request, this operation lists the following properties:​

``` swift
public func describePredictor(input: DescribePredictorInput, completion: @escaping (ClientRuntime.SdkResult<DescribePredictorOutputResponse, DescribePredictorOutputError>) -> Void)
```

``` 
              DatasetImportJobArns - The dataset import jobs used to import training
      data.



              AutoMLAlgorithmArns - If AutoML is performed, the algorithms that were
      evaluated.



              CreationTime




              LastModificationTime




              Status




              Message - If an error occurred, information about the error.
```

### `describePredictorBacktestExportJob(input:completion:)`

Describes a predictor backtest export job created using the CreatePredictorBacktestExportJob operation.
In addition to listing the properties provided by the user in the
CreatePredictorBacktestExportJob request, this operation lists the
following properties:​

``` swift
public func describePredictorBacktestExportJob(input: DescribePredictorBacktestExportJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribePredictorBacktestExportJobOutputResponse, DescribePredictorBacktestExportJobOutputError>) -> Void)
```

``` 
                CreationTime




                LastModificationTime




                Status




              Message (if an error occurred)
```

### `getAccuracyMetrics(input:completion:)`

Provides metrics on the accuracy of the models that were trained by the CreatePredictor operation. Use metrics to see how well the model performed and
to decide whether to use the predictor to generate a forecast. For more information, see
<a href="https:​//docs.aws.amazon.com/forecast/latest/dg/metrics.html">Predictor
Metrics.
This operation generates metrics for each backtest window that was evaluated. The number
of backtest windows (NumberOfBacktestWindows) is specified using the EvaluationParameters object, which is optionally included in the
CreatePredictor request. If NumberOfBacktestWindows isn't
specified, the number defaults to one.
The parameters of the filling method determine which items contribute to the
metrics. If you want all items to contribute, specify zero. If you want only
those items that have complete data in the range being evaluated to contribute, specify
nan. For more information, see FeaturizationMethod.

``` swift
public func getAccuracyMetrics(input: GetAccuracyMetricsInput, completion: @escaping (ClientRuntime.SdkResult<GetAccuracyMetricsOutputResponse, GetAccuracyMetricsOutputError>) -> Void)
```

``` 
        Before you can get accuracy metrics, the Status of the predictor must be
      ACTIVE, signifying that training has completed. To get the status, use the
      DescribePredictor operation.
```

### `listDatasetGroups(input:completion:)`

Returns a list of dataset groups created using the CreateDatasetGroup
operation. For each dataset group, this operation returns a summary of its properties,
including its Amazon Resource Name (ARN). You can retrieve the complete set of properties by
using the dataset group ARN with the DescribeDatasetGroup operation.

``` swift
public func listDatasetGroups(input: ListDatasetGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListDatasetGroupsOutputResponse, ListDatasetGroupsOutputError>) -> Void)
```

### `listDatasetImportJobs(input:completion:)`

Returns a list of dataset import jobs created using the CreateDatasetImportJob operation. For each import job, this operation returns a
summary of its properties, including its Amazon Resource Name (ARN). You can retrieve the
complete set of properties by using the ARN with the DescribeDatasetImportJob operation. You can filter the list by providing an array of Filter
objects.

``` swift
public func listDatasetImportJobs(input: ListDatasetImportJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListDatasetImportJobsOutputResponse, ListDatasetImportJobsOutputError>) -> Void)
```

### `listDatasets(input:completion:)`

Returns a list of datasets created using the CreateDataset operation.
For each dataset, a summary of its properties, including its Amazon Resource Name (ARN), is
returned. To retrieve the complete set of properties, use the ARN with the DescribeDataset operation.

``` swift
public func listDatasets(input: ListDatasetsInput, completion: @escaping (ClientRuntime.SdkResult<ListDatasetsOutputResponse, ListDatasetsOutputError>) -> Void)
```

### `listForecastExportJobs(input:completion:)`

Returns a list of forecast export jobs created using the CreateForecastExportJob operation. For each forecast export job, this operation
returns a summary of its properties, including its Amazon Resource Name (ARN). To retrieve the
complete set of properties, use the ARN with the DescribeForecastExportJob
operation. You can filter the list using an array of Filter objects.

``` swift
public func listForecastExportJobs(input: ListForecastExportJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListForecastExportJobsOutputResponse, ListForecastExportJobsOutputError>) -> Void)
```

### `listForecasts(input:completion:)`

Returns a list of forecasts created using the CreateForecast operation.
For each forecast, this operation returns a summary of its properties, including its Amazon
Resource Name (ARN). To retrieve the complete set of properties, specify the ARN with the
DescribeForecast operation. You can filter the list using an array of
Filter objects.

``` swift
public func listForecasts(input: ListForecastsInput, completion: @escaping (ClientRuntime.SdkResult<ListForecastsOutputResponse, ListForecastsOutputError>) -> Void)
```

### `listPredictorBacktestExportJobs(input:completion:)`

Returns a list of predictor backtest export jobs created using the CreatePredictorBacktestExportJob operation. This operation returns a summary
for each backtest export job. You can filter the list using an array of Filter objects.
To retrieve the complete set of properties for a particular backtest export job, use the
ARN with the DescribePredictorBacktestExportJob operation.

``` swift
public func listPredictorBacktestExportJobs(input: ListPredictorBacktestExportJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListPredictorBacktestExportJobsOutputResponse, ListPredictorBacktestExportJobsOutputError>) -> Void)
```

### `listPredictors(input:completion:)`

Returns a list of predictors created using the CreatePredictor
operation. For each predictor, this operation returns a summary of its properties, including
its Amazon Resource Name (ARN). You can retrieve the complete set of properties by using the
ARN with the DescribePredictor operation. You can filter the list using an
array of Filter objects.

``` swift
public func listPredictors(input: ListPredictorsInput, completion: @escaping (ClientRuntime.SdkResult<ListPredictorsOutputResponse, ListPredictorsOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Lists the tags for an Amazon Forecast resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `stopResource(input:completion:)`

Stops a resource.
The resource undergoes the following states:​
CREATE\_STOPPING and CREATE\_STOPPED. You cannot resume
a resource once it has been stopped.
This operation can be applied to the following resources (and their corresponding child
resources):​

``` swift
public func stopResource(input: StopResourceInput, completion: @escaping (ClientRuntime.SdkResult<StopResourceOutputResponse, StopResourceOutputError>) -> Void)
```

``` 
           Dataset Import Job


           Predictor Job


           Forecast Job


           Forecast Export Job


           Predictor Backtest Export Job
```

### `tagResource(input:completion:)`

Associates the specified tags to a resource with the specified resourceArn. If existing tags on a resource are not specified in the request parameters, they are not changed. When a resource is deleted, the tags associated with that resource are also deleted.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Deletes the specified tags from a resource.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateDatasetGroup(input:completion:)`

Replaces the datasets in a dataset group with the specified datasets.

``` swift
public func updateDatasetGroup(input: UpdateDatasetGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDatasetGroupOutputResponse, UpdateDatasetGroupOutputError>) -> Void)
```

``` 
        The Status of the dataset group must be ACTIVE before you can
    use the dataset group to create a predictor. Use the DescribeDatasetGroup
    operation to get the status.
```
