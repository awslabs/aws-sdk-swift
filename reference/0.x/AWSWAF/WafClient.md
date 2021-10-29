# WafClient

``` swift
public class WafClient 
```

## Inheritance

[`WafClientProtocol`](/aws-sdk-swift/reference/0.x/AWSWAF/WafClientProtocol)

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
public static let clientName = "WafClient"
```

## Methods

### `createByteMatchSet(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Creates a ByteMatchSet. You then use \[UpdateByteMatchSet\] to identify the part of a web request that you want AWS WAF to inspect, such as the values of the User-Agent header or the query string. For example, you can create a ByteMatchSet that matches any requests with User-Agent headers that contain the string BadBot. You can then configure AWS WAF to reject those requests. To create and configure a ByteMatchSet, perform the following steps:

``` swift
public func createByteMatchSet(input: CreateByteMatchSetInput, completion: @escaping (ClientRuntime.SdkResult<CreateByteMatchSetOutputResponse, CreateByteMatchSetOutputError>) -> Void)
```

  - Use \[GetChangeToken\] to get the change token that you provide in the ChangeToken parameter of a CreateByteMatchSet request.

  - Submit a CreateByteMatchSet request.

  - Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an UpdateByteMatchSet request.

  - Submit an \[UpdateByteMatchSet\] request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch for.

For more information about how to use the AWS WAF API to allow or block HTTP requests, see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).

### `createGeoMatchSet(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Creates an \[GeoMatchSet\], which you use to specify which web requests you want to allow or block based on the country that the requests originate from. For example, if you're receiving a lot of requests from one or more countries and you want to block the requests, you can create an GeoMatchSet that contains those countries and then configure AWS WAF to block the requests. To create and configure a GeoMatchSet, perform the following steps:

``` swift
public func createGeoMatchSet(input: CreateGeoMatchSetInput, completion: @escaping (ClientRuntime.SdkResult<CreateGeoMatchSetOutputResponse, CreateGeoMatchSetOutputError>) -> Void)
```

  - Use \[GetChangeToken\] to get the change token that you provide in the ChangeToken parameter of a CreateGeoMatchSet request.

  - Submit a CreateGeoMatchSet request.

  - Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an \[UpdateGeoMatchSet\] request.

  - Submit an UpdateGeoMatchSetSet request to specify the countries that you want AWS WAF to watch for.

For more information about how to use the AWS WAF API to allow or block HTTP requests, see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).

### `createIPSet(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Creates an \[IPSet\], which you use to specify which web requests that you want to allow or block based on the IP addresses that the requests originate from. For example, if you're receiving a lot of requests from one or more individual IP addresses or one or more ranges of IP addresses and you want to block the requests, you can create an IPSet that contains those IP addresses and then configure AWS WAF to block the requests. To create and configure an IPSet, perform the following steps:

``` swift
public func createIPSet(input: CreateIPSetInput, completion: @escaping (ClientRuntime.SdkResult<CreateIPSetOutputResponse, CreateIPSetOutputError>) -> Void)
```

  - Use \[GetChangeToken\] to get the change token that you provide in the ChangeToken parameter of a CreateIPSet request.

  - Submit a CreateIPSet request.

  - Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an \[UpdateIPSet\] request.

  - Submit an UpdateIPSet request to specify the IP addresses that you want AWS WAF to watch for.

For more information about how to use the AWS WAF API to allow or block HTTP requests, see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).

### `createRateBasedRule(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Creates a \[RateBasedRule\]. The RateBasedRule contains a RateLimit, which specifies the maximum number of requests that AWS WAF allows from a specified IP address in a five-minute period. The RateBasedRule also contains the IPSet objects, ByteMatchSet objects, and other predicates that identify the requests that you want to count or block if these requests exceed the RateLimit. If you add more than one predicate to a RateBasedRule, a request not only must exceed the RateLimit, but it also must match all the conditions to be counted or blocked. For example, suppose you add the following to a RateBasedRule:

``` swift
public func createRateBasedRule(input: CreateRateBasedRuleInput, completion: @escaping (ClientRuntime.SdkResult<CreateRateBasedRuleOutputResponse, CreateRateBasedRuleOutputError>) -> Void)
```

  - An IPSet that matches the IP address 192.0.2.44/32

  - A ByteMatchSet that matches BadBot in the User-Agent header

Further, you specify a RateLimit of 1,000. You then add the RateBasedRule to a WebACL and specify that you want to block requests that meet the conditions in the rule. For a request to be blocked, it must come from the IP address 192.0.2.44 and the User-Agent header in the request must contain the value BadBot. Further, requests that match these two conditions must be received at a rate of more than 1,000 requests every five minutes. If both conditions are met and the rate is exceeded, AWS WAF blocks the requests. If the rate drops below 1,000 for a five-minute period, AWS WAF no longer blocks the requests. As a second example, suppose you want to limit requests to a particular page on your site. To do this, you could add the following to a RateBasedRule:

  - A ByteMatchSet with FieldToMatch of URI

  - A PositionalConstraint of STARTS\_WITH

  - A TargetString of login

Further, you specify a RateLimit of 1,000. By adding this RateBasedRule to a WebACL, you could limit requests to your login page without affecting the rest of your site. To create and configure a RateBasedRule, perform the following steps:

  - Create and update the predicates that you want to include in the rule. For more information, see \[CreateByteMatchSet\], \[CreateIPSet\], and \[CreateSqlInjectionMatchSet\].

  - Use \[GetChangeToken\] to get the change token that you provide in the ChangeToken parameter of a CreateRule request.

  - Submit a CreateRateBasedRule request.

  - Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an \[UpdateRule\] request.

  - Submit an UpdateRateBasedRule request to specify the predicates that you want to include in the rule.

  - Create and update a WebACL that contains the RateBasedRule. For more information, see \[CreateWebACL\].

For more information about how to use the AWS WAF API to allow or block HTTP requests, see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).

### `createRegexMatchSet(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Creates a \[RegexMatchSet\]. You then use \[UpdateRegexMatchSet\] to identify the part of a web request that you want AWS WAF to inspect, such as the values of the User-Agent header or the query string. For example, you can create a RegexMatchSet that contains a RegexMatchTuple that looks for any requests with User-Agent headers that match a RegexPatternSet with pattern B\[a@\]dB\[o0\]t. You can then configure AWS WAF to reject those requests. To create and configure a RegexMatchSet, perform the following steps:

``` swift
public func createRegexMatchSet(input: CreateRegexMatchSetInput, completion: @escaping (ClientRuntime.SdkResult<CreateRegexMatchSetOutputResponse, CreateRegexMatchSetOutputError>) -> Void)
```

  - Use \[GetChangeToken\] to get the change token that you provide in the ChangeToken parameter of a CreateRegexMatchSet request.

  - Submit a CreateRegexMatchSet request.

  - Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an UpdateRegexMatchSet request.

  - Submit an \[UpdateRegexMatchSet\] request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value, using a RegexPatternSet, that you want AWS WAF to watch for.

For more information about how to use the AWS WAF API to allow or block HTTP requests, see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).

### `createRegexPatternSet(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Creates a RegexPatternSet. You then use \[UpdateRegexPatternSet\] to specify the regular expression (regex) pattern that you want AWS WAF to search for, such as B\[a@\]dB\[o0\]t. You can then configure AWS WAF to reject those requests. To create and configure a RegexPatternSet, perform the following steps:

``` swift
public func createRegexPatternSet(input: CreateRegexPatternSetInput, completion: @escaping (ClientRuntime.SdkResult<CreateRegexPatternSetOutputResponse, CreateRegexPatternSetOutputError>) -> Void)
```

  - Use \[GetChangeToken\] to get the change token that you provide in the ChangeToken parameter of a CreateRegexPatternSet request.

  - Submit a CreateRegexPatternSet request.

  - Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an UpdateRegexPatternSet request.

  - Submit an \[UpdateRegexPatternSet\] request to specify the string that you want AWS WAF to watch for.

For more information about how to use the AWS WAF API to allow or block HTTP requests, see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).

### `createRule(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Creates a Rule, which contains the IPSet objects, ByteMatchSet objects, and other predicates that identify the requests that you want to block. If you add more than one predicate to a Rule, a request must match all of the specifications to be allowed or blocked. For example, suppose that you add the following to a Rule:

``` swift
public func createRule(input: CreateRuleInput, completion: @escaping (ClientRuntime.SdkResult<CreateRuleOutputResponse, CreateRuleOutputError>) -> Void)
```

  - An IPSet that matches the IP address 192.0.2.44/32

  - A ByteMatchSet that matches BadBot in the User-Agent header

You then add the Rule to a WebACL and specify that you want to blocks requests that satisfy the Rule. For a request to be blocked, it must come from the IP address 192.0.2.44 and the User-Agent header in the request must contain the value BadBot. To create and configure a Rule, perform the following steps:

  - Create and update the predicates that you want to include in the Rule. For more information, see \[CreateByteMatchSet\], \[CreateIPSet\], and \[CreateSqlInjectionMatchSet\].

  - Use \[GetChangeToken\] to get the change token that you provide in the ChangeToken parameter of a CreateRule request.

  - Submit a CreateRule request.

  - Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an \[UpdateRule\] request.

  - Submit an UpdateRule request to specify the predicates that you want to include in the Rule.

  - Create and update a WebACL that contains the Rule. For more information, see \[CreateWebACL\].

For more information about how to use the AWS WAF API to allow or block HTTP requests, see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).

### `createRuleGroup(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Creates a RuleGroup. A rule group is a collection of predefined rules that you add to a web ACL. You use \[UpdateRuleGroup\] to add rules to the rule group. Rule groups are subject to the following limits:

``` swift
public func createRuleGroup(input: CreateRuleGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateRuleGroupOutputResponse, CreateRuleGroupOutputError>) -> Void)
```

  - Three rule groups per account. You can request an increase to this limit by contacting customer support.

  - One rule group per web ACL.

  - Ten rules per rule group.

For more information about how to use the AWS WAF API to allow or block HTTP requests, see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).

### `createSizeConstraintSet(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Creates a SizeConstraintSet. You then use \[UpdateSizeConstraintSet\] to identify the part of a web request that you want AWS WAF to check for length, such as the length of the User-Agent header or the length of the query string. For example, you can create a SizeConstraintSet that matches any requests that have a query string that is longer than 100 bytes. You can then configure AWS WAF to reject those requests. To create and configure a SizeConstraintSet, perform the following steps:

``` swift
public func createSizeConstraintSet(input: CreateSizeConstraintSetInput, completion: @escaping (ClientRuntime.SdkResult<CreateSizeConstraintSetOutputResponse, CreateSizeConstraintSetOutputError>) -> Void)
```

  - Use \[GetChangeToken\] to get the change token that you provide in the ChangeToken parameter of a CreateSizeConstraintSet request.

  - Submit a CreateSizeConstraintSet request.

  - Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an UpdateSizeConstraintSet request.

  - Submit an \[UpdateSizeConstraintSet\] request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch for.

For more information about how to use the AWS WAF API to allow or block HTTP requests, see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).

### `createSqlInjectionMatchSet(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Creates a \[SqlInjectionMatchSet\], which you use to allow, block, or count requests that contain snippets of SQL code in a specified part of web requests. AWS WAF searches for character sequences that are likely to be malicious strings. To create and configure a SqlInjectionMatchSet, perform the following steps:

``` swift
public func createSqlInjectionMatchSet(input: CreateSqlInjectionMatchSetInput, completion: @escaping (ClientRuntime.SdkResult<CreateSqlInjectionMatchSetOutputResponse, CreateSqlInjectionMatchSetOutputError>) -> Void)
```

  - Use \[GetChangeToken\] to get the change token that you provide in the ChangeToken parameter of a CreateSqlInjectionMatchSet request.

  - Submit a CreateSqlInjectionMatchSet request.

  - Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an \[UpdateSqlInjectionMatchSet\] request.

  - Submit an \[UpdateSqlInjectionMatchSet\] request to specify the parts of web requests in which you want to allow, block, or count malicious SQL code.

For more information about how to use the AWS WAF API to allow or block HTTP requests, see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).

### `createWebACL(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Creates a WebACL, which contains the Rules that identify the CloudFront web requests that you want to allow, block, or count. AWS WAF evaluates Rules in order based on the value of Priority for each Rule. You also specify a default action, either ALLOW or BLOCK. If a web request doesn't match any of the Rules in a WebACL, AWS WAF responds to the request with the default action. To create and configure a WebACL, perform the following steps:

``` swift
public func createWebACL(input: CreateWebACLInput, completion: @escaping (ClientRuntime.SdkResult<CreateWebACLOutputResponse, CreateWebACLOutputError>) -> Void)
```

  - Create and update the ByteMatchSet objects and other predicates that you want to include in Rules. For more information, see \[CreateByteMatchSet\], \[UpdateByteMatchSet\], \[CreateIPSet\], \[UpdateIPSet\], \[CreateSqlInjectionMatchSet\], and \[UpdateSqlInjectionMatchSet\].

  - Create and update the Rules that you want to include in the WebACL. For more information, see \[CreateRule\] and \[UpdateRule\].

  - Use \[GetChangeToken\] to get the change token that you provide in the ChangeToken parameter of a CreateWebACL request.

  - Submit a CreateWebACL request.

  - Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an \[UpdateWebACL\] request.

  - Submit an \[UpdateWebACL\] request to specify the Rules that you want to include in the WebACL, to specify the default action, and to associate the WebACL with a CloudFront distribution.

For more information about how to use the AWS WAF API, see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).

### `createWebACLMigrationStack(input:completion:)`

Creates an AWS CloudFormation WAFV2 template for the specified web ACL in the specified Amazon S3 bucket. Then, in CloudFormation, you create a stack from the template, to create the web ACL and its resources in AWS WAFV2. Use this to migrate your AWS WAF Classic web ACL to the latest version of AWS WAF. This is part of a larger migration procedure for web ACLs from AWS WAF Classic to the latest version of AWS WAF. For the full procedure, including caveats and manual steps to complete the migration and switch over to the new web ACL, see [Migrating your AWS WAF Classic resources to AWS WAF](https://docs.aws.amazon.com/waf/latest/developerguide/waf-migrating-from-classic.html) in the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html).

``` swift
public func createWebACLMigrationStack(input: CreateWebACLMigrationStackInput, completion: @escaping (ClientRuntime.SdkResult<CreateWebACLMigrationStackOutputResponse, CreateWebACLMigrationStackOutputError>) -> Void)
```

### `createXssMatchSet(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Creates an \[XssMatchSet\], which you use to allow, block, or count requests that contain cross-site scripting attacks in the specified part of web requests. AWS WAF searches for character sequences that are likely to be malicious strings. To create and configure an XssMatchSet, perform the following steps:

``` swift
public func createXssMatchSet(input: CreateXssMatchSetInput, completion: @escaping (ClientRuntime.SdkResult<CreateXssMatchSetOutputResponse, CreateXssMatchSetOutputError>) -> Void)
```

  - Use \[GetChangeToken\] to get the change token that you provide in the ChangeToken parameter of a CreateXssMatchSet request.

  - Submit a CreateXssMatchSet request.

  - Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an \[UpdateXssMatchSet\] request.

  - Submit an \[UpdateXssMatchSet\] request to specify the parts of web requests in which you want to allow, block, or count cross-site scripting attacks.

For more information about how to use the AWS WAF API to allow or block HTTP requests, see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).

### `deleteByteMatchSet(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Permanently deletes a \[ByteMatchSet\]. You can't delete a ByteMatchSet if it's still used in any Rules or if it still includes any \[ByteMatchTuple\] objects (any filters). If you just want to remove a ByteMatchSet from a Rule, use \[UpdateRule\]. To permanently delete a ByteMatchSet, perform the following steps:

``` swift
public func deleteByteMatchSet(input: DeleteByteMatchSetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteByteMatchSetOutputResponse, DeleteByteMatchSetOutputError>) -> Void)
```

  - Update the ByteMatchSet to remove filters, if any. For more information, see \[UpdateByteMatchSet\].

  - Use \[GetChangeToken\] to get the change token that you provide in the ChangeToken parameter of a DeleteByteMatchSet request.

  - Submit a DeleteByteMatchSet request.

### `deleteGeoMatchSet(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Permanently deletes a \[GeoMatchSet\]. You can't delete a GeoMatchSet if it's still used in any Rules or if it still includes any countries. If you just want to remove a GeoMatchSet from a Rule, use \[UpdateRule\]. To permanently delete a GeoMatchSet from AWS WAF, perform the following steps:

``` swift
public func deleteGeoMatchSet(input: DeleteGeoMatchSetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteGeoMatchSetOutputResponse, DeleteGeoMatchSetOutputError>) -> Void)
```

  - Update the GeoMatchSet to remove any countries. For more information, see \[UpdateGeoMatchSet\].

  - Use \[GetChangeToken\] to get the change token that you provide in the ChangeToken parameter of a DeleteGeoMatchSet request.

  - Submit a DeleteGeoMatchSet request.

### `deleteIPSet(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Permanently deletes an \[IPSet\]. You can't delete an IPSet if it's still used in any Rules or if it still includes any IP addresses. If you just want to remove an IPSet from a Rule, use \[UpdateRule\]. To permanently delete an IPSet from AWS WAF, perform the following steps:

``` swift
public func deleteIPSet(input: DeleteIPSetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteIPSetOutputResponse, DeleteIPSetOutputError>) -> Void)
```

  - Update the IPSet to remove IP address ranges, if any. For more information, see \[UpdateIPSet\].

  - Use \[GetChangeToken\] to get the change token that you provide in the ChangeToken parameter of a DeleteIPSet request.

  - Submit a DeleteIPSet request.

### `deleteLoggingConfiguration(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Permanently deletes the \[LoggingConfiguration\] from the specified web ACL.

``` swift
public func deleteLoggingConfiguration(input: DeleteLoggingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLoggingConfigurationOutputResponse, DeleteLoggingConfigurationOutputError>) -> Void)
```

### `deletePermissionPolicy(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Permanently deletes an IAM policy from the specified RuleGroup. The user making the request must be the owner of the RuleGroup.

``` swift
public func deletePermissionPolicy(input: DeletePermissionPolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeletePermissionPolicyOutputResponse, DeletePermissionPolicyOutputError>) -> Void)
```

### `deleteRateBasedRule(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Permanently deletes a \[RateBasedRule\]. You can't delete a rule if it's still used in any WebACL objects or if it still includes any predicates, such as ByteMatchSet objects. If you just want to remove a rule from a WebACL, use \[UpdateWebACL\]. To permanently delete a RateBasedRule from AWS WAF, perform the following steps:

``` swift
public func deleteRateBasedRule(input: DeleteRateBasedRuleInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRateBasedRuleOutputResponse, DeleteRateBasedRuleOutputError>) -> Void)
```

  - Update the RateBasedRule to remove predicates, if any. For more information, see \[UpdateRateBasedRule\].

  - Use \[GetChangeToken\] to get the change token that you provide in the ChangeToken parameter of a DeleteRateBasedRule request.

  - Submit a DeleteRateBasedRule request.

### `deleteRegexMatchSet(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Permanently deletes a \[RegexMatchSet\]. You can't delete a RegexMatchSet if it's still used in any Rules or if it still includes any RegexMatchTuples objects (any filters). If you just want to remove a RegexMatchSet from a Rule, use \[UpdateRule\]. To permanently delete a RegexMatchSet, perform the following steps:

``` swift
public func deleteRegexMatchSet(input: DeleteRegexMatchSetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRegexMatchSetOutputResponse, DeleteRegexMatchSetOutputError>) -> Void)
```

  - Update the RegexMatchSet to remove filters, if any. For more information, see \[UpdateRegexMatchSet\].

  - Use \[GetChangeToken\] to get the change token that you provide in the ChangeToken parameter of a DeleteRegexMatchSet request.

  - Submit a DeleteRegexMatchSet request.

### `deleteRegexPatternSet(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Permanently deletes a \[RegexPatternSet\]. You can't delete a RegexPatternSet if it's still used in any RegexMatchSet or if the RegexPatternSet is not empty.

``` swift
public func deleteRegexPatternSet(input: DeleteRegexPatternSetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRegexPatternSetOutputResponse, DeleteRegexPatternSetOutputError>) -> Void)
```

### `deleteRule(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Permanently deletes a \[Rule\]. You can't delete a Rule if it's still used in any WebACL objects or if it still includes any predicates, such as ByteMatchSet objects. If you just want to remove a Rule from a WebACL, use \[UpdateWebACL\]. To permanently delete a Rule from AWS WAF, perform the following steps:

``` swift
public func deleteRule(input: DeleteRuleInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRuleOutputResponse, DeleteRuleOutputError>) -> Void)
```

  - Update the Rule to remove predicates, if any. For more information, see \[UpdateRule\].

  - Use \[GetChangeToken\] to get the change token that you provide in the ChangeToken parameter of a DeleteRule request.

  - Submit a DeleteRule request.

### `deleteRuleGroup(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Permanently deletes a \[RuleGroup\]. You can't delete a RuleGroup if it's still used in any WebACL objects or if it still includes any rules. If you just want to remove a RuleGroup from a WebACL, use \[UpdateWebACL\]. To permanently delete a RuleGroup from AWS WAF, perform the following steps:

``` swift
public func deleteRuleGroup(input: DeleteRuleGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRuleGroupOutputResponse, DeleteRuleGroupOutputError>) -> Void)
```

  - Update the RuleGroup to remove rules, if any. For more information, see \[UpdateRuleGroup\].

  - Use \[GetChangeToken\] to get the change token that you provide in the ChangeToken parameter of a DeleteRuleGroup request.

  - Submit a DeleteRuleGroup request.

### `deleteSizeConstraintSet(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Permanently deletes a \[SizeConstraintSet\]. You can't delete a SizeConstraintSet if it's still used in any Rules or if it still includes any \[SizeConstraint\] objects (any filters). If you just want to remove a SizeConstraintSet from a Rule, use \[UpdateRule\]. To permanently delete a SizeConstraintSet, perform the following steps:

``` swift
public func deleteSizeConstraintSet(input: DeleteSizeConstraintSetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSizeConstraintSetOutputResponse, DeleteSizeConstraintSetOutputError>) -> Void)
```

  - Update the SizeConstraintSet to remove filters, if any. For more information, see \[UpdateSizeConstraintSet\].

  - Use \[GetChangeToken\] to get the change token that you provide in the ChangeToken parameter of a DeleteSizeConstraintSet request.

  - Submit a DeleteSizeConstraintSet request.

### `deleteSqlInjectionMatchSet(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Permanently deletes a \[SqlInjectionMatchSet\]. You can't delete a SqlInjectionMatchSet if it's still used in any Rules or if it still contains any \[SqlInjectionMatchTuple\] objects. If you just want to remove a SqlInjectionMatchSet from a Rule, use \[UpdateRule\]. To permanently delete a SqlInjectionMatchSet from AWS WAF, perform the following steps:

``` swift
public func deleteSqlInjectionMatchSet(input: DeleteSqlInjectionMatchSetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSqlInjectionMatchSetOutputResponse, DeleteSqlInjectionMatchSetOutputError>) -> Void)
```

  - Update the SqlInjectionMatchSet to remove filters, if any. For more information, see \[UpdateSqlInjectionMatchSet\].

  - Use \[GetChangeToken\] to get the change token that you provide in the ChangeToken parameter of a DeleteSqlInjectionMatchSet request.

  - Submit a DeleteSqlInjectionMatchSet request.

### `deleteWebACL(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Permanently deletes a \[WebACL\]. You can't delete a WebACL if it still contains any Rules. To delete a WebACL, perform the following steps:

``` swift
public func deleteWebACL(input: DeleteWebACLInput, completion: @escaping (ClientRuntime.SdkResult<DeleteWebACLOutputResponse, DeleteWebACLOutputError>) -> Void)
```

  - Update the WebACL to remove Rules, if any. For more information, see \[UpdateWebACL\].

  - Use \[GetChangeToken\] to get the change token that you provide in the ChangeToken parameter of a DeleteWebACL request.

  - Submit a DeleteWebACL request.

### `deleteXssMatchSet(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Permanently deletes an \[XssMatchSet\]. You can't delete an XssMatchSet if it's still used in any Rules or if it still contains any \[XssMatchTuple\] objects. If you just want to remove an XssMatchSet from a Rule, use \[UpdateRule\]. To permanently delete an XssMatchSet from AWS WAF, perform the following steps:

``` swift
public func deleteXssMatchSet(input: DeleteXssMatchSetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteXssMatchSetOutputResponse, DeleteXssMatchSetOutputError>) -> Void)
```

  - Update the XssMatchSet to remove filters, if any. For more information, see \[UpdateXssMatchSet\].

  - Use \[GetChangeToken\] to get the change token that you provide in the ChangeToken parameter of a DeleteXssMatchSet request.

  - Submit a DeleteXssMatchSet request.

### `getByteMatchSet(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Returns the \[ByteMatchSet\] specified by ByteMatchSetId.

``` swift
public func getByteMatchSet(input: GetByteMatchSetInput, completion: @escaping (ClientRuntime.SdkResult<GetByteMatchSetOutputResponse, GetByteMatchSetOutputError>) -> Void)
```

### `getChangeToken(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. When you want to create, update, or delete AWS WAF objects, get a change token and include the change token in the create, update, or delete request. Change tokens ensure that your application doesn't submit conflicting requests to AWS WAF. Each create, update, or delete request must use a unique change token. If your application submits a GetChangeToken request and then submits a second GetChangeToken request before submitting a create, update, or delete request, the second GetChangeToken request returns the same value as the first GetChangeToken request. When you use a change token in a create, update, or delete request, the status of the change token changes to PENDING, which indicates that AWS WAF is propagating the change to all AWS WAF servers. Use GetChangeTokenStatus to determine the status of your change token.

``` swift
public func getChangeToken(input: GetChangeTokenInput, completion: @escaping (ClientRuntime.SdkResult<GetChangeTokenOutputResponse, GetChangeTokenOutputError>) -> Void)
```

### `getChangeTokenStatus(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Returns the status of a ChangeToken that you got by calling \[GetChangeToken\]. ChangeTokenStatus is one of the following values:

``` swift
public func getChangeTokenStatus(input: GetChangeTokenStatusInput, completion: @escaping (ClientRuntime.SdkResult<GetChangeTokenStatusOutputResponse, GetChangeTokenStatusOutputError>) -> Void)
```

  - PROVISIONED: You requested the change token by calling GetChangeToken, but you haven't used it yet in a call to create, update, or delete an AWS WAF object.

  - PENDING: AWS WAF is propagating the create, update, or delete request to all AWS WAF servers.

  - INSYNC: Propagation is complete.

### `getGeoMatchSet(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Returns the \[GeoMatchSet\] that is specified by GeoMatchSetId.

``` swift
public func getGeoMatchSet(input: GetGeoMatchSetInput, completion: @escaping (ClientRuntime.SdkResult<GetGeoMatchSetOutputResponse, GetGeoMatchSetOutputError>) -> Void)
```

### `getIPSet(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Returns the \[IPSet\] that is specified by IPSetId.

``` swift
public func getIPSet(input: GetIPSetInput, completion: @escaping (ClientRuntime.SdkResult<GetIPSetOutputResponse, GetIPSetOutputError>) -> Void)
```

### `getLoggingConfiguration(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Returns the \[LoggingConfiguration\] for the specified web ACL.

``` swift
public func getLoggingConfiguration(input: GetLoggingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetLoggingConfigurationOutputResponse, GetLoggingConfigurationOutputError>) -> Void)
```

### `getPermissionPolicy(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Returns the IAM policy attached to the RuleGroup.

``` swift
public func getPermissionPolicy(input: GetPermissionPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetPermissionPolicyOutputResponse, GetPermissionPolicyOutputError>) -> Void)
```

### `getRateBasedRule(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Returns the \[RateBasedRule\] that is specified by the RuleId that you included in the GetRateBasedRule request.

``` swift
public func getRateBasedRule(input: GetRateBasedRuleInput, completion: @escaping (ClientRuntime.SdkResult<GetRateBasedRuleOutputResponse, GetRateBasedRuleOutputError>) -> Void)
```

### `getRateBasedRuleManagedKeys(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Returns an array of IP addresses currently being blocked by the \[RateBasedRule\] that is specified by the RuleId. The maximum number of managed keys that will be blocked is 10,000. If more than 10,000 addresses exceed the rate limit, the 10,000 addresses with the highest rates will be blocked.

``` swift
public func getRateBasedRuleManagedKeys(input: GetRateBasedRuleManagedKeysInput, completion: @escaping (ClientRuntime.SdkResult<GetRateBasedRuleManagedKeysOutputResponse, GetRateBasedRuleManagedKeysOutputError>) -> Void)
```

### `getRegexMatchSet(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Returns the \[RegexMatchSet\] specified by RegexMatchSetId.

``` swift
public func getRegexMatchSet(input: GetRegexMatchSetInput, completion: @escaping (ClientRuntime.SdkResult<GetRegexMatchSetOutputResponse, GetRegexMatchSetOutputError>) -> Void)
```

### `getRegexPatternSet(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Returns the \[RegexPatternSet\] specified by RegexPatternSetId.

``` swift
public func getRegexPatternSet(input: GetRegexPatternSetInput, completion: @escaping (ClientRuntime.SdkResult<GetRegexPatternSetOutputResponse, GetRegexPatternSetOutputError>) -> Void)
```

### `getRule(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Returns the \[Rule\] that is specified by the RuleId that you included in the GetRule request.

``` swift
public func getRule(input: GetRuleInput, completion: @escaping (ClientRuntime.SdkResult<GetRuleOutputResponse, GetRuleOutputError>) -> Void)
```

### `getRuleGroup(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Returns the \[RuleGroup\] that is specified by the RuleGroupId that you included in the GetRuleGroup request. To view the rules in a rule group, use \[ListActivatedRulesInRuleGroup\].

``` swift
public func getRuleGroup(input: GetRuleGroupInput, completion: @escaping (ClientRuntime.SdkResult<GetRuleGroupOutputResponse, GetRuleGroupOutputError>) -> Void)
```

### `getSampledRequests(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Gets detailed information about a specified number of requests--a sample--that AWS WAF randomly selects from among the first 5,000 requests that your AWS resource received during a time range that you choose. You can specify a sample size of up to 500 requests, and you can specify any time range in the previous three hours. GetSampledRequests returns a time range, which is usually the time range that you specified. However, if your resource (such as a CloudFront distribution) received 5,000 requests before the specified time range elapsed, GetSampledRequests returns an updated time range. This new time range indicates the actual period during which AWS WAF selected the requests in the sample.

``` swift
public func getSampledRequests(input: GetSampledRequestsInput, completion: @escaping (ClientRuntime.SdkResult<GetSampledRequestsOutputResponse, GetSampledRequestsOutputError>) -> Void)
```

### `getSizeConstraintSet(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Returns the \[SizeConstraintSet\] specified by SizeConstraintSetId.

``` swift
public func getSizeConstraintSet(input: GetSizeConstraintSetInput, completion: @escaping (ClientRuntime.SdkResult<GetSizeConstraintSetOutputResponse, GetSizeConstraintSetOutputError>) -> Void)
```

### `getSqlInjectionMatchSet(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Returns the \[SqlInjectionMatchSet\] that is specified by SqlInjectionMatchSetId.

``` swift
public func getSqlInjectionMatchSet(input: GetSqlInjectionMatchSetInput, completion: @escaping (ClientRuntime.SdkResult<GetSqlInjectionMatchSetOutputResponse, GetSqlInjectionMatchSetOutputError>) -> Void)
```

### `getWebACL(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Returns the \[WebACL\] that is specified by WebACLId.

``` swift
public func getWebACL(input: GetWebACLInput, completion: @escaping (ClientRuntime.SdkResult<GetWebACLOutputResponse, GetWebACLOutputError>) -> Void)
```

### `getXssMatchSet(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Returns the \[XssMatchSet\] that is specified by XssMatchSetId.

``` swift
public func getXssMatchSet(input: GetXssMatchSetInput, completion: @escaping (ClientRuntime.SdkResult<GetXssMatchSetOutputResponse, GetXssMatchSetOutputError>) -> Void)
```

### `listActivatedRulesInRuleGroup(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Returns an array of \[ActivatedRule\] objects.

``` swift
public func listActivatedRulesInRuleGroup(input: ListActivatedRulesInRuleGroupInput, completion: @escaping (ClientRuntime.SdkResult<ListActivatedRulesInRuleGroupOutputResponse, ListActivatedRulesInRuleGroupOutputError>) -> Void)
```

### `listByteMatchSets(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Returns an array of \[ByteMatchSetSummary\] objects.

``` swift
public func listByteMatchSets(input: ListByteMatchSetsInput, completion: @escaping (ClientRuntime.SdkResult<ListByteMatchSetsOutputResponse, ListByteMatchSetsOutputError>) -> Void)
```

### `listGeoMatchSets(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Returns an array of \[GeoMatchSetSummary\] objects in the response.

``` swift
public func listGeoMatchSets(input: ListGeoMatchSetsInput, completion: @escaping (ClientRuntime.SdkResult<ListGeoMatchSetsOutputResponse, ListGeoMatchSetsOutputError>) -> Void)
```

### `listIPSets(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Returns an array of \[IPSetSummary\] objects in the response.

``` swift
public func listIPSets(input: ListIPSetsInput, completion: @escaping (ClientRuntime.SdkResult<ListIPSetsOutputResponse, ListIPSetsOutputError>) -> Void)
```

### `listLoggingConfigurations(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Returns an array of \[LoggingConfiguration\] objects.

``` swift
public func listLoggingConfigurations(input: ListLoggingConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<ListLoggingConfigurationsOutputResponse, ListLoggingConfigurationsOutputError>) -> Void)
```

### `listRateBasedRules(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Returns an array of \[RuleSummary\] objects.

``` swift
public func listRateBasedRules(input: ListRateBasedRulesInput, completion: @escaping (ClientRuntime.SdkResult<ListRateBasedRulesOutputResponse, ListRateBasedRulesOutputError>) -> Void)
```

### `listRegexMatchSets(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Returns an array of \[RegexMatchSetSummary\] objects.

``` swift
public func listRegexMatchSets(input: ListRegexMatchSetsInput, completion: @escaping (ClientRuntime.SdkResult<ListRegexMatchSetsOutputResponse, ListRegexMatchSetsOutputError>) -> Void)
```

### `listRegexPatternSets(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Returns an array of \[RegexPatternSetSummary\] objects.

``` swift
public func listRegexPatternSets(input: ListRegexPatternSetsInput, completion: @escaping (ClientRuntime.SdkResult<ListRegexPatternSetsOutputResponse, ListRegexPatternSetsOutputError>) -> Void)
```

### `listRuleGroups(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Returns an array of \[RuleGroup\] objects.

``` swift
public func listRuleGroups(input: ListRuleGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListRuleGroupsOutputResponse, ListRuleGroupsOutputError>) -> Void)
```

### `listRules(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Returns an array of \[RuleSummary\] objects.

``` swift
public func listRules(input: ListRulesInput, completion: @escaping (ClientRuntime.SdkResult<ListRulesOutputResponse, ListRulesOutputError>) -> Void)
```

### `listSizeConstraintSets(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Returns an array of \[SizeConstraintSetSummary\] objects.

``` swift
public func listSizeConstraintSets(input: ListSizeConstraintSetsInput, completion: @escaping (ClientRuntime.SdkResult<ListSizeConstraintSetsOutputResponse, ListSizeConstraintSetsOutputError>) -> Void)
```

### `listSqlInjectionMatchSets(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Returns an array of \[SqlInjectionMatchSet\] objects.

``` swift
public func listSqlInjectionMatchSets(input: ListSqlInjectionMatchSetsInput, completion: @escaping (ClientRuntime.SdkResult<ListSqlInjectionMatchSetsOutputResponse, ListSqlInjectionMatchSetsOutputError>) -> Void)
```

### `listSubscribedRuleGroups(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Returns an array of \[RuleGroup\] objects that you are subscribed to.

``` swift
public func listSubscribedRuleGroups(input: ListSubscribedRuleGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListSubscribedRuleGroupsOutputResponse, ListSubscribedRuleGroupsOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Retrieves the tags associated with the specified AWS resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing. For example, you might set the tag key to "customer" and the value to the customer name or ID. You can specify one or more tags to add to each AWS resource, up to 50 tags for a resource. Tagging is only available through the API, SDKs, and CLI. You can't manage or view tags through the AWS WAF Classic console. You can tag the AWS resources that you manage through AWS WAF Classic: web ACLs, rule groups, and rules.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `listWebACLs(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Returns an array of \[WebACLSummary\] objects in the response.

``` swift
public func listWebACLs(input: ListWebACLsInput, completion: @escaping (ClientRuntime.SdkResult<ListWebACLsOutputResponse, ListWebACLsOutputError>) -> Void)
```

### `listXssMatchSets(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Returns an array of \[XssMatchSet\] objects.

``` swift
public func listXssMatchSets(input: ListXssMatchSetsInput, completion: @escaping (ClientRuntime.SdkResult<ListXssMatchSetsOutputResponse, ListXssMatchSetsOutputError>) -> Void)
```

### `putLoggingConfiguration(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Associates a \[LoggingConfiguration\] with a specified web ACL. You can access information about all traffic that AWS WAF inspects using the following steps:

``` swift
public func putLoggingConfiguration(input: PutLoggingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<PutLoggingConfigurationOutputResponse, PutLoggingConfigurationOutputError>) -> Void)
```

  - Create an Amazon Kinesis Data Firehose. Create the data firehose with a PUT source and in the region that you are operating. However, if you are capturing logs for Amazon CloudFront, always create the firehose in US East (N. Virginia). Do not create the data firehose using a Kinesis stream as your source.

  - Associate that firehose to your web ACL using a PutLoggingConfiguration request.

When you successfully enable logging using a PutLoggingConfiguration request, AWS WAF will create a service linked role with the necessary permissions to write logs to the Amazon Kinesis Data Firehose. For more information, see [Logging Web ACL Traffic Information](https://docs.aws.amazon.com/waf/latest/developerguide/logging.html) in the AWS WAF Developer Guide.

### `putPermissionPolicy(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Attaches an IAM policy to the specified resource. The only supported use for this action is to share a RuleGroup across accounts. The PutPermissionPolicy is subject to the following restrictions:

``` swift
public func putPermissionPolicy(input: PutPermissionPolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutPermissionPolicyOutputResponse, PutPermissionPolicyOutputError>) -> Void)
```

  - You can attach only one policy with each PutPermissionPolicy request.

  - The policy must include an Effect, Action and Principal.

  - Effect must specify Allow.

  - The Action in the policy must be waf:UpdateWebACL, waf-regional:UpdateWebACL, waf:GetRuleGroup and waf-regional:GetRuleGroup . Any extra or wildcard actions in the policy will be rejected.

  - The policy cannot include a Resource parameter.

  - The ARN in the request must be a valid WAF RuleGroup ARN and the RuleGroup must exist in the same region.

  - The user making the request must be the owner of the RuleGroup.

  - Your policy must be composed using IAM Policy version 2012-10-17.

For more information, see [IAM Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html). An example of a valid policy parameter is shown in the Examples section below.

### `tagResource(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Associates tags with the specified AWS resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing. For example, you might set the tag key to "customer" and the value to the customer name or ID. You can specify one or more tags to add to each AWS resource, up to 50 tags for a resource. Tagging is only available through the API, SDKs, and CLI. You can't manage or view tags through the AWS WAF Classic console. You can use this action to tag the AWS resources that you manage through AWS WAF Classic: web ACLs, rule groups, and rules.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateByteMatchSet(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Inserts or deletes \[ByteMatchTuple\] objects (filters) in a \[ByteMatchSet\]. For each ByteMatchTuple object, you specify the following values:

``` swift
public func updateByteMatchSet(input: UpdateByteMatchSetInput, completion: @escaping (ClientRuntime.SdkResult<UpdateByteMatchSetOutputResponse, UpdateByteMatchSetOutputError>) -> Void)
```

  - Whether to insert or delete the object from the array. If you want to change a ByteMatchSetUpdate object, you delete the existing object and add a new one.

  - The part of a web request that you want AWS WAF to inspect, such as a query string or the value of the User-Agent header.

  - The bytes (typically a string that corresponds with ASCII characters) that you want AWS WAF to look for. For more information, including how you specify the values for the AWS WAF API and the AWS CLI or SDKs, see TargetString in the \[ByteMatchTuple\] data type.

  - Where to look, such as at the beginning or the end of a query string.

  - Whether to perform any conversions on the request, such as converting it to lowercase, before inspecting it for the specified string.

For example, you can add a ByteMatchSetUpdate object that matches web requests in which User-Agent headers contain the string BadBot. You can then configure AWS WAF to block those requests. To create and configure a ByteMatchSet, perform the following steps:

  - Create a ByteMatchSet. For more information, see \[CreateByteMatchSet\].

  - Use \[GetChangeToken\] to get the change token that you provide in the ChangeToken parameter of an UpdateByteMatchSet request.

  - Submit an UpdateByteMatchSet request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch for.

For more information about how to use the AWS WAF API to allow or block HTTP requests, see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).

### `updateGeoMatchSet(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Inserts or deletes \[GeoMatchConstraint\] objects in an GeoMatchSet. For each GeoMatchConstraint object, you specify the following values:

``` swift
public func updateGeoMatchSet(input: UpdateGeoMatchSetInput, completion: @escaping (ClientRuntime.SdkResult<UpdateGeoMatchSetOutputResponse, UpdateGeoMatchSetOutputError>) -> Void)
```

  - Whether to insert or delete the object from the array. If you want to change an GeoMatchConstraint object, you delete the existing object and add a new one.

  - The Type. The only valid value for Type is Country.

  - The Value, which is a two character code for the country to add to the GeoMatchConstraint object. Valid codes are listed in \[GeoMatchConstraint$Value\].

To create and configure an GeoMatchSet, perform the following steps:

  - Submit a \[CreateGeoMatchSet\] request.

  - Use \[GetChangeToken\] to get the change token that you provide in the ChangeToken parameter of an \[UpdateGeoMatchSet\] request.

  - Submit an UpdateGeoMatchSet request to specify the country that you want AWS WAF to watch for.

When you update an GeoMatchSet, you specify the country that you want to add and/or the country that you want to delete. If you want to change a country, you delete the existing country and add the new one. For more information about how to use the AWS WAF API to allow or block HTTP requests, see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).

### `updateIPSet(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Inserts or deletes \[IPSetDescriptor\] objects in an IPSet. For each IPSetDescriptor object, you specify the following values:

``` swift
public func updateIPSet(input: UpdateIPSetInput, completion: @escaping (ClientRuntime.SdkResult<UpdateIPSetOutputResponse, UpdateIPSetOutputError>) -> Void)
```

  - Whether to insert or delete the object from the array. If you want to change an IPSetDescriptor object, you delete the existing object and add a new one.

  - The IP address version, IPv4 or IPv6.

  - The IP address in CIDR notation, for example, 192.0.2.0/24 (for the range of IP addresses from 192.0.2.0 to 192.0.2.255) or 192.0.2.44/32 (for the individual IP address 192.0.2.44).

AWS WAF supports IPv4 address ranges: /8 and any range between /16 through /32. AWS WAF supports IPv6 address ranges: /24, /32, /48, /56, /64, and /128. For more information about CIDR notation, see the Wikipedia entry [Classless Inter-Domain Routing](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing). IPv6 addresses can be represented using any of the following formats:

  - 1111:0000:0000:0000:0000:0000:0000:0111/128

  - 1111:0:0:0:0:0:0:0111/128

  - 1111::0111/128

  - 1111::111/128

You use an IPSet to specify which web requests you want to allow or block based on the IP addresses that the requests originated from. For example, if you're receiving a lot of requests from one or a small number of IP addresses and you want to block the requests, you can create an IPSet that specifies those IP addresses, and then configure AWS WAF to block the requests. To create and configure an IPSet, perform the following steps:

  - Submit a \[CreateIPSet\] request.

  - Use \[GetChangeToken\] to get the change token that you provide in the ChangeToken parameter of an \[UpdateIPSet\] request.

  - Submit an UpdateIPSet request to specify the IP addresses that you want AWS WAF to watch for.

When you update an IPSet, you specify the IP addresses that you want to add and/or the IP addresses that you want to delete. If you want to change an IP address, you delete the existing IP address and add the new one. You can insert a maximum of 1000 addresses in a single request. For more information about how to use the AWS WAF API to allow or block HTTP requests, see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).

### `updateRateBasedRule(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Inserts or deletes \[Predicate\] objects in a rule and updates the RateLimit in the rule. Each Predicate object identifies a predicate, such as a \[ByteMatchSet\] or an \[IPSet\], that specifies the web requests that you want to block or count. The RateLimit specifies the number of requests every five minutes that triggers the rule. If you add more than one predicate to a RateBasedRule, a request must match all the predicates and exceed the RateLimit to be counted or blocked. For example, suppose you add the following to a RateBasedRule:

``` swift
public func updateRateBasedRule(input: UpdateRateBasedRuleInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRateBasedRuleOutputResponse, UpdateRateBasedRuleOutputError>) -> Void)
```

  - An IPSet that matches the IP address 192.0.2.44/32

  - A ByteMatchSet that matches BadBot in the User-Agent header

Further, you specify a RateLimit of 1,000. You then add the RateBasedRule to a WebACL and specify that you want to block requests that satisfy the rule. For a request to be blocked, it must come from the IP address 192.0.2.44 and the User-Agent header in the request must contain the value BadBot. Further, requests that match these two conditions much be received at a rate of more than 1,000 every five minutes. If the rate drops below this limit, AWS WAF no longer blocks the requests. As a second example, suppose you want to limit requests to a particular page on your site. To do this, you could add the following to a RateBasedRule:

  - A ByteMatchSet with FieldToMatch of URI

  - A PositionalConstraint of STARTS\_WITH

  - A TargetString of login

Further, you specify a RateLimit of 1,000. By adding this RateBasedRule to a WebACL, you could limit requests to your login page without affecting the rest of your site.

### `updateRegexMatchSet(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Inserts or deletes \[RegexMatchTuple\] objects (filters) in a \[RegexMatchSet\]. For each RegexMatchSetUpdate object, you specify the following values:

``` swift
public func updateRegexMatchSet(input: UpdateRegexMatchSetInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRegexMatchSetOutputResponse, UpdateRegexMatchSetOutputError>) -> Void)
```

  - Whether to insert or delete the object from the array. If you want to change a RegexMatchSetUpdate object, you delete the existing object and add a new one.

  - The part of a web request that you want AWS WAF to inspectupdate, such as a query string or the value of the User-Agent header.

  - The identifier of the pattern (a regular expression) that you want AWS WAF to look for. For more information, see \[RegexPatternSet\].

  - Whether to perform any conversions on the request, such as converting it to lowercase, before inspecting it for the specified string.

For example, you can create a RegexPatternSet that matches any requests with User-Agent headers that contain the string B\[a@\]dB\[o0\]t. You can then configure AWS WAF to reject those requests. To create and configure a RegexMatchSet, perform the following steps:

  - Create a RegexMatchSet. For more information, see \[CreateRegexMatchSet\].

  - Use \[GetChangeToken\] to get the change token that you provide in the ChangeToken parameter of an UpdateRegexMatchSet request.

  - Submit an UpdateRegexMatchSet request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the identifier of the RegexPatternSet that contain the regular expression patters you want AWS WAF to watch for.

For more information about how to use the AWS WAF API to allow or block HTTP requests, see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).

### `updateRegexPatternSet(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Inserts or deletes RegexPatternString objects in a \[RegexPatternSet\]. For each RegexPatternString object, you specify the following values:

``` swift
public func updateRegexPatternSet(input: UpdateRegexPatternSetInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRegexPatternSetOutputResponse, UpdateRegexPatternSetOutputError>) -> Void)
```

  - Whether to insert or delete the RegexPatternString.

  - The regular expression pattern that you want to insert or delete. For more information, see \[RegexPatternSet\].

For example, you can create a RegexPatternString such as B\[a@\]dB\[o0\]t. AWS WAF will match this RegexPatternString to:

  - BadBot

  - BadB0t

  - B@dBot

  - B@dB0t

To create and configure a RegexPatternSet, perform the following steps:

  - Create a RegexPatternSet. For more information, see \[CreateRegexPatternSet\].

  - Use \[GetChangeToken\] to get the change token that you provide in the ChangeToken parameter of an UpdateRegexPatternSet request.

  - Submit an UpdateRegexPatternSet request to specify the regular expression pattern that you want AWS WAF to watch for.

For more information about how to use the AWS WAF API to allow or block HTTP requests, see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).

### `updateRule(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Inserts or deletes \[Predicate\] objects in a Rule. Each Predicate object identifies a predicate, such as a \[ByteMatchSet\] or an \[IPSet\], that specifies the web requests that you want to allow, block, or count. If you add more than one predicate to a Rule, a request must match all of the specifications to be allowed, blocked, or counted. For example, suppose that you add the following to a Rule:

``` swift
public func updateRule(input: UpdateRuleInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRuleOutputResponse, UpdateRuleOutputError>) -> Void)
```

  - A ByteMatchSet that matches the value BadBot in the User-Agent header

  - An IPSet that matches the IP address 192.0.2.44

You then add the Rule to a WebACL and specify that you want to block requests that satisfy the Rule. For a request to be blocked, the User-Agent header in the request must contain the value BadBot and the request must originate from the IP address 192.0.2.44. To create and configure a Rule, perform the following steps:

  - Create and update the predicates that you want to include in the Rule.

  - Create the Rule. See \[CreateRule\].

  - Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an \[UpdateRule\] request.

  - Submit an UpdateRule request to add predicates to the Rule.

  - Create and update a WebACL that contains the Rule. See \[CreateWebACL\].

If you want to replace one ByteMatchSet or IPSet with another, you delete the existing one and add the new one. For more information about how to use the AWS WAF API to allow or block HTTP requests, see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).

### `updateRuleGroup(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Inserts or deletes \[ActivatedRule\] objects in a RuleGroup. You can only insert REGULAR rules into a rule group. You can have a maximum of ten rules per rule group. To create and configure a RuleGroup, perform the following steps:

``` swift
public func updateRuleGroup(input: UpdateRuleGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRuleGroupOutputResponse, UpdateRuleGroupOutputError>) -> Void)
```

  - Create and update the Rules that you want to include in the RuleGroup. See \[CreateRule\].

  - Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an \[UpdateRuleGroup\] request.

  - Submit an UpdateRuleGroup request to add Rules to the RuleGroup.

  - Create and update a WebACL that contains the RuleGroup. See \[CreateWebACL\].

If you want to replace one Rule with another, you delete the existing one and add the new one. For more information about how to use the AWS WAF API to allow or block HTTP requests, see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).

### `updateSizeConstraintSet(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Inserts or deletes \[SizeConstraint\] objects (filters) in a \[SizeConstraintSet\]. For each SizeConstraint object, you specify the following values:

``` swift
public func updateSizeConstraintSet(input: UpdateSizeConstraintSetInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSizeConstraintSetOutputResponse, UpdateSizeConstraintSetOutputError>) -> Void)
```

  - Whether to insert or delete the object from the array. If you want to change a SizeConstraintSetUpdate object, you delete the existing object and add a new one.

  - The part of a web request that you want AWS WAF to evaluate, such as the length of a query string or the length of the User-Agent header.

  - Whether to perform any transformations on the request, such as converting it to lowercase, before checking its length. Note that transformations of the request body are not supported because the AWS resource forwards only the first 8192 bytes of your request to AWS WAF. You can only specify a single type of TextTransformation.

  - A ComparisonOperator used for evaluating the selected part of the request against the specified Size, such as equals, greater than, less than, and so on.

  - The length, in bytes, that you want AWS WAF to watch for in selected part of the request. The length is computed after applying the transformation.

For example, you can add a SizeConstraintSetUpdate object that matches web requests in which the length of the User-Agent header is greater than 100 bytes. You can then configure AWS WAF to block those requests. To create and configure a SizeConstraintSet, perform the following steps:

  - Create a SizeConstraintSet. For more information, see \[CreateSizeConstraintSet\].

  - Use \[GetChangeToken\] to get the change token that you provide in the ChangeToken parameter of an UpdateSizeConstraintSet request.

  - Submit an UpdateSizeConstraintSet request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch for.

For more information about how to use the AWS WAF API to allow or block HTTP requests, see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).

### `updateSqlInjectionMatchSet(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Inserts or deletes \[SqlInjectionMatchTuple\] objects (filters) in a \[SqlInjectionMatchSet\]. For each SqlInjectionMatchTuple object, you specify the following values:

``` swift
public func updateSqlInjectionMatchSet(input: UpdateSqlInjectionMatchSetInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSqlInjectionMatchSetOutputResponse, UpdateSqlInjectionMatchSetOutputError>) -> Void)
```

  - Action: Whether to insert the object into or delete the object from the array. To change a SqlInjectionMatchTuple, you delete the existing object and add a new one.

  - FieldToMatch: The part of web requests that you want AWS WAF to inspect and, if you want AWS WAF to inspect a header or custom query parameter, the name of the header or parameter.

  - TextTransformation: Which text transformation, if any, to perform on the web request before inspecting the request for snippets of malicious SQL code. You can only specify a single type of TextTransformation.

You use SqlInjectionMatchSet objects to specify which CloudFront requests that you want to allow, block, or count. For example, if you're receiving requests that contain snippets of SQL code in the query string and you want to block the requests, you can create a SqlInjectionMatchSet with the applicable settings, and then configure AWS WAF to block the requests. To create and configure a SqlInjectionMatchSet, perform the following steps:

  - Submit a \[CreateSqlInjectionMatchSet\] request.

  - Use \[GetChangeToken\] to get the change token that you provide in the ChangeToken parameter of an \[UpdateIPSet\] request.

  - Submit an UpdateSqlInjectionMatchSet request to specify the parts of web requests that you want AWS WAF to inspect for snippets of SQL code.

For more information about how to use the AWS WAF API to allow or block HTTP requests, see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).

### `updateWebACL(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Inserts or deletes \[ActivatedRule\] objects in a WebACL. Each Rule identifies web requests that you want to allow, block, or count. When you update a WebACL, you specify the following values:

``` swift
public func updateWebACL(input: UpdateWebACLInput, completion: @escaping (ClientRuntime.SdkResult<UpdateWebACLOutputResponse, UpdateWebACLOutputError>) -> Void)
```

  - A default action for the WebACL, either ALLOW or BLOCK. AWS WAF performs the default action if a request doesn't match the criteria in any of the Rules in a WebACL.

  - The Rules that you want to add or delete. If you want to replace one Rule with another, you delete the existing Rule and add the new one.

  - For each Rule, whether you want AWS WAF to allow requests, block requests, or count requests that match the conditions in the Rule.

  - The order in which you want AWS WAF to evaluate the Rules in a WebACL. If you add more than one Rule to a WebACL, AWS WAF evaluates each request against the Rules in order based on the value of Priority. (The Rule that has the lowest value for Priority is evaluated first.) When a web request matches all the predicates (such as ByteMatchSets and IPSets) in a Rule, AWS WAF immediately takes the corresponding action, allow or block, and doesn't evaluate the request against the remaining Rules in the WebACL, if any.

To create and configure a WebACL, perform the following steps:

  - Create and update the predicates that you want to include in Rules. For more information, see \[CreateByteMatchSet\], \[UpdateByteMatchSet\], \[CreateIPSet\], \[UpdateIPSet\], \[CreateSqlInjectionMatchSet\], and \[UpdateSqlInjectionMatchSet\].

  - Create and update the Rules that you want to include in the WebACL. For more information, see \[CreateRule\] and \[UpdateRule\].

  - Create a WebACL. See \[CreateWebACL\].

  - Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an \[UpdateWebACL\] request.

  - Submit an UpdateWebACL request to specify the Rules that you want to include in the WebACL, to specify the default action, and to associate the WebACL with a CloudFront distribution. The ActivatedRule can be a rule group. If you specify a rule group as your ActivatedRule , you can exclude specific rules from that rule group. If you already have a rule group associated with a web ACL and want to submit an UpdateWebACL request to exclude certain rules from that rule group, you must first remove the rule group from the web ACL, the re-insert it again, specifying the excluded rules. For details, see \[ActivatedRule$ExcludedRules\] .

Be aware that if you try to add a RATE\_BASED rule to a web ACL without setting the rule type when first creating the rule, the \[UpdateWebACL\] request will fail because the request tries to add a REGULAR rule (the default rule type) with the specified ID, which does not exist. For more information about how to use the AWS WAF API to allow or block HTTP requests, see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).

### `updateXssMatchSet(input:completion:)`

This is AWS WAF Classic documentation. For more information, see [AWS WAF Classic](https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html) in the developer guide. For the latest version of AWS WAF, use the AWS WAFV2 API and see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html). With the latest version, AWS WAF has a single set of endpoints for regional and global use. Inserts or deletes \[XssMatchTuple\] objects (filters) in an \[XssMatchSet\]. For each XssMatchTuple object, you specify the following values:

``` swift
public func updateXssMatchSet(input: UpdateXssMatchSetInput, completion: @escaping (ClientRuntime.SdkResult<UpdateXssMatchSetOutputResponse, UpdateXssMatchSetOutputError>) -> Void)
```

  - Action: Whether to insert the object into or delete the object from the array. To change an XssMatchTuple, you delete the existing object and add a new one.

  - FieldToMatch: The part of web requests that you want AWS WAF to inspect and, if you want AWS WAF to inspect a header or custom query parameter, the name of the header or parameter.

  - TextTransformation: Which text transformation, if any, to perform on the web request before inspecting the request for cross-site scripting attacks. You can only specify a single type of TextTransformation.

You use XssMatchSet objects to specify which CloudFront requests that you want to allow, block, or count. For example, if you're receiving requests that contain cross-site scripting attacks in the request body and you want to block the requests, you can create an XssMatchSet with the applicable settings, and then configure AWS WAF to block the requests. To create and configure an XssMatchSet, perform the following steps:

  - Submit a \[CreateXssMatchSet\] request.

  - Use \[GetChangeToken\] to get the change token that you provide in the ChangeToken parameter of an \[UpdateIPSet\] request.

  - Submit an UpdateXssMatchSet request to specify the parts of web requests that you want AWS WAF to inspect for cross-site scripting attacks.

For more information about how to use the AWS WAF API to allow or block HTTP requests, see the [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
