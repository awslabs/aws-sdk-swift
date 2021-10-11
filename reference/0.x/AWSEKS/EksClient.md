# EksClient

``` swift
public class EksClient 
```

## Inheritance

[`EksClientProtocol`](/aws-sdk-swift/reference/0.x/AWSEKS/EksClientProtocol)

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

### `associateEncryptionConfig(input:completion:)`

Associate encryption configuration to an existing cluster.
You can use this API to enable encryption on existing clusters which do not have
encryption already enabled. This allows you to implement a defense-in-depth security
strategy without migrating applications to new Amazon EKS clusters.

``` swift
public func associateEncryptionConfig(input: AssociateEncryptionConfigInput, completion: @escaping (ClientRuntime.SdkResult<AssociateEncryptionConfigOutputResponse, AssociateEncryptionConfigOutputError>) -> Void)
```

### `associateIdentityProviderConfig(input:completion:)`

Associate an identity provider configuration to a cluster.
If you want to authenticate identities using an identity provider, you can create an
identity provider configuration and associate it to your cluster. After configuring
authentication to your cluster you can create Kubernetes roles and
clusterroles to assign permissions to the roles, and then bind the
roles to the identities using Kubernetes rolebindings and
clusterrolebindings. For more information see <a href="https:​//kubernetes.io/docs/reference/access-authn-authz/rbac/">Using RBAC
Authorization in the Kubernetes documentation.

``` swift
public func associateIdentityProviderConfig(input: AssociateIdentityProviderConfigInput, completion: @escaping (ClientRuntime.SdkResult<AssociateIdentityProviderConfigOutputResponse, AssociateIdentityProviderConfigOutputError>) -> Void)
```

### `createAddon(input:completion:)`

Creates an Amazon EKS add-on.
Amazon EKS add-ons help to automate the provisioning and lifecycle management of common
operational software for Amazon EKS clusters. Amazon EKS add-ons can only be used with Amazon EKS
clusters running version 1.18 with platform version eks.3 or later because
add-ons rely on the Server-side Apply Kubernetes feature, which is only available in
Kubernetes 1.18 and later.

``` swift
public func createAddon(input: CreateAddonInput, completion: @escaping (ClientRuntime.SdkResult<CreateAddonOutputResponse, CreateAddonOutputError>) -> Void)
```

### `createCluster(input:completion:)`

Creates an Amazon EKS control plane.
The Amazon EKS control plane consists of control plane instances that run the Kubernetes
software, such as etcd and the API server. The control plane runs in an
account managed by Amazon Web Services, and the Kubernetes API is exposed via the Amazon EKS API server
endpoint. Each Amazon EKS cluster control plane is single-tenant and unique and runs on its
own set of Amazon EC2 instances.
The cluster control plane is provisioned across multiple Availability Zones and
fronted by an Elastic Load Balancing Network Load Balancer. Amazon EKS also provisions elastic network interfaces in your VPC
subnets to provide connectivity from the control plane instances to the nodes (for
example, to support kubectl exec, logs, and proxy
data flows).
Amazon EKS nodes run in your Amazon Web Services account and connect to your cluster's control plane via
the Kubernetes API server endpoint and a certificate file that is created for your
cluster.

``` swift
public func createCluster(input: CreateClusterInput, completion: @escaping (ClientRuntime.SdkResult<CreateClusterOutputResponse, CreateClusterOutputError>) -> Void)
```

``` 
    Cluster creation typically takes several minutes. After you create an Amazon EKS cluster,
        you must configure your Kubernetes tooling to communicate with the API server and launch
        nodes into your cluster. For more information, see <a href="https://docs.aws.amazon.com/eks/latest/userguide/managing-auth.html">Managing Cluster
            Authentication and <a href="https://docs.aws.amazon.com/eks/latest/userguide/launch-workers.html">Launching Amazon EKS nodes in the Amazon EKS User Guide.
```

### `createFargateProfile(input:completion:)`

Creates an Fargate profile for your Amazon EKS cluster. You must have at least one Fargate
profile in a cluster to be able to run pods on Fargate.
The Fargate profile allows an administrator to declare which pods run on Fargate and specify
which pods run on which Fargate profile. This declaration is done through the profile’s
selectors. Each profile can have up to five selectors that contain a namespace and
labels. A namespace is required for every selector. The label field consists of multiple
optional key-value pairs. Pods that match the selectors are scheduled on Fargate. If a
to-be-scheduled pod matches any of the selectors in the Fargate profile, then that pod is
run on Fargate.
When you create a Fargate profile, you must specify a pod execution role to use with the
pods that are scheduled with the profile. This role is added to the cluster's Kubernetes
<a href="https:​//kubernetes.io/docs/admin/authorization/rbac/">Role Based Access
Control (RBAC) for authorization so that the kubelet that is
running on the Fargate infrastructure can register with your Amazon EKS cluster so that it can
appear in your cluster as a node. The pod execution role also provides IAM permissions
to the Fargate infrastructure to allow read access to Amazon ECR image repositories. For more
information, see <a href="https:​//docs.aws.amazon.com/eks/latest/userguide/pod-execution-role.html">Pod Execution Role in the Amazon EKS User Guide.
Fargate profiles are immutable. However, you can create a new updated profile to replace
an existing profile and then delete the original after the updated profile has finished
creating.
If any Fargate profiles in a cluster are in the DELETING status, you must
wait for that Fargate profile to finish deleting before you can create any other profiles
in that cluster.
For more information, see <a href="https:​//docs.aws.amazon.com/eks/latest/userguide/fargate-profile.html">Fargate Profile in the Amazon EKS User Guide.

``` swift
public func createFargateProfile(input: CreateFargateProfileInput, completion: @escaping (ClientRuntime.SdkResult<CreateFargateProfileOutputResponse, CreateFargateProfileOutputError>) -> Void)
```

### `createNodegroup(input:completion:)`

Creates a managed node group for an Amazon EKS cluster. You can only create a node group
for your cluster that is equal to the current Kubernetes version for the cluster. All
node groups are created with the latest AMI release version for the respective minor
Kubernetes version of the cluster, unless you deploy a custom AMI using a launch
template. For more information about using launch templates, see <a href="https:​//docs.aws.amazon.com/eks/latest/userguide/launch-templates.html">Launch
template support.
An Amazon EKS managed node group is an Amazon EC2 Auto Scaling group and associated Amazon EC2 instances that
are managed by Amazon Web Services for an Amazon EKS cluster. Each node group uses a version of the Amazon EKS
optimized Amazon Linux 2 AMI. For more information, see <a href="https:​//docs.aws.amazon.com/eks/latest/userguide/managed-node-groups.html">Managed
Node Groups in the Amazon EKS User Guide.

``` swift
public func createNodegroup(input: CreateNodegroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateNodegroupOutputResponse, CreateNodegroupOutputError>) -> Void)
```

### `deleteAddon(input:completion:)`

Delete an Amazon EKS add-on.
When you remove the add-on, it will also be deleted from the cluster. You can always
manually start an add-on on the cluster using the Kubernetes API.

``` swift
public func deleteAddon(input: DeleteAddonInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAddonOutputResponse, DeleteAddonOutputError>) -> Void)
```

### `deleteCluster(input:completion:)`

Deletes the Amazon EKS cluster control plane.
If you have active services in your cluster that are associated with a load balancer,
you must delete those services before deleting the cluster so that the load balancers
are deleted properly. Otherwise, you can have orphaned resources in your VPC that
prevent you from being able to delete the VPC. For more information, see <a href="https:​//docs.aws.amazon.com/eks/latest/userguide/delete-cluster.html">Deleting a
Cluster in the Amazon EKS User Guide.
If you have managed node groups or Fargate profiles attached to the cluster, you must
delete them first. For more information, see DeleteNodegroup and DeleteFargateProfile.

``` swift
public func deleteCluster(input: DeleteClusterInput, completion: @escaping (ClientRuntime.SdkResult<DeleteClusterOutputResponse, DeleteClusterOutputError>) -> Void)
```

### `deleteFargateProfile(input:completion:)`

Deletes an Fargate profile.
When you delete a Fargate profile, any pods running on Fargate that were created with the
profile are deleted. If those pods match another Fargate profile, then they are scheduled
on Fargate with that profile. If they no longer match any Fargate profiles, then they are not
scheduled on Fargate and they may remain in a pending state.
Only one Fargate profile in a cluster can be in the DELETING status at a
time. You must wait for a Fargate profile to finish deleting before you can delete any
other profiles in that cluster.

``` swift
public func deleteFargateProfile(input: DeleteFargateProfileInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFargateProfileOutputResponse, DeleteFargateProfileOutputError>) -> Void)
```

### `deleteNodegroup(input:completion:)`

Deletes an Amazon EKS node group for a cluster.

``` swift
public func deleteNodegroup(input: DeleteNodegroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteNodegroupOutputResponse, DeleteNodegroupOutputError>) -> Void)
```

### `deregisterCluster(input:completion:)`

Deregisters a connected cluster to remove it from the Amazon EKS control plane.

``` swift
public func deregisterCluster(input: DeregisterClusterInput, completion: @escaping (ClientRuntime.SdkResult<DeregisterClusterOutputResponse, DeregisterClusterOutputError>) -> Void)
```

### `describeAddon(input:completion:)`

Describes an Amazon EKS add-on.

``` swift
public func describeAddon(input: DescribeAddonInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAddonOutputResponse, DescribeAddonOutputError>) -> Void)
```

### `describeAddonVersions(input:completion:)`

Describes the Kubernetes versions that the add-on can be used with.

``` swift
public func describeAddonVersions(input: DescribeAddonVersionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAddonVersionsOutputResponse, DescribeAddonVersionsOutputError>) -> Void)
```

### `describeCluster(input:completion:)`

Returns descriptive information about an Amazon EKS cluster.
The API server endpoint and certificate authority data returned by this operation are
required for kubelet and kubectl to communicate with your
Kubernetes API server. For more information, see <a href="https:​//docs.aws.amazon.com/eks/latest/userguide/create-kubeconfig.html">Create a
kubeconfig for Amazon EKS.

``` swift
public func describeCluster(input: DescribeClusterInput, completion: @escaping (ClientRuntime.SdkResult<DescribeClusterOutputResponse, DescribeClusterOutputError>) -> Void)
```

``` 
        The API server endpoint and certificate authority data aren't available until the
            cluster reaches the ACTIVE state.
```

### `describeFargateProfile(input:completion:)`

Returns descriptive information about an Fargate profile.

``` swift
public func describeFargateProfile(input: DescribeFargateProfileInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFargateProfileOutputResponse, DescribeFargateProfileOutputError>) -> Void)
```

### `describeIdentityProviderConfig(input:completion:)`

Returns descriptive information about an identity provider configuration.

``` swift
public func describeIdentityProviderConfig(input: DescribeIdentityProviderConfigInput, completion: @escaping (ClientRuntime.SdkResult<DescribeIdentityProviderConfigOutputResponse, DescribeIdentityProviderConfigOutputError>) -> Void)
```

### `describeNodegroup(input:completion:)`

Returns descriptive information about an Amazon EKS node group.

``` swift
public func describeNodegroup(input: DescribeNodegroupInput, completion: @escaping (ClientRuntime.SdkResult<DescribeNodegroupOutputResponse, DescribeNodegroupOutputError>) -> Void)
```

### `describeUpdate(input:completion:)`

Returns descriptive information about an update against your Amazon EKS cluster or
associated managed node group.
When the status of the update is Succeeded, the update is complete. If an
update fails, the status is Failed, and an error detail explains the reason
for the failure.

``` swift
public func describeUpdate(input: DescribeUpdateInput, completion: @escaping (ClientRuntime.SdkResult<DescribeUpdateOutputResponse, DescribeUpdateOutputError>) -> Void)
```

### `disassociateIdentityProviderConfig(input:completion:)`

Disassociates an identity provider configuration from a cluster. If you disassociate
an identity provider from your cluster, users included in the provider can no longer
access the cluster. However, you can still access the cluster with Amazon Web Services IAM
users.

``` swift
public func disassociateIdentityProviderConfig(input: DisassociateIdentityProviderConfigInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateIdentityProviderConfigOutputResponse, DisassociateIdentityProviderConfigOutputError>) -> Void)
```

### `listAddons(input:completion:)`

Lists the available add-ons.

``` swift
public func listAddons(input: ListAddonsInput, completion: @escaping (ClientRuntime.SdkResult<ListAddonsOutputResponse, ListAddonsOutputError>) -> Void)
```

### `listClusters(input:completion:)`

Lists the Amazon EKS clusters in your Amazon Web Services account in the specified Region.

``` swift
public func listClusters(input: ListClustersInput, completion: @escaping (ClientRuntime.SdkResult<ListClustersOutputResponse, ListClustersOutputError>) -> Void)
```

### `listFargateProfiles(input:completion:)`

Lists the Fargate profiles associated with the specified cluster in your Amazon Web Services
account in the specified Region.

``` swift
public func listFargateProfiles(input: ListFargateProfilesInput, completion: @escaping (ClientRuntime.SdkResult<ListFargateProfilesOutputResponse, ListFargateProfilesOutputError>) -> Void)
```

### `listIdentityProviderConfigs(input:completion:)`

A list of identity provider configurations.

``` swift
public func listIdentityProviderConfigs(input: ListIdentityProviderConfigsInput, completion: @escaping (ClientRuntime.SdkResult<ListIdentityProviderConfigsOutputResponse, ListIdentityProviderConfigsOutputError>) -> Void)
```

### `listNodegroups(input:completion:)`

Lists the Amazon EKS managed node groups associated with the specified cluster in your
Amazon Web Services account in the specified Region. Self-managed node groups are not listed.

``` swift
public func listNodegroups(input: ListNodegroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListNodegroupsOutputResponse, ListNodegroupsOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

List the tags for an Amazon EKS resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `listUpdates(input:completion:)`

Lists the updates associated with an Amazon EKS cluster or managed node group in your Amazon Web Services
account, in the specified Region.

``` swift
public func listUpdates(input: ListUpdatesInput, completion: @escaping (ClientRuntime.SdkResult<ListUpdatesOutputResponse, ListUpdatesOutputError>) -> Void)
```

### `registerCluster(input:completion:)`

Connects a Kubernetes cluster to the Amazon EKS control plane.
Any Kubernetes cluster can be connected to the Amazon EKS control plane to view current information about the cluster and its nodes.

``` swift
public func registerCluster(input: RegisterClusterInput, completion: @escaping (ClientRuntime.SdkResult<RegisterClusterOutputResponse, RegisterClusterOutputError>) -> Void)
```

``` 
    Cluster connection requires two steps. First, send a
           RegisterClusterRequest
         to add it to the Amazon EKS control plane.
    Second, a <a href="https://amazon-eks.s3.us-west-2.amazonaws.com/eks-connector/manifests/eks-connector/latest/eks-connector.yaml">Manifest containing the activationID and activationCode must be applied to the Kubernetes cluster through it's native provider to provide visibility.

    After the Manifest is updated and applied, then the connected cluster is visible to the Amazon EKS control plane. If the Manifest is not applied within a set amount of time,
        then the connected cluster will no longer be visible and must be deregistered. See DeregisterCluster.
```

### `tagResource(input:completion:)`

Associates the specified tags to a resource with the specified
resourceArn. If existing tags on a resource are not specified in the
request parameters, they are not changed. When a resource is deleted, the tags
associated with that resource are deleted as well. Tags that you create for Amazon EKS
resources do not propagate to any other resources associated with the cluster. For
example, if you tag a cluster with this operation, that tag does not automatically
propagate to the subnets and nodes associated with the cluster.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Deletes specified tags from a resource.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateAddon(input:completion:)`

Updates an Amazon EKS add-on.

``` swift
public func updateAddon(input: UpdateAddonInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAddonOutputResponse, UpdateAddonOutputError>) -> Void)
```

### `updateClusterConfig(input:completion:)`

Updates an Amazon EKS cluster configuration. Your cluster continues to function during the
update. The response output includes an update ID that you can use to track the status
of your cluster update with the DescribeUpdate API operation.
You can use this API operation to enable or disable exporting the Kubernetes control
plane logs for your cluster to CloudWatch Logs. By default, cluster control plane logs aren't
exported to CloudWatch Logs. For more information, see <a href="https:​//docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html">Amazon EKS
Cluster Control Plane Logs in the

``` swift
public func updateClusterConfig(input: UpdateClusterConfigInput, completion: @escaping (ClientRuntime.SdkResult<UpdateClusterConfigOutputResponse, UpdateClusterConfigOutputError>) -> Void)
```

``` 
           Amazon EKS User Guide
        .

        CloudWatch Logs ingestion, archive storage, and data scanning rates apply to exported
            control plane logs. For more information, see <a href="http://aws.amazon.com/cloudwatch/pricing/">CloudWatch Pricing.

    You can also use this API operation to enable or disable public and private access to
        your cluster's Kubernetes API server endpoint. By default, public access is enabled, and
        private access is disabled. For more information, see <a href="https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html">Amazon EKS cluster
            endpoint access control in the
           Amazon EKS User Guide
        .

        You can't update the subnets or security group IDs for an existing cluster.

    Cluster updates are asynchronous, and they should finish within a few minutes. During
        an update, the cluster status moves to UPDATING (this status transition is
        eventually consistent). When the update is complete (either Failed or
            Successful), the cluster status moves to Active.
```

### `updateClusterVersion(input:completion:)`

Updates an Amazon EKS cluster to the specified Kubernetes version. Your cluster continues
to function during the update. The response output includes an update ID that you can
use to track the status of your cluster update with the DescribeUpdate
API operation.
Cluster updates are asynchronous, and they should finish within a few minutes. During
an update, the cluster status moves to UPDATING (this status transition is
eventually consistent). When the update is complete (either Failed or
Successful), the cluster status moves to Active.
If your cluster has managed node groups attached to it, all of your node groups’
Kubernetes versions must match the cluster’s Kubernetes version in order to update the
cluster to a new Kubernetes version.

``` swift
public func updateClusterVersion(input: UpdateClusterVersionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateClusterVersionOutputResponse, UpdateClusterVersionOutputError>) -> Void)
```

### `updateNodegroupConfig(input:completion:)`

Updates an Amazon EKS managed node group configuration. Your node group continues to
function during the update. The response output includes an update ID that you can use
to track the status of your node group update with the DescribeUpdate
API operation. Currently you can update the Kubernetes labels for a node group or the
scaling configuration.

``` swift
public func updateNodegroupConfig(input: UpdateNodegroupConfigInput, completion: @escaping (ClientRuntime.SdkResult<UpdateNodegroupConfigOutputResponse, UpdateNodegroupConfigOutputError>) -> Void)
```

### `updateNodegroupVersion(input:completion:)`

Updates the Kubernetes version or AMI version of an Amazon EKS managed node group.
You can update a node group using a launch template only if the node group was
originally deployed with a launch template. If you need to update a custom AMI in a node
group that was deployed with a launch template, then update your custom AMI, specify the
new ID in a new version of the launch template, and then update the node group to the
new version of the launch template.
If you update without a launch template, then you can update to the latest available
AMI version of a node group's current Kubernetes version by not specifying a Kubernetes
version in the request. You can update to the latest AMI version of your cluster's
current Kubernetes version by specifying your cluster's Kubernetes version in the
request. For more information, see <a href="https:​//docs.aws.amazon.com/eks/latest/userguide/eks-linux-ami-versions.html">Amazon EKS
optimized Amazon Linux 2 AMI versions in the Amazon EKS User Guide.
You cannot roll back a node group to an earlier Kubernetes version or AMI
version.
When a node in a managed node group is terminated due to a scaling action or update,
the pods in that node are drained first. Amazon EKS attempts to drain the nodes gracefully
and will fail if it is unable to do so. You can force the update if Amazon EKS
is unable to drain the nodes as a result of a pod disruption budget issue.

``` swift
public func updateNodegroupVersion(input: UpdateNodegroupVersionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateNodegroupVersionOutputResponse, UpdateNodegroupVersionOutputError>) -> Void)
```
