# Iot1ClickDevicesClientProtocol

Describes all of the AWS IoT 1-Click device-related API operations for the service.
Also provides sample requests, responses, and errors for the supported web services
protocols.

``` swift
public protocol Iot1ClickDevicesClientProtocol 
```

## Requirements

### claimDevicesByClaimCode(input:​completion:​)

Adds device(s) to your account (i.e., claim one or more devices) if and only if you
received a claim code with the device(s).

``` swift
func claimDevicesByClaimCode(input: ClaimDevicesByClaimCodeInput, completion: @escaping (ClientRuntime.SdkResult<ClaimDevicesByClaimCodeOutputResponse, ClaimDevicesByClaimCodeOutputError>) -> Void)
```

### describeDevice(input:​completion:​)

Given a device ID, returns a DescribeDeviceResponse object describing the
details of the device.

``` swift
func describeDevice(input: DescribeDeviceInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDeviceOutputResponse, DescribeDeviceOutputError>) -> Void)
```

### finalizeDeviceClaim(input:​completion:​)

Given a device ID, finalizes the claim request for the associated device.
Claiming a device consists of initiating a claim, then publishing a device event,
and finalizing the claim. For a device of type button, a device event can
be published by simply clicking the device.

``` swift
func finalizeDeviceClaim(input: FinalizeDeviceClaimInput, completion: @escaping (ClientRuntime.SdkResult<FinalizeDeviceClaimOutputResponse, FinalizeDeviceClaimOutputError>) -> Void)
```

### getDeviceMethods(input:​completion:​)

Given a device ID, returns the invokable methods associated with the device.

``` swift
func getDeviceMethods(input: GetDeviceMethodsInput, completion: @escaping (ClientRuntime.SdkResult<GetDeviceMethodsOutputResponse, GetDeviceMethodsOutputError>) -> Void)
```

### initiateDeviceClaim(input:​completion:​)

Given a device ID, initiates a claim request for the associated device.
Claiming a device consists of initiating a claim, then publishing a device event,
and finalizing the claim. For a device of type button, a device event can
be published by simply clicking the device.

``` swift
func initiateDeviceClaim(input: InitiateDeviceClaimInput, completion: @escaping (ClientRuntime.SdkResult<InitiateDeviceClaimOutputResponse, InitiateDeviceClaimOutputError>) -> Void)
```

### invokeDeviceMethod(input:​completion:​)

Given a device ID, issues a request to invoke a named device method (with possible
parameters). See the "Example POST" code snippet below.

``` swift
func invokeDeviceMethod(input: InvokeDeviceMethodInput, completion: @escaping (ClientRuntime.SdkResult<InvokeDeviceMethodOutputResponse, InvokeDeviceMethodOutputError>) -> Void)
```

### listDeviceEvents(input:​completion:​)

Using a device ID, returns a DeviceEventsResponse object containing an
array of events for the device.

``` swift
func listDeviceEvents(input: ListDeviceEventsInput, completion: @escaping (ClientRuntime.SdkResult<ListDeviceEventsOutputResponse, ListDeviceEventsOutputError>) -> Void)
```

### listDevices(input:​completion:​)

Lists the 1-Click compatible devices associated with your AWS account.

``` swift
func listDevices(input: ListDevicesInput, completion: @escaping (ClientRuntime.SdkResult<ListDevicesOutputResponse, ListDevicesOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

Lists the tags associated with the specified resource ARN.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### tagResource(input:​completion:​)

Adds or updates the tags associated with the resource ARN. See <a href="https:​//docs.aws.amazon.com/iot-1-click/latest/developerguide/1click-appendix.html#1click-limits">AWS IoT 1-Click Service Limits for the maximum number of tags allowed per
resource.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### unclaimDevice(input:​completion:​)

Disassociates a device from your AWS account using its device ID.

``` swift
func unclaimDevice(input: UnclaimDeviceInput, completion: @escaping (ClientRuntime.SdkResult<UnclaimDeviceOutputResponse, UnclaimDeviceOutputError>) -> Void)
```

### untagResource(input:​completion:​)

Using tag keys, deletes the tags (key/value pairs) associated with the specified
resource ARN.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateDeviceState(input:​completion:​)

Using a Boolean value (true or false), this operation
enables or disables the device given a device ID.

``` swift
func updateDeviceState(input: UpdateDeviceStateInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDeviceStateOutputResponse, UpdateDeviceStateOutputError>) -> Void)
```
