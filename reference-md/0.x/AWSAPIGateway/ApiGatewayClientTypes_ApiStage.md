# ApiGatewayClientTypes.ApiStage

API stage name of the associated API stage in a usage plan.

``` swift
public struct ApiStage: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.Codable`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(from:)`

``` swift
public init (from decoder: Swift.Decoder) throws 
```

### `init(apiId:stage:throttle:)`

``` swift
public init (
            apiId: Swift.String? = nil,
            stage: Swift.String? = nil,
            throttle: [Swift.String:ApiGatewayClientTypes.ThrottleSettings]? = nil
        )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `apiId`

API Id of the associated API stage in a usage plan.

``` swift
public var apiId: Swift.String?
```

### `stage`

API stage name of the associated API stage in a usage plan.

``` swift
public var stage: Swift.String?
```

### `throttle`

Map containing method level throttling information for API stage in a usage plan.

``` swift
public var throttle: [Swift.String:ApiGatewayClientTypes.ThrottleSettings]?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
