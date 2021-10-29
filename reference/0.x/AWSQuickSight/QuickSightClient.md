# QuickSightClient

``` swift
public class QuickSightClient 
```

## Inheritance

[`QuickSightClientProtocol`](/aws-sdk-swift/reference/0.x/AWSQuickSight/QuickSightClientProtocol)

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
public static let clientName = "QuickSightClient"
```

## Methods

### `cancelIngestion(input:completion:)`

Cancels an ongoing ingestion of data into SPICE.

``` swift
public func cancelIngestion(input: CancelIngestionInput, completion: @escaping (ClientRuntime.SdkResult<CancelIngestionOutputResponse, CancelIngestionOutputError>) -> Void)
```

### `createAccountCustomization(input:completion:)`

Creates Amazon QuickSight customizations the current Amazon Web Services Region;. Currently, you can add a custom default theme by using the CreateAccountCustomization or UpdateAccountCustomization API operation. To further customize Amazon QuickSight by removing Amazon QuickSight sample assets and videos for all new users, see [Customizing Amazon QuickSight](https://docs.aws.amazon.com/quicksight/latest/user/customizing-quicksight.html) in the Amazon QuickSight User Guide. You can create customizations for your Amazon Web Services account or, if you specify a namespace, for a Amazon QuickSight namespace instead. Customizations that apply to a namespace always override customizations that apply to an Amazon Web Services account. To find out which customizations apply, use the DescribeAccountCustomization API operation. Before you use the CreateAccountCustomization API operation to add a theme as the namespace default, make sure that you first share the theme with the namespace. If you don't share it with the namespace, the theme isn't visible to your users even if you make it the default theme. To check if the theme is shared, view the current permissions by using the \[DescribeThemePermissions\] API operation. To share the theme, grant permissions by using the \[UpdateThemePermissions\] API operation.

``` swift
public func createAccountCustomization(input: CreateAccountCustomizationInput, completion: @escaping (ClientRuntime.SdkResult<CreateAccountCustomizationOutputResponse, CreateAccountCustomizationOutputError>) -> Void)
```

### `createAnalysis(input:completion:)`

Creates an analysis in Amazon QuickSight.

``` swift
public func createAnalysis(input: CreateAnalysisInput, completion: @escaping (ClientRuntime.SdkResult<CreateAnalysisOutputResponse, CreateAnalysisOutputError>) -> Void)
```

### `createDashboard(input:completion:)`

Creates a dashboard from a template. To first create a template, see the \[CreateTemplate\] API operation. A dashboard is an entity in Amazon QuickSight that identifies Amazon QuickSight reports, created from analyses. You can share Amazon QuickSight dashboards. With the right permissions, you can create scheduled email reports from them. If you have the correct permissions, you can create a dashboard from a template that exists in a different Amazon Web Services account.

``` swift
public func createDashboard(input: CreateDashboardInput, completion: @escaping (ClientRuntime.SdkResult<CreateDashboardOutputResponse, CreateDashboardOutputError>) -> Void)
```

### `createDataSet(input:completion:)`

Creates a dataset.

``` swift
public func createDataSet(input: CreateDataSetInput, completion: @escaping (ClientRuntime.SdkResult<CreateDataSetOutputResponse, CreateDataSetOutputError>) -> Void)
```

### `createDataSource(input:completion:)`

Creates a data source.

``` swift
public func createDataSource(input: CreateDataSourceInput, completion: @escaping (ClientRuntime.SdkResult<CreateDataSourceOutputResponse, CreateDataSourceOutputError>) -> Void)
```

### `createFolder(input:completion:)`

Creates an empty shared folder.

``` swift
public func createFolder(input: CreateFolderInput, completion: @escaping (ClientRuntime.SdkResult<CreateFolderOutputResponse, CreateFolderOutputError>) -> Void)
```

### `createFolderMembership(input:completion:)`

Adds an asset, such as a dashboard, analysis, or dataset into a folder.

``` swift
public func createFolderMembership(input: CreateFolderMembershipInput, completion: @escaping (ClientRuntime.SdkResult<CreateFolderMembershipOutputResponse, CreateFolderMembershipOutputError>) -> Void)
```

### `createGroup(input:completion:)`

Creates an Amazon QuickSight group. The permissions resource is arn:aws:quicksight:us-east-1::group/default/ . The response is a group object.

``` swift
public func createGroup(input: CreateGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateGroupOutputResponse, CreateGroupOutputError>) -> Void)
```

### `createGroupMembership(input:completion:)`

Adds an Amazon QuickSight user to an Amazon QuickSight group.

``` swift
public func createGroupMembership(input: CreateGroupMembershipInput, completion: @escaping (ClientRuntime.SdkResult<CreateGroupMembershipOutputResponse, CreateGroupMembershipOutputError>) -> Void)
```

### `createIAMPolicyAssignment(input:completion:)`

Creates an assignment with one specified IAMpolicy, identified by its Amazon Resource Name (ARN). This policy assignment is attached to the specified groups or users of Amazon QuickSight. Assignment names are unique per Amazon Web Services account. To avoid overwriting rules in other namespaces, use assignment names that are unique.

``` swift
public func createIAMPolicyAssignment(input: CreateIAMPolicyAssignmentInput, completion: @escaping (ClientRuntime.SdkResult<CreateIAMPolicyAssignmentOutputResponse, CreateIAMPolicyAssignmentOutputError>) -> Void)
```

### `createIngestion(input:completion:)`

Creates and starts a new SPICE ingestion on a dataset Any ingestions operating on tagged datasets inherit the same tags automatically for use in access control. For an example, see [How do I create an IAM policy to control access to Amazon EC2 resources using tags?](http://aws.amazon.com/premiumsupport/knowledge-center/iam-ec2-resource-tags/) in the Amazon Web Services Knowledge Center. Tags are visible on the tagged dataset, but not on the ingestion resource.

``` swift
public func createIngestion(input: CreateIngestionInput, completion: @escaping (ClientRuntime.SdkResult<CreateIngestionOutputResponse, CreateIngestionOutputError>) -> Void)
```

### `createNamespace(input:completion:)`

(Enterprise edition only) Creates a new namespace for you to use with Amazon QuickSight. A namespace allows you to isolate the Amazon QuickSight users and groups that are registered for that namespace. Users that access the namespace can share assets only with other users or groups in the same namespace. They can't see users and groups in other namespaces. You can create a namespace after your Amazon Web Services account is subscribed to Amazon QuickSight. The namespace must be unique within the Amazon Web Services account. By default, there is a limit of 100 namespaces per Amazon Web Services account. To increase your limit, create a ticket with Amazon Web Services Support.

``` swift
public func createNamespace(input: CreateNamespaceInput, completion: @escaping (ClientRuntime.SdkResult<CreateNamespaceOutputResponse, CreateNamespaceOutputError>) -> Void)
```

### `createTemplate(input:completion:)`

Creates a template from an existing Amazon QuickSight analysis or template. You can use the resulting template to create a dashboard. A template is an entity in Amazon QuickSight that encapsulates the metadata required to create an analysis and that you can use to create s dashboard. A template adds a layer of abstraction by using placeholders to replace the dataset associated with the analysis. You can use templates to create dashboards by replacing dataset placeholders with datasets that follow the same schema that was used to create the source analysis and template.

``` swift
public func createTemplate(input: CreateTemplateInput, completion: @escaping (ClientRuntime.SdkResult<CreateTemplateOutputResponse, CreateTemplateOutputError>) -> Void)
```

### `createTemplateAlias(input:completion:)`

Creates a template alias for a template.

``` swift
public func createTemplateAlias(input: CreateTemplateAliasInput, completion: @escaping (ClientRuntime.SdkResult<CreateTemplateAliasOutputResponse, CreateTemplateAliasOutputError>) -> Void)
```

### `createTheme(input:completion:)`

Creates a theme. A theme is set of configuration options for color and layout. Themes apply to analyses and dashboards. For more information, see [Using Themes in Amazon QuickSight](https://docs.aws.amazon.com/quicksight/latest/user/themes-in-quicksight.html) in the Amazon QuickSight User Guide.

``` swift
public func createTheme(input: CreateThemeInput, completion: @escaping (ClientRuntime.SdkResult<CreateThemeOutputResponse, CreateThemeOutputError>) -> Void)
```

### `createThemeAlias(input:completion:)`

Creates a theme alias for a theme.

``` swift
public func createThemeAlias(input: CreateThemeAliasInput, completion: @escaping (ClientRuntime.SdkResult<CreateThemeAliasOutputResponse, CreateThemeAliasOutputError>) -> Void)
```

### `deleteAccountCustomization(input:completion:)`

Deletes all Amazon QuickSight customizations in this Amazon Web Services Region; for the specified Amazon Web Services account and Amazon QuickSight namespace.

``` swift
public func deleteAccountCustomization(input: DeleteAccountCustomizationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAccountCustomizationOutputResponse, DeleteAccountCustomizationOutputError>) -> Void)
```

### `deleteAnalysis(input:completion:)`

Deletes an analysis from Amazon QuickSight. You can optionally include a recovery window during which you can restore the analysis. If you don't specify a recovery window value, the operation defaults to 30 days. Amazon QuickSight attaches a DeletionTime stamp to the response that specifies the end of the recovery window. At the end of the recovery window, Amazon QuickSight deletes the analysis permanently. At any time before recovery window ends, you can use the RestoreAnalysis API operation to remove the DeletionTime stamp and cancel the deletion of the analysis. The analysis remains visible in the API until it's deleted, so you can describe it but you can't make a template from it. An analysis that's scheduled for deletion isn't accessible in the Amazon QuickSight console. To access it in the console, restore it. Deleting an analysis doesn't delete the dashboards that you publish from it.

``` swift
public func deleteAnalysis(input: DeleteAnalysisInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAnalysisOutputResponse, DeleteAnalysisOutputError>) -> Void)
```

### `deleteDashboard(input:completion:)`

Deletes a dashboard.

``` swift
public func deleteDashboard(input: DeleteDashboardInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDashboardOutputResponse, DeleteDashboardOutputError>) -> Void)
```

### `deleteDataSet(input:completion:)`

Deletes a dataset.

``` swift
public func deleteDataSet(input: DeleteDataSetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDataSetOutputResponse, DeleteDataSetOutputError>) -> Void)
```

### `deleteDataSource(input:completion:)`

Deletes the data source permanently. This operation breaks all the datasets that reference the deleted data source.

``` swift
public func deleteDataSource(input: DeleteDataSourceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDataSourceOutputResponse, DeleteDataSourceOutputError>) -> Void)
```

### `deleteFolder(input:completion:)`

Deletes an empty folder.

``` swift
public func deleteFolder(input: DeleteFolderInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFolderOutputResponse, DeleteFolderOutputError>) -> Void)
```

### `deleteFolderMembership(input:completion:)`

Removes an asset, such as a dashboard, analysis, or dataset, from a folder.

``` swift
public func deleteFolderMembership(input: DeleteFolderMembershipInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFolderMembershipOutputResponse, DeleteFolderMembershipOutputError>) -> Void)
```

### `deleteGroup(input:completion:)`

Removes a user group from Amazon QuickSight.

``` swift
public func deleteGroup(input: DeleteGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteGroupOutputResponse, DeleteGroupOutputError>) -> Void)
```

### `deleteGroupMembership(input:completion:)`

Removes a user from a group so that the user is no longer a member of the group.

``` swift
public func deleteGroupMembership(input: DeleteGroupMembershipInput, completion: @escaping (ClientRuntime.SdkResult<DeleteGroupMembershipOutputResponse, DeleteGroupMembershipOutputError>) -> Void)
```

### `deleteIAMPolicyAssignment(input:completion:)`

Deletes an existing IAMpolicy assignment.

``` swift
public func deleteIAMPolicyAssignment(input: DeleteIAMPolicyAssignmentInput, completion: @escaping (ClientRuntime.SdkResult<DeleteIAMPolicyAssignmentOutputResponse, DeleteIAMPolicyAssignmentOutputError>) -> Void)
```

### `deleteNamespace(input:completion:)`

Deletes a namespace and the users and groups that are associated with the namespace. This is an asynchronous process. Assets including dashboards, analyses, datasets and data sources are not deleted. To delete these assets, you use the API operations for the relevant asset.

``` swift
public func deleteNamespace(input: DeleteNamespaceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteNamespaceOutputResponse, DeleteNamespaceOutputError>) -> Void)
```

### `deleteTemplate(input:completion:)`

Deletes a template.

``` swift
public func deleteTemplate(input: DeleteTemplateInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTemplateOutputResponse, DeleteTemplateOutputError>) -> Void)
```

### `deleteTemplateAlias(input:completion:)`

Deletes the item that the specified template alias points to. If you provide a specific alias, you delete the version of the template that the alias points to.

``` swift
public func deleteTemplateAlias(input: DeleteTemplateAliasInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTemplateAliasOutputResponse, DeleteTemplateAliasOutputError>) -> Void)
```

### `deleteTheme(input:completion:)`

Deletes a theme.

``` swift
public func deleteTheme(input: DeleteThemeInput, completion: @escaping (ClientRuntime.SdkResult<DeleteThemeOutputResponse, DeleteThemeOutputError>) -> Void)
```

### `deleteThemeAlias(input:completion:)`

Deletes the version of the theme that the specified theme alias points to. If you provide a specific alias, you delete the version of the theme that the alias points to.

``` swift
public func deleteThemeAlias(input: DeleteThemeAliasInput, completion: @escaping (ClientRuntime.SdkResult<DeleteThemeAliasOutputResponse, DeleteThemeAliasOutputError>) -> Void)
```

### `deleteUser(input:completion:)`

Deletes the Amazon QuickSight user that is associated with the identity of the Identity and Access Management (IAM) user or role that's making the call. The IAM user isn't deleted as a result of this call.

``` swift
public func deleteUser(input: DeleteUserInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUserOutputResponse, DeleteUserOutputError>) -> Void)
```

### `deleteUserByPrincipalId(input:completion:)`

Deletes a user identified by its principal ID.

``` swift
public func deleteUserByPrincipalId(input: DeleteUserByPrincipalIdInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUserByPrincipalIdOutputResponse, DeleteUserByPrincipalIdOutputError>) -> Void)
```

### `describeAccountCustomization(input:completion:)`

Describes the customizations associated with the provided Amazon Web Services account and Amazon Amazon QuickSight namespace in an Amazon Web Services Region;. The Amazon QuickSight console evaluates which customizations to apply by running this API operation with the Resolved flag included. To determine what customizations display when you run this command, it can help to visualize the relationship of the entities involved.

``` swift
public func describeAccountCustomization(input: DescribeAccountCustomizationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAccountCustomizationOutputResponse, DescribeAccountCustomizationOutputError>) -> Void)
```

  - Amazon Web Services account - The Amazon Web Services account exists at the top of the hierarchy. It has the potential to use all of the Amazon Web Services Regions; and AWS Services. When you subscribe to Amazon QuickSight, you choose one Amazon Web Services Region; to use as your home Region. That's where your free SPICE capacity is located. You can use Amazon QuickSight in any supported Amazon Web Services Region;.

  - Amazon Web Services Region; - In each Amazon Web Services Region; where you sign in to Amazon QuickSight at least once, Amazon QuickSight acts as a separate instance of the same service. If you have a user directory, it resides in us-east-1, which is the US East (N. Virginia). Generally speaking, these users have access to Amazon QuickSight in any Amazon Web Services Region;, unless they are constrained to a namespace. To run the command in a different Amazon Web Services Region;, you change your Region settings. If you're using the AWS CLI, you can use one of the following options:

  - Use [command line options](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-options.html).

  - Use [named profiles](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html).

  - Run aws configure to change your default Amazon Web Services Region;. Use Enter to key the same settings for your keys. For more information, see [Configuring the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html).

  - Namespace - A Amazon QuickSight namespace is a partition that contains users and assets (data sources, datasets, dashboards, and so on). To access assets that are in a specific namespace, users and groups must also be part of the same namespace. People who share a namespace are completely isolated from users and assets in other namespaces, even if they are in the same Amazon Web Services account and Amazon Web Services Region;.

  - Applied customizations - Within an Amazon Web Services Region;, a set of Amazon QuickSight customizations can apply to an Amazon Web Services account or to a namespace. Settings that you apply to a namespace override settings that you apply to an Amazon Web Services account. All settings are isolated to a single Amazon Web Services Region;. To apply them in other Amazon Web Services Regions;, run the CreateAccountCustomization command in each Amazon Web Services Region; where you want to apply the same customizations.

### `describeAccountSettings(input:completion:)`

Describes the settings that were used when your Amazon QuickSight subscription was first created in this Amazon Web Services account.

``` swift
public func describeAccountSettings(input: DescribeAccountSettingsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAccountSettingsOutputResponse, DescribeAccountSettingsOutputError>) -> Void)
```

### `describeAnalysis(input:completion:)`

Provides a summary of the metadata for an analysis.

``` swift
public func describeAnalysis(input: DescribeAnalysisInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAnalysisOutputResponse, DescribeAnalysisOutputError>) -> Void)
```

### `describeAnalysisPermissions(input:completion:)`

Provides the read and write permissions for an analysis.

``` swift
public func describeAnalysisPermissions(input: DescribeAnalysisPermissionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAnalysisPermissionsOutputResponse, DescribeAnalysisPermissionsOutputError>) -> Void)
```

### `describeDashboard(input:completion:)`

Provides a summary for a dashboard.

``` swift
public func describeDashboard(input: DescribeDashboardInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDashboardOutputResponse, DescribeDashboardOutputError>) -> Void)
```

### `describeDashboardPermissions(input:completion:)`

Describes read and write permissions for a dashboard.

``` swift
public func describeDashboardPermissions(input: DescribeDashboardPermissionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDashboardPermissionsOutputResponse, DescribeDashboardPermissionsOutputError>) -> Void)
```

### `describeDataSet(input:completion:)`

Describes a dataset.

``` swift
public func describeDataSet(input: DescribeDataSetInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDataSetOutputResponse, DescribeDataSetOutputError>) -> Void)
```

### `describeDataSetPermissions(input:completion:)`

Describes the permissions on a dataset. The permissions resource is arn:aws:quicksight:region:aws-account-id:dataset/data-set-id.

``` swift
public func describeDataSetPermissions(input: DescribeDataSetPermissionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDataSetPermissionsOutputResponse, DescribeDataSetPermissionsOutputError>) -> Void)
```

### `describeDataSource(input:completion:)`

Describes a data source.

``` swift
public func describeDataSource(input: DescribeDataSourceInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDataSourceOutputResponse, DescribeDataSourceOutputError>) -> Void)
```

### `describeDataSourcePermissions(input:completion:)`

Describes the resource permissions for a data source.

``` swift
public func describeDataSourcePermissions(input: DescribeDataSourcePermissionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDataSourcePermissionsOutputResponse, DescribeDataSourcePermissionsOutputError>) -> Void)
```

### `describeFolder(input:completion:)`

Describes a folder.

``` swift
public func describeFolder(input: DescribeFolderInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFolderOutputResponse, DescribeFolderOutputError>) -> Void)
```

### `describeFolderPermissions(input:completion:)`

Describes permissions for a folder.

``` swift
public func describeFolderPermissions(input: DescribeFolderPermissionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFolderPermissionsOutputResponse, DescribeFolderPermissionsOutputError>) -> Void)
```

### `describeFolderResolvedPermissions(input:completion:)`

Describes the folder resolved permissions. Permissions consists of both folder direct permissions and the inherited permissions from the ancestor folders.

``` swift
public func describeFolderResolvedPermissions(input: DescribeFolderResolvedPermissionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFolderResolvedPermissionsOutputResponse, DescribeFolderResolvedPermissionsOutputError>) -> Void)
```

### `describeGroup(input:completion:)`

Returns an Amazon QuickSight group's description and Amazon Resource Name (ARN).

``` swift
public func describeGroup(input: DescribeGroupInput, completion: @escaping (ClientRuntime.SdkResult<DescribeGroupOutputResponse, DescribeGroupOutputError>) -> Void)
```

### `describeIAMPolicyAssignment(input:completion:)`

Describes an existing IAMpolicy assignment, as specified by the assignment name.

``` swift
public func describeIAMPolicyAssignment(input: DescribeIAMPolicyAssignmentInput, completion: @escaping (ClientRuntime.SdkResult<DescribeIAMPolicyAssignmentOutputResponse, DescribeIAMPolicyAssignmentOutputError>) -> Void)
```

### `describeIngestion(input:completion:)`

Describes a SPICE ingestion.

``` swift
public func describeIngestion(input: DescribeIngestionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeIngestionOutputResponse, DescribeIngestionOutputError>) -> Void)
```

### `describeNamespace(input:completion:)`

Describes the current namespace.

``` swift
public func describeNamespace(input: DescribeNamespaceInput, completion: @escaping (ClientRuntime.SdkResult<DescribeNamespaceOutputResponse, DescribeNamespaceOutputError>) -> Void)
```

### `describeTemplate(input:completion:)`

Describes a template's metadata.

``` swift
public func describeTemplate(input: DescribeTemplateInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTemplateOutputResponse, DescribeTemplateOutputError>) -> Void)
```

### `describeTemplateAlias(input:completion:)`

Describes the template alias for a template.

``` swift
public func describeTemplateAlias(input: DescribeTemplateAliasInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTemplateAliasOutputResponse, DescribeTemplateAliasOutputError>) -> Void)
```

### `describeTemplatePermissions(input:completion:)`

Describes read and write permissions on a template.

``` swift
public func describeTemplatePermissions(input: DescribeTemplatePermissionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTemplatePermissionsOutputResponse, DescribeTemplatePermissionsOutputError>) -> Void)
```

### `describeTheme(input:completion:)`

Describes a theme.

``` swift
public func describeTheme(input: DescribeThemeInput, completion: @escaping (ClientRuntime.SdkResult<DescribeThemeOutputResponse, DescribeThemeOutputError>) -> Void)
```

### `describeThemeAlias(input:completion:)`

Describes the alias for a theme.

``` swift
public func describeThemeAlias(input: DescribeThemeAliasInput, completion: @escaping (ClientRuntime.SdkResult<DescribeThemeAliasOutputResponse, DescribeThemeAliasOutputError>) -> Void)
```

### `describeThemePermissions(input:completion:)`

Describes the read and write permissions for a theme.

``` swift
public func describeThemePermissions(input: DescribeThemePermissionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeThemePermissionsOutputResponse, DescribeThemePermissionsOutputError>) -> Void)
```

### `describeUser(input:completion:)`

Returns information about a user, given the user name.

``` swift
public func describeUser(input: DescribeUserInput, completion: @escaping (ClientRuntime.SdkResult<DescribeUserOutputResponse, DescribeUserOutputError>) -> Void)
```

### `generateEmbedUrlForAnonymousUser(input:completion:)`

Generates an embed URL that you can use to embed an Amazon QuickSight dashboard in your website, without having to register any reader users. Before you use this action, make sure that you have configured the dashboards and permissions. The following rules apply to the generated URL:

``` swift
public func generateEmbedUrlForAnonymousUser(input: GenerateEmbedUrlForAnonymousUserInput, completion: @escaping (ClientRuntime.SdkResult<GenerateEmbedUrlForAnonymousUserOutputResponse, GenerateEmbedUrlForAnonymousUserOutputError>) -> Void)
```

  - It contains a temporary bearer token. It is valid for 5 minutes after it is generated. Once redeemed within this period, it cannot be re-used again.

  - The URL validity period should not be confused with the actual session lifetime that can be customized using the [SessionLifetimeInMinutes](https://docs.aws.amazon.com/quicksight/latest/APIReference/API_GenerateEmbedUrlForAnonymousUser.html#QS-GenerateEmbedUrlForAnonymousUser-request-SessionLifetimeInMinutes) parameter. The resulting user session is valid for 15 minutes (default) to 10 hours (maximum).

  - You are charged only when the URL is used or there is interaction with Amazon QuickSight.

For more information, see [Embedded Analytics](https://docs.aws.amazon.com/quicksight/latest/user/embedded-analytics.html) in the Amazon QuickSight User Guide. For more information about the high-level steps for embedding and for an interactive demo of the ways you can customize embedding, visit the [Amazon QuickSight Developer Portal](https://docs.aws.amazon.com/quicksight/latest/user/quicksight-dev-portal.html).

### `generateEmbedUrlForRegisteredUser(input:completion:)`

Generates an embed URL that you can use to embed an Amazon QuickSight experience in your website. This action can be used for any type of user registered in an Amazon QuickSight account. Before you use this action, make sure that you have configured the relevant Amazon QuickSight resource and permissions. The following rules apply to the generated URL:

``` swift
public func generateEmbedUrlForRegisteredUser(input: GenerateEmbedUrlForRegisteredUserInput, completion: @escaping (ClientRuntime.SdkResult<GenerateEmbedUrlForRegisteredUserOutputResponse, GenerateEmbedUrlForRegisteredUserOutputError>) -> Void)
```

  - It contains a temporary bearer token. It is valid for 5 minutes after it is generated. Once redeemed within this period, it cannot be re-used again.

  - The URL validity period should not be confused with the actual session lifetime that can be customized using the [SessionLifetimeInMinutes](https://docs.aws.amazon.com/quicksight/latest/APIReference/API_GenerateEmbedUrlForRegisteredUser.html#QS-GenerateEmbedUrlForRegisteredUser-request-SessionLifetimeInMinutes) parameter. The resulting user session is valid for 15 minutes (default) to 10 hours (maximum).

  - You are charged only when the URL is used or there is interaction with Amazon QuickSight.

For more information, see [Embedded Analytics](https://docs.aws.amazon.com/quicksight/latest/user/embedded-analytics.html) in the Amazon QuickSight User Guide. For more information about the high-level steps for embedding and for an interactive demo of the ways you can customize embedding, visit the [Amazon QuickSight Developer Portal](https://docs.aws.amazon.com/quicksight/latest/user/quicksight-dev-portal.html).

### `getDashboardEmbedUrl(input:completion:)`

Generates a session URL and authorization code that you can use to embed an Amazon Amazon QuickSight read-only dashboard in your web server code. Before you use this command, make sure that you have configured the dashboards and permissions. Currently, you can use GetDashboardEmbedURL only from the server, not from the user's browser. The following rules apply to the combination of URL and authorization code:

``` swift
public func getDashboardEmbedUrl(input: GetDashboardEmbedUrlInput, completion: @escaping (ClientRuntime.SdkResult<GetDashboardEmbedUrlOutputResponse, GetDashboardEmbedUrlOutputError>) -> Void)
```

  - They must be used together.

  - They can be used one time only.

  - They are valid for 5 minutes after you run this command.

  - The resulting user session is valid for 10 hours.

For more information, see [Embedding Analytics Using GetDashboardEmbedUrl](https://docs.aws.amazon.com/quicksight/latest/user/embedded-analytics-deprecated.html) in the Amazon QuickSight User Guide. For more information about the high-level steps for embedding and for an interactive demo of the ways you can customize embedding, visit the [Amazon QuickSight Developer Portal](https://docs.aws.amazon.com/quicksight/latest/user/quicksight-dev-portal.html).

### `getSessionEmbedUrl(input:completion:)`

Generates a session URL and authorization code that you can use to embed the Amazon Amazon QuickSight console in your web server code. Use GetSessionEmbedUrl where you want to provide an authoring portal that allows users to create data sources, datasets, analyses, and dashboards. The users who access an embedded Amazon QuickSight console need belong to the author or admin security cohort. If you want to restrict permissions to some of these features, add a custom permissions profile to the user with the \[UpdateUser\] API operation. Use \[RegisterUser\] API operation to add a new user with a custom permission profile attached. For more information, see the following sections in the Amazon QuickSight User Guide:

``` swift
public func getSessionEmbedUrl(input: GetSessionEmbedUrlInput, completion: @escaping (ClientRuntime.SdkResult<GetSessionEmbedUrlOutputResponse, GetSessionEmbedUrlOutputError>) -> Void)
```

  - [Embedding Analytics](https://docs.aws.amazon.com/quicksight/latest/user/embedded-analytics.html)

  - [Customizing Access to the Amazon QuickSight Console](https://docs.aws.amazon.com/quicksight/latest/user/customizing-permissions-to-the-quicksight-console.html)

### `listAnalyses(input:completion:)`

Lists Amazon QuickSight analyses that exist in the specified Amazon Web Services account.

``` swift
public func listAnalyses(input: ListAnalysesInput, completion: @escaping (ClientRuntime.SdkResult<ListAnalysesOutputResponse, ListAnalysesOutputError>) -> Void)
```

### `listDashboardVersions(input:completion:)`

Lists all the versions of the dashboards in the Amazon QuickSight subscription.

``` swift
public func listDashboardVersions(input: ListDashboardVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListDashboardVersionsOutputResponse, ListDashboardVersionsOutputError>) -> Void)
```

### `listDashboards(input:completion:)`

Lists dashboards in an Amazon Web Services account.

``` swift
public func listDashboards(input: ListDashboardsInput, completion: @escaping (ClientRuntime.SdkResult<ListDashboardsOutputResponse, ListDashboardsOutputError>) -> Void)
```

### `listDataSets(input:completion:)`

Lists all of the datasets belonging to the current Amazon Web Services account in an Amazon Web Services Region;. The permissions resource is arn:aws:quicksight:region:aws-account-id:dataset/\*.

``` swift
public func listDataSets(input: ListDataSetsInput, completion: @escaping (ClientRuntime.SdkResult<ListDataSetsOutputResponse, ListDataSetsOutputError>) -> Void)
```

### `listDataSources(input:completion:)`

Lists data sources in current Amazon Web Services Region; that belong to this Amazon Web Services account.

``` swift
public func listDataSources(input: ListDataSourcesInput, completion: @escaping (ClientRuntime.SdkResult<ListDataSourcesOutputResponse, ListDataSourcesOutputError>) -> Void)
```

### `listFolderMembers(input:completion:)`

List all assets (DASHBOARD, ANALYSIS, and DATASET) in a folder.

``` swift
public func listFolderMembers(input: ListFolderMembersInput, completion: @escaping (ClientRuntime.SdkResult<ListFolderMembersOutputResponse, ListFolderMembersOutputError>) -> Void)
```

### `listFolders(input:completion:)`

Lists all folders in an account.

``` swift
public func listFolders(input: ListFoldersInput, completion: @escaping (ClientRuntime.SdkResult<ListFoldersOutputResponse, ListFoldersOutputError>) -> Void)
```

### `listGroupMemberships(input:completion:)`

Lists member users in a group.

``` swift
public func listGroupMemberships(input: ListGroupMembershipsInput, completion: @escaping (ClientRuntime.SdkResult<ListGroupMembershipsOutputResponse, ListGroupMembershipsOutputError>) -> Void)
```

### `listGroups(input:completion:)`

Lists all user groups in Amazon QuickSight.

``` swift
public func listGroups(input: ListGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListGroupsOutputResponse, ListGroupsOutputError>) -> Void)
```

### `listIAMPolicyAssignments(input:completion:)`

Lists IAMpolicy assignments in the current Amazon QuickSight account.

``` swift
public func listIAMPolicyAssignments(input: ListIAMPolicyAssignmentsInput, completion: @escaping (ClientRuntime.SdkResult<ListIAMPolicyAssignmentsOutputResponse, ListIAMPolicyAssignmentsOutputError>) -> Void)
```

### `listIAMPolicyAssignmentsForUser(input:completion:)`

Lists all the IAMpolicy assignments, including the Amazon Resource Names (ARNs) for the IAM policies assigned to the specified user and group or groups that the user belongs to.

``` swift
public func listIAMPolicyAssignmentsForUser(input: ListIAMPolicyAssignmentsForUserInput, completion: @escaping (ClientRuntime.SdkResult<ListIAMPolicyAssignmentsForUserOutputResponse, ListIAMPolicyAssignmentsForUserOutputError>) -> Void)
```

### `listIngestions(input:completion:)`

Lists the history of SPICE ingestions for a dataset.

``` swift
public func listIngestions(input: ListIngestionsInput, completion: @escaping (ClientRuntime.SdkResult<ListIngestionsOutputResponse, ListIngestionsOutputError>) -> Void)
```

### `listNamespaces(input:completion:)`

Lists the namespaces for the specified Amazon Web Services account.

``` swift
public func listNamespaces(input: ListNamespacesInput, completion: @escaping (ClientRuntime.SdkResult<ListNamespacesOutputResponse, ListNamespacesOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Lists the tags assigned to a resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `listTemplateAliases(input:completion:)`

Lists all the aliases of a template.

``` swift
public func listTemplateAliases(input: ListTemplateAliasesInput, completion: @escaping (ClientRuntime.SdkResult<ListTemplateAliasesOutputResponse, ListTemplateAliasesOutputError>) -> Void)
```

### `listTemplateVersions(input:completion:)`

Lists all the versions of the templates in the current Amazon QuickSight account.

``` swift
public func listTemplateVersions(input: ListTemplateVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListTemplateVersionsOutputResponse, ListTemplateVersionsOutputError>) -> Void)
```

### `listTemplates(input:completion:)`

Lists all the templates in the current Amazon QuickSight account.

``` swift
public func listTemplates(input: ListTemplatesInput, completion: @escaping (ClientRuntime.SdkResult<ListTemplatesOutputResponse, ListTemplatesOutputError>) -> Void)
```

### `listThemeAliases(input:completion:)`

Lists all the aliases of a theme.

``` swift
public func listThemeAliases(input: ListThemeAliasesInput, completion: @escaping (ClientRuntime.SdkResult<ListThemeAliasesOutputResponse, ListThemeAliasesOutputError>) -> Void)
```

### `listThemeVersions(input:completion:)`

Lists all the versions of the themes in the current Amazon Web Services account.

``` swift
public func listThemeVersions(input: ListThemeVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListThemeVersionsOutputResponse, ListThemeVersionsOutputError>) -> Void)
```

### `listThemes(input:completion:)`

Lists all the themes in the current Amazon Web Services account.

``` swift
public func listThemes(input: ListThemesInput, completion: @escaping (ClientRuntime.SdkResult<ListThemesOutputResponse, ListThemesOutputError>) -> Void)
```

### `listUserGroups(input:completion:)`

Lists the Amazon QuickSight groups that an Amazon QuickSight user is a member of.

``` swift
public func listUserGroups(input: ListUserGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListUserGroupsOutputResponse, ListUserGroupsOutputError>) -> Void)
```

### `listUsers(input:completion:)`

Returns a list of all of the Amazon QuickSight users belonging to this account.

``` swift
public func listUsers(input: ListUsersInput, completion: @escaping (ClientRuntime.SdkResult<ListUsersOutputResponse, ListUsersOutputError>) -> Void)
```

### `registerUser(input:completion:)`

Creates an Amazon QuickSight user, whose identity is associated with the AWS Identity and Access Management (IAM) identity or role specified in the request.

``` swift
public func registerUser(input: RegisterUserInput, completion: @escaping (ClientRuntime.SdkResult<RegisterUserOutputResponse, RegisterUserOutputError>) -> Void)
```

### `restoreAnalysis(input:completion:)`

Restores an analysis.

``` swift
public func restoreAnalysis(input: RestoreAnalysisInput, completion: @escaping (ClientRuntime.SdkResult<RestoreAnalysisOutputResponse, RestoreAnalysisOutputError>) -> Void)
```

### `searchAnalyses(input:completion:)`

Searches for analyses that belong to the user specified in the filter. This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.

``` swift
public func searchAnalyses(input: SearchAnalysesInput, completion: @escaping (ClientRuntime.SdkResult<SearchAnalysesOutputResponse, SearchAnalysesOutputError>) -> Void)
```

### `searchDashboards(input:completion:)`

Searches for dashboards that belong to a user. This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.

``` swift
public func searchDashboards(input: SearchDashboardsInput, completion: @escaping (ClientRuntime.SdkResult<SearchDashboardsOutputResponse, SearchDashboardsOutputError>) -> Void)
```

### `searchFolders(input:completion:)`

Searches the subfolders in a folder.

``` swift
public func searchFolders(input: SearchFoldersInput, completion: @escaping (ClientRuntime.SdkResult<SearchFoldersOutputResponse, SearchFoldersOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Assigns one or more tags (key-value pairs) to the specified Amazon QuickSight resource. Tags can help you organize and categorize your resources. You can also use them to scope user permissions, by granting a user permission to access or change only resources with certain tag values. You can use the TagResource operation with a resource that already has tags. If you specify a new tag key for the resource, this tag is appended to the list of tags associated with the resource. If you specify a tag key that is already associated with the resource, the new tag value that you specify replaces the previous value for that tag. You can associate as many as 50 tags with a resource. Amazon QuickSight supports tagging on data set, data source, dashboard, and template. Tagging for Amazon QuickSight works in a similar way to tagging for other AWS services, except for the following:

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

  - You can't use tags to track AWS costs for Amazon QuickSight. This restriction is because Amazon QuickSight costs are based on users and SPICE capacity, which aren't taggable resources.

  - Amazon QuickSight doesn't currently support the Tag Editor for Resource Groups.

### `untagResource(input:completion:)`

Removes a tag or tags from a resource.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateAccountCustomization(input:completion:)`

Updates Amazon QuickSight customizations the current Amazon Web Services Region;. Currently, the only customization you can use is a theme. You can use customizations for your Amazon Web Services account or, if you specify a namespace, for a Amazon QuickSight namespace instead. Customizations that apply to a namespace override customizations that apply to an Amazon Web Services account. To find out which customizations apply, use the DescribeAccountCustomization API operation.

``` swift
public func updateAccountCustomization(input: UpdateAccountCustomizationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAccountCustomizationOutputResponse, UpdateAccountCustomizationOutputError>) -> Void)
```

### `updateAccountSettings(input:completion:)`

Updates the Amazon QuickSight settings in your Amazon Web Services account.

``` swift
public func updateAccountSettings(input: UpdateAccountSettingsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAccountSettingsOutputResponse, UpdateAccountSettingsOutputError>) -> Void)
```

### `updateAnalysis(input:completion:)`

Updates an analysis in Amazon QuickSight

``` swift
public func updateAnalysis(input: UpdateAnalysisInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAnalysisOutputResponse, UpdateAnalysisOutputError>) -> Void)
```

### `updateAnalysisPermissions(input:completion:)`

Updates the read and write permissions for an analysis.

``` swift
public func updateAnalysisPermissions(input: UpdateAnalysisPermissionsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAnalysisPermissionsOutputResponse, UpdateAnalysisPermissionsOutputError>) -> Void)
```

### `updateDashboard(input:completion:)`

Updates a dashboard in an Amazon Web Services account. Updating a Dashboard creates a new dashboard version but does not immediately publish the new version. You can update the published version of a dashboard by using the \[UpdateDashboardPublishedVersion\] API operation.

``` swift
public func updateDashboard(input: UpdateDashboardInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDashboardOutputResponse, UpdateDashboardOutputError>) -> Void)
```

### `updateDashboardPermissions(input:completion:)`

Updates read and write permissions on a dashboard.

``` swift
public func updateDashboardPermissions(input: UpdateDashboardPermissionsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDashboardPermissionsOutputResponse, UpdateDashboardPermissionsOutputError>) -> Void)
```

### `updateDashboardPublishedVersion(input:completion:)`

Updates the published version of a dashboard.

``` swift
public func updateDashboardPublishedVersion(input: UpdateDashboardPublishedVersionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDashboardPublishedVersionOutputResponse, UpdateDashboardPublishedVersionOutputError>) -> Void)
```

### `updateDataSet(input:completion:)`

Updates a dataset.

``` swift
public func updateDataSet(input: UpdateDataSetInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDataSetOutputResponse, UpdateDataSetOutputError>) -> Void)
```

### `updateDataSetPermissions(input:completion:)`

Updates the permissions on a dataset. The permissions resource is arn:aws:quicksight:region:aws-account-id:dataset/data-set-id.

``` swift
public func updateDataSetPermissions(input: UpdateDataSetPermissionsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDataSetPermissionsOutputResponse, UpdateDataSetPermissionsOutputError>) -> Void)
```

### `updateDataSource(input:completion:)`

Updates a data source.

``` swift
public func updateDataSource(input: UpdateDataSourceInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDataSourceOutputResponse, UpdateDataSourceOutputError>) -> Void)
```

### `updateDataSourcePermissions(input:completion:)`

Updates the permissions to a data source.

``` swift
public func updateDataSourcePermissions(input: UpdateDataSourcePermissionsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDataSourcePermissionsOutputResponse, UpdateDataSourcePermissionsOutputError>) -> Void)
```

### `updateFolder(input:completion:)`

Updates the name of a folder.

``` swift
public func updateFolder(input: UpdateFolderInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFolderOutputResponse, UpdateFolderOutputError>) -> Void)
```

### `updateFolderPermissions(input:completion:)`

Updates permissions of a folder.

``` swift
public func updateFolderPermissions(input: UpdateFolderPermissionsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFolderPermissionsOutputResponse, UpdateFolderPermissionsOutputError>) -> Void)
```

### `updateGroup(input:completion:)`

Changes a group description.

``` swift
public func updateGroup(input: UpdateGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateGroupOutputResponse, UpdateGroupOutputError>) -> Void)
```

### `updateIAMPolicyAssignment(input:completion:)`

Updates an existing IAMpolicy assignment. This operation updates only the optional parameter or parameters that are specified in the request. This overwrites all of the users included in Identities.

``` swift
public func updateIAMPolicyAssignment(input: UpdateIAMPolicyAssignmentInput, completion: @escaping (ClientRuntime.SdkResult<UpdateIAMPolicyAssignmentOutputResponse, UpdateIAMPolicyAssignmentOutputError>) -> Void)
```

### `updateTemplate(input:completion:)`

Updates a template from an existing Amazon QuickSight analysis or another template.

``` swift
public func updateTemplate(input: UpdateTemplateInput, completion: @escaping (ClientRuntime.SdkResult<UpdateTemplateOutputResponse, UpdateTemplateOutputError>) -> Void)
```

### `updateTemplateAlias(input:completion:)`

Updates the template alias of a template.

``` swift
public func updateTemplateAlias(input: UpdateTemplateAliasInput, completion: @escaping (ClientRuntime.SdkResult<UpdateTemplateAliasOutputResponse, UpdateTemplateAliasOutputError>) -> Void)
```

### `updateTemplatePermissions(input:completion:)`

Updates the resource permissions for a template.

``` swift
public func updateTemplatePermissions(input: UpdateTemplatePermissionsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateTemplatePermissionsOutputResponse, UpdateTemplatePermissionsOutputError>) -> Void)
```

### `updateTheme(input:completion:)`

Updates a theme.

``` swift
public func updateTheme(input: UpdateThemeInput, completion: @escaping (ClientRuntime.SdkResult<UpdateThemeOutputResponse, UpdateThemeOutputError>) -> Void)
```

### `updateThemeAlias(input:completion:)`

Updates an alias of a theme.

``` swift
public func updateThemeAlias(input: UpdateThemeAliasInput, completion: @escaping (ClientRuntime.SdkResult<UpdateThemeAliasOutputResponse, UpdateThemeAliasOutputError>) -> Void)
```

### `updateThemePermissions(input:completion:)`

Updates the resource permissions for a theme. Permissions apply to the action to grant or revoke permissions on, for example "quicksight:DescribeTheme". Theme permissions apply in groupings. Valid groupings include the following for the three levels of permissions, which are user, owner, or no permissions:

``` swift
public func updateThemePermissions(input: UpdateThemePermissionsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateThemePermissionsOutputResponse, UpdateThemePermissionsOutputError>) -> Void)
```

  - User

  - "quicksight:DescribeTheme"

  - "quicksight:DescribeThemeAlias"

  - "quicksight:ListThemeAliases"

  - "quicksight:ListThemeVersions"

  - Owner

  - "quicksight:DescribeTheme"

  - "quicksight:DescribeThemeAlias"

  - "quicksight:ListThemeAliases"

  - "quicksight:ListThemeVersions"

  - "quicksight:DeleteTheme"

  - "quicksight:UpdateTheme"

  - "quicksight:CreateThemeAlias"

  - "quicksight:DeleteThemeAlias"

  - "quicksight:UpdateThemeAlias"

  - "quicksight:UpdateThemePermissions"

  - "quicksight:DescribeThemePermissions"

  - To specify no permissions, omit the permissions list.

### `updateUser(input:completion:)`

Updates an Amazon QuickSight user.

``` swift
public func updateUser(input: UpdateUserInput, completion: @escaping (ClientRuntime.SdkResult<UpdateUserOutputResponse, UpdateUserOutputError>) -> Void)
```
