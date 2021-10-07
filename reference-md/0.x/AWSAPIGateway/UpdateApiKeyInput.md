# UpdateApiKeyInput

A request to change information about an ApiKey resource.

``` swift
public struct UpdateApiKeyInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(apiKey:patchOperations:)`

``` swift
public init (
        apiKey: Swift.String? = nil,
        patchOperations: [ApiGatewayClientTypes.PatchOperation]? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `apiKey`

\[Required\] The identifier of the ApiKey resource to be updated.
This member is required.

``` swift
public var apiKey: Swift.String?
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
