# BraketClient

``` swift
public class BraketClient 
```

## Inheritance

[`BraketClientProtocol`](/aws-sdk-swift/reference/0.x/AWSBraket/BraketClientProtocol)

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
public static let clientName = "BraketClient"
```

## Methods

### `cancelQuantumTask(input:completion:)`

Cancels the specified task.

``` swift
public func cancelQuantumTask(input: CancelQuantumTaskInput, completion: @escaping (ClientRuntime.SdkResult<CancelQuantumTaskOutputResponse, CancelQuantumTaskOutputError>) -> Void)
```

### `createQuantumTask(input:completion:)`

Creates a quantum task.

``` swift
public func createQuantumTask(input: CreateQuantumTaskInput, completion: @escaping (ClientRuntime.SdkResult<CreateQuantumTaskOutputResponse, CreateQuantumTaskOutputError>) -> Void)
```

### `getDevice(input:completion:)`

Retrieves the devices available in Amazon Braket.

``` swift
public func getDevice(input: GetDeviceInput, completion: @escaping (ClientRuntime.SdkResult<GetDeviceOutputResponse, GetDeviceOutputError>) -> Void)
```

### `getQuantumTask(input:completion:)`

Retrieves the specified quantum task.

``` swift
public func getQuantumTask(input: GetQuantumTaskInput, completion: @escaping (ClientRuntime.SdkResult<GetQuantumTaskOutputResponse, GetQuantumTaskOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Shows the tags associated with this resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `searchDevices(input:completion:)`

Searches for devices using the specified filters.

``` swift
public func searchDevices(input: SearchDevicesInput, completion: @escaping (ClientRuntime.SdkResult<SearchDevicesOutputResponse, SearchDevicesOutputError>) -> Void)
```

### `searchQuantumTasks(input:completion:)`

Searches for tasks that match the specified filter values.

``` swift
public func searchQuantumTasks(input: SearchQuantumTasksInput, completion: @escaping (ClientRuntime.SdkResult<SearchQuantumTasksOutputResponse, SearchQuantumTasksOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Add a tag to the specified resource.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Remove tags from a resource.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```
