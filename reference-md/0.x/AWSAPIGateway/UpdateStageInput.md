# UpdateStageInput

Requests API Gateway to change information about a Stage resource.

``` swift
public struct UpdateStageInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(patchOperations:restApiId:stageName:)`

``` swift
public init (
        patchOperations: [ApiGatewayClientTypes.PatchOperation]? = nil,
        restApiId: Swift.String? = nil,
        stageName: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
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

### `stageName`

\[Required\] The name of the Stage resource to change information about.
This member is required.

``` swift
public var stageName: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
