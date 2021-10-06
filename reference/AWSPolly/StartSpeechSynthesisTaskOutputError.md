# StartSpeechSynthesisTaskOutputError

``` swift
public enum StartSpeechSynthesisTaskOutputError: Swift.Error, Swift.Equatable 
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

### `invalidS3BucketException`

``` swift
case invalidS3BucketException(InvalidS3BucketException)
```

### `invalidS3KeyException`

``` swift
case invalidS3KeyException(InvalidS3KeyException)
```

### `invalidSampleRateException`

``` swift
case invalidSampleRateException(InvalidSampleRateException)
```

### `invalidSnsTopicArnException`

``` swift
case invalidSnsTopicArnException(InvalidSnsTopicArnException)
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
