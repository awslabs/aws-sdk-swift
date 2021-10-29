# IotJobsDataPlaneClient

``` swift
public class IotJobsDataPlaneClient 
```

## Inheritance

[`IotJobsDataPlaneClientProtocol`](/aws-sdk-swift/reference/0.x/AWSIoTJobsDataPlane/IotJobsDataPlaneClientProtocol)

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
public static let clientName = "IotJobsDataPlaneClient"
```

## Methods

### `describeJobExecution(input:completion:)`

Gets details of a job execution.

``` swift
public func describeJobExecution(input: DescribeJobExecutionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeJobExecutionOutputResponse, DescribeJobExecutionOutputError>) -> Void)
```

### `getPendingJobExecutions(input:completion:)`

Gets the list of all jobs for a thing that are not in a terminal status.

``` swift
public func getPendingJobExecutions(input: GetPendingJobExecutionsInput, completion: @escaping (ClientRuntime.SdkResult<GetPendingJobExecutionsOutputResponse, GetPendingJobExecutionsOutputError>) -> Void)
```

### `startNextPendingJobExecution(input:completion:)`

Gets and starts the next pending (status IN\_PROGRESS or QUEUED) job execution for a thing.

``` swift
public func startNextPendingJobExecution(input: StartNextPendingJobExecutionInput, completion: @escaping (ClientRuntime.SdkResult<StartNextPendingJobExecutionOutputResponse, StartNextPendingJobExecutionOutputError>) -> Void)
```

### `updateJobExecution(input:completion:)`

Updates the status of a job execution.

``` swift
public func updateJobExecution(input: UpdateJobExecutionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateJobExecutionOutputResponse, UpdateJobExecutionOutputError>) -> Void)
```
