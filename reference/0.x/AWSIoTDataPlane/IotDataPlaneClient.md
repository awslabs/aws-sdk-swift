# IotDataPlaneClient

``` swift
public class IotDataPlaneClient 
```

## Inheritance

[`IotDataPlaneClientProtocol`](/aws-sdk-swift/reference/0.x/AWSIoTDataPlane/IotDataPlaneClientProtocol)

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

### `deleteThingShadow(input:completion:)`

Deletes the shadow for the specified thing.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteThingShadow action.
For more information, see <a href="http:​//docs.aws.amazon.com/iot/latest/developerguide/API_DeleteThingShadow.html">DeleteThingShadow in the IoT Developer Guide.

``` swift
public func deleteThingShadow(input: DeleteThingShadowInput, completion: @escaping (ClientRuntime.SdkResult<DeleteThingShadowOutputResponse, DeleteThingShadowOutputError>) -> Void)
```

### `getRetainedMessage(input:completion:)`

Gets the details of a single retained message for the specified topic.
This action returns the message payload of the retained message, which can
incur messaging costs. To list only the topic names of the retained messages, call
<a href="/iot/latest/developerguide/API_iotdata_ListRetainedMessages.html">ListRetainedMessages.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiotfleethubfordevicemanagement.html#awsiotfleethubfordevicemanagement-actions-as-permissions">GetRetainedMessage action.
For more information about messaging costs, see <a href="http:​//aws.amazon.com/iot-core/pricing/#Messaging">IoT Core
pricing - Messaging.

``` swift
public func getRetainedMessage(input: GetRetainedMessageInput, completion: @escaping (ClientRuntime.SdkResult<GetRetainedMessageOutputResponse, GetRetainedMessageOutputError>) -> Void)
```

### `getThingShadow(input:completion:)`

Gets the shadow for the specified thing.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetThingShadow action.
For more information, see <a href="http:​//docs.aws.amazon.com/iot/latest/developerguide/API_GetThingShadow.html">GetThingShadow in the
IoT Developer Guide.

``` swift
public func getThingShadow(input: GetThingShadowInput, completion: @escaping (ClientRuntime.SdkResult<GetThingShadowOutputResponse, GetThingShadowOutputError>) -> Void)
```

### `listNamedShadowsForThing(input:completion:)`

Lists the shadows for the specified thing.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListNamedShadowsForThing action.

``` swift
public func listNamedShadowsForThing(input: ListNamedShadowsForThingInput, completion: @escaping (ClientRuntime.SdkResult<ListNamedShadowsForThingOutputResponse, ListNamedShadowsForThingOutputError>) -> Void)
```

### `listRetainedMessages(input:completion:)`

Lists summary information about the retained messages stored for the account.
This action returns only the topic names of the retained messages. It doesn't
return any message payloads. Although this action doesn't return a message payload,
it can still incur messaging costs.
To get the message payload of a retained message, call
<a href="https:​//docs.aws.amazon.com/iot/latest/developerguide/API_iotdata_GetRetainedMessage.html">GetRetainedMessage
with the topic name of the retained message.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiotfleethubfordevicemanagement.html#awsiotfleethubfordevicemanagement-actions-as-permissions">ListRetainedMessages action.
For more information about messaging costs, see <a href="http:​//aws.amazon.com/iot-core/pricing/#Messaging">IoT Core
pricing - Messaging.

``` swift
public func listRetainedMessages(input: ListRetainedMessagesInput, completion: @escaping (ClientRuntime.SdkResult<ListRetainedMessagesOutputResponse, ListRetainedMessagesOutputError>) -> Void)
```

### `publish(input:completion:)`

Publishes an MQTT message.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">Publish action.
For more information about MQTT messages, see
<a href="http:​//docs.aws.amazon.com/iot/latest/developerguide/mqtt.html">MQTT Protocol in the
IoT Developer Guide.
For more information about messaging costs, see <a href="http:​//aws.amazon.com/iot-core/pricing/#Messaging">IoT Core
pricing - Messaging.

``` swift
public func publish(input: PublishInput, completion: @escaping (ClientRuntime.SdkResult<PublishOutputResponse, PublishOutputError>) -> Void)
```

### `updateThingShadow(input:completion:)`

Updates the shadow for the specified thing.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateThingShadow action.
For more information, see <a href="http:​//docs.aws.amazon.com/iot/latest/developerguide/API_UpdateThingShadow.html">UpdateThingShadow in the
IoT Developer Guide.

``` swift
public func updateThingShadow(input: UpdateThingShadowInput, completion: @escaping (ClientRuntime.SdkResult<UpdateThingShadowOutputResponse, UpdateThingShadowOutputError>) -> Void)
```
