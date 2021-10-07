# ApiGatewayClientTypes.QuotaSettings

Quotas configured for a usage plan.

``` swift
public struct QuotaSettings: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.Codable`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(from:)`

``` swift
public init (from decoder: Swift.Decoder) throws 
```

### `init(limit:offset:period:)`

``` swift
public init (
            limit: Swift.Int = 0,
            offset: Swift.Int = 0,
            period: ApiGatewayClientTypes.QuotaPeriodType? = nil
        )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `limit`

The maximum number of requests that can be made in a given time period.

``` swift
public var limit: Swift.Int
```

### `offset`

The day that a time period starts. For example, with a time period of WEEK, an offset of 0 starts on Sunday, and an offset of 1 starts on Monday.

``` swift
public var offset: Swift.Int
```

### `period`

The time period in which the limit applies. Valid values are "DAY", "WEEK" or "MONTH".

``` swift
public var period: ApiGatewayClientTypes.QuotaPeriodType?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
