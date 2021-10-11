# MacieClient

``` swift
public class MacieClient 
```

## Inheritance

[`MacieClientProtocol`](/aws-sdk-swift/reference/0.x/AWSMacie/MacieClientProtocol)

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

### `associateMemberAccount(input:completion:)`

Associates a specified AWS account with Amazon Macie Classic as a member
account.

``` swift
public func associateMemberAccount(input: AssociateMemberAccountInput, completion: @escaping (ClientRuntime.SdkResult<AssociateMemberAccountOutputResponse, AssociateMemberAccountOutputError>) -> Void)
```

### `associateS3Resources(input:completion:)`

Associates specified S3 resources with Amazon Macie Classic for monitoring and data
classification. If memberAccountId isn't specified, the action associates specified S3
resources with Macie Classic for the current Macie Classic administrator account. If memberAccountId is specified,
the action associates specified S3 resources with Macie Classic for the specified member
account.

``` swift
public func associateS3Resources(input: AssociateS3ResourcesInput, completion: @escaping (ClientRuntime.SdkResult<AssociateS3ResourcesOutputResponse, AssociateS3ResourcesOutputError>) -> Void)
```

### `disassociateMemberAccount(input:completion:)`

Removes the specified member account from Amazon Macie Classic.

``` swift
public func disassociateMemberAccount(input: DisassociateMemberAccountInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateMemberAccountOutputResponse, DisassociateMemberAccountOutputError>) -> Void)
```

### `disassociateS3Resources(input:completion:)`

Removes specified S3 resources from being monitored by Amazon Macie Classic. If
memberAccountId isn't specified, the action removes specified S3 resources from Macie Classic
for the current Macie Classic administrator account. If memberAccountId is specified, the action removes specified
S3 resources from Macie Classic for the specified member account.

``` swift
public func disassociateS3Resources(input: DisassociateS3ResourcesInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateS3ResourcesOutputResponse, DisassociateS3ResourcesOutputError>) -> Void)
```

### `listMemberAccounts(input:completion:)`

Lists all Amazon Macie Classic member accounts for the current Macie Classic administrator account.

``` swift
public func listMemberAccounts(input: ListMemberAccountsInput, completion: @escaping (ClientRuntime.SdkResult<ListMemberAccountsOutputResponse, ListMemberAccountsOutputError>) -> Void)
```

### `listS3Resources(input:completion:)`

Lists all the S3 resources associated with Amazon Macie Classic. If memberAccountId
isn't specified, the action lists the S3 resources associated with Macie Classic for
the current Macie Classic administrator account. If memberAccountId is specified, the action lists the S3 resources
associated with Macie Classic for the specified member account.

``` swift
public func listS3Resources(input: ListS3ResourcesInput, completion: @escaping (ClientRuntime.SdkResult<ListS3ResourcesOutputResponse, ListS3ResourcesOutputError>) -> Void)
```

### `updateS3Resources(input:completion:)`

Updates the classification types for the specified S3 resources. If memberAccountId
isn't specified, the action updates the classification types of the S3 resources associated
with Amazon Macie Classic for the current Macie Classic administrator account. If memberAccountId is specified, the
action updates the classification types of the S3 resources associated with Macie
Classic for the specified member account.

``` swift
public func updateS3Resources(input: UpdateS3ResourcesInput, completion: @escaping (ClientRuntime.SdkResult<UpdateS3ResourcesOutputResponse, UpdateS3ResourcesOutputError>) -> Void)
```
