# CodeBuildClient

``` swift
public class CodeBuildClient 
```

## Inheritance

[`CodeBuildClientProtocol`](/aws-sdk-swift/reference/0.x/AWSCodeBuild/CodeBuildClientProtocol)

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
public static let clientName = "CodeBuildClient"
```

## Methods

### `batchDeleteBuilds(input:completion:)`

Deletes one or more builds.

``` swift
public func batchDeleteBuilds(input: BatchDeleteBuildsInput, completion: @escaping (ClientRuntime.SdkResult<BatchDeleteBuildsOutputResponse, BatchDeleteBuildsOutputError>) -> Void)
```

### `batchGetBuildBatches(input:completion:)`

Retrieves information about one or more batch builds.

``` swift
public func batchGetBuildBatches(input: BatchGetBuildBatchesInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetBuildBatchesOutputResponse, BatchGetBuildBatchesOutputError>) -> Void)
```

### `batchGetBuilds(input:completion:)`

Gets information about one or more builds.

``` swift
public func batchGetBuilds(input: BatchGetBuildsInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetBuildsOutputResponse, BatchGetBuildsOutputError>) -> Void)
```

### `batchGetProjects(input:completion:)`

Gets information about one or more build projects.

``` swift
public func batchGetProjects(input: BatchGetProjectsInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetProjectsOutputResponse, BatchGetProjectsOutputError>) -> Void)
```

### `batchGetReportGroups(input:completion:)`

Returns an array of report groups.

``` swift
public func batchGetReportGroups(input: BatchGetReportGroupsInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetReportGroupsOutputResponse, BatchGetReportGroupsOutputError>) -> Void)
```

### `batchGetReports(input:completion:)`

Returns an array of reports.

``` swift
public func batchGetReports(input: BatchGetReportsInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetReportsOutputResponse, BatchGetReportsOutputError>) -> Void)
```

### `createProject(input:completion:)`

Creates a build project.

``` swift
public func createProject(input: CreateProjectInput, completion: @escaping (ClientRuntime.SdkResult<CreateProjectOutputResponse, CreateProjectOutputError>) -> Void)
```

### `createReportGroup(input:completion:)`

Creates a report group. A report group contains a collection of reports.

``` swift
public func createReportGroup(input: CreateReportGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateReportGroupOutputResponse, CreateReportGroupOutputError>) -> Void)
```

### `createWebhook(input:completion:)`

For an existing CodeBuild build project that has its source code stored in a GitHub or Bitbucket repository, enables CodeBuild to start rebuilding the source code every time a code change is pushed to the repository. If you enable webhooks for an CodeBuild project, and the project is used as a build step in CodePipeline, then two identical builds are created for each commit. One build is triggered through webhooks, and one through CodePipeline. Because billing is on a per-build basis, you are billed for both builds. Therefore, if you are using CodePipeline, we recommend that you disable webhooks in CodeBuild. In the CodeBuild console, clear the Webhook box. For more information, see step 5 in [Change a Build Project's Settings](https://docs.aws.amazon.com/codebuild/latest/userguide/change-project.html#change-project-console).

``` swift
public func createWebhook(input: CreateWebhookInput, completion: @escaping (ClientRuntime.SdkResult<CreateWebhookOutputResponse, CreateWebhookOutputError>) -> Void)
```

### `deleteBuildBatch(input:completion:)`

Deletes a batch build.

``` swift
public func deleteBuildBatch(input: DeleteBuildBatchInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBuildBatchOutputResponse, DeleteBuildBatchOutputError>) -> Void)
```

### `deleteProject(input:completion:)`

Deletes a build project. When you delete a project, its builds are not deleted.

``` swift
public func deleteProject(input: DeleteProjectInput, completion: @escaping (ClientRuntime.SdkResult<DeleteProjectOutputResponse, DeleteProjectOutputError>) -> Void)
```

### `deleteReport(input:completion:)`

Deletes a report.

``` swift
public func deleteReport(input: DeleteReportInput, completion: @escaping (ClientRuntime.SdkResult<DeleteReportOutputResponse, DeleteReportOutputError>) -> Void)
```

### `deleteReportGroup(input:completion:)`

Deletes a report group. Before you delete a report group, you must delete its reports.

``` swift
public func deleteReportGroup(input: DeleteReportGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteReportGroupOutputResponse, DeleteReportGroupOutputError>) -> Void)
```

### `deleteResourcePolicy(input:completion:)`

Deletes a resource policy that is identified by its resource ARN.

``` swift
public func deleteResourcePolicy(input: DeleteResourcePolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteResourcePolicyOutputResponse, DeleteResourcePolicyOutputError>) -> Void)
```

### `deleteSourceCredentials(input:completion:)`

Deletes a set of GitHub, GitHub Enterprise, or Bitbucket source credentials.

``` swift
public func deleteSourceCredentials(input: DeleteSourceCredentialsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSourceCredentialsOutputResponse, DeleteSourceCredentialsOutputError>) -> Void)
```

### `deleteWebhook(input:completion:)`

For an existing CodeBuild build project that has its source code stored in a GitHub or Bitbucket repository, stops CodeBuild from rebuilding the source code every time a code change is pushed to the repository.

``` swift
public func deleteWebhook(input: DeleteWebhookInput, completion: @escaping (ClientRuntime.SdkResult<DeleteWebhookOutputResponse, DeleteWebhookOutputError>) -> Void)
```

### `describeCodeCoverages(input:completion:)`

Retrieves one or more code coverage reports.

``` swift
public func describeCodeCoverages(input: DescribeCodeCoveragesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCodeCoveragesOutputResponse, DescribeCodeCoveragesOutputError>) -> Void)
```

### `describeTestCases(input:completion:)`

Returns a list of details about test cases for a report.

``` swift
public func describeTestCases(input: DescribeTestCasesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTestCasesOutputResponse, DescribeTestCasesOutputError>) -> Void)
```

### `getReportGroupTrend(input:completion:)`

Analyzes and accumulates test report values for the specified test reports.

``` swift
public func getReportGroupTrend(input: GetReportGroupTrendInput, completion: @escaping (ClientRuntime.SdkResult<GetReportGroupTrendOutputResponse, GetReportGroupTrendOutputError>) -> Void)
```

### `getResourcePolicy(input:completion:)`

Gets a resource policy that is identified by its resource ARN.

``` swift
public func getResourcePolicy(input: GetResourcePolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetResourcePolicyOutputResponse, GetResourcePolicyOutputError>) -> Void)
```

### `importSourceCredentials(input:completion:)`

Imports the source repository credentials for an CodeBuild project that has its source code stored in a GitHub, GitHub Enterprise, or Bitbucket repository.

``` swift
public func importSourceCredentials(input: ImportSourceCredentialsInput, completion: @escaping (ClientRuntime.SdkResult<ImportSourceCredentialsOutputResponse, ImportSourceCredentialsOutputError>) -> Void)
```

### `invalidateProjectCache(input:completion:)`

Resets the cache for a project.

``` swift
public func invalidateProjectCache(input: InvalidateProjectCacheInput, completion: @escaping (ClientRuntime.SdkResult<InvalidateProjectCacheOutputResponse, InvalidateProjectCacheOutputError>) -> Void)
```

### `listBuildBatches(input:completion:)`

Retrieves the identifiers of your build batches in the current region.

``` swift
public func listBuildBatches(input: ListBuildBatchesInput, completion: @escaping (ClientRuntime.SdkResult<ListBuildBatchesOutputResponse, ListBuildBatchesOutputError>) -> Void)
```

### `listBuildBatchesForProject(input:completion:)`

Retrieves the identifiers of the build batches for a specific project.

``` swift
public func listBuildBatchesForProject(input: ListBuildBatchesForProjectInput, completion: @escaping (ClientRuntime.SdkResult<ListBuildBatchesForProjectOutputResponse, ListBuildBatchesForProjectOutputError>) -> Void)
```

### `listBuilds(input:completion:)`

Gets a list of build IDs, with each build ID representing a single build.

``` swift
public func listBuilds(input: ListBuildsInput, completion: @escaping (ClientRuntime.SdkResult<ListBuildsOutputResponse, ListBuildsOutputError>) -> Void)
```

### `listBuildsForProject(input:completion:)`

Gets a list of build identifiers for the specified build project, with each build identifier representing a single build.

``` swift
public func listBuildsForProject(input: ListBuildsForProjectInput, completion: @escaping (ClientRuntime.SdkResult<ListBuildsForProjectOutputResponse, ListBuildsForProjectOutputError>) -> Void)
```

### `listCuratedEnvironmentImages(input:completion:)`

Gets information about Docker images that are managed by CodeBuild.

``` swift
public func listCuratedEnvironmentImages(input: ListCuratedEnvironmentImagesInput, completion: @escaping (ClientRuntime.SdkResult<ListCuratedEnvironmentImagesOutputResponse, ListCuratedEnvironmentImagesOutputError>) -> Void)
```

### `listProjects(input:completion:)`

Gets a list of build project names, with each build project name representing a single build project.

``` swift
public func listProjects(input: ListProjectsInput, completion: @escaping (ClientRuntime.SdkResult<ListProjectsOutputResponse, ListProjectsOutputError>) -> Void)
```

### `listReportGroups(input:completion:)`

Gets a list ARNs for the report groups in the current Amazon Web Services account.

``` swift
public func listReportGroups(input: ListReportGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListReportGroupsOutputResponse, ListReportGroupsOutputError>) -> Void)
```

### `listReports(input:completion:)`

Returns a list of ARNs for the reports in the current Amazon Web Services account.

``` swift
public func listReports(input: ListReportsInput, completion: @escaping (ClientRuntime.SdkResult<ListReportsOutputResponse, ListReportsOutputError>) -> Void)
```

### `listReportsForReportGroup(input:completion:)`

Returns a list of ARNs for the reports that belong to a ReportGroup.

``` swift
public func listReportsForReportGroup(input: ListReportsForReportGroupInput, completion: @escaping (ClientRuntime.SdkResult<ListReportsForReportGroupOutputResponse, ListReportsForReportGroupOutputError>) -> Void)
```

### `listSharedProjects(input:completion:)`

Gets a list of projects that are shared with other Amazon Web Services accounts or users.

``` swift
public func listSharedProjects(input: ListSharedProjectsInput, completion: @escaping (ClientRuntime.SdkResult<ListSharedProjectsOutputResponse, ListSharedProjectsOutputError>) -> Void)
```

### `listSharedReportGroups(input:completion:)`

Gets a list of report groups that are shared with other Amazon Web Services accounts or users.

``` swift
public func listSharedReportGroups(input: ListSharedReportGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListSharedReportGroupsOutputResponse, ListSharedReportGroupsOutputError>) -> Void)
```

### `listSourceCredentials(input:completion:)`

Returns a list of SourceCredentialsInfo objects.

``` swift
public func listSourceCredentials(input: ListSourceCredentialsInput, completion: @escaping (ClientRuntime.SdkResult<ListSourceCredentialsOutputResponse, ListSourceCredentialsOutputError>) -> Void)
```

### `putResourcePolicy(input:completion:)`

Stores a resource policy for the ARN of a Project or ReportGroup object.

``` swift
public func putResourcePolicy(input: PutResourcePolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutResourcePolicyOutputResponse, PutResourcePolicyOutputError>) -> Void)
```

### `retryBuild(input:completion:)`

Restarts a build.

``` swift
public func retryBuild(input: RetryBuildInput, completion: @escaping (ClientRuntime.SdkResult<RetryBuildOutputResponse, RetryBuildOutputError>) -> Void)
```

### `retryBuildBatch(input:completion:)`

Restarts a failed batch build. Only batch builds that have failed can be retried.

``` swift
public func retryBuildBatch(input: RetryBuildBatchInput, completion: @escaping (ClientRuntime.SdkResult<RetryBuildBatchOutputResponse, RetryBuildBatchOutputError>) -> Void)
```

### `startBuild(input:completion:)`

Starts running a build.

``` swift
public func startBuild(input: StartBuildInput, completion: @escaping (ClientRuntime.SdkResult<StartBuildOutputResponse, StartBuildOutputError>) -> Void)
```

### `startBuildBatch(input:completion:)`

Starts a batch build for a project.

``` swift
public func startBuildBatch(input: StartBuildBatchInput, completion: @escaping (ClientRuntime.SdkResult<StartBuildBatchOutputResponse, StartBuildBatchOutputError>) -> Void)
```

### `stopBuild(input:completion:)`

Attempts to stop running a build.

``` swift
public func stopBuild(input: StopBuildInput, completion: @escaping (ClientRuntime.SdkResult<StopBuildOutputResponse, StopBuildOutputError>) -> Void)
```

### `stopBuildBatch(input:completion:)`

Stops a running batch build.

``` swift
public func stopBuildBatch(input: StopBuildBatchInput, completion: @escaping (ClientRuntime.SdkResult<StopBuildBatchOutputResponse, StopBuildBatchOutputError>) -> Void)
```

### `updateProject(input:completion:)`

Changes the settings of a build project.

``` swift
public func updateProject(input: UpdateProjectInput, completion: @escaping (ClientRuntime.SdkResult<UpdateProjectOutputResponse, UpdateProjectOutputError>) -> Void)
```

### `updateProjectVisibility(input:completion:)`

Changes the public visibility for a project. The project's build results, logs, and artifacts are available to the general public. For more information, see [Public build projects](https://docs.aws.amazon.com/codebuild/latest/userguide/public-builds.html) in the CodeBuild User Guide. The following should be kept in mind when making your projects public:

``` swift
public func updateProjectVisibility(input: UpdateProjectVisibilityInput, completion: @escaping (ClientRuntime.SdkResult<UpdateProjectVisibilityOutputResponse, UpdateProjectVisibilityOutputError>) -> Void)
```

  - All of a project's build results, logs, and artifacts, including builds that were run when the project was private, are available to the general public.

  - All build logs and artifacts are available to the public. Environment variables, source code, and other sensitive information may have been output to the build logs and artifacts. You must be careful about what information is output to the build logs. Some best practice are:

  - Do not store sensitive values, especially Amazon Web Services access key IDs and secret access keys, in environment variables. We recommend that you use an Amazon EC2 Systems Manager Parameter Store or Secrets Manager to store sensitive values.

  - Follow [Best practices for using webhooks](https://docs.aws.amazon.com/codebuild/latest/userguide/webhooks.html#webhook-best-practices) in the CodeBuild User Guide to limit which entities can trigger a build, and do not store the buildspec in the project itself, to ensure that your webhooks are as secure as possible.

  - A malicious user can use public builds to distribute malicious artifacts. We recommend that you review all pull requests to verify that the pull request is a legitimate change. We also recommend that you validate any artifacts with their checksums to make sure that the correct artifacts are being downloaded.

### `updateReportGroup(input:completion:)`

Updates a report group.

``` swift
public func updateReportGroup(input: UpdateReportGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateReportGroupOutputResponse, UpdateReportGroupOutputError>) -> Void)
```

### `updateWebhook(input:completion:)`

Updates the webhook associated with an CodeBuild build project. If you use Bitbucket for your repository, rotateSecret is ignored.

``` swift
public func updateWebhook(input: UpdateWebhookInput, completion: @escaping (ClientRuntime.SdkResult<UpdateWebhookOutputResponse, UpdateWebhookOutputError>) -> Void)
```
