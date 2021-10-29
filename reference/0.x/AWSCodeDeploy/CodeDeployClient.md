# CodeDeployClient

``` swift
public class CodeDeployClient 
```

## Inheritance

[`CodeDeployClientProtocol`](/aws-sdk-swift/reference/0.x/AWSCodeDeploy/CodeDeployClientProtocol)

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
public static let clientName = "CodeDeployClient"
```

## Methods

### `addTagsToOnPremisesInstances(input:completion:)`

Adds tags to on-premises instances.

``` swift
public func addTagsToOnPremisesInstances(input: AddTagsToOnPremisesInstancesInput, completion: @escaping (ClientRuntime.SdkResult<AddTagsToOnPremisesInstancesOutputResponse, AddTagsToOnPremisesInstancesOutputError>) -> Void)
```

### `batchGetApplicationRevisions(input:completion:)`

Gets information about one or more application revisions. The maximum number of application revisions that can be returned is 25.

``` swift
public func batchGetApplicationRevisions(input: BatchGetApplicationRevisionsInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetApplicationRevisionsOutputResponse, BatchGetApplicationRevisionsOutputError>) -> Void)
```

### `batchGetApplications(input:completion:)`

Gets information about one or more applications. The maximum number of applications that can be returned is 100.

``` swift
public func batchGetApplications(input: BatchGetApplicationsInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetApplicationsOutputResponse, BatchGetApplicationsOutputError>) -> Void)
```

### `batchGetDeploymentGroups(input:completion:)`

Gets information about one or more deployment groups.

``` swift
public func batchGetDeploymentGroups(input: BatchGetDeploymentGroupsInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetDeploymentGroupsOutputResponse, BatchGetDeploymentGroupsOutputError>) -> Void)
```

### `batchGetDeploymentInstances(input:completion:)`

This method works, but is deprecated. Use BatchGetDeploymentTargets instead. Returns an array of one or more instances associated with a deployment. This method works with EC2/On-premises and AWS Lambda compute platforms. The newer BatchGetDeploymentTargets works with all compute platforms. The maximum number of instances that can be returned is 25.

``` swift
@available(*, deprecated, message: "This operation is deprecated, use BatchGetDeploymentTargets instead.")
    public func batchGetDeploymentInstances(input: BatchGetDeploymentInstancesInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetDeploymentInstancesOutputResponse, BatchGetDeploymentInstancesOutputError>) -> Void)
```

### `batchGetDeploymentTargets(input:completion:)`

Returns an array of one or more targets associated with a deployment. This method works with all compute types and should be used instead of the deprecated BatchGetDeploymentInstances. The maximum number of targets that can be returned is 25. The type of targets returned depends on the deployment's compute platform or deployment method:

``` swift
public func batchGetDeploymentTargets(input: BatchGetDeploymentTargetsInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetDeploymentTargetsOutputResponse, BatchGetDeploymentTargetsOutputError>) -> Void)
```

  - EC2/On-premises: Information about EC2 instance targets.

  - AWS Lambda: Information about Lambda functions targets.

  - Amazon ECS: Information about Amazon ECS service targets.

  - CloudFormation: Information about targets of blue/green deployments initiated by a CloudFormation stack update.

### `batchGetDeployments(input:completion:)`

Gets information about one or more deployments. The maximum number of deployments that can be returned is 25.

``` swift
public func batchGetDeployments(input: BatchGetDeploymentsInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetDeploymentsOutputResponse, BatchGetDeploymentsOutputError>) -> Void)
```

### `batchGetOnPremisesInstances(input:completion:)`

Gets information about one or more on-premises instances. The maximum number of on-premises instances that can be returned is 25.

``` swift
public func batchGetOnPremisesInstances(input: BatchGetOnPremisesInstancesInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetOnPremisesInstancesOutputResponse, BatchGetOnPremisesInstancesOutputError>) -> Void)
```

### `continueDeployment(input:completion:)`

For a blue/green deployment, starts the process of rerouting traffic from instances in the original environment to instances in the replacement environment without waiting for a specified wait time to elapse. (Traffic rerouting, which is achieved by registering instances in the replacement environment with the load balancer, can start as soon as all instances have a status of Ready.)

``` swift
public func continueDeployment(input: ContinueDeploymentInput, completion: @escaping (ClientRuntime.SdkResult<ContinueDeploymentOutputResponse, ContinueDeploymentOutputError>) -> Void)
```

### `createApplication(input:completion:)`

Creates an application.

``` swift
public func createApplication(input: CreateApplicationInput, completion: @escaping (ClientRuntime.SdkResult<CreateApplicationOutputResponse, CreateApplicationOutputError>) -> Void)
```

### `createDeployment(input:completion:)`

Deploys an application revision through the specified deployment group.

``` swift
public func createDeployment(input: CreateDeploymentInput, completion: @escaping (ClientRuntime.SdkResult<CreateDeploymentOutputResponse, CreateDeploymentOutputError>) -> Void)
```

### `createDeploymentConfig(input:completion:)`

Creates a deployment configuration.

``` swift
public func createDeploymentConfig(input: CreateDeploymentConfigInput, completion: @escaping (ClientRuntime.SdkResult<CreateDeploymentConfigOutputResponse, CreateDeploymentConfigOutputError>) -> Void)
```

### `createDeploymentGroup(input:completion:)`

Creates a deployment group to which application revisions are deployed.

``` swift
public func createDeploymentGroup(input: CreateDeploymentGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateDeploymentGroupOutputResponse, CreateDeploymentGroupOutputError>) -> Void)
```

### `deleteApplication(input:completion:)`

Deletes an application.

``` swift
public func deleteApplication(input: DeleteApplicationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteApplicationOutputResponse, DeleteApplicationOutputError>) -> Void)
```

### `deleteDeploymentConfig(input:completion:)`

Deletes a deployment configuration. A deployment configuration cannot be deleted if it is currently in use. Predefined configurations cannot be deleted.

``` swift
public func deleteDeploymentConfig(input: DeleteDeploymentConfigInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDeploymentConfigOutputResponse, DeleteDeploymentConfigOutputError>) -> Void)
```

### `deleteDeploymentGroup(input:completion:)`

Deletes a deployment group.

``` swift
public func deleteDeploymentGroup(input: DeleteDeploymentGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDeploymentGroupOutputResponse, DeleteDeploymentGroupOutputError>) -> Void)
```

### `deleteGitHubAccountToken(input:completion:)`

Deletes a GitHub account connection.

``` swift
public func deleteGitHubAccountToken(input: DeleteGitHubAccountTokenInput, completion: @escaping (ClientRuntime.SdkResult<DeleteGitHubAccountTokenOutputResponse, DeleteGitHubAccountTokenOutputError>) -> Void)
```

### `deleteResourcesByExternalId(input:completion:)`

Deletes resources linked to an external ID.

``` swift
public func deleteResourcesByExternalId(input: DeleteResourcesByExternalIdInput, completion: @escaping (ClientRuntime.SdkResult<DeleteResourcesByExternalIdOutputResponse, DeleteResourcesByExternalIdOutputError>) -> Void)
```

### `deregisterOnPremisesInstance(input:completion:)`

Deregisters an on-premises instance.

``` swift
public func deregisterOnPremisesInstance(input: DeregisterOnPremisesInstanceInput, completion: @escaping (ClientRuntime.SdkResult<DeregisterOnPremisesInstanceOutputResponse, DeregisterOnPremisesInstanceOutputError>) -> Void)
```

### `getApplication(input:completion:)`

Gets information about an application.

``` swift
public func getApplication(input: GetApplicationInput, completion: @escaping (ClientRuntime.SdkResult<GetApplicationOutputResponse, GetApplicationOutputError>) -> Void)
```

### `getApplicationRevision(input:completion:)`

Gets information about an application revision.

``` swift
public func getApplicationRevision(input: GetApplicationRevisionInput, completion: @escaping (ClientRuntime.SdkResult<GetApplicationRevisionOutputResponse, GetApplicationRevisionOutputError>) -> Void)
```

### `getDeployment(input:completion:)`

Gets information about a deployment. The content property of the appSpecContent object in the returned revision is always null. Use GetApplicationRevision and the sha256 property of the returned appSpecContent object to get the content of the deployment’s AppSpec file.

``` swift
public func getDeployment(input: GetDeploymentInput, completion: @escaping (ClientRuntime.SdkResult<GetDeploymentOutputResponse, GetDeploymentOutputError>) -> Void)
```

### `getDeploymentConfig(input:completion:)`

Gets information about a deployment configuration.

``` swift
public func getDeploymentConfig(input: GetDeploymentConfigInput, completion: @escaping (ClientRuntime.SdkResult<GetDeploymentConfigOutputResponse, GetDeploymentConfigOutputError>) -> Void)
```

### `getDeploymentGroup(input:completion:)`

Gets information about a deployment group.

``` swift
public func getDeploymentGroup(input: GetDeploymentGroupInput, completion: @escaping (ClientRuntime.SdkResult<GetDeploymentGroupOutputResponse, GetDeploymentGroupOutputError>) -> Void)
```

### `getDeploymentInstance(input:completion:)`

Gets information about an instance as part of a deployment.

``` swift
@available(*, deprecated, message: "This operation is deprecated, use GetDeploymentTarget instead.")
    public func getDeploymentInstance(input: GetDeploymentInstanceInput, completion: @escaping (ClientRuntime.SdkResult<GetDeploymentInstanceOutputResponse, GetDeploymentInstanceOutputError>) -> Void)
```

### `getDeploymentTarget(input:completion:)`

Returns information about a deployment target.

``` swift
public func getDeploymentTarget(input: GetDeploymentTargetInput, completion: @escaping (ClientRuntime.SdkResult<GetDeploymentTargetOutputResponse, GetDeploymentTargetOutputError>) -> Void)
```

### `getOnPremisesInstance(input:completion:)`

Gets information about an on-premises instance.

``` swift
public func getOnPremisesInstance(input: GetOnPremisesInstanceInput, completion: @escaping (ClientRuntime.SdkResult<GetOnPremisesInstanceOutputResponse, GetOnPremisesInstanceOutputError>) -> Void)
```

### `listApplicationRevisions(input:completion:)`

Lists information about revisions for an application.

``` swift
public func listApplicationRevisions(input: ListApplicationRevisionsInput, completion: @escaping (ClientRuntime.SdkResult<ListApplicationRevisionsOutputResponse, ListApplicationRevisionsOutputError>) -> Void)
```

### `listApplications(input:completion:)`

Lists the applications registered with the IAM user or AWS account.

``` swift
public func listApplications(input: ListApplicationsInput, completion: @escaping (ClientRuntime.SdkResult<ListApplicationsOutputResponse, ListApplicationsOutputError>) -> Void)
```

### `listDeploymentConfigs(input:completion:)`

Lists the deployment configurations with the IAM user or AWS account.

``` swift
public func listDeploymentConfigs(input: ListDeploymentConfigsInput, completion: @escaping (ClientRuntime.SdkResult<ListDeploymentConfigsOutputResponse, ListDeploymentConfigsOutputError>) -> Void)
```

### `listDeploymentGroups(input:completion:)`

Lists the deployment groups for an application registered with the IAM user or AWS account.

``` swift
public func listDeploymentGroups(input: ListDeploymentGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListDeploymentGroupsOutputResponse, ListDeploymentGroupsOutputError>) -> Void)
```

### `listDeploymentInstances(input:completion:)`

The newer BatchGetDeploymentTargets should be used instead because it works with all compute types. ListDeploymentInstances throws an exception if it is used with a compute platform other than EC2/On-premises or AWS Lambda. Lists the instance for a deployment associated with the IAM user or AWS account.

``` swift
@available(*, deprecated, message: "This operation is deprecated, use ListDeploymentTargets instead.")
    public func listDeploymentInstances(input: ListDeploymentInstancesInput, completion: @escaping (ClientRuntime.SdkResult<ListDeploymentInstancesOutputResponse, ListDeploymentInstancesOutputError>) -> Void)
```

### `listDeploymentTargets(input:completion:)`

Returns an array of target IDs that are associated a deployment.

``` swift
public func listDeploymentTargets(input: ListDeploymentTargetsInput, completion: @escaping (ClientRuntime.SdkResult<ListDeploymentTargetsOutputResponse, ListDeploymentTargetsOutputError>) -> Void)
```

### `listDeployments(input:completion:)`

Lists the deployments in a deployment group for an application registered with the IAM user or AWS account.

``` swift
public func listDeployments(input: ListDeploymentsInput, completion: @escaping (ClientRuntime.SdkResult<ListDeploymentsOutputResponse, ListDeploymentsOutputError>) -> Void)
```

### `listGitHubAccountTokenNames(input:completion:)`

Lists the names of stored connections to GitHub accounts.

``` swift
public func listGitHubAccountTokenNames(input: ListGitHubAccountTokenNamesInput, completion: @escaping (ClientRuntime.SdkResult<ListGitHubAccountTokenNamesOutputResponse, ListGitHubAccountTokenNamesOutputError>) -> Void)
```

### `listOnPremisesInstances(input:completion:)`

Gets a list of names for one or more on-premises instances. Unless otherwise specified, both registered and deregistered on-premises instance names are listed. To list only registered or deregistered on-premises instance names, use the registration status parameter.

``` swift
public func listOnPremisesInstances(input: ListOnPremisesInstancesInput, completion: @escaping (ClientRuntime.SdkResult<ListOnPremisesInstancesOutputResponse, ListOnPremisesInstancesOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Returns a list of tags for the resource identified by a specified Amazon Resource Name (ARN). Tags are used to organize and categorize your CodeDeploy resources.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `putLifecycleEventHookExecutionStatus(input:completion:)`

Sets the result of a Lambda validation function. The function validates lifecycle hooks during a deployment that uses the AWS Lambda or Amazon ECS compute platform. For AWS Lambda deployments, the available lifecycle hooks are BeforeAllowTraffic and AfterAllowTraffic. For Amazon ECS deployments, the available lifecycle hooks are BeforeInstall, AfterInstall, AfterAllowTestTraffic, BeforeAllowTraffic, and AfterAllowTraffic. Lambda validation functions return Succeeded or Failed. For more information, see [AppSpec 'hooks' Section for an AWS Lambda Deployment ](https://docs.aws.amazon.com/codedeploy/latest/userguide/reference-appspec-file-structure-hooks.html#appspec-hooks-lambda) and [AppSpec 'hooks' Section for an Amazon ECS Deployment](https://docs.aws.amazon.com/codedeploy/latest/userguide/reference-appspec-file-structure-hooks.html#appspec-hooks-ecs).

``` swift
public func putLifecycleEventHookExecutionStatus(input: PutLifecycleEventHookExecutionStatusInput, completion: @escaping (ClientRuntime.SdkResult<PutLifecycleEventHookExecutionStatusOutputResponse, PutLifecycleEventHookExecutionStatusOutputError>) -> Void)
```

### `registerApplicationRevision(input:completion:)`

Registers with AWS CodeDeploy a revision for the specified application.

``` swift
public func registerApplicationRevision(input: RegisterApplicationRevisionInput, completion: @escaping (ClientRuntime.SdkResult<RegisterApplicationRevisionOutputResponse, RegisterApplicationRevisionOutputError>) -> Void)
```

### `registerOnPremisesInstance(input:completion:)`

Registers an on-premises instance. Only one IAM ARN (an IAM session ARN or IAM user ARN) is supported in the request. You cannot use both.

``` swift
public func registerOnPremisesInstance(input: RegisterOnPremisesInstanceInput, completion: @escaping (ClientRuntime.SdkResult<RegisterOnPremisesInstanceOutputResponse, RegisterOnPremisesInstanceOutputError>) -> Void)
```

### `removeTagsFromOnPremisesInstances(input:completion:)`

Removes one or more tags from one or more on-premises instances.

``` swift
public func removeTagsFromOnPremisesInstances(input: RemoveTagsFromOnPremisesInstancesInput, completion: @escaping (ClientRuntime.SdkResult<RemoveTagsFromOnPremisesInstancesOutputResponse, RemoveTagsFromOnPremisesInstancesOutputError>) -> Void)
```

### `skipWaitTimeForInstanceTermination(input:completion:)`

In a blue/green deployment, overrides any specified wait time and starts terminating instances immediately after the traffic routing is complete.

``` swift
@available(*, deprecated, message: "This operation is deprecated, use ContinueDeployment with DeploymentWaitType instead.")
    public func skipWaitTimeForInstanceTermination(input: SkipWaitTimeForInstanceTerminationInput, completion: @escaping (ClientRuntime.SdkResult<SkipWaitTimeForInstanceTerminationOutputResponse, SkipWaitTimeForInstanceTerminationOutputError>) -> Void)
```

### `stopDeployment(input:completion:)`

Attempts to stop an ongoing deployment.

``` swift
public func stopDeployment(input: StopDeploymentInput, completion: @escaping (ClientRuntime.SdkResult<StopDeploymentOutputResponse, StopDeploymentOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Associates the list of tags in the input Tags parameter with the resource identified by the ResourceArn input parameter.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Disassociates a resource from a list of tags. The resource is identified by the ResourceArn input parameter. The tags are identified by the list of keys in the TagKeys input parameter.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateApplication(input:completion:)`

Changes the name of an application.

``` swift
public func updateApplication(input: UpdateApplicationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateApplicationOutputResponse, UpdateApplicationOutputError>) -> Void)
```

### `updateDeploymentGroup(input:completion:)`

Changes information about a deployment group.

``` swift
public func updateDeploymentGroup(input: UpdateDeploymentGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDeploymentGroupOutputResponse, UpdateDeploymentGroupOutputError>) -> Void)
```
