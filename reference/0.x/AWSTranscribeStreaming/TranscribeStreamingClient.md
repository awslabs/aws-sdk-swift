# TranscribeStreamingClient

``` swift
public class TranscribeStreamingClient 
```

## Inheritance

[`TranscribeStreamingClientProtocol`](/aws-sdk-swift/reference/0.x/AWSTranscribeStreaming/TranscribeStreamingClientProtocol)

## Initializers

### `init(config:)`

``` swift
public init(config: AWSClientRuntime.AWSClientConfiguration) 
```

### `init(region:)`

``` swift
public convenience init(region: Swift.String? = nil) throws 
```

## Properties

### `clientName`

``` swift
public static let clientName = "TranscribeStreamingClient"
```

## Methods

### `startMedicalStreamTranscription(input:completion:)`

Starts a bidirectional HTTP/2 stream where audio is streamed to Amazon Transcribe Medical and the transcription results are streamed to your application.

``` swift
public func startMedicalStreamTranscription(input: StartMedicalStreamTranscriptionInput, completion: @escaping (ClientRuntime.SdkResult<StartMedicalStreamTranscriptionOutputResponse, StartMedicalStreamTranscriptionOutputError>) -> Void)
```

### `startStreamTranscription(input:completion:)`

Starts a bidirectional HTTP/2 stream where audio is streamed to Amazon Transcribe and the transcription results are streamed to your application. The following are encoded as HTTP/2 headers:

``` swift
public func startStreamTranscription(input: StartStreamTranscriptionInput, completion: @escaping (ClientRuntime.SdkResult<StartStreamTranscriptionOutputResponse, StartStreamTranscriptionOutputError>) -> Void)
```

  - x-amzn-transcribe-language-code

  - x-amzn-transcribe-media-encoding

  - x-amzn-transcribe-sample-rate

  - x-amzn-transcribe-session-id

See the [ SDK for Go API Reference](https://docs.aws.amazon.com/sdk-for-go/api/service/transcribestreamingservice/#TranscribeStreamingService.StartStreamTranscription) for more detail.
