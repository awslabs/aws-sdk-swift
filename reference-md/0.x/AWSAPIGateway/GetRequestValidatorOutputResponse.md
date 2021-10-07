# GetRequestValidatorOutputResponse

A set of validation rules for incoming Method requests.

<div class="remarks">
In OpenAPI, a RequestValidator of an API is defined by the <a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-swagger-extensions.html#api-gateway-swagger-extensions-request-validators.requestValidator.html">x-amazon-apigateway-request-validators.requestValidator object. It the referenced using the <a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-swagger-extensions.html#api-gateway-swagger-extensions-request-validator">x-amazon-apigateway-request-validator property.
</div>
<div class="seeAlso"><a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-method-request-validation.html">Enable Basic Request Validation in API Gateway</div>

``` swift
public struct GetRequestValidatorOutputResponse: Swift.Equatable 
```

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(id:name:validateRequestBody:validateRequestParameters:)`

``` swift
public init (
        id: Swift.String? = nil,
        name: Swift.String? = nil,
        validateRequestBody: Swift.Bool = false,
        validateRequestParameters: Swift.Bool = false
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `id`

The identifier of this RequestValidator.

``` swift
public var id: Swift.String?
```

### `name`

The name of this RequestValidator

``` swift
public var name: Swift.String?
```

### `validateRequestBody`

A Boolean flag to indicate whether to validate a request body according to the configured Model schema.

``` swift
public var validateRequestBody: Swift.Bool
```

### `validateRequestParameters`

A Boolean flag to indicate whether to validate request parameters (true) or not (false).

``` swift
public var validateRequestParameters: Swift.Bool
```
