# PersonalizeEventsClientProtocol

Amazon Personalize can consume real-time user event data, such as stream or click data, and use it for model training either alone or combined with historical data. For more information see [Recording Events](https://docs.aws.amazon.com/personalize/latest/dg/recording-events.html).

``` swift
public protocol PersonalizeEventsClientProtocol 
```

## Requirements

### putEvents(input:completion:)

Records user interaction event data. For more information see [Recording Events](https://docs.aws.amazon.com/personalize/latest/dg/recording-events.html).

``` swift
func putEvents(input: PutEventsInput, completion: @escaping (ClientRuntime.SdkResult<PutEventsOutputResponse, PutEventsOutputError>) -> Void)
```

### putItems(input:completion:)

Adds one or more items to an Items dataset. For more information see [Importing Items Incrementally](https://docs.aws.amazon.com/personalize/latest/dg/importing-items.html).

``` swift
func putItems(input: PutItemsInput, completion: @escaping (ClientRuntime.SdkResult<PutItemsOutputResponse, PutItemsOutputError>) -> Void)
```

### putUsers(input:completion:)

Adds one or more users to a Users dataset. For more information see [Importing Users Incrementally](https://docs.aws.amazon.com/personalize/latest/dg/importing-users.html).

``` swift
func putUsers(input: PutUsersInput, completion: @escaping (ClientRuntime.SdkResult<PutUsersOutputResponse, PutUsersOutputError>) -> Void)
```
