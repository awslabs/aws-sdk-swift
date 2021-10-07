# TestInvokeMethodInput

Make a request to simulate the execution of a Method.

``` swift
public struct TestInvokeMethodInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(body:clientCertificateId:headers:httpMethod:multiValueHeaders:pathWithQueryString:resourceId:restApiId:stageVariables:)`

``` swift
public init (
        body: Swift.String? = nil,
        clientCertificateId: Swift.String? = nil,
        headers: [Swift.String:Swift.String]? = nil,
        httpMethod: Swift.String? = nil,
        multiValueHeaders: [Swift.String:[Swift.String]]? = nil,
        pathWithQueryString: Swift.String? = nil,
        resourceId: Swift.String? = nil,
        restApiId: Swift.String? = nil,
        stageVariables: [Swift.String:Swift.String]? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `body`

The simulated request body of an incoming invocation request.

``` swift
public var body: Swift.String?
```

### `clientCertificateId`

A ClientCertificate identifier to use in the test invocation. API Gateway will use the certificate when making the HTTPS request to the defined back-end endpoint.

``` swift
public var clientCertificateId: Swift.String?
```

### `headers`

A key-value map of headers to simulate an incoming invocation request.

``` swift
public var headers: [Swift.String:Swift.String]?
```

### `httpMethod`

\[Required\] Specifies a test invoke method request's HTTP method.
This member is required.

``` swift
public var httpMethod: Swift.String?
```

### `multiValueHeaders`

The headers as a map from string to list of values to simulate an incoming invocation request.

``` swift
public var multiValueHeaders: [Swift.String:[Swift.String]]?
```

### `pathWithQueryString`

The URI path, including query string, of the simulated invocation request. Use this to specify path parameters and query string parameters.

``` swift
public var pathWithQueryString: Swift.String?
```

### `resourceId`

\[Required\] Specifies a test invoke method request's resource ID.
This member is required.

``` swift
public var resourceId: Swift.String?
```

### `restApiId`

\[Required\] The string identifier of the associated RestApi.
This member is required.

``` swift
public var restApiId: Swift.String?
```

### `stageVariables`

A key-value map of stage variables to simulate an invocation on a deployed Stage.

``` swift
public var stageVariables: [Swift.String:Swift.String]?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
