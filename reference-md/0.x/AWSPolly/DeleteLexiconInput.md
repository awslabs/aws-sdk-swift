# DeleteLexiconInput

``` swift
public struct DeleteLexiconInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(name:)`

``` swift
public init (
        name: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `name`

The name of the lexicon to delete. Must be an existing lexicon in
the region.
This member is required.

``` swift
public var name: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
