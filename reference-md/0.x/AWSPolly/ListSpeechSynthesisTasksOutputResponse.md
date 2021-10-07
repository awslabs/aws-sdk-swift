# ListSpeechSynthesisTasksOutputResponse

``` swift
public struct ListSpeechSynthesisTasksOutputResponse: Swift.Equatable 
```

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(nextToken:synthesisTasks:)`

``` swift
public init (
        nextToken: Swift.String? = nil,
        synthesisTasks: [PollyClientTypes.SynthesisTask]? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `nextToken`

An opaque pagination token returned from the previous List operation
in this request. If present, this indicates where to continue the
listing.

``` swift
public var nextToken: Swift.String?
```

### `synthesisTasks`

List of SynthesisTask objects that provides information from the
specified task in the list request, including output format, creation
time, task status, and so on.

``` swift
public var synthesisTasks: [PollyClientTypes.SynthesisTask]?
```
