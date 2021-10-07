# UpdateDocumentationPartOutputError

``` swift
public enum UpdateDocumentationPartOutputError: Swift.Error, Swift.Equatable 
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

### `badRequestException`

``` swift
case badRequestException(BadRequestException)
```

### `conflictException`

``` swift
case conflictException(ConflictException)
```

### `limitExceededException`

``` swift
case limitExceededException(LimitExceededException)
```

### `notFoundException`

``` swift
case notFoundException(NotFoundException)
```

### `tooManyRequestsException`

``` swift
case tooManyRequestsException(TooManyRequestsException)
```

### `unauthorizedException`

``` swift
case unauthorizedException(UnauthorizedException)
```

### `unknown`

``` swift
case unknown(UnknownAWSHttpServiceError)
```
