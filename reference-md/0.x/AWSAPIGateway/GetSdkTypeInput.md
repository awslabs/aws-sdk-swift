# GetSdkTypeInput

Get an SdkType instance.

``` swift
public struct GetSdkTypeInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(id:)`

``` swift
public init (
        id: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `id`

\[Required\] The identifier of the queried SdkType instance.
This member is required.

``` swift
public var id: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
