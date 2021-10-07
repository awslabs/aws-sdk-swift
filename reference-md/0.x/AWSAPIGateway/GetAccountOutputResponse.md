# GetAccountOutputResponse

Represents an AWS account that is associated with API Gateway.

<div class="remarks">
To view the account info, call GET on this resource.
<h4>Error Codes</h4>
The following exception may be thrown when the request fails.

``` swift
public struct GetAccountOutputResponse: Swift.Equatable 
```

``` 
        UnauthorizedException
        NotFoundException
        TooManyRequestsException

      For detailed error code information, including the corresponding HTTP Status Codes, see <a href="https://docs.aws.amazon.com/apigateway/api-reference/handling-errors/#api-error-codes">API Gateway Error Codes
        <h4>Example: Get the information about an account.</h4>
        <h5>Request</h5>
        <pre>GET /account HTTP/1.1
```

Content-Type: application/json
Host: apigateway.us-east-1.amazonaws.com
X-Amz-Date: 20160531T184618Z
Authorization: AWS4-HMAC-SHA256 Credential={access\_key\_ID}/us-east-1/apigateway/aws4\_request, SignedHeaders=content-type;host;x-amz-date, Signature={sig4\_hash}
</pre>

<h5>Response</h5>
The successful response returns a 200 OK status code and a payload similar to the following:
<pre>{
"\_links": {
"curies": {
"href": "https://docs.aws.amazon.com/apigateway/latest/developerguide/account-apigateway-{rel}.html",
"name": "account",
"templated": true
},
"self": {
"href": "/account"
},
"account:update": {
"href": "/account"
}
},
"cloudwatchRoleArn": "arn:aws:iam::123456789012:role/apigAwsProxyRole",
"throttleSettings": {
"rateLimit": 500,
"burstLimit": 1000
}
}
</pre>
In addition to making the REST API call directly, you can use the AWS CLI and an AWS SDK to access this resource.
</div>
<div class="seeAlso">
<a href="https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-limits.html">API Gateway Limits
<a href="https://docs.aws.amazon.com/apigateway/latest/developerguide/welcome.html">Developer Guide,
<a href="https://docs.aws.amazon.com/cli/latest/reference/apigateway/get-account.html">AWS CLI
</div>

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(apiKeyVersion:cloudwatchRoleArn:features:throttleSettings:)`

``` swift
public init (
        apiKeyVersion: Swift.String? = nil,
        cloudwatchRoleArn: Swift.String? = nil,
        features: [Swift.String]? = nil,
        throttleSettings: ApiGatewayClientTypes.ThrottleSettings? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `apiKeyVersion`

The version of the API keys used for the account.

``` swift
public var apiKeyVersion: Swift.String?
```

### `cloudwatchRoleArn`

The ARN of an Amazon CloudWatch role for the current Account.

``` swift
public var cloudwatchRoleArn: Swift.String?
```

### `features`

A list of features supported for the account. When usage plans are enabled, the features list will include an entry of "UsagePlans".

``` swift
public var features: [Swift.String]?
```

### `throttleSettings`

Specifies the API request limits configured for the current Account.

``` swift
public var throttleSettings: ApiGatewayClientTypes.ThrottleSettings?
```
