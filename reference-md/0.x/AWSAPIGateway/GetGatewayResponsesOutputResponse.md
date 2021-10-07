# GetGatewayResponsesOutputResponse

The collection of the GatewayResponse instances of a RestApi as a responseType-to-GatewayResponse object map of key-value pairs. As such, pagination is not supported for querying this collection.

<div class="remarks">
For more information about valid gateway response types, see <a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/supported-gateway-response-types.html">Gateway Response Types Supported by API Gateway
<div class="example">
<h4>Example:​ Get the collection of gateway responses of an API</h4>
<h5>Request</h5>
This example request shows how to retrieve the GatewayResponses collection from an API.
<pre>GET /restapis/o81lxisefl/gatewayresponses HTTP/1.1
Host:​ beta-apigateway.us-east-1.amazonaws.com
Content-Type:​ application/json
X-Amz-Date:​ 20170503T220604Z
Authorization:​ AWS4-HMAC-SHA256 Credential={access-key-id}/20170503/us-east-1/apigateway/aws4\_request, SignedHeaders=content-type;host;x-amz-date, Signature=59b42fe54a76a5de8adf2c67baa6d39206f8e9ad49a1d77ccc6a5da3103a398a
Cache-Control:​ no-cache
Postman-Token:​ 5637af27-dc29-fc5c-9dfe-0645d52cb515
</pre>

``` swift
public struct GetGatewayResponsesOutputResponse: Swift.Equatable 
```

``` 
<h5>Response</h5>
The successful operation returns the 200 OK status code and a payload similar to the following:
<pre>{
```

"\_links": {
"curies": {
"href": "http://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-gatewayresponse-{rel}.html",
"name": "gatewayresponse",
"templated": true
},
"self": {
"href": "/restapis/o81lxisefl/gatewayresponses"
},
"first": {
"href": "/restapis/o81lxisefl/gatewayresponses"
},
"gatewayresponse:by-type": {
"href": "/restapis/o81lxisefl/gatewayresponses/{response\_type}",
"templated": true
},
"item": \[
{
"href": "/restapis/o81lxisefl/gatewayresponses/INTEGRATION\_FAILURE"
},
{
"href": "/restapis/o81lxisefl/gatewayresponses/RESOURCE\_NOT\_FOUND"
},
{
"href": "/restapis/o81lxisefl/gatewayresponses/REQUEST\_TOO\_LARGE"
},
{
"href": "/restapis/o81lxisefl/gatewayresponses/THROTTLED"
},
{
"href": "/restapis/o81lxisefl/gatewayresponses/UNSUPPORTED\_MEDIA\_TYPE"
},
{
"href": "/restapis/o81lxisefl/gatewayresponses/AUTHORIZER\_CONFIGURATION\_ERROR"
},
{
"href": "/restapis/o81lxisefl/gatewayresponses/DEFAULT\_5XX"
},
{
"href": "/restapis/o81lxisefl/gatewayresponses/DEFAULT\_4XX"
},
{
"href": "/restapis/o81lxisefl/gatewayresponses/BAD\_REQUEST\_PARAMETERS"
},
{
"href": "/restapis/o81lxisefl/gatewayresponses/BAD\_REQUEST\_BODY"
},
{
"href": "/restapis/o81lxisefl/gatewayresponses/EXPIRED\_TOKEN"
},
{
"href": "/restapis/o81lxisefl/gatewayresponses/ACCESS\_DENIED"
},
{
"href": "/restapis/o81lxisefl/gatewayresponses/INVALID\_API\_KEY"
},
{
"href": "/restapis/o81lxisefl/gatewayresponses/UNAUTHORIZED"
},
{
"href": "/restapis/o81lxisefl/gatewayresponses/API\_CONFIGURATION\_ERROR"
},
{
"href": "/restapis/o81lxisefl/gatewayresponses/QUOTA\_EXCEEDED"
},
{
"href": "/restapis/o81lxisefl/gatewayresponses/INTEGRATION\_TIMEOUT"
},
{
"href": "/restapis/o81lxisefl/gatewayresponses/MISSING\_AUTHENTICATION\_TOKEN"
},
{
"href": "/restapis/o81lxisefl/gatewayresponses/INVALID\_SIGNATURE"
},
{
"href": "/restapis/o81lxisefl/gatewayresponses/AUTHORIZER\_FAILURE"
}
\]
},
"\_embedded": {
"item": \[
{
"\_links": {
"self": {
"href": "/restapis/o81lxisefl/gatewayresponses/INTEGRATION\_FAILURE"
},
"gatewayresponse:put": {
"href": "/restapis/o81lxisefl/gatewayresponses/{response\_type}",
"templated": true
},
"gatewayresponse:update": {
"href": "/restapis/o81lxisefl/gatewayresponses/INTEGRATION\_FAILURE"
}
},
"defaultResponse": true,
"responseParameters": {},
"responseTemplates": {
"application/json": "{"message":$context.error.messageString}"
},
"responseType": "INTEGRATION\_FAILURE",
"statusCode": "504"
},
{
"\_links": {
"self": {
"href": "/restapis/o81lxisefl/gatewayresponses/RESOURCE\_NOT\_FOUND"
},
"gatewayresponse:put": {
"href": "/restapis/o81lxisefl/gatewayresponses/{response\_type}",
"templated": true
},
"gatewayresponse:update": {
"href": "/restapis/o81lxisefl/gatewayresponses/RESOURCE\_NOT\_FOUND"
}
},
"defaultResponse": true,
"responseParameters": {},
"responseTemplates": {
"application/json": "{"message":$context.error.messageString}"
},
"responseType": "RESOURCE\_NOT\_FOUND",
"statusCode": "404"
},
{
"\_links": {
"self": {
"href": "/restapis/o81lxisefl/gatewayresponses/REQUEST\_TOO\_LARGE"
},
"gatewayresponse:put": {
"href": "/restapis/o81lxisefl/gatewayresponses/{response\_type}",
"templated": true
},
"gatewayresponse:update": {
"href": "/restapis/o81lxisefl/gatewayresponses/REQUEST\_TOO\_LARGE"
}
},
"defaultResponse": true,
"responseParameters": {},
"responseTemplates": {
"application/json": "{"message":$context.error.messageString}"
},
"responseType": "REQUEST\_TOO\_LARGE",
"statusCode": "413"
},
{
"\_links": {
"self": {
"href": "/restapis/o81lxisefl/gatewayresponses/THROTTLED"
},
"gatewayresponse:put": {
"href": "/restapis/o81lxisefl/gatewayresponses/{response\_type}",
"templated": true
},
"gatewayresponse:update": {
"href": "/restapis/o81lxisefl/gatewayresponses/THROTTLED"
}
},
"defaultResponse": true,
"responseParameters": {},
"responseTemplates": {
"application/json": "{"message":$context.error.messageString}"
},
"responseType": "THROTTLED",
"statusCode": "429"
},
{
"\_links": {
"self": {
"href": "/restapis/o81lxisefl/gatewayresponses/UNSUPPORTED\_MEDIA\_TYPE"
},
"gatewayresponse:put": {
"href": "/restapis/o81lxisefl/gatewayresponses/{response\_type}",
"templated": true
},
"gatewayresponse:update": {
"href": "/restapis/o81lxisefl/gatewayresponses/UNSUPPORTED\_MEDIA\_TYPE"
}
},
"defaultResponse": true,
"responseParameters": {},
"responseTemplates": {
"application/json": "{"message":$context.error.messageString}"
},
"responseType": "UNSUPPORTED\_MEDIA\_TYPE",
"statusCode": "415"
},
{
"\_links": {
"self": {
"href": "/restapis/o81lxisefl/gatewayresponses/AUTHORIZER\_CONFIGURATION\_ERROR"
},
"gatewayresponse:put": {
"href": "/restapis/o81lxisefl/gatewayresponses/{response\_type}",
"templated": true
},
"gatewayresponse:update": {
"href": "/restapis/o81lxisefl/gatewayresponses/AUTHORIZER\_CONFIGURATION\_ERROR"
}
},
"defaultResponse": true,
"responseParameters": {},
"responseTemplates": {
"application/json": "{"message":$context.error.messageString}"
},
"responseType": "AUTHORIZER\_CONFIGURATION\_ERROR",
"statusCode": "500"
},
{
"\_links": {
"self": {
"href": "/restapis/o81lxisefl/gatewayresponses/DEFAULT\_5XX"
},
"gatewayresponse:put": {
"href": "/restapis/o81lxisefl/gatewayresponses/{response\_type}",
"templated": true
},
"gatewayresponse:update": {
"href": "/restapis/o81lxisefl/gatewayresponses/DEFAULT\_5XX"
}
},
"defaultResponse": true,
"responseParameters": {},
"responseTemplates": {
"application/json": "{"message":$context.error.messageString}"
},
"responseType": "DEFAULT\_5XX"
},
{
"\_links": {
"self": {
"href": "/restapis/o81lxisefl/gatewayresponses/DEFAULT\_4XX"
},
"gatewayresponse:put": {
"href": "/restapis/o81lxisefl/gatewayresponses/{response\_type}",
"templated": true
},
"gatewayresponse:update": {
"href": "/restapis/o81lxisefl/gatewayresponses/DEFAULT\_4XX"
}
},
"defaultResponse": true,
"responseParameters": {},
"responseTemplates": {
"application/json": "{"message":$context.error.messageString}"
},
"responseType": "DEFAULT\_4XX"
},
{
"\_links": {
"self": {
"href": "/restapis/o81lxisefl/gatewayresponses/BAD\_REQUEST\_PARAMETERS"
},
"gatewayresponse:put": {
"href": "/restapis/o81lxisefl/gatewayresponses/{response\_type}",
"templated": true
},
"gatewayresponse:update": {
"href": "/restapis/o81lxisefl/gatewayresponses/BAD\_REQUEST\_PARAMETERS"
}
},
"defaultResponse": true,
"responseParameters": {},
"responseTemplates": {
"application/json": "{"message":$context.error.messageString}"
},
"responseType": "BAD\_REQUEST\_PARAMETERS",
"statusCode": "400"
},
{
"\_links": {
"self": {
"href": "/restapis/o81lxisefl/gatewayresponses/BAD\_REQUEST\_BODY"
},
"gatewayresponse:put": {
"href": "/restapis/o81lxisefl/gatewayresponses/{response\_type}",
"templated": true
},
"gatewayresponse:update": {
"href": "/restapis/o81lxisefl/gatewayresponses/BAD\_REQUEST\_BODY"
}
},
"defaultResponse": true,
"responseParameters": {},
"responseTemplates": {
"application/json": "{"message":$context.error.messageString}"
},
"responseType": "BAD\_REQUEST\_BODY",
"statusCode": "400"
},
{
"\_links": {
"self": {
"href": "/restapis/o81lxisefl/gatewayresponses/EXPIRED\_TOKEN"
},
"gatewayresponse:put": {
"href": "/restapis/o81lxisefl/gatewayresponses/{response\_type}",
"templated": true
},
"gatewayresponse:update": {
"href": "/restapis/o81lxisefl/gatewayresponses/EXPIRED\_TOKEN"
}
},
"defaultResponse": true,
"responseParameters": {},
"responseTemplates": {
"application/json": "{"message":$context.error.messageString}"
},
"responseType": "EXPIRED\_TOKEN",
"statusCode": "403"
},
{
"\_links": {
"self": {
"href": "/restapis/o81lxisefl/gatewayresponses/ACCESS\_DENIED"
},
"gatewayresponse:put": {
"href": "/restapis/o81lxisefl/gatewayresponses/{response\_type}",
"templated": true
},
"gatewayresponse:update": {
"href": "/restapis/o81lxisefl/gatewayresponses/ACCESS\_DENIED"
}
},
"defaultResponse": true,
"responseParameters": {},
"responseTemplates": {
"application/json": "{"message":$context.error.messageString}"
},
"responseType": "ACCESS\_DENIED",
"statusCode": "403"
},
{
"\_links": {
"self": {
"href": "/restapis/o81lxisefl/gatewayresponses/INVALID\_API\_KEY"
},
"gatewayresponse:put": {
"href": "/restapis/o81lxisefl/gatewayresponses/{response\_type}",
"templated": true
},
"gatewayresponse:update": {
"href": "/restapis/o81lxisefl/gatewayresponses/INVALID\_API\_KEY"
}
},
"defaultResponse": true,
"responseParameters": {},
"responseTemplates": {
"application/json": "{"message":$context.error.messageString}"
},
"responseType": "INVALID\_API\_KEY",
"statusCode": "403"
},
{
"\_links": {
"self": {
"href": "/restapis/o81lxisefl/gatewayresponses/UNAUTHORIZED"
},
"gatewayresponse:put": {
"href": "/restapis/o81lxisefl/gatewayresponses/{response\_type}",
"templated": true
},
"gatewayresponse:update": {
"href": "/restapis/o81lxisefl/gatewayresponses/UNAUTHORIZED"
}
},
"defaultResponse": true,
"responseParameters": {},
"responseTemplates": {
"application/json": "{"message":$context.error.messageString}"
},
"responseType": "UNAUTHORIZED",
"statusCode": "401"
},
{
"\_links": {
"self": {
"href": "/restapis/o81lxisefl/gatewayresponses/API\_CONFIGURATION\_ERROR"
},
"gatewayresponse:put": {
"href": "/restapis/o81lxisefl/gatewayresponses/{response\_type}",
"templated": true
},
"gatewayresponse:update": {
"href": "/restapis/o81lxisefl/gatewayresponses/API\_CONFIGURATION\_ERROR"
}
},
"defaultResponse": true,
"responseParameters": {},
"responseTemplates": {
"application/json": "{"message":$context.error.messageString}"
},
"responseType": "API\_CONFIGURATION\_ERROR",
"statusCode": "500"
},
{
"\_links": {
"self": {
"href": "/restapis/o81lxisefl/gatewayresponses/QUOTA\_EXCEEDED"
},
"gatewayresponse:put": {
"href": "/restapis/o81lxisefl/gatewayresponses/{response\_type}",
"templated": true
},
"gatewayresponse:update": {
"href": "/restapis/o81lxisefl/gatewayresponses/QUOTA\_EXCEEDED"
}
},
"defaultResponse": true,
"responseParameters": {},
"responseTemplates": {
"application/json": "{"message":$context.error.messageString}"
},
"responseType": "QUOTA\_EXCEEDED",
"statusCode": "429"
},
{
"\_links": {
"self": {
"href": "/restapis/o81lxisefl/gatewayresponses/INTEGRATION\_TIMEOUT"
},
"gatewayresponse:put": {
"href": "/restapis/o81lxisefl/gatewayresponses/{response\_type}",
"templated": true
},
"gatewayresponse:update": {
"href": "/restapis/o81lxisefl/gatewayresponses/INTEGRATION\_TIMEOUT"
}
},
"defaultResponse": true,
"responseParameters": {},
"responseTemplates": {
"application/json": "{"message":$context.error.messageString}"
},
"responseType": "INTEGRATION\_TIMEOUT",
"statusCode": "504"
},
{
"\_links": {
"self": {
"href": "/restapis/o81lxisefl/gatewayresponses/MISSING\_AUTHENTICATION\_TOKEN"
},
"gatewayresponse:put": {
"href": "/restapis/o81lxisefl/gatewayresponses/{response\_type}",
"templated": true
},
"gatewayresponse:update": {
"href": "/restapis/o81lxisefl/gatewayresponses/MISSING\_AUTHENTICATION\_TOKEN"
}
},
"defaultResponse": true,
"responseParameters": {},
"responseTemplates": {
"application/json": "{"message":$context.error.messageString}"
},
"responseType": "MISSING\_AUTHENTICATION\_TOKEN",
"statusCode": "403"
},
{
"\_links": {
"self": {
"href": "/restapis/o81lxisefl/gatewayresponses/INVALID\_SIGNATURE"
},
"gatewayresponse:put": {
"href": "/restapis/o81lxisefl/gatewayresponses/{response\_type}",
"templated": true
},
"gatewayresponse:update": {
"href": "/restapis/o81lxisefl/gatewayresponses/INVALID\_SIGNATURE"
}
},
"defaultResponse": true,
"responseParameters": {},
"responseTemplates": {
"application/json": "{"message":$context.error.messageString}"
},
"responseType": "INVALID\_SIGNATURE",
"statusCode": "403"
},
{
"\_links": {
"self": {
"href": "/restapis/o81lxisefl/gatewayresponses/AUTHORIZER\_FAILURE"
},
"gatewayresponse:put": {
"href": "/restapis/o81lxisefl/gatewayresponses/{response\_type}",
"templated": true
},
"gatewayresponse:update": {
"href": "/restapis/o81lxisefl/gatewayresponses/AUTHORIZER\_FAILURE"
}
},
"defaultResponse": true,
"responseParameters": {},
"responseTemplates": {
"application/json": "{"message":$context.error.messageString}"
},
"responseType": "AUTHORIZER\_FAILURE",
"statusCode": "500"
}
\]
}
}</pre>

  </div>
        </div>
        <div class="seeAlso">
          <a href="https://docs.aws.amazon.com/apigateway/latest/developerguide/customize-gateway-responses.html">Customize Gateway Responses
        </div>

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(items:position:)`

``` swift
public init (
        items: [ApiGatewayClientTypes.GatewayResponse]? = nil,
        position: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `items`

Returns the entire collection, because of no pagination support.

``` swift
public var items: [ApiGatewayClientTypes.GatewayResponse]?
```

### `position`

The current pagination position in the paged result set. The GatewayResponse collection does not support pagination and the position does not apply here.

``` swift
public var position: Swift.String?
```
