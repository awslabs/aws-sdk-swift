# DlmClient

``` swift
public class DlmClient 
```

## Inheritance

[`DlmClientProtocol`](/aws-sdk-swift/reference/0.x/AWSDLM/DlmClientProtocol)

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
public static let clientName = "DlmClient"
```

## Methods

### `createLifecyclePolicy(input:completion:)`

Creates a policy to manage the lifecycle of the specified Amazon Web Services resources. You can create up to 100 lifecycle policies.

``` swift
public func createLifecyclePolicy(input: CreateLifecyclePolicyInput, completion: @escaping (ClientRuntime.SdkResult<CreateLifecyclePolicyOutputResponse, CreateLifecyclePolicyOutputError>) -> Void)
```

### `deleteLifecyclePolicy(input:completion:)`

Deletes the specified lifecycle policy and halts the automated operations that the policy specified.

``` swift
public func deleteLifecyclePolicy(input: DeleteLifecyclePolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLifecyclePolicyOutputResponse, DeleteLifecyclePolicyOutputError>) -> Void)
```

### `getLifecyclePolicies(input:completion:)`

Gets summary information about all or the specified data lifecycle policies. To get complete information about a policy, use \[GetLifecyclePolicy\].

``` swift
public func getLifecyclePolicies(input: GetLifecyclePoliciesInput, completion: @escaping (ClientRuntime.SdkResult<GetLifecyclePoliciesOutputResponse, GetLifecyclePoliciesOutputError>) -> Void)
```

### `getLifecyclePolicy(input:completion:)`

Gets detailed information about the specified lifecycle policy.

``` swift
public func getLifecyclePolicy(input: GetLifecyclePolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetLifecyclePolicyOutputResponse, GetLifecyclePolicyOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Lists the tags for the specified resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Adds the specified tags to the specified resource.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes the specified tags from the specified resource.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateLifecyclePolicy(input:completion:)`

Updates the specified lifecycle policy.

``` swift
public func updateLifecyclePolicy(input: UpdateLifecyclePolicyInput, completion: @escaping (ClientRuntime.SdkResult<UpdateLifecyclePolicyOutputResponse, UpdateLifecyclePolicyOutputError>) -> Void)
```
