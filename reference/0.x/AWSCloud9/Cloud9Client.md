# Cloud9Client

``` swift
public class Cloud9Client 
```

## Inheritance

[`Cloud9ClientProtocol`](/aws-sdk-swift/reference/0.x/AWSCloud9/Cloud9ClientProtocol)

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

### `createEnvironmentEC2(input:completion:)`

Creates an Cloud9 development environment, launches an Amazon Elastic Compute Cloud (Amazon EC2) instance, and
then connects from the instance to the environment.

``` swift
public func createEnvironmentEC2(input: CreateEnvironmentEC2Input, completion: @escaping (ClientRuntime.SdkResult<CreateEnvironmentEC2OutputResponse, CreateEnvironmentEC2OutputError>) -> Void)
```

### `createEnvironmentMembership(input:completion:)`

Adds an environment member to an Cloud9 development environment.

``` swift
public func createEnvironmentMembership(input: CreateEnvironmentMembershipInput, completion: @escaping (ClientRuntime.SdkResult<CreateEnvironmentMembershipOutputResponse, CreateEnvironmentMembershipOutputError>) -> Void)
```

### `deleteEnvironment(input:completion:)`

Deletes an Cloud9 development environment. If an Amazon EC2 instance is connected to the
environment, also terminates the instance.

``` swift
public func deleteEnvironment(input: DeleteEnvironmentInput, completion: @escaping (ClientRuntime.SdkResult<DeleteEnvironmentOutputResponse, DeleteEnvironmentOutputError>) -> Void)
```

### `deleteEnvironmentMembership(input:completion:)`

Deletes an environment member from an Cloud9 development environment.

``` swift
public func deleteEnvironmentMembership(input: DeleteEnvironmentMembershipInput, completion: @escaping (ClientRuntime.SdkResult<DeleteEnvironmentMembershipOutputResponse, DeleteEnvironmentMembershipOutputError>) -> Void)
```

### `describeEnvironmentMemberships(input:completion:)`

Gets information about environment members for an Cloud9 development environment.

``` swift
public func describeEnvironmentMemberships(input: DescribeEnvironmentMembershipsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEnvironmentMembershipsOutputResponse, DescribeEnvironmentMembershipsOutputError>) -> Void)
```

### `describeEnvironmentStatus(input:completion:)`

Gets status information for an Cloud9 development environment.

``` swift
public func describeEnvironmentStatus(input: DescribeEnvironmentStatusInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEnvironmentStatusOutputResponse, DescribeEnvironmentStatusOutputError>) -> Void)
```

### `describeEnvironments(input:completion:)`

Gets information about Cloud9 development environments.

``` swift
public func describeEnvironments(input: DescribeEnvironmentsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEnvironmentsOutputResponse, DescribeEnvironmentsOutputError>) -> Void)
```

### `listEnvironments(input:completion:)`

Gets a list of Cloud9 development environment identifiers.

``` swift
public func listEnvironments(input: ListEnvironmentsInput, completion: @escaping (ClientRuntime.SdkResult<ListEnvironmentsOutputResponse, ListEnvironmentsOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Gets a list of the tags associated with an Cloud9 development environment.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Adds tags to an Cloud9 development environment.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

``` 
        Tags that you add to an Cloud9 environment by using this method will NOT be
    automatically propagated to underlying resources.
```

### `untagResource(input:completion:)`

Removes tags from an Cloud9 development environment.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateEnvironment(input:completion:)`

Changes the settings of an existing Cloud9 development environment.

``` swift
public func updateEnvironment(input: UpdateEnvironmentInput, completion: @escaping (ClientRuntime.SdkResult<UpdateEnvironmentOutputResponse, UpdateEnvironmentOutputError>) -> Void)
```

### `updateEnvironmentMembership(input:completion:)`

Changes the settings of an existing environment member for an Cloud9 development
environment.

``` swift
public func updateEnvironmentMembership(input: UpdateEnvironmentMembershipInput, completion: @escaping (ClientRuntime.SdkResult<UpdateEnvironmentMembershipOutputResponse, UpdateEnvironmentMembershipOutputError>) -> Void)
```
