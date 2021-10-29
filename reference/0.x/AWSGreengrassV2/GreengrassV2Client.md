# GreengrassV2Client

``` swift
public class GreengrassV2Client 
```

## Inheritance

[`GreengrassV2ClientProtocol`](/aws-sdk-swift/reference/0.x/AWSGreengrassV2/GreengrassV2ClientProtocol)

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
public static let clientName = "GreengrassV2Client"
```

## Methods

### `batchAssociateClientDeviceWithCoreDevice(input:completion:)`

Associate a list of client devices with a core device. Use this API operation to specify which client devices can discover a core device through cloud discovery. With cloud discovery, client devices connect to IoT Greengrass to retrieve associated core devices' connectivity information and certificates. For more information, see [Configure cloud discovery](https://docs.aws.amazon.com/greengrass/v2/developerguide/configure-cloud-discovery.html) in the IoT Greengrass V2 Developer Guide. Client devices are local IoT devices that connect to and communicate with an IoT Greengrass core device over MQTT. You can connect client devices to a core device to sync MQTT messages and data to Amazon Web Services IoT Core and interact with client devices in Greengrass components. For more information, see [Interact with local IoT devices](https://docs.aws.amazon.com/greengrass/v2/developerguide/interact-with-local-iot-devices.html) in the IoT Greengrass V2 Developer Guide.

``` swift
public func batchAssociateClientDeviceWithCoreDevice(input: BatchAssociateClientDeviceWithCoreDeviceInput, completion: @escaping (ClientRuntime.SdkResult<BatchAssociateClientDeviceWithCoreDeviceOutputResponse, BatchAssociateClientDeviceWithCoreDeviceOutputError>) -> Void)
```

### `batchDisassociateClientDeviceFromCoreDevice(input:completion:)`

Disassociate a list of client devices from a core device. After you disassociate a client device from a core device, the client device won't be able to use cloud discovery to retrieve the core device's connectivity information and certificates.

``` swift
public func batchDisassociateClientDeviceFromCoreDevice(input: BatchDisassociateClientDeviceFromCoreDeviceInput, completion: @escaping (ClientRuntime.SdkResult<BatchDisassociateClientDeviceFromCoreDeviceOutputResponse, BatchDisassociateClientDeviceFromCoreDeviceOutputError>) -> Void)
```

### `cancelDeployment(input:completion:)`

Cancels a deployment. This operation cancels the deployment for devices that haven't yet received it. If a device already received the deployment, this operation doesn't change anything for that device.

``` swift
public func cancelDeployment(input: CancelDeploymentInput, completion: @escaping (ClientRuntime.SdkResult<CancelDeploymentOutputResponse, CancelDeploymentOutputError>) -> Void)
```

### `createComponentVersion(input:completion:)`

Creates a component. Components are software that run on Greengrass core devices. After you develop and test a component on your core device, you can use this operation to upload your component to IoT Greengrass. Then, you can deploy the component to other core devices. You can use this operation to do the following:

``` swift
public func createComponentVersion(input: CreateComponentVersionInput, completion: @escaping (ClientRuntime.SdkResult<CreateComponentVersionOutputResponse, CreateComponentVersionOutputError>) -> Void)
```

  - Create components from recipes Create a component from a recipe, which is a file that defines the component's metadata, parameters, dependencies, lifecycle, artifacts, and platform capability. For more information, see [IoT Greengrass component recipe reference](https://docs.aws.amazon.com/greengrass/v2/developerguide/component-recipe-reference.html) in the IoT Greengrass V2 Developer Guide. To create a component from a recipe, specify inlineRecipe when you call this operation.

  - Create components from Lambda functions Create a component from an Lambda function that runs on IoT Greengrass. This creates a recipe and artifacts from the Lambda function's deployment package. You can use this operation to migrate Lambda functions from IoT Greengrass V1 to IoT Greengrass V2. This function only accepts Lambda functions that use the following runtimes:

  - Python 2.7 – python2.7

  - Python 3.7 – python3.7

  - Python 3.8 – python3.8

  - Java 8 – java8

  - Node.js 10 – nodejs10.x

  - Node.js 12 – nodejs12.x

To create a component from a Lambda function, specify lambdaFunction when you call this operation.

### `createDeployment(input:completion:)`

Creates a continuous deployment for a target, which is a Greengrass core device or group of core devices. When you add a new core device to a group of core devices that has a deployment, IoT Greengrass deploys that group's deployment to the new device. You can define one deployment for each target. When you create a new deployment for a target that has an existing deployment, you replace the previous deployment. IoT Greengrass applies the new deployment to the target devices. Every deployment has a revision number that indicates how many deployment revisions you define for a target. Use this operation to create a new revision of an existing deployment. This operation returns the revision number of the new deployment when you create it. For more information, see the [Create deployments](https://docs.aws.amazon.com/greengrass/v2/developerguide/create-deployments.html) in the IoT Greengrass V2 Developer Guide.

``` swift
public func createDeployment(input: CreateDeploymentInput, completion: @escaping (ClientRuntime.SdkResult<CreateDeploymentOutputResponse, CreateDeploymentOutputError>) -> Void)
```

### `deleteComponent(input:completion:)`

Deletes a version of a component from IoT Greengrass. This operation deletes the component's recipe and artifacts. As a result, deployments that refer to this component version will fail. If you have deployments that use this component version, you can remove the component from the deployment or update the deployment to use a valid version.

``` swift
public func deleteComponent(input: DeleteComponentInput, completion: @escaping (ClientRuntime.SdkResult<DeleteComponentOutputResponse, DeleteComponentOutputError>) -> Void)
```

### `deleteCoreDevice(input:completion:)`

Deletes a Greengrass core device, which is an IoT thing. This operation removes the core device from the list of core devices. This operation doesn't delete the IoT thing. For more information about how to delete the IoT thing, see [DeleteThing](https://docs.aws.amazon.com/iot/latest/apireference/API_DeleteThing.html) in the IoT API Reference.

``` swift
public func deleteCoreDevice(input: DeleteCoreDeviceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCoreDeviceOutputResponse, DeleteCoreDeviceOutputError>) -> Void)
```

### `describeComponent(input:completion:)`

Retrieves metadata for a version of a component.

``` swift
public func describeComponent(input: DescribeComponentInput, completion: @escaping (ClientRuntime.SdkResult<DescribeComponentOutputResponse, DescribeComponentOutputError>) -> Void)
```

### `getComponent(input:completion:)`

Gets the recipe for a version of a component. Core devices can call this operation to identify the artifacts and requirements to install a component.

``` swift
public func getComponent(input: GetComponentInput, completion: @escaping (ClientRuntime.SdkResult<GetComponentOutputResponse, GetComponentOutputError>) -> Void)
```

### `getComponentVersionArtifact(input:completion:)`

Gets the pre-signed URL to download a public component artifact. Core devices call this operation to identify the URL that they can use to download an artifact to install.

``` swift
public func getComponentVersionArtifact(input: GetComponentVersionArtifactInput, completion: @escaping (ClientRuntime.SdkResult<GetComponentVersionArtifactOutputResponse, GetComponentVersionArtifactOutputError>) -> Void)
```

### `getCoreDevice(input:completion:)`

Retrieves metadata for a Greengrass core device.

``` swift
public func getCoreDevice(input: GetCoreDeviceInput, completion: @escaping (ClientRuntime.SdkResult<GetCoreDeviceOutputResponse, GetCoreDeviceOutputError>) -> Void)
```

### `getDeployment(input:completion:)`

Gets a deployment. Deployments define the components that run on Greengrass core devices.

``` swift
public func getDeployment(input: GetDeploymentInput, completion: @escaping (ClientRuntime.SdkResult<GetDeploymentOutputResponse, GetDeploymentOutputError>) -> Void)
```

### `listClientDevicesAssociatedWithCoreDevice(input:completion:)`

Retrieves a paginated list of client devices that are associated with a core device.

``` swift
public func listClientDevicesAssociatedWithCoreDevice(input: ListClientDevicesAssociatedWithCoreDeviceInput, completion: @escaping (ClientRuntime.SdkResult<ListClientDevicesAssociatedWithCoreDeviceOutputResponse, ListClientDevicesAssociatedWithCoreDeviceOutputError>) -> Void)
```

### `listComponentVersions(input:completion:)`

Retrieves a paginated list of all versions for a component. Greater versions are listed first.

``` swift
public func listComponentVersions(input: ListComponentVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListComponentVersionsOutputResponse, ListComponentVersionsOutputError>) -> Void)
```

### `listComponents(input:completion:)`

Retrieves a paginated list of component summaries. This list includes components that you have permission to view.

``` swift
public func listComponents(input: ListComponentsInput, completion: @escaping (ClientRuntime.SdkResult<ListComponentsOutputResponse, ListComponentsOutputError>) -> Void)
```

### `listCoreDevices(input:completion:)`

Retrieves a paginated list of Greengrass core devices.

``` swift
public func listCoreDevices(input: ListCoreDevicesInput, completion: @escaping (ClientRuntime.SdkResult<ListCoreDevicesOutputResponse, ListCoreDevicesOutputError>) -> Void)
```

### `listDeployments(input:completion:)`

Retrieves a paginated list of deployments.

``` swift
public func listDeployments(input: ListDeploymentsInput, completion: @escaping (ClientRuntime.SdkResult<ListDeploymentsOutputResponse, ListDeploymentsOutputError>) -> Void)
```

### `listEffectiveDeployments(input:completion:)`

Retrieves a paginated list of deployment jobs that IoT Greengrass sends to Greengrass core devices.

``` swift
public func listEffectiveDeployments(input: ListEffectiveDeploymentsInput, completion: @escaping (ClientRuntime.SdkResult<ListEffectiveDeploymentsOutputResponse, ListEffectiveDeploymentsOutputError>) -> Void)
```

### `listInstalledComponents(input:completion:)`

Retrieves a paginated list of the components that a Greengrass core device runs.

``` swift
public func listInstalledComponents(input: ListInstalledComponentsInput, completion: @escaping (ClientRuntime.SdkResult<ListInstalledComponentsOutputResponse, ListInstalledComponentsOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Retrieves the list of tags for an IoT Greengrass resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `resolveComponentCandidates(input:completion:)`

Retrieves a list of components that meet the component, version, and platform requirements of a deployment. Greengrass core devices call this operation when they receive a deployment to identify the components to install. This operation identifies components that meet all dependency requirements for a deployment. If the requirements conflict, then this operation returns an error and the deployment fails. For example, this occurs if component A requires version \>2.0.0 and component B requires version \<2.0.0 of a component dependency. When you specify the component candidates to resolve, IoT Greengrass compares each component's digest from the core device with the component's digest in the Amazon Web Services Cloud. If the digests don't match, then IoT Greengrass specifies to use the version from the Amazon Web Services Cloud. To use this operation, you must use the data plane API endpoint and authenticate with an IoT device certificate. For more information, see [IoT Greengrass endpoints and quotas](https://docs.aws.amazon.com/general/latest/gr/greengrass.html).

``` swift
public func resolveComponentCandidates(input: ResolveComponentCandidatesInput, completion: @escaping (ClientRuntime.SdkResult<ResolveComponentCandidatesOutputResponse, ResolveComponentCandidatesOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Adds tags to an IoT Greengrass resource. If a tag already exists for the resource, this operation updates the tag's value.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes a tag from an IoT Greengrass resource.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```
