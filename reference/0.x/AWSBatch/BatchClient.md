# BatchClient

``` swift
public class BatchClient 
```

## Inheritance

[`BatchClientProtocol`](/aws-sdk-swift/reference/0.x/AWSBatch/BatchClientProtocol)

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
public static let clientName = "BatchClient"
```

## Methods

### `cancelJob(input:completion:)`

Cancels a job in an Batch job queue. Jobs that are in the SUBMITTED, PENDING, or RUNNABLE state are canceled. Jobs that have progressed to STARTING or RUNNING aren't canceled, but the API operation still succeeds, even if no job is canceled. These jobs must be terminated with the \[TerminateJob\] operation.

``` swift
public func cancelJob(input: CancelJobInput, completion: @escaping (ClientRuntime.SdkResult<CancelJobOutputResponse, CancelJobOutputError>) -> Void)
```

### `createComputeEnvironment(input:completion:)`

Creates an Batch compute environment. You can create MANAGED or UNMANAGED compute environments. MANAGED compute environments can use Amazon EC2 or Fargate resources. UNMANAGED compute environments can only use EC2 resources. In a managed compute environment, Batch manages the capacity and instance types of the compute resources within the environment. This is based on the compute resource specification that you define or the [launch template](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-launch-templates.html) that you specify when you create the compute environment. Either, you can choose to use EC2 On-Demand Instances and EC2 Spot Instances. Or, you can use Fargate and Fargate Spot capacity in your managed compute environment. You can optionally set a maximum price so that Spot Instances only launch when the Spot Instance price is less than a specified percentage of the On-Demand price. Multi-node parallel jobs aren't supported on Spot Instances. In an unmanaged compute environment, you can manage your own EC2 compute resources and have a lot of flexibility with how you configure your compute resources. For example, you can use custom AMIs. However, you must verify that each of your AMIs meet the Amazon ECS container instance AMI specification. For more information, see [container instance AMIs](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/container_instance_AMIs.html) in the Amazon Elastic Container Service Developer Guide. After you created your unmanaged compute environment, you can use the \[DescribeComputeEnvironments\] operation to find the Amazon ECS cluster that's associated with it. Then, launch your container instances into that Amazon ECS cluster. For more information, see [Launching an Amazon ECS container instance](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_container_instance.html) in the Amazon Elastic Container Service Developer Guide. Batch doesn't upgrade the AMIs in a compute environment after the environment is created. For example, it doesn't update the AMIs when a newer version of the Amazon ECS optimized AMI is available. Therefore, you're responsible for managing the guest operating system (including its updates and security patches) and any additional application software or utilities that you install on the compute resources. To use a new AMI for your Batch jobs, complete these steps:

``` swift
public func createComputeEnvironment(input: CreateComputeEnvironmentInput, completion: @escaping (ClientRuntime.SdkResult<CreateComputeEnvironmentOutputResponse, CreateComputeEnvironmentOutputError>) -> Void)
```

  - Create a new compute environment with the new AMI.

  - Add the compute environment to an existing job queue.

  - Remove the earlier compute environment from your job queue.

  - Delete the earlier compute environment.

### `createJobQueue(input:completion:)`

Creates an Batch job queue. When you create a job queue, you associate one or more compute environments to the queue and assign an order of preference for the compute environments. You also set a priority to the job queue that determines the order that the Batch scheduler places jobs onto its associated compute environments. For example, if a compute environment is associated with more than one job queue, the job queue with a higher priority is given preference for scheduling jobs to that compute environment.

``` swift
public func createJobQueue(input: CreateJobQueueInput, completion: @escaping (ClientRuntime.SdkResult<CreateJobQueueOutputResponse, CreateJobQueueOutputError>) -> Void)
```

### `deleteComputeEnvironment(input:completion:)`

Deletes an Batch compute environment. Before you can delete a compute environment, you must set its state to DISABLED with the \[UpdateComputeEnvironment\] API operation and disassociate it from any job queues with the \[UpdateJobQueue\] API operation. Compute environments that use Fargate resources must terminate all active jobs on that compute environment before deleting the compute environment. If this isn't done, the compute environment enters an invalid state.

``` swift
public func deleteComputeEnvironment(input: DeleteComputeEnvironmentInput, completion: @escaping (ClientRuntime.SdkResult<DeleteComputeEnvironmentOutputResponse, DeleteComputeEnvironmentOutputError>) -> Void)
```

### `deleteJobQueue(input:completion:)`

Deletes the specified job queue. You must first disable submissions for a queue with the \[UpdateJobQueue\] operation. All jobs in the queue are eventually terminated when you delete a job queue. The jobs are terminated at a rate of about 16 jobs each second. It's not necessary to disassociate compute environments from a queue before submitting a DeleteJobQueue request.

``` swift
public func deleteJobQueue(input: DeleteJobQueueInput, completion: @escaping (ClientRuntime.SdkResult<DeleteJobQueueOutputResponse, DeleteJobQueueOutputError>) -> Void)
```

### `deregisterJobDefinition(input:completion:)`

Deregisters an Batch job definition. Job definitions are permanently deleted after 180 days.

``` swift
public func deregisterJobDefinition(input: DeregisterJobDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<DeregisterJobDefinitionOutputResponse, DeregisterJobDefinitionOutputError>) -> Void)
```

### `describeComputeEnvironments(input:completion:)`

Describes one or more of your compute environments. If you're using an unmanaged compute environment, you can use the DescribeComputeEnvironment operation to determine the ecsClusterArn that you should launch your Amazon ECS container instances into.

``` swift
public func describeComputeEnvironments(input: DescribeComputeEnvironmentsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeComputeEnvironmentsOutputResponse, DescribeComputeEnvironmentsOutputError>) -> Void)
```

### `describeJobDefinitions(input:completion:)`

Describes a list of job definitions. You can specify a status (such as ACTIVE) to only return job definitions that match that status.

``` swift
public func describeJobDefinitions(input: DescribeJobDefinitionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeJobDefinitionsOutputResponse, DescribeJobDefinitionsOutputError>) -> Void)
```

### `describeJobQueues(input:completion:)`

Describes one or more of your job queues.

``` swift
public func describeJobQueues(input: DescribeJobQueuesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeJobQueuesOutputResponse, DescribeJobQueuesOutputError>) -> Void)
```

### `describeJobs(input:completion:)`

Describes a list of Batch jobs.

``` swift
public func describeJobs(input: DescribeJobsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeJobsOutputResponse, DescribeJobsOutputError>) -> Void)
```

### `listJobs(input:completion:)`

Returns a list of Batch jobs. You must specify only one of the following items:

``` swift
public func listJobs(input: ListJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListJobsOutputResponse, ListJobsOutputError>) -> Void)
```

  - A job queue ID to return a list of jobs in that job queue

  - A multi-node parallel job ID to return a list of nodes for that job

  - An array job ID to return a list of the children for that job

You can filter the results by job status with the jobStatus parameter. If you don't specify a status, only RUNNING jobs are returned.

### `listTagsForResource(input:completion:)`

Lists the tags for an Batch resource. Batch resources that support tags are compute environments, jobs, job definitions, and job queues. ARNs for child jobs of array and multi-node parallel (MNP) jobs are not supported.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `registerJobDefinition(input:completion:)`

Registers an Batch job definition.

``` swift
public func registerJobDefinition(input: RegisterJobDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<RegisterJobDefinitionOutputResponse, RegisterJobDefinitionOutputError>) -> Void)
```

### `submitJob(input:completion:)`

Submits an Batch job from a job definition. Parameters that are specified during \[SubmitJob\] override parameters defined in the job definition. vCPU and memory requirements that are specified in the ResourceRequirements objects in the job definition are the exception. They can't be overridden this way using the memory and vcpus parameters. Rather, you must specify updates to job definition parameters in a ResourceRequirements object that's included in the containerOverrides parameter. Jobs that run on Fargate resources can't be guaranteed to run for more than 14 days. This is because, after 14 days, Fargate resources might become unavailable and job might be terminated.

``` swift
public func submitJob(input: SubmitJobInput, completion: @escaping (ClientRuntime.SdkResult<SubmitJobOutputResponse, SubmitJobOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Associates the specified tags to a resource with the specified resourceArn. If existing tags on a resource aren't specified in the request parameters, they aren't changed. When a resource is deleted, the tags that are associated with that resource are deleted as well. Batch resources that support tags are compute environments, jobs, job definitions, and job queues. ARNs for child jobs of array and multi-node parallel (MNP) jobs are not supported.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `terminateJob(input:completion:)`

Terminates a job in a job queue. Jobs that are in the STARTING or RUNNING state are terminated, which causes them to transition to FAILED. Jobs that have not progressed to the STARTING state are cancelled.

``` swift
public func terminateJob(input: TerminateJobInput, completion: @escaping (ClientRuntime.SdkResult<TerminateJobOutputResponse, TerminateJobOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Deletes specified tags from an Batch resource.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateComputeEnvironment(input:completion:)`

Updates an Batch compute environment.

``` swift
public func updateComputeEnvironment(input: UpdateComputeEnvironmentInput, completion: @escaping (ClientRuntime.SdkResult<UpdateComputeEnvironmentOutputResponse, UpdateComputeEnvironmentOutputError>) -> Void)
```

### `updateJobQueue(input:completion:)`

Updates a job queue.

``` swift
public func updateJobQueue(input: UpdateJobQueueInput, completion: @escaping (ClientRuntime.SdkResult<UpdateJobQueueOutputResponse, UpdateJobQueueOutputError>) -> Void)
```
