# GetModelTemplateInput

Request to generate a sample mapping template used to transform the payload.

``` swift
public struct GetModelTemplateInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(modelName:restApiId:)`

``` swift
public init (
        modelName: Swift.String? = nil,
        restApiId: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `modelName`

\[Required\] The name of the model for which to generate a template.
This member is required.

``` swift
public var modelName: Swift.String?
```

### `restApiId`

\[Required\] The string identifier of the associated RestApi.
This member is required.

``` swift
public var restApiId: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
