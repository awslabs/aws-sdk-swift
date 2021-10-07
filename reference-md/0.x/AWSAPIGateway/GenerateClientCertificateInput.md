# GenerateClientCertificateInput

A request to generate a ClientCertificate resource.

``` swift
public struct GenerateClientCertificateInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(description:tags:)`

``` swift
public init (
        description: Swift.String? = nil,
        tags: [Swift.String:Swift.String]? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `description`

The description of the ClientCertificate.

``` swift
public var description: Swift.String?
```

### `tags`

The key-value map of strings. The valid character set is \[a-zA-Z+-=.\_:​/\]. The tag key can be up to 128 characters and must not start with aws:​. The tag value can be up to 256 characters.

``` swift
public var tags: [Swift.String:Swift.String]?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
