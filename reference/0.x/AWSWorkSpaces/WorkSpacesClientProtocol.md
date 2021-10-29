# WorkSpacesClientProtocol

Amazon WorkSpaces Service Amazon WorkSpaces enables you to provision virtual, cloud-based Microsoft Windows and Amazon Linux desktops for your users.

``` swift
public protocol WorkSpacesClientProtocol 
```

## Requirements

### associateConnectionAlias(input:completion:)

Associates the specified connection alias with the specified directory to enable cross-Region redirection. For more information, see [ Cross-Region Redirection for Amazon WorkSpaces](https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html). Before performing this operation, call [ DescribeConnectionAliases](https://docs.aws.amazon.com/workspaces/latest/api/API_DescribeConnectionAliases.html) to make sure that the current state of the connection alias is CREATED.

``` swift
func associateConnectionAlias(input: AssociateConnectionAliasInput, completion: @escaping (ClientRuntime.SdkResult<AssociateConnectionAliasOutputResponse, AssociateConnectionAliasOutputError>) -> Void)
```

### associateIpGroups(input:completion:)

Associates the specified IP access control group with the specified directory.

``` swift
func associateIpGroups(input: AssociateIpGroupsInput, completion: @escaping (ClientRuntime.SdkResult<AssociateIpGroupsOutputResponse, AssociateIpGroupsOutputError>) -> Void)
```

### authorizeIpRules(input:completion:)

Adds one or more rules to the specified IP access control group. This action gives users permission to access their WorkSpaces from the CIDR address ranges specified in the rules.

``` swift
func authorizeIpRules(input: AuthorizeIpRulesInput, completion: @escaping (ClientRuntime.SdkResult<AuthorizeIpRulesOutputResponse, AuthorizeIpRulesOutputError>) -> Void)
```

### copyWorkspaceImage(input:completion:)

Copies the specified image from the specified Region to the current Region. For more information about copying images, see [ Copy a Custom WorkSpaces Image](https://docs.aws.amazon.com/workspaces/latest/adminguide/copy-custom-image.html). In the China (Ningxia) Region, you can copy images only within the same Region. In Amazon Web Services GovCloud (US), to copy images to and from other Regions, contact Amazon Web Services Support. Before copying a shared image, be sure to verify that it has been shared from the correct Amazon Web Services account. To determine if an image has been shared and to see the ID of the Amazon Web Services account that owns an image, use the [DescribeWorkSpaceImages](https://docs.aws.amazon.com/workspaces/latest/api/API_DescribeWorkspaceImages.html) and [DescribeWorkspaceImagePermissions](https://docs.aws.amazon.com/workspaces/latest/api/API_DescribeWorkspaceImagePermissions.html) API operations.

``` swift
func copyWorkspaceImage(input: CopyWorkspaceImageInput, completion: @escaping (ClientRuntime.SdkResult<CopyWorkspaceImageOutputResponse, CopyWorkspaceImageOutputError>) -> Void)
```

### createConnectionAlias(input:completion:)

Creates the specified connection alias for use with cross-Region redirection. For more information, see [ Cross-Region Redirection for Amazon WorkSpaces](https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html).

``` swift
func createConnectionAlias(input: CreateConnectionAliasInput, completion: @escaping (ClientRuntime.SdkResult<CreateConnectionAliasOutputResponse, CreateConnectionAliasOutputError>) -> Void)
```

### createIpGroup(input:completion:)

Creates an IP access control group. An IP access control group provides you with the ability to control the IP addresses from which users are allowed to access their WorkSpaces. To specify the CIDR address ranges, add rules to your IP access control group and then associate the group with your directory. You can add rules when you create the group or at any time using \[AuthorizeIpRules\]. There is a default IP access control group associated with your directory. If you don't associate an IP access control group with your directory, the default group is used. The default group includes a default rule that allows users to access their WorkSpaces from anywhere. You cannot modify the default IP access control group for your directory.

``` swift
func createIpGroup(input: CreateIpGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateIpGroupOutputResponse, CreateIpGroupOutputError>) -> Void)
```

### createTags(input:completion:)

Creates the specified tags for the specified WorkSpaces resource.

``` swift
func createTags(input: CreateTagsInput, completion: @escaping (ClientRuntime.SdkResult<CreateTagsOutputResponse, CreateTagsOutputError>) -> Void)
```

### createUpdatedWorkspaceImage(input:completion:)

Creates a new updated WorkSpace image based on the specified source image. The new updated WorkSpace image has the latest drivers and other updates required by the Amazon WorkSpaces components. To determine which WorkSpace images need to be updated with the latest Amazon WorkSpaces requirements, use [ DescribeWorkspaceImages](https://docs.aws.amazon.com/workspaces/latest/api/API_DescribeWorkspaceImages.html).

``` swift
func createUpdatedWorkspaceImage(input: CreateUpdatedWorkspaceImageInput, completion: @escaping (ClientRuntime.SdkResult<CreateUpdatedWorkspaceImageOutputResponse, CreateUpdatedWorkspaceImageOutputError>) -> Void)
```

  - Only Windows 10 WorkSpace images can be programmatically updated at this time.

  - Microsoft Windows updates and other application updates are not included in the update process.

  - The source WorkSpace image is not deleted. You can delete the source image after you've verified your new updated image and created a new bundle.

### createWorkspaceBundle(input:completion:)

Creates the specified WorkSpace bundle. For more information about creating WorkSpace bundles, see [ Create a Custom WorkSpaces Image and Bundle](https://docs.aws.amazon.com/workspaces/latest/adminguide/create-custom-bundle.html).

``` swift
func createWorkspaceBundle(input: CreateWorkspaceBundleInput, completion: @escaping (ClientRuntime.SdkResult<CreateWorkspaceBundleOutputResponse, CreateWorkspaceBundleOutputError>) -> Void)
```

### createWorkspaces(input:completion:)

Creates one or more WorkSpaces. This operation is asynchronous and returns before the WorkSpaces are created.

``` swift
func createWorkspaces(input: CreateWorkspacesInput, completion: @escaping (ClientRuntime.SdkResult<CreateWorkspacesOutputResponse, CreateWorkspacesOutputError>) -> Void)
```

### deleteConnectionAlias(input:completion:)

Deletes the specified connection alias. For more information, see [ Cross-Region Redirection for Amazon WorkSpaces](https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html). If you will no longer be using a fully qualified domain name (FQDN) as the registration code for your WorkSpaces users, you must take certain precautions to prevent potential security issues. For more information, see [ Security Considerations if You Stop Using Cross-Region Redirection](https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html#cross-region-redirection-security-considerations). To delete a connection alias that has been shared, the shared account must first disassociate the connection alias from any directories it has been associated with. Then you must unshare the connection alias from the account it has been shared with. You can delete a connection alias only after it is no longer shared with any accounts or associated with any directories.

``` swift
func deleteConnectionAlias(input: DeleteConnectionAliasInput, completion: @escaping (ClientRuntime.SdkResult<DeleteConnectionAliasOutputResponse, DeleteConnectionAliasOutputError>) -> Void)
```

### deleteIpGroup(input:completion:)

Deletes the specified IP access control group. You cannot delete an IP access control group that is associated with a directory.

``` swift
func deleteIpGroup(input: DeleteIpGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteIpGroupOutputResponse, DeleteIpGroupOutputError>) -> Void)
```

### deleteTags(input:completion:)

Deletes the specified tags from the specified WorkSpaces resource.

``` swift
func deleteTags(input: DeleteTagsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTagsOutputResponse, DeleteTagsOutputError>) -> Void)
```

### deleteWorkspaceBundle(input:completion:)

Deletes the specified WorkSpace bundle. For more information about deleting WorkSpace bundles, see [ Delete a Custom WorkSpaces Bundle or Image](https://docs.aws.amazon.com/workspaces/latest/adminguide/delete_bundle.html).

``` swift
func deleteWorkspaceBundle(input: DeleteWorkspaceBundleInput, completion: @escaping (ClientRuntime.SdkResult<DeleteWorkspaceBundleOutputResponse, DeleteWorkspaceBundleOutputError>) -> Void)
```

### deleteWorkspaceImage(input:completion:)

Deletes the specified image from your account. To delete an image, you must first delete any bundles that are associated with the image and unshare the image if it is shared with other accounts.

``` swift
func deleteWorkspaceImage(input: DeleteWorkspaceImageInput, completion: @escaping (ClientRuntime.SdkResult<DeleteWorkspaceImageOutputResponse, DeleteWorkspaceImageOutputError>) -> Void)
```

### deregisterWorkspaceDirectory(input:completion:)

Deregisters the specified directory. This operation is asynchronous and returns before the WorkSpace directory is deregistered. If any WorkSpaces are registered to this directory, you must remove them before you can deregister the directory. Simple AD and AD Connector are made available to you free of charge to use with WorkSpaces. If there are no WorkSpaces being used with your Simple AD or AD Connector directory for 30 consecutive days, this directory will be automatically deregistered for use with Amazon WorkSpaces, and you will be charged for this directory as per the [Directory Service pricing terms](http://aws.amazon.com/directoryservice/pricing/). To delete empty directories, see [ Delete the Directory for Your WorkSpaces](https://docs.aws.amazon.com/workspaces/latest/adminguide/delete-workspaces-directory.html). If you delete your Simple AD or AD Connector directory, you can always create a new one when you want to start using WorkSpaces again.

``` swift
func deregisterWorkspaceDirectory(input: DeregisterWorkspaceDirectoryInput, completion: @escaping (ClientRuntime.SdkResult<DeregisterWorkspaceDirectoryOutputResponse, DeregisterWorkspaceDirectoryOutputError>) -> Void)
```

### describeAccount(input:completion:)

Retrieves a list that describes the configuration of Bring Your Own License (BYOL) for the specified account.

``` swift
func describeAccount(input: DescribeAccountInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAccountOutputResponse, DescribeAccountOutputError>) -> Void)
```

### describeAccountModifications(input:completion:)

Retrieves a list that describes modifications to the configuration of Bring Your Own License (BYOL) for the specified account.

``` swift
func describeAccountModifications(input: DescribeAccountModificationsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAccountModificationsOutputResponse, DescribeAccountModificationsOutputError>) -> Void)
```

### describeClientProperties(input:completion:)

Retrieves a list that describes one or more specified Amazon WorkSpaces clients.

``` swift
func describeClientProperties(input: DescribeClientPropertiesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeClientPropertiesOutputResponse, DescribeClientPropertiesOutputError>) -> Void)
```

### describeConnectionAliases(input:completion:)

Retrieves a list that describes the connection aliases used for cross-Region redirection. For more information, see [ Cross-Region Redirection for Amazon WorkSpaces](https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html).

``` swift
func describeConnectionAliases(input: DescribeConnectionAliasesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeConnectionAliasesOutputResponse, DescribeConnectionAliasesOutputError>) -> Void)
```

### describeConnectionAliasPermissions(input:completion:)

Describes the permissions that the owner of a connection alias has granted to another Amazon Web Services account for the specified connection alias. For more information, see [ Cross-Region Redirection for Amazon WorkSpaces](https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html).

``` swift
func describeConnectionAliasPermissions(input: DescribeConnectionAliasPermissionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeConnectionAliasPermissionsOutputResponse, DescribeConnectionAliasPermissionsOutputError>) -> Void)
```

### describeIpGroups(input:completion:)

Describes one or more of your IP access control groups.

``` swift
func describeIpGroups(input: DescribeIpGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeIpGroupsOutputResponse, DescribeIpGroupsOutputError>) -> Void)
```

### describeTags(input:completion:)

Describes the specified tags for the specified WorkSpaces resource.

``` swift
func describeTags(input: DescribeTagsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTagsOutputResponse, DescribeTagsOutputError>) -> Void)
```

### describeWorkspaceBundles(input:completion:)

Retrieves a list that describes the available WorkSpace bundles. You can filter the results using either bundle ID or owner, but not both.

``` swift
func describeWorkspaceBundles(input: DescribeWorkspaceBundlesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeWorkspaceBundlesOutputResponse, DescribeWorkspaceBundlesOutputError>) -> Void)
```

### describeWorkspaceDirectories(input:completion:)

Describes the available directories that are registered with Amazon WorkSpaces.

``` swift
func describeWorkspaceDirectories(input: DescribeWorkspaceDirectoriesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeWorkspaceDirectoriesOutputResponse, DescribeWorkspaceDirectoriesOutputError>) -> Void)
```

### describeWorkspaceImagePermissions(input:completion:)

Describes the permissions that the owner of an image has granted to other Amazon Web Services accounts for an image.

``` swift
func describeWorkspaceImagePermissions(input: DescribeWorkspaceImagePermissionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeWorkspaceImagePermissionsOutputResponse, DescribeWorkspaceImagePermissionsOutputError>) -> Void)
```

### describeWorkspaceImages(input:completion:)

Retrieves a list that describes one or more specified images, if the image identifiers are provided. Otherwise, all images in the account are described.

``` swift
func describeWorkspaceImages(input: DescribeWorkspaceImagesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeWorkspaceImagesOutputResponse, DescribeWorkspaceImagesOutputError>) -> Void)
```

### describeWorkspaces(input:completion:)

Describes the specified WorkSpaces. You can filter the results by using the bundle identifier, directory identifier, or owner, but you can specify only one filter at a time.

``` swift
func describeWorkspaces(input: DescribeWorkspacesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeWorkspacesOutputResponse, DescribeWorkspacesOutputError>) -> Void)
```

### describeWorkspacesConnectionStatus(input:completion:)

Describes the connection status of the specified WorkSpaces.

``` swift
func describeWorkspacesConnectionStatus(input: DescribeWorkspacesConnectionStatusInput, completion: @escaping (ClientRuntime.SdkResult<DescribeWorkspacesConnectionStatusOutputResponse, DescribeWorkspacesConnectionStatusOutputError>) -> Void)
```

### describeWorkspaceSnapshots(input:completion:)

Describes the snapshots for the specified WorkSpace.

``` swift
func describeWorkspaceSnapshots(input: DescribeWorkspaceSnapshotsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeWorkspaceSnapshotsOutputResponse, DescribeWorkspaceSnapshotsOutputError>) -> Void)
```

### disassociateConnectionAlias(input:completion:)

Disassociates a connection alias from a directory. Disassociating a connection alias disables cross-Region redirection between two directories in different Regions. For more information, see [ Cross-Region Redirection for Amazon WorkSpaces](https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html). Before performing this operation, call [ DescribeConnectionAliases](https://docs.aws.amazon.com/workspaces/latest/api/API_DescribeConnectionAliases.html) to make sure that the current state of the connection alias is CREATED.

``` swift
func disassociateConnectionAlias(input: DisassociateConnectionAliasInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateConnectionAliasOutputResponse, DisassociateConnectionAliasOutputError>) -> Void)
```

### disassociateIpGroups(input:completion:)

Disassociates the specified IP access control group from the specified directory.

``` swift
func disassociateIpGroups(input: DisassociateIpGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateIpGroupsOutputResponse, DisassociateIpGroupsOutputError>) -> Void)
```

### importWorkspaceImage(input:completion:)

Imports the specified Windows 10 Bring Your Own License (BYOL) image into Amazon WorkSpaces. The image must be an already licensed Amazon EC2 image that is in your Amazon Web Services account, and you must own the image. For more information about creating BYOL images, see [ Bring Your Own Windows Desktop Licenses](https://docs.aws.amazon.com/workspaces/latest/adminguide/byol-windows-images.html).

``` swift
func importWorkspaceImage(input: ImportWorkspaceImageInput, completion: @escaping (ClientRuntime.SdkResult<ImportWorkspaceImageOutputResponse, ImportWorkspaceImageOutputError>) -> Void)
```

### listAvailableManagementCidrRanges(input:completion:)

Retrieves a list of IP address ranges, specified as IPv4 CIDR blocks, that you can use for the network management interface when you enable Bring Your Own License (BYOL). This operation can be run only by Amazon Web Services accounts that are enabled for BYOL. If your account isn't enabled for BYOL, you'll receive an AccessDeniedException error. The management network interface is connected to a secure Amazon WorkSpaces management network. It is used for interactive streaming of the WorkSpace desktop to Amazon WorkSpaces clients, and to allow Amazon WorkSpaces to manage the WorkSpace.

``` swift
func listAvailableManagementCidrRanges(input: ListAvailableManagementCidrRangesInput, completion: @escaping (ClientRuntime.SdkResult<ListAvailableManagementCidrRangesOutputResponse, ListAvailableManagementCidrRangesOutputError>) -> Void)
```

### migrateWorkspace(input:completion:)

Migrates a WorkSpace from one operating system or bundle type to another, while retaining the data on the user volume. The migration process recreates the WorkSpace by using a new root volume from the target bundle image and the user volume from the last available snapshot of the original WorkSpace. During migration, the original D:\\Users%USERNAME% user profile folder is renamed to D:\\Users%USERNAME%MMddyyTHHmmss%.NotMigrated. A new D:\\Users%USERNAME%</code> folder is generated by the new OS. Certain files in the old user profile are moved to the new user profile.
For available migration scenarios, details about what happens during migration, and best practices, see [Migrate a WorkSpace](https://docs.aws.amazon.com/workspaces/latest/adminguide/migrate-workspaces.html).

``` swift
func migrateWorkspace(input: MigrateWorkspaceInput, completion: @escaping (ClientRuntime.SdkResult<MigrateWorkspaceOutputResponse, MigrateWorkspaceOutputError>) -> Void)
```

### modifyAccount(input:completion:)

Modifies the configuration of Bring Your Own License (BYOL) for the specified account.

``` swift
func modifyAccount(input: ModifyAccountInput, completion: @escaping (ClientRuntime.SdkResult<ModifyAccountOutputResponse, ModifyAccountOutputError>) -> Void)
```

### modifyClientProperties(input:completion:)

Modifies the properties of the specified Amazon WorkSpaces clients.

``` swift
func modifyClientProperties(input: ModifyClientPropertiesInput, completion: @escaping (ClientRuntime.SdkResult<ModifyClientPropertiesOutputResponse, ModifyClientPropertiesOutputError>) -> Void)
```

### modifySelfservicePermissions(input:completion:)

Modifies the self-service WorkSpace management capabilities for your users. For more information, see [Enable Self-Service WorkSpace Management Capabilities for Your Users](https://docs.aws.amazon.com/workspaces/latest/adminguide/enable-user-self-service-workspace-management.html).

``` swift
func modifySelfservicePermissions(input: ModifySelfservicePermissionsInput, completion: @escaping (ClientRuntime.SdkResult<ModifySelfservicePermissionsOutputResponse, ModifySelfservicePermissionsOutputError>) -> Void)
```

### modifyWorkspaceAccessProperties(input:completion:)

Specifies which devices and operating systems users can use to access their WorkSpaces. For more information, see [ Control Device Access](https://docs.aws.amazon.com/workspaces/latest/adminguide/update-directory-details.html#control-device-access).

``` swift
func modifyWorkspaceAccessProperties(input: ModifyWorkspaceAccessPropertiesInput, completion: @escaping (ClientRuntime.SdkResult<ModifyWorkspaceAccessPropertiesOutputResponse, ModifyWorkspaceAccessPropertiesOutputError>) -> Void)
```

### modifyWorkspaceCreationProperties(input:completion:)

Modify the default properties used to create WorkSpaces.

``` swift
func modifyWorkspaceCreationProperties(input: ModifyWorkspaceCreationPropertiesInput, completion: @escaping (ClientRuntime.SdkResult<ModifyWorkspaceCreationPropertiesOutputResponse, ModifyWorkspaceCreationPropertiesOutputError>) -> Void)
```

### modifyWorkspaceProperties(input:completion:)

Modifies the specified WorkSpace properties. For important information about how to modify the size of the root and user volumes, see [ Modify a WorkSpace](https://docs.aws.amazon.com/workspaces/latest/adminguide/modify-workspaces.html).

``` swift
func modifyWorkspaceProperties(input: ModifyWorkspacePropertiesInput, completion: @escaping (ClientRuntime.SdkResult<ModifyWorkspacePropertiesOutputResponse, ModifyWorkspacePropertiesOutputError>) -> Void)
```

### modifyWorkspaceState(input:completion:)

Sets the state of the specified WorkSpace. To maintain a WorkSpace without being interrupted, set the WorkSpace state to ADMIN\_MAINTENANCE. WorkSpaces in this state do not respond to requests to reboot, stop, start, rebuild, or restore. An AutoStop WorkSpace in this state is not stopped. Users cannot log into a WorkSpace in the ADMIN\_MAINTENANCE state.

``` swift
func modifyWorkspaceState(input: ModifyWorkspaceStateInput, completion: @escaping (ClientRuntime.SdkResult<ModifyWorkspaceStateOutputResponse, ModifyWorkspaceStateOutputError>) -> Void)
```

### rebootWorkspaces(input:completion:)

Reboots the specified WorkSpaces. You cannot reboot a WorkSpace unless its state is AVAILABLE or UNHEALTHY. This operation is asynchronous and returns before the WorkSpaces have rebooted.

``` swift
func rebootWorkspaces(input: RebootWorkspacesInput, completion: @escaping (ClientRuntime.SdkResult<RebootWorkspacesOutputResponse, RebootWorkspacesOutputError>) -> Void)
```

### rebuildWorkspaces(input:completion:)

Rebuilds the specified WorkSpace. You cannot rebuild a WorkSpace unless its state is AVAILABLE, ERROR, UNHEALTHY, STOPPED, or REBOOTING. Rebuilding a WorkSpace is a potentially destructive action that can result in the loss of data. For more information, see [Rebuild a WorkSpace](https://docs.aws.amazon.com/workspaces/latest/adminguide/reset-workspace.html). This operation is asynchronous and returns before the WorkSpaces have been completely rebuilt.

``` swift
func rebuildWorkspaces(input: RebuildWorkspacesInput, completion: @escaping (ClientRuntime.SdkResult<RebuildWorkspacesOutputResponse, RebuildWorkspacesOutputError>) -> Void)
```

### registerWorkspaceDirectory(input:completion:)

Registers the specified directory. This operation is asynchronous and returns before the WorkSpace directory is registered. If this is the first time you are registering a directory, you will need to create the workspaces\_DefaultRole role before you can register a directory. For more information, see [ Creating the workspaces\_DefaultRole Role](https://docs.aws.amazon.com/workspaces/latest/adminguide/workspaces-access-control.html#create-default-role).

``` swift
func registerWorkspaceDirectory(input: RegisterWorkspaceDirectoryInput, completion: @escaping (ClientRuntime.SdkResult<RegisterWorkspaceDirectoryOutputResponse, RegisterWorkspaceDirectoryOutputError>) -> Void)
```

### restoreWorkspace(input:completion:)

Restores the specified WorkSpace to its last known healthy state. You cannot restore a WorkSpace unless its state is  AVAILABLE, ERROR, UNHEALTHY, or STOPPED. Restoring a WorkSpace is a potentially destructive action that can result in the loss of data. For more information, see [Restore a WorkSpace](https://docs.aws.amazon.com/workspaces/latest/adminguide/restore-workspace.html). This operation is asynchronous and returns before the WorkSpace is completely restored.

``` swift
func restoreWorkspace(input: RestoreWorkspaceInput, completion: @escaping (ClientRuntime.SdkResult<RestoreWorkspaceOutputResponse, RestoreWorkspaceOutputError>) -> Void)
```

### revokeIpRules(input:completion:)

Removes one or more rules from the specified IP access control group.

``` swift
func revokeIpRules(input: RevokeIpRulesInput, completion: @escaping (ClientRuntime.SdkResult<RevokeIpRulesOutputResponse, RevokeIpRulesOutputError>) -> Void)
```

### startWorkspaces(input:completion:)

Starts the specified WorkSpaces. You cannot start a WorkSpace unless it has a running mode of AutoStop and a state of STOPPED.

``` swift
func startWorkspaces(input: StartWorkspacesInput, completion: @escaping (ClientRuntime.SdkResult<StartWorkspacesOutputResponse, StartWorkspacesOutputError>) -> Void)
```

### stopWorkspaces(input:completion:)

Stops the specified WorkSpaces. You cannot stop a WorkSpace unless it has a running mode of AutoStop and a state of AVAILABLE, IMPAIRED, UNHEALTHY, or ERROR.

``` swift
func stopWorkspaces(input: StopWorkspacesInput, completion: @escaping (ClientRuntime.SdkResult<StopWorkspacesOutputResponse, StopWorkspacesOutputError>) -> Void)
```

### terminateWorkspaces(input:completion:)

Terminates the specified WorkSpaces. Terminating a WorkSpace is a permanent action and cannot be undone. The user's data is destroyed. If you need to archive any user data, contact Amazon Web Services Support before terminating the WorkSpace. You can terminate a WorkSpace that is in any state except SUSPENDED. This operation is asynchronous and returns before the WorkSpaces have been completely terminated. After a WorkSpace is terminated, the TERMINATED state is returned only briefly before the WorkSpace directory metadata is cleaned up, so this state is rarely returned. To confirm that a WorkSpace is terminated, check for the WorkSpace ID by using [ DescribeWorkSpaces](https://docs.aws.amazon.com/workspaces/latest/api/API_DescribeWorkspaces.html). If the WorkSpace ID isn't returned, then the WorkSpace has been successfully terminated. Simple AD and AD Connector are made available to you free of charge to use with WorkSpaces. If there are no WorkSpaces being used with your Simple AD or AD Connector directory for 30 consecutive days, this directory will be automatically deregistered for use with Amazon WorkSpaces, and you will be charged for this directory as per the [Directory Service pricing terms](http://aws.amazon.com/directoryservice/pricing/). To delete empty directories, see [ Delete the Directory for Your WorkSpaces](https://docs.aws.amazon.com/workspaces/latest/adminguide/delete-workspaces-directory.html). If you delete your Simple AD or AD Connector directory, you can always create a new one when you want to start using WorkSpaces again.

``` swift
func terminateWorkspaces(input: TerminateWorkspacesInput, completion: @escaping (ClientRuntime.SdkResult<TerminateWorkspacesOutputResponse, TerminateWorkspacesOutputError>) -> Void)
```

### updateConnectionAliasPermission(input:completion:)

Shares or unshares a connection alias with one account by specifying whether that account has permission to associate the connection alias with a directory. If the association permission is granted, the connection alias is shared with that account. If the association permission is revoked, the connection alias is unshared with the account. For more information, see [ Cross-Region Redirection for Amazon WorkSpaces](https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html).

``` swift
func updateConnectionAliasPermission(input: UpdateConnectionAliasPermissionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateConnectionAliasPermissionOutputResponse, UpdateConnectionAliasPermissionOutputError>) -> Void)
```

  - Before performing this operation, call [ DescribeConnectionAliases](https://docs.aws.amazon.com/workspaces/latest/api/API_DescribeConnectionAliases.html) to make sure that the current state of the connection alias is CREATED.

  - To delete a connection alias that has been shared, the shared account must first disassociate the connection alias from any directories it has been associated with. Then you must unshare the connection alias from the account it has been shared with. You can delete a connection alias only after it is no longer shared with any accounts or associated with any directories.

### updateRulesOfIpGroup(input:completion:)

Replaces the current rules of the specified IP access control group with the specified rules.

``` swift
func updateRulesOfIpGroup(input: UpdateRulesOfIpGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRulesOfIpGroupOutputResponse, UpdateRulesOfIpGroupOutputError>) -> Void)
```

### updateWorkspaceBundle(input:completion:)

Updates a WorkSpace bundle with a new image. For more information about updating WorkSpace bundles, see [ Update a Custom WorkSpaces Bundle](https://docs.aws.amazon.com/workspaces/latest/adminguide/update-custom-bundle.html). Existing WorkSpaces aren't automatically updated when you update the bundle that they're based on. To update existing WorkSpaces that are based on a bundle that you've updated, you must either rebuild the WorkSpaces or delete and recreate them.

``` swift
func updateWorkspaceBundle(input: UpdateWorkspaceBundleInput, completion: @escaping (ClientRuntime.SdkResult<UpdateWorkspaceBundleOutputResponse, UpdateWorkspaceBundleOutputError>) -> Void)
```

### updateWorkspaceImagePermission(input:completion:)

Shares or unshares an image with one account in the same Amazon Web Services Region by specifying whether that account has permission to copy the image. If the copy image permission is granted, the image is shared with that account. If the copy image permission is revoked, the image is unshared with the account. After an image has been shared, the recipient account can copy the image to other Regions as needed. In the China (Ningxia) Region, you can copy images only within the same Region. In Amazon Web Services GovCloud (US), to copy images to and from other Regions, contact Amazon Web Services Support. For more information about sharing images, see [ Share or Unshare a Custom WorkSpaces Image](https://docs.aws.amazon.com/workspaces/latest/adminguide/share-custom-image.html).

``` swift
func updateWorkspaceImagePermission(input: UpdateWorkspaceImagePermissionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateWorkspaceImagePermissionOutputResponse, UpdateWorkspaceImagePermissionOutputError>) -> Void)
```

  - To delete an image that has been shared, you must unshare the image before you delete it.

  - Sharing Bring Your Own License (BYOL) images across Amazon Web Services accounts isn't supported at this time in Amazon Web Services GovCloud (US). To share BYOL images across accounts in Amazon Web Services GovCloud (US), contact Amazon Web Services Support.
