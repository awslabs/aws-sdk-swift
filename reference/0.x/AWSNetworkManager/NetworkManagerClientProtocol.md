# NetworkManagerClientProtocol

Transit Gateway Network Manager (Network Manager) enables you to create a global network, in which you can monitor your AWS and on-premises networks that are built around transit gateways. The Network Manager APIs are supported in the US West (Oregon) Region only. You must specify the us-west-2 Region in all requests made to Network Manager.

``` swift
public protocol NetworkManagerClientProtocol 
```

## Requirements

### associateCustomerGateway(input:completion:)

Associates a customer gateway with a device and optionally, with a link. If you specify a link, it must be associated with the specified device. You can only associate customer gateways that are connected to a VPN attachment on a transit gateway. The transit gateway must be registered in your global network. When you register a transit gateway, customer gateways that are connected to the transit gateway are automatically included in the global network. To list customer gateways that are connected to a transit gateway, use the [DescribeVpnConnections](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeVpnConnections.html) EC2 API and filter by transit-gateway-id. You cannot associate a customer gateway with more than one device and link.

``` swift
func associateCustomerGateway(input: AssociateCustomerGatewayInput, completion: @escaping (ClientRuntime.SdkResult<AssociateCustomerGatewayOutputResponse, AssociateCustomerGatewayOutputError>) -> Void)
```

### associateLink(input:completion:)

Associates a link to a device. A device can be associated to multiple links and a link can be associated to multiple devices. The device and link must be in the same global network and the same site.

``` swift
func associateLink(input: AssociateLinkInput, completion: @escaping (ClientRuntime.SdkResult<AssociateLinkOutputResponse, AssociateLinkOutputError>) -> Void)
```

### associateTransitGatewayConnectPeer(input:completion:)

Associates a transit gateway Connect peer with a device, and optionally, with a link. If you specify a link, it must be associated with the specified device. You can only associate transit gateway Connect peers that have been created on a transit gateway that's registered in your global network. You cannot associate a transit gateway Connect peer with more than one device and link.

``` swift
func associateTransitGatewayConnectPeer(input: AssociateTransitGatewayConnectPeerInput, completion: @escaping (ClientRuntime.SdkResult<AssociateTransitGatewayConnectPeerOutputResponse, AssociateTransitGatewayConnectPeerOutputError>) -> Void)
```

### createConnection(input:completion:)

Creates a connection between two devices. The devices can be a physical or virtual appliance that connects to a third-party appliance in a VPC, or a physical appliance that connects to another physical appliance in an on-premises network.

``` swift
func createConnection(input: CreateConnectionInput, completion: @escaping (ClientRuntime.SdkResult<CreateConnectionOutputResponse, CreateConnectionOutputError>) -> Void)
```

### createDevice(input:completion:)

Creates a new device in a global network. If you specify both a site ID and a location, the location of the site is used for visualization in the Network Manager console.

``` swift
func createDevice(input: CreateDeviceInput, completion: @escaping (ClientRuntime.SdkResult<CreateDeviceOutputResponse, CreateDeviceOutputError>) -> Void)
```

### createGlobalNetwork(input:completion:)

Creates a new, empty global network.

``` swift
func createGlobalNetwork(input: CreateGlobalNetworkInput, completion: @escaping (ClientRuntime.SdkResult<CreateGlobalNetworkOutputResponse, CreateGlobalNetworkOutputError>) -> Void)
```

### createLink(input:completion:)

Creates a new link for a specified site.

``` swift
func createLink(input: CreateLinkInput, completion: @escaping (ClientRuntime.SdkResult<CreateLinkOutputResponse, CreateLinkOutputError>) -> Void)
```

### createSite(input:completion:)

Creates a new site in a global network.

``` swift
func createSite(input: CreateSiteInput, completion: @escaping (ClientRuntime.SdkResult<CreateSiteOutputResponse, CreateSiteOutputError>) -> Void)
```

### deleteConnection(input:completion:)

Deletes the specified connection in your global network.

``` swift
func deleteConnection(input: DeleteConnectionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteConnectionOutputResponse, DeleteConnectionOutputError>) -> Void)
```

### deleteDevice(input:completion:)

Deletes an existing device. You must first disassociate the device from any links and customer gateways.

``` swift
func deleteDevice(input: DeleteDeviceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDeviceOutputResponse, DeleteDeviceOutputError>) -> Void)
```

### deleteGlobalNetwork(input:completion:)

Deletes an existing global network. You must first delete all global network objects (devices, links, and sites) and deregister all transit gateways.

``` swift
func deleteGlobalNetwork(input: DeleteGlobalNetworkInput, completion: @escaping (ClientRuntime.SdkResult<DeleteGlobalNetworkOutputResponse, DeleteGlobalNetworkOutputError>) -> Void)
```

### deleteLink(input:completion:)

Deletes an existing link. You must first disassociate the link from any devices and customer gateways.

``` swift
func deleteLink(input: DeleteLinkInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLinkOutputResponse, DeleteLinkOutputError>) -> Void)
```

### deleteSite(input:completion:)

Deletes an existing site. The site cannot be associated with any device or link.

``` swift
func deleteSite(input: DeleteSiteInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSiteOutputResponse, DeleteSiteOutputError>) -> Void)
```

### deregisterTransitGateway(input:completion:)

Deregisters a transit gateway from your global network. This action does not delete your transit gateway, or modify any of its attachments. This action removes any customer gateway associations.

``` swift
func deregisterTransitGateway(input: DeregisterTransitGatewayInput, completion: @escaping (ClientRuntime.SdkResult<DeregisterTransitGatewayOutputResponse, DeregisterTransitGatewayOutputError>) -> Void)
```

### describeGlobalNetworks(input:completion:)

Describes one or more global networks. By default, all global networks are described. To describe the objects in your global network, you must use the appropriate Get\* action. For example, to list the transit gateways in your global network, use \[GetTransitGatewayRegistrations\].

``` swift
func describeGlobalNetworks(input: DescribeGlobalNetworksInput, completion: @escaping (ClientRuntime.SdkResult<DescribeGlobalNetworksOutputResponse, DescribeGlobalNetworksOutputError>) -> Void)
```

### disassociateCustomerGateway(input:completion:)

Disassociates a customer gateway from a device and a link.

``` swift
func disassociateCustomerGateway(input: DisassociateCustomerGatewayInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateCustomerGatewayOutputResponse, DisassociateCustomerGatewayOutputError>) -> Void)
```

### disassociateLink(input:completion:)

Disassociates an existing device from a link. You must first disassociate any customer gateways that are associated with the link.

``` swift
func disassociateLink(input: DisassociateLinkInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateLinkOutputResponse, DisassociateLinkOutputError>) -> Void)
```

### disassociateTransitGatewayConnectPeer(input:completion:)

Disassociates a transit gateway Connect peer from a device and link.

``` swift
func disassociateTransitGatewayConnectPeer(input: DisassociateTransitGatewayConnectPeerInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateTransitGatewayConnectPeerOutputResponse, DisassociateTransitGatewayConnectPeerOutputError>) -> Void)
```

### getConnections(input:completion:)

Gets information about one or more of your connections in a global network.

``` swift
func getConnections(input: GetConnectionsInput, completion: @escaping (ClientRuntime.SdkResult<GetConnectionsOutputResponse, GetConnectionsOutputError>) -> Void)
```

### getCustomerGatewayAssociations(input:completion:)

Gets the association information for customer gateways that are associated with devices and links in your global network.

``` swift
func getCustomerGatewayAssociations(input: GetCustomerGatewayAssociationsInput, completion: @escaping (ClientRuntime.SdkResult<GetCustomerGatewayAssociationsOutputResponse, GetCustomerGatewayAssociationsOutputError>) -> Void)
```

### getDevices(input:completion:)

Gets information about one or more of your devices in a global network.

``` swift
func getDevices(input: GetDevicesInput, completion: @escaping (ClientRuntime.SdkResult<GetDevicesOutputResponse, GetDevicesOutputError>) -> Void)
```

### getLinkAssociations(input:completion:)

Gets the link associations for a device or a link. Either the device ID or the link ID must be specified.

``` swift
func getLinkAssociations(input: GetLinkAssociationsInput, completion: @escaping (ClientRuntime.SdkResult<GetLinkAssociationsOutputResponse, GetLinkAssociationsOutputError>) -> Void)
```

### getLinks(input:completion:)

Gets information about one or more links in a specified global network. If you specify the site ID, you cannot specify the type or provider in the same request. You can specify the type and provider in the same request.

``` swift
func getLinks(input: GetLinksInput, completion: @escaping (ClientRuntime.SdkResult<GetLinksOutputResponse, GetLinksOutputError>) -> Void)
```

### getSites(input:completion:)

Gets information about one or more of your sites in a global network.

``` swift
func getSites(input: GetSitesInput, completion: @escaping (ClientRuntime.SdkResult<GetSitesOutputResponse, GetSitesOutputError>) -> Void)
```

### getTransitGatewayConnectPeerAssociations(input:completion:)

Gets information about one or more of your transit gateway Connect peer associations in a global network.

``` swift
func getTransitGatewayConnectPeerAssociations(input: GetTransitGatewayConnectPeerAssociationsInput, completion: @escaping (ClientRuntime.SdkResult<GetTransitGatewayConnectPeerAssociationsOutputResponse, GetTransitGatewayConnectPeerAssociationsOutputError>) -> Void)
```

### getTransitGatewayRegistrations(input:completion:)

Gets information about the transit gateway registrations in a specified global network.

``` swift
func getTransitGatewayRegistrations(input: GetTransitGatewayRegistrationsInput, completion: @escaping (ClientRuntime.SdkResult<GetTransitGatewayRegistrationsOutputResponse, GetTransitGatewayRegistrationsOutputError>) -> Void)
```

### listTagsForResource(input:completion:)

Lists the tags for a specified resource.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### registerTransitGateway(input:completion:)

Registers a transit gateway in your global network. The transit gateway can be in any AWS Region, but it must be owned by the same AWS account that owns the global network. You cannot register a transit gateway in more than one global network.

``` swift
func registerTransitGateway(input: RegisterTransitGatewayInput, completion: @escaping (ClientRuntime.SdkResult<RegisterTransitGatewayOutputResponse, RegisterTransitGatewayOutputError>) -> Void)
```

### tagResource(input:completion:)

Tags a specified resource.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:completion:)

Removes tags from a specified resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateConnection(input:completion:)

Updates the information for an existing connection. To remove information for any of the parameters, specify an empty string.

``` swift
func updateConnection(input: UpdateConnectionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateConnectionOutputResponse, UpdateConnectionOutputError>) -> Void)
```

### updateDevice(input:completion:)

Updates the details for an existing device. To remove information for any of the parameters, specify an empty string.

``` swift
func updateDevice(input: UpdateDeviceInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDeviceOutputResponse, UpdateDeviceOutputError>) -> Void)
```

### updateGlobalNetwork(input:completion:)

Updates an existing global network. To remove information for any of the parameters, specify an empty string.

``` swift
func updateGlobalNetwork(input: UpdateGlobalNetworkInput, completion: @escaping (ClientRuntime.SdkResult<UpdateGlobalNetworkOutputResponse, UpdateGlobalNetworkOutputError>) -> Void)
```

### updateLink(input:completion:)

Updates the details for an existing link. To remove information for any of the parameters, specify an empty string.

``` swift
func updateLink(input: UpdateLinkInput, completion: @escaping (ClientRuntime.SdkResult<UpdateLinkOutputResponse, UpdateLinkOutputError>) -> Void)
```

### updateSite(input:completion:)

Updates the information for an existing site. To remove information for any of the parameters, specify an empty string.

``` swift
func updateSite(input: UpdateSiteInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSiteOutputResponse, UpdateSiteOutputError>) -> Void)
```
