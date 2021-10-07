# GetMethodOutputResponse

Content-Type:​ application/json
Host:​ apigateway.us-east-1.amazonaws.com
X-Amz-Date:​ 20160603T210259Z
Authorization:​ AWS4-HMAC-SHA256 Credential={access\_key\_ID}/20160603/us-east-1/apigateway/aws4\_request, SignedHeaders=content-type;host;x-amz-date, Signature={sig4\_hash}</pre>

<h5>Response</h5>
The successful response returns a 200 OK status code and a payload similar to the following:​
<pre>{
"\_links":​ {
"curies":​ \[
{
"href":​ "https:​//docs.aws.amazon.com/apigateway/latest/developerguide/restapi-integration-{rel}.html",
"name":​ "integration",
"templated":​ true
},
{
"href":​ "https:​//docs.aws.amazon.com/apigateway/latest/developerguide/restapi-integration-response-{rel}.html",
"name":​ "integrationresponse",
"templated":​ true
},
{
"href":​ "https:​//docs.aws.amazon.com/apigateway/latest/developerguide/restapi-method-{rel}.html",
"name":​ "method",
"templated":​ true
},
{
"href":​ "https:​//docs.aws.amazon.com/apigateway/latest/developerguide/restapi-method-response-{rel}.html",
"name":​ "methodresponse",
"templated":​ true
}
\],
"self":​ {
"href":​ "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET",
"name":​ "GET",
"title":​ "GET"
},
"integration:​put":​ {
"href":​ "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration"
},
"method:​delete":​ {
"href":​ "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET"
},
"method:​integration":​ {
"href":​ "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration"
},
"method:​responses":​ {
"href":​ "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/200",
"name":​ "200",
"title":​ "200"
},
"method:​update":​ {
"href":​ "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET"
},
"methodresponse:​put":​ {
"href":​ "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/{status\_code}",
"templated":​ true
}
},
"apiKeyRequired":​ true,
"authorizationType":​ "NONE",
"httpMethod":​ "GET",
"\_embedded":​ {
"method:​integration":​ {
"\_links":​ {
"self":​ {
"href":​ "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration"
},
"integration:​delete":​ {
"href":​ "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration"
},
"integration:​responses":​ {
"href":​ "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/200",
"name":​ "200",
"title":​ "200"
},
"integration:​update":​ {
"href":​ "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration"
},
"integrationresponse:​put":​ {
"href":​ "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/{status\_code}",
"templated":​ true
}
},
"cacheKeyParameters":​ \[\],
"cacheNamespace":​ "3kzxbg5sa2",
"credentials":​ "arn:​aws:​iam:​:​123456789012:​role/apigAwsProxyRole",
"httpMethod":​ "POST",
"passthroughBehavior":​ "WHEN\_NO\_MATCH",
"requestParameters":​ {
"integration.request.header.Content-Type":​ "'application/x-amz-json-1.1'"
},
"requestTemplates":​ {
"application/json":​ "{\\n}"
},
"type":​ "AWS",
"uri":​ "arn:​aws:​apigateway:​us-east-1:​kinesis:​action/ListStreams",
"\_embedded":​ {
"integration:​responses":​ {
"\_links":​ {
"self":​ {
"href":​ "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/200",
"name":​ "200",
"title":​ "200"
},
"integrationresponse:​delete":​ {
"href":​ "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/200"
},
"integrationresponse:​update":​ {
"href":​ "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/200"
}
},
"responseParameters":​ {
"method.response.header.Content-Type":​ "'application/xml'"
},
"responseTemplates":​ {
"application/json":​ "$util.urlDecode("%3CkinesisStreams%3E%23foreach(%24stream%20in%20%24input.path(%27%24.StreamNames%27))%3Cstream%3E%3Cname%3E%24stream%3C%2Fname%3E%3C%2Fstream%3E%23end%3C%2FkinesisStreams%3E")"
},
"statusCode":​ "200"
}
}
},
"method:​responses":​ {
"\_links":​ {
"self":​ {
"href":​ "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/200",
"name":​ "200",
"title":​ "200"
},
"methodresponse:​delete":​ {
"href":​ "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/200"
},
"methodresponse:​update":​ {
"href":​ "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/200"
}
},
"responseModels":​ {
"application/json":​ "Empty"
},
"responseParameters":​ {
"method.response.header.Content-Type":​ false
},
"statusCode":​ "200"
}
}
}</pre>
In the example above, the response template for the 200 OK response maps the JSON output from the ListStreams action in the back end to an XML output. The mapping template is URL-encoded as %3CkinesisStreams%3E%23foreach(%24stream%20in%20%24input.path(%27%24.StreamNames%27))%3Cstream%3E%3Cname%3E%24stream%3C%2Fname%3E%3C%2Fstream%3E%23end%3C%2FkinesisStreams%3E and the output is decoded using the <a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-mapping-template-reference.html#util-templat-reference">$util.urlDecode() helper function.
</div>
<div class="seeAlso">
MethodResponse, Integration, IntegrationResponse, Resource,
<a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/how-to-method-settings.html">Set up an API's method
</div>

``` swift
public struct GetMethodOutputResponse: Swift.Equatable 
```

``` 
        Represents a client-facing interface by which the client calls the API to access back-end resources. A Method resource is
        integrated with an Integration resource. Both consist of a request and one or more responses. The method request takes
        the client input that is passed to the back end through the integration request. A method response returns the output from
        the back end to the client through an integration response. A method request is embodied in a Method resource, whereas
        an integration request is embodied in an Integration resource.  On the other hand, a method response is represented
        by a MethodResponse resource, whereas an integration response is represented by an IntegrationResponse resource.

    <div class="remarks">

      <h4>Example: Retrive the GET method on a specified resource</h4>
      <h5>Request</h5>
      The following example request retrieves the information about the GET method on an API resource (3kzxbg5sa2) of an API (fugvjdxtri).
      <pre>GET /restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET HTTP/1.1
```

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(apiKeyRequired:authorizationScopes:authorizationType:authorizerId:httpMethod:methodIntegration:methodResponses:operationName:requestModels:requestParameters:requestValidatorId:)`

``` swift
public init (
        apiKeyRequired: Swift.Bool? = nil,
        authorizationScopes: [Swift.String]? = nil,
        authorizationType: Swift.String? = nil,
        authorizerId: Swift.String? = nil,
        httpMethod: Swift.String? = nil,
        methodIntegration: ApiGatewayClientTypes.Integration? = nil,
        methodResponses: [Swift.String:ApiGatewayClientTypes.MethodResponse]? = nil,
        operationName: Swift.String? = nil,
        requestModels: [Swift.String:Swift.String]? = nil,
        requestParameters: [Swift.String:Swift.Bool]? = nil,
        requestValidatorId: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `apiKeyRequired`

A boolean flag specifying whether a valid ApiKey is required to invoke this method.

``` swift
public var apiKeyRequired: Swift.Bool?
```

### `authorizationScopes`

A list of authorization scopes configured on the method. The scopes are used with a COGNITO\_USER\_POOLS authorizer to authorize the method invocation. The authorization works by matching the method scopes against the scopes parsed from the access token in the incoming request. The method invocation is authorized if any method scopes matches a claimed scope in the access token. Otherwise, the invocation is not authorized. When the method scope is configured, the client must provide an access token instead of an identity token for authorization purposes.

``` swift
public var authorizationScopes: [Swift.String]?
```

### `authorizationType`

The method's authorization type. Valid values are NONE for open access, AWS\_IAM for using AWS IAM permissions, CUSTOM for using a custom authorizer, or COGNITO\_USER\_POOLS for using a Cognito user pool.

``` swift
public var authorizationType: Swift.String?
```

### `authorizerId`

The identifier of an Authorizer to use on this method. The authorizationType must be CUSTOM.

``` swift
public var authorizerId: Swift.String?
```

### `httpMethod`

The method's HTTP verb.

``` swift
public var httpMethod: Swift.String?
```

### `methodIntegration`

Gets the method's integration responsible for passing the client-submitted request to the back end and performing necessary transformations to make the request compliant with the back end.

<div class="remarks">

``` swift
public var methodIntegration: ApiGatewayClientTypes.Integration?
```

``` 
    <h4>Example: </h4>
    <h5>Request</h5>

    <pre>GET /restapis/uojnr9hd57/resources/0cjtch/methods/GET/integration HTTP/1.1
```

Content-Type: application/json
Host: apigateway.us-east-1.amazonaws.com
Content-Length: 117
X-Amz-Date: 20160613T213210Z
Authorization: AWS4-HMAC-SHA256 Credential={access\_key\_ID}/20160613/us-east-1/apigateway/aws4\_request, SignedHeaders=content-type;host;x-amz-date, Signature={sig4\_hash}</pre>

<h5>Response</h5>
The successful response returns a 200 OK status code and a payload similar to the following:
<pre>{
"\_links": {
"curies": \[
{
"href": "https://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-integration-{rel}.html",
"name": "integration",
"templated": true
},
{
"href": "https://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-integration-response-{rel}.html",
"name": "integrationresponse",
"templated": true
}
\],
"self": {
"href": "/restapis/uojnr9hd57/resources/0cjtch/methods/GET/integration"
},
"integration:delete": {
"href": "/restapis/uojnr9hd57/resources/0cjtch/methods/GET/integration"
},
"integration:responses": {
"href": "/restapis/uojnr9hd57/resources/0cjtch/methods/GET/integration/responses/200",
"name": "200",
"title": "200"
},
"integration:update": {
"href": "/restapis/uojnr9hd57/resources/0cjtch/methods/GET/integration"
},
"integrationresponse:put": {
"href": "/restapis/uojnr9hd57/resources/0cjtch/methods/GET/integration/responses/{status\_code}",
"templated": true
}
},
"cacheKeyParameters": \[\],
"cacheNamespace": "0cjtch",
"credentials": "arn:aws:iam::123456789012:role/apigAwsProxyRole",
"httpMethod": "POST",
"passthroughBehavior": "WHEN\_NO\_MATCH",
"requestTemplates": {
"application/json": "{\\n    "a":  "$input.params('operand1')",\\n    "b":  "$input.params('operand2')", \\n    "op": "$input.params('operator')"   \\n}"
},
"type": "AWS",
"uri": "arn:aws:apigateway:us-west-2:lambda:path//2015-03-31/functions/arn:aws:lambda:us-west-2:123456789012:function:Calc/invocations",
"\_embedded": {
"integration:responses": {
"\_links": {
"self": {
"href": "/restapis/uojnr9hd57/resources/0cjtch/methods/GET/integration/responses/200",
"name": "200",
"title": "200"
},
"integrationresponse:delete": {
"href": "/restapis/uojnr9hd57/resources/0cjtch/methods/GET/integration/responses/200"
},
"integrationresponse:update": {
"href": "/restapis/uojnr9hd57/resources/0cjtch/methods/GET/integration/responses/200"
}
},
"responseParameters": {
"method.response.header.operator": "integration.response.body.op",
"method.response.header.operand\_2": "integration.response.body.b",
"method.response.header.operand\_1": "integration.response.body.a"
},
"responseTemplates": {
"application/json": "\#set($res = $input.path('$'))\\n{\\n    "result": "$res.a, $res.b, $res.op =\> $res.c",\\n  "a" : "$res.a",\\n  "b" : "$res.b",\\n  "op" : "$res.op",\\n  "c" : "$res.c"\\n}"
},
"selectionPattern": "",
"statusCode": "200"
}
}
}</pre>

``` 
  </div>
  <div class="seeAlso">
    <a href="https://docs.aws.amazon.com/cli/latest/reference/apigateway/get-integration.html">AWS CLI
  </div>
```

### `methodResponses`

Gets a method response associated with a given HTTP status code.

<div class="remarks">
The collection of method responses are encapsulated in a key-value map, where the key is a response's HTTP status code and the value is a MethodResponse resource that specifies the response returned to the caller from the back end through the integration response.
<h4>Example:​ Get a 200 OK response of a GET method</h4>
<h5>Request</h5>

``` swift
public var methodResponses: [Swift.String:ApiGatewayClientTypes.MethodResponse]?
```

``` 
    <pre>GET /restapis/uojnr9hd57/resources/0cjtch/methods/GET/responses/200 HTTP/1.1
```

Content-Type: application/json
Host: apigateway.us-east-1.amazonaws.com
Content-Length: 117
X-Amz-Date: 20160613T215008Z
Authorization: AWS4-HMAC-SHA256 Credential={access\_key\_ID}/20160613/us-east-1/apigateway/aws4\_request, SignedHeaders=content-type;host;x-amz-date, Signature={sig4\_hash}</pre>

<h5>Response</h5>
The successful response returns a 200 OK status code and a payload similar to the following:
<pre>{
"\_links": {
"curies": {
"href": "https://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-method-response-{rel}.html",
"name": "methodresponse",
"templated": true
},
"self": {
"href": "/restapis/uojnr9hd57/resources/0cjtch/methods/GET/responses/200",
"title": "200"
},
"methodresponse:delete": {
"href": "/restapis/uojnr9hd57/resources/0cjtch/methods/GET/responses/200"
},
"methodresponse:update": {
"href": "/restapis/uojnr9hd57/resources/0cjtch/methods/GET/responses/200"
}
},
"responseModels": {
"application/json": "Empty"
},
"responseParameters": {
"method.response.header.operator": false,
"method.response.header.operand\_2": false,
"method.response.header.operand\_1": false
},
"statusCode": "200"
}</pre>

``` 
  </div>
  <div class="seeAlso">
    <a href="https://docs.aws.amazon.com/cli/latest/reference/apigateway/get-method-response.html">AWS CLI
  </div>
```

### `operationName`

A human-friendly operation identifier for the method. For example, you can assign the operationName of ListPets for the GET /pets method in the PetStore example.

``` swift
public var operationName: Swift.String?
```

### `requestModels`

A key-value map specifying data schemas, represented by Model resources, (as the mapped value) of the request payloads of given content types (as the mapping key).

``` swift
public var requestModels: [Swift.String:Swift.String]?
```

### `requestParameters`

A key-value map defining required or optional method request parameters that can be accepted by API Gateway. A key is a method request parameter name matching the pattern of  method.request.{location}.{name}, where location is querystring, path, or header and name is a valid and unique parameter name. The value associated with the key is a Boolean flag indicating whether the parameter is required (true) or optional (false).  The method request parameter names defined here are available in Integration to be mapped to integration request parameters or templates.

``` swift
public var requestParameters: [Swift.String:Swift.Bool]?
```

### `requestValidatorId`

The identifier of a RequestValidator for request validation.

``` swift
public var requestValidatorId: Swift.String?
```
