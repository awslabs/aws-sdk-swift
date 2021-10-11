# ChimeSdkIdentityClientProtocol

The Amazon Chime SDK Identity APIs in this section allow software developers to create
and manage unique instances of their messaging applications. These APIs provide the
overarching framework for creating and sending messages. For more information about the
identity APIs, refer to <a href="https:​//docs.aws.amazon.com/chime/latest/APIReference/API_Operations_Amazon_Chime_SDK_Identity.html">Amazon Chime SDK identity.

``` swift
public protocol ChimeSdkIdentityClientProtocol 
```

## Requirements

### createAppInstance(input:​completion:​)

Creates an Amazon Chime SDK messaging AppInstance under an AWS account.
Only SDK messaging customers use this API. CreateAppInstance supports
idempotency behavior as described in the AWS API Standard.
identity

``` swift
func createAppInstance(input: CreateAppInstanceInput, completion: @escaping (ClientRuntime.SdkResult<CreateAppInstanceOutputResponse, CreateAppInstanceOutputError>) -> Void)
```

### createAppInstanceAdmin(input:​completion:​)

Promotes an AppInstanceUser to an AppInstanceAdmin. The
promoted user can perform the following actions.

``` swift
func createAppInstanceAdmin(input: CreateAppInstanceAdminInput, completion: @escaping (ClientRuntime.SdkResult<CreateAppInstanceAdminOutputResponse, CreateAppInstanceAdminOutputError>) -> Void)
```

``` 
              ChannelModerator actions across all channels in the
              AppInstance.



              DeleteChannelMessage actions.



     Only an AppInstanceUser can be promoted to an AppInstanceAdmin
     role.
```

### createAppInstanceUser(input:​completion:​)

Creates a user under an Amazon Chime AppInstance. The request consists of a
unique appInstanceUserId and Name for that user.

``` swift
func createAppInstanceUser(input: CreateAppInstanceUserInput, completion: @escaping (ClientRuntime.SdkResult<CreateAppInstanceUserOutputResponse, CreateAppInstanceUserOutputError>) -> Void)
```

### deleteAppInstance(input:​completion:​)

Deletes an AppInstance and all associated data asynchronously.

``` swift
func deleteAppInstance(input: DeleteAppInstanceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAppInstanceOutputResponse, DeleteAppInstanceOutputError>) -> Void)
```

### deleteAppInstanceAdmin(input:​completion:​)

Demotes an AppInstanceAdmin to an AppInstanceUser. This action
does not delete the user.

``` swift
func deleteAppInstanceAdmin(input: DeleteAppInstanceAdminInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAppInstanceAdminOutputResponse, DeleteAppInstanceAdminOutputError>) -> Void)
```

### deleteAppInstanceUser(input:​completion:​)

Deletes an AppInstanceUser.

``` swift
func deleteAppInstanceUser(input: DeleteAppInstanceUserInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAppInstanceUserOutputResponse, DeleteAppInstanceUserOutputError>) -> Void)
```

### describeAppInstance(input:​completion:​)

Returns the full details of an AppInstance.

``` swift
func describeAppInstance(input: DescribeAppInstanceInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAppInstanceOutputResponse, DescribeAppInstanceOutputError>) -> Void)
```

### describeAppInstanceAdmin(input:​completion:​)

Returns the full details of an AppInstanceAdmin.

``` swift
func describeAppInstanceAdmin(input: DescribeAppInstanceAdminInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAppInstanceAdminOutputResponse, DescribeAppInstanceAdminOutputError>) -> Void)
```

### describeAppInstanceUser(input:​completion:​)

Returns the full details of an AppInstanceUser.

``` swift
func describeAppInstanceUser(input: DescribeAppInstanceUserInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAppInstanceUserOutputResponse, DescribeAppInstanceUserOutputError>) -> Void)
```

### getAppInstanceRetentionSettings(input:​completion:​)

Gets the retention settings for an AppInstance.

``` swift
func getAppInstanceRetentionSettings(input: GetAppInstanceRetentionSettingsInput, completion: @escaping (ClientRuntime.SdkResult<GetAppInstanceRetentionSettingsOutputResponse, GetAppInstanceRetentionSettingsOutputError>) -> Void)
```

### listAppInstanceAdmins(input:​completion:​)

Returns a list of the administrators in the AppInstance.

``` swift
func listAppInstanceAdmins(input: ListAppInstanceAdminsInput, completion: @escaping (ClientRuntime.SdkResult<ListAppInstanceAdminsOutputResponse, ListAppInstanceAdminsOutputError>) -> Void)
```

### listAppInstances(input:​completion:​)

Lists all Amazon Chime AppInstances created under a single AWS
account.

``` swift
func listAppInstances(input: ListAppInstancesInput, completion: @escaping (ClientRuntime.SdkResult<ListAppInstancesOutputResponse, ListAppInstancesOutputError>) -> Void)
```

### listAppInstanceUsers(input:​completion:​)

List all AppInstanceUsers created under a single
AppInstance.

``` swift
func listAppInstanceUsers(input: ListAppInstanceUsersInput, completion: @escaping (ClientRuntime.SdkResult<ListAppInstanceUsersOutputResponse, ListAppInstanceUsersOutputError>) -> Void)
```

### putAppInstanceRetentionSettings(input:​completion:​)

Sets the amount of time in days that a given AppInstance retains
data.

``` swift
func putAppInstanceRetentionSettings(input: PutAppInstanceRetentionSettingsInput, completion: @escaping (ClientRuntime.SdkResult<PutAppInstanceRetentionSettingsOutputResponse, PutAppInstanceRetentionSettingsOutputError>) -> Void)
```

### updateAppInstance(input:​completion:​)

Updates AppInstance metadata.

``` swift
func updateAppInstance(input: UpdateAppInstanceInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAppInstanceOutputResponse, UpdateAppInstanceOutputError>) -> Void)
```

### updateAppInstanceUser(input:​completion:​)

Updates the details of an AppInstanceUser. You can update names and
metadata.

``` swift
func updateAppInstanceUser(input: UpdateAppInstanceUserInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAppInstanceUserOutputResponse, UpdateAppInstanceUserOutputError>) -> Void)
```
