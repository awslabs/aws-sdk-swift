# ServerlessApplicationRepositoryClient

``` swift
public class ServerlessApplicationRepositoryClient 
```

## Inheritance

[`ServerlessApplicationRepositoryClientProtocol`](/aws-sdk-swift/reference/0.x/AWSServerlessApplicationRepository/ServerlessApplicationRepositoryClientProtocol)

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
public static let clientName = "ServerlessApplicationRepositoryClient"
```

## Methods

### `createApplication(input:completion:)`

Creates an application, optionally including an AWS SAM file to create the first application version in the same call.

``` swift
public func createApplication(input: CreateApplicationInput, completion: @escaping (ClientRuntime.SdkResult<CreateApplicationOutputResponse, CreateApplicationOutputError>) -> Void)
```

### `createApplicationVersion(input:completion:)`

Creates an application version.

``` swift
public func createApplicationVersion(input: CreateApplicationVersionInput, completion: @escaping (ClientRuntime.SdkResult<CreateApplicationVersionOutputResponse, CreateApplicationVersionOutputError>) -> Void)
```

### `createCloudFormationChangeSet(input:completion:)`

Creates an AWS CloudFormation change set for the given application.

``` swift
public func createCloudFormationChangeSet(input: CreateCloudFormationChangeSetInput, completion: @escaping (ClientRuntime.SdkResult<CreateCloudFormationChangeSetOutputResponse, CreateCloudFormationChangeSetOutputError>) -> Void)
```

### `createCloudFormationTemplate(input:completion:)`

Creates an AWS CloudFormation template.

``` swift
public func createCloudFormationTemplate(input: CreateCloudFormationTemplateInput, completion: @escaping (ClientRuntime.SdkResult<CreateCloudFormationTemplateOutputResponse, CreateCloudFormationTemplateOutputError>) -> Void)
```

### `deleteApplication(input:completion:)`

Deletes the specified application.

``` swift
public func deleteApplication(input: DeleteApplicationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteApplicationOutputResponse, DeleteApplicationOutputError>) -> Void)
```

### `getApplication(input:completion:)`

Gets the specified application.

``` swift
public func getApplication(input: GetApplicationInput, completion: @escaping (ClientRuntime.SdkResult<GetApplicationOutputResponse, GetApplicationOutputError>) -> Void)
```

### `getApplicationPolicy(input:completion:)`

Retrieves the policy for the application.

``` swift
public func getApplicationPolicy(input: GetApplicationPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetApplicationPolicyOutputResponse, GetApplicationPolicyOutputError>) -> Void)
```

### `getCloudFormationTemplate(input:completion:)`

Gets the specified AWS CloudFormation template.

``` swift
public func getCloudFormationTemplate(input: GetCloudFormationTemplateInput, completion: @escaping (ClientRuntime.SdkResult<GetCloudFormationTemplateOutputResponse, GetCloudFormationTemplateOutputError>) -> Void)
```

### `listApplicationDependencies(input:completion:)`

Retrieves the list of applications nested in the containing application.

``` swift
public func listApplicationDependencies(input: ListApplicationDependenciesInput, completion: @escaping (ClientRuntime.SdkResult<ListApplicationDependenciesOutputResponse, ListApplicationDependenciesOutputError>) -> Void)
```

### `listApplicationVersions(input:completion:)`

Lists versions for the specified application.

``` swift
public func listApplicationVersions(input: ListApplicationVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListApplicationVersionsOutputResponse, ListApplicationVersionsOutputError>) -> Void)
```

### `listApplications(input:completion:)`

Lists applications owned by the requester.

``` swift
public func listApplications(input: ListApplicationsInput, completion: @escaping (ClientRuntime.SdkResult<ListApplicationsOutputResponse, ListApplicationsOutputError>) -> Void)
```

### `putApplicationPolicy(input:completion:)`

Sets the permission policy for an application. For the list of actions supported for this operation, see [Application Permissions](https://docs.aws.amazon.com/serverlessrepo/latest/devguide/access-control-resource-based.html#application-permissions) .

``` swift
public func putApplicationPolicy(input: PutApplicationPolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutApplicationPolicyOutputResponse, PutApplicationPolicyOutputError>) -> Void)
```

### `unshareApplication(input:completion:)`

Unshares an application from an AWS Organization.This operation can be called only from the organization's master account.

``` swift
public func unshareApplication(input: UnshareApplicationInput, completion: @escaping (ClientRuntime.SdkResult<UnshareApplicationOutputResponse, UnshareApplicationOutputError>) -> Void)
```

### `updateApplication(input:completion:)`

Updates the specified application.

``` swift
public func updateApplication(input: UpdateApplicationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateApplicationOutputResponse, UpdateApplicationOutputError>) -> Void)
```
