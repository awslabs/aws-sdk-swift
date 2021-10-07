# GetStageInput

Requests API Gateway to get information about a Stage resource.

``` swift
public struct GetStageInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(restApiId:stageName:)`

``` swift
public init (
        restApiId: Swift.String? = nil,
        stageName: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `restApiId`

\[Required\] The string identifier of the associated RestApi.
This member is required.

``` swift
public var restApiId: Swift.String?
```

### `stageName`

\[Required\] The name of the Stage resource to get information about.
This member is required.

``` swift
public var stageName: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
