# DescribeVoicesOutputResponse

``` swift
public struct DescribeVoicesOutputResponse: Swift.Equatable 
```

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(nextToken:voices:)`

``` swift
public init (
        nextToken: Swift.String? = nil,
        voices: [PollyClientTypes.Voice]? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `nextToken`

The pagination token to use in the next request to continue the
listing of voices. NextToken is returned only if the response
is truncated.

``` swift
public var nextToken: Swift.String?
```

### `voices`

A list of voices with their properties.

``` swift
public var voices: [PollyClientTypes.Voice]?
```
