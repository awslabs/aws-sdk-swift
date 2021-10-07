# PutMethodResponseInput

Request to add a MethodResponse to an existing Method resource.

``` swift
public struct PutMethodResponseInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(httpMethod:resourceId:responseModels:responseParameters:restApiId:statusCode:)`

``` swift
public init (
        httpMethod: Swift.String? = nil,
        resourceId: Swift.String? = nil,
        responseModels: [Swift.String:Swift.String]? = nil,
        responseParameters: [Swift.String:Swift.Bool]? = nil,
        restApiId: Swift.String? = nil,
        statusCode: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `httpMethod`

\[Required\] The HTTP verb of the Method resource.
This member is required.

``` swift
public var httpMethod: Swift.String?
```

### `resourceId`

\[Required\] The Resource identifier for the Method resource.
This member is required.

``` swift
public var resourceId: Swift.String?
```

### `responseModels`

Specifies the Model resources used for the response's content type. Response models are represented as a key/value map, with a content type as the key and a Model name as the value.

``` swift
public var responseModels: [Swift.String:Swift.String]?
```

### `responseParameters`

A key-value map specifying required or optional response parameters that API Gateway can send back to the caller. A key defines a method response header name and the associated value is a Boolean flag indicating whether the method response parameter is required or not. The method response header names must match the pattern of method.response.header.{name}, where name is a valid and unique header name. The response parameter names defined here are available in the integration response to be mapped from an integration response header expressed in integration.response.header.{name}, a static value enclosed within a pair of single quotes (e.g., 'application/json'), or a JSON expression from the back-end response payload in the form of integration.response.body.{JSON-expression}, where JSON-expression is a valid JSON expression without the $ prefix.)

``` swift
public var responseParameters: [Swift.String:Swift.Bool]?
```

### `restApiId`

\[Required\] The string identifier of the associated RestApi.
This member is required.

``` swift
public var restApiId: Swift.String?
```

### `statusCode`

\[Required\] The method response's status code.
This member is required.

``` swift
public var statusCode: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
