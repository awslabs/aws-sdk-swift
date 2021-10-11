# ResourceGroupsClientProtocol

<fullname>AWS Resource Groups</fullname>

``` swift
public protocol ResourceGroupsClientProtocol 
```

``` 
    AWS Resource Groups lets you organize AWS resources such as Amazon EC2 instances, Amazon Relational Database Service
        databases, and Amazon S3 buckets into groups using criteria that you define as tags. A
        resource group is a collection of resources that match the resource types specified in a
        query, and share one or more tags or portions of tags. You can create a group of
        resources based on their roles in your cloud infrastructure, lifecycle stages, regions,
        application layers, or virtually any criteria. Resource Groups enable you to automate management
        tasks, such as those in AWS Systems Manager Automation documents, on tag-related resources in
        AWS Systems Manager. Groups of tagged resources also let you quickly view a custom console in
        AWS Systems Manager that shows AWS Config compliance and other monitoring data about member
        resources.
    To create a resource group, build a resource query, and specify tags that identify the
        criteria that members of the group have in common. Tags are key-value pairs.
    For more information about Resource Groups, see the <a href="https://docs.aws.amazon.com/ARG/latest/userguide/welcome.html">AWS Resource Groups User Guide.
    AWS Resource Groups uses a REST-compliant API that you can use to perform the following types of
        operations.


            Create, Read, Update, and Delete (CRUD) operations on resource groups and
                resource query entities


            Applying, editing, and removing tags from resource groups


            Resolving resource group member ARNs so they can be returned as search
                results


            Getting data about resources that are members of a group


            Searching AWS resources based on a resource query
```

## Requirements

### createGroup(input:​completion:​)

Creates a resource group with the specified name and description. You can optionally
include a resource query, or a service configuration. For more information about
constructing a resource query, see <a href="https:​//docs.aws.amazon.com/ARG/latest/userguide/gettingstarted-query.html#gettingstarted-query-cli-tag">Create a tag-based group in Resource Groups. For more
information about service configurations, see <a href="https:​//docs.aws.amazon.com/ARG/latest/APIReference/about-slg.html">Service configurations for resource
groups.

``` swift
func createGroup(input: CreateGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateGroupOutputResponse, CreateGroupOutputError>) -> Void)
```

``` 
        Minimum permissions

     To run this command, you must have the following permissions:



              resource-groups:CreateGroup
```

### deleteGroup(input:​completion:​)

Deletes the specified resource group. Deleting a resource group does not delete any
resources that are members of the group; it only deletes the group structure.

``` swift
func deleteGroup(input: DeleteGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteGroupOutputResponse, DeleteGroupOutputError>) -> Void)
```

``` 
        Minimum permissions

     To run this command, you must have the following permissions:



              resource-groups:DeleteGroup
```

### getGroup(input:​completion:​)

Returns information about a specified resource group.

``` swift
func getGroup(input: GetGroupInput, completion: @escaping (ClientRuntime.SdkResult<GetGroupOutputResponse, GetGroupOutputError>) -> Void)
```

``` 
        Minimum permissions

     To run this command, you must have the following permissions:



              resource-groups:GetGroup
```

### getGroupConfiguration(input:​completion:​)

Returns the service configuration associated with the specified resource group. For
details about the service configuration syntax, see <a href="https:​//docs.aws.amazon.com/ARG/latest/APIReference/about-slg.html">Service configurations for resource
groups.

``` swift
func getGroupConfiguration(input: GetGroupConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetGroupConfigurationOutputResponse, GetGroupConfigurationOutputError>) -> Void)
```

``` 
        Minimum permissions

     To run this command, you must have the following permissions:



              resource-groups:GetGroupConfiguration
```

### getGroupQuery(input:​completion:​)

Retrieves the resource query associated with the specified resource group. For more
information about resource queries, see <a href="https:​//docs.aws.amazon.com/ARG/latest/userguide/gettingstarted-query.html#gettingstarted-query-cli-tag">Create
a tag-based group in Resource Groups.

``` swift
func getGroupQuery(input: GetGroupQueryInput, completion: @escaping (ClientRuntime.SdkResult<GetGroupQueryOutputResponse, GetGroupQueryOutputError>) -> Void)
```

``` 
        Minimum permissions

     To run this command, you must have the following permissions:



              resource-groups:GetGroupQuery
```

### getTags(input:​completion:​)

Returns a list of tags that are associated with a resource group, specified by an
ARN.

``` swift
func getTags(input: GetTagsInput, completion: @escaping (ClientRuntime.SdkResult<GetTagsOutputResponse, GetTagsOutputError>) -> Void)
```

``` 
        Minimum permissions

     To run this command, you must have the following permissions:



              resource-groups:GetTags
```

### groupResources(input:​completion:​)

Adds the specified resources to the specified group.

``` swift
func groupResources(input: GroupResourcesInput, completion: @escaping (ClientRuntime.SdkResult<GroupResourcesOutputResponse, GroupResourcesOutputError>) -> Void)
```

``` 
        Minimum permissions

     To run this command, you must have the following permissions:



              resource-groups:GroupResources
```

### listGroupResources(input:​completion:​)

Returns a list of ARNs of the resources that are members of a specified resource
group.

``` swift
func listGroupResources(input: ListGroupResourcesInput, completion: @escaping (ClientRuntime.SdkResult<ListGroupResourcesOutputResponse, ListGroupResourcesOutputError>) -> Void)
```

``` 
        Minimum permissions

     To run this command, you must have the following permissions:



              resource-groups:ListGroupResources




              cloudformation:DescribeStacks




              cloudformation:ListStackResources




              tag:GetResources
```

### listGroups(input:​completion:​)

Returns a list of existing resource groups in your account.

``` swift
func listGroups(input: ListGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListGroupsOutputResponse, ListGroupsOutputError>) -> Void)
```

``` 
        Minimum permissions

     To run this command, you must have the following permissions:



              resource-groups:ListGroups
```

### putGroupConfiguration(input:​completion:​)

Attaches a service configuration to the specified group. This occurs asynchronously,
and can take time to complete. You can use GetGroupConfiguration to
check the status of the update.

``` swift
func putGroupConfiguration(input: PutGroupConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<PutGroupConfigurationOutputResponse, PutGroupConfigurationOutputError>) -> Void)
```

``` 
        Minimum permissions

     To run this command, you must have the following permissions:



              resource-groups:PutGroupConfiguration
```

### searchResources(input:​completion:​)

Returns a list of AWS resource identifiers that matches the specified query. The
query uses the same format as a resource query in a CreateGroup or UpdateGroupQuery
operation.

``` swift
func searchResources(input: SearchResourcesInput, completion: @escaping (ClientRuntime.SdkResult<SearchResourcesOutputResponse, SearchResourcesOutputError>) -> Void)
```

``` 
        Minimum permissions

     To run this command, you must have the following permissions:



              resource-groups:SearchResources




              cloudformation:DescribeStacks




              cloudformation:ListStackResources




              tag:GetResources
```

### tag(input:​completion:​)

Adds tags to a resource group with the specified ARN. Existing tags on a resource
group are not changed if they are not specified in the request parameters.

``` swift
func tag(input: TagInput, completion: @escaping (ClientRuntime.SdkResult<TagOutputResponse, TagOutputError>) -> Void)
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

### ungroupResources(input:​completion:​)

Removes the specified resources from the specified group.

``` swift
func ungroupResources(input: UngroupResourcesInput, completion: @escaping (ClientRuntime.SdkResult<UngroupResourcesOutputResponse, UngroupResourcesOutputError>) -> Void)
```

``` 
        Minimum permissions

     To run this command, you must have the following permissions:



              resource-groups:UngroupResources
```

### untag(input:​completion:​)

Deletes tags from a specified resource group.

``` swift
func untag(input: UntagInput, completion: @escaping (ClientRuntime.SdkResult<UntagOutputResponse, UntagOutputError>) -> Void)
```

``` 
        Minimum permissions

     To run this command, you must have the following permissions:



              resource-groups:Untag
```

### updateGroup(input:​completion:​)

Updates the description for an existing group. You cannot update the name of a
resource group.

``` swift
func updateGroup(input: UpdateGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateGroupOutputResponse, UpdateGroupOutputError>) -> Void)
```

``` 
        Minimum permissions

     To run this command, you must have the following permissions:



              resource-groups:UpdateGroup
```

### updateGroupQuery(input:​completion:​)

Updates the resource query of a group. For more information about resource queries,
see <a href="https:​//docs.aws.amazon.com/ARG/latest/userguide/gettingstarted-query.html#gettingstarted-query-cli-tag">Create a tag-based group in Resource Groups.

``` swift
func updateGroupQuery(input: UpdateGroupQueryInput, completion: @escaping (ClientRuntime.SdkResult<UpdateGroupQueryOutputResponse, UpdateGroupQueryOutputError>) -> Void)
```

``` 
        Minimum permissions

     To run this command, you must have the following permissions:



              resource-groups:UpdateGroupQuery
```
