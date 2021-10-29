# AppIntegrationsClient

``` swift
public class AppIntegrationsClient 
```

## Inheritance

[`AppIntegrationsClientProtocol`](/aws-sdk-swift/reference/0.x/AWSAppIntegrations/AppIntegrationsClientProtocol)

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
public static let clientName = "AppIntegrationsClient"
```

## Methods

### `createDataIntegration(input:completion:)`

Creates and persists a DataIntegration resource. You cannot create a DataIntegration association for a DataIntegration that has been previously associated. Use a different DataIntegration, or recreate the DataIntegration using the CreateDataIntegration API.

``` swift
public func createDataIntegration(input: CreateDataIntegrationInput, completion: @escaping (ClientRuntime.SdkResult<CreateDataIntegrationOutputResponse, CreateDataIntegrationOutputError>) -> Void)
```

### `createEventIntegration(input:completion:)`

Creates an EventIntegration, given a specified name, description, and a reference to an Amazon EventBridge bus in your account and a partner event source that pushes events to that bus. No objects are created in the your account, only metadata that is persisted on the EventIntegration control plane.

``` swift
public func createEventIntegration(input: CreateEventIntegrationInput, completion: @escaping (ClientRuntime.SdkResult<CreateEventIntegrationOutputResponse, CreateEventIntegrationOutputError>) -> Void)
```

### `deleteDataIntegration(input:completion:)`

Deletes the DataIntegration. Only DataIntegrations that don't have any DataIntegrationAssociations can be deleted. Deleting a DataIntegration also deletes the underlying Amazon AppFlow flow and service linked role. You cannot create a DataIntegration association for a DataIntegration that has been previously associated. Use a different DataIntegration, or recreate the DataIntegration using the [CreateDataIntegration](https://docs.aws.amazon.com/appintegrations/latest/APIReference/API_CreateDataIntegration.html) API.

``` swift
public func deleteDataIntegration(input: DeleteDataIntegrationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDataIntegrationOutputResponse, DeleteDataIntegrationOutputError>) -> Void)
```

### `deleteEventIntegration(input:completion:)`

Deletes the specified existing event integration. If the event integration is associated with clients, the request is rejected.

``` swift
public func deleteEventIntegration(input: DeleteEventIntegrationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteEventIntegrationOutputResponse, DeleteEventIntegrationOutputError>) -> Void)
```

### `getDataIntegration(input:completion:)`

Returns information about the DataIntegration. You cannot create a DataIntegration association for a DataIntegration that has been previously associated. Use a different DataIntegration, or recreate the DataIntegration using the [CreateDataIntegration](https://docs.aws.amazon.com/appintegrations/latest/APIReference/API_CreateDataIntegration.html) API.

``` swift
public func getDataIntegration(input: GetDataIntegrationInput, completion: @escaping (ClientRuntime.SdkResult<GetDataIntegrationOutputResponse, GetDataIntegrationOutputError>) -> Void)
```

### `getEventIntegration(input:completion:)`

Returns information about the event integration.

``` swift
public func getEventIntegration(input: GetEventIntegrationInput, completion: @escaping (ClientRuntime.SdkResult<GetEventIntegrationOutputResponse, GetEventIntegrationOutputError>) -> Void)
```

### `listDataIntegrationAssociations(input:completion:)`

Returns a paginated list of DataIntegration associations in the account. You cannot create a DataIntegration association for a DataIntegration that has been previously associated. Use a different DataIntegration, or recreate the DataIntegration using the [CreateDataIntegration](https://docs.aws.amazon.com/appintegrations/latest/APIReference/API_CreateDataIntegration.html) API.

``` swift
public func listDataIntegrationAssociations(input: ListDataIntegrationAssociationsInput, completion: @escaping (ClientRuntime.SdkResult<ListDataIntegrationAssociationsOutputResponse, ListDataIntegrationAssociationsOutputError>) -> Void)
```

### `listDataIntegrations(input:completion:)`

Returns a paginated list of DataIntegrations in the account. You cannot create a DataIntegration association for a DataIntegration that has been previously associated. Use a different DataIntegration, or recreate the DataIntegration using the [CreateDataIntegration](https://docs.aws.amazon.com/appintegrations/latest/APIReference/API_CreateDataIntegration.html) API.

``` swift
public func listDataIntegrations(input: ListDataIntegrationsInput, completion: @escaping (ClientRuntime.SdkResult<ListDataIntegrationsOutputResponse, ListDataIntegrationsOutputError>) -> Void)
```

### `listEventIntegrationAssociations(input:completion:)`

Returns a paginated list of event integration associations in the account.

``` swift
public func listEventIntegrationAssociations(input: ListEventIntegrationAssociationsInput, completion: @escaping (ClientRuntime.SdkResult<ListEventIntegrationAssociationsOutputResponse, ListEventIntegrationAssociationsOutputError>) -> Void)
```

### `listEventIntegrations(input:completion:)`

Returns a paginated list of event integrations in the account.

``` swift
public func listEventIntegrations(input: ListEventIntegrationsInput, completion: @escaping (ClientRuntime.SdkResult<ListEventIntegrationsOutputResponse, ListEventIntegrationsOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Lists the tags for the specified resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Adds the specified tags to the specified resource.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes the specified tags from the specified resource.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateDataIntegration(input:completion:)`

Updates the description of a DataIntegration. You cannot create a DataIntegration association for a DataIntegration that has been previously associated. Use a different DataIntegration, or recreate the DataIntegration using the [CreateDataIntegration](https://docs.aws.amazon.com/appintegrations/latest/APIReference/API_CreateDataIntegration.html) API.

``` swift
public func updateDataIntegration(input: UpdateDataIntegrationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDataIntegrationOutputResponse, UpdateDataIntegrationOutputError>) -> Void)
```

### `updateEventIntegration(input:completion:)`

Updates the description of an event integration.

``` swift
public func updateEventIntegration(input: UpdateEventIntegrationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateEventIntegrationOutputResponse, UpdateEventIntegrationOutputError>) -> Void)
```
