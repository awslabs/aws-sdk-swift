# Wafv2ClientProtocol

WAF This is the latest version of the WAF API, released in November, 2019. The names of the entities that you use to access this API, like endpoints and namespaces, all have the versioning information added, like "V2" or "v2", to distinguish from the prior version. We recommend migrating your resources to this version, because it has a number of significant improvements. If you used WAF prior to this release, you can't use this WAFV2 API to access any WAF resources that you created before. You can access your old rules, web ACLs, and other WAF resources only through the WAF Classic APIs. The WAF Classic APIs have retained the prior names, endpoints, and namespaces. For information, including how to migrate your WAF resources to this version, see the [WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). WAF is a web application firewall that lets you monitor the HTTP and HTTPS requests that are forwarded to Amazon CloudFront, an Amazon API Gateway REST API, an Application Load Balancer, or an AppSync GraphQL API. WAF also lets you control access to your content. Based on conditions that you specify, such as the IP addresses that requests originate from or the values of query strings, the Amazon API Gateway REST API, CloudFront distribution, the Application Load Balancer, or the AppSync GraphQL API responds to requests either with the requested content or with an HTTP 403 status code (Forbidden). You also can configure CloudFront to return a custom error page when a request is blocked. This API guide is for developers who need detailed information about WAF API actions, data types, and errors. For detailed information about WAF features and an overview of how to use WAF, see the [WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/what-is-aws-waf.html). You can make calls using the endpoints listed in [WAF endpoints and quotas](https://docs.aws.amazon.com/general/latest/gr/waf.html).

``` swift
public protocol Wafv2ClientProtocol 
```

  - For regional applications, you can use any of the endpoints in the list. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, or an AppSync GraphQL API.

  - For Amazon CloudFront applications, you must use the API endpoint listed for US East (N. Virginia): us-east-1.

Alternatively, you can use one of the Amazon Web Services SDKs to access an API that's tailored to the programming language or platform that you're using. For more information, see [Amazon Web Services SDKs](http://aws.amazon.com/tools/#SDKs). We currently provide two versions of the WAF API: this API and the prior versions, the classic WAF APIs. This new API provides the same functionality as the older versions, with the following major improvements:

  - You use one API for both global and regional applications. Where you need to distinguish the scope, you specify a Scope parameter and set it to CLOUDFRONT or REGIONAL.

  - You can define a web ACL or rule group with a single call, and update it with a single call. You define all rule specifications in JSON format, and pass them to your rule group or web ACL calls.

  - The limits WAF places on the use of rules more closely reflects the cost of running each type of rule. Rule groups include capacity settings, so you know the maximum cost of a rule group when you use it.

## Requirements

### associateWebACL(input:completion:)

Associates a web ACL with a regional application resource, to protect the resource. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, or an AppSync GraphQL API. For Amazon CloudFront, don't use this call. Instead, use your CloudFront distribution configuration. To associate a web ACL, in the CloudFront call UpdateDistribution, set the web ACL ID to the Amazon Resource Name (ARN) of the web ACL. For information, see [UpdateDistribution](https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_UpdateDistribution.html).

``` swift
func associateWebACL(input: AssociateWebACLInput, completion: @escaping (ClientRuntime.SdkResult<AssociateWebACLOutputResponse, AssociateWebACLOutputError>) -> Void)
```

### checkCapacity(input:completion:)

Returns the web ACL capacity unit (WCU) requirements for a specified scope and set of rules. You can use this to check the capacity requirements for the rules you want to use in a \[RuleGroup\] or \[WebACL\]. WAF uses WCUs to calculate and control the operating resources that are used to run your rules, rule groups, and web ACLs. WAF calculates capacity differently for each rule type, to reflect the relative cost of each rule. Simple rules that cost little to run use fewer WCUs than more complex rules that use more processing power. Rule group capacity is fixed at creation, which helps users plan their web ACL WCU usage when they use a rule group. The WCU limit for web ACLs is 1,500.

``` swift
func checkCapacity(input: CheckCapacityInput, completion: @escaping (ClientRuntime.SdkResult<CheckCapacityOutputResponse, CheckCapacityOutputError>) -> Void)
```

### createIPSet(input:completion:)

Creates an \[IPSet\], which you use to identify web requests that originate from specific IP addresses or ranges of IP addresses. For example, if you're receiving a lot of requests from a ranges of IP addresses, you can configure WAF to block them using an IPSet that lists those IP addresses.

``` swift
func createIPSet(input: CreateIPSetInput, completion: @escaping (ClientRuntime.SdkResult<CreateIPSetOutputResponse, CreateIPSetOutputError>) -> Void)
```

### createRegexPatternSet(input:completion:)

Creates a \[RegexPatternSet\], which you reference in a \[RegexPatternSetReferenceStatement\], to have WAF inspect a web request component for the specified patterns.

``` swift
func createRegexPatternSet(input: CreateRegexPatternSetInput, completion: @escaping (ClientRuntime.SdkResult<CreateRegexPatternSetOutputResponse, CreateRegexPatternSetOutputError>) -> Void)
```

### createRuleGroup(input:completion:)

Creates a \[RuleGroup\] per the specifications provided. A rule group defines a collection of rules to inspect and control web requests that you can use in a \[WebACL\]. When you create a rule group, you define an immutable capacity limit. If you update a rule group, you must stay within the capacity. This allows others to reuse the rule group with confidence in its capacity requirements.

``` swift
func createRuleGroup(input: CreateRuleGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateRuleGroupOutputResponse, CreateRuleGroupOutputError>) -> Void)
```

### createWebACL(input:completion:)

Creates a \[WebACL\] per the specifications provided. A web ACL defines a collection of rules to use to inspect and control web requests. Each rule has an action defined (allow, block, or count) for requests that match the statement of the rule. In the web ACL, you assign a default action to take (allow, block) for any request that does not match any of the rules. The rules in a web ACL can be a combination of the types \[Rule\], \[RuleGroup\], and managed rule group. You can associate a web ACL with one or more Amazon Web Services resources to protect. The resources can be an Amazon CloudFront distribution, an Amazon API Gateway REST API, an Application Load Balancer, or an AppSync GraphQL API.

``` swift
func createWebACL(input: CreateWebACLInput, completion: @escaping (ClientRuntime.SdkResult<CreateWebACLOutputResponse, CreateWebACLOutputError>) -> Void)
```

### deleteFirewallManagerRuleGroups(input:completion:)

Deletes all rule groups that are managed by Firewall Manager for the specified web ACL. You can only use this if ManagedByFirewallManager is false in the specified \[WebACL\].

``` swift
func deleteFirewallManagerRuleGroups(input: DeleteFirewallManagerRuleGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFirewallManagerRuleGroupsOutputResponse, DeleteFirewallManagerRuleGroupsOutputError>) -> Void)
```

### deleteIPSet(input:completion:)

Deletes the specified \[IPSet\].

``` swift
func deleteIPSet(input: DeleteIPSetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteIPSetOutputResponse, DeleteIPSetOutputError>) -> Void)
```

### deleteLoggingConfiguration(input:completion:)

Deletes the \[LoggingConfiguration\] from the specified web ACL.

``` swift
func deleteLoggingConfiguration(input: DeleteLoggingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLoggingConfigurationOutputResponse, DeleteLoggingConfigurationOutputError>) -> Void)
```

### deletePermissionPolicy(input:completion:)

Permanently deletes an IAM policy from the specified rule group. You must be the owner of the rule group to perform this operation.

``` swift
func deletePermissionPolicy(input: DeletePermissionPolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeletePermissionPolicyOutputResponse, DeletePermissionPolicyOutputError>) -> Void)
```

### deleteRegexPatternSet(input:completion:)

Deletes the specified \[RegexPatternSet\].

``` swift
func deleteRegexPatternSet(input: DeleteRegexPatternSetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRegexPatternSetOutputResponse, DeleteRegexPatternSetOutputError>) -> Void)
```

### deleteRuleGroup(input:completion:)

Deletes the specified \[RuleGroup\].

``` swift
func deleteRuleGroup(input: DeleteRuleGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRuleGroupOutputResponse, DeleteRuleGroupOutputError>) -> Void)
```

### deleteWebACL(input:completion:)

Deletes the specified \[WebACL\]. You can only use this if ManagedByFirewallManager is false in the specified \[WebACL\].

``` swift
func deleteWebACL(input: DeleteWebACLInput, completion: @escaping (ClientRuntime.SdkResult<DeleteWebACLOutputResponse, DeleteWebACLOutputError>) -> Void)
```

### describeManagedRuleGroup(input:completion:)

Provides high-level information for a managed rule group, including descriptions of the rules.

``` swift
func describeManagedRuleGroup(input: DescribeManagedRuleGroupInput, completion: @escaping (ClientRuntime.SdkResult<DescribeManagedRuleGroupOutputResponse, DescribeManagedRuleGroupOutputError>) -> Void)
```

### disassociateWebACL(input:completion:)

Disassociates a web ACL from a regional application resource. A regional application can be an Application Load Balancer (ALB), an Amazon API Gateway REST API, or an AppSync GraphQL API. For Amazon CloudFront, don't use this call. Instead, use your CloudFront distribution configuration. To disassociate a web ACL, provide an empty web ACL ID in the CloudFront call UpdateDistribution. For information, see [UpdateDistribution](https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_UpdateDistribution.html).

``` swift
func disassociateWebACL(input: DisassociateWebACLInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateWebACLOutputResponse, DisassociateWebACLOutputError>) -> Void)
```

### getIPSet(input:completion:)

Retrieves the specified \[IPSet\].

``` swift
func getIPSet(input: GetIPSetInput, completion: @escaping (ClientRuntime.SdkResult<GetIPSetOutputResponse, GetIPSetOutputError>) -> Void)
```

### getLoggingConfiguration(input:completion:)

Returns the \[LoggingConfiguration\] for the specified web ACL.

``` swift
func getLoggingConfiguration(input: GetLoggingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetLoggingConfigurationOutputResponse, GetLoggingConfigurationOutputError>) -> Void)
```

### getManagedRuleSet(input:completion:)

Retrieves the specified managed rule set. This is intended for use only by vendors of managed rule sets. Vendors are Amazon Web Services and Amazon Web Services Marketplace sellers. Vendors, you can use the managed rule set APIs to provide controlled rollout of your versioned managed rule group offerings for your customers. The APIs are ListManagedRuleSets, GetManagedRuleSet, PutManagedRuleSetVersions, and UpdateManagedRuleSetVersionExpiryDate.

``` swift
func getManagedRuleSet(input: GetManagedRuleSetInput, completion: @escaping (ClientRuntime.SdkResult<GetManagedRuleSetOutputResponse, GetManagedRuleSetOutputError>) -> Void)
```

### getPermissionPolicy(input:completion:)

Returns the IAM policy that is attached to the specified rule group. You must be the owner of the rule group to perform this operation.

``` swift
func getPermissionPolicy(input: GetPermissionPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetPermissionPolicyOutputResponse, GetPermissionPolicyOutputError>) -> Void)
```

### getRateBasedStatementManagedKeys(input:completion:)

Retrieves the keys that are currently blocked by a rate-based rule instance. The maximum number of managed keys that can be blocked for a single rate-based rule instance is 10,000. If more than 10,000 addresses exceed the rate limit, those with the highest rates are blocked. For a rate-based rule that you've defined inside a rule group, provide the name of the rule group reference statement in your request, in addition to the rate-based rule name and the web ACL name. WAF monitors web requests and manages keys independently for each unique combination of web ACL, optional rule group, and rate-based rule. For example, if you define a rate-based rule inside a rule group, and then use the rule group in a web ACL, WAF monitors web requests and manages keys for that web ACL, rule group reference statement, and rate-based rule instance. If you use the same rule group in a second web ACL, WAF monitors web requests and manages keys for this second usage completely independent of your first.

``` swift
func getRateBasedStatementManagedKeys(input: GetRateBasedStatementManagedKeysInput, completion: @escaping (ClientRuntime.SdkResult<GetRateBasedStatementManagedKeysOutputResponse, GetRateBasedStatementManagedKeysOutputError>) -> Void)
```

### getRegexPatternSet(input:completion:)

Retrieves the specified \[RegexPatternSet\].

``` swift
func getRegexPatternSet(input: GetRegexPatternSetInput, completion: @escaping (ClientRuntime.SdkResult<GetRegexPatternSetOutputResponse, GetRegexPatternSetOutputError>) -> Void)
```

### getRuleGroup(input:completion:)

Retrieves the specified \[RuleGroup\].

``` swift
func getRuleGroup(input: GetRuleGroupInput, completion: @escaping (ClientRuntime.SdkResult<GetRuleGroupOutputResponse, GetRuleGroupOutputError>) -> Void)
```

### getSampledRequests(input:completion:)

Gets detailed information about a specified number of requests--a sample--that WAF randomly selects from among the first 5,000 requests that your Amazon Web Services resource received during a time range that you choose. You can specify a sample size of up to 500 requests, and you can specify any time range in the previous three hours. GetSampledRequests returns a time range, which is usually the time range that you specified. However, if your resource (such as a CloudFront distribution) received 5,000 requests before the specified time range elapsed, GetSampledRequests returns an updated time range. This new time range indicates the actual period during which WAF selected the requests in the sample.

``` swift
func getSampledRequests(input: GetSampledRequestsInput, completion: @escaping (ClientRuntime.SdkResult<GetSampledRequestsOutputResponse, GetSampledRequestsOutputError>) -> Void)
```

### getWebACL(input:completion:)

Retrieves the specified \[WebACL\].

``` swift
func getWebACL(input: GetWebACLInput, completion: @escaping (ClientRuntime.SdkResult<GetWebACLOutputResponse, GetWebACLOutputError>) -> Void)
```

### getWebACLForResource(input:completion:)

Retrieves the \[WebACL\] for the specified resource.

``` swift
func getWebACLForResource(input: GetWebACLForResourceInput, completion: @escaping (ClientRuntime.SdkResult<GetWebACLForResourceOutputResponse, GetWebACLForResourceOutputError>) -> Void)
```

### listAvailableManagedRuleGroups(input:completion:)

Retrieves an array of managed rule groups that are available for you to use. This list includes all Amazon Web Services Managed Rules rule groups and all of the Amazon Web Services Marketplace managed rule groups that you're subscribed to.

``` swift
func listAvailableManagedRuleGroups(input: ListAvailableManagedRuleGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListAvailableManagedRuleGroupsOutputResponse, ListAvailableManagedRuleGroupsOutputError>) -> Void)
```

### listAvailableManagedRuleGroupVersions(input:completion:)

Returns a list of the available versions for the specified managed rule group.

``` swift
func listAvailableManagedRuleGroupVersions(input: ListAvailableManagedRuleGroupVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListAvailableManagedRuleGroupVersionsOutputResponse, ListAvailableManagedRuleGroupVersionsOutputError>) -> Void)
```

### listIPSets(input:completion:)

Retrieves an array of \[IPSetSummary\] objects for the IP sets that you manage.

``` swift
func listIPSets(input: ListIPSetsInput, completion: @escaping (ClientRuntime.SdkResult<ListIPSetsOutputResponse, ListIPSetsOutputError>) -> Void)
```

### listLoggingConfigurations(input:completion:)

Retrieves an array of your \[LoggingConfiguration\] objects.

``` swift
func listLoggingConfigurations(input: ListLoggingConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<ListLoggingConfigurationsOutputResponse, ListLoggingConfigurationsOutputError>) -> Void)
```

### listManagedRuleSets(input:completion:)

Retrieves the managed rule sets that you own. This is intended for use only by vendors of managed rule sets. Vendors are Amazon Web Services and Amazon Web Services Marketplace sellers. Vendors, you can use the managed rule set APIs to provide controlled rollout of your versioned managed rule group offerings for your customers. The APIs are ListManagedRuleSets, GetManagedRuleSet, PutManagedRuleSetVersions, and UpdateManagedRuleSetVersionExpiryDate.

``` swift
func listManagedRuleSets(input: ListManagedRuleSetsInput, completion: @escaping (ClientRuntime.SdkResult<ListManagedRuleSetsOutputResponse, ListManagedRuleSetsOutputError>) -> Void)
```

### listRegexPatternSets(input:completion:)

Retrieves an array of \[RegexPatternSetSummary\] objects for the regex pattern sets that you manage.

``` swift
func listRegexPatternSets(input: ListRegexPatternSetsInput, completion: @escaping (ClientRuntime.SdkResult<ListRegexPatternSetsOutputResponse, ListRegexPatternSetsOutputError>) -> Void)
```

### listResourcesForWebACL(input:completion:)

Retrieves an array of the Amazon Resource Names (ARNs) for the regional resources that are associated with the specified web ACL. If you want the list of Amazon CloudFront resources, use the CloudFront call ListDistributionsByWebACLId.

``` swift
func listResourcesForWebACL(input: ListResourcesForWebACLInput, completion: @escaping (ClientRuntime.SdkResult<ListResourcesForWebACLOutputResponse, ListResourcesForWebACLOutputError>) -> Void)
```

### listRuleGroups(input:completion:)

Retrieves an array of \[RuleGroupSummary\] objects for the rule groups that you manage.

``` swift
func listRuleGroups(input: ListRuleGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListRuleGroupsOutputResponse, ListRuleGroupsOutputError>) -> Void)
```

### listTagsForResource(input:completion:)

Retrieves the \[TagInfoForResource\] for the specified resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing. For example, you might set the tag key to "customer" and the value to the customer name or ID. You can specify one or more tags to add to each Amazon Web Services resource, up to 50 tags for a resource. You can tag the Amazon Web Services resources that you manage through WAF: web ACLs, rule groups, IP sets, and regex pattern sets. You can't manage or view tags through the WAF console.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### listWebACLs(input:completion:)

Retrieves an array of \[WebACLSummary\] objects for the web ACLs that you manage.

``` swift
func listWebACLs(input: ListWebACLsInput, completion: @escaping (ClientRuntime.SdkResult<ListWebACLsOutputResponse, ListWebACLsOutputError>) -> Void)
```

### putLoggingConfiguration(input:completion:)

Enables the specified \[LoggingConfiguration\], to start logging from a web ACL, according to the configuration provided. You can access information about all traffic that WAF inspects using the following steps:

``` swift
func putLoggingConfiguration(input: PutLoggingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<PutLoggingConfigurationOutputResponse, PutLoggingConfigurationOutputError>) -> Void)
```

  - Create an Amazon Kinesis Data Firehose. Create the data firehose with a PUT source and in the Region that you are operating. If you are capturing logs for Amazon CloudFront, always create the firehose in US East (N. Virginia). Give the data firehose a name that starts with the prefix aws-waf-logs-. For example, aws-waf-logs-us-east-2-analytics. Do not create the data firehose using a Kinesis stream as your source.

  - Associate that firehose to your web ACL using a PutLoggingConfiguration request.

When you successfully enable logging using a PutLoggingConfiguration request, WAF will create a service linked role with the necessary permissions to write logs to the Amazon Kinesis Data Firehose. For more information, see [Logging Web ACL Traffic Information](https://docs.aws.amazon.com/waf/latest/developerguide/logging.html) in the WAF Developer Guide. This operation completely replaces the mutable specifications that you already have for the logging configuration with the ones that you provide to this call. To modify the logging configuration, retrieve it by calling \[GetLoggingConfiguration\], update the settings as needed, and then provide the complete logging configuration specification to this call.

### putManagedRuleSetVersions(input:completion:)

Defines the versions of your managed rule set that you are offering to the customers. Customers see your offerings as managed rule groups with versioning. This is intended for use only by vendors of managed rule sets. Vendors are Amazon Web Services and Amazon Web Services Marketplace sellers. Vendors, you can use the managed rule set APIs to provide controlled rollout of your versioned managed rule group offerings for your customers. The APIs are ListManagedRuleSets, GetManagedRuleSet, PutManagedRuleSetVersions, and UpdateManagedRuleSetVersionExpiryDate. Customers retrieve their managed rule group list by calling \[ListAvailableManagedRuleGroups\]. The name that you provide here for your managed rule set is the name the customer sees for the corresponding managed rule group. Customers can retrieve the available versions for a managed rule group by calling \[ListAvailableManagedRuleGroupVersions\]. You provide a rule group specification for each version. For each managed rule set, you must specify a version that you recommend using. To initiate the expiration of a managed rule group version, use \[UpdateManagedRuleSetVersionExpiryDate\].

``` swift
func putManagedRuleSetVersions(input: PutManagedRuleSetVersionsInput, completion: @escaping (ClientRuntime.SdkResult<PutManagedRuleSetVersionsOutputResponse, PutManagedRuleSetVersionsOutputError>) -> Void)
```

### putPermissionPolicy(input:completion:)

Attaches an IAM policy to the specified resource. Use this to share a rule group across accounts. You must be the owner of the rule group to perform this operation. This action is subject to the following restrictions:

``` swift
func putPermissionPolicy(input: PutPermissionPolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutPermissionPolicyOutputResponse, PutPermissionPolicyOutputError>) -> Void)
```

  - You can attach only one policy with each PutPermissionPolicy request.

  - The ARN in the request must be a valid WAF \[RuleGroup\] ARN and the rule group must exist in the same Region.

  - The user making the request must be the owner of the rule group.

### tagResource(input:completion:)

Associates tags with the specified Amazon Web Services resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing. For example, you might set the tag key to "customer" and the value to the customer name or ID. You can specify one or more tags to add to each Amazon Web Services resource, up to 50 tags for a resource. You can tag the Amazon Web Services resources that you manage through WAF: web ACLs, rule groups, IP sets, and regex pattern sets. You can't manage or view tags through the WAF console.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:completion:)

Disassociates tags from an Amazon Web Services resource. Tags are key:value pairs that you can associate with Amazon Web Services resources. For example, the tag key might be "customer" and the tag value might be "companyA." You can specify one or more tags to add to each container. You can add up to 50 tags to each Amazon Web Services resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateIPSet(input:completion:)

Updates the specified \[IPSet\]. This operation completely replaces the mutable specifications that you already have for the IP set with the ones that you provide to this call. To modify the IP set, retrieve it by calling \[GetIPSet\], update the settings as needed, and then provide the complete IP set specification to this call.

``` swift
func updateIPSet(input: UpdateIPSetInput, completion: @escaping (ClientRuntime.SdkResult<UpdateIPSetOutputResponse, UpdateIPSetOutputError>) -> Void)
```

### updateManagedRuleSetVersionExpiryDate(input:completion:)

Updates the expiration information for your managed rule set. Use this to initiate the expiration of a managed rule group version. After you initiate expiration for a version, WAF excludes it from the reponse to \[ListAvailableManagedRuleGroupVersions\] for the managed rule group. This is intended for use only by vendors of managed rule sets. Vendors are Amazon Web Services and Amazon Web Services Marketplace sellers. Vendors, you can use the managed rule set APIs to provide controlled rollout of your versioned managed rule group offerings for your customers. The APIs are ListManagedRuleSets, GetManagedRuleSet, PutManagedRuleSetVersions, and UpdateManagedRuleSetVersionExpiryDate.

``` swift
func updateManagedRuleSetVersionExpiryDate(input: UpdateManagedRuleSetVersionExpiryDateInput, completion: @escaping (ClientRuntime.SdkResult<UpdateManagedRuleSetVersionExpiryDateOutputResponse, UpdateManagedRuleSetVersionExpiryDateOutputError>) -> Void)
```

### updateRegexPatternSet(input:completion:)

Updates the specified \[RegexPatternSet\]. This operation completely replaces the mutable specifications that you already have for the regex pattern set with the ones that you provide to this call. To modify the regex pattern set, retrieve it by calling \[GetRegexPatternSet\], update the settings as needed, and then provide the complete regex pattern set specification to this call.

``` swift
func updateRegexPatternSet(input: UpdateRegexPatternSetInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRegexPatternSetOutputResponse, UpdateRegexPatternSetOutputError>) -> Void)
```

### updateRuleGroup(input:completion:)

Updates the specified \[RuleGroup\]. This operation completely replaces the mutable specifications that you already have for the rule group with the ones that you provide to this call. To modify the rule group, retrieve it by calling \[GetRuleGroup\], update the settings as needed, and then provide the complete rule group specification to this call. A rule group defines a collection of rules to inspect and control web requests that you can use in a \[WebACL\]. When you create a rule group, you define an immutable capacity limit. If you update a rule group, you must stay within the capacity. This allows others to reuse the rule group with confidence in its capacity requirements.

``` swift
func updateRuleGroup(input: UpdateRuleGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRuleGroupOutputResponse, UpdateRuleGroupOutputError>) -> Void)
```

### updateWebACL(input:completion:)

Updates the specified \[WebACL\]. This operation completely replaces the mutable specifications that you already have for the web ACL with the ones that you provide to this call. To modify the web ACL, retrieve it by calling \[GetWebACL\], update the settings as needed, and then provide the complete web ACL specification to this call. A web ACL defines a collection of rules to use to inspect and control web requests. Each rule has an action defined (allow, block, or count) for requests that match the statement of the rule. In the web ACL, you assign a default action to take (allow, block) for any request that does not match any of the rules. The rules in a web ACL can be a combination of the types \[Rule\], \[RuleGroup\], and managed rule group. You can associate a web ACL with one or more Amazon Web Services resources to protect. The resources can be an Amazon CloudFront distribution, an Amazon API Gateway REST API, an Application Load Balancer, or an AppSync GraphQL API.

``` swift
func updateWebACL(input: UpdateWebACLInput, completion: @escaping (ClientRuntime.SdkResult<UpdateWebACLOutputResponse, UpdateWebACLOutputError>) -> Void)
```
