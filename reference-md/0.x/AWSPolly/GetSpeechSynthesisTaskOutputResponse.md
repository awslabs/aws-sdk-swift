# GetSpeechSynthesisTaskOutputResponse

``` swift
public struct GetSpeechSynthesisTaskOutputResponse: Swift.Equatable 
```

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(synthesisTask:)`

``` swift
public init (
        synthesisTask: PollyClientTypes.SynthesisTask? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `synthesisTask`

SynthesisTask object that provides information from the requested
task, including output format, creation time, task status, and so
on.

``` swift
public var synthesisTask: PollyClientTypes.SynthesisTask?
```
