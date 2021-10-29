# AppRunnerClient

``` swift
public class AppRunnerClient 
```

## Inheritance

[`AppRunnerClientProtocol`](/aws-sdk-swift/reference/0.x/AWSAppRunner/AppRunnerClientProtocol)

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
public static let clientName = "AppRunnerClient"
```

## Methods

### `associateCustomDomain(input:completion:)`

Associate your own domain name with the AWS App Runner subdomain URL of your App Runner service. After you call AssociateCustomDomain and receive a successful response, use the information in the \[CustomDomain\] record that's returned to add CNAME records to your Domain Name System (DNS). For each mapped domain name, add a mapping to the target App Runner subdomain and one or more certificate validation records. App Runner then performs DNS validation to verify that you own or control the domain name that you associated. App Runner tracks domain validity in a certificate stored in [AWS Certificate Manager (ACM)](https://docs.aws.amazon.com/acm/latest/userguide).

``` swift
public func associateCustomDomain(input: AssociateCustomDomainInput, completion: @escaping (ClientRuntime.SdkResult<AssociateCustomDomainOutputResponse, AssociateCustomDomainOutputError>) -> Void)
```

### `createAutoScalingConfiguration(input:completion:)`

Create an AWS App Runner automatic scaling configuration resource. App Runner requires this resource when you create App Runner services that require non-default auto scaling settings. You can share an auto scaling configuration across multiple services. Create multiple revisions of a configuration by using the same AutoScalingConfigurationName and different AutoScalingConfigurationRevision values. When you create a service, you can set it to use the latest active revision of an auto scaling configuration or a specific revision. Configure a higher MinSize to increase the spread of your App Runner service over more Availability Zones in the AWS Region. The tradeoff is a higher minimal cost. Configure a lower MaxSize to control your cost. The tradeoff is lower responsiveness during peak demand.

``` swift
public func createAutoScalingConfiguration(input: CreateAutoScalingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<CreateAutoScalingConfigurationOutputResponse, CreateAutoScalingConfigurationOutputError>) -> Void)
```

### `createConnection(input:completion:)`

Create an AWS App Runner connection resource. App Runner requires a connection resource when you create App Runner services that access private repositories from certain third-party providers. You can share a connection across multiple services. A connection resource is needed to access GitHub repositories. GitHub requires a user interface approval process through the App Runner console before you can use the connection.

``` swift
public func createConnection(input: CreateConnectionInput, completion: @escaping (ClientRuntime.SdkResult<CreateConnectionOutputResponse, CreateConnectionOutputError>) -> Void)
```

### `createService(input:completion:)`

Create an AWS App Runner service. After the service is created, the action also automatically starts a deployment. This is an asynchronous operation. On a successful call, you can use the returned OperationId and the [ListOperations](https://docs.aws.amazon.com/apprunner/latest/api/API_ListOperations.html) call to track the operation's progress.

``` swift
public func createService(input: CreateServiceInput, completion: @escaping (ClientRuntime.SdkResult<CreateServiceOutputResponse, CreateServiceOutputError>) -> Void)
```

### `deleteAutoScalingConfiguration(input:completion:)`

Delete an AWS App Runner automatic scaling configuration resource. You can delete a specific revision or the latest active revision. You can't delete a configuration that's used by one or more App Runner services.

``` swift
public func deleteAutoScalingConfiguration(input: DeleteAutoScalingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAutoScalingConfigurationOutputResponse, DeleteAutoScalingConfigurationOutputError>) -> Void)
```

### `deleteConnection(input:completion:)`

Delete an AWS App Runner connection. You must first ensure that there are no running App Runner services that use this connection. If there are any, the DeleteConnection action fails.

``` swift
public func deleteConnection(input: DeleteConnectionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteConnectionOutputResponse, DeleteConnectionOutputError>) -> Void)
```

### `deleteService(input:completion:)`

Delete an AWS App Runner service. This is an asynchronous operation. On a successful call, you can use the returned OperationId and the \[ListOperations\] call to track the operation's progress.

``` swift
public func deleteService(input: DeleteServiceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteServiceOutputResponse, DeleteServiceOutputError>) -> Void)
```

### `describeAutoScalingConfiguration(input:completion:)`

Return a full description of an AWS App Runner automatic scaling configuration resource.

``` swift
public func describeAutoScalingConfiguration(input: DescribeAutoScalingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAutoScalingConfigurationOutputResponse, DescribeAutoScalingConfigurationOutputError>) -> Void)
```

### `describeCustomDomains(input:completion:)`

Return a description of custom domain names that are associated with an AWS App Runner service.

``` swift
public func describeCustomDomains(input: DescribeCustomDomainsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCustomDomainsOutputResponse, DescribeCustomDomainsOutputError>) -> Void)
```

### `describeService(input:completion:)`

Return a full description of an AWS App Runner service.

``` swift
public func describeService(input: DescribeServiceInput, completion: @escaping (ClientRuntime.SdkResult<DescribeServiceOutputResponse, DescribeServiceOutputError>) -> Void)
```

### `disassociateCustomDomain(input:completion:)`

Disassociate a custom domain name from an AWS App Runner service. Certificates tracking domain validity are associated with a custom domain and are stored in [AWS Certificate Manager (ACM)](https://docs.aws.amazon.com/acm/latest/userguide). These certificates aren't deleted as part of this action. App Runner delays certificate deletion for 30 days after a domain is disassociated from your service.

``` swift
public func disassociateCustomDomain(input: DisassociateCustomDomainInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateCustomDomainOutputResponse, DisassociateCustomDomainOutputError>) -> Void)
```

### `listAutoScalingConfigurations(input:completion:)`

Returns a list of AWS App Runner automatic scaling configurations in your AWS account. You can query the revisions for a specific configuration name or the revisions for all configurations in your account. You can optionally query only the latest revision of each requested name.

``` swift
public func listAutoScalingConfigurations(input: ListAutoScalingConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<ListAutoScalingConfigurationsOutputResponse, ListAutoScalingConfigurationsOutputError>) -> Void)
```

### `listConnections(input:completion:)`

Returns a list of AWS App Runner connections that are associated with your AWS account.

``` swift
public func listConnections(input: ListConnectionsInput, completion: @escaping (ClientRuntime.SdkResult<ListConnectionsOutputResponse, ListConnectionsOutputError>) -> Void)
```

### `listOperations(input:completion:)`

Return a list of operations that occurred on an AWS App Runner service. The resulting list of \[OperationSummary\] objects is sorted in reverse chronological order. The first object on the list represents the last started operation.

``` swift
public func listOperations(input: ListOperationsInput, completion: @escaping (ClientRuntime.SdkResult<ListOperationsOutputResponse, ListOperationsOutputError>) -> Void)
```

### `listServices(input:completion:)`

Returns a list of running AWS App Runner services in your AWS account.

``` swift
public func listServices(input: ListServicesInput, completion: @escaping (ClientRuntime.SdkResult<ListServicesOutputResponse, ListServicesOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

List tags that are associated with for an AWS App Runner resource. The response contains a list of tag key-value pairs.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `pauseService(input:completion:)`

Pause an active AWS App Runner service. App Runner reduces compute capacity for the service to zero and loses state (for example, ephemeral storage is removed). This is an asynchronous operation. On a successful call, you can use the returned OperationId and the \[ListOperations\] call to track the operation's progress.

``` swift
public func pauseService(input: PauseServiceInput, completion: @escaping (ClientRuntime.SdkResult<PauseServiceOutputResponse, PauseServiceOutputError>) -> Void)
```

### `resumeService(input:completion:)`

Resume an active AWS App Runner service. App Runner provisions compute capacity for the service. This is an asynchronous operation. On a successful call, you can use the returned OperationId and the \[ListOperations\] call to track the operation's progress.

``` swift
public func resumeService(input: ResumeServiceInput, completion: @escaping (ClientRuntime.SdkResult<ResumeServiceOutputResponse, ResumeServiceOutputError>) -> Void)
```

### `startDeployment(input:completion:)`

Initiate a manual deployment of the latest commit in a source code repository or the latest image in a source image repository to an AWS App Runner service. For a source code repository, App Runner retrieves the commit and builds a Docker image. For a source image repository, App Runner retrieves the latest Docker image. In both cases, App Runner then deploys the new image to your service and starts a new container instance. This is an asynchronous operation. On a successful call, you can use the returned OperationId and the \[ListOperations\] call to track the operation's progress.

``` swift
public func startDeployment(input: StartDeploymentInput, completion: @escaping (ClientRuntime.SdkResult<StartDeploymentOutputResponse, StartDeploymentOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Add tags to, or update the tag values of, an App Runner resource. A tag is a key-value pair.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Remove tags from an App Runner resource.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateService(input:completion:)`

Update an AWS App Runner service. You can update the source configuration and instance configuration of the service. You can also update the ARN of the auto scaling configuration resource that's associated with the service. However, you can't change the name or the encryption configuration of the service. These can be set only when you create the service. To update the tags applied to your service, use the separate actions \[TagResource\] and \[UntagResource\]. This is an asynchronous operation. On a successful call, you can use the returned OperationId and the \[ListOperations\] call to track the operation's progress.

``` swift
public func updateService(input: UpdateServiceInput, completion: @escaping (ClientRuntime.SdkResult<UpdateServiceOutputResponse, UpdateServiceOutputError>) -> Void)
```
