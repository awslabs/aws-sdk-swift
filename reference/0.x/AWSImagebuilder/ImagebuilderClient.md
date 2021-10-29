# ImagebuilderClient

``` swift
public class ImagebuilderClient 
```

## Inheritance

[`ImagebuilderClientProtocol`](/aws-sdk-swift/reference/0.x/AWSImagebuilder/ImagebuilderClientProtocol)

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
public static let clientName = "ImagebuilderClient"
```

## Methods

### `cancelImageCreation(input:completion:)`

CancelImageCreation cancels the creation of Image. This operation can only be used on images in a non-terminal state.

``` swift
public func cancelImageCreation(input: CancelImageCreationInput, completion: @escaping (ClientRuntime.SdkResult<CancelImageCreationOutputResponse, CancelImageCreationOutputError>) -> Void)
```

### `createComponent(input:completion:)`

Creates a new component that can be used to build, validate, test, and assess your image.

``` swift
public func createComponent(input: CreateComponentInput, completion: @escaping (ClientRuntime.SdkResult<CreateComponentOutputResponse, CreateComponentOutputError>) -> Void)
```

### `createContainerRecipe(input:completion:)`

Creates a new container recipe. Container recipes define how images are configured, tested, and assessed.

``` swift
public func createContainerRecipe(input: CreateContainerRecipeInput, completion: @escaping (ClientRuntime.SdkResult<CreateContainerRecipeOutputResponse, CreateContainerRecipeOutputError>) -> Void)
```

### `createDistributionConfiguration(input:completion:)`

Creates a new distribution configuration. Distribution configurations define and configure the outputs of your pipeline.

``` swift
public func createDistributionConfiguration(input: CreateDistributionConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<CreateDistributionConfigurationOutputResponse, CreateDistributionConfigurationOutputError>) -> Void)
```

### `createImage(input:completion:)`

Creates a new image. This request will create a new image along with all of the configured output resources defined in the distribution configuration. You must specify exactly one recipe for your image, using either a ContainerRecipeArn or an ImageRecipeArn.

``` swift
public func createImage(input: CreateImageInput, completion: @escaping (ClientRuntime.SdkResult<CreateImageOutputResponse, CreateImageOutputError>) -> Void)
```

### `createImagePipeline(input:completion:)`

Creates a new image pipeline. Image pipelines enable you to automate the creation and distribution of images.

``` swift
public func createImagePipeline(input: CreateImagePipelineInput, completion: @escaping (ClientRuntime.SdkResult<CreateImagePipelineOutputResponse, CreateImagePipelineOutputError>) -> Void)
```

### `createImageRecipe(input:completion:)`

Creates a new image recipe. Image recipes define how images are configured, tested, and assessed.

``` swift
public func createImageRecipe(input: CreateImageRecipeInput, completion: @escaping (ClientRuntime.SdkResult<CreateImageRecipeOutputResponse, CreateImageRecipeOutputError>) -> Void)
```

### `createInfrastructureConfiguration(input:completion:)`

Creates a new infrastructure configuration. An infrastructure configuration defines the environment in which your image will be built and tested.

``` swift
public func createInfrastructureConfiguration(input: CreateInfrastructureConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<CreateInfrastructureConfigurationOutputResponse, CreateInfrastructureConfigurationOutputError>) -> Void)
```

### `deleteComponent(input:completion:)`

Deletes a component build version.

``` swift
public func deleteComponent(input: DeleteComponentInput, completion: @escaping (ClientRuntime.SdkResult<DeleteComponentOutputResponse, DeleteComponentOutputError>) -> Void)
```

### `deleteContainerRecipe(input:completion:)`

Deletes a container recipe.

``` swift
public func deleteContainerRecipe(input: DeleteContainerRecipeInput, completion: @escaping (ClientRuntime.SdkResult<DeleteContainerRecipeOutputResponse, DeleteContainerRecipeOutputError>) -> Void)
```

### `deleteDistributionConfiguration(input:completion:)`

Deletes a distribution configuration.

``` swift
public func deleteDistributionConfiguration(input: DeleteDistributionConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDistributionConfigurationOutputResponse, DeleteDistributionConfigurationOutputError>) -> Void)
```

### `deleteImage(input:completion:)`

Deletes an Image Builder image resource. This does not delete any EC2 AMIs or ECR container images that are created during the image build process. You must clean those up separately, using the appropriate Amazon EC2 or Amazon ECR console actions, or API or CLI commands.

``` swift
public func deleteImage(input: DeleteImageInput, completion: @escaping (ClientRuntime.SdkResult<DeleteImageOutputResponse, DeleteImageOutputError>) -> Void)
```

  - To deregister an EC2 Linux AMI, see [Deregister your Linux AMI](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/deregister-ami.html) in the Amazon EC2 User Guide .

  - To deregister an EC2 Windows AMI, see [Deregister your Windows AMI](https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/deregister-ami.html) in the Amazon EC2 Windows Guide .

  - To delete a container image from Amazon ECR, see [Deleting an image](https://docs.aws.amazon.com/https:/docs.aws.amazon.comAmazonECR/latest/userguide/delete_image.html) in the Amazon ECR User Guide.

### `deleteImagePipeline(input:completion:)`

Deletes an image pipeline.

``` swift
public func deleteImagePipeline(input: DeleteImagePipelineInput, completion: @escaping (ClientRuntime.SdkResult<DeleteImagePipelineOutputResponse, DeleteImagePipelineOutputError>) -> Void)
```

### `deleteImageRecipe(input:completion:)`

Deletes an image recipe.

``` swift
public func deleteImageRecipe(input: DeleteImageRecipeInput, completion: @escaping (ClientRuntime.SdkResult<DeleteImageRecipeOutputResponse, DeleteImageRecipeOutputError>) -> Void)
```

### `deleteInfrastructureConfiguration(input:completion:)`

Deletes an infrastructure configuration.

``` swift
public func deleteInfrastructureConfiguration(input: DeleteInfrastructureConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteInfrastructureConfigurationOutputResponse, DeleteInfrastructureConfigurationOutputError>) -> Void)
```

### `getComponent(input:completion:)`

Gets a component object.

``` swift
public func getComponent(input: GetComponentInput, completion: @escaping (ClientRuntime.SdkResult<GetComponentOutputResponse, GetComponentOutputError>) -> Void)
```

### `getComponentPolicy(input:completion:)`

Gets a component policy.

``` swift
public func getComponentPolicy(input: GetComponentPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetComponentPolicyOutputResponse, GetComponentPolicyOutputError>) -> Void)
```

### `getContainerRecipe(input:completion:)`

Retrieves a container recipe.

``` swift
public func getContainerRecipe(input: GetContainerRecipeInput, completion: @escaping (ClientRuntime.SdkResult<GetContainerRecipeOutputResponse, GetContainerRecipeOutputError>) -> Void)
```

### `getContainerRecipePolicy(input:completion:)`

Retrieves the policy for a container recipe.

``` swift
public func getContainerRecipePolicy(input: GetContainerRecipePolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetContainerRecipePolicyOutputResponse, GetContainerRecipePolicyOutputError>) -> Void)
```

### `getDistributionConfiguration(input:completion:)`

Gets a distribution configuration.

``` swift
public func getDistributionConfiguration(input: GetDistributionConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetDistributionConfigurationOutputResponse, GetDistributionConfigurationOutputError>) -> Void)
```

### `getImage(input:completion:)`

Gets an image.

``` swift
public func getImage(input: GetImageInput, completion: @escaping (ClientRuntime.SdkResult<GetImageOutputResponse, GetImageOutputError>) -> Void)
```

### `getImagePipeline(input:completion:)`

Gets an image pipeline.

``` swift
public func getImagePipeline(input: GetImagePipelineInput, completion: @escaping (ClientRuntime.SdkResult<GetImagePipelineOutputResponse, GetImagePipelineOutputError>) -> Void)
```

### `getImagePolicy(input:completion:)`

Gets an image policy.

``` swift
public func getImagePolicy(input: GetImagePolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetImagePolicyOutputResponse, GetImagePolicyOutputError>) -> Void)
```

### `getImageRecipe(input:completion:)`

Gets an image recipe.

``` swift
public func getImageRecipe(input: GetImageRecipeInput, completion: @escaping (ClientRuntime.SdkResult<GetImageRecipeOutputResponse, GetImageRecipeOutputError>) -> Void)
```

### `getImageRecipePolicy(input:completion:)`

Gets an image recipe policy.

``` swift
public func getImageRecipePolicy(input: GetImageRecipePolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetImageRecipePolicyOutputResponse, GetImageRecipePolicyOutputError>) -> Void)
```

### `getInfrastructureConfiguration(input:completion:)`

Gets an infrastructure configuration.

``` swift
public func getInfrastructureConfiguration(input: GetInfrastructureConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetInfrastructureConfigurationOutputResponse, GetInfrastructureConfigurationOutputError>) -> Void)
```

### `importComponent(input:completion:)`

Imports a component and transforms its data into a component document.

``` swift
public func importComponent(input: ImportComponentInput, completion: @escaping (ClientRuntime.SdkResult<ImportComponentOutputResponse, ImportComponentOutputError>) -> Void)
```

### `listComponentBuildVersions(input:completion:)`

Returns the list of component build versions for the specified semantic version. The semantic version has four nodes: ../. You can assign values for the first three, and can filter on all of them. Filtering: With semantic versioning, you have the flexibility to use wildcards (x) to specify the most recent versions or nodes when selecting the base image or components for your recipe. When you use a wildcard in any node, all nodes to the right of the first wildcard must also be wildcards.

``` swift
public func listComponentBuildVersions(input: ListComponentBuildVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListComponentBuildVersionsOutputResponse, ListComponentBuildVersionsOutputError>) -> Void)
```

### `listComponents(input:completion:)`

Returns the list of component build versions for the specified semantic version. The semantic version has four nodes: ../. You can assign values for the first three, and can filter on all of them. Filtering: With semantic versioning, you have the flexibility to use wildcards (x) to specify the most recent versions or nodes when selecting the base image or components for your recipe. When you use a wildcard in any node, all nodes to the right of the first wildcard must also be wildcards.

``` swift
public func listComponents(input: ListComponentsInput, completion: @escaping (ClientRuntime.SdkResult<ListComponentsOutputResponse, ListComponentsOutputError>) -> Void)
```

### `listContainerRecipes(input:completion:)`

Returns a list of container recipes.

``` swift
public func listContainerRecipes(input: ListContainerRecipesInput, completion: @escaping (ClientRuntime.SdkResult<ListContainerRecipesOutputResponse, ListContainerRecipesOutputError>) -> Void)
```

### `listDistributionConfigurations(input:completion:)`

Returns a list of distribution configurations.

``` swift
public func listDistributionConfigurations(input: ListDistributionConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<ListDistributionConfigurationsOutputResponse, ListDistributionConfigurationsOutputError>) -> Void)
```

### `listImageBuildVersions(input:completion:)`

Returns a list of image build versions.

``` swift
public func listImageBuildVersions(input: ListImageBuildVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListImageBuildVersionsOutputResponse, ListImageBuildVersionsOutputError>) -> Void)
```

### `listImagePackages(input:completion:)`

List the Packages that are associated with an Image Build Version, as determined by Amazon Web Services Systems Manager Inventory at build time.

``` swift
public func listImagePackages(input: ListImagePackagesInput, completion: @escaping (ClientRuntime.SdkResult<ListImagePackagesOutputResponse, ListImagePackagesOutputError>) -> Void)
```

### `listImagePipelineImages(input:completion:)`

Returns a list of images created by the specified pipeline.

``` swift
public func listImagePipelineImages(input: ListImagePipelineImagesInput, completion: @escaping (ClientRuntime.SdkResult<ListImagePipelineImagesOutputResponse, ListImagePipelineImagesOutputError>) -> Void)
```

### `listImagePipelines(input:completion:)`

Returns a list of image pipelines.

``` swift
public func listImagePipelines(input: ListImagePipelinesInput, completion: @escaping (ClientRuntime.SdkResult<ListImagePipelinesOutputResponse, ListImagePipelinesOutputError>) -> Void)
```

### `listImageRecipes(input:completion:)`

Returns a list of image recipes.

``` swift
public func listImageRecipes(input: ListImageRecipesInput, completion: @escaping (ClientRuntime.SdkResult<ListImageRecipesOutputResponse, ListImageRecipesOutputError>) -> Void)
```

### `listImages(input:completion:)`

Returns the list of images that you have access to.

``` swift
public func listImages(input: ListImagesInput, completion: @escaping (ClientRuntime.SdkResult<ListImagesOutputResponse, ListImagesOutputError>) -> Void)
```

### `listInfrastructureConfigurations(input:completion:)`

Returns a list of infrastructure configurations.

``` swift
public func listInfrastructureConfigurations(input: ListInfrastructureConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<ListInfrastructureConfigurationsOutputResponse, ListInfrastructureConfigurationsOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Returns the list of tags for the specified resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `putComponentPolicy(input:completion:)`

Applies a policy to a component. We recommend that you call the RAM API [CreateResourceShare](https://docs.aws.amazon.com/ram/latest/APIReference/API_CreateResourceShare.html) to share resources. If you call the Image Builder API PutComponentPolicy, you must also call the RAM API [PromoteResourceShareCreatedFromPolicy](https://docs.aws.amazon.com/ram/latest/APIReference/API_PromoteResourceShareCreatedFromPolicy.html) in order for the resource to be visible to all principals with whom the resource is shared.

``` swift
public func putComponentPolicy(input: PutComponentPolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutComponentPolicyOutputResponse, PutComponentPolicyOutputError>) -> Void)
```

### `putContainerRecipePolicy(input:completion:)`

Applies a policy to a container image. We recommend that you call the RAM API CreateResourceShare (https://docs.aws.amazon.com/ram/latest/APIReference/API\_CreateResourceShare.html) to share resources. If you call the Image Builder API PutContainerImagePolicy, you must also call the RAM API PromoteResourceShareCreatedFromPolicy (https://docs.aws.amazon.com/ram/latest/APIReference/API\_PromoteResourceShareCreatedFromPolicy.html) in order for the resource to be visible to all principals with whom the resource is shared.

``` swift
public func putContainerRecipePolicy(input: PutContainerRecipePolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutContainerRecipePolicyOutputResponse, PutContainerRecipePolicyOutputError>) -> Void)
```

### `putImagePolicy(input:completion:)`

Applies a policy to an image. We recommend that you call the RAM API [CreateResourceShare](https://docs.aws.amazon.com/ram/latest/APIReference/API_CreateResourceShare.html) to share resources. If you call the Image Builder API PutImagePolicy, you must also call the RAM API [PromoteResourceShareCreatedFromPolicy](https://docs.aws.amazon.com/ram/latest/APIReference/API_PromoteResourceShareCreatedFromPolicy.html) in order for the resource to be visible to all principals with whom the resource is shared.

``` swift
public func putImagePolicy(input: PutImagePolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutImagePolicyOutputResponse, PutImagePolicyOutputError>) -> Void)
```

### `putImageRecipePolicy(input:completion:)`

Applies a policy to an image recipe. We recommend that you call the RAM API [CreateResourceShare](https://docs.aws.amazon.com/ram/latest/APIReference/API_CreateResourceShare.html) to share resources. If you call the Image Builder API PutImageRecipePolicy, you must also call the RAM API [PromoteResourceShareCreatedFromPolicy](https://docs.aws.amazon.com/ram/latest/APIReference/API_PromoteResourceShareCreatedFromPolicy.html) in order for the resource to be visible to all principals with whom the resource is shared.

``` swift
public func putImageRecipePolicy(input: PutImageRecipePolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutImageRecipePolicyOutputResponse, PutImageRecipePolicyOutputError>) -> Void)
```

### `startImagePipelineExecution(input:completion:)`

Manually triggers a pipeline to create an image.

``` swift
public func startImagePipelineExecution(input: StartImagePipelineExecutionInput, completion: @escaping (ClientRuntime.SdkResult<StartImagePipelineExecutionOutputResponse, StartImagePipelineExecutionOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Adds a tag to a resource.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes a tag from a resource.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateDistributionConfiguration(input:completion:)`

Updates a new distribution configuration. Distribution configurations define and configure the outputs of your pipeline.

``` swift
public func updateDistributionConfiguration(input: UpdateDistributionConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDistributionConfigurationOutputResponse, UpdateDistributionConfigurationOutputError>) -> Void)
```

### `updateImagePipeline(input:completion:)`

Updates an image pipeline. Image pipelines enable you to automate the creation and distribution of images. UpdateImagePipeline does not support selective updates for the pipeline. You must specify all of the required properties in the update request, not just the properties that have changed.

``` swift
public func updateImagePipeline(input: UpdateImagePipelineInput, completion: @escaping (ClientRuntime.SdkResult<UpdateImagePipelineOutputResponse, UpdateImagePipelineOutputError>) -> Void)
```

### `updateInfrastructureConfiguration(input:completion:)`

Updates a new infrastructure configuration. An infrastructure configuration defines the environment in which your image will be built and tested.

``` swift
public func updateInfrastructureConfiguration(input: UpdateInfrastructureConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateInfrastructureConfigurationOutputResponse, UpdateInfrastructureConfigurationOutputError>) -> Void)
```
