# ImportDocumentationPartsOutputResponse

A collection of the imported  DocumentationPart identifiers.

<div class="remarks">This is used to return the result when documentation parts in an external (e.g., OpenAPI) file are imported into API Gateway</div>
<div class="seeAlso">
<a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-documenting-api.html">Documenting an API, <a href="https:​//docs.aws.amazon.com/apigateway/api-reference/link-relation/documentationpart-import/">documentationpart:​import, DocumentationPart
</div>

``` swift
public struct ImportDocumentationPartsOutputResponse: Swift.Equatable 
```

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(ids:warnings:)`

``` swift
public init (
        ids: [Swift.String]? = nil,
        warnings: [Swift.String]? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `ids`

A list of the returned documentation part identifiers.

``` swift
public var ids: [Swift.String]?
```

### `warnings`

A list of warning messages reported during import of documentation parts.

``` swift
public var warnings: [Swift.String]?
```
