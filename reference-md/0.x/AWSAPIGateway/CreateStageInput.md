# CreateStageInput

Requests API Gateway to create a Stage resource.

``` swift
public struct CreateStageInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(cacheClusterEnabled:cacheClusterSize:canarySettings:deploymentId:description:documentationVersion:restApiId:stageName:tags:tracingEnabled:variables:)`

``` swift
public init (
        cacheClusterEnabled: Swift.Bool = false,
        cacheClusterSize: ApiGatewayClientTypes.CacheClusterSize? = nil,
        canarySettings: ApiGatewayClientTypes.CanarySettings? = nil,
        deploymentId: Swift.String? = nil,
        description: Swift.String? = nil,
        documentationVersion: Swift.String? = nil,
        restApiId: Swift.String? = nil,
        stageName: Swift.String? = nil,
        tags: [Swift.String:Swift.String]? = nil,
        tracingEnabled: Swift.Bool = false,
        variables: [Swift.String:Swift.String]? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `cacheClusterEnabled`

Whether cache clustering is enabled for the stage.

``` swift
public var cacheClusterEnabled: Swift.Bool
```

### `cacheClusterSize`

The stage's cache cluster size.

``` swift
public var cacheClusterSize: ApiGatewayClientTypes.CacheClusterSize?
```

### `canarySettings`

The canary deployment settings of this stage.

``` swift
public var canarySettings: ApiGatewayClientTypes.CanarySettings?
```

### `deploymentId`

\[Required\] The identifier of the Deployment resource for the Stage resource.
This member is required.

``` swift
public var deploymentId: Swift.String?
```

### `description`

The description of the Stage resource.

``` swift
public var description: Swift.String?
```

### `documentationVersion`

The version of the associated API documentation.

``` swift
public var documentationVersion: Swift.String?
```

### `restApiId`

\[Required\] The string identifier of the associated RestApi.
This member is required.

``` swift
public var restApiId: Swift.String?
```

### `stageName`

\[Required\] The name for the Stage resource. Stage names can only contain alphanumeric characters, hyphens, and underscores. Maximum length is 128 characters.
This member is required.

``` swift
public var stageName: Swift.String?
```

### `tags`

The key-value map of strings. The valid character set is \[a-zA-Z+-=.\_:​/\]. The tag key can be up to 128 characters and must not start with aws:​. The tag value can be up to 256 characters.

``` swift
public var tags: [Swift.String:Swift.String]?
```

### `tracingEnabled`

Specifies whether active tracing with X-ray is enabled for the Stage.

``` swift
public var tracingEnabled: Swift.Bool
```

### `variables`

A map that defines the stage variables for the new Stage resource. Variable names
can have alphanumeric and underscore characters, and the values must match
\[A-Za-z0-9-.\_~:​/?\#&=,\]+.

``` swift
public var variables: [Swift.String:Swift.String]?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
