# ApiGatewayClientTypes.EndpointType

The endpoint type. The valid values are EDGE for edge-optimized API setup, most suitable for mobile applications; REGIONAL for regional API endpoint setup, most suitable for calling from AWS Region; and PRIVATE for private APIs.

``` swift
public enum EndpointType: Swift.Equatable, Swift.RawRepresentable, Swift.CaseIterable, Swift.Codable, Swift.Hashable 
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

### `edge`

``` swift
case edge
```

### `` `private` ``

``` swift
case `private`
```

### `regional`

``` swift
case regional
```

### `sdkUnknown`

``` swift
case sdkUnknown(Swift.String)
```

## Properties

### `allCases`

``` swift
public static var allCases: [EndpointType] 
```

### `rawValue`

``` swift
public var rawValue: Swift.String 
```
