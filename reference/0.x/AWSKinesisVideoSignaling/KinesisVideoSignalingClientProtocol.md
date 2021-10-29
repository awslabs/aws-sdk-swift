# KinesisVideoSignalingClientProtocol

Kinesis Video Streams Signaling Service is a intermediate service that establishes a communication channel for discovering peers, transmitting offers and answers in order to establish peer-to-peer connection in webRTC technology.

``` swift
public protocol KinesisVideoSignalingClientProtocol 
```

## Requirements

### getIceServerConfig(input:completion:)

Gets the Interactive Connectivity Establishment (ICE) server configuration information, including URIs, username, and password which can be used to configure the WebRTC connection. The ICE component uses this configuration information to setup the WebRTC connection, including authenticating with the Traversal Using Relays around NAT (TURN) relay server. TURN is a protocol that is used to improve the connectivity of peer-to-peer applications. By providing a cloud-based relay service, TURN ensures that a connection can be established even when one or more peers are incapable of a direct peer-to-peer connection. For more information, see [A REST API For Access To TURN Services](https://tools.ietf.org/html/draft-uberti-rtcweb-turn-rest-00). You can invoke this API to establish a fallback mechanism in case either of the peers is unable to establish a direct peer-to-peer connection over a signaling channel. You must specify either a signaling channel ARN or the client ID in order to invoke this API.

``` swift
func getIceServerConfig(input: GetIceServerConfigInput, completion: @escaping (ClientRuntime.SdkResult<GetIceServerConfigOutputResponse, GetIceServerConfigOutputError>) -> Void)
```

### sendAlexaOfferToMaster(input:completion:)

This API allows you to connect WebRTC-enabled devices with Alexa display devices. When invoked, it sends the Alexa Session Description Protocol (SDP) offer to the master peer. The offer is delivered as soon as the master is connected to the specified signaling channel. This API returns the SDP answer from the connected master. If the master is not connected to the signaling channel, redelivery requests are made until the message expires.

``` swift
func sendAlexaOfferToMaster(input: SendAlexaOfferToMasterInput, completion: @escaping (ClientRuntime.SdkResult<SendAlexaOfferToMasterOutputResponse, SendAlexaOfferToMasterOutputError>) -> Void)
```
