# IoTSecureTunnelingClientProtocol

<fullname>AWS IoT Secure Tunneling</fullname>
AWS IoT Secure Tunnling enables you to create remote connections to devices
deployed in the field.

``` swift
public protocol IoTSecureTunnelingClientProtocol 
```

``` 
	       For more information about how AWS IoT Secure Tunneling works, see <a href="https://docs.aws.amazon.com/iot/latest/developerguide/secure-tunneling.html">AWS IoT Secure Tunneling.
```

## Requirements

### closeTunnel(input:​completion:​)

Closes a tunnel identified by the unique tunnel id. When a CloseTunnel
request is received, we close the WebSocket connections between the client and proxy
server so no data can be transmitted.

``` swift
func closeTunnel(input: CloseTunnelInput, completion: @escaping (ClientRuntime.SdkResult<CloseTunnelOutputResponse, CloseTunnelOutputError>) -> Void)
```

### describeTunnel(input:​completion:​)

Gets information about a tunnel identified by the unique tunnel id.

``` swift
func describeTunnel(input: DescribeTunnelInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTunnelOutputResponse, DescribeTunnelOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

Lists the tags for the specified resource.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### listTunnels(input:​completion:​)

List all tunnels for an AWS account. Tunnels are listed by creation time in
descending order, newer tunnels will be listed before older tunnels.

``` swift
func listTunnels(input: ListTunnelsInput, completion: @escaping (ClientRuntime.SdkResult<ListTunnelsOutputResponse, ListTunnelsOutputError>) -> Void)
```

### openTunnel(input:​completion:​)

Creates a new tunnel, and returns two client access tokens for clients to use to
connect to the AWS IoT Secure Tunneling proxy server.

``` swift
func openTunnel(input: OpenTunnelInput, completion: @escaping (ClientRuntime.SdkResult<OpenTunnelOutputResponse, OpenTunnelOutputError>) -> Void)
```

### tagResource(input:​completion:​)

A resource tag.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:​completion:​)

Removes a tag from a resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```
