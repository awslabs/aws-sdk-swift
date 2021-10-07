# CreateRequestValidatorInput

Creates a RequestValidator of a given RestApi.

``` swift
public struct CreateRequestValidatorInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(name:restApiId:validateRequestBody:validateRequestParameters:)`

``` swift
public init (
        name: Swift.String? = nil,
        restApiId: Swift.String? = nil,
        validateRequestBody: Swift.Bool = false,
        validateRequestParameters: Swift.Bool = false
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `name`

The name of the to-be-created RequestValidator.

``` swift
public var name: Swift.String?
```

### `restApiId`

\[Required\] The string identifier of the associated RestApi.
This member is required.

``` swift
public var restApiId: Swift.String?
```

### `validateRequestBody`

A Boolean flag to indicate whether to validate request body according to the configured model schema for the method (true) or not (false).

``` swift
public var validateRequestBody: Swift.Bool
```

### `validateRequestParameters`

A Boolean flag to indicate whether to validate request parameters, true, or not false.

``` swift
public var validateRequestParameters: Swift.Bool
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
