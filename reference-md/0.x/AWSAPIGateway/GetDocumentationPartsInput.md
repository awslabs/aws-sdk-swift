# GetDocumentationPartsInput

Gets the documentation parts of an API. The result may be filtered by the type, name, or path of API entities (targets).

``` swift
public struct GetDocumentationPartsInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(limit:locationStatus:nameQuery:path:position:restApiId:type:)`

``` swift
public init (
        limit: Swift.Int? = nil,
        locationStatus: ApiGatewayClientTypes.LocationStatusType? = nil,
        nameQuery: Swift.String? = nil,
        path: Swift.String? = nil,
        position: Swift.String? = nil,
        restApiId: Swift.String? = nil,
        type: ApiGatewayClientTypes.DocumentationPartType? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `limit`

The maximum number of returned results per page. The default value is 25 and the maximum value is 500.

``` swift
public var limit: Swift.Int?
```

### `locationStatus`

The status of the API documentation parts to retrieve. Valid values are DOCUMENTED for retrieving DocumentationPart resources with content and UNDOCUMENTED for DocumentationPart resources without content.

``` swift
public var locationStatus: ApiGatewayClientTypes.LocationStatusType?
```

### `nameQuery`

The name of API entities of the to-be-retrieved documentation parts.

``` swift
public var nameQuery: Swift.String?
```

### `path`

The path of API entities of the to-be-retrieved documentation parts.

``` swift
public var path: Swift.String?
```

### `position`

The current pagination position in the paged result set.

``` swift
public var position: Swift.String?
```

### `restApiId`

\[Required\] The string identifier of the associated RestApi.
This member is required.

``` swift
public var restApiId: Swift.String?
```

### `type`

The type of API entities of the to-be-retrieved documentation parts.

``` swift
public var type: ApiGatewayClientTypes.DocumentationPartType?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
