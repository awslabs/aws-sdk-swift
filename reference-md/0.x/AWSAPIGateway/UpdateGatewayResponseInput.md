# UpdateGatewayResponseInput

Updates a GatewayResponse of a specified response type on the given RestApi.

``` swift
public struct UpdateGatewayResponseInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(patchOperations:responseType:restApiId:)`

``` swift
public init (
        patchOperations: [ApiGatewayClientTypes.PatchOperation]? = nil,
        responseType: ApiGatewayClientTypes.GatewayResponseType? = nil,
        restApiId: Swift.String? = nil
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

### `responseType`

\[Required\] The response type of the associated GatewayResponse.
This member is required.

``` swift
public var responseType: ApiGatewayClientTypes.GatewayResponseType?
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
