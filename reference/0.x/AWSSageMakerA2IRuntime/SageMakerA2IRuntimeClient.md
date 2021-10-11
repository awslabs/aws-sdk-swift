# SageMakerA2IRuntimeClient

``` swift
public class SageMakerA2IRuntimeClient 
```

## Inheritance

[`SageMakerA2IRuntimeClientProtocol`](/aws-sdk-swift/reference/0.x/AWSSageMakerA2IRuntime/SageMakerA2IRuntimeClientProtocol)

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

### `deleteHumanLoop(input:completion:)`

Deletes the specified human loop for a flow definition.
If the human loop was deleted, this operation will return a
ResourceNotFoundException.

``` swift
public func deleteHumanLoop(input: DeleteHumanLoopInput, completion: @escaping (ClientRuntime.SdkResult<DeleteHumanLoopOutputResponse, DeleteHumanLoopOutputError>) -> Void)
```

### `describeHumanLoop(input:completion:)`

Returns information about the specified human loop. If the human loop was deleted, this
operation will return a ResourceNotFoundException error.

``` swift
public func describeHumanLoop(input: DescribeHumanLoopInput, completion: @escaping (ClientRuntime.SdkResult<DescribeHumanLoopOutputResponse, DescribeHumanLoopOutputError>) -> Void)
```

### `listHumanLoops(input:completion:)`

Returns information about human loops, given the specified parameters. If a human loop was deleted, it will not be included.

``` swift
public func listHumanLoops(input: ListHumanLoopsInput, completion: @escaping (ClientRuntime.SdkResult<ListHumanLoopsOutputResponse, ListHumanLoopsOutputError>) -> Void)
```

### `startHumanLoop(input:completion:)`

Starts a human loop, provided that at least one activation condition is met.

``` swift
public func startHumanLoop(input: StartHumanLoopInput, completion: @escaping (ClientRuntime.SdkResult<StartHumanLoopOutputResponse, StartHumanLoopOutputError>) -> Void)
```

### `stopHumanLoop(input:completion:)`

Stops the specified human loop.

``` swift
public func stopHumanLoop(input: StopHumanLoopInput, completion: @escaping (ClientRuntime.SdkResult<StopHumanLoopOutputResponse, StopHumanLoopOutputError>) -> Void)
```
