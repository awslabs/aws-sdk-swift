# UpdateUsageInput

The PATCH request to grant a temporary extension to the remaining quota of a usage plan associated with a specified API key.

``` swift
public struct UpdateUsageInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(keyId:patchOperations:usagePlanId:)`

``` swift
public init (
        keyId: Swift.String? = nil,
        patchOperations: [ApiGatewayClientTypes.PatchOperation]? = nil,
        usagePlanId: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `keyId`

\[Required\] The identifier of the API key associated with the usage plan in which a temporary extension is granted to the remaining quota.
This member is required.

``` swift
public var keyId: Swift.String?
```

### `patchOperations`

A list of update operations to be applied to the specified resource and in the order specified in this list.

``` swift
public var patchOperations: [ApiGatewayClientTypes.PatchOperation]?
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
