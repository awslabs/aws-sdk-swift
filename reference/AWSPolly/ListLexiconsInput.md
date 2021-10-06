# ListLexiconsInput

``` swift
public struct ListLexiconsInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(nextToken:)`

``` swift
public init (
        nextToken: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `nextToken`

An opaque pagination token returned from previous
ListLexicons operation. If present, indicates where to
continue the list of lexicons.

``` swift
public var nextToken: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
