# UpdateDeploymentInput

Requests API Gateway to change information about a Deployment resource.

``` swift
public struct UpdateDeploymentInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(deploymentId:patchOperations:restApiId:)`

``` swift
public init (
        deploymentId: Swift.String? = nil,
        patchOperations: [ApiGatewayClientTypes.PatchOperation]? = nil,
        restApiId: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `deploymentId`

The replacement identifier for the Deployment resource to change information about.
This member is required.

``` swift
public var deploymentId: Swift.String?
```

### `patchOperations`

A list of update operations to be applied to the specified resource and in the order specified in this list.

``` swift
public var patchOperations: [ApiGatewayClientTypes.PatchOperation]?
```

### `restApiId`

\[Required\] The string identifier of the associated RestApi.
This member is required.

``` swift
public var restApiId: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
