# UpdateResourceOutputResponse

Represents an API resource.

<div class="seeAlso">
<a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/how-to-create-api.html">Create an API
</div>

``` swift
public struct UpdateResourceOutputResponse: Swift.Equatable 
```

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(id:parentId:path:pathPart:resourceMethods:)`

``` swift
public init (
        id: Swift.String? = nil,
        parentId: Swift.String? = nil,
        path: Swift.String? = nil,
        pathPart: Swift.String? = nil,
        resourceMethods: [Swift.String:ApiGatewayClientTypes.Method]? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `id`

The resource's identifier.

``` swift
public var id: Swift.String?
```

### `parentId`

The parent resource's identifier.

``` swift
public var parentId: Swift.String?
```

### `path`

The full path for this resource.

``` swift
public var path: Swift.String?
```

### `pathPart`

The last path segment for this resource.

``` swift
public var pathPart: Swift.String?
```

### `resourceMethods`

Gets an API resource's method of a given HTTP verb.

<div class="remarks">
The resource methods are a map of methods indexed by methods' HTTP verbs enabled on the resource. This method map is included in the 200 OK response of the GET /restapis/{restapi\_id}/resources/{resource\_id} or GET /restapis/{restapi\_id}/resources/{resource\_id}?embed=methods request.
<h4>Example:​ Get the GET method of an API resource</h4>
<h5>Request</h5>
<pre>GET /restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET HTTP/1.1
Content-Type:​ application/json
Host:​ apigateway.us-east-1.amazonaws.com
X-Amz-Date:​ 20170223T031827Z
Authorization:​ AWS4-HMAC-SHA256 Credential={access\_key\_ID}/20170223/us-east-1/apigateway/aws4\_request, SignedHeaders=content-type;host;x-amz-date, Signature={sig4\_hash}</pre>
<h5>Response</h5>
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
"apiKeyRequired":​ false,
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
"application/json":​ "$util.urlDecode("%3CkinesisStreams%3E\#foreach($stream in $input.path('$.StreamNames'))%3Cstream%3E%3Cname%3E$stream%3C/name%3E%3C/stream%3E\#end%3C/kinesisStreams%3E")\\n"
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
If the OPTIONS is enabled on the resource, you can follow the example here to get that method. Just replace the GET of the last path segment in the request URL with OPTIONS.
</div>
<div class="seeAlso">
</div>

``` swift
public var resourceMethods: [Swift.String:ApiGatewayClientTypes.Method]?
```
