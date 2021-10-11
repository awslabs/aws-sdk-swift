# MwaaClient

``` swift
public class MwaaClient 
```

## Inheritance

[`MwaaClientProtocol`](/aws-sdk-swift/reference/0.x/AWSMWAA/MwaaClientProtocol)

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

### `createCliToken(input:completion:)`

Create a CLI token to use Airflow CLI.

``` swift
public func createCliToken(input: CreateCliTokenInput, completion: @escaping (ClientRuntime.SdkResult<CreateCliTokenOutputResponse, CreateCliTokenOutputError>) -> Void)
```

### `createEnvironment(input:completion:)`

Creates an Amazon Managed Workflows for Apache Airflow (MWAA) environment.

``` swift
public func createEnvironment(input: CreateEnvironmentInput, completion: @escaping (ClientRuntime.SdkResult<CreateEnvironmentOutputResponse, CreateEnvironmentOutputError>) -> Void)
```

### `createWebLoginToken(input:completion:)`

Create a JWT token to be used to login to Airflow Web UI with claims based Authentication.

``` swift
public func createWebLoginToken(input: CreateWebLoginTokenInput, completion: @escaping (ClientRuntime.SdkResult<CreateWebLoginTokenOutputResponse, CreateWebLoginTokenOutputError>) -> Void)
```

### `deleteEnvironment(input:completion:)`

Deletes an Amazon Managed Workflows for Apache Airflow (MWAA) environment.

``` swift
public func deleteEnvironment(input: DeleteEnvironmentInput, completion: @escaping (ClientRuntime.SdkResult<DeleteEnvironmentOutputResponse, DeleteEnvironmentOutputError>) -> Void)
```

### `getEnvironment(input:completion:)`

Retrieves the details of an Amazon Managed Workflows for Apache Airflow (MWAA) environment.

``` swift
public func getEnvironment(input: GetEnvironmentInput, completion: @escaping (ClientRuntime.SdkResult<GetEnvironmentOutputResponse, GetEnvironmentOutputError>) -> Void)
```

### `listEnvironments(input:completion:)`

Lists the Amazon Managed Workflows for Apache Airflow (MWAA) environments.

``` swift
public func listEnvironments(input: ListEnvironmentsInput, completion: @escaping (ClientRuntime.SdkResult<ListEnvironmentsOutputResponse, ListEnvironmentsOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Lists the key-value tag pairs associated to the Amazon Managed Workflows for Apache Airflow (MWAA) environment. For example, "Environment":​ "Staging".

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `publishMetrics(input:completion:)`

An operation for publishing metrics from the customers to the Ops plane.

``` swift
public func publishMetrics(input: PublishMetricsInput, completion: @escaping (ClientRuntime.SdkResult<PublishMetricsOutputResponse, PublishMetricsOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Associates key-value tag pairs to your Amazon Managed Workflows for Apache Airflow (MWAA) environment.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes key-value tag pairs associated to your Amazon Managed Workflows for Apache Airflow (MWAA) environment. For example, "Environment":​ "Staging".

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateEnvironment(input:completion:)`

Updates an Amazon Managed Workflows for Apache Airflow (MWAA) environment.

``` swift
public func updateEnvironment(input: UpdateEnvironmentInput, completion: @escaping (ClientRuntime.SdkResult<UpdateEnvironmentOutputResponse, UpdateEnvironmentOutputError>) -> Void)
```
