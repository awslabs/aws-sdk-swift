# StartSpeechSynthesisTaskOutputResponse

``` swift
public struct StartSpeechSynthesisTaskOutputResponse: Swift.Equatable 
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

SynthesisTask object that provides information and attributes about a
newly submitted speech synthesis task.

``` swift
public var synthesisTask: PollyClientTypes.SynthesisTask?
```
