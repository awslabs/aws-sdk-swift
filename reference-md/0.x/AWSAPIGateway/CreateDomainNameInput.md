# CreateDomainNameInput

A request to create a new domain name.

``` swift
public struct CreateDomainNameInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(certificateArn:certificateBody:certificateChain:certificateName:certificatePrivateKey:domainName:endpointConfiguration:mutualTlsAuthentication:ownershipVerificationCertificateArn:regionalCertificateArn:regionalCertificateName:securityPolicy:tags:)`

``` swift
public init (
        certificateArn: Swift.String? = nil,
        certificateBody: Swift.String? = nil,
        certificateChain: Swift.String? = nil,
        certificateName: Swift.String? = nil,
        certificatePrivateKey: Swift.String? = nil,
        domainName: Swift.String? = nil,
        endpointConfiguration: ApiGatewayClientTypes.EndpointConfiguration? = nil,
        mutualTlsAuthentication: ApiGatewayClientTypes.MutualTlsAuthenticationInput? = nil,
        ownershipVerificationCertificateArn: Swift.String? = nil,
        regionalCertificateArn: Swift.String? = nil,
        regionalCertificateName: Swift.String? = nil,
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

### `certificateBody`

\[Deprecated\] The body of the server certificate that will be used by edge-optimized endpoint for this domain name provided by your certificate authority.

``` swift
public var certificateBody: Swift.String?
```

### `certificateChain`

\[Deprecated\] The intermediate certificates and optionally the root certificate, one after the other without any blank lines, used by an edge-optimized endpoint for this domain name. If you include the root certificate, your certificate chain must start with intermediate certificates and end with the root certificate. Use the intermediate certificates that were provided by your certificate authority. Do not include any intermediaries that are not in the chain of trust path.

``` swift
public var certificateChain: Swift.String?
```

### `certificateName`

The user-friendly name of the certificate that will be used by edge-optimized endpoint for this domain name.

``` swift
public var certificateName: Swift.String?
```

### `certificatePrivateKey`

\[Deprecated\] Your edge-optimized endpoint's domain name certificate's private key.

``` swift
public var certificatePrivateKey: Swift.String?
```

### `domainName`

\[Required\] The name of the DomainName resource.
This member is required.

``` swift
public var domainName: Swift.String?
```

### `endpointConfiguration`

The endpoint configuration of this DomainName showing the endpoint types of the domain name.

``` swift
public var endpointConfiguration: ApiGatewayClientTypes.EndpointConfiguration?
```

### `mutualTlsAuthentication`

If specified, API Gateway performs two-way authentication between the client and the server. Clients must present a trusted certificate to access your custom domain name.

``` swift
public var mutualTlsAuthentication: ApiGatewayClientTypes.MutualTlsAuthenticationInput?
```

### `ownershipVerificationCertificateArn`

The ARN of the public certificate issued by ACM to validate ownership of your custom domain. Only required when configuring mutual TLS and using an ACM imported or private CA certificate ARN as the regionalCertificateArn.

``` swift
public var ownershipVerificationCertificateArn: Swift.String?
```

### `regionalCertificateArn`

The reference to an AWS-managed certificate that will be used by regional endpoint for this domain name. AWS Certificate Manager is the only supported source.

``` swift
public var regionalCertificateArn: Swift.String?
```

### `regionalCertificateName`

The user-friendly name of the certificate that will be used by regional endpoint for this domain name.

``` swift
public var regionalCertificateName: Swift.String?
```

### `securityPolicy`

The Transport Layer Security (TLS) version + cipher suite for this DomainName. The valid values are TLS\_1\_0 and TLS\_1\_2.

``` swift
public var securityPolicy: ApiGatewayClientTypes.SecurityPolicy?
```

### `tags`

The key-value map of strings. The valid character set is \[a-zA-Z+-=.\_:​/\]. The tag key can be up to 128 characters and must not start with aws:​. The tag value can be up to 256 characters.

``` swift
public var tags: [Swift.String:Swift.String]?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
