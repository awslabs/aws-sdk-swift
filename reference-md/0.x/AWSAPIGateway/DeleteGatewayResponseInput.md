# DeleteGatewayResponseInput

Clears any customization of a GatewayResponse of a specified response type on the given RestApi and resets it with the default settings.

``` swift
public struct DeleteGatewayResponseInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(responseType:restApiId:)`

``` swift
public init (
        responseType: ApiGatewayClientTypes.GatewayResponseType? = nil,
        restApiId: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
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
