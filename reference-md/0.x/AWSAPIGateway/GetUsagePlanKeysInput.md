# GetUsagePlanKeysInput

The GET request to get all the usage plan keys representing the API keys added to a specified usage plan.

``` swift
public struct GetUsagePlanKeysInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(limit:nameQuery:position:usagePlanId:)`

``` swift
public init (
        limit: Swift.Int? = nil,
        nameQuery: Swift.String? = nil,
        position: Swift.String? = nil,
        usagePlanId: Swift.String? = nil
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

### `nameQuery`

A query parameter specifying the name of the to-be-returned usage plan keys.

``` swift
public var nameQuery: Swift.String?
```

### `position`

The current pagination position in the paged result set.

``` swift
public var position: Swift.String?
```

### `usagePlanId`

\[Required\] The Id of the UsagePlan resource representing the usage plan containing the to-be-retrieved UsagePlanKey resource representing a plan customer.
This member is required.

``` swift
public var usagePlanId: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
