# TranscribeStreamingClientProtocol

Operations and objects for transcribing streaming speech to text.

``` swift
public protocol TranscribeStreamingClientProtocol 
```

## Requirements

### startMedicalStreamTranscription(input:​completion:​)

Starts a bidirectional HTTP/2 stream where audio is streamed to Amazon Transcribe Medical and the
transcription results are streamed to your application.

``` swift
func startMedicalStreamTranscription(input: StartMedicalStreamTranscriptionInput, completion: @escaping (ClientRuntime.SdkResult<StartMedicalStreamTranscriptionOutputResponse, StartMedicalStreamTranscriptionOutputError>) -> Void)
```

### startStreamTranscription(input:​completion:​)

Starts a bidirectional HTTP/2 stream where audio is streamed to Amazon Transcribe and the transcription
results are streamed to your application.
The following are encoded as HTTP/2 headers:​

``` swift
func startStreamTranscription(input: StartStreamTranscriptionInput, completion: @escaping (ClientRuntime.SdkResult<StartStreamTranscriptionOutputResponse, StartStreamTranscriptionOutputError>) -> Void)
```

``` 
           x-amzn-transcribe-language-code


           x-amzn-transcribe-media-encoding


           x-amzn-transcribe-sample-rate


           x-amzn-transcribe-session-id


     See the <a href="https://docs.aws.amazon.com/sdk-for-go/api/service/transcribestreamingservice/#TranscribeStreamingService.StartStreamTranscription"> SDK for Go API Reference for more detail.
```
