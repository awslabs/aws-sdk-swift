# PollyClientTypes.LexiconDescription

Describes the content of the lexicon.

``` swift
public struct LexiconDescription: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.Codable`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(from:)`

``` swift
public init (from decoder: Swift.Decoder) throws 
```

### `init(attributes:name:)`

``` swift
public init (
            attributes: PollyClientTypes.LexiconAttributes? = nil,
            name: Swift.String? = nil
        )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `attributes`

Provides lexicon metadata.

``` swift
public var attributes: PollyClientTypes.LexiconAttributes?
```

### `name`

Name of the lexicon.

``` swift
public var name: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
