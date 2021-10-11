# DevOpsGuruClient

``` swift
public class DevOpsGuruClient 
```

## Inheritance

[`DevOpsGuruClientProtocol`](/aws-sdk-swift/reference/0.x/AWSDevOpsGuru/DevOpsGuruClientProtocol)

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

### `addNotificationChannel(input:completion:)`

Adds a notification channel to DevOps Guru. A notification channel is used to notify you about important DevOps Guru events, such as when an insight is generated.

``` swift
public func addNotificationChannel(input: AddNotificationChannelInput, completion: @escaping (ClientRuntime.SdkResult<AddNotificationChannelOutputResponse, AddNotificationChannelOutputError>) -> Void)
```

``` 
  If you use an Amazon SNS topic in another account, you must attach a policy to it that grants DevOps Guru permission
to it notifications. DevOps Guru adds the required policy on your behalf to send notifications using Amazon SNS in your account.
For more information, see <a href="https://docs.aws.amazon.com/devops-guru/latest/userguide/sns-required-permissions.html">Permissions
for cross account Amazon SNS topics.
     If you use an Amazon SNS topic that is encrypted by an AWS Key Management Service customer-managed key (CMK), then you must add permissions
to the CMK. For more information, see <a href="https://docs.aws.amazon.com/devops-guru/latest/userguide/sns-kms-permissions.html">Permissions for
AWS KMS–encrypted Amazon SNS topics.
```

### `describeAccountHealth(input:completion:)`

Returns the number of open reactive insights, the number of open proactive insights, and the number of metrics analyzed in your AWS account.
Use these numbers to gauge the health of operations in your AWS account.

``` swift
public func describeAccountHealth(input: DescribeAccountHealthInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAccountHealthOutputResponse, DescribeAccountHealthOutputError>) -> Void)
```

### `describeAccountOverview(input:completion:)`

For the time range passed in, returns the number of open reactive insight that were created, the number of open proactive insights
that were created, and the Mean Time to Recover (MTTR) for all closed reactive insights.

``` swift
public func describeAccountOverview(input: DescribeAccountOverviewInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAccountOverviewOutputResponse, DescribeAccountOverviewOutputError>) -> Void)
```

### `describeAnomaly(input:completion:)`

Returns details about an anomaly that you specify using its ID.

``` swift
public func describeAnomaly(input: DescribeAnomalyInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAnomalyOutputResponse, DescribeAnomalyOutputError>) -> Void)
```

### `describeFeedback(input:completion:)`

Returns the most recent feedback submitted in the current AWS account and Region.

``` swift
public func describeFeedback(input: DescribeFeedbackInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFeedbackOutputResponse, DescribeFeedbackOutputError>) -> Void)
```

### `describeInsight(input:completion:)`

Returns details about an insight that you specify using its ID.

``` swift
public func describeInsight(input: DescribeInsightInput, completion: @escaping (ClientRuntime.SdkResult<DescribeInsightOutputResponse, DescribeInsightOutputError>) -> Void)
```

### `describeResourceCollectionHealth(input:completion:)`

Returns the number of open proactive insights, open reactive insights, and the Mean Time to Recover (MTTR) for all closed insights in
resource collections in your account. You specify the type of AWS resources collection. The one type of AWS resource collection supported is AWS CloudFormation stacks. DevOps Guru can be configured to analyze
only the AWS resources that are defined in the stacks. You can specify up to 500 AWS CloudFormation stacks.

``` swift
public func describeResourceCollectionHealth(input: DescribeResourceCollectionHealthInput, completion: @escaping (ClientRuntime.SdkResult<DescribeResourceCollectionHealthOutputResponse, DescribeResourceCollectionHealthOutputError>) -> Void)
```

### `describeServiceIntegration(input:completion:)`

Returns the integration status of services that are integrated with DevOps Guru.
The one service that can be integrated with DevOps Guru
is AWS Systems Manager, which can be used to create an OpsItem for each generated insight.

``` swift
public func describeServiceIntegration(input: DescribeServiceIntegrationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeServiceIntegrationOutputResponse, DescribeServiceIntegrationOutputError>) -> Void)
```

### `getCostEstimation(input:completion:)`

Returns an estimate of the monthly cost for DevOps Guru to analyze your AWS resources.
For more information,
see <a href="https:​//docs.aws.amazon.com/devops-guru/latest/userguide/cost-estimate.html">Estimate your
Amazon DevOps Guru costs and
<a href="http:​//aws.amazon.com/devops-guru/pricing/">Amazon DevOps Guru pricing.

``` swift
public func getCostEstimation(input: GetCostEstimationInput, completion: @escaping (ClientRuntime.SdkResult<GetCostEstimationOutputResponse, GetCostEstimationOutputError>) -> Void)
```

### `getResourceCollection(input:completion:)`

Returns lists AWS resources that are of the specified resource collection type. The one type of AWS resource collection supported is AWS CloudFormation stacks. DevOps Guru can be configured to analyze
only the AWS resources that are defined in the stacks. You can specify up to 500 AWS CloudFormation stacks.

``` swift
public func getResourceCollection(input: GetResourceCollectionInput, completion: @escaping (ClientRuntime.SdkResult<GetResourceCollectionOutputResponse, GetResourceCollectionOutputError>) -> Void)
```

### `listAnomaliesForInsight(input:completion:)`

Returns a list of the anomalies that belong to an insight that you specify using its ID.

``` swift
public func listAnomaliesForInsight(input: ListAnomaliesForInsightInput, completion: @escaping (ClientRuntime.SdkResult<ListAnomaliesForInsightOutputResponse, ListAnomaliesForInsightOutputError>) -> Void)
```

### `listEvents(input:completion:)`

Returns a list of the events emitted by the resources that are evaluated by DevOps Guru. You can use filters to specify which events are returned.

``` swift
public func listEvents(input: ListEventsInput, completion: @escaping (ClientRuntime.SdkResult<ListEventsOutputResponse, ListEventsOutputError>) -> Void)
```

### `listInsights(input:completion:)`

Returns a list of insights in your AWS account. You can specify which insights are returned by their start time and
status (ONGOING, CLOSED, or ANY).

``` swift
public func listInsights(input: ListInsightsInput, completion: @escaping (ClientRuntime.SdkResult<ListInsightsOutputResponse, ListInsightsOutputError>) -> Void)
```

### `listNotificationChannels(input:completion:)`

Returns a list of notification channels configured for DevOps Guru. Each notification channel is used to notify you when
DevOps Guru generates an insight that contains information about how to improve your operations. The one
supported notification channel is Amazon Simple Notification Service (Amazon SNS).

``` swift
public func listNotificationChannels(input: ListNotificationChannelsInput, completion: @escaping (ClientRuntime.SdkResult<ListNotificationChannelsOutputResponse, ListNotificationChannelsOutputError>) -> Void)
```

### `listRecommendations(input:completion:)`

Returns a list of a specified insight's recommendations. Each recommendation includes a list of related metrics and a list of related events.

``` swift
public func listRecommendations(input: ListRecommendationsInput, completion: @escaping (ClientRuntime.SdkResult<ListRecommendationsOutputResponse, ListRecommendationsOutputError>) -> Void)
```

### `putFeedback(input:completion:)`

Collects customer feedback about the specified insight.

``` swift
public func putFeedback(input: PutFeedbackInput, completion: @escaping (ClientRuntime.SdkResult<PutFeedbackOutputResponse, PutFeedbackOutputError>) -> Void)
```

### `removeNotificationChannel(input:completion:)`

Removes a notification channel from DevOps Guru. A notification channel is used to notify you when DevOps Guru generates an insight
that contains information about how to improve your operations.

``` swift
public func removeNotificationChannel(input: RemoveNotificationChannelInput, completion: @escaping (ClientRuntime.SdkResult<RemoveNotificationChannelOutputResponse, RemoveNotificationChannelOutputError>) -> Void)
```

### `searchInsights(input:completion:)`

Returns a list of insights in your AWS account. You can specify which insights are returned by their start time, one or more statuses
(ONGOING, CLOSED, and CLOSED), one or more severities (LOW, MEDIUM,
and HIGH), and type (REACTIVE or PROACTIVE).

``` swift
public func searchInsights(input: SearchInsightsInput, completion: @escaping (ClientRuntime.SdkResult<SearchInsightsOutputResponse, SearchInsightsOutputError>) -> Void)
```

Use the Filters parameter to specify status and severity
search parameters. Use the Type parameter to specify REACTIVE or PROACTIVE in your search.

### `startCostEstimation(input:completion:)`

Starts the creation of an estimate of the monthly cost to analyze your AWS resources.

``` swift
public func startCostEstimation(input: StartCostEstimationInput, completion: @escaping (ClientRuntime.SdkResult<StartCostEstimationOutputResponse, StartCostEstimationOutputError>) -> Void)
```

### `updateResourceCollection(input:completion:)`

Updates the collection of resources that DevOps Guru analyzes.
The one type of AWS resource collection supported is AWS CloudFormation stacks. DevOps Guru can be configured to analyze
only the AWS resources that are defined in the stacks. You can specify up to 500 AWS CloudFormation stacks. This method also creates the IAM role required for you
to use DevOps Guru.

``` swift
public func updateResourceCollection(input: UpdateResourceCollectionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateResourceCollectionOutputResponse, UpdateResourceCollectionOutputError>) -> Void)
```

### `updateServiceIntegration(input:completion:)`

Enables or disables integration with a service that can be integrated with DevOps Guru. The one service that can be integrated with
DevOps Guru is AWS Systems Manager, which can be used to create an OpsItem for each generated insight.

``` swift
public func updateServiceIntegration(input: UpdateServiceIntegrationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateServiceIntegrationOutputResponse, UpdateServiceIntegrationOutputError>) -> Void)
```
