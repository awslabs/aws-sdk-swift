# UpdateIntegrationResponseOutputResponse

Represents an integration response. The status code must map to an existing MethodResponse, and parameters and templates can be used to transform the back-end response.

<div class="seeAlso">
<a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/how-to-create-api.html">Creating an API
</div>

``` swift
public struct UpdateIntegrationResponseOutputResponse: Swift.Equatable 
```

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(contentHandling:responseParameters:responseTemplates:selectionPattern:statusCode:)`

``` swift
public init (
        contentHandling: ApiGatewayClientTypes.ContentHandlingStrategy? = nil,
        responseParameters: [Swift.String:Swift.String]? = nil,
        responseTemplates: [Swift.String:Swift.String]? = nil,
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

### `responseParameters`

A key-value map specifying response parameters that are passed to the method response from the back end.
The key is a method response header parameter name and the mapped value is an integration response header value, a static value enclosed within a pair of single quotes, or a JSON expression from the integration response body. The mapping key must match the pattern of method.response.header.{name}, where name is a valid and unique header name. The mapped non-static value must match the pattern of integration.response.header.{name} or integration.response.body.{JSON-expression}, where name is a valid and unique response header name and JSON-expression is a valid JSON expression without the $ prefix.

``` swift
public var responseParameters: [Swift.String:Swift.String]?
```

### `responseTemplates`

Specifies the templates used to transform the integration response body. Response templates are represented as a key/value map, with a content-type as the key and a template as the value.

``` swift
public var responseTemplates: [Swift.String:Swift.String]?
```

### `selectionPattern`

Specifies the regular expression (regex) pattern used to choose an integration response based on the response from the back end. For example, if the success response returns nothing and the error response returns some string, you could use the .+ regex to match error response. However, make sure that the error response does not contain any newline (\\n) character in such cases. If the back end is an AWS Lambda function, the AWS Lambda function error header is matched. For all other HTTP and AWS back ends, the HTTP status code is matched.

``` swift
public var selectionPattern: Swift.String?
```

### `statusCode`

Specifies the status code that is used to map the integration response to an existing MethodResponse.

``` swift
public var statusCode: Swift.String?
```
