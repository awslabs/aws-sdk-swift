# CustomerProfilesClient.CustomerProfilesClientConfiguration

``` swift
public class CustomerProfilesClientConfiguration: AWSClientRuntime.AWSClientConfiguration 
```

## Inheritance

`AWSClientRuntime.AWSClientConfiguration`

## Initializers

### `init(credentialsProvider:endpointResolver:region:regionResolver:signingRegion:runtimeConfig:)`

``` swift
public init(
            credentialsProvider: AWSClientRuntime.CredentialsProvider? = nil,
            endpointResolver: AWSClientRuntime.EndpointResolver? = nil,
            region: Swift.String? = nil,
            regionResolver: AWSClientRuntime.RegionResolver? = nil,
            signingRegion: Swift.String? = nil,
            runtimeConfig: ClientRuntime.SDKRuntimeConfiguration
        ) throws 
```

### `init(credentialsProvider:endpointResolver:region:regionResolver:signingRegion:)`

``` swift
public convenience init(
            credentialsProvider: AWSClientRuntime.CredentialsProvider? = nil,
            endpointResolver: AWSClientRuntime.EndpointResolver? = nil,
            region: Swift.String? = nil,
            regionResolver: AWSClientRuntime.RegionResolver? = nil,
            signingRegion: Swift.String? = nil
        ) throws 
```

## Properties

### `clientLogMode`

``` swift
public var clientLogMode: ClientRuntime.ClientLogMode
```

### `decoder`

``` swift
public var decoder: ClientRuntime.ResponseDecoder?
```

### `encoder`

``` swift
public var encoder: ClientRuntime.RequestEncoder?
```

### `httpClientConfiguration`

``` swift
public var httpClientConfiguration: ClientRuntime.HttpClientConfiguration
```

### `httpClientEngine`

``` swift
public var httpClientEngine: ClientRuntime.HttpClientEngine
```

### `idempotencyTokenGenerator`

``` swift
public var idempotencyTokenGenerator: ClientRuntime.IdempotencyTokenGenerator
```

### `logger`

``` swift
public var logger: ClientRuntime.LogAgent
```

### `retryer`

``` swift
public var retryer: ClientRuntime.SDKRetryer
```

### `credentialsProvider`

``` swift
public var credentialsProvider: AWSClientRuntime.CredentialsProvider
```

### `endpointResolver`

``` swift
public var endpointResolver: AWSClientRuntime.EndpointResolver
```

### `region`

``` swift
public var region: Swift.String?
```

### `regionResolver`

``` swift
public var regionResolver: AWSClientRuntime.RegionResolver
```

### `signingRegion`

``` swift
public var signingRegion: Swift.String?
```
