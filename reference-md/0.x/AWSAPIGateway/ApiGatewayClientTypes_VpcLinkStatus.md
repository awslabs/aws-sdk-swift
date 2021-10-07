# ApiGatewayClientTypes.VpcLinkStatus

``` swift
public enum VpcLinkStatus: Swift.Equatable, Swift.RawRepresentable, Swift.CaseIterable, Swift.Codable, Swift.Hashable 
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

### `available`

``` swift
case available
```

### `deleting`

``` swift
case deleting
```

### `failed`

``` swift
case failed
```

### `pending`

``` swift
case pending
```

### `sdkUnknown`

``` swift
case sdkUnknown(Swift.String)
```

## Properties

### `allCases`

``` swift
public static var allCases: [VpcLinkStatus] 
```

### `rawValue`

``` swift
public var rawValue: Swift.String 
```
