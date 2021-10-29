# Cloud9ClientProtocol

Cloud9 Cloud9 is a collection of tools that you can use to code, build, run, test, debug, and release software in the cloud. For more information about Cloud9, see the [Cloud9 User Guide](https://docs.aws.amazon.com/cloud9/latest/user-guide). Cloud9 supports these operations:

``` swift
public protocol Cloud9ClientProtocol 
```

  - CreateEnvironmentEC2: Creates an Cloud9 development environment, launches an Amazon EC2 instance, and then connects from the instance to the environment.

  - CreateEnvironmentMembership: Adds an environment member to an environment.

  - DeleteEnvironment: Deletes an environment. If an Amazon EC2 instance is connected to the environment, also terminates the instance.

  - DeleteEnvironmentMembership: Deletes an environment member from an environment.

  - DescribeEnvironmentMemberships: Gets information about environment members for an environment.

  - DescribeEnvironments: Gets information about environments.

  - DescribeEnvironmentStatus: Gets status information for an environment.

  - ListEnvironments: Gets a list of environment identifiers.

  - ListTagsForResource: Gets the tags for an environment.

  - TagResource: Adds tags to an environment.

  - UntagResource: Removes tags from an environment.

  - UpdateEnvironment: Changes the settings of an existing environment.

  - UpdateEnvironmentMembership: Changes the settings of an existing environment member for an environment.

## Requirements

### createEnvironmentEC2(input:completion:)

Creates an Cloud9 development environment, launches an Amazon Elastic Compute Cloud (Amazon EC2) instance, and then connects from the instance to the environment.

``` swift
func createEnvironmentEC2(input: CreateEnvironmentEC2Input, completion: @escaping (ClientRuntime.SdkResult<CreateEnvironmentEC2OutputResponse, CreateEnvironmentEC2OutputError>) -> Void)
```

### createEnvironmentMembership(input:completion:)

Adds an environment member to an Cloud9 development environment.

``` swift
func createEnvironmentMembership(input: CreateEnvironmentMembershipInput, completion: @escaping (ClientRuntime.SdkResult<CreateEnvironmentMembershipOutputResponse, CreateEnvironmentMembershipOutputError>) -> Void)
```

### deleteEnvironment(input:completion:)

Deletes an Cloud9 development environment. If an Amazon EC2 instance is connected to the environment, also terminates the instance.

``` swift
func deleteEnvironment(input: DeleteEnvironmentInput, completion: @escaping (ClientRuntime.SdkResult<DeleteEnvironmentOutputResponse, DeleteEnvironmentOutputError>) -> Void)
```

### deleteEnvironmentMembership(input:completion:)

Deletes an environment member from an Cloud9 development environment.

``` swift
func deleteEnvironmentMembership(input: DeleteEnvironmentMembershipInput, completion: @escaping (ClientRuntime.SdkResult<DeleteEnvironmentMembershipOutputResponse, DeleteEnvironmentMembershipOutputError>) -> Void)
```

### describeEnvironmentMemberships(input:completion:)

Gets information about environment members for an Cloud9 development environment.

``` swift
func describeEnvironmentMemberships(input: DescribeEnvironmentMembershipsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEnvironmentMembershipsOutputResponse, DescribeEnvironmentMembershipsOutputError>) -> Void)
```

### describeEnvironments(input:completion:)

Gets information about Cloud9 development environments.

``` swift
func describeEnvironments(input: DescribeEnvironmentsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEnvironmentsOutputResponse, DescribeEnvironmentsOutputError>) -> Void)
```

### describeEnvironmentStatus(input:completion:)

Gets status information for an Cloud9 development environment.

``` swift
func describeEnvironmentStatus(input: DescribeEnvironmentStatusInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEnvironmentStatusOutputResponse, DescribeEnvironmentStatusOutputError>) -> Void)
```

### listEnvironments(input:completion:)

Gets a list of Cloud9 development environment identifiers.

``` swift
func listEnvironments(input: ListEnvironmentsInput, completion: @escaping (ClientRuntime.SdkResult<ListEnvironmentsOutputResponse, ListEnvironmentsOutputError>) -> Void)
```

### listTagsForResource(input:completion:)

Gets a list of the tags associated with an Cloud9 development environment.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### tagResource(input:completion:)

Adds tags to an Cloud9 development environment. Tags that you add to an Cloud9 environment by using this method will NOT be automatically propagated to underlying resources.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:completion:)

Removes tags from an Cloud9 development environment.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateEnvironment(input:completion:)

Changes the settings of an existing Cloud9 development environment.

``` swift
func updateEnvironment(input: UpdateEnvironmentInput, completion: @escaping (ClientRuntime.SdkResult<UpdateEnvironmentOutputResponse, UpdateEnvironmentOutputError>) -> Void)
```

### updateEnvironmentMembership(input:completion:)

Changes the settings of an existing environment member for an Cloud9 development environment.

``` swift
func updateEnvironmentMembership(input: UpdateEnvironmentMembershipInput, completion: @escaping (ClientRuntime.SdkResult<UpdateEnvironmentMembershipOutputResponse, UpdateEnvironmentMembershipOutputError>) -> Void)
```
