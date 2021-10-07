# DeleteIntegrationInput

Represents a delete integration request.

``` swift
public struct DeleteIntegrationInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(httpMethod:resourceId:restApiId:)`

``` swift
public init (
        httpMethod: Swift.String? = nil,
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

\[Required\] Specifies a delete integration request's HTTP method.
This member is required.

``` swift
public var httpMethod: Swift.String?
```

### `resourceId`

\[Required\] Specifies a delete integration request's resource identifier.
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
