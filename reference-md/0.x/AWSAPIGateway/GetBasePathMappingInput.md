# GetBasePathMappingInput

Request to describe a BasePathMapping resource.

``` swift
public struct GetBasePathMappingInput: Swift.Equatable 
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

\[Required\] The base path name that callers of the API must provide as part of the URL after the domain name. This value must be unique for all of the mappings across a single API. Specify '(none)' if you do not want callers to specify any base path name after the domain name.
This member is required.

``` swift
public var basePath: Swift.String?
```

### `domainName`

\[Required\] The domain name of the BasePathMapping resource to be described.
This member is required.

``` swift
public var domainName: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
