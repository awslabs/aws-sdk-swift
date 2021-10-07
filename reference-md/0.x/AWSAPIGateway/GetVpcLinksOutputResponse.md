# GetVpcLinksOutputResponse

The collection of VPC links under the caller's account in a region.

<div class="seeAlso">
<a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/getting-started-with-private-integration.html">Getting Started with Private Integrations,
<a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/set-up-private-integration.html">Set up Private Integrations
</div>

``` swift
public struct GetVpcLinksOutputResponse: Swift.Equatable 
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
        items: [ApiGatewayClientTypes.VpcLink]? = nil,
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
public var items: [ApiGatewayClientTypes.VpcLink]?
```

### `position`

The current pagination position in the paged result set.

``` swift
public var position: Swift.String?
```
