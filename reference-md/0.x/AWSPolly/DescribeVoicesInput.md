# DescribeVoicesInput

``` swift
public struct DescribeVoicesInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(engine:includeAdditionalLanguageCodes:languageCode:nextToken:)`

``` swift
public init (
        engine: PollyClientTypes.Engine? = nil,
        includeAdditionalLanguageCodes: Swift.Bool = false,
        languageCode: PollyClientTypes.LanguageCode? = nil,
        nextToken: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `engine`

Specifies the engine (standard or neural)
used by Amazon Polly when processing input text for speech synthesis.

``` swift
public var engine: PollyClientTypes.Engine?
```

### `includeAdditionalLanguageCodes`

Boolean value indicating whether to return any bilingual voices that
use the specified language as an additional language. For instance, if you
request all languages that use US English (es-US), and there is an Italian
voice that speaks both Italian (it-IT) and US English, that voice will be
included if you specify yes but not if you specify
no.

``` swift
public var includeAdditionalLanguageCodes: Swift.Bool
```

### `languageCode`

The language identification tag (ISO 639 code for the language
name-ISO 3166 country code) for filtering the list of voices returned. If
you don't specify this optional parameter, all available voices are
returned.

``` swift
public var languageCode: PollyClientTypes.LanguageCode?
```

### `nextToken`

An opaque pagination token returned from the previous
DescribeVoices operation. If present, this indicates where
to continue the listing.

``` swift
public var nextToken: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
