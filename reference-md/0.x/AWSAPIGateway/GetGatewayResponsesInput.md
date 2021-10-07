# GetGatewayResponsesInput

Gets the GatewayResponses collection on the given RestApi. If an API developer has not added any definitions for gateway responses, the result will be the API Gateway-generated default GatewayResponses collection for the supported response types.

``` swift
public struct GetGatewayResponsesInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(limit:position:restApiId:)`

``` swift
public init (
        limit: Swift.Int? = nil,
        position: Swift.String? = nil,
        restApiId: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `limit`

The maximum number of returned results per page. The default value is 25 and the maximum value is 500. The GatewayResponses collection does not support pagination and the limit does not apply here.

``` swift
public var limit: Swift.Int?
```

### `position`

The current pagination position in the paged result set. The GatewayResponse collection does not support pagination and the position does not apply here.

``` swift
public var position: Swift.String?
```

### `restApiId`

\[Required\] The string identifier of the associated RestApi.
This member is required.

``` swift
public var restApiId: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
