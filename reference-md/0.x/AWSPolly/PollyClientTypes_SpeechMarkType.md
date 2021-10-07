# PollyClientTypes.SpeechMarkType

``` swift
public enum SpeechMarkType: Swift.Equatable, Swift.RawRepresentable, Swift.CaseIterable, Swift.Codable, Swift.Hashable 
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

### `sentence`

``` swift
case sentence
```

### `ssml`

``` swift
case ssml
```

### `viseme`

``` swift
case viseme
```

### `word`

``` swift
case word
```

### `sdkUnknown`

``` swift
case sdkUnknown(Swift.String)
```

## Properties

### `allCases`

``` swift
public static var allCases: [SpeechMarkType] 
```

### `rawValue`

``` swift
public var rawValue: Swift.String 
```
