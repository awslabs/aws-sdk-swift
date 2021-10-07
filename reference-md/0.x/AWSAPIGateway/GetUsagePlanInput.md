# GetUsagePlanInput

The GET request to get a usage plan of a given plan identifier.

``` swift
public struct GetUsagePlanInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(usagePlanId:)`

``` swift
public init (
        usagePlanId: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `usagePlanId`

\[Required\] The identifier of the UsagePlan resource to be retrieved.
This member is required.

``` swift
public var usagePlanId: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
