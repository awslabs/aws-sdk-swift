# PinpointSmsVoiceClient

``` swift
public class PinpointSmsVoiceClient 
```

## Inheritance

[`PinpointSmsVoiceClientProtocol`](/aws-sdk-swift/reference/0.x/AWSPinpointSMSVoice/PinpointSmsVoiceClientProtocol)

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

### `createConfigurationSet(input:completion:)`

Create a new configuration set. After you create the configuration set, you can add one or more event destinations to it.

``` swift
public func createConfigurationSet(input: CreateConfigurationSetInput, completion: @escaping (ClientRuntime.SdkResult<CreateConfigurationSetOutputResponse, CreateConfigurationSetOutputError>) -> Void)
```

### `createConfigurationSetEventDestination(input:completion:)`

Create a new event destination in a configuration set.

``` swift
public func createConfigurationSetEventDestination(input: CreateConfigurationSetEventDestinationInput, completion: @escaping (ClientRuntime.SdkResult<CreateConfigurationSetEventDestinationOutputResponse, CreateConfigurationSetEventDestinationOutputError>) -> Void)
```

### `deleteConfigurationSet(input:completion:)`

Deletes an existing configuration set.

``` swift
public func deleteConfigurationSet(input: DeleteConfigurationSetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteConfigurationSetOutputResponse, DeleteConfigurationSetOutputError>) -> Void)
```

### `deleteConfigurationSetEventDestination(input:completion:)`

Deletes an event destination in a configuration set.

``` swift
public func deleteConfigurationSetEventDestination(input: DeleteConfigurationSetEventDestinationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteConfigurationSetEventDestinationOutputResponse, DeleteConfigurationSetEventDestinationOutputError>) -> Void)
```

### `getConfigurationSetEventDestinations(input:completion:)`

Obtain information about an event destination, including the types of events it reports, the Amazon Resource Name (ARN) of the destination, and the name of the event destination.

``` swift
public func getConfigurationSetEventDestinations(input: GetConfigurationSetEventDestinationsInput, completion: @escaping (ClientRuntime.SdkResult<GetConfigurationSetEventDestinationsOutputResponse, GetConfigurationSetEventDestinationsOutputError>) -> Void)
```

### `listConfigurationSets(input:completion:)`

List all of the configuration sets associated with your Amazon Pinpoint account in the current region.

``` swift
public func listConfigurationSets(input: ListConfigurationSetsInput, completion: @escaping (ClientRuntime.SdkResult<ListConfigurationSetsOutputResponse, ListConfigurationSetsOutputError>) -> Void)
```

### `sendVoiceMessage(input:completion:)`

Create a new voice message and send it to a recipient's phone number.

``` swift
public func sendVoiceMessage(input: SendVoiceMessageInput, completion: @escaping (ClientRuntime.SdkResult<SendVoiceMessageOutputResponse, SendVoiceMessageOutputError>) -> Void)
```

### `updateConfigurationSetEventDestination(input:completion:)`

Update an event destination in a configuration set. An event destination is a location that you publish information about your voice calls to. For example, you can log an event to an Amazon CloudWatch destination when a call fails.

``` swift
public func updateConfigurationSetEventDestination(input: UpdateConfigurationSetEventDestinationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateConfigurationSetEventDestinationOutputResponse, UpdateConfigurationSetEventDestinationOutputError>) -> Void)
```
