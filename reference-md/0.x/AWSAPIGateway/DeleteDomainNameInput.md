# DeleteDomainNameInput

A request to delete the DomainName resource.

``` swift
public struct DeleteDomainNameInput: Swift.Equatable 
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

\[Required\] The name of the DomainName resource to be deleted.
This member is required.

``` swift
public var domainName: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
