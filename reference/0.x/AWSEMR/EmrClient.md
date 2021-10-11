# EmrClient

``` swift
public class EmrClient 
```

## Inheritance

[`EmrClientProtocol`](/aws-sdk-swift/reference/0.x/AWSEMR/EmrClientProtocol)

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

### `addInstanceFleet(input:completion:)`

Adds an instance fleet to a running cluster.

``` swift
public func addInstanceFleet(input: AddInstanceFleetInput, completion: @escaping (ClientRuntime.SdkResult<AddInstanceFleetOutputResponse, AddInstanceFleetOutputError>) -> Void)
```

``` 
        The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and
        later, excluding 5.0.x.
```

### `addInstanceGroups(input:completion:)`

Adds one or more instance groups to a running cluster.

``` swift
public func addInstanceGroups(input: AddInstanceGroupsInput, completion: @escaping (ClientRuntime.SdkResult<AddInstanceGroupsOutputResponse, AddInstanceGroupsOutputError>) -> Void)
```

### `addJobFlowSteps(input:completion:)`

AddJobFlowSteps adds new steps to a running cluster. A maximum of 256 steps are allowed
in each job flow.
If your cluster is long-running (such as a Hive data warehouse) or complex, you may
require more than 256 steps to process your data. You can bypass the 256-step limitation in
various ways, including using SSH to connect to the master node and submitting queries
directly to the software running on the master node, such as Hive and Hadoop. For more
information on how to do this, see <a href="https:​//docs.aws.amazon.com/emr/latest/ManagementGuide/AddMoreThan256Steps.html">Add More than 256 Steps to a
Cluster in the Amazon EMR Management Guide.
A step specifies the location of a JAR file stored either on the master node of the
cluster or in Amazon S3. Each step is performed by the main function of the main class of
the JAR file. The main class can be specified either in the manifest of the JAR or by using
the MainFunction parameter of the step.
Amazon EMR executes each step in the order listed. For a step to be considered complete,
the main function must exit with a zero exit code and all Hadoop jobs started while the
step was running must have completed and run successfully.
You can only add steps to a cluster that is in one of the following states:​ STARTING,
BOOTSTRAPPING, RUNNING, or WAITING.

``` swift
public func addJobFlowSteps(input: AddJobFlowStepsInput, completion: @escaping (ClientRuntime.SdkResult<AddJobFlowStepsOutputResponse, AddJobFlowStepsOutputError>) -> Void)
```

### `addTags(input:completion:)`

Adds tags to an Amazon EMR resource, such as a cluster or an Amazon EMR Studio. Tags make it easier to associate resources in
various ways, such as grouping clusters to track your Amazon EMR resource allocation costs.
For more information, see <a href="https:​//docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html">Tag Clusters.

``` swift
public func addTags(input: AddTagsInput, completion: @escaping (ClientRuntime.SdkResult<AddTagsOutputResponse, AddTagsOutputError>) -> Void)
```

### `cancelSteps(input:completion:)`

Cancels a pending step or steps in a running cluster. Available only in Amazon EMR
versions 4.8.0 and later, excluding version 5.0.0. A maximum of 256 steps are allowed in
each CancelSteps request. CancelSteps is idempotent but asynchronous; it does not guarantee
that a step will be canceled, even if the request is successfully submitted. When you use Amazon EMR versions 5.28.0 and later, you can cancel steps that are in a PENDING or RUNNING state. In earlier versions of Amazon EMR, you can only cancel steps that are in a PENDING state.

``` swift
public func cancelSteps(input: CancelStepsInput, completion: @escaping (ClientRuntime.SdkResult<CancelStepsOutputResponse, CancelStepsOutputError>) -> Void)
```

### `createSecurityConfiguration(input:completion:)`

Creates a security configuration, which is stored in the service and can be specified
when a cluster is created.

``` swift
public func createSecurityConfiguration(input: CreateSecurityConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<CreateSecurityConfigurationOutputResponse, CreateSecurityConfigurationOutputError>) -> Void)
```

### `createStudio(input:completion:)`

Creates a new Amazon EMR Studio.

``` swift
public func createStudio(input: CreateStudioInput, completion: @escaping (ClientRuntime.SdkResult<CreateStudioOutputResponse, CreateStudioOutputError>) -> Void)
```

### `createStudioSessionMapping(input:completion:)`

Maps a user or group to the Amazon EMR Studio specified by StudioId, and
applies a session policy to refine Studio permissions for that user or group. Use CreateStudioSessionMapping to assign users to a Studio when you use Amazon Web Services SSO authentication. For instructions on how to assign users to a Studio when you use IAM authentication, see <a href="https:​//docs.aws.amazon.com/emr/latest/ManagementGuide/emr-studio-manage-users.html#emr-studio-assign-users-groups">Assign a user or group to your EMR Studio.

``` swift
public func createStudioSessionMapping(input: CreateStudioSessionMappingInput, completion: @escaping (ClientRuntime.SdkResult<CreateStudioSessionMappingOutputResponse, CreateStudioSessionMappingOutputError>) -> Void)
```

### `deleteSecurityConfiguration(input:completion:)`

Deletes a security configuration.

``` swift
public func deleteSecurityConfiguration(input: DeleteSecurityConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSecurityConfigurationOutputResponse, DeleteSecurityConfigurationOutputError>) -> Void)
```

### `deleteStudio(input:completion:)`

Removes an Amazon EMR Studio from the Studio metadata store.

``` swift
public func deleteStudio(input: DeleteStudioInput, completion: @escaping (ClientRuntime.SdkResult<DeleteStudioOutputResponse, DeleteStudioOutputError>) -> Void)
```

### `deleteStudioSessionMapping(input:completion:)`

Removes a user or group from an Amazon EMR Studio.

``` swift
public func deleteStudioSessionMapping(input: DeleteStudioSessionMappingInput, completion: @escaping (ClientRuntime.SdkResult<DeleteStudioSessionMappingOutputResponse, DeleteStudioSessionMappingOutputError>) -> Void)
```

### `describeCluster(input:completion:)`

Provides cluster-level details including status, hardware and software configuration,
VPC settings, and so on.

``` swift
public func describeCluster(input: DescribeClusterInput, completion: @escaping (ClientRuntime.SdkResult<DescribeClusterOutputResponse, DescribeClusterOutputError>) -> Void)
```

### `describeJobFlows(input:completion:)`

This API is no longer supported and will eventually be removed. We recommend you use
ListClusters, DescribeCluster, ListSteps, ListInstanceGroups and ListBootstrapActions instead.
DescribeJobFlows returns a list of job flows that match all of the supplied parameters.
The parameters can include a list of job flow IDs, job flow states, and restrictions on job
flow creation date and time.
Regardless of supplied parameters, only job flows created within the last two months are
returned.
If no parameters are supplied, then job flows matching either of the following criteria
are returned:​

``` swift
@available(*, deprecated)
    public func describeJobFlows(input: DescribeJobFlowsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeJobFlowsOutputResponse, DescribeJobFlowsOutputError>) -> Void)
```

``` 
           Job flows created and completed in the last two weeks


            Job flows created within the last two months that are in one of the following
           states: RUNNING, WAITING, SHUTTING_DOWN,
              STARTING



     Amazon EMR can return a maximum of 512 job flow descriptions.
```

### `describeNotebookExecution(input:completion:)`

Provides details of a notebook execution.

``` swift
public func describeNotebookExecution(input: DescribeNotebookExecutionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeNotebookExecutionOutputResponse, DescribeNotebookExecutionOutputError>) -> Void)
```

### `describeReleaseLabel(input:completion:)`

Provides EMR release label details, such as releases available the region where the API request is run, and the available applications for a specific EMR release label. Can also list EMR release versions that support a specified version of Spark.

``` swift
public func describeReleaseLabel(input: DescribeReleaseLabelInput, completion: @escaping (ClientRuntime.SdkResult<DescribeReleaseLabelOutputResponse, DescribeReleaseLabelOutputError>) -> Void)
```

### `describeSecurityConfiguration(input:completion:)`

Provides the details of a security configuration by returning the configuration
JSON.

``` swift
public func describeSecurityConfiguration(input: DescribeSecurityConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSecurityConfigurationOutputResponse, DescribeSecurityConfigurationOutputError>) -> Void)
```

### `describeStep(input:completion:)`

Provides more detail about the cluster step.

``` swift
public func describeStep(input: DescribeStepInput, completion: @escaping (ClientRuntime.SdkResult<DescribeStepOutputResponse, DescribeStepOutputError>) -> Void)
```

### `describeStudio(input:completion:)`

Returns details for the specified Amazon EMR Studio including ID, Name, VPC, Studio
access URL, and so on.

``` swift
public func describeStudio(input: DescribeStudioInput, completion: @escaping (ClientRuntime.SdkResult<DescribeStudioOutputResponse, DescribeStudioOutputError>) -> Void)
```

### `getAutoTerminationPolicy(input:completion:)`

Returns the auto-termination policy for an Amazon EMR cluster.

``` swift
public func getAutoTerminationPolicy(input: GetAutoTerminationPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetAutoTerminationPolicyOutputResponse, GetAutoTerminationPolicyOutputError>) -> Void)
```

### `getBlockPublicAccessConfiguration(input:completion:)`

Returns the Amazon EMR block public access configuration for your Amazon Web Services account in the
current Region. For more information see <a href="https:​//docs.aws.amazon.com/emr/latest/ManagementGuide/configure-block-public-access.html">Configure Block
Public Access for Amazon EMR in the Amazon EMR Management
Guide.

``` swift
public func getBlockPublicAccessConfiguration(input: GetBlockPublicAccessConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetBlockPublicAccessConfigurationOutputResponse, GetBlockPublicAccessConfigurationOutputError>) -> Void)
```

### `getManagedScalingPolicy(input:completion:)`

Fetches the attached managed scaling policy for an Amazon EMR cluster.

``` swift
public func getManagedScalingPolicy(input: GetManagedScalingPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetManagedScalingPolicyOutputResponse, GetManagedScalingPolicyOutputError>) -> Void)
```

### `getStudioSessionMapping(input:completion:)`

Fetches mapping details for the specified Amazon EMR Studio and identity (user or
group).

``` swift
public func getStudioSessionMapping(input: GetStudioSessionMappingInput, completion: @escaping (ClientRuntime.SdkResult<GetStudioSessionMappingOutputResponse, GetStudioSessionMappingOutputError>) -> Void)
```

### `listBootstrapActions(input:completion:)`

Provides information about the bootstrap actions associated with a cluster.

``` swift
public func listBootstrapActions(input: ListBootstrapActionsInput, completion: @escaping (ClientRuntime.SdkResult<ListBootstrapActionsOutputResponse, ListBootstrapActionsOutputError>) -> Void)
```

### `listClusters(input:completion:)`

Provides the status of all clusters visible to this Amazon Web Services account. Allows you to filter
the list of clusters based on certain criteria; for example, filtering by cluster creation
date and time or by status. This call returns a maximum of 50 clusters in unsorted order per call, but
returns a marker to track the paging of the cluster list across multiple ListClusters
calls.

``` swift
public func listClusters(input: ListClustersInput, completion: @escaping (ClientRuntime.SdkResult<ListClustersOutputResponse, ListClustersOutputError>) -> Void)
```

### `listInstanceFleets(input:completion:)`

Lists all available details about the instance fleets in a cluster.

``` swift
public func listInstanceFleets(input: ListInstanceFleetsInput, completion: @escaping (ClientRuntime.SdkResult<ListInstanceFleetsOutputResponse, ListInstanceFleetsOutputError>) -> Void)
```

``` 
        The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and
        later, excluding 5.0.x versions.
```

### `listInstanceGroups(input:completion:)`

Provides all available details about the instance groups in a cluster.

``` swift
public func listInstanceGroups(input: ListInstanceGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListInstanceGroupsOutputResponse, ListInstanceGroupsOutputError>) -> Void)
```

### `listInstances(input:completion:)`

Provides information for all active EC2 instances and EC2 instances terminated in the
last 30 days, up to a maximum of 2,000. EC2 instances in any of the following states are
considered active:​ AWAITING\_FULFILLMENT, PROVISIONING, BOOTSTRAPPING, RUNNING.

``` swift
public func listInstances(input: ListInstancesInput, completion: @escaping (ClientRuntime.SdkResult<ListInstancesOutputResponse, ListInstancesOutputError>) -> Void)
```

### `listNotebookExecutions(input:completion:)`

Provides summaries of all notebook executions. You can filter the list based on multiple
criteria such as status, time range, and editor id. Returns a maximum of 50 notebook
executions and a marker to track the paging of a longer notebook execution list across
multiple ListNotebookExecution calls.

``` swift
public func listNotebookExecutions(input: ListNotebookExecutionsInput, completion: @escaping (ClientRuntime.SdkResult<ListNotebookExecutionsOutputResponse, ListNotebookExecutionsOutputError>) -> Void)
```

### `listReleaseLabels(input:completion:)`

Retrieves release labels of EMR services in the region where the API is called.

``` swift
public func listReleaseLabels(input: ListReleaseLabelsInput, completion: @escaping (ClientRuntime.SdkResult<ListReleaseLabelsOutputResponse, ListReleaseLabelsOutputError>) -> Void)
```

### `listSecurityConfigurations(input:completion:)`

Lists all the security configurations visible to this account, providing their creation
dates and times, and their names. This call returns a maximum of 50 clusters per call, but
returns a marker to track the paging of the cluster list across multiple
ListSecurityConfigurations calls.

``` swift
public func listSecurityConfigurations(input: ListSecurityConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<ListSecurityConfigurationsOutputResponse, ListSecurityConfigurationsOutputError>) -> Void)
```

### `listSteps(input:completion:)`

Provides a list of steps for the cluster in reverse order unless you specify
stepIds with the request or filter by StepStates. You can
specify a maximum of 10 stepIDs. The CLI automatically paginates results to return a list greater than 50 steps. To return more than 50 steps using the CLI, specify a Marker, which is a pagination token that indicates the next set of steps to retrieve.

``` swift
public func listSteps(input: ListStepsInput, completion: @escaping (ClientRuntime.SdkResult<ListStepsOutputResponse, ListStepsOutputError>) -> Void)
```

### `listStudioSessionMappings(input:completion:)`

Returns a list of all user or group session mappings for the Amazon EMR Studio specified by
StudioId.

``` swift
public func listStudioSessionMappings(input: ListStudioSessionMappingsInput, completion: @escaping (ClientRuntime.SdkResult<ListStudioSessionMappingsOutputResponse, ListStudioSessionMappingsOutputError>) -> Void)
```

### `listStudios(input:completion:)`

Returns a list of all Amazon EMR Studios associated with the Amazon Web Services account. The list
includes details such as ID, Studio Access URL, and creation time for each Studio.

``` swift
public func listStudios(input: ListStudiosInput, completion: @escaping (ClientRuntime.SdkResult<ListStudiosOutputResponse, ListStudiosOutputError>) -> Void)
```

### `modifyCluster(input:completion:)`

Modifies the number of steps that can be executed concurrently for the cluster specified
using ClusterID.

``` swift
public func modifyCluster(input: ModifyClusterInput, completion: @escaping (ClientRuntime.SdkResult<ModifyClusterOutputResponse, ModifyClusterOutputError>) -> Void)
```

### `modifyInstanceFleet(input:completion:)`

Modifies the target On-Demand and target Spot capacities for the instance fleet with the
specified InstanceFleetID within the cluster specified using ClusterID. The call either
succeeds or fails atomically.

``` swift
public func modifyInstanceFleet(input: ModifyInstanceFleetInput, completion: @escaping (ClientRuntime.SdkResult<ModifyInstanceFleetOutputResponse, ModifyInstanceFleetOutputError>) -> Void)
```

``` 
        The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and
        later, excluding 5.0.x versions.
```

### `modifyInstanceGroups(input:completion:)`

ModifyInstanceGroups modifies the number of nodes and configuration settings of an
instance group. The input parameters include the new target instance count for the group
and the instance group ID. The call will either succeed or fail atomically.

``` swift
public func modifyInstanceGroups(input: ModifyInstanceGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ModifyInstanceGroupsOutputResponse, ModifyInstanceGroupsOutputError>) -> Void)
```

### `putAutoScalingPolicy(input:completion:)`

Creates or updates an automatic scaling policy for a core instance group or task
instance group in an Amazon EMR cluster. The automatic scaling policy defines how an
instance group dynamically adds and terminates EC2 instances in response to the value of a
CloudWatch metric.

``` swift
public func putAutoScalingPolicy(input: PutAutoScalingPolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutAutoScalingPolicyOutputResponse, PutAutoScalingPolicyOutputError>) -> Void)
```

### `putAutoTerminationPolicy(input:completion:)`

Creates or updates an auto-termination policy for an Amazon EMR cluster. An auto-termination policy defines the amount of idle time in seconds after which a cluster automatically terminates. For alternative cluster termination options, see <a href="https:​//docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-termination.html">Control cluster termination.

``` swift
public func putAutoTerminationPolicy(input: PutAutoTerminationPolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutAutoTerminationPolicyOutputResponse, PutAutoTerminationPolicyOutputError>) -> Void)
```

### `putBlockPublicAccessConfiguration(input:completion:)`

Creates or updates an Amazon EMR block public access configuration for your Amazon Web Services account
in the current Region. For more information see <a href="https:​//docs.aws.amazon.com/emr/latest/ManagementGuide/configure-block-public-access.html">Configure Block
Public Access for Amazon EMR in the Amazon EMR Management
Guide.

``` swift
public func putBlockPublicAccessConfiguration(input: PutBlockPublicAccessConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<PutBlockPublicAccessConfigurationOutputResponse, PutBlockPublicAccessConfigurationOutputError>) -> Void)
```

### `putManagedScalingPolicy(input:completion:)`

Creates or updates a managed scaling policy for an Amazon EMR cluster. The managed
scaling policy defines the limits for resources, such as EC2 instances that can be added or
terminated from a cluster. The policy only applies to the core and task nodes. The master
node cannot be scaled after initial configuration.

``` swift
public func putManagedScalingPolicy(input: PutManagedScalingPolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutManagedScalingPolicyOutputResponse, PutManagedScalingPolicyOutputError>) -> Void)
```

### `removeAutoScalingPolicy(input:completion:)`

Removes an automatic scaling policy from a specified instance group within an EMR
cluster.

``` swift
public func removeAutoScalingPolicy(input: RemoveAutoScalingPolicyInput, completion: @escaping (ClientRuntime.SdkResult<RemoveAutoScalingPolicyOutputResponse, RemoveAutoScalingPolicyOutputError>) -> Void)
```

### `removeAutoTerminationPolicy(input:completion:)`

Removes an auto-termination policy from an Amazon EMR cluster.

``` swift
public func removeAutoTerminationPolicy(input: RemoveAutoTerminationPolicyInput, completion: @escaping (ClientRuntime.SdkResult<RemoveAutoTerminationPolicyOutputResponse, RemoveAutoTerminationPolicyOutputError>) -> Void)
```

### `removeManagedScalingPolicy(input:completion:)`

Removes a managed scaling policy from a specified EMR cluster.

``` swift
public func removeManagedScalingPolicy(input: RemoveManagedScalingPolicyInput, completion: @escaping (ClientRuntime.SdkResult<RemoveManagedScalingPolicyOutputResponse, RemoveManagedScalingPolicyOutputError>) -> Void)
```

### `removeTags(input:completion:)`

Removes tags from an Amazon EMR resource, such as a cluster or Amazon EMR Studio. Tags make it easier to associate resources in
various ways, such as grouping clusters to track your Amazon EMR resource allocation costs.
For more information, see <a href="https:​//docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html">Tag Clusters.
The following example removes the stack tag with value Prod from a cluster:​

``` swift
public func removeTags(input: RemoveTagsInput, completion: @escaping (ClientRuntime.SdkResult<RemoveTagsOutputResponse, RemoveTagsOutputError>) -> Void)
```

### `runJobFlow(input:completion:)`

RunJobFlow creates and starts running a new cluster (job flow). The cluster runs the
steps specified. After the steps complete, the cluster stops and the HDFS partition is
lost. To prevent loss of data, configure the last step of the job flow to store results in
Amazon S3. If the JobFlowInstancesConfig
KeepJobFlowAliveWhenNoSteps parameter is set to TRUE, the cluster
transitions to the WAITING state rather than shutting down after the steps have completed.
For additional protection, you can set the JobFlowInstancesConfig
TerminationProtected parameter to TRUE to lock the cluster and
prevent it from being terminated by API call, user intervention, or in the event of a job
flow error.
A maximum of 256 steps are allowed in each job flow.
If your cluster is long-running (such as a Hive data warehouse) or complex, you may
require more than 256 steps to process your data. You can bypass the 256-step limitation in
various ways, including using the SSH shell to connect to the master node and submitting
queries directly to the software running on the master node, such as Hive and Hadoop. For
more information on how to do this, see <a href="https:​//docs.aws.amazon.com/emr/latest/ManagementGuide/AddMoreThan256Steps.html">Add More than 256 Steps to a
Cluster in the Amazon EMR Management Guide.
For long running clusters, we recommend that you periodically store your results.

``` swift
public func runJobFlow(input: RunJobFlowInput, completion: @escaping (ClientRuntime.SdkResult<RunJobFlowOutputResponse, RunJobFlowOutputError>) -> Void)
```

``` 
        The instance fleets configuration is available only in Amazon EMR versions 4.8.0 and
        later, excluding 5.0.x versions. The RunJobFlow request can contain InstanceFleets
        parameters or InstanceGroups parameters, but not both.
```

### `setTerminationProtection(input:completion:)`

SetTerminationProtection locks a cluster (job flow) so the EC2 instances in the cluster
cannot be terminated by user intervention, an API call, or in the event of a job-flow
error. The cluster still terminates upon successful completion of the job flow. Calling
SetTerminationProtection on a cluster is similar to calling the Amazon EC2
DisableAPITermination API on all EC2 instances in a cluster.

``` swift
public func setTerminationProtection(input: SetTerminationProtectionInput, completion: @escaping (ClientRuntime.SdkResult<SetTerminationProtectionOutputResponse, SetTerminationProtectionOutputError>) -> Void)
```

``` 
        SetTerminationProtection is used to prevent accidental termination of a
     cluster and to ensure that in the event of an error, the instances persist so that you can
     recover any data stored in their ephemeral instance storage.
      To terminate a cluster that has been locked by setting
        SetTerminationProtection to true, you must first unlock the
     job flow by a subsequent call to SetTerminationProtection in which you set the
     value to false.
      For more information, see<a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/UsingEMR_TerminationProtection.html">Managing Cluster
        Termination in the Amazon EMR Management Guide.
```

### `setVisibleToAllUsers(input:completion:)`

Sets the Cluster$VisibleToAllUsers value for an EMR cluster. When true, IAM principals in the
Amazon Web Services account can perform EMR cluster actions that their IAM policies allow. When false, only the IAM principal that created the cluster and the Amazon Web Services account root user can perform EMR actions on the cluster, regardless of IAM permissions policies attached to other IAM principals.
This action works on running clusters. When you create a cluster, use the RunJobFlowInput$VisibleToAllUsers parameter.
For more information, see <a href="https:​//docs.aws.amazon.com/emr/latest/ManagementGuide/security_iam_emr-with-iam.html#security_set_visible_to_all_users">Understanding the EMR Cluster VisibleToAllUsers Setting in the Amazon EMRManagement Guide.

``` swift
public func setVisibleToAllUsers(input: SetVisibleToAllUsersInput, completion: @escaping (ClientRuntime.SdkResult<SetVisibleToAllUsersOutputResponse, SetVisibleToAllUsersOutputError>) -> Void)
```

### `startNotebookExecution(input:completion:)`

Starts a notebook execution.

``` swift
public func startNotebookExecution(input: StartNotebookExecutionInput, completion: @escaping (ClientRuntime.SdkResult<StartNotebookExecutionOutputResponse, StartNotebookExecutionOutputError>) -> Void)
```

### `stopNotebookExecution(input:completion:)`

Stops a notebook execution.

``` swift
public func stopNotebookExecution(input: StopNotebookExecutionInput, completion: @escaping (ClientRuntime.SdkResult<StopNotebookExecutionOutputResponse, StopNotebookExecutionOutputError>) -> Void)
```

### `terminateJobFlows(input:completion:)`

TerminateJobFlows shuts a list of clusters (job flows) down. When a job flow is shut
down, any step not yet completed is canceled and the EC2 instances on which the cluster is
running are stopped. Any log files not already saved are uploaded to Amazon S3 if a LogUri
was specified when the cluster was created.
The maximum number of clusters allowed is 10. The call to TerminateJobFlows
is asynchronous. Depending on the configuration of the cluster, it may take up to 1-5
minutes for the cluster to completely terminate and release allocated resources, such as
Amazon EC2 instances.

``` swift
public func terminateJobFlows(input: TerminateJobFlowsInput, completion: @escaping (ClientRuntime.SdkResult<TerminateJobFlowsOutputResponse, TerminateJobFlowsOutputError>) -> Void)
```

### `updateStudio(input:completion:)`

Updates an Amazon EMR Studio configuration, including attributes such as name, description, and subnets.

``` swift
public func updateStudio(input: UpdateStudioInput, completion: @escaping (ClientRuntime.SdkResult<UpdateStudioOutputResponse, UpdateStudioOutputError>) -> Void)
```

### `updateStudioSessionMapping(input:completion:)`

Updates the session policy attached to the user or group for the specified Amazon EMR
Studio.

``` swift
public func updateStudioSessionMapping(input: UpdateStudioSessionMappingInput, completion: @escaping (ClientRuntime.SdkResult<UpdateStudioSessionMappingOutputResponse, UpdateStudioSessionMappingOutputError>) -> Void)
```
