# GetDocumentationPartsOutputResponse

The collection of documentation parts of an API.

<div class="remarks"></div>
<div class="seeAlso">
<a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-documenting-api.html">Documenting an API, DocumentationPart
</div>

``` swift
public struct GetDocumentationPartsOutputResponse: Swift.Equatable 
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
        items: [ApiGatewayClientTypes.DocumentationPart]? = nil,
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
public var items: [ApiGatewayClientTypes.DocumentationPart]?
```

### `position`

The current pagination position in the paged result set.

``` swift
public var position: Swift.String?
```
