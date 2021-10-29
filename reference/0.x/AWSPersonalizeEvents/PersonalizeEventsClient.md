# PersonalizeEventsClient

``` swift
public class PersonalizeEventsClient 
```

## Inheritance

[`PersonalizeEventsClientProtocol`](/aws-sdk-swift/reference/0.x/AWSPersonalizeEvents/PersonalizeEventsClientProtocol)

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
public static let clientName = "PersonalizeEventsClient"
```

## Methods

### `putEvents(input:completion:)`

Records user interaction event data. For more information see [Recording Events](https://docs.aws.amazon.com/personalize/latest/dg/recording-events.html).

``` swift
public func putEvents(input: PutEventsInput, completion: @escaping (ClientRuntime.SdkResult<PutEventsOutputResponse, PutEventsOutputError>) -> Void)
```

### `putItems(input:completion:)`

Adds one or more items to an Items dataset. For more information see [Importing Items Incrementally](https://docs.aws.amazon.com/personalize/latest/dg/importing-items.html).

``` swift
public func putItems(input: PutItemsInput, completion: @escaping (ClientRuntime.SdkResult<PutItemsOutputResponse, PutItemsOutputError>) -> Void)
```

### `putUsers(input:completion:)`

Adds one or more users to a Users dataset. For more information see [Importing Users Incrementally](https://docs.aws.amazon.com/personalize/latest/dg/importing-users.html).

``` swift
public func putUsers(input: PutUsersInput, completion: @escaping (ClientRuntime.SdkResult<PutUsersOutputResponse, PutUsersOutputError>) -> Void)
```
