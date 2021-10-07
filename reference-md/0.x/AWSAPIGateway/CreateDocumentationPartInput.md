# CreateDocumentationPartInput

Creates a new documentation part of a given API.

``` swift
public struct CreateDocumentationPartInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(location:properties:restApiId:)`

``` swift
public init (
        location: ApiGatewayClientTypes.DocumentationPartLocation? = nil,
        properties: Swift.String? = nil,
        restApiId: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `location`

\[Required\] The location of the targeted API entity of the to-be-created documentation part.
This member is required.

``` swift
public var location: ApiGatewayClientTypes.DocumentationPartLocation?
```

### `properties`

\[Required\] The new documentation content map of the targeted API entity. Enclosed key-value pairs are API-specific, but only OpenAPI-compliant key-value pairs can be exported and, hence, published.
This member is required.

``` swift
public var properties: Swift.String?
```

### `restApiId`

\[Required\] The string identifier of the associated RestApi.
This member is required.

``` swift
public var restApiId: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
