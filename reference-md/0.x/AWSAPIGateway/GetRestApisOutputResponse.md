# GetRestApisOutputResponse

Contains references to your APIs and links that guide you in how to interact with your collection. A collection offers a paginated view of your APIs.

<div class="seeAlso">
<a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/how-to-create-api.html">Create an API
</div>

``` swift
public struct GetRestApisOutputResponse: Swift.Equatable 
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
        items: [ApiGatewayClientTypes.RestApi]? = nil,
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
public var items: [ApiGatewayClientTypes.RestApi]?
```

### `position`

The current pagination position in the paged result set.

``` swift
public var position: Swift.String?
```
