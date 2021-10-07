# PollyClientTypes.LexiconAttributes

Contains metadata describing the lexicon such as the number of
lexemes, language code, and so on. For more information, see <a href="https:​//docs.aws.amazon.com/polly/latest/dg/managing-lexicons.html">Managing Lexicons.

``` swift
public struct LexiconAttributes: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.Codable`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(from:)`

``` swift
public init (from decoder: Swift.Decoder) throws 
```

### `init(alphabet:languageCode:lastModified:lexemesCount:lexiconArn:size:)`

``` swift
public init (
            alphabet: Swift.String? = nil,
            languageCode: PollyClientTypes.LanguageCode? = nil,
            lastModified: ClientRuntime.Date? = nil,
            lexemesCount: Swift.Int = 0,
            lexiconArn: Swift.String? = nil,
            size: Swift.Int = 0
        )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `alphabet`

Phonetic alphabet used in the lexicon. Valid values are
ipa and x-sampa.

``` swift
public var alphabet: Swift.String?
```

### `languageCode`

Language code that the lexicon applies to. A lexicon with a
language code such as "en" would be applied to all English languages
(en-GB, en-US, en-AUS, en-WLS, and so on.

``` swift
public var languageCode: PollyClientTypes.LanguageCode?
```

### `lastModified`

Date lexicon was last modified (a timestamp value).

``` swift
public var lastModified: ClientRuntime.Date?
```

### `lexemesCount`

Number of lexemes in the lexicon.

``` swift
public var lexemesCount: Swift.Int
```

### `lexiconArn`

Amazon Resource Name (ARN) of the lexicon.

``` swift
public var lexiconArn: Swift.String?
```

### `size`

Total size of the lexicon, in characters.

``` swift
public var size: Swift.Int
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
