# EmrContainersClient

``` swift
public class EmrContainersClient 
```

## Inheritance

[`EmrContainersClientProtocol`](/aws-sdk-swift/reference/0.x/AWSEMRcontainers/EmrContainersClientProtocol)

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

### `cancelJobRun(input:completion:)`

Cancels a job run. A job run is a unit of work, such as a Spark jar, PySpark script, or SparkSQL query, that you submit to Amazon EMR on EKS.

``` swift
public func cancelJobRun(input: CancelJobRunInput, completion: @escaping (ClientRuntime.SdkResult<CancelJobRunOutputResponse, CancelJobRunOutputError>) -> Void)
```

### `createManagedEndpoint(input:completion:)`

Creates a managed endpoint. A managed endpoint is a gateway that connects EMR Studio to Amazon EMR on EKS so that EMR Studio can communicate with your virtual cluster.

``` swift
public func createManagedEndpoint(input: CreateManagedEndpointInput, completion: @escaping (ClientRuntime.SdkResult<CreateManagedEndpointOutputResponse, CreateManagedEndpointOutputError>) -> Void)
```

### `createVirtualCluster(input:completion:)`

Creates a virtual cluster. Virtual cluster is a managed entity on Amazon EMR on EKS. You can create, describe, list and delete virtual clusters. They do not consume any additional resource in your system. A single virtual cluster maps to a single Kubernetes namespace. Given this relationship, you can model virtual clusters the same way you model Kubernetes namespaces to meet your requirements.

``` swift
public func createVirtualCluster(input: CreateVirtualClusterInput, completion: @escaping (ClientRuntime.SdkResult<CreateVirtualClusterOutputResponse, CreateVirtualClusterOutputError>) -> Void)
```

### `deleteManagedEndpoint(input:completion:)`

Deletes a managed endpoint. A managed endpoint is a gateway that connects EMR Studio to Amazon EMR on EKS so that EMR Studio can communicate with your virtual cluster.

``` swift
public func deleteManagedEndpoint(input: DeleteManagedEndpointInput, completion: @escaping (ClientRuntime.SdkResult<DeleteManagedEndpointOutputResponse, DeleteManagedEndpointOutputError>) -> Void)
```

### `deleteVirtualCluster(input:completion:)`

Deletes a virtual cluster. Virtual cluster is a managed entity on Amazon EMR on EKS. You can create, describe, list and delete virtual clusters. They do not consume any additional resource in your system. A single virtual cluster maps to a single Kubernetes namespace. Given this relationship, you can model virtual clusters the same way you model Kubernetes namespaces to meet your requirements.

``` swift
public func deleteVirtualCluster(input: DeleteVirtualClusterInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVirtualClusterOutputResponse, DeleteVirtualClusterOutputError>) -> Void)
```

### `describeJobRun(input:completion:)`

Displays detailed information about a job run. A job run is a unit of work, such as a Spark jar, PySpark script, or SparkSQL query, that you submit to Amazon EMR on EKS.

``` swift
public func describeJobRun(input: DescribeJobRunInput, completion: @escaping (ClientRuntime.SdkResult<DescribeJobRunOutputResponse, DescribeJobRunOutputError>) -> Void)
```

### `describeManagedEndpoint(input:completion:)`

Displays detailed information about a managed endpoint. A managed endpoint is a gateway that connects EMR Studio to Amazon EMR on EKS so that EMR Studio can communicate with your virtual cluster.

``` swift
public func describeManagedEndpoint(input: DescribeManagedEndpointInput, completion: @escaping (ClientRuntime.SdkResult<DescribeManagedEndpointOutputResponse, DescribeManagedEndpointOutputError>) -> Void)
```

### `describeVirtualCluster(input:completion:)`

Displays detailed information about a specified virtual cluster. Virtual cluster is a managed entity on Amazon EMR on EKS. You can create, describe, list and delete virtual clusters. They do not consume any additional resource in your system. A single virtual cluster maps to a single Kubernetes namespace. Given this relationship, you can model virtual clusters the same way you model Kubernetes namespaces to meet your requirements.

``` swift
public func describeVirtualCluster(input: DescribeVirtualClusterInput, completion: @escaping (ClientRuntime.SdkResult<DescribeVirtualClusterOutputResponse, DescribeVirtualClusterOutputError>) -> Void)
```

### `listJobRuns(input:completion:)`

Lists job runs based on a set of parameters. A job run is a unit of work, such as a Spark jar, PySpark script, or SparkSQL query, that you submit to Amazon EMR on EKS.

``` swift
public func listJobRuns(input: ListJobRunsInput, completion: @escaping (ClientRuntime.SdkResult<ListJobRunsOutputResponse, ListJobRunsOutputError>) -> Void)
```

### `listManagedEndpoints(input:completion:)`

Lists managed endpoints based on a set of parameters. A managed endpoint is a gateway that connects EMR Studio to Amazon EMR on EKS so that EMR Studio can communicate with your virtual cluster.

``` swift
public func listManagedEndpoints(input: ListManagedEndpointsInput, completion: @escaping (ClientRuntime.SdkResult<ListManagedEndpointsOutputResponse, ListManagedEndpointsOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Lists the tags assigned to the resources.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `listVirtualClusters(input:completion:)`

Lists information about the specified virtual cluster. Virtual cluster is a managed entity on Amazon EMR on EKS. You can create, describe, list and delete virtual clusters. They do not consume any additional resource in your system. A single virtual cluster maps to a single Kubernetes namespace. Given this relationship, you can model virtual clusters the same way you model Kubernetes namespaces to meet your requirements.

``` swift
public func listVirtualClusters(input: ListVirtualClustersInput, completion: @escaping (ClientRuntime.SdkResult<ListVirtualClustersOutputResponse, ListVirtualClustersOutputError>) -> Void)
```

### `startJobRun(input:completion:)`

Starts a job run. A job run is a unit of work, such as a Spark jar, PySpark script, or SparkSQL query, that you submit to Amazon EMR on EKS.

``` swift
public func startJobRun(input: StartJobRunInput, completion: @escaping (ClientRuntime.SdkResult<StartJobRunOutputResponse, StartJobRunOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Assigns tags to resources. A tag is a label that you assign to an AWS resource. Each tag consists of a key and an optional value, both of which you define. Tags enable you to categorize your AWS resources by attributes such as purpose, owner, or environment. When you have many resources of the same type, you can quickly identify a specific resource based on the tags you've assigned to it. For example, you can define a set of tags for your Amazon EMR on EKS clusters to help you track each cluster's owner and stack level. We recommend that you devise a consistent set of tag keys for each resource type. You can then search and filter the resources based on the tags that you add.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes tags from resources.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```
