# DocDbClient

``` swift
public class DocDbClient 
```

## Inheritance

[`DocDbClientProtocol`](/aws-sdk-swift/reference/0.x/AWSDocDB/DocDbClientProtocol)

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
public static let clientName = "DocDbClient"
```

## Methods

### `addSourceIdentifierToSubscription(input:completion:)`

Adds a source identifier to an existing event notification subscription.

``` swift
public func addSourceIdentifierToSubscription(input: AddSourceIdentifierToSubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<AddSourceIdentifierToSubscriptionOutputResponse, AddSourceIdentifierToSubscriptionOutputError>) -> Void)
```

### `addTagsToResource(input:completion:)`

Adds metadata tags to an Amazon DocumentDB resource. You can use these tags with cost allocation reporting to track costs that are associated with Amazon DocumentDB resources or in a Condition statement in an Identity and Access Management (IAM) policy for Amazon DocumentDB.

``` swift
public func addTagsToResource(input: AddTagsToResourceInput, completion: @escaping (ClientRuntime.SdkResult<AddTagsToResourceOutputResponse, AddTagsToResourceOutputError>) -> Void)
```

### `applyPendingMaintenanceAction(input:completion:)`

Applies a pending maintenance action to a resource (for example, to an Amazon DocumentDB instance).

``` swift
public func applyPendingMaintenanceAction(input: ApplyPendingMaintenanceActionInput, completion: @escaping (ClientRuntime.SdkResult<ApplyPendingMaintenanceActionOutputResponse, ApplyPendingMaintenanceActionOutputError>) -> Void)
```

### `copyDBClusterParameterGroup(input:completion:)`

Copies the specified cluster parameter group.

``` swift
public func copyDBClusterParameterGroup(input: CopyDBClusterParameterGroupInput, completion: @escaping (ClientRuntime.SdkResult<CopyDBClusterParameterGroupOutputResponse, CopyDBClusterParameterGroupOutputError>) -> Void)
```

### `copyDBClusterSnapshot(input:completion:)`

Copies a snapshot of a cluster. To copy a cluster snapshot from a shared manual cluster snapshot, SourceDBClusterSnapshotIdentifier must be the Amazon Resource Name (ARN) of the shared cluster snapshot. You can only copy a shared DB cluster snapshot, whether encrypted or not, in the same Region. To cancel the copy operation after it is in progress, delete the target cluster snapshot identified by TargetDBClusterSnapshotIdentifier while that cluster snapshot is in the copying status.

``` swift
public func copyDBClusterSnapshot(input: CopyDBClusterSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<CopyDBClusterSnapshotOutputResponse, CopyDBClusterSnapshotOutputError>) -> Void)
```

### `createDBCluster(input:completion:)`

Creates a new Amazon DocumentDB cluster.

``` swift
public func createDBCluster(input: CreateDBClusterInput, completion: @escaping (ClientRuntime.SdkResult<CreateDBClusterOutputResponse, CreateDBClusterOutputError>) -> Void)
```

### `createDBClusterParameterGroup(input:completion:)`

Creates a new cluster parameter group. Parameters in a cluster parameter group apply to all of the instances in a cluster. A cluster parameter group is initially created with the default parameters for the database engine used by instances in the cluster. In Amazon DocumentDB, you cannot make modifications directly to the default.docdb3.6 cluster parameter group. If your Amazon DocumentDB cluster is using the default cluster parameter group and you want to modify a value in it, you must first [ create a new parameter group](https://docs.aws.amazon.com/documentdb/latest/developerguide/cluster_parameter_group-create.html) or [ copy an existing parameter group](https://docs.aws.amazon.com/documentdb/latest/developerguide/cluster_parameter_group-copy.html), modify it, and then apply the modified parameter group to your cluster. For the new cluster parameter group and associated settings to take effect, you must then reboot the instances in the cluster without failover. For more information, see [ Modifying Amazon DocumentDB Cluster Parameter Groups](https://docs.aws.amazon.com/documentdb/latest/developerguide/cluster_parameter_group-modify.html).

``` swift
public func createDBClusterParameterGroup(input: CreateDBClusterParameterGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateDBClusterParameterGroupOutputResponse, CreateDBClusterParameterGroupOutputError>) -> Void)
```

### `createDBClusterSnapshot(input:completion:)`

Creates a snapshot of a cluster.

``` swift
public func createDBClusterSnapshot(input: CreateDBClusterSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<CreateDBClusterSnapshotOutputResponse, CreateDBClusterSnapshotOutputError>) -> Void)
```

### `createDBInstance(input:completion:)`

Creates a new instance.

``` swift
public func createDBInstance(input: CreateDBInstanceInput, completion: @escaping (ClientRuntime.SdkResult<CreateDBInstanceOutputResponse, CreateDBInstanceOutputError>) -> Void)
```

### `createDBSubnetGroup(input:completion:)`

Creates a new subnet group. subnet groups must contain at least one subnet in at least two Availability Zones in the Region.

``` swift
public func createDBSubnetGroup(input: CreateDBSubnetGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateDBSubnetGroupOutputResponse, CreateDBSubnetGroupOutputError>) -> Void)
```

### `createEventSubscription(input:completion:)`

Creates an Amazon DocumentDB event notification subscription. This action requires a topic Amazon Resource Name (ARN) created by using the Amazon DocumentDB console, the Amazon SNS console, or the Amazon SNS API. To obtain an ARN with Amazon SNS, you must create a topic in Amazon SNS and subscribe to the topic. The ARN is displayed in the Amazon SNS console. You can specify the type of source (SourceType) that you want to be notified of. You can also provide a list of Amazon DocumentDB sources (SourceIds) that trigger the events, and you can provide a list of event categories (EventCategories) for events that you want to be notified of. For example, you can specify SourceType = db-instance, SourceIds = mydbinstance1, mydbinstance2 and EventCategories = Availability, Backup. If you specify both the SourceType and SourceIds (such as SourceType = db-instance and SourceIdentifier = myDBInstance1), you are notified of all the db-instance events for the specified source. If you specify a SourceType but do not specify a SourceIdentifier, you receive notice of the events for that source type for all your Amazon DocumentDB sources. If you do not specify either the SourceType or the SourceIdentifier, you are notified of events generated from all Amazon DocumentDB sources belonging to your customer account.

``` swift
public func createEventSubscription(input: CreateEventSubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<CreateEventSubscriptionOutputResponse, CreateEventSubscriptionOutputError>) -> Void)
```

### `createGlobalCluster(input:completion:)`

Creates an Amazon DocumentDB global cluster that can span multiple multiple Regions. The global cluster contains one primary cluster with read-write capability, and up-to give read-only secondary clusters. Global clusters uses storage-based fast replication across regions with latencies less than one second, using dedicated infrastructure with no impact to your workload’s performance. You can create a global cluster that is initially empty, and then add a primary and a secondary to it. Or you can specify an existing cluster during the create operation, and this cluster becomes the primary of the global cluster. This action only applies to Amazon DocumentDB clusters.

``` swift
public func createGlobalCluster(input: CreateGlobalClusterInput, completion: @escaping (ClientRuntime.SdkResult<CreateGlobalClusterOutputResponse, CreateGlobalClusterOutputError>) -> Void)
```

### `deleteDBCluster(input:completion:)`

Deletes a previously provisioned cluster. When you delete a cluster, all automated backups for that cluster are deleted and can't be recovered. Manual DB cluster snapshots of the specified cluster are not deleted.

``` swift
public func deleteDBCluster(input: DeleteDBClusterInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDBClusterOutputResponse, DeleteDBClusterOutputError>) -> Void)
```

### `deleteDBClusterParameterGroup(input:completion:)`

Deletes a specified cluster parameter group. The cluster parameter group to be deleted can't be associated with any clusters.

``` swift
public func deleteDBClusterParameterGroup(input: DeleteDBClusterParameterGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDBClusterParameterGroupOutputResponse, DeleteDBClusterParameterGroupOutputError>) -> Void)
```

### `deleteDBClusterSnapshot(input:completion:)`

Deletes a cluster snapshot. If the snapshot is being copied, the copy operation is terminated. The cluster snapshot must be in the available state to be deleted.

``` swift
public func deleteDBClusterSnapshot(input: DeleteDBClusterSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDBClusterSnapshotOutputResponse, DeleteDBClusterSnapshotOutputError>) -> Void)
```

### `deleteDBInstance(input:completion:)`

Deletes a previously provisioned instance.

``` swift
public func deleteDBInstance(input: DeleteDBInstanceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDBInstanceOutputResponse, DeleteDBInstanceOutputError>) -> Void)
```

### `deleteDBSubnetGroup(input:completion:)`

Deletes a subnet group. The specified database subnet group must not be associated with any DB instances.

``` swift
public func deleteDBSubnetGroup(input: DeleteDBSubnetGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDBSubnetGroupOutputResponse, DeleteDBSubnetGroupOutputError>) -> Void)
```

### `deleteEventSubscription(input:completion:)`

Deletes an Amazon DocumentDB event notification subscription.

``` swift
public func deleteEventSubscription(input: DeleteEventSubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteEventSubscriptionOutputResponse, DeleteEventSubscriptionOutputError>) -> Void)
```

### `deleteGlobalCluster(input:completion:)`

Deletes a global cluster. The primary and secondary clusters must already be detached or deleted before attempting to delete a global cluster. This action only applies to Amazon DocumentDB clusters.

``` swift
public func deleteGlobalCluster(input: DeleteGlobalClusterInput, completion: @escaping (ClientRuntime.SdkResult<DeleteGlobalClusterOutputResponse, DeleteGlobalClusterOutputError>) -> Void)
```

### `describeCertificates(input:completion:)`

Returns a list of certificate authority (CA) certificates provided by Amazon DocumentDB for this account.

``` swift
public func describeCertificates(input: DescribeCertificatesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCertificatesOutputResponse, DescribeCertificatesOutputError>) -> Void)
```

### `describeDBClusterParameterGroups(input:completion:)`

Returns a list of DBClusterParameterGroup descriptions. If a DBClusterParameterGroupName parameter is specified, the list contains only the description of the specified cluster parameter group.

``` swift
public func describeDBClusterParameterGroups(input: DescribeDBClusterParameterGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDBClusterParameterGroupsOutputResponse, DescribeDBClusterParameterGroupsOutputError>) -> Void)
```

### `describeDBClusterParameters(input:completion:)`

Returns the detailed parameter list for a particular cluster parameter group.

``` swift
public func describeDBClusterParameters(input: DescribeDBClusterParametersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDBClusterParametersOutputResponse, DescribeDBClusterParametersOutputError>) -> Void)
```

### `describeDBClusterSnapshotAttributes(input:completion:)`

Returns a list of cluster snapshot attribute names and values for a manual DB cluster snapshot. When you share snapshots with other accounts, DescribeDBClusterSnapshotAttributes returns the restore attribute and a list of IDs for the accounts that are authorized to copy or restore the manual cluster snapshot. If all is included in the list of values for the restore attribute, then the manual cluster snapshot is public and can be copied or restored by all accounts.

``` swift
public func describeDBClusterSnapshotAttributes(input: DescribeDBClusterSnapshotAttributesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDBClusterSnapshotAttributesOutputResponse, DescribeDBClusterSnapshotAttributesOutputError>) -> Void)
```

### `describeDBClusterSnapshots(input:completion:)`

Returns information about cluster snapshots. This API operation supports pagination.

``` swift
public func describeDBClusterSnapshots(input: DescribeDBClusterSnapshotsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDBClusterSnapshotsOutputResponse, DescribeDBClusterSnapshotsOutputError>) -> Void)
```

### `describeDBClusters(input:completion:)`

Returns information about provisioned Amazon DocumentDB clusters. This API operation supports pagination. For certain management features such as cluster and instance lifecycle management, Amazon DocumentDB leverages operational technology that is shared with Amazon RDS and Amazon Neptune. Use the filterName=engine,Values=docdb filter parameter to return only Amazon DocumentDB clusters.

``` swift
public func describeDBClusters(input: DescribeDBClustersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDBClustersOutputResponse, DescribeDBClustersOutputError>) -> Void)
```

### `describeDBEngineVersions(input:completion:)`

Returns a list of the available engines.

``` swift
public func describeDBEngineVersions(input: DescribeDBEngineVersionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDBEngineVersionsOutputResponse, DescribeDBEngineVersionsOutputError>) -> Void)
```

### `describeDBInstances(input:completion:)`

Returns information about provisioned Amazon DocumentDB instances. This API supports pagination.

``` swift
public func describeDBInstances(input: DescribeDBInstancesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDBInstancesOutputResponse, DescribeDBInstancesOutputError>) -> Void)
```

### `describeDBSubnetGroups(input:completion:)`

Returns a list of DBSubnetGroup descriptions. If a DBSubnetGroupName is specified, the list will contain only the descriptions of the specified DBSubnetGroup.

``` swift
public func describeDBSubnetGroups(input: DescribeDBSubnetGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDBSubnetGroupsOutputResponse, DescribeDBSubnetGroupsOutputError>) -> Void)
```

### `describeEngineDefaultClusterParameters(input:completion:)`

Returns the default engine and system parameter information for the cluster database engine.

``` swift
public func describeEngineDefaultClusterParameters(input: DescribeEngineDefaultClusterParametersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEngineDefaultClusterParametersOutputResponse, DescribeEngineDefaultClusterParametersOutputError>) -> Void)
```

### `describeEventCategories(input:completion:)`

Displays a list of categories for all event source types, or, if specified, for a specified source type.

``` swift
public func describeEventCategories(input: DescribeEventCategoriesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEventCategoriesOutputResponse, DescribeEventCategoriesOutputError>) -> Void)
```

### `describeEventSubscriptions(input:completion:)`

Lists all the subscription descriptions for a customer account. The description for a subscription includes SubscriptionName, SNSTopicARN, CustomerID, SourceType, SourceID, CreationTime, and Status. If you specify a SubscriptionName, lists the description for that subscription.

``` swift
public func describeEventSubscriptions(input: DescribeEventSubscriptionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEventSubscriptionsOutputResponse, DescribeEventSubscriptionsOutputError>) -> Void)
```

### `describeEvents(input:completion:)`

Returns events related to instances, security groups, snapshots, and DB parameter groups for the past 14 days. You can obtain events specific to a particular DB instance, security group, snapshot, or parameter group by providing the name as a parameter. By default, the events of the past hour are returned.

``` swift
public func describeEvents(input: DescribeEventsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEventsOutputResponse, DescribeEventsOutputError>) -> Void)
```

### `describeGlobalClusters(input:completion:)`

Returns information about Amazon DocumentDB global clusters. This API supports pagination. This action only applies to Amazon DocumentDB clusters.

``` swift
public func describeGlobalClusters(input: DescribeGlobalClustersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeGlobalClustersOutputResponse, DescribeGlobalClustersOutputError>) -> Void)
```

### `describeOrderableDBInstanceOptions(input:completion:)`

Returns a list of orderable instance options for the specified engine.

``` swift
public func describeOrderableDBInstanceOptions(input: DescribeOrderableDBInstanceOptionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeOrderableDBInstanceOptionsOutputResponse, DescribeOrderableDBInstanceOptionsOutputError>) -> Void)
```

### `describePendingMaintenanceActions(input:completion:)`

Returns a list of resources (for example, instances) that have at least one pending maintenance action.

``` swift
public func describePendingMaintenanceActions(input: DescribePendingMaintenanceActionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribePendingMaintenanceActionsOutputResponse, DescribePendingMaintenanceActionsOutputError>) -> Void)
```

### `failoverDBCluster(input:completion:)`

Forces a failover for a cluster. A failover for a cluster promotes one of the Amazon DocumentDB replicas (read-only instances) in the cluster to be the primary instance (the cluster writer). If the primary instance fails, Amazon DocumentDB automatically fails over to an Amazon DocumentDB replica, if one exists. You can force a failover when you want to simulate a failure of a primary instance for testing.

``` swift
public func failoverDBCluster(input: FailoverDBClusterInput, completion: @escaping (ClientRuntime.SdkResult<FailoverDBClusterOutputResponse, FailoverDBClusterOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Lists all tags on an Amazon DocumentDB resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `modifyDBCluster(input:completion:)`

Modifies a setting for an Amazon DocumentDB cluster. You can change one or more database configuration parameters by specifying these parameters and the new values in the request.

``` swift
public func modifyDBCluster(input: ModifyDBClusterInput, completion: @escaping (ClientRuntime.SdkResult<ModifyDBClusterOutputResponse, ModifyDBClusterOutputError>) -> Void)
```

### `modifyDBClusterParameterGroup(input:completion:)`

Modifies the parameters of a cluster parameter group. To modify more than one parameter, submit a list of the following: ParameterName, ParameterValue, and ApplyMethod. A maximum of 20 parameters can be modified in a single request. Changes to dynamic parameters are applied immediately. Changes to static parameters require a reboot or maintenance window before the change can take effect. After you create a cluster parameter group, you should wait at least 5 minutes before creating your first cluster that uses that cluster parameter group as the default parameter group. This allows Amazon DocumentDB to fully complete the create action before the parameter group is used as the default for a new cluster. This step is especially important for parameters that are critical when creating the default database for a cluster, such as the character set for the default database defined by the character\_set\_database parameter.

``` swift
public func modifyDBClusterParameterGroup(input: ModifyDBClusterParameterGroupInput, completion: @escaping (ClientRuntime.SdkResult<ModifyDBClusterParameterGroupOutputResponse, ModifyDBClusterParameterGroupOutputError>) -> Void)
```

### `modifyDBClusterSnapshotAttribute(input:completion:)`

Adds an attribute and values to, or removes an attribute and values from, a manual cluster snapshot. To share a manual cluster snapshot with other accounts, specify restore as the AttributeName, and use the ValuesToAdd parameter to add a list of IDs of the accounts that are authorized to restore the manual cluster snapshot. Use the value all to make the manual cluster snapshot public, which means that it can be copied or restored by all accounts. Do not add the all value for any manual cluster snapshots that contain private information that you don't want available to all accounts. If a manual cluster snapshot is encrypted, it can be shared, but only by specifying a list of authorized account IDs for the ValuesToAdd parameter. You can't use all as a value for that parameter in this case.

``` swift
public func modifyDBClusterSnapshotAttribute(input: ModifyDBClusterSnapshotAttributeInput, completion: @escaping (ClientRuntime.SdkResult<ModifyDBClusterSnapshotAttributeOutputResponse, ModifyDBClusterSnapshotAttributeOutputError>) -> Void)
```

### `modifyDBInstance(input:completion:)`

Modifies settings for an instance. You can change one or more database configuration parameters by specifying these parameters and the new values in the request.

``` swift
public func modifyDBInstance(input: ModifyDBInstanceInput, completion: @escaping (ClientRuntime.SdkResult<ModifyDBInstanceOutputResponse, ModifyDBInstanceOutputError>) -> Void)
```

### `modifyDBSubnetGroup(input:completion:)`

Modifies an existing subnet group. subnet groups must contain at least one subnet in at least two Availability Zones in the Region.

``` swift
public func modifyDBSubnetGroup(input: ModifyDBSubnetGroupInput, completion: @escaping (ClientRuntime.SdkResult<ModifyDBSubnetGroupOutputResponse, ModifyDBSubnetGroupOutputError>) -> Void)
```

### `modifyEventSubscription(input:completion:)`

Modifies an existing Amazon DocumentDB event notification subscription.

``` swift
public func modifyEventSubscription(input: ModifyEventSubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<ModifyEventSubscriptionOutputResponse, ModifyEventSubscriptionOutputError>) -> Void)
```

### `modifyGlobalCluster(input:completion:)`

Modify a setting for an Amazon DocumentDB global cluster. You can change one or more configuration parameters (for example: deletion protection), or the global cluster identifier by specifying these parameters and the new values in the request. This action only applies to Amazon DocumentDB clusters.

``` swift
public func modifyGlobalCluster(input: ModifyGlobalClusterInput, completion: @escaping (ClientRuntime.SdkResult<ModifyGlobalClusterOutputResponse, ModifyGlobalClusterOutputError>) -> Void)
```

### `rebootDBInstance(input:completion:)`

You might need to reboot your instance, usually for maintenance reasons. For example, if you make certain changes, or if you change the cluster parameter group that is associated with the instance, you must reboot the instance for the changes to take effect. Rebooting an instance restarts the database engine service. Rebooting an instance results in a momentary outage, during which the instance status is set to rebooting.

``` swift
public func rebootDBInstance(input: RebootDBInstanceInput, completion: @escaping (ClientRuntime.SdkResult<RebootDBInstanceOutputResponse, RebootDBInstanceOutputError>) -> Void)
```

### `removeFromGlobalCluster(input:completion:)`

Detaches an Amazon DocumentDB secondary cluster from a global cluster. The cluster becomes a standalone cluster with read-write capability instead of being read-only and receiving data from a primary in a different region. This action only applies to Amazon DocumentDB clusters.

``` swift
public func removeFromGlobalCluster(input: RemoveFromGlobalClusterInput, completion: @escaping (ClientRuntime.SdkResult<RemoveFromGlobalClusterOutputResponse, RemoveFromGlobalClusterOutputError>) -> Void)
```

### `removeSourceIdentifierFromSubscription(input:completion:)`

Removes a source identifier from an existing Amazon DocumentDB event notification subscription.

``` swift
public func removeSourceIdentifierFromSubscription(input: RemoveSourceIdentifierFromSubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<RemoveSourceIdentifierFromSubscriptionOutputResponse, RemoveSourceIdentifierFromSubscriptionOutputError>) -> Void)
```

### `removeTagsFromResource(input:completion:)`

Removes metadata tags from an Amazon DocumentDB resource.

``` swift
public func removeTagsFromResource(input: RemoveTagsFromResourceInput, completion: @escaping (ClientRuntime.SdkResult<RemoveTagsFromResourceOutputResponse, RemoveTagsFromResourceOutputError>) -> Void)
```

### `resetDBClusterParameterGroup(input:completion:)`

Modifies the parameters of a cluster parameter group to the default value. To reset specific parameters, submit a list of the following: ParameterName and ApplyMethod. To reset the entire cluster parameter group, specify the DBClusterParameterGroupName and ResetAllParameters parameters. When you reset the entire group, dynamic parameters are updated immediately and static parameters are set to pending-reboot to take effect on the next DB instance reboot.

``` swift
public func resetDBClusterParameterGroup(input: ResetDBClusterParameterGroupInput, completion: @escaping (ClientRuntime.SdkResult<ResetDBClusterParameterGroupOutputResponse, ResetDBClusterParameterGroupOutputError>) -> Void)
```

### `restoreDBClusterFromSnapshot(input:completion:)`

Creates a new cluster from a snapshot or cluster snapshot. If a snapshot is specified, the target cluster is created from the source DB snapshot with a default configuration and default security group. If a cluster snapshot is specified, the target cluster is created from the source cluster restore point with the same configuration as the original source DB cluster, except that the new cluster is created with the default security group.

``` swift
public func restoreDBClusterFromSnapshot(input: RestoreDBClusterFromSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<RestoreDBClusterFromSnapshotOutputResponse, RestoreDBClusterFromSnapshotOutputError>) -> Void)
```

### `restoreDBClusterToPointInTime(input:completion:)`

Restores a cluster to an arbitrary point in time. Users can restore to any point in time before LatestRestorableTime for up to BackupRetentionPeriod days. The target cluster is created from the source cluster with the same configuration as the original cluster, except that the new cluster is created with the default security group.

``` swift
public func restoreDBClusterToPointInTime(input: RestoreDBClusterToPointInTimeInput, completion: @escaping (ClientRuntime.SdkResult<RestoreDBClusterToPointInTimeOutputResponse, RestoreDBClusterToPointInTimeOutputError>) -> Void)
```

### `startDBCluster(input:completion:)`

Restarts the stopped cluster that is specified by DBClusterIdentifier. For more information, see [Stopping and Starting an Amazon DocumentDB Cluster](https://docs.aws.amazon.com/documentdb/latest/developerguide/db-cluster-stop-start.html).

``` swift
public func startDBCluster(input: StartDBClusterInput, completion: @escaping (ClientRuntime.SdkResult<StartDBClusterOutputResponse, StartDBClusterOutputError>) -> Void)
```

### `stopDBCluster(input:completion:)`

Stops the running cluster that is specified by DBClusterIdentifier. The cluster must be in the available state. For more information, see [Stopping and Starting an Amazon DocumentDB Cluster](https://docs.aws.amazon.com/documentdb/latest/developerguide/db-cluster-stop-start.html).

``` swift
public func stopDBCluster(input: StopDBClusterInput, completion: @escaping (ClientRuntime.SdkResult<StopDBClusterOutputResponse, StopDBClusterOutputError>) -> Void)
```
