# DeleteUsagePlanInput

The DELETE request to delete a usage plan of a given plan Id.

``` swift
public struct DeleteUsagePlanInput: Swift.Equatable 
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

\[Required\] The Id of the to-be-deleted usage plan.
This member is required.

``` swift
public var usagePlanId: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
