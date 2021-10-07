# GetApiKeysOutputResponse

Represents a collection of API keys as represented by an ApiKeys resource.

<div class="seeAlso">
<a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/how-to-api-keys.html">Use API Keys
</div>

``` swift
public struct GetApiKeysOutputResponse: Swift.Equatable 
```

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(items:position:warnings:)`

``` swift
public init (
        items: [ApiGatewayClientTypes.ApiKey]? = nil,
        position: Swift.String? = nil,
        warnings: [Swift.String]? = nil
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
public var items: [ApiGatewayClientTypes.ApiKey]?
```

### `position`

The current pagination position in the paged result set.

``` swift
public var position: Swift.String?
```

### `warnings`

A list of warning messages logged during the import of API keys when the failOnWarnings option is set to true.

``` swift
public var warnings: [Swift.String]?
```
