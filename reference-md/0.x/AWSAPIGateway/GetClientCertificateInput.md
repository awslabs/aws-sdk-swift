# GetClientCertificateInput

A request to get information about the current ClientCertificate resource.

``` swift
public struct GetClientCertificateInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(clientCertificateId:)`

``` swift
public init (
        clientCertificateId: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `clientCertificateId`

\[Required\] The identifier of the ClientCertificate resource to be described.
This member is required.

``` swift
public var clientCertificateId: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
