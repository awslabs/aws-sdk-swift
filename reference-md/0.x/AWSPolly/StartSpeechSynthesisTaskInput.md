# StartSpeechSynthesisTaskInput

``` swift
public struct StartSpeechSynthesisTaskInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(engine:languageCode:lexiconNames:outputFormat:outputS3BucketName:outputS3KeyPrefix:sampleRate:snsTopicArn:speechMarkTypes:text:textType:voiceId:)`

``` swift
public init (
        engine: PollyClientTypes.Engine? = nil,
        languageCode: PollyClientTypes.LanguageCode? = nil,
        lexiconNames: [Swift.String]? = nil,
        outputFormat: PollyClientTypes.OutputFormat? = nil,
        outputS3BucketName: Swift.String? = nil,
        outputS3KeyPrefix: Swift.String? = nil,
        sampleRate: Swift.String? = nil,
        snsTopicArn: Swift.String? = nil,
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
for Amazon Polly to use when processing input text for speech synthesis. Using a
voice that is not supported for the engine selected will result in an
error.

``` swift
public var engine: PollyClientTypes.Engine?
```

### `languageCode`

Optional language code for the Speech Synthesis request. This is only
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

List of one or more pronunciation lexicon names you want the service
to apply during synthesis. Lexicons are applied only if the language of
the lexicon is the same as the language of the voice.

``` swift
public var lexiconNames: [Swift.String]?
```

### `outputFormat`

The format in which the returned output will be encoded. For audio
stream, this will be mp3, ogg\_vorbis, or pcm. For speech marks, this will
be json.
This member is required.

``` swift
public var outputFormat: PollyClientTypes.OutputFormat?
```

### `outputS3BucketName`

Amazon S3 bucket name to which the output file will be saved.
This member is required.

``` swift
public var outputS3BucketName: Swift.String?
```

### `outputS3KeyPrefix`

The Amazon S3 key prefix for the output speech file.

``` swift
public var outputS3KeyPrefix: Swift.String?
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

### `snsTopicArn`

ARN for the SNS topic optionally used for providing status
notification for a speech synthesis task.

``` swift
public var snsTopicArn: Swift.String?
```

### `speechMarkTypes`

The type of speech marks returned for the input text.

``` swift
public var speechMarkTypes: [PollyClientTypes.SpeechMarkType]?
```

### `text`

The input text to synthesize. If you specify ssml as the TextType,
follow the SSML format for the input text.
This member is required.

``` swift
public var text: Swift.String?
```

### `textType`

Specifies whether the input text is plain text or SSML. The default
value is plain text.

``` swift
public var textType: PollyClientTypes.TextType?
```

### `voiceId`

Voice ID to use for the synthesis.
This member is required.

``` swift
public var voiceId: PollyClientTypes.VoiceId?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
