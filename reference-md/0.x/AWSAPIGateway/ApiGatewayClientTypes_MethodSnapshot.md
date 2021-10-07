# ApiGatewayClientTypes.MethodSnapshot

Represents a summary of a Method resource, given a particular date and time.

``` swift
public struct MethodSnapshot: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.Codable`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(from:)`

``` swift
public init (from decoder: Swift.Decoder) throws 
```

### `init(apiKeyRequired:authorizationType:)`

``` swift
public init (
            apiKeyRequired: Swift.Bool = false,
            authorizationType: Swift.String? = nil
        )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `apiKeyRequired`

Specifies whether the method requires a valid ApiKey.

``` swift
public var apiKeyRequired: Swift.Bool
```

### `authorizationType`

The method's authorization type. Valid values are NONE for open access, AWS\_IAM for using AWS IAM permissions, CUSTOM for using a custom authorizer, or COGNITO\_USER\_POOLS for using a Cognito user pool.

``` swift
public var authorizationType: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
