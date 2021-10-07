# GetStagesOutputResponse

A list of Stage resources that are associated with the ApiKey resource.

<div class="seeAlso"><a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/stages.html">Deploying API in Stages</div>

``` swift
public struct GetStagesOutputResponse: Swift.Equatable 
```

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(item:)`

``` swift
public init (
        item: [ApiGatewayClientTypes.Stage]? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `item`

The current page of elements from this collection.

``` swift
public var item: [ApiGatewayClientTypes.Stage]?
```
