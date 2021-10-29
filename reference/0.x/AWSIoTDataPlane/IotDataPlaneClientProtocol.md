# IotDataPlaneClientProtocol

IoT data IoT data enables secure, bi-directional communication between Internet-connected things (such as sensors, actuators, embedded devices, or smart appliances) and the Amazon Web Services cloud. It implements a broker for applications and things to publish messages over HTTP (Publish) and retrieve, update, and delete shadows. A shadow is a persistent representation of your things and their state in the Amazon Web Services cloud. Find the endpoint address for actions in IoT data by running this CLI command: aws iot describe-endpoint --endpoint-type iot:Data-ATS The service name used by [Amazon Web ServicesSignature Version 4](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html) to sign requests is: iotdevicegateway.

``` swift
public protocol IotDataPlaneClientProtocol 
```

## Requirements

### deleteThingShadow(input:completion:)

Deletes the shadow for the specified thing. Requires permission to access the [DeleteThingShadow](https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions) action. For more information, see [DeleteThingShadow](http://docs.aws.amazon.com/iot/latest/developerguide/API_DeleteThingShadow.html) in the IoT Developer Guide.

``` swift
func deleteThingShadow(input: DeleteThingShadowInput, completion: @escaping (ClientRuntime.SdkResult<DeleteThingShadowOutputResponse, DeleteThingShadowOutputError>) -> Void)
```

### getRetainedMessage(input:completion:)

Gets the details of a single retained message for the specified topic. This action returns the message payload of the retained message, which can incur messaging costs. To list only the topic names of the retained messages, call \[ListRetainedMessages\]. Requires permission to access the [GetRetainedMessage](https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiotfleethubfordevicemanagement.html#awsiotfleethubfordevicemanagement-actions-as-permissions) action. For more information about messaging costs, see [IoT Core pricing - Messaging](http://aws.amazon.com/iot-core/pricing/#Messaging).

``` swift
func getRetainedMessage(input: GetRetainedMessageInput, completion: @escaping (ClientRuntime.SdkResult<GetRetainedMessageOutputResponse, GetRetainedMessageOutputError>) -> Void)
```

### getThingShadow(input:completion:)

Gets the shadow for the specified thing. Requires permission to access the [GetThingShadow](https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions) action. For more information, see [GetThingShadow](http://docs.aws.amazon.com/iot/latest/developerguide/API_GetThingShadow.html) in the IoT Developer Guide.

``` swift
func getThingShadow(input: GetThingShadowInput, completion: @escaping (ClientRuntime.SdkResult<GetThingShadowOutputResponse, GetThingShadowOutputError>) -> Void)
```

### listNamedShadowsForThing(input:completion:)

Lists the shadows for the specified thing. Requires permission to access the [ListNamedShadowsForThing](https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions) action.

``` swift
func listNamedShadowsForThing(input: ListNamedShadowsForThingInput, completion: @escaping (ClientRuntime.SdkResult<ListNamedShadowsForThingOutputResponse, ListNamedShadowsForThingOutputError>) -> Void)
```

### listRetainedMessages(input:completion:)

Lists summary information about the retained messages stored for the account. This action returns only the topic names of the retained messages. It doesn't return any message payloads. Although this action doesn't return a message payload, it can still incur messaging costs. To get the message payload of a retained message, call [GetRetainedMessage](https://docs.aws.amazon.com/iot/latest/developerguide/API_iotdata_GetRetainedMessage.html) with the topic name of the retained message. Requires permission to access the [ListRetainedMessages](https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiotfleethubfordevicemanagement.html#awsiotfleethubfordevicemanagement-actions-as-permissions) action. For more information about messaging costs, see [IoT Core pricing - Messaging](http://aws.amazon.com/iot-core/pricing/#Messaging).

``` swift
func listRetainedMessages(input: ListRetainedMessagesInput, completion: @escaping (ClientRuntime.SdkResult<ListRetainedMessagesOutputResponse, ListRetainedMessagesOutputError>) -> Void)
```

### publish(input:completion:)

Publishes an MQTT message. Requires permission to access the [Publish](https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions) action. For more information about MQTT messages, see [MQTT Protocol](http://docs.aws.amazon.com/iot/latest/developerguide/mqtt.html) in the IoT Developer Guide. For more information about messaging costs, see [IoT Core pricing - Messaging](http://aws.amazon.com/iot-core/pricing/#Messaging).

``` swift
func publish(input: PublishInput, completion: @escaping (ClientRuntime.SdkResult<PublishOutputResponse, PublishOutputError>) -> Void)
```

### updateThingShadow(input:completion:)

Updates the shadow for the specified thing. Requires permission to access the [UpdateThingShadow](https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions) action. For more information, see [UpdateThingShadow](http://docs.aws.amazon.com/iot/latest/developerguide/API_UpdateThingShadow.html) in the IoT Developer Guide.

``` swift
func updateThingShadow(input: UpdateThingShadowInput, completion: @escaping (ClientRuntime.SdkResult<UpdateThingShadowOutputResponse, UpdateThingShadowOutputError>) -> Void)
```
