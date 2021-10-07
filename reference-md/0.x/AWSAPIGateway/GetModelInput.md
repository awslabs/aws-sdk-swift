# GetModelInput

Request to list information about a model in an existing RestApi resource.

``` swift
public struct GetModelInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(flatten:modelName:restApiId:)`

``` swift
public init (
        flatten: Swift.Bool = false,
        modelName: Swift.String? = nil,
        restApiId: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `flatten`

A query parameter of a Boolean value to resolve (true) all external model references and returns a flattened model schema or not (false) The default is false.

``` swift
public var flatten: Swift.Bool
```

### `modelName`

\[Required\] The name of the model as an identifier.
This member is required.

``` swift
public var modelName: Swift.String?
```

### `restApiId`

\[Required\] The RestApi identifier under which the Model exists.
This member is required.

``` swift
public var restApiId: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
