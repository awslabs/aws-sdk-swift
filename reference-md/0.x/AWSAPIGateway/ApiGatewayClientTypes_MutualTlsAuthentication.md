# ApiGatewayClientTypes.MutualTlsAuthentication

If specified, API Gateway performs two-way authentication between the client and the server. Clients must present a trusted certificate to access your custom domain name.

``` swift
public struct MutualTlsAuthentication: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.Codable`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(from:)`

``` swift
public init (from decoder: Swift.Decoder) throws 
```

### `init(truststoreUri:truststoreVersion:truststoreWarnings:)`

``` swift
public init (
            truststoreUri: Swift.String? = nil,
            truststoreVersion: Swift.String? = nil,
            truststoreWarnings: [Swift.String]? = nil
        )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `truststoreUri`

An Amazon S3 URL that specifies the truststore for mutual TLS authentication,
for example s3:​//bucket-name/key-name.
The truststore can contain certificates from public or private certificate authorities.
To update the truststore, upload a new version to S3, and then update your custom domain
name to use the new version. To update the truststore, you must have permissions to
access the S3 object.

``` swift
public var truststoreUri: Swift.String?
```

### `truststoreVersion`

The version of the S3 object that contains your truststore. To
specify a version, you must have versioning enabled for the S3 bucket.

``` swift
public var truststoreVersion: Swift.String?
```

### `truststoreWarnings`

A list of warnings that API Gateway returns while processing your truststore. Invalid
certificates produce warnings. Mutual TLS is still enabled, but some clients might not
be able to access your API. To resolve warnings, upload a new truststore to S3, and then
update you domain name to use the new version.

``` swift
public var truststoreWarnings: [Swift.String]?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
