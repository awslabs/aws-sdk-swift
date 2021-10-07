# PollyClientTypes.Lexicon

Provides lexicon name and lexicon content in string format. For
more information, see <a href="https:​//www.w3.org/TR/pronunciation-lexicon/">Pronunciation Lexicon
Specification (PLS) Version 1.0.

``` swift
public struct Lexicon: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.Codable`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(from:)`

``` swift
public init (from decoder: Swift.Decoder) throws 
```

### `init(content:name:)`

``` swift
public init (
            content: Swift.String? = nil,
            name: Swift.String? = nil
        )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `content`

Lexicon content in string format. The content of a lexicon must be
in PLS format.

``` swift
public var content: Swift.String?
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
