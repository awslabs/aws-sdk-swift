# KafkaClient

``` swift
public class KafkaClient 
```

## Inheritance

[`KafkaClientProtocol`](/aws-sdk-swift/reference/0.x/AWSKafka/KafkaClientProtocol)

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

### `batchAssociateScramSecret(input:completion:)`

Associates one or more Scram Secrets with an Amazon MSK cluster.

``` swift
public func batchAssociateScramSecret(input: BatchAssociateScramSecretInput, completion: @escaping (ClientRuntime.SdkResult<BatchAssociateScramSecretOutputResponse, BatchAssociateScramSecretOutputError>) -> Void)
```

### `batchDisassociateScramSecret(input:completion:)`

Disassociates one or more Scram Secrets from an Amazon MSK cluster.

``` swift
public func batchDisassociateScramSecret(input: BatchDisassociateScramSecretInput, completion: @escaping (ClientRuntime.SdkResult<BatchDisassociateScramSecretOutputResponse, BatchDisassociateScramSecretOutputError>) -> Void)
```

### `createCluster(input:completion:)`

Creates a new MSK cluster.

``` swift
public func createCluster(input: CreateClusterInput, completion: @escaping (ClientRuntime.SdkResult<CreateClusterOutputResponse, CreateClusterOutputError>) -> Void)
```

### `createConfiguration(input:completion:)`

Creates a new MSK configuration.

``` swift
public func createConfiguration(input: CreateConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<CreateConfigurationOutputResponse, CreateConfigurationOutputError>) -> Void)
```

### `deleteCluster(input:completion:)`

Deletes the MSK cluster specified by the Amazon Resource Name (ARN) in the request.

``` swift
public func deleteCluster(input: DeleteClusterInput, completion: @escaping (ClientRuntime.SdkResult<DeleteClusterOutputResponse, DeleteClusterOutputError>) -> Void)
```

### `deleteConfiguration(input:completion:)`

Deletes an MSK Configuration.

``` swift
public func deleteConfiguration(input: DeleteConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteConfigurationOutputResponse, DeleteConfigurationOutputError>) -> Void)
```

### `describeCluster(input:completion:)`

Returns a description of the MSK cluster whose Amazon Resource Name (ARN) is specified in the request.

``` swift
public func describeCluster(input: DescribeClusterInput, completion: @escaping (ClientRuntime.SdkResult<DescribeClusterOutputResponse, DescribeClusterOutputError>) -> Void)
```

### `describeClusterOperation(input:completion:)`

Returns a description of the cluster operation specified by the ARN.

``` swift
public func describeClusterOperation(input: DescribeClusterOperationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeClusterOperationOutputResponse, DescribeClusterOperationOutputError>) -> Void)
```

### `describeConfiguration(input:completion:)`

Returns a description of this MSK configuration.

``` swift
public func describeConfiguration(input: DescribeConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeConfigurationOutputResponse, DescribeConfigurationOutputError>) -> Void)
```

### `describeConfigurationRevision(input:completion:)`

Returns a description of this revision of the configuration.

``` swift
public func describeConfigurationRevision(input: DescribeConfigurationRevisionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeConfigurationRevisionOutputResponse, DescribeConfigurationRevisionOutputError>) -> Void)
```

### `getBootstrapBrokers(input:completion:)`

A list of brokers that a client application can use to bootstrap.

``` swift
public func getBootstrapBrokers(input: GetBootstrapBrokersInput, completion: @escaping (ClientRuntime.SdkResult<GetBootstrapBrokersOutputResponse, GetBootstrapBrokersOutputError>) -> Void)
```

### `getCompatibleKafkaVersions(input:completion:)`

Gets the Apache Kafka versions to which you can update the MSK cluster.

``` swift
public func getCompatibleKafkaVersions(input: GetCompatibleKafkaVersionsInput, completion: @escaping (ClientRuntime.SdkResult<GetCompatibleKafkaVersionsOutputResponse, GetCompatibleKafkaVersionsOutputError>) -> Void)
```

### `listClusterOperations(input:completion:)`

Returns a list of all the operations that have been performed on the specified MSK cluster.

``` swift
public func listClusterOperations(input: ListClusterOperationsInput, completion: @escaping (ClientRuntime.SdkResult<ListClusterOperationsOutputResponse, ListClusterOperationsOutputError>) -> Void)
```

### `listClusters(input:completion:)`

Returns a list of all the MSK clusters in the current Region.

``` swift
public func listClusters(input: ListClustersInput, completion: @escaping (ClientRuntime.SdkResult<ListClustersOutputResponse, ListClustersOutputError>) -> Void)
```

### `listConfigurationRevisions(input:completion:)`

Returns a list of all the MSK configurations in this Region.

``` swift
public func listConfigurationRevisions(input: ListConfigurationRevisionsInput, completion: @escaping (ClientRuntime.SdkResult<ListConfigurationRevisionsOutputResponse, ListConfigurationRevisionsOutputError>) -> Void)
```

### `listConfigurations(input:completion:)`

Returns a list of all the MSK configurations in this Region.

``` swift
public func listConfigurations(input: ListConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<ListConfigurationsOutputResponse, ListConfigurationsOutputError>) -> Void)
```

### `listKafkaVersions(input:completion:)`

Returns a list of Kafka versions.

``` swift
public func listKafkaVersions(input: ListKafkaVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListKafkaVersionsOutputResponse, ListKafkaVersionsOutputError>) -> Void)
```

### `listNodes(input:completion:)`

Returns a list of the broker nodes in the cluster.

``` swift
public func listNodes(input: ListNodesInput, completion: @escaping (ClientRuntime.SdkResult<ListNodesOutputResponse, ListNodesOutputError>) -> Void)
```

### `listScramSecrets(input:completion:)`

Returns a list of the Scram Secrets associated with an Amazon MSK cluster.

``` swift
public func listScramSecrets(input: ListScramSecretsInput, completion: @escaping (ClientRuntime.SdkResult<ListScramSecretsOutputResponse, ListScramSecretsOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Returns a list of the tags associated with the specified resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `rebootBroker(input:completion:)`

Reboots brokers.

``` swift
public func rebootBroker(input: RebootBrokerInput, completion: @escaping (ClientRuntime.SdkResult<RebootBrokerOutputResponse, RebootBrokerOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Adds tags to the specified MSK resource.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes the tags associated with the keys that are provided in the query.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateBrokerCount(input:completion:)`

Updates the number of broker nodes in the cluster.

``` swift
public func updateBrokerCount(input: UpdateBrokerCountInput, completion: @escaping (ClientRuntime.SdkResult<UpdateBrokerCountOutputResponse, UpdateBrokerCountOutputError>) -> Void)
```

### `updateBrokerStorage(input:completion:)`

Updates the EBS storage associated with MSK brokers.

``` swift
public func updateBrokerStorage(input: UpdateBrokerStorageInput, completion: @escaping (ClientRuntime.SdkResult<UpdateBrokerStorageOutputResponse, UpdateBrokerStorageOutputError>) -> Void)
```

### `updateBrokerType(input:completion:)`

Updates EC2 instance type.

``` swift
public func updateBrokerType(input: UpdateBrokerTypeInput, completion: @escaping (ClientRuntime.SdkResult<UpdateBrokerTypeOutputResponse, UpdateBrokerTypeOutputError>) -> Void)
```

### `updateClusterConfiguration(input:completion:)`

Updates the cluster with the configuration that is specified in the request body.

``` swift
public func updateClusterConfiguration(input: UpdateClusterConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateClusterConfigurationOutputResponse, UpdateClusterConfigurationOutputError>) -> Void)
```

### `updateClusterKafkaVersion(input:completion:)`

Updates the Apache Kafka version for the cluster.

``` swift
public func updateClusterKafkaVersion(input: UpdateClusterKafkaVersionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateClusterKafkaVersionOutputResponse, UpdateClusterKafkaVersionOutputError>) -> Void)
```

### `updateConfiguration(input:completion:)`

Updates an MSK configuration.

``` swift
public func updateConfiguration(input: UpdateConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateConfigurationOutputResponse, UpdateConfigurationOutputError>) -> Void)
```

### `updateMonitoring(input:completion:)`

Updates the monitoring settings for the cluster. You can use this operation to specify which Apache Kafka metrics you want Amazon MSK to send to Amazon CloudWatch. You can also specify settings for open monitoring with Prometheus.

``` swift
public func updateMonitoring(input: UpdateMonitoringInput, completion: @escaping (ClientRuntime.SdkResult<UpdateMonitoringOutputResponse, UpdateMonitoringOutputError>) -> Void)
```

### `updateSecurity(input:completion:)`

Updates the security settings for the cluster. You can use this operation to specify encryption and authentication on existing clusters.

``` swift
public func updateSecurity(input: UpdateSecurityInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSecurityOutputResponse, UpdateSecurityOutputError>) -> Void)
```
