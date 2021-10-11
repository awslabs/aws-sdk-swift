# CodeDeployClientProtocol

<fullname>AWS CodeDeploy</fullname>
AWS CodeDeploy is a deployment service that automates application deployments to
Amazon EC2 instances, on-premises instances running in your own facility, serverless AWS
Lambda functions, or applications in an Amazon ECS service.
You can deploy a nearly unlimited variety of application content, such as an updated
Lambda function, updated applications in an Amazon ECS service, code, web and
configuration files, executables, packages, scripts, multimedia files, and so on. AWS
CodeDeploy can deploy application content stored in Amazon S3 buckets, GitHub
repositories, or Bitbucket repositories. You do not need to make changes to your
existing code before you can use AWS CodeDeploy.
AWS CodeDeploy makes it easier for you to rapidly release new features, helps you
avoid downtime during application deployment, and handles the complexity of updating
your applications, without many of the risks associated with error-prone manual
deployments.

``` swift
public protocol CodeDeployClientProtocol 
```

``` 
        AWS CodeDeploy Components

    Use the information in this guide to help you work with the following AWS CodeDeploy
        components:



                Application: A name that uniquely identifies
                the application you want to deploy. AWS CodeDeploy uses this name, which
                functions as a container, to ensure the correct combination of revision,
                deployment configuration, and deployment group are referenced during a
                deployment.



                Deployment group: A set of individual
                instances, CodeDeploy Lambda deployment configuration settings, or an Amazon ECS
                service and network details. A Lambda deployment group specifies how to route
                traffic to a new version of a Lambda function. An Amazon ECS deployment group
                specifies the service created in Amazon ECS to deploy, a load balancer, and a
                listener to reroute production traffic to an updated containerized application.
                An EC2/On-premises deployment group contains individually tagged instances,
                Amazon EC2 instances in Amazon EC2 Auto Scaling groups, or both. All deployment
                groups can specify optional trigger, alarm, and rollback settings.



                Deployment configuration: A set of deployment
                rules and deployment success and failure conditions used by AWS CodeDeploy
                during a deployment.



                Deployment: The process and the components used
                when updating a Lambda function, a containerized application in an Amazon ECS
                service, or of installing content on one or more instances.



                Application revisions: For an AWS Lambda
                deployment, this is an AppSpec file that specifies the Lambda function to be
                updated and one or more functions to validate deployment lifecycle events. For
                an Amazon ECS deployment, this is an AppSpec file that specifies the Amazon ECS
                task definition, container, and port where production traffic is rerouted. For
                an EC2/On-premises deployment, this is an archive file that contains source
                content—source code, webpages, executable files, and deployment scripts—along
                with an AppSpec file. Revisions are stored in Amazon S3 buckets or GitHub
                repositories. For Amazon S3, a revision is uniquely identified by its Amazon S3
                object key and its ETag, version, or both. For GitHub, a revision is uniquely
                identified by its commit ID.


    This guide also contains information to help you get details about the instances in
        your deployments, to make on-premises instances available for AWS CodeDeploy
        deployments, to get details about a Lambda function deployment, and to get details about
        Amazon ECS service deployments.

        AWS CodeDeploy Information Resources




              <a href="https://docs.aws.amazon.com/codedeploy/latest/userguide">AWS CodeDeploy
                    User Guide




              <a href="https://docs.aws.amazon.com/codedeploy/latest/APIReference/">AWS
                    CodeDeploy API Reference Guide




              <a href="https://docs.aws.amazon.com/cli/latest/reference/deploy/index.html">AWS
                    CLI Reference for AWS CodeDeploy




                <a href="https://forums.aws.amazon.com/forum.jspa?forumID=179">AWS CodeDeploy
                    Developer Forum
```

## Requirements

### addTagsToOnPremisesInstances(input:​completion:​)

Adds tags to on-premises instances.

``` swift
func addTagsToOnPremisesInstances(input: AddTagsToOnPremisesInstancesInput, completion: @escaping (ClientRuntime.SdkResult<AddTagsToOnPremisesInstancesOutputResponse, AddTagsToOnPremisesInstancesOutputError>) -> Void)
```

### batchGetApplicationRevisions(input:​completion:​)

Gets information about one or more application revisions. The maximum number of
application revisions that can be returned is 25.

``` swift
func batchGetApplicationRevisions(input: BatchGetApplicationRevisionsInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetApplicationRevisionsOutputResponse, BatchGetApplicationRevisionsOutputError>) -> Void)
```

### batchGetApplications(input:​completion:​)

Gets information about one or more applications. The maximum number of applications
that can be returned is 100.

``` swift
func batchGetApplications(input: BatchGetApplicationsInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetApplicationsOutputResponse, BatchGetApplicationsOutputError>) -> Void)
```

### batchGetDeploymentGroups(input:​completion:​)

Gets information about one or more deployment groups.

``` swift
func batchGetDeploymentGroups(input: BatchGetDeploymentGroupsInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetDeploymentGroupsOutputResponse, BatchGetDeploymentGroupsOutputError>) -> Void)
```

### batchGetDeploymentInstances(input:​completion:​)

Returns an array of one or more instances associated with a deployment. This method
works with EC2/On-premises and AWS Lambda compute platforms. The newer
BatchGetDeploymentTargets works with all compute platforms. The maximum
number of instances that can be returned is 25.

``` swift
@available(*, deprecated, message: "This operation is deprecated, use BatchGetDeploymentTargets instead.")
    func batchGetDeploymentInstances(input: BatchGetDeploymentInstancesInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetDeploymentInstancesOutputResponse, BatchGetDeploymentInstancesOutputError>) -> Void)
```

``` 
This method works, but is deprecated. Use BatchGetDeploymentTargets
   instead.
```

### batchGetDeployments(input:​completion:​)

Gets information about one or more deployments. The maximum number of deployments that
can be returned is 25.

``` swift
func batchGetDeployments(input: BatchGetDeploymentsInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetDeploymentsOutputResponse, BatchGetDeploymentsOutputError>) -> Void)
```

### batchGetDeploymentTargets(input:​completion:​)

Returns an array of one or more targets associated with a deployment. This method
works with all compute types and should be used instead of the deprecated
BatchGetDeploymentInstances. The maximum number of targets that can be
returned is 25.
The type of targets returned depends on the deployment's compute platform or
deployment method:​

``` swift
func batchGetDeploymentTargets(input: BatchGetDeploymentTargetsInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetDeploymentTargetsOutputResponse, BatchGetDeploymentTargetsOutputError>) -> Void)
```

``` 
               EC2/On-premises: Information about EC2 instance
               targets.



               AWS Lambda: Information about Lambda functions
               targets.



               Amazon ECS: Information about Amazon ECS
               service targets.



             CloudFormation: Information about targets of
               blue/green deployments initiated by a CloudFormation stack update.
```

### batchGetOnPremisesInstances(input:​completion:​)

Gets information about one or more on-premises instances. The maximum number of
on-premises instances that can be returned is 25.

``` swift
func batchGetOnPremisesInstances(input: BatchGetOnPremisesInstancesInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetOnPremisesInstancesOutputResponse, BatchGetOnPremisesInstancesOutputError>) -> Void)
```

### continueDeployment(input:​completion:​)

For a blue/green deployment, starts the process of rerouting traffic from instances in
the original environment to instances in the replacement environment without waiting for
a specified wait time to elapse. (Traffic rerouting, which is achieved by registering
instances in the replacement environment with the load balancer, can start as soon as
all instances have a status of Ready.)

``` swift
func continueDeployment(input: ContinueDeploymentInput, completion: @escaping (ClientRuntime.SdkResult<ContinueDeploymentOutputResponse, ContinueDeploymentOutputError>) -> Void)
```

### createApplication(input:​completion:​)

Creates an application.

``` swift
func createApplication(input: CreateApplicationInput, completion: @escaping (ClientRuntime.SdkResult<CreateApplicationOutputResponse, CreateApplicationOutputError>) -> Void)
```

### createDeployment(input:​completion:​)

Deploys an application revision through the specified deployment group.

``` swift
func createDeployment(input: CreateDeploymentInput, completion: @escaping (ClientRuntime.SdkResult<CreateDeploymentOutputResponse, CreateDeploymentOutputError>) -> Void)
```

### createDeploymentConfig(input:​completion:​)

Creates a deployment configuration.

``` swift
func createDeploymentConfig(input: CreateDeploymentConfigInput, completion: @escaping (ClientRuntime.SdkResult<CreateDeploymentConfigOutputResponse, CreateDeploymentConfigOutputError>) -> Void)
```

### createDeploymentGroup(input:​completion:​)

Creates a deployment group to which application revisions are deployed.

``` swift
func createDeploymentGroup(input: CreateDeploymentGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateDeploymentGroupOutputResponse, CreateDeploymentGroupOutputError>) -> Void)
```

### deleteApplication(input:​completion:​)

Deletes an application.

``` swift
func deleteApplication(input: DeleteApplicationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteApplicationOutputResponse, DeleteApplicationOutputError>) -> Void)
```

### deleteDeploymentConfig(input:​completion:​)

Deletes a deployment configuration.

``` swift
func deleteDeploymentConfig(input: DeleteDeploymentConfigInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDeploymentConfigOutputResponse, DeleteDeploymentConfigOutputError>) -> Void)
```

``` 
        A deployment configuration cannot be deleted if it is currently in use. Predefined
            configurations cannot be deleted.
```

### deleteDeploymentGroup(input:​completion:​)

Deletes a deployment group.

``` swift
func deleteDeploymentGroup(input: DeleteDeploymentGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDeploymentGroupOutputResponse, DeleteDeploymentGroupOutputError>) -> Void)
```

### deleteGitHubAccountToken(input:​completion:​)

Deletes a GitHub account connection.

``` swift
func deleteGitHubAccountToken(input: DeleteGitHubAccountTokenInput, completion: @escaping (ClientRuntime.SdkResult<DeleteGitHubAccountTokenOutputResponse, DeleteGitHubAccountTokenOutputError>) -> Void)
```

### deleteResourcesByExternalId(input:​completion:​)

Deletes resources linked to an external ID.

``` swift
func deleteResourcesByExternalId(input: DeleteResourcesByExternalIdInput, completion: @escaping (ClientRuntime.SdkResult<DeleteResourcesByExternalIdOutputResponse, DeleteResourcesByExternalIdOutputError>) -> Void)
```

### deregisterOnPremisesInstance(input:​completion:​)

Deregisters an on-premises instance.

``` swift
func deregisterOnPremisesInstance(input: DeregisterOnPremisesInstanceInput, completion: @escaping (ClientRuntime.SdkResult<DeregisterOnPremisesInstanceOutputResponse, DeregisterOnPremisesInstanceOutputError>) -> Void)
```

### getApplication(input:​completion:​)

Gets information about an application.

``` swift
func getApplication(input: GetApplicationInput, completion: @escaping (ClientRuntime.SdkResult<GetApplicationOutputResponse, GetApplicationOutputError>) -> Void)
```

### getApplicationRevision(input:​completion:​)

Gets information about an application revision.

``` swift
func getApplicationRevision(input: GetApplicationRevisionInput, completion: @escaping (ClientRuntime.SdkResult<GetApplicationRevisionOutputResponse, GetApplicationRevisionOutputError>) -> Void)
```

### getDeployment(input:​completion:​)

Gets information about a deployment.

``` swift
func getDeployment(input: GetDeploymentInput, completion: @escaping (ClientRuntime.SdkResult<GetDeploymentOutputResponse, GetDeploymentOutputError>) -> Void)
```

``` 
         The content property of the appSpecContent object in
            the returned revision is always null. Use GetApplicationRevision and
            the sha256 property of the returned appSpecContent object
            to get the content of the deployment’s AppSpec file.
```

### getDeploymentConfig(input:​completion:​)

Gets information about a deployment configuration.

``` swift
func getDeploymentConfig(input: GetDeploymentConfigInput, completion: @escaping (ClientRuntime.SdkResult<GetDeploymentConfigOutputResponse, GetDeploymentConfigOutputError>) -> Void)
```

### getDeploymentGroup(input:​completion:​)

Gets information about a deployment group.

``` swift
func getDeploymentGroup(input: GetDeploymentGroupInput, completion: @escaping (ClientRuntime.SdkResult<GetDeploymentGroupOutputResponse, GetDeploymentGroupOutputError>) -> Void)
```

### getDeploymentInstance(input:​completion:​)

Gets information about an instance as part of a deployment.

``` swift
@available(*, deprecated, message: "This operation is deprecated, use GetDeploymentTarget instead.")
    func getDeploymentInstance(input: GetDeploymentInstanceInput, completion: @escaping (ClientRuntime.SdkResult<GetDeploymentInstanceOutputResponse, GetDeploymentInstanceOutputError>) -> Void)
```

### getDeploymentTarget(input:​completion:​)

Returns information about a deployment target.

``` swift
func getDeploymentTarget(input: GetDeploymentTargetInput, completion: @escaping (ClientRuntime.SdkResult<GetDeploymentTargetOutputResponse, GetDeploymentTargetOutputError>) -> Void)
```

### getOnPremisesInstance(input:​completion:​)

Gets information about an on-premises instance.

``` swift
func getOnPremisesInstance(input: GetOnPremisesInstanceInput, completion: @escaping (ClientRuntime.SdkResult<GetOnPremisesInstanceOutputResponse, GetOnPremisesInstanceOutputError>) -> Void)
```

### listApplicationRevisions(input:​completion:​)

Lists information about revisions for an application.

``` swift
func listApplicationRevisions(input: ListApplicationRevisionsInput, completion: @escaping (ClientRuntime.SdkResult<ListApplicationRevisionsOutputResponse, ListApplicationRevisionsOutputError>) -> Void)
```

### listApplications(input:​completion:​)

Lists the applications registered with the IAM user or AWS account.

``` swift
func listApplications(input: ListApplicationsInput, completion: @escaping (ClientRuntime.SdkResult<ListApplicationsOutputResponse, ListApplicationsOutputError>) -> Void)
```

### listDeploymentConfigs(input:​completion:​)

Lists the deployment configurations with the IAM user or AWS account.

``` swift
func listDeploymentConfigs(input: ListDeploymentConfigsInput, completion: @escaping (ClientRuntime.SdkResult<ListDeploymentConfigsOutputResponse, ListDeploymentConfigsOutputError>) -> Void)
```

### listDeploymentGroups(input:​completion:​)

Lists the deployment groups for an application registered with the IAM user or AWS
account.

``` swift
func listDeploymentGroups(input: ListDeploymentGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListDeploymentGroupsOutputResponse, ListDeploymentGroupsOutputError>) -> Void)
```

### listDeploymentInstances(input:​completion:​)

Lists the instance for a deployment associated with the IAM user or AWS account.

``` swift
@available(*, deprecated, message: "This operation is deprecated, use ListDeploymentTargets instead.")
    func listDeploymentInstances(input: ListDeploymentInstancesInput, completion: @escaping (ClientRuntime.SdkResult<ListDeploymentInstancesOutputResponse, ListDeploymentInstancesOutputError>) -> Void)
```

``` 
The newer BatchGetDeploymentTargets should be used instead because
   it works with all compute types. ListDeploymentInstances throws an
   exception if it is used with a compute platform other than EC2/On-premises or AWS
   Lambda.
```

### listDeployments(input:​completion:​)

Lists the deployments in a deployment group for an application registered with the IAM
user or AWS account.

``` swift
func listDeployments(input: ListDeploymentsInput, completion: @escaping (ClientRuntime.SdkResult<ListDeploymentsOutputResponse, ListDeploymentsOutputError>) -> Void)
```

### listDeploymentTargets(input:​completion:​)

Returns an array of target IDs that are associated a deployment.

``` swift
func listDeploymentTargets(input: ListDeploymentTargetsInput, completion: @escaping (ClientRuntime.SdkResult<ListDeploymentTargetsOutputResponse, ListDeploymentTargetsOutputError>) -> Void)
```

### listGitHubAccountTokenNames(input:​completion:​)

Lists the names of stored connections to GitHub accounts.

``` swift
func listGitHubAccountTokenNames(input: ListGitHubAccountTokenNamesInput, completion: @escaping (ClientRuntime.SdkResult<ListGitHubAccountTokenNamesOutputResponse, ListGitHubAccountTokenNamesOutputError>) -> Void)
```

### listOnPremisesInstances(input:​completion:​)

Gets a list of names for one or more on-premises instances.
Unless otherwise specified, both registered and deregistered on-premises instance
names are listed. To list only registered or deregistered on-premises instance names,
use the registration status parameter.

``` swift
func listOnPremisesInstances(input: ListOnPremisesInstancesInput, completion: @escaping (ClientRuntime.SdkResult<ListOnPremisesInstancesOutputResponse, ListOnPremisesInstancesOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

Returns a list of tags for the resource identified by a specified Amazon Resource
Name (ARN). Tags are used to organize and categorize your CodeDeploy resources.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### putLifecycleEventHookExecutionStatus(input:​completion:​)

Sets the result of a Lambda validation function. The function validates lifecycle
hooks during a deployment that uses the AWS Lambda or Amazon ECS compute platform. For
AWS Lambda deployments, the available lifecycle hooks are
BeforeAllowTraffic and AfterAllowTraffic. For Amazon ECS
deployments, the available lifecycle hooks are BeforeInstall,
AfterInstall, AfterAllowTestTraffic,
BeforeAllowTraffic, and AfterAllowTraffic. Lambda
validation functions return Succeeded or Failed. For more
information, see <a href="https:​//docs.aws.amazon.com/codedeploy/latest/userguide/reference-appspec-file-structure-hooks.html#appspec-hooks-lambda">AppSpec 'hooks' Section for an AWS Lambda Deployment  and <a href="https:​//docs.aws.amazon.com/codedeploy/latest/userguide/reference-appspec-file-structure-hooks.html#appspec-hooks-ecs">AppSpec 'hooks' Section for an Amazon ECS Deployment.

``` swift
func putLifecycleEventHookExecutionStatus(input: PutLifecycleEventHookExecutionStatusInput, completion: @escaping (ClientRuntime.SdkResult<PutLifecycleEventHookExecutionStatusOutputResponse, PutLifecycleEventHookExecutionStatusOutputError>) -> Void)
```

### registerApplicationRevision(input:​completion:​)

Registers with AWS CodeDeploy a revision for the specified application.

``` swift
func registerApplicationRevision(input: RegisterApplicationRevisionInput, completion: @escaping (ClientRuntime.SdkResult<RegisterApplicationRevisionOutputResponse, RegisterApplicationRevisionOutputError>) -> Void)
```

### registerOnPremisesInstance(input:​completion:​)

Registers an on-premises instance.

``` swift
func registerOnPremisesInstance(input: RegisterOnPremisesInstanceInput, completion: @escaping (ClientRuntime.SdkResult<RegisterOnPremisesInstanceOutputResponse, RegisterOnPremisesInstanceOutputError>) -> Void)
```

``` 
        Only one IAM ARN (an IAM session ARN or IAM user ARN) is supported in the request.
            You cannot use both.
```

### removeTagsFromOnPremisesInstances(input:​completion:​)

Removes one or more tags from one or more on-premises instances.

``` swift
func removeTagsFromOnPremisesInstances(input: RemoveTagsFromOnPremisesInstancesInput, completion: @escaping (ClientRuntime.SdkResult<RemoveTagsFromOnPremisesInstancesOutputResponse, RemoveTagsFromOnPremisesInstancesOutputError>) -> Void)
```

### skipWaitTimeForInstanceTermination(input:​completion:​)

In a blue/green deployment, overrides any specified wait time and starts terminating
instances immediately after the traffic routing is complete.

``` swift
@available(*, deprecated, message: "This operation is deprecated, use ContinueDeployment with DeploymentWaitType instead.")
    func skipWaitTimeForInstanceTermination(input: SkipWaitTimeForInstanceTerminationInput, completion: @escaping (ClientRuntime.SdkResult<SkipWaitTimeForInstanceTerminationOutputResponse, SkipWaitTimeForInstanceTerminationOutputError>) -> Void)
```

### stopDeployment(input:​completion:​)

Attempts to stop an ongoing deployment.

``` swift
func stopDeployment(input: StopDeploymentInput, completion: @escaping (ClientRuntime.SdkResult<StopDeploymentOutputResponse, StopDeploymentOutputError>) -> Void)
```

### tagResource(input:​completion:​)

Associates the list of tags in the input Tags parameter with the
resource identified by the ResourceArn input parameter.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:​completion:​)

Disassociates a resource from a list of tags. The resource is identified by the
ResourceArn input parameter. The tags are identified by the list of
keys in the TagKeys input parameter.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateApplication(input:​completion:​)

Changes the name of an application.

``` swift
func updateApplication(input: UpdateApplicationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateApplicationOutputResponse, UpdateApplicationOutputError>) -> Void)
```

### updateDeploymentGroup(input:​completion:​)

Changes information about a deployment group.

``` swift
func updateDeploymentGroup(input: UpdateDeploymentGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDeploymentGroupOutputResponse, UpdateDeploymentGroupOutputError>) -> Void)
```
