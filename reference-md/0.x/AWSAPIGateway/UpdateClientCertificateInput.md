# UpdateClientCertificateInput

A request to change information about an ClientCertificate resource.

``` swift
public struct UpdateClientCertificateInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(clientCertificateId:patchOperations:)`

``` swift
public init (
        clientCertificateId: Swift.String? = nil,
        patchOperations: [ApiGatewayClientTypes.PatchOperation]? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `clientCertificateId`

\[Required\] The identifier of the ClientCertificate resource to be updated.
This member is required.

``` swift
public var clientCertificateId: Swift.String?
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
