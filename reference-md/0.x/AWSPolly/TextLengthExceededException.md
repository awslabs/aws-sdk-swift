# TextLengthExceededException

The value of the "Text" parameter is longer than the accepted
limits. For the SynthesizeSpeech API, the limit for input
text is a maximum of 6000 characters total, of which no more than 3000 can
be billed characters. For the StartSpeechSynthesisTask API,
the maximum is 200,000 characters, of which no more than 100,000 can be
billed characters. SSML tags are not counted as billed
characters.

``` swift
public struct TextLengthExceededException: AWSClientRuntime.AWSHttpServiceError, Swift.Equatable 
```

## Inheritance

`AWSClientRuntime.AWSHttpServiceError`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:message:requestID:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil, message: Swift.String? = nil, requestID: Swift.String? = nil) throws 
```

### `init(message:)`

``` swift
public init (
        message: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `_headers`

``` swift
public var _headers: ClientRuntime.Headers?
```

### `_statusCode`

``` swift
public var _statusCode: ClientRuntime.HttpStatusCode?
```

### `_message`

``` swift
public var _message: Swift.String?
```

### `_requestID`

``` swift
public var _requestID: Swift.String?
```

### `_retryable`

``` swift
public var _retryable: Swift.Bool = false
```

### `_isThrottling`

``` swift
public var _isThrottling: Swift.Bool = false
```

### `_type`

``` swift
public var _type: ClientRuntime.ErrorType = .client
```

### `message`

``` swift
public var message: Swift.String?
```
