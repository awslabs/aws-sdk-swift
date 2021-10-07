# GetModelsOutputResponse

Represents a collection of Model resources.

<div class="seeAlso">
Method, MethodResponse, <a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/models-mappings.html">Models and Mappings
</div>

``` swift
public struct GetModelsOutputResponse: Swift.Equatable 
```

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(items:position:)`

``` swift
public init (
        items: [ApiGatewayClientTypes.Model]? = nil,
        position: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `items`

The current page of elements from this collection.

``` swift
public var items: [ApiGatewayClientTypes.Model]?
```

### `position`

The current pagination position in the paged result set.

``` swift
public var position: Swift.String?
```
