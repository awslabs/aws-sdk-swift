# OpsWorksClient

``` swift
public class OpsWorksClient 
```

## Inheritance

[`OpsWorksClientProtocol`](/aws-sdk-swift/reference/0.x/AWSOpsWorks/OpsWorksClientProtocol)

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
public static let clientName = "OpsWorksClient"
```

## Methods

### `assignInstance(input:completion:)`

Assign a registered instance to a layer.

``` swift
public func assignInstance(input: AssignInstanceInput, completion: @escaping (ClientRuntime.SdkResult<AssignInstanceOutputResponse, AssignInstanceOutputError>) -> Void)
```

  - You can assign registered on-premises instances to any layer type.

  - You can assign registered Amazon EC2 instances only to custom layers.

  - You cannot use this action with instances that were created with AWS OpsWorks Stacks.

Required Permissions: To use this action, an AWS Identity and Access Management (IAM) user must have a Manage permissions level for the stack or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

### `assignVolume(input:completion:)`

Assigns one of the stack's registered Amazon EBS volumes to a specified instance. The volume must first be registered with the stack by calling \[RegisterVolume\]. After you register the volume, you must call \[UpdateVolume\] to specify a mount point before calling AssignVolume. For more information, see [Resource Management](https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html). Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func assignVolume(input: AssignVolumeInput, completion: @escaping (ClientRuntime.SdkResult<AssignVolumeOutputResponse, AssignVolumeOutputError>) -> Void)
```

### `associateElasticIp(input:completion:)`

Associates one of the stack's registered Elastic IP addresses with a specified instance. The address must first be registered with the stack by calling \[RegisterElasticIp\]. For more information, see [Resource Management](https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html). Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func associateElasticIp(input: AssociateElasticIpInput, completion: @escaping (ClientRuntime.SdkResult<AssociateElasticIpOutputResponse, AssociateElasticIpOutputError>) -> Void)
```

### `attachElasticLoadBalancer(input:completion:)`

Attaches an Elastic Load Balancing load balancer to a specified layer. AWS OpsWorks Stacks does not support Application Load Balancer. You can only use Classic Load Balancer with AWS OpsWorks Stacks. For more information, see [Elastic Load Balancing](https://docs.aws.amazon.com/opsworks/latest/userguide/layers-elb.html). You must create the Elastic Load Balancing instance separately, by using the Elastic Load Balancing console, API, or CLI. For more information, see [ Elastic Load Balancing Developer Guide](https://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/Welcome.html). Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func attachElasticLoadBalancer(input: AttachElasticLoadBalancerInput, completion: @escaping (ClientRuntime.SdkResult<AttachElasticLoadBalancerOutputResponse, AttachElasticLoadBalancerOutputError>) -> Void)
```

### `cloneStack(input:completion:)`

Creates a clone of a specified stack. For more information, see [Clone a Stack](https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-cloning.html). By default, all parameters are set to the values used by the parent stack. Required Permissions: To use this action, an IAM user must have an attached policy that explicitly grants permissions. For more information about user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func cloneStack(input: CloneStackInput, completion: @escaping (ClientRuntime.SdkResult<CloneStackOutputResponse, CloneStackOutputError>) -> Void)
```

### `createApp(input:completion:)`

Creates an app for a specified stack. For more information, see [Creating Apps](https://docs.aws.amazon.com/opsworks/latest/userguide/workingapps-creating.html). Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func createApp(input: CreateAppInput, completion: @escaping (ClientRuntime.SdkResult<CreateAppOutputResponse, CreateAppOutputError>) -> Void)
```

### `createDeployment(input:completion:)`

Runs deployment or stack commands. For more information, see [Deploying Apps](https://docs.aws.amazon.com/opsworks/latest/userguide/workingapps-deploying.html) and [Run Stack Commands](https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-commands.html). Required Permissions: To use this action, an IAM user must have a Deploy or Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func createDeployment(input: CreateDeploymentInput, completion: @escaping (ClientRuntime.SdkResult<CreateDeploymentOutputResponse, CreateDeploymentOutputError>) -> Void)
```

### `createInstance(input:completion:)`

Creates an instance in a specified stack. For more information, see [Adding an Instance to a Layer](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-add.html). Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func createInstance(input: CreateInstanceInput, completion: @escaping (ClientRuntime.SdkResult<CreateInstanceOutputResponse, CreateInstanceOutputError>) -> Void)
```

### `createLayer(input:completion:)`

Creates a layer. For more information, see [How to Create a Layer](https://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-basics-create.html). You should use CreateLayer for noncustom layer types such as PHP App Server only if the stack does not have an existing layer of that type. A stack can have at most one instance of each noncustom layer; if you attempt to create a second instance, CreateLayer fails. A stack can have an arbitrary number of custom layers, so you can call CreateLayer as many times as you like for that layer type. Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func createLayer(input: CreateLayerInput, completion: @escaping (ClientRuntime.SdkResult<CreateLayerOutputResponse, CreateLayerOutputError>) -> Void)
```

### `createStack(input:completion:)`

Creates a new stack. For more information, see [Create a New Stack](https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-edit.html). Required Permissions: To use this action, an IAM user must have an attached policy that explicitly grants permissions. For more information about user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func createStack(input: CreateStackInput, completion: @escaping (ClientRuntime.SdkResult<CreateStackOutputResponse, CreateStackOutputError>) -> Void)
```

### `createUserProfile(input:completion:)`

Creates a new user profile. Required Permissions: To use this action, an IAM user must have an attached policy that explicitly grants permissions. For more information about user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func createUserProfile(input: CreateUserProfileInput, completion: @escaping (ClientRuntime.SdkResult<CreateUserProfileOutputResponse, CreateUserProfileOutputError>) -> Void)
```

### `deleteApp(input:completion:)`

Deletes a specified app. Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func deleteApp(input: DeleteAppInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAppOutputResponse, DeleteAppOutputError>) -> Void)
```

### `deleteInstance(input:completion:)`

Deletes a specified instance, which terminates the associated Amazon EC2 instance. You must stop an instance before you can delete it. For more information, see [Deleting Instances](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-delete.html). Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func deleteInstance(input: DeleteInstanceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteInstanceOutputResponse, DeleteInstanceOutputError>) -> Void)
```

### `deleteLayer(input:completion:)`

Deletes a specified layer. You must first stop and then delete all associated instances or unassign registered instances. For more information, see [How to Delete a Layer](https://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-basics-delete.html). Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func deleteLayer(input: DeleteLayerInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLayerOutputResponse, DeleteLayerOutputError>) -> Void)
```

### `deleteStack(input:completion:)`

Deletes a specified stack. You must first delete all instances, layers, and apps or deregister registered instances. For more information, see [Shut Down a Stack](https://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-shutting.html). Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func deleteStack(input: DeleteStackInput, completion: @escaping (ClientRuntime.SdkResult<DeleteStackOutputResponse, DeleteStackOutputError>) -> Void)
```

### `deleteUserProfile(input:completion:)`

Deletes a user profile. Required Permissions: To use this action, an IAM user must have an attached policy that explicitly grants permissions. For more information about user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func deleteUserProfile(input: DeleteUserProfileInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUserProfileOutputResponse, DeleteUserProfileOutputError>) -> Void)
```

### `deregisterEcsCluster(input:completion:)`

Deregisters a specified Amazon ECS cluster from a stack. For more information, see [ Resource Management](https://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-ecscluster.html#workinglayers-ecscluster-delete). Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack or an attached policy that explicitly grants permissions. For more information on user permissions, see <https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html>.

``` swift
public func deregisterEcsCluster(input: DeregisterEcsClusterInput, completion: @escaping (ClientRuntime.SdkResult<DeregisterEcsClusterOutputResponse, DeregisterEcsClusterOutputError>) -> Void)
```

### `deregisterElasticIp(input:completion:)`

Deregisters a specified Elastic IP address. The address can then be registered by another stack. For more information, see [Resource Management](https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html). Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func deregisterElasticIp(input: DeregisterElasticIpInput, completion: @escaping (ClientRuntime.SdkResult<DeregisterElasticIpOutputResponse, DeregisterElasticIpOutputError>) -> Void)
```

### `deregisterInstance(input:completion:)`

Deregister a registered Amazon EC2 or on-premises instance. This action removes the instance from the stack and returns it to your control. This action cannot be used with instances that were created with AWS OpsWorks Stacks. Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func deregisterInstance(input: DeregisterInstanceInput, completion: @escaping (ClientRuntime.SdkResult<DeregisterInstanceOutputResponse, DeregisterInstanceOutputError>) -> Void)
```

### `deregisterRdsDbInstance(input:completion:)`

Deregisters an Amazon RDS instance. Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func deregisterRdsDbInstance(input: DeregisterRdsDbInstanceInput, completion: @escaping (ClientRuntime.SdkResult<DeregisterRdsDbInstanceOutputResponse, DeregisterRdsDbInstanceOutputError>) -> Void)
```

### `deregisterVolume(input:completion:)`

Deregisters an Amazon EBS volume. The volume can then be registered by another stack. For more information, see [Resource Management](https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html). Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func deregisterVolume(input: DeregisterVolumeInput, completion: @escaping (ClientRuntime.SdkResult<DeregisterVolumeOutputResponse, DeregisterVolumeOutputError>) -> Void)
```

### `describeAgentVersions(input:completion:)`

Describes the available AWS OpsWorks Stacks agent versions. You must specify a stack ID or a configuration manager. DescribeAgentVersions returns a list of available agent versions for the specified stack or configuration manager.

``` swift
public func describeAgentVersions(input: DescribeAgentVersionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAgentVersionsOutputResponse, DescribeAgentVersionsOutputError>) -> Void)
```

### `describeApps(input:completion:)`

Requests a description of a specified set of apps. This call accepts only one resource-identifying parameter. Required Permissions: To use this action, an IAM user must have a Show, Deploy, or Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information about user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func describeApps(input: DescribeAppsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAppsOutputResponse, DescribeAppsOutputError>) -> Void)
```

### `describeCommands(input:completion:)`

Describes the results of specified commands. This call accepts only one resource-identifying parameter. Required Permissions: To use this action, an IAM user must have a Show, Deploy, or Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information about user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func describeCommands(input: DescribeCommandsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCommandsOutputResponse, DescribeCommandsOutputError>) -> Void)
```

### `describeDeployments(input:completion:)`

Requests a description of a specified set of deployments. This call accepts only one resource-identifying parameter. Required Permissions: To use this action, an IAM user must have a Show, Deploy, or Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information about user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func describeDeployments(input: DescribeDeploymentsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDeploymentsOutputResponse, DescribeDeploymentsOutputError>) -> Void)
```

### `describeEcsClusters(input:completion:)`

Describes Amazon ECS clusters that are registered with a stack. If you specify only a stack ID, you can use the MaxResults and NextToken parameters to paginate the response. However, AWS OpsWorks Stacks currently supports only one cluster per layer, so the result set has a maximum of one element. Required Permissions: To use this action, an IAM user must have a Show, Deploy, or Manage permissions level for the stack or an attached policy that explicitly grants permission. For more information about user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html). This call accepts only one resource-identifying parameter.

``` swift
public func describeEcsClusters(input: DescribeEcsClustersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEcsClustersOutputResponse, DescribeEcsClustersOutputError>) -> Void)
```

### `describeElasticIps(input:completion:)`

Describes [Elastic IP addresses](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html). This call accepts only one resource-identifying parameter. Required Permissions: To use this action, an IAM user must have a Show, Deploy, or Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information about user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func describeElasticIps(input: DescribeElasticIpsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeElasticIpsOutputResponse, DescribeElasticIpsOutputError>) -> Void)
```

### `describeElasticLoadBalancers(input:completion:)`

Describes a stack's Elastic Load Balancing instances. This call accepts only one resource-identifying parameter. Required Permissions: To use this action, an IAM user must have a Show, Deploy, or Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information about user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func describeElasticLoadBalancers(input: DescribeElasticLoadBalancersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeElasticLoadBalancersOutputResponse, DescribeElasticLoadBalancersOutputError>) -> Void)
```

### `describeInstances(input:completion:)`

Requests a description of a set of instances. This call accepts only one resource-identifying parameter. Required Permissions: To use this action, an IAM user must have a Show, Deploy, or Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information about user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func describeInstances(input: DescribeInstancesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeInstancesOutputResponse, DescribeInstancesOutputError>) -> Void)
```

### `describeLayers(input:completion:)`

Requests a description of one or more layers in a specified stack. This call accepts only one resource-identifying parameter. Required Permissions: To use this action, an IAM user must have a Show, Deploy, or Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information about user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func describeLayers(input: DescribeLayersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLayersOutputResponse, DescribeLayersOutputError>) -> Void)
```

### `describeLoadBasedAutoScaling(input:completion:)`

Describes load-based auto scaling configurations for specified layers. You must specify at least one of the parameters. Required Permissions: To use this action, an IAM user must have a Show, Deploy, or Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information about user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func describeLoadBasedAutoScaling(input: DescribeLoadBasedAutoScalingInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLoadBasedAutoScalingOutputResponse, DescribeLoadBasedAutoScalingOutputError>) -> Void)
```

### `describeMyUserProfile(input:completion:)`

Describes a user's SSH information. Required Permissions: To use this action, an IAM user must have self-management enabled or an attached policy that explicitly grants permissions. For more information about user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func describeMyUserProfile(input: DescribeMyUserProfileInput, completion: @escaping (ClientRuntime.SdkResult<DescribeMyUserProfileOutputResponse, DescribeMyUserProfileOutputError>) -> Void)
```

### `describeOperatingSystems(input:completion:)`

Describes the operating systems that are supported by AWS OpsWorks Stacks.

``` swift
public func describeOperatingSystems(input: DescribeOperatingSystemsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeOperatingSystemsOutputResponse, DescribeOperatingSystemsOutputError>) -> Void)
```

### `describePermissions(input:completion:)`

Describes the permissions for a specified stack. Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func describePermissions(input: DescribePermissionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribePermissionsOutputResponse, DescribePermissionsOutputError>) -> Void)
```

### `describeRaidArrays(input:completion:)`

Describe an instance's RAID arrays. This call accepts only one resource-identifying parameter. Required Permissions: To use this action, an IAM user must have a Show, Deploy, or Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information about user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func describeRaidArrays(input: DescribeRaidArraysInput, completion: @escaping (ClientRuntime.SdkResult<DescribeRaidArraysOutputResponse, DescribeRaidArraysOutputError>) -> Void)
```

### `describeRdsDbInstances(input:completion:)`

Describes Amazon RDS instances. Required Permissions: To use this action, an IAM user must have a Show, Deploy, or Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information about user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html). This call accepts only one resource-identifying parameter.

``` swift
public func describeRdsDbInstances(input: DescribeRdsDbInstancesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeRdsDbInstancesOutputResponse, DescribeRdsDbInstancesOutputError>) -> Void)
```

### `describeServiceErrors(input:completion:)`

Describes AWS OpsWorks Stacks service errors. Required Permissions: To use this action, an IAM user must have a Show, Deploy, or Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information about user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html). This call accepts only one resource-identifying parameter.

``` swift
public func describeServiceErrors(input: DescribeServiceErrorsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeServiceErrorsOutputResponse, DescribeServiceErrorsOutputError>) -> Void)
```

### `describeStackProvisioningParameters(input:completion:)`

Requests a description of a stack's provisioning parameters. Required Permissions: To use this action, an IAM user must have a Show, Deploy, or Manage permissions level for the stack or an attached policy that explicitly grants permissions. For more information about user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func describeStackProvisioningParameters(input: DescribeStackProvisioningParametersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeStackProvisioningParametersOutputResponse, DescribeStackProvisioningParametersOutputError>) -> Void)
```

### `describeStackSummary(input:completion:)`

Describes the number of layers and apps in a specified stack, and the number of instances in each state, such as running\_setup or online. Required Permissions: To use this action, an IAM user must have a Show, Deploy, or Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information about user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func describeStackSummary(input: DescribeStackSummaryInput, completion: @escaping (ClientRuntime.SdkResult<DescribeStackSummaryOutputResponse, DescribeStackSummaryOutputError>) -> Void)
```

### `describeStacks(input:completion:)`

Requests a description of one or more stacks. Required Permissions: To use this action, an IAM user must have a Show, Deploy, or Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information about user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func describeStacks(input: DescribeStacksInput, completion: @escaping (ClientRuntime.SdkResult<DescribeStacksOutputResponse, DescribeStacksOutputError>) -> Void)
```

### `describeTimeBasedAutoScaling(input:completion:)`

Describes time-based auto scaling configurations for specified instances. You must specify at least one of the parameters. Required Permissions: To use this action, an IAM user must have a Show, Deploy, or Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information about user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func describeTimeBasedAutoScaling(input: DescribeTimeBasedAutoScalingInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTimeBasedAutoScalingOutputResponse, DescribeTimeBasedAutoScalingOutputError>) -> Void)
```

### `describeUserProfiles(input:completion:)`

Describe specified users. Required Permissions: To use this action, an IAM user must have an attached policy that explicitly grants permissions. For more information about user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func describeUserProfiles(input: DescribeUserProfilesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeUserProfilesOutputResponse, DescribeUserProfilesOutputError>) -> Void)
```

### `describeVolumes(input:completion:)`

Describes an instance's Amazon EBS volumes. This call accepts only one resource-identifying parameter. Required Permissions: To use this action, an IAM user must have a Show, Deploy, or Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information about user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func describeVolumes(input: DescribeVolumesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeVolumesOutputResponse, DescribeVolumesOutputError>) -> Void)
```

### `detachElasticLoadBalancer(input:completion:)`

Detaches a specified Elastic Load Balancing instance from its layer. Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func detachElasticLoadBalancer(input: DetachElasticLoadBalancerInput, completion: @escaping (ClientRuntime.SdkResult<DetachElasticLoadBalancerOutputResponse, DetachElasticLoadBalancerOutputError>) -> Void)
```

### `disassociateElasticIp(input:completion:)`

Disassociates an Elastic IP address from its instance. The address remains registered with the stack. For more information, see [Resource Management](https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html). Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func disassociateElasticIp(input: DisassociateElasticIpInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateElasticIpOutputResponse, DisassociateElasticIpOutputError>) -> Void)
```

### `getHostnameSuggestion(input:completion:)`

Gets a generated host name for the specified layer, based on the current host name theme. Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func getHostnameSuggestion(input: GetHostnameSuggestionInput, completion: @escaping (ClientRuntime.SdkResult<GetHostnameSuggestionOutputResponse, GetHostnameSuggestionOutputError>) -> Void)
```

### `grantAccess(input:completion:)`

This action can be used only with Windows stacks. Grants RDP access to a Windows instance for a specified time period.

``` swift
public func grantAccess(input: GrantAccessInput, completion: @escaping (ClientRuntime.SdkResult<GrantAccessOutputResponse, GrantAccessOutputError>) -> Void)
```

### `listTags(input:completion:)`

Returns a list of tags that are applied to the specified stack or layer.

``` swift
public func listTags(input: ListTagsInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsOutputResponse, ListTagsOutputError>) -> Void)
```

### `rebootInstance(input:completion:)`

Reboots a specified instance. For more information, see [Starting, Stopping, and Rebooting Instances](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-starting.html). Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func rebootInstance(input: RebootInstanceInput, completion: @escaping (ClientRuntime.SdkResult<RebootInstanceOutputResponse, RebootInstanceOutputError>) -> Void)
```

### `registerEcsCluster(input:completion:)`

Registers a specified Amazon ECS cluster with a stack. You can register only one cluster with a stack. A cluster can be registered with only one stack. For more information, see [ Resource Management](https://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-ecscluster.html). Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack or an attached policy that explicitly grants permissions. For more information on user permissions, see [ Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func registerEcsCluster(input: RegisterEcsClusterInput, completion: @escaping (ClientRuntime.SdkResult<RegisterEcsClusterOutputResponse, RegisterEcsClusterOutputError>) -> Void)
```

### `registerElasticIp(input:completion:)`

Registers an Elastic IP address with a specified stack. An address can be registered with only one stack at a time. If the address is already registered, you must first deregister it by calling \[DeregisterElasticIp\]. For more information, see [Resource Management](https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html). Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func registerElasticIp(input: RegisterElasticIpInput, completion: @escaping (ClientRuntime.SdkResult<RegisterElasticIpOutputResponse, RegisterElasticIpOutputError>) -> Void)
```

### `registerInstance(input:completion:)`

Registers instances that were created outside of AWS OpsWorks Stacks with a specified stack. We do not recommend using this action to register instances. The complete registration operation includes two tasks: installing the AWS OpsWorks Stacks agent on the instance, and registering the instance with the stack. RegisterInstance handles only the second step. You should instead use the AWS CLI register command, which performs the entire registration operation. For more information, see [ Registering an Instance with an AWS OpsWorks Stacks Stack](https://docs.aws.amazon.com/opsworks/latest/userguide/registered-instances-register.html). Registered instances have the same requirements as instances that are created by using the \[CreateInstance\] API. For example, registered instances must be running a supported Linux-based operating system, and they must have a supported instance type. For more information about requirements for instances that you want to register, see [ Preparing the Instance](https://docs.aws.amazon.com/opsworks/latest/userguide/registered-instances-register-registering-preparer.html). Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func registerInstance(input: RegisterInstanceInput, completion: @escaping (ClientRuntime.SdkResult<RegisterInstanceOutputResponse, RegisterInstanceOutputError>) -> Void)
```

### `registerRdsDbInstance(input:completion:)`

Registers an Amazon RDS instance with a stack. Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func registerRdsDbInstance(input: RegisterRdsDbInstanceInput, completion: @escaping (ClientRuntime.SdkResult<RegisterRdsDbInstanceOutputResponse, RegisterRdsDbInstanceOutputError>) -> Void)
```

### `registerVolume(input:completion:)`

Registers an Amazon EBS volume with a specified stack. A volume can be registered with only one stack at a time. If the volume is already registered, you must first deregister it by calling \[DeregisterVolume\]. For more information, see [Resource Management](https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html). Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func registerVolume(input: RegisterVolumeInput, completion: @escaping (ClientRuntime.SdkResult<RegisterVolumeOutputResponse, RegisterVolumeOutputError>) -> Void)
```

### `setLoadBasedAutoScaling(input:completion:)`

Specify the load-based auto scaling configuration for a specified layer. For more information, see [Managing Load with Time-based and Load-based Instances](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-autoscaling.html). To use load-based auto scaling, you must create a set of load-based auto scaling instances. Load-based auto scaling operates only on the instances from that set, so you must ensure that you have created enough instances to handle the maximum anticipated load. Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func setLoadBasedAutoScaling(input: SetLoadBasedAutoScalingInput, completion: @escaping (ClientRuntime.SdkResult<SetLoadBasedAutoScalingOutputResponse, SetLoadBasedAutoScalingOutputError>) -> Void)
```

### `setPermission(input:completion:)`

Specifies a user's permissions. For more information, see [Security and Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/workingsecurity.html). Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func setPermission(input: SetPermissionInput, completion: @escaping (ClientRuntime.SdkResult<SetPermissionOutputResponse, SetPermissionOutputError>) -> Void)
```

### `setTimeBasedAutoScaling(input:completion:)`

Specify the time-based auto scaling configuration for a specified instance. For more information, see [Managing Load with Time-based and Load-based Instances](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-autoscaling.html). Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func setTimeBasedAutoScaling(input: SetTimeBasedAutoScalingInput, completion: @escaping (ClientRuntime.SdkResult<SetTimeBasedAutoScalingOutputResponse, SetTimeBasedAutoScalingOutputError>) -> Void)
```

### `startInstance(input:completion:)`

Starts a specified instance. For more information, see [Starting, Stopping, and Rebooting Instances](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-starting.html). Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func startInstance(input: StartInstanceInput, completion: @escaping (ClientRuntime.SdkResult<StartInstanceOutputResponse, StartInstanceOutputError>) -> Void)
```

### `startStack(input:completion:)`

Starts a stack's instances. Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func startStack(input: StartStackInput, completion: @escaping (ClientRuntime.SdkResult<StartStackOutputResponse, StartStackOutputError>) -> Void)
```

### `stopInstance(input:completion:)`

Stops a specified instance. When you stop a standard instance, the data disappears and must be reinstalled when you restart the instance. You can stop an Amazon EBS-backed instance without losing data. For more information, see [Starting, Stopping, and Rebooting Instances](https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-starting.html). Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func stopInstance(input: StopInstanceInput, completion: @escaping (ClientRuntime.SdkResult<StopInstanceOutputResponse, StopInstanceOutputError>) -> Void)
```

### `stopStack(input:completion:)`

Stops a specified stack. Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func stopStack(input: StopStackInput, completion: @escaping (ClientRuntime.SdkResult<StopStackOutputResponse, StopStackOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Apply cost-allocation tags to a specified stack or layer in AWS OpsWorks Stacks. For more information about how tagging works, see [Tags](https://docs.aws.amazon.com/opsworks/latest/userguide/tagging.html) in the AWS OpsWorks User Guide.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `unassignInstance(input:completion:)`

Unassigns a registered instance from all layers that are using the instance. The instance remains in the stack as an unassigned instance, and can be assigned to another layer as needed. You cannot use this action with instances that were created with AWS OpsWorks Stacks. Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack or an attached policy that explicitly grants permissions. For more information about user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func unassignInstance(input: UnassignInstanceInput, completion: @escaping (ClientRuntime.SdkResult<UnassignInstanceOutputResponse, UnassignInstanceOutputError>) -> Void)
```

### `unassignVolume(input:completion:)`

Unassigns an assigned Amazon EBS volume. The volume remains registered with the stack. For more information, see [Resource Management](https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html). Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func unassignVolume(input: UnassignVolumeInput, completion: @escaping (ClientRuntime.SdkResult<UnassignVolumeOutputResponse, UnassignVolumeOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes tags from a specified stack or layer.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateApp(input:completion:)`

Updates a specified app. Required Permissions: To use this action, an IAM user must have a Deploy or Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func updateApp(input: UpdateAppInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAppOutputResponse, UpdateAppOutputError>) -> Void)
```

### `updateElasticIp(input:completion:)`

Updates a registered Elastic IP address's name. For more information, see [Resource Management](https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html). Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func updateElasticIp(input: UpdateElasticIpInput, completion: @escaping (ClientRuntime.SdkResult<UpdateElasticIpOutputResponse, UpdateElasticIpOutputError>) -> Void)
```

### `updateInstance(input:completion:)`

Updates a specified instance. Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func updateInstance(input: UpdateInstanceInput, completion: @escaping (ClientRuntime.SdkResult<UpdateInstanceOutputResponse, UpdateInstanceOutputError>) -> Void)
```

### `updateLayer(input:completion:)`

Updates a specified layer. Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func updateLayer(input: UpdateLayerInput, completion: @escaping (ClientRuntime.SdkResult<UpdateLayerOutputResponse, UpdateLayerOutputError>) -> Void)
```

### `updateMyUserProfile(input:completion:)`

Updates a user's SSH public key. Required Permissions: To use this action, an IAM user must have self-management enabled or an attached policy that explicitly grants permissions. For more information about user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func updateMyUserProfile(input: UpdateMyUserProfileInput, completion: @escaping (ClientRuntime.SdkResult<UpdateMyUserProfileOutputResponse, UpdateMyUserProfileOutputError>) -> Void)
```

### `updateRdsDbInstance(input:completion:)`

Updates an Amazon RDS instance. Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func updateRdsDbInstance(input: UpdateRdsDbInstanceInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRdsDbInstanceOutputResponse, UpdateRdsDbInstanceOutputError>) -> Void)
```

### `updateStack(input:completion:)`

Updates a specified stack. Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func updateStack(input: UpdateStackInput, completion: @escaping (ClientRuntime.SdkResult<UpdateStackOutputResponse, UpdateStackOutputError>) -> Void)
```

### `updateUserProfile(input:completion:)`

Updates a specified user profile. Required Permissions: To use this action, an IAM user must have an attached policy that explicitly grants permissions. For more information about user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func updateUserProfile(input: UpdateUserProfileInput, completion: @escaping (ClientRuntime.SdkResult<UpdateUserProfileOutputResponse, UpdateUserProfileOutputError>) -> Void)
```

### `updateVolume(input:completion:)`

Updates an Amazon EBS volume's name or mount point. For more information, see [Resource Management](https://docs.aws.amazon.com/opsworks/latest/userguide/resources.html). Required Permissions: To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see [Managing User Permissions](https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html).

``` swift
public func updateVolume(input: UpdateVolumeInput, completion: @escaping (ClientRuntime.SdkResult<UpdateVolumeOutputResponse, UpdateVolumeOutputError>) -> Void)
```
