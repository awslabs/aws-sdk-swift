# ServiceDiscoveryClient

``` swift
public class ServiceDiscoveryClient 
```

## Inheritance

[`ServiceDiscoveryClientProtocol`](/aws-sdk-swift/reference/0.x/AWSServiceDiscovery/ServiceDiscoveryClientProtocol)

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
public static let clientName = "ServiceDiscoveryClient"
```

## Methods

### `createHttpNamespace(input:completion:)`

Creates an HTTP namespace. Service instances registered using an HTTP namespace can be discovered using a DiscoverInstances request but can't be discovered using DNS. For the current quota on the number of namespaces that you can create using the same account, see [Cloud Map quotas](https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html) in the Cloud Map Developer Guide.

``` swift
public func createHttpNamespace(input: CreateHttpNamespaceInput, completion: @escaping (ClientRuntime.SdkResult<CreateHttpNamespaceOutputResponse, CreateHttpNamespaceOutputError>) -> Void)
```

### `createPrivateDnsNamespace(input:completion:)`

Creates a private namespace based on DNS, which is visible only inside a specified Amazon VPC. The namespace defines your service naming scheme. For example, if you name your namespace example.com and name your service backend, the resulting DNS name for the service is backend.example.com. Service instances that are registered using a private DNS namespace can be discovered using either a DiscoverInstances request or using DNS. For the current quota on the number of namespaces that you can create using the same account, see [Cloud Map quotas](https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html) in the Cloud Map Developer Guide.

``` swift
public func createPrivateDnsNamespace(input: CreatePrivateDnsNamespaceInput, completion: @escaping (ClientRuntime.SdkResult<CreatePrivateDnsNamespaceOutputResponse, CreatePrivateDnsNamespaceOutputError>) -> Void)
```

### `createPublicDnsNamespace(input:completion:)`

Creates a public namespace based on DNS, which is visible on the internet. The namespace defines your service naming scheme. For example, if you name your namespace example.com and name your service backend, the resulting DNS name for the service is backend.example.com. You can discover instances that were registered with a public DNS namespace by using either a DiscoverInstances request or using DNS. For the current quota on the number of namespaces that you can create using the same account, see [Cloud Map quotas](https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html) in the Cloud Map Developer Guide.

``` swift
public func createPublicDnsNamespace(input: CreatePublicDnsNamespaceInput, completion: @escaping (ClientRuntime.SdkResult<CreatePublicDnsNamespaceOutputResponse, CreatePublicDnsNamespaceOutputError>) -> Void)
```

### `createService(input:completion:)`

Creates a service. This action defines the configuration for the following entities:

``` swift
public func createService(input: CreateServiceInput, completion: @escaping (ClientRuntime.SdkResult<CreateServiceOutputResponse, CreateServiceOutputError>) -> Void)
```

  - For public and private DNS namespaces, one of the following combinations of DNS records in Amazon Route 53:

  - A

  - AAAA

  - A and AAAA

  - SRV

  - CNAME

  - Optionally, a health check

After you create the service, you can submit a [RegisterInstance](https://docs.aws.amazon.com/cloud-map/latest/api/API_RegisterInstance.html) request, and Cloud Map uses the values in the configuration to create the specified entities. For the current quota on the number of instances that you can register using the same namespace and using the same service, see [Cloud Map quotas](https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html) in the Cloud Map Developer Guide.

### `deleteNamespace(input:completion:)`

Deletes a namespace from the current account. If the namespace still contains one or more services, the request fails.

``` swift
public func deleteNamespace(input: DeleteNamespaceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteNamespaceOutputResponse, DeleteNamespaceOutputError>) -> Void)
```

### `deleteService(input:completion:)`

Deletes a specified service. If the service still contains one or more registered instances, the request fails.

``` swift
public func deleteService(input: DeleteServiceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteServiceOutputResponse, DeleteServiceOutputError>) -> Void)
```

### `deregisterInstance(input:completion:)`

Deletes the Amazon Route 53 DNS records and health check, if any, that Cloud Map created for the specified instance.

``` swift
public func deregisterInstance(input: DeregisterInstanceInput, completion: @escaping (ClientRuntime.SdkResult<DeregisterInstanceOutputResponse, DeregisterInstanceOutputError>) -> Void)
```

### `discoverInstances(input:completion:)`

Discovers registered instances for a specified namespace and service. You can use DiscoverInstances to discover instances for any type of namespace. For public and private DNS namespaces, you can also use DNS queries to discover instances.

``` swift
public func discoverInstances(input: DiscoverInstancesInput, completion: @escaping (ClientRuntime.SdkResult<DiscoverInstancesOutputResponse, DiscoverInstancesOutputError>) -> Void)
```

### `getInstance(input:completion:)`

Gets information about a specified instance.

``` swift
public func getInstance(input: GetInstanceInput, completion: @escaping (ClientRuntime.SdkResult<GetInstanceOutputResponse, GetInstanceOutputError>) -> Void)
```

### `getInstancesHealthStatus(input:completion:)`

Gets the current health status (Healthy, Unhealthy, or Unknown) of one or more instances that are associated with a specified service. There's a brief delay between when you register an instance and when the health status for the instance is available.

``` swift
public func getInstancesHealthStatus(input: GetInstancesHealthStatusInput, completion: @escaping (ClientRuntime.SdkResult<GetInstancesHealthStatusOutputResponse, GetInstancesHealthStatusOutputError>) -> Void)
```

### `getNamespace(input:completion:)`

Gets information about a namespace.

``` swift
public func getNamespace(input: GetNamespaceInput, completion: @escaping (ClientRuntime.SdkResult<GetNamespaceOutputResponse, GetNamespaceOutputError>) -> Void)
```

### `getOperation(input:completion:)`

Gets information about any operation that returns an operation ID in the response, such as a CreateService request. To get a list of operations that match specified criteria, see [ListOperations](https://docs.aws.amazon.com/cloud-map/latest/api/API_ListOperations.html).

``` swift
public func getOperation(input: GetOperationInput, completion: @escaping (ClientRuntime.SdkResult<GetOperationOutputResponse, GetOperationOutputError>) -> Void)
```

### `getService(input:completion:)`

Gets the settings for a specified service.

``` swift
public func getService(input: GetServiceInput, completion: @escaping (ClientRuntime.SdkResult<GetServiceOutputResponse, GetServiceOutputError>) -> Void)
```

### `listInstances(input:completion:)`

Lists summary information about the instances that you registered by using a specified service.

``` swift
public func listInstances(input: ListInstancesInput, completion: @escaping (ClientRuntime.SdkResult<ListInstancesOutputResponse, ListInstancesOutputError>) -> Void)
```

### `listNamespaces(input:completion:)`

Lists summary information about the namespaces that were created by the current account.

``` swift
public func listNamespaces(input: ListNamespacesInput, completion: @escaping (ClientRuntime.SdkResult<ListNamespacesOutputResponse, ListNamespacesOutputError>) -> Void)
```

### `listOperations(input:completion:)`

Lists operations that match the criteria that you specify.

``` swift
public func listOperations(input: ListOperationsInput, completion: @escaping (ClientRuntime.SdkResult<ListOperationsOutputResponse, ListOperationsOutputError>) -> Void)
```

### `listServices(input:completion:)`

Lists summary information for all the services that are associated with one or more specified namespaces.

``` swift
public func listServices(input: ListServicesInput, completion: @escaping (ClientRuntime.SdkResult<ListServicesOutputResponse, ListServicesOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Lists tags for the specified resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `registerInstance(input:completion:)`

Creates or updates one or more records and, optionally, creates a health check based on the settings in a specified service. When you submit a RegisterInstance request, the following occurs:

``` swift
public func registerInstance(input: RegisterInstanceInput, completion: @escaping (ClientRuntime.SdkResult<RegisterInstanceOutputResponse, RegisterInstanceOutputError>) -> Void)
```

  - For each DNS record that you define in the service that's specified by ServiceId, a record is created or updated in the hosted zone that's associated with the corresponding namespace.

  - If the service includes HealthCheckConfig, a health check is created based on the settings in the health check configuration.

  - The health check, if any, is associated with each of the new or updated records.

One RegisterInstance request must complete before you can submit another request and specify the same service ID and instance ID. For more information, see [CreateService](https://docs.aws.amazon.com/cloud-map/latest/api/API_CreateService.html). When Cloud Map receives a DNS query for the specified DNS name, it returns the applicable value:

  - If the health check is healthy: returns all the records

  - If the health check is unhealthy: returns the applicable value for the last healthy instance

  - If you didn't specify a health check configuration: returns all the records

For the current quota on the number of instances that you can register using the same namespace and using the same service, see [Cloud Map quotas](https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html) in the Cloud Map Developer Guide.

### `tagResource(input:completion:)`

Adds one or more tags to the specified resource.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes one or more tags from the specified resource.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateHttpNamespace(input:completion:)`

Updates an HTTP namespace.

``` swift
public func updateHttpNamespace(input: UpdateHttpNamespaceInput, completion: @escaping (ClientRuntime.SdkResult<UpdateHttpNamespaceOutputResponse, UpdateHttpNamespaceOutputError>) -> Void)
```

### `updateInstanceCustomHealthStatus(input:completion:)`

Submits a request to change the health status of a custom health check to healthy or unhealthy. You can use UpdateInstanceCustomHealthStatus to change the status only for custom health checks, which you define using HealthCheckCustomConfig when you create a service. You can't use it to change the status for Route 53 health checks, which you define using HealthCheckConfig. For more information, see [HealthCheckCustomConfig](https://docs.aws.amazon.com/cloud-map/latest/api/API_HealthCheckCustomConfig.html).

``` swift
public func updateInstanceCustomHealthStatus(input: UpdateInstanceCustomHealthStatusInput, completion: @escaping (ClientRuntime.SdkResult<UpdateInstanceCustomHealthStatusOutputResponse, UpdateInstanceCustomHealthStatusOutputError>) -> Void)
```

### `updatePrivateDnsNamespace(input:completion:)`

Updates a private DNS namespace.

``` swift
public func updatePrivateDnsNamespace(input: UpdatePrivateDnsNamespaceInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePrivateDnsNamespaceOutputResponse, UpdatePrivateDnsNamespaceOutputError>) -> Void)
```

### `updatePublicDnsNamespace(input:completion:)`

Updates a public DNS namespace.

``` swift
public func updatePublicDnsNamespace(input: UpdatePublicDnsNamespaceInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePublicDnsNamespaceOutputResponse, UpdatePublicDnsNamespaceOutputError>) -> Void)
```

### `updateService(input:completion:)`

Submits a request to perform the following operations:

``` swift
public func updateService(input: UpdateServiceInput, completion: @escaping (ClientRuntime.SdkResult<UpdateServiceOutputResponse, UpdateServiceOutputError>) -> Void)
```

  - Update the TTL setting for existing DnsRecords configurations

  - Add, update, or delete HealthCheckConfig for a specified service You can't add, update, or delete a HealthCheckCustomConfig configuration.

For public and private DNS namespaces, note the following:

  - If you omit any existing DnsRecords or HealthCheckConfig configurations from an UpdateService request, the configurations are deleted from the service.

  - If you omit an existing HealthCheckCustomConfig configuration from an UpdateService request, the configuration isn't deleted from the service.

When you update settings for a service, Cloud Map also updates the corresponding settings in all the records and health checks that were created by using the specified service.
