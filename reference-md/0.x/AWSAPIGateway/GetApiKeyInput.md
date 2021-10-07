# GetApiKeyInput

A request to get information about the current ApiKey resource.

``` swift
public struct GetApiKeyInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(apiKey:includeValue:)`

``` swift
public init (
        apiKey: Swift.String? = nil,
        includeValue: Swift.Bool? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `apiKey`

\[Required\] The identifier of the ApiKey resource.
This member is required.

``` swift
public var apiKey: Swift.String?
```

### `includeValue`

A boolean flag to specify whether (true) or not (false) the result contains the key value.

``` swift
public var includeValue: Swift.Bool?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
