# PutLexiconOutputError

``` swift
public enum PutLexiconOutputError: Swift.Error, Swift.Equatable 
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

### `invalidLexiconException`

``` swift
case invalidLexiconException(InvalidLexiconException)
```

### `lexiconSizeExceededException`

``` swift
case lexiconSizeExceededException(LexiconSizeExceededException)
```

### `maxLexemeLengthExceededException`

``` swift
case maxLexemeLengthExceededException(MaxLexemeLengthExceededException)
```

### `maxLexiconsNumberExceededException`

``` swift
case maxLexiconsNumberExceededException(MaxLexiconsNumberExceededException)
```

### `serviceFailureException`

``` swift
case serviceFailureException(ServiceFailureException)
```

### `unsupportedPlsAlphabetException`

``` swift
case unsupportedPlsAlphabetException(UnsupportedPlsAlphabetException)
```

### `unsupportedPlsLanguageException`

``` swift
case unsupportedPlsLanguageException(UnsupportedPlsLanguageException)
```

### `unknown`

``` swift
case unknown(UnknownAWSHttpServiceError)
```
