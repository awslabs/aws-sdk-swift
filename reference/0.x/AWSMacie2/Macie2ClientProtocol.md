# Macie2ClientProtocol

Amazon Macie is a fully managed data security and data privacy service that uses machine learning and pattern matching to discover and protect your sensitive data in AWS. Macie automates the discovery of sensitive data, such as PII and intellectual property, to provide you with insight into the data that your organization stores in AWS. Macie also provides an inventory of your Amazon S3 buckets, which it continually monitors for you. If Macie detects sensitive data or potential data access issues, it generates detailed findings for you to review and act upon as necessary.

``` swift
public protocol Macie2ClientProtocol 
```

## Requirements

### acceptInvitation(input:​completion:​)

Accepts an Amazon Macie membership invitation that was received from a specific account.

``` swift
func acceptInvitation(input: AcceptInvitationInput, completion: @escaping (ClientRuntime.SdkResult<AcceptInvitationOutputResponse, AcceptInvitationOutputError>) -> Void)
```

### batchGetCustomDataIdentifiers(input:​completion:​)

Retrieves information about one or more custom data identifiers.

``` swift
func batchGetCustomDataIdentifiers(input: BatchGetCustomDataIdentifiersInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetCustomDataIdentifiersOutputResponse, BatchGetCustomDataIdentifiersOutputError>) -> Void)
```

### createClassificationJob(input:​completion:​)

Creates and defines the settings for a classification job.

``` swift
func createClassificationJob(input: CreateClassificationJobInput, completion: @escaping (ClientRuntime.SdkResult<CreateClassificationJobOutputResponse, CreateClassificationJobOutputError>) -> Void)
```

### createCustomDataIdentifier(input:​completion:​)

Creates and defines the criteria and other settings for a custom data identifier.

``` swift
func createCustomDataIdentifier(input: CreateCustomDataIdentifierInput, completion: @escaping (ClientRuntime.SdkResult<CreateCustomDataIdentifierOutputResponse, CreateCustomDataIdentifierOutputError>) -> Void)
```

### createFindingsFilter(input:​completion:​)

Creates and defines the criteria and other settings for a findings filter.

``` swift
func createFindingsFilter(input: CreateFindingsFilterInput, completion: @escaping (ClientRuntime.SdkResult<CreateFindingsFilterOutputResponse, CreateFindingsFilterOutputError>) -> Void)
```

### createInvitations(input:​completion:​)

Sends an Amazon Macie membership invitation to one or more accounts.

``` swift
func createInvitations(input: CreateInvitationsInput, completion: @escaping (ClientRuntime.SdkResult<CreateInvitationsOutputResponse, CreateInvitationsOutputError>) -> Void)
```

### createMember(input:​completion:​)

Associates an account with an Amazon Macie administrator account.

``` swift
func createMember(input: CreateMemberInput, completion: @escaping (ClientRuntime.SdkResult<CreateMemberOutputResponse, CreateMemberOutputError>) -> Void)
```

### createSampleFindings(input:​completion:​)

Creates sample findings.

``` swift
func createSampleFindings(input: CreateSampleFindingsInput, completion: @escaping (ClientRuntime.SdkResult<CreateSampleFindingsOutputResponse, CreateSampleFindingsOutputError>) -> Void)
```

### declineInvitations(input:​completion:​)

Declines Amazon Macie membership invitations that were received from specific accounts.

``` swift
func declineInvitations(input: DeclineInvitationsInput, completion: @escaping (ClientRuntime.SdkResult<DeclineInvitationsOutputResponse, DeclineInvitationsOutputError>) -> Void)
```

### deleteCustomDataIdentifier(input:​completion:​)

Soft deletes a custom data identifier.

``` swift
func deleteCustomDataIdentifier(input: DeleteCustomDataIdentifierInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCustomDataIdentifierOutputResponse, DeleteCustomDataIdentifierOutputError>) -> Void)
```

### deleteFindingsFilter(input:​completion:​)

Deletes a findings filter.

``` swift
func deleteFindingsFilter(input: DeleteFindingsFilterInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFindingsFilterOutputResponse, DeleteFindingsFilterOutputError>) -> Void)
```

### deleteInvitations(input:​completion:​)

Deletes Amazon Macie membership invitations that were received from specific accounts.

``` swift
func deleteInvitations(input: DeleteInvitationsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteInvitationsOutputResponse, DeleteInvitationsOutputError>) -> Void)
```

### deleteMember(input:​completion:​)

Deletes the association between an Amazon Macie administrator account and an account.

``` swift
func deleteMember(input: DeleteMemberInput, completion: @escaping (ClientRuntime.SdkResult<DeleteMemberOutputResponse, DeleteMemberOutputError>) -> Void)
```

### describeBuckets(input:​completion:​)

Retrieves (queries) statistical data and other information about one or more S3 buckets that Amazon Macie monitors and analyzes.

``` swift
func describeBuckets(input: DescribeBucketsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBucketsOutputResponse, DescribeBucketsOutputError>) -> Void)
```

### describeClassificationJob(input:​completion:​)

Retrieves the status and settings for a classification job.

``` swift
func describeClassificationJob(input: DescribeClassificationJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeClassificationJobOutputResponse, DescribeClassificationJobOutputError>) -> Void)
```

### describeOrganizationConfiguration(input:​completion:​)

Retrieves the Amazon Macie configuration settings for an Amazon Web Services organization.

``` swift
func describeOrganizationConfiguration(input: DescribeOrganizationConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeOrganizationConfigurationOutputResponse, DescribeOrganizationConfigurationOutputError>) -> Void)
```

### disableMacie(input:​completion:​)

Disables an Amazon Macie account and deletes Macie resources for the account.

``` swift
func disableMacie(input: DisableMacieInput, completion: @escaping (ClientRuntime.SdkResult<DisableMacieOutputResponse, DisableMacieOutputError>) -> Void)
```

### disableOrganizationAdminAccount(input:​completion:​)

Disables an account as the delegated Amazon Macie administrator account for an Amazon Web Services organization.

``` swift
func disableOrganizationAdminAccount(input: DisableOrganizationAdminAccountInput, completion: @escaping (ClientRuntime.SdkResult<DisableOrganizationAdminAccountOutputResponse, DisableOrganizationAdminAccountOutputError>) -> Void)
```

### disassociateFromAdministratorAccount(input:​completion:​)

Disassociates a member account from its Amazon Macie administrator account.

``` swift
func disassociateFromAdministratorAccount(input: DisassociateFromAdministratorAccountInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateFromAdministratorAccountOutputResponse, DisassociateFromAdministratorAccountOutputError>) -> Void)
```

### disassociateFromMasterAccount(input:​completion:​)

(Deprecated) Disassociates a member account from its Amazon Macie administrator account. This operation has been replaced by the <link  linkend="DisassociateFromAdministratorAccount">DisassociateFromAdministratorAccount</link> operation.

``` swift
func disassociateFromMasterAccount(input: DisassociateFromMasterAccountInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateFromMasterAccountOutputResponse, DisassociateFromMasterAccountOutputError>) -> Void)
```

### disassociateMember(input:​completion:​)

Disassociates an Amazon Macie administrator account from a member account.

``` swift
func disassociateMember(input: DisassociateMemberInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateMemberOutputResponse, DisassociateMemberOutputError>) -> Void)
```

### enableMacie(input:​completion:​)

Enables Amazon Macie and specifies the configuration settings for a Macie account.

``` swift
func enableMacie(input: EnableMacieInput, completion: @escaping (ClientRuntime.SdkResult<EnableMacieOutputResponse, EnableMacieOutputError>) -> Void)
```

### enableOrganizationAdminAccount(input:​completion:​)

Designates an account as the delegated Amazon Macie administrator account for an Amazon Web Services organization.

``` swift
func enableOrganizationAdminAccount(input: EnableOrganizationAdminAccountInput, completion: @escaping (ClientRuntime.SdkResult<EnableOrganizationAdminAccountOutputResponse, EnableOrganizationAdminAccountOutputError>) -> Void)
```

### getAdministratorAccount(input:​completion:​)

Retrieves information about the Amazon Macie administrator account for an account.

``` swift
func getAdministratorAccount(input: GetAdministratorAccountInput, completion: @escaping (ClientRuntime.SdkResult<GetAdministratorAccountOutputResponse, GetAdministratorAccountOutputError>) -> Void)
```

### getBucketStatistics(input:​completion:​)

Retrieves (queries) aggregated statistical data for all the S3 buckets that Amazon Macie monitors and analyzes.

``` swift
func getBucketStatistics(input: GetBucketStatisticsInput, completion: @escaping (ClientRuntime.SdkResult<GetBucketStatisticsOutputResponse, GetBucketStatisticsOutputError>) -> Void)
```

### getClassificationExportConfiguration(input:​completion:​)

Retrieves the configuration settings for storing data classification results.

``` swift
func getClassificationExportConfiguration(input: GetClassificationExportConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetClassificationExportConfigurationOutputResponse, GetClassificationExportConfigurationOutputError>) -> Void)
```

### getCustomDataIdentifier(input:​completion:​)

Retrieves the criteria and other settings for a custom data identifier.

``` swift
func getCustomDataIdentifier(input: GetCustomDataIdentifierInput, completion: @escaping (ClientRuntime.SdkResult<GetCustomDataIdentifierOutputResponse, GetCustomDataIdentifierOutputError>) -> Void)
```

### getFindings(input:​completion:​)

Retrieves the details of one or more findings.

``` swift
func getFindings(input: GetFindingsInput, completion: @escaping (ClientRuntime.SdkResult<GetFindingsOutputResponse, GetFindingsOutputError>) -> Void)
```

### getFindingsFilter(input:​completion:​)

Retrieves the criteria and other settings for a findings filter.

``` swift
func getFindingsFilter(input: GetFindingsFilterInput, completion: @escaping (ClientRuntime.SdkResult<GetFindingsFilterOutputResponse, GetFindingsFilterOutputError>) -> Void)
```

### getFindingsPublicationConfiguration(input:​completion:​)

Retrieves the configuration settings for publishing findings to Security Hub.

``` swift
func getFindingsPublicationConfiguration(input: GetFindingsPublicationConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetFindingsPublicationConfigurationOutputResponse, GetFindingsPublicationConfigurationOutputError>) -> Void)
```

### getFindingStatistics(input:​completion:​)

Retrieves (queries) aggregated statistical data about findings.

``` swift
func getFindingStatistics(input: GetFindingStatisticsInput, completion: @escaping (ClientRuntime.SdkResult<GetFindingStatisticsOutputResponse, GetFindingStatisticsOutputError>) -> Void)
```

### getInvitationsCount(input:​completion:​)

Retrieves the count of Amazon Macie membership invitations that were received by an account.

``` swift
func getInvitationsCount(input: GetInvitationsCountInput, completion: @escaping (ClientRuntime.SdkResult<GetInvitationsCountOutputResponse, GetInvitationsCountOutputError>) -> Void)
```

### getMacieSession(input:​completion:​)

Retrieves the current status and configuration settings for an Amazon Macie account.

``` swift
func getMacieSession(input: GetMacieSessionInput, completion: @escaping (ClientRuntime.SdkResult<GetMacieSessionOutputResponse, GetMacieSessionOutputError>) -> Void)
```

### getMasterAccount(input:​completion:​)

(Deprecated) Retrieves information about the Amazon Macie administrator account for an account. This operation has been replaced by the <link  linkend="GetAdministratorAccount">GetAdministratorAccount</link> operation.

``` swift
func getMasterAccount(input: GetMasterAccountInput, completion: @escaping (ClientRuntime.SdkResult<GetMasterAccountOutputResponse, GetMasterAccountOutputError>) -> Void)
```

### getMember(input:​completion:​)

Retrieves information about an account that's associated with an Amazon Macie administrator account.

``` swift
func getMember(input: GetMemberInput, completion: @escaping (ClientRuntime.SdkResult<GetMemberOutputResponse, GetMemberOutputError>) -> Void)
```

### getUsageStatistics(input:​completion:​)

Retrieves (queries) quotas and aggregated usage data for one or more accounts.

``` swift
func getUsageStatistics(input: GetUsageStatisticsInput, completion: @escaping (ClientRuntime.SdkResult<GetUsageStatisticsOutputResponse, GetUsageStatisticsOutputError>) -> Void)
```

### getUsageTotals(input:​completion:​)

Retrieves (queries) aggregated usage data for an account.

``` swift
func getUsageTotals(input: GetUsageTotalsInput, completion: @escaping (ClientRuntime.SdkResult<GetUsageTotalsOutputResponse, GetUsageTotalsOutputError>) -> Void)
```

### listClassificationJobs(input:​completion:​)

Retrieves a subset of information about one or more classification jobs.

``` swift
func listClassificationJobs(input: ListClassificationJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListClassificationJobsOutputResponse, ListClassificationJobsOutputError>) -> Void)
```

### listCustomDataIdentifiers(input:​completion:​)

Retrieves a subset of information about all the custom data identifiers for an account.

``` swift
func listCustomDataIdentifiers(input: ListCustomDataIdentifiersInput, completion: @escaping (ClientRuntime.SdkResult<ListCustomDataIdentifiersOutputResponse, ListCustomDataIdentifiersOutputError>) -> Void)
```

### listFindings(input:​completion:​)

Retrieves a subset of information about one or more findings.

``` swift
func listFindings(input: ListFindingsInput, completion: @escaping (ClientRuntime.SdkResult<ListFindingsOutputResponse, ListFindingsOutputError>) -> Void)
```

### listFindingsFilters(input:​completion:​)

Retrieves a subset of information about all the findings filters for an account.

``` swift
func listFindingsFilters(input: ListFindingsFiltersInput, completion: @escaping (ClientRuntime.SdkResult<ListFindingsFiltersOutputResponse, ListFindingsFiltersOutputError>) -> Void)
```

### listInvitations(input:​completion:​)

Retrieves information about the Amazon Macie membership invitations that were received by an account.

``` swift
func listInvitations(input: ListInvitationsInput, completion: @escaping (ClientRuntime.SdkResult<ListInvitationsOutputResponse, ListInvitationsOutputError>) -> Void)
```

### listManagedDataIdentifiers(input:​completion:​)

Retrieves information about all the managed data identifiers that Amazon Macie currently provides.

``` swift
func listManagedDataIdentifiers(input: ListManagedDataIdentifiersInput, completion: @escaping (ClientRuntime.SdkResult<ListManagedDataIdentifiersOutputResponse, ListManagedDataIdentifiersOutputError>) -> Void)
```

### listMembers(input:​completion:​)

Retrieves information about the accounts that are associated with an Amazon Macie administrator account.

``` swift
func listMembers(input: ListMembersInput, completion: @escaping (ClientRuntime.SdkResult<ListMembersOutputResponse, ListMembersOutputError>) -> Void)
```

### listOrganizationAdminAccounts(input:​completion:​)

Retrieves information about the delegated Amazon Macie administrator account for an Amazon Web Services organization.

``` swift
func listOrganizationAdminAccounts(input: ListOrganizationAdminAccountsInput, completion: @escaping (ClientRuntime.SdkResult<ListOrganizationAdminAccountsOutputResponse, ListOrganizationAdminAccountsOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

Retrieves the tags (keys and values) that are associated with a classification job, custom data identifier, findings filter, or member account.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### putClassificationExportConfiguration(input:​completion:​)

Creates or updates the configuration settings for storing data classification results.

``` swift
func putClassificationExportConfiguration(input: PutClassificationExportConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<PutClassificationExportConfigurationOutputResponse, PutClassificationExportConfigurationOutputError>) -> Void)
```

### putFindingsPublicationConfiguration(input:​completion:​)

Updates the configuration settings for publishing findings to Security Hub.

``` swift
func putFindingsPublicationConfiguration(input: PutFindingsPublicationConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<PutFindingsPublicationConfigurationOutputResponse, PutFindingsPublicationConfigurationOutputError>) -> Void)
```

### searchResources(input:​completion:​)

Retrieves (queries) statistical data and other information about Amazon Web Services resources that Amazon Macie monitors and analyzes.

``` swift
func searchResources(input: SearchResourcesInput, completion: @escaping (ClientRuntime.SdkResult<SearchResourcesOutputResponse, SearchResourcesOutputError>) -> Void)
```

### tagResource(input:​completion:​)

Adds or updates one or more tags (keys and values) that are associated with a classification job, custom data identifier, findings filter, or member account.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### testCustomDataIdentifier(input:​completion:​)

Tests a custom data identifier.

``` swift
func testCustomDataIdentifier(input: TestCustomDataIdentifierInput, completion: @escaping (ClientRuntime.SdkResult<TestCustomDataIdentifierOutputResponse, TestCustomDataIdentifierOutputError>) -> Void)
```

### untagResource(input:​completion:​)

Removes one or more tags (keys and values) from a classification job, custom data identifier, findings filter, or member account.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateClassificationJob(input:​completion:​)

Changes the status of a classification job.

``` swift
func updateClassificationJob(input: UpdateClassificationJobInput, completion: @escaping (ClientRuntime.SdkResult<UpdateClassificationJobOutputResponse, UpdateClassificationJobOutputError>) -> Void)
```

### updateFindingsFilter(input:​completion:​)

Updates the criteria and other settings for a findings filter.

``` swift
func updateFindingsFilter(input: UpdateFindingsFilterInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFindingsFilterOutputResponse, UpdateFindingsFilterOutputError>) -> Void)
```

### updateMacieSession(input:​completion:​)

Suspends or re-enables an Amazon Macie account, or updates the configuration settings for a Macie account.

``` swift
func updateMacieSession(input: UpdateMacieSessionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateMacieSessionOutputResponse, UpdateMacieSessionOutputError>) -> Void)
```

### updateMemberSession(input:​completion:​)

Enables an Amazon Macie administrator to suspend or re-enable a member account.

``` swift
func updateMemberSession(input: UpdateMemberSessionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateMemberSessionOutputResponse, UpdateMemberSessionOutputError>) -> Void)
```

### updateOrganizationConfiguration(input:​completion:​)

Updates the Amazon Macie configuration settings for an Amazon Web Services organization.

``` swift
func updateOrganizationConfiguration(input: UpdateOrganizationConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateOrganizationConfigurationOutputResponse, UpdateOrganizationConfigurationOutputError>) -> Void)
```
