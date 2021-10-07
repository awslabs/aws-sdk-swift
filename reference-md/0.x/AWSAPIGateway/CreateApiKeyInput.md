# CreateApiKeyInput

Request to create an ApiKey resource.

``` swift
public struct CreateApiKeyInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(customerId:description:enabled:generateDistinctId:name:stageKeys:tags:value:)`

``` swift
public init (
        customerId: Swift.String? = nil,
        description: Swift.String? = nil,
        enabled: Swift.Bool = false,
        generateDistinctId: Swift.Bool = false,
        name: Swift.String? = nil,
        stageKeys: [ApiGatewayClientTypes.StageKey]? = nil,
        tags: [Swift.String:Swift.String]? = nil,
        value: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `customerId`

An AWS Marketplace customer identifier , when integrating with the AWS SaaS Marketplace.

``` swift
public var customerId: Swift.String?
```

### `description`

The description of the ApiKey.

``` swift
public var description: Swift.String?
```

### `enabled`

Specifies whether the ApiKey can be used by callers.

``` swift
public var enabled: Swift.Bool
```

### `generateDistinctId`

Specifies whether (true) or not (false) the key identifier is distinct from the created API key value. This parameter is deprecated and should not be used.

``` swift
public var generateDistinctId: Swift.Bool
```

### `name`

The name of the ApiKey.

``` swift
public var name: Swift.String?
```

### `stageKeys`

DEPRECATED FOR USAGE PLANS - Specifies stages associated with the API key.

``` swift
public var stageKeys: [ApiGatewayClientTypes.StageKey]?
```

### `tags`

The key-value map of strings. The valid character set is \[a-zA-Z+-=.\_:​/\]. The tag key can be up to 128 characters and must not start with aws:​. The tag value can be up to 256 characters.

``` swift
public var tags: [Swift.String:Swift.String]?
```

### `value`

Specifies a value of the API key. <!-- Why is this declared as the input to create an API key? As a form of copying an existing key value into a new API key? -->

``` swift
public var value: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
