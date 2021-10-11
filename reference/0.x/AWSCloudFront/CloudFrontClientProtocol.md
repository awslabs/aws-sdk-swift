# CloudFrontClientProtocol

<fullname>Amazon CloudFront</fullname>
This is the Amazon CloudFront API Reference. This guide
is for developers who need detailed information about
CloudFront API actions, data types, and errors. For detailed information about CloudFront features, see the Amazon CloudFront Developer Guide.

``` swift
public protocol CloudFrontClientProtocol 
```

## Requirements

### associateAlias(input:​completion:​)

Associates an alias (also known as a CNAME or an alternate domain name) with a CloudFront
distribution.
With this operation you can move an alias that’s already in use on a CloudFront distribution
to a different distribution in one step. This prevents the downtime that could occur if
you first remove the alias from one distribution and then separately add the alias to
another distribution.
To use this operation to associate an alias with a distribution, you provide the alias
and the ID of the target distribution for the alias. For more information, including how
to set up the target distribution, prerequisites that you must complete, and other
restrictions, see <a href="https:​//docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/CNAMEs.html#alternate-domain-names-move">Moving an alternate domain name to a different distribution
in the Amazon CloudFront Developer Guide.

``` swift
func associateAlias(input: AssociateAliasInput, completion: @escaping (ClientRuntime.SdkResult<AssociateAliasOutputResponse, AssociateAliasOutputError>) -> Void)
```

### createCachePolicy(input:​completion:​)

Creates a cache policy.
After you create a cache policy, you can attach it to one or more cache behaviors. When it’s
attached to a cache behavior, the cache policy determines the following:​

``` swift
func createCachePolicy(input: CreateCachePolicyInput, completion: @escaping (ClientRuntime.SdkResult<CreateCachePolicyOutputResponse, CreateCachePolicyOutputError>) -> Void)
```

``` 
			           The values that CloudFront includes in the cache key. These values can
				include HTTP headers, cookies, and URL query strings. CloudFront uses the cache key to
				find an object in its cache that it can return to the viewer.
		

			           The default, minimum, and maximum time to live (TTL) values that you want objects to stay
				in the CloudFront cache.
		

	       The headers, cookies, and query strings that are included in the cache key are automatically
		included in requests that CloudFront sends to the origin. CloudFront sends a request when it can’t
		find an object in its cache that matches the request’s cache key. If you want to send
		values to the origin but not include them in the cache key, use
		OriginRequestPolicy.
	       For more information about cache policies, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-the-cache-key.html">Controlling the cache key in the
		Amazon CloudFront Developer Guide.
```

### createCloudFrontOriginAccessIdentity(input:​completion:​)

Creates a new origin access identity. If you're using Amazon S3 for your origin, you can
use an origin access identity to require users to access your content using a CloudFront URL instead
of the Amazon S3 URL. For more information about how to use origin access identities, see <a href="https:​//docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">Serving Private Content through CloudFront in the
Amazon CloudFront Developer Guide.

``` swift
func createCloudFrontOriginAccessIdentity(input: CreateCloudFrontOriginAccessIdentityInput, completion: @escaping (ClientRuntime.SdkResult<CreateCloudFrontOriginAccessIdentityOutputResponse, CreateCloudFrontOriginAccessIdentityOutputError>) -> Void)
```

### createDistribution(input:​completion:​)

Creates a new web distribution. You create a CloudFront distribution to tell CloudFront where you
want content to be delivered from, and the details about how to track and manage content delivery. Send a POST request to the
/CloudFront API version/distribution/distribution ID resource.

``` swift
func createDistribution(input: CreateDistributionInput, completion: @escaping (ClientRuntime.SdkResult<CreateDistributionOutputResponse, CreateDistributionOutputError>) -> Void)
```

``` 
        When you update a distribution, there are more required fields than when you create a distribution.
		When you update your distribution by using
		<a href="https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_UpdateDistribution.html">UpdateDistribution,
		follow the steps included
		in the documentation to get the current configuration
		and then make your updates. This helps to make sure that you include all of the required fields. To view a summary,
		see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-overview-required-fields.html">Required
			Fields for Create Distribution and Update Distribution in the Amazon CloudFront Developer Guide.
```

### createDistributionWithTags(input:​completion:​)

Create a new distribution with tags.

``` swift
func createDistributionWithTags(input: CreateDistributionWithTagsInput, completion: @escaping (ClientRuntime.SdkResult<CreateDistributionWithTagsOutputResponse, CreateDistributionWithTagsOutputError>) -> Void)
```

### createFieldLevelEncryptionConfig(input:​completion:​)

Create a new field-level encryption configuration.

``` swift
func createFieldLevelEncryptionConfig(input: CreateFieldLevelEncryptionConfigInput, completion: @escaping (ClientRuntime.SdkResult<CreateFieldLevelEncryptionConfigOutputResponse, CreateFieldLevelEncryptionConfigOutputError>) -> Void)
```

### createFieldLevelEncryptionProfile(input:​completion:​)

Create a field-level encryption profile.

``` swift
func createFieldLevelEncryptionProfile(input: CreateFieldLevelEncryptionProfileInput, completion: @escaping (ClientRuntime.SdkResult<CreateFieldLevelEncryptionProfileOutputResponse, CreateFieldLevelEncryptionProfileOutputError>) -> Void)
```

### createFunction(input:​completion:​)

Creates a CloudFront function.
To create a function, you provide the function code and some configuration information
about the function. The response contains an Amazon Resource Name (ARN) that uniquely
identifies the function.
When you create a function, it’s in the DEVELOPMENT stage. In this stage, you
can test the function with TestFunction, and update it with
UpdateFunction.
When you’re ready to use your function with a CloudFront distribution, use
PublishFunction to copy the function from the DEVELOPMENT
stage to LIVE. When it’s live, you can attach the function to a
distribution’s cache behavior, using the function’s ARN.

``` swift
func createFunction(input: CreateFunctionInput, completion: @escaping (ClientRuntime.SdkResult<CreateFunctionOutputResponse, CreateFunctionOutputError>) -> Void)
```

### createInvalidation(input:​completion:​)

Create a new invalidation.

``` swift
func createInvalidation(input: CreateInvalidationInput, completion: @escaping (ClientRuntime.SdkResult<CreateInvalidationOutputResponse, CreateInvalidationOutputError>) -> Void)
```

### createKeyGroup(input:​completion:​)

Creates a key group that you can use with <a href="https:​//docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">CloudFront signed URLs and signed cookies.
To create a key group, you must specify at least one public key for the key group. After you
create a key group, you can reference it from one or more cache behaviors. When you
reference a key group in a cache behavior, CloudFront requires signed URLs or signed cookies
for all requests that match the cache behavior. The URLs or cookies must be signed with
a private key whose corresponding public key is in the key group. The signed URL or
cookie contains information about which public key CloudFront should use to verify the
signature. For more information, see <a href="https:​//docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">Serving private content in the Amazon CloudFront Developer Guide.

``` swift
func createKeyGroup(input: CreateKeyGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateKeyGroupOutputResponse, CreateKeyGroupOutputError>) -> Void)
```

### createMonitoringSubscription(input:​completion:​)

Enables additional CloudWatch metrics for the specified CloudFront distribution. The
additional metrics incur an additional cost.
For more information, see <a href="https:​//docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/viewing-cloudfront-metrics.html#monitoring-console.distributions-additional">Viewing additional CloudFront distribution metrics in the
Amazon CloudFront Developer Guide.

``` swift
func createMonitoringSubscription(input: CreateMonitoringSubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<CreateMonitoringSubscriptionOutputResponse, CreateMonitoringSubscriptionOutputError>) -> Void)
```

### createOriginRequestPolicy(input:​completion:​)

Creates an origin request policy.
After you create an origin request policy, you can attach it to one or more cache behaviors.
When it’s attached to a cache behavior, the origin request policy determines the values
that CloudFront includes in requests that it sends to the origin. Each request that CloudFront sends
to the origin includes the following:​

``` swift
func createOriginRequestPolicy(input: CreateOriginRequestPolicyInput, completion: @escaping (ClientRuntime.SdkResult<CreateOriginRequestPolicyOutputResponse, CreateOriginRequestPolicyOutputError>) -> Void)
```

``` 
			           The request body and the URL path (without the domain name) from the viewer
				request.
		

			           The headers that CloudFront automatically includes in every origin request, including
				Host, User-Agent, and X-Amz-Cf-Id.
		

			           All HTTP headers, cookies, and URL query strings that are specified in the cache policy or
				the origin request policy. These can include items from the viewer request and,
				in the case of headers, additional ones that are added by CloudFront.
		

	       CloudFront sends a request when it can’t find a valid object in its cache that matches the
		request. If you want to send values to the origin and also include them in the cache
		key, use CachePolicy.
	       For more information about origin request policies, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-origin-requests.html">Controlling origin requests in the
		Amazon CloudFront Developer Guide.
```

### createPublicKey(input:​completion:​)

Uploads a public key to CloudFront that you can use with <a href="https:​//docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">signed URLs and signed cookies, or with <a href="https:​//docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/field-level-encryption.html">field-level encryption.

``` swift
func createPublicKey(input: CreatePublicKeyInput, completion: @escaping (ClientRuntime.SdkResult<CreatePublicKeyOutputResponse, CreatePublicKeyOutputError>) -> Void)
```

### createRealtimeLogConfig(input:​completion:​)

Creates a real-time log configuration.
After you create a real-time log configuration, you can attach it to one or more cache
behaviors to send real-time log data to the specified Amazon Kinesis data stream.
For more information about real-time log configurations, see <a href="https:​//docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/real-time-logs.html">Real-time logs in the Amazon CloudFront Developer Guide.

``` swift
func createRealtimeLogConfig(input: CreateRealtimeLogConfigInput, completion: @escaping (ClientRuntime.SdkResult<CreateRealtimeLogConfigOutputResponse, CreateRealtimeLogConfigOutputError>) -> Void)
```

### createStreamingDistribution(input:​completion:​)

This API is deprecated.
Amazon CloudFront is deprecating real-time messaging protocol (RTMP) distributions on December 31, 2020.
For more information, <a href="http:​//forums.aws.amazon.com/ann.jspa?annID=7356">read the announcement on the Amazon CloudFront discussion forum.

``` swift
func createStreamingDistribution(input: CreateStreamingDistributionInput, completion: @escaping (ClientRuntime.SdkResult<CreateStreamingDistributionOutputResponse, CreateStreamingDistributionOutputError>) -> Void)
```

### createStreamingDistributionWithTags(input:​completion:​)

This API is deprecated.
Amazon CloudFront is deprecating real-time messaging protocol (RTMP) distributions on December 31, 2020.
For more information, <a href="http:​//forums.aws.amazon.com/ann.jspa?annID=7356">read the announcement on the Amazon CloudFront discussion forum.

``` swift
func createStreamingDistributionWithTags(input: CreateStreamingDistributionWithTagsInput, completion: @escaping (ClientRuntime.SdkResult<CreateStreamingDistributionWithTagsOutputResponse, CreateStreamingDistributionWithTagsOutputError>) -> Void)
```

### deleteCachePolicy(input:​completion:​)

Deletes a cache policy.
You cannot delete a cache policy if it’s attached to a cache behavior. First update your
distributions to remove the cache policy from all cache behaviors, then delete the cache
policy.
To delete a cache policy, you must provide the policy’s identifier and version. To get these
values, you can use ListCachePolicies or
GetCachePolicy.

``` swift
func deleteCachePolicy(input: DeleteCachePolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCachePolicyOutputResponse, DeleteCachePolicyOutputError>) -> Void)
```

### deleteCloudFrontOriginAccessIdentity(input:​completion:​)

Delete an origin access identity.

``` swift
func deleteCloudFrontOriginAccessIdentity(input: DeleteCloudFrontOriginAccessIdentityInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCloudFrontOriginAccessIdentityOutputResponse, DeleteCloudFrontOriginAccessIdentityOutputError>) -> Void)
```

### deleteDistribution(input:​completion:​)

Delete a distribution.

``` swift
func deleteDistribution(input: DeleteDistributionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDistributionOutputResponse, DeleteDistributionOutputError>) -> Void)
```

### deleteFieldLevelEncryptionConfig(input:​completion:​)

Remove a field-level encryption configuration.

``` swift
func deleteFieldLevelEncryptionConfig(input: DeleteFieldLevelEncryptionConfigInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFieldLevelEncryptionConfigOutputResponse, DeleteFieldLevelEncryptionConfigOutputError>) -> Void)
```

### deleteFieldLevelEncryptionProfile(input:​completion:​)

Remove a field-level encryption profile.

``` swift
func deleteFieldLevelEncryptionProfile(input: DeleteFieldLevelEncryptionProfileInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFieldLevelEncryptionProfileOutputResponse, DeleteFieldLevelEncryptionProfileOutputError>) -> Void)
```

### deleteFunction(input:​completion:​)

Deletes a CloudFront function.
You cannot delete a function if it’s associated with a cache behavior. First, update your
distributions to remove the function association from all cache behaviors, then delete
the function.
To delete a function, you must provide the function’s name and version
(ETag value). To get these values, you can use ListFunctions
and DescribeFunction.

``` swift
func deleteFunction(input: DeleteFunctionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFunctionOutputResponse, DeleteFunctionOutputError>) -> Void)
```

### deleteKeyGroup(input:​completion:​)

Deletes a key group.
You cannot delete a key group that is referenced in a cache behavior. First update
your distributions to remove the key group from all cache behaviors, then delete the key
group.
To delete a key group, you must provide the key group’s identifier and version. To get
these values, use ListKeyGroups followed by GetKeyGroup or
GetKeyGroupConfig.

``` swift
func deleteKeyGroup(input: DeleteKeyGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteKeyGroupOutputResponse, DeleteKeyGroupOutputError>) -> Void)
```

### deleteMonitoringSubscription(input:​completion:​)

Disables additional CloudWatch metrics for the specified CloudFront distribution.

``` swift
func deleteMonitoringSubscription(input: DeleteMonitoringSubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteMonitoringSubscriptionOutputResponse, DeleteMonitoringSubscriptionOutputError>) -> Void)
```

### deleteOriginRequestPolicy(input:​completion:​)

Deletes an origin request policy.
You cannot delete an origin request policy if it’s attached to any cache behaviors. First
update your distributions to remove the origin request policy from all cache behaviors,
then delete the origin request policy.
To delete an origin request policy, you must provide the policy’s identifier and version. To
get the identifier, you can use ListOriginRequestPolicies or
GetOriginRequestPolicy.

``` swift
func deleteOriginRequestPolicy(input: DeleteOriginRequestPolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteOriginRequestPolicyOutputResponse, DeleteOriginRequestPolicyOutputError>) -> Void)
```

### deletePublicKey(input:​completion:​)

Remove a public key you previously added to CloudFront.

``` swift
func deletePublicKey(input: DeletePublicKeyInput, completion: @escaping (ClientRuntime.SdkResult<DeletePublicKeyOutputResponse, DeletePublicKeyOutputError>) -> Void)
```

### deleteRealtimeLogConfig(input:​completion:​)

Deletes a real-time log configuration.
You cannot delete a real-time log configuration if it’s attached to a cache behavior.
First update your distributions to remove the real-time log configuration from all cache
behaviors, then delete the real-time log configuration.
To delete a real-time log configuration, you can provide the configuration’s name or its
Amazon Resource Name (ARN). You must provide at least one. If you provide both, CloudFront
uses the name to identify the real-time log configuration to delete.

``` swift
func deleteRealtimeLogConfig(input: DeleteRealtimeLogConfigInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRealtimeLogConfigOutputResponse, DeleteRealtimeLogConfigOutputError>) -> Void)
```

### deleteStreamingDistribution(input:​completion:​)

Delete a streaming distribution. To delete an RTMP distribution using the CloudFront API,
perform the following steps.

``` swift
func deleteStreamingDistribution(input: DeleteStreamingDistributionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteStreamingDistributionOutputResponse, DeleteStreamingDistributionOutputError>) -> Void)
```

``` 
        To delete an RTMP distribution using the CloudFront
		API:
	       <ol>

			           Disable the RTMP distribution.
		

			           Submit a GET Streaming Distribution Config request to get the current
				configuration and the Etag header for the distribution.
		

			           Update the XML document that was returned in the response to your GET
					Streaming Distribution Config request to change the value of Enabled
				to false.
		

			           Submit a PUT Streaming Distribution Config request to update the
				configuration for your distribution. In the request body, include the XML document that
				you updated in Step 3. Then set the value of the HTTP If-Match header to the
				value of the ETag header that CloudFront returned when you submitted the GET
					Streaming Distribution Config request in Step 2.
		

			           Review the response to the PUT Streaming Distribution Config request
				to confirm that the distribution was successfully disabled.
		

			           Submit a GET Streaming Distribution Config request to confirm that
				your changes have propagated. When propagation is complete, the value of
					Status is Deployed.
		

			           Submit a DELETE Streaming Distribution request. Set the value of the
				HTTP If-Match header to the value of the ETag header that CloudFront
				returned when you submitted the GET Streaming Distribution Config request in
				Step 2.
		

			           Review the response to your DELETE Streaming Distribution request to
				confirm that the distribution was successfully deleted.
		
     </ol>
	       For information about deleting a distribution using the CloudFront console, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/HowToDeleteDistribution.html">Deleting a Distribution in the
			Amazon CloudFront Developer Guide.
```

### describeFunction(input:​completion:​)

Gets configuration information and metadata about a CloudFront function, but not the function’s
code. To get a function’s code, use GetFunction.
To get configuration information and metadata about a function, you must provide the
function’s name and stage. To get these values, you can use
ListFunctions.

``` swift
func describeFunction(input: DescribeFunctionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFunctionOutputResponse, DescribeFunctionOutputError>) -> Void)
```

### getCachePolicy(input:​completion:​)

Gets a cache policy, including the following metadata:​

``` swift
func getCachePolicy(input: GetCachePolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetCachePolicyOutputResponse, GetCachePolicyOutputError>) -> Void)
```

``` 
			           The policy’s identifier.
		

			           The date and time when the policy was last modified.
		

	       To get a cache policy, you must provide the policy’s identifier. If the cache policy is
		attached to a distribution’s cache behavior, you can get the policy’s identifier using
		ListDistributions or GetDistribution. If the cache policy is
		not attached to a cache behavior, you can get the identifier using
		ListCachePolicies.
```

### getCachePolicyConfig(input:​completion:​)

Gets a cache policy configuration.
To get a cache policy configuration, you must provide the policy’s identifier. If the cache
policy is attached to a distribution’s cache behavior, you can get the policy’s
identifier using ListDistributions or GetDistribution. If the
cache policy is not attached to a cache behavior, you can get the identifier using
ListCachePolicies.

``` swift
func getCachePolicyConfig(input: GetCachePolicyConfigInput, completion: @escaping (ClientRuntime.SdkResult<GetCachePolicyConfigOutputResponse, GetCachePolicyConfigOutputError>) -> Void)
```

### getCloudFrontOriginAccessIdentity(input:​completion:​)

Get the information about an origin access identity.

``` swift
func getCloudFrontOriginAccessIdentity(input: GetCloudFrontOriginAccessIdentityInput, completion: @escaping (ClientRuntime.SdkResult<GetCloudFrontOriginAccessIdentityOutputResponse, GetCloudFrontOriginAccessIdentityOutputError>) -> Void)
```

### getCloudFrontOriginAccessIdentityConfig(input:​completion:​)

Get the configuration information about an origin access identity.

``` swift
func getCloudFrontOriginAccessIdentityConfig(input: GetCloudFrontOriginAccessIdentityConfigInput, completion: @escaping (ClientRuntime.SdkResult<GetCloudFrontOriginAccessIdentityConfigOutputResponse, GetCloudFrontOriginAccessIdentityConfigOutputError>) -> Void)
```

### getDistribution(input:​completion:​)

Get the information about a distribution.

``` swift
func getDistribution(input: GetDistributionInput, completion: @escaping (ClientRuntime.SdkResult<GetDistributionOutputResponse, GetDistributionOutputError>) -> Void)
```

### getDistributionConfig(input:​completion:​)

Get the configuration information about a distribution.

``` swift
func getDistributionConfig(input: GetDistributionConfigInput, completion: @escaping (ClientRuntime.SdkResult<GetDistributionConfigOutputResponse, GetDistributionConfigOutputError>) -> Void)
```

### getFieldLevelEncryption(input:​completion:​)

Get the field-level encryption configuration information.

``` swift
func getFieldLevelEncryption(input: GetFieldLevelEncryptionInput, completion: @escaping (ClientRuntime.SdkResult<GetFieldLevelEncryptionOutputResponse, GetFieldLevelEncryptionOutputError>) -> Void)
```

### getFieldLevelEncryptionConfig(input:​completion:​)

Get the field-level encryption configuration information.

``` swift
func getFieldLevelEncryptionConfig(input: GetFieldLevelEncryptionConfigInput, completion: @escaping (ClientRuntime.SdkResult<GetFieldLevelEncryptionConfigOutputResponse, GetFieldLevelEncryptionConfigOutputError>) -> Void)
```

### getFieldLevelEncryptionProfile(input:​completion:​)

Get the field-level encryption profile information.

``` swift
func getFieldLevelEncryptionProfile(input: GetFieldLevelEncryptionProfileInput, completion: @escaping (ClientRuntime.SdkResult<GetFieldLevelEncryptionProfileOutputResponse, GetFieldLevelEncryptionProfileOutputError>) -> Void)
```

### getFieldLevelEncryptionProfileConfig(input:​completion:​)

Get the field-level encryption profile configuration information.

``` swift
func getFieldLevelEncryptionProfileConfig(input: GetFieldLevelEncryptionProfileConfigInput, completion: @escaping (ClientRuntime.SdkResult<GetFieldLevelEncryptionProfileConfigOutputResponse, GetFieldLevelEncryptionProfileConfigOutputError>) -> Void)
```

### getFunction(input:​completion:​)

Gets the code of a CloudFront function. To get configuration information and metadata about
a function, use DescribeFunction.
To get a function’s code, you must provide the function’s name and stage. To get these
values, you can use ListFunctions.

``` swift
func getFunction(input: GetFunctionInput, completion: @escaping (ClientRuntime.SdkResult<GetFunctionOutputResponse, GetFunctionOutputError>) -> Void)
```

### getInvalidation(input:​completion:​)

Get the information about an invalidation.

``` swift
func getInvalidation(input: GetInvalidationInput, completion: @escaping (ClientRuntime.SdkResult<GetInvalidationOutputResponse, GetInvalidationOutputError>) -> Void)
```

### getKeyGroup(input:​completion:​)

Gets a key group, including the date and time when the key group was last modified.
To get a key group, you must provide the key group’s identifier. If the key group is
referenced in a distribution’s cache behavior, you can get the key group’s identifier
using ListDistributions or GetDistribution. If the key group
is not referenced in a cache behavior, you can get the identifier using
ListKeyGroups.

``` swift
func getKeyGroup(input: GetKeyGroupInput, completion: @escaping (ClientRuntime.SdkResult<GetKeyGroupOutputResponse, GetKeyGroupOutputError>) -> Void)
```

### getKeyGroupConfig(input:​completion:​)

Gets a key group configuration.
To get a key group configuration, you must provide the key group’s identifier. If the
key group is referenced in a distribution’s cache behavior, you can get the key group’s
identifier using ListDistributions or GetDistribution. If the
key group is not referenced in a cache behavior, you can get the identifier using
ListKeyGroups.

``` swift
func getKeyGroupConfig(input: GetKeyGroupConfigInput, completion: @escaping (ClientRuntime.SdkResult<GetKeyGroupConfigOutputResponse, GetKeyGroupConfigOutputError>) -> Void)
```

### getMonitoringSubscription(input:​completion:​)

Gets information about whether additional CloudWatch metrics are enabled for the specified
CloudFront distribution.

``` swift
func getMonitoringSubscription(input: GetMonitoringSubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<GetMonitoringSubscriptionOutputResponse, GetMonitoringSubscriptionOutputError>) -> Void)
```

### getOriginRequestPolicy(input:​completion:​)

Gets an origin request policy, including the following metadata:​

``` swift
func getOriginRequestPolicy(input: GetOriginRequestPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetOriginRequestPolicyOutputResponse, GetOriginRequestPolicyOutputError>) -> Void)
```

``` 
			           The policy’s identifier.
		

			           The date and time when the policy was last modified.
		

	       To get an origin request policy, you must provide the policy’s identifier. If the origin
		request policy is attached to a distribution’s cache behavior, you can get the policy’s
		identifier using ListDistributions or GetDistribution. If the
		origin request policy is not attached to a cache behavior, you can get the identifier
		using ListOriginRequestPolicies.
```

### getOriginRequestPolicyConfig(input:​completion:​)

Gets an origin request policy configuration.
To get an origin request policy configuration, you must provide the policy’s identifier. If
the origin request policy is attached to a distribution’s cache behavior, you can get
the policy’s identifier using ListDistributions or
GetDistribution. If the origin request policy is not attached to a cache
behavior, you can get the identifier using
ListOriginRequestPolicies.

``` swift
func getOriginRequestPolicyConfig(input: GetOriginRequestPolicyConfigInput, completion: @escaping (ClientRuntime.SdkResult<GetOriginRequestPolicyConfigOutputResponse, GetOriginRequestPolicyConfigOutputError>) -> Void)
```

### getPublicKey(input:​completion:​)

Gets a public key.

``` swift
func getPublicKey(input: GetPublicKeyInput, completion: @escaping (ClientRuntime.SdkResult<GetPublicKeyOutputResponse, GetPublicKeyOutputError>) -> Void)
```

### getPublicKeyConfig(input:​completion:​)

Gets a public key configuration.

``` swift
func getPublicKeyConfig(input: GetPublicKeyConfigInput, completion: @escaping (ClientRuntime.SdkResult<GetPublicKeyConfigOutputResponse, GetPublicKeyConfigOutputError>) -> Void)
```

### getRealtimeLogConfig(input:​completion:​)

Gets a real-time log configuration.
To get a real-time log configuration, you can provide the configuration’s name or its Amazon
Resource Name (ARN). You must provide at least one. If you provide both, CloudFront uses the
name to identify the real-time log configuration to get.

``` swift
func getRealtimeLogConfig(input: GetRealtimeLogConfigInput, completion: @escaping (ClientRuntime.SdkResult<GetRealtimeLogConfigOutputResponse, GetRealtimeLogConfigOutputError>) -> Void)
```

### getStreamingDistribution(input:​completion:​)

Gets information about a specified RTMP distribution, including the distribution configuration.

``` swift
func getStreamingDistribution(input: GetStreamingDistributionInput, completion: @escaping (ClientRuntime.SdkResult<GetStreamingDistributionOutputResponse, GetStreamingDistributionOutputError>) -> Void)
```

### getStreamingDistributionConfig(input:​completion:​)

Get the configuration information about a streaming distribution.

``` swift
func getStreamingDistributionConfig(input: GetStreamingDistributionConfigInput, completion: @escaping (ClientRuntime.SdkResult<GetStreamingDistributionConfigOutputResponse, GetStreamingDistributionConfigOutputError>) -> Void)
```

### listCachePolicies(input:​completion:​)

Gets a list of cache policies.
You can optionally apply a filter to return only the managed policies created by Amazon Web Services, or
only the custom policies created in your account.
You can optionally specify the maximum number of items to receive in the response. If
the total number of items in the list exceeds the maximum that you specify, or the
default maximum, the response is paginated. To get the next page of items, send a
subsequent request that specifies the NextMarker value from the current
response as the Marker value in the subsequent request.

``` swift
func listCachePolicies(input: ListCachePoliciesInput, completion: @escaping (ClientRuntime.SdkResult<ListCachePoliciesOutputResponse, ListCachePoliciesOutputError>) -> Void)
```

### listCloudFrontOriginAccessIdentities(input:​completion:​)

Lists origin access identities.

``` swift
func listCloudFrontOriginAccessIdentities(input: ListCloudFrontOriginAccessIdentitiesInput, completion: @escaping (ClientRuntime.SdkResult<ListCloudFrontOriginAccessIdentitiesOutputResponse, ListCloudFrontOriginAccessIdentitiesOutputError>) -> Void)
```

### listConflictingAliases(input:​completion:​)

Gets a list of aliases (also called CNAMEs or alternate domain names) that conflict or
overlap with the provided alias, and the associated CloudFront distributions and Amazon Web Services
accounts for each conflicting alias. In the returned list, the distribution and account
IDs are partially hidden, which allows you to identify the distributions and accounts
that you own, but helps to protect the information of ones that you don’t own.
Use this operation to find aliases that are in use in CloudFront that conflict or overlap
with the provided alias. For example, if you provide www.example.com as
input, the returned list can include www.example.com and the overlapping
wildcard alternate domain name (\*.example.com), if they exist. If you
provide \*.example.com as input, the returned list can include
\*.example.com and any alternate domain names covered by that wildcard (for
example, www.example.com, test.example.com,
dev.example.com, and so on), if they exist.
To list conflicting aliases, you provide the alias to search and the ID of a distribution in
your account that has an attached SSL/TLS certificate that includes the provided alias.
For more information, including how to set up the distribution and certificate, see
<a href="https:​//docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/CNAMEs.html#alternate-domain-names-move">Moving an alternate domain name to a different distribution
in the Amazon CloudFront Developer Guide.
You can optionally specify the maximum number of items to receive in the response. If
the total number of items in the list exceeds the maximum that you specify, or the
default maximum, the response is paginated. To get the next page of items, send a
subsequent request that specifies the NextMarker value from the current
response as the Marker value in the subsequent request.

``` swift
func listConflictingAliases(input: ListConflictingAliasesInput, completion: @escaping (ClientRuntime.SdkResult<ListConflictingAliasesOutputResponse, ListConflictingAliasesOutputError>) -> Void)
```

### listDistributions(input:​completion:​)

List CloudFront distributions.

``` swift
func listDistributions(input: ListDistributionsInput, completion: @escaping (ClientRuntime.SdkResult<ListDistributionsOutputResponse, ListDistributionsOutputError>) -> Void)
```

### listDistributionsByCachePolicyId(input:​completion:​)

Gets a list of distribution IDs for distributions that have a cache behavior that’s
associated with the specified cache policy.
You can optionally specify the maximum number of items to receive in the response. If
the total number of items in the list exceeds the maximum that you specify, or the
default maximum, the response is paginated. To get the next page of items, send a
subsequent request that specifies the NextMarker value from the current
response as the Marker value in the subsequent request.

``` swift
func listDistributionsByCachePolicyId(input: ListDistributionsByCachePolicyIdInput, completion: @escaping (ClientRuntime.SdkResult<ListDistributionsByCachePolicyIdOutputResponse, ListDistributionsByCachePolicyIdOutputError>) -> Void)
```

### listDistributionsByKeyGroup(input:​completion:​)

Gets a list of distribution IDs for distributions that have a cache behavior that references
the specified key group.
You can optionally specify the maximum number of items to receive in the response. If
the total number of items in the list exceeds the maximum that you specify, or the
default maximum, the response is paginated. To get the next page of items, send a
subsequent request that specifies the NextMarker value from the current
response as the Marker value in the subsequent request.

``` swift
func listDistributionsByKeyGroup(input: ListDistributionsByKeyGroupInput, completion: @escaping (ClientRuntime.SdkResult<ListDistributionsByKeyGroupOutputResponse, ListDistributionsByKeyGroupOutputError>) -> Void)
```

### listDistributionsByOriginRequestPolicyId(input:​completion:​)

Gets a list of distribution IDs for distributions that have a cache behavior that’s
associated with the specified origin request policy.
You can optionally specify the maximum number of items to receive in the response. If
the total number of items in the list exceeds the maximum that you specify, or the
default maximum, the response is paginated. To get the next page of items, send a
subsequent request that specifies the NextMarker value from the current
response as the Marker value in the subsequent request.

``` swift
func listDistributionsByOriginRequestPolicyId(input: ListDistributionsByOriginRequestPolicyIdInput, completion: @escaping (ClientRuntime.SdkResult<ListDistributionsByOriginRequestPolicyIdOutputResponse, ListDistributionsByOriginRequestPolicyIdOutputError>) -> Void)
```

### listDistributionsByRealtimeLogConfig(input:​completion:​)

Gets a list of distributions that have a cache behavior that’s associated with the specified
real-time log configuration.
You can specify the real-time log configuration by its name or its Amazon Resource Name
(ARN). You must provide at least one. If you provide both, CloudFront uses the name to
identify the real-time log configuration to list distributions for.
You can optionally specify the maximum number of items to receive in the response. If
the total number of items in the list exceeds the maximum that you specify, or the
default maximum, the response is paginated. To get the next page of items, send a
subsequent request that specifies the NextMarker value from the current
response as the Marker value in the subsequent request.

``` swift
func listDistributionsByRealtimeLogConfig(input: ListDistributionsByRealtimeLogConfigInput, completion: @escaping (ClientRuntime.SdkResult<ListDistributionsByRealtimeLogConfigOutputResponse, ListDistributionsByRealtimeLogConfigOutputError>) -> Void)
```

### listDistributionsByWebACLId(input:​completion:​)

List the distributions that are associated with a specified WAF web ACL.

``` swift
func listDistributionsByWebACLId(input: ListDistributionsByWebACLIdInput, completion: @escaping (ClientRuntime.SdkResult<ListDistributionsByWebACLIdOutputResponse, ListDistributionsByWebACLIdOutputError>) -> Void)
```

### listFieldLevelEncryptionConfigs(input:​completion:​)

List all field-level encryption configurations that have been created in CloudFront for this account.

``` swift
func listFieldLevelEncryptionConfigs(input: ListFieldLevelEncryptionConfigsInput, completion: @escaping (ClientRuntime.SdkResult<ListFieldLevelEncryptionConfigsOutputResponse, ListFieldLevelEncryptionConfigsOutputError>) -> Void)
```

### listFieldLevelEncryptionProfiles(input:​completion:​)

Request a list of field-level encryption profiles that have been created in CloudFront for this account.

``` swift
func listFieldLevelEncryptionProfiles(input: ListFieldLevelEncryptionProfilesInput, completion: @escaping (ClientRuntime.SdkResult<ListFieldLevelEncryptionProfilesOutputResponse, ListFieldLevelEncryptionProfilesOutputError>) -> Void)
```

### listFunctions(input:​completion:​)

Gets a list of all CloudFront functions in your account.
You can optionally apply a filter to return only the functions that are in the
specified stage, either DEVELOPMENT or LIVE.
You can optionally specify the maximum number of items to receive in the response. If
the total number of items in the list exceeds the maximum that you specify, or the
default maximum, the response is paginated. To get the next page of items, send a
subsequent request that specifies the NextMarker value from the current
response as the Marker value in the subsequent request.

``` swift
func listFunctions(input: ListFunctionsInput, completion: @escaping (ClientRuntime.SdkResult<ListFunctionsOutputResponse, ListFunctionsOutputError>) -> Void)
```

### listInvalidations(input:​completion:​)

Lists invalidation batches.

``` swift
func listInvalidations(input: ListInvalidationsInput, completion: @escaping (ClientRuntime.SdkResult<ListInvalidationsOutputResponse, ListInvalidationsOutputError>) -> Void)
```

### listKeyGroups(input:​completion:​)

Gets a list of key groups.
You can optionally specify the maximum number of items to receive in the response. If
the total number of items in the list exceeds the maximum that you specify, or the
default maximum, the response is paginated. To get the next page of items, send a
subsequent request that specifies the NextMarker value from the current
response as the Marker value in the subsequent request.

``` swift
func listKeyGroups(input: ListKeyGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListKeyGroupsOutputResponse, ListKeyGroupsOutputError>) -> Void)
```

### listOriginRequestPolicies(input:​completion:​)

Gets a list of origin request policies.
You can optionally apply a filter to return only the managed policies created by Amazon Web Services, or
only the custom policies created in your account.
You can optionally specify the maximum number of items to receive in the response. If
the total number of items in the list exceeds the maximum that you specify, or the
default maximum, the response is paginated. To get the next page of items, send a
subsequent request that specifies the NextMarker value from the current
response as the Marker value in the subsequent request.

``` swift
func listOriginRequestPolicies(input: ListOriginRequestPoliciesInput, completion: @escaping (ClientRuntime.SdkResult<ListOriginRequestPoliciesOutputResponse, ListOriginRequestPoliciesOutputError>) -> Void)
```

### listPublicKeys(input:​completion:​)

List all public keys that have been added to CloudFront for this account.

``` swift
func listPublicKeys(input: ListPublicKeysInput, completion: @escaping (ClientRuntime.SdkResult<ListPublicKeysOutputResponse, ListPublicKeysOutputError>) -> Void)
```

### listRealtimeLogConfigs(input:​completion:​)

Gets a list of real-time log configurations.
You can optionally specify the maximum number of items to receive in the response. If
the total number of items in the list exceeds the maximum that you specify, or the
default maximum, the response is paginated. To get the next page of items, send a
subsequent request that specifies the NextMarker value from the current
response as the Marker value in the subsequent request.

``` swift
func listRealtimeLogConfigs(input: ListRealtimeLogConfigsInput, completion: @escaping (ClientRuntime.SdkResult<ListRealtimeLogConfigsOutputResponse, ListRealtimeLogConfigsOutputError>) -> Void)
```

### listStreamingDistributions(input:​completion:​)

List streaming distributions.

``` swift
func listStreamingDistributions(input: ListStreamingDistributionsInput, completion: @escaping (ClientRuntime.SdkResult<ListStreamingDistributionsOutputResponse, ListStreamingDistributionsOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

List tags for a CloudFront resource.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### publishFunction(input:​completion:​)

Publishes a CloudFront function by copying the function code from the DEVELOPMENT
stage to LIVE. This automatically updates all cache behaviors that are
using this function to use the newly published copy in the LIVE
stage.
When a function is published to the LIVE stage, you can attach the function to
a distribution’s cache behavior, using the function’s Amazon Resource Name (ARN).
To publish a function, you must provide the function’s name and version (ETag
value). To get these values, you can use ListFunctions and
DescribeFunction.

``` swift
func publishFunction(input: PublishFunctionInput, completion: @escaping (ClientRuntime.SdkResult<PublishFunctionOutputResponse, PublishFunctionOutputError>) -> Void)
```

### tagResource(input:​completion:​)

Add tags to a CloudFront resource.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### testFunction(input:​completion:​)

Tests a CloudFront function.
To test a function, you provide an event object that represents an HTTP
request or response that your CloudFront distribution could receive in production. CloudFront runs
the function, passing it the event object that you provided, and returns the function’s
result (the modified event object) in the response. The response also contains function
logs and error messages, if any exist. For more information about testing functions, see
<a href="https:​//docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/managing-functions.html#test-function">Testing functions in the Amazon CloudFront Developer Guide.
To test a function, you provide the function’s name and version (ETag value)
along with the event object. To get the function’s name and version, you can use
ListFunctions and DescribeFunction.

``` swift
func testFunction(input: TestFunctionInput, completion: @escaping (ClientRuntime.SdkResult<TestFunctionOutputResponse, TestFunctionOutputError>) -> Void)
```

### untagResource(input:​completion:​)

Remove tags from a CloudFront resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateCachePolicy(input:​completion:​)

Updates a cache policy configuration.
When you update a cache policy configuration, all the fields are updated with the
values provided in the request. You cannot update some fields independent of others. To
update a cache policy configuration:​

<ol>

``` swift
func updateCachePolicy(input: UpdateCachePolicyInput, completion: @escaping (ClientRuntime.SdkResult<UpdateCachePolicyOutputResponse, UpdateCachePolicyOutputError>) -> Void)
```

``` 
			           Use GetCachePolicyConfig to get the current configuration.
		

			           Locally modify the fields in the cache policy configuration that you want to
				update.
		

			           Call UpdateCachePolicy by providing the entire cache policy
				configuration, including the fields that you modified and those that you
				didn’t.
		
     </ol>
```

### updateCloudFrontOriginAccessIdentity(input:​completion:​)

Update an origin access identity.

``` swift
func updateCloudFrontOriginAccessIdentity(input: UpdateCloudFrontOriginAccessIdentityInput, completion: @escaping (ClientRuntime.SdkResult<UpdateCloudFrontOriginAccessIdentityOutputResponse, UpdateCloudFrontOriginAccessIdentityOutputError>) -> Void)
```

### updateDistribution(input:​completion:​)

Updates the configuration for a web distribution.

``` swift
func updateDistribution(input: UpdateDistributionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDistributionOutputResponse, UpdateDistributionOutputError>) -> Void)
```

``` 
        When you update a distribution, there are more required fields than when you create a distribution.
		When you update your distribution by using this API action, follow the steps here to get the current configuration
		and then make your updates, to make sure that you include all of the required fields. To view a summary,
		see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-overview-required-fields.html">Required
			Fields for Create Distribution and Update Distribution in the Amazon CloudFront Developer Guide.

	       The update process includes getting the current distribution configuration, updating the XML document that is
		returned to make your changes, and then submitting an UpdateDistribution request to make the updates.
	       For information about updating a distribution using the CloudFront console instead, see
		<a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-creating-console.html">Creating a
			Distribution in the Amazon CloudFront Developer Guide.
	
	
        To update a web distribution using the CloudFront API

	       <ol>

           Submit a
			<a href="https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_GetDistributionConfig.html">GetDistributionConfig
			request to get the current configuration and an Etag header
			for the distribution.
			
              If you update the distribution again, you must get a new Etag header.

		

           Update the XML document that was returned in the response to your GetDistributionConfig request to include
			your changes.
			
				             When you edit the XML file, be aware of the following:
				

                    You must strip out the ETag parameter that is returned.


                    Additional fields are required when you update a distribution. There may be fields included in the
						XML file for features that you haven't configured for your distribution. This is expected and required to
						successfully update the distribution.


                    You can't change the value of CallerReference. If you try to change this value, CloudFront returns an
						IllegalUpdate error.


                    The new configuration replaces the existing configuration; the values that you specify in an
						UpdateDistribution request are not merged into your existing configuration. When you add, delete, or
						replace values in an element that allows multiple values (for example, CNAME), you must specify all of the
						values that you want to appear in the updated distribution. In addition,
						you must update the corresponding Quantity element.



		

           Submit an UpdateDistribution request to update the configuration for your distribution:
			

                 In the request body, include the XML document that you updated in Step 2. The request body must include an
					XML document with a DistributionConfig element.


                 Set the value of the HTTP If-Match header to the value of the ETag header that CloudFront returned
					when you submitted the GetDistributionConfig request in Step 1.


		

           Review the response to the UpdateDistribution request to confirm that the configuration was
			successfully updated.


           Optional: Submit a
			<a href="https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_GetDistribution.html">GetDistribution
			request to confirm that your changes have propagated.
			When propagation is complete, the value of Status is Deployed.
		
     </ol>
```

### updateFieldLevelEncryptionConfig(input:​completion:​)

Update a field-level encryption configuration.

``` swift
func updateFieldLevelEncryptionConfig(input: UpdateFieldLevelEncryptionConfigInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFieldLevelEncryptionConfigOutputResponse, UpdateFieldLevelEncryptionConfigOutputError>) -> Void)
```

### updateFieldLevelEncryptionProfile(input:​completion:​)

Update a field-level encryption profile.

``` swift
func updateFieldLevelEncryptionProfile(input: UpdateFieldLevelEncryptionProfileInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFieldLevelEncryptionProfileOutputResponse, UpdateFieldLevelEncryptionProfileOutputError>) -> Void)
```

### updateFunction(input:​completion:​)

Updates a CloudFront function.
You can update a function’s code or the comment that describes the function. You
cannot update a function’s name.
To update a function, you provide the function’s name and version (ETag value)
along with the updated function code. To get the name and version, you can use
ListFunctions and DescribeFunction.

``` swift
func updateFunction(input: UpdateFunctionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFunctionOutputResponse, UpdateFunctionOutputError>) -> Void)
```

### updateKeyGroup(input:​completion:​)

Updates a key group.
When you update a key group, all the fields are updated with the values provided in
the request. You cannot update some fields independent of others. To update a key
group:​

<ol>

``` swift
func updateKeyGroup(input: UpdateKeyGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateKeyGroupOutputResponse, UpdateKeyGroupOutputError>) -> Void)
```

``` 
			           Get the current key group with GetKeyGroup or
				GetKeyGroupConfig.
		

			           Locally modify the fields in the key group that you want to update. For
				example, add or remove public key IDs.
		

			           Call UpdateKeyGroup with the entire key group object, including
				the fields that you modified and those that you didn’t.
		
     </ol>
```

### updateOriginRequestPolicy(input:​completion:​)

Updates an origin request policy configuration.
When you update an origin request policy configuration, all the fields are updated
with the values provided in the request. You cannot update some fields independent of
others. To update an origin request policy configuration:​

<ol>

``` swift
func updateOriginRequestPolicy(input: UpdateOriginRequestPolicyInput, completion: @escaping (ClientRuntime.SdkResult<UpdateOriginRequestPolicyOutputResponse, UpdateOriginRequestPolicyOutputError>) -> Void)
```

``` 
			           Use GetOriginRequestPolicyConfig to get the current configuration.
		

			           Locally modify the fields in the origin request policy configuration that you
				want to update.
		

			           Call UpdateOriginRequestPolicy by providing the entire origin
				request policy configuration, including the fields that you modified and those
				that you didn’t.
		
     </ol>
```

### updatePublicKey(input:​completion:​)

Update public key information. Note that the only value you can change is the comment.

``` swift
func updatePublicKey(input: UpdatePublicKeyInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePublicKeyOutputResponse, UpdatePublicKeyOutputError>) -> Void)
```

### updateRealtimeLogConfig(input:​completion:​)

Updates a real-time log configuration.
When you update a real-time log configuration, all the parameters are updated with the
values provided in the request. You cannot update some parameters independent of others.
To update a real-time log configuration:​

<ol>

``` swift
func updateRealtimeLogConfig(input: UpdateRealtimeLogConfigInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRealtimeLogConfigOutputResponse, UpdateRealtimeLogConfigOutputError>) -> Void)
```

``` 
			           Call GetRealtimeLogConfig to get the current real-time log
				configuration.
		

			           Locally modify the parameters in the real-time log configuration that you want
				to update.
		

			           Call this API (UpdateRealtimeLogConfig) by providing the entire
				real-time log configuration, including the parameters that you modified and
				those that you didn’t.
		
     </ol>
	       You cannot update a real-time log configuration’s Name or
		ARN.
```

### updateStreamingDistribution(input:​completion:​)

Update a streaming distribution.

``` swift
func updateStreamingDistribution(input: UpdateStreamingDistributionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateStreamingDistributionOutputResponse, UpdateStreamingDistributionOutputError>) -> Void)
```
