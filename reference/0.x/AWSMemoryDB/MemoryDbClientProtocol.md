# MemoryDbClientProtocol

MemoryDB for Redis is a fully managed, Redis-compatible, in-memory database that delivers ultra-fast performance and Multi-AZ durability for modern applications built using microservices architectures.

``` swift
public protocol MemoryDbClientProtocol 
```

``` 
   MemoryDB stores the entire database in-memory, enabling low latency and high throughput data access. It is compatible with Redis, a popular open source data store, enabling you to leverage Redis’ flexible and friendly data structures, APIs, and commands.
```

## Requirements

### batchUpdateCluster(input:​completion:​)

Apply the service update to a list of clusters supplied. For more information on service updates and applying them, see <a href="https:​//docs.aws.amazon.com/MemoryDB/latest/devguide/managing-updates.html#applying-updates">Applying the service updates.

``` swift
func batchUpdateCluster(input: BatchUpdateClusterInput, completion: @escaping (ClientRuntime.SdkResult<BatchUpdateClusterOutputResponse, BatchUpdateClusterOutputError>) -> Void)
```

### copySnapshot(input:​completion:​)

Makes a copy of an existing snapshot.

``` swift
func copySnapshot(input: CopySnapshotInput, completion: @escaping (ClientRuntime.SdkResult<CopySnapshotOutputResponse, CopySnapshotOutputError>) -> Void)
```

### createACL(input:​completion:​)

Creates an Access Control List. For more information, see <a href="https:​//docs.aws.amazon.com/MemoryDB/latest/devguide/clusters.acls.html">Authenticating users with Access Contol Lists (ACLs).

``` swift
func createACL(input: CreateACLInput, completion: @escaping (ClientRuntime.SdkResult<CreateACLOutputResponse, CreateACLOutputError>) -> Void)
```

### createCluster(input:​completion:​)

Creates a cluster. All nodes in the cluster run the same protocol-compliant engine software.

``` swift
func createCluster(input: CreateClusterInput, completion: @escaping (ClientRuntime.SdkResult<CreateClusterOutputResponse, CreateClusterOutputError>) -> Void)
```

### createParameterGroup(input:​completion:​)

Creates a new MemoryDB parameter group. A parameter group is a collection of parameters and their values that are applied to all of the nodes in any cluster. For
more information, see <a href="https:​//docs.aws.amazon.com/MemoryDB/latest/devguide/parametergroups.html">Configuring engine parameters using parameter groups.

``` swift
func createParameterGroup(input: CreateParameterGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateParameterGroupOutputResponse, CreateParameterGroupOutputError>) -> Void)
```

### createSnapshot(input:​completion:​)

Creates a copy of an entire cluster at a specific moment in time.

``` swift
func createSnapshot(input: CreateSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<CreateSnapshotOutputResponse, CreateSnapshotOutputError>) -> Void)
```

### createSubnetGroup(input:​completion:​)

Creates a subnet group. A subnet group is a collection of subnets (typically private) that you can designate for your clusters running in an Amazon Virtual Private Cloud (VPC) environment.

``` swift
func createSubnetGroup(input: CreateSubnetGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateSubnetGroupOutputResponse, CreateSubnetGroupOutputError>) -> Void)
```

``` 
     When you create a cluster in an Amazon VPC, you must specify a subnet group. MemoryDB uses that subnet group to choose a subnet and IP addresses within that subnet to associate with your nodes.
     For more information, see <a href="https://docs.aws.amazon.com/MemoryDB/latest/devguide/subnetgroups.html">Subnets and subnet groups.
```

### createUser(input:​completion:​)

Creates a MemoryDB user. For more information, see <a href="https:​//docs.aws.amazon.com/MemoryDB/latest/devguide/clusters.acls.html">Authenticating users with Access Contol Lists (ACLs).

``` swift
func createUser(input: CreateUserInput, completion: @escaping (ClientRuntime.SdkResult<CreateUserOutputResponse, CreateUserOutputError>) -> Void)
```

### deleteACL(input:​completion:​)

Deletes an Access Control List. The ACL must first be disassociated from the cluster before it can be deleted. For more information, see <a href="https:​//docs.aws.amazon.com/MemoryDB/latest/devguide/clusters.acls.html">Authenticating users with Access Contol Lists (ACLs).

``` swift
func deleteACL(input: DeleteACLInput, completion: @escaping (ClientRuntime.SdkResult<DeleteACLOutputResponse, DeleteACLOutputError>) -> Void)
```

### deleteCluster(input:​completion:​)

Deletes a cluster. It also deletes all associated nodes and node endpoints

``` swift
func deleteCluster(input: DeleteClusterInput, completion: @escaping (ClientRuntime.SdkResult<DeleteClusterOutputResponse, DeleteClusterOutputError>) -> Void)
```

### deleteParameterGroup(input:​completion:​)

Deletes the specified parameter group. You cannot delete a parameter group if it is associated with any clusters.
You cannot delete the default parameter groups in your account.

``` swift
func deleteParameterGroup(input: DeleteParameterGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteParameterGroupOutputResponse, DeleteParameterGroupOutputError>) -> Void)
```

### deleteSnapshot(input:​completion:​)

Deletes an existing snapshot. When you receive a successful response from this operation, MemoryDB immediately begins deleting the snapshot; you cannot cancel or revert this operation.

``` swift
func deleteSnapshot(input: DeleteSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSnapshotOutputResponse, DeleteSnapshotOutputError>) -> Void)
```

### deleteSubnetGroup(input:​completion:​)

Deletes a subnet group. You cannot delete a default subnet group or one that is associated with any clusters.

``` swift
func deleteSubnetGroup(input: DeleteSubnetGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSubnetGroupOutputResponse, DeleteSubnetGroupOutputError>) -> Void)
```

### deleteUser(input:​completion:​)

Deletes a user. The user will be removed from all ACLs and in turn removed from all clusters.

``` swift
func deleteUser(input: DeleteUserInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUserOutputResponse, DeleteUserOutputError>) -> Void)
```

### describeACLs(input:​completion:​)

Returns a list of ACLs

``` swift
func describeACLs(input: DescribeACLsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeACLsOutputResponse, DescribeACLsOutputError>) -> Void)
```

### describeClusters(input:​completion:​)

Returns information about all provisioned clusters if no cluster identifier is specified, or about a specific cluster if a cluster name is supplied.

``` swift
func describeClusters(input: DescribeClustersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeClustersOutputResponse, DescribeClustersOutputError>) -> Void)
```

### describeEngineVersions(input:​completion:​)

Returns a list of the available Redis engine versions.

``` swift
func describeEngineVersions(input: DescribeEngineVersionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEngineVersionsOutputResponse, DescribeEngineVersionsOutputError>) -> Void)
```

### describeEvents(input:​completion:​)

Returns events related to clusters, security groups, and parameter groups. You can obtain events specific to a particular cluster, security group, or parameter group by providing the name as a parameter.

``` swift
func describeEvents(input: DescribeEventsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEventsOutputResponse, DescribeEventsOutputError>) -> Void)
```

``` 
     By default, only the events occurring within the last hour are returned; however, you can retrieve up to 14 days' worth of events if necessary.
```

### describeParameterGroups(input:​completion:​)

Returns a list of parameter group descriptions. If a parameter group name is specified, the list contains only the descriptions for that group.

``` swift
func describeParameterGroups(input: DescribeParameterGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeParameterGroupsOutputResponse, DescribeParameterGroupsOutputError>) -> Void)
```

### describeParameters(input:​completion:​)

Returns the detailed parameter list for a particular parameter group.

``` swift
func describeParameters(input: DescribeParametersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeParametersOutputResponse, DescribeParametersOutputError>) -> Void)
```

### describeServiceUpdates(input:​completion:​)

Returns details of the service updates

``` swift
func describeServiceUpdates(input: DescribeServiceUpdatesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeServiceUpdatesOutputResponse, DescribeServiceUpdatesOutputError>) -> Void)
```

### describeSnapshots(input:​completion:​)

Returns information about cluster snapshots. By default, DescribeSnapshots lists all of your snapshots; it can optionally describe a single snapshot,
or just the snapshots associated with a particular cluster.

``` swift
func describeSnapshots(input: DescribeSnapshotsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSnapshotsOutputResponse, DescribeSnapshotsOutputError>) -> Void)
```

### describeSubnetGroups(input:​completion:​)

Returns a list of subnet group descriptions. If a subnet group name is specified, the list contains only the description of that group.

``` swift
func describeSubnetGroups(input: DescribeSubnetGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSubnetGroupsOutputResponse, DescribeSubnetGroupsOutputError>) -> Void)
```

### describeUsers(input:​completion:​)

Returns a list of users.

``` swift
func describeUsers(input: DescribeUsersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeUsersOutputResponse, DescribeUsersOutputError>) -> Void)
```

### failoverShard(input:​completion:​)

Used to failover a shard

``` swift
func failoverShard(input: FailoverShardInput, completion: @escaping (ClientRuntime.SdkResult<FailoverShardOutputResponse, FailoverShardOutputError>) -> Void)
```

### listAllowedNodeTypeUpdates(input:​completion:​)

Lists all available node types that you can scale to from your cluster's current node type.

``` swift
func listAllowedNodeTypeUpdates(input: ListAllowedNodeTypeUpdatesInput, completion: @escaping (ClientRuntime.SdkResult<ListAllowedNodeTypeUpdatesOutputResponse, ListAllowedNodeTypeUpdatesOutputError>) -> Void)
```

``` 
     When you use the UpdateCluster operation to scale your cluster, the value of the NodeType parameter must be one of the node types returned by this operation.
```

### listTags(input:​completion:​)

Lists all tags currently on a named resource.

``` swift
func listTags(input: ListTagsInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsOutputResponse, ListTagsOutputError>) -> Void)
```

``` 
     A tag is a key-value pair where the key and value are case-sensitive. You can use tags to categorize and track your MemoryDB resources.
     For more information, see <a href="https://docs.aws.amazon.com/MemoryDB/latest/devguide/Tagging-Resources.html">Tagging your MemoryDB resources
```

### resetParameterGroup(input:​completion:​)

Modifies the parameters of a parameter group to the engine or system default value. You can reset specific parameters by submitting a list of parameter names. To reset the entire parameter group, specify the AllParameters and ParameterGroupName parameters.

``` swift
func resetParameterGroup(input: ResetParameterGroupInput, completion: @escaping (ClientRuntime.SdkResult<ResetParameterGroupOutputResponse, ResetParameterGroupOutputError>) -> Void)
```

### tagResource(input:​completion:​)

A tag is a key-value pair where the key and value are case-sensitive. You can use tags to categorize and track all your MemoryDB resources.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

``` 
     When you add or remove tags on clusters, those actions will be replicated to all nodes in the cluster. For more information, see

     <a href="https://docs.aws.amazon.com/MemoryDB/latest/devguide/iam.resourcelevelpermissions.html">Resource-level permissions.

     For example, you can use cost-allocation tags to your MemoryDB resources, Amazon generates a cost allocation report as a comma-separated value
      (CSV) file with your usage and costs aggregated by your tags. You can apply tags that represent business categories
      (such as cost centers, application names, or owners) to organize your costs across multiple services.

     For more information, see <a href="https://docs.aws.amazon.com/MemoryDB/latest/devguide/tagging.html">Using Cost Allocation Tags.
```

### untagResource(input:​completion:​)

Use this operation to remove tags on a resource

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateACL(input:​completion:​)

Changes the list of users that belong to the Access Control List.

``` swift
func updateACL(input: UpdateACLInput, completion: @escaping (ClientRuntime.SdkResult<UpdateACLOutputResponse, UpdateACLOutputError>) -> Void)
```

### updateCluster(input:​completion:​)

Modifies the settings for a cluster. You can use this operation to change one or more cluster configuration settings by specifying the settings and the new values.

``` swift
func updateCluster(input: UpdateClusterInput, completion: @escaping (ClientRuntime.SdkResult<UpdateClusterOutputResponse, UpdateClusterOutputError>) -> Void)
```

### updateParameterGroup(input:​completion:​)

Updates the parameters of a parameter group. You can modify up to 20 parameters in a single request by submitting a list parameter name and value pairs.

``` swift
func updateParameterGroup(input: UpdateParameterGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateParameterGroupOutputResponse, UpdateParameterGroupOutputError>) -> Void)
```

### updateSubnetGroup(input:​completion:​)

Updates a subnet group. For more information, see <a href="https:​//docs.aws.amazon.com/MemoryDB/latest/devguide/ubnetGroups.Modifying.html">Updating a subnet group

``` swift
func updateSubnetGroup(input: UpdateSubnetGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSubnetGroupOutputResponse, UpdateSubnetGroupOutputError>) -> Void)
```

### updateUser(input:​completion:​)

Changes user password(s) and/or access string.

``` swift
func updateUser(input: UpdateUserInput, completion: @escaping (ClientRuntime.SdkResult<UpdateUserOutputResponse, UpdateUserOutputError>) -> Void)
```
