# CloudFormationClient

``` swift
public class CloudFormationClient 
```

## Inheritance

[`CloudFormationClientProtocol`](/aws-sdk-swift/reference/0.x/AWSCloudFormation/CloudFormationClientProtocol)

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
public static let clientName = "CloudFormationClient"
```

## Methods

### `activateType(input:completion:)`

Activates a public third-party extension, making it available for use in stack templates. For more information, see [Using public extensions](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-public.html) in the CloudFormation User Guide. Once you have activated a public third-party extension in your account and region, use \[SetTypeConfiguration\] to specify configuration properties for the extension. For more information, see [Configuring extensions at the account level](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-register.html#registry-set-configuration) in the CloudFormation User Guide.

``` swift
public func activateType(input: ActivateTypeInput, completion: @escaping (ClientRuntime.SdkResult<ActivateTypeOutputResponse, ActivateTypeOutputError>) -> Void)
```

### `batchDescribeTypeConfigurations(input:completion:)`

Returns configuration data for the specified CloudFormation extensions, from the CloudFormation registry for the account and region. For more information, see [Configuring extensions at the account level](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-register.html#registry-set-configuration) in the CloudFormation User Guide.

``` swift
public func batchDescribeTypeConfigurations(input: BatchDescribeTypeConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<BatchDescribeTypeConfigurationsOutputResponse, BatchDescribeTypeConfigurationsOutputError>) -> Void)
```

### `cancelUpdateStack(input:completion:)`

Cancels an update on the specified stack. If the call completes successfully, the stack rolls back the update and reverts to the previous stack configuration. You can cancel only stacks that are in the UPDATE\_IN\_PROGRESS state.

``` swift
public func cancelUpdateStack(input: CancelUpdateStackInput, completion: @escaping (ClientRuntime.SdkResult<CancelUpdateStackOutputResponse, CancelUpdateStackOutputError>) -> Void)
```

### `continueUpdateRollback(input:completion:)`

For a specified stack that is in the UPDATE\_ROLLBACK\_FAILED state, continues rolling it back to the UPDATE\_ROLLBACK\_COMPLETE state. Depending on the cause of the failure, you can manually [ fix the error](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/troubleshooting.html#troubleshooting-errors-update-rollback-failed) and continue the rollback. By continuing the rollback, you can return your stack to a working state (the UPDATE\_ROLLBACK\_COMPLETE state), and then try to update the stack again. A stack goes into the UPDATE\_ROLLBACK\_FAILED state when CloudFormation cannot roll back all changes after a failed stack update. For example, you might have a stack that is rolling back to an old database instance that was deleted outside of CloudFormation. Because CloudFormation doesn't know the database was deleted, it assumes that the database instance still exists and attempts to roll back to it, causing the update rollback to fail.

``` swift
public func continueUpdateRollback(input: ContinueUpdateRollbackInput, completion: @escaping (ClientRuntime.SdkResult<ContinueUpdateRollbackOutputResponse, ContinueUpdateRollbackOutputError>) -> Void)
```

### `createChangeSet(input:completion:)`

Creates a list of changes that will be applied to a stack so that you can review the changes before executing them. You can create a change set for a stack that doesn't exist or an existing stack. If you create a change set for a stack that doesn't exist, the change set shows all of the resources that CloudFormation will create. If you create a change set for an existing stack, CloudFormation compares the stack's information with the information that you submit in the change set and lists the differences. Use change sets to understand which resources CloudFormation will create or change, and how it will change resources in an existing stack, before you create or update a stack. To create a change set for a stack that doesn't exist, for the ChangeSetType parameter, specify CREATE. To create a change set for an existing stack, specify UPDATE for the ChangeSetType parameter. To create a change set for an import operation, specify IMPORT for the ChangeSetType parameter. After the CreateChangeSet call successfully completes, CloudFormation starts creating the change set. To check the status of the change set or to review it, use the \[DescribeChangeSet\] action. When you are satisfied with the changes the change set will make, execute the change set by using the \[ExecuteChangeSet\] action. CloudFormation doesn't make changes until you execute the change set. To create a change set for the entire stack hierachy, set IncludeNestedStacks to True.

``` swift
public func createChangeSet(input: CreateChangeSetInput, completion: @escaping (ClientRuntime.SdkResult<CreateChangeSetOutputResponse, CreateChangeSetOutputError>) -> Void)
```

### `createStack(input:completion:)`

Creates a stack as specified in the template. After the call completes successfully, the stack creation starts. You can check the status of the stack via the \[DescribeStacks\] API.

``` swift
public func createStack(input: CreateStackInput, completion: @escaping (ClientRuntime.SdkResult<CreateStackOutputResponse, CreateStackOutputError>) -> Void)
```

### `createStackInstances(input:completion:)`

Creates stack instances for the specified accounts, within the specified Regions. A stack instance refers to a stack in a specific account and Region. You must specify at least one value for either Accounts or DeploymentTargets, and you must specify at least one value for Regions.

``` swift
public func createStackInstances(input: CreateStackInstancesInput, completion: @escaping (ClientRuntime.SdkResult<CreateStackInstancesOutputResponse, CreateStackInstancesOutputError>) -> Void)
```

### `createStackSet(input:completion:)`

Creates a stack set.

``` swift
public func createStackSet(input: CreateStackSetInput, completion: @escaping (ClientRuntime.SdkResult<CreateStackSetOutputResponse, CreateStackSetOutputError>) -> Void)
```

### `deactivateType(input:completion:)`

Deactivates a public extension that was previously activated in this account and region. Once deactivated, an extension cannot be used in any CloudFormation operation. This includes stack update operations where the stack template includes the extension, even if no updates are being made to the extension. In addition, deactivated extensions are not automatically updated if a new version of the extension is released.

``` swift
public func deactivateType(input: DeactivateTypeInput, completion: @escaping (ClientRuntime.SdkResult<DeactivateTypeOutputResponse, DeactivateTypeOutputError>) -> Void)
```

### `deleteChangeSet(input:completion:)`

Deletes the specified change set. Deleting change sets ensures that no one executes the wrong change set. If the call successfully completes, CloudFormation successfully deleted the change set. If IncludeNestedStacks specifies True during the creation of the nested change set, then DeleteChangeSet will delete all change sets that belong to the stacks hierarchy and will also delete all change sets for nested stacks with the status of REVIEW\_IN\_PROGRESS.

``` swift
public func deleteChangeSet(input: DeleteChangeSetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteChangeSetOutputResponse, DeleteChangeSetOutputError>) -> Void)
```

### `deleteStack(input:completion:)`

Deletes a specified stack. Once the call completes successfully, stack deletion starts. Deleted stacks do not show up in the \[DescribeStacks\] API if the deletion has been completed successfully.

``` swift
public func deleteStack(input: DeleteStackInput, completion: @escaping (ClientRuntime.SdkResult<DeleteStackOutputResponse, DeleteStackOutputError>) -> Void)
```

### `deleteStackInstances(input:completion:)`

Deletes stack instances for the specified accounts, in the specified Regions.

``` swift
public func deleteStackInstances(input: DeleteStackInstancesInput, completion: @escaping (ClientRuntime.SdkResult<DeleteStackInstancesOutputResponse, DeleteStackInstancesOutputError>) -> Void)
```

### `deleteStackSet(input:completion:)`

Deletes a stack set. Before you can delete a stack set, all of its member stack instances must be deleted. For more information about how to do this, see \[DeleteStackInstances\].

``` swift
public func deleteStackSet(input: DeleteStackSetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteStackSetOutputResponse, DeleteStackSetOutputError>) -> Void)
```

### `deregisterType(input:completion:)`

Marks an extension or extension version as DEPRECATED in the CloudFormation registry, removing it from active use. Deprecated extensions or extension versions cannot be used in CloudFormation operations. To deregister an entire extension, you must individually deregister all active versions of that extension. If an extension has only a single active version, deregistering that version results in the extension itself being deregistered and marked as deprecated in the registry. You cannot deregister the default version of an extension if there are other active version of that extension. If you do deregister the default version of an extension, the textensionype itself is deregistered as well and marked as deprecated. To view the deprecation status of an extension or extension version, use [DescribeType](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DescribeType.html).

``` swift
public func deregisterType(input: DeregisterTypeInput, completion: @escaping (ClientRuntime.SdkResult<DeregisterTypeOutputResponse, DeregisterTypeOutputError>) -> Void)
```

### `describeAccountLimits(input:completion:)`

Retrieves your account's CloudFormation limits, such as the maximum number of stacks that you can create in your account. For more information about account limits, see [CloudFormation Limits](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cloudformation-limits.html) in the CloudFormation User Guide.

``` swift
public func describeAccountLimits(input: DescribeAccountLimitsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAccountLimitsOutputResponse, DescribeAccountLimitsOutputError>) -> Void)
```

### `describeChangeSet(input:completion:)`

Returns the inputs for the change set and a list of changes that CloudFormation will make if you execute the change set. For more information, see [Updating Stacks Using Change Sets](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks-changesets.html) in the CloudFormation User Guide.

``` swift
public func describeChangeSet(input: DescribeChangeSetInput, completion: @escaping (ClientRuntime.SdkResult<DescribeChangeSetOutputResponse, DescribeChangeSetOutputError>) -> Void)
```

### `describePublisher(input:completion:)`

Returns information about a CloudFormation extension publisher. If you do not supply a PublisherId, and you have registered as an extension publisher, DescribePublisher returns information about your own publisher account. For more information on registering as a publisher, see:

``` swift
public func describePublisher(input: DescribePublisherInput, completion: @escaping (ClientRuntime.SdkResult<DescribePublisherOutputResponse, DescribePublisherOutputError>) -> Void)
```

  - [RegisterPublisher](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterPublisher.html)

  - [Publishing extensions to make them available for public use](https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/publish-extension.html) in the CloudFormation CLI User Guide

### `describeStackDriftDetectionStatus(input:completion:)`

Returns information about a stack drift detection operation. A stack drift detection operation detects whether a stack's actual configuration differs, or has drifted, from it's expected configuration, as defined in the stack template and any values specified as template parameters. A stack is considered to have drifted if one or more of its resources have drifted. For more information on stack and resource drift, see [Detecting Unregulated Configuration Changes to Stacks and Resources](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html). Use \[DetectStackDrift\] to initiate a stack drift detection operation. DetectStackDrift returns a StackDriftDetectionId you can use to monitor the progress of the operation using DescribeStackDriftDetectionStatus. Once the drift detection operation has completed, use \[DescribeStackResourceDrifts\] to return drift information about the stack and its resources.

``` swift
public func describeStackDriftDetectionStatus(input: DescribeStackDriftDetectionStatusInput, completion: @escaping (ClientRuntime.SdkResult<DescribeStackDriftDetectionStatusOutputResponse, DescribeStackDriftDetectionStatusOutputError>) -> Void)
```

### `describeStackEvents(input:completion:)`

Returns all stack related events for a specified stack in reverse chronological order. For more information about a stack's event history, go to [Stacks](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/concept-stack.html) in the CloudFormation User Guide. You can list events for stacks that have failed to create or have been deleted by specifying the unique stack identifier (stack ID).

``` swift
public func describeStackEvents(input: DescribeStackEventsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeStackEventsOutputResponse, DescribeStackEventsOutputError>) -> Void)
```

### `describeStackInstance(input:completion:)`

Returns the stack instance that's associated with the specified stack set, Amazon Web Services account, and Region. For a list of stack instances that are associated with a specific stack set, use \[ListStackInstances\].

``` swift
public func describeStackInstance(input: DescribeStackInstanceInput, completion: @escaping (ClientRuntime.SdkResult<DescribeStackInstanceOutputResponse, DescribeStackInstanceOutputError>) -> Void)
```

### `describeStackResource(input:completion:)`

Returns a description of the specified resource in the specified stack. For deleted stacks, DescribeStackResource returns resource information for up to 90 days after the stack has been deleted.

``` swift
public func describeStackResource(input: DescribeStackResourceInput, completion: @escaping (ClientRuntime.SdkResult<DescribeStackResourceOutputResponse, DescribeStackResourceOutputError>) -> Void)
```

### `describeStackResourceDrifts(input:completion:)`

Returns drift information for the resources that have been checked for drift in the specified stack. This includes actual and expected configuration values for resources where CloudFormation detects configuration drift. For a given stack, there will be one StackResourceDrift for each stack resource that has been checked for drift. Resources that haven't yet been checked for drift are not included. Resources that do not currently support drift detection are not checked, and so not included. For a list of resources that support drift detection, see [Resources that Support Drift Detection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html). Use \[DetectStackResourceDrift\] to detect drift on individual resources, or \[DetectStackDrift\] to detect drift on all supported resources for a given stack.

``` swift
public func describeStackResourceDrifts(input: DescribeStackResourceDriftsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeStackResourceDriftsOutputResponse, DescribeStackResourceDriftsOutputError>) -> Void)
```

### `describeStackResources(input:completion:)`

Returns Amazon Web Services resource descriptions for running and deleted stacks. If StackName is specified, all the associated resources that are part of the stack are returned. If PhysicalResourceId is specified, the associated resources of the stack that the resource belongs to are returned. Only the first 100 resources will be returned. If your stack has more resources than this, you should use ListStackResources instead. For deleted stacks, DescribeStackResources returns resource information for up to 90 days after the stack has been deleted. You must specify either StackName or PhysicalResourceId, but not both. In addition, you can specify LogicalResourceId to filter the returned result. For more information about resources, the LogicalResourceId and PhysicalResourceId, go to the [CloudFormation User Guide](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/). A ValidationError is returned if you specify both StackName and PhysicalResourceId in the same request.

``` swift
public func describeStackResources(input: DescribeStackResourcesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeStackResourcesOutputResponse, DescribeStackResourcesOutputError>) -> Void)
```

### `describeStackSet(input:completion:)`

Returns the description of the specified stack set.

``` swift
public func describeStackSet(input: DescribeStackSetInput, completion: @escaping (ClientRuntime.SdkResult<DescribeStackSetOutputResponse, DescribeStackSetOutputError>) -> Void)
```

### `describeStackSetOperation(input:completion:)`

Returns the description of the specified stack set operation.

``` swift
public func describeStackSetOperation(input: DescribeStackSetOperationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeStackSetOperationOutputResponse, DescribeStackSetOperationOutputError>) -> Void)
```

### `describeStacks(input:completion:)`

Returns the description for the specified stack; if no stack name was specified, then it returns the description for all the stacks created. If the stack does not exist, an ValidationError is returned.

``` swift
public func describeStacks(input: DescribeStacksInput, completion: @escaping (ClientRuntime.SdkResult<DescribeStacksOutputResponse, DescribeStacksOutputError>) -> Void)
```

### `describeType(input:completion:)`

Returns detailed information about an extension that has been registered. If you specify a VersionId, DescribeType returns information about that specific extension version. Otherwise, it returns information about the default extension version.

``` swift
public func describeType(input: DescribeTypeInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTypeOutputResponse, DescribeTypeOutputError>) -> Void)
```

### `describeTypeRegistration(input:completion:)`

Returns information about an extension's registration, including its current status and type and version identifiers. When you initiate a registration request using \[RegisterType\], you can then use \[DescribeTypeRegistration\] to monitor the progress of that registration request. Once the registration request has completed, use \[DescribeType\] to return detailed information about an extension.

``` swift
public func describeTypeRegistration(input: DescribeTypeRegistrationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTypeRegistrationOutputResponse, DescribeTypeRegistrationOutputError>) -> Void)
```

### `detectStackDrift(input:completion:)`

Detects whether a stack's actual configuration differs, or has drifted, from it's expected configuration, as defined in the stack template and any values specified as template parameters. For each resource in the stack that supports drift detection, CloudFormation compares the actual configuration of the resource with its expected template configuration. Only resource properties explicitly defined in the stack template are checked for drift. A stack is considered to have drifted if one or more of its resources differ from their expected template configurations. For more information, see [Detecting Unregulated Configuration Changes to Stacks and Resources](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html). Use DetectStackDrift to detect drift on all supported resources for a given stack, or \[DetectStackResourceDrift\] to detect drift on individual resources. For a list of stack resources that currently support drift detection, see [Resources that Support Drift Detection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html). DetectStackDrift can take up to several minutes, depending on the number of resources contained within the stack. Use \[DescribeStackDriftDetectionStatus\] to monitor the progress of a detect stack drift operation. Once the drift detection operation has completed, use \[DescribeStackResourceDrifts\] to return drift information about the stack and its resources. When detecting drift on a stack, CloudFormation does not detect drift on any nested stacks belonging to that stack. Perform DetectStackDrift directly on the nested stack itself.

``` swift
public func detectStackDrift(input: DetectStackDriftInput, completion: @escaping (ClientRuntime.SdkResult<DetectStackDriftOutputResponse, DetectStackDriftOutputError>) -> Void)
```

### `detectStackResourceDrift(input:completion:)`

Returns information about whether a resource's actual configuration differs, or has drifted, from it's expected configuration, as defined in the stack template and any values specified as template parameters. This information includes actual and expected property values for resources in which CloudFormation detects drift. Only resource properties explicitly defined in the stack template are checked for drift. For more information about stack and resource drift, see [Detecting Unregulated Configuration Changes to Stacks and Resources](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html). Use DetectStackResourceDrift to detect drift on individual resources, or \[DetectStackDrift\] to detect drift on all resources in a given stack that support drift detection. Resources that do not currently support drift detection cannot be checked. For a list of resources that support drift detection, see [Resources that Support Drift Detection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html).

``` swift
public func detectStackResourceDrift(input: DetectStackResourceDriftInput, completion: @escaping (ClientRuntime.SdkResult<DetectStackResourceDriftOutputResponse, DetectStackResourceDriftOutputError>) -> Void)
```

### `detectStackSetDrift(input:completion:)`

Detect drift on a stack set. When CloudFormation performs drift detection on a stack set, it performs drift detection on the stack associated with each stack instance in the stack set. For more information, see [How CloudFormation Performs Drift Detection on a Stack Set](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-drift.html). DetectStackSetDrift returns the OperationId of the stack set drift detection operation. Use this operation id with \[DescribeStackSetOperation\] to monitor the progress of the drift detection operation. The drift detection operation may take some time, depending on the number of stack instances included in the stack set, as well as the number of resources included in each stack. Once the operation has completed, use the following actions to return drift information:

``` swift
public func detectStackSetDrift(input: DetectStackSetDriftInput, completion: @escaping (ClientRuntime.SdkResult<DetectStackSetDriftOutputResponse, DetectStackSetDriftOutputError>) -> Void)
```

  - Use \[DescribeStackSet\] to return detailed information about the stack set, including detailed information about the last completed drift operation performed on the stack set. (Information about drift operations that are in progress is not included.)

  - Use \[ListStackInstances\] to return a list of stack instances belonging to the stack set, including the drift status and last drift time checked of each instance.

  - Use \[DescribeStackInstance\] to return detailed information about a specific stack instance, including its drift status and last drift time checked.

For more information on performing a drift detection operation on a stack set, see [Detecting Unmanaged Changes in Stack Sets](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-drift.html). You can only run a single drift detection operation on a given stack set at one time. To stop a drift detection stack set operation, use \[StopStackSetOperation\].

### `estimateTemplateCost(input:completion:)`

Returns the estimated monthly cost of a template. The return value is an Amazon Web Services Simple Monthly Calculator URL with a query string that describes the resources required to run the template.

``` swift
public func estimateTemplateCost(input: EstimateTemplateCostInput, completion: @escaping (ClientRuntime.SdkResult<EstimateTemplateCostOutputResponse, EstimateTemplateCostOutputError>) -> Void)
```

### `executeChangeSet(input:completion:)`

Updates a stack using the input information that was provided when the specified change set was created. After the call successfully completes, CloudFormation starts updating the stack. Use the \[DescribeStacks\] action to view the status of the update. When you execute a change set, CloudFormation deletes all other change sets associated with the stack because they aren't valid for the updated stack. If a stack policy is associated with the stack, CloudFormation enforces the policy during the update. You can't specify a temporary stack policy that overrides the current policy. To create a change set for the entire stack hierachy, IncludeNestedStacks must have been set to True.

``` swift
public func executeChangeSet(input: ExecuteChangeSetInput, completion: @escaping (ClientRuntime.SdkResult<ExecuteChangeSetOutputResponse, ExecuteChangeSetOutputError>) -> Void)
```

### `getStackPolicy(input:completion:)`

Returns the stack policy for a specified stack. If a stack doesn't have a policy, a null value is returned.

``` swift
public func getStackPolicy(input: GetStackPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetStackPolicyOutputResponse, GetStackPolicyOutputError>) -> Void)
```

### `getTemplate(input:completion:)`

Returns the template body for a specified stack. You can get the template for running or deleted stacks. For deleted stacks, GetTemplate returns the template for up to 90 days after the stack has been deleted. If the template does not exist, a ValidationError is returned.

``` swift
public func getTemplate(input: GetTemplateInput, completion: @escaping (ClientRuntime.SdkResult<GetTemplateOutputResponse, GetTemplateOutputError>) -> Void)
```

### `getTemplateSummary(input:completion:)`

Returns information about a new or existing template. The GetTemplateSummary action is useful for viewing parameter information, such as default parameter values and parameter types, before you create or update a stack or stack set. You can use the GetTemplateSummary action when you submit a template, or you can get template information for a stack set, or a running or deleted stack. For deleted stacks, GetTemplateSummary returns the template information for up to 90 days after the stack has been deleted. If the template does not exist, a ValidationError is returned.

``` swift
public func getTemplateSummary(input: GetTemplateSummaryInput, completion: @escaping (ClientRuntime.SdkResult<GetTemplateSummaryOutputResponse, GetTemplateSummaryOutputError>) -> Void)
```

### `importStacksToStackSet(input:completion:)`

Import existing stacks into a new stack sets. Use the stack import operation to import up to 10 stacks into a new stack set in the same account as the source stack or in a different administrator account and Region, by specifying the stack ID of the stack you intend to import. ImportStacksToStackSet is only supported by self-managed permissions.

``` swift
public func importStacksToStackSet(input: ImportStacksToStackSetInput, completion: @escaping (ClientRuntime.SdkResult<ImportStacksToStackSetOutputResponse, ImportStacksToStackSetOutputError>) -> Void)
```

### `listChangeSets(input:completion:)`

Returns the ID and status of each active change set for a stack. For example, CloudFormation lists change sets that are in the CREATE\_IN\_PROGRESS or CREATE\_PENDING state.

``` swift
public func listChangeSets(input: ListChangeSetsInput, completion: @escaping (ClientRuntime.SdkResult<ListChangeSetsOutputResponse, ListChangeSetsOutputError>) -> Void)
```

### `listExports(input:completion:)`

Lists all exported output values in the account and Region in which you call this action. Use this action to see the exported output values that you can import into other stacks. To import values, use the [Fn::ImportValue](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-importvalue.html) function. For more information, see [ CloudFormation Export Stack Output Values](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-exports.html).

``` swift
public func listExports(input: ListExportsInput, completion: @escaping (ClientRuntime.SdkResult<ListExportsOutputResponse, ListExportsOutputError>) -> Void)
```

### `listImports(input:completion:)`

Lists all stacks that are importing an exported output value. To modify or remove an exported output value, first use this action to see which stacks are using it. To see the exported output values in your account, see \[ListExports\]. For more information about importing an exported output value, see the [Fn::ImportValue](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-importvalue.html) function.

``` swift
public func listImports(input: ListImportsInput, completion: @escaping (ClientRuntime.SdkResult<ListImportsOutputResponse, ListImportsOutputError>) -> Void)
```

### `listStackInstances(input:completion:)`

Returns summary information about stack instances that are associated with the specified stack set. You can filter for stack instances that are associated with a specific Amazon Web Services account name or Region, or that have a specific status.

``` swift
public func listStackInstances(input: ListStackInstancesInput, completion: @escaping (ClientRuntime.SdkResult<ListStackInstancesOutputResponse, ListStackInstancesOutputError>) -> Void)
```

### `listStackResources(input:completion:)`

Returns descriptions of all resources of the specified stack. For deleted stacks, ListStackResources returns resource information for up to 90 days after the stack has been deleted.

``` swift
public func listStackResources(input: ListStackResourcesInput, completion: @escaping (ClientRuntime.SdkResult<ListStackResourcesOutputResponse, ListStackResourcesOutputError>) -> Void)
```

### `listStackSetOperationResults(input:completion:)`

Returns summary information about the results of a stack set operation.

``` swift
public func listStackSetOperationResults(input: ListStackSetOperationResultsInput, completion: @escaping (ClientRuntime.SdkResult<ListStackSetOperationResultsOutputResponse, ListStackSetOperationResultsOutputError>) -> Void)
```

### `listStackSetOperations(input:completion:)`

Returns summary information about operations performed on a stack set.

``` swift
public func listStackSetOperations(input: ListStackSetOperationsInput, completion: @escaping (ClientRuntime.SdkResult<ListStackSetOperationsOutputResponse, ListStackSetOperationsOutputError>) -> Void)
```

### `listStackSets(input:completion:)`

Returns summary information about stack sets that are associated with the user.

``` swift
public func listStackSets(input: ListStackSetsInput, completion: @escaping (ClientRuntime.SdkResult<ListStackSetsOutputResponse, ListStackSetsOutputError>) -> Void)
```

  - \[Self-managed permissions\] If you set the CallAs parameter to SELF while signed in to your Amazon Web Services account, ListStackSets returns all self-managed stack sets in your Amazon Web Services account.

  - \[Service-managed permissions\] If you set the CallAs parameter to SELF while signed in to the organization's management account, ListStackSets returns all stack sets in the management account.

  - \[Service-managed permissions\] If you set the CallAs parameter to DELEGATED\_ADMIN while signed in to your member account, ListStackSets returns all stack sets with service-managed permissions in the management account.

### `listStacks(input:completion:)`

Returns the summary information for stacks whose status matches the specified StackStatusFilter. Summary information for stacks that have been deleted is kept for 90 days after the stack is deleted. If no StackStatusFilter is specified, summary information for all stacks is returned (including existing stacks and stacks that have been deleted).

``` swift
public func listStacks(input: ListStacksInput, completion: @escaping (ClientRuntime.SdkResult<ListStacksOutputResponse, ListStacksOutputError>) -> Void)
```

### `listTypeRegistrations(input:completion:)`

Returns a list of registration tokens for the specified extension(s).

``` swift
public func listTypeRegistrations(input: ListTypeRegistrationsInput, completion: @escaping (ClientRuntime.SdkResult<ListTypeRegistrationsOutputResponse, ListTypeRegistrationsOutputError>) -> Void)
```

### `listTypeVersions(input:completion:)`

Returns summary information about the versions of an extension.

``` swift
public func listTypeVersions(input: ListTypeVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListTypeVersionsOutputResponse, ListTypeVersionsOutputError>) -> Void)
```

### `listTypes(input:completion:)`

Returns summary information about extension that have been registered with CloudFormation.

``` swift
public func listTypes(input: ListTypesInput, completion: @escaping (ClientRuntime.SdkResult<ListTypesOutputResponse, ListTypesOutputError>) -> Void)
```

### `publishType(input:completion:)`

Publishes the specified extension to the CloudFormation registry as a public extension in this region. Public extensions are available for use by all CloudFormation users. For more information on publishing extensions, see [Publishing extensions to make them available for public use](https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/publish-extension.html) in the CloudFormation CLI User Guide. To publish an extension, you must be registered as a publisher with CloudFormation. For more information, see [RegisterPublisher](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterPublisher.html).

``` swift
public func publishType(input: PublishTypeInput, completion: @escaping (ClientRuntime.SdkResult<PublishTypeOutputResponse, PublishTypeOutputError>) -> Void)
```

### `recordHandlerProgress(input:completion:)`

Reports progress of a resource handler to CloudFormation. Reserved for use by the [CloudFormation CLI](https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html). Do not use this API in your code.

``` swift
public func recordHandlerProgress(input: RecordHandlerProgressInput, completion: @escaping (ClientRuntime.SdkResult<RecordHandlerProgressOutputResponse, RecordHandlerProgressOutputError>) -> Void)
```

### `registerPublisher(input:completion:)`

Registers your account as a publisher of public extensions in the CloudFormation registry. Public extensions are available for use by all CloudFormation users. This publisher ID applies to your account in all Amazon Web Services Regions. For information on requirements for registering as a public extension publisher, see [Registering your account to publish CloudFormation extensions](https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/publish-extension.html#publish-extension-prereqs) in the CloudFormation CLI User Guide.

``` swift
public func registerPublisher(input: RegisterPublisherInput, completion: @escaping (ClientRuntime.SdkResult<RegisterPublisherOutputResponse, RegisterPublisherOutputError>) -> Void)
```

### `registerType(input:completion:)`

Registers an extension with the CloudFormation service. Registering an extension makes it available for use in CloudFormation templates in your Amazon Web Services account, and includes:

``` swift
public func registerType(input: RegisterTypeInput, completion: @escaping (ClientRuntime.SdkResult<RegisterTypeOutputResponse, RegisterTypeOutputError>) -> Void)
```

  - Validating the extension schema

  - Determining which handlers, if any, have been specified for the extension

  - Making the extension available for use in your account

For more information on how to develop extensions and ready them for registeration, see [Creating Resource Providers](https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-types.html) in the CloudFormation CLI User Guide. You can have a maximum of 50 resource extension versions registered at a time. This maximum is per account and per region. Use \[DeregisterType\] to deregister specific extension versions if necessary. Once you have initiated a registration request using \[RegisterType\], you can use \[DescribeTypeRegistration\] to monitor the progress of the registration request. Once you have registered a private extension in your account and region, use \[SetTypeConfiguration\] to specify configuration properties for the extension. For more information, see [Configuring extensions at the account level](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-register.html#registry-set-configuration) in the CloudFormation User Guide.

### `rollbackStack(input:completion:)`

When specifying RollbackStack, you preserve the state of previously provisioned resources when an operation fails. You can check the status of the stack through the \[DescribeStacks\] API. Rolls back the specified stack to the last known stable state from CREATE\_FAILED or UPDATE\_FAILED stack statuses. This operation will delete a stack if it doesn't contain a last known stable state. A last known stable state includes any status in a \*\_COMPLETE. This includes the following stack statuses.

``` swift
public func rollbackStack(input: RollbackStackInput, completion: @escaping (ClientRuntime.SdkResult<RollbackStackOutputResponse, RollbackStackOutputError>) -> Void)
```

  - CREATE\_COMPLETE

  - UPDATE\_COMPLETE

  - UPDATE\_ROLLBACK\_COMPLETE

  - IMPORT\_COMPLETE

  - IMPORT\_ROLLBACK\_COMPLETE

### `setStackPolicy(input:completion:)`

Sets a stack policy for a specified stack.

``` swift
public func setStackPolicy(input: SetStackPolicyInput, completion: @escaping (ClientRuntime.SdkResult<SetStackPolicyOutputResponse, SetStackPolicyOutputError>) -> Void)
```

### `setTypeConfiguration(input:completion:)`

Specifies the configuration data for a registered CloudFormation extension, in the given account and region. To view the current configuration data for an extension, refer to the ConfigurationSchema element of \[DescribeType\]. For more information, see [Configuring extensions at the account level](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-register.html#registry-set-configuration) in the CloudFormation User Guide. It is strongly recommended that you use dynamic references to restrict sensitive configuration definitions, such as third-party credentials. For more details on dynamic references, see [Using dynamic references to specify template values](https://docs.aws.amazon.com/) in the CloudFormation User Guide.

``` swift
public func setTypeConfiguration(input: SetTypeConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<SetTypeConfigurationOutputResponse, SetTypeConfigurationOutputError>) -> Void)
```

### `setTypeDefaultVersion(input:completion:)`

Specify the default version of an extension. The default version of an extension will be used in CloudFormation operations.

``` swift
public func setTypeDefaultVersion(input: SetTypeDefaultVersionInput, completion: @escaping (ClientRuntime.SdkResult<SetTypeDefaultVersionOutputResponse, SetTypeDefaultVersionOutputError>) -> Void)
```

### `signalResource(input:completion:)`

Sends a signal to the specified resource with a success or failure status. You can use the SignalResource API in conjunction with a creation policy or update policy. CloudFormation doesn't proceed with a stack creation or update until resources receive the required number of signals or the timeout period is exceeded. The SignalResource API is useful in cases where you want to send signals from anywhere other than an Amazon EC2 instance.

``` swift
public func signalResource(input: SignalResourceInput, completion: @escaping (ClientRuntime.SdkResult<SignalResourceOutputResponse, SignalResourceOutputError>) -> Void)
```

### `stopStackSetOperation(input:completion:)`

Stops an in-progress operation on a stack set and its associated stack instances.

``` swift
public func stopStackSetOperation(input: StopStackSetOperationInput, completion: @escaping (ClientRuntime.SdkResult<StopStackSetOperationOutputResponse, StopStackSetOperationOutputError>) -> Void)
```

### `testType(input:completion:)`

Tests a registered extension to make sure it meets all necessary requirements for being published in the CloudFormation registry.

``` swift
public func testType(input: TestTypeInput, completion: @escaping (ClientRuntime.SdkResult<TestTypeOutputResponse, TestTypeOutputError>) -> Void)
```

  - For resource types, this includes passing all contracts tests defined for the type.

  - For modules, this includes determining if the module's model meets all necessary requirements.

For more information, see [Testing your public extension prior to publishing](https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/publish-extension.html#publish-extension-testing) in the CloudFormation CLI User Guide. If you do not specify a version, CloudFormation uses the default version of the extension in your account and region for testing. To perform testing, CloudFormation assumes the execution role specified when the type was registered. For more information, see \[RegisterType\]. Once you've initiated testing on an extension using TestType, you can use [DescribeType](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DescribeType.html) to monitor the current test status and test status description for the extension. An extension must have a test status of PASSED before it can be published. For more information, see [Publishing extensions to make them available for public use](https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-publish.html) in the CloudFormation CLI User Guide.

### `updateStack(input:completion:)`

Updates a stack as specified in the template. After the call completes successfully, the stack update starts. You can check the status of the stack via the \[DescribeStacks\] action. To get a copy of the template for an existing stack, you can use the \[GetTemplate\] action. For more information about creating an update template, updating a stack, and monitoring the progress of the update, see [Updating a Stack](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks.html).

``` swift
public func updateStack(input: UpdateStackInput, completion: @escaping (ClientRuntime.SdkResult<UpdateStackOutputResponse, UpdateStackOutputError>) -> Void)
```

### `updateStackInstances(input:completion:)`

Updates the parameter values for stack instances for the specified accounts, within the specified Regions. A stack instance refers to a stack in a specific account and Region. You can only update stack instances in Regions and accounts where they already exist; to create additional stack instances, use [CreateStackInstances](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_CreateStackInstances.html). During stack set updates, any parameters overridden for a stack instance are not updated, but retain their overridden value. You can only update the parameter values that are specified in the stack set; to add or delete a parameter itself, use [UpdateStackSet](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_UpdateStackSet.html) to update the stack set template. If you add a parameter to a template, before you can override the parameter value specified in the stack set you must first use [UpdateStackSet](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_UpdateStackSet.html) to update all stack instances with the updated template and parameter value specified in the stack set. Once a stack instance has been updated with the new parameter, you can then override the parameter value using UpdateStackInstances.

``` swift
public func updateStackInstances(input: UpdateStackInstancesInput, completion: @escaping (ClientRuntime.SdkResult<UpdateStackInstancesOutputResponse, UpdateStackInstancesOutputError>) -> Void)
```

### `updateStackSet(input:completion:)`

Updates the stack set, and associated stack instances in the specified accounts and Regions. Even if the stack set operation created by updating the stack set fails (completely or partially, below or above a specified failure tolerance), the stack set is updated with your changes. Subsequent \[CreateStackInstances\] calls on the specified stack set use the updated stack set.

``` swift
public func updateStackSet(input: UpdateStackSetInput, completion: @escaping (ClientRuntime.SdkResult<UpdateStackSetOutputResponse, UpdateStackSetOutputError>) -> Void)
```

### `updateTerminationProtection(input:completion:)`

Updates termination protection for the specified stack. If a user attempts to delete a stack with termination protection enabled, the operation fails and the stack remains unchanged. For more information, see [Protecting a Stack From Being Deleted](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-protect-stacks.html) in the CloudFormation User Guide. For [nested stacks](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html), termination protection is set on the root stack and cannot be changed directly on the nested stack.

``` swift
public func updateTerminationProtection(input: UpdateTerminationProtectionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateTerminationProtectionOutputResponse, UpdateTerminationProtectionOutputError>) -> Void)
```

### `validateTemplate(input:completion:)`

Validates a specified template. CloudFormation first checks if the template is valid JSON. If it isn't, CloudFormation checks if the template is valid YAML. If both these checks fail, CloudFormation returns a template validation error.

``` swift
public func validateTemplate(input: ValidateTemplateInput, completion: @escaping (ClientRuntime.SdkResult<ValidateTemplateOutputResponse, ValidateTemplateOutputError>) -> Void)
```
