# ApiGatewayClientTypes.CacheClusterStatus

Returns the status of the CacheCluster.

``` swift
public enum CacheClusterStatus: Swift.Equatable, Swift.RawRepresentable, Swift.CaseIterable, Swift.Codable, Swift.Hashable 
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

### `createInProgress`

``` swift
case createInProgress
```

### `deleteInProgress`

``` swift
case deleteInProgress
```

### `flushInProgress`

``` swift
case flushInProgress
```

### `notAvailable`

``` swift
case notAvailable
```

### `sdkUnknown`

``` swift
case sdkUnknown(Swift.String)
```

## Properties

### `allCases`

``` swift
public static var allCases: [CacheClusterStatus] 
```

### `rawValue`

``` swift
public var rawValue: Swift.String 
```
