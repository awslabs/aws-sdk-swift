# EcrClient

``` swift
public class EcrClient 
```

## Inheritance

[`EcrClientProtocol`](/aws-sdk-swift/reference/0.x/AWSECR/EcrClientProtocol)

## Initializers

### `init(config:)`

``` swift
public init(config: AWSClientRuntime.AWSClientConfiguration) 
```

### `init(region:)`

``` swift
public convenience init(region: Swift.String? = nil) throws 
```

## Methods

### `batchCheckLayerAvailability(input:completion:)`

Checks the availability of one or more image layers in a repository.
When an image is pushed to a repository, each image layer is checked to verify if it
has been uploaded before. If it has been uploaded, then the image layer is
skipped.

``` swift
public func batchCheckLayerAvailability(input: BatchCheckLayerAvailabilityInput, completion: @escaping (ClientRuntime.SdkResult<BatchCheckLayerAvailabilityOutputResponse, BatchCheckLayerAvailabilityOutputError>) -> Void)
```

``` 
        This operation is used by the Amazon ECR proxy and is not generally used by
    customers for pulling and pushing images. In most cases, you should use the docker CLI to pull, tag, and push images.
```

### `batchDeleteImage(input:completion:)`

Deletes a list of specified images within a repository. Images are specified with
either an imageTag or imageDigest.
You can remove a tag from an image by specifying the image's tag in your request. When
you remove the last tag from an image, the image is deleted from your repository.
You can completely delete an image (and all of its tags) by specifying the image's
digest in your request.

``` swift
public func batchDeleteImage(input: BatchDeleteImageInput, completion: @escaping (ClientRuntime.SdkResult<BatchDeleteImageOutputResponse, BatchDeleteImageOutputError>) -> Void)
```

### `batchGetImage(input:completion:)`

Gets detailed information for an image. Images are specified with either an
imageTag or imageDigest.
When an image is pulled, the BatchGetImage API is called once to retrieve the image
manifest.

``` swift
public func batchGetImage(input: BatchGetImageInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetImageOutputResponse, BatchGetImageOutputError>) -> Void)
```

### `completeLayerUpload(input:completion:)`

Informs Amazon ECR that the image layer upload has completed for a specified registry,
repository name, and upload ID. You can optionally provide a sha256 digest
of the image layer for data validation purposes.
When an image is pushed, the CompleteLayerUpload API is called once per each new image
layer to verify that the upload has completed.

``` swift
public func completeLayerUpload(input: CompleteLayerUploadInput, completion: @escaping (ClientRuntime.SdkResult<CompleteLayerUploadOutputResponse, CompleteLayerUploadOutputError>) -> Void)
```

``` 
        This operation is used by the Amazon ECR proxy and is not generally used by
    customers for pulling and pushing images. In most cases, you should use the docker CLI to pull, tag, and push images.
```

### `createRepository(input:completion:)`

Creates a repository. For more information, see <a href="https:​//docs.aws.amazon.com/AmazonECR/latest/userguide/Repositories.html">Amazon ECR repositories in the
Amazon Elastic Container Registry User Guide.

``` swift
public func createRepository(input: CreateRepositoryInput, completion: @escaping (ClientRuntime.SdkResult<CreateRepositoryOutputResponse, CreateRepositoryOutputError>) -> Void)
```

### `deleteLifecyclePolicy(input:completion:)`

Deletes the lifecycle policy associated with the specified repository.

``` swift
public func deleteLifecyclePolicy(input: DeleteLifecyclePolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLifecyclePolicyOutputResponse, DeleteLifecyclePolicyOutputError>) -> Void)
```

### `deleteRegistryPolicy(input:completion:)`

Deletes the registry permissions policy.

``` swift
public func deleteRegistryPolicy(input: DeleteRegistryPolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRegistryPolicyOutputResponse, DeleteRegistryPolicyOutputError>) -> Void)
```

### `deleteRepository(input:completion:)`

Deletes a repository. If the repository contains images, you must either delete all
images in the repository or use the force option to delete the
repository.

``` swift
public func deleteRepository(input: DeleteRepositoryInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRepositoryOutputResponse, DeleteRepositoryOutputError>) -> Void)
```

### `deleteRepositoryPolicy(input:completion:)`

Deletes the repository policy associated with the specified repository.

``` swift
public func deleteRepositoryPolicy(input: DeleteRepositoryPolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRepositoryPolicyOutputResponse, DeleteRepositoryPolicyOutputError>) -> Void)
```

### `describeImageReplicationStatus(input:completion:)`

Returns the replication status for a specified image.

``` swift
public func describeImageReplicationStatus(input: DescribeImageReplicationStatusInput, completion: @escaping (ClientRuntime.SdkResult<DescribeImageReplicationStatusOutputResponse, DescribeImageReplicationStatusOutputError>) -> Void)
```

### `describeImageScanFindings(input:completion:)`

Returns the scan findings for the specified image.

``` swift
public func describeImageScanFindings(input: DescribeImageScanFindingsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeImageScanFindingsOutputResponse, DescribeImageScanFindingsOutputError>) -> Void)
```

### `describeImages(input:completion:)`

Returns metadata about the images in a repository.

``` swift
public func describeImages(input: DescribeImagesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeImagesOutputResponse, DescribeImagesOutputError>) -> Void)
```

``` 
        Beginning with Docker version 1.9, the Docker client compresses image layers
            before pushing them to a V2 Docker registry. The output of the docker
                images command shows the uncompressed image size, so it may return a
            larger image size than the image sizes returned by DescribeImages.
```

### `describeRegistry(input:completion:)`

Describes the settings for a registry. The replication configuration for a repository
can be created or updated with the PutReplicationConfiguration API
action.

``` swift
public func describeRegistry(input: DescribeRegistryInput, completion: @escaping (ClientRuntime.SdkResult<DescribeRegistryOutputResponse, DescribeRegistryOutputError>) -> Void)
```

### `describeRepositories(input:completion:)`

Describes image repositories in a registry.

``` swift
public func describeRepositories(input: DescribeRepositoriesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeRepositoriesOutputResponse, DescribeRepositoriesOutputError>) -> Void)
```

### `getAuthorizationToken(input:completion:)`

Retrieves an authorization token. An authorization token represents your IAM
authentication credentials and can be used to access any Amazon ECR registry that your IAM
principal has access to. The authorization token is valid for 12 hours.
The authorizationToken returned is a base64 encoded string that can be
decoded and used in a docker login command to authenticate to a registry.
The CLI offers an get-login-password command that simplifies the login
process. For more information, see <a href="https:​//docs.aws.amazon.com/AmazonECR/latest/userguide/Registries.html#registry_auth">Registry
authentication in the Amazon Elastic Container Registry User Guide.

``` swift
public func getAuthorizationToken(input: GetAuthorizationTokenInput, completion: @escaping (ClientRuntime.SdkResult<GetAuthorizationTokenOutputResponse, GetAuthorizationTokenOutputError>) -> Void)
```

### `getDownloadUrlForLayer(input:completion:)`

Retrieves the pre-signed Amazon S3 download URL corresponding to an image layer. You can
only get URLs for image layers that are referenced in an image.
When an image is pulled, the GetDownloadUrlForLayer API is called once per image layer
that is not already cached.

``` swift
public func getDownloadUrlForLayer(input: GetDownloadUrlForLayerInput, completion: @escaping (ClientRuntime.SdkResult<GetDownloadUrlForLayerOutputResponse, GetDownloadUrlForLayerOutputError>) -> Void)
```

``` 
        This operation is used by the Amazon ECR proxy and is not generally used by
    customers for pulling and pushing images. In most cases, you should use the docker CLI to pull, tag, and push images.
```

### `getLifecyclePolicy(input:completion:)`

Retrieves the lifecycle policy for the specified repository.

``` swift
public func getLifecyclePolicy(input: GetLifecyclePolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetLifecyclePolicyOutputResponse, GetLifecyclePolicyOutputError>) -> Void)
```

### `getLifecyclePolicyPreview(input:completion:)`

Retrieves the results of the lifecycle policy preview request for the specified
repository.

``` swift
public func getLifecyclePolicyPreview(input: GetLifecyclePolicyPreviewInput, completion: @escaping (ClientRuntime.SdkResult<GetLifecyclePolicyPreviewOutputResponse, GetLifecyclePolicyPreviewOutputError>) -> Void)
```

### `getRegistryPolicy(input:completion:)`

Retrieves the permissions policy for a registry.

``` swift
public func getRegistryPolicy(input: GetRegistryPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetRegistryPolicyOutputResponse, GetRegistryPolicyOutputError>) -> Void)
```

### `getRepositoryPolicy(input:completion:)`

Retrieves the repository policy for the specified repository.

``` swift
public func getRepositoryPolicy(input: GetRepositoryPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetRepositoryPolicyOutputResponse, GetRepositoryPolicyOutputError>) -> Void)
```

### `initiateLayerUpload(input:completion:)`

Notifies Amazon ECR that you intend to upload an image layer.
When an image is pushed, the InitiateLayerUpload API is called once per image layer
that has not already been uploaded. Whether or not an image layer has been uploaded is
determined by the BatchCheckLayerAvailability API action.

``` swift
public func initiateLayerUpload(input: InitiateLayerUploadInput, completion: @escaping (ClientRuntime.SdkResult<InitiateLayerUploadOutputResponse, InitiateLayerUploadOutputError>) -> Void)
```

``` 
        This operation is used by the Amazon ECR proxy and is not generally used by
    customers for pulling and pushing images. In most cases, you should use the docker CLI to pull, tag, and push images.
```

### `listImages(input:completion:)`

Lists all the image IDs for the specified repository.
You can filter images based on whether or not they are tagged by using the
tagStatus filter and specifying either TAGGED,
UNTAGGED or ANY. For example, you can filter your results
to return only UNTAGGED images and then pipe that result to a BatchDeleteImage operation to delete them. Or, you can filter your
results to return only TAGGED images to list all of the tags in your
repository.

``` swift
public func listImages(input: ListImagesInput, completion: @escaping (ClientRuntime.SdkResult<ListImagesOutputResponse, ListImagesOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

List the tags for an Amazon ECR resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `putImage(input:completion:)`

Creates or updates the image manifest and tags associated with an image.
When an image is pushed and all new image layers have been uploaded, the PutImage API
is called once to create or update the image manifest and the tags associated with the
image.

``` swift
public func putImage(input: PutImageInput, completion: @escaping (ClientRuntime.SdkResult<PutImageOutputResponse, PutImageOutputError>) -> Void)
```

``` 
        This operation is used by the Amazon ECR proxy and is not generally used by
    customers for pulling and pushing images. In most cases, you should use the docker CLI to pull, tag, and push images.
```

### `putImageScanningConfiguration(input:completion:)`

Updates the image scanning configuration for the specified repository.

``` swift
public func putImageScanningConfiguration(input: PutImageScanningConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<PutImageScanningConfigurationOutputResponse, PutImageScanningConfigurationOutputError>) -> Void)
```

### `putImageTagMutability(input:completion:)`

Updates the image tag mutability settings for the specified repository. For more
information, see <a href="https:​//docs.aws.amazon.com/AmazonECR/latest/userguide/image-tag-mutability.html">Image tag
mutability in the Amazon Elastic Container Registry User Guide.

``` swift
public func putImageTagMutability(input: PutImageTagMutabilityInput, completion: @escaping (ClientRuntime.SdkResult<PutImageTagMutabilityOutputResponse, PutImageTagMutabilityOutputError>) -> Void)
```

### `putLifecyclePolicy(input:completion:)`

Creates or updates the lifecycle policy for the specified repository. For more
information, see <a href="https:​//docs.aws.amazon.com/AmazonECR/latest/userguide/LifecyclePolicies.html">Lifecycle policy
template.

``` swift
public func putLifecyclePolicy(input: PutLifecyclePolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutLifecyclePolicyOutputResponse, PutLifecyclePolicyOutputError>) -> Void)
```

### `putRegistryPolicy(input:completion:)`

Creates or updates the permissions policy for your registry.
A registry policy is used to specify permissions for another Amazon Web Services account and is used
when configuring cross-account replication. For more information, see <a href="https:​//docs.aws.amazon.com/AmazonECR/latest/userguide/registry-permissions.html">Registry permissions in the Amazon Elastic Container Registry User Guide.

``` swift
public func putRegistryPolicy(input: PutRegistryPolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutRegistryPolicyOutputResponse, PutRegistryPolicyOutputError>) -> Void)
```

### `putReplicationConfiguration(input:completion:)`

Creates or updates the replication configuration for a registry. The existing
replication configuration for a repository can be retrieved with the DescribeRegistry API action. The first time the
PutReplicationConfiguration API is called, a service-linked IAM role is created in
your account for the replication process. For more information, see <a href="https:​//docs.aws.amazon.com/AmazonECR/latest/userguide/using-service-linked-roles.html">Using
service-linked roles for Amazon ECR in the
Amazon Elastic Container Registry User Guide.

``` swift
public func putReplicationConfiguration(input: PutReplicationConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<PutReplicationConfigurationOutputResponse, PutReplicationConfigurationOutputError>) -> Void)
```

``` 
        When configuring cross-account replication, the destination account must grant the
            source account permission to replicate. This permission is controlled using a
            registry permissions policy. For more information, see PutRegistryPolicy.
```

### `setRepositoryPolicy(input:completion:)`

Applies a repository policy to the specified repository to control access permissions.
For more information, see <a href="https:​//docs.aws.amazon.com/AmazonECR/latest/userguide/repository-policies.html">Amazon ECR Repository
policies in the Amazon Elastic Container Registry User Guide.

``` swift
public func setRepositoryPolicy(input: SetRepositoryPolicyInput, completion: @escaping (ClientRuntime.SdkResult<SetRepositoryPolicyOutputResponse, SetRepositoryPolicyOutputError>) -> Void)
```

### `startImageScan(input:completion:)`

Starts an image vulnerability scan. An image scan can only be started once per 24
hours on an individual image. This limit includes if an image was scanned on initial
push. For more information, see <a href="https:​//docs.aws.amazon.com/AmazonECR/latest/userguide/image-scanning.html">Image scanning in the
Amazon Elastic Container Registry User Guide.

``` swift
public func startImageScan(input: StartImageScanInput, completion: @escaping (ClientRuntime.SdkResult<StartImageScanOutputResponse, StartImageScanOutputError>) -> Void)
```

### `startLifecyclePolicyPreview(input:completion:)`

Starts a preview of a lifecycle policy for the specified repository. This allows you
to see the results before associating the lifecycle policy with the repository.

``` swift
public func startLifecyclePolicyPreview(input: StartLifecyclePolicyPreviewInput, completion: @escaping (ClientRuntime.SdkResult<StartLifecyclePolicyPreviewOutputResponse, StartLifecyclePolicyPreviewOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Adds specified tags to a resource with the specified ARN. Existing tags on a resource
are not changed if they are not specified in the request parameters.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Deletes specified tags from a resource.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `uploadLayerPart(input:completion:)`

Uploads an image layer part to Amazon ECR.
When an image is pushed, each new image layer is uploaded in parts. The maximum size
of each image layer part can be 20971520 bytes (or about 20MB). The UploadLayerPart API
is called once per each new image layer part.

``` swift
public func uploadLayerPart(input: UploadLayerPartInput, completion: @escaping (ClientRuntime.SdkResult<UploadLayerPartOutputResponse, UploadLayerPartOutputError>) -> Void)
```

``` 
        This operation is used by the Amazon ECR proxy and is not generally used by
    customers for pulling and pushing images. In most cases, you should use the docker CLI to pull, tag, and push images.
```
