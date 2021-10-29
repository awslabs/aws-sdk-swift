# SecurityHubClientProtocol

Security Hub provides you with a comprehensive view of the security state of your Amazon Web Services environment and resources. It also provides you with the readiness status of your environment based on controls from supported security standards. Security Hub collects security data from Amazon Web Services accounts, services, and integrated third-party products and helps you analyze security trends in your environment to identify the highest priority security issues. For more information about Security Hub, see the Security Hub[User Guide](https://docs.aws.amazon.com/securityhub/latest/userguide/what-is-securityhub.html) . When you use operations in the Security Hub API, the requests are executed only in the Amazon Web Services Region that is currently active or in the specific Amazon Web Services Region that you specify in your request. Any configuration or settings change that results from the operation is applied only to that Region. To make the same change in other Regions, execute the same command for each Region to apply the change to. For example, if your Region is set to us-west-2, when you use CreateMembers to add a member account to Security Hub, the association of the member account with the administrator account is created only in the us-west-2 Region. Security Hub must be enabled for the member account in the same Region that the invitation was sent from. The following throttling limits apply to using Security Hub API operations.

``` swift
public protocol SecurityHubClientProtocol 
```

  - BatchEnableStandards - RateLimit of 1 request per second, BurstLimit of 1 request per second.

  - GetFindings - RateLimit of 3 requests per second. BurstLimit of 6 requests per second.

  - UpdateFindings - RateLimit of 1 request per second. BurstLimit of 5 requests per second.

  - UpdateStandardsControl - RateLimit of 1 request per second, BurstLimit of 5 requests per second.

  - All other operations - RateLimit of 10 requests per second. BurstLimit of 30 requests per second.

## Requirements

### acceptAdministratorInvitation(input:completion:)

Accepts the invitation to be a member account and be monitored by the Security Hub administrator account that the invitation was sent from. This operation is only used by member accounts that are not added through Organizations. When the member account accepts the invitation, permission is granted to the administrator account to view findings generated in the member account.

``` swift
func acceptAdministratorInvitation(input: AcceptAdministratorInvitationInput, completion: @escaping (ClientRuntime.SdkResult<AcceptAdministratorInvitationOutputResponse, AcceptAdministratorInvitationOutputError>) -> Void)
```

### acceptInvitation(input:completion:)

This method is deprecated. Instead, use AcceptAdministratorInvitation. The Security Hub console continues to use AcceptInvitation. It will eventually change to use AcceptAdministratorInvitation. Any IAM policies that specifically control access to this function must continue to use AcceptInvitation. You should also add AcceptAdministratorInvitation to your policies to ensure that the correct permissions are in place after the console begins to use AcceptAdministratorInvitation. Accepts the invitation to be a member account and be monitored by the Security Hub administrator account that the invitation was sent from. This operation is only used by member accounts that are not added through Organizations. When the member account accepts the invitation, permission is granted to the administrator account to view findings generated in the member account.

``` swift
@available(*, deprecated, message: "This API has been deprecated, use AcceptAdministratorInvitation API instead.")
    func acceptInvitation(input: AcceptInvitationInput, completion: @escaping (ClientRuntime.SdkResult<AcceptInvitationOutputResponse, AcceptInvitationOutputError>) -> Void)
```

### batchDisableStandards(input:completion:)

Disables the standards specified by the provided StandardsSubscriptionArns. For more information, see [Security Standards](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards.html) section of the Security Hub User Guide.

``` swift
func batchDisableStandards(input: BatchDisableStandardsInput, completion: @escaping (ClientRuntime.SdkResult<BatchDisableStandardsOutputResponse, BatchDisableStandardsOutputError>) -> Void)
```

### batchEnableStandards(input:completion:)

Enables the standards specified by the provided StandardsArn. To obtain the ARN for a standard, use the DescribeStandards operation. For more information, see the [Security Standards](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards.html) section of the Security Hub User Guide.

``` swift
func batchEnableStandards(input: BatchEnableStandardsInput, completion: @escaping (ClientRuntime.SdkResult<BatchEnableStandardsOutputResponse, BatchEnableStandardsOutputError>) -> Void)
```

### batchImportFindings(input:completion:)

Imports security findings generated from an integrated product into Security Hub. This action is requested by the integrated product to import its findings into Security Hub. The maximum allowed size for a finding is 240 Kb. An error is returned for any finding larger than 240 Kb. After a finding is created, BatchImportFindings cannot be used to update the following finding fields and objects, which Security Hub customers use to manage their investigation workflow.

``` swift
func batchImportFindings(input: BatchImportFindingsInput, completion: @escaping (ClientRuntime.SdkResult<BatchImportFindingsOutputResponse, BatchImportFindingsOutputError>) -> Void)
```

  - Note

  - UserDefinedFields

  - VerificationState

  - Workflow

Finding providers also should not use BatchImportFindings to update the following attributes.

  - Confidence

  - Criticality

  - RelatedFindings

  - Severity

  - Types

Instead, finding providers use FindingProviderFields to provide values for these attributes.

### batchUpdateFindings(input:completion:)

Used by Security Hub customers to update information about their investigation into a finding. Requested by administrator accounts or member accounts. Administrator accounts can update findings for their account and their member accounts. Member accounts can update findings for their account. Updates from BatchUpdateFindings do not affect the value of UpdatedAt for a finding. Administrator and member accounts can use BatchUpdateFindings to update the following finding fields and objects.

``` swift
func batchUpdateFindings(input: BatchUpdateFindingsInput, completion: @escaping (ClientRuntime.SdkResult<BatchUpdateFindingsOutputResponse, BatchUpdateFindingsOutputError>) -> Void)
```

  - Confidence

  - Criticality

  - Note

  - RelatedFindings

  - Severity

  - Types

  - UserDefinedFields

  - VerificationState

  - Workflow

You can configure IAM policies to restrict access to fields and field values. For example, you might not want member accounts to be able to suppress findings or change the finding severity. See [Configuring access to BatchUpdateFindings](https://docs.aws.amazon.com/securityhub/latest/userguide/finding-update-batchupdatefindings.html#batchupdatefindings-configure-access) in the Security Hub User Guide.

### createActionTarget(input:completion:)

Creates a custom action target in Security Hub. You can use custom actions on findings and insights in Security Hub to trigger target actions in Amazon CloudWatch Events.

``` swift
func createActionTarget(input: CreateActionTargetInput, completion: @escaping (ClientRuntime.SdkResult<CreateActionTargetOutputResponse, CreateActionTargetOutputError>) -> Void)
```

### createInsight(input:completion:)

Creates a custom insight in Security Hub. An insight is a consolidation of findings that relate to a security issue that requires attention or remediation. To group the related findings in the insight, use the GroupByAttribute.

``` swift
func createInsight(input: CreateInsightInput, completion: @escaping (ClientRuntime.SdkResult<CreateInsightOutputResponse, CreateInsightOutputError>) -> Void)
```

### createMembers(input:completion:)

Creates a member association in Security Hub between the specified accounts and the account used to make the request, which is the administrator account. If you are integrated with Organizations, then the administrator account is designated by the organization management account. CreateMembers is always used to add accounts that are not organization members. For accounts that are managed using Organizations, CreateMembers is only used in the following cases:

``` swift
func createMembers(input: CreateMembersInput, completion: @escaping (ClientRuntime.SdkResult<CreateMembersOutputResponse, CreateMembersOutputError>) -> Void)
```

  - Security Hub is not configured to automatically add new organization accounts.

  - The account was disassociated or deleted in Security Hub.

This action can only be used by an account that has Security Hub enabled. To enable Security Hub, you can use the EnableSecurityHub operation. For accounts that are not organization members, you create the account association and then send an invitation to the member account. To send the invitation, you use the InviteMembers operation. If the account owner accepts the invitation, the account becomes a member account in Security Hub. Accounts that are managed using Organizations do not receive an invitation. They automatically become a member account in Security Hub, and Security Hub is automatically enabled for those accounts. Note that Security Hub cannot be enabled automatically for the organization management account. The organization management account must enable Security Hub before the administrator account enables it as a member account. A permissions policy is added that permits the administrator account to view the findings generated in the member account. When Security Hub is enabled in a member account, the member account findings are also visible to the administrator account. To remove the association between the administrator and member accounts, use the DisassociateFromMasterAccount or DisassociateMembers operation.

### declineInvitations(input:completion:)

Declines invitations to become a member account. This operation is only used by accounts that are not part of an organization. Organization accounts do not receive invitations.

``` swift
func declineInvitations(input: DeclineInvitationsInput, completion: @escaping (ClientRuntime.SdkResult<DeclineInvitationsOutputResponse, DeclineInvitationsOutputError>) -> Void)
```

### deleteActionTarget(input:completion:)

Deletes a custom action target from Security Hub. Deleting a custom action target does not affect any findings or insights that were already sent to Amazon CloudWatch Events using the custom action.

``` swift
func deleteActionTarget(input: DeleteActionTargetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteActionTargetOutputResponse, DeleteActionTargetOutputError>) -> Void)
```

### deleteInsight(input:completion:)

Deletes the insight specified by the InsightArn.

``` swift
func deleteInsight(input: DeleteInsightInput, completion: @escaping (ClientRuntime.SdkResult<DeleteInsightOutputResponse, DeleteInsightOutputError>) -> Void)
```

### deleteInvitations(input:completion:)

Deletes invitations received by the Amazon Web Services account to become a member account. This operation is only used by accounts that are not part of an organization. Organization accounts do not receive invitations.

``` swift
func deleteInvitations(input: DeleteInvitationsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteInvitationsOutputResponse, DeleteInvitationsOutputError>) -> Void)
```

### deleteMembers(input:completion:)

Deletes the specified member accounts from Security Hub. Can be used to delete member accounts that belong to an organization as well as member accounts that were invited manually.

``` swift
func deleteMembers(input: DeleteMembersInput, completion: @escaping (ClientRuntime.SdkResult<DeleteMembersOutputResponse, DeleteMembersOutputError>) -> Void)
```

### describeActionTargets(input:completion:)

Returns a list of the custom action targets in Security Hub in your account.

``` swift
func describeActionTargets(input: DescribeActionTargetsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeActionTargetsOutputResponse, DescribeActionTargetsOutputError>) -> Void)
```

### describeHub(input:completion:)

Returns details about the Hub resource in your account, including the HubArn and the time when you enabled Security Hub.

``` swift
func describeHub(input: DescribeHubInput, completion: @escaping (ClientRuntime.SdkResult<DescribeHubOutputResponse, DescribeHubOutputError>) -> Void)
```

### describeOrganizationConfiguration(input:completion:)

Returns information about the Organizations configuration for Security Hub. Can only be called from a Security Hub administrator account.

``` swift
func describeOrganizationConfiguration(input: DescribeOrganizationConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeOrganizationConfigurationOutputResponse, DescribeOrganizationConfigurationOutputError>) -> Void)
```

### describeProducts(input:completion:)

Returns information about product integrations in Security Hub. You can optionally provide an integration ARN. If you provide an integration ARN, then the results only include that integration. If you do not provide an integration ARN, then the results include all of the available product integrations.

``` swift
func describeProducts(input: DescribeProductsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeProductsOutputResponse, DescribeProductsOutputError>) -> Void)
```

### describeStandards(input:completion:)

Returns a list of the available standards in Security Hub. For each standard, the results include the standard ARN, the name, and a description.

``` swift
func describeStandards(input: DescribeStandardsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeStandardsOutputResponse, DescribeStandardsOutputError>) -> Void)
```

### describeStandardsControls(input:completion:)

Returns a list of security standards controls. For each control, the results include information about whether it is currently enabled, the severity, and a link to remediation information.

``` swift
func describeStandardsControls(input: DescribeStandardsControlsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeStandardsControlsOutputResponse, DescribeStandardsControlsOutputError>) -> Void)
```

### disableImportFindingsForProduct(input:completion:)

Disables the integration of the specified product with Security Hub. After the integration is disabled, findings from that product are no longer sent to Security Hub.

``` swift
func disableImportFindingsForProduct(input: DisableImportFindingsForProductInput, completion: @escaping (ClientRuntime.SdkResult<DisableImportFindingsForProductOutputResponse, DisableImportFindingsForProductOutputError>) -> Void)
```

### disableOrganizationAdminAccount(input:completion:)

Disables a Security Hub administrator account. Can only be called by the organization management account.

``` swift
func disableOrganizationAdminAccount(input: DisableOrganizationAdminAccountInput, completion: @escaping (ClientRuntime.SdkResult<DisableOrganizationAdminAccountOutputResponse, DisableOrganizationAdminAccountOutputError>) -> Void)
```

### disableSecurityHub(input:completion:)

Disables Security Hub in your account only in the current Region. To disable Security Hub in all Regions, you must submit one request per Region where you have enabled Security Hub. When you disable Security Hub for an administrator account, it doesn't disable Security Hub for any associated member accounts. When you disable Security Hub, your existing findings and insights and any Security Hub configuration settings are deleted after 90 days and cannot be recovered. Any standards that were enabled are disabled, and your administrator and member account associations are removed. If you want to save your existing findings, you must export them before you disable Security Hub.

``` swift
func disableSecurityHub(input: DisableSecurityHubInput, completion: @escaping (ClientRuntime.SdkResult<DisableSecurityHubOutputResponse, DisableSecurityHubOutputError>) -> Void)
```

### disassociateFromAdministratorAccount(input:completion:)

Disassociates the current Security Hub member account from the associated administrator account. This operation is only used by accounts that are not part of an organization. For organization accounts, only the administrator account can disassociate a member account.

``` swift
func disassociateFromAdministratorAccount(input: DisassociateFromAdministratorAccountInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateFromAdministratorAccountOutputResponse, DisassociateFromAdministratorAccountOutputError>) -> Void)
```

### disassociateFromMasterAccount(input:completion:)

This method is deprecated. Instead, use DisassociateFromAdministratorAccount. The Security Hub console continues to use DisassociateFromMasterAccount. It will eventually change to use DisassociateFromAdministratorAccount. Any IAM policies that specifically control access to this function must continue to use DisassociateFromMasterAccount. You should also add DisassociateFromAdministratorAccount to your policies to ensure that the correct permissions are in place after the console begins to use DisassociateFromAdministratorAccount. Disassociates the current Security Hub member account from the associated administrator account. This operation is only used by accounts that are not part of an organization. For organization accounts, only the administrator account can disassociate a member account.

``` swift
@available(*, deprecated, message: "This API has been deprecated, use DisassociateFromAdministratorAccount API instead.")
    func disassociateFromMasterAccount(input: DisassociateFromMasterAccountInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateFromMasterAccountOutputResponse, DisassociateFromMasterAccountOutputError>) -> Void)
```

### disassociateMembers(input:completion:)

Disassociates the specified member accounts from the associated administrator account. Can be used to disassociate both accounts that are managed using Organizations and accounts that were invited manually.

``` swift
func disassociateMembers(input: DisassociateMembersInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateMembersOutputResponse, DisassociateMembersOutputError>) -> Void)
```

### enableImportFindingsForProduct(input:completion:)

Enables the integration of a partner product with Security Hub. Integrated products send findings to Security Hub. When you enable a product integration, a permissions policy that grants permission for the product to send findings to Security Hub is applied.

``` swift
func enableImportFindingsForProduct(input: EnableImportFindingsForProductInput, completion: @escaping (ClientRuntime.SdkResult<EnableImportFindingsForProductOutputResponse, EnableImportFindingsForProductOutputError>) -> Void)
```

### enableOrganizationAdminAccount(input:completion:)

Designates the Security Hub administrator account for an organization. Can only be called by the organization management account.

``` swift
func enableOrganizationAdminAccount(input: EnableOrganizationAdminAccountInput, completion: @escaping (ClientRuntime.SdkResult<EnableOrganizationAdminAccountOutputResponse, EnableOrganizationAdminAccountOutputError>) -> Void)
```

### enableSecurityHub(input:completion:)

Enables Security Hub for your account in the current Region or the Region you specify in the request. When you enable Security Hub, you grant to Security Hub the permissions necessary to gather findings from other services that are integrated with Security Hub. When you use the EnableSecurityHub operation to enable Security Hub, you also automatically enable the following standards.

``` swift
func enableSecurityHub(input: EnableSecurityHubInput, completion: @escaping (ClientRuntime.SdkResult<EnableSecurityHubOutputResponse, EnableSecurityHubOutputError>) -> Void)
```

  - CIS Amazon Web Services Foundations

  - Amazon Web Services Foundational Security Best Practices

You do not enable the Payment Card Industry Data Security Standard (PCI DSS) standard. To not enable the automatically enabled standards, set EnableDefaultStandards to false. After you enable Security Hub, to enable a standard, use the BatchEnableStandards operation. To disable a standard, use the BatchDisableStandards operation. To learn more, see the [setup information](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-settingup.html) in the Security Hub User Guide.

### getAdministratorAccount(input:completion:)

Provides the details for the Security Hub administrator account for the current member account. Can be used by both member accounts that are managed using Organizations and accounts that were invited manually.

``` swift
func getAdministratorAccount(input: GetAdministratorAccountInput, completion: @escaping (ClientRuntime.SdkResult<GetAdministratorAccountOutputResponse, GetAdministratorAccountOutputError>) -> Void)
```

### getEnabledStandards(input:completion:)

Returns a list of the standards that are currently enabled.

``` swift
func getEnabledStandards(input: GetEnabledStandardsInput, completion: @escaping (ClientRuntime.SdkResult<GetEnabledStandardsOutputResponse, GetEnabledStandardsOutputError>) -> Void)
```

### getFindings(input:completion:)

Returns a list of findings that match the specified criteria.

``` swift
func getFindings(input: GetFindingsInput, completion: @escaping (ClientRuntime.SdkResult<GetFindingsOutputResponse, GetFindingsOutputError>) -> Void)
```

### getInsightResults(input:completion:)

Lists the results of the Security Hub insight specified by the insight ARN.

``` swift
func getInsightResults(input: GetInsightResultsInput, completion: @escaping (ClientRuntime.SdkResult<GetInsightResultsOutputResponse, GetInsightResultsOutputError>) -> Void)
```

### getInsights(input:completion:)

Lists and describes insights for the specified insight ARNs.

``` swift
func getInsights(input: GetInsightsInput, completion: @escaping (ClientRuntime.SdkResult<GetInsightsOutputResponse, GetInsightsOutputError>) -> Void)
```

### getInvitationsCount(input:completion:)

Returns the count of all Security Hub membership invitations that were sent to the current member account, not including the currently accepted invitation.

``` swift
func getInvitationsCount(input: GetInvitationsCountInput, completion: @escaping (ClientRuntime.SdkResult<GetInvitationsCountOutputResponse, GetInvitationsCountOutputError>) -> Void)
```

### getMasterAccount(input:completion:)

This method is deprecated. Instead, use GetAdministratorAccount. The Security Hub console continues to use GetMasterAccount. It will eventually change to use GetAdministratorAccount. Any IAM policies that specifically control access to this function must continue to use GetMasterAccount. You should also add GetAdministratorAccount to your policies to ensure that the correct permissions are in place after the console begins to use GetAdministratorAccount. Provides the details for the Security Hub administrator account for the current member account. Can be used by both member accounts that are managed using Organizations and accounts that were invited manually.

``` swift
@available(*, deprecated, message: "This API has been deprecated, use GetAdministratorAccount API instead.")
    func getMasterAccount(input: GetMasterAccountInput, completion: @escaping (ClientRuntime.SdkResult<GetMasterAccountOutputResponse, GetMasterAccountOutputError>) -> Void)
```

### getMembers(input:completion:)

Returns the details for the Security Hub member accounts for the specified account IDs. An administrator account can be either the delegated Security Hub administrator account for an organization or an administrator account that enabled Security Hub manually. The results include both member accounts that are managed using Organizations and accounts that were invited manually.

``` swift
func getMembers(input: GetMembersInput, completion: @escaping (ClientRuntime.SdkResult<GetMembersOutputResponse, GetMembersOutputError>) -> Void)
```

### inviteMembers(input:completion:)

Invites other Amazon Web Services accounts to become member accounts for the Security Hub administrator account that the invitation is sent from. This operation is only used to invite accounts that do not belong to an organization. Organization accounts do not receive invitations. Before you can use this action to invite a member, you must first use the CreateMembers action to create the member account in Security Hub. When the account owner enables Security Hub and accepts the invitation to become a member account, the administrator account can view the findings generated from the member account.

``` swift
func inviteMembers(input: InviteMembersInput, completion: @escaping (ClientRuntime.SdkResult<InviteMembersOutputResponse, InviteMembersOutputError>) -> Void)
```

### listEnabledProductsForImport(input:completion:)

Lists all findings-generating solutions (products) that you are subscribed to receive findings from in Security Hub.

``` swift
func listEnabledProductsForImport(input: ListEnabledProductsForImportInput, completion: @escaping (ClientRuntime.SdkResult<ListEnabledProductsForImportOutputResponse, ListEnabledProductsForImportOutputError>) -> Void)
```

### listInvitations(input:completion:)

Lists all Security Hub membership invitations that were sent to the current Amazon Web Services account. This operation is only used by accounts that are managed by invitation. Accounts that are managed using the integration with Organizations do not receive invitations.

``` swift
func listInvitations(input: ListInvitationsInput, completion: @escaping (ClientRuntime.SdkResult<ListInvitationsOutputResponse, ListInvitationsOutputError>) -> Void)
```

### listMembers(input:completion:)

Lists details about all member accounts for the current Security Hub administrator account. The results include both member accounts that belong to an organization and member accounts that were invited manually.

``` swift
func listMembers(input: ListMembersInput, completion: @escaping (ClientRuntime.SdkResult<ListMembersOutputResponse, ListMembersOutputError>) -> Void)
```

### listOrganizationAdminAccounts(input:completion:)

Lists the Security Hub administrator accounts. Can only be called by the organization management account.

``` swift
func listOrganizationAdminAccounts(input: ListOrganizationAdminAccountsInput, completion: @escaping (ClientRuntime.SdkResult<ListOrganizationAdminAccountsOutputResponse, ListOrganizationAdminAccountsOutputError>) -> Void)
```

### listTagsForResource(input:completion:)

Returns a list of tags associated with a resource.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### tagResource(input:completion:)

Adds one or more tags to a resource.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:completion:)

Removes one or more tags from a resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateActionTarget(input:completion:)

Updates the name and description of a custom action target in Security Hub.

``` swift
func updateActionTarget(input: UpdateActionTargetInput, completion: @escaping (ClientRuntime.SdkResult<UpdateActionTargetOutputResponse, UpdateActionTargetOutputError>) -> Void)
```

### updateFindings(input:completion:)

UpdateFindings is deprecated. Instead of UpdateFindings, use BatchUpdateFindings. Updates the Note and RecordState of the Security Hub-aggregated findings that the filter attributes specify. Any member account that can view the finding also sees the update to the finding.

``` swift
func updateFindings(input: UpdateFindingsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFindingsOutputResponse, UpdateFindingsOutputError>) -> Void)
```

### updateInsight(input:completion:)

Updates the Security Hub insight identified by the specified insight ARN.

``` swift
func updateInsight(input: UpdateInsightInput, completion: @escaping (ClientRuntime.SdkResult<UpdateInsightOutputResponse, UpdateInsightOutputError>) -> Void)
```

### updateOrganizationConfiguration(input:completion:)

Used to update the configuration related to Organizations. Can only be called from a Security Hub administrator account.

``` swift
func updateOrganizationConfiguration(input: UpdateOrganizationConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateOrganizationConfigurationOutputResponse, UpdateOrganizationConfigurationOutputError>) -> Void)
```

### updateSecurityHubConfiguration(input:completion:)

Updates configuration options for Security Hub.

``` swift
func updateSecurityHubConfiguration(input: UpdateSecurityHubConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSecurityHubConfigurationOutputResponse, UpdateSecurityHubConfigurationOutputError>) -> Void)
```

### updateStandardsControl(input:completion:)

Used to control whether an individual security standard control is enabled or disabled.

``` swift
func updateStandardsControl(input: UpdateStandardsControlInput, completion: @escaping (ClientRuntime.SdkResult<UpdateStandardsControlOutputResponse, UpdateStandardsControlOutputError>) -> Void)
```
