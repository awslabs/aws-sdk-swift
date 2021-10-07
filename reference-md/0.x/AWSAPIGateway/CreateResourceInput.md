# CreateResourceInput

Requests API Gateway to create a Resource resource.

``` swift
public struct CreateResourceInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(parentId:pathPart:restApiId:)`

``` swift
public init (
        parentId: Swift.String? = nil,
        pathPart: Swift.String? = nil,
        restApiId: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `parentId`

\[Required\] The parent resource's identifier.
This member is required.

``` swift
public var parentId: Swift.String?
```

### `pathPart`

The last path segment for this resource.
This member is required.

``` swift
public var pathPart: Swift.String?
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
