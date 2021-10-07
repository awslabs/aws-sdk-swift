# UpdateVpcLinkInput

Updates an existing VpcLink of a specified identifier.

``` swift
public struct UpdateVpcLinkInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(patchOperations:vpcLinkId:)`

``` swift
public init (
        patchOperations: [ApiGatewayClientTypes.PatchOperation]? = nil,
        vpcLinkId: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `patchOperations`

A list of update operations to be applied to the specified resource and in the order specified in this list.

``` swift
public var patchOperations: [ApiGatewayClientTypes.PatchOperation]?
```

### `vpcLinkId`

\[Required\] The identifier of the  VpcLink. It is used in an Integration to reference this VpcLink.
This member is required.

``` swift
public var vpcLinkId: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
