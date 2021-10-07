# GetUsageInput

The GET request to get the usage data of a usage plan in a specified time interval.

``` swift
public struct GetUsageInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(endDate:keyId:limit:position:startDate:usagePlanId:)`

``` swift
public init (
        endDate: Swift.String? = nil,
        keyId: Swift.String? = nil,
        limit: Swift.Int? = nil,
        position: Swift.String? = nil,
        startDate: Swift.String? = nil,
        usagePlanId: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `endDate`

\[Required\] The ending date (e.g., 2016-12-31) of the usage data.
This member is required.

``` swift
public var endDate: Swift.String?
```

### `keyId`

The Id of the API key associated with the resultant usage data.

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

### `startDate`

\[Required\] The starting date (e.g., 2016-01-01) of the usage data.
This member is required.

``` swift
public var startDate: Swift.String?
```

### `usagePlanId`

\[Required\] The Id of the usage plan associated with the usage data.
This member is required.

``` swift
public var usagePlanId: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
