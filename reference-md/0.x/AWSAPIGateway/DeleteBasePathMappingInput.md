# DeleteBasePathMappingInput

A request to delete the BasePathMapping resource.

``` swift
public struct DeleteBasePathMappingInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(basePath:domainName:)`

``` swift
public init (
        basePath: Swift.String? = nil,
        domainName: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `basePath`

\[Required\] The base path name of the BasePathMapping resource to delete.
To specify an empty base path, set this parameter to '(none)'.
This member is required.

``` swift
public var basePath: Swift.String?
```

### `domainName`

\[Required\] The domain name of the BasePathMapping resource to delete.
This member is required.

``` swift
public var domainName: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
