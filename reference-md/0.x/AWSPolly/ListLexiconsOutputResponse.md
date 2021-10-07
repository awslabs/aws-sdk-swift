# ListLexiconsOutputResponse

``` swift
public struct ListLexiconsOutputResponse: Swift.Equatable 
```

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(lexicons:nextToken:)`

``` swift
public init (
        lexicons: [PollyClientTypes.LexiconDescription]? = nil,
        nextToken: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `lexicons`

A list of lexicon names and attributes.

``` swift
public var lexicons: [PollyClientTypes.LexiconDescription]?
```

### `nextToken`

The pagination token to use in the next request to continue the
listing of lexicons. NextToken is returned only if the
response is truncated.

``` swift
public var nextToken: Swift.String?
```
