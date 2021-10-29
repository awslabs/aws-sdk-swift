# MediaStoreClientProtocol

An AWS Elemental MediaStore container is a namespace that holds folders and objects. You use a container endpoint to create, read, and delete objects.

``` swift
public protocol MediaStoreClientProtocol 
```

## Requirements

### createContainer(input:completion:)

Creates a storage container to hold objects. A container is similar to a bucket in the Amazon S3 service.

``` swift
func createContainer(input: CreateContainerInput, completion: @escaping (ClientRuntime.SdkResult<CreateContainerOutputResponse, CreateContainerOutputError>) -> Void)
```

### deleteContainer(input:completion:)

Deletes the specified container. Before you make a DeleteContainer request, delete any objects in the container or in any folders in the container. You can delete only empty containers.

``` swift
func deleteContainer(input: DeleteContainerInput, completion: @escaping (ClientRuntime.SdkResult<DeleteContainerOutputResponse, DeleteContainerOutputError>) -> Void)
```

### deleteContainerPolicy(input:completion:)

Deletes the access policy that is associated with the specified container.

``` swift
func deleteContainerPolicy(input: DeleteContainerPolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteContainerPolicyOutputResponse, DeleteContainerPolicyOutputError>) -> Void)
```

### deleteCorsPolicy(input:completion:)

Deletes the cross-origin resource sharing (CORS) configuration information that is set for the container. To use this operation, you must have permission to perform the MediaStore:DeleteCorsPolicy action. The container owner has this permission by default and can grant this permission to others.

``` swift
func deleteCorsPolicy(input: DeleteCorsPolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCorsPolicyOutputResponse, DeleteCorsPolicyOutputError>) -> Void)
```

### deleteLifecyclePolicy(input:completion:)

Removes an object lifecycle policy from a container. It takes up to 20 minutes for the change to take effect.

``` swift
func deleteLifecyclePolicy(input: DeleteLifecyclePolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLifecyclePolicyOutputResponse, DeleteLifecyclePolicyOutputError>) -> Void)
```

### deleteMetricPolicy(input:completion:)

Deletes the metric policy that is associated with the specified container. If there is no metric policy associated with the container, MediaStore doesn't send metrics to CloudWatch.

``` swift
func deleteMetricPolicy(input: DeleteMetricPolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteMetricPolicyOutputResponse, DeleteMetricPolicyOutputError>) -> Void)
```

### describeContainer(input:completion:)

Retrieves the properties of the requested container. This request is commonly used to retrieve the endpoint of a container. An endpoint is a value assigned by the service when a new container is created. A container's endpoint does not change after it has been assigned. The DescribeContainer request returns a single Container object based on ContainerName. To return all Container objects that are associated with a specified AWS account, use \[ListContainers\].

``` swift
func describeContainer(input: DescribeContainerInput, completion: @escaping (ClientRuntime.SdkResult<DescribeContainerOutputResponse, DescribeContainerOutputError>) -> Void)
```

### getContainerPolicy(input:completion:)

Retrieves the access policy for the specified container. For information about the data that is included in an access policy, see the [AWS Identity and Access Management User Guide](https://aws.amazon.com/documentation/iam/).

``` swift
func getContainerPolicy(input: GetContainerPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetContainerPolicyOutputResponse, GetContainerPolicyOutputError>) -> Void)
```

### getCorsPolicy(input:completion:)

Returns the cross-origin resource sharing (CORS) configuration information that is set for the container. To use this operation, you must have permission to perform the MediaStore:GetCorsPolicy action. By default, the container owner has this permission and can grant it to others.

``` swift
func getCorsPolicy(input: GetCorsPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetCorsPolicyOutputResponse, GetCorsPolicyOutputError>) -> Void)
```

### getLifecyclePolicy(input:completion:)

Retrieves the object lifecycle policy that is assigned to a container.

``` swift
func getLifecyclePolicy(input: GetLifecyclePolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetLifecyclePolicyOutputResponse, GetLifecyclePolicyOutputError>) -> Void)
```

### getMetricPolicy(input:completion:)

Returns the metric policy for the specified container.

``` swift
func getMetricPolicy(input: GetMetricPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetMetricPolicyOutputResponse, GetMetricPolicyOutputError>) -> Void)
```

### listContainers(input:completion:)

Lists the properties of all containers in AWS Elemental MediaStore. You can query to receive all the containers in one response. Or you can include the MaxResults parameter to receive a limited number of containers in each response. In this case, the response includes a token. To get the next set of containers, send the command again, this time with the NextToken parameter (with the returned token as its value). The next set of responses appears, with a token if there are still more containers to receive. See also \[DescribeContainer\], which gets the properties of one container.

``` swift
func listContainers(input: ListContainersInput, completion: @escaping (ClientRuntime.SdkResult<ListContainersOutputResponse, ListContainersOutputError>) -> Void)
```

### listTagsForResource(input:completion:)

Returns a list of the tags assigned to the specified container.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### putContainerPolicy(input:completion:)

Creates an access policy for the specified container to restrict the users and clients that can access it. For information about the data that is included in an access policy, see the [AWS Identity and Access Management User Guide](https://aws.amazon.com/documentation/iam/). For this release of the REST API, you can create only one policy for a container. If you enter PutContainerPolicy twice, the second command modifies the existing policy.

``` swift
func putContainerPolicy(input: PutContainerPolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutContainerPolicyOutputResponse, PutContainerPolicyOutputError>) -> Void)
```

### putCorsPolicy(input:completion:)

Sets the cross-origin resource sharing (CORS) configuration on a container so that the container can service cross-origin requests. For example, you might want to enable a request whose origin is http://www.example.com to access your AWS Elemental MediaStore container at my.example.container.com by using the browser's XMLHttpRequest capability. To enable CORS on a container, you attach a CORS policy to the container. In the CORS policy, you configure rules that identify origins and the HTTP methods that can be executed on your container. The policy can contain up to 398,000 characters. You can add up to 100 rules to a CORS policy. If more than one rule applies, the service uses the first applicable rule listed. To learn more about CORS, see [Cross-Origin Resource Sharing (CORS) in AWS Elemental MediaStore](https://docs.aws.amazon.com/mediastore/latest/ug/cors-policy.html).

``` swift
func putCorsPolicy(input: PutCorsPolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutCorsPolicyOutputResponse, PutCorsPolicyOutputError>) -> Void)
```

### putLifecyclePolicy(input:completion:)

Writes an object lifecycle policy to a container. If the container already has an object lifecycle policy, the service replaces the existing policy with the new policy. It takes up to 20 minutes for the change to take effect. For information about how to construct an object lifecycle policy, see [Components of an Object Lifecycle Policy](https://docs.aws.amazon.com/mediastore/latest/ug/policies-object-lifecycle-components.html).

``` swift
func putLifecyclePolicy(input: PutLifecyclePolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutLifecyclePolicyOutputResponse, PutLifecyclePolicyOutputError>) -> Void)
```

### putMetricPolicy(input:completion:)

The metric policy that you want to add to the container. A metric policy allows AWS Elemental MediaStore to send metrics to Amazon CloudWatch. It takes up to 20 minutes for the new policy to take effect.

``` swift
func putMetricPolicy(input: PutMetricPolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutMetricPolicyOutputResponse, PutMetricPolicyOutputError>) -> Void)
```

### startAccessLogging(input:completion:)

Starts access logging on the specified container. When you enable access logging on a container, MediaStore delivers access logs for objects stored in that container to Amazon CloudWatch Logs.

``` swift
func startAccessLogging(input: StartAccessLoggingInput, completion: @escaping (ClientRuntime.SdkResult<StartAccessLoggingOutputResponse, StartAccessLoggingOutputError>) -> Void)
```

### stopAccessLogging(input:completion:)

Stops access logging on the specified container. When you stop access logging on a container, MediaStore stops sending access logs to Amazon CloudWatch Logs. These access logs are not saved and are not retrievable.

``` swift
func stopAccessLogging(input: StopAccessLoggingInput, completion: @escaping (ClientRuntime.SdkResult<StopAccessLoggingOutputResponse, StopAccessLoggingOutputError>) -> Void)
```

### tagResource(input:completion:)

Adds tags to the specified AWS Elemental MediaStore container. Tags are key:value pairs that you can associate with AWS resources. For example, the tag key might be "customer" and the tag value might be "companyA." You can specify one or more tags to add to each container. You can add up to 50 tags to each container. For more information about tagging, including naming and usage conventions, see [Tagging Resources in MediaStore](https://docs.aws.amazon.com/mediastore/latest/ug/tagging.html).

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:completion:)

Removes tags from the specified container. You can specify one or more tags to remove.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```
