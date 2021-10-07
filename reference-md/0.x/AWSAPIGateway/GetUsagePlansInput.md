# GetUsagePlansInput

The GET request to get all the usage plans of the caller's account.

``` swift
public struct GetUsagePlansInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(keyId:limit:position:)`

``` swift
public init (
        keyId: Swift.String? = nil,
        limit: Swift.Int? = nil,
        position: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `keyId`

The identifier of the API key associated with the usage plans.

``` swift
public var keyId: Swift.String?
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
