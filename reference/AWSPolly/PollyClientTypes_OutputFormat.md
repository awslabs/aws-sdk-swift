# PollyClientTypes.OutputFormat

``` swift
public enum OutputFormat: Swift.Equatable, Swift.RawRepresentable, Swift.CaseIterable, Swift.Codable, Swift.Hashable 
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

### `json`

``` swift
case json
```

### `mp3`

``` swift
case mp3
```

### `oggVorbis`

``` swift
case oggVorbis
```

### `pcm`

``` swift
case pcm
```

### `sdkUnknown`

``` swift
case sdkUnknown(Swift.String)
```

## Properties

### `allCases`

``` swift
public static var allCases: [OutputFormat] 
```

### `rawValue`

``` swift
public var rawValue: Swift.String 
```
