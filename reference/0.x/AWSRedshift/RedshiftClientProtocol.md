# RedshiftClientProtocol

<fullname>Amazon Redshift</fullname>

``` swift
public protocol RedshiftClientProtocol 
```

``` 
        Overview

    This is an interface reference for Amazon Redshift. It contains documentation for one of
        the programming or command line interfaces you can use to manage Amazon Redshift clusters.
        Note that Amazon Redshift is asynchronous, which means that some interfaces may require
        techniques, such as polling or asynchronous callback handlers, to determine when a
        command has been applied. In this reference, the parameter descriptions indicate whether
        a change is applied immediately, on the next instance reboot, or during the next
        maintenance window. For a summary of the Amazon Redshift cluster management interfaces, go to
            <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/using-aws-sdk.html">Using the
            Amazon Redshift Management Interfaces.
    Amazon Redshift manages all the work of setting up, operating, and scaling a data
        warehouse: provisioning capacity, monitoring and backing up the cluster, and applying
        patches and upgrades to the Amazon Redshift engine. You can focus on using your data to
        acquire new insights for your business and customers.
    If you are a first-time user of Amazon Redshift, we recommend that you begin by reading
        the <a href="https://docs.aws.amazon.com/redshift/latest/gsg/getting-started.html">Amazon Redshift Getting Started Guide.

    If you are a database developer, the <a href="https://docs.aws.amazon.com/redshift/latest/dg/welcome.html">Amazon Redshift Database Developer Guide explains how to design,
        build, query, and maintain the databases that make up your data warehouse.
```

## Requirements

### acceptReservedNodeExchange(input:​completion:​)

Exchanges a DC1 Reserved Node for a DC2 Reserved Node with no changes to the
configuration (term, payment type, or number of nodes) and no additional costs.

``` swift
func acceptReservedNodeExchange(input: AcceptReservedNodeExchangeInput, completion: @escaping (ClientRuntime.SdkResult<AcceptReservedNodeExchangeOutputResponse, AcceptReservedNodeExchangeOutputError>) -> Void)
```

### addPartner(input:​completion:​)

Adds a partner integration to a cluster.
This operation authorizes a partner to push status updates for the specified database.
To complete the integration, you also set up the integration on the partner website.

``` swift
func addPartner(input: AddPartnerInput, completion: @escaping (ClientRuntime.SdkResult<AddPartnerOutputResponse, AddPartnerOutputError>) -> Void)
```

### associateDataShareConsumer(input:​completion:​)

From a datashare consumer account, associates a datashare with the
account (AssociateEntireAccount) or the specified namespace (ConsumerArn). If you make this association, the consumer
can consume the datashare.

``` swift
func associateDataShareConsumer(input: AssociateDataShareConsumerInput, completion: @escaping (ClientRuntime.SdkResult<AssociateDataShareConsumerOutputResponse, AssociateDataShareConsumerOutputError>) -> Void)
```

### authorizeClusterSecurityGroupIngress(input:​completion:​)

Adds an inbound (ingress) rule to an Amazon Redshift security group. Depending on whether
the application accessing your cluster is running on the Internet or an Amazon EC2
instance, you can authorize inbound access to either a Classless Interdomain Routing
(CIDR)/Internet Protocol (IP) range or to an Amazon EC2 security group. You can add as
many as 20 ingress rules to an Amazon Redshift security group.
If you authorize access to an Amazon EC2 security group, specify
EC2SecurityGroupName and
EC2SecurityGroupOwnerId. The Amazon EC2 security group and
Amazon Redshift cluster must be in the same Amazon Web Services Region.
If you authorize access to a CIDR/IP address range, specify
CIDRIP. For an overview of CIDR blocks, see the Wikipedia
article on <a href="http:​//en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Classless Inter-Domain Routing.
You must also associate the security group with a cluster so that clients running
on these IP addresses or the EC2 instance are authorized to connect to the cluster. For
information about managing security groups, go to <a href="https:​//docs.aws.amazon.com/redshift/latest/mgmt/working-with-security-groups.html">Working with Security
Groups in the Amazon Redshift Cluster Management Guide.

``` swift
func authorizeClusterSecurityGroupIngress(input: AuthorizeClusterSecurityGroupIngressInput, completion: @escaping (ClientRuntime.SdkResult<AuthorizeClusterSecurityGroupIngressOutputResponse, AuthorizeClusterSecurityGroupIngressOutputError>) -> Void)
```

### authorizeDataShare(input:​completion:​)

From a data producer account, authorizes the sharing of a datashare with one or more
consumer accounts. To authorize a datashare for a data consumer, the producer account
must have the correct access privileges.

``` swift
func authorizeDataShare(input: AuthorizeDataShareInput, completion: @escaping (ClientRuntime.SdkResult<AuthorizeDataShareOutputResponse, AuthorizeDataShareOutputError>) -> Void)
```

### authorizeEndpointAccess(input:​completion:​)

Grants access to a cluster.

``` swift
func authorizeEndpointAccess(input: AuthorizeEndpointAccessInput, completion: @escaping (ClientRuntime.SdkResult<AuthorizeEndpointAccessOutputResponse, AuthorizeEndpointAccessOutputError>) -> Void)
```

### authorizeSnapshotAccess(input:​completion:​)

Authorizes the specified Amazon Web Services account to restore the specified
snapshot.

``` swift
func authorizeSnapshotAccess(input: AuthorizeSnapshotAccessInput, completion: @escaping (ClientRuntime.SdkResult<AuthorizeSnapshotAccessOutputResponse, AuthorizeSnapshotAccessOutputError>) -> Void)
```

For more information about working with snapshots, go to
<a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-snapshots.html">Amazon Redshift Snapshots
in the Amazon Redshift Cluster Management Guide.

### batchDeleteClusterSnapshots(input:​completion:​)

Deletes a set of cluster snapshots.

``` swift
func batchDeleteClusterSnapshots(input: BatchDeleteClusterSnapshotsInput, completion: @escaping (ClientRuntime.SdkResult<BatchDeleteClusterSnapshotsOutputResponse, BatchDeleteClusterSnapshotsOutputError>) -> Void)
```

### batchModifyClusterSnapshots(input:​completion:​)

Modifies the settings for a set of cluster snapshots.

``` swift
func batchModifyClusterSnapshots(input: BatchModifyClusterSnapshotsInput, completion: @escaping (ClientRuntime.SdkResult<BatchModifyClusterSnapshotsOutputResponse, BatchModifyClusterSnapshotsOutputError>) -> Void)
```

### cancelResize(input:​completion:​)

Cancels a resize operation for a cluster.

``` swift
func cancelResize(input: CancelResizeInput, completion: @escaping (ClientRuntime.SdkResult<CancelResizeOutputResponse, CancelResizeOutputError>) -> Void)
```

### copyClusterSnapshot(input:​completion:​)

Copies the specified automated cluster snapshot to a new manual cluster snapshot.
The source must be an automated snapshot and it must be in the available
state.
When you delete a cluster, Amazon Redshift deletes any automated snapshots of the
cluster. Also, when the retention period of the snapshot expires, Amazon Redshift
automatically deletes it. If you want to keep an automated snapshot for a longer period,
you can make a manual copy of the snapshot. Manual snapshots are retained until you
delete them.

``` swift
func copyClusterSnapshot(input: CopyClusterSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<CopyClusterSnapshotOutputResponse, CopyClusterSnapshotOutputError>) -> Void)
```

For more information about working with snapshots, go to
<a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-snapshots.html">Amazon Redshift Snapshots
in the Amazon Redshift Cluster Management Guide.

### createAuthenticationProfile(input:​completion:​)

Creates an authentication profile with the specified parameters.

``` swift
func createAuthenticationProfile(input: CreateAuthenticationProfileInput, completion: @escaping (ClientRuntime.SdkResult<CreateAuthenticationProfileOutputResponse, CreateAuthenticationProfileOutputError>) -> Void)
```

### createCluster(input:​completion:​)

Creates a new cluster with the specified parameters.
To create a cluster in Virtual Private Cloud (VPC), you must provide a cluster
subnet group name. The cluster subnet group identifies the subnets of your VPC that
Amazon Redshift uses when creating the cluster.
For more information about managing clusters, go to
<a href="https:​//docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html">Amazon Redshift Clusters
in the Amazon Redshift Cluster Management Guide.

``` swift
func createCluster(input: CreateClusterInput, completion: @escaping (ClientRuntime.SdkResult<CreateClusterOutputResponse, CreateClusterOutputError>) -> Void)
```

### createClusterParameterGroup(input:​completion:​)

Creates an Amazon Redshift parameter group.
Creating parameter groups is independent of creating clusters. You can associate a
cluster with a parameter group when you create the cluster. You can also associate an
existing cluster with a parameter group after the cluster is created by using ModifyCluster.
Parameters in the parameter group define specific behavior that applies to the
databases you create on the cluster.
For more information about parameters and parameter groups, go to
<a href="https:​//docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html">Amazon Redshift Parameter Groups
in the Amazon Redshift Cluster Management Guide.

``` swift
func createClusterParameterGroup(input: CreateClusterParameterGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateClusterParameterGroupOutputResponse, CreateClusterParameterGroupOutputError>) -> Void)
```

### createClusterSecurityGroup(input:​completion:​)

Creates a new Amazon Redshift security group. You use security groups to control access
to non-VPC clusters.

``` swift
func createClusterSecurityGroup(input: CreateClusterSecurityGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateClusterSecurityGroupOutputResponse, CreateClusterSecurityGroupOutputError>) -> Void)
```

For information about managing security groups, go to
<a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-security-groups.html">Amazon Redshift Cluster Security Groups in the
Amazon Redshift Cluster Management Guide.

### createClusterSnapshot(input:​completion:​)

Creates a manual snapshot of the specified cluster. The cluster must be in the
available state.

``` swift
func createClusterSnapshot(input: CreateClusterSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<CreateClusterSnapshotOutputResponse, CreateClusterSnapshotOutputError>) -> Void)
```

For more information about working with snapshots, go to
<a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-snapshots.html">Amazon Redshift Snapshots
in the Amazon Redshift Cluster Management Guide.

### createClusterSubnetGroup(input:​completion:​)

Creates a new Amazon Redshift subnet group. You must provide a list of one or more
subnets in your existing Amazon Virtual Private Cloud (Amazon VPC) when creating
Amazon Redshift subnet group.

``` swift
func createClusterSubnetGroup(input: CreateClusterSubnetGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateClusterSubnetGroupOutputResponse, CreateClusterSubnetGroupOutputError>) -> Void)
```

For information about subnet groups, go to
<a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-cluster-subnet-groups.html">Amazon Redshift Cluster Subnet Groups in the
Amazon Redshift Cluster Management Guide.

### createEndpointAccess(input:​completion:​)

Creates a Redshift-managed VPC endpoint.

``` swift
func createEndpointAccess(input: CreateEndpointAccessInput, completion: @escaping (ClientRuntime.SdkResult<CreateEndpointAccessOutputResponse, CreateEndpointAccessOutputError>) -> Void)
```

### createEventSubscription(input:​completion:​)

Creates an Amazon Redshift event notification subscription. This action requires an ARN
(Amazon Resource Name) of an Amazon SNS topic created by either the Amazon Redshift console,
the Amazon SNS console, or the Amazon SNS API. To obtain an ARN with Amazon SNS, you
must create a topic in Amazon SNS and subscribe to the topic. The ARN is displayed in
the SNS console.
You can specify the source type, and lists of Amazon Redshift source IDs, event
categories, and event severities. Notifications will be sent for all events you want
that match those criteria. For example, you can specify source type = cluster, source ID
\= my-cluster-1 and mycluster2, event categories = Availability, Backup, and severity =
ERROR. The subscription will only send notifications for those ERROR events in the
Availability and Backup categories for the specified clusters.
If you specify both the source type and source IDs, such as source type = cluster
and source identifier = my-cluster-1, notifications will be sent for all the cluster
events for my-cluster-1. If you specify a source type but do not specify a source
identifier, you will receive notice of the events for the objects of that type in your
Amazon Web Services account. If you do not specify either the SourceType nor the SourceIdentifier, you
will be notified of events generated from all Amazon Redshift sources belonging to your Amazon Web Services account. You must specify a source type if you specify a source ID.

``` swift
func createEventSubscription(input: CreateEventSubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<CreateEventSubscriptionOutputResponse, CreateEventSubscriptionOutputError>) -> Void)
```

### createHsmClientCertificate(input:​completion:​)

Creates an HSM client certificate that an Amazon Redshift cluster will use to connect to
the client's HSM in order to store and retrieve the keys used to encrypt the cluster
databases.
The command returns a public key, which you must store in the HSM. In addition to
creating the HSM certificate, you must create an Amazon Redshift HSM configuration that
provides a cluster the information needed to store and use encryption keys in the HSM.
For more information, go to <a href="https:​//docs.aws.amazon.com/redshift/latest/mgmt/working-with-db-encryption.html#working-with-HSM">Hardware Security Modules
in the Amazon Redshift Cluster Management Guide.

``` swift
func createHsmClientCertificate(input: CreateHsmClientCertificateInput, completion: @escaping (ClientRuntime.SdkResult<CreateHsmClientCertificateOutputResponse, CreateHsmClientCertificateOutputError>) -> Void)
```

### createHsmConfiguration(input:​completion:​)

Creates an HSM configuration that contains the information required by an Amazon Redshift
cluster to store and use database encryption keys in a Hardware Security Module (HSM).
After creating the HSM configuration, you can specify it as a parameter when creating a
cluster. The cluster will then store its encryption keys in the HSM.
In addition to creating an HSM configuration, you must also create an HSM client
certificate. For more information, go to <a href="https:​//docs.aws.amazon.com/redshift/latest/mgmt/working-with-HSM.html">Hardware Security Modules
in the Amazon Redshift Cluster Management Guide.

``` swift
func createHsmConfiguration(input: CreateHsmConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<CreateHsmConfigurationOutputResponse, CreateHsmConfigurationOutputError>) -> Void)
```

### createScheduledAction(input:​completion:​)

Creates a scheduled action. A scheduled action contains a schedule and an Amazon Redshift API action.
For example, you can create a schedule of when to run the ResizeCluster API operation.

``` swift
func createScheduledAction(input: CreateScheduledActionInput, completion: @escaping (ClientRuntime.SdkResult<CreateScheduledActionOutputResponse, CreateScheduledActionOutputError>) -> Void)
```

### createSnapshotCopyGrant(input:​completion:​)

Creates a snapshot copy grant that permits Amazon Redshift to use a customer master key
(CMK) from Key Management Service (KMS) to encrypt copied snapshots in a
destination region.

``` swift
func createSnapshotCopyGrant(input: CreateSnapshotCopyGrantInput, completion: @escaping (ClientRuntime.SdkResult<CreateSnapshotCopyGrantOutputResponse, CreateSnapshotCopyGrantOutputError>) -> Void)
```

For more information about managing snapshot copy grants, go to
<a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-db-encryption.html">Amazon Redshift Database Encryption
in the Amazon Redshift Cluster Management Guide.

### createSnapshotSchedule(input:​completion:​)

Create a snapshot schedule that can be associated to a cluster and which overrides the default system backup schedule.

``` swift
func createSnapshotSchedule(input: CreateSnapshotScheduleInput, completion: @escaping (ClientRuntime.SdkResult<CreateSnapshotScheduleOutputResponse, CreateSnapshotScheduleOutputError>) -> Void)
```

### createTags(input:​completion:​)

Adds tags to a cluster.
A resource can have up to 50 tags. If you try to create more than 50 tags for a
resource, you will receive an error and the attempt will fail.
If you specify a key that already exists for the resource, the value for that key
will be updated with the new value.

``` swift
func createTags(input: CreateTagsInput, completion: @escaping (ClientRuntime.SdkResult<CreateTagsOutputResponse, CreateTagsOutputError>) -> Void)
```

### createUsageLimit(input:​completion:​)

Creates a usage limit for a specified Amazon Redshift feature on a cluster.
The usage limit is identified by the returned usage limit identifier.

``` swift
func createUsageLimit(input: CreateUsageLimitInput, completion: @escaping (ClientRuntime.SdkResult<CreateUsageLimitOutputResponse, CreateUsageLimitOutputError>) -> Void)
```

### deauthorizeDataShare(input:​completion:​)

From the producer account, removes authorization from the specified datashare.

``` swift
func deauthorizeDataShare(input: DeauthorizeDataShareInput, completion: @escaping (ClientRuntime.SdkResult<DeauthorizeDataShareOutputResponse, DeauthorizeDataShareOutputError>) -> Void)
```

### deleteAuthenticationProfile(input:​completion:​)

Deletes an authentication profile.

``` swift
func deleteAuthenticationProfile(input: DeleteAuthenticationProfileInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAuthenticationProfileOutputResponse, DeleteAuthenticationProfileOutputError>) -> Void)
```

### deleteCluster(input:​completion:​)

Deletes a previously provisioned cluster without its final snapshot being created. A successful response from the web
service indicates that the request was received correctly. Use DescribeClusters to monitor the status of the deletion. The delete
operation cannot be canceled or reverted once submitted.
For more information about managing clusters, go to
<a href="https:​//docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html">Amazon Redshift Clusters
in the Amazon Redshift Cluster Management Guide.
If you want to shut down the cluster and retain it for future use, set
SkipFinalClusterSnapshot to false and specify a
name for FinalClusterSnapshotIdentifier. You can later restore this
snapshot to resume using the cluster. If a final cluster snapshot is requested, the
status of the cluster will be "final-snapshot" while the snapshot is being taken, then
it's "deleting" once Amazon Redshift begins deleting the cluster.

``` swift
func deleteCluster(input: DeleteClusterInput, completion: @escaping (ClientRuntime.SdkResult<DeleteClusterOutputResponse, DeleteClusterOutputError>) -> Void)
```

For more information about managing clusters, go to
<a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html">Amazon Redshift Clusters
in the Amazon Redshift Cluster Management Guide.

### deleteClusterParameterGroup(input:​completion:​)

Deletes a specified Amazon Redshift parameter group.

``` swift
func deleteClusterParameterGroup(input: DeleteClusterParameterGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteClusterParameterGroupOutputResponse, DeleteClusterParameterGroupOutputError>) -> Void)
```

``` 
        You cannot delete a parameter group if it is associated with a
            cluster.
```

### deleteClusterSecurityGroup(input:​completion:​)

Deletes an Amazon Redshift security group.

``` swift
func deleteClusterSecurityGroup(input: DeleteClusterSecurityGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteClusterSecurityGroupOutputResponse, DeleteClusterSecurityGroupOutputError>) -> Void)
```

``` 
        You cannot delete a security group that is associated with any clusters. You
            cannot delete the default security group.
```

For information about managing security groups, go to
<a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-security-groups.html">Amazon Redshift Cluster Security Groups in the
Amazon Redshift Cluster Management Guide.

### deleteClusterSnapshot(input:​completion:​)

Deletes the specified manual snapshot. The snapshot must be in the
available state, with no other users authorized to access the snapshot.
Unlike automated snapshots, manual snapshots are retained even after you delete
your cluster. Amazon Redshift does not delete your manual snapshots. You must delete manual
snapshot explicitly to avoid getting charged. If other accounts are authorized to access
the snapshot, you must revoke all of the authorizations before you can delete the
snapshot.

``` swift
func deleteClusterSnapshot(input: DeleteClusterSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<DeleteClusterSnapshotOutputResponse, DeleteClusterSnapshotOutputError>) -> Void)
```

### deleteClusterSubnetGroup(input:​completion:​)

Deletes the specified cluster subnet group.

``` swift
func deleteClusterSubnetGroup(input: DeleteClusterSubnetGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteClusterSubnetGroupOutputResponse, DeleteClusterSubnetGroupOutputError>) -> Void)
```

### deleteEndpointAccess(input:​completion:​)

Deletes a Redshift-managed VPC endpoint.

``` swift
func deleteEndpointAccess(input: DeleteEndpointAccessInput, completion: @escaping (ClientRuntime.SdkResult<DeleteEndpointAccessOutputResponse, DeleteEndpointAccessOutputError>) -> Void)
```

### deleteEventSubscription(input:​completion:​)

Deletes an Amazon Redshift event notification subscription.

``` swift
func deleteEventSubscription(input: DeleteEventSubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteEventSubscriptionOutputResponse, DeleteEventSubscriptionOutputError>) -> Void)
```

### deleteHsmClientCertificate(input:​completion:​)

Deletes the specified HSM client certificate.

``` swift
func deleteHsmClientCertificate(input: DeleteHsmClientCertificateInput, completion: @escaping (ClientRuntime.SdkResult<DeleteHsmClientCertificateOutputResponse, DeleteHsmClientCertificateOutputError>) -> Void)
```

### deleteHsmConfiguration(input:​completion:​)

Deletes the specified Amazon Redshift HSM configuration.

``` swift
func deleteHsmConfiguration(input: DeleteHsmConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteHsmConfigurationOutputResponse, DeleteHsmConfigurationOutputError>) -> Void)
```

### deletePartner(input:​completion:​)

Deletes a partner integration from a cluster. Data can still flow to the cluster until the integration is deleted at the partner's website.

``` swift
func deletePartner(input: DeletePartnerInput, completion: @escaping (ClientRuntime.SdkResult<DeletePartnerOutputResponse, DeletePartnerOutputError>) -> Void)
```

### deleteScheduledAction(input:​completion:​)

Deletes a scheduled action.

``` swift
func deleteScheduledAction(input: DeleteScheduledActionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteScheduledActionOutputResponse, DeleteScheduledActionOutputError>) -> Void)
```

### deleteSnapshotCopyGrant(input:​completion:​)

Deletes the specified snapshot copy grant.

``` swift
func deleteSnapshotCopyGrant(input: DeleteSnapshotCopyGrantInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSnapshotCopyGrantOutputResponse, DeleteSnapshotCopyGrantOutputError>) -> Void)
```

### deleteSnapshotSchedule(input:​completion:​)

Deletes a snapshot schedule.

``` swift
func deleteSnapshotSchedule(input: DeleteSnapshotScheduleInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSnapshotScheduleOutputResponse, DeleteSnapshotScheduleOutputError>) -> Void)
```

### deleteTags(input:​completion:​)

Deletes tags from a resource. You must provide the ARN of the resource
from which you want to delete the tag or tags.

``` swift
func deleteTags(input: DeleteTagsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTagsOutputResponse, DeleteTagsOutputError>) -> Void)
```

### deleteUsageLimit(input:​completion:​)

Deletes a usage limit from a cluster.

``` swift
func deleteUsageLimit(input: DeleteUsageLimitInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUsageLimitOutputResponse, DeleteUsageLimitOutputError>) -> Void)
```

### describeAccountAttributes(input:​completion:​)

Returns a list of attributes attached to an account

``` swift
func describeAccountAttributes(input: DescribeAccountAttributesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAccountAttributesOutputResponse, DescribeAccountAttributesOutputError>) -> Void)
```

### describeAuthenticationProfiles(input:​completion:​)

Describes an authentication profile.

``` swift
func describeAuthenticationProfiles(input: DescribeAuthenticationProfilesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAuthenticationProfilesOutputResponse, DescribeAuthenticationProfilesOutputError>) -> Void)
```

### describeClusterDbRevisions(input:​completion:​)

Returns an array of ClusterDbRevision objects.

``` swift
func describeClusterDbRevisions(input: DescribeClusterDbRevisionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeClusterDbRevisionsOutputResponse, DescribeClusterDbRevisionsOutputError>) -> Void)
```

### describeClusterParameterGroups(input:​completion:​)

Returns a list of Amazon Redshift parameter groups, including parameter groups you
created and the default parameter group. For each parameter group, the response includes
the parameter group name, description, and parameter group family name. You can
optionally specify a name to retrieve the description of a specific parameter
group.

``` swift
func describeClusterParameterGroups(input: DescribeClusterParameterGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeClusterParameterGroupsOutputResponse, DescribeClusterParameterGroupsOutputError>) -> Void)
```

For more information about parameters and parameter groups, go to
<a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html">Amazon Redshift Parameter Groups
in the Amazon Redshift Cluster Management Guide.
If you specify both tag keys and tag values in the same request, Amazon Redshift returns
all parameter groups that match any combination of the specified keys and values. For
example, if you have owner and environment for tag keys, and
admin and test for tag values, all parameter groups that
have any combination of those values are returned.
If both tag keys and values are omitted from the request, parameter groups are
returned regardless of whether they have tag keys or values associated with
them.

### describeClusterParameters(input:​completion:​)

Returns a detailed list of parameters contained within the specified Amazon Redshift
parameter group. For each parameter the response includes information such as parameter
name, description, data type, value, whether the parameter value is modifiable, and so
on.
You can specify source filter to retrieve parameters of only
specific type. For example, to retrieve parameters that were modified by a user action
such as from ModifyClusterParameterGroup, you can specify
source equal to user.

``` swift
func describeClusterParameters(input: DescribeClusterParametersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeClusterParametersOutputResponse, DescribeClusterParametersOutputError>) -> Void)
```

For more information about parameters and parameter groups, go to
<a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html">Amazon Redshift Parameter Groups
in the Amazon Redshift Cluster Management Guide.

### describeClusters(input:​completion:​)

Returns properties of provisioned clusters including general cluster properties,
cluster database properties, maintenance and backup properties, and security and access
properties. This operation supports pagination.
For more information about managing clusters, go to
<a href="https:​//docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html">Amazon Redshift Clusters
in the Amazon Redshift Cluster Management Guide.
If you specify both tag keys and tag values in the same request, Amazon Redshift returns
all clusters that match any combination of the specified keys and values. For example,
if you have owner and environment for tag keys, and
admin and test for tag values, all clusters that have any
combination of those values are returned.
If both tag keys and values are omitted from the request, clusters are returned
regardless of whether they have tag keys or values associated with them.

``` swift
func describeClusters(input: DescribeClustersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeClustersOutputResponse, DescribeClustersOutputError>) -> Void)
```

### describeClusterSecurityGroups(input:​completion:​)

Returns information about Amazon Redshift security groups. If the name of a security
group is specified, the response will contain only information about only that security
group.

``` swift
func describeClusterSecurityGroups(input: DescribeClusterSecurityGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeClusterSecurityGroupsOutputResponse, DescribeClusterSecurityGroupsOutputError>) -> Void)
```

For information about managing security groups, go to
<a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-security-groups.html">Amazon Redshift Cluster Security Groups in the
Amazon Redshift Cluster Management Guide.
If you specify both tag keys and tag values in the same request, Amazon Redshift returns
all security groups that match any combination of the specified keys and values. For
example, if you have owner and environment for tag keys, and
admin and test for tag values, all security groups that
have any combination of those values are returned.
If both tag keys and values are omitted from the request, security groups are
returned regardless of whether they have tag keys or values associated with
them.

### describeClusterSnapshots(input:​completion:​)

Returns one or more snapshot objects, which contain metadata about your cluster
snapshots. By default, this operation returns information about all snapshots of all
clusters that are owned by your Amazon Web Services account. No information is returned for
snapshots owned by inactive Amazon Web Services accounts.
If you specify both tag keys and tag values in the same request, Amazon Redshift returns
all snapshots that match any combination of the specified keys and values. For example,
if you have owner and environment for tag keys, and
admin and test for tag values, all snapshots that have any
combination of those values are returned. Only snapshots that you own are returned in
the response; shared snapshots are not returned with the tag key and tag value request
parameters.
If both tag keys and values are omitted from the request, snapshots are returned
regardless of whether they have tag keys or values associated with them.

``` swift
func describeClusterSnapshots(input: DescribeClusterSnapshotsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeClusterSnapshotsOutputResponse, DescribeClusterSnapshotsOutputError>) -> Void)
```

### describeClusterSubnetGroups(input:​completion:​)

Returns one or more cluster subnet group objects, which contain metadata about your
cluster subnet groups. By default, this operation returns information about all cluster
subnet groups that are defined in your Amazon Web Services account.
If you specify both tag keys and tag values in the same request, Amazon Redshift returns
all subnet groups that match any combination of the specified keys and values. For
example, if you have owner and environment for tag keys, and
admin and test for tag values, all subnet groups that have
any combination of those values are returned.
If both tag keys and values are omitted from the request, subnet groups are
returned regardless of whether they have tag keys or values associated with
them.

``` swift
func describeClusterSubnetGroups(input: DescribeClusterSubnetGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeClusterSubnetGroupsOutputResponse, DescribeClusterSubnetGroupsOutputError>) -> Void)
```

### describeClusterTracks(input:​completion:​)

Returns a list of all the available maintenance tracks.

``` swift
func describeClusterTracks(input: DescribeClusterTracksInput, completion: @escaping (ClientRuntime.SdkResult<DescribeClusterTracksOutputResponse, DescribeClusterTracksOutputError>) -> Void)
```

### describeClusterVersions(input:​completion:​)

Returns descriptions of the available Amazon Redshift cluster versions. You can call this
operation even before creating any clusters to learn more about the Amazon Redshift versions.

``` swift
func describeClusterVersions(input: DescribeClusterVersionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeClusterVersionsOutputResponse, DescribeClusterVersionsOutputError>) -> Void)
```

For more information about managing clusters, go to
<a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html">Amazon Redshift Clusters
in the Amazon Redshift Cluster Management Guide.

### describeDataShares(input:​completion:​)

Shows the status of any inbound or outbound datashares available in the specified
account.

``` swift
func describeDataShares(input: DescribeDataSharesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDataSharesOutputResponse, DescribeDataSharesOutputError>) -> Void)
```

### describeDataSharesForConsumer(input:​completion:​)

Returns a list of datashares where the account identifier being called is a consumer account identifier.

``` swift
func describeDataSharesForConsumer(input: DescribeDataSharesForConsumerInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDataSharesForConsumerOutputResponse, DescribeDataSharesForConsumerOutputError>) -> Void)
```

### describeDataSharesForProducer(input:​completion:​)

Returns a list of datashares when the account identifier being called is a producer account identifier.

``` swift
func describeDataSharesForProducer(input: DescribeDataSharesForProducerInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDataSharesForProducerOutputResponse, DescribeDataSharesForProducerOutputError>) -> Void)
```

### describeDefaultClusterParameters(input:​completion:​)

Returns a list of parameter settings for the specified parameter group
family.

``` swift
func describeDefaultClusterParameters(input: DescribeDefaultClusterParametersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDefaultClusterParametersOutputResponse, DescribeDefaultClusterParametersOutputError>) -> Void)
```

For more information about parameters and parameter groups, go to
<a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html">Amazon Redshift Parameter Groups
in the Amazon Redshift Cluster Management Guide.

### describeEndpointAccess(input:​completion:​)

Describes a Redshift-managed VPC endpoint.

``` swift
func describeEndpointAccess(input: DescribeEndpointAccessInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEndpointAccessOutputResponse, DescribeEndpointAccessOutputError>) -> Void)
```

### describeEndpointAuthorization(input:​completion:​)

Describes an endpoint authorization.

``` swift
func describeEndpointAuthorization(input: DescribeEndpointAuthorizationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEndpointAuthorizationOutputResponse, DescribeEndpointAuthorizationOutputError>) -> Void)
```

### describeEventCategories(input:​completion:​)

Displays a list of event categories for all event source types, or for a specified
source type. For a list of the event categories and source types, go to <a href="https:​//docs.aws.amazon.com/redshift/latest/mgmt/working-with-event-notifications.html">Amazon Redshift Event
Notifications.

``` swift
func describeEventCategories(input: DescribeEventCategoriesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEventCategoriesOutputResponse, DescribeEventCategoriesOutputError>) -> Void)
```

### describeEvents(input:​completion:​)

Returns events related to clusters, security groups, snapshots, and parameter
groups for the past 14 days. Events specific to a particular cluster, security group,
snapshot or parameter group can be obtained by providing the name as a parameter. By
default, the past hour of events are returned.

``` swift
func describeEvents(input: DescribeEventsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEventsOutputResponse, DescribeEventsOutputError>) -> Void)
```

### describeEventSubscriptions(input:​completion:​)

Lists descriptions of all the Amazon Redshift event notification subscriptions for a
customer account. If you specify a subscription name, lists the description for that
subscription.
If you specify both tag keys and tag values in the same request, Amazon Redshift returns
all event notification subscriptions that match any combination of the specified keys
and values. For example, if you have owner and environment for
tag keys, and admin and test for tag values, all subscriptions
that have any combination of those values are returned.
If both tag keys and values are omitted from the request, subscriptions are
returned regardless of whether they have tag keys or values associated with
them.

``` swift
func describeEventSubscriptions(input: DescribeEventSubscriptionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEventSubscriptionsOutputResponse, DescribeEventSubscriptionsOutputError>) -> Void)
```

### describeHsmClientCertificates(input:​completion:​)

Returns information about the specified HSM client certificate. If no certificate
ID is specified, returns information about all the HSM certificates owned by your Amazon Web Services account.
If you specify both tag keys and tag values in the same request, Amazon Redshift returns
all HSM client certificates that match any combination of the specified keys and values.
For example, if you have owner and environment for tag keys,
and admin and test for tag values, all HSM client certificates
that have any combination of those values are returned.
If both tag keys and values are omitted from the request, HSM client certificates
are returned regardless of whether they have tag keys or values associated with
them.

``` swift
func describeHsmClientCertificates(input: DescribeHsmClientCertificatesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeHsmClientCertificatesOutputResponse, DescribeHsmClientCertificatesOutputError>) -> Void)
```

### describeHsmConfigurations(input:​completion:​)

Returns information about the specified Amazon Redshift HSM configuration. If no
configuration ID is specified, returns information about all the HSM configurations
owned by your Amazon Web Services account.
If you specify both tag keys and tag values in the same request, Amazon Redshift returns
all HSM connections that match any combination of the specified keys and values. For
example, if you have owner and environment for tag keys, and
admin and test for tag values, all HSM connections that
have any combination of those values are returned.
If both tag keys and values are omitted from the request, HSM connections are
returned regardless of whether they have tag keys or values associated with
them.

``` swift
func describeHsmConfigurations(input: DescribeHsmConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeHsmConfigurationsOutputResponse, DescribeHsmConfigurationsOutputError>) -> Void)
```

### describeLoggingStatus(input:​completion:​)

Describes whether information, such as queries and connection attempts, is being
logged for the specified Amazon Redshift cluster.

``` swift
func describeLoggingStatus(input: DescribeLoggingStatusInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLoggingStatusOutputResponse, DescribeLoggingStatusOutputError>) -> Void)
```

### describeNodeConfigurationOptions(input:​completion:​)

Returns properties of possible node configurations such as node type, number of nodes, and
disk usage for the specified action type.

``` swift
func describeNodeConfigurationOptions(input: DescribeNodeConfigurationOptionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeNodeConfigurationOptionsOutputResponse, DescribeNodeConfigurationOptionsOutputError>) -> Void)
```

### describeOrderableClusterOptions(input:​completion:​)

Returns a list of orderable cluster options. Before you create a new cluster you
can use this operation to find what options are available, such as the EC2 Availability
Zones (AZ) in the specific Amazon Web Services Region that you can specify, and the node types you can
request. The node types differ by available storage, memory, CPU and price. With the
cost involved you might want to obtain a list of cluster options in the specific region
and specify values when creating a cluster.
For more information about managing clusters, go to
<a href="https:​//docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html">Amazon Redshift Clusters
in the Amazon Redshift Cluster Management Guide.

``` swift
func describeOrderableClusterOptions(input: DescribeOrderableClusterOptionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeOrderableClusterOptionsOutputResponse, DescribeOrderableClusterOptionsOutputError>) -> Void)
```

### describePartners(input:​completion:​)

Returns information about the partner integrations defined for a cluster.

``` swift
func describePartners(input: DescribePartnersInput, completion: @escaping (ClientRuntime.SdkResult<DescribePartnersOutputResponse, DescribePartnersOutputError>) -> Void)
```

### describeReservedNodeOfferings(input:​completion:​)

Returns a list of the available reserved node offerings by Amazon Redshift with their
descriptions including the node type, the fixed and recurring costs of reserving the
node and duration the node will be reserved for you. These descriptions help you
determine which reserve node offering you want to purchase. You then use the unique
offering ID in you call to PurchaseReservedNodeOffering to reserve one
or more nodes for your Amazon Redshift cluster.

``` swift
func describeReservedNodeOfferings(input: DescribeReservedNodeOfferingsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeReservedNodeOfferingsOutputResponse, DescribeReservedNodeOfferingsOutputError>) -> Void)
```

For more information about reserved node offerings, go to
<a href="https://docs.aws.amazon.com/redshift/latest/mgmt/purchase-reserved-node-instance.html">Purchasing Reserved Nodes
in the Amazon Redshift Cluster Management Guide.

### describeReservedNodes(input:​completion:​)

Returns the descriptions of the reserved nodes.

``` swift
func describeReservedNodes(input: DescribeReservedNodesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeReservedNodesOutputResponse, DescribeReservedNodesOutputError>) -> Void)
```

### describeResize(input:​completion:​)

Returns information about the last resize operation for the specified cluster. If
no resize operation has ever been initiated for the specified cluster, a HTTP
404 error is returned. If a resize operation was initiated and completed, the
status of the resize remains as SUCCEEDED until the next resize.
A resize operation can be requested using ModifyCluster and
specifying a different number or type of nodes for the cluster.

``` swift
func describeResize(input: DescribeResizeInput, completion: @escaping (ClientRuntime.SdkResult<DescribeResizeOutputResponse, DescribeResizeOutputError>) -> Void)
```

### describeScheduledActions(input:​completion:​)

Describes properties of scheduled actions.

``` swift
func describeScheduledActions(input: DescribeScheduledActionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeScheduledActionsOutputResponse, DescribeScheduledActionsOutputError>) -> Void)
```

### describeSnapshotCopyGrants(input:​completion:​)

Returns a list of snapshot copy grants owned by the Amazon Web Services account in the destination
region.

``` swift
func describeSnapshotCopyGrants(input: DescribeSnapshotCopyGrantsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSnapshotCopyGrantsOutputResponse, DescribeSnapshotCopyGrantsOutputError>) -> Void)
```

For more information about managing snapshot copy grants, go to
<a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-db-encryption.html">Amazon Redshift Database Encryption
in the Amazon Redshift Cluster Management Guide.

### describeSnapshotSchedules(input:​completion:​)

Returns a list of snapshot schedules.

``` swift
func describeSnapshotSchedules(input: DescribeSnapshotSchedulesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSnapshotSchedulesOutputResponse, DescribeSnapshotSchedulesOutputError>) -> Void)
```

### describeStorage(input:​completion:​)

Returns account level backups storage size and provisional storage.

``` swift
func describeStorage(input: DescribeStorageInput, completion: @escaping (ClientRuntime.SdkResult<DescribeStorageOutputResponse, DescribeStorageOutputError>) -> Void)
```

### describeTableRestoreStatus(input:​completion:​)

Lists the status of one or more table restore requests made using the RestoreTableFromClusterSnapshot API action. If you don't specify a value
for the TableRestoreRequestId parameter, then
DescribeTableRestoreStatus returns the status of all table restore
requests ordered by the date and time of the request in ascending order. Otherwise
DescribeTableRestoreStatus returns the status of the table specified by
TableRestoreRequestId.

``` swift
func describeTableRestoreStatus(input: DescribeTableRestoreStatusInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTableRestoreStatusOutputResponse, DescribeTableRestoreStatusOutputError>) -> Void)
```

### describeTags(input:​completion:​)

Returns a list of tags. You can return tags from a specific resource by specifying
an ARN, or you can return all tags for a given type of resource, such as clusters,
snapshots, and so on.
The following are limitations for DescribeTags:​

``` swift
func describeTags(input: DescribeTagsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTagsOutputResponse, DescribeTagsOutputError>) -> Void)
```

``` 
            You cannot specify an ARN and a resource-type value together in the same
                request.


            You cannot use the MaxRecords and Marker
                parameters together with the ARN parameter.


            The MaxRecords parameter can be a range from 10 to 50 results
                to return in a request.


    If you specify both tag keys and tag values in the same request, Amazon Redshift returns
        all resources that match any combination of the specified keys and values. For example,
        if you have owner and environment for tag keys, and
            admin and test for tag values, all resources that have any
        combination of those values are returned.
    If both tag keys and values are omitted from the request, resources are returned
        regardless of whether they have tag keys or values associated with them.
```

### describeUsageLimits(input:​completion:​)

Shows usage limits on a cluster.
Results are filtered based on the combination of input usage limit identifier, cluster identifier, and feature type parameters:​

``` swift
func describeUsageLimits(input: DescribeUsageLimitsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeUsageLimitsOutputResponse, DescribeUsageLimitsOutputError>) -> Void)
```

``` 
           If usage limit identifier, cluster identifier, and feature type are not provided,
            then all usage limit objects for the current account in the current region are returned.


           If usage limit identifier is provided,
            then the corresponding usage limit object is returned.


           If cluster identifier is provided,
            then all usage limit objects for the specified cluster are returned.


           If cluster identifier and feature type are provided,
            then all usage limit objects for the combination of cluster and feature are returned.
```

### disableLogging(input:​completion:​)

Stops logging information, such as queries and connection attempts, for the
specified Amazon Redshift cluster.

``` swift
func disableLogging(input: DisableLoggingInput, completion: @escaping (ClientRuntime.SdkResult<DisableLoggingOutputResponse, DisableLoggingOutputError>) -> Void)
```

### disableSnapshotCopy(input:​completion:​)

Disables the automatic copying of snapshots from one region to another region for a
specified cluster.
If your cluster and its snapshots are encrypted using a customer master key (CMK)
from Key Management Service, use DeleteSnapshotCopyGrant to delete the grant that
grants Amazon Redshift permission to the CMK in the destination region.

``` swift
func disableSnapshotCopy(input: DisableSnapshotCopyInput, completion: @escaping (ClientRuntime.SdkResult<DisableSnapshotCopyOutputResponse, DisableSnapshotCopyOutputError>) -> Void)
```

### disassociateDataShareConsumer(input:​completion:​)

From a consumer account, remove association for the specified datashare.

``` swift
func disassociateDataShareConsumer(input: DisassociateDataShareConsumerInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateDataShareConsumerOutputResponse, DisassociateDataShareConsumerOutputError>) -> Void)
```

### enableLogging(input:​completion:​)

Starts logging information, such as queries and connection attempts, for the
specified Amazon Redshift cluster.

``` swift
func enableLogging(input: EnableLoggingInput, completion: @escaping (ClientRuntime.SdkResult<EnableLoggingOutputResponse, EnableLoggingOutputError>) -> Void)
```

### enableSnapshotCopy(input:​completion:​)

Enables the automatic copy of snapshots from one region to another region for a
specified cluster.

``` swift
func enableSnapshotCopy(input: EnableSnapshotCopyInput, completion: @escaping (ClientRuntime.SdkResult<EnableSnapshotCopyOutputResponse, EnableSnapshotCopyOutputError>) -> Void)
```

### getClusterCredentials(input:​completion:​)

Returns a database user name and temporary password with temporary authorization to
log on to an Amazon Redshift database. The action returns the database user name
prefixed with IAM:​ if AutoCreate is False or
IAMA:​ if AutoCreate is True. You can
optionally specify one or more database user groups that the user will join at log on.
By default, the temporary credentials expire in 900 seconds. You can optionally specify
a duration between 900 seconds (15 minutes) and 3600 seconds (60 minutes). For more
information, see <a href="https:​//docs.aws.amazon.com/redshift/latest/mgmt/generating-user-credentials.html">Using IAM Authentication
to Generate Database User Credentials in the Amazon Redshift Cluster Management Guide.
The Identity and Access Management (IAM) user or role that runs
GetClusterCredentials must have an IAM policy attached that allows access to all
necessary actions and resources. For more information about permissions, see <a href="https:​//docs.aws.amazon.com/redshift/latest/mgmt/redshift-iam-access-control-identity-based.html#redshift-policy-resources.getclustercredentials-resources">Resource Policies for GetClusterCredentials in the
Amazon Redshift Cluster Management Guide.
If the DbGroups parameter is specified, the IAM policy must allow the
redshift:​JoinGroup action with access to the listed
dbgroups.
In addition, if the AutoCreate parameter is set to True,
then the policy must include the redshift:​CreateClusterUser
privilege.
If the DbName parameter is specified, the IAM policy must allow access
to the resource dbname for the specified database name.

``` swift
func getClusterCredentials(input: GetClusterCredentialsInput, completion: @escaping (ClientRuntime.SdkResult<GetClusterCredentialsOutputResponse, GetClusterCredentialsOutputError>) -> Void)
```

### getReservedNodeExchangeOfferings(input:​completion:​)

Returns an array of DC2 ReservedNodeOfferings that matches the payment type, term,
and usage price of the given DC1 reserved node.

``` swift
func getReservedNodeExchangeOfferings(input: GetReservedNodeExchangeOfferingsInput, completion: @escaping (ClientRuntime.SdkResult<GetReservedNodeExchangeOfferingsOutputResponse, GetReservedNodeExchangeOfferingsOutputError>) -> Void)
```

### modifyAquaConfiguration(input:​completion:​)

Modifies whether a cluster can use AQUA (Advanced Query Accelerator).

``` swift
func modifyAquaConfiguration(input: ModifyAquaConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<ModifyAquaConfigurationOutputResponse, ModifyAquaConfigurationOutputError>) -> Void)
```

### modifyAuthenticationProfile(input:​completion:​)

Modifies an authentication profile.

``` swift
func modifyAuthenticationProfile(input: ModifyAuthenticationProfileInput, completion: @escaping (ClientRuntime.SdkResult<ModifyAuthenticationProfileOutputResponse, ModifyAuthenticationProfileOutputError>) -> Void)
```

### modifyCluster(input:​completion:​)

Modifies the settings for a cluster.
You can also change node type and the number of nodes to scale up or down the
cluster. When resizing a cluster, you must specify both the number of nodes and the node
type even if one of the parameters does not change.
You can add another security or
parameter group, or change the admin user password. Resetting a cluster password or modifying the security groups associated with a cluster do not need a reboot. However, modifying a parameter group requires a reboot for parameters to take effect.
For more information about managing clusters, go to
<a href="https:​//docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html">Amazon Redshift Clusters
in the Amazon Redshift Cluster Management Guide.

``` swift
func modifyCluster(input: ModifyClusterInput, completion: @escaping (ClientRuntime.SdkResult<ModifyClusterOutputResponse, ModifyClusterOutputError>) -> Void)
```

### modifyClusterDbRevision(input:​completion:​)

Modifies the database revision of a cluster. The database revision is a unique
revision of the database running in a cluster.

``` swift
func modifyClusterDbRevision(input: ModifyClusterDbRevisionInput, completion: @escaping (ClientRuntime.SdkResult<ModifyClusterDbRevisionOutputResponse, ModifyClusterDbRevisionOutputError>) -> Void)
```

### modifyClusterIamRoles(input:​completion:​)

Modifies the list of Identity and Access Management (IAM) roles that can be
used by the cluster to access other Amazon Web Services services.
A cluster can have up to 10 IAM roles associated at any time.

``` swift
func modifyClusterIamRoles(input: ModifyClusterIamRolesInput, completion: @escaping (ClientRuntime.SdkResult<ModifyClusterIamRolesOutputResponse, ModifyClusterIamRolesOutputError>) -> Void)
```

### modifyClusterMaintenance(input:​completion:​)

Modifies the maintenance settings of a cluster.

``` swift
func modifyClusterMaintenance(input: ModifyClusterMaintenanceInput, completion: @escaping (ClientRuntime.SdkResult<ModifyClusterMaintenanceOutputResponse, ModifyClusterMaintenanceOutputError>) -> Void)
```

### modifyClusterParameterGroup(input:​completion:​)

Modifies the parameters of a parameter group. For the parameters parameter, it can't contain ASCII characters.

``` swift
func modifyClusterParameterGroup(input: ModifyClusterParameterGroupInput, completion: @escaping (ClientRuntime.SdkResult<ModifyClusterParameterGroupOutputResponse, ModifyClusterParameterGroupOutputError>) -> Void)
```

For more information about parameters and parameter groups, go to
<a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html">Amazon Redshift Parameter Groups
in the Amazon Redshift Cluster Management Guide.

### modifyClusterSnapshot(input:​completion:​)

Modifies the settings for a snapshot.
This exanmple modifies the manual retention period setting for a cluster snapshot.

``` swift
func modifyClusterSnapshot(input: ModifyClusterSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<ModifyClusterSnapshotOutputResponse, ModifyClusterSnapshotOutputError>) -> Void)
```

### modifyClusterSnapshotSchedule(input:​completion:​)

Modifies a snapshot schedule for a cluster.

``` swift
func modifyClusterSnapshotSchedule(input: ModifyClusterSnapshotScheduleInput, completion: @escaping (ClientRuntime.SdkResult<ModifyClusterSnapshotScheduleOutputResponse, ModifyClusterSnapshotScheduleOutputError>) -> Void)
```

### modifyClusterSubnetGroup(input:​completion:​)

Modifies a cluster subnet group to include the specified list of VPC subnets. The
operation replaces the existing list of subnets with the new list of subnets.

``` swift
func modifyClusterSubnetGroup(input: ModifyClusterSubnetGroupInput, completion: @escaping (ClientRuntime.SdkResult<ModifyClusterSubnetGroupOutputResponse, ModifyClusterSubnetGroupOutputError>) -> Void)
```

### modifyEndpointAccess(input:​completion:​)

Modifies a Redshift-managed VPC endpoint.

``` swift
func modifyEndpointAccess(input: ModifyEndpointAccessInput, completion: @escaping (ClientRuntime.SdkResult<ModifyEndpointAccessOutputResponse, ModifyEndpointAccessOutputError>) -> Void)
```

### modifyEventSubscription(input:​completion:​)

Modifies an existing Amazon Redshift event notification subscription.

``` swift
func modifyEventSubscription(input: ModifyEventSubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<ModifyEventSubscriptionOutputResponse, ModifyEventSubscriptionOutputError>) -> Void)
```

### modifyScheduledAction(input:​completion:​)

Modifies a scheduled action.

``` swift
func modifyScheduledAction(input: ModifyScheduledActionInput, completion: @escaping (ClientRuntime.SdkResult<ModifyScheduledActionOutputResponse, ModifyScheduledActionOutputError>) -> Void)
```

### modifySnapshotCopyRetentionPeriod(input:​completion:​)

Modifies the number of days to retain snapshots in the destination Amazon Web Services Region after
they are copied from the source Amazon Web Services Region. By default, this operation only changes the
retention period of copied automated snapshots. The retention periods for both new and
existing copied automated snapshots are updated with the new retention period. You can
set the manual option to change only the retention periods of copied manual snapshots.
If you set this option, only newly copied manual snapshots have the new retention
period.

``` swift
func modifySnapshotCopyRetentionPeriod(input: ModifySnapshotCopyRetentionPeriodInput, completion: @escaping (ClientRuntime.SdkResult<ModifySnapshotCopyRetentionPeriodOutputResponse, ModifySnapshotCopyRetentionPeriodOutputError>) -> Void)
```

### modifySnapshotSchedule(input:​completion:​)

Modifies a snapshot schedule. Any schedule associated with a cluster is modified
asynchronously.

``` swift
func modifySnapshotSchedule(input: ModifySnapshotScheduleInput, completion: @escaping (ClientRuntime.SdkResult<ModifySnapshotScheduleOutputResponse, ModifySnapshotScheduleOutputError>) -> Void)
```

### modifyUsageLimit(input:​completion:​)

Modifies a usage limit in a cluster.
You can't modify the feature type or period of a usage limit.

``` swift
func modifyUsageLimit(input: ModifyUsageLimitInput, completion: @escaping (ClientRuntime.SdkResult<ModifyUsageLimitOutputResponse, ModifyUsageLimitOutputError>) -> Void)
```

### pauseCluster(input:​completion:​)

Pauses a cluster.

``` swift
func pauseCluster(input: PauseClusterInput, completion: @escaping (ClientRuntime.SdkResult<PauseClusterOutputResponse, PauseClusterOutputError>) -> Void)
```

### purchaseReservedNodeOffering(input:​completion:​)

Allows you to purchase reserved nodes. Amazon Redshift offers a predefined set of
reserved node offerings. You can purchase one or more of the offerings. You can call the
DescribeReservedNodeOfferings API to obtain the available reserved
node offerings. You can call this API by providing a specific reserved node offering and
the number of nodes you want to reserve.

``` swift
func purchaseReservedNodeOffering(input: PurchaseReservedNodeOfferingInput, completion: @escaping (ClientRuntime.SdkResult<PurchaseReservedNodeOfferingOutputResponse, PurchaseReservedNodeOfferingOutputError>) -> Void)
```

For more information about reserved node offerings, go to
<a href="https://docs.aws.amazon.com/redshift/latest/mgmt/purchase-reserved-node-instance.html">Purchasing Reserved Nodes
in the Amazon Redshift Cluster Management Guide.

### rebootCluster(input:​completion:​)

Reboots a cluster. This action is taken as soon as possible. It results in a
momentary outage to the cluster, during which the cluster status is set to
rebooting. A cluster event is created when the reboot is completed. Any
pending cluster modifications (see ModifyCluster) are applied at this
reboot.
For more information about managing clusters, go to
<a href="https:​//docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html">Amazon Redshift Clusters
in the Amazon Redshift Cluster Management Guide.

``` swift
func rebootCluster(input: RebootClusterInput, completion: @escaping (ClientRuntime.SdkResult<RebootClusterOutputResponse, RebootClusterOutputError>) -> Void)
```

### rejectDataShare(input:​completion:​)

From the consumer account, rejects the specified datashare.

``` swift
func rejectDataShare(input: RejectDataShareInput, completion: @escaping (ClientRuntime.SdkResult<RejectDataShareOutputResponse, RejectDataShareOutputError>) -> Void)
```

### resetClusterParameterGroup(input:​completion:​)

Sets one or more parameters of the specified parameter group to their default
values and sets the source values of the parameters to "engine-default". To reset the
entire parameter group specify the ResetAllParameters parameter.
For parameter changes to take effect you must reboot any associated clusters.

``` swift
func resetClusterParameterGroup(input: ResetClusterParameterGroupInput, completion: @escaping (ClientRuntime.SdkResult<ResetClusterParameterGroupOutputResponse, ResetClusterParameterGroupOutputError>) -> Void)
```

### resizeCluster(input:​completion:​)

Changes the size of the cluster. You can change the cluster's type, or change the
number or type of nodes. The default behavior is to use the elastic resize method. With
an elastic resize, your cluster is available for read and write operations more quickly
than with the classic resize method.
Elastic resize operations have the following restrictions:​

``` swift
func resizeCluster(input: ResizeClusterInput, completion: @escaping (ClientRuntime.SdkResult<ResizeClusterOutputResponse, ResizeClusterOutputError>) -> Void)
```

``` 
            You can only resize clusters of the following types:


                    dc1.large (if your cluster is in a VPC)


                    dc1.8xlarge (if your cluster is in a VPC)


                    dc2.large


                    dc2.8xlarge


                    ds2.xlarge


                    ds2.8xlarge


                    ra3.xlplus


                    ra3.4xlarge


                    ra3.16xlarge




            The type of nodes that you add must match the node type for the
                cluster.
```

### restoreFromClusterSnapshot(input:​completion:​)

Creates a new cluster from a snapshot. By default, Amazon Redshift creates the resulting
cluster with the same configuration as the original cluster from which the snapshot was
created, except that the new cluster is created with the default cluster security and
parameter groups. After Amazon Redshift creates the cluster, you can use the ModifyCluster API to associate a different security group and different
parameter group with the restored cluster. If you are using a DS node type, you can also
choose to change to another DS node type of the same size during restore.
If you restore a cluster into a VPC, you must provide a cluster subnet group where
you want the cluster restored.

``` swift
func restoreFromClusterSnapshot(input: RestoreFromClusterSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<RestoreFromClusterSnapshotOutputResponse, RestoreFromClusterSnapshotOutputError>) -> Void)
```

For more information about working with snapshots, go to
<a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-snapshots.html">Amazon Redshift Snapshots
in the Amazon Redshift Cluster Management Guide.

### restoreTableFromClusterSnapshot(input:​completion:​)

Creates a new table from a table in an Amazon Redshift cluster snapshot. You must
create the new table within the Amazon Redshift cluster that the snapshot was taken
from.
You cannot use RestoreTableFromClusterSnapshot to restore a table with
the same name as an existing table in an Amazon Redshift cluster. That is, you cannot
overwrite an existing table in a cluster with a restored table. If you want to replace
your original table with a new, restored table, then rename or drop your original table
before you call RestoreTableFromClusterSnapshot. When you have renamed your
original table, then you can pass the original name of the table as the
NewTableName parameter value in the call to
RestoreTableFromClusterSnapshot. This way, you can replace the original
table with the table created from the snapshot.

``` swift
func restoreTableFromClusterSnapshot(input: RestoreTableFromClusterSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<RestoreTableFromClusterSnapshotOutputResponse, RestoreTableFromClusterSnapshotOutputError>) -> Void)
```

### resumeCluster(input:​completion:​)

Resumes a paused cluster.

``` swift
func resumeCluster(input: ResumeClusterInput, completion: @escaping (ClientRuntime.SdkResult<ResumeClusterOutputResponse, ResumeClusterOutputError>) -> Void)
```

### revokeClusterSecurityGroupIngress(input:​completion:​)

Revokes an ingress rule in an Amazon Redshift security group for a previously authorized
IP range or Amazon EC2 security group. To add an ingress rule, see AuthorizeClusterSecurityGroupIngress.
For information about managing security groups, go to
<a href="https:​//docs.aws.amazon.com/redshift/latest/mgmt/working-with-security-groups.html">Amazon Redshift Cluster Security Groups in the
Amazon Redshift Cluster Management Guide.

``` swift
func revokeClusterSecurityGroupIngress(input: RevokeClusterSecurityGroupIngressInput, completion: @escaping (ClientRuntime.SdkResult<RevokeClusterSecurityGroupIngressOutputResponse, RevokeClusterSecurityGroupIngressOutputError>) -> Void)
```

### revokeEndpointAccess(input:​completion:​)

Revokes access to a cluster.

``` swift
func revokeEndpointAccess(input: RevokeEndpointAccessInput, completion: @escaping (ClientRuntime.SdkResult<RevokeEndpointAccessOutputResponse, RevokeEndpointAccessOutputError>) -> Void)
```

### revokeSnapshotAccess(input:​completion:​)

Removes the ability of the specified  Amazon Web Services account to restore the specified
snapshot. If the account is currently restoring the snapshot, the restore will run to
completion.

``` swift
func revokeSnapshotAccess(input: RevokeSnapshotAccessInput, completion: @escaping (ClientRuntime.SdkResult<RevokeSnapshotAccessOutputResponse, RevokeSnapshotAccessOutputError>) -> Void)
```

For more information about working with snapshots, go to
<a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-snapshots.html">Amazon Redshift Snapshots
in the Amazon Redshift Cluster Management Guide.

### rotateEncryptionKey(input:​completion:​)

Rotates the encryption keys for a cluster.

``` swift
func rotateEncryptionKey(input: RotateEncryptionKeyInput, completion: @escaping (ClientRuntime.SdkResult<RotateEncryptionKeyOutputResponse, RotateEncryptionKeyOutputError>) -> Void)
```

### updatePartnerStatus(input:​completion:​)

Updates the status of a partner integration.

``` swift
func updatePartnerStatus(input: UpdatePartnerStatusInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePartnerStatusOutputResponse, UpdatePartnerStatusOutputError>) -> Void)
```
