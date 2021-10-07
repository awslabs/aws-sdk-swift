# ListLexiconsOutputError

``` swift
public enum ListLexiconsOutputError: Swift.Error, Swift.Equatable 
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

### `invalidNextTokenException`

``` swift
case invalidNextTokenException(InvalidNextTokenException)
```

### `serviceFailureException`

``` swift
case serviceFailureException(ServiceFailureException)
```

### `unknown`

``` swift
case unknown(UnknownAWSHttpServiceError)
```
