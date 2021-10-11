# ApplicationAutoScalingClient

``` swift
public class ApplicationAutoScalingClient 
```

## Inheritance

[`ApplicationAutoScalingClientProtocol`](/aws-sdk-swift/reference/0.x/AWSApplicationAutoScaling/ApplicationAutoScalingClientProtocol)

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

### `deleteScalingPolicy(input:completion:)`

Deletes the specified scaling policy for an Application Auto Scaling scalable target.
Deleting a step scaling policy deletes the underlying alarm action, but does not delete
the CloudWatch alarm associated with the scaling policy, even if it no longer has an associated
action.
For more information, see <a href="https:​//docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html#delete-step-scaling-policy">Delete a step scaling policy and <a href="https:​//docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html#delete-target-tracking-policy">Delete a target tracking scaling policy in the
Application Auto Scaling User Guide.

``` swift
public func deleteScalingPolicy(input: DeleteScalingPolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteScalingPolicyOutputResponse, DeleteScalingPolicyOutputError>) -> Void)
```

### `deleteScheduledAction(input:completion:)`

Deletes the specified scheduled action for an Application Auto Scaling scalable target.
For more information, see <a href="https:​//docs.aws.amazon.com/autoscaling/application/userguide/scheduled-scaling-additional-cli-commands.html#delete-scheduled-action">Delete a scheduled action in the Application Auto Scaling User Guide.

``` swift
public func deleteScheduledAction(input: DeleteScheduledActionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteScheduledActionOutputResponse, DeleteScheduledActionOutputError>) -> Void)
```

### `deregisterScalableTarget(input:completion:)`

Deregisters an Application Auto Scaling scalable target when you have finished using it. To see which
resources have been registered, use <a href="https:​//docs.aws.amazon.com/autoscaling/application/APIReference/API_DescribeScalableTargets.html">DescribeScalableTargets.

``` swift
public func deregisterScalableTarget(input: DeregisterScalableTargetInput, completion: @escaping (ClientRuntime.SdkResult<DeregisterScalableTargetOutputResponse, DeregisterScalableTargetOutputError>) -> Void)
```

``` 
        Deregistering a scalable target deletes the scaling policies and the scheduled
        actions that are associated with it.
```

### `describeScalableTargets(input:completion:)`

Gets information about the scalable targets in the specified namespace.
You can filter the results using ResourceIds and
ScalableDimension.

``` swift
public func describeScalableTargets(input: DescribeScalableTargetsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeScalableTargetsOutputResponse, DescribeScalableTargetsOutputError>) -> Void)
```

### `describeScalingActivities(input:completion:)`

Provides descriptive information about the scaling activities in the specified namespace
from the previous six weeks.
You can filter the results using ResourceId and
ScalableDimension.

``` swift
public func describeScalingActivities(input: DescribeScalingActivitiesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeScalingActivitiesOutputResponse, DescribeScalingActivitiesOutputError>) -> Void)
```

### `describeScalingPolicies(input:completion:)`

Describes the Application Auto Scaling scaling policies for the specified service namespace.
You can filter the results using ResourceId,
ScalableDimension, and PolicyNames.
For more information, see <a href="https:​//docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html">Target tracking scaling policies and <a href="https:​//docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html">Step scaling policies in the Application Auto Scaling User Guide.

``` swift
public func describeScalingPolicies(input: DescribeScalingPoliciesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeScalingPoliciesOutputResponse, DescribeScalingPoliciesOutputError>) -> Void)
```

### `describeScheduledActions(input:completion:)`

Describes the Application Auto Scaling scheduled actions for the specified service namespace.
You can filter the results using the ResourceId,
ScalableDimension, and ScheduledActionNames parameters.
For more information, see <a href="https:​//docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scheduled-scaling.html">Scheduled scaling and <a href="https:​//docs.aws.amazon.com/autoscaling/application/userguide/scheduled-scaling-additional-cli-commands.html">Managing scheduled scaling in the
Application Auto Scaling User Guide.

``` swift
public func describeScheduledActions(input: DescribeScheduledActionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeScheduledActionsOutputResponse, DescribeScheduledActionsOutputError>) -> Void)
```

### `putScalingPolicy(input:completion:)`

Creates or updates a scaling policy for an Application Auto Scaling scalable target.
Each scalable target is identified by a service namespace, resource ID, and scalable
dimension. A scaling policy applies to the scalable target identified by those three
attributes. You cannot create a scaling policy until you have registered the resource as a
scalable target.
Multiple scaling policies can be in force at the same time for the same scalable target.
You can have one or more target tracking scaling policies, one or more step scaling
policies, or both. However, there is a chance that multiple policies could conflict,
instructing the scalable target to scale out or in at the same time. Application Auto Scaling gives
precedence to the policy that provides the largest capacity for both scale out and scale
in. For example, if one policy increases capacity by 3, another policy increases capacity
by 200 percent, and the current capacity is 10, Application Auto Scaling uses the policy with the highest
calculated capacity (200% of 10 = 20) and scales out to 30.
We recommend caution, however, when using target tracking scaling policies with step
scaling policies because conflicts between these policies can cause undesirable behavior.
For example, if the step scaling policy initiates a scale-in activity before the target
tracking policy is ready to scale in, the scale-in activity will not be blocked. After the
scale-in activity completes, the target tracking policy could instruct the scalable target
to scale out again.
For more information, see <a href="https:​//docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html">Target tracking scaling policies and <a href="https:​//docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html">Step scaling policies in the Application Auto Scaling User Guide.

``` swift
public func putScalingPolicy(input: PutScalingPolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutScalingPolicyOutputResponse, PutScalingPolicyOutputError>) -> Void)
```

``` 
        If a scalable target is deregistered, the scalable target is no longer available to
        execute scaling policies. Any scaling policies that were specified for the scalable
        target are deleted.
```

### `putScheduledAction(input:completion:)`

Creates or updates a scheduled action for an Application Auto Scaling scalable target.
Each scalable target is identified by a service namespace, resource ID, and scalable
dimension. A scheduled action applies to the scalable target identified by those three
attributes. You cannot create a scheduled action until you have registered the resource as
a scalable target.
When start and end times are specified with a recurring schedule using a cron expression
or rates, they form the boundaries for when the recurring action starts and stops.
To update a scheduled action, specify the parameters that you want to change. If you
don't specify start and end times, the old values are deleted.
For more information, see <a href="https:​//docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scheduled-scaling.html">Scheduled scaling in the Application Auto Scaling User Guide.

``` swift
public func putScheduledAction(input: PutScheduledActionInput, completion: @escaping (ClientRuntime.SdkResult<PutScheduledActionOutputResponse, PutScheduledActionOutputError>) -> Void)
```

``` 
        If a scalable target is deregistered, the scalable target is no longer available to
        run scheduled actions. Any scheduled actions that were specified for the scalable target
        are deleted.
```

### `registerScalableTarget(input:completion:)`

Registers or updates a scalable target.
A scalable target is a resource that Application Auto Scaling can scale out and scale in. Scalable
targets are uniquely identified by the combination of resource ID, scalable dimension, and
namespace.
When you register a new scalable target, you must specify values for minimum and maximum
capacity. Current capacity will be adjusted within the specified range when scaling starts.
Application Auto Scaling scaling policies will not scale capacity to values that are outside of this
range.
After you register a scalable target, you do not need to register it again to use other
Application Auto Scaling operations. To see which resources have been registered, use <a href="https:​//docs.aws.amazon.com/autoscaling/application/APIReference/API_DescribeScalableTargets.html">DescribeScalableTargets. You can also view the scaling policies for a service
namespace by using <a href="https:​//docs.aws.amazon.com/autoscaling/application/APIReference/API_DescribeScalableTargets.html">DescribeScalableTargets. If you no longer need a scalable target, you can
deregister it by using <a href="https:​//docs.aws.amazon.com/autoscaling/application/APIReference/API_DeregisterScalableTarget.html">DeregisterScalableTarget.
To update a scalable target, specify the parameters that you want to change. Include the
parameters that identify the scalable target:​ resource ID, scalable dimension, and
namespace. Any parameters that you don't specify are not changed by this update request.

``` swift
public func registerScalableTarget(input: RegisterScalableTargetInput, completion: @escaping (ClientRuntime.SdkResult<RegisterScalableTargetOutputResponse, RegisterScalableTargetOutputError>) -> Void)
```
