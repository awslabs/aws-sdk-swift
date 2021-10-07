# ApiGatewayClientTypes.BasePathMapping

Represents the base path that callers of the API must provide as part of the URL after the domain name.

<div class="remarks">A custom domain name plus a BasePathMapping specification identifies a deployed RestApi in a given stage of the owner Account.</div>
<div class="seeAlso">
<a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/how-to-custom-domains.html">Use Custom Domain Names
</div>

``` swift
public struct BasePathMapping: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.Codable`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(from:)`

``` swift
public init (from decoder: Swift.Decoder) throws 
```

### `init(basePath:restApiId:stage:)`

``` swift
public init (
            basePath: Swift.String? = nil,
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

The base path name that callers of the API must provide as part of the URL after the domain name.

``` swift
public var basePath: Swift.String?
```

### `restApiId`

The string identifier of the associated RestApi.

``` swift
public var restApiId: Swift.String?
```

### `stage`

The name of the associated stage.

``` swift
public var stage: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
