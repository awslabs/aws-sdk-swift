# LookoutMetricsClient

``` swift
public class LookoutMetricsClient 
```

## Inheritance

[`LookoutMetricsClientProtocol`](/aws-sdk-swift/reference/0.x/AWSLookoutMetrics/LookoutMetricsClientProtocol)

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
public static let clientName = "LookoutMetricsClient"
```

## Methods

### `activateAnomalyDetector(input:completion:)`

Activates an anomaly detector.

``` swift
public func activateAnomalyDetector(input: ActivateAnomalyDetectorInput, completion: @escaping (ClientRuntime.SdkResult<ActivateAnomalyDetectorOutputResponse, ActivateAnomalyDetectorOutputError>) -> Void)
```

### `backTestAnomalyDetector(input:completion:)`

Runs a backtest for anomaly detection for the specified resource.

``` swift
public func backTestAnomalyDetector(input: BackTestAnomalyDetectorInput, completion: @escaping (ClientRuntime.SdkResult<BackTestAnomalyDetectorOutputResponse, BackTestAnomalyDetectorOutputError>) -> Void)
```

### `createAlert(input:completion:)`

Creates an alert for an anomaly detector.

``` swift
public func createAlert(input: CreateAlertInput, completion: @escaping (ClientRuntime.SdkResult<CreateAlertOutputResponse, CreateAlertOutputError>) -> Void)
```

### `createAnomalyDetector(input:completion:)`

Creates an anomaly detector.

``` swift
public func createAnomalyDetector(input: CreateAnomalyDetectorInput, completion: @escaping (ClientRuntime.SdkResult<CreateAnomalyDetectorOutputResponse, CreateAnomalyDetectorOutputError>) -> Void)
```

### `createMetricSet(input:completion:)`

Creates a dataset.

``` swift
public func createMetricSet(input: CreateMetricSetInput, completion: @escaping (ClientRuntime.SdkResult<CreateMetricSetOutputResponse, CreateMetricSetOutputError>) -> Void)
```

### `deleteAlert(input:completion:)`

Deletes an alert.

``` swift
public func deleteAlert(input: DeleteAlertInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAlertOutputResponse, DeleteAlertOutputError>) -> Void)
```

### `deleteAnomalyDetector(input:completion:)`

Deletes a detector. Deleting an anomaly detector will delete all of its corresponding resources including any configured datasets and alerts.

``` swift
public func deleteAnomalyDetector(input: DeleteAnomalyDetectorInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAnomalyDetectorOutputResponse, DeleteAnomalyDetectorOutputError>) -> Void)
```

### `describeAlert(input:completion:)`

Describes an alert. Amazon Lookout for Metrics API actions are eventually consistent. If you do a read operation on a resource immediately after creating or modifying it, use retries to allow time for the write operation to complete.

``` swift
public func describeAlert(input: DescribeAlertInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAlertOutputResponse, DescribeAlertOutputError>) -> Void)
```

### `describeAnomalyDetectionExecutions(input:completion:)`

Returns information about the status of the specified anomaly detection jobs.

``` swift
public func describeAnomalyDetectionExecutions(input: DescribeAnomalyDetectionExecutionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAnomalyDetectionExecutionsOutputResponse, DescribeAnomalyDetectionExecutionsOutputError>) -> Void)
```

### `describeAnomalyDetector(input:completion:)`

Describes a detector. Amazon Lookout for Metrics API actions are eventually consistent. If you do a read operation on a resource immediately after creating or modifying it, use retries to allow time for the write operation to complete.

``` swift
public func describeAnomalyDetector(input: DescribeAnomalyDetectorInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAnomalyDetectorOutputResponse, DescribeAnomalyDetectorOutputError>) -> Void)
```

### `describeMetricSet(input:completion:)`

Describes a dataset. Amazon Lookout for Metrics API actions are eventually consistent. If you do a read operation on a resource immediately after creating or modifying it, use retries to allow time for the write operation to complete.

``` swift
public func describeMetricSet(input: DescribeMetricSetInput, completion: @escaping (ClientRuntime.SdkResult<DescribeMetricSetOutputResponse, DescribeMetricSetOutputError>) -> Void)
```

### `getAnomalyGroup(input:completion:)`

Returns details about a group of anomalous metrics.

``` swift
public func getAnomalyGroup(input: GetAnomalyGroupInput, completion: @escaping (ClientRuntime.SdkResult<GetAnomalyGroupOutputResponse, GetAnomalyGroupOutputError>) -> Void)
```

### `getFeedback(input:completion:)`

Get feedback for an anomaly group.

``` swift
public func getFeedback(input: GetFeedbackInput, completion: @escaping (ClientRuntime.SdkResult<GetFeedbackOutputResponse, GetFeedbackOutputError>) -> Void)
```

### `getSampleData(input:completion:)`

Returns a selection of sample records from an Amazon S3 datasource.

``` swift
public func getSampleData(input: GetSampleDataInput, completion: @escaping (ClientRuntime.SdkResult<GetSampleDataOutputResponse, GetSampleDataOutputError>) -> Void)
```

### `listAlerts(input:completion:)`

Lists the alerts attached to a detector. Amazon Lookout for Metrics API actions are eventually consistent. If you do a read operation on a resource immediately after creating or modifying it, use retries to allow time for the write operation to complete.

``` swift
public func listAlerts(input: ListAlertsInput, completion: @escaping (ClientRuntime.SdkResult<ListAlertsOutputResponse, ListAlertsOutputError>) -> Void)
```

### `listAnomalyDetectors(input:completion:)`

Lists the detectors in the current AWS Region. Amazon Lookout for Metrics API actions are eventually consistent. If you do a read operation on a resource immediately after creating or modifying it, use retries to allow time for the write operation to complete.

``` swift
public func listAnomalyDetectors(input: ListAnomalyDetectorsInput, completion: @escaping (ClientRuntime.SdkResult<ListAnomalyDetectorsOutputResponse, ListAnomalyDetectorsOutputError>) -> Void)
```

### `listAnomalyGroupSummaries(input:completion:)`

Returns a list of anomaly groups.

``` swift
public func listAnomalyGroupSummaries(input: ListAnomalyGroupSummariesInput, completion: @escaping (ClientRuntime.SdkResult<ListAnomalyGroupSummariesOutputResponse, ListAnomalyGroupSummariesOutputError>) -> Void)
```

### `listAnomalyGroupTimeSeries(input:completion:)`

Gets a list of anomalous metrics for a measure in an anomaly group.

``` swift
public func listAnomalyGroupTimeSeries(input: ListAnomalyGroupTimeSeriesInput, completion: @escaping (ClientRuntime.SdkResult<ListAnomalyGroupTimeSeriesOutputResponse, ListAnomalyGroupTimeSeriesOutputError>) -> Void)
```

### `listMetricSets(input:completion:)`

Lists the datasets in the current AWS Region. Amazon Lookout for Metrics API actions are eventually consistent. If you do a read operation on a resource immediately after creating or modifying it, use retries to allow time for the write operation to complete.

``` swift
public func listMetricSets(input: ListMetricSetsInput, completion: @escaping (ClientRuntime.SdkResult<ListMetricSetsOutputResponse, ListMetricSetsOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Gets a list of [tags](https://docs.aws.amazon.com/lookoutmetrics/latest/dev/detectors-tags.html) for a detector, dataset, or alert.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `putFeedback(input:completion:)`

Add feedback for an anomalous metric.

``` swift
public func putFeedback(input: PutFeedbackInput, completion: @escaping (ClientRuntime.SdkResult<PutFeedbackOutputResponse, PutFeedbackOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Adds [tags](https://docs.aws.amazon.com/lookoutmetrics/latest/dev/detectors-tags.html) to a detector, dataset, or alert.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes [tags](https://docs.aws.amazon.com/lookoutmetrics/latest/dev/detectors-tags.html) from a detector, dataset, or alert.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateAnomalyDetector(input:completion:)`

Updates a detector. After activation, you can only change a detector's ingestion delay and description.

``` swift
public func updateAnomalyDetector(input: UpdateAnomalyDetectorInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAnomalyDetectorOutputResponse, UpdateAnomalyDetectorOutputError>) -> Void)
```

### `updateMetricSet(input:completion:)`

Updates a dataset.

``` swift
public func updateMetricSet(input: UpdateMetricSetInput, completion: @escaping (ClientRuntime.SdkResult<UpdateMetricSetOutputResponse, UpdateMetricSetOutputError>) -> Void)
```
