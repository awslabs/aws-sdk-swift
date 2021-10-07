# DeleteApiKeyInput

A request to delete the ApiKey resource.

``` swift
public struct DeleteApiKeyInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(apiKey:)`

``` swift
public init (
        apiKey: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `apiKey`

\[Required\] The identifier of the ApiKey resource to be deleted.
This member is required.

``` swift
public var apiKey: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
