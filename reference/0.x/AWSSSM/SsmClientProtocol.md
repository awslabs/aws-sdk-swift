# SsmClientProtocol

Amazon Web Services Systems Manager is a collection of capabilities that helps you automate management tasks such as
collecting system inventory, applying operating system (OS) patches, automating the creation of
Amazon Machine Images (AMIs), and configuring operating systems (OSs) and applications at scale.
Systems Manager lets you remotely and securely manage the configuration of your managed instances. A
managed instance is any Amazon Elastic Compute Cloud instance (EC2 instance), or any
on-premises server or virtual machine (VM) in your hybrid environment that has been configured
for Systems Manager.
This reference is intended to be used with the <a href="https:​//docs.aws.amazon.com/systems-manager/latest/userguide/">Amazon Web Services Systems Manager User Guide.
To get started, verify prerequisites and configure managed instances. For more information,
see <a href="https:​//docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-setting-up.html">Setting up
Amazon Web Services Systems Manager in the Amazon Web Services Systems Manager User Guide.

<p class="title">
Related resources

``` swift
public protocol SsmClientProtocol 
```

``` 
           For information about how to use a Query API, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/making-api-requests.html">Making API requests.


           For information about other API operations you can perform on EC2 instances, see the
  <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/">Amazon EC2 API Reference.


           For information about AppConfig, a capability of Systems Manager, see the <a href="https://docs.aws.amazon.com/appconfig/latest/userguide/">AppConfig User Guide and the <a href="https://docs.aws.amazon.com/appconfig/2019-10-09/APIReference/">AppConfig API
 Reference.


           For information about Incident Manager, a capability of Systems Manager, see the <a href="https://docs.aws.amazon.com/incident-manager/latest/userguide/">Incident Manager User Guide
 and the <a href="https://docs.aws.amazon.com/incident-manager/latest/APIReference/">Incident Manager API
  Reference.
```

## Requirements

### addTagsToResource(input:​completion:​)

Adds or overwrites one or more tags for the specified resource. Tags are metadata that you
can assign to your documents, managed instances, maintenance windows, Parameter Store parameters,
and patch baselines. Tags enable you to categorize your resources in different ways, for example,
by purpose, owner, or environment. Each tag consists of a key and an optional value, both of
which you define. For example, you could define a set of tags for your account's managed
instances that helps you track each instance's owner and stack level. For example:​

``` swift
func addTagsToResource(input: AddTagsToResourceInput, completion: @escaping (ClientRuntime.SdkResult<AddTagsToResourceOutputResponse, AddTagsToResourceOutputError>) -> Void)
```

``` 
              Key=Owner,Value=DbAdmin




              Key=Owner,Value=SysAdmin




              Key=Owner,Value=Dev




              Key=Stack,Value=Production




              Key=Stack,Value=Pre-Production




              Key=Stack,Value=Test



     Each resource can have a maximum of 50 tags.
     We recommend that you devise a set of tag keys that meets your needs for each resource type.
```

Using a consistent set of tag keys makes it easier for you to manage your resources. You can
search and filter the resources based on the tags you add. Tags don't have any semantic meaning
to and are interpreted strictly as a string of characters.
For more information about using tags with Amazon Elastic Compute Cloud (Amazon EC2) instances, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging your Amazon EC2
resources in the Amazon EC2 User Guide.

### associateOpsItemRelatedItem(input:​completion:​)

Associates a related item to a Systems Manager OpsCenter OpsItem. For example, you can associate an
Incident Manager incident or analysis with an OpsItem. Incident Manager and OpsCenter are capabilities of
Amazon Web Services Systems Manager.

``` swift
func associateOpsItemRelatedItem(input: AssociateOpsItemRelatedItemInput, completion: @escaping (ClientRuntime.SdkResult<AssociateOpsItemRelatedItemOutputResponse, AssociateOpsItemRelatedItemOutputError>) -> Void)
```

### cancelCommand(input:​completion:​)

Attempts to cancel the command specified by the Command ID. There is no guarantee that the
command will be terminated and the underlying process stopped.

``` swift
func cancelCommand(input: CancelCommandInput, completion: @escaping (ClientRuntime.SdkResult<CancelCommandOutputResponse, CancelCommandOutputError>) -> Void)
```

### cancelMaintenanceWindowExecution(input:​completion:​)

Stops a maintenance window execution that is already in progress and cancels any tasks in
the window that haven't already starting running. Tasks already in progress will continue to
completion.

``` swift
func cancelMaintenanceWindowExecution(input: CancelMaintenanceWindowExecutionInput, completion: @escaping (ClientRuntime.SdkResult<CancelMaintenanceWindowExecutionOutputResponse, CancelMaintenanceWindowExecutionOutputError>) -> Void)
```

### createActivation(input:​completion:​)

Generates an activation code and activation ID you can use to register your on-premises
server or virtual machine (VM) with Amazon Web Services Systems Manager. Registering these machines with Systems Manager makes it
possible to manage them using Systems Manager capabilities. You use the activation code and ID when
installing SSM Agent on machines in your hybrid environment. For more information about
requirements for managing on-premises instances and VMs using Systems Manager, see <a href="https:​//docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-managedinstances.html">Setting up
Amazon Web Services Systems Manager for hybrid environments in the Amazon Web Services Systems Manager User Guide.

``` swift
func createActivation(input: CreateActivationInput, completion: @escaping (ClientRuntime.SdkResult<CreateActivationOutputResponse, CreateActivationOutputError>) -> Void)
```

``` 
        On-premises servers or VMs that are registered with Systems Manager and Amazon Elastic Compute Cloud (Amazon EC2) instances
that you manage with Systems Manager are all called managed instances.
```

### createAssociation(input:​completion:​)

A State Manager association defines the state that you want to maintain on your instances.
For example, an association can specify that anti-virus software must be installed and running on
your instances, or that certain ports must be closed. For static targets, the association
specifies a schedule for when the configuration is reapplied. For dynamic targets, such as an
Amazon Web Services resource group or an Amazon Web Services autoscaling group, State Manager, a capability of Amazon Web Services Systems Manager
applies the configuration when new instances are added to the group. The association also
specifies actions to take when applying the configuration. For example, an association for
anti-virus software might run once a day. If the software isn't installed, then State Manager
installs it. If the software is installed, but the service isn't running, then the association
might instruct State Manager to start the service.

``` swift
func createAssociation(input: CreateAssociationInput, completion: @escaping (ClientRuntime.SdkResult<CreateAssociationOutputResponse, CreateAssociationOutputError>) -> Void)
```

### createAssociationBatch(input:​completion:​)

Associates the specified Amazon Web Services Systems Manager document (SSM document) with the specified instances or
targets.
When you associate a document with one or more instances using instance IDs or tags,
Amazon Web Services Systems Manager Agent (SSM Agent) running on the instance processes the document and configures the
instance as specified.
If you associate a document with an instance that already has an associated document, the
system returns the AssociationAlreadyExists exception.

``` swift
func createAssociationBatch(input: CreateAssociationBatchInput, completion: @escaping (ClientRuntime.SdkResult<CreateAssociationBatchOutputResponse, CreateAssociationBatchOutputError>) -> Void)
```

### createDocument(input:​completion:​)

Creates a Amazon Web Services Systems Manager (SSM document). An SSM document defines the actions that Systems Manager performs
on your managed instances. For more information about SSM documents, including information about
supported schemas, features, and syntax, see <a href="https:​//docs.aws.amazon.com/systems-manager/latest/userguide/sysman-ssm-docs.html">Amazon Web Services Systems Manager Documents in the
Amazon Web Services Systems Manager User Guide.

``` swift
func createDocument(input: CreateDocumentInput, completion: @escaping (ClientRuntime.SdkResult<CreateDocumentOutputResponse, CreateDocumentOutputError>) -> Void)
```

### createMaintenanceWindow(input:​completion:​)

Creates a new maintenance window.

``` swift
func createMaintenanceWindow(input: CreateMaintenanceWindowInput, completion: @escaping (ClientRuntime.SdkResult<CreateMaintenanceWindowOutputResponse, CreateMaintenanceWindowOutputError>) -> Void)
```

``` 
        The value you specify for Duration determines the specific end time for the
maintenance window based on the time it begins. No maintenance window tasks are permitted to
start after the resulting endtime minus the number of hours you specify for Cutoff.
For example, if the maintenance window starts at 3 PM, the duration is three hours, and the
value you specify for Cutoff is one hour, no maintenance window tasks can start
after 5 PM.
```

### createOpsItem(input:​completion:​)

Creates a new OpsItem. You must have permission in Identity and Access Management (IAM) to create a new OpsItem. For more information, see <a href="https:​//docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html">Getting started with
OpsCenter in the Amazon Web Services Systems Manager User Guide.
Operations engineers and IT professionals use Amazon Web Services Systems Manager OpsCenter to view, investigate, and
remediate operational issues impacting the performance and health of their Amazon Web Services resources. For
more information, see <a href="https:​//docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">Amazon Web Services Systems Manager OpsCenter in the
Amazon Web Services Systems Manager User Guide.

``` swift
func createOpsItem(input: CreateOpsItemInput, completion: @escaping (ClientRuntime.SdkResult<CreateOpsItemOutputResponse, CreateOpsItemOutputError>) -> Void)
```

### createOpsMetadata(input:​completion:​)

If you create a new application in Application Manager, Amazon Web Services Systems Manager calls this API operation to specify
information about the new application, including the application type.

``` swift
func createOpsMetadata(input: CreateOpsMetadataInput, completion: @escaping (ClientRuntime.SdkResult<CreateOpsMetadataOutputResponse, CreateOpsMetadataOutputError>) -> Void)
```

### createPatchBaseline(input:​completion:​)

Creates a patch baseline.

``` swift
func createPatchBaseline(input: CreatePatchBaselineInput, completion: @escaping (ClientRuntime.SdkResult<CreatePatchBaselineOutputResponse, CreatePatchBaselineOutputError>) -> Void)
```

``` 
        For information about valid key-value pairs in PatchFilters for each supported
operating system type, see PatchFilter.
```

### createResourceDataSync(input:​completion:​)

A resource data sync helps you view data from multiple sources in a single location.
Amazon Web Services Systems Manager offers two types of resource data sync:​ SyncToDestination and
SyncFromSource.
You can configure Systems Manager Inventory to use the SyncToDestination type to
synchronize Inventory data from multiple Amazon Web Services Regions to a single Amazon Simple Storage Service (Amazon S3) bucket. For more information, see <a href="https:​//docs.aws.amazon.com/systems-manager/latest/userguide/sysman-inventory-datasync.html">Configuring resource data
sync for Inventory in the Amazon Web Services Systems Manager User Guide.
You can configure Systems Manager Explorer to use the SyncFromSource type to synchronize
operational work items (OpsItems) and operational data (OpsData) from multiple Amazon Web Services Regions to a
single Amazon S3 bucket. This type can synchronize OpsItems and OpsData from multiple
Amazon Web Services accounts and Amazon Web Services Regions or EntireOrganization by using Organizations. For more
information, see <a href="https:​//docs.aws.amazon.com/systems-manager/latest/userguide/Explorer-resource-data-sync.html">Setting up Systems Manager
Explorer to display data from multiple accounts and Regions in the
Amazon Web Services Systems Manager User Guide.
A resource data sync is an asynchronous operation that returns immediately. After a
successful initial sync is completed, the system continuously syncs data. To check the status of
a sync, use the ListResourceDataSync.

``` swift
func createResourceDataSync(input: CreateResourceDataSyncInput, completion: @escaping (ClientRuntime.SdkResult<CreateResourceDataSyncOutputResponse, CreateResourceDataSyncOutputError>) -> Void)
```

``` 
        By default, data isn't encrypted in Amazon S3. We strongly recommend that you
enable encryption in Amazon S3 to ensure secure data storage. We also recommend that you
secure access to the Amazon S3 bucket by creating a restrictive bucket policy.
```

### deleteActivation(input:​completion:​)

Deletes an activation. You aren't required to delete an activation. If you delete an
activation, you can no longer use it to register additional managed instances. Deleting an
activation doesn't de-register managed instances. You must manually de-register managed
instances.

``` swift
func deleteActivation(input: DeleteActivationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteActivationOutputResponse, DeleteActivationOutputError>) -> Void)
```

### deleteAssociation(input:​completion:​)

Disassociates the specified Amazon Web Services Systems Manager document (SSM document) from the specified instance.
If you created the association by using the Targets parameter, then you must delete
the association by using the association ID.
When you disassociate a document from an instance, it doesn't change the configuration of
the instance. To change the configuration state of an instance after you disassociate a document,
you must create a new document with the desired configuration and associate it with the
instance.

``` swift
func deleteAssociation(input: DeleteAssociationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAssociationOutputResponse, DeleteAssociationOutputError>) -> Void)
```

### deleteDocument(input:​completion:​)

Deletes the Amazon Web Services Systems Manager document (SSM document) and all instance associations to the
document.
Before you delete the document, we recommend that you use DeleteAssociation to disassociate all instances that are associated with the document.

``` swift
func deleteDocument(input: DeleteDocumentInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDocumentOutputResponse, DeleteDocumentOutputError>) -> Void)
```

### deleteInventory(input:​completion:​)

Delete a custom inventory type or the data associated with a custom Inventory type. Deleting
a custom inventory type is also referred to as deleting a custom inventory schema.

``` swift
func deleteInventory(input: DeleteInventoryInput, completion: @escaping (ClientRuntime.SdkResult<DeleteInventoryOutputResponse, DeleteInventoryOutputError>) -> Void)
```

### deleteMaintenanceWindow(input:​completion:​)

Deletes a maintenance window.

``` swift
func deleteMaintenanceWindow(input: DeleteMaintenanceWindowInput, completion: @escaping (ClientRuntime.SdkResult<DeleteMaintenanceWindowOutputResponse, DeleteMaintenanceWindowOutputError>) -> Void)
```

### deleteOpsMetadata(input:​completion:​)

Delete OpsMetadata related to an application.

``` swift
func deleteOpsMetadata(input: DeleteOpsMetadataInput, completion: @escaping (ClientRuntime.SdkResult<DeleteOpsMetadataOutputResponse, DeleteOpsMetadataOutputError>) -> Void)
```

### deleteParameter(input:​completion:​)

Delete a parameter from the system. After deleting a parameter, wait for at least 30 seconds
to create a parameter with the same name.

``` swift
func deleteParameter(input: DeleteParameterInput, completion: @escaping (ClientRuntime.SdkResult<DeleteParameterOutputResponse, DeleteParameterOutputError>) -> Void)
```

### deleteParameters(input:​completion:​)

Delete a list of parameters. After deleting a parameter, wait for at least 30 seconds to
create a parameter with the same name.

``` swift
func deleteParameters(input: DeleteParametersInput, completion: @escaping (ClientRuntime.SdkResult<DeleteParametersOutputResponse, DeleteParametersOutputError>) -> Void)
```

### deletePatchBaseline(input:​completion:​)

Deletes a patch baseline.

``` swift
func deletePatchBaseline(input: DeletePatchBaselineInput, completion: @escaping (ClientRuntime.SdkResult<DeletePatchBaselineOutputResponse, DeletePatchBaselineOutputError>) -> Void)
```

### deleteResourceDataSync(input:​completion:​)

Deletes a resource data sync configuration. After the configuration is deleted, changes to
data on managed instances are no longer synced to or from the target. Deleting a sync
configuration doesn't delete data.

``` swift
func deleteResourceDataSync(input: DeleteResourceDataSyncInput, completion: @escaping (ClientRuntime.SdkResult<DeleteResourceDataSyncOutputResponse, DeleteResourceDataSyncOutputError>) -> Void)
```

### deregisterManagedInstance(input:​completion:​)

Removes the server or virtual machine from the list of registered servers. You can
reregister the instance again at any time. If you don't plan to use Run Command on the server, we
suggest uninstalling SSM Agent first.

``` swift
func deregisterManagedInstance(input: DeregisterManagedInstanceInput, completion: @escaping (ClientRuntime.SdkResult<DeregisterManagedInstanceOutputResponse, DeregisterManagedInstanceOutputError>) -> Void)
```

### deregisterPatchBaselineForPatchGroup(input:​completion:​)

Removes a patch group from a patch baseline.

``` swift
func deregisterPatchBaselineForPatchGroup(input: DeregisterPatchBaselineForPatchGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeregisterPatchBaselineForPatchGroupOutputResponse, DeregisterPatchBaselineForPatchGroupOutputError>) -> Void)
```

### deregisterTargetFromMaintenanceWindow(input:​completion:​)

Removes a target from a maintenance window.

``` swift
func deregisterTargetFromMaintenanceWindow(input: DeregisterTargetFromMaintenanceWindowInput, completion: @escaping (ClientRuntime.SdkResult<DeregisterTargetFromMaintenanceWindowOutputResponse, DeregisterTargetFromMaintenanceWindowOutputError>) -> Void)
```

### deregisterTaskFromMaintenanceWindow(input:​completion:​)

Removes a task from a maintenance window.

``` swift
func deregisterTaskFromMaintenanceWindow(input: DeregisterTaskFromMaintenanceWindowInput, completion: @escaping (ClientRuntime.SdkResult<DeregisterTaskFromMaintenanceWindowOutputResponse, DeregisterTaskFromMaintenanceWindowOutputError>) -> Void)
```

### describeActivations(input:​completion:​)

Describes details about the activation, such as the date and time the activation was
created, its expiration date, the Identity and Access Management (IAM) role assigned to
the instances in the activation, and the number of instances registered by using this
activation.

``` swift
func describeActivations(input: DescribeActivationsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeActivationsOutputResponse, DescribeActivationsOutputError>) -> Void)
```

### describeAssociation(input:​completion:​)

Describes the association for the specified target or instance. If you created the
association by using the Targets parameter, then you must retrieve the association
by using the association ID.

``` swift
func describeAssociation(input: DescribeAssociationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAssociationOutputResponse, DescribeAssociationOutputError>) -> Void)
```

### describeAssociationExecutions(input:​completion:​)

Views all executions for a specific association ID.

``` swift
func describeAssociationExecutions(input: DescribeAssociationExecutionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAssociationExecutionsOutputResponse, DescribeAssociationExecutionsOutputError>) -> Void)
```

### describeAssociationExecutionTargets(input:​completion:​)

Views information about a specific execution of a specific association.

``` swift
func describeAssociationExecutionTargets(input: DescribeAssociationExecutionTargetsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAssociationExecutionTargetsOutputResponse, DescribeAssociationExecutionTargetsOutputError>) -> Void)
```

### describeAutomationExecutions(input:​completion:​)

Provides details about all active and terminated Automation executions.

``` swift
func describeAutomationExecutions(input: DescribeAutomationExecutionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAutomationExecutionsOutputResponse, DescribeAutomationExecutionsOutputError>) -> Void)
```

### describeAutomationStepExecutions(input:​completion:​)

Information about all active and terminated step executions in an Automation
workflow.

``` swift
func describeAutomationStepExecutions(input: DescribeAutomationStepExecutionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAutomationStepExecutionsOutputResponse, DescribeAutomationStepExecutionsOutputError>) -> Void)
```

### describeAvailablePatches(input:​completion:​)

Lists all patches eligible to be included in a patch baseline.

``` swift
func describeAvailablePatches(input: DescribeAvailablePatchesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAvailablePatchesOutputResponse, DescribeAvailablePatchesOutputError>) -> Void)
```

### describeDocument(input:​completion:​)

Describes the specified Amazon Web Services Systems Manager document (SSM document).

``` swift
func describeDocument(input: DescribeDocumentInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDocumentOutputResponse, DescribeDocumentOutputError>) -> Void)
```

### describeDocumentPermission(input:​completion:​)

Describes the permissions for a Amazon Web Services Systems Manager document (SSM document). If you created the
document, you are the owner. If a document is shared, it can either be shared privately (by
specifying a user's Amazon Web Services account ID) or publicly (All).

``` swift
func describeDocumentPermission(input: DescribeDocumentPermissionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDocumentPermissionOutputResponse, DescribeDocumentPermissionOutputError>) -> Void)
```

### describeEffectiveInstanceAssociations(input:​completion:​)

All associations for the instance(s).

``` swift
func describeEffectiveInstanceAssociations(input: DescribeEffectiveInstanceAssociationsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEffectiveInstanceAssociationsOutputResponse, DescribeEffectiveInstanceAssociationsOutputError>) -> Void)
```

### describeEffectivePatchesForPatchBaseline(input:​completion:​)

Retrieves the current effective patches (the patch and the approval state) for the specified
patch baseline. Applies to patch baselines for Windows only.

``` swift
func describeEffectivePatchesForPatchBaseline(input: DescribeEffectivePatchesForPatchBaselineInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEffectivePatchesForPatchBaselineOutputResponse, DescribeEffectivePatchesForPatchBaselineOutputError>) -> Void)
```

### describeInstanceAssociationsStatus(input:​completion:​)

The status of the associations for the instance(s).

``` swift
func describeInstanceAssociationsStatus(input: DescribeInstanceAssociationsStatusInput, completion: @escaping (ClientRuntime.SdkResult<DescribeInstanceAssociationsStatusOutputResponse, DescribeInstanceAssociationsStatusOutputError>) -> Void)
```

### describeInstanceInformation(input:​completion:​)

Describes one or more of your instances, including information about the operating system
platform, the version of SSM Agent installed on the instance, instance status, and so on.
If you specify one or more instance IDs, it returns information for those instances. If you
don't specify instance IDs, it returns information for all your instances. If you specify an
instance ID that isn't valid or an instance that you don't own, you receive an error.

``` swift
func describeInstanceInformation(input: DescribeInstanceInformationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeInstanceInformationOutputResponse, DescribeInstanceInformationOutputError>) -> Void)
```

``` 
        The IamRole field for this API operation is the Identity and Access Management
 (IAM) role assigned to on-premises instances. This call doesn't return the
 IAM role for EC2 instances.
```

### describeInstancePatches(input:​completion:​)

Retrieves information about the patches on the specified instance and their state relative
to the patch baseline being used for the instance.

``` swift
func describeInstancePatches(input: DescribeInstancePatchesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeInstancePatchesOutputResponse, DescribeInstancePatchesOutputError>) -> Void)
```

### describeInstancePatchStates(input:​completion:​)

Retrieves the high-level patch state of one or more instances.

``` swift
func describeInstancePatchStates(input: DescribeInstancePatchStatesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeInstancePatchStatesOutputResponse, DescribeInstancePatchStatesOutputError>) -> Void)
```

### describeInstancePatchStatesForPatchGroup(input:​completion:​)

Retrieves the high-level patch state for the instances in the specified patch group.

``` swift
func describeInstancePatchStatesForPatchGroup(input: DescribeInstancePatchStatesForPatchGroupInput, completion: @escaping (ClientRuntime.SdkResult<DescribeInstancePatchStatesForPatchGroupOutputResponse, DescribeInstancePatchStatesForPatchGroupOutputError>) -> Void)
```

### describeInventoryDeletions(input:​completion:​)

Describes a specific delete inventory operation.

``` swift
func describeInventoryDeletions(input: DescribeInventoryDeletionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeInventoryDeletionsOutputResponse, DescribeInventoryDeletionsOutputError>) -> Void)
```

### describeMaintenanceWindowExecutions(input:​completion:​)

Lists the executions of a maintenance window. This includes information about when the
maintenance window was scheduled to be active, and information about tasks registered and run
with the maintenance window.

``` swift
func describeMaintenanceWindowExecutions(input: DescribeMaintenanceWindowExecutionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeMaintenanceWindowExecutionsOutputResponse, DescribeMaintenanceWindowExecutionsOutputError>) -> Void)
```

### describeMaintenanceWindowExecutionTaskInvocations(input:​completion:​)

Retrieves the individual task executions (one per target) for a particular task run as part
of a maintenance window execution.

``` swift
func describeMaintenanceWindowExecutionTaskInvocations(input: DescribeMaintenanceWindowExecutionTaskInvocationsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeMaintenanceWindowExecutionTaskInvocationsOutputResponse, DescribeMaintenanceWindowExecutionTaskInvocationsOutputError>) -> Void)
```

### describeMaintenanceWindowExecutionTasks(input:​completion:​)

For a given maintenance window execution, lists the tasks that were run.

``` swift
func describeMaintenanceWindowExecutionTasks(input: DescribeMaintenanceWindowExecutionTasksInput, completion: @escaping (ClientRuntime.SdkResult<DescribeMaintenanceWindowExecutionTasksOutputResponse, DescribeMaintenanceWindowExecutionTasksOutputError>) -> Void)
```

### describeMaintenanceWindows(input:​completion:​)

Retrieves the maintenance windows in an Amazon Web Services account.

``` swift
func describeMaintenanceWindows(input: DescribeMaintenanceWindowsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeMaintenanceWindowsOutputResponse, DescribeMaintenanceWindowsOutputError>) -> Void)
```

### describeMaintenanceWindowSchedule(input:​completion:​)

Retrieves information about upcoming executions of a maintenance window.

``` swift
func describeMaintenanceWindowSchedule(input: DescribeMaintenanceWindowScheduleInput, completion: @escaping (ClientRuntime.SdkResult<DescribeMaintenanceWindowScheduleOutputResponse, DescribeMaintenanceWindowScheduleOutputError>) -> Void)
```

### describeMaintenanceWindowsForTarget(input:​completion:​)

Retrieves information about the maintenance window targets or tasks that an instance is
associated with.

``` swift
func describeMaintenanceWindowsForTarget(input: DescribeMaintenanceWindowsForTargetInput, completion: @escaping (ClientRuntime.SdkResult<DescribeMaintenanceWindowsForTargetOutputResponse, DescribeMaintenanceWindowsForTargetOutputError>) -> Void)
```

### describeMaintenanceWindowTargets(input:​completion:​)

Lists the targets registered with the maintenance window.

``` swift
func describeMaintenanceWindowTargets(input: DescribeMaintenanceWindowTargetsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeMaintenanceWindowTargetsOutputResponse, DescribeMaintenanceWindowTargetsOutputError>) -> Void)
```

### describeMaintenanceWindowTasks(input:​completion:​)

Lists the tasks in a maintenance window.

``` swift
func describeMaintenanceWindowTasks(input: DescribeMaintenanceWindowTasksInput, completion: @escaping (ClientRuntime.SdkResult<DescribeMaintenanceWindowTasksOutputResponse, DescribeMaintenanceWindowTasksOutputError>) -> Void)
```

``` 
        For maintenance window tasks without a specified target, you can't supply values for
 --max-errors and --max-concurrency. Instead, the system inserts a
placeholder value of 1, which may be reported in the response to this command.
These values don't affect the running of your task and can be ignored.
```

### describeOpsItems(input:​completion:​)

Query a set of OpsItems. You must have permission in Identity and Access Management (IAM) to query a list of OpsItems. For more information, see <a href="https:​//docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html">Getting started with
OpsCenter in the Amazon Web Services Systems Manager User Guide.
Operations engineers and IT professionals use Amazon Web Services Systems Manager OpsCenter to view, investigate, and
remediate operational issues impacting the performance and health of their Amazon Web Services resources. For
more information, see <a href="https:​//docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">OpsCenter in the
Amazon Web Services Systems Manager User Guide.

``` swift
func describeOpsItems(input: DescribeOpsItemsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeOpsItemsOutputResponse, DescribeOpsItemsOutputError>) -> Void)
```

### describeParameters(input:​completion:​)

Get information about a parameter.
Request results are returned on a best-effort basis. If you specify MaxResults
in the request, the response includes information up to the limit specified. The number of items
returned, however, can be between zero and the value of MaxResults. If the service
reaches an internal limit while processing the results, it stops the operation and returns the
matching values up to that point and a NextToken. You can specify the
NextToken in a subsequent call to get the next set of results.

``` swift
func describeParameters(input: DescribeParametersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeParametersOutputResponse, DescribeParametersOutputError>) -> Void)
```

``` 
        If you change the KMS key alias for the KMS key used to encrypt a parameter, then you must
also update the key alias the parameter uses to reference KMS. Otherwise,
 DescribeParameters retrieves whatever the original key alias was
referencing.
```

### describePatchBaselines(input:​completion:​)

Lists the patch baselines in your Amazon Web Services account.

``` swift
func describePatchBaselines(input: DescribePatchBaselinesInput, completion: @escaping (ClientRuntime.SdkResult<DescribePatchBaselinesOutputResponse, DescribePatchBaselinesOutputError>) -> Void)
```

### describePatchGroups(input:​completion:​)

Lists all patch groups that have been registered with patch baselines.

``` swift
func describePatchGroups(input: DescribePatchGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribePatchGroupsOutputResponse, DescribePatchGroupsOutputError>) -> Void)
```

### describePatchGroupState(input:​completion:​)

Returns high-level aggregated patch compliance state information for a patch group.

``` swift
func describePatchGroupState(input: DescribePatchGroupStateInput, completion: @escaping (ClientRuntime.SdkResult<DescribePatchGroupStateOutputResponse, DescribePatchGroupStateOutputError>) -> Void)
```

### describePatchProperties(input:​completion:​)

Lists the properties of available patches organized by product, product family,
classification, severity, and other properties of available patches. You can use the reported
properties in the filters you specify in requests for operations such as CreatePatchBaseline, UpdatePatchBaseline, DescribeAvailablePatches, and DescribePatchBaselines.
The following section lists the properties that can be used in filters for each major
operating system type:​

``` swift
func describePatchProperties(input: DescribePatchPropertiesInput, completion: @escaping (ClientRuntime.SdkResult<DescribePatchPropertiesOutputResponse, DescribePatchPropertiesOutputError>) -> Void)
```

``` 
        AMAZON_LINUX

           Valid properties: PRODUCT | CLASSIFICATION |
   SEVERITY


        AMAZON_LINUX_2

           Valid properties: PRODUCT | CLASSIFICATION |
   SEVERITY


        CENTOS

           Valid properties: PRODUCT | CLASSIFICATION |
   SEVERITY


        DEBIAN

           Valid properties: PRODUCT | PRIORITY


        MACOS

           Valid properties: PRODUCT | CLASSIFICATION


        ORACLE_LINUX

           Valid properties: PRODUCT | CLASSIFICATION |
   SEVERITY


        REDHAT_ENTERPRISE_LINUX

           Valid properties: PRODUCT | CLASSIFICATION |
   SEVERITY


        SUSE

           Valid properties: PRODUCT | CLASSIFICATION |
   SEVERITY


        UBUNTU

           Valid properties: PRODUCT | PRIORITY


        WINDOWS

           Valid properties: PRODUCT | PRODUCT_FAMILY |
   CLASSIFICATION | MSRC_SEVERITY
```

### describeSessions(input:​completion:​)

Retrieves a list of all active sessions (both connected and disconnected) or terminated
sessions from the past 30 days.

``` swift
func describeSessions(input: DescribeSessionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSessionsOutputResponse, DescribeSessionsOutputError>) -> Void)
```

### disassociateOpsItemRelatedItem(input:​completion:​)

Deletes the association between an OpsItem and a related item. For example, this API
operation can delete an Incident Manager incident from an OpsItem. Incident Manager is a capability of
Amazon Web Services Systems Manager.

``` swift
func disassociateOpsItemRelatedItem(input: DisassociateOpsItemRelatedItemInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateOpsItemRelatedItemOutputResponse, DisassociateOpsItemRelatedItemOutputError>) -> Void)
```

### getAutomationExecution(input:​completion:​)

Get detailed information about a particular Automation execution.

``` swift
func getAutomationExecution(input: GetAutomationExecutionInput, completion: @escaping (ClientRuntime.SdkResult<GetAutomationExecutionOutputResponse, GetAutomationExecutionOutputError>) -> Void)
```

### getCalendarState(input:​completion:​)

Gets the state of a Amazon Web Services Systems Manager change calendar at the current time or a specified time. If
you specify a time, GetCalendarState returns the state of the calendar at that
specific time, and returns the next time that the change calendar state will transition. If you
don't specify a time, GetCalendarState uses the current time. Change Calendar
entries have two possible states:​ OPEN or CLOSED.
If you specify more than one calendar in a request, the command returns the status of
OPEN only if all calendars in the request are open. If one or more calendars in the
request are closed, the status returned is CLOSED.
For more information about Change Calendar, a capability of Amazon Web Services Systems Manager, see <a href="https:​//docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-change-calendar.html">Amazon Web Services Systems Manager Change Calendar in the Amazon Web Services Systems Manager User Guide.

``` swift
func getCalendarState(input: GetCalendarStateInput, completion: @escaping (ClientRuntime.SdkResult<GetCalendarStateOutputResponse, GetCalendarStateOutputError>) -> Void)
```

### getCommandInvocation(input:​completion:​)

Returns detailed information about command execution for an invocation or plugin.

``` swift
func getCommandInvocation(input: GetCommandInvocationInput, completion: @escaping (ClientRuntime.SdkResult<GetCommandInvocationOutputResponse, GetCommandInvocationOutputError>) -> Void)
```

``` 
        GetCommandInvocation only gives the execution status of a plugin in a document.
```

To get the command execution status on a specific instance, use ListCommandInvocations. To get the command execution status across instances, use
ListCommands.

### getConnectionStatus(input:​completion:​)

Retrieves the Session Manager connection status for an instance to determine whether it is running and
ready to receive Session Manager connections.

``` swift
func getConnectionStatus(input: GetConnectionStatusInput, completion: @escaping (ClientRuntime.SdkResult<GetConnectionStatusOutputResponse, GetConnectionStatusOutputError>) -> Void)
```

### getDefaultPatchBaseline(input:​completion:​)

Retrieves the default patch baseline. Amazon Web Services Systems Manager supports creating multiple default patch
baselines. For example, you can create a default patch baseline for each operating system.
If you don't specify an operating system value, the default patch baseline for Windows is
returned.

``` swift
func getDefaultPatchBaseline(input: GetDefaultPatchBaselineInput, completion: @escaping (ClientRuntime.SdkResult<GetDefaultPatchBaselineOutputResponse, GetDefaultPatchBaselineOutputError>) -> Void)
```

### getDeployablePatchSnapshotForInstance(input:​completion:​)

Retrieves the current snapshot for the patch baseline the instance uses. This API is
primarily used by the AWS-RunPatchBaseline Systems Manager document (SSM document).

``` swift
func getDeployablePatchSnapshotForInstance(input: GetDeployablePatchSnapshotForInstanceInput, completion: @escaping (ClientRuntime.SdkResult<GetDeployablePatchSnapshotForInstanceOutputResponse, GetDeployablePatchSnapshotForInstanceOutputError>) -> Void)
```

``` 
        If you run the command locally, such as with the Command Line Interface (CLI), the system attempts to use your local Amazon Web Services credentials and the operation fails. To avoid
this, you can run the command in the Amazon Web Services Systems Manager console. Use Run Command, a capability of
Amazon Web Services Systems Manager, with an SSM document that enables you to target an instance with a script or command.
For example, run the command using the AWS-RunShellScript document or the
 AWS-RunPowerShellScript document.
```

### getDocument(input:​completion:​)

Gets the contents of the specified Amazon Web Services Systems Manager document (SSM document).

``` swift
func getDocument(input: GetDocumentInput, completion: @escaping (ClientRuntime.SdkResult<GetDocumentOutputResponse, GetDocumentOutputError>) -> Void)
```

### getInventory(input:​completion:​)

Query inventory information. This includes instance status, such as Stopped or
Terminated.

``` swift
func getInventory(input: GetInventoryInput, completion: @escaping (ClientRuntime.SdkResult<GetInventoryOutputResponse, GetInventoryOutputError>) -> Void)
```

### getInventorySchema(input:​completion:​)

Return a list of inventory type names for the account, or return a list of attribute names
for a specific Inventory item type.

``` swift
func getInventorySchema(input: GetInventorySchemaInput, completion: @escaping (ClientRuntime.SdkResult<GetInventorySchemaOutputResponse, GetInventorySchemaOutputError>) -> Void)
```

### getMaintenanceWindow(input:​completion:​)

Retrieves a maintenance window.

``` swift
func getMaintenanceWindow(input: GetMaintenanceWindowInput, completion: @escaping (ClientRuntime.SdkResult<GetMaintenanceWindowOutputResponse, GetMaintenanceWindowOutputError>) -> Void)
```

### getMaintenanceWindowExecution(input:​completion:​)

Retrieves details about a specific a maintenance window execution.

``` swift
func getMaintenanceWindowExecution(input: GetMaintenanceWindowExecutionInput, completion: @escaping (ClientRuntime.SdkResult<GetMaintenanceWindowExecutionOutputResponse, GetMaintenanceWindowExecutionOutputError>) -> Void)
```

### getMaintenanceWindowExecutionTask(input:​completion:​)

Retrieves the details about a specific task run as part of a maintenance window
execution.

``` swift
func getMaintenanceWindowExecutionTask(input: GetMaintenanceWindowExecutionTaskInput, completion: @escaping (ClientRuntime.SdkResult<GetMaintenanceWindowExecutionTaskOutputResponse, GetMaintenanceWindowExecutionTaskOutputError>) -> Void)
```

### getMaintenanceWindowExecutionTaskInvocation(input:​completion:​)

Retrieves information about a specific task running on a specific target.

``` swift
func getMaintenanceWindowExecutionTaskInvocation(input: GetMaintenanceWindowExecutionTaskInvocationInput, completion: @escaping (ClientRuntime.SdkResult<GetMaintenanceWindowExecutionTaskInvocationOutputResponse, GetMaintenanceWindowExecutionTaskInvocationOutputError>) -> Void)
```

### getMaintenanceWindowTask(input:​completion:​)

Lists the tasks in a maintenance window.

``` swift
func getMaintenanceWindowTask(input: GetMaintenanceWindowTaskInput, completion: @escaping (ClientRuntime.SdkResult<GetMaintenanceWindowTaskOutputResponse, GetMaintenanceWindowTaskOutputError>) -> Void)
```

``` 
        For maintenance window tasks without a specified target, you can't supply values for
 --max-errors and --max-concurrency. Instead, the system inserts a
placeholder value of 1, which may be reported in the response to this command.
These values don't affect the running of your task and can be ignored.
```

### getOpsItem(input:​completion:​)

Get information about an OpsItem by using the ID. You must have permission in Identity and Access Management (IAM) to view information about an OpsItem. For more information,
see <a href="https:​//docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html">Getting started with
OpsCenter in the Amazon Web Services Systems Manager User Guide.
Operations engineers and IT professionals use Amazon Web Services Systems Manager OpsCenter to view, investigate, and
remediate operational issues impacting the performance and health of their Amazon Web Services resources. For
more information, see <a href="https:​//docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">OpsCenter in the
Amazon Web Services Systems Manager User Guide.

``` swift
func getOpsItem(input: GetOpsItemInput, completion: @escaping (ClientRuntime.SdkResult<GetOpsItemOutputResponse, GetOpsItemOutputError>) -> Void)
```

### getOpsMetadata(input:​completion:​)

View operational metadata related to an application in Application Manager.

``` swift
func getOpsMetadata(input: GetOpsMetadataInput, completion: @escaping (ClientRuntime.SdkResult<GetOpsMetadataOutputResponse, GetOpsMetadataOutputError>) -> Void)
```

### getOpsSummary(input:​completion:​)

View a summary of operations metadata (OpsData) based on specified filters and aggregators.
OpsData can include information about Amazon Web Services Systems Manager OpsCenter operational workitems (OpsItems) as
well as information about any Amazon Web Services resource or service configured to report OpsData to Amazon Web Services Systems Manager
Explorer.

``` swift
func getOpsSummary(input: GetOpsSummaryInput, completion: @escaping (ClientRuntime.SdkResult<GetOpsSummaryOutputResponse, GetOpsSummaryOutputError>) -> Void)
```

### getParameter(input:​completion:​)

Get information about a single parameter by specifying the parameter name.

``` swift
func getParameter(input: GetParameterInput, completion: @escaping (ClientRuntime.SdkResult<GetParameterOutputResponse, GetParameterOutputError>) -> Void)
```

``` 
        To get information about more than one parameter at a time, use the GetParameters operation.
```

### getParameterHistory(input:​completion:​)

Retrieves the history of all changes to a parameter.

``` swift
func getParameterHistory(input: GetParameterHistoryInput, completion: @escaping (ClientRuntime.SdkResult<GetParameterHistoryOutputResponse, GetParameterHistoryOutputError>) -> Void)
```

``` 
        If you change the KMS key alias for the KMS key used to encrypt a parameter, then you must
also update the key alias the parameter uses to reference KMS. Otherwise,
 GetParameterHistory retrieves whatever the original key alias was
referencing.
```

### getParameters(input:​completion:​)

Get information about one or more parameters by specifying multiple parameter names.

``` swift
func getParameters(input: GetParametersInput, completion: @escaping (ClientRuntime.SdkResult<GetParametersOutputResponse, GetParametersOutputError>) -> Void)
```

``` 
        To get information about a single parameter, you can use the GetParameter
operation instead.
```

### getParametersByPath(input:​completion:​)

Retrieve information about one or more parameters in a specific hierarchy.
Request results are returned on a best-effort basis. If you specify MaxResults
in the request, the response includes information up to the limit specified. The number of items
returned, however, can be between zero and the value of MaxResults. If the service
reaches an internal limit while processing the results, it stops the operation and returns the
matching values up to that point and a NextToken. You can specify the
NextToken in a subsequent call to get the next set of results.

``` swift
func getParametersByPath(input: GetParametersByPathInput, completion: @escaping (ClientRuntime.SdkResult<GetParametersByPathOutputResponse, GetParametersByPathOutputError>) -> Void)
```

### getPatchBaseline(input:​completion:​)

Retrieves information about a patch baseline.

``` swift
func getPatchBaseline(input: GetPatchBaselineInput, completion: @escaping (ClientRuntime.SdkResult<GetPatchBaselineOutputResponse, GetPatchBaselineOutputError>) -> Void)
```

### getPatchBaselineForPatchGroup(input:​completion:​)

Retrieves the patch baseline that should be used for the specified patch group.

``` swift
func getPatchBaselineForPatchGroup(input: GetPatchBaselineForPatchGroupInput, completion: @escaping (ClientRuntime.SdkResult<GetPatchBaselineForPatchGroupOutputResponse, GetPatchBaselineForPatchGroupOutputError>) -> Void)
```

### getServiceSetting(input:​completion:​)

defines how a user interacts with or uses a service or a feature of a service. For example, if an
Amazon Web Services service charges money to the account based on feature or service usage, then the Amazon Web Services
service team might create a default setting of false. This means the user can't use
this feature unless they change the setting to true and intentionally opt in for a
paid feature.
Services map a SettingId object to a setting value. Amazon Web Services services teams define
the default value for a SettingId. You can't create a new SettingId,
but you can overwrite the default value if you have the ssm:​UpdateServiceSetting
permission for the setting. Use the UpdateServiceSetting API operation to
change the default setting. Or use the ResetServiceSetting to change the value
back to the original value defined by the Amazon Web Services service team.
Query the current service setting for the Amazon Web Services account.

``` swift
func getServiceSetting(input: GetServiceSettingInput, completion: @escaping (ClientRuntime.SdkResult<GetServiceSettingOutputResponse, GetServiceSettingOutputError>) -> Void)
```

``` 
     ServiceSetting is an account-level setting for an Amazon Web Services service. This setting
```

### labelParameterVersion(input:​completion:​)

A parameter label is a user-defined alias to help you manage different versions of a
parameter. When you modify a parameter, Amazon Web Services Systems Manager automatically saves a new version and
increments the version number by one. A label can help you remember the purpose of a parameter
when there are multiple versions.
Parameter labels have the following requirements and restrictions.

``` swift
func labelParameterVersion(input: LabelParameterVersionInput, completion: @escaping (ClientRuntime.SdkResult<LabelParameterVersionOutputResponse, LabelParameterVersionOutputError>) -> Void)
```

``` 
           A version of a parameter can have a maximum of 10 labels.


           You can't attach the same label to different versions of the same parameter. For example,
 if version 1 has the label Production, then you can't attach Production to version 2.


           You can move a label from one version of a parameter to another.


           You can't create a label when you create a new parameter. You must attach a label to a
 specific version of a parameter.


           If you no longer want to use a parameter label, then you can either delete it or move it
 to a different version of a parameter.


           A label can have a maximum of 100 characters.


           Labels can contain letters (case sensitive), numbers, periods (.), hyphens (-), or
 underscores (_).


           Labels can't begin with a number, "aws" or "ssm" (not case
 sensitive). If a label fails to meet these requirements, then the label isn't associated with a
 parameter and the system displays it in the list of InvalidLabels.
```

### listAssociations(input:​completion:​)

Returns all State Manager associations in the current Amazon Web Services account and Amazon Web Services Region. You
can limit the results to a specific State Manager association document or instance by specifying
a filter. State Manager is a capability of Amazon Web Services Systems Manager.

``` swift
func listAssociations(input: ListAssociationsInput, completion: @escaping (ClientRuntime.SdkResult<ListAssociationsOutputResponse, ListAssociationsOutputError>) -> Void)
```

### listAssociationVersions(input:​completion:​)

Retrieves all versions of an association for a specific association ID.

``` swift
func listAssociationVersions(input: ListAssociationVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListAssociationVersionsOutputResponse, ListAssociationVersionsOutputError>) -> Void)
```

### listCommandInvocations(input:​completion:​)

An invocation is copy of a command sent to a specific instance. A command can apply to one
or more instances. A command invocation applies to one instance. For example, if a user runs
SendCommand against three instances, then a command invocation is created for each
requested instance ID. ListCommandInvocations provide status about command
execution.

``` swift
func listCommandInvocations(input: ListCommandInvocationsInput, completion: @escaping (ClientRuntime.SdkResult<ListCommandInvocationsOutputResponse, ListCommandInvocationsOutputError>) -> Void)
```

### listCommands(input:​completion:​)

Lists the commands requested by users of the Amazon Web Services account.

``` swift
func listCommands(input: ListCommandsInput, completion: @escaping (ClientRuntime.SdkResult<ListCommandsOutputResponse, ListCommandsOutputError>) -> Void)
```

### listComplianceItems(input:​completion:​)

For a specified resource ID, this API operation returns a list of compliance statuses for
different resource types. Currently, you can only specify one resource ID per call. List results
depend on the criteria specified in the filter.

``` swift
func listComplianceItems(input: ListComplianceItemsInput, completion: @escaping (ClientRuntime.SdkResult<ListComplianceItemsOutputResponse, ListComplianceItemsOutputError>) -> Void)
```

### listComplianceSummaries(input:​completion:​)

Returns a summary count of compliant and non-compliant resources for a compliance type. For
example, this call can return State Manager associations, patches, or custom compliance types
according to the filter criteria that you specify.

``` swift
func listComplianceSummaries(input: ListComplianceSummariesInput, completion: @escaping (ClientRuntime.SdkResult<ListComplianceSummariesOutputResponse, ListComplianceSummariesOutputError>) -> Void)
```

### listDocumentMetadataHistory(input:​completion:​)

Information about approval reviews for a version of a change template in Change Manager.

``` swift
func listDocumentMetadataHistory(input: ListDocumentMetadataHistoryInput, completion: @escaping (ClientRuntime.SdkResult<ListDocumentMetadataHistoryOutputResponse, ListDocumentMetadataHistoryOutputError>) -> Void)
```

### listDocuments(input:​completion:​)

Returns all Systems Manager (SSM) documents in the current Amazon Web Services account and Amazon Web Services Region. You can
limit the results of this request by using a filter.

``` swift
func listDocuments(input: ListDocumentsInput, completion: @escaping (ClientRuntime.SdkResult<ListDocumentsOutputResponse, ListDocumentsOutputError>) -> Void)
```

### listDocumentVersions(input:​completion:​)

List all versions for a document.

``` swift
func listDocumentVersions(input: ListDocumentVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListDocumentVersionsOutputResponse, ListDocumentVersionsOutputError>) -> Void)
```

### listInventoryEntries(input:​completion:​)

A list of inventory items returned by the request.

``` swift
func listInventoryEntries(input: ListInventoryEntriesInput, completion: @escaping (ClientRuntime.SdkResult<ListInventoryEntriesOutputResponse, ListInventoryEntriesOutputError>) -> Void)
```

### listOpsItemEvents(input:​completion:​)

Returns a list of all OpsItem events in the current Amazon Web Services Region and Amazon Web Services account. You can
limit the results to events associated with specific OpsItems by specifying a filter.

``` swift
func listOpsItemEvents(input: ListOpsItemEventsInput, completion: @escaping (ClientRuntime.SdkResult<ListOpsItemEventsOutputResponse, ListOpsItemEventsOutputError>) -> Void)
```

### listOpsItemRelatedItems(input:​completion:​)

Lists all related-item resources associated with a Systems Manager OpsCenter OpsItem. OpsCenter is a
capability of Amazon Web Services Systems Manager.

``` swift
func listOpsItemRelatedItems(input: ListOpsItemRelatedItemsInput, completion: @escaping (ClientRuntime.SdkResult<ListOpsItemRelatedItemsOutputResponse, ListOpsItemRelatedItemsOutputError>) -> Void)
```

### listOpsMetadata(input:​completion:​)

Amazon Web Services Systems Manager calls this API operation when displaying all Application Manager OpsMetadata objects or
blobs.

``` swift
func listOpsMetadata(input: ListOpsMetadataInput, completion: @escaping (ClientRuntime.SdkResult<ListOpsMetadataOutputResponse, ListOpsMetadataOutputError>) -> Void)
```

### listResourceComplianceSummaries(input:​completion:​)

Returns a resource-level summary count. The summary includes information about compliant and
non-compliant statuses and detailed compliance-item severity counts, according to the filter
criteria you specify.

``` swift
func listResourceComplianceSummaries(input: ListResourceComplianceSummariesInput, completion: @escaping (ClientRuntime.SdkResult<ListResourceComplianceSummariesOutputResponse, ListResourceComplianceSummariesOutputError>) -> Void)
```

### listResourceDataSync(input:​completion:​)

Lists your resource data sync configurations. Includes information about the last time a
sync attempted to start, the last sync status, and the last time a sync successfully
completed.
The number of sync configurations might be too large to return using a single call to
ListResourceDataSync. You can limit the number of sync configurations returned by
using the MaxResults parameter. To determine whether there are more sync
configurations to list, check the value of NextToken in the output. If there are
more sync configurations to list, you can request them by specifying the NextToken
returned in the call to the parameter of a subsequent call.

``` swift
func listResourceDataSync(input: ListResourceDataSyncInput, completion: @escaping (ClientRuntime.SdkResult<ListResourceDataSyncOutputResponse, ListResourceDataSyncOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

Returns a list of the tags assigned to the specified resource.
For information about the ID format for each supported resource type, see AddTagsToResource.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### modifyDocumentPermission(input:​completion:​)

Shares a Amazon Web Services Systems Manager document (SSM document)publicly or privately. If you share a document
privately, you must specify the Amazon Web Services user account IDs for those people who can use the
document. If you share a document publicly, you must specify All as the
account ID.

``` swift
func modifyDocumentPermission(input: ModifyDocumentPermissionInput, completion: @escaping (ClientRuntime.SdkResult<ModifyDocumentPermissionOutputResponse, ModifyDocumentPermissionOutputError>) -> Void)
```

### putComplianceItems(input:​completion:​)

Registers a compliance type and other compliance details on a designated resource. This
operation lets you register custom compliance details with a resource. This call overwrites
existing compliance information on the resource, so you must provide a full list of compliance
items each time that you send the request.
ComplianceType can be one of the following:​

``` swift
func putComplianceItems(input: PutComplianceItemsInput, completion: @escaping (ClientRuntime.SdkResult<PutComplianceItemsOutputResponse, PutComplianceItemsOutputError>) -> Void)
```

``` 
           ExecutionId: The execution ID when the patch, association, or custom compliance item was
 applied.


           ExecutionType: Specify patch, association, or Custom:string.


           ExecutionTime. The time the patch, association, or custom compliance item was applied to
 the instance.


           Id: The patch, association, or custom compliance ID.


           Title: A title.


           Status: The status of the compliance item. For example, approved for patches,
 or Failed for associations.


           Severity: A patch severity. For example, critical.


           DocumentName: An SSM document name. For example, AWS-RunPatchBaseline.


           DocumentVersion: An SSM document version number. For example, 4.


           Classification: A patch classification. For example, security updates.


           PatchBaselineId: A patch baseline ID.


           PatchSeverity: A patch severity. For example, Critical.


           PatchState: A patch state. For example, InstancesWithFailedPatches.


           PatchGroup: The name of a patch group.


           InstalledTime: The time the association, patch, or custom compliance item was applied to
 the resource. Specify the time by using the following format: yyyy-MM-dd'T'HH:mm:ss'Z'
```

### putInventory(input:​completion:​)

Bulk update custom inventory items on one more instance. The request adds an inventory item,
if it doesn't already exist, or updates an inventory item, if it does exist.

``` swift
func putInventory(input: PutInventoryInput, completion: @escaping (ClientRuntime.SdkResult<PutInventoryOutputResponse, PutInventoryOutputError>) -> Void)
```

### putParameter(input:​completion:​)

Add a parameter to the system.

``` swift
func putParameter(input: PutParameterInput, completion: @escaping (ClientRuntime.SdkResult<PutParameterOutputResponse, PutParameterOutputError>) -> Void)
```

### registerDefaultPatchBaseline(input:​completion:​)

Defines the default patch baseline for the relevant operating system.
To reset the Amazon Web Services-predefined patch baseline as the default, specify the full patch baseline
Amazon Resource Name (ARN) as the baseline ID value. For example, for CentOS, specify
arn:​aws:​ssm:​us-east-2:​733109147000:​patchbaseline/pb-0574b43a65ea646ed instead of
pb-0574b43a65ea646ed.

``` swift
func registerDefaultPatchBaseline(input: RegisterDefaultPatchBaselineInput, completion: @escaping (ClientRuntime.SdkResult<RegisterDefaultPatchBaselineOutputResponse, RegisterDefaultPatchBaselineOutputError>) -> Void)
```

### registerPatchBaselineForPatchGroup(input:​completion:​)

Registers a patch baseline for a patch group.

``` swift
func registerPatchBaselineForPatchGroup(input: RegisterPatchBaselineForPatchGroupInput, completion: @escaping (ClientRuntime.SdkResult<RegisterPatchBaselineForPatchGroupOutputResponse, RegisterPatchBaselineForPatchGroupOutputError>) -> Void)
```

### registerTargetWithMaintenanceWindow(input:​completion:​)

Registers a target with a maintenance window.

``` swift
func registerTargetWithMaintenanceWindow(input: RegisterTargetWithMaintenanceWindowInput, completion: @escaping (ClientRuntime.SdkResult<RegisterTargetWithMaintenanceWindowOutputResponse, RegisterTargetWithMaintenanceWindowOutputError>) -> Void)
```

### registerTaskWithMaintenanceWindow(input:​completion:​)

Adds a new task to a maintenance window.

``` swift
func registerTaskWithMaintenanceWindow(input: RegisterTaskWithMaintenanceWindowInput, completion: @escaping (ClientRuntime.SdkResult<RegisterTaskWithMaintenanceWindowOutputResponse, RegisterTaskWithMaintenanceWindowOutputError>) -> Void)
```

### removeTagsFromResource(input:​completion:​)

Removes tag keys from the specified resource.

``` swift
func removeTagsFromResource(input: RemoveTagsFromResourceInput, completion: @escaping (ClientRuntime.SdkResult<RemoveTagsFromResourceOutputResponse, RemoveTagsFromResourceOutputError>) -> Void)
```

### resetServiceSetting(input:​completion:​)

defines how a user interacts with or uses a service or a feature of a service. For example, if an
Amazon Web Services service charges money to the account based on feature or service usage, then the Amazon Web Services
service team might create a default setting of "false". This means the user can't use this
feature unless they change the setting to "true" and intentionally opt in for a paid
feature.
Services map a SettingId object to a setting value. Amazon Web Services services teams define
the default value for a SettingId. You can't create a new SettingId,
but you can overwrite the default value if you have the ssm:​UpdateServiceSetting
permission for the setting. Use the GetServiceSetting API operation to view the
current value. Use the UpdateServiceSetting API operation to change the default
setting.
Reset the service setting for the account to the default value as provisioned by the Amazon Web Services
service team.

``` swift
func resetServiceSetting(input: ResetServiceSettingInput, completion: @escaping (ClientRuntime.SdkResult<ResetServiceSettingOutputResponse, ResetServiceSettingOutputError>) -> Void)
```

``` 
     ServiceSetting is an account-level setting for an Amazon Web Services service. This setting
```

### resumeSession(input:​completion:​)

Reconnects a session to an instance after it has been disconnected. Connections can be
resumed for disconnected sessions, but not terminated sessions.

``` swift
func resumeSession(input: ResumeSessionInput, completion: @escaping (ClientRuntime.SdkResult<ResumeSessionOutputResponse, ResumeSessionOutputError>) -> Void)
```

``` 
        This command is primarily for use by client machines to automatically reconnect during
intermittent network issues. It isn't intended for any other use.
```

### sendAutomationSignal(input:​completion:​)

Sends a signal to an Automation execution to change the current behavior or status of the
execution.

``` swift
func sendAutomationSignal(input: SendAutomationSignalInput, completion: @escaping (ClientRuntime.SdkResult<SendAutomationSignalOutputResponse, SendAutomationSignalOutputError>) -> Void)
```

### sendCommand(input:​completion:​)

Runs commands on one or more managed instances.

``` swift
func sendCommand(input: SendCommandInput, completion: @escaping (ClientRuntime.SdkResult<SendCommandOutputResponse, SendCommandOutputError>) -> Void)
```

### startAssociationsOnce(input:​completion:​)

Runs an association immediately and only one time. This operation can be helpful when
troubleshooting associations.

``` swift
func startAssociationsOnce(input: StartAssociationsOnceInput, completion: @escaping (ClientRuntime.SdkResult<StartAssociationsOnceOutputResponse, StartAssociationsOnceOutputError>) -> Void)
```

### startAutomationExecution(input:​completion:​)

Initiates execution of an Automation runbook.

``` swift
func startAutomationExecution(input: StartAutomationExecutionInput, completion: @escaping (ClientRuntime.SdkResult<StartAutomationExecutionOutputResponse, StartAutomationExecutionOutputError>) -> Void)
```

### startChangeRequestExecution(input:​completion:​)

Creates a change request for Change Manager. The Automation runbooks specified in the
change request run only after all required approvals for the change request have been
received.

``` swift
func startChangeRequestExecution(input: StartChangeRequestExecutionInput, completion: @escaping (ClientRuntime.SdkResult<StartChangeRequestExecutionOutputResponse, StartChangeRequestExecutionOutputError>) -> Void)
```

### startSession(input:​completion:​)

Initiates a connection to a target (for example, an instance) for a Session Manager session. Returns a
URL and token that can be used to open a WebSocket connection for sending input and receiving
outputs.

``` swift
func startSession(input: StartSessionInput, completion: @escaping (ClientRuntime.SdkResult<StartSessionOutputResponse, StartSessionOutputError>) -> Void)
```

``` 
        Amazon Web Services CLI usage: start-session is an interactive command that requires the Session Manager
plugin to be installed on the client machine making the call. For information, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html">Install
 the Session Manager plugin for the Amazon Web Services CLI in the Amazon Web Services Systems Manager User Guide.
        Amazon Web Services Tools for PowerShell usage: Start-SSMSession isn't currently supported by Amazon Web Services Tools
for PowerShell on Windows local machines.
```

### stopAutomationExecution(input:​completion:​)

Stop an Automation that is currently running.

``` swift
func stopAutomationExecution(input: StopAutomationExecutionInput, completion: @escaping (ClientRuntime.SdkResult<StopAutomationExecutionOutputResponse, StopAutomationExecutionOutputError>) -> Void)
```

### terminateSession(input:​completion:​)

Permanently ends a session and closes the data connection between the Session Manager client and
SSM Agent on the instance. A terminated session isn't be resumed.

``` swift
func terminateSession(input: TerminateSessionInput, completion: @escaping (ClientRuntime.SdkResult<TerminateSessionOutputResponse, TerminateSessionOutputError>) -> Void)
```

### unlabelParameterVersion(input:​completion:​)

Remove a label or labels from a parameter.

``` swift
func unlabelParameterVersion(input: UnlabelParameterVersionInput, completion: @escaping (ClientRuntime.SdkResult<UnlabelParameterVersionOutputResponse, UnlabelParameterVersionOutputError>) -> Void)
```

### updateAssociation(input:​completion:​)

Updates an association. You can update the association name and version, the document
version, schedule, parameters, and Amazon Simple Storage Service (Amazon S3) output.
In order to call this API operation, your Identity and Access Management (IAM) user
account, group, or role must be configured with permission to call the DescribeAssociation API operation. If you don't have permission to call
DescribeAssociation, then you receive the following error:​ An error occurred
(AccessDeniedException) when calling the UpdateAssociation operation:​ User:​ \<user\_arn\>
isn't authorized to perform:​ ssm:​DescribeAssociation on resource:​
\<resource\_arn\>

``` swift
func updateAssociation(input: UpdateAssociationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAssociationOutputResponse, UpdateAssociationOutputError>) -> Void)
```

``` 
        When you update an association, the association immediately runs against the specified
targets.
```

### updateAssociationStatus(input:​completion:​)

Updates the status of the Amazon Web Services Systems Manager document (SSM document) associated with the specified
instance.

``` swift
func updateAssociationStatus(input: UpdateAssociationStatusInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAssociationStatusOutputResponse, UpdateAssociationStatusOutputError>) -> Void)
```

``` 
        UpdateAssociationStatus is primarily used by the Amazon Web Services Systems Manager Agent (SSM Agent) to
```

report status updates about your associations and is only used for associations created with the
InstanceId legacy parameter.

### updateDocument(input:​completion:​)

Updates one or more values for an SSM document.

``` swift
func updateDocument(input: UpdateDocumentInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDocumentOutputResponse, UpdateDocumentOutputError>) -> Void)
```

### updateDocumentDefaultVersion(input:​completion:​)

Set the default version of a document.

``` swift
func updateDocumentDefaultVersion(input: UpdateDocumentDefaultVersionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDocumentDefaultVersionOutputResponse, UpdateDocumentDefaultVersionOutputError>) -> Void)
```

### updateDocumentMetadata(input:​completion:​)

Updates information related to approval reviews for a specific version of a change template
in Change Manager.

``` swift
func updateDocumentMetadata(input: UpdateDocumentMetadataInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDocumentMetadataOutputResponse, UpdateDocumentMetadataOutputError>) -> Void)
```

### updateMaintenanceWindow(input:​completion:​)

Updates an existing maintenance window. Only specified parameters are modified.

``` swift
func updateMaintenanceWindow(input: UpdateMaintenanceWindowInput, completion: @escaping (ClientRuntime.SdkResult<UpdateMaintenanceWindowOutputResponse, UpdateMaintenanceWindowOutputError>) -> Void)
```

``` 
        The value you specify for Duration determines the specific end time for the
maintenance window based on the time it begins. No maintenance window tasks are permitted to
start after the resulting endtime minus the number of hours you specify for Cutoff.
For example, if the maintenance window starts at 3 PM, the duration is three hours, and the
value you specify for Cutoff is one hour, no maintenance window tasks can start
after 5 PM.
```

### updateMaintenanceWindowTarget(input:​completion:​)

Modifies the target of an existing maintenance window. You
can change the following:​

``` swift
func updateMaintenanceWindowTarget(input: UpdateMaintenanceWindowTargetInput, completion: @escaping (ClientRuntime.SdkResult<UpdateMaintenanceWindowTargetOutputResponse, UpdateMaintenanceWindowTargetOutputError>) -> Void)
```

``` 
           Name


           Description


           Owner


           IDs for an ID target


           Tags for a Tag target


           From any supported tag type to another. The three supported tag types are ID target, Tag
 target, and resource group. For more information, see Target.



        If a parameter is null, then the corresponding field isn't modified.
```

### updateMaintenanceWindowTask(input:​completion:​)

Modifies a task assigned to a maintenance window. You can't change the task type, but you
can change the following values:​

``` swift
func updateMaintenanceWindowTask(input: UpdateMaintenanceWindowTaskInput, completion: @escaping (ClientRuntime.SdkResult<UpdateMaintenanceWindowTaskOutputResponse, UpdateMaintenanceWindowTaskOutputError>) -> Void)
```

``` 
              TaskARN. For example, you can change a RUN_COMMAND task from
  AWS-RunPowerShellScript to AWS-RunShellScript.



              ServiceRoleArn




              TaskInvocationParameters




              Priority




              MaxConcurrency




              MaxErrors




        One or more targets must be specified for maintenance window Run Command-type tasks.
Depending on the task, targets are optional for other maintenance window task types (Automation,
 Lambda, and Step Functions). For more information about running tasks
that don't specify targets, see <a href="https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html">Registering
 maintenance window tasks without targets in the
Amazon Web Services Systems Manager User Guide.

     If the value for a parameter in UpdateMaintenanceWindowTask is null, then the
```

corresponding field isn't modified. If you set Replace to true, then all fields
required by the RegisterTaskWithMaintenanceWindow operation are required for
this request. Optional fields that aren't specified are set to null.

``` 
        When you update a maintenance window task that has options specified in
 TaskInvocationParameters, you must provide again all the
 TaskInvocationParameters values that you want to retain. The values you don't
specify again are removed. For example, suppose that when you registered a Run Command task, you
specified TaskInvocationParameters values for Comment,
 NotificationConfig, and OutputS3BucketName. If you update the
maintenance window task and specify only a different OutputS3BucketName value, the
values for Comment and NotificationConfig are removed.
```

### updateManagedInstanceRole(input:​completion:​)

Changes the Identity and Access Management (IAM) role that is assigned to the
on-premises instance or virtual machines (VM). IAM roles are first assigned to
these hybrid instances during the activation process. For more information, see CreateActivation.

``` swift
func updateManagedInstanceRole(input: UpdateManagedInstanceRoleInput, completion: @escaping (ClientRuntime.SdkResult<UpdateManagedInstanceRoleOutputResponse, UpdateManagedInstanceRoleOutputError>) -> Void)
```

### updateOpsItem(input:​completion:​)

Edit or change an OpsItem. You must have permission in Identity and Access Management (IAM) to update an OpsItem. For more information, see <a href="https:​//docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html">Getting started with
OpsCenter in the Amazon Web Services Systems Manager User Guide.
Operations engineers and IT professionals use Amazon Web Services Systems Manager OpsCenter to view, investigate, and
remediate operational issues impacting the performance and health of their Amazon Web Services resources. For
more information, see <a href="https:​//docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html">OpsCenter in the
Amazon Web Services Systems Manager User Guide.

``` swift
func updateOpsItem(input: UpdateOpsItemInput, completion: @escaping (ClientRuntime.SdkResult<UpdateOpsItemOutputResponse, UpdateOpsItemOutputError>) -> Void)
```

### updateOpsMetadata(input:​completion:​)

Amazon Web Services Systems Manager calls this API operation when you edit OpsMetadata in Application Manager.

``` swift
func updateOpsMetadata(input: UpdateOpsMetadataInput, completion: @escaping (ClientRuntime.SdkResult<UpdateOpsMetadataOutputResponse, UpdateOpsMetadataOutputError>) -> Void)
```

### updatePatchBaseline(input:​completion:​)

Modifies an existing patch baseline. Fields not specified in the request are left
unchanged.

``` swift
func updatePatchBaseline(input: UpdatePatchBaselineInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePatchBaselineOutputResponse, UpdatePatchBaselineOutputError>) -> Void)
```

``` 
        For information about valid key-value pairs in PatchFilters for each supported
operating system type, see PatchFilter.
```

### updateResourceDataSync(input:​completion:​)

Update a resource data sync. After you create a resource data sync for a Region, you can't
change the account options for that sync. For example, if you create a sync in the us-east-2
(Ohio) Region and you choose the Include only the current account option, you can't
edit that sync later and choose the Include all accounts from my Organizations
configuration option. Instead, you must delete the first resource data sync, and create a
new one.

``` swift
func updateResourceDataSync(input: UpdateResourceDataSyncInput, completion: @escaping (ClientRuntime.SdkResult<UpdateResourceDataSyncOutputResponse, UpdateResourceDataSyncOutputError>) -> Void)
```

``` 
        This API operation only supports a resource data sync that was created with a
SyncFromSource SyncType.
```

### updateServiceSetting(input:​completion:​)

defines how a user interacts with or uses a service or a feature of a service. For example, if an
Amazon Web Services service charges money to the account based on feature or service usage, then the Amazon Web Services
service team might create a default setting of "false". This means the user can't use this
feature unless they change the setting to "true" and intentionally opt in for a paid
feature.
Services map a SettingId object to a setting value. Amazon Web Services services teams define
the default value for a SettingId. You can't create a new SettingId,
but you can overwrite the default value if you have the ssm:​UpdateServiceSetting
permission for the setting. Use the GetServiceSetting API operation to view the
current value. Or, use the ResetServiceSetting to change the value back to the
original value defined by the Amazon Web Services service team.
Update the service setting for the account.

``` swift
func updateServiceSetting(input: UpdateServiceSettingInput, completion: @escaping (ClientRuntime.SdkResult<UpdateServiceSettingOutputResponse, UpdateServiceSettingOutputError>) -> Void)
```

``` 
     ServiceSetting is an account-level setting for an Amazon Web Services service. This setting
```
