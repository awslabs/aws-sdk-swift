# ServiceCatalogAppRegistryClient

``` swift
public class ServiceCatalogAppRegistryClient 
```

## Inheritance

[`ServiceCatalogAppRegistryClientProtocol`](/aws-sdk-swift/reference/0.x/AWSServiceCatalogAppRegistry/ServiceCatalogAppRegistryClientProtocol)

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
public static let clientName = "ServiceCatalogAppRegistryClient"
```

## Methods

### `associateAttributeGroup(input:completion:)`

Associates an attribute group with an application to augment the application's metadata with the group's attributes. This feature enables applications to be described with user-defined details that are machine-readable, such as third-party integrations.

``` swift
public func associateAttributeGroup(input: AssociateAttributeGroupInput, completion: @escaping (ClientRuntime.SdkResult<AssociateAttributeGroupOutputResponse, AssociateAttributeGroupOutputError>) -> Void)
```

### `associateResource(input:completion:)`

Associates a resource with an application. Both the resource and the application can be specified either by ID or name.

``` swift
public func associateResource(input: AssociateResourceInput, completion: @escaping (ClientRuntime.SdkResult<AssociateResourceOutputResponse, AssociateResourceOutputError>) -> Void)
```

### `createApplication(input:completion:)`

Creates a new application that is the top-level node in a hierarchy of related cloud resource abstractions.

``` swift
public func createApplication(input: CreateApplicationInput, completion: @escaping (ClientRuntime.SdkResult<CreateApplicationOutputResponse, CreateApplicationOutputError>) -> Void)
```

### `createAttributeGroup(input:completion:)`

Creates a new attribute group as a container for user-defined attributes. This feature enables users to have full control over their cloud application's metadata in a rich machine-readable format to facilitate integration with automated workflows and third-party tools.

``` swift
public func createAttributeGroup(input: CreateAttributeGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateAttributeGroupOutputResponse, CreateAttributeGroupOutputError>) -> Void)
```

### `deleteApplication(input:completion:)`

Deletes an application that is specified either by its application ID or name. All associated attribute groups and resources must be disassociated from it before deleting an application.

``` swift
public func deleteApplication(input: DeleteApplicationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteApplicationOutputResponse, DeleteApplicationOutputError>) -> Void)
```

### `deleteAttributeGroup(input:completion:)`

Deletes an attribute group, specified either by its attribute group ID or name.

``` swift
public func deleteAttributeGroup(input: DeleteAttributeGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAttributeGroupOutputResponse, DeleteAttributeGroupOutputError>) -> Void)
```

### `disassociateAttributeGroup(input:completion:)`

Disassociates an attribute group from an application to remove the extra attributes contained in the attribute group from the application's metadata. This operation reverts AssociateAttributeGroup.

``` swift
public func disassociateAttributeGroup(input: DisassociateAttributeGroupInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateAttributeGroupOutputResponse, DisassociateAttributeGroupOutputError>) -> Void)
```

### `disassociateResource(input:completion:)`

Disassociates a resource from application. Both the resource and the application can be specified either by ID or name.

``` swift
public func disassociateResource(input: DisassociateResourceInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateResourceOutputResponse, DisassociateResourceOutputError>) -> Void)
```

### `getApplication(input:completion:)`

Retrieves metadata information about one of your applications. The application can be specified either by its unique ID or by its name (which is unique within one account in one region at a given point in time). Specify by ID in automated workflows if you want to make sure that the exact same application is returned or a ResourceNotFoundException is thrown, avoiding the ABA addressing problem.

``` swift
public func getApplication(input: GetApplicationInput, completion: @escaping (ClientRuntime.SdkResult<GetApplicationOutputResponse, GetApplicationOutputError>) -> Void)
```

### `getAssociatedResource(input:completion:)`

Gets the resource associated with the application.

``` swift
public func getAssociatedResource(input: GetAssociatedResourceInput, completion: @escaping (ClientRuntime.SdkResult<GetAssociatedResourceOutputResponse, GetAssociatedResourceOutputError>) -> Void)
```

### `getAttributeGroup(input:completion:)`

Retrieves an attribute group, either by its name or its ID. The attribute group can be specified either by its unique ID or by its name.

``` swift
public func getAttributeGroup(input: GetAttributeGroupInput, completion: @escaping (ClientRuntime.SdkResult<GetAttributeGroupOutputResponse, GetAttributeGroupOutputError>) -> Void)
```

### `listApplications(input:completion:)`

Retrieves a list of all of your applications. Results are paginated.

``` swift
public func listApplications(input: ListApplicationsInput, completion: @escaping (ClientRuntime.SdkResult<ListApplicationsOutputResponse, ListApplicationsOutputError>) -> Void)
```

### `listAssociatedAttributeGroups(input:completion:)`

Lists all attribute groups that are associated with specified application. Results are paginated.

``` swift
public func listAssociatedAttributeGroups(input: ListAssociatedAttributeGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListAssociatedAttributeGroupsOutputResponse, ListAssociatedAttributeGroupsOutputError>) -> Void)
```

### `listAssociatedResources(input:completion:)`

Lists all resources that are associated with specified application. Results are paginated.

``` swift
public func listAssociatedResources(input: ListAssociatedResourcesInput, completion: @escaping (ClientRuntime.SdkResult<ListAssociatedResourcesOutputResponse, ListAssociatedResourcesOutputError>) -> Void)
```

### `listAttributeGroups(input:completion:)`

Lists all attribute groups which you have access to. Results are paginated.

``` swift
public func listAttributeGroups(input: ListAttributeGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListAttributeGroupsOutputResponse, ListAttributeGroupsOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Lists all of the tags on the resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `syncResource(input:completion:)`

Syncs the resource with current AppRegistry records. Specifically, the resource’s AppRegistry system tags sync with its associated application. We remove the resource's AppRegistry system tags if it does not associate with the application. The caller must have permissions to read and update the resource.

``` swift
public func syncResource(input: SyncResourceInput, completion: @escaping (ClientRuntime.SdkResult<SyncResourceOutputResponse, SyncResourceOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Assigns one or more tags (key-value pairs) to the specified resource. Each tag consists of a key and an optional value. If a tag with the same key is already associated with the resource, this action updates its value. This operation returns an empty response if the call was successful.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes tags from a resource. This operation returns an empty response if the call was successful.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateApplication(input:completion:)`

Updates an existing application with new attributes.

``` swift
public func updateApplication(input: UpdateApplicationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateApplicationOutputResponse, UpdateApplicationOutputError>) -> Void)
```

### `updateAttributeGroup(input:completion:)`

Updates an existing attribute group with new details.

``` swift
public func updateAttributeGroup(input: UpdateAttributeGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAttributeGroupOutputResponse, UpdateAttributeGroupOutputError>) -> Void)
```
