# GetDomainNameInput

Request to get the name of a DomainName resource.

``` swift
public struct GetDomainNameInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(domainName:)`

``` swift
public init (
        domainName: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `domainName`

\[Required\] The name of the DomainName resource.
This member is required.

``` swift
public var domainName: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
