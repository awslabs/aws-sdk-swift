# RdsClient

``` swift
public class RdsClient 
```

## Inheritance

[`RdsClientProtocol`](/aws-sdk-swift/reference/0.x/AWSRDS/RdsClientProtocol)

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

### `addRoleToDBCluster(input:completion:)`

Associates an Identity and Access Management (IAM) role from an Amazon Aurora DB cluster.
For more information, see <a href="https:​//docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Integrating.Authorizing.html">Authorizing Amazon Aurora MySQL
to Access Other Amazon Web Services Services on Your Behalf in the Amazon Aurora User Guide.

``` swift
public func addRoleToDBCluster(input: AddRoleToDBClusterInput, completion: @escaping (ClientRuntime.SdkResult<AddRoleToDBClusterOutputResponse, AddRoleToDBClusterOutputError>) -> Void)
```

``` 
        This action only applies to Aurora DB clusters.
```

### `addRoleToDBInstance(input:completion:)`

Associates an Amazon Web Services Identity and Access Management (IAM) role with a DB instance.

``` swift
public func addRoleToDBInstance(input: AddRoleToDBInstanceInput, completion: @escaping (ClientRuntime.SdkResult<AddRoleToDBInstanceOutputResponse, AddRoleToDBInstanceOutputError>) -> Void)
```

``` 
        To add a role to a DB instance, the status of the DB instance must be available.
```

### `addSourceIdentifierToSubscription(input:completion:)`

Adds a source identifier to an existing RDS event notification subscription.

``` swift
public func addSourceIdentifierToSubscription(input: AddSourceIdentifierToSubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<AddSourceIdentifierToSubscriptionOutputResponse, AddSourceIdentifierToSubscriptionOutputError>) -> Void)
```

### `addTagsToResource(input:completion:)`

Adds metadata tags to an Amazon RDS resource. These tags can also be used with cost allocation reporting to track cost associated with Amazon RDS resources, or used in a Condition statement in an IAM policy for Amazon RDS.
For an overview on tagging Amazon RDS resources,
see <a href="https:​//docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.Tagging.html">Tagging Amazon RDS Resources.

``` swift
public func addTagsToResource(input: AddTagsToResourceInput, completion: @escaping (ClientRuntime.SdkResult<AddTagsToResourceOutputResponse, AddTagsToResourceOutputError>) -> Void)
```

### `applyPendingMaintenanceAction(input:completion:)`

Applies a pending maintenance action to a resource (for example, to a DB instance).

``` swift
public func applyPendingMaintenanceAction(input: ApplyPendingMaintenanceActionInput, completion: @escaping (ClientRuntime.SdkResult<ApplyPendingMaintenanceActionOutputResponse, ApplyPendingMaintenanceActionOutputError>) -> Void)
```

### `authorizeDBSecurityGroupIngress(input:completion:)`

Enables ingress to a DBSecurityGroup using one of two forms of authorization. First, EC2 or VPC security
groups can be added to the DBSecurityGroup if the application using the database is running on EC2 or VPC
instances. Second, IP ranges are available if the application accessing your database is running on the Internet.
Required parameters for this API are one of CIDR range, EC2SecurityGroupId for VPC, or (EC2SecurityGroupOwnerId
and either EC2SecurityGroupName or EC2SecurityGroupId for non-VPC).

``` swift
public func authorizeDBSecurityGroupIngress(input: AuthorizeDBSecurityGroupIngressInput, completion: @escaping (ClientRuntime.SdkResult<AuthorizeDBSecurityGroupIngressOutputResponse, AuthorizeDBSecurityGroupIngressOutputError>) -> Void)
```

``` 
        You can't authorize ingress from an EC2 security group in one Amazon Web Services Region to an Amazon RDS DB instance in
         another. You can't authorize ingress from a VPC security group in one VPC to an Amazon RDS DB instance in another.

     For an overview of CIDR ranges, go to the
        <a href="http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Wikipedia Tutorial.
```

### `backtrackDBCluster(input:completion:)`

Backtracks a DB cluster to a specific time, without creating a new DB cluster.
For more information on backtracking, see
<a href="https:​//docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Managing.Backtrack.html">
Backtracking an Aurora DB Cluster in the
Amazon Aurora User Guide.

``` swift
public func backtrackDBCluster(input: BacktrackDBClusterInput, completion: @escaping (ClientRuntime.SdkResult<BacktrackDBClusterOutputResponse, BacktrackDBClusterOutputError>) -> Void)
```

``` 
        This action only applies to Aurora MySQL DB clusters.
```

### `cancelExportTask(input:completion:)`

Cancels an export task in progress that is exporting a snapshot to Amazon S3.
Any data that has already been written to the S3 bucket isn't removed.

``` swift
public func cancelExportTask(input: CancelExportTaskInput, completion: @escaping (ClientRuntime.SdkResult<CancelExportTaskOutputResponse, CancelExportTaskOutputError>) -> Void)
```

### `copyDBClusterParameterGroup(input:completion:)`

Copies the specified DB cluster parameter group.

``` swift
public func copyDBClusterParameterGroup(input: CopyDBClusterParameterGroupInput, completion: @escaping (ClientRuntime.SdkResult<CopyDBClusterParameterGroupOutputResponse, CopyDBClusterParameterGroupOutputError>) -> Void)
```

``` 
        This action only applies to Aurora DB clusters.
```

### `copyDBClusterSnapshot(input:completion:)`

Copies a snapshot of a DB cluster.
To copy a DB cluster snapshot from a shared manual DB cluster snapshot, SourceDBClusterSnapshotIdentifier
must be the Amazon Resource Name (ARN) of the shared DB cluster snapshot.

``` swift
public func copyDBClusterSnapshot(input: CopyDBClusterSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<CopyDBClusterSnapshotOutputResponse, CopyDBClusterSnapshotOutputError>) -> Void)
```

``` 
     You can copy an encrypted DB cluster snapshot from another Amazon Web Services Region. In that case, the Amazon Web Services Region where you call the CopyDBClusterSnapshot action
      is the destination Amazon Web Services Region for the encrypted DB cluster snapshot to be copied to. To copy an encrypted DB cluster snapshot from another Amazon Web Services Region,
      you must provide the following values:




              KmsKeyId - The Amazon Web Services Key Management System (Amazon Web Services KMS) key identifier for the key to use to
          encrypt the copy of the DB cluster snapshot in the destination Amazon Web Services Region.



              PreSignedUrl -  A URL that contains a Signature Version 4 signed request for the
          CopyDBClusterSnapshot action to be called in the source Amazon Web Services Region where the DB cluster snapshot is copied from.
          The pre-signed URL must be a valid request for the CopyDBClusterSnapshot API action that can be executed in the
          source Amazon Web Services Region that contains the encrypted DB cluster snapshot to be copied.
          The pre-signed URL request must contain the following parameter values:



                    KmsKeyId - The Amazon Web Services KMS key identifier for the customer master key (CMK) to use to encrypt the copy of the DB
                  cluster snapshot in the destination Amazon Web Services Region. This is the same identifier for both the CopyDBClusterSnapshot
                  action that is called in the destination Amazon Web Services Region, and the action contained in the pre-signed URL.



                    DestinationRegion - The name of the Amazon Web Services Region that the DB cluster snapshot is to be created in.



                    SourceDBClusterSnapshotIdentifier - The DB cluster snapshot identifier for the encrypted DB cluster
                  snapshot to be copied. This identifier must be in the Amazon Resource Name (ARN) format for the source Amazon Web Services Region. For example,
                  if you are copying an encrypted DB cluster snapshot from the us-west-2 Amazon Web Services Region, then your SourceDBClusterSnapshotIdentifier
                  looks like the following example: arn:aws:rds:us-west-2:123456789012:cluster-snapshot:aurora-cluster1-snapshot-20161115.


          To learn how to generate a Signature Version 4 signed request, see

              <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-query-string-auth.html">
                  Authenticating Requests: Using Query Parameters (Amazon Web Services Signature Version 4) and
              <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">
                  Signature Version 4 Signing Process.

              If you are using an Amazon Web Services SDK tool or the CLI, you can specify SourceRegion (or --source-region for the CLI)
                  instead of specifying PreSignedUrl manually. Specifying SourceRegion autogenerates a pre-signed URL that is a valid
                  request for the operation that can be executed in the source Amazon Web Services Region.




              TargetDBClusterSnapshotIdentifier - The identifier for the new copy of the DB cluster snapshot in the destination Amazon Web Services Region.



              SourceDBClusterSnapshotIdentifier - The DB cluster snapshot identifier for the encrypted DB cluster snapshot to be copied.
          This identifier must be in the ARN format for the source Amazon Web Services Region and is the same value as the SourceDBClusterSnapshotIdentifier in the pre-signed URL.


     To cancel the copy operation once it is in progress, delete the target DB cluster snapshot identified
      by TargetDBClusterSnapshotIdentifier while that DB cluster snapshot is in "copying" status.
     For more information on copying encrypted DB cluster snapshots from one Amazon Web Services Region to another, see
      <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_CopySnapshot.html">
          Copying a Snapshot in the Amazon Aurora User Guide.

     For more information on Amazon Aurora, see
      <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
          What Is Amazon Aurora? in the Amazon Aurora User Guide.


        This action only applies to Aurora DB clusters.
```

### `copyDBParameterGroup(input:completion:)`

Copies the specified DB parameter group.

``` swift
public func copyDBParameterGroup(input: CopyDBParameterGroupInput, completion: @escaping (ClientRuntime.SdkResult<CopyDBParameterGroupOutputResponse, CopyDBParameterGroupOutputError>) -> Void)
```

### `copyDBSnapshot(input:completion:)`

Copies the specified DB snapshot. The source DB snapshot must be in the available state.

``` swift
public func copyDBSnapshot(input: CopyDBSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<CopyDBSnapshotOutputResponse, CopyDBSnapshotOutputError>) -> Void)
```

``` 
    You can copy a snapshot from one Amazon Web Services Region to another. In that case, the Amazon Web Services Region
        where you call the CopyDBSnapshot action is the destination Amazon Web Services Region for the
        DB snapshot copy.

    For more information about copying snapshots, see
        <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_CopySnapshot.html#USER_CopyDBSnapshot">Copying a DB Snapshot in the Amazon RDS User Guide.
```

### `copyOptionGroup(input:completion:)`

Copies the specified option group.

``` swift
public func copyOptionGroup(input: CopyOptionGroupInput, completion: @escaping (ClientRuntime.SdkResult<CopyOptionGroupOutputResponse, CopyOptionGroupOutputError>) -> Void)
```

### `createCustomAvailabilityZone(input:completion:)`

Creates a custom Availability Zone (AZ).
A custom AZ is an on-premises AZ that is integrated with a VMware vSphere cluster.
For more information about RDS on VMware, see the
<a href="https:​//docs.aws.amazon.com/AmazonRDS/latest/RDSonVMwareUserGuide/rds-on-vmware.html">
RDS on VMware User Guide.

``` swift
public func createCustomAvailabilityZone(input: CreateCustomAvailabilityZoneInput, completion: @escaping (ClientRuntime.SdkResult<CreateCustomAvailabilityZoneOutputResponse, CreateCustomAvailabilityZoneOutputError>) -> Void)
```

### `createDBCluster(input:completion:)`

Creates a new Amazon Aurora DB cluster.
You can use the ReplicationSourceIdentifier parameter to create the DB
cluster as a read replica of another DB cluster or Amazon RDS MySQL or PostgreSQL DB instance. For
cross-region replication where the DB cluster identified by
ReplicationSourceIdentifier is encrypted, you must also specify the
PreSignedUrl parameter.

``` swift
public func createDBCluster(input: CreateDBClusterInput, completion: @escaping (ClientRuntime.SdkResult<CreateDBClusterOutputResponse, CreateDBClusterOutputError>) -> Void)
```

``` 
     For more information on Amazon Aurora, see
      <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
          What Is Amazon Aurora? in the Amazon Aurora User Guide.


        This action only applies to Aurora DB clusters.
```

### `createDBClusterEndpoint(input:completion:)`

Creates a new custom endpoint and associates it with an Amazon Aurora DB cluster.

``` swift
public func createDBClusterEndpoint(input: CreateDBClusterEndpointInput, completion: @escaping (ClientRuntime.SdkResult<CreateDBClusterEndpointOutputResponse, CreateDBClusterEndpointOutputError>) -> Void)
```

``` 
       This action only applies to Aurora DB clusters.
```

### `createDBClusterParameterGroup(input:completion:)`

Creates a new DB cluster parameter group.
Parameters in a DB cluster parameter group apply to all of the instances in a DB cluster.

``` swift
public func createDBClusterParameterGroup(input: CreateDBClusterParameterGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateDBClusterParameterGroupOutputResponse, CreateDBClusterParameterGroupOutputError>) -> Void)
```

``` 
        A DB cluster parameter group is initially created with the default parameters for the
        database engine used by instances in the DB cluster. To provide custom values for any of the
        parameters, you must modify the group after creating it using
        ModifyDBClusterParameterGroup. Once you've created a DB cluster parameter group, you need to
        associate it with your DB cluster using ModifyDBCluster. When you associate
        a new DB cluster parameter group with a running DB cluster, you need to reboot the DB
        instances in the DB cluster without failover for the new DB cluster parameter group and
        associated settings to take effect.


        After you create a DB cluster parameter group, you should wait at least 5 minutes
            before creating your first DB cluster
            that uses that DB cluster parameter group as the default parameter
            group. This allows Amazon RDS to fully complete the create action before the DB cluster parameter
            group is used as the default for a new DB cluster. This is especially important for parameters
            that are critical when creating the default database for a DB cluster, such as the character set
            for the default database defined by the character_set_database parameter. You can use the
            Parameter Groups option of the <a href="https://console.aws.amazon.com/rds/">Amazon RDS console or the
            DescribeDBClusterParameters action to verify
            that your DB cluster parameter group has been created or modified.


     For more information on Amazon Aurora, see
      <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
          What Is Amazon Aurora? in the Amazon Aurora User Guide.


        This action only applies to Aurora DB clusters.
```

### `createDBClusterSnapshot(input:completion:)`

Creates a snapshot of a DB cluster. For more information on Amazon Aurora, see
<a href="https:​//docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
What Is Amazon Aurora? in the Amazon Aurora User Guide.

``` swift
public func createDBClusterSnapshot(input: CreateDBClusterSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<CreateDBClusterSnapshotOutputResponse, CreateDBClusterSnapshotOutputError>) -> Void)
```

``` 
        This action only applies to Aurora DB clusters.
```

### `createDBInstance(input:completion:)`

Creates a new DB instance.

``` swift
public func createDBInstance(input: CreateDBInstanceInput, completion: @escaping (ClientRuntime.SdkResult<CreateDBInstanceOutputResponse, CreateDBInstanceOutputError>) -> Void)
```

### `createDBInstanceReadReplica(input:completion:)`

Creates a new DB instance that acts as a read replica for an existing source DB
instance. You can create a read replica for a DB instance running MySQL, MariaDB,
Oracle, PostgreSQL, or SQL Server. For more information, see <a href="https:​//docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ReadRepl.html">Working with Read
Replicas in the Amazon RDS User Guide.

``` swift
public func createDBInstanceReadReplica(input: CreateDBInstanceReadReplicaInput, completion: @escaping (ClientRuntime.SdkResult<CreateDBInstanceReadReplicaOutputResponse, CreateDBInstanceReadReplicaOutputError>) -> Void)
```

``` 
     Amazon Aurora doesn't support this action. Call the CreateDBInstance
        action to create a DB instance for an Aurora DB cluster.

     All read replica DB instances are created with backups disabled. All other DB
        instance attributes (including DB security groups and DB parameter groups) are inherited
        from the source DB instance, except as specified.


        Your source DB instance must have backup retention enabled.
```

### `createDBParameterGroup(input:completion:)`

Creates a new DB parameter group.

``` swift
public func createDBParameterGroup(input: CreateDBParameterGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateDBParameterGroupOutputResponse, CreateDBParameterGroupOutputError>) -> Void)
```

``` 
        A DB parameter group is initially created with the default parameters for the
        database engine used by the DB instance. To provide custom values for any of the
        parameters, you must modify the group after creating it using
        ModifyDBParameterGroup. Once you've created a DB parameter group, you need to
        associate it with your DB instance using ModifyDBInstance. When you associate
        a new DB parameter group with a running DB instance, you need to reboot the DB
        instance without failover for the new DB parameter group and associated settings to take effect.


        After you create a DB parameter group, you should wait at least 5 minutes
            before creating your first DB instance that uses that DB parameter group as the default parameter
            group. This allows Amazon RDS to fully complete the create action before the parameter
            group is used as the default for a new DB instance. This is especially important for parameters
            that are critical when creating the default database for a DB instance, such as the character set
            for the default database defined by the character_set_database parameter. You can use the
            Parameter Groups option of the <a href="https://console.aws.amazon.com/rds/">Amazon RDS console or the
            DescribeDBParameters command to verify
            that your DB parameter group has been created or modified.
```

### `createDBProxy(input:completion:)`

Creates a new DB proxy.

``` swift
public func createDBProxy(input: CreateDBProxyInput, completion: @escaping (ClientRuntime.SdkResult<CreateDBProxyOutputResponse, CreateDBProxyOutputError>) -> Void)
```

### `createDBProxyEndpoint(input:completion:)`

Creates a DBProxyEndpoint. Only applies to proxies that are associated with Aurora DB clusters.
You can use DB proxy endpoints to specify read/write or read-only access to the DB cluster. You can also use
DB proxy endpoints to access a DB proxy through a different VPC than the proxy's default VPC.

``` swift
public func createDBProxyEndpoint(input: CreateDBProxyEndpointInput, completion: @escaping (ClientRuntime.SdkResult<CreateDBProxyEndpointOutputResponse, CreateDBProxyEndpointOutputError>) -> Void)
```

### `createDBSecurityGroup(input:completion:)`

Creates a new DB security group. DB security groups control access to a DB instance.

``` swift
public func createDBSecurityGroup(input: CreateDBSecurityGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateDBSecurityGroupOutputResponse, CreateDBSecurityGroupOutputError>) -> Void)
```

``` 
        A DB security group controls access to EC2-Classic DB instances that are not in a VPC.
```

### `createDBSnapshot(input:completion:)`

Creates a snapshot of a DB instance. The source DB instance must be in the available or
storage-optimization state.

``` swift
public func createDBSnapshot(input: CreateDBSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<CreateDBSnapshotOutputResponse, CreateDBSnapshotOutputError>) -> Void)
```

### `createDBSubnetGroup(input:completion:)`

Creates a new DB subnet group. DB subnet groups must contain at least one subnet in at least two AZs in the Amazon Web Services Region.

``` swift
public func createDBSubnetGroup(input: CreateDBSubnetGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateDBSubnetGroupOutputResponse, CreateDBSubnetGroupOutputError>) -> Void)
```

### `createEventSubscription(input:completion:)`

Creates an RDS event notification subscription. This action requires a topic Amazon
Resource Name (ARN) created by either the RDS console, the SNS console, or the SNS API.
To obtain an ARN with SNS, you must create a topic in Amazon SNS and subscribe to the
topic. The ARN is displayed in the SNS console.
You can specify the type of source (SourceType) that you want to be
notified of and provide a list of RDS sources (SourceIds) that triggers the
events. You can also provide a list of event categories (EventCategories)
for events that you want to be notified of. For example, you can specify
SourceType = db-instance, SourceIds =
mydbinstance1, mydbinstance2 and
EventCategories = Availability,
Backup.

``` swift
public func createEventSubscription(input: CreateEventSubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<CreateEventSubscriptionOutputResponse, CreateEventSubscriptionOutputError>) -> Void)
```

``` 
     If you specify both the SourceType and SourceIds, such as SourceType = db-instance
      and SourceIdentifier = myDBInstance1, you are notified of all the db-instance events for
      the specified source. If you specify a SourceType but do not specify a SourceIdentifier,
      you receive notice of the events for that source type for all your RDS sources. If you
      don't specify either the SourceType or the SourceIdentifier, you are notified of events
      generated from all RDS sources belonging to your customer account.

        RDS event notification is only available for unencrypted SNS topics. If you specify an
          encrypted SNS topic, event notifications aren't sent for the topic.
```

### `createGlobalCluster(input:completion:)`

Creates an Aurora global database
spread across multiple Amazon Web Services Regions. The global database
contains a single primary cluster with read-write capability,
and a read-only secondary cluster that receives
data from the primary cluster through high-speed replication
performed by the Aurora storage subsystem.

``` swift
public func createGlobalCluster(input: CreateGlobalClusterInput, completion: @escaping (ClientRuntime.SdkResult<CreateGlobalClusterOutputResponse, CreateGlobalClusterOutputError>) -> Void)
```

You can create a global database that is initially empty, and then
add a primary cluster and a secondary cluster to it.
Or you can specify an existing Aurora cluster during the create operation,
and this cluster becomes the primary cluster of the global database.

This action only applies to Aurora DB clusters.

### `createOptionGroup(input:completion:)`

Creates a new option group. You can create up to 20 option groups.

``` swift
public func createOptionGroup(input: CreateOptionGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateOptionGroupOutputResponse, CreateOptionGroupOutputError>) -> Void)
```

### `deleteCustomAvailabilityZone(input:completion:)`

Deletes a custom Availability Zone (AZ).
A custom AZ is an on-premises AZ that is integrated with a VMware vSphere cluster.
For more information about RDS on VMware, see the
<a href="https:​//docs.aws.amazon.com/AmazonRDS/latest/RDSonVMwareUserGuide/rds-on-vmware.html">
RDS on VMware User Guide.

``` swift
public func deleteCustomAvailabilityZone(input: DeleteCustomAvailabilityZoneInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCustomAvailabilityZoneOutputResponse, DeleteCustomAvailabilityZoneOutputError>) -> Void)
```

### `deleteDBCluster(input:completion:)`

The DeleteDBCluster action deletes a previously provisioned DB cluster.
When you delete a DB cluster, all automated backups for that DB cluster are deleted and can't be recovered.
Manual DB cluster snapshots of the specified DB cluster are not deleted.

``` swift
public func deleteDBCluster(input: DeleteDBClusterInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDBClusterOutputResponse, DeleteDBClusterOutputError>) -> Void)
```

``` 
     For more information on Amazon Aurora, see
      <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
          What Is Amazon Aurora? in the Amazon Aurora User Guide.


        This action only applies to Aurora DB clusters.
```

### `deleteDBClusterEndpoint(input:completion:)`

Deletes a custom endpoint and removes it from an Amazon Aurora DB cluster.

``` swift
public func deleteDBClusterEndpoint(input: DeleteDBClusterEndpointInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDBClusterEndpointOutputResponse, DeleteDBClusterEndpointOutputError>) -> Void)
```

``` 
       This action only applies to Aurora DB clusters.
```

### `deleteDBClusterParameterGroup(input:completion:)`

Deletes a specified DB cluster parameter group. The DB cluster parameter group to be deleted can't be associated with any DB clusters.
For more information on Amazon Aurora, see
<a href="https:​//docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
What Is Amazon Aurora? in the Amazon Aurora User Guide.

``` swift
public func deleteDBClusterParameterGroup(input: DeleteDBClusterParameterGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDBClusterParameterGroupOutputResponse, DeleteDBClusterParameterGroupOutputError>) -> Void)
```

``` 
        This action only applies to Aurora DB clusters.
```

### `deleteDBClusterSnapshot(input:completion:)`

Deletes a DB cluster snapshot. If the snapshot is being copied, the copy operation is terminated.

``` swift
public func deleteDBClusterSnapshot(input: DeleteDBClusterSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDBClusterSnapshotOutputResponse, DeleteDBClusterSnapshotOutputError>) -> Void)
```

``` 
        The DB cluster snapshot must be in the available state to be
        deleted.

     For more information on Amazon Aurora, see
      <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
          What Is Amazon Aurora? in the Amazon Aurora User Guide.


        This action only applies to Aurora DB clusters.
```

### `deleteDBInstance(input:completion:)`

The DeleteDBInstance action deletes a previously provisioned DB instance.
When you delete a DB instance, all automated backups for that instance are deleted and can't be recovered.
Manual DB snapshots of the DB instance to be deleted by DeleteDBInstance are not deleted.

``` swift
public func deleteDBInstance(input: DeleteDBInstanceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDBInstanceOutputResponse, DeleteDBInstanceOutputError>) -> Void)
```

``` 
    If you request a final DB snapshot
    the status of the Amazon RDS DB instance is deleting until the DB snapshot is created. The API action DescribeDBInstance
    is used to monitor the status of this operation. The action can't be canceled or reverted once submitted.

     When a DB instance is in a failure state and has a status of failed, incompatible-restore,
      or incompatible-network, you can only delete it when you skip creation of the final snapshot with the SkipFinalSnapshot parameter.

     If the specified DB instance is part of an Amazon Aurora DB cluster, you can't delete the DB instance if both of the following
  conditions are true:


           The DB cluster is a read replica of another Amazon Aurora DB cluster.


           The DB instance is the only instance in the DB cluster.


     To delete a DB instance in this case, first call the
            PromoteReadReplicaDBCluster API action to promote the DB cluster so
        it's no longer a read replica. After the promotion completes, then call the
            DeleteDBInstance API action to delete the final instance in the DB
        cluster.
```

### `deleteDBInstanceAutomatedBackup(input:completion:)`

Deletes automated backups using the DbiResourceId value of the source DB instance or the Amazon Resource Name (ARN) of the automated backups.

``` swift
public func deleteDBInstanceAutomatedBackup(input: DeleteDBInstanceAutomatedBackupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDBInstanceAutomatedBackupOutputResponse, DeleteDBInstanceAutomatedBackupOutputError>) -> Void)
```

### `deleteDBParameterGroup(input:completion:)`

Deletes a specified DB parameter group. The DB parameter group to be deleted can't be associated with any DB instances.

``` swift
public func deleteDBParameterGroup(input: DeleteDBParameterGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDBParameterGroupOutputResponse, DeleteDBParameterGroupOutputError>) -> Void)
```

### `deleteDBProxy(input:completion:)`

Deletes an existing DB proxy.

``` swift
public func deleteDBProxy(input: DeleteDBProxyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDBProxyOutputResponse, DeleteDBProxyOutputError>) -> Void)
```

### `deleteDBProxyEndpoint(input:completion:)`

Deletes a DBProxyEndpoint. Doing so removes the ability to access the DB proxy using the
endpoint that you defined. The endpoint that you delete might have provided capabilities such as read/write
or read-only operations, or using a different VPC than the DB proxy's default VPC.

``` swift
public func deleteDBProxyEndpoint(input: DeleteDBProxyEndpointInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDBProxyEndpointOutputResponse, DeleteDBProxyEndpointOutputError>) -> Void)
```

### `deleteDBSecurityGroup(input:completion:)`

Deletes a DB security group.

``` swift
public func deleteDBSecurityGroup(input: DeleteDBSecurityGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDBSecurityGroupOutputResponse, DeleteDBSecurityGroupOutputError>) -> Void)
```

``` 
        The specified DB security group must not be associated with any DB instances.
```

### `deleteDBSnapshot(input:completion:)`

Deletes a DB snapshot. If the snapshot is being copied, the copy operation is
terminated.

``` swift
public func deleteDBSnapshot(input: DeleteDBSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDBSnapshotOutputResponse, DeleteDBSnapshotOutputError>) -> Void)
```

``` 
        The DB snapshot must be in the available state to be deleted.
```

### `deleteDBSubnetGroup(input:completion:)`

Deletes a DB subnet group.

``` swift
public func deleteDBSubnetGroup(input: DeleteDBSubnetGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDBSubnetGroupOutputResponse, DeleteDBSubnetGroupOutputError>) -> Void)
```

``` 
        The specified database subnet group must not be associated with any DB instances.
```

### `deleteEventSubscription(input:completion:)`

Deletes an RDS event notification subscription.

``` swift
public func deleteEventSubscription(input: DeleteEventSubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteEventSubscriptionOutputResponse, DeleteEventSubscriptionOutputError>) -> Void)
```

### `deleteGlobalCluster(input:completion:)`

Deletes a global database cluster. The primary and secondary clusters must already be detached or
destroyed first.

``` swift
public func deleteGlobalCluster(input: DeleteGlobalClusterInput, completion: @escaping (ClientRuntime.SdkResult<DeleteGlobalClusterOutputResponse, DeleteGlobalClusterOutputError>) -> Void)
```

This action only applies to Aurora DB clusters.

### `deleteInstallationMedia(input:completion:)`

Deletes the installation medium for a DB engine that requires an on-premises customer provided license,
such as Microsoft SQL Server.

``` swift
public func deleteInstallationMedia(input: DeleteInstallationMediaInput, completion: @escaping (ClientRuntime.SdkResult<DeleteInstallationMediaOutputResponse, DeleteInstallationMediaOutputError>) -> Void)
```

### `deleteOptionGroup(input:completion:)`

Deletes an existing option group.

``` swift
public func deleteOptionGroup(input: DeleteOptionGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteOptionGroupOutputResponse, DeleteOptionGroupOutputError>) -> Void)
```

### `deregisterDBProxyTargets(input:completion:)`

Remove the association between one or more DBProxyTarget data structures and a DBProxyTargetGroup.

``` swift
public func deregisterDBProxyTargets(input: DeregisterDBProxyTargetsInput, completion: @escaping (ClientRuntime.SdkResult<DeregisterDBProxyTargetsOutputResponse, DeregisterDBProxyTargetsOutputError>) -> Void)
```

### `describeAccountAttributes(input:completion:)`

Lists all of the attributes for a customer account. The attributes include Amazon RDS quotas for the account, such as the number of DB instances allowed. The description for a quota includes the quota name, current usage toward that quota, and the quota's maximum value.
This command doesn't take any parameters.

``` swift
public func describeAccountAttributes(input: DescribeAccountAttributesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAccountAttributesOutputResponse, DescribeAccountAttributesOutputError>) -> Void)
```

### `describeCertificates(input:completion:)`

Lists the set of CA certificates provided by Amazon RDS for this Amazon Web Services account.

``` swift
public func describeCertificates(input: DescribeCertificatesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCertificatesOutputResponse, DescribeCertificatesOutputError>) -> Void)
```

### `describeCustomAvailabilityZones(input:completion:)`

Returns information about custom Availability Zones (AZs).
A custom AZ is an on-premises AZ that is integrated with a VMware vSphere cluster.
For more information about RDS on VMware, see the
<a href="https:​//docs.aws.amazon.com/AmazonRDS/latest/RDSonVMwareUserGuide/rds-on-vmware.html">
RDS on VMware User Guide.

``` swift
public func describeCustomAvailabilityZones(input: DescribeCustomAvailabilityZonesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCustomAvailabilityZonesOutputResponse, DescribeCustomAvailabilityZonesOutputError>) -> Void)
```

### `describeDBClusterBacktracks(input:completion:)`

Returns information about backtracks for a DB cluster.
For more information on Amazon Aurora, see
<a href="https:​//docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
What Is Amazon Aurora? in the Amazon Aurora User Guide.

``` swift
public func describeDBClusterBacktracks(input: DescribeDBClusterBacktracksInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDBClusterBacktracksOutputResponse, DescribeDBClusterBacktracksOutputError>) -> Void)
```

``` 
        This action only applies to Aurora MySQL DB clusters.
```

### `describeDBClusterEndpoints(input:completion:)`

Returns information about endpoints for an Amazon Aurora DB cluster.

``` swift
public func describeDBClusterEndpoints(input: DescribeDBClusterEndpointsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDBClusterEndpointsOutputResponse, DescribeDBClusterEndpointsOutputError>) -> Void)
```

``` 
       This action only applies to Aurora DB clusters.
```

### `describeDBClusterParameterGroups(input:completion:)`

Returns a list of DBClusterParameterGroup descriptions. If a
DBClusterParameterGroupName parameter is specified,
the list will contain only the description of the specified DB cluster parameter group.

``` swift
public func describeDBClusterParameterGroups(input: DescribeDBClusterParameterGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDBClusterParameterGroupsOutputResponse, DescribeDBClusterParameterGroupsOutputError>) -> Void)
```

For more information on Amazon Aurora, see
<a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
What Is Amazon Aurora? in the Amazon Aurora User Guide.

This action only applies to Aurora DB clusters.

### `describeDBClusterParameters(input:completion:)`

Returns the detailed parameter list for a particular DB cluster parameter group.
For more information on Amazon Aurora, see
<a href="https:​//docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
What Is Amazon Aurora? in the Amazon Aurora User Guide.

``` swift
public func describeDBClusterParameters(input: DescribeDBClusterParametersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDBClusterParametersOutputResponse, DescribeDBClusterParametersOutputError>) -> Void)
```

``` 
        This action only applies to Aurora DB clusters.
```

### `describeDBClusterSnapshotAttributes(input:completion:)`

Returns a list of DB cluster snapshot attribute names and values for a manual DB cluster snapshot.
When sharing snapshots with other Amazon Web Services accounts, DescribeDBClusterSnapshotAttributes
returns the restore attribute and a list of IDs for the Amazon Web Services accounts that are
authorized to copy or restore the manual DB cluster snapshot. If all is included in the list of
values for the restore attribute, then the manual DB cluster snapshot is public and
can be copied or restored by all Amazon Web Services accounts.
To add or remove access for an Amazon Web Services account to copy or restore a manual DB cluster snapshot, or to make the
manual DB cluster snapshot public or private, use the ModifyDBClusterSnapshotAttribute API action.

``` swift
public func describeDBClusterSnapshotAttributes(input: DescribeDBClusterSnapshotAttributesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDBClusterSnapshotAttributesOutputResponse, DescribeDBClusterSnapshotAttributesOutputError>) -> Void)
```

``` 
        This action only applies to Aurora DB clusters.
```

### `describeDBClusterSnapshots(input:completion:)`

Returns information about DB cluster snapshots. This API action supports pagination.
For more information on Amazon Aurora, see
<a href="https:​//docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
What Is Amazon Aurora? in the Amazon Aurora User Guide.

``` swift
public func describeDBClusterSnapshots(input: DescribeDBClusterSnapshotsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDBClusterSnapshotsOutputResponse, DescribeDBClusterSnapshotsOutputError>) -> Void)
```

``` 
        This action only applies to Aurora DB clusters.
```

### `describeDBClusters(input:completion:)`

Returns information about provisioned Aurora DB clusters. This API supports pagination.
For more information on Amazon Aurora, see
<a href="https:​//docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
What Is Amazon Aurora? in the Amazon Aurora User Guide.

``` swift
public func describeDBClusters(input: DescribeDBClustersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDBClustersOutputResponse, DescribeDBClustersOutputError>) -> Void)
```

``` 
        This operation can also return information for Amazon Neptune DB instances and Amazon DocumentDB instances.
```

### `describeDBEngineVersions(input:completion:)`

Returns a list of the available DB engines.

``` swift
public func describeDBEngineVersions(input: DescribeDBEngineVersionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDBEngineVersionsOutputResponse, DescribeDBEngineVersionsOutputError>) -> Void)
```

### `describeDBInstanceAutomatedBackups(input:completion:)`

Displays backups for both current and deleted
instances. For example, use this operation to
find details about automated backups for previously deleted instances. Current instances
with retention periods greater than zero (0) are returned for both the
DescribeDBInstanceAutomatedBackups and
DescribeDBInstances operations.
All parameters are optional.

``` swift
public func describeDBInstanceAutomatedBackups(input: DescribeDBInstanceAutomatedBackupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDBInstanceAutomatedBackupsOutputResponse, DescribeDBInstanceAutomatedBackupsOutputError>) -> Void)
```

### `describeDBInstances(input:completion:)`

Returns information about provisioned RDS instances. This API supports pagination.

``` swift
public func describeDBInstances(input: DescribeDBInstancesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDBInstancesOutputResponse, DescribeDBInstancesOutputError>) -> Void)
```

``` 
        This operation can also return information for Amazon Neptune DB instances and Amazon DocumentDB instances.
```

### `describeDBLogFiles(input:completion:)`

Returns a list of DB log files for the DB instance.

``` swift
public func describeDBLogFiles(input: DescribeDBLogFilesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDBLogFilesOutputResponse, DescribeDBLogFilesOutputError>) -> Void)
```

### `describeDBParameterGroups(input:completion:)`

Returns a list of DBParameterGroup descriptions. If a DBParameterGroupName is specified,
the list will contain only the description of the specified DB parameter group.

``` swift
public func describeDBParameterGroups(input: DescribeDBParameterGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDBParameterGroupsOutputResponse, DescribeDBParameterGroupsOutputError>) -> Void)
```

### `describeDBParameters(input:completion:)`

Returns the detailed parameter list for a particular DB parameter group.

``` swift
public func describeDBParameters(input: DescribeDBParametersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDBParametersOutputResponse, DescribeDBParametersOutputError>) -> Void)
```

### `describeDBProxies(input:completion:)`

Returns information about DB proxies.

``` swift
public func describeDBProxies(input: DescribeDBProxiesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDBProxiesOutputResponse, DescribeDBProxiesOutputError>) -> Void)
```

### `describeDBProxyEndpoints(input:completion:)`

Returns information about DB proxy endpoints.

``` swift
public func describeDBProxyEndpoints(input: DescribeDBProxyEndpointsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDBProxyEndpointsOutputResponse, DescribeDBProxyEndpointsOutputError>) -> Void)
```

### `describeDBProxyTargetGroups(input:completion:)`

Returns information about DB proxy target groups, represented by DBProxyTargetGroup data structures.

``` swift
public func describeDBProxyTargetGroups(input: DescribeDBProxyTargetGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDBProxyTargetGroupsOutputResponse, DescribeDBProxyTargetGroupsOutputError>) -> Void)
```

### `describeDBProxyTargets(input:completion:)`

Returns information about DBProxyTarget objects. This API supports pagination.

``` swift
public func describeDBProxyTargets(input: DescribeDBProxyTargetsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDBProxyTargetsOutputResponse, DescribeDBProxyTargetsOutputError>) -> Void)
```

### `describeDBSecurityGroups(input:completion:)`

Returns a list of DBSecurityGroup descriptions. If a DBSecurityGroupName is specified,
the list will contain only the descriptions of the specified DB security group.

``` swift
public func describeDBSecurityGroups(input: DescribeDBSecurityGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDBSecurityGroupsOutputResponse, DescribeDBSecurityGroupsOutputError>) -> Void)
```

### `describeDBSnapshotAttributes(input:completion:)`

Returns a list of DB snapshot attribute names and values for a manual DB snapshot.
When sharing snapshots with other Amazon Web Services accounts, DescribeDBSnapshotAttributes
returns the restore attribute and a list of IDs for the Amazon Web Services accounts that are
authorized to copy or restore the manual DB snapshot. If all is included in the list of
values for the restore attribute, then the manual DB snapshot is public and
can be copied or restored by all Amazon Web Services accounts.
To add or remove access for an Amazon Web Services account to copy or restore a manual DB snapshot, or to make the
manual DB snapshot public or private, use the ModifyDBSnapshotAttribute API action.

``` swift
public func describeDBSnapshotAttributes(input: DescribeDBSnapshotAttributesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDBSnapshotAttributesOutputResponse, DescribeDBSnapshotAttributesOutputError>) -> Void)
```

### `describeDBSnapshots(input:completion:)`

Returns information about DB snapshots. This API action supports pagination.

``` swift
public func describeDBSnapshots(input: DescribeDBSnapshotsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDBSnapshotsOutputResponse, DescribeDBSnapshotsOutputError>) -> Void)
```

### `describeDBSubnetGroups(input:completion:)`

Returns a list of DBSubnetGroup descriptions. If a DBSubnetGroupName is specified, the list will contain only the descriptions of the specified DBSubnetGroup.
For an overview of CIDR ranges, go to the
<a href="http:​//en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Wikipedia Tutorial.

``` swift
public func describeDBSubnetGroups(input: DescribeDBSubnetGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDBSubnetGroupsOutputResponse, DescribeDBSubnetGroupsOutputError>) -> Void)
```

### `describeEngineDefaultClusterParameters(input:completion:)`

Returns the default engine and system parameter information for the cluster database engine.
For more information on Amazon Aurora, see
<a href="https:​//docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
What Is Amazon Aurora? in the Amazon Aurora User Guide.

``` swift
public func describeEngineDefaultClusterParameters(input: DescribeEngineDefaultClusterParametersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEngineDefaultClusterParametersOutputResponse, DescribeEngineDefaultClusterParametersOutputError>) -> Void)
```

### `describeEngineDefaultParameters(input:completion:)`

Returns the default engine and system parameter information for the specified database engine.

``` swift
public func describeEngineDefaultParameters(input: DescribeEngineDefaultParametersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEngineDefaultParametersOutputResponse, DescribeEngineDefaultParametersOutputError>) -> Void)
```

### `describeEventCategories(input:completion:)`

Displays a list of categories for all event source types, or, if specified, for a specified source type.
You can see a list of the event categories and source types
in <a href="https:​//docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Events.html">
Events in the Amazon RDS User Guide.

``` swift
public func describeEventCategories(input: DescribeEventCategoriesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEventCategoriesOutputResponse, DescribeEventCategoriesOutputError>) -> Void)
```

### `describeEventSubscriptions(input:completion:)`

Lists all the subscription descriptions for a customer account. The description for a subscription includes
SubscriptionName, SNSTopicARN, CustomerID, SourceType, SourceID, CreationTime, and Status.
If you specify a SubscriptionName, lists the description for that subscription.

``` swift
public func describeEventSubscriptions(input: DescribeEventSubscriptionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEventSubscriptionsOutputResponse, DescribeEventSubscriptionsOutputError>) -> Void)
```

### `describeEvents(input:completion:)`

Returns events related to DB instances, DB clusters, DB parameter groups, DB security groups, DB snapshots, and DB cluster snapshots for the past 14 days.
Events specific to a particular DB instances, DB clusters, DB parameter groups, DB security groups, DB snapshots, and DB cluster snapshots group can be
obtained by providing the name as a parameter.

``` swift
public func describeEvents(input: DescribeEventsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEventsOutputResponse, DescribeEventsOutputError>) -> Void)
```

``` 
        By default, the past hour of events are returned.
```

### `describeExportTasks(input:completion:)`

Returns information about a snapshot export to Amazon S3. This API operation supports
pagination.

``` swift
public func describeExportTasks(input: DescribeExportTasksInput, completion: @escaping (ClientRuntime.SdkResult<DescribeExportTasksOutputResponse, DescribeExportTasksOutputError>) -> Void)
```

### `describeGlobalClusters(input:completion:)`

Returns information about Aurora global database clusters. This API supports pagination.

``` swift
public func describeGlobalClusters(input: DescribeGlobalClustersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeGlobalClustersOutputResponse, DescribeGlobalClustersOutputError>) -> Void)
```

For more information on Amazon Aurora, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora? in the
Amazon Aurora User Guide.

This action only applies to Aurora DB clusters.

### `describeInstallationMedia(input:completion:)`

Describes the available installation media for a DB engine that requires an
on-premises customer provided license, such as Microsoft SQL Server.

``` swift
public func describeInstallationMedia(input: DescribeInstallationMediaInput, completion: @escaping (ClientRuntime.SdkResult<DescribeInstallationMediaOutputResponse, DescribeInstallationMediaOutputError>) -> Void)
```

### `describeOptionGroupOptions(input:completion:)`

Describes all available options.

``` swift
public func describeOptionGroupOptions(input: DescribeOptionGroupOptionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeOptionGroupOptionsOutputResponse, DescribeOptionGroupOptionsOutputError>) -> Void)
```

### `describeOptionGroups(input:completion:)`

Describes the available option groups.

``` swift
public func describeOptionGroups(input: DescribeOptionGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeOptionGroupsOutputResponse, DescribeOptionGroupsOutputError>) -> Void)
```

### `describeOrderableDBInstanceOptions(input:completion:)`

Returns a list of orderable DB instance options for the specified engine.

``` swift
public func describeOrderableDBInstanceOptions(input: DescribeOrderableDBInstanceOptionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeOrderableDBInstanceOptionsOutputResponse, DescribeOrderableDBInstanceOptionsOutputError>) -> Void)
```

### `describePendingMaintenanceActions(input:completion:)`

Returns a list of resources (for example, DB instances) that have at least one pending maintenance action.

``` swift
public func describePendingMaintenanceActions(input: DescribePendingMaintenanceActionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribePendingMaintenanceActionsOutputResponse, DescribePendingMaintenanceActionsOutputError>) -> Void)
```

### `describeReservedDBInstances(input:completion:)`

Returns information about reserved DB instances for this account, or about a specified reserved DB instance.

``` swift
public func describeReservedDBInstances(input: DescribeReservedDBInstancesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeReservedDBInstancesOutputResponse, DescribeReservedDBInstancesOutputError>) -> Void)
```

### `describeReservedDBInstancesOfferings(input:completion:)`

Lists available reserved DB instance offerings.

``` swift
public func describeReservedDBInstancesOfferings(input: DescribeReservedDBInstancesOfferingsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeReservedDBInstancesOfferingsOutputResponse, DescribeReservedDBInstancesOfferingsOutputError>) -> Void)
```

### `describeSourceRegions(input:completion:)`

Returns a list of the source Amazon Web Services Regions where the current Amazon Web Services Region can create a read replica,
copy a DB snapshot from, or replicate automated backups from. This API action supports pagination.

``` swift
public func describeSourceRegions(input: DescribeSourceRegionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSourceRegionsOutputResponse, DescribeSourceRegionsOutputError>) -> Void)
```

### `describeValidDBInstanceModifications(input:completion:)`

You can call DescribeValidDBInstanceModifications
to learn what modifications you can make to your DB instance.
You can use this information when you call
ModifyDBInstance.

``` swift
public func describeValidDBInstanceModifications(input: DescribeValidDBInstanceModificationsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeValidDBInstanceModificationsOutputResponse, DescribeValidDBInstanceModificationsOutputError>) -> Void)
```

### `downloadDBLogFilePortion(input:completion:)`

Downloads all or a portion of the specified log file, up to 1 MB in size.

``` swift
public func downloadDBLogFilePortion(input: DownloadDBLogFilePortionInput, completion: @escaping (ClientRuntime.SdkResult<DownloadDBLogFilePortionOutputResponse, DownloadDBLogFilePortionOutputError>) -> Void)
```

### `failoverDBCluster(input:completion:)`

Forces a failover for a DB cluster.
A failover for a DB cluster promotes one of the Aurora Replicas (read-only instances)
in the DB cluster to be the primary instance (the cluster writer).
Amazon Aurora will automatically fail over to an Aurora Replica, if one exists,
when the primary instance fails. You can force a failover when you want to simulate a failure of a primary instance for testing.
Because each instance in a DB cluster has its own endpoint address, you will need to clean up and re-establish any existing
connections that use those endpoint addresses when the failover is complete.
For more information on Amazon Aurora, see
<a href="https:​//docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
What Is Amazon Aurora? in the Amazon Aurora User Guide.

``` swift
public func failoverDBCluster(input: FailoverDBClusterInput, completion: @escaping (ClientRuntime.SdkResult<FailoverDBClusterOutputResponse, FailoverDBClusterOutputError>) -> Void)
```

``` 
        This action only applies to Aurora DB clusters.
```

### `failoverGlobalCluster(input:completion:)`

Initiates the failover process for an Aurora global database (GlobalCluster).
A failover for an Aurora global database promotes one of secondary read-only DB clusters to be
the primary DB cluster and demotes the primary DB cluster to being a secondary (read-only) DB cluster. In other words,
the role of the current primary DB cluster and the selected (target) DB cluster are switched. The selected
secondary DB cluster assumes full read/write capabilities for the Aurora global database.
For more information about failing over an Amazon Aurora global database, see
<a href="https:​//docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-global-database-disaster-recovery.html#aurora-global-database-disaster-recovery.managed-failover">Managed planned failover for Amazon Aurora global
databases in the Amazon Aurora User Guide.

``` swift
public func failoverGlobalCluster(input: FailoverGlobalClusterInput, completion: @escaping (ClientRuntime.SdkResult<FailoverGlobalClusterOutputResponse, FailoverGlobalClusterOutputError>) -> Void)
```

``` 
        This action applies to GlobalCluster (Aurora global databases) only. Use this action only on
   healthy Aurora global databases with running Aurora DB clusters and no Region-wide outages, to test disaster recovery scenarios or to
    reconfigure your Aurora global database topology.
```

### `importInstallationMedia(input:completion:)`

Imports the installation media for a DB engine that requires an on-premises
customer provided license, such as SQL Server.

``` swift
public func importInstallationMedia(input: ImportInstallationMediaInput, completion: @escaping (ClientRuntime.SdkResult<ImportInstallationMediaOutputResponse, ImportInstallationMediaOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Lists all tags on an Amazon RDS resource.
For an overview on tagging an Amazon RDS resource,
see <a href="https:​//docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.Tagging.html">Tagging Amazon RDS Resources
in the Amazon RDS User Guide.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `modifyCertificates(input:completion:)`

Override the system-default Secure Sockets Layer/Transport Layer Security (SSL/TLS)
certificate for Amazon RDS for new DB instances temporarily, or remove the override.
By using this operation, you can specify an RDS-approved SSL/TLS certificate for new DB
instances that is different from the default certificate provided by RDS. You can also
use this operation to remove the override, so that new DB instances use the default
certificate provided by RDS.
You might need to override the default certificate in the following situations:​

``` swift
public func modifyCertificates(input: ModifyCertificatesInput, completion: @escaping (ClientRuntime.SdkResult<ModifyCertificatesOutputResponse, ModifyCertificatesOutputError>) -> Void)
```

``` 
          You already migrated your applications to support the latest certificate authority (CA) certificate, but the new CA certificate is not yet
              the RDS default CA certificate for the specified Amazon Web Services Region.


          RDS has already moved to a new default CA certificate for the specified Amazon Web Services
                Region, but you are still in the process of supporting the new CA certificate.
                In this case, you temporarily need additional time to finish your application
                changes.


     For more information about rotating your SSL/TLS certificate for RDS DB engines, see
      <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.SSL-certificate-rotation.html">
          Rotating Your SSL/TLS Certificate in the Amazon RDS User Guide.
     For more information about rotating your SSL/TLS certificate for Aurora DB engines, see
      <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/UsingWithRDS.SSL-certificate-rotation.html">
          Rotating Your SSL/TLS Certificate in the Amazon Aurora User Guide.
```

### `modifyCurrentDBClusterCapacity(input:completion:)`

Set the capacity of an Aurora Serverless DB cluster to a specific value.
Aurora Serverless scales seamlessly based on the workload on the DB cluster. In some cases, the capacity might not scale
fast enough to meet a sudden change in workload, such as a large number of new transactions. Call ModifyCurrentDBClusterCapacity
to set the capacity explicitly.
After this call sets the DB cluster capacity, Aurora Serverless can automatically scale
the DB cluster based on the cooldown period for scaling up and the cooldown period
for scaling down.
For more information about Aurora Serverless, see <a href="https:​//docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.html">Using Amazon Aurora Serverless in the
Amazon Aurora User Guide.

``` swift
public func modifyCurrentDBClusterCapacity(input: ModifyCurrentDBClusterCapacityInput, completion: @escaping (ClientRuntime.SdkResult<ModifyCurrentDBClusterCapacityOutputResponse, ModifyCurrentDBClusterCapacityOutputError>) -> Void)
```

``` 
        If you call ModifyCurrentDBClusterCapacity with the default TimeoutAction, connections that
          prevent Aurora Serverless from finding a scaling point might be dropped. For more information about scaling points,
          see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.how-it-works.html#aurora-serverless.how-it-works.auto-scaling">
              Autoscaling for Aurora Serverless in the Amazon Aurora User Guide.


        This action only applies to Aurora Serverless DB clusters.
```

### `modifyDBCluster(input:completion:)`

Modify a setting for an Amazon Aurora DB cluster.
You can change one
or more database configuration parameters by specifying these parameters and the new values in the
request. For more information on Amazon Aurora, see
<a href="https:​//docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
What Is Amazon Aurora? in the Amazon Aurora User Guide.

``` swift
public func modifyDBCluster(input: ModifyDBClusterInput, completion: @escaping (ClientRuntime.SdkResult<ModifyDBClusterOutputResponse, ModifyDBClusterOutputError>) -> Void)
```

``` 
        This action only applies to Aurora DB clusters.
```

### `modifyDBClusterEndpoint(input:completion:)`

Modifies the properties of an endpoint in an Amazon Aurora DB cluster.

``` swift
public func modifyDBClusterEndpoint(input: ModifyDBClusterEndpointInput, completion: @escaping (ClientRuntime.SdkResult<ModifyDBClusterEndpointOutputResponse, ModifyDBClusterEndpointOutputError>) -> Void)
```

``` 
       This action only applies to Aurora DB clusters.
```

### `modifyDBClusterParameterGroup(input:completion:)`

Modifies the parameters of a DB cluster parameter group. To modify more than one parameter,
submit a list of the following:​ ParameterName, ParameterValue,
and ApplyMethod. A maximum of 20
parameters can be modified in a single request.

``` swift
public func modifyDBClusterParameterGroup(input: ModifyDBClusterParameterGroupInput, completion: @escaping (ClientRuntime.SdkResult<ModifyDBClusterParameterGroupOutputResponse, ModifyDBClusterParameterGroupOutputError>) -> Void)
```

For more information on Amazon Aurora, see
<a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
What Is Amazon Aurora? in the Amazon Aurora User Guide.

After you create a DB cluster parameter group, you should wait at least 5 minutes
before creating your first DB cluster that uses that DB cluster parameter group as the default parameter
group. This allows Amazon RDS to fully complete the create action before the parameter
group is used as the default for a new DB cluster. This is especially important for parameters
that are critical when creating the default database for a DB cluster, such as the character set
for the default database defined by the character\_set\_database parameter. You can use the
Parameter Groups option of the <a href="https://console.aws.amazon.com/rds/">Amazon RDS console or the
DescribeDBClusterParameters action to verify
that your DB cluster parameter group has been created or modified.
If the modified DB cluster parameter group is used by an Aurora Serverless cluster, Aurora
applies the update immediately. The cluster restart might interrupt your workload. In that case,
your application must reopen any connections and retry any transactions that were active
when the parameter changes took effect.

This action only applies to Aurora DB clusters.

### `modifyDBClusterSnapshotAttribute(input:completion:)`

Adds an attribute and values to, or removes an attribute and values from, a manual DB cluster snapshot.
To share a manual DB cluster snapshot with other Amazon Web Services accounts, specify
restore as the AttributeName and use the
ValuesToAdd parameter to add a list of IDs of the Amazon Web Services accounts that are
authorized to restore the manual DB cluster snapshot. Use the value all to
make the manual DB cluster snapshot public, which means that it can be copied or
restored by all Amazon Web Services accounts.

``` swift
public func modifyDBClusterSnapshotAttribute(input: ModifyDBClusterSnapshotAttributeInput, completion: @escaping (ClientRuntime.SdkResult<ModifyDBClusterSnapshotAttributeOutputResponse, ModifyDBClusterSnapshotAttributeOutputError>) -> Void)
```

``` 
        Don't add the all value for any manual DB cluster snapshots
            that contain private information that you don't want available to all Amazon Web Services
            accounts.

    If a manual DB cluster snapshot is encrypted, it can be shared, but only by
        specifying a list of authorized Amazon Web Services account IDs for the ValuesToAdd
        parameter. You can't use all as a value for that parameter in this
        case.
    To view which Amazon Web Services accounts have access to copy or restore a manual DB cluster
        snapshot, or whether a manual DB cluster snapshot is public or private, use the DescribeDBClusterSnapshotAttributes API action. The accounts are
        returned as values for the restore attribute.

        This action only applies to Aurora DB clusters.
```

### `modifyDBInstance(input:completion:)`

Modifies settings for a DB instance.
You can change one or more database configuration parameters by specifying these parameters and the new values in the request.
To learn what modifications you can make to your DB instance,
call DescribeValidDBInstanceModifications
before you call ModifyDBInstance.

``` swift
public func modifyDBInstance(input: ModifyDBInstanceInput, completion: @escaping (ClientRuntime.SdkResult<ModifyDBInstanceOutputResponse, ModifyDBInstanceOutputError>) -> Void)
```

### `modifyDBParameterGroup(input:completion:)`

Modifies the parameters of a DB parameter group. To modify more than one parameter,
submit a list of the following:​ ParameterName, ParameterValue, and
ApplyMethod. A maximum of 20 parameters can be modified in a single request.

``` swift
public func modifyDBParameterGroup(input: ModifyDBParameterGroupInput, completion: @escaping (ClientRuntime.SdkResult<ModifyDBParameterGroupOutputResponse, ModifyDBParameterGroupOutputError>) -> Void)
```

``` 
After you modify a DB parameter group, you should wait at least 5 minutes
before creating your first DB instance that uses that DB parameter group as the default parameter
group. This allows Amazon RDS to fully complete the modify action before the parameter
group is used as the default for a new DB instance. This is especially important for parameters
that are critical when creating the default database for a DB instance, such as the character set
for the default database defined by the character_set_database parameter. You can use the
Parameter Groups option of the <a href="https://console.aws.amazon.com/rds/">Amazon RDS console or the
DescribeDBParameters command to verify
that your DB parameter group has been created or modified.
```

### `modifyDBProxy(input:completion:)`

Changes the settings for an existing DB proxy.

``` swift
public func modifyDBProxy(input: ModifyDBProxyInput, completion: @escaping (ClientRuntime.SdkResult<ModifyDBProxyOutputResponse, ModifyDBProxyOutputError>) -> Void)
```

### `modifyDBProxyEndpoint(input:completion:)`

Changes the settings for an existing DB proxy endpoint.

``` swift
public func modifyDBProxyEndpoint(input: ModifyDBProxyEndpointInput, completion: @escaping (ClientRuntime.SdkResult<ModifyDBProxyEndpointOutputResponse, ModifyDBProxyEndpointOutputError>) -> Void)
```

### `modifyDBProxyTargetGroup(input:completion:)`

Modifies the properties of a DBProxyTargetGroup.

``` swift
public func modifyDBProxyTargetGroup(input: ModifyDBProxyTargetGroupInput, completion: @escaping (ClientRuntime.SdkResult<ModifyDBProxyTargetGroupOutputResponse, ModifyDBProxyTargetGroupOutputError>) -> Void)
```

### `modifyDBSnapshot(input:completion:)`

Updates a manual DB snapshot with a new engine version. The snapshot can be encrypted
or unencrypted, but not shared or public.

``` swift
public func modifyDBSnapshot(input: ModifyDBSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<ModifyDBSnapshotOutputResponse, ModifyDBSnapshotOutputError>) -> Void)
```

``` 
     Amazon RDS supports upgrading DB snapshots for MySQL, Oracle, and PostgreSQL.
```

### `modifyDBSnapshotAttribute(input:completion:)`

Adds an attribute and values to, or removes an attribute and values from, a manual DB snapshot.
To share a manual DB snapshot with other Amazon Web Services accounts, specify restore
as the AttributeName and use the ValuesToAdd parameter to add
a list of IDs of the Amazon Web Services accounts that are authorized to restore the manual DB snapshot.
Uses the value all to make the manual DB snapshot public, which means it
can be copied or restored by all Amazon Web Services accounts.

``` swift
public func modifyDBSnapshotAttribute(input: ModifyDBSnapshotAttributeInput, completion: @escaping (ClientRuntime.SdkResult<ModifyDBSnapshotAttributeOutputResponse, ModifyDBSnapshotAttributeOutputError>) -> Void)
```

``` 
        Don't add the all value for any manual DB snapshots that
            contain private information that you don't want available to all Amazon Web Services
            accounts.

    If the manual DB snapshot is encrypted, it can be shared, but only by specifying a
        list of authorized Amazon Web Services account IDs for the ValuesToAdd parameter. You
        can't use all as a value for that parameter in this case.
     To view which Amazon Web Services accounts have access to copy or restore a manual DB snapshot, or
        whether a manual DB snapshot public or private, use the DescribeDBSnapshotAttributes API action. The accounts are returned as
        values for the restore attribute.
```

### `modifyDBSubnetGroup(input:completion:)`

Modifies an existing DB subnet group. DB subnet groups must contain at least one subnet in at least two AZs in the Amazon Web Services Region.

``` swift
public func modifyDBSubnetGroup(input: ModifyDBSubnetGroupInput, completion: @escaping (ClientRuntime.SdkResult<ModifyDBSubnetGroupOutputResponse, ModifyDBSubnetGroupOutputError>) -> Void)
```

### `modifyEventSubscription(input:completion:)`

Modifies an existing RDS event notification subscription. You can't modify the source identifiers using this call. To change
source identifiers for a subscription, use the AddSourceIdentifierToSubscription and RemoveSourceIdentifierFromSubscription calls.
You can see a list of the event categories for a given source type (SourceType)
in <a href="https:​//docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Events.html">Events in the Amazon RDS User Guide
or by using the DescribeEventCategories operation.

``` swift
public func modifyEventSubscription(input: ModifyEventSubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<ModifyEventSubscriptionOutputResponse, ModifyEventSubscriptionOutputError>) -> Void)
```

### `modifyGlobalCluster(input:completion:)`

Modify a setting for an Amazon Aurora global cluster. You can change one or more database configuration
parameters by specifying these parameters and the new values in the request. For more information on
Amazon Aurora, see <a href="https:​//docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html"> What Is Amazon Aurora? in the
Amazon Aurora User Guide.

``` swift
public func modifyGlobalCluster(input: ModifyGlobalClusterInput, completion: @escaping (ClientRuntime.SdkResult<ModifyGlobalClusterOutputResponse, ModifyGlobalClusterOutputError>) -> Void)
```

This action only applies to Aurora DB clusters.

### `modifyOptionGroup(input:completion:)`

Modifies an existing option group.

``` swift
public func modifyOptionGroup(input: ModifyOptionGroupInput, completion: @escaping (ClientRuntime.SdkResult<ModifyOptionGroupOutputResponse, ModifyOptionGroupOutputError>) -> Void)
```

### `promoteReadReplica(input:completion:)`

Promotes a read replica DB instance to a standalone DB instance.

``` swift
public func promoteReadReplica(input: PromoteReadReplicaInput, completion: @escaping (ClientRuntime.SdkResult<PromoteReadReplicaOutputResponse, PromoteReadReplicaOutputError>) -> Void)
```

``` 
              Backup duration is a function of the amount of changes to the database since the previous
                    backup. If you plan to promote a read replica to a standalone instance, we
                    recommend that you enable backups and complete at least one backup prior to
                    promotion. In addition, a read replica cannot be promoted to a standalone
                    instance when it is in the backing-up status. If you have
                    enabled backups on your read replica, configure the automated backup window
                    so that daily backups do not interfere with read replica
                    promotion.


              This command doesn't apply to Aurora MySQL and Aurora PostgreSQL.
```

### `promoteReadReplicaDBCluster(input:completion:)`

Promotes a read replica DB cluster to a standalone DB cluster.

``` swift
public func promoteReadReplicaDBCluster(input: PromoteReadReplicaDBClusterInput, completion: @escaping (ClientRuntime.SdkResult<PromoteReadReplicaDBClusterOutputResponse, PromoteReadReplicaDBClusterOutputError>) -> Void)
```

``` 
        This action only applies to Aurora DB clusters.
```

### `purchaseReservedDBInstancesOffering(input:completion:)`

Purchases a reserved DB instance offering.

``` swift
public func purchaseReservedDBInstancesOffering(input: PurchaseReservedDBInstancesOfferingInput, completion: @escaping (ClientRuntime.SdkResult<PurchaseReservedDBInstancesOfferingOutputResponse, PurchaseReservedDBInstancesOfferingOutputError>) -> Void)
```

### `rebootDBInstance(input:completion:)`

You might need to reboot your DB instance, usually for maintenance reasons.
For example, if you make certain modifications,
or if you change the DB parameter group associated with the DB instance,
you must reboot the instance for the changes to take effect.

``` swift
public func rebootDBInstance(input: RebootDBInstanceInput, completion: @escaping (ClientRuntime.SdkResult<RebootDBInstanceOutputResponse, RebootDBInstanceOutputError>) -> Void)
```

``` 
     Rebooting a DB instance restarts the database engine service.
    Rebooting a DB instance results in a momentary outage, during which the DB instance status is set to rebooting.


     For more information about rebooting, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_RebootInstance.html">Rebooting a DB Instance in the Amazon RDS User Guide.
```

### `registerDBProxyTargets(input:completion:)`

Associate one or more DBProxyTarget data structures with a DBProxyTargetGroup.

``` swift
public func registerDBProxyTargets(input: RegisterDBProxyTargetsInput, completion: @escaping (ClientRuntime.SdkResult<RegisterDBProxyTargetsOutputResponse, RegisterDBProxyTargetsOutputError>) -> Void)
```

### `removeFromGlobalCluster(input:completion:)`

Detaches an Aurora secondary cluster from an Aurora global database cluster. The cluster becomes a
standalone cluster with read-write capability instead of being read-only and receiving data from a
primary cluster in a different region.

``` swift
public func removeFromGlobalCluster(input: RemoveFromGlobalClusterInput, completion: @escaping (ClientRuntime.SdkResult<RemoveFromGlobalClusterOutputResponse, RemoveFromGlobalClusterOutputError>) -> Void)
```

This action only applies to Aurora DB clusters.

### `removeRoleFromDBCluster(input:completion:)`

Disassociates an Amazon Web Services Identity and Access Management (IAM) role from an Amazon Aurora DB cluster.
For more information, see <a href="https:​//docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Integrating.Authorizing.html">Authorizing Amazon Aurora MySQL
to Access Other Amazon Web Services Services on Your Behalf  in the Amazon Aurora User Guide.

``` swift
public func removeRoleFromDBCluster(input: RemoveRoleFromDBClusterInput, completion: @escaping (ClientRuntime.SdkResult<RemoveRoleFromDBClusterOutputResponse, RemoveRoleFromDBClusterOutputError>) -> Void)
```

``` 
        This action only applies to Aurora DB clusters.
```

### `removeRoleFromDBInstance(input:completion:)`

Disassociates an Amazon Web Services Identity and Access Management (IAM) role from a DB instance.

``` swift
public func removeRoleFromDBInstance(input: RemoveRoleFromDBInstanceInput, completion: @escaping (ClientRuntime.SdkResult<RemoveRoleFromDBInstanceOutputResponse, RemoveRoleFromDBInstanceOutputError>) -> Void)
```

### `removeSourceIdentifierFromSubscription(input:completion:)`

Removes a source identifier from an existing RDS event notification subscription.

``` swift
public func removeSourceIdentifierFromSubscription(input: RemoveSourceIdentifierFromSubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<RemoveSourceIdentifierFromSubscriptionOutputResponse, RemoveSourceIdentifierFromSubscriptionOutputError>) -> Void)
```

### `removeTagsFromResource(input:completion:)`

Removes metadata tags from an Amazon RDS resource.
For an overview on tagging an Amazon RDS resource,
see <a href="https:​//docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.Tagging.html">Tagging Amazon RDS Resources
in the Amazon RDS User Guide.

``` swift
public func removeTagsFromResource(input: RemoveTagsFromResourceInput, completion: @escaping (ClientRuntime.SdkResult<RemoveTagsFromResourceOutputResponse, RemoveTagsFromResourceOutputError>) -> Void)
```

### `resetDBClusterParameterGroup(input:completion:)`

Modifies the parameters of a DB cluster parameter group to the default value. To
reset specific parameters submit a list of the following:​ ParameterName
and ApplyMethod. To reset the
entire DB cluster parameter group, specify the DBClusterParameterGroupName
and ResetAllParameters parameters.

``` swift
public func resetDBClusterParameterGroup(input: ResetDBClusterParameterGroupInput, completion: @escaping (ClientRuntime.SdkResult<ResetDBClusterParameterGroupOutputResponse, ResetDBClusterParameterGroupOutputError>) -> Void)
```

When resetting the entire group, dynamic parameters are updated immediately and static parameters
are set to pending-reboot to take effect on the next DB instance restart
or RebootDBInstance request. You must call RebootDBInstance for every
DB instance in your DB cluster that you want the updated static parameter to apply to.

For more information on Amazon Aurora, see
<a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
What Is Amazon Aurora? in the Amazon Aurora User Guide.

This action only applies to Aurora DB clusters.

### `resetDBParameterGroup(input:completion:)`

Modifies the parameters of a DB parameter group to the engine/system default value.
To reset specific parameters, provide a list of the following:​
ParameterName and ApplyMethod. To reset the entire DB
parameter group, specify the DBParameterGroup name and
ResetAllParameters parameters. When resetting the entire group, dynamic
parameters are updated immediately and static parameters are set to
pending-reboot to take effect on the next DB instance restart or
RebootDBInstance request.

``` swift
public func resetDBParameterGroup(input: ResetDBParameterGroupInput, completion: @escaping (ClientRuntime.SdkResult<ResetDBParameterGroupOutputResponse, ResetDBParameterGroupOutputError>) -> Void)
```

### `restoreDBClusterFromS3(input:completion:)`

Creates an Amazon Aurora DB cluster from MySQL data stored in an Amazon S3 bucket.
Amazon RDS must be authorized to access the Amazon S3 bucket and the data must be
created using the Percona XtraBackup utility as described in <a href="https:​//docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Migrating.ExtMySQL.html#AuroraMySQL.Migrating.ExtMySQL.S3"> Migrating Data from MySQL by Using an Amazon S3 Bucket in the
Amazon Aurora User Guide.

``` swift
public func restoreDBClusterFromS3(input: RestoreDBClusterFromS3Input, completion: @escaping (ClientRuntime.SdkResult<RestoreDBClusterFromS3OutputResponse, RestoreDBClusterFromS3OutputError>) -> Void)
```

``` 
          This action only restores the DB cluster, not the DB instances for that DB
              cluster. You must invoke the CreateDBInstance action to create DB
              instances for the restored DB cluster, specifying the identifier of the restored DB
              cluster in DBClusterIdentifier. You can create DB instances only after
              the RestoreDBClusterFromS3 action has completed and the DB
              cluster is available.

    For more information on Amazon Aurora, see
        <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
            What Is Amazon Aurora? in the Amazon Aurora User Guide.


        This action only applies to Aurora DB clusters. The source DB engine must be
            MySQL.
```

### `restoreDBClusterFromSnapshot(input:completion:)`

Creates a new DB cluster from a DB snapshot or DB cluster snapshot. This action
only applies to Aurora DB clusters.
The target DB cluster is created from the source snapshot with a default
configuration. If you don't specify a security group, the new DB cluster is
associated with the default security group.

``` swift
public func restoreDBClusterFromSnapshot(input: RestoreDBClusterFromSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<RestoreDBClusterFromSnapshotOutputResponse, RestoreDBClusterFromSnapshotOutputError>) -> Void)
```

``` 
        This action only restores the DB cluster, not the DB instances for that DB
            cluster. You must invoke the CreateDBInstance action to create DB
            instances for the restored DB cluster, specifying the identifier of the restored DB
            cluster in DBClusterIdentifier. You can create DB instances only after
            the RestoreDBClusterFromSnapshot action has completed and the DB
            cluster is available.

     For more information on Amazon Aurora, see
      <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
          What Is Amazon Aurora? in the Amazon Aurora User Guide.


        This action only applies to Aurora DB clusters.
```

### `restoreDBClusterToPointInTime(input:completion:)`

Restores a DB cluster to an arbitrary point in time. Users can restore to any point
in time before LatestRestorableTime for up to
BackupRetentionPeriod days. The target DB cluster is created from the
source DB cluster with the same configuration as the original DB cluster, except that
the new DB cluster is created with the default DB security group.

``` swift
public func restoreDBClusterToPointInTime(input: RestoreDBClusterToPointInTimeInput, completion: @escaping (ClientRuntime.SdkResult<RestoreDBClusterToPointInTimeOutputResponse, RestoreDBClusterToPointInTimeOutputError>) -> Void)
```

``` 
        This action only restores the DB cluster, not the DB instances for that DB
            cluster. You must invoke the CreateDBInstance action to create DB
            instances for the restored DB cluster, specifying the identifier of the restored DB
            cluster in DBClusterIdentifier. You can create DB instances only after
            the RestoreDBClusterToPointInTime action has completed and the DB
            cluster is available.

     For more information on Amazon Aurora, see
      <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html">
          What Is Amazon Aurora? in the Amazon Aurora User Guide.


        This action only applies to Aurora DB clusters.
```

### `restoreDBInstanceFromDBSnapshot(input:completion:)`

Creates a new DB instance from a DB snapshot. The target database is created from the source database restore point with most
of the source's original configuration, including the default security group and DB parameter group. By default, the new DB
instance is created as a Single-AZ deployment, except when the instance is a SQL Server instance that has an option group
associated with mirroring. In this case, the instance becomes a Multi-AZ deployment, not a Single-AZ deployment.
If you want to replace your original DB instance with the new, restored DB instance, then rename your original DB instance
before you call the RestoreDBInstanceFromDBSnapshot action. RDS doesn't allow two DB instances with the same name. After you
have renamed your original DB instance with a different identifier, then you can pass the original name of the DB instance as
the DBInstanceIdentifier in the call to the RestoreDBInstanceFromDBSnapshot action. The result is that you replace the original
DB instance with the DB instance created from the snapshot.
If you are restoring from a shared manual DB snapshot, the DBSnapshotIdentifier
must be the ARN of the shared DB snapshot.

``` swift
public func restoreDBInstanceFromDBSnapshot(input: RestoreDBInstanceFromDBSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<RestoreDBInstanceFromDBSnapshotOutputResponse, RestoreDBInstanceFromDBSnapshotOutputError>) -> Void)
```

``` 
        This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For Aurora, use RestoreDBClusterFromSnapshot.
```

### `restoreDBInstanceFromS3(input:completion:)`

Amazon Relational Database Service (Amazon RDS)
supports importing MySQL databases by using backup files.
You can create a backup of your on-premises database,
store it on Amazon Simple Storage Service (Amazon S3),
and then restore the backup file onto a new Amazon RDS DB instance running MySQL.
For more information, see <a href="https:​//docs.aws.amazon.com/AmazonRDS/latest/UserGuide/MySQL.Procedural.Importing.html">Importing Data into an Amazon RDS MySQL DB Instance
in the Amazon RDS User Guide.

``` swift
public func restoreDBInstanceFromS3(input: RestoreDBInstanceFromS3Input, completion: @escaping (ClientRuntime.SdkResult<RestoreDBInstanceFromS3OutputResponse, RestoreDBInstanceFromS3OutputError>) -> Void)
```

### `restoreDBInstanceToPointInTime(input:completion:)`

Restores a DB instance to an arbitrary point in time. You can restore to any point in time before the time identified by the LatestRestorableTime property. You can restore to a point up to the number of days specified by the BackupRetentionPeriod property.
The target database is created with most of the original configuration, but in a
system-selected Availability Zone, with the default security group, the default subnet
group, and the default DB parameter group. By default, the new DB instance is created as
a single-AZ deployment except when the instance is a SQL Server instance that has an
option group that is associated with mirroring; in this case, the instance becomes a
mirrored deployment and not a single-AZ deployment.

``` swift
public func restoreDBInstanceToPointInTime(input: RestoreDBInstanceToPointInTimeInput, completion: @escaping (ClientRuntime.SdkResult<RestoreDBInstanceToPointInTimeOutputResponse, RestoreDBInstanceToPointInTimeOutputError>) -> Void)
```

``` 
        This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For Aurora, use RestoreDBClusterToPointInTime.
```

### `revokeDBSecurityGroupIngress(input:completion:)`

Revokes ingress from a DBSecurityGroup for previously authorized IP ranges or EC2 or VPC security groups. Required parameters for this API are one of CIDRIP, EC2SecurityGroupId for VPC, or (EC2SecurityGroupOwnerId and either EC2SecurityGroupName or EC2SecurityGroupId).

``` swift
public func revokeDBSecurityGroupIngress(input: RevokeDBSecurityGroupIngressInput, completion: @escaping (ClientRuntime.SdkResult<RevokeDBSecurityGroupIngressOutputResponse, RevokeDBSecurityGroupIngressOutputError>) -> Void)
```

### `startActivityStream(input:completion:)`

Starts a database activity stream to monitor activity on the database.
For more information, see <a href="https:​//docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/DBActivityStreams.html">Database Activity Streams
in the Amazon Aurora User Guide.

``` swift
public func startActivityStream(input: StartActivityStreamInput, completion: @escaping (ClientRuntime.SdkResult<StartActivityStreamOutputResponse, StartActivityStreamOutputError>) -> Void)
```

### `startDBCluster(input:completion:)`

Starts an Amazon Aurora DB cluster that was stopped using the Amazon Web Services console, the stop-db-cluster
CLI command, or the StopDBCluster action.

``` swift
public func startDBCluster(input: StartDBClusterInput, completion: @escaping (ClientRuntime.SdkResult<StartDBClusterOutputResponse, StartDBClusterOutputError>) -> Void)
```

``` 
     For more information, see
       <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-cluster-stop-start.html">
           Stopping and Starting an Aurora Cluster in the Amazon Aurora User Guide.


       This action only applies to Aurora DB clusters.
```

### `startDBInstance(input:completion:)`

For more information, see
<a href="https:​//docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_StartInstance.html">
Starting an Amazon RDS DB instance That Was Previously Stopped in the
Amazon RDS User Guide.

``` swift
public func startDBInstance(input: StartDBInstanceInput, completion: @escaping (ClientRuntime.SdkResult<StartDBInstanceOutputResponse, StartDBInstanceOutputError>) -> Void)
```

``` 
Starts an Amazon RDS DB instance that was stopped using the Amazon Web Services console, the stop-db-instance CLI command, or the StopDBInstance action.
```

``` 
This command doesn't apply to Aurora MySQL and Aurora PostgreSQL.
For Aurora DB clusters, use StartDBCluster instead.
```

### `startDBInstanceAutomatedBackupsReplication(input:completion:)`

Enables replication of automated backups to a different Amazon Web Services Region.
For more information, see <a href="https:​//docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ReplicateBackups.html">
Replicating Automated Backups to Another Amazon Web Services Region in the Amazon RDS User Guide.

``` swift
public func startDBInstanceAutomatedBackupsReplication(input: StartDBInstanceAutomatedBackupsReplicationInput, completion: @escaping (ClientRuntime.SdkResult<StartDBInstanceAutomatedBackupsReplicationOutputResponse, StartDBInstanceAutomatedBackupsReplicationOutputError>) -> Void)
```

### `startExportTask(input:completion:)`

Starts an export of a snapshot to Amazon S3.
The provided IAM role must have access to the S3 bucket.

``` swift
public func startExportTask(input: StartExportTaskInput, completion: @escaping (ClientRuntime.SdkResult<StartExportTaskOutputResponse, StartExportTaskOutputError>) -> Void)
```

### `stopActivityStream(input:completion:)`

Stops a database activity stream that was started using the Amazon Web Services console,
the start-activity-stream CLI command, or the StartActivityStream action.
For more information, see
<a href="https:​//docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/DBActivityStreams.html">Database Activity Streams
in the Amazon Aurora User Guide.

``` swift
public func stopActivityStream(input: StopActivityStreamInput, completion: @escaping (ClientRuntime.SdkResult<StopActivityStreamOutputResponse, StopActivityStreamOutputError>) -> Void)
```

### `stopDBCluster(input:completion:)`

Stops an Amazon Aurora DB cluster. When you stop a DB cluster, Aurora retains the DB cluster's
metadata, including its endpoints and DB parameter groups. Aurora also
retains the transaction logs so you can do a point-in-time restore if necessary.

``` swift
public func stopDBCluster(input: StopDBClusterInput, completion: @escaping (ClientRuntime.SdkResult<StopDBClusterOutputResponse, StopDBClusterOutputError>) -> Void)
```

For more information, see
<a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-cluster-stop-start.html">
Stopping and Starting an Aurora Cluster in the Amazon Aurora User Guide.

``` 
This action only applies to Aurora DB clusters.
```

### `stopDBInstance(input:completion:)`

For more information, see
<a href="https:​//docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_StopInstance.html">
Stopping an Amazon RDS DB Instance Temporarily in the
Amazon RDS User Guide.

``` swift
public func stopDBInstance(input: StopDBInstanceInput, completion: @escaping (ClientRuntime.SdkResult<StopDBInstanceOutputResponse, StopDBInstanceOutputError>) -> Void)
```

``` 
Stops an Amazon RDS DB instance. When you stop a DB instance, Amazon RDS retains the DB instance's metadata, including its endpoint,
DB parameter group, and option group membership. Amazon RDS also retains the transaction logs so you can do a point-in-time restore if
necessary.
```

``` 
This command doesn't apply to Aurora MySQL and Aurora PostgreSQL.
For Aurora clusters, use StopDBCluster instead.
```

### `stopDBInstanceAutomatedBackupsReplication(input:completion:)`

Stops automated backup replication for a DB instance.
For more information, see <a href="https:​//docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ReplicateBackups.html">
Replicating Automated Backups to Another Amazon Web Services Region in the Amazon RDS User Guide.

``` swift
public func stopDBInstanceAutomatedBackupsReplication(input: StopDBInstanceAutomatedBackupsReplicationInput, completion: @escaping (ClientRuntime.SdkResult<StopDBInstanceAutomatedBackupsReplicationOutputResponse, StopDBInstanceAutomatedBackupsReplicationOutputError>) -> Void)
```
