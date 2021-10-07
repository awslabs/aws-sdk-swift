# PollyClientTypes.TaskStatus

``` swift
public enum TaskStatus: Swift.Equatable, Swift.RawRepresentable, Swift.CaseIterable, Swift.Codable, Swift.Hashable 
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

### `completed`

``` swift
case completed
```

### `failed`

``` swift
case failed
```

### `inProgress`

``` swift
case inProgress
```

### `scheduled`

``` swift
case scheduled
```

### `sdkUnknown`

``` swift
case sdkUnknown(Swift.String)
```

## Properties

### `allCases`

``` swift
public static var allCases: [TaskStatus] 
```

### `rawValue`

``` swift
public var rawValue: Swift.String 
```
