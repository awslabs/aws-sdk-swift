# GetDomainNamesOutputResponse

Represents a collection of DomainName resources.

<div class="seeAlso">
<a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/how-to-custom-domains.html">Use Client-Side Certificate
</div>

``` swift
public struct GetDomainNamesOutputResponse: Swift.Equatable 
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
        items: [ApiGatewayClientTypes.DomainName]? = nil,
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
public var items: [ApiGatewayClientTypes.DomainName]?
```

### `position`

The current pagination position in the paged result set.

``` swift
public var position: Swift.String?
```
