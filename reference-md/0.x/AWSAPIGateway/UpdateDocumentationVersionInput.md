# UpdateDocumentationVersionInput

Updates an existing documentation version of an API.

``` swift
public struct UpdateDocumentationVersionInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(documentationVersion:patchOperations:restApiId:)`

``` swift
public init (
        documentationVersion: Swift.String? = nil,
        patchOperations: [ApiGatewayClientTypes.PatchOperation]? = nil,
        restApiId: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `documentationVersion`

\[Required\] The version identifier of the to-be-updated documentation version.
This member is required.

``` swift
public var documentationVersion: Swift.String?
```

### `patchOperations`

A list of update operations to be applied to the specified resource and in the order specified in this list.

``` swift
public var patchOperations: [ApiGatewayClientTypes.PatchOperation]?
```

### `restApiId`

\[Required\] The string identifier of the associated RestApi..
This member is required.

``` swift
public var restApiId: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
