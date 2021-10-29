# MobileClient

``` swift
public class MobileClient 
```

## Inheritance

[`MobileClientProtocol`](/aws-sdk-swift/reference/0.x/AWSMobile/MobileClientProtocol)

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
public static let clientName = "MobileClient"
```

## Methods

### `createProject(input:completion:)`

Creates an AWS Mobile Hub project.

``` swift
public func createProject(input: CreateProjectInput, completion: @escaping (ClientRuntime.SdkResult<CreateProjectOutputResponse, CreateProjectOutputError>) -> Void)
```

### `deleteProject(input:completion:)`

Delets a project in AWS Mobile Hub.

``` swift
public func deleteProject(input: DeleteProjectInput, completion: @escaping (ClientRuntime.SdkResult<DeleteProjectOutputResponse, DeleteProjectOutputError>) -> Void)
```

### `describeBundle(input:completion:)`

Get the bundle details for the requested bundle id.

``` swift
public func describeBundle(input: DescribeBundleInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBundleOutputResponse, DescribeBundleOutputError>) -> Void)
```

### `describeProject(input:completion:)`

Gets details about a project in AWS Mobile Hub.

``` swift
public func describeProject(input: DescribeProjectInput, completion: @escaping (ClientRuntime.SdkResult<DescribeProjectOutputResponse, DescribeProjectOutputError>) -> Void)
```

### `exportBundle(input:completion:)`

Generates customized software development kit (SDK) and or tool packages used to integrate mobile web or mobile app clients with backend AWS resources.

``` swift
public func exportBundle(input: ExportBundleInput, completion: @escaping (ClientRuntime.SdkResult<ExportBundleOutputResponse, ExportBundleOutputError>) -> Void)
```

### `exportProject(input:completion:)`

Exports project configuration to a snapshot which can be downloaded and shared. Note that mobile app push credentials are encrypted in exported projects, so they can only be shared successfully within the same AWS account.

``` swift
public func exportProject(input: ExportProjectInput, completion: @escaping (ClientRuntime.SdkResult<ExportProjectOutputResponse, ExportProjectOutputError>) -> Void)
```

### `listBundles(input:completion:)`

List all available bundles.

``` swift
public func listBundles(input: ListBundlesInput, completion: @escaping (ClientRuntime.SdkResult<ListBundlesOutputResponse, ListBundlesOutputError>) -> Void)
```

### `listProjects(input:completion:)`

Lists projects in AWS Mobile Hub.

``` swift
public func listProjects(input: ListProjectsInput, completion: @escaping (ClientRuntime.SdkResult<ListProjectsOutputResponse, ListProjectsOutputError>) -> Void)
```

### `updateProject(input:completion:)`

Update an existing project.

``` swift
public func updateProject(input: UpdateProjectInput, completion: @escaping (ClientRuntime.SdkResult<UpdateProjectOutputResponse, UpdateProjectOutputError>) -> Void)
```
