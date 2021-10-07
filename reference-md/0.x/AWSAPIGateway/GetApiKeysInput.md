# GetApiKeysInput

A request to get information about the current ApiKeys resource.

``` swift
public struct GetApiKeysInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(customerId:includeValues:limit:nameQuery:position:)`

``` swift
public init (
        customerId: Swift.String? = nil,
        includeValues: Swift.Bool? = nil,
        limit: Swift.Int? = nil,
        nameQuery: Swift.String? = nil,
        position: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `customerId`

The identifier of a customer in AWS Marketplace or an external system, such as a developer portal.

``` swift
public var customerId: Swift.String?
```

### `includeValues`

A boolean flag to specify whether (true) or not (false) the result contains key values.

``` swift
public var includeValues: Swift.Bool?
```

### `limit`

The maximum number of returned results per page. The default value is 25 and the maximum value is 500.

``` swift
public var limit: Swift.Int?
```

### `nameQuery`

The name of queried API keys.

``` swift
public var nameQuery: Swift.String?
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
