# CodeStarConnectionsClient

``` swift
public class CodeStarConnectionsClient 
```

## Inheritance

[`CodeStarConnectionsClientProtocol`](/aws-sdk-swift/reference/0.x/AWSCodeStarconnections/CodeStarConnectionsClientProtocol)

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

### `createConnection(input:completion:)`

Creates a connection that can then be given to other AWS services like CodePipeline so
that it can access third-party code repositories. The connection is in pending status until
the third-party connection handshake is completed from the console.

``` swift
public func createConnection(input: CreateConnectionInput, completion: @escaping (ClientRuntime.SdkResult<CreateConnectionOutputResponse, CreateConnectionOutputError>) -> Void)
```

### `createHost(input:completion:)`

Creates a resource that represents the infrastructure where a third-party provider is
installed. The host is used when you create connections to an installed third-party provider
type, such as GitHub Enterprise Server. You create one host for all connections to that
provider.

``` swift
public func createHost(input: CreateHostInput, completion: @escaping (ClientRuntime.SdkResult<CreateHostOutputResponse, CreateHostOutputError>) -> Void)
```

``` 
        A host created through the CLI or the SDK is in `PENDING` status by
    default. You can make its status `AVAILABLE` by setting up the host in the console.
```

### `deleteConnection(input:completion:)`

The connection to be deleted.

``` swift
public func deleteConnection(input: DeleteConnectionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteConnectionOutputResponse, DeleteConnectionOutputError>) -> Void)
```

### `deleteHost(input:completion:)`

The host to be deleted. Before you delete a host, all connections associated to the host must be deleted.

``` swift
public func deleteHost(input: DeleteHostInput, completion: @escaping (ClientRuntime.SdkResult<DeleteHostOutputResponse, DeleteHostOutputError>) -> Void)
```

``` 
        A host cannot be deleted if it is in the VPC_CONFIG_INITIALIZING or VPC_CONFIG_DELETING state.
```

### `getConnection(input:completion:)`

Returns the connection ARN and details such as status, owner, and provider type.

``` swift
public func getConnection(input: GetConnectionInput, completion: @escaping (ClientRuntime.SdkResult<GetConnectionOutputResponse, GetConnectionOutputError>) -> Void)
```

### `getHost(input:completion:)`

Returns the host ARN and details such as status, provider type, endpoint, and, if
applicable, the VPC configuration.

``` swift
public func getHost(input: GetHostInput, completion: @escaping (ClientRuntime.SdkResult<GetHostOutputResponse, GetHostOutputError>) -> Void)
```

### `listConnections(input:completion:)`

Lists the connections associated with your account.

``` swift
public func listConnections(input: ListConnectionsInput, completion: @escaping (ClientRuntime.SdkResult<ListConnectionsOutputResponse, ListConnectionsOutputError>) -> Void)
```

### `listHosts(input:completion:)`

Lists the hosts associated with your account.

``` swift
public func listHosts(input: ListHostsInput, completion: @escaping (ClientRuntime.SdkResult<ListHostsOutputResponse, ListHostsOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Gets the set of key-value pairs (metadata) that are used to manage the resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Adds to or modifies the tags of the given resource. Tags are metadata that can be used
to manage a resource.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes tags from an AWS resource.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateHost(input:completion:)`

Updates a specified host with the provided configurations.

``` swift
public func updateHost(input: UpdateHostInput, completion: @escaping (ClientRuntime.SdkResult<UpdateHostOutputResponse, UpdateHostOutputError>) -> Void)
```
