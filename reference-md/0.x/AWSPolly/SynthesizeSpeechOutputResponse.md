# SynthesizeSpeechOutputResponse

``` swift
public struct SynthesizeSpeechOutputResponse: Swift.Equatable 
```

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(audioStream:contentType:requestCharacters:)`

``` swift
public init (
        audioStream: ClientRuntime.ByteStream? = nil,
        contentType: Swift.String? = nil,
        requestCharacters: Swift.Int = 0
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `audioStream`

Stream containing the synthesized speech.

``` swift
public var audioStream: ClientRuntime.ByteStream?
```

### `contentType`

Specifies the type audio stream. This should reflect the
OutputFormat parameter in your request.

``` swift
public var contentType: Swift.String?
```

``` 
           If you request mp3 as the
       OutputFormat, the ContentType returned is
     audio/mpeg.


           If you request ogg_vorbis as the
       OutputFormat, the ContentType returned is
     audio/ogg.


           If you request pcm as the
       OutputFormat, the ContentType returned is
     audio/pcm in a signed 16-bit, 1 channel (mono), little-endian format.



          If you request json as the
       OutputFormat, the ContentType returned is
     audio/json.
```

### `requestCharacters`

Number of characters synthesized.

``` swift
public var requestCharacters: Swift.Int
```
