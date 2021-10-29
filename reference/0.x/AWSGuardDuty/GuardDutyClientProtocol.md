# GuardDutyClientProtocol

Amazon GuardDuty is a continuous security monitoring service that analyzes and processes the following data sources: VPC Flow Logs, AWS CloudTrail event logs, and DNS logs. It uses threat intelligence feeds (such as lists of malicious IPs and domains) and machine learning to identify unexpected, potentially unauthorized, and malicious activity within your AWS environment. This can include issues like escalations of privileges, uses of exposed credentials, or communication with malicious IPs, URLs, or domains. For example, GuardDuty can detect compromised EC2 instances that serve malware or mine bitcoin. GuardDuty also monitors AWS account access behavior for signs of compromise. Some examples of this are unauthorized infrastructure deployments such as EC2 instances deployed in a Region that has never been used, or unusual API calls like a password policy change to reduce password strength. GuardDuty informs you of the status of your AWS environment by producing security findings that you can view in the GuardDuty console or through Amazon CloudWatch events. For more information, see the [Amazon GuardDuty User Guide](https://docs.aws.amazon.com/guardduty/latest/ug/what-is-guardduty.html) .

``` swift
public protocol GuardDutyClientProtocol 
```

## Requirements

### acceptInvitation(input:completion:)

Accepts the invitation to be monitored by a GuardDuty administrator account.

``` swift
func acceptInvitation(input: AcceptInvitationInput, completion: @escaping (ClientRuntime.SdkResult<AcceptInvitationOutputResponse, AcceptInvitationOutputError>) -> Void)
```

### archiveFindings(input:completion:)

Archives GuardDuty findings that are specified by the list of finding IDs. Only the administrator account can archive findings. Member accounts don't have permission to archive findings from their accounts.

``` swift
func archiveFindings(input: ArchiveFindingsInput, completion: @escaping (ClientRuntime.SdkResult<ArchiveFindingsOutputResponse, ArchiveFindingsOutputError>) -> Void)
```

### createDetector(input:completion:)

Creates a single Amazon GuardDuty detector. A detector is a resource that represents the GuardDuty service. To start using GuardDuty, you must create a detector in each Region where you enable the service. You can have only one detector per account per Region. All data sources are enabled in a new detector by default.

``` swift
func createDetector(input: CreateDetectorInput, completion: @escaping (ClientRuntime.SdkResult<CreateDetectorOutputResponse, CreateDetectorOutputError>) -> Void)
```

### createFilter(input:completion:)

Creates a filter using the specified finding criteria.

``` swift
func createFilter(input: CreateFilterInput, completion: @escaping (ClientRuntime.SdkResult<CreateFilterOutputResponse, CreateFilterOutputError>) -> Void)
```

### createIPSet(input:completion:)

Creates a new IPSet, which is called a trusted IP list in the console user interface. An IPSet is a list of IP addresses that are trusted for secure communication with AWS infrastructure and applications. GuardDuty doesn't generate findings for IP addresses that are included in IPSets. Only users from the administrator account can use this operation.

``` swift
func createIPSet(input: CreateIPSetInput, completion: @escaping (ClientRuntime.SdkResult<CreateIPSetOutputResponse, CreateIPSetOutputError>) -> Void)
```

### createMembers(input:completion:)

Creates member accounts of the current AWS account by specifying a list of AWS account IDs. This step is a prerequisite for managing the associated member accounts either by invitation or through an organization. When using Create Members as an organizations delegated administrator this action will enable GuardDuty in the added member accounts, with the exception of the organization delegated administrator account, which must enable GuardDuty prior to being added as a member. If you are adding accounts by invitation use this action after GuardDuty has been enabled in potential member accounts and before using [Invite Members](https://docs.aws.amazon.com/guardduty/latest/APIReference/API_InviteMembers.html).

``` swift
func createMembers(input: CreateMembersInput, completion: @escaping (ClientRuntime.SdkResult<CreateMembersOutputResponse, CreateMembersOutputError>) -> Void)
```

### createPublishingDestination(input:completion:)

Creates a publishing destination to export findings to. The resource to export findings to must exist before you use this operation.

``` swift
func createPublishingDestination(input: CreatePublishingDestinationInput, completion: @escaping (ClientRuntime.SdkResult<CreatePublishingDestinationOutputResponse, CreatePublishingDestinationOutputError>) -> Void)
```

### createSampleFindings(input:completion:)

Generates example findings of types specified by the list of finding types. If 'NULL' is specified for findingTypes, the API generates example findings of all supported finding types.

``` swift
func createSampleFindings(input: CreateSampleFindingsInput, completion: @escaping (ClientRuntime.SdkResult<CreateSampleFindingsOutputResponse, CreateSampleFindingsOutputError>) -> Void)
```

### createThreatIntelSet(input:completion:)

Creates a new ThreatIntelSet. ThreatIntelSets consist of known malicious IP addresses. GuardDuty generates findings based on ThreatIntelSets. Only users of the administrator account can use this operation.

``` swift
func createThreatIntelSet(input: CreateThreatIntelSetInput, completion: @escaping (ClientRuntime.SdkResult<CreateThreatIntelSetOutputResponse, CreateThreatIntelSetOutputError>) -> Void)
```

### declineInvitations(input:completion:)

Declines invitations sent to the current member account by AWS accounts specified by their account IDs.

``` swift
func declineInvitations(input: DeclineInvitationsInput, completion: @escaping (ClientRuntime.SdkResult<DeclineInvitationsOutputResponse, DeclineInvitationsOutputError>) -> Void)
```

### deleteDetector(input:completion:)

Deletes an Amazon GuardDuty detector that is specified by the detector ID.

``` swift
func deleteDetector(input: DeleteDetectorInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDetectorOutputResponse, DeleteDetectorOutputError>) -> Void)
```

### deleteFilter(input:completion:)

Deletes the filter specified by the filter name.

``` swift
func deleteFilter(input: DeleteFilterInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFilterOutputResponse, DeleteFilterOutputError>) -> Void)
```

### deleteInvitations(input:completion:)

Deletes invitations sent to the current member account by AWS accounts specified by their account IDs.

``` swift
func deleteInvitations(input: DeleteInvitationsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteInvitationsOutputResponse, DeleteInvitationsOutputError>) -> Void)
```

### deleteIPSet(input:completion:)

Deletes the IPSet specified by the ipSetId. IPSets are called trusted IP lists in the console user interface.

``` swift
func deleteIPSet(input: DeleteIPSetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteIPSetOutputResponse, DeleteIPSetOutputError>) -> Void)
```

### deleteMembers(input:completion:)

Deletes GuardDuty member accounts (to the current GuardDuty administrator account) specified by the account IDs.

``` swift
func deleteMembers(input: DeleteMembersInput, completion: @escaping (ClientRuntime.SdkResult<DeleteMembersOutputResponse, DeleteMembersOutputError>) -> Void)
```

### deletePublishingDestination(input:completion:)

Deletes the publishing definition with the specified destinationId.

``` swift
func deletePublishingDestination(input: DeletePublishingDestinationInput, completion: @escaping (ClientRuntime.SdkResult<DeletePublishingDestinationOutputResponse, DeletePublishingDestinationOutputError>) -> Void)
```

### deleteThreatIntelSet(input:completion:)

Deletes the ThreatIntelSet specified by the ThreatIntelSet ID.

``` swift
func deleteThreatIntelSet(input: DeleteThreatIntelSetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteThreatIntelSetOutputResponse, DeleteThreatIntelSetOutputError>) -> Void)
```

### describeOrganizationConfiguration(input:completion:)

Returns information about the account selected as the delegated administrator for GuardDuty.

``` swift
func describeOrganizationConfiguration(input: DescribeOrganizationConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeOrganizationConfigurationOutputResponse, DescribeOrganizationConfigurationOutputError>) -> Void)
```

### describePublishingDestination(input:completion:)

Returns information about the publishing destination specified by the provided destinationId.

``` swift
func describePublishingDestination(input: DescribePublishingDestinationInput, completion: @escaping (ClientRuntime.SdkResult<DescribePublishingDestinationOutputResponse, DescribePublishingDestinationOutputError>) -> Void)
```

### disableOrganizationAdminAccount(input:completion:)

Disables an AWS account within the Organization as the GuardDuty delegated administrator.

``` swift
func disableOrganizationAdminAccount(input: DisableOrganizationAdminAccountInput, completion: @escaping (ClientRuntime.SdkResult<DisableOrganizationAdminAccountOutputResponse, DisableOrganizationAdminAccountOutputError>) -> Void)
```

### disassociateFromMasterAccount(input:completion:)

Disassociates the current GuardDuty member account from its administrator account.

``` swift
func disassociateFromMasterAccount(input: DisassociateFromMasterAccountInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateFromMasterAccountOutputResponse, DisassociateFromMasterAccountOutputError>) -> Void)
```

### disassociateMembers(input:completion:)

Disassociates GuardDuty member accounts (to the current GuardDuty administrator account) specified by the account IDs.

``` swift
func disassociateMembers(input: DisassociateMembersInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateMembersOutputResponse, DisassociateMembersOutputError>) -> Void)
```

### enableOrganizationAdminAccount(input:completion:)

Enables an AWS account within the organization as the GuardDuty delegated administrator.

``` swift
func enableOrganizationAdminAccount(input: EnableOrganizationAdminAccountInput, completion: @escaping (ClientRuntime.SdkResult<EnableOrganizationAdminAccountOutputResponse, EnableOrganizationAdminAccountOutputError>) -> Void)
```

### getDetector(input:completion:)

Retrieves an Amazon GuardDuty detector specified by the detectorId.

``` swift
func getDetector(input: GetDetectorInput, completion: @escaping (ClientRuntime.SdkResult<GetDetectorOutputResponse, GetDetectorOutputError>) -> Void)
```

### getFilter(input:completion:)

Returns the details of the filter specified by the filter name.

``` swift
func getFilter(input: GetFilterInput, completion: @escaping (ClientRuntime.SdkResult<GetFilterOutputResponse, GetFilterOutputError>) -> Void)
```

### getFindings(input:completion:)

Describes Amazon GuardDuty findings specified by finding IDs.

``` swift
func getFindings(input: GetFindingsInput, completion: @escaping (ClientRuntime.SdkResult<GetFindingsOutputResponse, GetFindingsOutputError>) -> Void)
```

### getFindingsStatistics(input:completion:)

Lists Amazon GuardDuty findings statistics for the specified detector ID.

``` swift
func getFindingsStatistics(input: GetFindingsStatisticsInput, completion: @escaping (ClientRuntime.SdkResult<GetFindingsStatisticsOutputResponse, GetFindingsStatisticsOutputError>) -> Void)
```

### getInvitationsCount(input:completion:)

Returns the count of all GuardDuty membership invitations that were sent to the current member account except the currently accepted invitation.

``` swift
func getInvitationsCount(input: GetInvitationsCountInput, completion: @escaping (ClientRuntime.SdkResult<GetInvitationsCountOutputResponse, GetInvitationsCountOutputError>) -> Void)
```

### getIPSet(input:completion:)

Retrieves the IPSet specified by the ipSetId.

``` swift
func getIPSet(input: GetIPSetInput, completion: @escaping (ClientRuntime.SdkResult<GetIPSetOutputResponse, GetIPSetOutputError>) -> Void)
```

### getMasterAccount(input:completion:)

Provides the details for the GuardDuty administrator account associated with the current GuardDuty member account.

``` swift
func getMasterAccount(input: GetMasterAccountInput, completion: @escaping (ClientRuntime.SdkResult<GetMasterAccountOutputResponse, GetMasterAccountOutputError>) -> Void)
```

### getMemberDetectors(input:completion:)

Describes which data sources are enabled for the member account's detector.

``` swift
func getMemberDetectors(input: GetMemberDetectorsInput, completion: @escaping (ClientRuntime.SdkResult<GetMemberDetectorsOutputResponse, GetMemberDetectorsOutputError>) -> Void)
```

### getMembers(input:completion:)

Retrieves GuardDuty member accounts (of the current GuardDuty administrator account) specified by the account IDs.

``` swift
func getMembers(input: GetMembersInput, completion: @escaping (ClientRuntime.SdkResult<GetMembersOutputResponse, GetMembersOutputError>) -> Void)
```

### getThreatIntelSet(input:completion:)

Retrieves the ThreatIntelSet that is specified by the ThreatIntelSet ID.

``` swift
func getThreatIntelSet(input: GetThreatIntelSetInput, completion: @escaping (ClientRuntime.SdkResult<GetThreatIntelSetOutputResponse, GetThreatIntelSetOutputError>) -> Void)
```

### getUsageStatistics(input:completion:)

Lists Amazon GuardDuty usage statistics over the last 30 days for the specified detector ID. For newly enabled detectors or data sources the cost returned will include only the usage so far under 30 days, this may differ from the cost metrics in the console, which projects usage over 30 days to provide a monthly cost estimate. For more information see [Understanding How Usage Costs are Calculated](https://docs.aws.amazon.com/guardduty/latest/ug/monitoring_costs.html#usage-calculations).

``` swift
func getUsageStatistics(input: GetUsageStatisticsInput, completion: @escaping (ClientRuntime.SdkResult<GetUsageStatisticsOutputResponse, GetUsageStatisticsOutputError>) -> Void)
```

### inviteMembers(input:completion:)

Invites other AWS accounts (created as members of the current AWS account by CreateMembers) to enable GuardDuty, and allow the current AWS account to view and manage these accounts' findings on their behalf as the GuardDuty administrator account.

``` swift
func inviteMembers(input: InviteMembersInput, completion: @escaping (ClientRuntime.SdkResult<InviteMembersOutputResponse, InviteMembersOutputError>) -> Void)
```

### listDetectors(input:completion:)

Lists detectorIds of all the existing Amazon GuardDuty detector resources.

``` swift
func listDetectors(input: ListDetectorsInput, completion: @escaping (ClientRuntime.SdkResult<ListDetectorsOutputResponse, ListDetectorsOutputError>) -> Void)
```

### listFilters(input:completion:)

Returns a paginated list of the current filters.

``` swift
func listFilters(input: ListFiltersInput, completion: @escaping (ClientRuntime.SdkResult<ListFiltersOutputResponse, ListFiltersOutputError>) -> Void)
```

### listFindings(input:completion:)

Lists Amazon GuardDuty findings for the specified detector ID.

``` swift
func listFindings(input: ListFindingsInput, completion: @escaping (ClientRuntime.SdkResult<ListFindingsOutputResponse, ListFindingsOutputError>) -> Void)
```

### listInvitations(input:completion:)

Lists all GuardDuty membership invitations that were sent to the current AWS account.

``` swift
func listInvitations(input: ListInvitationsInput, completion: @escaping (ClientRuntime.SdkResult<ListInvitationsOutputResponse, ListInvitationsOutputError>) -> Void)
```

### listIPSets(input:completion:)

Lists the IPSets of the GuardDuty service specified by the detector ID. If you use this operation from a member account, the IPSets returned are the IPSets from the associated administrator account.

``` swift
func listIPSets(input: ListIPSetsInput, completion: @escaping (ClientRuntime.SdkResult<ListIPSetsOutputResponse, ListIPSetsOutputError>) -> Void)
```

### listMembers(input:completion:)

Lists details about all member accounts for the current GuardDuty administrator account.

``` swift
func listMembers(input: ListMembersInput, completion: @escaping (ClientRuntime.SdkResult<ListMembersOutputResponse, ListMembersOutputError>) -> Void)
```

### listOrganizationAdminAccounts(input:completion:)

Lists the accounts configured as GuardDuty delegated administrators.

``` swift
func listOrganizationAdminAccounts(input: ListOrganizationAdminAccountsInput, completion: @escaping (ClientRuntime.SdkResult<ListOrganizationAdminAccountsOutputResponse, ListOrganizationAdminAccountsOutputError>) -> Void)
```

### listPublishingDestinations(input:completion:)

Returns a list of publishing destinations associated with the specified dectectorId.

``` swift
func listPublishingDestinations(input: ListPublishingDestinationsInput, completion: @escaping (ClientRuntime.SdkResult<ListPublishingDestinationsOutputResponse, ListPublishingDestinationsOutputError>) -> Void)
```

### listTagsForResource(input:completion:)

Lists tags for a resource. Tagging is currently supported for detectors, finding filters, IP sets, and threat intel sets, with a limit of 50 tags per resource. When invoked, this operation returns all assigned tags for a given resource.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### listThreatIntelSets(input:completion:)

Lists the ThreatIntelSets of the GuardDuty service specified by the detector ID. If you use this operation from a member account, the ThreatIntelSets associated with the administrator account are returned.

``` swift
func listThreatIntelSets(input: ListThreatIntelSetsInput, completion: @escaping (ClientRuntime.SdkResult<ListThreatIntelSetsOutputResponse, ListThreatIntelSetsOutputError>) -> Void)
```

### startMonitoringMembers(input:completion:)

Turns on GuardDuty monitoring of the specified member accounts. Use this operation to restart monitoring of accounts that you stopped monitoring with the StopMonitoringMembers operation.

``` swift
func startMonitoringMembers(input: StartMonitoringMembersInput, completion: @escaping (ClientRuntime.SdkResult<StartMonitoringMembersOutputResponse, StartMonitoringMembersOutputError>) -> Void)
```

### stopMonitoringMembers(input:completion:)

Stops GuardDuty monitoring for the specified member accounts. Use the StartMonitoringMembers operation to restart monitoring for those accounts.

``` swift
func stopMonitoringMembers(input: StopMonitoringMembersInput, completion: @escaping (ClientRuntime.SdkResult<StopMonitoringMembersOutputResponse, StopMonitoringMembersOutputError>) -> Void)
```

### tagResource(input:completion:)

Adds tags to a resource.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### unarchiveFindings(input:completion:)

Unarchives GuardDuty findings specified by the findingIds.

``` swift
func unarchiveFindings(input: UnarchiveFindingsInput, completion: @escaping (ClientRuntime.SdkResult<UnarchiveFindingsOutputResponse, UnarchiveFindingsOutputError>) -> Void)
```

### untagResource(input:completion:)

Removes tags from a resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateDetector(input:completion:)

Updates the Amazon GuardDuty detector specified by the detectorId.

``` swift
func updateDetector(input: UpdateDetectorInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDetectorOutputResponse, UpdateDetectorOutputError>) -> Void)
```

### updateFilter(input:completion:)

Updates the filter specified by the filter name.

``` swift
func updateFilter(input: UpdateFilterInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFilterOutputResponse, UpdateFilterOutputError>) -> Void)
```

### updateFindingsFeedback(input:completion:)

Marks the specified GuardDuty findings as useful or not useful.

``` swift
func updateFindingsFeedback(input: UpdateFindingsFeedbackInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFindingsFeedbackOutputResponse, UpdateFindingsFeedbackOutputError>) -> Void)
```

### updateIPSet(input:completion:)

Updates the IPSet specified by the IPSet ID.

``` swift
func updateIPSet(input: UpdateIPSetInput, completion: @escaping (ClientRuntime.SdkResult<UpdateIPSetOutputResponse, UpdateIPSetOutputError>) -> Void)
```

### updateMemberDetectors(input:completion:)

Contains information on member accounts to be updated.

``` swift
func updateMemberDetectors(input: UpdateMemberDetectorsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateMemberDetectorsOutputResponse, UpdateMemberDetectorsOutputError>) -> Void)
```

### updateOrganizationConfiguration(input:completion:)

Updates the delegated administrator account with the values provided.

``` swift
func updateOrganizationConfiguration(input: UpdateOrganizationConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateOrganizationConfigurationOutputResponse, UpdateOrganizationConfigurationOutputError>) -> Void)
```

### updatePublishingDestination(input:completion:)

Updates information about the publishing destination specified by the destinationId.

``` swift
func updatePublishingDestination(input: UpdatePublishingDestinationInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePublishingDestinationOutputResponse, UpdatePublishingDestinationOutputError>) -> Void)
```

### updateThreatIntelSet(input:completion:)

Updates the ThreatIntelSet specified by the ThreatIntelSet ID.

``` swift
func updateThreatIntelSet(input: UpdateThreatIntelSetInput, completion: @escaping (ClientRuntime.SdkResult<UpdateThreatIntelSetOutputResponse, UpdateThreatIntelSetOutputError>) -> Void)
```
