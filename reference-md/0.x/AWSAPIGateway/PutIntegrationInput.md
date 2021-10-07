# PutIntegrationInput

Sets up a method's integration.

``` swift
public struct PutIntegrationInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(cacheKeyParameters:cacheNamespace:connectionId:connectionType:contentHandling:credentials:httpMethod:integrationHttpMethod:passthroughBehavior:requestParameters:requestTemplates:resourceId:restApiId:timeoutInMillis:tlsConfig:type:uri:)`

``` swift
public init (
        cacheKeyParameters: [Swift.String]? = nil,
        cacheNamespace: Swift.String? = nil,
        connectionId: Swift.String? = nil,
        connectionType: ApiGatewayClientTypes.ConnectionType? = nil,
        contentHandling: ApiGatewayClientTypes.ContentHandlingStrategy? = nil,
        credentials: Swift.String? = nil,
        httpMethod: Swift.String? = nil,
        integrationHttpMethod: Swift.String? = nil,
        passthroughBehavior: Swift.String? = nil,
        requestParameters: [Swift.String:Swift.String]? = nil,
        requestTemplates: [Swift.String:Swift.String]? = nil,
        resourceId: Swift.String? = nil,
        restApiId: Swift.String? = nil,
        timeoutInMillis: Swift.Int? = nil,
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
```

If this property is not defined, the request payload will be passed through from the method request to integration request without modification, provided that the passthroughBehavior is configured to support payload pass-through.

### `credentials`

Specifies whether credentials are required for a put integration.

``` swift
public var credentials: Swift.String?
```

### `httpMethod`

\[Required\] Specifies a put integration request's HTTP method.
This member is required.

``` swift
public var httpMethod: Swift.String?
```

### `integrationHttpMethod`

Specifies a put integration HTTP method. When the integration type is HTTP or AWS, this field is required.

``` swift
public var integrationHttpMethod: Swift.String?
```

### `passthroughBehavior`

Specifies the pass-through behavior for incoming requests based on the Content-Type header in the request, and the available mapping templates specified as the requestTemplates property on the Integration resource. There are three valid values:​  WHEN\_NO\_MATCH, WHEN\_NO\_TEMPLATES, and NEVER.

``` swift
public var passthroughBehavior: Swift.String?
```

``` 
       WHEN_NO_MATCH passes the request body for unmapped content types through to the integration back end without transformation.
       NEVER rejects unmapped content types with an HTTP 415 'Unsupported Media Type' response.
       WHEN_NO_TEMPLATES allows pass-through when the integration has NO content types mapped to templates. However if there is at least one content type defined, unmapped content types will be rejected with the same 415 response.
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

### `resourceId`

\[Required\] Specifies a put integration request's resource ID.
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

### `timeoutInMillis`

Custom timeout between 50 and 29,000 milliseconds. The default value is 29,000 milliseconds or 29 seconds.

``` swift
public var timeoutInMillis: Swift.Int?
```

### `tlsConfig`

``` swift
public var tlsConfig: ApiGatewayClientTypes.TlsConfig?
```

### `type`

\[Required\] Specifies a put integration input's type.
This member is required.

``` swift
public var type: ApiGatewayClientTypes.IntegrationType?
```

### `uri`

Specifies Uniform Resource Identifier (URI) of the integration endpoint.

``` swift
public var uri: Swift.String?
```

For HTTP or HTTP\_PROXY integrations, the URI must be a fully formed, encoded HTTP(S) URL according to the <a target="_blank" href="https://en.wikipedia.org/wiki/Uniform_Resource_Identifier">RFC-3986 specification, for either standard integration, where connectionType is not VPC\_LINK, or private integration, where connectionType is VPC\_LINK. For a private HTTP integration, the URI is not used for routing.

For AWS or AWS\_PROXY integrations, the URI is of the form arn:aws:apigateway:{region}:{subdomain.service|service}:path|action/{service\_api}. Here, {Region} is the API Gateway region (e.g., us-east-1); {service} is the name of the integrated AWS service (e.g., s3); and {subdomain} is a designated subdomain supported by certain AWS service for fast host-name lookup. action can be used for an AWS service action-based API, using an Action={name}&{p1}={v1}\&p2={v2}... query string. The ensuing {service\_api} refers to a supported action {name} plus any required input parameters. Alternatively, path can be used for an AWS service path-based API. The ensuing  service\_api refers to the path to an AWS service resource, including the region of the integrated AWS service, if applicable. For example, for integration with the S3 API of <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectGET.html">GetObject, the uri can be either arn:aws:apigateway:us-west-2:s3:action/GetObject\&Bucket={bucket}\&Key={key} or  arn:aws:apigateway:us-west-2:s3:path/{bucket}/{key}

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
