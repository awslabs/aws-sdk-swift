# DeleteDocumentationPartInput

Deletes an existing documentation part of an API.

``` swift
public struct DeleteDocumentationPartInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(documentationPartId:restApiId:)`

``` swift
public init (
        documentationPartId: Swift.String? = nil,
        restApiId: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `documentationPartId`

\[Required\] The identifier of the to-be-deleted documentation part.
This member is required.

``` swift
public var documentationPartId: Swift.String?
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
