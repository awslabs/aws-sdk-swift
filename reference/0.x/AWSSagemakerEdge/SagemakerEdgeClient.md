# SagemakerEdgeClient

``` swift
public class SagemakerEdgeClient 
```

## Inheritance

[`SagemakerEdgeClientProtocol`](/aws-sdk-swift/reference/0.x/AWSSagemakerEdge/SagemakerEdgeClientProtocol)

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

### `getDeviceRegistration(input:completion:)`

Use to check if a device is registered with SageMaker Edge Manager.

``` swift
public func getDeviceRegistration(input: GetDeviceRegistrationInput, completion: @escaping (ClientRuntime.SdkResult<GetDeviceRegistrationOutputResponse, GetDeviceRegistrationOutputError>) -> Void)
```

### `sendHeartbeat(input:completion:)`

Use to get the current status of devices registered on SageMaker Edge Manager.

``` swift
public func sendHeartbeat(input: SendHeartbeatInput, completion: @escaping (ClientRuntime.SdkResult<SendHeartbeatOutputResponse, SendHeartbeatOutputError>) -> Void)
```
