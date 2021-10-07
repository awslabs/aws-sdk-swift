# GetMethodInput

Request to describe an existing Method resource.

``` swift
public struct GetMethodInput: Swift.Equatable 
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

\[Required\] Specifies the method request's HTTP method type.
This member is required.

``` swift
public var httpMethod: Swift.String?
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
