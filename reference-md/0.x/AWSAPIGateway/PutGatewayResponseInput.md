# PutGatewayResponseInput

Creates a customization of a GatewayResponse of a specified response type and status code on the given RestApi.

``` swift
public struct PutGatewayResponseInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(responseParameters:responseTemplates:responseType:restApiId:statusCode:)`

``` swift
public init (
        responseParameters: [Swift.String:Swift.String]? = nil,
        responseTemplates: [Swift.String:Swift.String]? = nil,
        responseType: ApiGatewayClientTypes.GatewayResponseType? = nil,
        restApiId: Swift.String? = nil,
        statusCode: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `responseParameters`

Response parameters (paths, query strings and headers) of the GatewayResponse as a string-to-string map of key-value  pairs.

``` swift
public var responseParameters: [Swift.String:Swift.String]?
```

### `responseTemplates`

Response templates of the GatewayResponse as a string-to-string map of key-value pairs.

``` swift
public var responseTemplates: [Swift.String:Swift.String]?
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

### `statusCode`

The HTTP status code of the GatewayResponse.

``` swift
public var statusCode: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
