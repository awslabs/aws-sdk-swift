# CreateUsagePlanKeyInput

The POST request to create a usage plan key for adding an existing API key to a usage plan.

``` swift
public struct CreateUsagePlanKeyInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(keyId:keyType:usagePlanId:)`

``` swift
public init (
        keyId: Swift.String? = nil,
        keyType: Swift.String? = nil,
        usagePlanId: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `keyId`

\[Required\] The identifier of a UsagePlanKey resource for a plan customer.
This member is required.

``` swift
public var keyId: Swift.String?
```

### `keyType`

\[Required\] The type of a UsagePlanKey resource for a plan customer.
This member is required.

``` swift
public var keyType: Swift.String?
```

### `usagePlanId`

\[Required\] The Id of the UsagePlan resource representing the usage plan containing the to-be-created UsagePlanKey resource representing a plan customer.
This member is required.

``` swift
public var usagePlanId: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
