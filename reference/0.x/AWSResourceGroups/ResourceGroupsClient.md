# ResourceGroupsClient

``` swift
public class ResourceGroupsClient 
```

## Inheritance

[`ResourceGroupsClientProtocol`](/aws-sdk-swift/reference/0.x/AWSResourceGroups/ResourceGroupsClientProtocol)

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

### `createGroup(input:completion:)`

Creates a resource group with the specified name and description. You can optionally
include a resource query, or a service configuration. For more information about
constructing a resource query, see <a href="https:​//docs.aws.amazon.com/ARG/latest/userguide/gettingstarted-query.html#gettingstarted-query-cli-tag">Create a tag-based group in Resource Groups. For more
information about service configurations, see <a href="https:​//docs.aws.amazon.com/ARG/latest/APIReference/about-slg.html">Service configurations for resource
groups.

``` swift
public func createGroup(input: CreateGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateGroupOutputResponse, CreateGroupOutputError>) -> Void)
```

``` 
        Minimum permissions

     To run this command, you must have the following permissions:



              resource-groups:CreateGroup
```

### `deleteGroup(input:completion:)`

Deletes the specified resource group. Deleting a resource group does not delete any
resources that are members of the group; it only deletes the group structure.

``` swift
public func deleteGroup(input: DeleteGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteGroupOutputResponse, DeleteGroupOutputError>) -> Void)
```

``` 
        Minimum permissions

     To run this command, you must have the following permissions:



              resource-groups:DeleteGroup
```

### `getGroup(input:completion:)`

Returns information about a specified resource group.

``` swift
public func getGroup(input: GetGroupInput, completion: @escaping (ClientRuntime.SdkResult<GetGroupOutputResponse, GetGroupOutputError>) -> Void)
```

``` 
        Minimum permissions

     To run this command, you must have the following permissions:



              resource-groups:GetGroup
```

### `getGroupConfiguration(input:completion:)`

Returns the service configuration associated with the specified resource group. For
details about the service configuration syntax, see <a href="https:​//docs.aws.amazon.com/ARG/latest/APIReference/about-slg.html">Service configurations for resource
groups.

``` swift
public func getGroupConfiguration(input: GetGroupConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetGroupConfigurationOutputResponse, GetGroupConfigurationOutputError>) -> Void)
```

``` 
        Minimum permissions

     To run this command, you must have the following permissions:



              resource-groups:GetGroupConfiguration
```

### `getGroupQuery(input:completion:)`

Retrieves the resource query associated with the specified resource group. For more
information about resource queries, see <a href="https:​//docs.aws.amazon.com/ARG/latest/userguide/gettingstarted-query.html#gettingstarted-query-cli-tag">Create
a tag-based group in Resource Groups.

``` swift
public func getGroupQuery(input: GetGroupQueryInput, completion: @escaping (ClientRuntime.SdkResult<GetGroupQueryOutputResponse, GetGroupQueryOutputError>) -> Void)
```

``` 
        Minimum permissions

     To run this command, you must have the following permissions:



              resource-groups:GetGroupQuery
```

### `getTags(input:completion:)`

Returns a list of tags that are associated with a resource group, specified by an
ARN.

``` swift
public func getTags(input: GetTagsInput, completion: @escaping (ClientRuntime.SdkResult<GetTagsOutputResponse, GetTagsOutputError>) -> Void)
```

``` 
        Minimum permissions

     To run this command, you must have the following permissions:



              resource-groups:GetTags
```

### `groupResources(input:completion:)`

Adds the specified resources to the specified group.

``` swift
public func groupResources(input: GroupResourcesInput, completion: @escaping (ClientRuntime.SdkResult<GroupResourcesOutputResponse, GroupResourcesOutputError>) -> Void)
```

``` 
        Minimum permissions

     To run this command, you must have the following permissions:



              resource-groups:GroupResources
```

### `listGroupResources(input:completion:)`

Returns a list of ARNs of the resources that are members of a specified resource
group.

``` swift
public func listGroupResources(input: ListGroupResourcesInput, completion: @escaping (ClientRuntime.SdkResult<ListGroupResourcesOutputResponse, ListGroupResourcesOutputError>) -> Void)
```

``` 
        Minimum permissions

     To run this command, you must have the following permissions:



              resource-groups:ListGroupResources




              cloudformation:DescribeStacks




              cloudformation:ListStackResources




              tag:GetResources
```

### `listGroups(input:completion:)`

Returns a list of existing resource groups in your account.

``` swift
public func listGroups(input: ListGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListGroupsOutputResponse, ListGroupsOutputError>) -> Void)
```

``` 
        Minimum permissions

     To run this command, you must have the following permissions:



              resource-groups:ListGroups
```

### `putGroupConfiguration(input:completion:)`

Attaches a service configuration to the specified group. This occurs asynchronously,
and can take time to complete. You can use GetGroupConfiguration to
check the status of the update.

``` swift
public func putGroupConfiguration(input: PutGroupConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<PutGroupConfigurationOutputResponse, PutGroupConfigurationOutputError>) -> Void)
```

``` 
        Minimum permissions

     To run this command, you must have the following permissions:



              resource-groups:PutGroupConfiguration
```

### `searchResources(input:completion:)`

Returns a list of AWS resource identifiers that matches the specified query. The
query uses the same format as a resource query in a CreateGroup or UpdateGroupQuery
operation.

``` swift
public func searchResources(input: SearchResourcesInput, completion: @escaping (ClientRuntime.SdkResult<SearchResourcesOutputResponse, SearchResourcesOutputError>) -> Void)
```

``` 
        Minimum permissions

     To run this command, you must have the following permissions:



              resource-groups:SearchResources




              cloudformation:DescribeStacks




              cloudformation:ListStackResources




              tag:GetResources
```

### `tag(input:completion:)`

Adds tags to a resource group with the specified ARN. Existing tags on a resource
group are not changed if they are not specified in the request parameters.

``` swift
public func tag(input: TagInput, completion: @escaping (ClientRuntime.SdkResult<TagOutputResponse, TagOutputError>) -> Void)
```

``` 
        Do not store personally identifiable information (PII) or other confidential or
            sensitive information in tags. We use tags to provide you with billing and
            administration services. Tags are not intended to be used for private or sensitive
            data.


        Minimum permissions

     To run this command, you must have the following permissions:



              resource-groups:Tag
```

### `ungroupResources(input:completion:)`

Removes the specified resources from the specified group.

``` swift
public func ungroupResources(input: UngroupResourcesInput, completion: @escaping (ClientRuntime.SdkResult<UngroupResourcesOutputResponse, UngroupResourcesOutputError>) -> Void)
```

``` 
        Minimum permissions

     To run this command, you must have the following permissions:



              resource-groups:UngroupResources
```

### `untag(input:completion:)`

Deletes tags from a specified resource group.

``` swift
public func untag(input: UntagInput, completion: @escaping (ClientRuntime.SdkResult<UntagOutputResponse, UntagOutputError>) -> Void)
```

``` 
        Minimum permissions

     To run this command, you must have the following permissions:



              resource-groups:Untag
```

### `updateGroup(input:completion:)`

Updates the description for an existing group. You cannot update the name of a
resource group.

``` swift
public func updateGroup(input: UpdateGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateGroupOutputResponse, UpdateGroupOutputError>) -> Void)
```

``` 
        Minimum permissions

     To run this command, you must have the following permissions:



              resource-groups:UpdateGroup
```

### `updateGroupQuery(input:completion:)`

Updates the resource query of a group. For more information about resource queries,
see <a href="https:​//docs.aws.amazon.com/ARG/latest/userguide/gettingstarted-query.html#gettingstarted-query-cli-tag">Create a tag-based group in Resource Groups.

``` swift
public func updateGroupQuery(input: UpdateGroupQueryInput, completion: @escaping (ClientRuntime.SdkResult<UpdateGroupQueryOutputResponse, UpdateGroupQueryOutputError>) -> Void)
```

``` 
        Minimum permissions

     To run this command, you must have the following permissions:



              resource-groups:UpdateGroupQuery
```
