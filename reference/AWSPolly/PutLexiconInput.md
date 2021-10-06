# PutLexiconInput

``` swift
public struct PutLexiconInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

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

Content of the PLS lexicon as string data.
This member is required.

``` swift
public var content: Swift.String?
```

### `name`

Name of the lexicon. The name must follow the regular express
format \[0-9A-Za-z\]{1,20}. That is, the name is a case-sensitive
alphanumeric string up to 20 characters long.
This member is required.

``` swift
public var name: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
