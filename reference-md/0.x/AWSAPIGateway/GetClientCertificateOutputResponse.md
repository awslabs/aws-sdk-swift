# GetClientCertificateOutputResponse

Represents a client certificate used to configure client-side SSL authentication while sending requests to the integration endpoint.

<div class="remarks">Client certificates are used to authenticate an API by the backend server. To authenticate an API client (or user), use IAM roles and policies, a custom Authorizer or an Amazon Cognito user pool.</div>
<div class="seeAlso">
<a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/getting-started-client-side-ssl-authentication.html">Use Client-Side Certificate
</div>

``` swift
public struct GetClientCertificateOutputResponse: Swift.Equatable 
```

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(clientCertificateId:createdDate:description:expirationDate:pemEncodedCertificate:tags:)`

``` swift
public init (
        clientCertificateId: Swift.String? = nil,
        createdDate: ClientRuntime.Date? = nil,
        description: Swift.String? = nil,
        expirationDate: ClientRuntime.Date? = nil,
        pemEncodedCertificate: Swift.String? = nil,
        tags: [Swift.String:Swift.String]? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `clientCertificateId`

The identifier of the client certificate.

``` swift
public var clientCertificateId: Swift.String?
```

### `createdDate`

The timestamp when the client certificate was created.

``` swift
public var createdDate: ClientRuntime.Date?
```

### `description`

The description of the client certificate.

``` swift
public var description: Swift.String?
```

### `expirationDate`

The timestamp when the client certificate will expire.

``` swift
public var expirationDate: ClientRuntime.Date?
```

### `pemEncodedCertificate`

The PEM-encoded public key of the client certificate, which can be used to configure certificate authentication in the integration endpoint .

``` swift
public var pemEncodedCertificate: Swift.String?
```

### `tags`

The collection of tags. Each tag element is associated with a given resource.

``` swift
public var tags: [Swift.String:Swift.String]?
```
