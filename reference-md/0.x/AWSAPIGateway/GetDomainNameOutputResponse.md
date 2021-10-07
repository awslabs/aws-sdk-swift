# GetDomainNameOutputResponse

Represents a custom domain name as a user-friendly host name of an API (RestApi).

<div class="Remarks">
When you deploy an API, API Gateway creates a default host name for the API. This default API host name is of the {restapi-id}.execute-api.{region}.amazonaws.com format. With the default host name, you can access the API's root resource with the URL of https:​//{restapi-id}.execute-api.{region}.amazonaws.com/{stage}/. When you set up a custom domain name of apis.example.com for this API, you can then access the same resource using the URL of the https:​//apis.examples.com/myApi, where myApi is the base path mapping (BasePathMapping) of your API under the custom domain name.

``` swift
public struct GetDomainNameOutputResponse: Swift.Equatable 
```

``` 
    </div>
  <div class="seeAlso">
    <a href="https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-custom-domains.html">Set a Custom Host Name for an API
  </div>
```

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(certificateArn:certificateName:certificateUploadDate:distributionDomainName:distributionHostedZoneId:domainName:domainNameStatus:domainNameStatusMessage:endpointConfiguration:mutualTlsAuthentication:ownershipVerificationCertificateArn:regionalCertificateArn:regionalCertificateName:regionalDomainName:regionalHostedZoneId:securityPolicy:tags:)`

``` swift
public init (
        certificateArn: Swift.String? = nil,
        certificateName: Swift.String? = nil,
        certificateUploadDate: ClientRuntime.Date? = nil,
        distributionDomainName: Swift.String? = nil,
        distributionHostedZoneId: Swift.String? = nil,
        domainName: Swift.String? = nil,
        domainNameStatus: ApiGatewayClientTypes.DomainNameStatus? = nil,
        domainNameStatusMessage: Swift.String? = nil,
        endpointConfiguration: ApiGatewayClientTypes.EndpointConfiguration? = nil,
        mutualTlsAuthentication: ApiGatewayClientTypes.MutualTlsAuthentication? = nil,
        ownershipVerificationCertificateArn: Swift.String? = nil,
        regionalCertificateArn: Swift.String? = nil,
        regionalCertificateName: Swift.String? = nil,
        regionalDomainName: Swift.String? = nil,
        regionalHostedZoneId: Swift.String? = nil,
        securityPolicy: ApiGatewayClientTypes.SecurityPolicy? = nil,
        tags: [Swift.String:Swift.String]? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `certificateArn`

The reference to an AWS-managed certificate that will be used by edge-optimized endpoint for this domain name. AWS Certificate Manager is the only supported source.

``` swift
public var certificateArn: Swift.String?
```

### `certificateName`

The name of the certificate that will be used by edge-optimized endpoint for this domain name.

``` swift
public var certificateName: Swift.String?
```

### `certificateUploadDate`

The timestamp when the certificate that was used by edge-optimized endpoint for this domain name was uploaded.

``` swift
public var certificateUploadDate: ClientRuntime.Date?
```

### `distributionDomainName`

The domain name of the Amazon CloudFront distribution associated with this custom domain name for an edge-optimized endpoint. You set up this association when adding a DNS record pointing the custom domain name to this distribution name. For more information about CloudFront distributions, see the <a target="_blank" href="https:​//aws.amazon.com/documentation/cloudfront/">Amazon CloudFront documentation.

``` swift
public var distributionDomainName: Swift.String?
```

### `distributionHostedZoneId`

The region-agnostic Amazon Route 53 Hosted Zone ID of the edge-optimized endpoint. The valid value is Z2FDTNDATAQYW2 for all the regions. For more information, see <a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-regional-api-custom-domain-create.html">Set up a Regional Custom Domain Name and <a href="https:​//docs.aws.amazon.com/general/latest/gr/rande.html#apigateway_region">AWS Regions and Endpoints for API Gateway.

``` swift
public var distributionHostedZoneId: Swift.String?
```

### `domainName`

The custom domain name as an API host name, for example, my-api.example.com.

``` swift
public var domainName: Swift.String?
```

### `domainNameStatus`

The status of the DomainName migration. The valid values are AVAILABLE, UPDATING, PENDING\_CERTIFICATE\_REIMPORT, and PENDING\_OWNERSHIP\_VERIFICATION. If the status is UPDATING, the domain cannot be modified further until the existing operation is complete. If it is AVAILABLE, the domain can be updated.

``` swift
public var domainNameStatus: ApiGatewayClientTypes.DomainNameStatus?
```

### `domainNameStatusMessage`

An optional text message containing detailed information about status of the DomainName migration.

``` swift
public var domainNameStatusMessage: Swift.String?
```

### `endpointConfiguration`

The endpoint configuration of this DomainName showing the endpoint types of the domain name.

``` swift
public var endpointConfiguration: ApiGatewayClientTypes.EndpointConfiguration?
```

### `mutualTlsAuthentication`

The mutual TLS authentication configuration for a custom domain name. If specified, API Gateway performs two-way authentication between the client and the server. Clients must present a trusted certificate to access your API.

``` swift
public var mutualTlsAuthentication: ApiGatewayClientTypes.MutualTlsAuthentication?
```

### `ownershipVerificationCertificateArn`

The ARN of the public certificate issued by ACM to validate ownership of your custom domain. Only required when configuring mutual TLS and using an ACM imported or private CA certificate ARN as the regionalCertificateArn.

``` swift
public var ownershipVerificationCertificateArn: Swift.String?
```

### `regionalCertificateArn`

The reference to an AWS-managed certificate that will be used for validating the regional domain name. AWS Certificate Manager is the only supported source.

``` swift
public var regionalCertificateArn: Swift.String?
```

### `regionalCertificateName`

The name of the certificate that will be used for validating the regional domain name.

``` swift
public var regionalCertificateName: Swift.String?
```

### `regionalDomainName`

The domain name associated with the regional endpoint for this custom domain name. You set up this association by adding a DNS record that points the custom domain name to this regional domain name. The regional domain name is returned by API Gateway when you create a regional endpoint.

``` swift
public var regionalDomainName: Swift.String?
```

### `regionalHostedZoneId`

The region-specific Amazon Route 53 Hosted Zone ID of the regional endpoint. For more information, see <a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-regional-api-custom-domain-create.html">Set up a Regional Custom Domain Name and  <a href="https:​//docs.aws.amazon.com/general/latest/gr/rande.html#apigateway_region">AWS Regions and Endpoints for API Gateway.

``` swift
public var regionalHostedZoneId: Swift.String?
```

### `securityPolicy`

The Transport Layer Security (TLS) version + cipher suite for this DomainName. The valid values are TLS\_1\_0 and TLS\_1\_2.

``` swift
public var securityPolicy: ApiGatewayClientTypes.SecurityPolicy?
```

### `tags`

The collection of tags. Each tag element is associated with a given resource.

``` swift
public var tags: [Swift.String:Swift.String]?
```
