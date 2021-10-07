# CreateModelInput

Request to add a new Model to an existing RestApi resource.

``` swift
public struct CreateModelInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(contentType:description:name:restApiId:schema:)`

``` swift
public init (
        contentType: Swift.String? = nil,
        description: Swift.String? = nil,
        name: Swift.String? = nil,
        restApiId: Swift.String? = nil,
        schema: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `contentType`

\[Required\] The content-type for the model.
This member is required.

``` swift
public var contentType: Swift.String?
```

### `description`

The description of the model.

``` swift
public var description: Swift.String?
```

### `name`

\[Required\] The name of the model. Must be alphanumeric.
This member is required.

``` swift
public var name: Swift.String?
```

### `restApiId`

\[Required\] The RestApi identifier under which the Model will be created.
This member is required.

``` swift
public var restApiId: Swift.String?
```

### `schema`

The schema for the model. For application/json models, this should be <a target="_blank" href="https:​//tools.ietf.org/html/draft-zyp-json-schema-04">JSON schema draft 4 model.

``` swift
public var schema: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
