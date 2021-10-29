# AutoScalingClient

``` swift
public class AutoScalingClient 
```

## Inheritance

[`AutoScalingClientProtocol`](/aws-sdk-swift/reference/0.x/AWSAutoScaling/AutoScalingClientProtocol)

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
public static let clientName = "AutoScalingClient"
```

## Methods

### `attachInstances(input:completion:)`

Attaches one or more EC2 instances to the specified Auto Scaling group. When you attach instances, Amazon EC2 Auto Scaling increases the desired capacity of the group by the number of instances being attached. If the number of instances being attached plus the desired capacity of the group exceeds the maximum size of the group, the operation fails. If there is a Classic Load Balancer attached to your Auto Scaling group, the instances are also registered with the load balancer. If there are target groups attached to your Auto Scaling group, the instances are also registered with the target groups. For more information, see [Attach EC2 instances to your Auto Scaling group](https://docs.aws.amazon.com/autoscaling/ec2/userguide/attach-instance-asg.html) in the Amazon EC2 Auto Scaling User Guide.

``` swift
public func attachInstances(input: AttachInstancesInput, completion: @escaping (ClientRuntime.SdkResult<AttachInstancesOutputResponse, AttachInstancesOutputError>) -> Void)
```

### `attachLoadBalancerTargetGroups(input:completion:)`

Attaches one or more target groups to the specified Auto Scaling group. This operation is used with the following load balancer types:

``` swift
public func attachLoadBalancerTargetGroups(input: AttachLoadBalancerTargetGroupsInput, completion: @escaping (ClientRuntime.SdkResult<AttachLoadBalancerTargetGroupsOutputResponse, AttachLoadBalancerTargetGroupsOutputError>) -> Void)
```

  - Application Load Balancer - Operates at the application layer (layer 7) and supports HTTP and HTTPS.

  - Network Load Balancer - Operates at the transport layer (layer 4) and supports TCP, TLS, and UDP.

  - Gateway Load Balancer - Operates at the network layer (layer 3).

To describe the target groups for an Auto Scaling group, call the \[DescribeLoadBalancerTargetGroups\] API. To detach the target group from the Auto Scaling group, call the \[DetachLoadBalancerTargetGroups\] API. For more information, see [Elastic Load Balancing and Amazon EC2 Auto Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html) in the Amazon EC2 Auto Scaling User Guide.

### `attachLoadBalancers(input:completion:)`

To attach an Application Load Balancer, Network Load Balancer, or Gateway Load Balancer, use the \[AttachLoadBalancerTargetGroups\] API operation instead. Attaches one or more Classic Load Balancers to the specified Auto Scaling group. Amazon EC2 Auto Scaling registers the running instances with these Classic Load Balancers. To describe the load balancers for an Auto Scaling group, call the \[DescribeLoadBalancers\] API. To detach the load balancer from the Auto Scaling group, call the \[DetachLoadBalancers\] API. For more information, see [Elastic Load Balancing and Amazon EC2 Auto Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html) in the Amazon EC2 Auto Scaling User Guide.

``` swift
public func attachLoadBalancers(input: AttachLoadBalancersInput, completion: @escaping (ClientRuntime.SdkResult<AttachLoadBalancersOutputResponse, AttachLoadBalancersOutputError>) -> Void)
```

### `batchDeleteScheduledAction(input:completion:)`

Deletes one or more scheduled actions for the specified Auto Scaling group.

``` swift
public func batchDeleteScheduledAction(input: BatchDeleteScheduledActionInput, completion: @escaping (ClientRuntime.SdkResult<BatchDeleteScheduledActionOutputResponse, BatchDeleteScheduledActionOutputError>) -> Void)
```

### `batchPutScheduledUpdateGroupAction(input:completion:)`

Creates or updates one or more scheduled scaling actions for an Auto Scaling group.

``` swift
public func batchPutScheduledUpdateGroupAction(input: BatchPutScheduledUpdateGroupActionInput, completion: @escaping (ClientRuntime.SdkResult<BatchPutScheduledUpdateGroupActionOutputResponse, BatchPutScheduledUpdateGroupActionOutputError>) -> Void)
```

### `cancelInstanceRefresh(input:completion:)`

Cancels an instance refresh operation in progress. Cancellation does not roll back any replacements that have already been completed, but it prevents new replacements from being started. This operation is part of the [instance refresh feature](https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-refresh.html) in Amazon EC2 Auto Scaling, which helps you update instances in your Auto Scaling group after you make configuration changes.

``` swift
public func cancelInstanceRefresh(input: CancelInstanceRefreshInput, completion: @escaping (ClientRuntime.SdkResult<CancelInstanceRefreshOutputResponse, CancelInstanceRefreshOutputError>) -> Void)
```

### `completeLifecycleAction(input:completion:)`

Completes the lifecycle action for the specified token or instance with the specified result. This step is a part of the procedure for adding a lifecycle hook to an Auto Scaling group:

``` swift
public func completeLifecycleAction(input: CompleteLifecycleActionInput, completion: @escaping (ClientRuntime.SdkResult<CompleteLifecycleActionOutputResponse, CompleteLifecycleActionOutputError>) -> Void)
```

  - (Optional) Create a Lambda function and a rule that allows CloudWatch Events to invoke your Lambda function when Amazon EC2 Auto Scaling launches or terminates instances.

  - (Optional) Create a notification target and an IAM role. The target can be either an Amazon SQS queue or an Amazon SNS topic. The role allows Amazon EC2 Auto Scaling to publish lifecycle notifications to the target.

  - Create the lifecycle hook. Specify whether the hook is used when the instances launch or terminate.

  - If you need more time, record the lifecycle action heartbeat to keep the instance in a pending state.

  - If you finish before the timeout period ends, complete the lifecycle action.

For more information, see [Amazon EC2 Auto Scaling lifecycle hooks](https://docs.aws.amazon.com/autoscaling/ec2/userguide/lifecycle-hooks.html) in the Amazon EC2 Auto Scaling User Guide.

### `createAutoScalingGroup(input:completion:)`

We strongly recommend using a launch template when calling this operation to ensure full functionality for Amazon EC2 Auto Scaling and Amazon EC2. Creates an Auto Scaling group with the specified name and attributes. If you exceed your maximum limit of Auto Scaling groups, the call fails. To query this limit, call the \[DescribeAccountLimits\] API. For information about updating this limit, see [Amazon EC2 Auto Scaling service quotas](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-account-limits.html) in the Amazon EC2 Auto Scaling User Guide. For introductory exercises for creating an Auto Scaling group, see [Getting started with Amazon EC2 Auto Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/GettingStartedTutorial.html) and [Tutorial: Set up a scaled and load-balanced application](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-register-lbs-with-asg.html) in the Amazon EC2 Auto Scaling User Guide. For more information, see [Auto Scaling groups](https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroup.html) in the Amazon EC2 Auto Scaling User Guide. Every Auto Scaling group has three size parameters (DesiredCapacity, MaxSize, and MinSize). Usually, you set these sizes based on a specific number of instances. However, if you configure a mixed instances policy that defines weights for the instance types, you must specify these sizes with the same units that you use for weighting instances.

``` swift
public func createAutoScalingGroup(input: CreateAutoScalingGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateAutoScalingGroupOutputResponse, CreateAutoScalingGroupOutputError>) -> Void)
```

### `createLaunchConfiguration(input:completion:)`

Creates a launch configuration. If you exceed your maximum limit of launch configurations, the call fails. To query this limit, call the \[DescribeAccountLimits\] API. For information about updating this limit, see [Amazon EC2 Auto Scaling service quotas](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-account-limits.html) in the Amazon EC2 Auto Scaling User Guide. For more information, see [Launch configurations](https://docs.aws.amazon.com/autoscaling/ec2/userguide/LaunchConfiguration.html) in the Amazon EC2 Auto Scaling User Guide.

``` swift
public func createLaunchConfiguration(input: CreateLaunchConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<CreateLaunchConfigurationOutputResponse, CreateLaunchConfigurationOutputError>) -> Void)
```

### `createOrUpdateTags(input:completion:)`

Creates or updates tags for the specified Auto Scaling group. When you specify a tag with a key that already exists, the operation overwrites the previous tag definition, and you do not get an error message. For more information, see [Tagging Auto Scaling groups and instances](https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-tagging.html) in the Amazon EC2 Auto Scaling User Guide.

``` swift
public func createOrUpdateTags(input: CreateOrUpdateTagsInput, completion: @escaping (ClientRuntime.SdkResult<CreateOrUpdateTagsOutputResponse, CreateOrUpdateTagsOutputError>) -> Void)
```

### `deleteAutoScalingGroup(input:completion:)`

Deletes the specified Auto Scaling group. If the group has instances or scaling activities in progress, you must specify the option to force the deletion in order for it to succeed. If the group has policies, deleting the group deletes the policies, the underlying alarm actions, and any alarm that no longer has an associated action. To remove instances from the Auto Scaling group before deleting it, call the \[DetachInstances\] API with the list of instances and the option to decrement the desired capacity. This ensures that Amazon EC2 Auto Scaling does not launch replacement instances. To terminate all instances before deleting the Auto Scaling group, call the \[UpdateAutoScalingGroup\] API and set the minimum size and desired capacity of the Auto Scaling group to zero.

``` swift
public func deleteAutoScalingGroup(input: DeleteAutoScalingGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAutoScalingGroupOutputResponse, DeleteAutoScalingGroupOutputError>) -> Void)
```

### `deleteLaunchConfiguration(input:completion:)`

Deletes the specified launch configuration. The launch configuration must not be attached to an Auto Scaling group. When this call completes, the launch configuration is no longer available for use.

``` swift
public func deleteLaunchConfiguration(input: DeleteLaunchConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLaunchConfigurationOutputResponse, DeleteLaunchConfigurationOutputError>) -> Void)
```

### `deleteLifecycleHook(input:completion:)`

Deletes the specified lifecycle hook. If there are any outstanding lifecycle actions, they are completed first (ABANDON for launching instances, CONTINUE for terminating instances).

``` swift
public func deleteLifecycleHook(input: DeleteLifecycleHookInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLifecycleHookOutputResponse, DeleteLifecycleHookOutputError>) -> Void)
```

### `deleteNotificationConfiguration(input:completion:)`

Deletes the specified notification.

``` swift
public func deleteNotificationConfiguration(input: DeleteNotificationConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteNotificationConfigurationOutputResponse, DeleteNotificationConfigurationOutputError>) -> Void)
```

### `deletePolicy(input:completion:)`

Deletes the specified scaling policy. Deleting either a step scaling policy or a simple scaling policy deletes the underlying alarm action, but does not delete the alarm, even if it no longer has an associated action. For more information, see [Deleting a scaling policy](https://docs.aws.amazon.com/autoscaling/ec2/userguide/deleting-scaling-policy.html) in the Amazon EC2 Auto Scaling User Guide.

``` swift
public func deletePolicy(input: DeletePolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeletePolicyOutputResponse, DeletePolicyOutputError>) -> Void)
```

### `deleteScheduledAction(input:completion:)`

Deletes the specified scheduled action.

``` swift
public func deleteScheduledAction(input: DeleteScheduledActionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteScheduledActionOutputResponse, DeleteScheduledActionOutputError>) -> Void)
```

### `deleteTags(input:completion:)`

Deletes the specified tags.

``` swift
public func deleteTags(input: DeleteTagsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTagsOutputResponse, DeleteTagsOutputError>) -> Void)
```

### `deleteWarmPool(input:completion:)`

Deletes the warm pool for the specified Auto Scaling group. For more information, see [Warm pools for Amazon EC2 Auto Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-warm-pools.html) in the Amazon EC2 Auto Scaling User Guide.

``` swift
public func deleteWarmPool(input: DeleteWarmPoolInput, completion: @escaping (ClientRuntime.SdkResult<DeleteWarmPoolOutputResponse, DeleteWarmPoolOutputError>) -> Void)
```

### `describeAccountLimits(input:completion:)`

Describes the current Amazon EC2 Auto Scaling resource quotas for your account. When you establish an account, the account has initial quotas on the maximum number of Auto Scaling groups and launch configurations that you can create in a given Region. For more information, see [Amazon EC2 Auto Scaling service quotas](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-account-limits.html) in the Amazon EC2 Auto Scaling User Guide.

``` swift
public func describeAccountLimits(input: DescribeAccountLimitsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAccountLimitsOutputResponse, DescribeAccountLimitsOutputError>) -> Void)
```

### `describeAdjustmentTypes(input:completion:)`

Describes the available adjustment types for step scaling and simple scaling policies. The following adjustment types are supported:

``` swift
public func describeAdjustmentTypes(input: DescribeAdjustmentTypesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAdjustmentTypesOutputResponse, DescribeAdjustmentTypesOutputError>) -> Void)
```

  - ChangeInCapacity

  - ExactCapacity

  - PercentChangeInCapacity

### `describeAutoScalingGroups(input:completion:)`

Gets information about the Auto Scaling groups in the account and Region. This operation returns information about instances in Auto Scaling groups. To retrieve information about the instances in a warm pool, you must call the \[DescribeWarmPool\] API.

``` swift
public func describeAutoScalingGroups(input: DescribeAutoScalingGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAutoScalingGroupsOutputResponse, DescribeAutoScalingGroupsOutputError>) -> Void)
```

### `describeAutoScalingInstances(input:completion:)`

Gets information about the Auto Scaling instances in the account and Region.

``` swift
public func describeAutoScalingInstances(input: DescribeAutoScalingInstancesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAutoScalingInstancesOutputResponse, DescribeAutoScalingInstancesOutputError>) -> Void)
```

### `describeAutoScalingNotificationTypes(input:completion:)`

Describes the notification types that are supported by Amazon EC2 Auto Scaling.

``` swift
public func describeAutoScalingNotificationTypes(input: DescribeAutoScalingNotificationTypesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAutoScalingNotificationTypesOutputResponse, DescribeAutoScalingNotificationTypesOutputError>) -> Void)
```

### `describeInstanceRefreshes(input:completion:)`

Gets information about the instance refreshes for the specified Auto Scaling group. This operation is part of the [instance refresh feature](https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-refresh.html) in Amazon EC2 Auto Scaling, which helps you update instances in your Auto Scaling group after you make configuration changes. To help you determine the status of an instance refresh, this operation returns information about the instance refreshes you previously initiated, including their status, end time, the percentage of the instance refresh that is complete, and the number of instances remaining to update before the instance refresh is complete. The following are the possible statuses:

``` swift
public func describeInstanceRefreshes(input: DescribeInstanceRefreshesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeInstanceRefreshesOutputResponse, DescribeInstanceRefreshesOutputError>) -> Void)
```

  - Pending - The request was created, but the operation has not started.

  - InProgress - The operation is in progress.

  - Successful - The operation completed successfully.

  - Failed - The operation failed to complete. You can troubleshoot using the status reason and the scaling activities.

  - Cancelling - An ongoing operation is being cancelled. Cancellation does not roll back any replacements that have already been completed, but it prevents new replacements from being started.

  - Cancelled - The operation is cancelled.

### `describeLaunchConfigurations(input:completion:)`

Gets information about the launch configurations in the account and Region.

``` swift
public func describeLaunchConfigurations(input: DescribeLaunchConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLaunchConfigurationsOutputResponse, DescribeLaunchConfigurationsOutputError>) -> Void)
```

### `describeLifecycleHookTypes(input:completion:)`

Describes the available types of lifecycle hooks. The following hook types are supported:

``` swift
public func describeLifecycleHookTypes(input: DescribeLifecycleHookTypesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLifecycleHookTypesOutputResponse, DescribeLifecycleHookTypesOutputError>) -> Void)
```

  - autoscaling:EC2\_INSTANCE\_LAUNCHING

  - autoscaling:EC2\_INSTANCE\_TERMINATING

### `describeLifecycleHooks(input:completion:)`

Gets information about the lifecycle hooks for the specified Auto Scaling group.

``` swift
public func describeLifecycleHooks(input: DescribeLifecycleHooksInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLifecycleHooksOutputResponse, DescribeLifecycleHooksOutputError>) -> Void)
```

### `describeLoadBalancerTargetGroups(input:completion:)`

Gets information about the load balancer target groups for the specified Auto Scaling group. To determine the availability of registered instances, use the State element in the response. When you attach a target group to an Auto Scaling group, the initial State value is Adding. The state transitions to Added after all Auto Scaling instances are registered with the target group. If Elastic Load Balancing health checks are enabled for the Auto Scaling group, the state transitions to InService after at least one Auto Scaling instance passes the health check. When the target group is in the InService state, Amazon EC2 Auto Scaling can terminate and replace any instances that are reported as unhealthy. If no registered instances pass the health checks, the target group doesn't enter the InService state. Target groups also have an InService state if you attach them in the \[CreateAutoScalingGroup\] API call. If your target group state is InService, but it is not working properly, check the scaling activities by calling \[DescribeScalingActivities\] and take any corrective actions necessary. For help with failed health checks, see [Troubleshooting Amazon EC2 Auto Scaling: Health checks](https://docs.aws.amazon.com/autoscaling/ec2/userguide/ts-as-healthchecks.html) in the Amazon EC2 Auto Scaling User Guide. For more information, see [Elastic Load Balancing and Amazon EC2 Auto Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html) in the Amazon EC2 Auto Scaling User Guide.

``` swift
public func describeLoadBalancerTargetGroups(input: DescribeLoadBalancerTargetGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLoadBalancerTargetGroupsOutputResponse, DescribeLoadBalancerTargetGroupsOutputError>) -> Void)
```

### `describeLoadBalancers(input:completion:)`

Gets information about the load balancers for the specified Auto Scaling group. This operation describes only Classic Load Balancers. If you have Application Load Balancers, Network Load Balancers, or Gateway Load Balancers, use the \[DescribeLoadBalancerTargetGroups\] API instead. To determine the availability of registered instances, use the State element in the response. When you attach a load balancer to an Auto Scaling group, the initial State value is Adding. The state transitions to Added after all Auto Scaling instances are registered with the load balancer. If Elastic Load Balancing health checks are enabled for the Auto Scaling group, the state transitions to InService after at least one Auto Scaling instance passes the health check. When the load balancer is in the InService state, Amazon EC2 Auto Scaling can terminate and replace any instances that are reported as unhealthy. If no registered instances pass the health checks, the load balancer doesn't enter the InService state. Load balancers also have an InService state if you attach them in the \[CreateAutoScalingGroup\] API call. If your load balancer state is InService, but it is not working properly, check the scaling activities by calling \[DescribeScalingActivities\] and take any corrective actions necessary. For help with failed health checks, see [Troubleshooting Amazon EC2 Auto Scaling: Health checks](https://docs.aws.amazon.com/autoscaling/ec2/userguide/ts-as-healthchecks.html) in the Amazon EC2 Auto Scaling User Guide. For more information, see [Elastic Load Balancing and Amazon EC2 Auto Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html) in the Amazon EC2 Auto Scaling User Guide.

``` swift
public func describeLoadBalancers(input: DescribeLoadBalancersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLoadBalancersOutputResponse, DescribeLoadBalancersOutputError>) -> Void)
```

### `describeMetricCollectionTypes(input:completion:)`

Describes the available CloudWatch metrics for Amazon EC2 Auto Scaling. The GroupStandbyInstances metric is not returned by default. You must explicitly request this metric when calling the \[EnableMetricsCollection\] API.

``` swift
public func describeMetricCollectionTypes(input: DescribeMetricCollectionTypesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeMetricCollectionTypesOutputResponse, DescribeMetricCollectionTypesOutputError>) -> Void)
```

### `describeNotificationConfigurations(input:completion:)`

Gets information about the Amazon SNS notifications that are configured for one or more Auto Scaling groups.

``` swift
public func describeNotificationConfigurations(input: DescribeNotificationConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeNotificationConfigurationsOutputResponse, DescribeNotificationConfigurationsOutputError>) -> Void)
```

### `describePolicies(input:completion:)`

Gets information about the scaling policies in the account and Region.

``` swift
public func describePolicies(input: DescribePoliciesInput, completion: @escaping (ClientRuntime.SdkResult<DescribePoliciesOutputResponse, DescribePoliciesOutputError>) -> Void)
```

### `describeScalingActivities(input:completion:)`

Gets information about the scaling activities in the account and Region. When scaling events occur, you see a record of the scaling activity in the scaling activities. For more information, see [Verifying a scaling activity for an Auto Scaling group](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-verify-scaling-activity.html) in the Amazon EC2 Auto Scaling User Guide. If the scaling event succeeds, the value of the StatusCode element in the response is Successful. If an attempt to launch instances failed, the StatusCode value is Failed or Cancelled and the StatusMessage element in the response indicates the cause of the failure. For help interpreting the StatusMessage, see [Troubleshooting Amazon EC2 Auto Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/CHAP_Troubleshooting.html) in the Amazon EC2 Auto Scaling User Guide.

``` swift
public func describeScalingActivities(input: DescribeScalingActivitiesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeScalingActivitiesOutputResponse, DescribeScalingActivitiesOutputError>) -> Void)
```

### `describeScalingProcessTypes(input:completion:)`

Describes the scaling process types for use with the \[ResumeProcesses\] and \[SuspendProcesses\] APIs.

``` swift
public func describeScalingProcessTypes(input: DescribeScalingProcessTypesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeScalingProcessTypesOutputResponse, DescribeScalingProcessTypesOutputError>) -> Void)
```

### `describeScheduledActions(input:completion:)`

Gets information about the scheduled actions that haven't run or that have not reached their end time. To describe the scaling activities for scheduled actions that have already run, call the \[DescribeScalingActivities\] API.

``` swift
public func describeScheduledActions(input: DescribeScheduledActionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeScheduledActionsOutputResponse, DescribeScheduledActionsOutputError>) -> Void)
```

### `describeTags(input:completion:)`

Describes the specified tags. You can use filters to limit the results. For example, you can query for the tags for a specific Auto Scaling group. You can specify multiple values for a filter. A tag must match at least one of the specified values for it to be included in the results. You can also specify multiple filters. The result includes information for a particular tag only if it matches all the filters. If there's no match, no special message is returned. For more information, see [Tagging Auto Scaling groups and instances](https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-tagging.html) in the Amazon EC2 Auto Scaling User Guide.

``` swift
public func describeTags(input: DescribeTagsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTagsOutputResponse, DescribeTagsOutputError>) -> Void)
```

### `describeTerminationPolicyTypes(input:completion:)`

Describes the termination policies supported by Amazon EC2 Auto Scaling. For more information, see [Controlling which Auto Scaling instances terminate during scale in](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-termination.html) in the Amazon EC2 Auto Scaling User Guide.

``` swift
public func describeTerminationPolicyTypes(input: DescribeTerminationPolicyTypesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTerminationPolicyTypesOutputResponse, DescribeTerminationPolicyTypesOutputError>) -> Void)
```

### `describeWarmPool(input:completion:)`

Gets information about a warm pool and its instances. For more information, see [Warm pools for Amazon EC2 Auto Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-warm-pools.html) in the Amazon EC2 Auto Scaling User Guide.

``` swift
public func describeWarmPool(input: DescribeWarmPoolInput, completion: @escaping (ClientRuntime.SdkResult<DescribeWarmPoolOutputResponse, DescribeWarmPoolOutputError>) -> Void)
```

### `detachInstances(input:completion:)`

Removes one or more instances from the specified Auto Scaling group. After the instances are detached, you can manage them independent of the Auto Scaling group. If you do not specify the option to decrement the desired capacity, Amazon EC2 Auto Scaling launches instances to replace the ones that are detached. If there is a Classic Load Balancer attached to the Auto Scaling group, the instances are deregistered from the load balancer. If there are target groups attached to the Auto Scaling group, the instances are deregistered from the target groups. For more information, see [Detach EC2 instances from your Auto Scaling group](https://docs.aws.amazon.com/autoscaling/ec2/userguide/detach-instance-asg.html) in the Amazon EC2 Auto Scaling User Guide.

``` swift
public func detachInstances(input: DetachInstancesInput, completion: @escaping (ClientRuntime.SdkResult<DetachInstancesOutputResponse, DetachInstancesOutputError>) -> Void)
```

### `detachLoadBalancerTargetGroups(input:completion:)`

Detaches one or more target groups from the specified Auto Scaling group.

``` swift
public func detachLoadBalancerTargetGroups(input: DetachLoadBalancerTargetGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DetachLoadBalancerTargetGroupsOutputResponse, DetachLoadBalancerTargetGroupsOutputError>) -> Void)
```

### `detachLoadBalancers(input:completion:)`

Detaches one or more Classic Load Balancers from the specified Auto Scaling group. This operation detaches only Classic Load Balancers. If you have Application Load Balancers, Network Load Balancers, or Gateway Load Balancers, use the \[DetachLoadBalancerTargetGroups\] API instead. When you detach a load balancer, it enters the Removing state while deregistering the instances in the group. When all instances are deregistered, then you can no longer describe the load balancer using the \[DescribeLoadBalancers\] API call. The instances remain running.

``` swift
public func detachLoadBalancers(input: DetachLoadBalancersInput, completion: @escaping (ClientRuntime.SdkResult<DetachLoadBalancersOutputResponse, DetachLoadBalancersOutputError>) -> Void)
```

### `disableMetricsCollection(input:completion:)`

Disables group metrics for the specified Auto Scaling group.

``` swift
public func disableMetricsCollection(input: DisableMetricsCollectionInput, completion: @escaping (ClientRuntime.SdkResult<DisableMetricsCollectionOutputResponse, DisableMetricsCollectionOutputError>) -> Void)
```

### `enableMetricsCollection(input:completion:)`

Enables group metrics for the specified Auto Scaling group. For more information, see [Monitoring CloudWatch metrics for your Auto Scaling groups and instances](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-monitoring.html) in the Amazon EC2 Auto Scaling User Guide.

``` swift
public func enableMetricsCollection(input: EnableMetricsCollectionInput, completion: @escaping (ClientRuntime.SdkResult<EnableMetricsCollectionOutputResponse, EnableMetricsCollectionOutputError>) -> Void)
```

### `enterStandby(input:completion:)`

Moves the specified instances into the standby state. If you choose to decrement the desired capacity of the Auto Scaling group, the instances can enter standby as long as the desired capacity of the Auto Scaling group after the instances are placed into standby is equal to or greater than the minimum capacity of the group. If you choose not to decrement the desired capacity of the Auto Scaling group, the Auto Scaling group launches new instances to replace the instances on standby. For more information, see [Temporarily removing instances from your Auto Scaling group](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-enter-exit-standby.html) in the Amazon EC2 Auto Scaling User Guide.

``` swift
public func enterStandby(input: EnterStandbyInput, completion: @escaping (ClientRuntime.SdkResult<EnterStandbyOutputResponse, EnterStandbyOutputError>) -> Void)
```

### `executePolicy(input:completion:)`

Executes the specified policy. This can be useful for testing the design of your scaling policy.

``` swift
public func executePolicy(input: ExecutePolicyInput, completion: @escaping (ClientRuntime.SdkResult<ExecutePolicyOutputResponse, ExecutePolicyOutputError>) -> Void)
```

### `exitStandby(input:completion:)`

Moves the specified instances out of the standby state. After you put the instances back in service, the desired capacity is incremented. For more information, see [Temporarily removing instances from your Auto Scaling group](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-enter-exit-standby.html) in the Amazon EC2 Auto Scaling User Guide.

``` swift
public func exitStandby(input: ExitStandbyInput, completion: @escaping (ClientRuntime.SdkResult<ExitStandbyOutputResponse, ExitStandbyOutputError>) -> Void)
```

### `getPredictiveScalingForecast(input:completion:)`

Retrieves the forecast data for a predictive scaling policy. Load forecasts are predictions of the hourly load values using historical load data from CloudWatch and an analysis of historical trends. Capacity forecasts are represented as predicted values for the minimum capacity that is needed on an hourly basis, based on the hourly load forecast. A minimum of 24 hours of data is required to create the initial forecasts. However, having a full 14 days of historical data results in more accurate forecasts. For more information, see [Predictive scaling for Amazon EC2 Auto Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-predictive-scaling.html) in the Amazon EC2 Auto Scaling User Guide.

``` swift
public func getPredictiveScalingForecast(input: GetPredictiveScalingForecastInput, completion: @escaping (ClientRuntime.SdkResult<GetPredictiveScalingForecastOutputResponse, GetPredictiveScalingForecastOutputError>) -> Void)
```

### `putLifecycleHook(input:completion:)`

Creates or updates a lifecycle hook for the specified Auto Scaling group. A lifecycle hook tells Amazon EC2 Auto Scaling to perform an action on an instance when the instance launches (before it is put into service) or as the instance terminates (before it is fully terminated). This step is a part of the procedure for adding a lifecycle hook to an Auto Scaling group:

``` swift
public func putLifecycleHook(input: PutLifecycleHookInput, completion: @escaping (ClientRuntime.SdkResult<PutLifecycleHookOutputResponse, PutLifecycleHookOutputError>) -> Void)
```

  - (Optional) Create a Lambda function and a rule that allows CloudWatch Events to invoke your Lambda function when Amazon EC2 Auto Scaling launches or terminates instances.

  - (Optional) Create a notification target and an IAM role. The target can be either an Amazon SQS queue or an Amazon SNS topic. The role allows Amazon EC2 Auto Scaling to publish lifecycle notifications to the target.

  - Create the lifecycle hook. Specify whether the hook is used when the instances launch or terminate.

  - If you need more time, record the lifecycle action heartbeat to keep the instance in a pending state using the \[RecordLifecycleActionHeartbeat\] API call.

  - If you finish before the timeout period ends, complete the lifecycle action using the \[CompleteLifecycleAction\] API call.

For more information, see [Amazon EC2 Auto Scaling lifecycle hooks](https://docs.aws.amazon.com/autoscaling/ec2/userguide/lifecycle-hooks.html) in the Amazon EC2 Auto Scaling User Guide. If you exceed your maximum limit of lifecycle hooks, which by default is 50 per Auto Scaling group, the call fails. You can view the lifecycle hooks for an Auto Scaling group using the \[DescribeLifecycleHooks\] API call. If you are no longer using a lifecycle hook, you can delete it by calling the \[DeleteLifecycleHook\] API.

### `putNotificationConfiguration(input:completion:)`

Configures an Auto Scaling group to send notifications when specified events take place. Subscribers to the specified topic can have messages delivered to an endpoint such as a web server or an email address. This configuration overwrites any existing configuration. For more information, see [Getting Amazon SNS notifications when your Auto Scaling group scales](https://docs.aws.amazon.com/autoscaling/ec2/userguide/ASGettingNotifications.html) in the Amazon EC2 Auto Scaling User Guide. If you exceed your maximum limit of SNS topics, which is 10 per Auto Scaling group, the call fails.

``` swift
public func putNotificationConfiguration(input: PutNotificationConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<PutNotificationConfigurationOutputResponse, PutNotificationConfigurationOutputError>) -> Void)
```

### `putScalingPolicy(input:completion:)`

Creates or updates a scaling policy for an Auto Scaling group. Scaling policies are used to scale an Auto Scaling group based on configurable metrics. If no policies are defined, the dynamic scaling and predictive scaling features are not used. For more information about using dynamic scaling, see [Target tracking scaling policies](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-target-tracking.html) and [Step and simple scaling policies](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-simple-step.html) in the Amazon EC2 Auto Scaling User Guide. For more information about using predictive scaling, see [Predictive scaling for Amazon EC2 Auto Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-predictive-scaling.html) in the Amazon EC2 Auto Scaling User Guide. You can view the scaling policies for an Auto Scaling group using the \[DescribePolicies\] API call. If you are no longer using a scaling policy, you can delete it by calling the \[DeletePolicy\] API.

``` swift
public func putScalingPolicy(input: PutScalingPolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutScalingPolicyOutputResponse, PutScalingPolicyOutputError>) -> Void)
```

### `putScheduledUpdateGroupAction(input:completion:)`

Creates or updates a scheduled scaling action for an Auto Scaling group. For more information, see [Scheduled scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/schedule_time.html) in the Amazon EC2 Auto Scaling User Guide. You can view the scheduled actions for an Auto Scaling group using the \[DescribeScheduledActions\] API call. If you are no longer using a scheduled action, you can delete it by calling the \[DeleteScheduledAction\] API.

``` swift
public func putScheduledUpdateGroupAction(input: PutScheduledUpdateGroupActionInput, completion: @escaping (ClientRuntime.SdkResult<PutScheduledUpdateGroupActionOutputResponse, PutScheduledUpdateGroupActionOutputError>) -> Void)
```

### `putWarmPool(input:completion:)`

Creates or updates a warm pool for the specified Auto Scaling group. A warm pool is a pool of pre-initialized EC2 instances that sits alongside the Auto Scaling group. Whenever your application needs to scale out, the Auto Scaling group can draw on the warm pool to meet its new desired capacity. For more information and example configurations, see [Warm pools for Amazon EC2 Auto Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-warm-pools.html) in the Amazon EC2 Auto Scaling User Guide. This operation must be called from the Region in which the Auto Scaling group was created. This operation cannot be called on an Auto Scaling group that has a mixed instances policy or a launch template or launch configuration that requests Spot Instances. You can view the instances in the warm pool using the \[DescribeWarmPool\] API call. If you are no longer using a warm pool, you can delete it by calling the \[DeleteWarmPool\] API.

``` swift
public func putWarmPool(input: PutWarmPoolInput, completion: @escaping (ClientRuntime.SdkResult<PutWarmPoolOutputResponse, PutWarmPoolOutputError>) -> Void)
```

### `recordLifecycleActionHeartbeat(input:completion:)`

Records a heartbeat for the lifecycle action associated with the specified token or instance. This extends the timeout by the length of time defined using the \[PutLifecycleHook\] API call. This step is a part of the procedure for adding a lifecycle hook to an Auto Scaling group:

``` swift
public func recordLifecycleActionHeartbeat(input: RecordLifecycleActionHeartbeatInput, completion: @escaping (ClientRuntime.SdkResult<RecordLifecycleActionHeartbeatOutputResponse, RecordLifecycleActionHeartbeatOutputError>) -> Void)
```

  - (Optional) Create a Lambda function and a rule that allows CloudWatch Events to invoke your Lambda function when Amazon EC2 Auto Scaling launches or terminates instances.

  - (Optional) Create a notification target and an IAM role. The target can be either an Amazon SQS queue or an Amazon SNS topic. The role allows Amazon EC2 Auto Scaling to publish lifecycle notifications to the target.

  - Create the lifecycle hook. Specify whether the hook is used when the instances launch or terminate.

  - If you need more time, record the lifecycle action heartbeat to keep the instance in a pending state.

  - If you finish before the timeout period ends, complete the lifecycle action.

For more information, see [Amazon EC2 Auto Scaling lifecycle hooks](https://docs.aws.amazon.com/autoscaling/ec2/userguide/lifecycle-hooks.html) in the Amazon EC2 Auto Scaling User Guide.

### `resumeProcesses(input:completion:)`

Resumes the specified suspended auto scaling processes, or all suspended process, for the specified Auto Scaling group. For more information, see [Suspending and resuming scaling processes](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-suspend-resume-processes.html) in the Amazon EC2 Auto Scaling User Guide.

``` swift
public func resumeProcesses(input: ResumeProcessesInput, completion: @escaping (ClientRuntime.SdkResult<ResumeProcessesOutputResponse, ResumeProcessesOutputError>) -> Void)
```

### `setDesiredCapacity(input:completion:)`

Sets the size of the specified Auto Scaling group. If a scale-in activity occurs as a result of a new DesiredCapacity value that is lower than the current size of the group, the Auto Scaling group uses its termination policy to determine which instances to terminate. For more information, see [Manual scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-manual-scaling.html) in the Amazon EC2 Auto Scaling User Guide.

``` swift
public func setDesiredCapacity(input: SetDesiredCapacityInput, completion: @escaping (ClientRuntime.SdkResult<SetDesiredCapacityOutputResponse, SetDesiredCapacityOutputError>) -> Void)
```

### `setInstanceHealth(input:completion:)`

Sets the health status of the specified instance. For more information, see [Health checks for Auto Scaling instances](https://docs.aws.amazon.com/autoscaling/ec2/userguide/healthcheck.html) in the Amazon EC2 Auto Scaling User Guide.

``` swift
public func setInstanceHealth(input: SetInstanceHealthInput, completion: @escaping (ClientRuntime.SdkResult<SetInstanceHealthOutputResponse, SetInstanceHealthOutputError>) -> Void)
```

### `setInstanceProtection(input:completion:)`

Updates the instance protection settings of the specified instances. This operation cannot be called on instances in a warm pool. For more information about preventing instances that are part of an Auto Scaling group from terminating on scale in, see [Instance scale-in protection](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-termination.html#instance-protection) in the Amazon EC2 Auto Scaling User Guide. If you exceed your maximum limit of instance IDs, which is 50 per Auto Scaling group, the call fails.

``` swift
public func setInstanceProtection(input: SetInstanceProtectionInput, completion: @escaping (ClientRuntime.SdkResult<SetInstanceProtectionOutputResponse, SetInstanceProtectionOutputError>) -> Void)
```

### `startInstanceRefresh(input:completion:)`

Starts a new instance refresh operation. An instance refresh performs a rolling replacement of all or some instances in an Auto Scaling group. Each instance is terminated first and then replaced, which temporarily reduces the capacity available within your Auto Scaling group. This operation is part of the [instance refresh feature](https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-refresh.html) in Amazon EC2 Auto Scaling, which helps you update instances in your Auto Scaling group. This feature is helpful, for example, when you have a new AMI or a new user data script. You just need to create a new launch template that specifies the new AMI or user data script. Then start an instance refresh to immediately begin the process of updating instances in the group. If the call succeeds, it creates a new instance refresh request with a unique ID that you can use to track its progress. To query its status, call the \[DescribeInstanceRefreshes\] API. To describe the instance refreshes that have already run, call the \[DescribeInstanceRefreshes\] API. To cancel an instance refresh operation in progress, use the \[CancelInstanceRefresh\] API.

``` swift
public func startInstanceRefresh(input: StartInstanceRefreshInput, completion: @escaping (ClientRuntime.SdkResult<StartInstanceRefreshOutputResponse, StartInstanceRefreshOutputError>) -> Void)
```

### `suspendProcesses(input:completion:)`

Suspends the specified auto scaling processes, or all processes, for the specified Auto Scaling group. If you suspend either the Launch or Terminate process types, it can prevent other process types from functioning properly. For more information, see [Suspending and resuming scaling processes](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-suspend-resume-processes.html) in the Amazon EC2 Auto Scaling User Guide. To resume processes that have been suspended, call the \[ResumeProcesses\] API.

``` swift
public func suspendProcesses(input: SuspendProcessesInput, completion: @escaping (ClientRuntime.SdkResult<SuspendProcessesOutputResponse, SuspendProcessesOutputError>) -> Void)
```

### `terminateInstanceInAutoScalingGroup(input:completion:)`

Terminates the specified instance and optionally adjusts the desired group size. This operation cannot be called on instances in a warm pool. This call simply makes a termination request. The instance is not terminated immediately. When an instance is terminated, the instance status changes to terminated. You can't connect to or start an instance after you've terminated it. If you do not specify the option to decrement the desired capacity, Amazon EC2 Auto Scaling launches instances to replace the ones that are terminated. By default, Amazon EC2 Auto Scaling balances instances across all Availability Zones. If you decrement the desired capacity, your Auto Scaling group can become unbalanced between Availability Zones. Amazon EC2 Auto Scaling tries to rebalance the group, and rebalancing might terminate instances in other zones. For more information, see [Rebalancing activities](https://docs.aws.amazon.com/autoscaling/ec2/userguide/auto-scaling-benefits.html#AutoScalingBehavior.InstanceUsage) in the Amazon EC2 Auto Scaling User Guide.

``` swift
public func terminateInstanceInAutoScalingGroup(input: TerminateInstanceInAutoScalingGroupInput, completion: @escaping (ClientRuntime.SdkResult<TerminateInstanceInAutoScalingGroupOutputResponse, TerminateInstanceInAutoScalingGroupOutputError>) -> Void)
```

### `updateAutoScalingGroup(input:completion:)`

We strongly recommend that all Auto Scaling groups use launch templates to ensure full functionality for Amazon EC2 Auto Scaling and Amazon EC2. Updates the configuration for the specified Auto Scaling group. To update an Auto Scaling group, specify the name of the group and the parameter that you want to change. Any parameters that you don't specify are not changed by this update request. The new settings take effect on any scaling activities after this call returns. If you associate a new launch configuration or template with an Auto Scaling group, all new instances will get the updated configuration. Existing instances continue to run with the configuration that they were originally launched with. When you update a group to specify a mixed instances policy instead of a launch configuration or template, existing instances may be replaced to match the new purchasing options that you specified in the policy. For example, if the group currently has 100% On-Demand capacity and the policy specifies 50% Spot capacity, this means that half of your instances will be gradually terminated and relaunched as Spot Instances. When replacing instances, Amazon EC2 Auto Scaling launches new instances before terminating the old ones, so that updating your group does not compromise the performance or availability of your application. Note the following about changing DesiredCapacity, MaxSize, or MinSize:

``` swift
public func updateAutoScalingGroup(input: UpdateAutoScalingGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAutoScalingGroupOutputResponse, UpdateAutoScalingGroupOutputError>) -> Void)
```

  - If a scale-in activity occurs as a result of a new DesiredCapacity value that is lower than the current size of the group, the Auto Scaling group uses its termination policy to determine which instances to terminate.

  - If you specify a new value for MinSize without specifying a value for DesiredCapacity, and the new MinSize is larger than the current size of the group, this sets the group's DesiredCapacity to the new MinSize value.

  - If you specify a new value for MaxSize without specifying a value for DesiredCapacity, and the new MaxSize is smaller than the current size of the group, this sets the group's DesiredCapacity to the new MaxSize value.

To see which parameters have been set, call the \[DescribeAutoScalingGroups\] API. To view the scaling policies for an Auto Scaling group, call the \[DescribePolicies\] API. If the group has scaling policies, you can update them by calling the \[PutScalingPolicy\] API.
