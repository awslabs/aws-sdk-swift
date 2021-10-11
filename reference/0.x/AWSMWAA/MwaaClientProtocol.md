# MwaaClientProtocol

<fullname>Amazon Managed Workflows for Apache Airflow</fullname>
This section contains the Amazon Managed Workflows for Apache Airflow (MWAA) API reference documentation. For more information, see <a href="https:​//docs.aws.amazon.com/mwaa/latest/userguide/what-is-mwaa.html">What Is Amazon MWAA?.

``` swift
public protocol MwaaClientProtocol 
```

## Requirements

### createCliToken(input:​completion:​)

Create a CLI token to use Airflow CLI.

``` swift
func createCliToken(input: CreateCliTokenInput, completion: @escaping (ClientRuntime.SdkResult<CreateCliTokenOutputResponse, CreateCliTokenOutputError>) -> Void)
```

### createEnvironment(input:​completion:​)

Creates an Amazon Managed Workflows for Apache Airflow (MWAA) environment.

``` swift
func createEnvironment(input: CreateEnvironmentInput, completion: @escaping (ClientRuntime.SdkResult<CreateEnvironmentOutputResponse, CreateEnvironmentOutputError>) -> Void)
```

### createWebLoginToken(input:​completion:​)

Create a JWT token to be used to login to Airflow Web UI with claims based Authentication.

``` swift
func createWebLoginToken(input: CreateWebLoginTokenInput, completion: @escaping (ClientRuntime.SdkResult<CreateWebLoginTokenOutputResponse, CreateWebLoginTokenOutputError>) -> Void)
```

### deleteEnvironment(input:​completion:​)

Deletes an Amazon Managed Workflows for Apache Airflow (MWAA) environment.

``` swift
func deleteEnvironment(input: DeleteEnvironmentInput, completion: @escaping (ClientRuntime.SdkResult<DeleteEnvironmentOutputResponse, DeleteEnvironmentOutputError>) -> Void)
```

### getEnvironment(input:​completion:​)

Retrieves the details of an Amazon Managed Workflows for Apache Airflow (MWAA) environment.

``` swift
func getEnvironment(input: GetEnvironmentInput, completion: @escaping (ClientRuntime.SdkResult<GetEnvironmentOutputResponse, GetEnvironmentOutputError>) -> Void)
```

### listEnvironments(input:​completion:​)

Lists the Amazon Managed Workflows for Apache Airflow (MWAA) environments.

``` swift
func listEnvironments(input: ListEnvironmentsInput, completion: @escaping (ClientRuntime.SdkResult<ListEnvironmentsOutputResponse, ListEnvironmentsOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

Lists the key-value tag pairs associated to the Amazon Managed Workflows for Apache Airflow (MWAA) environment. For example, "Environment":​ "Staging".

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### publishMetrics(input:​completion:​)

An operation for publishing metrics from the customers to the Ops plane.

``` swift
func publishMetrics(input: PublishMetricsInput, completion: @escaping (ClientRuntime.SdkResult<PublishMetricsOutputResponse, PublishMetricsOutputError>) -> Void)
```

### tagResource(input:​completion:​)

Associates key-value tag pairs to your Amazon Managed Workflows for Apache Airflow (MWAA) environment.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:​completion:​)

Removes key-value tag pairs associated to your Amazon Managed Workflows for Apache Airflow (MWAA) environment. For example, "Environment":​ "Staging".

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateEnvironment(input:​completion:​)

Updates an Amazon Managed Workflows for Apache Airflow (MWAA) environment.

``` swift
func updateEnvironment(input: UpdateEnvironmentInput, completion: @escaping (ClientRuntime.SdkResult<UpdateEnvironmentOutputResponse, UpdateEnvironmentOutputError>) -> Void)
```
