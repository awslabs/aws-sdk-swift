# GetLexiconOutputResponse

``` swift
public struct GetLexiconOutputResponse: Swift.Equatable 
```

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(lexicon:lexiconAttributes:)`

``` swift
public init (
        lexicon: PollyClientTypes.Lexicon? = nil,
        lexiconAttributes: PollyClientTypes.LexiconAttributes? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `lexicon`

Lexicon object that provides name and the string content of the
lexicon.

``` swift
public var lexicon: PollyClientTypes.Lexicon?
```

### `lexiconAttributes`

Metadata of the lexicon, including phonetic alphabetic used,
language code, lexicon ARN, number of lexemes defined in the lexicon, and
size of lexicon in bytes.

``` swift
public var lexiconAttributes: PollyClientTypes.LexiconAttributes?
```
