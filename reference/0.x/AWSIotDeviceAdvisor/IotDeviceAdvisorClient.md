# IotDeviceAdvisorClient

``` swift
public class IotDeviceAdvisorClient 
```

## Inheritance

[`IotDeviceAdvisorClientProtocol`](/aws-sdk-swift/reference/0.x/AWSIotDeviceAdvisor/IotDeviceAdvisorClientProtocol)

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

### `createSuiteDefinition(input:completion:)`

Creates a Device Advisor test suite.

``` swift
public func createSuiteDefinition(input: CreateSuiteDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<CreateSuiteDefinitionOutputResponse, CreateSuiteDefinitionOutputError>) -> Void)
```

### `deleteSuiteDefinition(input:completion:)`

Deletes a Device Advisor test suite.

``` swift
public func deleteSuiteDefinition(input: DeleteSuiteDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSuiteDefinitionOutputResponse, DeleteSuiteDefinitionOutputError>) -> Void)
```

### `getSuiteDefinition(input:completion:)`

Gets information about a Device Advisor test suite.

``` swift
public func getSuiteDefinition(input: GetSuiteDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<GetSuiteDefinitionOutputResponse, GetSuiteDefinitionOutputError>) -> Void)
```

### `getSuiteRun(input:completion:)`

Gets information about a Device Advisor test suite run.

``` swift
public func getSuiteRun(input: GetSuiteRunInput, completion: @escaping (ClientRuntime.SdkResult<GetSuiteRunOutputResponse, GetSuiteRunOutputError>) -> Void)
```

### `getSuiteRunReport(input:completion:)`

Gets a report download link for a successful Device Advisor qualifying test suite run.

``` swift
public func getSuiteRunReport(input: GetSuiteRunReportInput, completion: @escaping (ClientRuntime.SdkResult<GetSuiteRunReportOutputResponse, GetSuiteRunReportOutputError>) -> Void)
```

### `listSuiteDefinitions(input:completion:)`

Lists the Device Advisor test suites you have created.

``` swift
public func listSuiteDefinitions(input: ListSuiteDefinitionsInput, completion: @escaping (ClientRuntime.SdkResult<ListSuiteDefinitionsOutputResponse, ListSuiteDefinitionsOutputError>) -> Void)
```

### `listSuiteRuns(input:completion:)`

Lists the runs of the specified Device Advisor test suite.
You can list all runs of the test suite, or the runs of a specific version of the test suite.

``` swift
public func listSuiteRuns(input: ListSuiteRunsInput, completion: @escaping (ClientRuntime.SdkResult<ListSuiteRunsOutputResponse, ListSuiteRunsOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Lists the tags attached to an IoT Device Advisor resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `startSuiteRun(input:completion:)`

Starts a Device Advisor test suite run.

``` swift
public func startSuiteRun(input: StartSuiteRunInput, completion: @escaping (ClientRuntime.SdkResult<StartSuiteRunOutputResponse, StartSuiteRunOutputError>) -> Void)
```

### `stopSuiteRun(input:completion:)`

Stops a Device Advisor test suite run that is currently running.

``` swift
public func stopSuiteRun(input: StopSuiteRunInput, completion: @escaping (ClientRuntime.SdkResult<StopSuiteRunOutputResponse, StopSuiteRunOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Adds to and modifies existing tags of an IoT Device Advisor resource.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes tags from an IoT Device Advisor resource.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateSuiteDefinition(input:completion:)`

Updates a Device Advisor test suite.

``` swift
public func updateSuiteDefinition(input: UpdateSuiteDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSuiteDefinitionOutputResponse, UpdateSuiteDefinitionOutputError>) -> Void)
```
