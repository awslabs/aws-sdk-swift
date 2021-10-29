# SsoClient

``` swift
public class SsoClient 
```

## Inheritance

[`SsoClientProtocol`](/aws-sdk-swift/reference/0.x/AWSSSO/SsoClientProtocol)

## Initializers

### `init(config:)`

``` swift
public init(config: AWSClientRuntime.AWSClientConfiguration) 
```

### `init(region:)`

``` swift
public convenience init(region: Swift.String? = nil) throws 
```

## Properties

### `clientName`

``` swift
public static let clientName = "SsoClient"
```

## Methods

### `getRoleCredentials(input:completion:)`

Returns the STS short-term credentials for a given role name that is assigned to the user.

``` swift
public func getRoleCredentials(input: GetRoleCredentialsInput, completion: @escaping (ClientRuntime.SdkResult<GetRoleCredentialsOutputResponse, GetRoleCredentialsOutputError>) -> Void)
```

### `listAccountRoles(input:completion:)`

Lists all roles that are assigned to the user for a given AWS account.

``` swift
public func listAccountRoles(input: ListAccountRolesInput, completion: @escaping (ClientRuntime.SdkResult<ListAccountRolesOutputResponse, ListAccountRolesOutputError>) -> Void)
```

### `listAccounts(input:completion:)`

Lists all AWS accounts assigned to the user. These AWS accounts are assigned by the administrator of the account. For more information, see [Assign User Access](https://docs.aws.amazon.com/singlesignon/latest/userguide/useraccess.html#assignusers) in the AWS SSO User Guide. This operation returns a paginated response.

``` swift
public func listAccounts(input: ListAccountsInput, completion: @escaping (ClientRuntime.SdkResult<ListAccountsOutputResponse, ListAccountsOutputError>) -> Void)
```

### `logout(input:completion:)`

Removes the client- and server-side session that is associated with the user.

``` swift
public func logout(input: LogoutInput, completion: @escaping (ClientRuntime.SdkResult<LogoutOutputResponse, LogoutOutputError>) -> Void)
```
