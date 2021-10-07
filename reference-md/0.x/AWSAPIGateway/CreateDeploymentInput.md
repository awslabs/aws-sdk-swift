# CreateDeploymentInput

Requests API Gateway to create a Deployment resource.

``` swift
public struct CreateDeploymentInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(cacheClusterEnabled:cacheClusterSize:canarySettings:description:restApiId:stageDescription:stageName:tracingEnabled:variables:)`

``` swift
public init (
        cacheClusterEnabled: Swift.Bool? = nil,
        cacheClusterSize: ApiGatewayClientTypes.CacheClusterSize? = nil,
        canarySettings: ApiGatewayClientTypes.DeploymentCanarySettings? = nil,
        description: Swift.String? = nil,
        restApiId: Swift.String? = nil,
        stageDescription: Swift.String? = nil,
        stageName: Swift.String? = nil,
        tracingEnabled: Swift.Bool? = nil,
        variables: [Swift.String:Swift.String]? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `cacheClusterEnabled`

Enables a cache cluster for the Stage resource specified in the input.

``` swift
public var cacheClusterEnabled: Swift.Bool?
```

### `cacheClusterSize`

Specifies the cache cluster size for the Stage resource specified in the input, if a cache cluster is enabled.

``` swift
public var cacheClusterSize: ApiGatewayClientTypes.CacheClusterSize?
```

### `canarySettings`

The input configuration for the canary deployment when the deployment is a canary release deployment.

``` swift
public var canarySettings: ApiGatewayClientTypes.DeploymentCanarySettings?
```

### `description`

The description for the Deployment resource to create.

``` swift
public var description: Swift.String?
```

### `restApiId`

\[Required\] The string identifier of the associated RestApi.
This member is required.

``` swift
public var restApiId: Swift.String?
```

### `stageDescription`

The description of the Stage resource for the Deployment resource to create.

``` swift
public var stageDescription: Swift.String?
```

### `stageName`

The name of the Stage resource for the Deployment resource to create.

``` swift
public var stageName: Swift.String?
```

### `tracingEnabled`

Specifies whether active tracing with X-ray is enabled for the Stage.

``` swift
public var tracingEnabled: Swift.Bool?
```

### `variables`

A map that defines the stage variables for the Stage resource that is associated
with the new deployment. Variable names can have alphanumeric and underscore characters, and the values
must match \[A-Za-z0-9-.\_~:​/?\#&=,\]+.

``` swift
public var variables: [Swift.String:Swift.String]?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
