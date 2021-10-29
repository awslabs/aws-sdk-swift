# ShieldClient

``` swift
public class ShieldClient 
```

## Inheritance

[`ShieldClientProtocol`](/aws-sdk-swift/reference/0.x/AWSShield/ShieldClientProtocol)

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
public static let clientName = "ShieldClient"
```

## Methods

### `associateDRTLogBucket(input:completion:)`

Authorizes the Shield Response Team (SRT) to access the specified Amazon S3 bucket containing log data such as Application Load Balancer access logs, CloudFront logs, or logs from third party sources. You can associate up to 10 Amazon S3 buckets with your subscription. To use the services of the SRT and make an AssociateDRTLogBucket request, you must be subscribed to the [Business Support plan](https://aws.amazon.com/premiumsupport/business-support/) or the [Enterprise Support plan](https://aws.amazon.com/premiumsupport/enterprise-support/).

``` swift
public func associateDRTLogBucket(input: AssociateDRTLogBucketInput, completion: @escaping (ClientRuntime.SdkResult<AssociateDRTLogBucketOutputResponse, AssociateDRTLogBucketOutputError>) -> Void)
```

### `associateDRTRole(input:completion:)`

Authorizes the Shield Response Team (SRT) using the specified role, to access your Amazon Web Services account to assist with DDoS attack mitigation during potential attacks. This enables the SRT to inspect your WAF configuration and create or update WAF rules and web ACLs. You can associate only one RoleArn with your subscription. If you submit an AssociateDRTRole request for an account that already has an associated role, the new RoleArn will replace the existing RoleArn. Prior to making the AssociateDRTRole request, you must attach the [AWSShieldDRTAccessPolicy](https://console.aws.amazon.com/iam/home?#/policies/arn:aws:iam::aws:policy/service-role/AWSShieldDRTAccessPolicy) managed policy to the role you will specify in the request. For more information see [Attaching and Detaching IAM Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_manage-attach-detach.html). The role must also trust the service principal  drt.shield.amazonaws.com. For more information, see [IAM JSON Policy Elements: Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html). The SRT will have access only to your WAF and Shield resources. By submitting this request, you authorize the SRT to inspect your WAF and Shield configuration and create and update WAF rules and web ACLs on your behalf. The SRT takes these actions only if explicitly authorized by you. You must have the iam:PassRole permission to make an AssociateDRTRole request. For more information, see [Granting a User Permissions to Pass a Role to an Amazon Web Services Service](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_passrole.html). To use the services of the SRT and make an AssociateDRTRole request, you must be subscribed to the [Business Support plan](https://aws.amazon.com/premiumsupport/business-support/) or the [Enterprise Support plan](https://aws.amazon.com/premiumsupport/enterprise-support/).

``` swift
public func associateDRTRole(input: AssociateDRTRoleInput, completion: @escaping (ClientRuntime.SdkResult<AssociateDRTRoleOutputResponse, AssociateDRTRoleOutputError>) -> Void)
```

### `associateHealthCheck(input:completion:)`

Adds health-based detection to the Shield Advanced protection for a resource. Shield Advanced health-based detection uses the health of your Amazon Web Services resource to improve responsiveness and accuracy in attack detection and mitigation. You define the health check in Route 53 and then associate it with your Shield Advanced protection. For more information, see [Shield Advanced Health-Based Detection](https://docs.aws.amazon.com/waf/latest/developerguide/ddos-overview.html#ddos-advanced-health-check-option) in the WAF Developer Guide.

``` swift
public func associateHealthCheck(input: AssociateHealthCheckInput, completion: @escaping (ClientRuntime.SdkResult<AssociateHealthCheckOutputResponse, AssociateHealthCheckOutputError>) -> Void)
```

### `associateProactiveEngagementDetails(input:completion:)`

Initializes proactive engagement and sets the list of contacts for the Shield Response Team (SRT) to use. You must provide at least one phone number in the emergency contact list. After you have initialized proactive engagement using this call, to disable or enable proactive engagement, use the calls DisableProactiveEngagement and EnableProactiveEngagement. This call defines the list of email addresses and phone numbers that the SRT can use to contact you for escalations to the SRT and to initiate proactive customer support. The contacts that you provide in the request replace any contacts that were already defined. If you already have contacts defined and want to use them, retrieve the list using DescribeEmergencyContactSettings and then provide it to this call.

``` swift
public func associateProactiveEngagementDetails(input: AssociateProactiveEngagementDetailsInput, completion: @escaping (ClientRuntime.SdkResult<AssociateProactiveEngagementDetailsOutputResponse, AssociateProactiveEngagementDetailsOutputError>) -> Void)
```

### `createProtection(input:completion:)`

Enables Shield Advanced for a specific Amazon Web Services resource. The resource can be an Amazon CloudFront distribution, Elastic Load Balancing load balancer, Global Accelerator accelerator, Elastic IP Address, or an Amazon Route 53 hosted zone. You can add protection to only a single resource with each CreateProtection request. If you want to add protection to multiple resources at once, use the [WAF console](https://console.aws.amazon.com/waf/). For more information see [Getting Started with Shield Advanced](https://docs.aws.amazon.com/waf/latest/developerguide/getting-started-ddos.html) and [Add Shield Advanced Protection to more Amazon Web Services Resources](https://docs.aws.amazon.com/waf/latest/developerguide/configure-new-protection.html).

``` swift
public func createProtection(input: CreateProtectionInput, completion: @escaping (ClientRuntime.SdkResult<CreateProtectionOutputResponse, CreateProtectionOutputError>) -> Void)
```

### `createProtectionGroup(input:completion:)`

Creates a grouping of protected resources so they can be handled as a collective. This resource grouping improves the accuracy of detection and reduces false positives.

``` swift
public func createProtectionGroup(input: CreateProtectionGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateProtectionGroupOutputResponse, CreateProtectionGroupOutputError>) -> Void)
```

### `createSubscription(input:completion:)`

Activates Shield Advanced for an account. When you initally create a subscription, your subscription is set to be automatically renewed at the end of the existing subscription period. You can change this by submitting an UpdateSubscription request.

``` swift
public func createSubscription(input: CreateSubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<CreateSubscriptionOutputResponse, CreateSubscriptionOutputError>) -> Void)
```

### `deleteProtection(input:completion:)`

Deletes an Shield Advanced \[Protection\].

``` swift
public func deleteProtection(input: DeleteProtectionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteProtectionOutputResponse, DeleteProtectionOutputError>) -> Void)
```

### `deleteProtectionGroup(input:completion:)`

Removes the specified protection group.

``` swift
public func deleteProtectionGroup(input: DeleteProtectionGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteProtectionGroupOutputResponse, DeleteProtectionGroupOutputError>) -> Void)
```

### `deleteSubscription(input:completion:)`

Removes Shield Advanced from an account. Shield Advanced requires a 1-year subscription commitment. You cannot delete a subscription prior to the completion of that commitment.

``` swift
@available(*, deprecated)
    public func deleteSubscription(input: DeleteSubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSubscriptionOutputResponse, DeleteSubscriptionOutputError>) -> Void)
```

### `describeAttack(input:completion:)`

Describes the details of a DDoS attack.

``` swift
public func describeAttack(input: DescribeAttackInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAttackOutputResponse, DescribeAttackOutputError>) -> Void)
```

### `describeAttackStatistics(input:completion:)`

Provides information about the number and type of attacks Shield has detected in the last year for all resources that belong to your account, regardless of whether you've defined Shield protections for them. This operation is available to Shield customers as well as to Shield Advanced customers. The operation returns data for the time range of midnight UTC, one year ago, to midnight UTC, today. For example, if the current time is 2020-10-26 15:39:32 PDT, equal to 2020-10-26 22:39:32 UTC, then the time range for the attack data returned is from 2019-10-26 00:00:00 UTC to 2020-10-26 00:00:00 UTC. The time range indicates the period covered by the attack statistics data items.

``` swift
public func describeAttackStatistics(input: DescribeAttackStatisticsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAttackStatisticsOutputResponse, DescribeAttackStatisticsOutputError>) -> Void)
```

### `describeDRTAccess(input:completion:)`

Returns the current role and list of Amazon S3 log buckets used by the Shield Response Team (SRT) to access your Amazon Web Services account while assisting with attack mitigation.

``` swift
public func describeDRTAccess(input: DescribeDRTAccessInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDRTAccessOutputResponse, DescribeDRTAccessOutputError>) -> Void)
```

### `describeEmergencyContactSettings(input:completion:)`

A list of email addresses and phone numbers that the Shield Response Team (SRT) can use to contact you if you have proactive engagement enabled, for escalations to the SRT and to initiate proactive customer support.

``` swift
public func describeEmergencyContactSettings(input: DescribeEmergencyContactSettingsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEmergencyContactSettingsOutputResponse, DescribeEmergencyContactSettingsOutputError>) -> Void)
```

### `describeProtection(input:completion:)`

Lists the details of a \[Protection\] object.

``` swift
public func describeProtection(input: DescribeProtectionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeProtectionOutputResponse, DescribeProtectionOutputError>) -> Void)
```

### `describeProtectionGroup(input:completion:)`

Returns the specification for the specified protection group.

``` swift
public func describeProtectionGroup(input: DescribeProtectionGroupInput, completion: @escaping (ClientRuntime.SdkResult<DescribeProtectionGroupOutputResponse, DescribeProtectionGroupOutputError>) -> Void)
```

### `describeSubscription(input:completion:)`

Provides details about the Shield Advanced subscription for an account.

``` swift
public func describeSubscription(input: DescribeSubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSubscriptionOutputResponse, DescribeSubscriptionOutputError>) -> Void)
```

### `disableProactiveEngagement(input:completion:)`

Removes authorization from the Shield Response Team (SRT) to notify contacts about escalations to the SRT and to initiate proactive customer support.

``` swift
public func disableProactiveEngagement(input: DisableProactiveEngagementInput, completion: @escaping (ClientRuntime.SdkResult<DisableProactiveEngagementOutputResponse, DisableProactiveEngagementOutputError>) -> Void)
```

### `disassociateDRTLogBucket(input:completion:)`

Removes the Shield Response Team's (SRT) access to the specified Amazon S3 bucket containing the logs that you shared previously. To make a DisassociateDRTLogBucket request, you must be subscribed to the [Business Support plan](https://aws.amazon.com/premiumsupport/business-support/) or the [Enterprise Support plan](https://aws.amazon.com/premiumsupport/enterprise-support/). However, if you are not subscribed to one of these support plans, but had been previously and had granted the SRT access to your account, you can submit a DisassociateDRTLogBucket request to remove this access.

``` swift
public func disassociateDRTLogBucket(input: DisassociateDRTLogBucketInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateDRTLogBucketOutputResponse, DisassociateDRTLogBucketOutputError>) -> Void)
```

### `disassociateDRTRole(input:completion:)`

Removes the Shield Response Team's (SRT) access to your Amazon Web Services account. To make a DisassociateDRTRole request, you must be subscribed to the [Business Support plan](https://aws.amazon.com/premiumsupport/business-support/) or the [Enterprise Support plan](https://aws.amazon.com/premiumsupport/enterprise-support/). However, if you are not subscribed to one of these support plans, but had been previously and had granted the SRT access to your account, you can submit a DisassociateDRTRole request to remove this access.

``` swift
public func disassociateDRTRole(input: DisassociateDRTRoleInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateDRTRoleOutputResponse, DisassociateDRTRoleOutputError>) -> Void)
```

### `disassociateHealthCheck(input:completion:)`

Removes health-based detection from the Shield Advanced protection for a resource. Shield Advanced health-based detection uses the health of your Amazon Web Services resource to improve responsiveness and accuracy in attack detection and mitigation. You define the health check in Route 53 and then associate or disassociate it with your Shield Advanced protection. For more information, see [Shield Advanced Health-Based Detection](https://docs.aws.amazon.com/waf/latest/developerguide/ddos-overview.html#ddos-advanced-health-check-option) in the WAF Developer Guide.

``` swift
public func disassociateHealthCheck(input: DisassociateHealthCheckInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateHealthCheckOutputResponse, DisassociateHealthCheckOutputError>) -> Void)
```

### `enableProactiveEngagement(input:completion:)`

Authorizes the Shield Response Team (SRT) to use email and phone to notify contacts about escalations to the SRT and to initiate proactive customer support.

``` swift
public func enableProactiveEngagement(input: EnableProactiveEngagementInput, completion: @escaping (ClientRuntime.SdkResult<EnableProactiveEngagementOutputResponse, EnableProactiveEngagementOutputError>) -> Void)
```

### `getSubscriptionState(input:completion:)`

Returns the SubscriptionState, either Active or Inactive.

``` swift
public func getSubscriptionState(input: GetSubscriptionStateInput, completion: @escaping (ClientRuntime.SdkResult<GetSubscriptionStateOutputResponse, GetSubscriptionStateOutputError>) -> Void)
```

### `listAttacks(input:completion:)`

Returns all ongoing DDoS attacks or all DDoS attacks during a specified time period.

``` swift
public func listAttacks(input: ListAttacksInput, completion: @escaping (ClientRuntime.SdkResult<ListAttacksOutputResponse, ListAttacksOutputError>) -> Void)
```

### `listProtectionGroups(input:completion:)`

Retrieves the \[ProtectionGroup\] objects for the account.

``` swift
public func listProtectionGroups(input: ListProtectionGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListProtectionGroupsOutputResponse, ListProtectionGroupsOutputError>) -> Void)
```

### `listProtections(input:completion:)`

Lists all \[Protection\] objects for the account.

``` swift
public func listProtections(input: ListProtectionsInput, completion: @escaping (ClientRuntime.SdkResult<ListProtectionsOutputResponse, ListProtectionsOutputError>) -> Void)
```

### `listResourcesInProtectionGroup(input:completion:)`

Retrieves the resources that are included in the protection group.

``` swift
public func listResourcesInProtectionGroup(input: ListResourcesInProtectionGroupInput, completion: @escaping (ClientRuntime.SdkResult<ListResourcesInProtectionGroupOutputResponse, ListResourcesInProtectionGroupOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Gets information about Amazon Web Services tags for a specified Amazon Resource Name (ARN) in Shield.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Adds or updates tags for a resource in Shield.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes tags from a resource in Shield.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateEmergencyContactSettings(input:completion:)`

Updates the details of the list of email addresses and phone numbers that the Shield Response Team (SRT) can use to contact you if you have proactive engagement enabled, for escalations to the SRT and to initiate proactive customer support.

``` swift
public func updateEmergencyContactSettings(input: UpdateEmergencyContactSettingsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateEmergencyContactSettingsOutputResponse, UpdateEmergencyContactSettingsOutputError>) -> Void)
```

### `updateProtectionGroup(input:completion:)`

Updates an existing protection group. A protection group is a grouping of protected resources so they can be handled as a collective. This resource grouping improves the accuracy of detection and reduces false positives.

``` swift
public func updateProtectionGroup(input: UpdateProtectionGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateProtectionGroupOutputResponse, UpdateProtectionGroupOutputError>) -> Void)
```

### `updateSubscription(input:completion:)`

Updates the details of an existing subscription. Only enter values for parameters you want to change. Empty parameters are not updated.

``` swift
public func updateSubscription(input: UpdateSubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSubscriptionOutputResponse, UpdateSubscriptionOutputError>) -> Void)
```
