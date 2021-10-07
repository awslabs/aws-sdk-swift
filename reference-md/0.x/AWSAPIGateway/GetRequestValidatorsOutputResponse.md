# GetRequestValidatorsOutputResponse

A collection of RequestValidator resources of a given RestApi.

<div class="remarks">
In OpenAPI, the RequestValidators of an API is defined by the <a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-swagger-extensions.html#api-gateway-swagger-extensions-request-validators.html">x-amazon-apigateway-request-validators extension.
</div>
<div class="seeAlso"><a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-method-request-validation.html">Enable Basic Request Validation in API Gateway</div>

``` swift
public struct GetRequestValidatorsOutputResponse: Swift.Equatable 
```

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(items:position:)`

``` swift
public init (
        items: [ApiGatewayClientTypes.RequestValidator]? = nil,
        position: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `items`

The current page of elements from this collection.

``` swift
public var items: [ApiGatewayClientTypes.RequestValidator]?
```

### `position`

The current pagination position in the paged result set.

``` swift
public var position: Swift.String?
```
