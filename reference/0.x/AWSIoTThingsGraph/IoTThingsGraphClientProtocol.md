# IoTThingsGraphClientProtocol

AWS IoT Things Graph AWS IoT Things Graph provides an integrated set of tools that enable developers to connect devices and services that use different standards, such as units of measure and communication protocols. AWS IoT Things Graph makes it possible to build IoT applications with little to no code by connecting devices and services and defining how they interact at an abstract level. For more information about how AWS IoT Things Graph works, see the [User Guide](https://docs.aws.amazon.com/thingsgraph/latest/ug/iot-tg-whatis.html).

``` swift
public protocol IoTThingsGraphClientProtocol 
```

## Requirements

### associateEntityToThing(input:completion:)

Associates a device with a concrete thing that is in the user's registry. A thing can be associated with only one device at a time. If you associate a thing with a new device id, its previous association will be removed.

``` swift
func associateEntityToThing(input: AssociateEntityToThingInput, completion: @escaping (ClientRuntime.SdkResult<AssociateEntityToThingOutputResponse, AssociateEntityToThingOutputError>) -> Void)
```

### createFlowTemplate(input:completion:)

Creates a workflow template. Workflows can be created only in the user's namespace. (The public namespace contains only entities.) The workflow can contain only entities in the specified namespace. The workflow is validated against the entities in the latest version of the user's namespace unless another namespace version is specified in the request.

``` swift
func createFlowTemplate(input: CreateFlowTemplateInput, completion: @escaping (ClientRuntime.SdkResult<CreateFlowTemplateOutputResponse, CreateFlowTemplateOutputError>) -> Void)
```

### createSystemInstance(input:completion:)

Creates a system instance. This action validates the system instance, prepares the deployment-related resources. For Greengrass deployments, it updates the Greengrass group that is specified by the greengrassGroupName parameter. It also adds a file to the S3 bucket specified by the s3BucketName parameter. You need to call DeploySystemInstance after running this action. For Greengrass deployments, since this action modifies and adds resources to a Greengrass group and an S3 bucket on the caller's behalf, the calling identity must have write permissions to both the specified Greengrass group and S3 bucket. Otherwise, the call will fail with an authorization error. For cloud deployments, this action requires a flowActionsRoleArn value. This is an IAM role that has permissions to access AWS services, such as AWS Lambda and AWS IoT, that the flow uses when it executes. If the definition document doesn't specify a version of the user's namespace, the latest version will be used by default.

``` swift
func createSystemInstance(input: CreateSystemInstanceInput, completion: @escaping (ClientRuntime.SdkResult<CreateSystemInstanceOutputResponse, CreateSystemInstanceOutputError>) -> Void)
```

### createSystemTemplate(input:completion:)

Creates a system. The system is validated against the entities in the latest version of the user's namespace unless another namespace version is specified in the request.

``` swift
func createSystemTemplate(input: CreateSystemTemplateInput, completion: @escaping (ClientRuntime.SdkResult<CreateSystemTemplateOutputResponse, CreateSystemTemplateOutputError>) -> Void)
```

### deleteFlowTemplate(input:completion:)

Deletes a workflow. Any new system or deployment that contains this workflow will fail to update or deploy. Existing deployments that contain the workflow will continue to run (since they use a snapshot of the workflow taken at the time of deployment).

``` swift
func deleteFlowTemplate(input: DeleteFlowTemplateInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFlowTemplateOutputResponse, DeleteFlowTemplateOutputError>) -> Void)
```

### deleteNamespace(input:completion:)

Deletes the specified namespace. This action deletes all of the entities in the namespace. Delete the systems and flows that use entities in the namespace before performing this action.

``` swift
func deleteNamespace(input: DeleteNamespaceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteNamespaceOutputResponse, DeleteNamespaceOutputError>) -> Void)
```

### deleteSystemInstance(input:completion:)

Deletes a system instance. Only system instances that have never been deployed, or that have been undeployed can be deleted. Users can create a new system instance that has the same ID as a deleted system instance.

``` swift
func deleteSystemInstance(input: DeleteSystemInstanceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSystemInstanceOutputResponse, DeleteSystemInstanceOutputError>) -> Void)
```

### deleteSystemTemplate(input:completion:)

Deletes a system. New deployments can't contain the system after its deletion. Existing deployments that contain the system will continue to work because they use a snapshot of the system that is taken when it is deployed.

``` swift
func deleteSystemTemplate(input: DeleteSystemTemplateInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSystemTemplateOutputResponse, DeleteSystemTemplateOutputError>) -> Void)
```

### deploySystemInstance(input:completion:)

Greengrass and Cloud Deployments Deploys the system instance to the target specified in CreateSystemInstance. Greengrass Deployments If the system or any workflows and entities have been updated before this action is called, then the deployment will create a new Amazon Simple Storage Service resource file and then deploy it. Since this action creates a Greengrass deployment on the caller's behalf, the calling identity must have write permissions to the specified Greengrass group. Otherwise, the call will fail with an authorization error. For information about the artifacts that get added to your Greengrass core device when you use this API, see [AWS IoT Things Graph and AWS IoT Greengrass](https://docs.aws.amazon.com/thingsgraph/latest/ug/iot-tg-greengrass.html).

``` swift
func deploySystemInstance(input: DeploySystemInstanceInput, completion: @escaping (ClientRuntime.SdkResult<DeploySystemInstanceOutputResponse, DeploySystemInstanceOutputError>) -> Void)
```

### deprecateFlowTemplate(input:completion:)

Deprecates the specified workflow. This action marks the workflow for deletion. Deprecated flows can't be deployed, but existing deployments will continue to run.

``` swift
func deprecateFlowTemplate(input: DeprecateFlowTemplateInput, completion: @escaping (ClientRuntime.SdkResult<DeprecateFlowTemplateOutputResponse, DeprecateFlowTemplateOutputError>) -> Void)
```

### deprecateSystemTemplate(input:completion:)

Deprecates the specified system.

``` swift
func deprecateSystemTemplate(input: DeprecateSystemTemplateInput, completion: @escaping (ClientRuntime.SdkResult<DeprecateSystemTemplateOutputResponse, DeprecateSystemTemplateOutputError>) -> Void)
```

### describeNamespace(input:completion:)

Gets the latest version of the user's namespace and the public version that it is tracking.

``` swift
func describeNamespace(input: DescribeNamespaceInput, completion: @escaping (ClientRuntime.SdkResult<DescribeNamespaceOutputResponse, DescribeNamespaceOutputError>) -> Void)
```

### dissociateEntityFromThing(input:completion:)

Dissociates a device entity from a concrete thing. The action takes only the type of the entity that you need to dissociate because only one entity of a particular type can be associated with a thing.

``` swift
func dissociateEntityFromThing(input: DissociateEntityFromThingInput, completion: @escaping (ClientRuntime.SdkResult<DissociateEntityFromThingOutputResponse, DissociateEntityFromThingOutputError>) -> Void)
```

### getEntities(input:completion:)

Gets definitions of the specified entities. Uses the latest version of the user's namespace by default. This API returns the following TDM entities.

``` swift
func getEntities(input: GetEntitiesInput, completion: @escaping (ClientRuntime.SdkResult<GetEntitiesOutputResponse, GetEntitiesOutputError>) -> Void)
```

  - Properties

  - States

  - Events

  - Actions

  - Capabilities

  - Mappings

  - Devices

  - Device Models

  - Services

This action doesn't return definitions for systems, flows, and deployments.

### getFlowTemplate(input:completion:)

Gets the latest version of the DefinitionDocument and FlowTemplateSummary for the specified workflow.

``` swift
func getFlowTemplate(input: GetFlowTemplateInput, completion: @escaping (ClientRuntime.SdkResult<GetFlowTemplateOutputResponse, GetFlowTemplateOutputError>) -> Void)
```

### getFlowTemplateRevisions(input:completion:)

Gets revisions of the specified workflow. Only the last 100 revisions are stored. If the workflow has been deprecated, this action will return revisions that occurred before the deprecation. This action won't work for workflows that have been deleted.

``` swift
func getFlowTemplateRevisions(input: GetFlowTemplateRevisionsInput, completion: @escaping (ClientRuntime.SdkResult<GetFlowTemplateRevisionsOutputResponse, GetFlowTemplateRevisionsOutputError>) -> Void)
```

### getNamespaceDeletionStatus(input:completion:)

Gets the status of a namespace deletion task.

``` swift
func getNamespaceDeletionStatus(input: GetNamespaceDeletionStatusInput, completion: @escaping (ClientRuntime.SdkResult<GetNamespaceDeletionStatusOutputResponse, GetNamespaceDeletionStatusOutputError>) -> Void)
```

### getSystemInstance(input:completion:)

Gets a system instance.

``` swift
func getSystemInstance(input: GetSystemInstanceInput, completion: @escaping (ClientRuntime.SdkResult<GetSystemInstanceOutputResponse, GetSystemInstanceOutputError>) -> Void)
```

### getSystemTemplate(input:completion:)

Gets a system.

``` swift
func getSystemTemplate(input: GetSystemTemplateInput, completion: @escaping (ClientRuntime.SdkResult<GetSystemTemplateOutputResponse, GetSystemTemplateOutputError>) -> Void)
```

### getSystemTemplateRevisions(input:completion:)

Gets revisions made to the specified system template. Only the previous 100 revisions are stored. If the system has been deprecated, this action will return the revisions that occurred before its deprecation. This action won't work with systems that have been deleted.

``` swift
func getSystemTemplateRevisions(input: GetSystemTemplateRevisionsInput, completion: @escaping (ClientRuntime.SdkResult<GetSystemTemplateRevisionsOutputResponse, GetSystemTemplateRevisionsOutputError>) -> Void)
```

### getUploadStatus(input:completion:)

Gets the status of the specified upload.

``` swift
func getUploadStatus(input: GetUploadStatusInput, completion: @escaping (ClientRuntime.SdkResult<GetUploadStatusOutputResponse, GetUploadStatusOutputError>) -> Void)
```

### listFlowExecutionMessages(input:completion:)

Returns a list of objects that contain information about events in a flow execution.

``` swift
func listFlowExecutionMessages(input: ListFlowExecutionMessagesInput, completion: @escaping (ClientRuntime.SdkResult<ListFlowExecutionMessagesOutputResponse, ListFlowExecutionMessagesOutputError>) -> Void)
```

### listTagsForResource(input:completion:)

Lists all tags on an AWS IoT Things Graph resource.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### searchEntities(input:completion:)

Searches for entities of the specified type. You can search for entities in your namespace and the public namespace that you're tracking.

``` swift
func searchEntities(input: SearchEntitiesInput, completion: @escaping (ClientRuntime.SdkResult<SearchEntitiesOutputResponse, SearchEntitiesOutputError>) -> Void)
```

### searchFlowExecutions(input:completion:)

Searches for AWS IoT Things Graph workflow execution instances.

``` swift
func searchFlowExecutions(input: SearchFlowExecutionsInput, completion: @escaping (ClientRuntime.SdkResult<SearchFlowExecutionsOutputResponse, SearchFlowExecutionsOutputError>) -> Void)
```

### searchFlowTemplates(input:completion:)

Searches for summary information about workflows.

``` swift
func searchFlowTemplates(input: SearchFlowTemplatesInput, completion: @escaping (ClientRuntime.SdkResult<SearchFlowTemplatesOutputResponse, SearchFlowTemplatesOutputError>) -> Void)
```

### searchSystemInstances(input:completion:)

Searches for system instances in the user's account.

``` swift
func searchSystemInstances(input: SearchSystemInstancesInput, completion: @escaping (ClientRuntime.SdkResult<SearchSystemInstancesOutputResponse, SearchSystemInstancesOutputError>) -> Void)
```

### searchSystemTemplates(input:completion:)

Searches for summary information about systems in the user's account. You can filter by the ID of a workflow to return only systems that use the specified workflow.

``` swift
func searchSystemTemplates(input: SearchSystemTemplatesInput, completion: @escaping (ClientRuntime.SdkResult<SearchSystemTemplatesOutputResponse, SearchSystemTemplatesOutputError>) -> Void)
```

### searchThings(input:completion:)

Searches for things associated with the specified entity. You can search by both device and device model. For example, if two different devices, camera1 and camera2, implement the camera device model, the user can associate thing1 to camera1 and thing2 to camera2. SearchThings(camera2) will return only thing2, but SearchThings(camera) will return both thing1 and thing2. This action searches for exact matches and doesn't perform partial text matching.

``` swift
func searchThings(input: SearchThingsInput, completion: @escaping (ClientRuntime.SdkResult<SearchThingsOutputResponse, SearchThingsOutputError>) -> Void)
```

### tagResource(input:completion:)

Creates a tag for the specified resource.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### undeploySystemInstance(input:completion:)

Removes a system instance from its target (Cloud or Greengrass).

``` swift
func undeploySystemInstance(input: UndeploySystemInstanceInput, completion: @escaping (ClientRuntime.SdkResult<UndeploySystemInstanceOutputResponse, UndeploySystemInstanceOutputError>) -> Void)
```

### untagResource(input:completion:)

Removes a tag from the specified resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateFlowTemplate(input:completion:)

Updates the specified workflow. All deployed systems and system instances that use the workflow will see the changes in the flow when it is redeployed. If you don't want this behavior, copy the workflow (creating a new workflow with a different ID), and update the copy. The workflow can contain only entities in the specified namespace.

``` swift
func updateFlowTemplate(input: UpdateFlowTemplateInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFlowTemplateOutputResponse, UpdateFlowTemplateOutputError>) -> Void)
```

### updateSystemTemplate(input:completion:)

Updates the specified system. You don't need to run this action after updating a workflow. Any deployment that uses the system will see the changes in the system when it is redeployed.

``` swift
func updateSystemTemplate(input: UpdateSystemTemplateInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSystemTemplateOutputResponse, UpdateSystemTemplateOutputError>) -> Void)
```

### uploadEntityDefinitions(input:completion:)

Asynchronously uploads one or more entity definitions to the user's namespace. The document parameter is required if syncWithPublicNamespace and deleteExistingEntites are false. If the syncWithPublicNamespace parameter is set to true, the user's namespace will synchronize with the latest version of the public namespace. If deprecateExistingEntities is set to true, all entities in the latest version will be deleted before the new DefinitionDocument is uploaded. When a user uploads entity definitions for the first time, the service creates a new namespace for the user. The new namespace tracks the public namespace. Currently users can have only one namespace. The namespace version increments whenever a user uploads entity definitions that are backwards-incompatible and whenever a user sets the syncWithPublicNamespace parameter or the deprecateExistingEntities parameter to true. The IDs for all of the entities should be in URN format. Each entity must be in the user's namespace. Users can't create entities in the public namespace, but entity definitions can refer to entities in the public namespace. Valid entities are Device, DeviceModel, Service, Capability, State, Action, Event, Property, Mapping, Enum.

``` swift
func uploadEntityDefinitions(input: UploadEntityDefinitionsInput, completion: @escaping (ClientRuntime.SdkResult<UploadEntityDefinitionsOutputResponse, UploadEntityDefinitionsOutputError>) -> Void)
```
