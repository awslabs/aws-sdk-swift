# AmplifyClient

``` swift
public class AmplifyClient 
```

## Inheritance

[`AmplifyClientProtocol`](/aws-sdk-swift/reference/0.x/AWSAmplify/AmplifyClientProtocol)

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

### `createApp(input:completion:)`

Creates a new Amplify app.

``` swift
public func createApp(input: CreateAppInput, completion: @escaping (ClientRuntime.SdkResult<CreateAppOutputResponse, CreateAppOutputError>) -> Void)
```

### `createBackendEnvironment(input:completion:)`

Creates a new backend environment for an Amplify app.

``` swift
public func createBackendEnvironment(input: CreateBackendEnvironmentInput, completion: @escaping (ClientRuntime.SdkResult<CreateBackendEnvironmentOutputResponse, CreateBackendEnvironmentOutputError>) -> Void)
```

### `createBranch(input:completion:)`

Creates a new branch for an Amplify app.

``` swift
public func createBranch(input: CreateBranchInput, completion: @escaping (ClientRuntime.SdkResult<CreateBranchOutputResponse, CreateBranchOutputError>) -> Void)
```

### `createDeployment(input:completion:)`

Creates a deployment for a manually deployed Amplify app. Manually deployed apps are
not connected to a repository.

``` swift
public func createDeployment(input: CreateDeploymentInput, completion: @escaping (ClientRuntime.SdkResult<CreateDeploymentOutputResponse, CreateDeploymentOutputError>) -> Void)
```

### `createDomainAssociation(input:completion:)`

Creates a new domain association for an Amplify app. This action associates a custom
domain with the Amplify app

``` swift
public func createDomainAssociation(input: CreateDomainAssociationInput, completion: @escaping (ClientRuntime.SdkResult<CreateDomainAssociationOutputResponse, CreateDomainAssociationOutputError>) -> Void)
```

### `createWebhook(input:completion:)`

Creates a new webhook on an Amplify app.

``` swift
public func createWebhook(input: CreateWebhookInput, completion: @escaping (ClientRuntime.SdkResult<CreateWebhookOutputResponse, CreateWebhookOutputError>) -> Void)
```

### `deleteApp(input:completion:)`

Deletes an existing Amplify app specified by an app ID.

``` swift
public func deleteApp(input: DeleteAppInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAppOutputResponse, DeleteAppOutputError>) -> Void)
```

### `deleteBackendEnvironment(input:completion:)`

Deletes a backend environment for an Amplify app.

``` swift
public func deleteBackendEnvironment(input: DeleteBackendEnvironmentInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBackendEnvironmentOutputResponse, DeleteBackendEnvironmentOutputError>) -> Void)
```

### `deleteBranch(input:completion:)`

Deletes a branch for an Amplify app.

``` swift
public func deleteBranch(input: DeleteBranchInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBranchOutputResponse, DeleteBranchOutputError>) -> Void)
```

### `deleteDomainAssociation(input:completion:)`

Deletes a domain association for an Amplify app.

``` swift
public func deleteDomainAssociation(input: DeleteDomainAssociationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDomainAssociationOutputResponse, DeleteDomainAssociationOutputError>) -> Void)
```

### `deleteJob(input:completion:)`

Deletes a job for a branch of an Amplify app.

``` swift
public func deleteJob(input: DeleteJobInput, completion: @escaping (ClientRuntime.SdkResult<DeleteJobOutputResponse, DeleteJobOutputError>) -> Void)
```

### `deleteWebhook(input:completion:)`

Deletes a webhook.

``` swift
public func deleteWebhook(input: DeleteWebhookInput, completion: @escaping (ClientRuntime.SdkResult<DeleteWebhookOutputResponse, DeleteWebhookOutputError>) -> Void)
```

### `generateAccessLogs(input:completion:)`

Returns the website access logs for a specific time range using a presigned URL.

``` swift
public func generateAccessLogs(input: GenerateAccessLogsInput, completion: @escaping (ClientRuntime.SdkResult<GenerateAccessLogsOutputResponse, GenerateAccessLogsOutputError>) -> Void)
```

### `getApp(input:completion:)`

Returns an existing Amplify app by appID.

``` swift
public func getApp(input: GetAppInput, completion: @escaping (ClientRuntime.SdkResult<GetAppOutputResponse, GetAppOutputError>) -> Void)
```

### `getArtifactUrl(input:completion:)`

Returns the artifact info that corresponds to an artifact id.

``` swift
public func getArtifactUrl(input: GetArtifactUrlInput, completion: @escaping (ClientRuntime.SdkResult<GetArtifactUrlOutputResponse, GetArtifactUrlOutputError>) -> Void)
```

### `getBackendEnvironment(input:completion:)`

Returns a backend environment for an Amplify app.

``` swift
public func getBackendEnvironment(input: GetBackendEnvironmentInput, completion: @escaping (ClientRuntime.SdkResult<GetBackendEnvironmentOutputResponse, GetBackendEnvironmentOutputError>) -> Void)
```

### `getBranch(input:completion:)`

Returns a branch for an Amplify app.

``` swift
public func getBranch(input: GetBranchInput, completion: @escaping (ClientRuntime.SdkResult<GetBranchOutputResponse, GetBranchOutputError>) -> Void)
```

### `getDomainAssociation(input:completion:)`

Returns the domain information for an Amplify app.

``` swift
public func getDomainAssociation(input: GetDomainAssociationInput, completion: @escaping (ClientRuntime.SdkResult<GetDomainAssociationOutputResponse, GetDomainAssociationOutputError>) -> Void)
```

### `getJob(input:completion:)`

Returns a job for a branch of an Amplify app.

``` swift
public func getJob(input: GetJobInput, completion: @escaping (ClientRuntime.SdkResult<GetJobOutputResponse, GetJobOutputError>) -> Void)
```

### `getWebhook(input:completion:)`

Returns the webhook information that corresponds to a specified webhook ID.

``` swift
public func getWebhook(input: GetWebhookInput, completion: @escaping (ClientRuntime.SdkResult<GetWebhookOutputResponse, GetWebhookOutputError>) -> Void)
```

### `listApps(input:completion:)`

Returns a list of the existing Amplify apps.

``` swift
public func listApps(input: ListAppsInput, completion: @escaping (ClientRuntime.SdkResult<ListAppsOutputResponse, ListAppsOutputError>) -> Void)
```

### `listArtifacts(input:completion:)`

Returns a list of artifacts for a specified app, branch, and job.

``` swift
public func listArtifacts(input: ListArtifactsInput, completion: @escaping (ClientRuntime.SdkResult<ListArtifactsOutputResponse, ListArtifactsOutputError>) -> Void)
```

### `listBackendEnvironments(input:completion:)`

Lists the backend environments for an Amplify app.

``` swift
public func listBackendEnvironments(input: ListBackendEnvironmentsInput, completion: @escaping (ClientRuntime.SdkResult<ListBackendEnvironmentsOutputResponse, ListBackendEnvironmentsOutputError>) -> Void)
```

### `listBranches(input:completion:)`

Lists the branches of an Amplify app.

``` swift
public func listBranches(input: ListBranchesInput, completion: @escaping (ClientRuntime.SdkResult<ListBranchesOutputResponse, ListBranchesOutputError>) -> Void)
```

### `listDomainAssociations(input:completion:)`

Returns the domain associations for an Amplify app.

``` swift
public func listDomainAssociations(input: ListDomainAssociationsInput, completion: @escaping (ClientRuntime.SdkResult<ListDomainAssociationsOutputResponse, ListDomainAssociationsOutputError>) -> Void)
```

### `listJobs(input:completion:)`

Lists the jobs for a branch of an Amplify app.

``` swift
public func listJobs(input: ListJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListJobsOutputResponse, ListJobsOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Returns a list of tags for a specified Amazon Resource Name (ARN).

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `listWebhooks(input:completion:)`

Returns a list of webhooks for an Amplify app.

``` swift
public func listWebhooks(input: ListWebhooksInput, completion: @escaping (ClientRuntime.SdkResult<ListWebhooksOutputResponse, ListWebhooksOutputError>) -> Void)
```

### `startDeployment(input:completion:)`

Starts a deployment for a manually deployed app. Manually deployed apps are not
connected to a repository.

``` swift
public func startDeployment(input: StartDeploymentInput, completion: @escaping (ClientRuntime.SdkResult<StartDeploymentOutputResponse, StartDeploymentOutputError>) -> Void)
```

### `startJob(input:completion:)`

Starts a new job for a branch of an Amplify app.

``` swift
public func startJob(input: StartJobInput, completion: @escaping (ClientRuntime.SdkResult<StartJobOutputResponse, StartJobOutputError>) -> Void)
```

### `stopJob(input:completion:)`

Stops a job that is in progress for a branch of an Amplify app.

``` swift
public func stopJob(input: StopJobInput, completion: @escaping (ClientRuntime.SdkResult<StopJobOutputResponse, StopJobOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Tags the resource with a tag key and value.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Untags a resource with a specified Amazon Resource Name (ARN).

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateApp(input:completion:)`

Updates an existing Amplify app.

``` swift
public func updateApp(input: UpdateAppInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAppOutputResponse, UpdateAppOutputError>) -> Void)
```

### `updateBranch(input:completion:)`

Updates a branch for an Amplify app.

``` swift
public func updateBranch(input: UpdateBranchInput, completion: @escaping (ClientRuntime.SdkResult<UpdateBranchOutputResponse, UpdateBranchOutputError>) -> Void)
```

### `updateDomainAssociation(input:completion:)`

Creates a new domain association for an Amplify app.

``` swift
public func updateDomainAssociation(input: UpdateDomainAssociationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDomainAssociationOutputResponse, UpdateDomainAssociationOutputError>) -> Void)
```

### `updateWebhook(input:completion:)`

Updates a webhook.

``` swift
public func updateWebhook(input: UpdateWebhookInput, completion: @escaping (ClientRuntime.SdkResult<UpdateWebhookOutputResponse, UpdateWebhookOutputError>) -> Void)
```
