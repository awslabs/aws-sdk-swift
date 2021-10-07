# GetTagsOutputResponse

The collection of tags. Each tag element is associated with a given resource.

``` swift
public struct GetTagsOutputResponse: Swift.Equatable 
```

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(tags:)`

``` swift
public init (
        tags: [Swift.String:Swift.String]? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `tags`

The collection of tags. Each tag element is associated with a given resource.

``` swift
public var tags: [Swift.String:Swift.String]?
```
