# MobileClientProtocol

AWS Mobile Service provides mobile app and website developers with capabilities required to configure AWS resources and bootstrap their developer desktop projects with the necessary SDKs, constants, tools and samples to make use of those resources.

``` swift
public protocol MobileClientProtocol 
```

## Requirements

### createProject(input:completion:)

Creates an AWS Mobile Hub project.

``` swift
func createProject(input: CreateProjectInput, completion: @escaping (ClientRuntime.SdkResult<CreateProjectOutputResponse, CreateProjectOutputError>) -> Void)
```

### deleteProject(input:completion:)

Delets a project in AWS Mobile Hub.

``` swift
func deleteProject(input: DeleteProjectInput, completion: @escaping (ClientRuntime.SdkResult<DeleteProjectOutputResponse, DeleteProjectOutputError>) -> Void)
```

### describeBundle(input:completion:)

Get the bundle details for the requested bundle id.

``` swift
func describeBundle(input: DescribeBundleInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBundleOutputResponse, DescribeBundleOutputError>) -> Void)
```

### describeProject(input:completion:)

Gets details about a project in AWS Mobile Hub.

``` swift
func describeProject(input: DescribeProjectInput, completion: @escaping (ClientRuntime.SdkResult<DescribeProjectOutputResponse, DescribeProjectOutputError>) -> Void)
```

### exportBundle(input:completion:)

Generates customized software development kit (SDK) and or tool packages used to integrate mobile web or mobile app clients with backend AWS resources.

``` swift
func exportBundle(input: ExportBundleInput, completion: @escaping (ClientRuntime.SdkResult<ExportBundleOutputResponse, ExportBundleOutputError>) -> Void)
```

### exportProject(input:completion:)

Exports project configuration to a snapshot which can be downloaded and shared. Note that mobile app push credentials are encrypted in exported projects, so they can only be shared successfully within the same AWS account.

``` swift
func exportProject(input: ExportProjectInput, completion: @escaping (ClientRuntime.SdkResult<ExportProjectOutputResponse, ExportProjectOutputError>) -> Void)
```

### listBundles(input:completion:)

List all available bundles.

``` swift
func listBundles(input: ListBundlesInput, completion: @escaping (ClientRuntime.SdkResult<ListBundlesOutputResponse, ListBundlesOutputError>) -> Void)
```

### listProjects(input:completion:)

Lists projects in AWS Mobile Hub.

``` swift
func listProjects(input: ListProjectsInput, completion: @escaping (ClientRuntime.SdkResult<ListProjectsOutputResponse, ListProjectsOutputError>) -> Void)
```

### updateProject(input:completion:)

Update an existing project.

``` swift
func updateProject(input: UpdateProjectInput, completion: @escaping (ClientRuntime.SdkResult<UpdateProjectOutputResponse, UpdateProjectOutputError>) -> Void)
```
