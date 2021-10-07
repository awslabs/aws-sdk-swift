# SynthesizeSpeechOutputError

``` swift
public enum SynthesizeSpeechOutputError: Swift.Error, Swift.Equatable 
```

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.Equatable`, `Swift.Error`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init(httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(errorType:httpResponse:decoder:message:requestID:)`

``` swift
public init(errorType: Swift.String?, httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil, message: Swift.String? = nil, requestID: Swift.String? = nil) throws 
```

## Enumeration Cases

### `engineNotSupportedException`

``` swift
case engineNotSupportedException(EngineNotSupportedException)
```

### `invalidSampleRateException`

``` swift
case invalidSampleRateException(InvalidSampleRateException)
```

### `invalidSsmlException`

``` swift
case invalidSsmlException(InvalidSsmlException)
```

### `languageNotSupportedException`

``` swift
case languageNotSupportedException(LanguageNotSupportedException)
```

### `lexiconNotFoundException`

``` swift
case lexiconNotFoundException(LexiconNotFoundException)
```

### `marksNotSupportedForFormatException`

``` swift
case marksNotSupportedForFormatException(MarksNotSupportedForFormatException)
```

### `serviceFailureException`

``` swift
case serviceFailureException(ServiceFailureException)
```

### `ssmlMarksNotSupportedForTextTypeException`

``` swift
case ssmlMarksNotSupportedForTextTypeException(SsmlMarksNotSupportedForTextTypeException)
```

### `textLengthExceededException`

``` swift
case textLengthExceededException(TextLengthExceededException)
```

### `unknown`

``` swift
case unknown(UnknownAWSHttpServiceError)
```
