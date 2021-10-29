# KafkaConnectClient

``` swift
public class KafkaConnectClient 
```

## Inheritance

[`KafkaConnectClientProtocol`](/aws-sdk-swift/reference/0.x/AWSKafkaConnect/KafkaConnectClientProtocol)

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
public static let clientName = "KafkaConnectClient"
```

## Methods

### `createConnector(input:completion:)`

Creates a connector using the specified properties.

``` swift
public func createConnector(input: CreateConnectorInput, completion: @escaping (ClientRuntime.SdkResult<CreateConnectorOutputResponse, CreateConnectorOutputError>) -> Void)
```

### `createCustomPlugin(input:completion:)`

Creates a custom plugin using the specified properties.

``` swift
public func createCustomPlugin(input: CreateCustomPluginInput, completion: @escaping (ClientRuntime.SdkResult<CreateCustomPluginOutputResponse, CreateCustomPluginOutputError>) -> Void)
```

### `createWorkerConfiguration(input:completion:)`

Creates a worker configuration using the specified properties.

``` swift
public func createWorkerConfiguration(input: CreateWorkerConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<CreateWorkerConfigurationOutputResponse, CreateWorkerConfigurationOutputError>) -> Void)
```

### `deleteConnector(input:completion:)`

Deletes the specified connector.

``` swift
public func deleteConnector(input: DeleteConnectorInput, completion: @escaping (ClientRuntime.SdkResult<DeleteConnectorOutputResponse, DeleteConnectorOutputError>) -> Void)
```

### `describeConnector(input:completion:)`

Returns summary information about the connector.

``` swift
public func describeConnector(input: DescribeConnectorInput, completion: @escaping (ClientRuntime.SdkResult<DescribeConnectorOutputResponse, DescribeConnectorOutputError>) -> Void)
```

### `describeCustomPlugin(input:completion:)`

A summary description of the custom plugin.

``` swift
public func describeCustomPlugin(input: DescribeCustomPluginInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCustomPluginOutputResponse, DescribeCustomPluginOutputError>) -> Void)
```

### `describeWorkerConfiguration(input:completion:)`

Returns information about a worker configuration.

``` swift
public func describeWorkerConfiguration(input: DescribeWorkerConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeWorkerConfigurationOutputResponse, DescribeWorkerConfigurationOutputError>) -> Void)
```

### `listConnectors(input:completion:)`

Returns a list of all the connectors in this account and Region. The list is limited to connectors whose name starts with the specified prefix. The response also includes a description of each of the listed connectors.

``` swift
public func listConnectors(input: ListConnectorsInput, completion: @escaping (ClientRuntime.SdkResult<ListConnectorsOutputResponse, ListConnectorsOutputError>) -> Void)
```

### `listCustomPlugins(input:completion:)`

Returns a list of all of the custom plugins in this account and Region.

``` swift
public func listCustomPlugins(input: ListCustomPluginsInput, completion: @escaping (ClientRuntime.SdkResult<ListCustomPluginsOutputResponse, ListCustomPluginsOutputError>) -> Void)
```

### `listWorkerConfigurations(input:completion:)`

Returns a list of all of the worker configurations in this account and Region.

``` swift
public func listWorkerConfigurations(input: ListWorkerConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<ListWorkerConfigurationsOutputResponse, ListWorkerConfigurationsOutputError>) -> Void)
```

### `updateConnector(input:completion:)`

Updates the specified connector.

``` swift
public func updateConnector(input: UpdateConnectorInput, completion: @escaping (ClientRuntime.SdkResult<UpdateConnectorOutputResponse, UpdateConnectorOutputError>) -> Void)
```
