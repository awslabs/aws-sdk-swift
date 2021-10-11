# FinspaceClient

``` swift
public class FinspaceClient 
```

## Inheritance

[`FinspaceClientProtocol`](/aws-sdk-swift/reference/0.x/AWSFinspace/FinspaceClientProtocol)

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

### `createEnvironment(input:completion:)`

Create a new FinSpace environment.

``` swift
public func createEnvironment(input: CreateEnvironmentInput, completion: @escaping (ClientRuntime.SdkResult<CreateEnvironmentOutputResponse, CreateEnvironmentOutputError>) -> Void)
```

### `deleteEnvironment(input:completion:)`

Delete an FinSpace environment.

``` swift
public func deleteEnvironment(input: DeleteEnvironmentInput, completion: @escaping (ClientRuntime.SdkResult<DeleteEnvironmentOutputResponse, DeleteEnvironmentOutputError>) -> Void)
```

### `getEnvironment(input:completion:)`

Returns the FinSpace environment object.

``` swift
public func getEnvironment(input: GetEnvironmentInput, completion: @escaping (ClientRuntime.SdkResult<GetEnvironmentOutputResponse, GetEnvironmentOutputError>) -> Void)
```

### `listEnvironments(input:completion:)`

A list of all of your FinSpace environments.

``` swift
public func listEnvironments(input: ListEnvironmentsInput, completion: @escaping (ClientRuntime.SdkResult<ListEnvironmentsOutputResponse, ListEnvironmentsOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

A list of all tags for a resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Adds metadata tags to a FinSpace resource.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes metadata tags from a FinSpace resource.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateEnvironment(input:completion:)`

Update your FinSpace environment.

``` swift
public func updateEnvironment(input: UpdateEnvironmentInput, completion: @escaping (ClientRuntime.SdkResult<UpdateEnvironmentOutputResponse, UpdateEnvironmentOutputError>) -> Void)
```
