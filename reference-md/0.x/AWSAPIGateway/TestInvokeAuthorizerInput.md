# TestInvokeAuthorizerInput

Make a request to simulate the execution of an Authorizer.

``` swift
public struct TestInvokeAuthorizerInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(additionalContext:authorizerId:body:headers:multiValueHeaders:pathWithQueryString:restApiId:stageVariables:)`

``` swift
public init (
        additionalContext: [Swift.String:Swift.String]? = nil,
        authorizerId: Swift.String? = nil,
        body: Swift.String? = nil,
        headers: [Swift.String:Swift.String]? = nil,
        multiValueHeaders: [Swift.String:[Swift.String]]? = nil,
        pathWithQueryString: Swift.String? = nil,
        restApiId: Swift.String? = nil,
        stageVariables: [Swift.String:Swift.String]? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `additionalContext`

\[Optional\] A key-value map of additional context variables.

``` swift
public var additionalContext: [Swift.String:Swift.String]?
```

### `authorizerId`

\[Required\] Specifies a test invoke authorizer request's Authorizer ID.
This member is required.

``` swift
public var authorizerId: Swift.String?
```

### `body`

\[Optional\] The simulated request body of an incoming invocation request.

``` swift
public var body: Swift.String?
```

### `headers`

\[Required\] A key-value map of headers to simulate an incoming invocation request. This is where the incoming authorization token, or identity source, should be specified.

``` swift
public var headers: [Swift.String:Swift.String]?
```

### `multiValueHeaders`

\[Optional\] The headers as a map from string to list of values to simulate an incoming invocation request. This is where the incoming authorization token, or identity source, may be specified.

``` swift
public var multiValueHeaders: [Swift.String:[Swift.String]]?
```

### `pathWithQueryString`

\[Optional\] The URI path, including query string, of the simulated invocation request. Use this to specify path parameters and query string parameters.

``` swift
public var pathWithQueryString: Swift.String?
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
