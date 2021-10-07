# GetDocumentationVersionsOutputResponse

The collection of documentation snapshots of an API.

<div class="remarks">Use the DocumentationVersions to manage documentation snapshots associated with various API stages.</div>
<div class="seeAlso">
<a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-documenting-api.html">Documenting an API, DocumentationPart, DocumentationVersion
</div>

``` swift
public struct GetDocumentationVersionsOutputResponse: Swift.Equatable 
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
        items: [ApiGatewayClientTypes.DocumentationVersion]? = nil,
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
public var items: [ApiGatewayClientTypes.DocumentationVersion]?
```

### `position`

The current pagination position in the paged result set.

``` swift
public var position: Swift.String?
```
