# TooManyRequestsException

The request has reached its throttling limit. Retry after the specified time period.

``` swift
public struct TooManyRequestsException: AWSClientRuntime.AWSHttpServiceError, Swift.Equatable 
```

## Inheritance

`AWSClientRuntime.AWSHttpServiceError`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:message:requestID:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil, message: Swift.String? = nil, requestID: Swift.String? = nil) throws 
```

### `init(message:retryAfterSeconds:)`

``` swift
public init (
        message: Swift.String? = nil,
        retryAfterSeconds: Swift.String? = nil
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

### `retryAfterSeconds`

``` swift
public var retryAfterSeconds: Swift.String?
```
