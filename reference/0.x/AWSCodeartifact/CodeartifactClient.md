# CodeartifactClient

``` swift
public class CodeartifactClient 
```

## Inheritance

[`CodeartifactClientProtocol`](/aws-sdk-swift/reference/0.x/AWSCodeartifact/CodeartifactClientProtocol)

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
public static let clientName = "CodeartifactClient"
```

## Methods

### `associateExternalConnection(input:completion:)`

Adds an existing external connection to a repository. One external connection is allowed per repository. A repository can have one or more upstream repositories, or an external connection.

``` swift
public func associateExternalConnection(input: AssociateExternalConnectionInput, completion: @escaping (ClientRuntime.SdkResult<AssociateExternalConnectionOutputResponse, AssociateExternalConnectionOutputError>) -> Void)
```

### `copyPackageVersions(input:completion:)`

Copies package versions from one repository to another repository in the same domain. You must specify versions or versionRevisions. You cannot specify both.

``` swift
public func copyPackageVersions(input: CopyPackageVersionsInput, completion: @escaping (ClientRuntime.SdkResult<CopyPackageVersionsOutputResponse, CopyPackageVersionsOutputError>) -> Void)
```

### `createDomain(input:completion:)`

Creates a domain. CodeArtifact domains make it easier to manage multiple repositories across an organization. You can use a domain to apply permissions across many repositories owned by different AWS accounts. An asset is stored only once in a domain, even if it's in multiple repositories. Although you can have multiple domains, we recommend a single production domain that contains all published artifacts so that your development teams can find and share packages. You can use a second pre-production domain to test changes to the production domain configuration.

``` swift
public func createDomain(input: CreateDomainInput, completion: @escaping (ClientRuntime.SdkResult<CreateDomainOutputResponse, CreateDomainOutputError>) -> Void)
```

### `createRepository(input:completion:)`

Creates a repository.

``` swift
public func createRepository(input: CreateRepositoryInput, completion: @escaping (ClientRuntime.SdkResult<CreateRepositoryOutputResponse, CreateRepositoryOutputError>) -> Void)
```

### `deleteDomain(input:completion:)`

Deletes a domain. You cannot delete a domain that contains repositories. If you want to delete a domain with repositories, first delete its repositories.

``` swift
public func deleteDomain(input: DeleteDomainInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDomainOutputResponse, DeleteDomainOutputError>) -> Void)
```

### `deleteDomainPermissionsPolicy(input:completion:)`

Deletes the resource policy set on a domain.

``` swift
public func deleteDomainPermissionsPolicy(input: DeleteDomainPermissionsPolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDomainPermissionsPolicyOutputResponse, DeleteDomainPermissionsPolicyOutputError>) -> Void)
```

### `deletePackageVersions(input:completion:)`

Deletes one or more versions of a package. A deleted package version cannot be restored in your repository. If you want to remove a package version from your repository and be able to restore it later, set its status to Archived. Archived packages cannot be downloaded from a repository and don't show up with list package APIs (for example, [ListackageVersions](https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_ListPackageVersions.html)), but you can restore them using [UpdatePackageVersionsStatus](https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_UpdatePackageVersionsStatus.html).

``` swift
public func deletePackageVersions(input: DeletePackageVersionsInput, completion: @escaping (ClientRuntime.SdkResult<DeletePackageVersionsOutputResponse, DeletePackageVersionsOutputError>) -> Void)
```

### `deleteRepository(input:completion:)`

Deletes a repository.

``` swift
public func deleteRepository(input: DeleteRepositoryInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRepositoryOutputResponse, DeleteRepositoryOutputError>) -> Void)
```

### `deleteRepositoryPermissionsPolicy(input:completion:)`

Deletes the resource policy that is set on a repository. After a resource policy is deleted, the permissions allowed and denied by the deleted policy are removed. The effect of deleting a resource policy might not be immediate. Use DeleteRepositoryPermissionsPolicy with caution. After a policy is deleted, AWS users, roles, and accounts lose permissions to perform the repository actions granted by the deleted policy.

``` swift
public func deleteRepositoryPermissionsPolicy(input: DeleteRepositoryPermissionsPolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRepositoryPermissionsPolicyOutputResponse, DeleteRepositoryPermissionsPolicyOutputError>) -> Void)
```

### `describeDomain(input:completion:)`

Returns a [DomainDescription](https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_DomainDescription.html) object that contains information about the requested domain.

``` swift
public func describeDomain(input: DescribeDomainInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDomainOutputResponse, DescribeDomainOutputError>) -> Void)
```

### `describePackageVersion(input:completion:)`

Returns a [PackageVersionDescription](https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageVersionDescription.html) object that contains information about the requested package version.

``` swift
public func describePackageVersion(input: DescribePackageVersionInput, completion: @escaping (ClientRuntime.SdkResult<DescribePackageVersionOutputResponse, DescribePackageVersionOutputError>) -> Void)
```

### `describeRepository(input:completion:)`

Returns a RepositoryDescription object that contains detailed information about the requested repository.

``` swift
public func describeRepository(input: DescribeRepositoryInput, completion: @escaping (ClientRuntime.SdkResult<DescribeRepositoryOutputResponse, DescribeRepositoryOutputError>) -> Void)
```

### `disassociateExternalConnection(input:completion:)`

Removes an existing external connection from a repository.

``` swift
public func disassociateExternalConnection(input: DisassociateExternalConnectionInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateExternalConnectionOutputResponse, DisassociateExternalConnectionOutputError>) -> Void)
```

### `disposePackageVersions(input:completion:)`

Deletes the assets in package versions and sets the package versions' status to Disposed. A disposed package version cannot be restored in your repository because its assets are deleted. To view all disposed package versions in a repository, use [ListPackageVersions](https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_ListPackageVersions.html) and set the [status](https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_ListPackageVersions.html#API_ListPackageVersions_RequestSyntax) parameter to Disposed. To view information about a disposed package version, use [DescribePackageVersion](https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_DescribePackageVersion.html).

``` swift
public func disposePackageVersions(input: DisposePackageVersionsInput, completion: @escaping (ClientRuntime.SdkResult<DisposePackageVersionsOutputResponse, DisposePackageVersionsOutputError>) -> Void)
```

### `getAuthorizationToken(input:completion:)`

Generates a temporary authorization token for accessing repositories in the domain. This API requires the codeartifact:GetAuthorizationToken and sts:GetServiceBearerToken permissions. For more information about authorization tokens, see [AWS CodeArtifact authentication and tokens](https://docs.aws.amazon.com/codeartifact/latest/ug/tokens-authentication.html). CodeArtifact authorization tokens are valid for a period of 12 hours when created with the login command. You can call login periodically to refresh the token. When you create an authorization token with the GetAuthorizationToken API, you can set a custom authorization period, up to a maximum of 12 hours, with the durationSeconds parameter. The authorization period begins after login or GetAuthorizationToken is called. If login or GetAuthorizationToken is called while assuming a role, the token lifetime is independent of the maximum session duration of the role. For example, if you call sts assume-role and specify a session duration of 15 minutes, then generate a CodeArtifact authorization token, the token will be valid for the full authorization period even though this is longer than the 15-minute session duration. See [Using IAM Roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html) for more information on controlling session duration.

``` swift
public func getAuthorizationToken(input: GetAuthorizationTokenInput, completion: @escaping (ClientRuntime.SdkResult<GetAuthorizationTokenOutputResponse, GetAuthorizationTokenOutputError>) -> Void)
```

### `getDomainPermissionsPolicy(input:completion:)`

Returns the resource policy attached to the specified domain. The policy is a resource-based policy, not an identity-based policy. For more information, see [Identity-based policies and resource-based policies ](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_identity-vs-resource.html) in the AWS Identity and Access Management User Guide.

``` swift
public func getDomainPermissionsPolicy(input: GetDomainPermissionsPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetDomainPermissionsPolicyOutputResponse, GetDomainPermissionsPolicyOutputError>) -> Void)
```

### `getPackageVersionAsset(input:completion:)`

Returns an asset (or file) that is in a package. For example, for a Maven package version, use GetPackageVersionAsset to download a JAR file, a POM file, or any other assets in the package version.

``` swift
public func getPackageVersionAsset(input: GetPackageVersionAssetInput, completion: @escaping (ClientRuntime.SdkResult<GetPackageVersionAssetOutputResponse, GetPackageVersionAssetOutputError>) -> Void)
```

### `getPackageVersionReadme(input:completion:)`

Gets the readme file or descriptive text for a package version. For packages that do not contain a readme file, CodeArtifact extracts a description from a metadata file. For example, from the  element in the pom.xml file of a Maven package. The returned text might contain formatting. For example, it might contain formatting for Markdown or reStructuredText.

``` swift
public func getPackageVersionReadme(input: GetPackageVersionReadmeInput, completion: @escaping (ClientRuntime.SdkResult<GetPackageVersionReadmeOutputResponse, GetPackageVersionReadmeOutputError>) -> Void)
```

### `getRepositoryEndpoint(input:completion:)`

Returns the endpoint of a repository for a specific package format. A repository has one endpoint for each package format:

``` swift
public func getRepositoryEndpoint(input: GetRepositoryEndpointInput, completion: @escaping (ClientRuntime.SdkResult<GetRepositoryEndpointOutputResponse, GetRepositoryEndpointOutputError>) -> Void)
```

  - npm

  - pypi

  - maven

### `getRepositoryPermissionsPolicy(input:completion:)`

Returns the resource policy that is set on a repository.

``` swift
public func getRepositoryPermissionsPolicy(input: GetRepositoryPermissionsPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetRepositoryPermissionsPolicyOutputResponse, GetRepositoryPermissionsPolicyOutputError>) -> Void)
```

### `listDomains(input:completion:)`

Returns a list of [DomainSummary](https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageVersionDescription.html) objects for all domains owned by the AWS account that makes this call. Each returned DomainSummary object contains information about a domain.

``` swift
public func listDomains(input: ListDomainsInput, completion: @escaping (ClientRuntime.SdkResult<ListDomainsOutputResponse, ListDomainsOutputError>) -> Void)
```

### `listPackageVersionAssets(input:completion:)`

Returns a list of [AssetSummary](https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_AssetSummary.html) objects for assets in a package version.

``` swift
public func listPackageVersionAssets(input: ListPackageVersionAssetsInput, completion: @escaping (ClientRuntime.SdkResult<ListPackageVersionAssetsOutputResponse, ListPackageVersionAssetsOutputError>) -> Void)
```

### `listPackageVersionDependencies(input:completion:)`

Returns the direct dependencies for a package version. The dependencies are returned as [PackageDependency](https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageDependency.html) objects. CodeArtifact extracts the dependencies for a package version from the metadata file for the package format (for example, the package.json file for npm packages and the pom.xml file for Maven). Any package version dependencies that are not listed in the configuration file are not returned.

``` swift
public func listPackageVersionDependencies(input: ListPackageVersionDependenciesInput, completion: @escaping (ClientRuntime.SdkResult<ListPackageVersionDependenciesOutputResponse, ListPackageVersionDependenciesOutputError>) -> Void)
```

### `listPackageVersions(input:completion:)`

Returns a list of [PackageVersionSummary](https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageVersionSummary.html) objects for package versions in a repository that match the request parameters.

``` swift
public func listPackageVersions(input: ListPackageVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListPackageVersionsOutputResponse, ListPackageVersionsOutputError>) -> Void)
```

### `listPackages(input:completion:)`

Returns a list of [PackageSummary](https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageSummary.html) objects for packages in a repository that match the request parameters.

``` swift
public func listPackages(input: ListPackagesInput, completion: @escaping (ClientRuntime.SdkResult<ListPackagesOutputResponse, ListPackagesOutputError>) -> Void)
```

### `listRepositories(input:completion:)`

Returns a list of [RepositorySummary](https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_RepositorySummary.html) objects. Each RepositorySummary contains information about a repository in the specified AWS account and that matches the input parameters.

``` swift
public func listRepositories(input: ListRepositoriesInput, completion: @escaping (ClientRuntime.SdkResult<ListRepositoriesOutputResponse, ListRepositoriesOutputError>) -> Void)
```

### `listRepositoriesInDomain(input:completion:)`

Returns a list of [RepositorySummary](https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_RepositorySummary.html) objects. Each RepositorySummary contains information about a repository in the specified domain and that matches the input parameters.

``` swift
public func listRepositoriesInDomain(input: ListRepositoriesInDomainInput, completion: @escaping (ClientRuntime.SdkResult<ListRepositoriesInDomainOutputResponse, ListRepositoriesInDomainOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Gets information about AWS tags for a specified Amazon Resource Name (ARN) in AWS CodeArtifact.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `putDomainPermissionsPolicy(input:completion:)`

Sets a resource policy on a domain that specifies permissions to access it. When you call PutDomainPermissionsPolicy, the resource policy on the domain is ignored when evaluting permissions. This ensures that the owner of a domain cannot lock themselves out of the domain, which would prevent them from being able to update the resource policy.

``` swift
public func putDomainPermissionsPolicy(input: PutDomainPermissionsPolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutDomainPermissionsPolicyOutputResponse, PutDomainPermissionsPolicyOutputError>) -> Void)
```

### `putRepositoryPermissionsPolicy(input:completion:)`

Sets the resource policy on a repository that specifies permissions to access it. When you call PutRepositoryPermissionsPolicy, the resource policy on the repository is ignored when evaluting permissions. This ensures that the owner of a repository cannot lock themselves out of the repository, which would prevent them from being able to update the resource policy.

``` swift
public func putRepositoryPermissionsPolicy(input: PutRepositoryPermissionsPolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutRepositoryPermissionsPolicyOutputResponse, PutRepositoryPermissionsPolicyOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Adds or updates tags for a resource in AWS CodeArtifact.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes tags from a resource in AWS CodeArtifact.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updatePackageVersionsStatus(input:completion:)`

Updates the status of one or more versions of a package.

``` swift
public func updatePackageVersionsStatus(input: UpdatePackageVersionsStatusInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePackageVersionsStatusOutputResponse, UpdatePackageVersionsStatusOutputError>) -> Void)
```

### `updateRepository(input:completion:)`

Update the properties of a repository.

``` swift
public func updateRepository(input: UpdateRepositoryInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRepositoryOutputResponse, UpdateRepositoryOutputError>) -> Void)
```
