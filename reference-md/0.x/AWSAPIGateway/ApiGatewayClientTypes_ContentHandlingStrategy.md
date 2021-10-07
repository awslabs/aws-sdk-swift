# ApiGatewayClientTypes.ContentHandlingStrategy

``` swift
public enum ContentHandlingStrategy: Swift.Equatable, Swift.RawRepresentable, Swift.CaseIterable, Swift.Codable, Swift.Hashable 
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

### `convertToBinary`

``` swift
case convertToBinary
```

### `convertToText`

``` swift
case convertToText
```

### `sdkUnknown`

``` swift
case sdkUnknown(Swift.String)
```

## Properties

### `allCases`

``` swift
public static var allCases: [ContentHandlingStrategy] 
```

### `rawValue`

``` swift
public var rawValue: Swift.String 
```
