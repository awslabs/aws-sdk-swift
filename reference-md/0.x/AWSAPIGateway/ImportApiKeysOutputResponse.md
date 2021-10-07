# ImportApiKeysOutputResponse

The identifier of an ApiKey used in a UsagePlan.

``` swift
public struct ImportApiKeysOutputResponse: Swift.Equatable 
```

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(ids:warnings:)`

``` swift
public init (
        ids: [Swift.String]? = nil,
        warnings: [Swift.String]? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `ids`

A list of all the ApiKey identifiers.

``` swift
public var ids: [Swift.String]?
```

### `warnings`

A list of warning messages.

``` swift
public var warnings: [Swift.String]?
```
