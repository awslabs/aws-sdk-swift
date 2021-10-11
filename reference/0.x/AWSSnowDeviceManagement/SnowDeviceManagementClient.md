# SnowDeviceManagementClient

``` swift
public class SnowDeviceManagementClient 
```

## Inheritance

[`SnowDeviceManagementClientProtocol`](/aws-sdk-swift/reference/0.x/AWSSnowDeviceManagement/SnowDeviceManagementClientProtocol)

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

### `cancelTask(input:completion:)`

Sends a cancel request for a specified task. You can cancel a task only if it's still in a
QUEUED state. Tasks that are already running can't be cancelled.

``` swift
public func cancelTask(input: CancelTaskInput, completion: @escaping (ClientRuntime.SdkResult<CancelTaskOutputResponse, CancelTaskOutputError>) -> Void)
```

``` 
        A task might still run if it's processed from the queue before the
      CancelTask operation changes the task's state.
```

### `createTask(input:completion:)`

Instructs one or more devices to start a task, such as unlocking or rebooting.

``` swift
public func createTask(input: CreateTaskInput, completion: @escaping (ClientRuntime.SdkResult<CreateTaskOutputResponse, CreateTaskOutputError>) -> Void)
```

### `describeDevice(input:completion:)`

Checks device-specific information, such as the device type, software version, IP
addresses, and lock status.

``` swift
public func describeDevice(input: DescribeDeviceInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDeviceOutputResponse, DescribeDeviceOutputError>) -> Void)
```

### `describeDeviceEc2Instances(input:completion:)`

Checks the current state of the Amazon EC2 instances. The output is similar to
describeDevice, but the results are sourced from the device cache in the
Amazon Web Services Cloud and include a subset of the available fields.

``` swift
public func describeDeviceEc2Instances(input: DescribeDeviceEc2InstancesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDeviceEc2InstancesOutputResponse, DescribeDeviceEc2InstancesOutputError>) -> Void)
```

### `describeExecution(input:completion:)`

Checks the status of a remote task running on one or more target devices.

``` swift
public func describeExecution(input: DescribeExecutionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeExecutionOutputResponse, DescribeExecutionOutputError>) -> Void)
```

### `describeTask(input:completion:)`

Checks the metadata for a given task on a device.

``` swift
public func describeTask(input: DescribeTaskInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTaskOutputResponse, DescribeTaskOutputError>) -> Void)
```

### `listDeviceResources(input:completion:)`

Returns a list of the Amazon Web Services resources available for a device. Currently, Amazon EC2 instances are the only supported resource type.

``` swift
public func listDeviceResources(input: ListDeviceResourcesInput, completion: @escaping (ClientRuntime.SdkResult<ListDeviceResourcesOutputResponse, ListDeviceResourcesOutputError>) -> Void)
```

### `listDevices(input:completion:)`

Returns a list of all devices on your Amazon Web Services account that have Amazon Web Services Snow Device Management
enabled in the Amazon Web Services Region where the command is run.

``` swift
public func listDevices(input: ListDevicesInput, completion: @escaping (ClientRuntime.SdkResult<ListDevicesOutputResponse, ListDevicesOutputError>) -> Void)
```

### `listExecutions(input:completion:)`

Returns the status of tasks for one or more target devices.

``` swift
public func listExecutions(input: ListExecutionsInput, completion: @escaping (ClientRuntime.SdkResult<ListExecutionsOutputResponse, ListExecutionsOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Returns a list of tags for a managed device or task.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `listTasks(input:completion:)`

Returns a list of tasks that can be filtered by state.

``` swift
public func listTasks(input: ListTasksInput, completion: @escaping (ClientRuntime.SdkResult<ListTasksOutputResponse, ListTasksOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Adds or replaces tags on a device or task.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes a tag from a device or task.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```
