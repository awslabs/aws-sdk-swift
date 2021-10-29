# AuditManagerClientProtocol

Welcome to the Audit Manager API reference. This guide is for developers who need detailed information about the Audit Manager API operations, data types, and errors. Audit Manager is a service that provides automated evidence collection so that you can continuously audit your Amazon Web Services usage, and assess the effectiveness of your controls to better manage risk and simplify compliance. Audit Manager provides pre-built frameworks that structure and automate assessments for a given compliance standard. Frameworks include a pre-built collection of controls with descriptions and testing procedures, which are grouped according to the requirements of the specified compliance standard or regulation. You can also customize frameworks and controls to support internal audits with unique requirements. Use the following links to get started with the Audit Manager API:

``` swift
public protocol AuditManagerClientProtocol 
```

  - [Actions](https://docs.aws.amazon.com/audit-manager/latest/APIReference/API_Operations.html): An alphabetical list of all Audit Manager API operations.

  - [Data types](https://docs.aws.amazon.com/audit-manager/latest/APIReference/API_Types.html): An alphabetical list of all Audit Manager data types.

  - [Common parameters](https://docs.aws.amazon.com/audit-manager/latest/APIReference/CommonParameters.html): Parameters that all Query operations can use.

  - [Common errors](https://docs.aws.amazon.com/audit-manager/latest/APIReference/CommonErrors.html): Client and server errors that all operations can return.

If you're new to Audit Manager, we recommend that you review the [ Audit Manager User Guide](https://docs.aws.amazon.com/audit-manager/latest/userguide/what-is.html).

## Requirements

### associateAssessmentReportEvidenceFolder(input:completion:)

Associates an evidence folder to the specified assessment report in Audit Manager.

``` swift
func associateAssessmentReportEvidenceFolder(input: AssociateAssessmentReportEvidenceFolderInput, completion: @escaping (ClientRuntime.SdkResult<AssociateAssessmentReportEvidenceFolderOutputResponse, AssociateAssessmentReportEvidenceFolderOutputError>) -> Void)
```

### batchAssociateAssessmentReportEvidence(input:completion:)

Associates a list of evidence to an assessment report in an Audit Manager assessment.

``` swift
func batchAssociateAssessmentReportEvidence(input: BatchAssociateAssessmentReportEvidenceInput, completion: @escaping (ClientRuntime.SdkResult<BatchAssociateAssessmentReportEvidenceOutputResponse, BatchAssociateAssessmentReportEvidenceOutputError>) -> Void)
```

### batchCreateDelegationByAssessment(input:completion:)

Create a batch of delegations for a specified assessment in Audit Manager.

``` swift
func batchCreateDelegationByAssessment(input: BatchCreateDelegationByAssessmentInput, completion: @escaping (ClientRuntime.SdkResult<BatchCreateDelegationByAssessmentOutputResponse, BatchCreateDelegationByAssessmentOutputError>) -> Void)
```

### batchDeleteDelegationByAssessment(input:completion:)

Deletes the delegations in the specified Audit Manager assessment.

``` swift
func batchDeleteDelegationByAssessment(input: BatchDeleteDelegationByAssessmentInput, completion: @escaping (ClientRuntime.SdkResult<BatchDeleteDelegationByAssessmentOutputResponse, BatchDeleteDelegationByAssessmentOutputError>) -> Void)
```

### batchDisassociateAssessmentReportEvidence(input:completion:)

Disassociates a list of evidence from the specified assessment report in Audit Manager.

``` swift
func batchDisassociateAssessmentReportEvidence(input: BatchDisassociateAssessmentReportEvidenceInput, completion: @escaping (ClientRuntime.SdkResult<BatchDisassociateAssessmentReportEvidenceOutputResponse, BatchDisassociateAssessmentReportEvidenceOutputError>) -> Void)
```

### batchImportEvidenceToAssessmentControl(input:completion:)

Uploads one or more pieces of evidence to the specified control in the assessment in Audit Manager.

``` swift
func batchImportEvidenceToAssessmentControl(input: BatchImportEvidenceToAssessmentControlInput, completion: @escaping (ClientRuntime.SdkResult<BatchImportEvidenceToAssessmentControlOutputResponse, BatchImportEvidenceToAssessmentControlOutputError>) -> Void)
```

### createAssessment(input:completion:)

Creates an assessment in Audit Manager.

``` swift
func createAssessment(input: CreateAssessmentInput, completion: @escaping (ClientRuntime.SdkResult<CreateAssessmentOutputResponse, CreateAssessmentOutputError>) -> Void)
```

### createAssessmentFramework(input:completion:)

Creates a custom framework in Audit Manager.

``` swift
func createAssessmentFramework(input: CreateAssessmentFrameworkInput, completion: @escaping (ClientRuntime.SdkResult<CreateAssessmentFrameworkOutputResponse, CreateAssessmentFrameworkOutputError>) -> Void)
```

### createAssessmentReport(input:completion:)

Creates an assessment report for the specified assessment.

``` swift
func createAssessmentReport(input: CreateAssessmentReportInput, completion: @escaping (ClientRuntime.SdkResult<CreateAssessmentReportOutputResponse, CreateAssessmentReportOutputError>) -> Void)
```

### createControl(input:completion:)

Creates a new custom control in Audit Manager.

``` swift
func createControl(input: CreateControlInput, completion: @escaping (ClientRuntime.SdkResult<CreateControlOutputResponse, CreateControlOutputError>) -> Void)
```

### deleteAssessment(input:completion:)

Deletes an assessment in Audit Manager.

``` swift
func deleteAssessment(input: DeleteAssessmentInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAssessmentOutputResponse, DeleteAssessmentOutputError>) -> Void)
```

### deleteAssessmentFramework(input:completion:)

Deletes a custom framework in Audit Manager.

``` swift
func deleteAssessmentFramework(input: DeleteAssessmentFrameworkInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAssessmentFrameworkOutputResponse, DeleteAssessmentFrameworkOutputError>) -> Void)
```

### deleteAssessmentReport(input:completion:)

Deletes an assessment report from an assessment in Audit Manager.

``` swift
func deleteAssessmentReport(input: DeleteAssessmentReportInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAssessmentReportOutputResponse, DeleteAssessmentReportOutputError>) -> Void)
```

### deleteControl(input:completion:)

Deletes a custom control in Audit Manager.

``` swift
func deleteControl(input: DeleteControlInput, completion: @escaping (ClientRuntime.SdkResult<DeleteControlOutputResponse, DeleteControlOutputError>) -> Void)
```

### deregisterAccount(input:completion:)

Deregisters an account in Audit Manager.

``` swift
func deregisterAccount(input: DeregisterAccountInput, completion: @escaping (ClientRuntime.SdkResult<DeregisterAccountOutputResponse, DeregisterAccountOutputError>) -> Void)
```

### deregisterOrganizationAdminAccount(input:completion:)

Removes the specified member account as a delegated administrator for Audit Manager. When you remove a delegated administrator from your Audit Manager settings, or when you deregister a delegated administrator from Organizations, you continue to have access to the evidence that you previously collected under that account. However, Audit Manager will stop collecting and attaching evidence to that delegated administrator account moving forward.

``` swift
func deregisterOrganizationAdminAccount(input: DeregisterOrganizationAdminAccountInput, completion: @escaping (ClientRuntime.SdkResult<DeregisterOrganizationAdminAccountOutputResponse, DeregisterOrganizationAdminAccountOutputError>) -> Void)
```

### disassociateAssessmentReportEvidenceFolder(input:completion:)

Disassociates an evidence folder from the specified assessment report in Audit Manager.

``` swift
func disassociateAssessmentReportEvidenceFolder(input: DisassociateAssessmentReportEvidenceFolderInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateAssessmentReportEvidenceFolderOutputResponse, DisassociateAssessmentReportEvidenceFolderOutputError>) -> Void)
```

### getAccountStatus(input:completion:)

Returns the registration status of an account in Audit Manager.

``` swift
func getAccountStatus(input: GetAccountStatusInput, completion: @escaping (ClientRuntime.SdkResult<GetAccountStatusOutputResponse, GetAccountStatusOutputError>) -> Void)
```

### getAssessment(input:completion:)

Returns an assessment from Audit Manager.

``` swift
func getAssessment(input: GetAssessmentInput, completion: @escaping (ClientRuntime.SdkResult<GetAssessmentOutputResponse, GetAssessmentOutputError>) -> Void)
```

### getAssessmentFramework(input:completion:)

Returns a framework from Audit Manager.

``` swift
func getAssessmentFramework(input: GetAssessmentFrameworkInput, completion: @escaping (ClientRuntime.SdkResult<GetAssessmentFrameworkOutputResponse, GetAssessmentFrameworkOutputError>) -> Void)
```

### getAssessmentReportUrl(input:completion:)

Returns the URL of a specified assessment report in Audit Manager.

``` swift
func getAssessmentReportUrl(input: GetAssessmentReportUrlInput, completion: @escaping (ClientRuntime.SdkResult<GetAssessmentReportUrlOutputResponse, GetAssessmentReportUrlOutputError>) -> Void)
```

### getChangeLogs(input:completion:)

Returns a list of changelogs from Audit Manager.

``` swift
func getChangeLogs(input: GetChangeLogsInput, completion: @escaping (ClientRuntime.SdkResult<GetChangeLogsOutputResponse, GetChangeLogsOutputError>) -> Void)
```

### getControl(input:completion:)

Returns a control from Audit Manager.

``` swift
func getControl(input: GetControlInput, completion: @escaping (ClientRuntime.SdkResult<GetControlOutputResponse, GetControlOutputError>) -> Void)
```

### getDelegations(input:completion:)

Returns a list of delegations from an audit owner to a delegate.

``` swift
func getDelegations(input: GetDelegationsInput, completion: @escaping (ClientRuntime.SdkResult<GetDelegationsOutputResponse, GetDelegationsOutputError>) -> Void)
```

### getEvidence(input:completion:)

Returns evidence from Audit Manager.

``` swift
func getEvidence(input: GetEvidenceInput, completion: @escaping (ClientRuntime.SdkResult<GetEvidenceOutputResponse, GetEvidenceOutputError>) -> Void)
```

### getEvidenceByEvidenceFolder(input:completion:)

Returns all evidence from a specified evidence folder in Audit Manager.

``` swift
func getEvidenceByEvidenceFolder(input: GetEvidenceByEvidenceFolderInput, completion: @escaping (ClientRuntime.SdkResult<GetEvidenceByEvidenceFolderOutputResponse, GetEvidenceByEvidenceFolderOutputError>) -> Void)
```

### getEvidenceFolder(input:completion:)

Returns an evidence folder from the specified assessment in Audit Manager.

``` swift
func getEvidenceFolder(input: GetEvidenceFolderInput, completion: @escaping (ClientRuntime.SdkResult<GetEvidenceFolderOutputResponse, GetEvidenceFolderOutputError>) -> Void)
```

### getEvidenceFoldersByAssessment(input:completion:)

Returns the evidence folders from a specified assessment in Audit Manager.

``` swift
func getEvidenceFoldersByAssessment(input: GetEvidenceFoldersByAssessmentInput, completion: @escaping (ClientRuntime.SdkResult<GetEvidenceFoldersByAssessmentOutputResponse, GetEvidenceFoldersByAssessmentOutputError>) -> Void)
```

### getEvidenceFoldersByAssessmentControl(input:completion:)

Returns a list of evidence folders associated with a specified control of an assessment in Audit Manager.

``` swift
func getEvidenceFoldersByAssessmentControl(input: GetEvidenceFoldersByAssessmentControlInput, completion: @escaping (ClientRuntime.SdkResult<GetEvidenceFoldersByAssessmentControlOutputResponse, GetEvidenceFoldersByAssessmentControlOutputError>) -> Void)
```

### getOrganizationAdminAccount(input:completion:)

Returns the name of the delegated Amazon Web Services administrator account for the organization.

``` swift
func getOrganizationAdminAccount(input: GetOrganizationAdminAccountInput, completion: @escaping (ClientRuntime.SdkResult<GetOrganizationAdminAccountOutputResponse, GetOrganizationAdminAccountOutputError>) -> Void)
```

### getServicesInScope(input:completion:)

Returns a list of the in-scope Amazon Web Services services for the specified assessment.

``` swift
func getServicesInScope(input: GetServicesInScopeInput, completion: @escaping (ClientRuntime.SdkResult<GetServicesInScopeOutputResponse, GetServicesInScopeOutputError>) -> Void)
```

### getSettings(input:completion:)

Returns the settings for the specified account.

``` swift
func getSettings(input: GetSettingsInput, completion: @escaping (ClientRuntime.SdkResult<GetSettingsOutputResponse, GetSettingsOutputError>) -> Void)
```

### listAssessmentFrameworks(input:completion:)

Returns a list of the frameworks available in the Audit Manager framework library.

``` swift
func listAssessmentFrameworks(input: ListAssessmentFrameworksInput, completion: @escaping (ClientRuntime.SdkResult<ListAssessmentFrameworksOutputResponse, ListAssessmentFrameworksOutputError>) -> Void)
```

### listAssessmentReports(input:completion:)

Returns a list of assessment reports created in Audit Manager.

``` swift
func listAssessmentReports(input: ListAssessmentReportsInput, completion: @escaping (ClientRuntime.SdkResult<ListAssessmentReportsOutputResponse, ListAssessmentReportsOutputError>) -> Void)
```

### listAssessments(input:completion:)

Returns a list of current and past assessments from Audit Manager.

``` swift
func listAssessments(input: ListAssessmentsInput, completion: @escaping (ClientRuntime.SdkResult<ListAssessmentsOutputResponse, ListAssessmentsOutputError>) -> Void)
```

### listControls(input:completion:)

Returns a list of controls from Audit Manager.

``` swift
func listControls(input: ListControlsInput, completion: @escaping (ClientRuntime.SdkResult<ListControlsOutputResponse, ListControlsOutputError>) -> Void)
```

### listKeywordsForDataSource(input:completion:)

Returns a list of keywords that pre-mapped to the specified control data source.

``` swift
func listKeywordsForDataSource(input: ListKeywordsForDataSourceInput, completion: @escaping (ClientRuntime.SdkResult<ListKeywordsForDataSourceOutputResponse, ListKeywordsForDataSourceOutputError>) -> Void)
```

### listNotifications(input:completion:)

Returns a list of all Audit Manager notifications.

``` swift
func listNotifications(input: ListNotificationsInput, completion: @escaping (ClientRuntime.SdkResult<ListNotificationsOutputResponse, ListNotificationsOutputError>) -> Void)
```

### listTagsForResource(input:completion:)

Returns a list of tags for the specified resource in Audit Manager.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### registerAccount(input:completion:)

Enables Audit Manager for the specified account.

``` swift
func registerAccount(input: RegisterAccountInput, completion: @escaping (ClientRuntime.SdkResult<RegisterAccountOutputResponse, RegisterAccountOutputError>) -> Void)
```

### registerOrganizationAdminAccount(input:completion:)

Enables an account within the organization as the delegated administrator for Audit Manager.

``` swift
func registerOrganizationAdminAccount(input: RegisterOrganizationAdminAccountInput, completion: @escaping (ClientRuntime.SdkResult<RegisterOrganizationAdminAccountOutputResponse, RegisterOrganizationAdminAccountOutputError>) -> Void)
```

### tagResource(input:completion:)

Tags the specified resource in Audit Manager.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:completion:)

Removes a tag from a resource in Audit Manager.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateAssessment(input:completion:)

Edits an Audit Manager assessment.

``` swift
func updateAssessment(input: UpdateAssessmentInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAssessmentOutputResponse, UpdateAssessmentOutputError>) -> Void)
```

### updateAssessmentControl(input:completion:)

Updates a control within an assessment in Audit Manager.

``` swift
func updateAssessmentControl(input: UpdateAssessmentControlInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAssessmentControlOutputResponse, UpdateAssessmentControlOutputError>) -> Void)
```

### updateAssessmentControlSetStatus(input:completion:)

Updates the status of a control set in an Audit Manager assessment.

``` swift
func updateAssessmentControlSetStatus(input: UpdateAssessmentControlSetStatusInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAssessmentControlSetStatusOutputResponse, UpdateAssessmentControlSetStatusOutputError>) -> Void)
```

### updateAssessmentFramework(input:completion:)

Updates a custom framework in Audit Manager.

``` swift
func updateAssessmentFramework(input: UpdateAssessmentFrameworkInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAssessmentFrameworkOutputResponse, UpdateAssessmentFrameworkOutputError>) -> Void)
```

### updateAssessmentStatus(input:completion:)

Updates the status of an assessment in Audit Manager.

``` swift
func updateAssessmentStatus(input: UpdateAssessmentStatusInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAssessmentStatusOutputResponse, UpdateAssessmentStatusOutputError>) -> Void)
```

### updateControl(input:completion:)

Updates a custom control in Audit Manager.

``` swift
func updateControl(input: UpdateControlInput, completion: @escaping (ClientRuntime.SdkResult<UpdateControlOutputResponse, UpdateControlOutputError>) -> Void)
```

### updateSettings(input:completion:)

Updates Audit Manager settings for the current user account.

``` swift
func updateSettings(input: UpdateSettingsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSettingsOutputResponse, UpdateSettingsOutputError>) -> Void)
```

### validateAssessmentReportIntegrity(input:completion:)

Validates the integrity of an assessment report in Audit Manager.

``` swift
func validateAssessmentReportIntegrity(input: ValidateAssessmentReportIntegrityInput, completion: @escaping (ClientRuntime.SdkResult<ValidateAssessmentReportIntegrityOutputResponse, ValidateAssessmentReportIntegrityOutputError>) -> Void)
```
