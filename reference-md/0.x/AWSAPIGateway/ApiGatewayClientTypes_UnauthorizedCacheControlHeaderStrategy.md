# ApiGatewayClientTypes.UnauthorizedCacheControlHeaderStrategy

``` swift
public enum UnauthorizedCacheControlHeaderStrategy: Swift.Equatable, Swift.RawRepresentable, Swift.CaseIterable, Swift.Codable, Swift.Hashable 
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

### `failWith403`

``` swift
case failWith403
```

### `succeedWithoutResponseHeader`

``` swift
case succeedWithoutResponseHeader
```

### `succeedWithResponseHeader`

``` swift
case succeedWithResponseHeader
```

### `sdkUnknown`

``` swift
case sdkUnknown(Swift.String)
```

## Properties

### `allCases`

``` swift
public static var allCases: [UnauthorizedCacheControlHeaderStrategy] 
```

### `rawValue`

``` swift
public var rawValue: Swift.String 
```
