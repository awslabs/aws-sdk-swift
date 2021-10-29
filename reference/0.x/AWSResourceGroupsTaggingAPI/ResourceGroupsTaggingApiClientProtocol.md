# ResourceGroupsTaggingApiClientProtocol

Resource Groups Tagging API

``` swift
public protocol ResourceGroupsTaggingApiClientProtocol 
```

## Requirements

### describeReportCreation(input:completion:)

Describes the status of the StartReportCreation operation. You can call this operation only from the organization's management account and from the us-east-1 Region.

``` swift
func describeReportCreation(input: DescribeReportCreationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeReportCreationOutputResponse, DescribeReportCreationOutputError>) -> Void)
```

### getComplianceSummary(input:completion:)

Returns a table that shows counts of resources that are noncompliant with their tag policies. For more information on tag policies, see [Tag Policies](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html) in the AWS Organizations User Guide. You can call this operation only from the organization's management account and from the us-east-1 Region. This operation supports pagination, where the response can be sent in multiple pages. You should check the PaginationToken response parameter to determine if there are additional results available to return. Repeat the query, passing the PaginationToken response parameter value as an input to the next request until you recieve a null value. A null value for PaginationToken indicates that there are no more results waiting to be returned.

``` swift
func getComplianceSummary(input: GetComplianceSummaryInput, completion: @escaping (ClientRuntime.SdkResult<GetComplianceSummaryOutputResponse, GetComplianceSummaryOutputError>) -> Void)
```

### getResources(input:completion:)

Returns all the tagged or previously tagged resources that are located in the specified Region for the AWS account. Depending on what information you want returned, you can also specify the following:

``` swift
func getResources(input: GetResourcesInput, completion: @escaping (ClientRuntime.SdkResult<GetResourcesOutputResponse, GetResourcesOutputError>) -> Void)
```

  - Filters that specify what tags and resource types you want returned. The response includes all tags that are associated with the requested resources.

  - Information about compliance with the account's effective tag policy. For more information on tag policies, see [Tag Policies](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html) in the AWS Organizations User Guide.

This operation supports pagination, where the response can be sent in multiple pages. You should check the PaginationToken response parameter to determine if there are additional results available to return. Repeat the query, passing the PaginationToken response parameter value as an input to the next request until you recieve a null value. A null value for PaginationToken indicates that there are no more results waiting to be returned.

### getTagKeys(input:completion:)

Returns all tag keys currently in use in the specified Region for the calling AWS account. This operation supports pagination, where the response can be sent in multiple pages. You should check the PaginationToken response parameter to determine if there are additional results available to return. Repeat the query, passing the PaginationToken response parameter value as an input to the next request until you recieve a null value. A null value for PaginationToken indicates that there are no more results waiting to be returned.

``` swift
func getTagKeys(input: GetTagKeysInput, completion: @escaping (ClientRuntime.SdkResult<GetTagKeysOutputResponse, GetTagKeysOutputError>) -> Void)
```

### getTagValues(input:completion:)

Returns all tag values for the specified key that are used in the specified AWS Region for the calling AWS account. This operation supports pagination, where the response can be sent in multiple pages. You should check the PaginationToken response parameter to determine if there are additional results available to return. Repeat the query, passing the PaginationToken response parameter value as an input to the next request until you recieve a null value. A null value for PaginationToken indicates that there are no more results waiting to be returned.

``` swift
func getTagValues(input: GetTagValuesInput, completion: @escaping (ClientRuntime.SdkResult<GetTagValuesOutputResponse, GetTagValuesOutputError>) -> Void)
```

### startReportCreation(input:completion:)

Generates a report that lists all tagged resources in the accounts across your organization and tells whether each resource is compliant with the effective tag policy. Compliance data is refreshed daily. The report is generated asynchronously. The generated report is saved to the following location: s3://example-bucket/AwsTagPolicies/o-exampleorgid/YYYY-MM-ddTHH:mm:ssZ/report.csv You can call this operation only from the organization's management account and from the us-east-1 Region.

``` swift
func startReportCreation(input: StartReportCreationInput, completion: @escaping (ClientRuntime.SdkResult<StartReportCreationOutputResponse, StartReportCreationOutputError>) -> Void)
```

### tagResources(input:completion:)

Applies one or more tags to the specified resources. Note the following:

``` swift
func tagResources(input: TagResourcesInput, completion: @escaping (ClientRuntime.SdkResult<TagResourcesOutputResponse, TagResourcesOutputError>) -> Void)
```

  - Not all resources can have tags. For a list of services with resources that support tagging using this operation, see [Services that support the Resource Groups Tagging API](https://docs.aws.amazon.com/resourcegroupstagging/latest/APIReference/supported-services.html).

  - Each resource can have up to 50 tags. For other limits, see [Tag Naming and Usage Conventions](https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html#tag-conventions) in the AWS General Reference.

  - You can only tag resources that are located in the specified AWS Region for the AWS account.

  - To add tags to a resource, you need the necessary permissions for the service that the resource belongs to as well as permissions for adding tags. For more information, see the documentation for each service.

Do not store personally identifiable information (PII) or other confidential or sensitive information in tags. We use tags to provide you with billing and administration services. Tags are not intended to be used for private or sensitive data.

### untagResources(input:completion:)

Removes the specified tags from the specified resources. When you specify a tag key, the action removes both that key and its associated value. The operation succeeds even if you attempt to remove tags from a resource that were already removed. Note the following:

``` swift
func untagResources(input: UntagResourcesInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourcesOutputResponse, UntagResourcesOutputError>) -> Void)
```

  - To remove tags from a resource, you need the necessary permissions for the service that the resource belongs to as well as permissions for removing tags. For more information, see the documentation for the service whose resource you want to untag.

  - You can only tag resources that are located in the specified AWS Region for the calling AWS account.
