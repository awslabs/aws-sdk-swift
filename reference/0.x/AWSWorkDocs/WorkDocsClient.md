# WorkDocsClient

``` swift
public class WorkDocsClient 
```

## Inheritance

[`WorkDocsClientProtocol`](/aws-sdk-swift/reference/0.x/AWSWorkDocs/WorkDocsClientProtocol)

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

### `abortDocumentVersionUpload(input:completion:)`

Aborts the upload of the specified document version that was previously initiated
by InitiateDocumentVersionUpload. The client should make this call
only when it no longer intends to upload the document version, or fails to do
so.

``` swift
public func abortDocumentVersionUpload(input: AbortDocumentVersionUploadInput, completion: @escaping (ClientRuntime.SdkResult<AbortDocumentVersionUploadOutputResponse, AbortDocumentVersionUploadOutputError>) -> Void)
```

### `activateUser(input:completion:)`

Activates the specified user. Only active users can access Amazon
WorkDocs.

``` swift
public func activateUser(input: ActivateUserInput, completion: @escaping (ClientRuntime.SdkResult<ActivateUserOutputResponse, ActivateUserOutputError>) -> Void)
```

### `addResourcePermissions(input:completion:)`

Creates a set of permissions for the specified folder or document. The resource
permissions are overwritten if the principals already have different
permissions.

``` swift
public func addResourcePermissions(input: AddResourcePermissionsInput, completion: @escaping (ClientRuntime.SdkResult<AddResourcePermissionsOutputResponse, AddResourcePermissionsOutputError>) -> Void)
```

### `createComment(input:completion:)`

Adds a new comment to the specified document version.

``` swift
public func createComment(input: CreateCommentInput, completion: @escaping (ClientRuntime.SdkResult<CreateCommentOutputResponse, CreateCommentOutputError>) -> Void)
```

### `createCustomMetadata(input:completion:)`

Adds one or more custom properties to the specified resource (a folder, document,
or version).

``` swift
public func createCustomMetadata(input: CreateCustomMetadataInput, completion: @escaping (ClientRuntime.SdkResult<CreateCustomMetadataOutputResponse, CreateCustomMetadataOutputError>) -> Void)
```

### `createFolder(input:completion:)`

Creates a folder with the specified name and parent folder.

``` swift
public func createFolder(input: CreateFolderInput, completion: @escaping (ClientRuntime.SdkResult<CreateFolderOutputResponse, CreateFolderOutputError>) -> Void)
```

### `createLabels(input:completion:)`

Adds the specified list of labels to the given resource (a document or
folder)

``` swift
public func createLabels(input: CreateLabelsInput, completion: @escaping (ClientRuntime.SdkResult<CreateLabelsOutputResponse, CreateLabelsOutputError>) -> Void)
```

### `createNotificationSubscription(input:completion:)`

Configure Amazon WorkDocs to use Amazon SNS notifications. The endpoint receives a
confirmation message, and must confirm the subscription.
For more information, see <a href="https:​//docs.aws.amazon.com/workdocs/latest/developerguide/subscribe-notifications.html">Subscribe to
Notifications in the Amazon WorkDocs Developer
Guide.

``` swift
public func createNotificationSubscription(input: CreateNotificationSubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<CreateNotificationSubscriptionOutputResponse, CreateNotificationSubscriptionOutputError>) -> Void)
```

### `createUser(input:completion:)`

Creates a user in a Simple AD or Microsoft AD directory. The status of a newly
created user is "ACTIVE". New users can access Amazon WorkDocs.

``` swift
public func createUser(input: CreateUserInput, completion: @escaping (ClientRuntime.SdkResult<CreateUserOutputResponse, CreateUserOutputError>) -> Void)
```

### `deactivateUser(input:completion:)`

Deactivates the specified user, which revokes the user's access to Amazon
WorkDocs.

``` swift
public func deactivateUser(input: DeactivateUserInput, completion: @escaping (ClientRuntime.SdkResult<DeactivateUserOutputResponse, DeactivateUserOutputError>) -> Void)
```

### `deleteComment(input:completion:)`

Deletes the specified comment from the document version.

``` swift
public func deleteComment(input: DeleteCommentInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCommentOutputResponse, DeleteCommentOutputError>) -> Void)
```

### `deleteCustomMetadata(input:completion:)`

Deletes custom metadata from the specified resource.

``` swift
public func deleteCustomMetadata(input: DeleteCustomMetadataInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCustomMetadataOutputResponse, DeleteCustomMetadataOutputError>) -> Void)
```

### `deleteDocument(input:completion:)`

Permanently deletes the specified document and its associated metadata.

``` swift
public func deleteDocument(input: DeleteDocumentInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDocumentOutputResponse, DeleteDocumentOutputError>) -> Void)
```

### `deleteFolder(input:completion:)`

Permanently deletes the specified folder and its contents.

``` swift
public func deleteFolder(input: DeleteFolderInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFolderOutputResponse, DeleteFolderOutputError>) -> Void)
```

### `deleteFolderContents(input:completion:)`

Deletes the contents of the specified folder.

``` swift
public func deleteFolderContents(input: DeleteFolderContentsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFolderContentsOutputResponse, DeleteFolderContentsOutputError>) -> Void)
```

### `deleteLabels(input:completion:)`

Deletes the specified list of labels from a resource.

``` swift
public func deleteLabels(input: DeleteLabelsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLabelsOutputResponse, DeleteLabelsOutputError>) -> Void)
```

### `deleteNotificationSubscription(input:completion:)`

Deletes the specified subscription from the specified organization.

``` swift
public func deleteNotificationSubscription(input: DeleteNotificationSubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteNotificationSubscriptionOutputResponse, DeleteNotificationSubscriptionOutputError>) -> Void)
```

### `deleteUser(input:completion:)`

Deletes the specified user from a Simple AD or Microsoft AD directory.

``` swift
public func deleteUser(input: DeleteUserInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUserOutputResponse, DeleteUserOutputError>) -> Void)
```

### `describeActivities(input:completion:)`

Describes the user activities in a specified time period.

``` swift
public func describeActivities(input: DescribeActivitiesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeActivitiesOutputResponse, DescribeActivitiesOutputError>) -> Void)
```

### `describeComments(input:completion:)`

List all the comments for the specified document version.

``` swift
public func describeComments(input: DescribeCommentsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCommentsOutputResponse, DescribeCommentsOutputError>) -> Void)
```

### `describeDocumentVersions(input:completion:)`

Retrieves the document versions for the specified document.
By default, only active versions are returned.

``` swift
public func describeDocumentVersions(input: DescribeDocumentVersionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDocumentVersionsOutputResponse, DescribeDocumentVersionsOutputError>) -> Void)
```

### `describeFolderContents(input:completion:)`

Describes the contents of the specified folder, including its documents and
subfolders.
By default, Amazon WorkDocs returns the first 100 active document and folder
metadata items. If there are more results, the response includes a marker that you can
use to request the next set of results. You can also request initialized
documents.

``` swift
public func describeFolderContents(input: DescribeFolderContentsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFolderContentsOutputResponse, DescribeFolderContentsOutputError>) -> Void)
```

### `describeGroups(input:completion:)`

Describes the groups specified by the query. Groups are defined by the underlying
Active Directory.

``` swift
public func describeGroups(input: DescribeGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeGroupsOutputResponse, DescribeGroupsOutputError>) -> Void)
```

### `describeNotificationSubscriptions(input:completion:)`

Lists the specified notification subscriptions.

``` swift
public func describeNotificationSubscriptions(input: DescribeNotificationSubscriptionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeNotificationSubscriptionsOutputResponse, DescribeNotificationSubscriptionsOutputError>) -> Void)
```

### `describeResourcePermissions(input:completion:)`

Describes the permissions of a specified resource.

``` swift
public func describeResourcePermissions(input: DescribeResourcePermissionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeResourcePermissionsOutputResponse, DescribeResourcePermissionsOutputError>) -> Void)
```

### `describeRootFolders(input:completion:)`

Describes the current user's special folders; the RootFolder and the
RecycleBin. RootFolder is the root of user's files and
folders and RecycleBin is the root of recycled items. This is not a valid
action for SigV4 (administrative API) clients.
This action requires an authentication token. To get an authentication token,
register an application with Amazon WorkDocs. For more information, see <a href="https:​//docs.aws.amazon.com/workdocs/latest/developerguide/wd-auth-user.html">Authentication and Access
Control for User Applications in the
Amazon
WorkDocs Developer Guide.

``` swift
public func describeRootFolders(input: DescribeRootFoldersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeRootFoldersOutputResponse, DescribeRootFoldersOutputError>) -> Void)
```

### `describeUsers(input:completion:)`

Describes the specified users. You can describe all users or filter the results
(for example, by status or organization).
By default, Amazon WorkDocs returns the first 24 active or pending users. If there
are more results, the response includes a marker that you can use to request the next
set of results.

``` swift
public func describeUsers(input: DescribeUsersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeUsersOutputResponse, DescribeUsersOutputError>) -> Void)
```

### `getCurrentUser(input:completion:)`

Retrieves details of the current user for whom the authentication token was
generated. This is not a valid action for SigV4 (administrative API) clients.
This action requires an authentication token. To get an authentication token,
register an application with Amazon WorkDocs. For more information, see <a href="https:​//docs.aws.amazon.com/workdocs/latest/developerguide/wd-auth-user.html">Authentication and Access
Control for User Applications in the
Amazon
WorkDocs Developer Guide.

``` swift
public func getCurrentUser(input: GetCurrentUserInput, completion: @escaping (ClientRuntime.SdkResult<GetCurrentUserOutputResponse, GetCurrentUserOutputError>) -> Void)
```

### `getDocument(input:completion:)`

Retrieves details of a document.

``` swift
public func getDocument(input: GetDocumentInput, completion: @escaping (ClientRuntime.SdkResult<GetDocumentOutputResponse, GetDocumentOutputError>) -> Void)
```

### `getDocumentPath(input:completion:)`

Retrieves the path information (the hierarchy from the root folder) for the
requested document.
By default, Amazon WorkDocs returns a maximum of 100 levels upwards from the
requested document and only includes the IDs of the parent folders in the path. You can
limit the maximum number of levels. You can also request the names of the parent
folders.

``` swift
public func getDocumentPath(input: GetDocumentPathInput, completion: @escaping (ClientRuntime.SdkResult<GetDocumentPathOutputResponse, GetDocumentPathOutputError>) -> Void)
```

### `getDocumentVersion(input:completion:)`

Retrieves version metadata for the specified document.

``` swift
public func getDocumentVersion(input: GetDocumentVersionInput, completion: @escaping (ClientRuntime.SdkResult<GetDocumentVersionOutputResponse, GetDocumentVersionOutputError>) -> Void)
```

### `getFolder(input:completion:)`

Retrieves the metadata of the specified folder.

``` swift
public func getFolder(input: GetFolderInput, completion: @escaping (ClientRuntime.SdkResult<GetFolderOutputResponse, GetFolderOutputError>) -> Void)
```

### `getFolderPath(input:completion:)`

Retrieves the path information (the hierarchy from the root folder) for the
specified folder.
By default, Amazon WorkDocs returns a maximum of 100 levels upwards from the
requested folder and only includes the IDs of the parent folders in the path. You can
limit the maximum number of levels. You can also request the parent folder
names.

``` swift
public func getFolderPath(input: GetFolderPathInput, completion: @escaping (ClientRuntime.SdkResult<GetFolderPathOutputResponse, GetFolderPathOutputError>) -> Void)
```

### `getResources(input:completion:)`

Retrieves a collection of resources, including folders and documents. The only
CollectionType supported is SHARED\_WITH\_ME.

``` swift
public func getResources(input: GetResourcesInput, completion: @escaping (ClientRuntime.SdkResult<GetResourcesOutputResponse, GetResourcesOutputError>) -> Void)
```

### `initiateDocumentVersionUpload(input:completion:)`

Creates a new document object and version object.
The client specifies the parent folder ID and name of the document to upload. The
ID is optionally specified when creating a new version of an existing document. This is
the first step to upload a document. Next, upload the document to the URL returned from
the call, and then call UpdateDocumentVersion.
To cancel the document upload, call AbortDocumentVersionUpload.

``` swift
public func initiateDocumentVersionUpload(input: InitiateDocumentVersionUploadInput, completion: @escaping (ClientRuntime.SdkResult<InitiateDocumentVersionUploadOutputResponse, InitiateDocumentVersionUploadOutputError>) -> Void)
```

### `removeAllResourcePermissions(input:completion:)`

Removes all the permissions from the specified resource.

``` swift
public func removeAllResourcePermissions(input: RemoveAllResourcePermissionsInput, completion: @escaping (ClientRuntime.SdkResult<RemoveAllResourcePermissionsOutputResponse, RemoveAllResourcePermissionsOutputError>) -> Void)
```

### `removeResourcePermission(input:completion:)`

Removes the permission for the specified principal from the specified
resource.

``` swift
public func removeResourcePermission(input: RemoveResourcePermissionInput, completion: @escaping (ClientRuntime.SdkResult<RemoveResourcePermissionOutputResponse, RemoveResourcePermissionOutputError>) -> Void)
```

### `updateDocument(input:completion:)`

Updates the specified attributes of a document. The user must have access to both
the document and its parent folder, if applicable.

``` swift
public func updateDocument(input: UpdateDocumentInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDocumentOutputResponse, UpdateDocumentOutputError>) -> Void)
```

### `updateDocumentVersion(input:completion:)`

Changes the status of the document version to ACTIVE.
Amazon WorkDocs also sets its document container to ACTIVE. This is the last step
in a document upload, after the client uploads the document to an S3-presigned URL
returned by InitiateDocumentVersionUpload.

``` swift
public func updateDocumentVersion(input: UpdateDocumentVersionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDocumentVersionOutputResponse, UpdateDocumentVersionOutputError>) -> Void)
```

### `updateFolder(input:completion:)`

Updates the specified attributes of the specified folder. The user must have access
to both the folder and its parent folder, if applicable.

``` swift
public func updateFolder(input: UpdateFolderInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFolderOutputResponse, UpdateFolderOutputError>) -> Void)
```

### `updateUser(input:completion:)`

Updates the specified attributes of the specified user, and grants or revokes
administrative privileges to the Amazon WorkDocs site.

``` swift
public func updateUser(input: UpdateUserInput, completion: @escaping (ClientRuntime.SdkResult<UpdateUserOutputResponse, UpdateUserOutputError>) -> Void)
```
