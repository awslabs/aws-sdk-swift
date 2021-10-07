# GetIntegrationResponseInput

Represents a get integration response request.

``` swift
public struct GetIntegrationResponseInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(httpMethod:resourceId:restApiId:statusCode:)`

``` swift
public init (
        httpMethod: Swift.String? = nil,
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

\[Required\] Specifies a get integration response request's HTTP method.
This member is required.

``` swift
public var httpMethod: Swift.String?
```

### `resourceId`

\[Required\] Specifies a get integration response request's resource identifier.
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

\[Required\] Specifies a get integration response request's status code.
This member is required.

``` swift
public var statusCode: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
