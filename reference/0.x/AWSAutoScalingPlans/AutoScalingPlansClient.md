# AutoScalingPlansClient

``` swift
public class AutoScalingPlansClient 
```

## Inheritance

[`AutoScalingPlansClientProtocol`](/aws-sdk-swift/reference/0.x/AWSAutoScalingPlans/AutoScalingPlansClientProtocol)

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

### `createScalingPlan(input:completion:)`

Creates a scaling plan.

``` swift
public func createScalingPlan(input: CreateScalingPlanInput, completion: @escaping (ClientRuntime.SdkResult<CreateScalingPlanOutputResponse, CreateScalingPlanOutputError>) -> Void)
```

### `deleteScalingPlan(input:completion:)`

Deletes the specified scaling plan.
Deleting a scaling plan deletes the underlying ScalingInstruction for
all of the scalable resources that are covered by the plan.
If the plan has launched resources or has scaling activities in progress, you must
delete those resources separately.

``` swift
public func deleteScalingPlan(input: DeleteScalingPlanInput, completion: @escaping (ClientRuntime.SdkResult<DeleteScalingPlanOutputResponse, DeleteScalingPlanOutputError>) -> Void)
```

### `describeScalingPlanResources(input:completion:)`

Describes the scalable resources in the specified scaling plan.

``` swift
public func describeScalingPlanResources(input: DescribeScalingPlanResourcesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeScalingPlanResourcesOutputResponse, DescribeScalingPlanResourcesOutputError>) -> Void)
```

### `describeScalingPlans(input:completion:)`

Describes one or more of your scaling plans.

``` swift
public func describeScalingPlans(input: DescribeScalingPlansInput, completion: @escaping (ClientRuntime.SdkResult<DescribeScalingPlansOutputResponse, DescribeScalingPlansOutputError>) -> Void)
```

### `getScalingPlanResourceForecastData(input:completion:)`

Retrieves the forecast data for a scalable resource.
Capacity forecasts are represented as predicted values, or data points, that are
calculated using historical data points from a specified CloudWatch load metric. Data points are
available for up to 56 days.

``` swift
public func getScalingPlanResourceForecastData(input: GetScalingPlanResourceForecastDataInput, completion: @escaping (ClientRuntime.SdkResult<GetScalingPlanResourceForecastDataOutputResponse, GetScalingPlanResourceForecastDataOutputError>) -> Void)
```

### `updateScalingPlan(input:completion:)`

Updates the specified scaling plan.
You cannot update a scaling plan if it is in the process of being created, updated, or
deleted.

``` swift
public func updateScalingPlan(input: UpdateScalingPlanInput, completion: @escaping (ClientRuntime.SdkResult<UpdateScalingPlanOutputResponse, UpdateScalingPlanOutputError>) -> Void)
```
