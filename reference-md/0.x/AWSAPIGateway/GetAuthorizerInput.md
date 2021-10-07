# GetAuthorizerInput

Request to describe an existing Authorizer resource.

``` swift
public struct GetAuthorizerInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(authorizerId:restApiId:)`

``` swift
public init (
        authorizerId: Swift.String? = nil,
        restApiId: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `authorizerId`

\[Required\] The identifier of the Authorizer resource.
This member is required.

``` swift
public var authorizerId: Swift.String?
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
