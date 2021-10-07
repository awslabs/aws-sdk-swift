# ApiGatewayClientTypes.DeploymentCanarySettings

The input configuration for a canary deployment.

``` swift
public struct DeploymentCanarySettings: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.Codable`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(from:)`

``` swift
public init (from decoder: Swift.Decoder) throws 
```

### `init(percentTraffic:stageVariableOverrides:useStageCache:)`

``` swift
public init (
            percentTraffic: Swift.Double = 0.0,
            stageVariableOverrides: [Swift.String:Swift.String]? = nil,
            useStageCache: Swift.Bool = false
        )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `percentTraffic`

The percentage (0.0-100.0) of traffic routed to the canary deployment.

``` swift
public var percentTraffic: Swift.Double
```

### `stageVariableOverrides`

A stage variable overrides used for the canary release deployment. They can override existing stage variables or add new stage variables for the canary release deployment. These stage variables are represented as a string-to-string map between stage variable names and their values.

``` swift
public var stageVariableOverrides: [Swift.String:Swift.String]?
```

### `useStageCache`

A Boolean flag to indicate whether the canary release deployment uses the stage cache or not.

``` swift
public var useStageCache: Swift.Bool
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
