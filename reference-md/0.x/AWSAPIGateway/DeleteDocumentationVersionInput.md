# DeleteDocumentationVersionInput

Deletes an existing documentation version of an API.

``` swift
public struct DeleteDocumentationVersionInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(documentationVersion:restApiId:)`

``` swift
public init (
        documentationVersion: Swift.String? = nil,
        restApiId: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `documentationVersion`

\[Required\] The version identifier of a to-be-deleted documentation snapshot.
This member is required.

``` swift
public var documentationVersion: Swift.String?
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
