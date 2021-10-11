# ElastiCacheClientProtocol

<fullname>Amazon ElastiCache</fullname>
Amazon ElastiCache is a web service that makes it easier to set up, operate,
and scale a distributed cache in the cloud.
With ElastiCache, customers get all of the benefits of a high-performance,
in-memory cache with less of the administrative burden involved in launching and managing a distributed cache.
The service makes setup, scaling,
and cluster failure handling much simpler than in a self-managed cache deployment.
In addition, through integration with Amazon CloudWatch,
customers get enhanced visibility into the key performance statistics
associated with their cache and can receive alarms if a part of their cache runs hot.

``` swift
public protocol ElastiCacheClientProtocol 
```

## Requirements

### addTagsToResource(input:​completion:​)

A  tag is a key-value pair where the key and value are case-sensitive.
You can use tags to categorize and track all your ElastiCache resources, with the exception of global replication group. When you add or remove tags on replication groups, those actions will be replicated to all nodes in the replication group.
For more information, see <a href="http:​//docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/IAM.ResourceLevelPermissions.html">Resource-level permissions.

``` swift
func addTagsToResource(input: AddTagsToResourceInput, completion: @escaping (ClientRuntime.SdkResult<AddTagsToResourceOutputResponse, AddTagsToResourceOutputError>) -> Void)
```

``` 
        For example, you can use cost-allocation tags to your ElastiCache resources,
        Amazon generates a cost allocation report as a comma-separated value (CSV) file
        with your usage and costs aggregated by your tags.
        You can apply tags that represent business categories (such as cost centers, application names, or owners)
        to organize your costs across multiple services.
        For more information,
        see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Tagging.html">Using Cost Allocation Tags in Amazon ElastiCache
        in the ElastiCache User Guide.
```

### authorizeCacheSecurityGroupIngress(input:​completion:​)

Allows network ingress to a cache
security group. Applications using ElastiCache must be running on Amazon EC2, and Amazon EC2
security groups are used as the authorization mechanism.

``` swift
func authorizeCacheSecurityGroupIngress(input: AuthorizeCacheSecurityGroupIngressInput, completion: @escaping (ClientRuntime.SdkResult<AuthorizeCacheSecurityGroupIngressOutputResponse, AuthorizeCacheSecurityGroupIngressOutputError>) -> Void)
```

``` 
        You cannot authorize ingress from an Amazon EC2 security group in one region to an
        ElastiCache cluster in another region.
```

### batchApplyUpdateAction(input:​completion:​)

Apply the service update. For more information on service updates and applying them, see <a href="https:​//docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/applying-updates.html">Applying Service Updates.

``` swift
func batchApplyUpdateAction(input: BatchApplyUpdateActionInput, completion: @escaping (ClientRuntime.SdkResult<BatchApplyUpdateActionOutputResponse, BatchApplyUpdateActionOutputError>) -> Void)
```

### batchStopUpdateAction(input:​completion:​)

Stop the service update. For more information on service updates and stopping them, see <a href="https:​//docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/stopping-self-service-updates.html">Stopping Service Updates.

``` swift
func batchStopUpdateAction(input: BatchStopUpdateActionInput, completion: @escaping (ClientRuntime.SdkResult<BatchStopUpdateActionOutputResponse, BatchStopUpdateActionOutputError>) -> Void)
```

### completeMigration(input:​completion:​)

Complete the migration of data.

``` swift
func completeMigration(input: CompleteMigrationInput, completion: @escaping (ClientRuntime.SdkResult<CompleteMigrationOutputResponse, CompleteMigrationOutputError>) -> Void)
```

### copySnapshot(input:​completion:​)

Makes a copy of an existing snapshot.

``` swift
func copySnapshot(input: CopySnapshotInput, completion: @escaping (ClientRuntime.SdkResult<CopySnapshotOutputResponse, CopySnapshotOutputError>) -> Void)
```

``` 
        This operation is valid for Redis only.



        Users or groups that have permissions to use the CopySnapshot operation
            can create their own Amazon S3 buckets and copy snapshots to it.
            To control access to your snapshots, use an IAM policy to control who has the ability to use
            the CopySnapshot operation.
            For more information about using IAM to control the use of ElastiCache operations, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html">Exporting Snapshots
            and <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/IAM.html">Authentication & Access Control.


    You could receive the following error messages.
    <p class="title">
        Error Messages




              Error Message:
                The S3 bucket %s is outside of the region.

              Solution:
                Create an Amazon S3 bucket in the same region as your snapshot.
                For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-create-s3-bucket">Step 1: Create an Amazon S3 Bucket in the ElastiCache User Guide.



              Error Message:
                The S3 bucket %s does not exist.

              Solution:
                Create an Amazon S3 bucket in the same region as your snapshot.
                For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-create-s3-bucket">Step 1: Create an Amazon S3 Bucket in the ElastiCache User Guide.



              Error Message:
                The S3 bucket %s is not owned by the authenticated user.

              Solution:
                Create an Amazon S3 bucket in the same region as your snapshot.
                For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-create-s3-bucket">Step 1: Create an Amazon S3 Bucket in the ElastiCache User Guide.



              Error Message:
                The authenticated user does not have sufficient permissions to perform the desired activity.

              Solution:
                Contact your system administrator to get the needed permissions.



              Error Message:
                The S3 bucket %s already contains an object with key %s.

              Solution:
                Give the TargetSnapshotName a new and unique value.
                If exporting a snapshot,
                you could alternatively create a new Amazon S3 bucket
                and use this same value for TargetSnapshotName.



              Error Message:
                ElastiCache has not been granted READ permissions %s on the S3 Bucket.

              Solution:
                Add List and Read permissions on the bucket.
            For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-grant-access">Step 2: Grant ElastiCache Access to Your Amazon S3 Bucket in the ElastiCache User Guide.



              Error Message:
                ElastiCache has not been granted WRITE permissions %s on the S3 Bucket.

              Solution:
                Add Upload/Delete permissions on the bucket.
                For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-grant-access">Step 2: Grant ElastiCache Access to Your Amazon S3 Bucket in the ElastiCache User Guide.



              Error Message:
                ElastiCache has not been granted READ_ACP permissions %s on the S3 Bucket.

              Solution:
                Add View Permissions on the bucket.
            For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-grant-access">Step 2: Grant ElastiCache Access to Your Amazon S3 Bucket in the ElastiCache User Guide.
```

### createCacheCluster(input:​completion:​)

Creates a cluster. All nodes in the
cluster run the same protocol-compliant cache engine software, either Memcached
or Redis.
This operation is not supported for Redis (cluster mode enabled) clusters.

``` swift
func createCacheCluster(input: CreateCacheClusterInput, completion: @escaping (ClientRuntime.SdkResult<CreateCacheClusterOutputResponse, CreateCacheClusterOutputError>) -> Void)
```

### createCacheParameterGroup(input:​completion:​)

Creates a new Amazon ElastiCache cache parameter group. An ElastiCache
cache parameter group is a collection of parameters and their values that are applied to all of the nodes
in any cluster or replication group using the CacheParameterGroup.
A newly created CacheParameterGroup is an exact duplicate of the default parameter group
for the CacheParameterGroupFamily. To customize the newly created CacheParameterGroup you can
change the values of specific parameters. For more information, see:​

``` swift
func createCacheParameterGroup(input: CreateCacheParameterGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateCacheParameterGroupOutputResponse, CreateCacheParameterGroupOutputError>) -> Void)
```

``` 
              <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_ModifyCacheParameterGroup.html">ModifyCacheParameterGroup in the ElastiCache API Reference.



              <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/ParameterGroups.html">Parameters and Parameter Groups in the ElastiCache User Guide.
```

### createCacheSecurityGroup(input:​completion:​)

Creates a new cache security group. Use a
cache security group to control access to one or more clusters.
Cache security groups are only used when you are creating a cluster outside of an Amazon
Virtual Private Cloud (Amazon VPC). If you are creating a cluster inside of a VPC, use a cache
subnet group instead. For more information,
see <a href="https:​//docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_CreateCacheSubnetGroup.html">CreateCacheSubnetGroup.

``` swift
func createCacheSecurityGroup(input: CreateCacheSecurityGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateCacheSecurityGroupOutputResponse, CreateCacheSecurityGroupOutputError>) -> Void)
```

### createCacheSubnetGroup(input:​completion:​)

Creates a new cache subnet group.
Use this parameter only when you are creating a cluster in an Amazon Virtual Private Cloud (Amazon VPC).

``` swift
func createCacheSubnetGroup(input: CreateCacheSubnetGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateCacheSubnetGroupOutputResponse, CreateCacheSubnetGroupOutputError>) -> Void)
```

### createGlobalReplicationGroup(input:​completion:​)

Global Datastore for Redis offers fully managed, fast,
reliable and secure cross-region replication.
Using Global Datastore for Redis, you can create cross-region
read replica clusters for ElastiCache for Redis to enable low-latency reads
and disaster recovery across regions. For more information,

``` swift
func createGlobalReplicationGroup(input: CreateGlobalReplicationGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateGlobalReplicationGroupOutputResponse, CreateGlobalReplicationGroupOutputError>) -> Void)
```

``` 
        see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Redis-Global-Datastore.html">Replication Across Regions Using Global Datastore.



           The GlobalReplicationGroupIdSuffix is the name of the Global datastore.


           The PrimaryReplicationGroupId represents the name of the primary cluster that accepts writes and will replicate updates to the secondary cluster.
```

### createReplicationGroup(input:​completion:​)

Creates a Redis (cluster mode disabled) or a Redis (cluster mode enabled) replication group.
This API can be used to create a standalone regional replication group or a secondary replication group associated with a Global datastore.
A Redis (cluster mode disabled) replication group is a collection of clusters,
where one of the clusters is a read/write primary and the others are read-only replicas.
Writes to the primary are asynchronously propagated to the replicas.
A Redis cluster-mode enabled cluster is comprised of from 1 to 90 shards (API/CLI:​ node groups).
Each shard has a primary node and up to 5 read-only replica nodes. The configuration can range from 90 shards and 0 replicas to 15 shards and 5 replicas, which is the maximum number or replicas allowed.

``` swift
func createReplicationGroup(input: CreateReplicationGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateReplicationGroupOutputResponse, CreateReplicationGroupOutputError>) -> Void)
```

``` 
    The node or shard limit can be increased to a maximum of 500 per cluster if the Redis engine version is 5.0.6 or higher. For example, you can choose to configure a 500 node cluster that ranges between
        83 shards (one primary and 5 replicas per shard) and 500 shards (single primary and no replicas). Make sure there are enough available IP addresses to accommodate the increase.
        Common pitfalls include the subnets in the subnet group have too small a CIDR range or the subnets are shared and heavily used by other clusters. For more information, see
        <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/SubnetGroups.Creating.html">Creating a Subnet Group. For versions below 5.0.6,
        the limit is 250 per cluster.
    To request a limit increase, see
        <a href="https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html">Amazon Service Limits
        and choose the limit type Nodes per cluster per instance type.
    When a Redis (cluster mode disabled) replication group has been successfully created,
        you can add one or more read replicas to it, up to a total of 5 read replicas.
        If you need to increase or decrease the number of node groups (console: shards),
        you can avail yourself of ElastiCache for Redis' scaling. For more information,
        see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Scaling.html">Scaling ElastiCache for Redis Clusters in the ElastiCache User Guide.



        This operation is valid for Redis only.
```

### createSnapshot(input:​completion:​)

Creates a copy of an entire cluster or replication group at a
specific moment in time.

``` swift
func createSnapshot(input: CreateSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<CreateSnapshotOutputResponse, CreateSnapshotOutputError>) -> Void)
```

``` 
        This operation is valid for Redis only.
```

### createUser(input:​completion:​)

For Redis engine version 6.x onwards:​ Creates a Redis user. For more information, see <a href="http:​//docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.RBAC.html">Using Role Based Access Control (RBAC).

``` swift
func createUser(input: CreateUserInput, completion: @escaping (ClientRuntime.SdkResult<CreateUserOutputResponse, CreateUserOutputError>) -> Void)
```

### createUserGroup(input:​completion:​)

For Redis engine version 6.x onwards:​ Creates a Redis user group. For more information, see <a href="http:​//docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.RBAC.html">Using Role Based Access Control (RBAC)

``` swift
func createUserGroup(input: CreateUserGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateUserGroupOutputResponse, CreateUserGroupOutputError>) -> Void)
```

### decreaseNodeGroupsInGlobalReplicationGroup(input:​completion:​)

Decreases the number of node groups in a Global datastore

``` swift
func decreaseNodeGroupsInGlobalReplicationGroup(input: DecreaseNodeGroupsInGlobalReplicationGroupInput, completion: @escaping (ClientRuntime.SdkResult<DecreaseNodeGroupsInGlobalReplicationGroupOutputResponse, DecreaseNodeGroupsInGlobalReplicationGroupOutputError>) -> Void)
```

### decreaseReplicaCount(input:​completion:​)

Dynamically decreases the number of replicas in a Redis (cluster mode disabled) replication group or the number of
replica nodes in one or more node groups (shards) of a Redis (cluster mode enabled) replication group. This operation
is performed with no cluster down time.

``` swift
func decreaseReplicaCount(input: DecreaseReplicaCountInput, completion: @escaping (ClientRuntime.SdkResult<DecreaseReplicaCountOutputResponse, DecreaseReplicaCountOutputError>) -> Void)
```

### deleteCacheCluster(input:​completion:​)

Deletes a previously provisioned cluster.
DeleteCacheCluster deletes all associated cache nodes, node endpoints and the
cluster itself. When you receive a successful response from this operation,
Amazon ElastiCache immediately begins deleting the cluster; you cannot cancel or revert
this operation.
This operation is not valid for:​

``` swift
func deleteCacheCluster(input: DeleteCacheClusterInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCacheClusterOutputResponse, DeleteCacheClusterOutputError>) -> Void)
```

``` 
            Redis (cluster mode enabled) clusters


            Redis (cluster mode disabled) clusters



            A cluster that is the last read replica of a replication group


            A cluster that is the primary node of a replication group


            A node group (shard) that has Multi-AZ mode enabled


            A cluster from a Redis (cluster mode enabled) replication group


            A cluster that is not in the available state
```

### deleteCacheParameterGroup(input:​completion:​)

Deletes the specified cache parameter
group. You cannot delete a cache parameter group if it is associated with any cache
clusters. You cannot delete the default cache parameter groups in your account.

``` swift
func deleteCacheParameterGroup(input: DeleteCacheParameterGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCacheParameterGroupOutputResponse, DeleteCacheParameterGroupOutputError>) -> Void)
```

### deleteCacheSecurityGroup(input:​completion:​)

Deletes a cache security group.

``` swift
func deleteCacheSecurityGroup(input: DeleteCacheSecurityGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCacheSecurityGroupOutputResponse, DeleteCacheSecurityGroupOutputError>) -> Void)
```

``` 
        You cannot delete a cache security group if it is associated with any clusters.
```

### deleteCacheSubnetGroup(input:​completion:​)

Deletes a cache subnet group.

``` swift
func deleteCacheSubnetGroup(input: DeleteCacheSubnetGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCacheSubnetGroupOutputResponse, DeleteCacheSubnetGroupOutputError>) -> Void)
```

``` 
        You cannot delete a default cache subnet group or one that is associated with any clusters.
```

### deleteGlobalReplicationGroup(input:​completion:​)

Deleting a Global datastore is a two-step process:​

``` swift
func deleteGlobalReplicationGroup(input: DeleteGlobalReplicationGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteGlobalReplicationGroupOutputResponse, DeleteGlobalReplicationGroupOutputError>) -> Void)
```

``` 
           First, you must DisassociateGlobalReplicationGroup to remove the secondary clusters in the Global datastore.


           Once the Global datastore contains only the primary cluster, you can use the DeleteGlobalReplicationGroup API to delete the Global datastore while retainining the primary cluster using RetainPrimaryReplicationGroup=true.




      Since the Global Datastore has only a primary cluster, you can delete the Global Datastore
         while retaining the primary by setting RetainPrimaryReplicationGroup=true. The primary cluster is never deleted when deleting a
      Global Datastore. It can only be deleted when it no longer is associated with any Global Datastore.

    When you receive a successful response from this operation, Amazon ElastiCache immediately begins deleting the selected resources;
        you cannot cancel or revert this operation.
```

### deleteReplicationGroup(input:​completion:​)

Deletes an existing replication group.
By default, this operation deletes the entire replication group, including the primary/primaries and all of the read replicas.
If the replication group has only one primary,
you can optionally delete only the read replicas, while retaining the primary by setting RetainPrimaryCluster=true.
When you receive a successful response from this operation, Amazon ElastiCache immediately begins deleting the selected resources;
you cannot cancel or revert this operation.

``` swift
func deleteReplicationGroup(input: DeleteReplicationGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteReplicationGroupOutputResponse, DeleteReplicationGroupOutputError>) -> Void)
```

``` 
        This operation is valid for Redis only.
```

### deleteSnapshot(input:​completion:​)

Deletes an existing snapshot. When you receive a
successful response from this operation, ElastiCache immediately begins deleting the snapshot;
you cannot cancel or revert this operation.

``` swift
func deleteSnapshot(input: DeleteSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSnapshotOutputResponse, DeleteSnapshotOutputError>) -> Void)
```

``` 
        This operation is valid for Redis only.
```

### deleteUser(input:​completion:​)

For Redis engine version 6.x onwards:​ Deletes a user. The user will be removed from all user groups and in turn removed from all replication groups. For more information, see <a href="http:​//docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.RBAC.html">Using Role Based Access Control (RBAC).

``` swift
func deleteUser(input: DeleteUserInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUserOutputResponse, DeleteUserOutputError>) -> Void)
```

### deleteUserGroup(input:​completion:​)

For Redis engine version 6.x onwards:​ Deletes a user group. The user group must first be disassociated from the replication group before it can be deleted. For more information, see <a href="http:​//docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.RBAC.html">Using Role Based Access Control (RBAC).

``` swift
func deleteUserGroup(input: DeleteUserGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUserGroupOutputResponse, DeleteUserGroupOutputError>) -> Void)
```

### describeCacheClusters(input:​completion:​)

Returns information about all provisioned
clusters if no cluster identifier is specified, or about a specific cache
cluster if a cluster identifier is supplied.
By default, abbreviated information about the clusters is returned. You can
use the optional ShowCacheNodeInfo flag to retrieve detailed information about the
cache nodes associated with the clusters. These details include the DNS address
and port for the cache node endpoint.
If the cluster is in the creating state, only cluster-level information is displayed
until all of the nodes are successfully provisioned.
If the cluster is in the deleting state, only cluster-level information is displayed.
If cache nodes are currently being added to the cluster, node endpoint information
and creation time for the additional nodes are not displayed until they are
completely provisioned. When the cluster state is available, the cluster is
ready for use.
If cache nodes are currently being removed from the cluster, no endpoint information
for the removed nodes is displayed.

``` swift
func describeCacheClusters(input: DescribeCacheClustersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCacheClustersOutputResponse, DescribeCacheClustersOutputError>) -> Void)
```

### describeCacheEngineVersions(input:​completion:​)

Returns a list of the available cache
engines and their versions.

``` swift
func describeCacheEngineVersions(input: DescribeCacheEngineVersionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCacheEngineVersionsOutputResponse, DescribeCacheEngineVersionsOutputError>) -> Void)
```

### describeCacheParameterGroups(input:​completion:​)

Returns a list of cache parameter group
descriptions. If a cache parameter group name is specified, the list contains only
the descriptions for that group.

``` swift
func describeCacheParameterGroups(input: DescribeCacheParameterGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCacheParameterGroupsOutputResponse, DescribeCacheParameterGroupsOutputError>) -> Void)
```

### describeCacheParameters(input:​completion:​)

Returns the detailed parameter list for a
particular cache parameter group.

``` swift
func describeCacheParameters(input: DescribeCacheParametersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCacheParametersOutputResponse, DescribeCacheParametersOutputError>) -> Void)
```

### describeCacheSecurityGroups(input:​completion:​)

Returns a list of cache security group
descriptions. If a cache security group name is specified, the list contains only
the description of that group. This applicable only when you have ElastiCache in Classic setup

``` swift
func describeCacheSecurityGroups(input: DescribeCacheSecurityGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCacheSecurityGroupsOutputResponse, DescribeCacheSecurityGroupsOutputError>) -> Void)
```

### describeCacheSubnetGroups(input:​completion:​)

Returns a list of cache subnet group
descriptions. If a subnet group name is specified, the list  contains only the
description of that group. This is applicable only when you have ElastiCache in VPC setup. All ElastiCache clusters now launch in VPC by default.

``` swift
func describeCacheSubnetGroups(input: DescribeCacheSubnetGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCacheSubnetGroupsOutputResponse, DescribeCacheSubnetGroupsOutputError>) -> Void)
```

### describeEngineDefaultParameters(input:​completion:​)

Returns the default engine and
system parameter information for the specified cache engine.

``` swift
func describeEngineDefaultParameters(input: DescribeEngineDefaultParametersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEngineDefaultParametersOutputResponse, DescribeEngineDefaultParametersOutputError>) -> Void)
```

### describeEvents(input:​completion:​)

Returns events related to clusters, cache
security groups, and cache parameter groups. You can obtain events specific to a
particular cluster, cache security group, or cache parameter group by providing
the name as a parameter.
By default, only the events occurring within the last hour are returned;
however, you can retrieve up to 14 days' worth of events if necessary.

``` swift
func describeEvents(input: DescribeEventsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEventsOutputResponse, DescribeEventsOutputError>) -> Void)
```

### describeGlobalReplicationGroups(input:​completion:​)

Returns information about a particular global replication group. If no identifier is specified, returns information about all Global datastores.

``` swift
func describeGlobalReplicationGroups(input: DescribeGlobalReplicationGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeGlobalReplicationGroupsOutputResponse, DescribeGlobalReplicationGroupsOutputError>) -> Void)
```

### describeReplicationGroups(input:​completion:​)

Returns information about a particular
replication group. If no identifier is specified, DescribeReplicationGroups
returns information about all replication groups.

``` swift
func describeReplicationGroups(input: DescribeReplicationGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeReplicationGroupsOutputResponse, DescribeReplicationGroupsOutputError>) -> Void)
```

``` 
        This operation is valid for Redis only.
```

### describeReservedCacheNodes(input:​completion:​)

Returns information about reserved cache
nodes for this account, or about a specified reserved cache node.

``` swift
func describeReservedCacheNodes(input: DescribeReservedCacheNodesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeReservedCacheNodesOutputResponse, DescribeReservedCacheNodesOutputError>) -> Void)
```

### describeReservedCacheNodesOfferings(input:​completion:​)

Lists available reserved cache
node offerings.

``` swift
func describeReservedCacheNodesOfferings(input: DescribeReservedCacheNodesOfferingsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeReservedCacheNodesOfferingsOutputResponse, DescribeReservedCacheNodesOfferingsOutputError>) -> Void)
```

### describeServiceUpdates(input:​completion:​)

Returns details of the service updates

``` swift
func describeServiceUpdates(input: DescribeServiceUpdatesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeServiceUpdatesOutputResponse, DescribeServiceUpdatesOutputError>) -> Void)
```

### describeSnapshots(input:​completion:​)

Returns information about cluster or replication group snapshots.
By default, DescribeSnapshots lists all of your snapshots; it can optionally
describe a single snapshot, or just the snapshots associated with a particular cache
cluster.

``` swift
func describeSnapshots(input: DescribeSnapshotsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSnapshotsOutputResponse, DescribeSnapshotsOutputError>) -> Void)
```

``` 
        This operation is valid for Redis only.
```

### describeUpdateActions(input:​completion:​)

Returns details of the update actions

``` swift
func describeUpdateActions(input: DescribeUpdateActionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeUpdateActionsOutputResponse, DescribeUpdateActionsOutputError>) -> Void)
```

### describeUserGroups(input:​completion:​)

Returns a list of user groups.

``` swift
func describeUserGroups(input: DescribeUserGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeUserGroupsOutputResponse, DescribeUserGroupsOutputError>) -> Void)
```

### describeUsers(input:​completion:​)

Returns a list of users.

``` swift
func describeUsers(input: DescribeUsersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeUsersOutputResponse, DescribeUsersOutputError>) -> Void)
```

### disassociateGlobalReplicationGroup(input:​completion:​)

Remove a secondary cluster from the Global datastore using the Global datastore name. The secondary cluster will no longer receive updates from the primary cluster, but will remain as a standalone cluster in that Amazon region.

``` swift
func disassociateGlobalReplicationGroup(input: DisassociateGlobalReplicationGroupInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateGlobalReplicationGroupOutputResponse, DisassociateGlobalReplicationGroupOutputError>) -> Void)
```

### failoverGlobalReplicationGroup(input:​completion:​)

Used to failover the primary region to a selected secondary region. The selected secondary region will become primary, and all other clusters will become secondary.

``` swift
func failoverGlobalReplicationGroup(input: FailoverGlobalReplicationGroupInput, completion: @escaping (ClientRuntime.SdkResult<FailoverGlobalReplicationGroupOutputResponse, FailoverGlobalReplicationGroupOutputError>) -> Void)
```

### increaseNodeGroupsInGlobalReplicationGroup(input:​completion:​)

Increase the number of node groups in the Global datastore

``` swift
func increaseNodeGroupsInGlobalReplicationGroup(input: IncreaseNodeGroupsInGlobalReplicationGroupInput, completion: @escaping (ClientRuntime.SdkResult<IncreaseNodeGroupsInGlobalReplicationGroupOutputResponse, IncreaseNodeGroupsInGlobalReplicationGroupOutputError>) -> Void)
```

### increaseReplicaCount(input:​completion:​)

Dynamically increases the number of replicas in a Redis (cluster mode disabled) replication group or the number of
replica nodes in one or more node groups (shards) of a Redis (cluster mode enabled) replication group. This operation
is performed with no cluster down time.

``` swift
func increaseReplicaCount(input: IncreaseReplicaCountInput, completion: @escaping (ClientRuntime.SdkResult<IncreaseReplicaCountOutputResponse, IncreaseReplicaCountOutputError>) -> Void)
```

### listAllowedNodeTypeModifications(input:​completion:​)

Lists all available node types that you
can scale your Redis cluster's or replication group's current node type.

``` swift
func listAllowedNodeTypeModifications(input: ListAllowedNodeTypeModificationsInput, completion: @escaping (ClientRuntime.SdkResult<ListAllowedNodeTypeModificationsOutputResponse, ListAllowedNodeTypeModificationsOutputError>) -> Void)
```

``` 
    When you use the ModifyCacheCluster or ModifyReplicationGroup operations to
        scale your cluster or replication group, the value of the CacheNodeType parameter
        must be one of the node types returned by this operation.
```

### listTagsForResource(input:​completion:​)

Lists all tags currently on a  named resource.
A  tag is a key-value pair where the key and value are case-sensitive.
You can use tags to categorize and track all your ElastiCache resources, with the exception of global replication group. When you add or remove tags on replication groups, those actions will be replicated to all nodes in the replication group.
For more information, see <a href="http:​//docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/IAM.ResourceLevelPermissions.html">Resource-level permissions.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

``` 
    If the cluster is not in the available state, ListTagsForResource
        returns an error.
```

### modifyCacheCluster(input:​completion:​)

Modifies the settings for a cluster. You
can use this operation to change one or more cluster configuration parameters by
specifying the parameters and the new values.

``` swift
func modifyCacheCluster(input: ModifyCacheClusterInput, completion: @escaping (ClientRuntime.SdkResult<ModifyCacheClusterOutputResponse, ModifyCacheClusterOutputError>) -> Void)
```

### modifyCacheParameterGroup(input:​completion:​)

Modifies the parameters of a cache
parameter group. You can modify up to 20 parameters in a single request by submitting a
list parameter name and value pairs.

``` swift
func modifyCacheParameterGroup(input: ModifyCacheParameterGroupInput, completion: @escaping (ClientRuntime.SdkResult<ModifyCacheParameterGroupOutputResponse, ModifyCacheParameterGroupOutputError>) -> Void)
```

### modifyCacheSubnetGroup(input:​completion:​)

Modifies an existing cache subnet group.

``` swift
func modifyCacheSubnetGroup(input: ModifyCacheSubnetGroupInput, completion: @escaping (ClientRuntime.SdkResult<ModifyCacheSubnetGroupOutputResponse, ModifyCacheSubnetGroupOutputError>) -> Void)
```

### modifyGlobalReplicationGroup(input:​completion:​)

Modifies the settings for a Global datastore.

``` swift
func modifyGlobalReplicationGroup(input: ModifyGlobalReplicationGroupInput, completion: @escaping (ClientRuntime.SdkResult<ModifyGlobalReplicationGroupOutputResponse, ModifyGlobalReplicationGroupOutputError>) -> Void)
```

### modifyReplicationGroup(input:​completion:​)

Modifies the settings for a replication group.

``` swift
func modifyReplicationGroup(input: ModifyReplicationGroupInput, completion: @escaping (ClientRuntime.SdkResult<ModifyReplicationGroupOutputResponse, ModifyReplicationGroupOutputError>) -> Void)
```

``` 
              <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/scaling-redis-cluster-mode-enabled.html">Scaling for Amazon ElastiCache for Redis (cluster mode enabled)
                in the ElastiCache User Guide



              <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_ModifyReplicationGroupShardConfiguration.html">ModifyReplicationGroupShardConfiguration
                in the ElastiCache API Reference



        This operation is valid for Redis only.
```

### modifyReplicationGroupShardConfiguration(input:​completion:​)

Modifies a replication group's shards (node groups) by allowing you to
add shards, remove shards, or rebalance the keyspaces among existing shards.

``` swift
func modifyReplicationGroupShardConfiguration(input: ModifyReplicationGroupShardConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<ModifyReplicationGroupShardConfigurationOutputResponse, ModifyReplicationGroupShardConfigurationOutputError>) -> Void)
```

### modifyUser(input:​completion:​)

Changes user password(s) and/or access string.

``` swift
func modifyUser(input: ModifyUserInput, completion: @escaping (ClientRuntime.SdkResult<ModifyUserOutputResponse, ModifyUserOutputError>) -> Void)
```

### modifyUserGroup(input:​completion:​)

Changes the list of users that belong to the user group.

``` swift
func modifyUserGroup(input: ModifyUserGroupInput, completion: @escaping (ClientRuntime.SdkResult<ModifyUserGroupOutputResponse, ModifyUserGroupOutputError>) -> Void)
```

### purchaseReservedCacheNodesOffering(input:​completion:​)

Allows you to purchase a reserved
cache node offering. Reserved nodes are not eligible for cancellation and are non-refundable. For more information,
see <a href="https:​//docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/reserved-nodes.html">Managing Costs with Reserved Nodes for Redis or
<a href="https:​//docs.aws.amazon.com/AmazonElastiCache/latest/mem-ug/reserved-nodes.html">Managing Costs with Reserved Nodes for Memcached.

``` swift
func purchaseReservedCacheNodesOffering(input: PurchaseReservedCacheNodesOfferingInput, completion: @escaping (ClientRuntime.SdkResult<PurchaseReservedCacheNodesOfferingOutputResponse, PurchaseReservedCacheNodesOfferingOutputError>) -> Void)
```

### rebalanceSlotsInGlobalReplicationGroup(input:​completion:​)

Redistribute slots to ensure uniform distribution across existing shards in the cluster.

``` swift
func rebalanceSlotsInGlobalReplicationGroup(input: RebalanceSlotsInGlobalReplicationGroupInput, completion: @escaping (ClientRuntime.SdkResult<RebalanceSlotsInGlobalReplicationGroupOutputResponse, RebalanceSlotsInGlobalReplicationGroupOutputError>) -> Void)
```

### rebootCacheCluster(input:​completion:​)

Reboots some, or all, of the cache nodes
within a provisioned cluster. This operation applies any modified cache parameter
groups to the cluster. The reboot operation takes place as soon as possible, and
results in a momentary outage to the cluster. During the reboot, the cluster
status is set to REBOOTING.
The reboot causes the contents of the cache (for each cache node being rebooted) to be lost.
When the reboot is complete, a cluster event is created.

``` swift
func rebootCacheCluster(input: RebootCacheClusterInput, completion: @escaping (ClientRuntime.SdkResult<RebootCacheClusterOutputResponse, RebootCacheClusterOutputError>) -> Void)
```

``` 
    Rebooting a cluster is currently supported on Memcached and Redis (cluster mode disabled) clusters.
        Rebooting is not supported on Redis (cluster mode enabled) clusters.

    If you make changes to parameters that require a Redis (cluster mode enabled) cluster reboot for the changes to be applied,
        see <a href="http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.Rebooting.html">Rebooting a Cluster for an alternate process.
```

### removeTagsFromResource(input:​completion:​)

Removes the tags identified by the TagKeys
list from the named resource. A  tag is a key-value pair where the key and value are case-sensitive.
You can use tags to categorize and track all your ElastiCache resources, with the exception of global replication group. When you add or remove tags on replication groups, those actions will be replicated to all nodes in the replication group.
For more information, see <a href="http:​//docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/IAM.ResourceLevelPermissions.html">Resource-level permissions.

``` swift
func removeTagsFromResource(input: RemoveTagsFromResourceInput, completion: @escaping (ClientRuntime.SdkResult<RemoveTagsFromResourceOutputResponse, RemoveTagsFromResourceOutputError>) -> Void)
```

### resetCacheParameterGroup(input:​completion:​)

Modifies the parameters of a cache
parameter group to the engine or system default value. You can reset specific parameters
by submitting a list of parameter names. To reset the entire cache parameter group,
specify the ResetAllParameters and CacheParameterGroupName parameters.

``` swift
func resetCacheParameterGroup(input: ResetCacheParameterGroupInput, completion: @escaping (ClientRuntime.SdkResult<ResetCacheParameterGroupOutputResponse, ResetCacheParameterGroupOutputError>) -> Void)
```

### revokeCacheSecurityGroupIngress(input:​completion:​)

Revokes ingress from a cache security group.
Use this operation to disallow access from an Amazon EC2 security group
that had been previously authorized.

``` swift
func revokeCacheSecurityGroupIngress(input: RevokeCacheSecurityGroupIngressInput, completion: @escaping (ClientRuntime.SdkResult<RevokeCacheSecurityGroupIngressOutputResponse, RevokeCacheSecurityGroupIngressOutputError>) -> Void)
```

### startMigration(input:​completion:​)

Start the migration of data.

``` swift
func startMigration(input: StartMigrationInput, completion: @escaping (ClientRuntime.SdkResult<StartMigrationOutputResponse, StartMigrationOutputError>) -> Void)
```

### testFailover(input:​completion:​)

Represents the input of a TestFailover operation which test automatic failover on
a specified node group (called shard in the console) in a replication group (called cluster in the console).

``` swift
func testFailover(input: TestFailoverInput, completion: @escaping (ClientRuntime.SdkResult<TestFailoverOutputResponse, TestFailoverOutputError>) -> Void)
```

``` 
    <p class="title">
        Note the following



            A customer can use this operation to test automatic failover on up to 5 shards (called node groups in the ElastiCache API and Amazon CLI)
                in any rolling 24-hour period.


            If calling this operation on shards in different clusters (called replication groups in the API and CLI), the calls can be made concurrently.



            If calling this operation multiple times on different shards in the same Redis (cluster mode enabled) replication group,
                the first node replacement must complete before a subsequent call can be made.


            To determine whether the node replacement is complete you can check Events using the Amazon ElastiCache console,
                the Amazon CLI, or the ElastiCache API.
                Look for the following automatic failover related events, listed here in order of occurrance:
            <ol>

                    Replication group message: Test Failover API called for node group <node-group-id>



                    Cache cluster message: Failover from primary node <primary-node-id> to replica node <node-id> completed



                    Replication group message: Failover from primary node <primary-node-id> to replica node <node-id> completed



                    Cache cluster message: Recovering cache nodes <node-id>



                    Cache cluster message: Finished recovery for cache nodes <node-id>


           </ol>

            For more information see:



                    <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/ECEvents.Viewing.html">Viewing ElastiCache Events
                        in the ElastiCache User Guide




                    <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_DescribeEvents.html">DescribeEvents in the ElastiCache API Reference





    Also see, <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/AutoFailover.html#auto-failover-test">Testing Multi-AZ  in the ElastiCache User Guide.
```
