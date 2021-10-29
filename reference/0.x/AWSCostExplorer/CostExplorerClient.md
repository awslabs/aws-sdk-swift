# CostExplorerClient

``` swift
public class CostExplorerClient 
```

## Inheritance

[`CostExplorerClientProtocol`](/aws-sdk-swift/reference/0.x/AWSCostExplorer/CostExplorerClientProtocol)

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
public static let clientName = "CostExplorerClient"
```

## Methods

### `createAnomalyMonitor(input:completion:)`

Creates a new cost anomaly detection monitor with the requested type and monitor specification.

``` swift
public func createAnomalyMonitor(input: CreateAnomalyMonitorInput, completion: @escaping (ClientRuntime.SdkResult<CreateAnomalyMonitorOutputResponse, CreateAnomalyMonitorOutputError>) -> Void)
```

### `createAnomalySubscription(input:completion:)`

Adds a subscription to a cost anomaly detection monitor. You can use each subscription to define subscribers with email or SNS notifications. Email subscribers can set a dollar threshold and a time frequency for receiving notifications.

``` swift
public func createAnomalySubscription(input: CreateAnomalySubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<CreateAnomalySubscriptionOutputResponse, CreateAnomalySubscriptionOutputError>) -> Void)
```

### `createCostCategoryDefinition(input:completion:)`

Creates a new Cost Category with the requested name and rules.

``` swift
public func createCostCategoryDefinition(input: CreateCostCategoryDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<CreateCostCategoryDefinitionOutputResponse, CreateCostCategoryDefinitionOutputError>) -> Void)
```

### `deleteAnomalyMonitor(input:completion:)`

Deletes a cost anomaly monitor.

``` swift
public func deleteAnomalyMonitor(input: DeleteAnomalyMonitorInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAnomalyMonitorOutputResponse, DeleteAnomalyMonitorOutputError>) -> Void)
```

### `deleteAnomalySubscription(input:completion:)`

Deletes a cost anomaly subscription.

``` swift
public func deleteAnomalySubscription(input: DeleteAnomalySubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAnomalySubscriptionOutputResponse, DeleteAnomalySubscriptionOutputError>) -> Void)
```

### `deleteCostCategoryDefinition(input:completion:)`

Deletes a Cost Category. Expenses from this month going forward will no longer be categorized with this Cost Category.

``` swift
public func deleteCostCategoryDefinition(input: DeleteCostCategoryDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCostCategoryDefinitionOutputResponse, DeleteCostCategoryDefinitionOutputError>) -> Void)
```

### `describeCostCategoryDefinition(input:completion:)`

Returns the name, ARN, rules, definition, and effective dates of a Cost Category that's defined in the account. You have the option to use EffectiveOn to return a Cost Category that is active on a specific date. If there is no EffectiveOn specified, you’ll see a Cost Category that is effective on the current date. If Cost Category is still effective, EffectiveEnd is omitted in the response.

``` swift
public func describeCostCategoryDefinition(input: DescribeCostCategoryDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCostCategoryDefinitionOutputResponse, DescribeCostCategoryDefinitionOutputError>) -> Void)
```

### `getAnomalies(input:completion:)`

Retrieves all of the cost anomalies detected on your account during the time period that's specified by the DateInterval object.

``` swift
public func getAnomalies(input: GetAnomaliesInput, completion: @escaping (ClientRuntime.SdkResult<GetAnomaliesOutputResponse, GetAnomaliesOutputError>) -> Void)
```

### `getAnomalyMonitors(input:completion:)`

Retrieves the cost anomaly monitor definitions for your account. You can filter using a list of cost anomaly monitor Amazon Resource Names (ARNs).

``` swift
public func getAnomalyMonitors(input: GetAnomalyMonitorsInput, completion: @escaping (ClientRuntime.SdkResult<GetAnomalyMonitorsOutputResponse, GetAnomalyMonitorsOutputError>) -> Void)
```

### `getAnomalySubscriptions(input:completion:)`

Retrieves the cost anomaly subscription objects for your account. You can filter using a list of cost anomaly monitor Amazon Resource Names (ARNs).

``` swift
public func getAnomalySubscriptions(input: GetAnomalySubscriptionsInput, completion: @escaping (ClientRuntime.SdkResult<GetAnomalySubscriptionsOutputResponse, GetAnomalySubscriptionsOutputError>) -> Void)
```

### `getCostAndUsage(input:completion:)`

Retrieves cost and usage metrics for your account. You can specify which cost and usage-related metric that you want the request to return. For example, you can specify BlendedCosts or UsageQuantity. You can also filter and group your data by various dimensions, such as SERVICE or AZ, in a specific time range. For a complete list of valid dimensions, see the [GetDimensionValues](https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_GetDimensionValues.html) operation. Management account in an organization in Organizations have access to all member accounts. For information about filter limitations, see [Quotas and restrictions](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/billing-limits.html) in the Billing and Cost Management User Guide.

``` swift
public func getCostAndUsage(input: GetCostAndUsageInput, completion: @escaping (ClientRuntime.SdkResult<GetCostAndUsageOutputResponse, GetCostAndUsageOutputError>) -> Void)
```

### `getCostAndUsageWithResources(input:completion:)`

Retrieves cost and usage metrics with resources for your account. You can specify which cost and usage-related metric, such as BlendedCosts or UsageQuantity, that you want the request to return. You can also filter and group your data by various dimensions, such as SERVICE or AZ, in a specific time range. For a complete list of valid dimensions, see the [GetDimensionValues](https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_GetDimensionValues.html) operation. Management account in an organization in Organizations have access to all member accounts. This API is currently available for the Amazon Elastic Compute Cloud – Compute service only. This is an opt-in only feature. You can enable this feature from the Cost Explorer Settings page. For information on how to access the Settings page, see [Controlling Access for Cost Explorer](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/ce-access.html) in the Billing and Cost Management User Guide.

``` swift
public func getCostAndUsageWithResources(input: GetCostAndUsageWithResourcesInput, completion: @escaping (ClientRuntime.SdkResult<GetCostAndUsageWithResourcesOutputResponse, GetCostAndUsageWithResourcesOutputError>) -> Void)
```

### `getCostCategories(input:completion:)`

Retrieves an array of Cost Category names and values incurred cost. If some Cost Category names and values are not associated with any cost, they will not be returned by this API.

``` swift
public func getCostCategories(input: GetCostCategoriesInput, completion: @escaping (ClientRuntime.SdkResult<GetCostCategoriesOutputResponse, GetCostCategoriesOutputError>) -> Void)
```

### `getCostForecast(input:completion:)`

Retrieves a forecast for how much Amazon Web Services predicts that you will spend over the forecast time period that you select, based on your past costs.

``` swift
public func getCostForecast(input: GetCostForecastInput, completion: @escaping (ClientRuntime.SdkResult<GetCostForecastOutputResponse, GetCostForecastOutputError>) -> Void)
```

### `getDimensionValues(input:completion:)`

Retrieves all available filter values for a specified filter over a period of time. You can search the dimension values for an arbitrary string.

``` swift
public func getDimensionValues(input: GetDimensionValuesInput, completion: @escaping (ClientRuntime.SdkResult<GetDimensionValuesOutputResponse, GetDimensionValuesOutputError>) -> Void)
```

### `getReservationCoverage(input:completion:)`

Retrieves the reservation coverage for your account. This enables you to see how much of your Amazon Elastic Compute Cloud, Amazon ElastiCache, Amazon Relational Database Service, or Amazon Redshift usage is covered by a reservation. An organization's management account can see the coverage of the associated member accounts. This supports dimensions, Cost Categories, and nested expressions. For any time period, you can filter data about reservation usage by the following dimensions:

``` swift
public func getReservationCoverage(input: GetReservationCoverageInput, completion: @escaping (ClientRuntime.SdkResult<GetReservationCoverageOutputResponse, GetReservationCoverageOutputError>) -> Void)
```

  - AZ

  - CACHE\_ENGINE

  - DATABASE\_ENGINE

  - DEPLOYMENT\_OPTION

  - INSTANCE\_TYPE

  - LINKED\_ACCOUNT

  - OPERATING\_SYSTEM

  - PLATFORM

  - REGION

  - SERVICE

  - TAG

  - TENANCY

To determine valid values for a dimension, use the GetDimensionValues operation.

### `getReservationPurchaseRecommendation(input:completion:)`

Gets recommendations for which reservations to purchase. These recommendations could help you reduce your costs. Reservations provide a discounted hourly rate (up to 75%) compared to On-Demand pricing. Amazon Web Services generates your recommendations by identifying your On-Demand usage during a specific time period and collecting your usage into categories that are eligible for a reservation. After Amazon Web Services has these categories, it simulates every combination of reservations in each category of usage to identify the best number of each type of RI to purchase to maximize your estimated savings. For example, Amazon Web Services automatically aggregates your Amazon EC2 Linux, shared tenancy, and c4 family usage in the US West (Oregon) Region and recommends that you buy size-flexible regional reservations to apply to the c4 family usage. Amazon Web Services recommends the smallest size instance in an instance family. This makes it easier to purchase a size-flexible RI. Amazon Web Services also shows the equal number of normalized units so that you can purchase any instance size that you want. For this example, your RI recommendation would be for c4.large because that is the smallest size instance in the c4 instance family.

``` swift
public func getReservationPurchaseRecommendation(input: GetReservationPurchaseRecommendationInput, completion: @escaping (ClientRuntime.SdkResult<GetReservationPurchaseRecommendationOutputResponse, GetReservationPurchaseRecommendationOutputError>) -> Void)
```

### `getReservationUtilization(input:completion:)`

Retrieves the reservation utilization for your account. Management account in an organization have access to member accounts. You can filter data by dimensions in a time period. You can use GetDimensionValues to determine the possible dimension values. Currently, you can group only by SUBSCRIPTION\_ID.

``` swift
public func getReservationUtilization(input: GetReservationUtilizationInput, completion: @escaping (ClientRuntime.SdkResult<GetReservationUtilizationOutputResponse, GetReservationUtilizationOutputError>) -> Void)
```

### `getRightsizingRecommendation(input:completion:)`

Creates recommendations that help you save cost by identifying idle and underutilized Amazon EC2 instances. Recommendations are generated to either downsize or terminate instances, along with providing savings detail and metrics. For details on calculation and function, see [Optimizing Your Cost with Rightsizing Recommendations](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/ce-rightsizing.html) in the Billing and Cost Management User Guide.

``` swift
public func getRightsizingRecommendation(input: GetRightsizingRecommendationInput, completion: @escaping (ClientRuntime.SdkResult<GetRightsizingRecommendationOutputResponse, GetRightsizingRecommendationOutputError>) -> Void)
```

### `getSavingsPlansCoverage(input:completion:)`

Retrieves the Savings Plans covered for your account. This enables you to see how much of your cost is covered by a Savings Plan. An organization’s management account can see the coverage of the associated member accounts. This supports dimensions, Cost Categories, and nested expressions. For any time period, you can filter data for Savings Plans usage with the following dimensions:

``` swift
public func getSavingsPlansCoverage(input: GetSavingsPlansCoverageInput, completion: @escaping (ClientRuntime.SdkResult<GetSavingsPlansCoverageOutputResponse, GetSavingsPlansCoverageOutputError>) -> Void)
```

  - LINKED\_ACCOUNT

  - REGION

  - SERVICE

  - INSTANCE\_FAMILY

To determine valid values for a dimension, use the GetDimensionValues operation.

### `getSavingsPlansPurchaseRecommendation(input:completion:)`

Retrieves your request parameters, Savings Plan Recommendations Summary and Details.

``` swift
public func getSavingsPlansPurchaseRecommendation(input: GetSavingsPlansPurchaseRecommendationInput, completion: @escaping (ClientRuntime.SdkResult<GetSavingsPlansPurchaseRecommendationOutputResponse, GetSavingsPlansPurchaseRecommendationOutputError>) -> Void)
```

### `getSavingsPlansUtilization(input:completion:)`

Retrieves the Savings Plans utilization for your account across date ranges with daily or monthly granularity. Management account in an organization have access to member accounts. You can use GetDimensionValues in SAVINGS\_PLANS to determine the possible dimension values. You cannot group by any dimension values for GetSavingsPlansUtilization.

``` swift
public func getSavingsPlansUtilization(input: GetSavingsPlansUtilizationInput, completion: @escaping (ClientRuntime.SdkResult<GetSavingsPlansUtilizationOutputResponse, GetSavingsPlansUtilizationOutputError>) -> Void)
```

### `getSavingsPlansUtilizationDetails(input:completion:)`

Retrieves attribute data along with aggregate utilization and savings data for a given time period. This doesn't support granular or grouped data (daily/monthly) in response. You can't retrieve data by dates in a single response similar to GetSavingsPlanUtilization, but you have the option to make multiple calls to GetSavingsPlanUtilizationDetails by providing individual dates. You can use GetDimensionValues in SAVINGS\_PLANS to determine the possible dimension values. GetSavingsPlanUtilizationDetails internally groups data by SavingsPlansArn.

``` swift
public func getSavingsPlansUtilizationDetails(input: GetSavingsPlansUtilizationDetailsInput, completion: @escaping (ClientRuntime.SdkResult<GetSavingsPlansUtilizationDetailsOutputResponse, GetSavingsPlansUtilizationDetailsOutputError>) -> Void)
```

### `getTags(input:completion:)`

Queries for available tag keys and tag values for a specified period. You can search the tag values for an arbitrary string.

``` swift
public func getTags(input: GetTagsInput, completion: @escaping (ClientRuntime.SdkResult<GetTagsOutputResponse, GetTagsOutputError>) -> Void)
```

### `getUsageForecast(input:completion:)`

Retrieves a forecast for how much Amazon Web Services predicts that you will use over the forecast time period that you select, based on your past usage.

``` swift
public func getUsageForecast(input: GetUsageForecastInput, completion: @escaping (ClientRuntime.SdkResult<GetUsageForecastOutputResponse, GetUsageForecastOutputError>) -> Void)
```

### `listCostCategoryDefinitions(input:completion:)`

Returns the name, ARN, NumberOfRules and effective dates of all Cost Categories defined in the account. You have the option to use EffectiveOn to return a list of Cost Categories that were active on a specific date. If there is no EffectiveOn specified, you’ll see Cost Categories that are effective on the current date. If Cost Category is still effective, EffectiveEnd is omitted in the response. ListCostCategoryDefinitions supports pagination. The request can have a MaxResults range up to 100.

``` swift
public func listCostCategoryDefinitions(input: ListCostCategoryDefinitionsInput, completion: @escaping (ClientRuntime.SdkResult<ListCostCategoryDefinitionsOutputResponse, ListCostCategoryDefinitionsOutputError>) -> Void)
```

### `provideAnomalyFeedback(input:completion:)`

Modifies the feedback property of a given cost anomaly.

``` swift
public func provideAnomalyFeedback(input: ProvideAnomalyFeedbackInput, completion: @escaping (ClientRuntime.SdkResult<ProvideAnomalyFeedbackOutputResponse, ProvideAnomalyFeedbackOutputError>) -> Void)
```

### `updateAnomalyMonitor(input:completion:)`

Updates an existing cost anomaly monitor. The changes made are applied going forward, and doesn'tt change anomalies detected in the past.

``` swift
public func updateAnomalyMonitor(input: UpdateAnomalyMonitorInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAnomalyMonitorOutputResponse, UpdateAnomalyMonitorOutputError>) -> Void)
```

### `updateAnomalySubscription(input:completion:)`

Updates an existing cost anomaly monitor subscription.

``` swift
public func updateAnomalySubscription(input: UpdateAnomalySubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAnomalySubscriptionOutputResponse, UpdateAnomalySubscriptionOutputError>) -> Void)
```

### `updateCostCategoryDefinition(input:completion:)`

Updates an existing Cost Category. Changes made to the Cost Category rules will be used to categorize the current month’s expenses and future expenses. This won’t change categorization for the previous months.

``` swift
public func updateCostCategoryDefinition(input: UpdateCostCategoryDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateCostCategoryDefinitionOutputResponse, UpdateCostCategoryDefinitionOutputError>) -> Void)
```
