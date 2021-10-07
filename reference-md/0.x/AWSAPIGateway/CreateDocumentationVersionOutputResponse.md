# CreateDocumentationVersionOutputResponse

A snapshot of the documentation of an API.

<div class="remarks">Publishing API documentation involves creating a documentation version associated with an API stage and exporting the versioned documentation to an external (e.g., OpenAPI) file.</div>
<div class="seeAlso">
<a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-documenting-api.html">Documenting an API, DocumentationPart, DocumentationVersions
</div>

``` swift
public struct CreateDocumentationVersionOutputResponse: Swift.Equatable 
```

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(createdDate:description:version:)`

``` swift
public init (
        createdDate: ClientRuntime.Date? = nil,
        description: Swift.String? = nil,
        version: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `createdDate`

The date when the API documentation snapshot is created.

``` swift
public var createdDate: ClientRuntime.Date?
```

### `description`

The description of the API documentation snapshot.

``` swift
public var description: Swift.String?
```

### `version`

The version identifier of the API documentation snapshot.

``` swift
public var version: Swift.String?
```
