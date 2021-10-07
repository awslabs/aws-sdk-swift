# ApiGatewayClientTypes.Op

``` swift
public enum Op: Swift.Equatable, Swift.RawRepresentable, Swift.CaseIterable, Swift.Codable, Swift.Hashable 
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

### `add`

``` swift
case add
```

### `copy`

``` swift
case copy
```

### `move`

``` swift
case move
```

### `remove`

``` swift
case remove
```

### `replace`

``` swift
case replace
```

### `test`

``` swift
case test
```

### `sdkUnknown`

``` swift
case sdkUnknown(Swift.String)
```

## Properties

### `allCases`

``` swift
public static var allCases: [Op] 
```

### `rawValue`

``` swift
public var rawValue: Swift.String 
```
