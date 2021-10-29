# CodeBuildClientProtocol

CodeBuild CodeBuild is a fully managed build service in the cloud. CodeBuild compiles your source code, runs unit tests, and produces artifacts that are ready to deploy. CodeBuild eliminates the need to provision, manage, and scale your own build servers. It provides prepackaged build environments for the most popular programming languages and build tools, such as Apache Maven, Gradle, and more. You can also fully customize build environments in CodeBuild to use your own build tools. CodeBuild scales automatically to meet peak build requests. You pay only for the build time you consume. For more information about CodeBuild, see the [CodeBuild User Guide](https://docs.aws.amazon.com/codebuild/latest/userguide/welcome.html).

``` swift
public protocol CodeBuildClientProtocol 
```

## Requirements

### batchDeleteBuilds(input:completion:)

Deletes one or more builds.

``` swift
func batchDeleteBuilds(input: BatchDeleteBuildsInput, completion: @escaping (ClientRuntime.SdkResult<BatchDeleteBuildsOutputResponse, BatchDeleteBuildsOutputError>) -> Void)
```

### batchGetBuildBatches(input:completion:)

Retrieves information about one or more batch builds.

``` swift
func batchGetBuildBatches(input: BatchGetBuildBatchesInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetBuildBatchesOutputResponse, BatchGetBuildBatchesOutputError>) -> Void)
```

### batchGetBuilds(input:completion:)

Gets information about one or more builds.

``` swift
func batchGetBuilds(input: BatchGetBuildsInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetBuildsOutputResponse, BatchGetBuildsOutputError>) -> Void)
```

### batchGetProjects(input:completion:)

Gets information about one or more build projects.

``` swift
func batchGetProjects(input: BatchGetProjectsInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetProjectsOutputResponse, BatchGetProjectsOutputError>) -> Void)
```

### batchGetReportGroups(input:completion:)

Returns an array of report groups.

``` swift
func batchGetReportGroups(input: BatchGetReportGroupsInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetReportGroupsOutputResponse, BatchGetReportGroupsOutputError>) -> Void)
```

### batchGetReports(input:completion:)

Returns an array of reports.

``` swift
func batchGetReports(input: BatchGetReportsInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetReportsOutputResponse, BatchGetReportsOutputError>) -> Void)
```

### createProject(input:completion:)

Creates a build project.

``` swift
func createProject(input: CreateProjectInput, completion: @escaping (ClientRuntime.SdkResult<CreateProjectOutputResponse, CreateProjectOutputError>) -> Void)
```

### createReportGroup(input:completion:)

Creates a report group. A report group contains a collection of reports.

``` swift
func createReportGroup(input: CreateReportGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateReportGroupOutputResponse, CreateReportGroupOutputError>) -> Void)
```

### createWebhook(input:completion:)

For an existing CodeBuild build project that has its source code stored in a GitHub or Bitbucket repository, enables CodeBuild to start rebuilding the source code every time a code change is pushed to the repository. If you enable webhooks for an CodeBuild project, and the project is used as a build step in CodePipeline, then two identical builds are created for each commit. One build is triggered through webhooks, and one through CodePipeline. Because billing is on a per-build basis, you are billed for both builds. Therefore, if you are using CodePipeline, we recommend that you disable webhooks in CodeBuild. In the CodeBuild console, clear the Webhook box. For more information, see step 5 in [Change a Build Project's Settings](https://docs.aws.amazon.com/codebuild/latest/userguide/change-project.html#change-project-console).

``` swift
func createWebhook(input: CreateWebhookInput, completion: @escaping (ClientRuntime.SdkResult<CreateWebhookOutputResponse, CreateWebhookOutputError>) -> Void)
```

### deleteBuildBatch(input:completion:)

Deletes a batch build.

``` swift
func deleteBuildBatch(input: DeleteBuildBatchInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBuildBatchOutputResponse, DeleteBuildBatchOutputError>) -> Void)
```

### deleteProject(input:completion:)

Deletes a build project. When you delete a project, its builds are not deleted.

``` swift
func deleteProject(input: DeleteProjectInput, completion: @escaping (ClientRuntime.SdkResult<DeleteProjectOutputResponse, DeleteProjectOutputError>) -> Void)
```

### deleteReport(input:completion:)

Deletes a report.

``` swift
func deleteReport(input: DeleteReportInput, completion: @escaping (ClientRuntime.SdkResult<DeleteReportOutputResponse, DeleteReportOutputError>) -> Void)
```

### deleteReportGroup(input:completion:)

Deletes a report group. Before you delete a report group, you must delete its reports.

``` swift
func deleteReportGroup(input: DeleteReportGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteReportGroupOutputResponse, DeleteReportGroupOutputError>) -> Void)
```

### deleteResourcePolicy(input:completion:)

Deletes a resource policy that is identified by its resource ARN.

``` swift
func deleteResourcePolicy(input: DeleteResourcePolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteResourcePolicyOutputResponse, DeleteResourcePolicyOutputError>) -> Void)
```

### deleteSourceCredentials(input:completion:)

Deletes a set of GitHub, GitHub Enterprise, or Bitbucket source credentials.

``` swift
func deleteSourceCredentials(input: DeleteSourceCredentialsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSourceCredentialsOutputResponse, DeleteSourceCredentialsOutputError>) -> Void)
```

### deleteWebhook(input:completion:)

For an existing CodeBuild build project that has its source code stored in a GitHub or Bitbucket repository, stops CodeBuild from rebuilding the source code every time a code change is pushed to the repository.

``` swift
func deleteWebhook(input: DeleteWebhookInput, completion: @escaping (ClientRuntime.SdkResult<DeleteWebhookOutputResponse, DeleteWebhookOutputError>) -> Void)
```

### describeCodeCoverages(input:completion:)

Retrieves one or more code coverage reports.

``` swift
func describeCodeCoverages(input: DescribeCodeCoveragesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCodeCoveragesOutputResponse, DescribeCodeCoveragesOutputError>) -> Void)
```

### describeTestCases(input:completion:)

Returns a list of details about test cases for a report.

``` swift
func describeTestCases(input: DescribeTestCasesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTestCasesOutputResponse, DescribeTestCasesOutputError>) -> Void)
```

### getReportGroupTrend(input:completion:)

Analyzes and accumulates test report values for the specified test reports.

``` swift
func getReportGroupTrend(input: GetReportGroupTrendInput, completion: @escaping (ClientRuntime.SdkResult<GetReportGroupTrendOutputResponse, GetReportGroupTrendOutputError>) -> Void)
```

### getResourcePolicy(input:completion:)

Gets a resource policy that is identified by its resource ARN.

``` swift
func getResourcePolicy(input: GetResourcePolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetResourcePolicyOutputResponse, GetResourcePolicyOutputError>) -> Void)
```

### importSourceCredentials(input:completion:)

Imports the source repository credentials for an CodeBuild project that has its source code stored in a GitHub, GitHub Enterprise, or Bitbucket repository.

``` swift
func importSourceCredentials(input: ImportSourceCredentialsInput, completion: @escaping (ClientRuntime.SdkResult<ImportSourceCredentialsOutputResponse, ImportSourceCredentialsOutputError>) -> Void)
```

### invalidateProjectCache(input:completion:)

Resets the cache for a project.

``` swift
func invalidateProjectCache(input: InvalidateProjectCacheInput, completion: @escaping (ClientRuntime.SdkResult<InvalidateProjectCacheOutputResponse, InvalidateProjectCacheOutputError>) -> Void)
```

### listBuildBatches(input:completion:)

Retrieves the identifiers of your build batches in the current region.

``` swift
func listBuildBatches(input: ListBuildBatchesInput, completion: @escaping (ClientRuntime.SdkResult<ListBuildBatchesOutputResponse, ListBuildBatchesOutputError>) -> Void)
```

### listBuildBatchesForProject(input:completion:)

Retrieves the identifiers of the build batches for a specific project.

``` swift
func listBuildBatchesForProject(input: ListBuildBatchesForProjectInput, completion: @escaping (ClientRuntime.SdkResult<ListBuildBatchesForProjectOutputResponse, ListBuildBatchesForProjectOutputError>) -> Void)
```

### listBuilds(input:completion:)

Gets a list of build IDs, with each build ID representing a single build.

``` swift
func listBuilds(input: ListBuildsInput, completion: @escaping (ClientRuntime.SdkResult<ListBuildsOutputResponse, ListBuildsOutputError>) -> Void)
```

### listBuildsForProject(input:completion:)

Gets a list of build identifiers for the specified build project, with each build identifier representing a single build.

``` swift
func listBuildsForProject(input: ListBuildsForProjectInput, completion: @escaping (ClientRuntime.SdkResult<ListBuildsForProjectOutputResponse, ListBuildsForProjectOutputError>) -> Void)
```

### listCuratedEnvironmentImages(input:completion:)

Gets information about Docker images that are managed by CodeBuild.

``` swift
func listCuratedEnvironmentImages(input: ListCuratedEnvironmentImagesInput, completion: @escaping (ClientRuntime.SdkResult<ListCuratedEnvironmentImagesOutputResponse, ListCuratedEnvironmentImagesOutputError>) -> Void)
```

### listProjects(input:completion:)

Gets a list of build project names, with each build project name representing a single build project.

``` swift
func listProjects(input: ListProjectsInput, completion: @escaping (ClientRuntime.SdkResult<ListProjectsOutputResponse, ListProjectsOutputError>) -> Void)
```

### listReportGroups(input:completion:)

Gets a list ARNs for the report groups in the current Amazon Web Services account.

``` swift
func listReportGroups(input: ListReportGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListReportGroupsOutputResponse, ListReportGroupsOutputError>) -> Void)
```

### listReports(input:completion:)

Returns a list of ARNs for the reports in the current Amazon Web Services account.

``` swift
func listReports(input: ListReportsInput, completion: @escaping (ClientRuntime.SdkResult<ListReportsOutputResponse, ListReportsOutputError>) -> Void)
```

### listReportsForReportGroup(input:completion:)

Returns a list of ARNs for the reports that belong to a ReportGroup.

``` swift
func listReportsForReportGroup(input: ListReportsForReportGroupInput, completion: @escaping (ClientRuntime.SdkResult<ListReportsForReportGroupOutputResponse, ListReportsForReportGroupOutputError>) -> Void)
```

### listSharedProjects(input:completion:)

Gets a list of projects that are shared with other Amazon Web Services accounts or users.

``` swift
func listSharedProjects(input: ListSharedProjectsInput, completion: @escaping (ClientRuntime.SdkResult<ListSharedProjectsOutputResponse, ListSharedProjectsOutputError>) -> Void)
```

### listSharedReportGroups(input:completion:)

Gets a list of report groups that are shared with other Amazon Web Services accounts or users.

``` swift
func listSharedReportGroups(input: ListSharedReportGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListSharedReportGroupsOutputResponse, ListSharedReportGroupsOutputError>) -> Void)
```

### listSourceCredentials(input:completion:)

Returns a list of SourceCredentialsInfo objects.

``` swift
func listSourceCredentials(input: ListSourceCredentialsInput, completion: @escaping (ClientRuntime.SdkResult<ListSourceCredentialsOutputResponse, ListSourceCredentialsOutputError>) -> Void)
```

### putResourcePolicy(input:completion:)

Stores a resource policy for the ARN of a Project or ReportGroup object.

``` swift
func putResourcePolicy(input: PutResourcePolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutResourcePolicyOutputResponse, PutResourcePolicyOutputError>) -> Void)
```

### retryBuild(input:completion:)

Restarts a build.

``` swift
func retryBuild(input: RetryBuildInput, completion: @escaping (ClientRuntime.SdkResult<RetryBuildOutputResponse, RetryBuildOutputError>) -> Void)
```

### retryBuildBatch(input:completion:)

Restarts a failed batch build. Only batch builds that have failed can be retried.

``` swift
func retryBuildBatch(input: RetryBuildBatchInput, completion: @escaping (ClientRuntime.SdkResult<RetryBuildBatchOutputResponse, RetryBuildBatchOutputError>) -> Void)
```

### startBuild(input:completion:)

Starts running a build.

``` swift
func startBuild(input: StartBuildInput, completion: @escaping (ClientRuntime.SdkResult<StartBuildOutputResponse, StartBuildOutputError>) -> Void)
```

### startBuildBatch(input:completion:)

Starts a batch build for a project.

``` swift
func startBuildBatch(input: StartBuildBatchInput, completion: @escaping (ClientRuntime.SdkResult<StartBuildBatchOutputResponse, StartBuildBatchOutputError>) -> Void)
```

### stopBuild(input:completion:)

Attempts to stop running a build.

``` swift
func stopBuild(input: StopBuildInput, completion: @escaping (ClientRuntime.SdkResult<StopBuildOutputResponse, StopBuildOutputError>) -> Void)
```

### stopBuildBatch(input:completion:)

Stops a running batch build.

``` swift
func stopBuildBatch(input: StopBuildBatchInput, completion: @escaping (ClientRuntime.SdkResult<StopBuildBatchOutputResponse, StopBuildBatchOutputError>) -> Void)
```

### updateProject(input:completion:)

Changes the settings of a build project.

``` swift
func updateProject(input: UpdateProjectInput, completion: @escaping (ClientRuntime.SdkResult<UpdateProjectOutputResponse, UpdateProjectOutputError>) -> Void)
```

### updateProjectVisibility(input:completion:)

Changes the public visibility for a project. The project's build results, logs, and artifacts are available to the general public. For more information, see [Public build projects](https://docs.aws.amazon.com/codebuild/latest/userguide/public-builds.html) in the CodeBuild User Guide. The following should be kept in mind when making your projects public:

``` swift
func updateProjectVisibility(input: UpdateProjectVisibilityInput, completion: @escaping (ClientRuntime.SdkResult<UpdateProjectVisibilityOutputResponse, UpdateProjectVisibilityOutputError>) -> Void)
```

  - All of a project's build results, logs, and artifacts, including builds that were run when the project was private, are available to the general public.

  - All build logs and artifacts are available to the public. Environment variables, source code, and other sensitive information may have been output to the build logs and artifacts. You must be careful about what information is output to the build logs. Some best practice are:

  - Do not store sensitive values, especially Amazon Web Services access key IDs and secret access keys, in environment variables. We recommend that you use an Amazon EC2 Systems Manager Parameter Store or Secrets Manager to store sensitive values.

  - Follow [Best practices for using webhooks](https://docs.aws.amazon.com/codebuild/latest/userguide/webhooks.html#webhook-best-practices) in the CodeBuild User Guide to limit which entities can trigger a build, and do not store the buildspec in the project itself, to ensure that your webhooks are as secure as possible.

  - A malicious user can use public builds to distribute malicious artifacts. We recommend that you review all pull requests to verify that the pull request is a legitimate change. We also recommend that you validate any artifacts with their checksums to make sure that the correct artifacts are being downloaded.

### updateReportGroup(input:completion:)

Updates a report group.

``` swift
func updateReportGroup(input: UpdateReportGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateReportGroupOutputResponse, UpdateReportGroupOutputError>) -> Void)
```

### updateWebhook(input:completion:)

Updates the webhook associated with an CodeBuild build project. If you use Bitbucket for your repository, rotateSecret is ignored.

``` swift
func updateWebhook(input: UpdateWebhookInput, completion: @escaping (ClientRuntime.SdkResult<UpdateWebhookOutputResponse, UpdateWebhookOutputError>) -> Void)
```
