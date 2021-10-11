# QuickSightClientProtocol

<fullname>Amazon QuickSight API Reference</fullname>
Amazon QuickSight is a fully managed, serverless business intelligence service for the
Amazon Web Services Cloud that makes it easy to extend data and insights to every user in your
organization. This API reference contains documentation for a programming interface that
you can use to manage Amazon QuickSight.

``` swift
public protocol QuickSightClientProtocol 
```

## Requirements

### cancelIngestion(input:​completion:​)

Cancels an ongoing ingestion of data into SPICE.

``` swift
func cancelIngestion(input: CancelIngestionInput, completion: @escaping (ClientRuntime.SdkResult<CancelIngestionOutputResponse, CancelIngestionOutputError>) -> Void)
```

### createAccountCustomization(input:​completion:​)

Creates Amazon QuickSight customizations the current Amazon Web Services Region;. Currently, you can
add a custom default theme by using the CreateAccountCustomization or
UpdateAccountCustomization API operation. To further customize
Amazon QuickSight by removing Amazon QuickSight sample assets and videos for all new users, see <a href="https:​//docs.aws.amazon.com/quicksight/latest/user/customizing-quicksight.html">Customizing Amazon QuickSight in the Amazon QuickSight User
Guide.

``` swift
func createAccountCustomization(input: CreateAccountCustomizationInput, completion: @escaping (ClientRuntime.SdkResult<CreateAccountCustomizationOutputResponse, CreateAccountCustomizationOutputError>) -> Void)
```

``` 
    You can create customizations for your Amazon Web Services account or, if you specify a namespace, for
        a Amazon QuickSight namespace instead. Customizations that apply to a namespace always override
        customizations that apply to an Amazon Web Services account. To find out which customizations apply, use
        the DescribeAccountCustomization API operation.
    Before you use the CreateAccountCustomization API operation to add a theme
        as the namespace default, make sure that you first share the theme with the namespace.
        If you don't share it with the namespace, the theme isn't visible to your users
        even if you make it the default theme.
        To check if the theme is shared, view the current permissions by using the

           DescribeThemePermissions
         API operation.
        To share the theme, grant permissions by using the

           UpdateThemePermissions
         API operation.
```

### createAnalysis(input:​completion:​)

Creates an analysis in Amazon QuickSight.

``` swift
func createAnalysis(input: CreateAnalysisInput, completion: @escaping (ClientRuntime.SdkResult<CreateAnalysisOutputResponse, CreateAnalysisOutputError>) -> Void)
```

### createDashboard(input:​completion:​)

Creates a dashboard from a template. To first create a template, see the
CreateTemplate
API operation.
A dashboard is an entity in Amazon QuickSight that identifies Amazon QuickSight reports, created
from analyses. You can share Amazon QuickSight dashboards. With the right permissions, you can
create scheduled email reports from them. If you have the correct permissions, you can
create a dashboard from a template that exists in a different Amazon Web Services account.

``` swift
func createDashboard(input: CreateDashboardInput, completion: @escaping (ClientRuntime.SdkResult<CreateDashboardOutputResponse, CreateDashboardOutputError>) -> Void)
```

### createDataSet(input:​completion:​)

Creates a dataset.

``` swift
func createDataSet(input: CreateDataSetInput, completion: @escaping (ClientRuntime.SdkResult<CreateDataSetOutputResponse, CreateDataSetOutputError>) -> Void)
```

### createDataSource(input:​completion:​)

Creates a data source.

``` swift
func createDataSource(input: CreateDataSourceInput, completion: @escaping (ClientRuntime.SdkResult<CreateDataSourceOutputResponse, CreateDataSourceOutputError>) -> Void)
```

### createFolder(input:​completion:​)

Creates an empty shared folder.

``` swift
func createFolder(input: CreateFolderInput, completion: @escaping (ClientRuntime.SdkResult<CreateFolderOutputResponse, CreateFolderOutputError>) -> Void)
```

### createFolderMembership(input:​completion:​)

Adds an asset, such as a dashboard, analysis, or dataset into a folder.

``` swift
func createFolderMembership(input: CreateFolderMembershipInput, completion: @escaping (ClientRuntime.SdkResult<CreateFolderMembershipOutputResponse, CreateFolderMembershipOutputError>) -> Void)
```

### createGroup(input:​completion:​)

Creates an Amazon QuickSight group.
The permissions resource is
arn:​aws:​quicksight:​us-east-1:​<relevant-aws-account-id>:​group/default/<group-name>
.
The response is a group object.

``` swift
func createGroup(input: CreateGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateGroupOutputResponse, CreateGroupOutputError>) -> Void)
```

### createGroupMembership(input:​completion:​)

Adds an Amazon QuickSight user to an Amazon QuickSight group.

``` swift
func createGroupMembership(input: CreateGroupMembershipInput, completion: @escaping (ClientRuntime.SdkResult<CreateGroupMembershipOutputResponse, CreateGroupMembershipOutputError>) -> Void)
```

### createIAMPolicyAssignment(input:​completion:​)

Creates an assignment with one specified IAMpolicy, identified by its Amazon Resource Name
(ARN). This policy assignment is attached to the specified groups or users of Amazon QuickSight.
Assignment names are unique per Amazon Web Services account. To avoid overwriting rules in other namespaces,
use assignment names that are unique.

``` swift
func createIAMPolicyAssignment(input: CreateIAMPolicyAssignmentInput, completion: @escaping (ClientRuntime.SdkResult<CreateIAMPolicyAssignmentOutputResponse, CreateIAMPolicyAssignmentOutputError>) -> Void)
```

### createIngestion(input:​completion:​)

Creates and starts a new SPICE ingestion on a dataset

``` swift
func createIngestion(input: CreateIngestionInput, completion: @escaping (ClientRuntime.SdkResult<CreateIngestionOutputResponse, CreateIngestionOutputError>) -> Void)
```

``` 
	       Any ingestions operating on tagged datasets inherit the same tags automatically for use in
		access control. For an example, see <a href="http://aws.amazon.com/premiumsupport/knowledge-center/iam-ec2-resource-tags/">How do I create an IAM policy to control access to Amazon EC2 resources using
			tags? in the Amazon Web Services Knowledge Center. Tags are visible on the tagged dataset, but not on the ingestion resource.
```

### createNamespace(input:​completion:​)

(Enterprise edition only) Creates a new namespace for you to use with Amazon QuickSight.
A namespace allows you to isolate the Amazon QuickSight users and groups that are registered
for that namespace. Users that access the namespace can share assets only with other
users or groups in the same namespace. They can't see users and groups in other
namespaces. You can create a namespace after your Amazon Web Services account is subscribed to
Amazon QuickSight. The namespace must be unique within the Amazon Web Services account. By default, there is a
limit of 100 namespaces per Amazon Web Services account. To increase your limit, create a ticket with
Amazon Web Services Support.

``` swift
func createNamespace(input: CreateNamespaceInput, completion: @escaping (ClientRuntime.SdkResult<CreateNamespaceOutputResponse, CreateNamespaceOutputError>) -> Void)
```

### createTemplate(input:​completion:​)

Creates a template from an existing Amazon QuickSight analysis or template. You can use the resulting
template to create a dashboard.
A template is an entity in Amazon QuickSight that encapsulates the metadata
required to create an analysis and that you can use to create s dashboard. A template adds
a layer of abstraction by using placeholders to replace the dataset associated with the
analysis. You can use templates to create dashboards by replacing dataset placeholders
with datasets that follow the same schema that was used to create the source analysis
and template.

``` swift
func createTemplate(input: CreateTemplateInput, completion: @escaping (ClientRuntime.SdkResult<CreateTemplateOutputResponse, CreateTemplateOutputError>) -> Void)
```

### createTemplateAlias(input:​completion:​)

Creates a template alias for a template.

``` swift
func createTemplateAlias(input: CreateTemplateAliasInput, completion: @escaping (ClientRuntime.SdkResult<CreateTemplateAliasOutputResponse, CreateTemplateAliasOutputError>) -> Void)
```

### createTheme(input:​completion:​)

Creates a theme.
A theme is set of configuration options for color and layout.
Themes apply to analyses and dashboards. For more information, see <a href="https:​//docs.aws.amazon.com/quicksight/latest/user/themes-in-quicksight.html">Using
Themes in Amazon QuickSight in the Amazon QuickSight User Guide.

``` swift
func createTheme(input: CreateThemeInput, completion: @escaping (ClientRuntime.SdkResult<CreateThemeOutputResponse, CreateThemeOutputError>) -> Void)
```

### createThemeAlias(input:​completion:​)

Creates a theme alias for a theme.

``` swift
func createThemeAlias(input: CreateThemeAliasInput, completion: @escaping (ClientRuntime.SdkResult<CreateThemeAliasOutputResponse, CreateThemeAliasOutputError>) -> Void)
```

### deleteAccountCustomization(input:​completion:​)

Deletes all Amazon QuickSight customizations in this Amazon Web Services Region; for the specified
Amazon Web Services account and Amazon QuickSight namespace.

``` swift
func deleteAccountCustomization(input: DeleteAccountCustomizationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAccountCustomizationOutputResponse, DeleteAccountCustomizationOutputError>) -> Void)
```

### deleteAnalysis(input:​completion:​)

Deletes an analysis from Amazon QuickSight. You can optionally include a recovery window during
which you can restore the analysis. If you don't specify a recovery window value, the
operation defaults to 30 days. Amazon QuickSight attaches a DeletionTime stamp to
the response that specifies the end of the recovery window. At the end of the recovery
window, Amazon QuickSight deletes the analysis permanently.
At any time before recovery window ends, you can use the RestoreAnalysis
API operation to remove the DeletionTime stamp and cancel the deletion of
the analysis. The analysis remains visible in the API until it's deleted, so you can
describe it but you can't make a template from it.
An analysis that's scheduled for deletion isn't accessible in the Amazon QuickSight console.
To access it in the console, restore it. Deleting an analysis doesn't delete the
dashboards that you publish from it.

``` swift
func deleteAnalysis(input: DeleteAnalysisInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAnalysisOutputResponse, DeleteAnalysisOutputError>) -> Void)
```

### deleteDashboard(input:​completion:​)

Deletes a dashboard.

``` swift
func deleteDashboard(input: DeleteDashboardInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDashboardOutputResponse, DeleteDashboardOutputError>) -> Void)
```

### deleteDataSet(input:​completion:​)

Deletes a dataset.

``` swift
func deleteDataSet(input: DeleteDataSetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDataSetOutputResponse, DeleteDataSetOutputError>) -> Void)
```

### deleteDataSource(input:​completion:​)

Deletes the data source permanently. This operation breaks
all the datasets that reference the deleted data source.

``` swift
func deleteDataSource(input: DeleteDataSourceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDataSourceOutputResponse, DeleteDataSourceOutputError>) -> Void)
```

### deleteFolder(input:​completion:​)

Deletes an empty folder.

``` swift
func deleteFolder(input: DeleteFolderInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFolderOutputResponse, DeleteFolderOutputError>) -> Void)
```

### deleteFolderMembership(input:​completion:​)

Removes an asset, such as a dashboard, analysis, or dataset, from a folder.

``` swift
func deleteFolderMembership(input: DeleteFolderMembershipInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFolderMembershipOutputResponse, DeleteFolderMembershipOutputError>) -> Void)
```

### deleteGroup(input:​completion:​)

Removes a user group from Amazon QuickSight.

``` swift
func deleteGroup(input: DeleteGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteGroupOutputResponse, DeleteGroupOutputError>) -> Void)
```

### deleteGroupMembership(input:​completion:​)

Removes a user from a group so that the user is no longer a member of the group.

``` swift
func deleteGroupMembership(input: DeleteGroupMembershipInput, completion: @escaping (ClientRuntime.SdkResult<DeleteGroupMembershipOutputResponse, DeleteGroupMembershipOutputError>) -> Void)
```

### deleteIAMPolicyAssignment(input:​completion:​)

Deletes an existing IAMpolicy assignment.

``` swift
func deleteIAMPolicyAssignment(input: DeleteIAMPolicyAssignmentInput, completion: @escaping (ClientRuntime.SdkResult<DeleteIAMPolicyAssignmentOutputResponse, DeleteIAMPolicyAssignmentOutputError>) -> Void)
```

### deleteNamespace(input:​completion:​)

Deletes a namespace and the users and groups that are associated with the namespace.
This is an asynchronous process. Assets including dashboards, analyses, datasets and data sources are not
deleted. To delete these assets, you use the API operations for the relevant asset.

``` swift
func deleteNamespace(input: DeleteNamespaceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteNamespaceOutputResponse, DeleteNamespaceOutputError>) -> Void)
```

### deleteTemplate(input:​completion:​)

Deletes a template.

``` swift
func deleteTemplate(input: DeleteTemplateInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTemplateOutputResponse, DeleteTemplateOutputError>) -> Void)
```

### deleteTemplateAlias(input:​completion:​)

Deletes the item that the specified template alias points to. If you provide a specific
alias, you delete the version of the template that the alias points to.

``` swift
func deleteTemplateAlias(input: DeleteTemplateAliasInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTemplateAliasOutputResponse, DeleteTemplateAliasOutputError>) -> Void)
```

### deleteTheme(input:​completion:​)

Deletes a theme.

``` swift
func deleteTheme(input: DeleteThemeInput, completion: @escaping (ClientRuntime.SdkResult<DeleteThemeOutputResponse, DeleteThemeOutputError>) -> Void)
```

### deleteThemeAlias(input:​completion:​)

Deletes the version of the theme that the specified theme alias points to.
If you provide a specific alias, you delete the version of the theme
that the alias points to.

``` swift
func deleteThemeAlias(input: DeleteThemeAliasInput, completion: @escaping (ClientRuntime.SdkResult<DeleteThemeAliasOutputResponse, DeleteThemeAliasOutputError>) -> Void)
```

### deleteUser(input:​completion:​)

Deletes the Amazon QuickSight user that is associated with the identity of the
Identity and Access Management (IAM) user or role that's making the call. The IAM user
isn't deleted as a result of this call.

``` swift
func deleteUser(input: DeleteUserInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUserOutputResponse, DeleteUserOutputError>) -> Void)
```

### deleteUserByPrincipalId(input:​completion:​)

Deletes a user identified by its principal ID.

``` swift
func deleteUserByPrincipalId(input: DeleteUserByPrincipalIdInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUserByPrincipalIdOutputResponse, DeleteUserByPrincipalIdOutputError>) -> Void)
```

### describeAccountCustomization(input:​completion:​)

Describes the customizations associated with the provided Amazon Web Services account and Amazon
Amazon QuickSight namespace in an Amazon Web Services Region;. The Amazon QuickSight console evaluates which
customizations to apply by running this API operation with the Resolved flag
included.
To determine what customizations display when you run this command, it can help to
visualize the relationship of the entities involved.

``` swift
func describeAccountCustomization(input: DescribeAccountCustomizationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAccountCustomizationOutputResponse, DescribeAccountCustomizationOutputError>) -> Void)
```

``` 
              Amazon Web Services account - The Amazon Web Services account exists at the top of the hierarchy.
                It has the potential to use all of the Amazon Web Services Regions; and AWS Services. When you
                subscribe to Amazon QuickSight, you choose one Amazon Web Services Region; to use as your home Region.
                That's where your free SPICE capacity is located. You can use Amazon QuickSight in any
                supported Amazon Web Services Region;.



              Amazon Web Services Region; - In each Amazon Web Services Region; where you sign in to Amazon QuickSight
                at least once, Amazon QuickSight acts as a separate instance of the same service. If
                you have a user directory, it resides in us-east-1, which is the US East (N.
                Virginia). Generally speaking, these users have access to Amazon QuickSight in any
                Amazon Web Services Region;, unless they are constrained to a namespace.
            To run the command in a different Amazon Web Services Region;, you change your Region settings.
                If you're using the AWS CLI, you can use one of the following options:


                    Use <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-options.html">command line options.


                    Use <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html">named profiles.


                    Run aws configure to change your default Amazon Web Services Region;. Use
                        Enter to key the same settings for your keys. For more information, see
                        <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html">Configuring the AWS CLI.





              Namespace - A Amazon QuickSight namespace is a partition that contains
                users and assets (data sources, datasets, dashboards, and so on). To access
                assets that are in a specific namespace, users and groups must also be part of
                the same namespace. People who share a namespace are completely isolated from
                users and assets in other namespaces, even if they are in the same Amazon Web Services account
                and Amazon Web Services Region;.



              Applied customizations -  Within an Amazon Web Services Region;, a set of
                Amazon QuickSight customizations can apply to an Amazon Web Services account or to a namespace.
                Settings that you apply to a namespace override settings that you apply to an
                Amazon Web Services account. All settings are isolated to a single Amazon Web Services Region;. To apply them in
                other Amazon Web Services Regions;, run the CreateAccountCustomization command in
                each Amazon Web Services Region; where you want to apply the same customizations.
```

### describeAccountSettings(input:​completion:​)

Describes the settings that were used when your Amazon QuickSight subscription was first
created in this Amazon Web Services account.

``` swift
func describeAccountSettings(input: DescribeAccountSettingsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAccountSettingsOutputResponse, DescribeAccountSettingsOutputError>) -> Void)
```

### describeAnalysis(input:​completion:​)

Provides a summary of the metadata for an analysis.

``` swift
func describeAnalysis(input: DescribeAnalysisInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAnalysisOutputResponse, DescribeAnalysisOutputError>) -> Void)
```

### describeAnalysisPermissions(input:​completion:​)

Provides the read and write permissions for an analysis.

``` swift
func describeAnalysisPermissions(input: DescribeAnalysisPermissionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAnalysisPermissionsOutputResponse, DescribeAnalysisPermissionsOutputError>) -> Void)
```

### describeDashboard(input:​completion:​)

Provides a summary for a dashboard.

``` swift
func describeDashboard(input: DescribeDashboardInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDashboardOutputResponse, DescribeDashboardOutputError>) -> Void)
```

### describeDashboardPermissions(input:​completion:​)

Describes read and write permissions for a dashboard.

``` swift
func describeDashboardPermissions(input: DescribeDashboardPermissionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDashboardPermissionsOutputResponse, DescribeDashboardPermissionsOutputError>) -> Void)
```

### describeDataSet(input:​completion:​)

Describes a dataset.

``` swift
func describeDataSet(input: DescribeDataSetInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDataSetOutputResponse, DescribeDataSetOutputError>) -> Void)
```

### describeDataSetPermissions(input:​completion:​)

Describes the permissions on a dataset.
The permissions resource is arn:​aws:​quicksight:​region:​aws-account-id:​dataset/data-set-id.

``` swift
func describeDataSetPermissions(input: DescribeDataSetPermissionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDataSetPermissionsOutputResponse, DescribeDataSetPermissionsOutputError>) -> Void)
```

### describeDataSource(input:​completion:​)

Describes a data source.

``` swift
func describeDataSource(input: DescribeDataSourceInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDataSourceOutputResponse, DescribeDataSourceOutputError>) -> Void)
```

### describeDataSourcePermissions(input:​completion:​)

Describes the resource permissions for a data source.

``` swift
func describeDataSourcePermissions(input: DescribeDataSourcePermissionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDataSourcePermissionsOutputResponse, DescribeDataSourcePermissionsOutputError>) -> Void)
```

### describeFolder(input:​completion:​)

Describes a folder.

``` swift
func describeFolder(input: DescribeFolderInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFolderOutputResponse, DescribeFolderOutputError>) -> Void)
```

### describeFolderPermissions(input:​completion:​)

Describes permissions for a folder.

``` swift
func describeFolderPermissions(input: DescribeFolderPermissionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFolderPermissionsOutputResponse, DescribeFolderPermissionsOutputError>) -> Void)
```

### describeFolderResolvedPermissions(input:​completion:​)

Describes the folder resolved permissions. Permissions consists of both folder direct permissions and the inherited permissions from the ancestor folders.

``` swift
func describeFolderResolvedPermissions(input: DescribeFolderResolvedPermissionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFolderResolvedPermissionsOutputResponse, DescribeFolderResolvedPermissionsOutputError>) -> Void)
```

### describeGroup(input:​completion:​)

Returns an Amazon QuickSight group's description and Amazon Resource Name (ARN).

``` swift
func describeGroup(input: DescribeGroupInput, completion: @escaping (ClientRuntime.SdkResult<DescribeGroupOutputResponse, DescribeGroupOutputError>) -> Void)
```

### describeIAMPolicyAssignment(input:​completion:​)

Describes an existing IAMpolicy assignment, as specified by the assignment name.

``` swift
func describeIAMPolicyAssignment(input: DescribeIAMPolicyAssignmentInput, completion: @escaping (ClientRuntime.SdkResult<DescribeIAMPolicyAssignmentOutputResponse, DescribeIAMPolicyAssignmentOutputError>) -> Void)
```

### describeIngestion(input:​completion:​)

Describes a SPICE ingestion.

``` swift
func describeIngestion(input: DescribeIngestionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeIngestionOutputResponse, DescribeIngestionOutputError>) -> Void)
```

### describeNamespace(input:​completion:​)

Describes the current namespace.

``` swift
func describeNamespace(input: DescribeNamespaceInput, completion: @escaping (ClientRuntime.SdkResult<DescribeNamespaceOutputResponse, DescribeNamespaceOutputError>) -> Void)
```

### describeTemplate(input:​completion:​)

Describes a template's metadata.

``` swift
func describeTemplate(input: DescribeTemplateInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTemplateOutputResponse, DescribeTemplateOutputError>) -> Void)
```

### describeTemplateAlias(input:​completion:​)

Describes the template alias for a template.

``` swift
func describeTemplateAlias(input: DescribeTemplateAliasInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTemplateAliasOutputResponse, DescribeTemplateAliasOutputError>) -> Void)
```

### describeTemplatePermissions(input:​completion:​)

Describes read and write permissions on a template.

``` swift
func describeTemplatePermissions(input: DescribeTemplatePermissionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTemplatePermissionsOutputResponse, DescribeTemplatePermissionsOutputError>) -> Void)
```

### describeTheme(input:​completion:​)

Describes a theme.

``` swift
func describeTheme(input: DescribeThemeInput, completion: @escaping (ClientRuntime.SdkResult<DescribeThemeOutputResponse, DescribeThemeOutputError>) -> Void)
```

### describeThemeAlias(input:​completion:​)

Describes the alias for a theme.

``` swift
func describeThemeAlias(input: DescribeThemeAliasInput, completion: @escaping (ClientRuntime.SdkResult<DescribeThemeAliasOutputResponse, DescribeThemeAliasOutputError>) -> Void)
```

### describeThemePermissions(input:​completion:​)

Describes the read and write permissions for a theme.

``` swift
func describeThemePermissions(input: DescribeThemePermissionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeThemePermissionsOutputResponse, DescribeThemePermissionsOutputError>) -> Void)
```

### describeUser(input:​completion:​)

Returns information about a user, given the user name.

``` swift
func describeUser(input: DescribeUserInput, completion: @escaping (ClientRuntime.SdkResult<DescribeUserOutputResponse, DescribeUserOutputError>) -> Void)
```

### generateEmbedUrlForAnonymousUser(input:​completion:​)

Generates an embed URL that you can use to embed an Amazon QuickSight dashboard in your website, without having to register any reader users. Before you use this action, make sure that you have configured the dashboards and permissions.
The following rules apply to the generated URL:​

``` swift
func generateEmbedUrlForAnonymousUser(input: GenerateEmbedUrlForAnonymousUserInput, completion: @escaping (ClientRuntime.SdkResult<GenerateEmbedUrlForAnonymousUserOutputResponse, GenerateEmbedUrlForAnonymousUserOutputError>) -> Void)
```

``` 
            It contains a temporary bearer token. It is valid for 5 minutes after it is generated. Once redeemed within this period, it cannot be re-used again.


            The URL validity period should not be confused with the actual session lifetime
    that can be customized using the
                 <a href="https://docs.aws.amazon.com/quicksight/latest/APIReference/API_GenerateEmbedUrlForAnonymousUser.html#QS-GenerateEmbedUrlForAnonymousUser-request-SessionLifetimeInMinutes">SessionLifetimeInMinutes
               parameter.
            The resulting user session is valid for 15 minutes (default) to 10 hours (maximum).


            You are charged only when the URL is used or there is interaction with Amazon QuickSight.


    For more information, see <a href="https://docs.aws.amazon.com/quicksight/latest/user/embedded-analytics.html">Embedded Analytics in the Amazon QuickSight User
        Guide.
    For more information about the high-level steps for embedding and for an interactive demo of the ways you can customize embedding, visit the <a href="https://docs.aws.amazon.com/quicksight/latest/user/quicksight-dev-portal.html">Amazon QuickSight Developer Portal.
```

### generateEmbedUrlForRegisteredUser(input:​completion:​)

Generates an embed URL that you can use to embed an Amazon QuickSight experience in your website. This action can be used for any type of user registered in an Amazon QuickSight account. Before you use this action, make sure that you have configured the relevant Amazon QuickSight resource and permissions.
The following rules apply to the generated URL:​

``` swift
func generateEmbedUrlForRegisteredUser(input: GenerateEmbedUrlForRegisteredUserInput, completion: @escaping (ClientRuntime.SdkResult<GenerateEmbedUrlForRegisteredUserOutputResponse, GenerateEmbedUrlForRegisteredUserOutputError>) -> Void)
```

``` 
            It contains a temporary bearer token. It is valid for 5 minutes after it is generated. Once redeemed within this period, it cannot be re-used again.


            The URL validity period should not be confused with the actual session lifetime
    that can be customized using the
                 <a href="https://docs.aws.amazon.com/quicksight/latest/APIReference/API_GenerateEmbedUrlForRegisteredUser.html#QS-GenerateEmbedUrlForRegisteredUser-request-SessionLifetimeInMinutes">SessionLifetimeInMinutes
               parameter.
            The resulting user session is valid for 15 minutes (default) to 10 hours (maximum).


            You are charged only when the URL is used or there is interaction with Amazon QuickSight.


    For more information, see <a href="https://docs.aws.amazon.com/quicksight/latest/user/embedded-analytics.html">Embedded Analytics in the Amazon QuickSight User
        Guide.
        For more information about the high-level steps for embedding and for an interactive demo of the ways you can customize embedding, visit the <a href="https://docs.aws.amazon.com/quicksight/latest/user/quicksight-dev-portal.html">Amazon QuickSight Developer Portal.
```

### getDashboardEmbedUrl(input:​completion:​)

Generates a session URL and authorization code that you can use to embed an Amazon
Amazon QuickSight read-only dashboard in your web server code. Before you use this command,
make sure that you have configured the dashboards and permissions.
Currently, you can use GetDashboardEmbedURL only from the server, not
from the user's browser. The following rules apply to the combination of URL and
authorization code:​

``` swift
func getDashboardEmbedUrl(input: GetDashboardEmbedUrlInput, completion: @escaping (ClientRuntime.SdkResult<GetDashboardEmbedUrlOutputResponse, GetDashboardEmbedUrlOutputError>) -> Void)
```

``` 
            They must be used together.


            They can be used one time only.


            They are valid for 5 minutes after you run this command.


            The resulting user session is valid for 10 hours.


    For more information, see <a href="https://docs.aws.amazon.com/quicksight/latest/user/embedded-analytics-deprecated.html">Embedding Analytics Using GetDashboardEmbedUrl in the Amazon QuickSight User
        Guide.
        For more information about the high-level steps for embedding and for an interactive demo of the ways you can customize embedding, visit the <a href="https://docs.aws.amazon.com/quicksight/latest/user/quicksight-dev-portal.html">Amazon QuickSight Developer Portal.
```

### getSessionEmbedUrl(input:​completion:​)

Generates a session URL and authorization code that you can use to embed the Amazon
Amazon QuickSight console in your web server code. Use GetSessionEmbedUrl where
you want to provide an authoring portal that allows users to create data sources,
datasets, analyses, and dashboards. The users who access an embedded Amazon QuickSight console
need belong to the author or admin security cohort. If you want to restrict permissions
to some of these features, add a custom permissions profile to the user with the

``` swift
func getSessionEmbedUrl(input: GetSessionEmbedUrlInput, completion: @escaping (ClientRuntime.SdkResult<GetSessionEmbedUrlOutputResponse, GetSessionEmbedUrlOutputError>) -> Void)
```

``` 
           UpdateUser
         API operation. Use
           RegisterUser
         API operation to add a new user with a custom permission profile attached. For more
        information, see the following sections in the Amazon QuickSight User
        Guide:



              <a href="https://docs.aws.amazon.com/quicksight/latest/user/embedded-analytics.html">Embedding Analytics




              <a href="https://docs.aws.amazon.com/quicksight/latest/user/customizing-permissions-to-the-quicksight-console.html">Customizing Access to the Amazon QuickSight Console
```

### listAnalyses(input:​completion:​)

Lists Amazon QuickSight analyses that exist in the specified Amazon Web Services account.

``` swift
func listAnalyses(input: ListAnalysesInput, completion: @escaping (ClientRuntime.SdkResult<ListAnalysesOutputResponse, ListAnalysesOutputError>) -> Void)
```

### listDashboards(input:​completion:​)

Lists dashboards in an Amazon Web Services account.

``` swift
func listDashboards(input: ListDashboardsInput, completion: @escaping (ClientRuntime.SdkResult<ListDashboardsOutputResponse, ListDashboardsOutputError>) -> Void)
```

### listDashboardVersions(input:​completion:​)

Lists all the versions of the dashboards in the Amazon QuickSight subscription.

``` swift
func listDashboardVersions(input: ListDashboardVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListDashboardVersionsOutputResponse, ListDashboardVersionsOutputError>) -> Void)
```

### listDataSets(input:​completion:​)

Lists all of the datasets belonging to the current Amazon Web Services account in an Amazon Web Services Region;.
The permissions resource is arn:​aws:​quicksight:​region:​aws-account-id:​dataset/\*.

``` swift
func listDataSets(input: ListDataSetsInput, completion: @escaping (ClientRuntime.SdkResult<ListDataSetsOutputResponse, ListDataSetsOutputError>) -> Void)
```

### listDataSources(input:​completion:​)

Lists data sources in current Amazon Web Services Region; that belong to this Amazon Web Services account.

``` swift
func listDataSources(input: ListDataSourcesInput, completion: @escaping (ClientRuntime.SdkResult<ListDataSourcesOutputResponse, ListDataSourcesOutputError>) -> Void)
```

### listFolderMembers(input:​completion:​)

List all assets (DASHBOARD, ANALYSIS, and DATASET) in a folder.

``` swift
func listFolderMembers(input: ListFolderMembersInput, completion: @escaping (ClientRuntime.SdkResult<ListFolderMembersOutputResponse, ListFolderMembersOutputError>) -> Void)
```

### listFolders(input:​completion:​)

Lists all folders in an account.

``` swift
func listFolders(input: ListFoldersInput, completion: @escaping (ClientRuntime.SdkResult<ListFoldersOutputResponse, ListFoldersOutputError>) -> Void)
```

### listGroupMemberships(input:​completion:​)

Lists member users in a group.

``` swift
func listGroupMemberships(input: ListGroupMembershipsInput, completion: @escaping (ClientRuntime.SdkResult<ListGroupMembershipsOutputResponse, ListGroupMembershipsOutputError>) -> Void)
```

### listGroups(input:​completion:​)

Lists all user groups in Amazon QuickSight.

``` swift
func listGroups(input: ListGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListGroupsOutputResponse, ListGroupsOutputError>) -> Void)
```

### listIAMPolicyAssignments(input:​completion:​)

Lists IAMpolicy assignments in the current Amazon QuickSight account.

``` swift
func listIAMPolicyAssignments(input: ListIAMPolicyAssignmentsInput, completion: @escaping (ClientRuntime.SdkResult<ListIAMPolicyAssignmentsOutputResponse, ListIAMPolicyAssignmentsOutputError>) -> Void)
```

### listIAMPolicyAssignmentsForUser(input:​completion:​)

Lists all the IAMpolicy assignments, including the Amazon Resource Names (ARNs) for the IAM
policies assigned to the specified user and group or groups that the user belongs
to.

``` swift
func listIAMPolicyAssignmentsForUser(input: ListIAMPolicyAssignmentsForUserInput, completion: @escaping (ClientRuntime.SdkResult<ListIAMPolicyAssignmentsForUserOutputResponse, ListIAMPolicyAssignmentsForUserOutputError>) -> Void)
```

### listIngestions(input:​completion:​)

Lists the history of SPICE ingestions for a dataset.

``` swift
func listIngestions(input: ListIngestionsInput, completion: @escaping (ClientRuntime.SdkResult<ListIngestionsOutputResponse, ListIngestionsOutputError>) -> Void)
```

### listNamespaces(input:​completion:​)

Lists the namespaces for the specified Amazon Web Services account.

``` swift
func listNamespaces(input: ListNamespacesInput, completion: @escaping (ClientRuntime.SdkResult<ListNamespacesOutputResponse, ListNamespacesOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

Lists the tags assigned to a resource.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### listTemplateAliases(input:​completion:​)

Lists all the aliases of a template.

``` swift
func listTemplateAliases(input: ListTemplateAliasesInput, completion: @escaping (ClientRuntime.SdkResult<ListTemplateAliasesOutputResponse, ListTemplateAliasesOutputError>) -> Void)
```

### listTemplates(input:​completion:​)

Lists all the templates in the current Amazon QuickSight account.

``` swift
func listTemplates(input: ListTemplatesInput, completion: @escaping (ClientRuntime.SdkResult<ListTemplatesOutputResponse, ListTemplatesOutputError>) -> Void)
```

### listTemplateVersions(input:​completion:​)

Lists all the versions of the templates in the current Amazon QuickSight account.

``` swift
func listTemplateVersions(input: ListTemplateVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListTemplateVersionsOutputResponse, ListTemplateVersionsOutputError>) -> Void)
```

### listThemeAliases(input:​completion:​)

Lists all the aliases of a theme.

``` swift
func listThemeAliases(input: ListThemeAliasesInput, completion: @escaping (ClientRuntime.SdkResult<ListThemeAliasesOutputResponse, ListThemeAliasesOutputError>) -> Void)
```

### listThemes(input:​completion:​)

Lists all the themes in the current Amazon Web Services account.

``` swift
func listThemes(input: ListThemesInput, completion: @escaping (ClientRuntime.SdkResult<ListThemesOutputResponse, ListThemesOutputError>) -> Void)
```

### listThemeVersions(input:​completion:​)

Lists all the versions of the themes in the current Amazon Web Services account.

``` swift
func listThemeVersions(input: ListThemeVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListThemeVersionsOutputResponse, ListThemeVersionsOutputError>) -> Void)
```

### listUserGroups(input:​completion:​)

Lists the Amazon QuickSight groups that an Amazon QuickSight user is a member of.

``` swift
func listUserGroups(input: ListUserGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListUserGroupsOutputResponse, ListUserGroupsOutputError>) -> Void)
```

### listUsers(input:​completion:​)

Returns a list of all of the Amazon QuickSight users belonging to this account.

``` swift
func listUsers(input: ListUsersInput, completion: @escaping (ClientRuntime.SdkResult<ListUsersOutputResponse, ListUsersOutputError>) -> Void)
```

### registerUser(input:​completion:​)

Creates an Amazon QuickSight user, whose identity is associated with the AWS Identity
and Access Management (IAM) identity or role specified in the request.

``` swift
func registerUser(input: RegisterUserInput, completion: @escaping (ClientRuntime.SdkResult<RegisterUserOutputResponse, RegisterUserOutputError>) -> Void)
```

### restoreAnalysis(input:​completion:​)

Restores an analysis.

``` swift
func restoreAnalysis(input: RestoreAnalysisInput, completion: @escaping (ClientRuntime.SdkResult<RestoreAnalysisOutputResponse, RestoreAnalysisOutputError>) -> Void)
```

### searchAnalyses(input:​completion:​)

Searches for analyses that belong to the user specified in the filter.

``` swift
func searchAnalyses(input: SearchAnalysesInput, completion: @escaping (ClientRuntime.SdkResult<SearchAnalysesOutputResponse, SearchAnalysesOutputError>) -> Void)
```

``` 
        This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.
```

### searchDashboards(input:​completion:​)

Searches for dashboards that belong to a user.

``` swift
func searchDashboards(input: SearchDashboardsInput, completion: @escaping (ClientRuntime.SdkResult<SearchDashboardsOutputResponse, SearchDashboardsOutputError>) -> Void)
```

``` 
        This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.
```

### searchFolders(input:​completion:​)

Searches the subfolders in a folder.

``` swift
func searchFolders(input: SearchFoldersInput, completion: @escaping (ClientRuntime.SdkResult<SearchFoldersOutputResponse, SearchFoldersOutputError>) -> Void)
```

### tagResource(input:​completion:​)

Assigns one or more tags (key-value pairs) to the specified Amazon QuickSight resource.
Tags can help you organize and categorize your resources. You can also use them to
scope user permissions, by granting a user permission to access or change only resources
with certain tag values. You can use the TagResource operation with a
resource that already has tags. If you specify a new tag key for the resource, this tag
is appended to the list of tags associated with the resource. If you specify a tag key
that is already associated with the resource, the new tag value that you specify
replaces the previous value for that tag.
You can associate as many as 50 tags with a resource. Amazon QuickSight supports tagging on data
set, data source, dashboard, and template.
Tagging for Amazon QuickSight works in a similar way to tagging for other AWS services, except for
the following:​

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

``` 
           You can't use tags to track AWS costs for Amazon QuickSight. This restriction is because Amazon QuickSight
				costs are based on users and SPICE capacity, which aren't taggable
				resources.


           Amazon QuickSight doesn't currently support the Tag Editor for Resource Groups.
```

### untagResource(input:​completion:​)

Removes a tag or tags from a resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateAccountCustomization(input:​completion:​)

Updates Amazon QuickSight customizations the current Amazon Web Services Region;. Currently, the only
customization you can use is a theme.
You can use customizations for your Amazon Web Services account or, if you specify a namespace, for a
Amazon QuickSight namespace instead. Customizations that apply to a namespace override
customizations that apply to an Amazon Web Services account. To find out which customizations apply, use
the DescribeAccountCustomization API operation.

``` swift
func updateAccountCustomization(input: UpdateAccountCustomizationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAccountCustomizationOutputResponse, UpdateAccountCustomizationOutputError>) -> Void)
```

### updateAccountSettings(input:​completion:​)

Updates the Amazon QuickSight settings in your Amazon Web Services account.

``` swift
func updateAccountSettings(input: UpdateAccountSettingsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAccountSettingsOutputResponse, UpdateAccountSettingsOutputError>) -> Void)
```

### updateAnalysis(input:​completion:​)

Updates an analysis in Amazon QuickSight

``` swift
func updateAnalysis(input: UpdateAnalysisInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAnalysisOutputResponse, UpdateAnalysisOutputError>) -> Void)
```

### updateAnalysisPermissions(input:​completion:​)

Updates the read and write permissions for an analysis.

``` swift
func updateAnalysisPermissions(input: UpdateAnalysisPermissionsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAnalysisPermissionsOutputResponse, UpdateAnalysisPermissionsOutputError>) -> Void)
```

### updateDashboard(input:​completion:​)

Updates a dashboard in an Amazon Web Services account.

``` swift
func updateDashboard(input: UpdateDashboardInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDashboardOutputResponse, UpdateDashboardOutputError>) -> Void)
```

``` 
        Updating a Dashboard creates a new dashboard version but does not immediately publish
            the new version.  You can update the published version of a dashboard by
            using the UpdateDashboardPublishedVersion API operation.
```

### updateDashboardPermissions(input:​completion:​)

Updates read and write permissions on a dashboard.

``` swift
func updateDashboardPermissions(input: UpdateDashboardPermissionsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDashboardPermissionsOutputResponse, UpdateDashboardPermissionsOutputError>) -> Void)
```

### updateDashboardPublishedVersion(input:​completion:​)

Updates the published version of a dashboard.

``` swift
func updateDashboardPublishedVersion(input: UpdateDashboardPublishedVersionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDashboardPublishedVersionOutputResponse, UpdateDashboardPublishedVersionOutputError>) -> Void)
```

### updateDataSet(input:​completion:​)

Updates a dataset.

``` swift
func updateDataSet(input: UpdateDataSetInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDataSetOutputResponse, UpdateDataSetOutputError>) -> Void)
```

### updateDataSetPermissions(input:​completion:​)

Updates the permissions on a dataset.
The permissions resource is arn:​aws:​quicksight:​region:​aws-account-id:​dataset/data-set-id.

``` swift
func updateDataSetPermissions(input: UpdateDataSetPermissionsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDataSetPermissionsOutputResponse, UpdateDataSetPermissionsOutputError>) -> Void)
```

### updateDataSource(input:​completion:​)

Updates a data source.

``` swift
func updateDataSource(input: UpdateDataSourceInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDataSourceOutputResponse, UpdateDataSourceOutputError>) -> Void)
```

### updateDataSourcePermissions(input:​completion:​)

Updates the permissions to a data source.

``` swift
func updateDataSourcePermissions(input: UpdateDataSourcePermissionsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDataSourcePermissionsOutputResponse, UpdateDataSourcePermissionsOutputError>) -> Void)
```

### updateFolder(input:​completion:​)

Updates the name of a folder.

``` swift
func updateFolder(input: UpdateFolderInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFolderOutputResponse, UpdateFolderOutputError>) -> Void)
```

### updateFolderPermissions(input:​completion:​)

Updates permissions of a folder.

``` swift
func updateFolderPermissions(input: UpdateFolderPermissionsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFolderPermissionsOutputResponse, UpdateFolderPermissionsOutputError>) -> Void)
```

### updateGroup(input:​completion:​)

Changes a group description.

``` swift
func updateGroup(input: UpdateGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateGroupOutputResponse, UpdateGroupOutputError>) -> Void)
```

### updateIAMPolicyAssignment(input:​completion:​)

Updates an existing IAMpolicy assignment. This operation updates only the optional
parameter or parameters that are specified in the request.
This overwrites all of the users included in Identities.

``` swift
func updateIAMPolicyAssignment(input: UpdateIAMPolicyAssignmentInput, completion: @escaping (ClientRuntime.SdkResult<UpdateIAMPolicyAssignmentOutputResponse, UpdateIAMPolicyAssignmentOutputError>) -> Void)
```

### updateTemplate(input:​completion:​)

Updates a template from an existing Amazon QuickSight analysis or another template.

``` swift
func updateTemplate(input: UpdateTemplateInput, completion: @escaping (ClientRuntime.SdkResult<UpdateTemplateOutputResponse, UpdateTemplateOutputError>) -> Void)
```

### updateTemplateAlias(input:​completion:​)

Updates the template alias of a template.

``` swift
func updateTemplateAlias(input: UpdateTemplateAliasInput, completion: @escaping (ClientRuntime.SdkResult<UpdateTemplateAliasOutputResponse, UpdateTemplateAliasOutputError>) -> Void)
```

### updateTemplatePermissions(input:​completion:​)

Updates the resource permissions for a template.

``` swift
func updateTemplatePermissions(input: UpdateTemplatePermissionsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateTemplatePermissionsOutputResponse, UpdateTemplatePermissionsOutputError>) -> Void)
```

### updateTheme(input:​completion:​)

Updates a theme.

``` swift
func updateTheme(input: UpdateThemeInput, completion: @escaping (ClientRuntime.SdkResult<UpdateThemeOutputResponse, UpdateThemeOutputError>) -> Void)
```

### updateThemeAlias(input:​completion:​)

Updates an alias of a theme.

``` swift
func updateThemeAlias(input: UpdateThemeAliasInput, completion: @escaping (ClientRuntime.SdkResult<UpdateThemeAliasOutputResponse, UpdateThemeAliasOutputError>) -> Void)
```

### updateThemePermissions(input:​completion:​)

Updates the resource permissions for a theme. Permissions apply to the action to grant or
revoke permissions on, for example "quicksight:​DescribeTheme".
Theme permissions apply in groupings. Valid groupings include the following for the three
levels of permissions, which are user, owner, or no permissions:​

``` swift
func updateThemePermissions(input: UpdateThemePermissionsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateThemePermissionsOutputResponse, UpdateThemePermissionsOutputError>) -> Void)
```

``` 
           User
				


                    "quicksight:DescribeTheme"




                    "quicksight:DescribeThemeAlias"




                    "quicksight:ListThemeAliases"




                    "quicksight:ListThemeVersions"



			

           Owner
				


                    "quicksight:DescribeTheme"




                    "quicksight:DescribeThemeAlias"




                    "quicksight:ListThemeAliases"




                    "quicksight:ListThemeVersions"




                    "quicksight:DeleteTheme"




                    "quicksight:UpdateTheme"




                    "quicksight:CreateThemeAlias"




                    "quicksight:DeleteThemeAlias"




                    "quicksight:UpdateThemeAlias"




                    "quicksight:UpdateThemePermissions"




                    "quicksight:DescribeThemePermissions"



			

           To specify no permissions, omit the permissions list.
```

### updateUser(input:​completion:​)

Updates an Amazon QuickSight user.

``` swift
func updateUser(input: UpdateUserInput, completion: @escaping (ClientRuntime.SdkResult<UpdateUserOutputResponse, UpdateUserOutputError>) -> Void)
```
