# WorkMailClientProtocol

Amazon WorkMail is a secure, managed business email and calendaring service with support for
existing desktop and mobile email clients. You can access your email, contacts, and
calendars using Microsoft Outlook, your browser, or other native iOS and Android email
applications. You can integrate WorkMail with your existing corporate directory and control
both the keys that encrypt your data and the location in which your data is
stored.
The WorkMail API is designed for the following scenarios:​

``` swift
public protocol WorkMailClientProtocol 
```

``` 
           Listing and describing organizations




           Managing users




           Managing groups




           Managing resources


     All WorkMail API operations are Amazon-authenticated and certificate-signed. They not
     only require the use of the AWS SDK, but also allow for the exclusive use of AWS Identity and Access Management
     users and roles to help facilitate access, trust, and permission policies. By creating a
     role and allowing an IAM user to access the WorkMail site, the IAM user gains full
     administrative visibility into the entire WorkMail organization (or as set in the IAM
     policy). This includes, but is not limited to, the ability to create, update, and delete
     users, groups, and resources. This allows developers to perform the scenarios listed above,
     as well as give users the ability to grant access on a selective basis using the IAM
     model.
```

## Requirements

### associateDelegateToResource(input:​completion:​)

Adds a member (user or group) to the resource's set of delegates.

``` swift
func associateDelegateToResource(input: AssociateDelegateToResourceInput, completion: @escaping (ClientRuntime.SdkResult<AssociateDelegateToResourceOutputResponse, AssociateDelegateToResourceOutputError>) -> Void)
```

### associateMemberToGroup(input:​completion:​)

Adds a member (user or group) to the group's set.

``` swift
func associateMemberToGroup(input: AssociateMemberToGroupInput, completion: @escaping (ClientRuntime.SdkResult<AssociateMemberToGroupOutputResponse, AssociateMemberToGroupOutputError>) -> Void)
```

### cancelMailboxExportJob(input:​completion:​)

Cancels a mailbox export job.

``` swift
func cancelMailboxExportJob(input: CancelMailboxExportJobInput, completion: @escaping (ClientRuntime.SdkResult<CancelMailboxExportJobOutputResponse, CancelMailboxExportJobOutputError>) -> Void)
```

``` 
        If the mailbox export job is near completion, it might not be possible to cancel
        it.
```

### createAlias(input:​completion:​)

Adds an alias to the set of a given member (user or group) of Amazon WorkMail.

``` swift
func createAlias(input: CreateAliasInput, completion: @escaping (ClientRuntime.SdkResult<CreateAliasOutputResponse, CreateAliasOutputError>) -> Void)
```

### createGroup(input:​completion:​)

Creates a group that can be used in Amazon WorkMail by calling the RegisterToWorkMail operation.

``` swift
func createGroup(input: CreateGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateGroupOutputResponse, CreateGroupOutputError>) -> Void)
```

### createMobileDeviceAccessRule(input:​completion:​)

Creates a new mobile device access rule for the specified Amazon WorkMail organization.

``` swift
func createMobileDeviceAccessRule(input: CreateMobileDeviceAccessRuleInput, completion: @escaping (ClientRuntime.SdkResult<CreateMobileDeviceAccessRuleOutputResponse, CreateMobileDeviceAccessRuleOutputError>) -> Void)
```

### createOrganization(input:​completion:​)

Creates a new Amazon WorkMail organization. Optionally, you can choose to associate an existing AWS Directory Service directory with your organization. If an AWS Directory Service directory ID is specified, the organization alias must match the directory alias. If you choose not to associate an existing directory with your organization, then we create a new Amazon WorkMail directory for you. For more information, see <a href="https:​//docs.aws.amazon.com/workmail/latest/adminguide/add_new_organization.html">Adding an organization in the Amazon WorkMail Administrator Guide.
You can associate multiple email domains with an organization, then set your default email domain from the Amazon WorkMail console. You can also associate a domain that is managed in an Amazon Route 53 public hosted zone. For more information, see <a href="https:​//docs.aws.amazon.com/workmail/latest/adminguide/add_domain.html">Adding a domain and <a href="https:​//docs.aws.amazon.com/workmail/latest/adminguide/default_domain.html">Choosing the default domain in the Amazon WorkMail Administrator Guide.
Optionally, you can use a customer managed master key from AWS Key Management Service
(AWS KMS) to encrypt email for your organization. If you don't associate an AWS KMS key, Amazon WorkMail creates a
default AWS managed master key for you.

``` swift
func createOrganization(input: CreateOrganizationInput, completion: @escaping (ClientRuntime.SdkResult<CreateOrganizationOutputResponse, CreateOrganizationOutputError>) -> Void)
```

### createResource(input:​completion:​)

Creates a new Amazon WorkMail resource.

``` swift
func createResource(input: CreateResourceInput, completion: @escaping (ClientRuntime.SdkResult<CreateResourceOutputResponse, CreateResourceOutputError>) -> Void)
```

### createUser(input:​completion:​)

Creates a user who can be used in Amazon WorkMail by calling the RegisterToWorkMail operation.

``` swift
func createUser(input: CreateUserInput, completion: @escaping (ClientRuntime.SdkResult<CreateUserOutputResponse, CreateUserOutputError>) -> Void)
```

### deleteAccessControlRule(input:​completion:​)

Deletes an access control rule for the specified WorkMail organization.

``` swift
func deleteAccessControlRule(input: DeleteAccessControlRuleInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAccessControlRuleOutputResponse, DeleteAccessControlRuleOutputError>) -> Void)
```

### deleteAlias(input:​completion:​)

Remove one or more specified aliases from a set of aliases for a given
user.

``` swift
func deleteAlias(input: DeleteAliasInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAliasOutputResponse, DeleteAliasOutputError>) -> Void)
```

### deleteGroup(input:​completion:​)

Deletes a group from Amazon WorkMail.

``` swift
func deleteGroup(input: DeleteGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteGroupOutputResponse, DeleteGroupOutputError>) -> Void)
```

### deleteMailboxPermissions(input:​completion:​)

Deletes permissions granted to a member (user or group).

``` swift
func deleteMailboxPermissions(input: DeleteMailboxPermissionsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteMailboxPermissionsOutputResponse, DeleteMailboxPermissionsOutputError>) -> Void)
```

### deleteMobileDeviceAccessOverride(input:​completion:​)

Deletes the mobile device access override for the given WorkMail organization, user, and device.

``` swift
func deleteMobileDeviceAccessOverride(input: DeleteMobileDeviceAccessOverrideInput, completion: @escaping (ClientRuntime.SdkResult<DeleteMobileDeviceAccessOverrideOutputResponse, DeleteMobileDeviceAccessOverrideOutputError>) -> Void)
```

### deleteMobileDeviceAccessRule(input:​completion:​)

Deletes a mobile device access rule for the specified Amazon WorkMail organization.

``` swift
func deleteMobileDeviceAccessRule(input: DeleteMobileDeviceAccessRuleInput, completion: @escaping (ClientRuntime.SdkResult<DeleteMobileDeviceAccessRuleOutputResponse, DeleteMobileDeviceAccessRuleOutputError>) -> Void)
```

### deleteOrganization(input:​completion:​)

Deletes an Amazon WorkMail organization and all underlying AWS resources managed by Amazon WorkMail as part of the organization. You can choose whether to delete the associated directory. For more information, see <a href="https:​//docs.aws.amazon.com/workmail/latest/adminguide/remove_organization.html">Removing an organization in the Amazon WorkMail Administrator Guide.

``` swift
func deleteOrganization(input: DeleteOrganizationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteOrganizationOutputResponse, DeleteOrganizationOutputError>) -> Void)
```

### deleteResource(input:​completion:​)

Deletes the specified resource.

``` swift
func deleteResource(input: DeleteResourceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteResourceOutputResponse, DeleteResourceOutputError>) -> Void)
```

### deleteRetentionPolicy(input:​completion:​)

Deletes the specified retention policy from the specified organization.

``` swift
func deleteRetentionPolicy(input: DeleteRetentionPolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRetentionPolicyOutputResponse, DeleteRetentionPolicyOutputError>) -> Void)
```

### deleteUser(input:​completion:​)

Deletes a user from Amazon WorkMail and all subsequent systems. Before you can delete a
user, the user state must be DISABLED. Use the DescribeUser
action to confirm the user state.
Deleting a user is permanent and cannot be undone. WorkMail archives user mailboxes for
30 days before they are permanently removed.

``` swift
func deleteUser(input: DeleteUserInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUserOutputResponse, DeleteUserOutputError>) -> Void)
```

### deregisterFromWorkMail(input:​completion:​)

Mark a user, group, or resource as no longer used in Amazon WorkMail. This action
disassociates the mailbox and schedules it for clean-up. WorkMail keeps mailboxes for 30 days
before they are permanently removed. The functionality in the console is
Disable.

``` swift
func deregisterFromWorkMail(input: DeregisterFromWorkMailInput, completion: @escaping (ClientRuntime.SdkResult<DeregisterFromWorkMailOutputResponse, DeregisterFromWorkMailOutputError>) -> Void)
```

### describeGroup(input:​completion:​)

Returns the data available for the group.

``` swift
func describeGroup(input: DescribeGroupInput, completion: @escaping (ClientRuntime.SdkResult<DescribeGroupOutputResponse, DescribeGroupOutputError>) -> Void)
```

### describeMailboxExportJob(input:​completion:​)

Describes the current status of a mailbox export job.

``` swift
func describeMailboxExportJob(input: DescribeMailboxExportJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeMailboxExportJobOutputResponse, DescribeMailboxExportJobOutputError>) -> Void)
```

### describeOrganization(input:​completion:​)

Provides more information regarding a given organization based on its
identifier.

``` swift
func describeOrganization(input: DescribeOrganizationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeOrganizationOutputResponse, DescribeOrganizationOutputError>) -> Void)
```

### describeResource(input:​completion:​)

Returns the data available for the resource.

``` swift
func describeResource(input: DescribeResourceInput, completion: @escaping (ClientRuntime.SdkResult<DescribeResourceOutputResponse, DescribeResourceOutputError>) -> Void)
```

### describeUser(input:​completion:​)

Provides information regarding the user.

``` swift
func describeUser(input: DescribeUserInput, completion: @escaping (ClientRuntime.SdkResult<DescribeUserOutputResponse, DescribeUserOutputError>) -> Void)
```

### disassociateDelegateFromResource(input:​completion:​)

Removes a member from the resource's set of delegates.

``` swift
func disassociateDelegateFromResource(input: DisassociateDelegateFromResourceInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateDelegateFromResourceOutputResponse, DisassociateDelegateFromResourceOutputError>) -> Void)
```

### disassociateMemberFromGroup(input:​completion:​)

Removes a member from a group.

``` swift
func disassociateMemberFromGroup(input: DisassociateMemberFromGroupInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateMemberFromGroupOutputResponse, DisassociateMemberFromGroupOutputError>) -> Void)
```

### getAccessControlEffect(input:​completion:​)

Gets the effects of an organization's access control rules as they apply to a
specified IPv4 address, access protocol action, or user ID.

``` swift
func getAccessControlEffect(input: GetAccessControlEffectInput, completion: @escaping (ClientRuntime.SdkResult<GetAccessControlEffectOutputResponse, GetAccessControlEffectOutputError>) -> Void)
```

### getDefaultRetentionPolicy(input:​completion:​)

Gets the default retention policy details for the specified organization.

``` swift
func getDefaultRetentionPolicy(input: GetDefaultRetentionPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetDefaultRetentionPolicyOutputResponse, GetDefaultRetentionPolicyOutputError>) -> Void)
```

### getMailboxDetails(input:​completion:​)

Requests a user's mailbox details for a specified organization and user.

``` swift
func getMailboxDetails(input: GetMailboxDetailsInput, completion: @escaping (ClientRuntime.SdkResult<GetMailboxDetailsOutputResponse, GetMailboxDetailsOutputError>) -> Void)
```

### getMobileDeviceAccessEffect(input:​completion:​)

Simulates the effect of the mobile device access rules for the given attributes of a sample access event. Use this method to test the effects of the current set of mobile device access
rules for the Amazon WorkMail organization for a particular user's attributes.

``` swift
func getMobileDeviceAccessEffect(input: GetMobileDeviceAccessEffectInput, completion: @escaping (ClientRuntime.SdkResult<GetMobileDeviceAccessEffectOutputResponse, GetMobileDeviceAccessEffectOutputError>) -> Void)
```

### getMobileDeviceAccessOverride(input:​completion:​)

Gets the mobile device access override for the given WorkMail organization, user, and device.

``` swift
func getMobileDeviceAccessOverride(input: GetMobileDeviceAccessOverrideInput, completion: @escaping (ClientRuntime.SdkResult<GetMobileDeviceAccessOverrideOutputResponse, GetMobileDeviceAccessOverrideOutputError>) -> Void)
```

### listAccessControlRules(input:​completion:​)

Lists the access control rules for the specified organization.

``` swift
func listAccessControlRules(input: ListAccessControlRulesInput, completion: @escaping (ClientRuntime.SdkResult<ListAccessControlRulesOutputResponse, ListAccessControlRulesOutputError>) -> Void)
```

### listAliases(input:​completion:​)

Creates a paginated call to list the aliases associated with a given
entity.

``` swift
func listAliases(input: ListAliasesInput, completion: @escaping (ClientRuntime.SdkResult<ListAliasesOutputResponse, ListAliasesOutputError>) -> Void)
```

### listGroupMembers(input:​completion:​)

Returns an overview of the members of a group. Users and groups can be members of a
group.

``` swift
func listGroupMembers(input: ListGroupMembersInput, completion: @escaping (ClientRuntime.SdkResult<ListGroupMembersOutputResponse, ListGroupMembersOutputError>) -> Void)
```

### listGroups(input:​completion:​)

Returns summaries of the organization's groups.

``` swift
func listGroups(input: ListGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListGroupsOutputResponse, ListGroupsOutputError>) -> Void)
```

### listMailboxExportJobs(input:​completion:​)

Lists the mailbox export jobs started for the specified organization within the last
seven days.

``` swift
func listMailboxExportJobs(input: ListMailboxExportJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListMailboxExportJobsOutputResponse, ListMailboxExportJobsOutputError>) -> Void)
```

### listMailboxPermissions(input:​completion:​)

Lists the mailbox permissions associated with a user, group, or resource
mailbox.

``` swift
func listMailboxPermissions(input: ListMailboxPermissionsInput, completion: @escaping (ClientRuntime.SdkResult<ListMailboxPermissionsOutputResponse, ListMailboxPermissionsOutputError>) -> Void)
```

### listMobileDeviceAccessOverrides(input:​completion:​)

Lists all the mobile device access overrides for any given combination of WorkMail organization, user, or device.

``` swift
func listMobileDeviceAccessOverrides(input: ListMobileDeviceAccessOverridesInput, completion: @escaping (ClientRuntime.SdkResult<ListMobileDeviceAccessOverridesOutputResponse, ListMobileDeviceAccessOverridesOutputError>) -> Void)
```

### listMobileDeviceAccessRules(input:​completion:​)

Lists the mobile device access rules for the specified Amazon WorkMail organization.

``` swift
func listMobileDeviceAccessRules(input: ListMobileDeviceAccessRulesInput, completion: @escaping (ClientRuntime.SdkResult<ListMobileDeviceAccessRulesOutputResponse, ListMobileDeviceAccessRulesOutputError>) -> Void)
```

### listOrganizations(input:​completion:​)

Returns summaries of the customer's organizations.

``` swift
func listOrganizations(input: ListOrganizationsInput, completion: @escaping (ClientRuntime.SdkResult<ListOrganizationsOutputResponse, ListOrganizationsOutputError>) -> Void)
```

### listResourceDelegates(input:​completion:​)

Lists the delegates associated with a resource. Users and groups can be resource
delegates and answer requests on behalf of the resource.

``` swift
func listResourceDelegates(input: ListResourceDelegatesInput, completion: @escaping (ClientRuntime.SdkResult<ListResourceDelegatesOutputResponse, ListResourceDelegatesOutputError>) -> Void)
```

### listResources(input:​completion:​)

Returns summaries of the organization's resources.

``` swift
func listResources(input: ListResourcesInput, completion: @escaping (ClientRuntime.SdkResult<ListResourcesOutputResponse, ListResourcesOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

Lists the tags applied to an Amazon WorkMail organization resource.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### listUsers(input:​completion:​)

Returns summaries of the organization's users.

``` swift
func listUsers(input: ListUsersInput, completion: @escaping (ClientRuntime.SdkResult<ListUsersOutputResponse, ListUsersOutputError>) -> Void)
```

### putAccessControlRule(input:​completion:​)

Adds a new access control rule for the specified organization. The rule allows or
denies access to the organization for the specified IPv4 addresses, access protocol
actions, and user IDs. Adding a new rule with the same name as an existing rule replaces
the older rule.

``` swift
func putAccessControlRule(input: PutAccessControlRuleInput, completion: @escaping (ClientRuntime.SdkResult<PutAccessControlRuleOutputResponse, PutAccessControlRuleOutputError>) -> Void)
```

### putMailboxPermissions(input:​completion:​)

Sets permissions for a user, group, or resource. This replaces any pre-existing
permissions.

``` swift
func putMailboxPermissions(input: PutMailboxPermissionsInput, completion: @escaping (ClientRuntime.SdkResult<PutMailboxPermissionsOutputResponse, PutMailboxPermissionsOutputError>) -> Void)
```

### putMobileDeviceAccessOverride(input:​completion:​)

Creates or updates a mobile device access override for the given WorkMail organization, user, and device.

``` swift
func putMobileDeviceAccessOverride(input: PutMobileDeviceAccessOverrideInput, completion: @escaping (ClientRuntime.SdkResult<PutMobileDeviceAccessOverrideOutputResponse, PutMobileDeviceAccessOverrideOutputError>) -> Void)
```

### putRetentionPolicy(input:​completion:​)

Puts a retention policy to the specified organization.

``` swift
func putRetentionPolicy(input: PutRetentionPolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutRetentionPolicyOutputResponse, PutRetentionPolicyOutputError>) -> Void)
```

### registerToWorkMail(input:​completion:​)

Registers an existing and disabled user, group, or resource for Amazon WorkMail use by
associating a mailbox and calendaring capabilities. It performs no change if the user,
group, or resource is enabled and fails if the user, group, or resource is deleted. This
operation results in the accumulation of costs. For more information, see <a href="https:​//aws.amazon.com/workmail/pricing">Pricing. The equivalent console
functionality for this operation is Enable.
Users can either be created by calling the CreateUser API operation
or they can be synchronized from your directory. For more information, see DeregisterFromWorkMail.

``` swift
func registerToWorkMail(input: RegisterToWorkMailInput, completion: @escaping (ClientRuntime.SdkResult<RegisterToWorkMailOutputResponse, RegisterToWorkMailOutputError>) -> Void)
```

### resetPassword(input:​completion:​)

Allows the administrator to reset the password for a user.

``` swift
func resetPassword(input: ResetPasswordInput, completion: @escaping (ClientRuntime.SdkResult<ResetPasswordOutputResponse, ResetPasswordOutputError>) -> Void)
```

### startMailboxExportJob(input:​completion:​)

Starts a mailbox export job to export MIME-format email messages and calendar items
from the specified mailbox to the specified Amazon Simple Storage Service (Amazon S3)
bucket. For more information, see <a href="https:​//docs.aws.amazon.com/workmail/latest/adminguide/mail-export.html">Exporting mailbox content in
the Amazon WorkMail Administrator Guide.

``` swift
func startMailboxExportJob(input: StartMailboxExportJobInput, completion: @escaping (ClientRuntime.SdkResult<StartMailboxExportJobOutputResponse, StartMailboxExportJobOutputError>) -> Void)
```

### tagResource(input:​completion:​)

Applies the specified tags to the specified Amazon WorkMail organization
resource.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:​completion:​)

Untags the specified tags from the specified Amazon WorkMail organization
resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateMailboxQuota(input:​completion:​)

Updates a user's current mailbox quota for a specified organization and
user.

``` swift
func updateMailboxQuota(input: UpdateMailboxQuotaInput, completion: @escaping (ClientRuntime.SdkResult<UpdateMailboxQuotaOutputResponse, UpdateMailboxQuotaOutputError>) -> Void)
```

### updateMobileDeviceAccessRule(input:​completion:​)

Updates a mobile device access rule for the specified Amazon WorkMail organization.

``` swift
func updateMobileDeviceAccessRule(input: UpdateMobileDeviceAccessRuleInput, completion: @escaping (ClientRuntime.SdkResult<UpdateMobileDeviceAccessRuleOutputResponse, UpdateMobileDeviceAccessRuleOutputError>) -> Void)
```

### updatePrimaryEmailAddress(input:​completion:​)

Updates the primary email for a user, group, or resource. The current email is moved
into the list of aliases (or swapped between an existing alias and the current primary
email), and the email provided in the input is promoted as the primary.

``` swift
func updatePrimaryEmailAddress(input: UpdatePrimaryEmailAddressInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePrimaryEmailAddressOutputResponse, UpdatePrimaryEmailAddressOutputError>) -> Void)
```

### updateResource(input:​completion:​)

Updates data for the resource. To have the latest information, it must be preceded by
a DescribeResource call. The dataset in the request should be the one
expected when performing another DescribeResource call.

``` swift
func updateResource(input: UpdateResourceInput, completion: @escaping (ClientRuntime.SdkResult<UpdateResourceOutputResponse, UpdateResourceOutputError>) -> Void)
```
