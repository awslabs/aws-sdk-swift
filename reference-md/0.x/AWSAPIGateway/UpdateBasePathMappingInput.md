# UpdateBasePathMappingInput

A request to change information about the BasePathMapping resource.

``` swift
public struct UpdateBasePathMappingInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(basePath:domainName:patchOperations:)`

``` swift
public init (
        basePath: Swift.String? = nil,
        domainName: Swift.String? = nil,
        patchOperations: [ApiGatewayClientTypes.PatchOperation]? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `basePath`

\[Required\] The base path of the BasePathMapping resource to change.
To specify an empty base path, set this parameter to '(none)'.
This member is required.

``` swift
public var basePath: Swift.String?
```

### `domainName`

\[Required\] The domain name of the BasePathMapping resource to change.
This member is required.

``` swift
public var domainName: Swift.String?
```

### `patchOperations`

A list of update operations to be applied to the specified resource and in the order specified in this list.

``` swift
public var patchOperations: [ApiGatewayClientTypes.PatchOperation]?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
