# GetUsagePlanKeyInput

The GET request to get a usage plan key of a given key identifier.

``` swift
public struct GetUsagePlanKeyInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(keyId:usagePlanId:)`

``` swift
public init (
        keyId: Swift.String? = nil,
        usagePlanId: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `keyId`

\[Required\] The key Id of the to-be-retrieved UsagePlanKey resource representing a plan customer.
This member is required.

``` swift
public var keyId: Swift.String?
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
