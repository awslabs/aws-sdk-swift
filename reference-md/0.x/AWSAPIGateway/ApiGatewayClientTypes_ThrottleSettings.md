# ApiGatewayClientTypes.ThrottleSettings

The API request rate limits.

``` swift
public struct ThrottleSettings: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.Codable`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(from:)`

``` swift
public init (from decoder: Swift.Decoder) throws 
```

### `init(burstLimit:rateLimit:)`

``` swift
public init (
            burstLimit: Swift.Int = 0,
            rateLimit: Swift.Double = 0.0
        )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `burstLimit`

The API request burst limit, the maximum rate limit over a time ranging from one to a few seconds, depending upon whether the underlying token bucket is at its full capacity.

``` swift
public var burstLimit: Swift.Int
```

### `rateLimit`

The API request steady-state rate limit.

``` swift
public var rateLimit: Swift.Double
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
