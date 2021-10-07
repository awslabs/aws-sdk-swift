# CreateRestApiOutputResponse

Represents a REST API.

<div class="seeAlso">
<a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/how-to-create-api.html">Create an API
</div>

``` swift
public struct CreateRestApiOutputResponse: Swift.Equatable 
```

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(apiKeySource:binaryMediaTypes:createdDate:description:disableExecuteApiEndpoint:endpointConfiguration:id:minimumCompressionSize:name:policy:tags:version:warnings:)`

``` swift
public init (
        apiKeySource: ApiGatewayClientTypes.ApiKeySourceType? = nil,
        binaryMediaTypes: [Swift.String]? = nil,
        createdDate: ClientRuntime.Date? = nil,
        description: Swift.String? = nil,
        disableExecuteApiEndpoint: Swift.Bool = false,
        endpointConfiguration: ApiGatewayClientTypes.EndpointConfiguration? = nil,
        id: Swift.String? = nil,
        minimumCompressionSize: Swift.Int? = nil,
        name: Swift.String? = nil,
        policy: Swift.String? = nil,
        tags: [Swift.String:Swift.String]? = nil,
        version: Swift.String? = nil,
        warnings: [Swift.String]? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `apiKeySource`

The source of the API key for metering requests according to a usage plan. Valid values are:​ HEADER to read the API key from the X-API-Key header of a request. AUTHORIZER to read the API key from the UsageIdentifierKey from a custom authorizer.

``` swift
public var apiKeySource: ApiGatewayClientTypes.ApiKeySourceType?
```

### `binaryMediaTypes`

The list of binary media types supported by the RestApi. By default, the RestApi supports only UTF-8-encoded text payloads.

``` swift
public var binaryMediaTypes: [Swift.String]?
```

### `createdDate`

The timestamp when the API was created.

``` swift
public var createdDate: ClientRuntime.Date?
```

### `description`

The API's description.

``` swift
public var description: Swift.String?
```

### `disableExecuteApiEndpoint`

Specifies whether clients can invoke your API by using the default execute-api endpoint. By default, clients can invoke your API with the default https:​//{api\_id}.execute-api.{region}.amazonaws.com endpoint. To require that clients use a custom domain name to invoke your API, disable the default endpoint.

``` swift
public var disableExecuteApiEndpoint: Swift.Bool
```

### `endpointConfiguration`

The endpoint configuration of this RestApi showing the endpoint types of the API.

``` swift
public var endpointConfiguration: ApiGatewayClientTypes.EndpointConfiguration?
```

### `id`

The API's identifier. This identifier is unique across all of your APIs in API Gateway.

``` swift
public var id: Swift.String?
```

### `minimumCompressionSize`

A nullable integer that is used to enable compression (with non-negative between 0 and 10485760 (10M) bytes, inclusive) or disable compression (with a null value) on an API. When compression is enabled, compression or decompression is not applied on the payload if the payload size is smaller than this value. Setting it to zero allows compression for any payload size.

``` swift
public var minimumCompressionSize: Swift.Int?
```

### `name`

The API's name.

``` swift
public var name: Swift.String?
```

### `policy`

A stringified JSON policy document that applies to this RestApi regardless of the caller and Method configuration.

``` swift
public var policy: Swift.String?
```

### `tags`

The collection of tags. Each tag element is associated with a given resource.

``` swift
public var tags: [Swift.String:Swift.String]?
```

### `version`

A version identifier for the API.

``` swift
public var version: Swift.String?
```

### `warnings`

The warning messages reported when failonwarnings is turned on during API import.

``` swift
public var warnings: [Swift.String]?
```
