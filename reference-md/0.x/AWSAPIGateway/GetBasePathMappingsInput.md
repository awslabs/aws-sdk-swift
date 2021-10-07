# GetBasePathMappingsInput

A request to get information about a collection of BasePathMapping resources.

``` swift
public struct GetBasePathMappingsInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(domainName:limit:position:)`

``` swift
public init (
        domainName: Swift.String? = nil,
        limit: Swift.Int? = nil,
        position: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `domainName`

\[Required\] The domain name of a BasePathMapping resource.
This member is required.

``` swift
public var domainName: Swift.String?
```

### `limit`

The maximum number of returned results per page. The default value is 25 and the maximum value is 500.

``` swift
public var limit: Swift.Int?
```

### `position`

The current pagination position in the paged result set.

``` swift
public var position: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
