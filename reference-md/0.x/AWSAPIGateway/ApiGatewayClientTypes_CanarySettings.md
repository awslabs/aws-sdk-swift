# ApiGatewayClientTypes.CanarySettings

Configuration settings of a canary deployment.

``` swift
public struct CanarySettings: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.Codable`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(from:)`

``` swift
public init (from decoder: Swift.Decoder) throws 
```

### `init(deploymentId:percentTraffic:stageVariableOverrides:useStageCache:)`

``` swift
public init (
            deploymentId: Swift.String? = nil,
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

### `deploymentId`

The ID of the canary deployment.

``` swift
public var deploymentId: Swift.String?
```

### `percentTraffic`

The percent (0-100) of traffic diverted to a canary deployment.

``` swift
public var percentTraffic: Swift.Double
```

### `stageVariableOverrides`

Stage variables overridden for a canary release deployment, including new stage variables introduced in the canary. These stage variables are represented as a string-to-string map between stage variable names and their values.

``` swift
public var stageVariableOverrides: [Swift.String:Swift.String]?
```

### `useStageCache`

A Boolean flag to indicate whether the canary deployment uses the stage cache or not.

``` swift
public var useStageCache: Swift.Bool
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
