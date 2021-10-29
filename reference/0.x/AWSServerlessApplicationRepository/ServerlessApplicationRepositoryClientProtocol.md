# ServerlessApplicationRepositoryClientProtocol

The AWS Serverless Application Repository makes it easy for developers and enterprises to quickly find and deploy serverless applications in the AWS Cloud. For more information about serverless applications, see Serverless Computing and Applications on the AWS website.The AWS Serverless Application Repository is deeply integrated with the AWS Lambda console, so that developers of all levels can get started with serverless computing without needing to learn anything new. You can use category keywords to browse for applications such as web and mobile backends, data processing applications, or chatbots. You can also search for applications by name, publisher, or event source. To use an application, you simply choose it, configure any required fields, and deploy it with a few clicks. You can also easily publish applications, sharing them publicly with the community at large, or privately within your team or across your organization. To publish a serverless application (or app), you can use the AWS Management Console, AWS Command Line Interface (AWS CLI), or AWS SDKs to upload the code. Along with the code, you upload a simple manifest file, also known as the AWS Serverless Application Model (AWS SAM) template. For more information about AWS SAM, see AWS Serverless Application Model (AWS SAM) on the AWS Labs GitHub repository.The AWS Serverless Application Repository Developer Guide contains more information about the two developer experiences available:

``` swift
public protocol ServerlessApplicationRepositoryClientProtocol 
```

  - Consuming Applications – Browse for applications and view information about them, including source code and readme files. Also install, configure, and deploy applications of your choosing. Publishing Applications – Configure and upload applications to make them available to other developers, and publish new versions of applications.

## Requirements

### createApplication(input:completion:)

Creates an application, optionally including an AWS SAM file to create the first application version in the same call.

``` swift
func createApplication(input: CreateApplicationInput, completion: @escaping (ClientRuntime.SdkResult<CreateApplicationOutputResponse, CreateApplicationOutputError>) -> Void)
```

### createApplicationVersion(input:completion:)

Creates an application version.

``` swift
func createApplicationVersion(input: CreateApplicationVersionInput, completion: @escaping (ClientRuntime.SdkResult<CreateApplicationVersionOutputResponse, CreateApplicationVersionOutputError>) -> Void)
```

### createCloudFormationChangeSet(input:completion:)

Creates an AWS CloudFormation change set for the given application.

``` swift
func createCloudFormationChangeSet(input: CreateCloudFormationChangeSetInput, completion: @escaping (ClientRuntime.SdkResult<CreateCloudFormationChangeSetOutputResponse, CreateCloudFormationChangeSetOutputError>) -> Void)
```

### createCloudFormationTemplate(input:completion:)

Creates an AWS CloudFormation template.

``` swift
func createCloudFormationTemplate(input: CreateCloudFormationTemplateInput, completion: @escaping (ClientRuntime.SdkResult<CreateCloudFormationTemplateOutputResponse, CreateCloudFormationTemplateOutputError>) -> Void)
```

### deleteApplication(input:completion:)

Deletes the specified application.

``` swift
func deleteApplication(input: DeleteApplicationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteApplicationOutputResponse, DeleteApplicationOutputError>) -> Void)
```

### getApplication(input:completion:)

Gets the specified application.

``` swift
func getApplication(input: GetApplicationInput, completion: @escaping (ClientRuntime.SdkResult<GetApplicationOutputResponse, GetApplicationOutputError>) -> Void)
```

### getApplicationPolicy(input:completion:)

Retrieves the policy for the application.

``` swift
func getApplicationPolicy(input: GetApplicationPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetApplicationPolicyOutputResponse, GetApplicationPolicyOutputError>) -> Void)
```

### getCloudFormationTemplate(input:completion:)

Gets the specified AWS CloudFormation template.

``` swift
func getCloudFormationTemplate(input: GetCloudFormationTemplateInput, completion: @escaping (ClientRuntime.SdkResult<GetCloudFormationTemplateOutputResponse, GetCloudFormationTemplateOutputError>) -> Void)
```

### listApplicationDependencies(input:completion:)

Retrieves the list of applications nested in the containing application.

``` swift
func listApplicationDependencies(input: ListApplicationDependenciesInput, completion: @escaping (ClientRuntime.SdkResult<ListApplicationDependenciesOutputResponse, ListApplicationDependenciesOutputError>) -> Void)
```

### listApplications(input:completion:)

Lists applications owned by the requester.

``` swift
func listApplications(input: ListApplicationsInput, completion: @escaping (ClientRuntime.SdkResult<ListApplicationsOutputResponse, ListApplicationsOutputError>) -> Void)
```

### listApplicationVersions(input:completion:)

Lists versions for the specified application.

``` swift
func listApplicationVersions(input: ListApplicationVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListApplicationVersionsOutputResponse, ListApplicationVersionsOutputError>) -> Void)
```

### putApplicationPolicy(input:completion:)

Sets the permission policy for an application. For the list of actions supported for this operation, see [Application Permissions](https://docs.aws.amazon.com/serverlessrepo/latest/devguide/access-control-resource-based.html#application-permissions) .

``` swift
func putApplicationPolicy(input: PutApplicationPolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutApplicationPolicyOutputResponse, PutApplicationPolicyOutputError>) -> Void)
```

### unshareApplication(input:completion:)

Unshares an application from an AWS Organization.This operation can be called only from the organization's master account.

``` swift
func unshareApplication(input: UnshareApplicationInput, completion: @escaping (ClientRuntime.SdkResult<UnshareApplicationOutputResponse, UnshareApplicationOutputError>) -> Void)
```

### updateApplication(input:completion:)

Updates the specified application.

``` swift
func updateApplication(input: UpdateApplicationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateApplicationOutputResponse, UpdateApplicationOutputError>) -> Void)
```
