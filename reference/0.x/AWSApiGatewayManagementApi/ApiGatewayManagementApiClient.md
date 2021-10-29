# ApiGatewayManagementApiClient

``` swift
public class ApiGatewayManagementApiClient 
```

## Inheritance

[`ApiGatewayManagementApiClientProtocol`](/aws-sdk-swift/reference/0.x/AWSApiGatewayManagementApi/ApiGatewayManagementApiClientProtocol)

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
public static let clientName = "ApiGatewayManagementApiClient"
```

## Methods

### `deleteConnection(input:completion:)`

Delete the connection with the provided id.

``` swift
public func deleteConnection(input: DeleteConnectionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteConnectionOutputResponse, DeleteConnectionOutputError>) -> Void)
```

### `getConnection(input:completion:)`

Get information about the connection with the provided id.

``` swift
public func getConnection(input: GetConnectionInput, completion: @escaping (ClientRuntime.SdkResult<GetConnectionOutputResponse, GetConnectionOutputError>) -> Void)
```

### `postToConnection(input:completion:)`

Sends the provided data to the specified connection.

``` swift
public func postToConnection(input: PostToConnectionInput, completion: @escaping (ClientRuntime.SdkResult<PostToConnectionOutputResponse, PostToConnectionOutputError>) -> Void)
```
