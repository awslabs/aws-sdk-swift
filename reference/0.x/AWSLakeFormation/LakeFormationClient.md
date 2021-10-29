# LakeFormationClient

``` swift
public class LakeFormationClient 
```

## Inheritance

[`LakeFormationClientProtocol`](/aws-sdk-swift/reference/0.x/AWSLakeFormation/LakeFormationClientProtocol)

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
public static let clientName = "LakeFormationClient"
```

## Methods

### `addLFTagsToResource(input:completion:)`

Attaches one or more tags to an existing resource.

``` swift
public func addLFTagsToResource(input: AddLFTagsToResourceInput, completion: @escaping (ClientRuntime.SdkResult<AddLFTagsToResourceOutputResponse, AddLFTagsToResourceOutputError>) -> Void)
```

### `batchGrantPermissions(input:completion:)`

Batch operation to grant permissions to the principal.

``` swift
public func batchGrantPermissions(input: BatchGrantPermissionsInput, completion: @escaping (ClientRuntime.SdkResult<BatchGrantPermissionsOutputResponse, BatchGrantPermissionsOutputError>) -> Void)
```

### `batchRevokePermissions(input:completion:)`

Batch operation to revoke permissions from the principal.

``` swift
public func batchRevokePermissions(input: BatchRevokePermissionsInput, completion: @escaping (ClientRuntime.SdkResult<BatchRevokePermissionsOutputResponse, BatchRevokePermissionsOutputError>) -> Void)
```

### `createLFTag(input:completion:)`

Creates a tag with the specified name and values.

``` swift
public func createLFTag(input: CreateLFTagInput, completion: @escaping (ClientRuntime.SdkResult<CreateLFTagOutputResponse, CreateLFTagOutputError>) -> Void)
```

### `deleteLFTag(input:completion:)`

Deletes the specified tag key name. If the attribute key does not exist or the tag does not exist, then the operation will not do anything. If the attribute key exists, then the operation checks if any resources are tagged with this attribute key, if yes, the API throws a 400 Exception with the message "Delete not allowed" as the tag key is still attached with resources. You can consider untagging resources with this tag key.

``` swift
public func deleteLFTag(input: DeleteLFTagInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLFTagOutputResponse, DeleteLFTagOutputError>) -> Void)
```

### `deregisterResource(input:completion:)`

Deregisters the resource as managed by the Data Catalog. When you deregister a path, Lake Formation removes the path from the inline policy attached to your service-linked role.

``` swift
public func deregisterResource(input: DeregisterResourceInput, completion: @escaping (ClientRuntime.SdkResult<DeregisterResourceOutputResponse, DeregisterResourceOutputError>) -> Void)
```

### `describeResource(input:completion:)`

Retrieves the current data access role for the given resource registered in AWS Lake Formation.

``` swift
public func describeResource(input: DescribeResourceInput, completion: @escaping (ClientRuntime.SdkResult<DescribeResourceOutputResponse, DescribeResourceOutputError>) -> Void)
```

### `getDataLakeSettings(input:completion:)`

Retrieves the list of the data lake administrators of a Lake Formation-managed data lake.

``` swift
public func getDataLakeSettings(input: GetDataLakeSettingsInput, completion: @escaping (ClientRuntime.SdkResult<GetDataLakeSettingsOutputResponse, GetDataLakeSettingsOutputError>) -> Void)
```

### `getEffectivePermissionsForPath(input:completion:)`

Returns the Lake Formation permissions for a specified table or database resource located at a path in Amazon S3. GetEffectivePermissionsForPath will not return databases and tables if the catalog is encrypted.

``` swift
public func getEffectivePermissionsForPath(input: GetEffectivePermissionsForPathInput, completion: @escaping (ClientRuntime.SdkResult<GetEffectivePermissionsForPathOutputResponse, GetEffectivePermissionsForPathOutputError>) -> Void)
```

### `getLFTag(input:completion:)`

Returns a tag definition.

``` swift
public func getLFTag(input: GetLFTagInput, completion: @escaping (ClientRuntime.SdkResult<GetLFTagOutputResponse, GetLFTagOutputError>) -> Void)
```

### `getResourceLFTags(input:completion:)`

Returns the tags applied to a resource.

``` swift
public func getResourceLFTags(input: GetResourceLFTagsInput, completion: @escaping (ClientRuntime.SdkResult<GetResourceLFTagsOutputResponse, GetResourceLFTagsOutputError>) -> Void)
```

### `grantPermissions(input:completion:)`

Grants permissions to the principal to access metadata in the Data Catalog and data organized in underlying data storage such as Amazon S3. For information about permissions, see [Security and Access Control to Metadata and Data](https://docs-aws.amazon.com/lake-formation/latest/dg/security-data-access.html).

``` swift
public func grantPermissions(input: GrantPermissionsInput, completion: @escaping (ClientRuntime.SdkResult<GrantPermissionsOutputResponse, GrantPermissionsOutputError>) -> Void)
```

### `listLFTags(input:completion:)`

Lists tags that the requester has permission to view.

``` swift
public func listLFTags(input: ListLFTagsInput, completion: @escaping (ClientRuntime.SdkResult<ListLFTagsOutputResponse, ListLFTagsOutputError>) -> Void)
```

### `listPermissions(input:completion:)`

Returns a list of the principal permissions on the resource, filtered by the permissions of the caller. For example, if you are granted an ALTER permission, you are able to see only the principal permissions for ALTER. This operation returns only those permissions that have been explicitly granted. For information about permissions, see [Security and Access Control to Metadata and Data](https://docs-aws.amazon.com/lake-formation/latest/dg/security-data-access.html).

``` swift
public func listPermissions(input: ListPermissionsInput, completion: @escaping (ClientRuntime.SdkResult<ListPermissionsOutputResponse, ListPermissionsOutputError>) -> Void)
```

### `listResources(input:completion:)`

Lists the resources registered to be managed by the Data Catalog.

``` swift
public func listResources(input: ListResourcesInput, completion: @escaping (ClientRuntime.SdkResult<ListResourcesOutputResponse, ListResourcesOutputError>) -> Void)
```

### `putDataLakeSettings(input:completion:)`

Sets the list of data lake administrators who have admin privileges on all resources managed by Lake Formation. For more information on admin privileges, see [Granting Lake Formation Permissions](https://docs.aws.amazon.com/lake-formation/latest/dg/lake-formation-permissions.html). This API replaces the current list of data lake admins with the new list being passed. To add an admin, fetch the current list and add the new admin to that list and pass that list in this API.

``` swift
public func putDataLakeSettings(input: PutDataLakeSettingsInput, completion: @escaping (ClientRuntime.SdkResult<PutDataLakeSettingsOutputResponse, PutDataLakeSettingsOutputError>) -> Void)
```

### `registerResource(input:completion:)`

Registers the resource as managed by the Data Catalog. To add or update data, Lake Formation needs read/write access to the chosen Amazon S3 path. Choose a role that you know has permission to do this, or choose the AWSServiceRoleForLakeFormationDataAccess service-linked role. When you register the first Amazon S3 path, the service-linked role and a new inline policy are created on your behalf. Lake Formation adds the first path to the inline policy and attaches it to the service-linked role. When you register subsequent paths, Lake Formation adds the path to the existing policy. The following request registers a new location and gives AWS Lake Formation permission to use the service-linked role to access that location. ResourceArn = arn:aws:s3:::my-bucket UseServiceLinkedRole = true If UseServiceLinkedRole is not set to true, you must provide or set the RoleArn: arn:aws:iam::12345:role/my-data-access-role

``` swift
public func registerResource(input: RegisterResourceInput, completion: @escaping (ClientRuntime.SdkResult<RegisterResourceOutputResponse, RegisterResourceOutputError>) -> Void)
```

### `removeLFTagsFromResource(input:completion:)`

Removes a tag from the resource. Only database, table, or tableWithColumns resource are allowed. To tag columns, use the column inclusion list in tableWithColumns to specify column input.

``` swift
public func removeLFTagsFromResource(input: RemoveLFTagsFromResourceInput, completion: @escaping (ClientRuntime.SdkResult<RemoveLFTagsFromResourceOutputResponse, RemoveLFTagsFromResourceOutputError>) -> Void)
```

### `revokePermissions(input:completion:)`

Revokes permissions to the principal to access metadata in the Data Catalog and data organized in underlying data storage such as Amazon S3.

``` swift
public func revokePermissions(input: RevokePermissionsInput, completion: @escaping (ClientRuntime.SdkResult<RevokePermissionsOutputResponse, RevokePermissionsOutputError>) -> Void)
```

### `searchDatabasesByLFTags(input:completion:)`

This operation allows a search on DATABASE resources by TagCondition. This operation is used by admins who want to grant user permissions on certain TagConditions. Before making a grant, the admin can use SearchDatabasesByTags to find all resources where the given TagConditions are valid to verify whether the returned resources can be shared.

``` swift
public func searchDatabasesByLFTags(input: SearchDatabasesByLFTagsInput, completion: @escaping (ClientRuntime.SdkResult<SearchDatabasesByLFTagsOutputResponse, SearchDatabasesByLFTagsOutputError>) -> Void)
```

### `searchTablesByLFTags(input:completion:)`

This operation allows a search on TABLE resources by LFTags. This will be used by admins who want to grant user permissions on certain LFTags. Before making a grant, the admin can use SearchTablesByLFTags to find all resources where the given LFTags are valid to verify whether the returned resources can be shared.

``` swift
public func searchTablesByLFTags(input: SearchTablesByLFTagsInput, completion: @escaping (ClientRuntime.SdkResult<SearchTablesByLFTagsOutputResponse, SearchTablesByLFTagsOutputError>) -> Void)
```

### `updateLFTag(input:completion:)`

Updates the list of possible values for the specified tag key. If the tag does not exist, the operation throws an EntityNotFoundException. The values in the delete key values will be deleted from list of possible values. If any value in the delete key values is attached to a resource, then API errors out with a 400 Exception - "Update not allowed". Untag the attribute before deleting the tag key's value.

``` swift
public func updateLFTag(input: UpdateLFTagInput, completion: @escaping (ClientRuntime.SdkResult<UpdateLFTagOutputResponse, UpdateLFTagOutputError>) -> Void)
```

### `updateResource(input:completion:)`

Updates the data access role used for vending access to the given (registered) resource in AWS Lake Formation.

``` swift
public func updateResource(input: UpdateResourceInput, completion: @escaping (ClientRuntime.SdkResult<UpdateResourceOutputResponse, UpdateResourceOutputError>) -> Void)
```
