# CreateDocumentationVersionInput

Creates a new documentation version of a given API.

``` swift
public struct CreateDocumentationVersionInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(description:documentationVersion:restApiId:stageName:)`

``` swift
public init (
        description: Swift.String? = nil,
        documentationVersion: Swift.String? = nil,
        restApiId: Swift.String? = nil,
        stageName: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `description`

A description about the new documentation snapshot.

``` swift
public var description: Swift.String?
```

### `documentationVersion`

\[Required\] The version identifier of the new snapshot.
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

### `stageName`

The stage name to be associated with the new documentation snapshot.

``` swift
public var stageName: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
