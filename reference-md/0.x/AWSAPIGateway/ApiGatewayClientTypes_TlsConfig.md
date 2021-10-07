# ApiGatewayClientTypes.TlsConfig

``` swift
public struct TlsConfig: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.Codable`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(from:)`

``` swift
public init (from decoder: Swift.Decoder) throws 
```

### `init(insecureSkipVerification:)`

``` swift
public init (
            insecureSkipVerification: Swift.Bool = false
        )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `insecureSkipVerification`

Specifies whether or not API Gateway skips verification that the certificate for an integration endpoint is
issued by a <a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-supported-certificate-authorities-for-http-endpoints.html">supported certificate authority. This isn’t recommended, but it enables you to
use certificates that are signed by private certificate authorities, or certificates
that are self-signed. If enabled, API Gateway still performs basic certificate
validation, which includes checking the certificate's expiration date, hostname, and
presence of a root certificate authority. Supported only for HTTP and
HTTP\_PROXY integrations.

``` swift
public var insecureSkipVerification: Swift.Bool
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
