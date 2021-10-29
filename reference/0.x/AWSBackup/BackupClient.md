# BackupClient

``` swift
public class BackupClient 
```

## Inheritance

[`BackupClientProtocol`](/aws-sdk-swift/reference/0.x/AWSBackup/BackupClientProtocol)

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
public static let clientName = "BackupClient"
```

## Methods

### `createBackupPlan(input:completion:)`

Creates a backup plan using a backup plan name and backup rules. A backup plan is a document that contains information that Backup uses to schedule tasks that create recovery points for resources. If you call CreateBackupPlan with a plan that already exists, you receive an AlreadyExistsException exception.

``` swift
public func createBackupPlan(input: CreateBackupPlanInput, completion: @escaping (ClientRuntime.SdkResult<CreateBackupPlanOutputResponse, CreateBackupPlanOutputError>) -> Void)
```

### `createBackupSelection(input:completion:)`

Creates a JSON document that specifies a set of resources to assign to a backup plan. Resources can be included by specifying patterns for a ListOfTags and selected Resources. For example, consider the following patterns:

``` swift
public func createBackupSelection(input: CreateBackupSelectionInput, completion: @escaping (ClientRuntime.SdkResult<CreateBackupSelectionOutputResponse, CreateBackupSelectionOutputError>) -> Void)
```

  - Resources: "arn:aws:ec2:region:account-id:volume/volume-id"

  - ConditionKey:"department"ConditionValue:"finance"ConditionType:"StringEquals"

  - ConditionKey:"importance"ConditionValue:"critical"ConditionType:"StringEquals"

Using these patterns would back up all Amazon Elastic Block Store (Amazon EBS) volumes that are tagged as "department=finance", "importance=critical", in addition to an EBS volume with the specified volume ID. Resources and conditions are additive in that all resources that match the pattern are selected. This shouldn't be confused with a logical AND, where all conditions must match. The matching patterns are logically put together using the OR operator. In other words, all patterns that match are selected for backup.

### `createBackupVault(input:completion:)`

Creates a logical container where backups are stored. A CreateBackupVault request includes a name, optionally one or more resource tags, an encryption key, and a request ID. Do not include sensitive data, such as passport numbers, in the name of a backup vault.

``` swift
public func createBackupVault(input: CreateBackupVaultInput, completion: @escaping (ClientRuntime.SdkResult<CreateBackupVaultOutputResponse, CreateBackupVaultOutputError>) -> Void)
```

### `createFramework(input:completion:)`

Creates a framework with one or more controls. A framework is a collection of controls that you can use to evaluate your backup practices. By using pre-built customizable controls to define your policies, you can evaluate whether your backup practices comply with your policies. To get insights into the compliance status of your frameworks, you can set up automatic daily reports.

``` swift
public func createFramework(input: CreateFrameworkInput, completion: @escaping (ClientRuntime.SdkResult<CreateFrameworkOutputResponse, CreateFrameworkOutputError>) -> Void)
```

### `createReportPlan(input:completion:)`

Creates a report plan. A report plan is a document that contains information about the contents of the report and where Backup will deliver it. If you call CreateReportPlan with a plan that already exists, you receive an AlreadyExistsException exception.

``` swift
public func createReportPlan(input: CreateReportPlanInput, completion: @escaping (ClientRuntime.SdkResult<CreateReportPlanOutputResponse, CreateReportPlanOutputError>) -> Void)
```

### `deleteBackupPlan(input:completion:)`

Deletes a backup plan. A backup plan can only be deleted after all associated selections of resources have been deleted. Deleting a backup plan deletes the current version of a backup plan. Previous versions, if any, will still exist.

``` swift
public func deleteBackupPlan(input: DeleteBackupPlanInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBackupPlanOutputResponse, DeleteBackupPlanOutputError>) -> Void)
```

### `deleteBackupSelection(input:completion:)`

Deletes the resource selection associated with a backup plan that is specified by the SelectionId.

``` swift
public func deleteBackupSelection(input: DeleteBackupSelectionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBackupSelectionOutputResponse, DeleteBackupSelectionOutputError>) -> Void)
```

### `deleteBackupVault(input:completion:)`

Deletes the backup vault identified by its name. A vault can be deleted only if it is empty.

``` swift
public func deleteBackupVault(input: DeleteBackupVaultInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBackupVaultOutputResponse, DeleteBackupVaultOutputError>) -> Void)
```

### `deleteBackupVaultAccessPolicy(input:completion:)`

Deletes the policy document that manages permissions on a backup vault.

``` swift
public func deleteBackupVaultAccessPolicy(input: DeleteBackupVaultAccessPolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBackupVaultAccessPolicyOutputResponse, DeleteBackupVaultAccessPolicyOutputError>) -> Void)
```

### `deleteBackupVaultNotifications(input:completion:)`

Deletes event notifications for the specified backup vault.

``` swift
public func deleteBackupVaultNotifications(input: DeleteBackupVaultNotificationsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBackupVaultNotificationsOutputResponse, DeleteBackupVaultNotificationsOutputError>) -> Void)
```

### `deleteFramework(input:completion:)`

Deletes the framework specified by a framework name.

``` swift
public func deleteFramework(input: DeleteFrameworkInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFrameworkOutputResponse, DeleteFrameworkOutputError>) -> Void)
```

### `deleteRecoveryPoint(input:completion:)`

Deletes the recovery point specified by a recovery point ID. If the recovery point ID belongs to a continuous backup, calling this endpoint deletes the existing continuous backup and stops future continuous backup.

``` swift
public func deleteRecoveryPoint(input: DeleteRecoveryPointInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRecoveryPointOutputResponse, DeleteRecoveryPointOutputError>) -> Void)
```

### `deleteReportPlan(input:completion:)`

Deletes the report plan specified by a report plan name.

``` swift
public func deleteReportPlan(input: DeleteReportPlanInput, completion: @escaping (ClientRuntime.SdkResult<DeleteReportPlanOutputResponse, DeleteReportPlanOutputError>) -> Void)
```

### `describeBackupJob(input:completion:)`

Returns backup job details for the specified BackupJobId.

``` swift
public func describeBackupJob(input: DescribeBackupJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBackupJobOutputResponse, DescribeBackupJobOutputError>) -> Void)
```

### `describeBackupVault(input:completion:)`

Returns metadata about a backup vault specified by its name.

``` swift
public func describeBackupVault(input: DescribeBackupVaultInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBackupVaultOutputResponse, DescribeBackupVaultOutputError>) -> Void)
```

### `describeCopyJob(input:completion:)`

Returns metadata associated with creating a copy of a resource.

``` swift
public func describeCopyJob(input: DescribeCopyJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCopyJobOutputResponse, DescribeCopyJobOutputError>) -> Void)
```

### `describeFramework(input:completion:)`

Returns the framework details for the specified FrameworkName.

``` swift
public func describeFramework(input: DescribeFrameworkInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFrameworkOutputResponse, DescribeFrameworkOutputError>) -> Void)
```

### `describeGlobalSettings(input:completion:)`

Describes whether the Amazon Web Services account is opted in to cross-account backup. Returns an error if the account is not a member of an Organizations organization. Example: describe-global-settings --region us-west-2

``` swift
public func describeGlobalSettings(input: DescribeGlobalSettingsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeGlobalSettingsOutputResponse, DescribeGlobalSettingsOutputError>) -> Void)
```

### `describeProtectedResource(input:completion:)`

Returns information about a saved resource, including the last time it was backed up, its Amazon Resource Name (ARN), and the Amazon Web Services service type of the saved resource.

``` swift
public func describeProtectedResource(input: DescribeProtectedResourceInput, completion: @escaping (ClientRuntime.SdkResult<DescribeProtectedResourceOutputResponse, DescribeProtectedResourceOutputError>) -> Void)
```

### `describeRecoveryPoint(input:completion:)`

Returns metadata associated with a recovery point, including ID, status, encryption, and lifecycle.

``` swift
public func describeRecoveryPoint(input: DescribeRecoveryPointInput, completion: @escaping (ClientRuntime.SdkResult<DescribeRecoveryPointOutputResponse, DescribeRecoveryPointOutputError>) -> Void)
```

### `describeRegionSettings(input:completion:)`

Returns the current service opt-in settings for the Region. If service opt-in is enabled for a service, Backup tries to protect that service's resources in this Region, when the resource is included in an on-demand backup or scheduled backup plan. Otherwise, Backup does not try to protect that service's resources in this Region.

``` swift
public func describeRegionSettings(input: DescribeRegionSettingsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeRegionSettingsOutputResponse, DescribeRegionSettingsOutputError>) -> Void)
```

### `describeReportJob(input:completion:)`

Returns the details associated with creating a report as specified by its ReportJobId.

``` swift
public func describeReportJob(input: DescribeReportJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeReportJobOutputResponse, DescribeReportJobOutputError>) -> Void)
```

### `describeReportPlan(input:completion:)`

Returns a list of all report plans for an Amazon Web Services account and Amazon Web Services Region.

``` swift
public func describeReportPlan(input: DescribeReportPlanInput, completion: @escaping (ClientRuntime.SdkResult<DescribeReportPlanOutputResponse, DescribeReportPlanOutputError>) -> Void)
```

### `describeRestoreJob(input:completion:)`

Returns metadata associated with a restore job that is specified by a job ID.

``` swift
public func describeRestoreJob(input: DescribeRestoreJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeRestoreJobOutputResponse, DescribeRestoreJobOutputError>) -> Void)
```

### `disassociateRecoveryPoint(input:completion:)`

Deletes the specified continuous backup recovery point from Backup and releases control of that continuous backup to the source service, such as Amazon RDS. The source service will continue to create and retain continuous backups using the lifecycle that you specified in your original backup plan. Does not support snapshot backup recovery points.

``` swift
public func disassociateRecoveryPoint(input: DisassociateRecoveryPointInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateRecoveryPointOutputResponse, DisassociateRecoveryPointOutputError>) -> Void)
```

### `exportBackupPlanTemplate(input:completion:)`

Returns the backup plan that is specified by the plan ID as a backup template.

``` swift
public func exportBackupPlanTemplate(input: ExportBackupPlanTemplateInput, completion: @escaping (ClientRuntime.SdkResult<ExportBackupPlanTemplateOutputResponse, ExportBackupPlanTemplateOutputError>) -> Void)
```

### `getBackupPlan(input:completion:)`

Returns BackupPlan details for the specified BackupPlanId. The details are the body of a backup plan in JSON format, in addition to plan metadata.

``` swift
public func getBackupPlan(input: GetBackupPlanInput, completion: @escaping (ClientRuntime.SdkResult<GetBackupPlanOutputResponse, GetBackupPlanOutputError>) -> Void)
```

### `getBackupPlanFromJSON(input:completion:)`

Returns a valid JSON document specifying a backup plan or an error.

``` swift
public func getBackupPlanFromJSON(input: GetBackupPlanFromJSONInput, completion: @escaping (ClientRuntime.SdkResult<GetBackupPlanFromJSONOutputResponse, GetBackupPlanFromJSONOutputError>) -> Void)
```

### `getBackupPlanFromTemplate(input:completion:)`

Returns the template specified by its templateId as a backup plan.

``` swift
public func getBackupPlanFromTemplate(input: GetBackupPlanFromTemplateInput, completion: @escaping (ClientRuntime.SdkResult<GetBackupPlanFromTemplateOutputResponse, GetBackupPlanFromTemplateOutputError>) -> Void)
```

### `getBackupSelection(input:completion:)`

Returns selection metadata and a document in JSON format that specifies a list of resources that are associated with a backup plan.

``` swift
public func getBackupSelection(input: GetBackupSelectionInput, completion: @escaping (ClientRuntime.SdkResult<GetBackupSelectionOutputResponse, GetBackupSelectionOutputError>) -> Void)
```

### `getBackupVaultAccessPolicy(input:completion:)`

Returns the access policy document that is associated with the named backup vault.

``` swift
public func getBackupVaultAccessPolicy(input: GetBackupVaultAccessPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetBackupVaultAccessPolicyOutputResponse, GetBackupVaultAccessPolicyOutputError>) -> Void)
```

### `getBackupVaultNotifications(input:completion:)`

Returns event notifications for the specified backup vault.

``` swift
public func getBackupVaultNotifications(input: GetBackupVaultNotificationsInput, completion: @escaping (ClientRuntime.SdkResult<GetBackupVaultNotificationsOutputResponse, GetBackupVaultNotificationsOutputError>) -> Void)
```

### `getRecoveryPointRestoreMetadata(input:completion:)`

Returns a set of metadata key-value pairs that were used to create the backup.

``` swift
public func getRecoveryPointRestoreMetadata(input: GetRecoveryPointRestoreMetadataInput, completion: @escaping (ClientRuntime.SdkResult<GetRecoveryPointRestoreMetadataOutputResponse, GetRecoveryPointRestoreMetadataOutputError>) -> Void)
```

### `getSupportedResourceTypes(input:completion:)`

Returns the Amazon Web Services resource types supported by Backup.

``` swift
public func getSupportedResourceTypes(input: GetSupportedResourceTypesInput, completion: @escaping (ClientRuntime.SdkResult<GetSupportedResourceTypesOutputResponse, GetSupportedResourceTypesOutputError>) -> Void)
```

### `listBackupJobs(input:completion:)`

Returns a list of existing backup jobs for an authenticated account for the last 30 days. For a longer period of time, consider using these [monitoring tools](https://docs.aws.amazon.com/aws-backup/latest/devguide/monitoring.html).

``` swift
public func listBackupJobs(input: ListBackupJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListBackupJobsOutputResponse, ListBackupJobsOutputError>) -> Void)
```

### `listBackupPlanTemplates(input:completion:)`

Returns metadata of your saved backup plan templates, including the template ID, name, and the creation and deletion dates.

``` swift
public func listBackupPlanTemplates(input: ListBackupPlanTemplatesInput, completion: @escaping (ClientRuntime.SdkResult<ListBackupPlanTemplatesOutputResponse, ListBackupPlanTemplatesOutputError>) -> Void)
```

### `listBackupPlanVersions(input:completion:)`

Returns version metadata of your backup plans, including Amazon Resource Names (ARNs), backup plan IDs, creation and deletion dates, plan names, and version IDs.

``` swift
public func listBackupPlanVersions(input: ListBackupPlanVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListBackupPlanVersionsOutputResponse, ListBackupPlanVersionsOutputError>) -> Void)
```

### `listBackupPlans(input:completion:)`

Returns a list of all active backup plans for an authenticated account. The list contains information such as Amazon Resource Names (ARNs), plan IDs, creation and deletion dates, version IDs, plan names, and creator request IDs.

``` swift
public func listBackupPlans(input: ListBackupPlansInput, completion: @escaping (ClientRuntime.SdkResult<ListBackupPlansOutputResponse, ListBackupPlansOutputError>) -> Void)
```

### `listBackupSelections(input:completion:)`

Returns an array containing metadata of the resources associated with the target backup plan.

``` swift
public func listBackupSelections(input: ListBackupSelectionsInput, completion: @escaping (ClientRuntime.SdkResult<ListBackupSelectionsOutputResponse, ListBackupSelectionsOutputError>) -> Void)
```

### `listBackupVaults(input:completion:)`

Returns a list of recovery point storage containers along with information about them.

``` swift
public func listBackupVaults(input: ListBackupVaultsInput, completion: @escaping (ClientRuntime.SdkResult<ListBackupVaultsOutputResponse, ListBackupVaultsOutputError>) -> Void)
```

### `listCopyJobs(input:completion:)`

Returns metadata about your copy jobs.

``` swift
public func listCopyJobs(input: ListCopyJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListCopyJobsOutputResponse, ListCopyJobsOutputError>) -> Void)
```

### `listFrameworks(input:completion:)`

Returns a list of all frameworks for an Amazon Web Services account and Amazon Web Services Region.

``` swift
public func listFrameworks(input: ListFrameworksInput, completion: @escaping (ClientRuntime.SdkResult<ListFrameworksOutputResponse, ListFrameworksOutputError>) -> Void)
```

### `listProtectedResources(input:completion:)`

Returns an array of resources successfully backed up by Backup, including the time the resource was saved, an Amazon Resource Name (ARN) of the resource, and a resource type.

``` swift
public func listProtectedResources(input: ListProtectedResourcesInput, completion: @escaping (ClientRuntime.SdkResult<ListProtectedResourcesOutputResponse, ListProtectedResourcesOutputError>) -> Void)
```

### `listRecoveryPointsByBackupVault(input:completion:)`

Returns detailed information about the recovery points stored in a backup vault.

``` swift
public func listRecoveryPointsByBackupVault(input: ListRecoveryPointsByBackupVaultInput, completion: @escaping (ClientRuntime.SdkResult<ListRecoveryPointsByBackupVaultOutputResponse, ListRecoveryPointsByBackupVaultOutputError>) -> Void)
```

### `listRecoveryPointsByResource(input:completion:)`

Returns detailed information about all the recovery points of the type specified by a resource Amazon Resource Name (ARN). For Amazon EFS and Amazon EC2, this action only lists recovery points created by Backup.

``` swift
public func listRecoveryPointsByResource(input: ListRecoveryPointsByResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListRecoveryPointsByResourceOutputResponse, ListRecoveryPointsByResourceOutputError>) -> Void)
```

### `listReportJobs(input:completion:)`

Returns details about your report jobs.

``` swift
public func listReportJobs(input: ListReportJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListReportJobsOutputResponse, ListReportJobsOutputError>) -> Void)
```

### `listReportPlans(input:completion:)`

Returns a list of your report plans. For detailed information about a single report plan, use DescribeReportPlan.

``` swift
public func listReportPlans(input: ListReportPlansInput, completion: @escaping (ClientRuntime.SdkResult<ListReportPlansOutputResponse, ListReportPlansOutputError>) -> Void)
```

### `listRestoreJobs(input:completion:)`

Returns a list of jobs that Backup initiated to restore a saved resource, including details about the recovery process.

``` swift
public func listRestoreJobs(input: ListRestoreJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListRestoreJobsOutputResponse, ListRestoreJobsOutputError>) -> Void)
```

### `listTags(input:completion:)`

Returns a list of key-value pairs assigned to a target recovery point, backup plan, or backup vault. ListTags are currently only supported with Amazon EFS backups.

``` swift
public func listTags(input: ListTagsInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsOutputResponse, ListTagsOutputError>) -> Void)
```

### `putBackupVaultAccessPolicy(input:completion:)`

Sets a resource-based policy that is used to manage access permissions on the target backup vault. Requires a backup vault name and an access policy document in JSON format.

``` swift
public func putBackupVaultAccessPolicy(input: PutBackupVaultAccessPolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutBackupVaultAccessPolicyOutputResponse, PutBackupVaultAccessPolicyOutputError>) -> Void)
```

### `putBackupVaultNotifications(input:completion:)`

Turns on notifications on a backup vault for the specified topic and events.

``` swift
public func putBackupVaultNotifications(input: PutBackupVaultNotificationsInput, completion: @escaping (ClientRuntime.SdkResult<PutBackupVaultNotificationsOutputResponse, PutBackupVaultNotificationsOutputError>) -> Void)
```

### `startBackupJob(input:completion:)`

Starts an on-demand backup job for the specified resource.

``` swift
public func startBackupJob(input: StartBackupJobInput, completion: @escaping (ClientRuntime.SdkResult<StartBackupJobOutputResponse, StartBackupJobOutputError>) -> Void)
```

### `startCopyJob(input:completion:)`

Starts a job to create a one-time copy of the specified resource. Does not support continuous backups.

``` swift
public func startCopyJob(input: StartCopyJobInput, completion: @escaping (ClientRuntime.SdkResult<StartCopyJobOutputResponse, StartCopyJobOutputError>) -> Void)
```

### `startReportJob(input:completion:)`

Starts an on-demand report job for the specified report plan.

``` swift
public func startReportJob(input: StartReportJobInput, completion: @escaping (ClientRuntime.SdkResult<StartReportJobOutputResponse, StartReportJobOutputError>) -> Void)
```

### `startRestoreJob(input:completion:)`

Recovers the saved resource identified by an Amazon Resource Name (ARN).

``` swift
public func startRestoreJob(input: StartRestoreJobInput, completion: @escaping (ClientRuntime.SdkResult<StartRestoreJobOutputResponse, StartRestoreJobOutputError>) -> Void)
```

### `stopBackupJob(input:completion:)`

Attempts to cancel a job to create a one-time backup of a resource.

``` swift
public func stopBackupJob(input: StopBackupJobInput, completion: @escaping (ClientRuntime.SdkResult<StopBackupJobOutputResponse, StopBackupJobOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Assigns a set of key-value pairs to a recovery point, backup plan, or backup vault identified by an Amazon Resource Name (ARN).

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes a set of key-value pairs from a recovery point, backup plan, or backup vault identified by an Amazon Resource Name (ARN)

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateBackupPlan(input:completion:)`

Updates an existing backup plan identified by its backupPlanId with the input document in JSON format. The new version is uniquely identified by a VersionId.

``` swift
public func updateBackupPlan(input: UpdateBackupPlanInput, completion: @escaping (ClientRuntime.SdkResult<UpdateBackupPlanOutputResponse, UpdateBackupPlanOutputError>) -> Void)
```

### `updateFramework(input:completion:)`

Updates an existing framework identified by its FrameworkName with the input document in JSON format.

``` swift
public func updateFramework(input: UpdateFrameworkInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFrameworkOutputResponse, UpdateFrameworkOutputError>) -> Void)
```

### `updateGlobalSettings(input:completion:)`

Updates whether the Amazon Web Services account is opted in to cross-account backup. Returns an error if the account is not an Organizations management account. Use the DescribeGlobalSettings API to determine the current settings.

``` swift
public func updateGlobalSettings(input: UpdateGlobalSettingsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateGlobalSettingsOutputResponse, UpdateGlobalSettingsOutputError>) -> Void)
```

### `updateRecoveryPointLifecycle(input:completion:)`

Sets the transition lifecycle of a recovery point. The lifecycle defines when a protected resource is transitioned to cold storage and when it expires. Backup transitions and expires backups automatically according to the lifecycle that you define. Backups transitioned to cold storage must be stored in cold storage for a minimum of 90 days. Therefore, the “expire after days” setting must be 90 days greater than the “transition to cold after days” setting. The “transition to cold after days” setting cannot be changed after a backup has been transitioned to cold. Only Amazon EFS file system backups can be transitioned to cold storage. Does not support continuous backups.

``` swift
public func updateRecoveryPointLifecycle(input: UpdateRecoveryPointLifecycleInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRecoveryPointLifecycleOutputResponse, UpdateRecoveryPointLifecycleOutputError>) -> Void)
```

### `updateRegionSettings(input:completion:)`

Updates the current service opt-in settings for the Region. If service-opt-in is enabled for a service, Backup tries to protect that service's resources in this Region, when the resource is included in an on-demand backup or scheduled backup plan. Otherwise, Backup does not try to protect that service's resources in this Region. Use the DescribeRegionSettings API to determine the resource types that are supported.

``` swift
public func updateRegionSettings(input: UpdateRegionSettingsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRegionSettingsOutputResponse, UpdateRegionSettingsOutputError>) -> Void)
```

### `updateReportPlan(input:completion:)`

Updates an existing report plan identified by its ReportPlanName with the input document in JSON format.

``` swift
public func updateReportPlan(input: UpdateReportPlanInput, completion: @escaping (ClientRuntime.SdkResult<UpdateReportPlanOutputResponse, UpdateReportPlanOutputError>) -> Void)
```
