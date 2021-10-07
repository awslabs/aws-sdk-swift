# ApiGatewayClientTypes.StageKey

A reference to a unique stage identified in the format {restApiId}/{stage}.

``` swift
public struct StageKey: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.Codable`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(from:)`

``` swift
public init (from decoder: Swift.Decoder) throws 
```

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

The string identifier of the associated RestApi.

``` swift
public var restApiId: Swift.String?
```

### `stageName`

The stage name associated with the stage key.

``` swift
public var stageName: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
