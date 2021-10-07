# PutIntegrationResponseInput

Represents a put integration response request.

``` swift
public struct PutIntegrationResponseInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(contentHandling:httpMethod:resourceId:responseParameters:responseTemplates:restApiId:selectionPattern:statusCode:)`

``` swift
public init (
        contentHandling: ApiGatewayClientTypes.ContentHandlingStrategy? = nil,
        httpMethod: Swift.String? = nil,
        resourceId: Swift.String? = nil,
        responseParameters: [Swift.String:Swift.String]? = nil,
        responseTemplates: [Swift.String:Swift.String]? = nil,
        restApiId: Swift.String? = nil,
        selectionPattern: Swift.String? = nil,
        statusCode: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `contentHandling`

Specifies how to handle response payload content type conversions. Supported values are CONVERT\_TO\_BINARY and CONVERT\_TO\_TEXT, with the following behaviors:​

``` swift
public var contentHandling: ApiGatewayClientTypes.ContentHandlingStrategy?
```

``` 
  CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string to the corresponding binary blob.
  CONVERT_TO_TEXT: Converts a response payload from a binary blob to a Base64-encoded string.

If this property is not defined, the response payload will be passed through from the integration response to the method response without modification.
```

### `httpMethod`

\[Required\] Specifies a put integration response request's HTTP method.
This member is required.

``` swift
public var httpMethod: Swift.String?
```

### `resourceId`

\[Required\] Specifies a put integration response request's resource identifier.
This member is required.

``` swift
public var resourceId: Swift.String?
```

### `responseParameters`

A key-value map specifying response parameters that are passed to the method response from the back end.
The key is a method response header parameter name and the mapped value is an integration response header value, a static value enclosed within a pair of single quotes, or a JSON expression from the integration response body. The mapping key must match the pattern of method.response.header.{name}, where name is a valid and unique header name. The mapped non-static value must match the pattern of integration.response.header.{name} or integration.response.body.{JSON-expression}, where name must be a valid and unique response header name and JSON-expression a valid JSON expression without the $ prefix.

``` swift
public var responseParameters: [Swift.String:Swift.String]?
```

### `responseTemplates`

Specifies a put integration response's templates.

``` swift
public var responseTemplates: [Swift.String:Swift.String]?
```

### `restApiId`

\[Required\] The string identifier of the associated RestApi.
This member is required.

``` swift
public var restApiId: Swift.String?
```

### `selectionPattern`

Specifies the selection pattern of a put integration response.

``` swift
public var selectionPattern: Swift.String?
```

### `statusCode`

\[Required\] Specifies the status code that is used to map the integration response to an existing MethodResponse.
This member is required.

``` swift
public var statusCode: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
