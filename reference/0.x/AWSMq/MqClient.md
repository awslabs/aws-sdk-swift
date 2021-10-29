# MqClient

``` swift
public class MqClient 
```

## Inheritance

[`MqClientProtocol`](/aws-sdk-swift/reference/0.x/AWSMq/MqClientProtocol)

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
public static let clientName = "MqClient"
```

## Methods

### `createBroker(input:completion:)`

Creates a broker. Note: This API is asynchronous. To create a broker, you must either use the AmazonMQFullAccess IAM policy or include the following EC2 permissions in your IAM policy.

``` swift
public func createBroker(input: CreateBrokerInput, completion: @escaping (ClientRuntime.SdkResult<CreateBrokerOutputResponse, CreateBrokerOutputError>) -> Void)
```

  - ec2:CreateNetworkInterface This permission is required to allow Amazon MQ to create an elastic network interface (ENI) on behalf of your account.

  - ec2:CreateNetworkInterfacePermission This permission is required to attach the ENI to the broker instance.

  - ec2:DeleteNetworkInterface

  - ec2:DeleteNetworkInterfacePermission

  - ec2:DetachNetworkInterface

  - ec2:DescribeInternetGateways

  - ec2:DescribeNetworkInterfaces

  - ec2:DescribeNetworkInterfacePermissions

  - ec2:DescribeRouteTables

  - ec2:DescribeSecurityGroups

  - ec2:DescribeSubnets

  - ec2:DescribeVpcs

For more information, see [Create an IAM User and Get Your AWS Credentials](https://docs.aws.amazon.com//amazon-mq/latest/developer-guide/amazon-mq-setting-up.html#create-iam-user) and [Never Modify or Delete the Amazon MQ Elastic Network Interface](https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/connecting-to-amazon-mq.html#never-modify-delete-elastic-network-interface) in the Amazon MQ Developer Guide.

### `createConfiguration(input:completion:)`

Creates a new configuration for the specified configuration name. Amazon MQ uses the default configuration (the engine type and version).

``` swift
public func createConfiguration(input: CreateConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<CreateConfigurationOutputResponse, CreateConfigurationOutputError>) -> Void)
```

### `createTags(input:completion:)`

Add a tag to a resource.

``` swift
public func createTags(input: CreateTagsInput, completion: @escaping (ClientRuntime.SdkResult<CreateTagsOutputResponse, CreateTagsOutputError>) -> Void)
```

### `createUser(input:completion:)`

Creates an ActiveMQ user.

``` swift
public func createUser(input: CreateUserInput, completion: @escaping (ClientRuntime.SdkResult<CreateUserOutputResponse, CreateUserOutputError>) -> Void)
```

### `deleteBroker(input:completion:)`

Deletes a broker. Note: This API is asynchronous.

``` swift
public func deleteBroker(input: DeleteBrokerInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBrokerOutputResponse, DeleteBrokerOutputError>) -> Void)
```

### `deleteTags(input:completion:)`

Removes a tag from a resource.

``` swift
public func deleteTags(input: DeleteTagsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTagsOutputResponse, DeleteTagsOutputError>) -> Void)
```

### `deleteUser(input:completion:)`

Deletes an ActiveMQ user.

``` swift
public func deleteUser(input: DeleteUserInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUserOutputResponse, DeleteUserOutputError>) -> Void)
```

### `describeBroker(input:completion:)`

Returns information about the specified broker.

``` swift
public func describeBroker(input: DescribeBrokerInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBrokerOutputResponse, DescribeBrokerOutputError>) -> Void)
```

### `describeBrokerEngineTypes(input:completion:)`

Describe available engine types and versions.

``` swift
public func describeBrokerEngineTypes(input: DescribeBrokerEngineTypesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBrokerEngineTypesOutputResponse, DescribeBrokerEngineTypesOutputError>) -> Void)
```

### `describeBrokerInstanceOptions(input:completion:)`

Describe available broker instance options.

``` swift
public func describeBrokerInstanceOptions(input: DescribeBrokerInstanceOptionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBrokerInstanceOptionsOutputResponse, DescribeBrokerInstanceOptionsOutputError>) -> Void)
```

### `describeConfiguration(input:completion:)`

Returns information about the specified configuration.

``` swift
public func describeConfiguration(input: DescribeConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeConfigurationOutputResponse, DescribeConfigurationOutputError>) -> Void)
```

### `describeConfigurationRevision(input:completion:)`

Returns the specified configuration revision for the specified configuration.

``` swift
public func describeConfigurationRevision(input: DescribeConfigurationRevisionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeConfigurationRevisionOutputResponse, DescribeConfigurationRevisionOutputError>) -> Void)
```

### `describeUser(input:completion:)`

Returns information about an ActiveMQ user.

``` swift
public func describeUser(input: DescribeUserInput, completion: @escaping (ClientRuntime.SdkResult<DescribeUserOutputResponse, DescribeUserOutputError>) -> Void)
```

### `listBrokers(input:completion:)`

Returns a list of all brokers.

``` swift
public func listBrokers(input: ListBrokersInput, completion: @escaping (ClientRuntime.SdkResult<ListBrokersOutputResponse, ListBrokersOutputError>) -> Void)
```

### `listConfigurationRevisions(input:completion:)`

Returns a list of all revisions for the specified configuration.

``` swift
public func listConfigurationRevisions(input: ListConfigurationRevisionsInput, completion: @escaping (ClientRuntime.SdkResult<ListConfigurationRevisionsOutputResponse, ListConfigurationRevisionsOutputError>) -> Void)
```

### `listConfigurations(input:completion:)`

Returns a list of all configurations.

``` swift
public func listConfigurations(input: ListConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<ListConfigurationsOutputResponse, ListConfigurationsOutputError>) -> Void)
```

### `listTags(input:completion:)`

Lists tags for a resource.

``` swift
public func listTags(input: ListTagsInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsOutputResponse, ListTagsOutputError>) -> Void)
```

### `listUsers(input:completion:)`

Returns a list of all ActiveMQ users.

``` swift
public func listUsers(input: ListUsersInput, completion: @escaping (ClientRuntime.SdkResult<ListUsersOutputResponse, ListUsersOutputError>) -> Void)
```

### `rebootBroker(input:completion:)`

Reboots a broker. Note: This API is asynchronous.

``` swift
public func rebootBroker(input: RebootBrokerInput, completion: @escaping (ClientRuntime.SdkResult<RebootBrokerOutputResponse, RebootBrokerOutputError>) -> Void)
```

### `updateBroker(input:completion:)`

Adds a pending configuration change to a broker.

``` swift
public func updateBroker(input: UpdateBrokerInput, completion: @escaping (ClientRuntime.SdkResult<UpdateBrokerOutputResponse, UpdateBrokerOutputError>) -> Void)
```

### `updateConfiguration(input:completion:)`

Updates the specified configuration.

``` swift
public func updateConfiguration(input: UpdateConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateConfigurationOutputResponse, UpdateConfigurationOutputError>) -> Void)
```

### `updateUser(input:completion:)`

Updates the information for an ActiveMQ user.

``` swift
public func updateUser(input: UpdateUserInput, completion: @escaping (ClientRuntime.SdkResult<UpdateUserOutputResponse, UpdateUserOutputError>) -> Void)
```
