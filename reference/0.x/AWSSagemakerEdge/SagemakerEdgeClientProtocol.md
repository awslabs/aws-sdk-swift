# SagemakerEdgeClientProtocol

SageMaker Edge Manager dataplane service for communicating with active agents.

``` swift
public protocol SagemakerEdgeClientProtocol 
```

## Requirements

### getDeviceRegistration(input:completion:)

Use to check if a device is registered with SageMaker Edge Manager.

``` swift
func getDeviceRegistration(input: GetDeviceRegistrationInput, completion: @escaping (ClientRuntime.SdkResult<GetDeviceRegistrationOutputResponse, GetDeviceRegistrationOutputError>) -> Void)
```

### sendHeartbeat(input:completion:)

Use to get the current status of devices registered on SageMaker Edge Manager.

``` swift
func sendHeartbeat(input: SendHeartbeatInput, completion: @escaping (ClientRuntime.SdkResult<SendHeartbeatOutputResponse, SendHeartbeatOutputError>) -> Void)
```
