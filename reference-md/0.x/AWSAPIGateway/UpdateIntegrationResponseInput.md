# UpdateIntegrationResponseInput

Represents an update integration response request.

``` swift
public struct UpdateIntegrationResponseInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(httpMethod:patchOperations:resourceId:restApiId:statusCode:)`

``` swift
public init (
        httpMethod: Swift.String? = nil,
        patchOperations: [ApiGatewayClientTypes.PatchOperation]? = nil,
        resourceId: Swift.String? = nil,
        restApiId: Swift.String? = nil,
        statusCode: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `httpMethod`

\[Required\] Specifies an update integration response request's HTTP method.
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

\[Required\] Specifies an update integration response request's resource identifier.
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

### `statusCode`

\[Required\] Specifies an update integration response request's status code.
This member is required.

``` swift
public var statusCode: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
