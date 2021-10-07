# ApiGatewayClientTypes.UsagePlanKey

Represents a usage plan key to identify a plan customer.

<div class="remarks">
To associate an API stage with a selected API key in a usage plan, you must create a UsagePlanKey resource to represent the selected ApiKey.
</div>"
<div class="seeAlso">
<a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-api-usage-plans.html">Create and Use Usage Plans
</div>

``` swift
public struct UsagePlanKey: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.Codable`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(from:)`

``` swift
public init (from decoder: Swift.Decoder) throws 
```

### `init(id:name:type:value:)`

``` swift
public init (
            id: Swift.String? = nil,
            name: Swift.String? = nil,
            type: Swift.String? = nil,
            value: Swift.String? = nil
        )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `id`

The Id of a usage plan key.

``` swift
public var id: Swift.String?
```

### `name`

The name of a usage plan key.

``` swift
public var name: Swift.String?
```

### `type`

The type of a usage plan key. Currently, the valid key type is API\_KEY.

``` swift
public var type: Swift.String?
```

### `value`

The value of a usage plan key.

``` swift
public var value: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
