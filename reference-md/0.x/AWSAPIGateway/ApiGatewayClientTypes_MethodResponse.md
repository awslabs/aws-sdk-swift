# ApiGatewayClientTypes.MethodResponse

Represents a method response of a given HTTP status code returned to the client. The method response is passed from the back end through the associated integration response that can be transformed using a mapping template. <!-- API Gateway sends back the status code to the caller as the HTTP status code. Parameters and models can be used to transform the response from the method's integration.-->

<div class="remarks">

``` swift
public struct MethodResponse: Swift.Equatable 
```

``` 
      <h4>Example: A MethodResponse instance of an API</h4>
      <h5>Request</h5>
      The example request retrieves a MethodResponse of the 200 status code.
      <pre>GET /restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/200 HTTP/1.1
```

Content-Type: application/json
Host: apigateway.us-east-1.amazonaws.com
X-Amz-Date: 20160603T222952Z
Authorization: AWS4-HMAC-SHA256 Credential={access\_key\_ID}/20160603/us-east-1/apigateway/aws4\_request, SignedHeaders=content-type;host;x-amz-date, Signature={sig4\_hash}</pre>

<h5>Response</h5>
The successful response returns 200 OK status and a payload as follows:
<pre>{
"\_links": {
"curies": {
"href": "https://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-method-response-{rel}.html",
"name": "methodresponse",
"templated": true
},
"self": {
"href": "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/200",
"title": "200"
},
"methodresponse:delete": {
"href": "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/200"
},
"methodresponse:update": {
"href": "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/200"
}
},
"responseModels": {
"application/json": "Empty"
},
"responseParameters": {
"method.response.header.Content-Type": false
},
"statusCode": "200"
}</pre>

``` 
  </div>
  <div class="seeAlso">
    Method, IntegrationResponse, Integration
    <a href="https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-create-api.html">Creating an API
  </div>
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.Codable`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(from:)`

``` swift
public init (from decoder: Swift.Decoder) throws 
```

### `init(responseModels:responseParameters:statusCode:)`

``` swift
public init (
            responseModels: [Swift.String:Swift.String]? = nil,
            responseParameters: [Swift.String:Swift.Bool]? = nil,
            statusCode: Swift.String? = nil
        )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `responseModels`

Specifies the Model resources used for the response's content-type. Response models are represented as a key/value map, with a content-type as the key and a Model name as the value.

``` swift
public var responseModels: [Swift.String:Swift.String]?
```

### `responseParameters`

A key-value map specifying required or optional response parameters that API Gateway can send back to the caller. A key defines a method response header and the value specifies whether the associated method response header is required or not. The expression of the key must match the pattern method.response.header.{name}, where name is a valid and unique header name. API Gateway passes certain integration response data to the method response headers specified here according to the mapping you prescribe in the API's IntegrationResponse. The integration response data that can be mapped include an integration response header expressed in integration.response.header.{name}, a static value enclosed within a pair of single quotes (e.g., 'application/json'), or a JSON expression from the back-end response payload in the form of integration.response.body.{JSON-expression}, where JSON-expression is a valid JSON expression without the $ prefix.)

``` swift
public var responseParameters: [Swift.String:Swift.Bool]?
```

### `statusCode`

The method response's status code.

``` swift
public var statusCode: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
