# CreateUsagePlanInput

The POST request to create a usage plan with the name, description, throttle limits and quota limits, as well as the associated API stages, specified in the payload.

``` swift
public struct CreateUsagePlanInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(apiStages:description:name:quota:tags:throttle:)`

``` swift
public init (
        apiStages: [ApiGatewayClientTypes.ApiStage]? = nil,
        description: Swift.String? = nil,
        name: Swift.String? = nil,
        quota: ApiGatewayClientTypes.QuotaSettings? = nil,
        tags: [Swift.String:Swift.String]? = nil,
        throttle: ApiGatewayClientTypes.ThrottleSettings? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `apiStages`

The associated API stages of the usage plan.

``` swift
public var apiStages: [ApiGatewayClientTypes.ApiStage]?
```

### `description`

The description of the usage plan.

``` swift
public var description: Swift.String?
```

### `name`

\[Required\] The name of the usage plan.
This member is required.

``` swift
public var name: Swift.String?
```

### `quota`

The quota of the usage plan.

``` swift
public var quota: ApiGatewayClientTypes.QuotaSettings?
```

### `tags`

The key-value map of strings. The valid character set is \[a-zA-Z+-=.\_:​/\]. The tag key can be up to 128 characters and must not start with aws:​. The tag value can be up to 256 characters.

``` swift
public var tags: [Swift.String:Swift.String]?
```

### `throttle`

The throttling limits of the usage plan.

``` swift
public var throttle: ApiGatewayClientTypes.ThrottleSettings?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
