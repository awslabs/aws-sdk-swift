# MqClientProtocol

Amazon MQ is a managed message broker service for Apache ActiveMQ and RabbitMQ that makes it easy to set up and operate message brokers in the cloud. A message broker allows software applications and components to communicate using various programming languages, operating systems, and formal messaging protocols.

``` swift
public protocol MqClientProtocol 
```

## Requirements

### createBroker(input:completion:)

Creates a broker. Note: This API is asynchronous. To create a broker, you must either use the AmazonMQFullAccess IAM policy or include the following EC2 permissions in your IAM policy.

``` swift
func createBroker(input: CreateBrokerInput, completion: @escaping (ClientRuntime.SdkResult<CreateBrokerOutputResponse, CreateBrokerOutputError>) -> Void)
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

### createConfiguration(input:completion:)

Creates a new configuration for the specified configuration name. Amazon MQ uses the default configuration (the engine type and version).

``` swift
func createConfiguration(input: CreateConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<CreateConfigurationOutputResponse, CreateConfigurationOutputError>) -> Void)
```

### createTags(input:completion:)

Add a tag to a resource.

``` swift
func createTags(input: CreateTagsInput, completion: @escaping (ClientRuntime.SdkResult<CreateTagsOutputResponse, CreateTagsOutputError>) -> Void)
```

### createUser(input:completion:)

Creates an ActiveMQ user.

``` swift
func createUser(input: CreateUserInput, completion: @escaping (ClientRuntime.SdkResult<CreateUserOutputResponse, CreateUserOutputError>) -> Void)
```

### deleteBroker(input:completion:)

Deletes a broker. Note: This API is asynchronous.

``` swift
func deleteBroker(input: DeleteBrokerInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBrokerOutputResponse, DeleteBrokerOutputError>) -> Void)
```

### deleteTags(input:completion:)

Removes a tag from a resource.

``` swift
func deleteTags(input: DeleteTagsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTagsOutputResponse, DeleteTagsOutputError>) -> Void)
```

### deleteUser(input:completion:)

Deletes an ActiveMQ user.

``` swift
func deleteUser(input: DeleteUserInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUserOutputResponse, DeleteUserOutputError>) -> Void)
```

### describeBroker(input:completion:)

Returns information about the specified broker.

``` swift
func describeBroker(input: DescribeBrokerInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBrokerOutputResponse, DescribeBrokerOutputError>) -> Void)
```

### describeBrokerEngineTypes(input:completion:)

Describe available engine types and versions.

``` swift
func describeBrokerEngineTypes(input: DescribeBrokerEngineTypesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBrokerEngineTypesOutputResponse, DescribeBrokerEngineTypesOutputError>) -> Void)
```

### describeBrokerInstanceOptions(input:completion:)

Describe available broker instance options.

``` swift
func describeBrokerInstanceOptions(input: DescribeBrokerInstanceOptionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBrokerInstanceOptionsOutputResponse, DescribeBrokerInstanceOptionsOutputError>) -> Void)
```

### describeConfiguration(input:completion:)

Returns information about the specified configuration.

``` swift
func describeConfiguration(input: DescribeConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeConfigurationOutputResponse, DescribeConfigurationOutputError>) -> Void)
```

### describeConfigurationRevision(input:completion:)

Returns the specified configuration revision for the specified configuration.

``` swift
func describeConfigurationRevision(input: DescribeConfigurationRevisionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeConfigurationRevisionOutputResponse, DescribeConfigurationRevisionOutputError>) -> Void)
```

### describeUser(input:completion:)

Returns information about an ActiveMQ user.

``` swift
func describeUser(input: DescribeUserInput, completion: @escaping (ClientRuntime.SdkResult<DescribeUserOutputResponse, DescribeUserOutputError>) -> Void)
```

### listBrokers(input:completion:)

Returns a list of all brokers.

``` swift
func listBrokers(input: ListBrokersInput, completion: @escaping (ClientRuntime.SdkResult<ListBrokersOutputResponse, ListBrokersOutputError>) -> Void)
```

### listConfigurationRevisions(input:completion:)

Returns a list of all revisions for the specified configuration.

``` swift
func listConfigurationRevisions(input: ListConfigurationRevisionsInput, completion: @escaping (ClientRuntime.SdkResult<ListConfigurationRevisionsOutputResponse, ListConfigurationRevisionsOutputError>) -> Void)
```

### listConfigurations(input:completion:)

Returns a list of all configurations.

``` swift
func listConfigurations(input: ListConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<ListConfigurationsOutputResponse, ListConfigurationsOutputError>) -> Void)
```

### listTags(input:completion:)

Lists tags for a resource.

``` swift
func listTags(input: ListTagsInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsOutputResponse, ListTagsOutputError>) -> Void)
```

### listUsers(input:completion:)

Returns a list of all ActiveMQ users.

``` swift
func listUsers(input: ListUsersInput, completion: @escaping (ClientRuntime.SdkResult<ListUsersOutputResponse, ListUsersOutputError>) -> Void)
```

### rebootBroker(input:completion:)

Reboots a broker. Note: This API is asynchronous.

``` swift
func rebootBroker(input: RebootBrokerInput, completion: @escaping (ClientRuntime.SdkResult<RebootBrokerOutputResponse, RebootBrokerOutputError>) -> Void)
```

### updateBroker(input:completion:)

Adds a pending configuration change to a broker.

``` swift
func updateBroker(input: UpdateBrokerInput, completion: @escaping (ClientRuntime.SdkResult<UpdateBrokerOutputResponse, UpdateBrokerOutputError>) -> Void)
```

### updateConfiguration(input:completion:)

Updates the specified configuration.

``` swift
func updateConfiguration(input: UpdateConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateConfigurationOutputResponse, UpdateConfigurationOutputError>) -> Void)
```

### updateUser(input:completion:)

Updates the information for an ActiveMQ user.

``` swift
func updateUser(input: UpdateUserInput, completion: @escaping (ClientRuntime.SdkResult<UpdateUserOutputResponse, UpdateUserOutputError>) -> Void)
```
