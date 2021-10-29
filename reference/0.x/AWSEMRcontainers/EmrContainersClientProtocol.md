# EmrContainersClientProtocol

Amazon EMR on EKS provides a deployment option for Amazon EMR that allows you to run open-source big data frameworks on Amazon Elastic Kubernetes Service (Amazon EKS). With this deployment option, you can focus on running analytics workloads while Amazon EMR on EKS builds, configures, and manages containers for open-source applications. For more information about Amazon EMR on EKS concepts and tasks, see [What is Amazon EMR on EKS](https://docs.aws.amazon.com/emr/latest/EMR-on-EKS-DevelopmentGuide/emr-eks.html). Amazon EMR containers is the API name for Amazon EMR on EKS. The emr-containers prefix is used in the following scenarios:

``` swift
public protocol EmrContainersClientProtocol 
```

  - It is the prefix in the CLI commands for Amazon EMR on EKS. For example, aws emr-containers start-job-run.

  - It is the prefix before IAM policy actions for Amazon EMR on EKS. For example, "Action": \[ "emr-containers:StartJobRun"\]. For more information, see [Policy actions for Amazon EMR on EKS](https://docs.aws.amazon.com/emr/latest/EMR-on-EKS-DevelopmentGuide/security_iam_service-with-iam.html#security_iam_service-with-iam-id-based-policies-actions).

  - It is the prefix used in Amazon EMR on EKS service endpoints. For example, emr-containers.us-east-2.amazonaws.com. For more information, see [Amazon EMR on EKS Service Endpoints](https://docs.aws.amazon.com/emr/latest/EMR-on-EKS-DevelopmentGuide/service-quotas.html#service-endpoints).

## Requirements

### cancelJobRun(input:completion:)

Cancels a job run. A job run is a unit of work, such as a Spark jar, PySpark script, or SparkSQL query, that you submit to Amazon EMR on EKS.

``` swift
func cancelJobRun(input: CancelJobRunInput, completion: @escaping (ClientRuntime.SdkResult<CancelJobRunOutputResponse, CancelJobRunOutputError>) -> Void)
```

### createManagedEndpoint(input:completion:)

Creates a managed endpoint. A managed endpoint is a gateway that connects EMR Studio to Amazon EMR on EKS so that EMR Studio can communicate with your virtual cluster.

``` swift
func createManagedEndpoint(input: CreateManagedEndpointInput, completion: @escaping (ClientRuntime.SdkResult<CreateManagedEndpointOutputResponse, CreateManagedEndpointOutputError>) -> Void)
```

### createVirtualCluster(input:completion:)

Creates a virtual cluster. Virtual cluster is a managed entity on Amazon EMR on EKS. You can create, describe, list and delete virtual clusters. They do not consume any additional resource in your system. A single virtual cluster maps to a single Kubernetes namespace. Given this relationship, you can model virtual clusters the same way you model Kubernetes namespaces to meet your requirements.

``` swift
func createVirtualCluster(input: CreateVirtualClusterInput, completion: @escaping (ClientRuntime.SdkResult<CreateVirtualClusterOutputResponse, CreateVirtualClusterOutputError>) -> Void)
```

### deleteManagedEndpoint(input:completion:)

Deletes a managed endpoint. A managed endpoint is a gateway that connects EMR Studio to Amazon EMR on EKS so that EMR Studio can communicate with your virtual cluster.

``` swift
func deleteManagedEndpoint(input: DeleteManagedEndpointInput, completion: @escaping (ClientRuntime.SdkResult<DeleteManagedEndpointOutputResponse, DeleteManagedEndpointOutputError>) -> Void)
```

### deleteVirtualCluster(input:completion:)

Deletes a virtual cluster. Virtual cluster is a managed entity on Amazon EMR on EKS. You can create, describe, list and delete virtual clusters. They do not consume any additional resource in your system. A single virtual cluster maps to a single Kubernetes namespace. Given this relationship, you can model virtual clusters the same way you model Kubernetes namespaces to meet your requirements.

``` swift
func deleteVirtualCluster(input: DeleteVirtualClusterInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVirtualClusterOutputResponse, DeleteVirtualClusterOutputError>) -> Void)
```

### describeJobRun(input:completion:)

Displays detailed information about a job run. A job run is a unit of work, such as a Spark jar, PySpark script, or SparkSQL query, that you submit to Amazon EMR on EKS.

``` swift
func describeJobRun(input: DescribeJobRunInput, completion: @escaping (ClientRuntime.SdkResult<DescribeJobRunOutputResponse, DescribeJobRunOutputError>) -> Void)
```

### describeManagedEndpoint(input:completion:)

Displays detailed information about a managed endpoint. A managed endpoint is a gateway that connects EMR Studio to Amazon EMR on EKS so that EMR Studio can communicate with your virtual cluster.

``` swift
func describeManagedEndpoint(input: DescribeManagedEndpointInput, completion: @escaping (ClientRuntime.SdkResult<DescribeManagedEndpointOutputResponse, DescribeManagedEndpointOutputError>) -> Void)
```

### describeVirtualCluster(input:completion:)

Displays detailed information about a specified virtual cluster. Virtual cluster is a managed entity on Amazon EMR on EKS. You can create, describe, list and delete virtual clusters. They do not consume any additional resource in your system. A single virtual cluster maps to a single Kubernetes namespace. Given this relationship, you can model virtual clusters the same way you model Kubernetes namespaces to meet your requirements.

``` swift
func describeVirtualCluster(input: DescribeVirtualClusterInput, completion: @escaping (ClientRuntime.SdkResult<DescribeVirtualClusterOutputResponse, DescribeVirtualClusterOutputError>) -> Void)
```

### listJobRuns(input:completion:)

Lists job runs based on a set of parameters. A job run is a unit of work, such as a Spark jar, PySpark script, or SparkSQL query, that you submit to Amazon EMR on EKS.

``` swift
func listJobRuns(input: ListJobRunsInput, completion: @escaping (ClientRuntime.SdkResult<ListJobRunsOutputResponse, ListJobRunsOutputError>) -> Void)
```

### listManagedEndpoints(input:completion:)

Lists managed endpoints based on a set of parameters. A managed endpoint is a gateway that connects EMR Studio to Amazon EMR on EKS so that EMR Studio can communicate with your virtual cluster.

``` swift
func listManagedEndpoints(input: ListManagedEndpointsInput, completion: @escaping (ClientRuntime.SdkResult<ListManagedEndpointsOutputResponse, ListManagedEndpointsOutputError>) -> Void)
```

### listTagsForResource(input:completion:)

Lists the tags assigned to the resources.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### listVirtualClusters(input:completion:)

Lists information about the specified virtual cluster. Virtual cluster is a managed entity on Amazon EMR on EKS. You can create, describe, list and delete virtual clusters. They do not consume any additional resource in your system. A single virtual cluster maps to a single Kubernetes namespace. Given this relationship, you can model virtual clusters the same way you model Kubernetes namespaces to meet your requirements.

``` swift
func listVirtualClusters(input: ListVirtualClustersInput, completion: @escaping (ClientRuntime.SdkResult<ListVirtualClustersOutputResponse, ListVirtualClustersOutputError>) -> Void)
```

### startJobRun(input:completion:)

Starts a job run. A job run is a unit of work, such as a Spark jar, PySpark script, or SparkSQL query, that you submit to Amazon EMR on EKS.

``` swift
func startJobRun(input: StartJobRunInput, completion: @escaping (ClientRuntime.SdkResult<StartJobRunOutputResponse, StartJobRunOutputError>) -> Void)
```

### tagResource(input:completion:)

Assigns tags to resources. A tag is a label that you assign to an AWS resource. Each tag consists of a key and an optional value, both of which you define. Tags enable you to categorize your AWS resources by attributes such as purpose, owner, or environment. When you have many resources of the same type, you can quickly identify a specific resource based on the tags you've assigned to it. For example, you can define a set of tags for your Amazon EMR on EKS clusters to help you track each cluster's owner and stack level. We recommend that you devise a consistent set of tag keys for each resource type. You can then search and filter the resources based on the tags that you add.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:completion:)

Removes tags from resources.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```
