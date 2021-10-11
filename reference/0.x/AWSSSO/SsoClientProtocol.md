# SsoClientProtocol

AWS Single Sign-On Portal is a web service that makes it easy for you to assign user
access to AWS SSO resources such as the user portal. Users can get AWS account applications
and roles assigned to them and get federated into the application.

``` swift
public protocol SsoClientProtocol 
```

``` 
     For general information about AWS SSO, see <a href="https://docs.aws.amazon.com/singlesignon/latest/userguide/what-is.html">What is AWS
    Single Sign-On? in the AWS SSO User Guide.

     This API reference guide describes the AWS SSO Portal operations that you can call
  programatically and includes detailed information on data types and errors.


        AWS provides SDKs that consist of libraries and sample code for various programming
    languages and platforms, such as Java, Ruby, .Net, iOS, or Android. The SDKs provide a
    convenient way to create programmatic access to AWS SSO and other AWS services. For more
    information about the AWS SDKs, including how to download and install them, see <a href="http://aws.amazon.com/tools/">Tools for Amazon Web Services.
```

## Requirements

### getRoleCredentials(input:​completion:​)

Returns the STS short-term credentials for a given role name that is assigned to the
user.

``` swift
func getRoleCredentials(input: GetRoleCredentialsInput, completion: @escaping (ClientRuntime.SdkResult<GetRoleCredentialsOutputResponse, GetRoleCredentialsOutputError>) -> Void)
```

### listAccountRoles(input:​completion:​)

Lists all roles that are assigned to the user for a given AWS account.

``` swift
func listAccountRoles(input: ListAccountRolesInput, completion: @escaping (ClientRuntime.SdkResult<ListAccountRolesOutputResponse, ListAccountRolesOutputError>) -> Void)
```

### listAccounts(input:​completion:​)

Lists all AWS accounts assigned to the user. These AWS accounts are assigned by the
administrator of the account. For more information, see <a href="https:​//docs.aws.amazon.com/singlesignon/latest/userguide/useraccess.html#assignusers">Assign User Access in the AWS SSO User Guide. This operation
returns a paginated response.

``` swift
func listAccounts(input: ListAccountsInput, completion: @escaping (ClientRuntime.SdkResult<ListAccountsOutputResponse, ListAccountsOutputError>) -> Void)
```

### logout(input:​completion:​)

Removes the client- and server-side session that is associated with the user.

``` swift
func logout(input: LogoutInput, completion: @escaping (ClientRuntime.SdkResult<LogoutOutputResponse, LogoutOutputError>) -> Void)
```
