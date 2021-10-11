# IotDeviceAdvisorClientProtocol

AWS IoT Core Device Advisor is a cloud-based, fully managed test capability for validating IoT devices during device software development. Device Advisor provides pre-built tests that you can use to validate IoT devices for reliable and secure connectivity with AWS IoT Core before deploying devices to production. By using Device Advisor, you can confirm that your devices can connect to AWS IoT Core, follow security best practices and, if applicable, receive software updates from IoT Device Management. You can also download signed qualification reports to submit to the AWS Partner Network to get your device qualified for the AWS Partner Device Catalog without the need to send your device in and wait for it to be tested.

``` swift
public protocol IotDeviceAdvisorClientProtocol 
```

## Requirements

### createSuiteDefinition(input:​completion:​)

Creates a Device Advisor test suite.

``` swift
func createSuiteDefinition(input: CreateSuiteDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<CreateSuiteDefinitionOutputResponse, CreateSuiteDefinitionOutputError>) -> Void)
```

### deleteSuiteDefinition(input:​completion:​)

Deletes a Device Advisor test suite.

``` swift
func deleteSuiteDefinition(input: DeleteSuiteDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSuiteDefinitionOutputResponse, DeleteSuiteDefinitionOutputError>) -> Void)
```

### getSuiteDefinition(input:​completion:​)

Gets information about a Device Advisor test suite.

``` swift
func getSuiteDefinition(input: GetSuiteDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<GetSuiteDefinitionOutputResponse, GetSuiteDefinitionOutputError>) -> Void)
```

### getSuiteRun(input:​completion:​)

Gets information about a Device Advisor test suite run.

``` swift
func getSuiteRun(input: GetSuiteRunInput, completion: @escaping (ClientRuntime.SdkResult<GetSuiteRunOutputResponse, GetSuiteRunOutputError>) -> Void)
```

### getSuiteRunReport(input:​completion:​)

Gets a report download link for a successful Device Advisor qualifying test suite run.

``` swift
func getSuiteRunReport(input: GetSuiteRunReportInput, completion: @escaping (ClientRuntime.SdkResult<GetSuiteRunReportOutputResponse, GetSuiteRunReportOutputError>) -> Void)
```

### listSuiteDefinitions(input:​completion:​)

Lists the Device Advisor test suites you have created.

``` swift
func listSuiteDefinitions(input: ListSuiteDefinitionsInput, completion: @escaping (ClientRuntime.SdkResult<ListSuiteDefinitionsOutputResponse, ListSuiteDefinitionsOutputError>) -> Void)
```

### listSuiteRuns(input:​completion:​)

Lists the runs of the specified Device Advisor test suite.
You can list all runs of the test suite, or the runs of a specific version of the test suite.

``` swift
func listSuiteRuns(input: ListSuiteRunsInput, completion: @escaping (ClientRuntime.SdkResult<ListSuiteRunsOutputResponse, ListSuiteRunsOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

Lists the tags attached to an IoT Device Advisor resource.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### startSuiteRun(input:​completion:​)

Starts a Device Advisor test suite run.

``` swift
func startSuiteRun(input: StartSuiteRunInput, completion: @escaping (ClientRuntime.SdkResult<StartSuiteRunOutputResponse, StartSuiteRunOutputError>) -> Void)
```

### stopSuiteRun(input:​completion:​)

Stops a Device Advisor test suite run that is currently running.

``` swift
func stopSuiteRun(input: StopSuiteRunInput, completion: @escaping (ClientRuntime.SdkResult<StopSuiteRunOutputResponse, StopSuiteRunOutputError>) -> Void)
```

### tagResource(input:​completion:​)

Adds to and modifies existing tags of an IoT Device Advisor resource.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:​completion:​)

Removes tags from an IoT Device Advisor resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateSuiteDefinition(input:​completion:​)

Updates a Device Advisor test suite.

``` swift
func updateSuiteDefinition(input: UpdateSuiteDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSuiteDefinitionOutputResponse, UpdateSuiteDefinitionOutputError>) -> Void)
```
