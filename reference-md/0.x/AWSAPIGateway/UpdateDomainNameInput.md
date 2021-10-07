# UpdateDomainNameInput

A request to change information about the DomainName resource.

``` swift
public struct UpdateDomainNameInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(domainName:patchOperations:)`

``` swift
public init (
        domainName: Swift.String? = nil,
        patchOperations: [ApiGatewayClientTypes.PatchOperation]? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `domainName`

\[Required\] The name of the DomainName resource to be changed.
This member is required.

``` swift
public var domainName: Swift.String?
```

### `patchOperations`

A list of update operations to be applied to the specified resource and in the order specified in this list.

``` swift
public var patchOperations: [ApiGatewayClientTypes.PatchOperation]?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
