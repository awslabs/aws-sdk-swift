# GetRequestValidatorInput

Gets a RequestValidator of a given RestApi.

``` swift
public struct GetRequestValidatorInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(requestValidatorId:restApiId:)`

``` swift
public init (
        requestValidatorId: Swift.String? = nil,
        restApiId: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `requestValidatorId`

\[Required\] The identifier of the RequestValidator to be retrieved.
This member is required.

``` swift
public var requestValidatorId: Swift.String?
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
