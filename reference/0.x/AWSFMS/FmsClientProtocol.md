# FmsClientProtocol

This is the Firewall Manager API Reference. This guide is for developers who need detailed information about the Firewall Manager API actions, data types, and errors. For detailed information about Firewall Manager features, see the [Firewall Manager Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/fms-chapter.html). Some API actions require explicit resource permissions. For information, see the developer guide topic [Firewall Manager required permissions for API actions](https://docs.aws.amazon.com/waf/latest/developerguide/fms-api-permissions-ref.html).

``` swift
public protocol FmsClientProtocol 
```

## Requirements

### associateAdminAccount(input:completion:)

Sets the Firewall Manager administrator account. The account must be a member of the organization in Organizations whose resources you want to protect. Firewall Manager sets the permissions that allow the account to administer your Firewall Manager policies. The account that you associate with Firewall Manager is called the Firewall Manager administrator account.

``` swift
func associateAdminAccount(input: AssociateAdminAccountInput, completion: @escaping (ClientRuntime.SdkResult<AssociateAdminAccountOutputResponse, AssociateAdminAccountOutputError>) -> Void)
```

### deleteAppsList(input:completion:)

Permanently deletes an Firewall Manager applications list.

``` swift
func deleteAppsList(input: DeleteAppsListInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAppsListOutputResponse, DeleteAppsListOutputError>) -> Void)
```

### deleteNotificationChannel(input:completion:)

Deletes an Firewall Manager association with the IAM role and the Amazon Simple Notification Service (SNS) topic that is used to record Firewall Manager SNS logs.

``` swift
func deleteNotificationChannel(input: DeleteNotificationChannelInput, completion: @escaping (ClientRuntime.SdkResult<DeleteNotificationChannelOutputResponse, DeleteNotificationChannelOutputError>) -> Void)
```

### deletePolicy(input:completion:)

Permanently deletes an Firewall Manager policy.

``` swift
func deletePolicy(input: DeletePolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeletePolicyOutputResponse, DeletePolicyOutputError>) -> Void)
```

### deleteProtocolsList(input:completion:)

Permanently deletes an Firewall Manager protocols list.

``` swift
func deleteProtocolsList(input: DeleteProtocolsListInput, completion: @escaping (ClientRuntime.SdkResult<DeleteProtocolsListOutputResponse, DeleteProtocolsListOutputError>) -> Void)
```

### disassociateAdminAccount(input:completion:)

Disassociates the account that has been set as the Firewall Manager administrator account. To set a different account as the administrator account, you must submit an AssociateAdminAccount request.

``` swift
func disassociateAdminAccount(input: DisassociateAdminAccountInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateAdminAccountOutputResponse, DisassociateAdminAccountOutputError>) -> Void)
```

### getAdminAccount(input:completion:)

Returns the Organizations account that is associated with Firewall Manager as the Firewall Manager administrator.

``` swift
func getAdminAccount(input: GetAdminAccountInput, completion: @escaping (ClientRuntime.SdkResult<GetAdminAccountOutputResponse, GetAdminAccountOutputError>) -> Void)
```

### getAppsList(input:completion:)

Returns information about the specified Firewall Manager applications list.

``` swift
func getAppsList(input: GetAppsListInput, completion: @escaping (ClientRuntime.SdkResult<GetAppsListOutputResponse, GetAppsListOutputError>) -> Void)
```

### getComplianceDetail(input:completion:)

Returns detailed compliance information about the specified member account. Details include resources that are in and out of compliance with the specified policy.

``` swift
func getComplianceDetail(input: GetComplianceDetailInput, completion: @escaping (ClientRuntime.SdkResult<GetComplianceDetailOutputResponse, GetComplianceDetailOutputError>) -> Void)
```

  - Resources are considered noncompliant for WAF and Shield Advanced policies if the specified policy has not been applied to them.

  - Resources are considered noncompliant for security group policies if they are in scope of the policy, they violate one or more of the policy rules, and remediation is disabled or not possible.

  - Resources are considered noncompliant for Network Firewall policies if a firewall is missing in the VPC, if the firewall endpoint isn't set up in an expected Availability Zone and subnet, if a subnet created by the Firewall Manager doesn't have the expected route table, and for modifications to a firewall policy that violate the Firewall Manager policy's rules.

  - Resources are considered noncompliant for DNS Firewall policies if a DNS Firewall rule group is missing from the rule group associations for the VPC.

### getNotificationChannel(input:completion:)

Information about the Amazon Simple Notification Service (SNS) topic that is used to record Firewall Manager SNS logs.

``` swift
func getNotificationChannel(input: GetNotificationChannelInput, completion: @escaping (ClientRuntime.SdkResult<GetNotificationChannelOutputResponse, GetNotificationChannelOutputError>) -> Void)
```

### getPolicy(input:completion:)

Returns information about the specified Firewall Manager policy.

``` swift
func getPolicy(input: GetPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetPolicyOutputResponse, GetPolicyOutputError>) -> Void)
```

### getProtectionStatus(input:completion:)

If you created a Shield Advanced policy, returns policy-level attack summary information in the event of a potential DDoS attack. Other policy types are currently unsupported.

``` swift
func getProtectionStatus(input: GetProtectionStatusInput, completion: @escaping (ClientRuntime.SdkResult<GetProtectionStatusOutputResponse, GetProtectionStatusOutputError>) -> Void)
```

### getProtocolsList(input:completion:)

Returns information about the specified Firewall Manager protocols list.

``` swift
func getProtocolsList(input: GetProtocolsListInput, completion: @escaping (ClientRuntime.SdkResult<GetProtocolsListOutputResponse, GetProtocolsListOutputError>) -> Void)
```

### getViolationDetails(input:completion:)

Retrieves violations for a resource based on the specified Firewall Manager policy and Amazon Web Services account.

``` swift
func getViolationDetails(input: GetViolationDetailsInput, completion: @escaping (ClientRuntime.SdkResult<GetViolationDetailsOutputResponse, GetViolationDetailsOutputError>) -> Void)
```

### listAppsLists(input:completion:)

Returns an array of AppsListDataSummary objects.

``` swift
func listAppsLists(input: ListAppsListsInput, completion: @escaping (ClientRuntime.SdkResult<ListAppsListsOutputResponse, ListAppsListsOutputError>) -> Void)
```

### listComplianceStatus(input:completion:)

Returns an array of PolicyComplianceStatus objects. Use PolicyComplianceStatus to get a summary of which member accounts are protected by the specified policy.

``` swift
func listComplianceStatus(input: ListComplianceStatusInput, completion: @escaping (ClientRuntime.SdkResult<ListComplianceStatusOutputResponse, ListComplianceStatusOutputError>) -> Void)
```

### listMemberAccounts(input:completion:)

Returns a MemberAccounts object that lists the member accounts in the administrator's Amazon Web Services organization. The ListMemberAccounts must be submitted by the account that is set as the Firewall Manager administrator.

``` swift
func listMemberAccounts(input: ListMemberAccountsInput, completion: @escaping (ClientRuntime.SdkResult<ListMemberAccountsOutputResponse, ListMemberAccountsOutputError>) -> Void)
```

### listPolicies(input:completion:)

Returns an array of PolicySummary objects.

``` swift
func listPolicies(input: ListPoliciesInput, completion: @escaping (ClientRuntime.SdkResult<ListPoliciesOutputResponse, ListPoliciesOutputError>) -> Void)
```

### listProtocolsLists(input:completion:)

Returns an array of ProtocolsListDataSummary objects.

``` swift
func listProtocolsLists(input: ListProtocolsListsInput, completion: @escaping (ClientRuntime.SdkResult<ListProtocolsListsOutputResponse, ListProtocolsListsOutputError>) -> Void)
```

### listTagsForResource(input:completion:)

Retrieves the list of tags for the specified Amazon Web Services resource.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### putAppsList(input:completion:)

Creates an Firewall Manager applications list.

``` swift
func putAppsList(input: PutAppsListInput, completion: @escaping (ClientRuntime.SdkResult<PutAppsListOutputResponse, PutAppsListOutputError>) -> Void)
```

### putNotificationChannel(input:completion:)

Designates the IAM role and Amazon Simple Notification Service (SNS) topic that Firewall Manager uses to record SNS logs. To perform this action outside of the console, you must configure the SNS topic to allow the Firewall Manager role AWSServiceRoleForFMS to publish SNS logs. For more information, see [Firewall Manager required permissions for API actions](https://docs.aws.amazon.com/waf/latest/developerguide/fms-api-permissions-ref.html) in the Firewall Manager Developer Guide.

``` swift
func putNotificationChannel(input: PutNotificationChannelInput, completion: @escaping (ClientRuntime.SdkResult<PutNotificationChannelOutputResponse, PutNotificationChannelOutputError>) -> Void)
```

### putPolicy(input:completion:)

Creates an Firewall Manager policy. Firewall Manager provides the following types of policies:

``` swift
func putPolicy(input: PutPolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutPolicyOutputResponse, PutPolicyOutputError>) -> Void)
```

  - An WAF policy (type WAFV2), which defines rule groups to run first in the corresponding WAF web ACL and rule groups to run last in the web ACL.

  - An WAF Classic policy (type WAF), which defines a rule group.

  - A Shield Advanced policy, which applies Shield Advanced protection to specified accounts and resources.

  - A security group policy, which manages VPC security groups across your Amazon Web Services organization.

  - An Network Firewall policy, which provides firewall rules to filter network traffic in specified Amazon VPCs.

  - A DNS Firewall policy, which provides Route 53 Resolver DNS Firewall rules to filter DNS queries for specified VPCs.

Each policy is specific to one of the types. If you want to enforce more than one policy type across accounts, create multiple policies. You can create multiple policies for each type. You must be subscribed to Shield Advanced to create a Shield Advanced policy. For more information about subscribing to Shield Advanced, see [CreateSubscription](https://docs.aws.amazon.com/waf/latest/DDOSAPIReference/API_CreateSubscription.html).

### putProtocolsList(input:completion:)

Creates an Firewall Manager protocols list.

``` swift
func putProtocolsList(input: PutProtocolsListInput, completion: @escaping (ClientRuntime.SdkResult<PutProtocolsListOutputResponse, PutProtocolsListOutputError>) -> Void)
```

### tagResource(input:completion:)

Adds one or more tags to an Amazon Web Services resource.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:completion:)

Removes one or more tags from an Amazon Web Services resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```
