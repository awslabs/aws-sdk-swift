# DeleteVpcLinkInput

Deletes an existing VpcLink of a specified identifier.

``` swift
public struct DeleteVpcLinkInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(vpcLinkId:)`

``` swift
public init (
        vpcLinkId: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
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
