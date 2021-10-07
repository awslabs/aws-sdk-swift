# FlushStageCacheInput

Requests API Gateway to flush a stage's cache.

``` swift
public struct FlushStageCacheInput: Swift.Equatable 
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

\[Required\] The name of the stage to flush its cache.
This member is required.

``` swift
public var stageName: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
