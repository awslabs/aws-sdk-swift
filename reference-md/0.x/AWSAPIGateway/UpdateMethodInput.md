# UpdateMethodInput

Request to update an existing Method resource.

``` swift
public struct UpdateMethodInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(httpMethod:patchOperations:resourceId:restApiId:)`

``` swift
public init (
        httpMethod: Swift.String? = nil,
        patchOperations: [ApiGatewayClientTypes.PatchOperation]? = nil,
        resourceId: Swift.String? = nil,
        restApiId: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `httpMethod`

\[Required\] The HTTP verb of the Method resource.
This member is required.

``` swift
public var httpMethod: Swift.String?
```

### `patchOperations`

A list of update operations to be applied to the specified resource and in the order specified in this list.

``` swift
public var patchOperations: [ApiGatewayClientTypes.PatchOperation]?
```

### `resourceId`

\[Required\] The Resource identifier for the Method resource.
This member is required.

``` swift
public var resourceId: Swift.String?
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
