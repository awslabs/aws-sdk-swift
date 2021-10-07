# CreateBasePathMappingInput

Requests API Gateway to create a new BasePathMapping resource.

``` swift
public struct CreateBasePathMappingInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(basePath:domainName:restApiId:stage:)`

``` swift
public init (
        basePath: Swift.String? = nil,
        domainName: Swift.String? = nil,
        restApiId: Swift.String? = nil,
        stage: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `basePath`

The base path name that callers of the API must provide as part of the URL after the domain name. This value must be unique for all of the mappings across a single API. Specify '(none)' if you do not want callers to specify a base path name after the domain name.

``` swift
public var basePath: Swift.String?
```

### `domainName`

\[Required\] The domain name of the BasePathMapping resource to create.
This member is required.

``` swift
public var domainName: Swift.String?
```

### `restApiId`

\[Required\] The string identifier of the associated RestApi.
This member is required.

``` swift
public var restApiId: Swift.String?
```

### `stage`

The name of the API's stage that you want to use for this mapping. Specify '(none)' if you want callers to explicitly specify the stage name after any base path name.

``` swift
public var stage: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
