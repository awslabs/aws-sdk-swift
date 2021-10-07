# ApiGatewayClientTypes.QuotaPeriodType

``` swift
public enum QuotaPeriodType: Swift.Equatable, Swift.RawRepresentable, Swift.CaseIterable, Swift.Codable, Swift.Hashable 
```

## Inheritance

`Swift.CaseIterable`, `Swift.Codable`, `Swift.Equatable`, `Swift.Hashable`, `Swift.RawRepresentable`

## Initializers

### `init?(rawValue:)`

``` swift
public init?(rawValue: Swift.String) 
```

### `init(from:)`

``` swift
public init(from decoder: Swift.Decoder) throws 
```

## Enumeration Cases

### `day`

``` swift
case day
```

### `month`

``` swift
case month
```

### `week`

``` swift
case week
```

### `sdkUnknown`

``` swift
case sdkUnknown(Swift.String)
```

## Properties

### `allCases`

``` swift
public static var allCases: [QuotaPeriodType] 
```

### `rawValue`

``` swift
public var rawValue: Swift.String 
```
