# AutoScalingPlansClientProtocol

AWS Auto Scaling Use AWS Auto Scaling to create scaling plans for your applications to automatically scale your scalable AWS resources. API Summary You can use the AWS Auto Scaling service API to accomplish the following tasks:

``` swift
public protocol AutoScalingPlansClientProtocol 
```

  - Create and manage scaling plans

  - Define target tracking scaling policies to dynamically scale your resources based on utilization

  - Scale Amazon EC2 Auto Scaling groups using predictive scaling and dynamic scaling to scale your Amazon EC2 capacity faster

  - Set minimum and maximum capacity limits

  - Retrieve information on existing scaling plans

  - Access current forecast data and historical forecast data for up to 56 days previous

To learn more about AWS Auto Scaling, including information about granting IAM users required permissions for AWS Auto Scaling actions, see the [AWS Auto Scaling User Guide](https://docs.aws.amazon.com/autoscaling/plans/userguide/what-is-aws-auto-scaling.html).

## Requirements

### createScalingPlan(input:completion:)

Creates a scaling plan.

``` swift
func createScalingPlan(input: CreateScalingPlanInput, completion: @escaping (ClientRuntime.SdkResult<CreateScalingPlanOutputResponse, CreateScalingPlanOutputError>) -> Void)
```

### deleteScalingPlan(input:completion:)

Deletes the specified scaling plan. Deleting a scaling plan deletes the underlying \[ScalingInstruction\] for all of the scalable resources that are covered by the plan. If the plan has launched resources or has scaling activities in progress, you must delete those resources separately.

``` swift
func deleteScalingPlan(input: DeleteScalingPlanInput, completion: @escaping (ClientRuntime.SdkResult<DeleteScalingPlanOutputResponse, DeleteScalingPlanOutputError>) -> Void)
```

### describeScalingPlanResources(input:completion:)

Describes the scalable resources in the specified scaling plan.

``` swift
func describeScalingPlanResources(input: DescribeScalingPlanResourcesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeScalingPlanResourcesOutputResponse, DescribeScalingPlanResourcesOutputError>) -> Void)
```

### describeScalingPlans(input:completion:)

Describes one or more of your scaling plans.

``` swift
func describeScalingPlans(input: DescribeScalingPlansInput, completion: @escaping (ClientRuntime.SdkResult<DescribeScalingPlansOutputResponse, DescribeScalingPlansOutputError>) -> Void)
```

### getScalingPlanResourceForecastData(input:completion:)

Retrieves the forecast data for a scalable resource. Capacity forecasts are represented as predicted values, or data points, that are calculated using historical data points from a specified CloudWatch load metric. Data points are available for up to 56 days.

``` swift
func getScalingPlanResourceForecastData(input: GetScalingPlanResourceForecastDataInput, completion: @escaping (ClientRuntime.SdkResult<GetScalingPlanResourceForecastDataOutputResponse, GetScalingPlanResourceForecastDataOutputError>) -> Void)
```

### updateScalingPlan(input:completion:)

Updates the specified scaling plan. You cannot update a scaling plan if it is in the process of being created, updated, or deleted.

``` swift
func updateScalingPlan(input: UpdateScalingPlanInput, completion: @escaping (ClientRuntime.SdkResult<UpdateScalingPlanOutputResponse, UpdateScalingPlanOutputError>) -> Void)
```
