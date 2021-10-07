# GetSdkOutputResponse

The binary blob response to GetSdk, which contains the generated SDK.

``` swift
public struct GetSdkOutputResponse: Swift.Equatable 
```

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(body:contentDisposition:contentType:)`

``` swift
public init (
        body: ClientRuntime.Data? = nil,
        contentDisposition: Swift.String? = nil,
        contentType: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `body`

The binary blob response to GetSdk, which contains the generated SDK.

``` swift
public var body: ClientRuntime.Data?
```

### `contentDisposition`

The content-disposition header value in the HTTP response.

``` swift
public var contentDisposition: Swift.String?
```

### `contentType`

The content-type header value in the HTTP response.

``` swift
public var contentType: Swift.String?
```
