# GetVpcLinksInput

Gets the VpcLinks collection under the caller's account in a selected region.

``` swift
public struct GetVpcLinksInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(limit:position:)`

``` swift
public init (
        limit: Swift.Int? = nil,
        position: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
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
