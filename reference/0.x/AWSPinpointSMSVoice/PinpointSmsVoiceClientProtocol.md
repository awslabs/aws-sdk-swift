# PinpointSmsVoiceClientProtocol

Pinpoint SMS and Voice Messaging public facing APIs

``` swift
public protocol PinpointSmsVoiceClientProtocol 
```

## Requirements

### createConfigurationSet(input:​completion:​)

Create a new configuration set. After you create the configuration set, you can add one or more event destinations to it.

``` swift
func createConfigurationSet(input: CreateConfigurationSetInput, completion: @escaping (ClientRuntime.SdkResult<CreateConfigurationSetOutputResponse, CreateConfigurationSetOutputError>) -> Void)
```

### createConfigurationSetEventDestination(input:​completion:​)

Create a new event destination in a configuration set.

``` swift
func createConfigurationSetEventDestination(input: CreateConfigurationSetEventDestinationInput, completion: @escaping (ClientRuntime.SdkResult<CreateConfigurationSetEventDestinationOutputResponse, CreateConfigurationSetEventDestinationOutputError>) -> Void)
```

### deleteConfigurationSet(input:​completion:​)

Deletes an existing configuration set.

``` swift
func deleteConfigurationSet(input: DeleteConfigurationSetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteConfigurationSetOutputResponse, DeleteConfigurationSetOutputError>) -> Void)
```

### deleteConfigurationSetEventDestination(input:​completion:​)

Deletes an event destination in a configuration set.

``` swift
func deleteConfigurationSetEventDestination(input: DeleteConfigurationSetEventDestinationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteConfigurationSetEventDestinationOutputResponse, DeleteConfigurationSetEventDestinationOutputError>) -> Void)
```

### getConfigurationSetEventDestinations(input:​completion:​)

Obtain information about an event destination, including the types of events it reports, the Amazon Resource Name (ARN) of the destination, and the name of the event destination.

``` swift
func getConfigurationSetEventDestinations(input: GetConfigurationSetEventDestinationsInput, completion: @escaping (ClientRuntime.SdkResult<GetConfigurationSetEventDestinationsOutputResponse, GetConfigurationSetEventDestinationsOutputError>) -> Void)
```

### listConfigurationSets(input:​completion:​)

List all of the configuration sets associated with your Amazon Pinpoint account in the current region.

``` swift
func listConfigurationSets(input: ListConfigurationSetsInput, completion: @escaping (ClientRuntime.SdkResult<ListConfigurationSetsOutputResponse, ListConfigurationSetsOutputError>) -> Void)
```

### sendVoiceMessage(input:​completion:​)

Create a new voice message and send it to a recipient's phone number.

``` swift
func sendVoiceMessage(input: SendVoiceMessageInput, completion: @escaping (ClientRuntime.SdkResult<SendVoiceMessageOutputResponse, SendVoiceMessageOutputError>) -> Void)
```

### updateConfigurationSetEventDestination(input:​completion:​)

Update an event destination in a configuration set. An event destination is a location that you publish information about your voice calls to. For example, you can log an event to an Amazon CloudWatch destination when a call fails.

``` swift
func updateConfigurationSetEventDestination(input: UpdateConfigurationSetEventDestinationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateConfigurationSetEventDestinationOutputResponse, UpdateConfigurationSetEventDestinationOutputError>) -> Void)
```
