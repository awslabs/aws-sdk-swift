# PersonalizeEventsClientProtocol

Amazon Personalize can consume real-time user event data, such as stream or click data, and use
it for model training either alone or combined with historical data. For more information see
<a href="https:​//docs.aws.amazon.com/personalize/latest/dg/recording-events.html">Recording Events.

``` swift
public protocol PersonalizeEventsClientProtocol 
```

## Requirements

### putEvents(input:​completion:​)

Records user interaction event data. For more information see
<a href="https:​//docs.aws.amazon.com/personalize/latest/dg/recording-events.html">Recording Events.

``` swift
func putEvents(input: PutEventsInput, completion: @escaping (ClientRuntime.SdkResult<PutEventsOutputResponse, PutEventsOutputError>) -> Void)
```

### putItems(input:​completion:​)

Adds one or more items to an Items dataset. For more information see
<a href="https:​//docs.aws.amazon.com/personalize/latest/dg/importing-items.html">Importing Items Incrementally.

``` swift
func putItems(input: PutItemsInput, completion: @escaping (ClientRuntime.SdkResult<PutItemsOutputResponse, PutItemsOutputError>) -> Void)
```

### putUsers(input:​completion:​)

Adds one or more users to a Users dataset. For more information see
<a href="https:​//docs.aws.amazon.com/personalize/latest/dg/importing-users.html">Importing Users Incrementally.

``` swift
func putUsers(input: PutUsersInput, completion: @escaping (ClientRuntime.SdkResult<PutUsersOutputResponse, PutUsersOutputError>) -> Void)
```
