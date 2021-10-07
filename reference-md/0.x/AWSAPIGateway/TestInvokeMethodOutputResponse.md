# TestInvokeMethodOutputResponse

Represents the response of the test invoke request in the HTTP method.

<div class="seeAlso">
<a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/how-to-test-method.html#how-to-test-method-console">Test API using the API Gateway console
</div>

``` swift
public struct TestInvokeMethodOutputResponse: Swift.Equatable 
```

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(body:headers:latency:log:multiValueHeaders:status:)`

``` swift
public init (
        body: Swift.String? = nil,
        headers: [Swift.String:Swift.String]? = nil,
        latency: Swift.Int = 0,
        log: Swift.String? = nil,
        multiValueHeaders: [Swift.String:[Swift.String]]? = nil,
        status: Swift.Int = 0
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `body`

The body of the HTTP response.

``` swift
public var body: Swift.String?
```

### `headers`

The headers of the HTTP response.

``` swift
public var headers: [Swift.String:Swift.String]?
```

### `latency`

The execution latency of the test invoke request.

``` swift
public var latency: Swift.Int
```

### `log`

The API Gateway execution log for the test invoke request.

``` swift
public var log: Swift.String?
```

### `multiValueHeaders`

The headers of the HTTP response as a map from string to list of values.

``` swift
public var multiValueHeaders: [Swift.String:[Swift.String]]?
```

### `status`

The HTTP status code.

``` swift
public var status: Swift.Int
```
