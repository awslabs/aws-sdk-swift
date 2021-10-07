# GetIntegrationOutputResponse

Represents an HTTP, HTTP\_PROXY, AWS, AWS\_PROXY, or Mock integration.

<div class="remarks">In the API Gateway console, the built-in Lambda integration is an AWS integration.</div>
<div class="seeAlso">
<a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/how-to-create-api.html">Creating an API
</div>

``` swift
public struct GetIntegrationOutputResponse: Swift.Equatable 
```

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(cacheKeyParameters:cacheNamespace:connectionId:connectionType:contentHandling:credentials:httpMethod:integrationResponses:passthroughBehavior:requestParameters:requestTemplates:timeoutInMillis:tlsConfig:type:uri:)`

``` swift
public init (
        cacheKeyParameters: [Swift.String]? = nil,
        cacheNamespace: Swift.String? = nil,
        connectionId: Swift.String? = nil,
        connectionType: ApiGatewayClientTypes.ConnectionType? = nil,
        contentHandling: ApiGatewayClientTypes.ContentHandlingStrategy? = nil,
        credentials: Swift.String? = nil,
        httpMethod: Swift.String? = nil,
        integrationResponses: [Swift.String:ApiGatewayClientTypes.IntegrationResponse]? = nil,
        passthroughBehavior: Swift.String? = nil,
        requestParameters: [Swift.String:Swift.String]? = nil,
        requestTemplates: [Swift.String:Swift.String]? = nil,
        timeoutInMillis: Swift.Int = 0,
        tlsConfig: ApiGatewayClientTypes.TlsConfig? = nil,
        type: ApiGatewayClientTypes.IntegrationType? = nil,
        uri: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `cacheKeyParameters`

A list of request parameters whose values API Gateway caches. To be valid values for cacheKeyParameters, these parameters must also be specified for Method requestParameters.

``` swift
public var cacheKeyParameters: [Swift.String]?
```

### `cacheNamespace`

Specifies a group of related cached parameters. By default, API Gateway uses the resource ID as the cacheNamespace. You can specify the same cacheNamespace across resources to return the same cached data for requests to different resources.

``` swift
public var cacheNamespace: Swift.String?
```

### `connectionId`

The (<a href="https:​//docs.aws.amazon.com/apigateway/api-reference/resource/vpc-link/#id">id) of the VpcLink used for the integration when connectionType=VPC\_LINK and undefined, otherwise.

``` swift
public var connectionId: Swift.String?
```

### `connectionType`

The type of the network connection to the integration endpoint. The valid value is INTERNET for connections through the public routable internet or VPC\_LINK for private connections between API Gateway and a network load balancer in a VPC. The default value is INTERNET.

``` swift
public var connectionType: ApiGatewayClientTypes.ConnectionType?
```

### `contentHandling`

Specifies how to handle request payload content type conversions. Supported values are CONVERT\_TO\_BINARY and CONVERT\_TO\_TEXT, with the following behaviors:​

``` swift
public var contentHandling: ApiGatewayClientTypes.ContentHandlingStrategy?
```

``` 
    CONVERT_TO_BINARY: Converts a request payload from a Base64-encoded string to the corresponding binary blob.
    CONVERT_TO_TEXT: Converts a request payload from a binary blob to a Base64-encoded string.

  If this property is not defined, the request payload will be passed through from the method request to integration request without modification, provided that the passthroughBehavior is configured to support payload pass-through.
```

### `credentials`

Specifies the credentials required for the integration, if any. For AWS integrations, three options are available. To specify an IAM Role for API Gateway to assume, use the role's Amazon Resource Name (ARN). To require that the caller's identity be passed through from the request, specify the string arn:​aws:​iam:​:​\*:​user/\*. To use resource-based permissions on supported AWS services, specify null.

``` swift
public var credentials: Swift.String?
```

### `httpMethod`

Specifies the integration's HTTP method type.

``` swift
public var httpMethod: Swift.String?
```

### `integrationResponses`

Specifies the integration's responses.

<div class="remarks">

``` swift
public var integrationResponses: [Swift.String:ApiGatewayClientTypes.IntegrationResponse]?
```

``` 
<h4>Example: Get integration responses of a method</h4>
<h5>Request</h5>

<pre>GET /restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/200 HTTP/1.1
```

Content-Type: application/json
Host: apigateway.us-east-1.amazonaws.com
X-Amz-Date: 20160607T191449Z
Authorization: AWS4-HMAC-SHA256 Credential={access\_key\_ID}/20160607/us-east-1/apigateway/aws4\_request, SignedHeaders=content-type;host;x-amz-date, Signature={sig4\_hash}
</pre>

<h5>Response</h5>
The successful response returns 200 OK status and a payload as follows:
<pre>{
"\_links": {
"curies": {
"href": "https://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-integration-response-{rel}.html",
"name": "integrationresponse",
"templated": true
},
"self": {
"href": "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/200",
"title": "200"
},
"integrationresponse:delete": {
"href": "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/200"
},
"integrationresponse:update": {
"href": "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/200"
}
},
"responseParameters": {
"method.response.header.Content-Type": "'application/xml'"
},
"responseTemplates": {
"application/json": "$util.urlDecode("%3CkinesisStreams%3E\#foreach($stream in $input.path('$.StreamNames'))%3Cstream%3E%3Cname%3E$stream%3C/name%3E%3C/stream%3E\#end%3C/kinesisStreams%3E")\\n"
},
"statusCode": "200"
}</pre>

``` 
    </div>
    <div class="seeAlso">
      <a href="https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-create-api.html">Creating an API
    </div>
```

### `passthroughBehavior`

``` swift
public var passthroughBehavior: Swift.String?
```

<div>

``` 
        Specifies how the method request body of an unmapped content type will be passed through the integration request
        to the back end without transformation. A content type is unmapped if no mapping template is defined in the integration
        or the content type does not match any of the mapped content types, as specified in requestTemplates.
        The valid value is one of the following:



        WHEN_NO_MATCH: passes the method request body through the integration request to the back end without transformation
        when the method request content type does not match any content type associated with the mapping templates defined in the integration request.


        WHEN_NO_TEMPLATES: passes the method request body through the integration request to the back end without transformation
        when no mapping template is defined in the integration request. If a template is defined when this option is selected, the method request
        of an unmapped content-type will be rejected with an HTTP 415 Unsupported Media Type response.


        NEVER: rejects the method request with an HTTP 415 Unsupported Media Type response when either the method
        request content type does not match any content type associated with the mapping templates defined in the integration request or
        no mapping template is defined in the integration request.


  </div>
```

### `requestParameters`

A key-value map specifying request parameters that are passed from the method request to the back end. The key is an integration request parameter name and the associated value is a method request parameter value or static value that must be enclosed within single quotes and pre-encoded as required by the back end. The method request parameter value must match the pattern of  method.request.{location}.{name}, where location is querystring, path, or header and name must be a valid and unique method request parameter name.

``` swift
public var requestParameters: [Swift.String:Swift.String]?
```

### `requestTemplates`

Represents a map of Velocity templates that are applied on the request payload based on the value of the Content-Type header sent by the client. The content type value is the key in this map, and the template (as a String) is the value.

``` swift
public var requestTemplates: [Swift.String:Swift.String]?
```

### `timeoutInMillis`

Custom timeout between 50 and 29,000 milliseconds. The default value is 29,000 milliseconds or 29 seconds.

``` swift
public var timeoutInMillis: Swift.Int
```

### `tlsConfig`

Specifies the TLS configuration for an integration.

``` swift
public var tlsConfig: ApiGatewayClientTypes.TlsConfig?
```

### `type`

Specifies an API method integration type. The valid value is one of the following:​

``` swift
public var type: ApiGatewayClientTypes.IntegrationType?
```

``` 
        AWS: for integrating the API method request with an AWS service action, including the Lambda function-invoking action. With the Lambda function-invoking action, this is referred to as the Lambda custom integration. With any other AWS service action, this is known as AWS integration.
        AWS_PROXY: for integrating the API method request with the Lambda function-invoking action with the client request passed through as-is. This integration is also referred to as the Lambda proxy integration.
        HTTP: for integrating the API method request with an HTTP endpoint, including a private HTTP endpoint within a VPC. This integration is also referred to as the HTTP custom integration.
        HTTP_PROXY: for integrating the API method request with an HTTP endpoint, including a private HTTP endpoint within a VPC, with the client request passed through as-is. This is also referred to as the HTTP proxy integration.
        MOCK: for integrating the API method request with API Gateway as a "loop-back" endpoint without invoking any backend.

    For the HTTP and HTTP proxy integrations, each integration can specify a protocol (http/https), port and path. Standard 80 and 443 ports are supported as well as custom ports above 1024. An HTTP or HTTP proxy integration with a connectionType of VPC_LINK is referred to as a private integration and uses a VpcLink to connect API Gateway to a network load balancer of a VPC.
```

### `uri`

Specifies Uniform Resource Identifier (URI) of the integration endpoint.

``` swift
public var uri: Swift.String?
```

For HTTP or HTTP\_PROXY integrations, the URI must be a fully formed, encoded HTTP(S) URL according to the <a target="_blank" href="https://en.wikipedia.org/wiki/Uniform_Resource_Identifier">RFC-3986 specification, for either standard integration, where connectionType is not VPC\_LINK, or private integration, where connectionType is VPC\_LINK. For a private HTTP integration, the URI is not used for routing.

For AWS or AWS\_PROXY integrations, the URI is of the form arn:aws:apigateway:{region}:{subdomain.service|service}:path|action/{service\_api}. Here, {Region} is the API Gateway region (e.g., us-east-1); {service} is the name of the integrated AWS service (e.g., s3); and {subdomain} is a designated subdomain supported by certain AWS service for fast host-name lookup. action can be used for an AWS service action-based API, using an Action={name}&{p1}={v1}\&p2={v2}... query string. The ensuing {service\_api} refers to a supported action {name} plus any required input parameters. Alternatively, path can be used for an AWS service path-based API. The ensuing  service\_api refers to the path to an AWS service resource, including the region of the integrated AWS service, if applicable. For example, for integration with the S3 API of <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectGET.html">GetObject, the uri can be either arn:aws:apigateway:us-west-2:s3:action/GetObject\&Bucket={bucket}\&Key={key} or  arn:aws:apigateway:us-west-2:s3:path/{bucket}/{key}
