# BraketClientProtocol

The Amazon Braket API Reference provides information about the operations and structures supported in Amazon Braket.

``` swift
public protocol BraketClientProtocol 
```

## Requirements

### cancelQuantumTask(input:completion:)

Cancels the specified task.

``` swift
func cancelQuantumTask(input: CancelQuantumTaskInput, completion: @escaping (ClientRuntime.SdkResult<CancelQuantumTaskOutputResponse, CancelQuantumTaskOutputError>) -> Void)
```

### createQuantumTask(input:completion:)

Creates a quantum task.

``` swift
func createQuantumTask(input: CreateQuantumTaskInput, completion: @escaping (ClientRuntime.SdkResult<CreateQuantumTaskOutputResponse, CreateQuantumTaskOutputError>) -> Void)
```

### getDevice(input:completion:)

Retrieves the devices available in Amazon Braket.

``` swift
func getDevice(input: GetDeviceInput, completion: @escaping (ClientRuntime.SdkResult<GetDeviceOutputResponse, GetDeviceOutputError>) -> Void)
```

### getQuantumTask(input:completion:)

Retrieves the specified quantum task.

``` swift
func getQuantumTask(input: GetQuantumTaskInput, completion: @escaping (ClientRuntime.SdkResult<GetQuantumTaskOutputResponse, GetQuantumTaskOutputError>) -> Void)
```

### listTagsForResource(input:completion:)

Shows the tags associated with this resource.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### searchDevices(input:completion:)

Searches for devices using the specified filters.

``` swift
func searchDevices(input: SearchDevicesInput, completion: @escaping (ClientRuntime.SdkResult<SearchDevicesOutputResponse, SearchDevicesOutputError>) -> Void)
```

### searchQuantumTasks(input:completion:)

Searches for tasks that match the specified filter values.

``` swift
func searchQuantumTasks(input: SearchQuantumTasksInput, completion: @escaping (ClientRuntime.SdkResult<SearchQuantumTasksOutputResponse, SearchQuantumTasksOutputError>) -> Void)
```

### tagResource(input:completion:)

Add a tag to the specified resource.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:completion:)

Remove tags from a resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```
