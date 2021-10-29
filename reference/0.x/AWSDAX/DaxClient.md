# DaxClient

``` swift
public class DaxClient 
```

## Inheritance

[`DaxClientProtocol`](/aws-sdk-swift/reference/0.x/AWSDAX/DaxClientProtocol)

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
public static let clientName = "DaxClient"
```

## Methods

### `createCluster(input:completion:)`

Creates a DAX cluster. All nodes in the cluster run the same DAX caching software.

``` swift
public func createCluster(input: CreateClusterInput, completion: @escaping (ClientRuntime.SdkResult<CreateClusterOutputResponse, CreateClusterOutputError>) -> Void)
```

### `createParameterGroup(input:completion:)`

Creates a new parameter group. A parameter group is a collection of parameters that you apply to all of the nodes in a DAX cluster.

``` swift
public func createParameterGroup(input: CreateParameterGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateParameterGroupOutputResponse, CreateParameterGroupOutputError>) -> Void)
```

### `createSubnetGroup(input:completion:)`

Creates a new subnet group.

``` swift
public func createSubnetGroup(input: CreateSubnetGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateSubnetGroupOutputResponse, CreateSubnetGroupOutputError>) -> Void)
```

### `decreaseReplicationFactor(input:completion:)`

Removes one or more nodes from a DAX cluster. You cannot use DecreaseReplicationFactor to remove the last node in a DAX cluster. If you need to do this, use DeleteCluster instead.

``` swift
public func decreaseReplicationFactor(input: DecreaseReplicationFactorInput, completion: @escaping (ClientRuntime.SdkResult<DecreaseReplicationFactorOutputResponse, DecreaseReplicationFactorOutputError>) -> Void)
```

### `deleteCluster(input:completion:)`

Deletes a previously provisioned DAX cluster. DeleteCluster deletes all associated nodes, node endpoints and the DAX cluster itself. When you receive a successful response from this action, DAX immediately begins deleting the cluster; you cannot cancel or revert this action.

``` swift
public func deleteCluster(input: DeleteClusterInput, completion: @escaping (ClientRuntime.SdkResult<DeleteClusterOutputResponse, DeleteClusterOutputError>) -> Void)
```

### `deleteParameterGroup(input:completion:)`

Deletes the specified parameter group. You cannot delete a parameter group if it is associated with any DAX clusters.

``` swift
public func deleteParameterGroup(input: DeleteParameterGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteParameterGroupOutputResponse, DeleteParameterGroupOutputError>) -> Void)
```

### `deleteSubnetGroup(input:completion:)`

Deletes a subnet group. You cannot delete a subnet group if it is associated with any DAX clusters.

``` swift
public func deleteSubnetGroup(input: DeleteSubnetGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSubnetGroupOutputResponse, DeleteSubnetGroupOutputError>) -> Void)
```

### `describeClusters(input:completion:)`

Returns information about all provisioned DAX clusters if no cluster identifier is specified, or about a specific DAX cluster if a cluster identifier is supplied. If the cluster is in the CREATING state, only cluster level information will be displayed until all of the nodes are successfully provisioned. If the cluster is in the DELETING state, only cluster level information will be displayed. If nodes are currently being added to the DAX cluster, node endpoint information and creation time for the additional nodes will not be displayed until they are completely provisioned. When the DAX cluster state is available, the cluster is ready for use. If nodes are currently being removed from the DAX cluster, no endpoint information for the removed nodes is displayed.

``` swift
public func describeClusters(input: DescribeClustersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeClustersOutputResponse, DescribeClustersOutputError>) -> Void)
```

### `describeDefaultParameters(input:completion:)`

Returns the default system parameter information for the DAX caching software.

``` swift
public func describeDefaultParameters(input: DescribeDefaultParametersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDefaultParametersOutputResponse, DescribeDefaultParametersOutputError>) -> Void)
```

### `describeEvents(input:completion:)`

Returns events related to DAX clusters and parameter groups. You can obtain events specific to a particular DAX cluster or parameter group by providing the name as a parameter. By default, only the events occurring within the last 24 hours are returned; however, you can retrieve up to 14 days' worth of events if necessary.

``` swift
public func describeEvents(input: DescribeEventsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEventsOutputResponse, DescribeEventsOutputError>) -> Void)
```

### `describeParameterGroups(input:completion:)`

Returns a list of parameter group descriptions. If a parameter group name is specified, the list will contain only the descriptions for that group.

``` swift
public func describeParameterGroups(input: DescribeParameterGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeParameterGroupsOutputResponse, DescribeParameterGroupsOutputError>) -> Void)
```

### `describeParameters(input:completion:)`

Returns the detailed parameter list for a particular parameter group.

``` swift
public func describeParameters(input: DescribeParametersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeParametersOutputResponse, DescribeParametersOutputError>) -> Void)
```

### `describeSubnetGroups(input:completion:)`

Returns a list of subnet group descriptions. If a subnet group name is specified, the list will contain only the description of that group.

``` swift
public func describeSubnetGroups(input: DescribeSubnetGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSubnetGroupsOutputResponse, DescribeSubnetGroupsOutputError>) -> Void)
```

### `increaseReplicationFactor(input:completion:)`

Adds one or more nodes to a DAX cluster.

``` swift
public func increaseReplicationFactor(input: IncreaseReplicationFactorInput, completion: @escaping (ClientRuntime.SdkResult<IncreaseReplicationFactorOutputResponse, IncreaseReplicationFactorOutputError>) -> Void)
```

### `listTags(input:completion:)`

List all of the tags for a DAX cluster. You can call ListTags up to 10 times per second, per account.

``` swift
public func listTags(input: ListTagsInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsOutputResponse, ListTagsOutputError>) -> Void)
```

### `rebootNode(input:completion:)`

Reboots a single node of a DAX cluster. The reboot action takes place as soon as possible. During the reboot, the node status is set to REBOOTING. RebootNode restarts the DAX engine process and does not remove the contents of the cache.

``` swift
public func rebootNode(input: RebootNodeInput, completion: @escaping (ClientRuntime.SdkResult<RebootNodeOutputResponse, RebootNodeOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Associates a set of tags with a DAX resource. You can call TagResource up to 5 times per second, per account.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes the association of tags from a DAX resource. You can call UntagResource up to 5 times per second, per account.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateCluster(input:completion:)`

Modifies the settings for a DAX cluster. You can use this action to change one or more cluster configuration parameters by specifying the parameters and the new values.

``` swift
public func updateCluster(input: UpdateClusterInput, completion: @escaping (ClientRuntime.SdkResult<UpdateClusterOutputResponse, UpdateClusterOutputError>) -> Void)
```

### `updateParameterGroup(input:completion:)`

Modifies the parameters of a parameter group. You can modify up to 20 parameters in a single request by submitting a list parameter name and value pairs.

``` swift
public func updateParameterGroup(input: UpdateParameterGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateParameterGroupOutputResponse, UpdateParameterGroupOutputError>) -> Void)
```

### `updateSubnetGroup(input:completion:)`

Modifies an existing subnet group.

``` swift
public func updateSubnetGroup(input: UpdateSubnetGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSubnetGroupOutputResponse, UpdateSubnetGroupOutputError>) -> Void)
```
