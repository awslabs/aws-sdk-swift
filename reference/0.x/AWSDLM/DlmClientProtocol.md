# DlmClientProtocol

<fullname>Amazon Data Lifecycle Manager</fullname>
With Amazon Data Lifecycle Manager, you can manage the lifecycle of your Amazon Web Services resources. You create
lifecycle policies, which are used to automate operations on the specified
resources.
Amazon DLM supports Amazon EBS volumes and snapshots. For information about using Amazon DLM
with Amazon EBS, see <a href="https:​//docs.aws.amazon.com/AWSEC2/latest/UserGuide/snapshot-lifecycle.html">Automating the Amazon EBS
Snapshot Lifecycle in the Amazon EC2 User Guide.

``` swift
public protocol DlmClientProtocol 
```

## Requirements

### createLifecyclePolicy(input:​completion:​)

Creates a policy to manage the lifecycle of the specified Amazon Web Services resources. You can
create up to 100 lifecycle policies.

``` swift
func createLifecyclePolicy(input: CreateLifecyclePolicyInput, completion: @escaping (ClientRuntime.SdkResult<CreateLifecyclePolicyOutputResponse, CreateLifecyclePolicyOutputError>) -> Void)
```

### deleteLifecyclePolicy(input:​completion:​)

Deletes the specified lifecycle policy and halts the automated operations that the
policy specified.

``` swift
func deleteLifecyclePolicy(input: DeleteLifecyclePolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLifecyclePolicyOutputResponse, DeleteLifecyclePolicyOutputError>) -> Void)
```

### getLifecyclePolicies(input:​completion:​)

Gets summary information about all or the specified data lifecycle policies.
To get complete information about a policy, use GetLifecyclePolicy.

``` swift
func getLifecyclePolicies(input: GetLifecyclePoliciesInput, completion: @escaping (ClientRuntime.SdkResult<GetLifecyclePoliciesOutputResponse, GetLifecyclePoliciesOutputError>) -> Void)
```

### getLifecyclePolicy(input:​completion:​)

Gets detailed information about the specified lifecycle policy.

``` swift
func getLifecyclePolicy(input: GetLifecyclePolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetLifecyclePolicyOutputResponse, GetLifecyclePolicyOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

Lists the tags for the specified resource.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### tagResource(input:​completion:​)

Adds the specified tags to the specified resource.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:​completion:​)

Removes the specified tags from the specified resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateLifecyclePolicy(input:​completion:​)

Updates the specified lifecycle policy.

``` swift
func updateLifecyclePolicy(input: UpdateLifecyclePolicyInput, completion: @escaping (ClientRuntime.SdkResult<UpdateLifecyclePolicyOutputResponse, UpdateLifecyclePolicyOutputError>) -> Void)
```
