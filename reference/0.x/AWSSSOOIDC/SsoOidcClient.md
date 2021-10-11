# SsoOidcClient

``` swift
public class SsoOidcClient 
```

## Inheritance

[`SsoOidcClientProtocol`](/aws-sdk-swift/reference/0.x/AWSSSOOIDC/SsoOidcClientProtocol)

## Initializers

### `init(config:)`

``` swift
public init(config: AWSClientRuntime.AWSClientConfiguration) 
```

### `init(region:)`

``` swift
public convenience init(region: Swift.String? = nil) throws 
```

## Methods

### `createToken(input:completion:)`

Creates and returns an access token for the authorized client. The access token issued
will be used to fetch short-term credentials for the assigned roles in the AWS
account.

``` swift
public func createToken(input: CreateTokenInput, completion: @escaping (ClientRuntime.SdkResult<CreateTokenOutputResponse, CreateTokenOutputError>) -> Void)
```

### `registerClient(input:completion:)`

Registers a client with AWS SSO. This allows clients to initiate device authorization.
The output should be persisted for reuse through many authentication requests.

``` swift
public func registerClient(input: RegisterClientInput, completion: @escaping (ClientRuntime.SdkResult<RegisterClientOutputResponse, RegisterClientOutputError>) -> Void)
```

### `startDeviceAuthorization(input:completion:)`

Initiates device authorization by requesting a pair of verification codes from the authorization service.

``` swift
public func startDeviceAuthorization(input: StartDeviceAuthorizationInput, completion: @escaping (ClientRuntime.SdkResult<StartDeviceAuthorizationOutputResponse, StartDeviceAuthorizationOutputError>) -> Void)
```
