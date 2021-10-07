# SynthesizeSpeechInput

``` swift
public struct SynthesizeSpeechInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(engine:languageCode:lexiconNames:outputFormat:sampleRate:speechMarkTypes:text:textType:voiceId:)`

``` swift
public init (
        engine: PollyClientTypes.Engine? = nil,
        languageCode: PollyClientTypes.LanguageCode? = nil,
        lexiconNames: [Swift.String]? = nil,
        outputFormat: PollyClientTypes.OutputFormat? = nil,
        sampleRate: Swift.String? = nil,
        speechMarkTypes: [PollyClientTypes.SpeechMarkType]? = nil,
        text: Swift.String? = nil,
        textType: PollyClientTypes.TextType? = nil,
        voiceId: PollyClientTypes.VoiceId? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `engine`

Specifies the engine (standard or neural)
for Amazon Polly to use when processing input text for speech synthesis. For
information on Amazon Polly voices and which voices are available in
standard-only, NTTS-only, and both standard and NTTS formats, see <a href="https:​//docs.aws.amazon.com/polly/latest/dg/voicelist.html">Available Voices.

``` swift
public var engine: PollyClientTypes.Engine?
```

``` 
        NTTS-only voices

     When using NTTS-only voices such as Kevin (en-US), this parameter is
  required and must be set to neural. If the engine is not
  specified, or is set to standard, this will result in an
  error.
     Type: String
     Valid Values: standard | neural

     Required: Yes


        Standard voices

     For standard voices, this is not required; the engine parameter
  defaults to standard. If the engine is not specified, or is
  set to standard and an NTTS-only voice is selected, this will
  result in an error.
```

### `languageCode`

Optional language code for the Synthesize Speech request. This is only
necessary if using a bilingual voice, such as Aditi, which can be used for
either Indian English (en-IN) or Hindi (hi-IN).
If a bilingual voice is used and no language code is specified, Amazon Polly
uses the default language of the bilingual voice. The default language for
any voice is the one returned by the <a href="https:​//docs.aws.amazon.com/polly/latest/dg/API_DescribeVoices.html">DescribeVoices operation for the LanguageCode
parameter. For example, if no language code is specified, Aditi will use
Indian English rather than Hindi.

``` swift
public var languageCode: PollyClientTypes.LanguageCode?
```

### `lexiconNames`

List of one or more pronunciation lexicon names you want the
service to apply during synthesis. Lexicons are applied only if the
language of the lexicon is the same as the language of the voice. For
information about storing lexicons, see <a href="https:​//docs.aws.amazon.com/polly/latest/dg/API_PutLexicon.html">PutLexicon.

``` swift
public var lexiconNames: [Swift.String]?
```

### `outputFormat`

The format in which the returned output will be encoded. For audio
stream, this will be mp3, ogg\_vorbis, or pcm. For speech marks, this will
be json.
When pcm is used, the content returned is audio/pcm in a signed
16-bit, 1 channel (mono), little-endian format.
This member is required.

``` swift
public var outputFormat: PollyClientTypes.OutputFormat?
```

### `sampleRate`

The audio frequency specified in Hz.
The valid values for mp3 and ogg\_vorbis are "8000", "16000", "22050",
and "24000". The default value for standard voices is "22050". The default
value for neural voices is "24000".
Valid values for pcm are "8000" and "16000" The default value is
"16000".

``` swift
public var sampleRate: Swift.String?
```

### `speechMarkTypes`

The type of speech marks returned for the input text.

``` swift
public var speechMarkTypes: [PollyClientTypes.SpeechMarkType]?
```

### `text`

Input text to synthesize. If you specify ssml as the
TextType, follow the SSML format for the input text.

``` swift
public var text: Swift.String?
```

This member is required.

### `textType`

Specifies whether the input text is plain text or SSML. The
default value is plain text. For more information, see <a href="https:​//docs.aws.amazon.com/polly/latest/dg/ssml.html">Using
SSML.

``` swift
public var textType: PollyClientTypes.TextType?
```

### `voiceId`

Voice ID to use for the synthesis. You can get a list of available
voice IDs by calling the <a href="https:​//docs.aws.amazon.com/polly/latest/dg/API_DescribeVoices.html">DescribeVoices operation.
This member is required.

``` swift
public var voiceId: PollyClientTypes.VoiceId?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```

### `presignURL(config:expiration:)`

``` swift
public func presignURL(config: AWSClientRuntime.AWSClientConfiguration, expiration: Swift.Int64) -> ClientRuntime.URL? 
```

### `presign(config:expiration:)`

``` swift
public func presign(config: AWSClientRuntime.AWSClientConfiguration, expiration: Swift.Int64) -> ClientRuntime.SdkHttpRequest? 
```
