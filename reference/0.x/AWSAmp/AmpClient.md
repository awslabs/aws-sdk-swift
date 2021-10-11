# AmpClient

``` swift
public class AmpClient 
```

## Inheritance

[`AmpClientProtocol`](/aws-sdk-swift/reference/0.x/AWSAmp/AmpClientProtocol)

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

### `createAlertManagerDefinition(input:completion:)`

Create an alert manager definition.

``` swift
public func createAlertManagerDefinition(input: CreateAlertManagerDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<CreateAlertManagerDefinitionOutputResponse, CreateAlertManagerDefinitionOutputError>) -> Void)
```

### `createRuleGroupsNamespace(input:completion:)`

Create a rule group namespace.

``` swift
public func createRuleGroupsNamespace(input: CreateRuleGroupsNamespaceInput, completion: @escaping (ClientRuntime.SdkResult<CreateRuleGroupsNamespaceOutputResponse, CreateRuleGroupsNamespaceOutputError>) -> Void)
```

### `createWorkspace(input:completion:)`

Creates a new AMP workspace.

``` swift
public func createWorkspace(input: CreateWorkspaceInput, completion: @escaping (ClientRuntime.SdkResult<CreateWorkspaceOutputResponse, CreateWorkspaceOutputError>) -> Void)
```

### `deleteAlertManagerDefinition(input:completion:)`

Deletes an alert manager definition.

``` swift
public func deleteAlertManagerDefinition(input: DeleteAlertManagerDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAlertManagerDefinitionOutputResponse, DeleteAlertManagerDefinitionOutputError>) -> Void)
```

### `deleteRuleGroupsNamespace(input:completion:)`

Delete a rule groups namespace.

``` swift
public func deleteRuleGroupsNamespace(input: DeleteRuleGroupsNamespaceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRuleGroupsNamespaceOutputResponse, DeleteRuleGroupsNamespaceOutputError>) -> Void)
```

### `deleteWorkspace(input:completion:)`

Deletes an AMP workspace.

``` swift
public func deleteWorkspace(input: DeleteWorkspaceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteWorkspaceOutputResponse, DeleteWorkspaceOutputError>) -> Void)
```

### `describeAlertManagerDefinition(input:completion:)`

Describes an alert manager definition.

``` swift
public func describeAlertManagerDefinition(input: DescribeAlertManagerDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAlertManagerDefinitionOutputResponse, DescribeAlertManagerDefinitionOutputError>) -> Void)
```

### `describeRuleGroupsNamespace(input:completion:)`

Describe a rule groups namespace.

``` swift
public func describeRuleGroupsNamespace(input: DescribeRuleGroupsNamespaceInput, completion: @escaping (ClientRuntime.SdkResult<DescribeRuleGroupsNamespaceOutputResponse, DescribeRuleGroupsNamespaceOutputError>) -> Void)
```

### `describeWorkspace(input:completion:)`

Describes an existing AMP workspace.

``` swift
public func describeWorkspace(input: DescribeWorkspaceInput, completion: @escaping (ClientRuntime.SdkResult<DescribeWorkspaceOutputResponse, DescribeWorkspaceOutputError>) -> Void)
```

### `listRuleGroupsNamespaces(input:completion:)`

Lists rule groups namespaces.

``` swift
public func listRuleGroupsNamespaces(input: ListRuleGroupsNamespacesInput, completion: @escaping (ClientRuntime.SdkResult<ListRuleGroupsNamespacesOutputResponse, ListRuleGroupsNamespacesOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Lists the tags you have assigned to the resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `listWorkspaces(input:completion:)`

Lists all AMP workspaces, including workspaces being created or deleted.

``` swift
public func listWorkspaces(input: ListWorkspacesInput, completion: @escaping (ClientRuntime.SdkResult<ListWorkspacesOutputResponse, ListWorkspacesOutputError>) -> Void)
```

### `putAlertManagerDefinition(input:completion:)`

Update an alert manager definition.

``` swift
public func putAlertManagerDefinition(input: PutAlertManagerDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<PutAlertManagerDefinitionOutputResponse, PutAlertManagerDefinitionOutputError>) -> Void)
```

### `putRuleGroupsNamespace(input:completion:)`

Update a rule groups namespace.

``` swift
public func putRuleGroupsNamespace(input: PutRuleGroupsNamespaceInput, completion: @escaping (ClientRuntime.SdkResult<PutRuleGroupsNamespaceOutputResponse, PutRuleGroupsNamespaceOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Creates tags for the specified resource.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Deletes tags from the specified resource.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateWorkspaceAlias(input:completion:)`

Updates an AMP workspace alias.

``` swift
public func updateWorkspaceAlias(input: UpdateWorkspaceAliasInput, completion: @escaping (ClientRuntime.SdkResult<UpdateWorkspaceAliasOutputResponse, UpdateWorkspaceAliasOutputError>) -> Void)
```
