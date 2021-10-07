# TestInvokeAuthorizerOutputResponse

Represents the response of the test invoke request for a custom Authorizer

``` swift
public struct TestInvokeAuthorizerOutputResponse: Swift.Equatable 
```

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(authorization:claims:clientStatus:latency:log:policy:principalId:)`

``` swift
public init (
        authorization: [Swift.String:[Swift.String]]? = nil,
        claims: [Swift.String:Swift.String]? = nil,
        clientStatus: Swift.Int = 0,
        latency: Swift.Int = 0,
        log: Swift.String? = nil,
        policy: Swift.String? = nil,
        principalId: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `authorization`

``` swift
public var authorization: [Swift.String:[Swift.String]]?
```

### `claims`

The <a href="https:​//openid.net/specs/openid-connect-core-1_0.html#StandardClaims">open identity claims, with any supported custom attributes, returned from the Cognito Your User Pool configured for the API.

``` swift
public var claims: [Swift.String:Swift.String]?
```

### `clientStatus`

The HTTP status code that the client would have received. Value is 0 if the authorizer succeeded.

``` swift
public var clientStatus: Swift.Int
```

### `latency`

The execution latency of the test authorizer request.

``` swift
public var latency: Swift.Int
```

### `log`

The API Gateway execution log for the test authorizer request.

``` swift
public var log: Swift.String?
```

### `policy`

The JSON policy document returned by the Authorizer

``` swift
public var policy: Swift.String?
```

### `principalId`

The principal identity returned by the Authorizer

``` swift
public var principalId: Swift.String?
```
