# DirectConnectClientProtocol

Direct Connect links your internal network to an Direct Connect location over a standard Ethernet fiber-optic cable. One end of the cable is connected to your router, the other to an Direct Connect router. With this connection in place, you can create virtual interfaces directly to the Cloud (for example, to Amazon EC2 and Amazon S3) and to Amazon VPC, bypassing Internet service providers in your network path. A connection provides access to all Regions except the China (Beijing) and (China) Ningxia Regions. Amazon Web Services resources in the China Regions can only be accessed through locations associated with those Regions.

``` swift
public protocol DirectConnectClientProtocol 
```

## Requirements

### acceptDirectConnectGatewayAssociationProposal(input:completion:)

Accepts a proposal request to attach a virtual private gateway or transit gateway to a Direct Connect gateway.

``` swift
func acceptDirectConnectGatewayAssociationProposal(input: AcceptDirectConnectGatewayAssociationProposalInput, completion: @escaping (ClientRuntime.SdkResult<AcceptDirectConnectGatewayAssociationProposalOutputResponse, AcceptDirectConnectGatewayAssociationProposalOutputError>) -> Void)
```

### allocateConnectionOnInterconnect(input:completion:)

Deprecated. Use \[AllocateHostedConnection\] instead. Creates a hosted connection on an interconnect. Allocates a VLAN number and a specified amount of bandwidth for use by a hosted connection on the specified interconnect. Intended for use by Direct Connect Partners only.

``` swift
@available(*, deprecated)
    func allocateConnectionOnInterconnect(input: AllocateConnectionOnInterconnectInput, completion: @escaping (ClientRuntime.SdkResult<AllocateConnectionOnInterconnectOutputResponse, AllocateConnectionOnInterconnectOutputError>) -> Void)
```

### allocateHostedConnection(input:completion:)

Creates a hosted connection on the specified interconnect or a link aggregation group (LAG) of interconnects. Allocates a VLAN number and a specified amount of capacity (bandwidth) for use by a hosted connection on the specified interconnect or LAG of interconnects. Amazon Web Services polices the hosted connection for the specified capacity and the Direct Connect Partner must also police the hosted connection for the specified capacity. Intended for use by Direct Connect Partners only.

``` swift
func allocateHostedConnection(input: AllocateHostedConnectionInput, completion: @escaping (ClientRuntime.SdkResult<AllocateHostedConnectionOutputResponse, AllocateHostedConnectionOutputError>) -> Void)
```

### allocatePrivateVirtualInterface(input:completion:)

Provisions a private virtual interface to be owned by the specified account. Virtual interfaces created using this action must be confirmed by the owner using \[ConfirmPrivateVirtualInterface\]. Until then, the virtual interface is in the Confirming state and is not available to handle traffic.

``` swift
func allocatePrivateVirtualInterface(input: AllocatePrivateVirtualInterfaceInput, completion: @escaping (ClientRuntime.SdkResult<AllocatePrivateVirtualInterfaceOutputResponse, AllocatePrivateVirtualInterfaceOutputError>) -> Void)
```

### allocatePublicVirtualInterface(input:completion:)

Provisions a public virtual interface to be owned by the specified account. The owner of a connection calls this function to provision a public virtual interface to be owned by the specified account. Virtual interfaces created using this function must be confirmed by the owner using \[ConfirmPublicVirtualInterface\]. Until this step has been completed, the virtual interface is in the confirming state and is not available to handle traffic. When creating an IPv6 public virtual interface, omit the Amazon address and customer address. IPv6 addresses are automatically assigned from the Amazon pool of IPv6 addresses; you cannot specify custom IPv6 addresses.

``` swift
func allocatePublicVirtualInterface(input: AllocatePublicVirtualInterfaceInput, completion: @escaping (ClientRuntime.SdkResult<AllocatePublicVirtualInterfaceOutputResponse, AllocatePublicVirtualInterfaceOutputError>) -> Void)
```

### allocateTransitVirtualInterface(input:completion:)

Provisions a transit virtual interface to be owned by the specified account. Use this type of interface to connect a transit gateway to your Direct Connect gateway. The owner of a connection provisions a transit virtual interface to be owned by the specified account. After you create a transit virtual interface, it must be confirmed by the owner using \[ConfirmTransitVirtualInterface\]. Until this step has been completed, the transit virtual interface is in the requested state and is not available to handle traffic.

``` swift
func allocateTransitVirtualInterface(input: AllocateTransitVirtualInterfaceInput, completion: @escaping (ClientRuntime.SdkResult<AllocateTransitVirtualInterfaceOutputResponse, AllocateTransitVirtualInterfaceOutputError>) -> Void)
```

### associateConnectionWithLag(input:completion:)

Associates an existing connection with a link aggregation group (LAG). The connection is interrupted and re-established as a member of the LAG (connectivity to Amazon Web Services is interrupted). The connection must be hosted on the same Direct Connect endpoint as the LAG, and its bandwidth must match the bandwidth for the LAG. You can re-associate a connection that's currently associated with a different LAG; however, if removing the connection would cause the original LAG to fall below its setting for minimum number of operational connections, the request fails. Any virtual interfaces that are directly associated with the connection are automatically re-associated with the LAG. If the connection was originally associated with a different LAG, the virtual interfaces remain associated with the original LAG. For interconnects, any hosted connections are automatically re-associated with the LAG. If the interconnect was originally associated with a different LAG, the hosted connections remain associated with the original LAG.

``` swift
func associateConnectionWithLag(input: AssociateConnectionWithLagInput, completion: @escaping (ClientRuntime.SdkResult<AssociateConnectionWithLagOutputResponse, AssociateConnectionWithLagOutputError>) -> Void)
```

### associateHostedConnection(input:completion:)

Associates a hosted connection and its virtual interfaces with a link aggregation group (LAG) or interconnect. If the target interconnect or LAG has an existing hosted connection with a conflicting VLAN number or IP address, the operation fails. This action temporarily interrupts the hosted connection's connectivity to Amazon Web Services as it is being migrated. Intended for use by Direct Connect Partners only.

``` swift
func associateHostedConnection(input: AssociateHostedConnectionInput, completion: @escaping (ClientRuntime.SdkResult<AssociateHostedConnectionOutputResponse, AssociateHostedConnectionOutputError>) -> Void)
```

### associateMacSecKey(input:completion:)

Associates a MAC Security (MACsec) Connection Key Name (CKN)/ Connectivity Association Key (CAK) pair with an Direct Connect dedicated connection. You must supply either the secretARN, or the CKN/CAK (ckn and cak) pair in the request. For information about MAC Security (MACsec) key considerations, see [MACsec pre-shared CKN/CAK key considerations ](https://docs.aws.amazon.com/directconnect/latest/UserGuide/direct-connect-mac-sec-getting-started.html#mac-sec-key-consideration) in the Direct Connect User Guide.

``` swift
func associateMacSecKey(input: AssociateMacSecKeyInput, completion: @escaping (ClientRuntime.SdkResult<AssociateMacSecKeyOutputResponse, AssociateMacSecKeyOutputError>) -> Void)
```

### associateVirtualInterface(input:completion:)

Associates a virtual interface with a specified link aggregation group (LAG) or connection. Connectivity to Amazon Web Services is temporarily interrupted as the virtual interface is being migrated. If the target connection or LAG has an associated virtual interface with a conflicting VLAN number or a conflicting IP address, the operation fails. Virtual interfaces associated with a hosted connection cannot be associated with a LAG; hosted connections must be migrated along with their virtual interfaces using \[AssociateHostedConnection\]. To reassociate a virtual interface to a new connection or LAG, the requester must own either the virtual interface itself or the connection to which the virtual interface is currently associated. Additionally, the requester must own the connection or LAG for the association.

``` swift
func associateVirtualInterface(input: AssociateVirtualInterfaceInput, completion: @escaping (ClientRuntime.SdkResult<AssociateVirtualInterfaceOutputResponse, AssociateVirtualInterfaceOutputError>) -> Void)
```

### confirmConnection(input:completion:)

Confirms the creation of the specified hosted connection on an interconnect. Upon creation, the hosted connection is initially in the Ordering state, and remains in this state until the owner confirms creation of the hosted connection.

``` swift
func confirmConnection(input: ConfirmConnectionInput, completion: @escaping (ClientRuntime.SdkResult<ConfirmConnectionOutputResponse, ConfirmConnectionOutputError>) -> Void)
```

### confirmPrivateVirtualInterface(input:completion:)

Accepts ownership of a private virtual interface created by another account. After the virtual interface owner makes this call, the virtual interface is created and attached to the specified virtual private gateway or Direct Connect gateway, and is made available to handle traffic.

``` swift
func confirmPrivateVirtualInterface(input: ConfirmPrivateVirtualInterfaceInput, completion: @escaping (ClientRuntime.SdkResult<ConfirmPrivateVirtualInterfaceOutputResponse, ConfirmPrivateVirtualInterfaceOutputError>) -> Void)
```

### confirmPublicVirtualInterface(input:completion:)

Accepts ownership of a public virtual interface created by another account. After the virtual interface owner makes this call, the specified virtual interface is created and made available to handle traffic.

``` swift
func confirmPublicVirtualInterface(input: ConfirmPublicVirtualInterfaceInput, completion: @escaping (ClientRuntime.SdkResult<ConfirmPublicVirtualInterfaceOutputResponse, ConfirmPublicVirtualInterfaceOutputError>) -> Void)
```

### confirmTransitVirtualInterface(input:completion:)

Accepts ownership of a transit virtual interface created by another account. After the owner of the transit virtual interface makes this call, the specified transit virtual interface is created and made available to handle traffic.

``` swift
func confirmTransitVirtualInterface(input: ConfirmTransitVirtualInterfaceInput, completion: @escaping (ClientRuntime.SdkResult<ConfirmTransitVirtualInterfaceOutputResponse, ConfirmTransitVirtualInterfaceOutputError>) -> Void)
```

### createBGPPeer(input:completion:)

Creates a BGP peer on the specified virtual interface. You must create a BGP peer for the corresponding address family (IPv4/IPv6) in order to access Amazon Web Services resources that also use that address family. If logical redundancy is not supported by the connection, interconnect, or LAG, the BGP peer cannot be in the same address family as an existing BGP peer on the virtual interface. When creating a IPv6 BGP peer, omit the Amazon address and customer address. IPv6 addresses are automatically assigned from the Amazon pool of IPv6 addresses; you cannot specify custom IPv6 addresses. For a public virtual interface, the Autonomous System Number (ASN) must be private or already on the allow list for the virtual interface.

``` swift
func createBGPPeer(input: CreateBGPPeerInput, completion: @escaping (ClientRuntime.SdkResult<CreateBGPPeerOutputResponse, CreateBGPPeerOutputError>) -> Void)
```

### createConnection(input:completion:)

Creates a connection between a customer network and a specific Direct Connect location. A connection links your internal network to an Direct Connect location over a standard Ethernet fiber-optic cable. One end of the cable is connected to your router, the other to an Direct Connect router. To find the locations for your Region, use \[DescribeLocations\]. You can automatically add the new connection to a link aggregation group (LAG) by specifying a LAG ID in the request. This ensures that the new connection is allocated on the same Direct Connect endpoint that hosts the specified LAG. If there are no available ports on the endpoint, the request fails and no connection is created.

``` swift
func createConnection(input: CreateConnectionInput, completion: @escaping (ClientRuntime.SdkResult<CreateConnectionOutputResponse, CreateConnectionOutputError>) -> Void)
```

### createDirectConnectGateway(input:completion:)

Creates a Direct Connect gateway, which is an intermediate object that enables you to connect a set of virtual interfaces and virtual private gateways. A Direct Connect gateway is global and visible in any Region after it is created. The virtual interfaces and virtual private gateways that are connected through a Direct Connect gateway can be in different Regions. This enables you to connect to a VPC in any Region, regardless of the Region in which the virtual interfaces are located, and pass traffic between them.

``` swift
func createDirectConnectGateway(input: CreateDirectConnectGatewayInput, completion: @escaping (ClientRuntime.SdkResult<CreateDirectConnectGatewayOutputResponse, CreateDirectConnectGatewayOutputError>) -> Void)
```

### createDirectConnectGatewayAssociation(input:completion:)

Creates an association between a Direct Connect gateway and a virtual private gateway. The virtual private gateway must be attached to a VPC and must not be associated with another Direct Connect gateway.

``` swift
func createDirectConnectGatewayAssociation(input: CreateDirectConnectGatewayAssociationInput, completion: @escaping (ClientRuntime.SdkResult<CreateDirectConnectGatewayAssociationOutputResponse, CreateDirectConnectGatewayAssociationOutputError>) -> Void)
```

### createDirectConnectGatewayAssociationProposal(input:completion:)

Creates a proposal to associate the specified virtual private gateway or transit gateway with the specified Direct Connect gateway. You can associate a Direct Connect gateway and virtual private gateway or transit gateway that is owned by any account.

``` swift
func createDirectConnectGatewayAssociationProposal(input: CreateDirectConnectGatewayAssociationProposalInput, completion: @escaping (ClientRuntime.SdkResult<CreateDirectConnectGatewayAssociationProposalOutputResponse, CreateDirectConnectGatewayAssociationProposalOutputError>) -> Void)
```

### createInterconnect(input:completion:)

Creates an interconnect between an Direct Connect Partner's network and a specific Direct Connect location. An interconnect is a connection that is capable of hosting other connections. The Direct Connect Partner can use an interconnect to provide Direct Connect hosted connections to customers through their own network services. Like a standard connection, an interconnect links the partner's network to an Direct Connect location over a standard Ethernet fiber-optic cable. One end is connected to the partner's router, the other to an Direct Connect router. You can automatically add the new interconnect to a link aggregation group (LAG) by specifying a LAG ID in the request. This ensures that the new interconnect is allocated on the same Direct Connect endpoint that hosts the specified LAG. If there are no available ports on the endpoint, the request fails and no interconnect is created. For each end customer, the Direct Connect Partner provisions a connection on their interconnect by calling \[AllocateHostedConnection\]. The end customer can then connect to Amazon Web Services resources by creating a virtual interface on their connection, using the VLAN assigned to them by the Direct Connect Partner. Intended for use by Direct Connect Partners only.

``` swift
func createInterconnect(input: CreateInterconnectInput, completion: @escaping (ClientRuntime.SdkResult<CreateInterconnectOutputResponse, CreateInterconnectOutputError>) -> Void)
```

### createLag(input:completion:)

Creates a link aggregation group (LAG) with the specified number of bundled physical dedicated connections between the customer network and a specific Direct Connect location. A LAG is a logical interface that uses the Link Aggregation Control Protocol (LACP) to aggregate multiple interfaces, enabling you to treat them as a single interface. All connections in a LAG must use the same bandwidth (either 1Gbps or 10Gbps) and must terminate at the same Direct Connect endpoint. You can have up to 10 dedicated connections per LAG. Regardless of this limit, if you request more connections for the LAG than Direct Connect can allocate on a single endpoint, no LAG is created. You can specify an existing physical dedicated connection or interconnect to include in the LAG (which counts towards the total number of connections). Doing so interrupts the current physical dedicated connection, and re-establishes them as a member of the LAG. The LAG will be created on the same Direct Connect endpoint to which the dedicated connection terminates. Any virtual interfaces associated with the dedicated connection are automatically disassociated and re-associated with the LAG. The connection ID does not change. If the account used to create a LAG is a registered Direct Connect Partner, the LAG is automatically enabled to host sub-connections. For a LAG owned by a partner, any associated virtual interfaces cannot be directly configured.

``` swift
func createLag(input: CreateLagInput, completion: @escaping (ClientRuntime.SdkResult<CreateLagOutputResponse, CreateLagOutputError>) -> Void)
```

### createPrivateVirtualInterface(input:completion:)

Creates a private virtual interface. A virtual interface is the VLAN that transports Direct Connect traffic. A private virtual interface can be connected to either a Direct Connect gateway or a Virtual Private Gateway (VGW). Connecting the private virtual interface to a Direct Connect gateway enables the possibility for connecting to multiple VPCs, including VPCs in different Regions. Connecting the private virtual interface to a VGW only provides access to a single VPC within the same Region. Setting the MTU of a virtual interface to 9001 (jumbo frames) can cause an update to the underlying physical connection if it wasn't updated to support jumbo frames. Updating the connection disrupts network connectivity for all virtual interfaces associated with the connection for up to 30 seconds. To check whether your connection supports jumbo frames, call \[DescribeConnections\]. To check whether your virtual interface supports jumbo frames, call \[DescribeVirtualInterfaces\].

``` swift
func createPrivateVirtualInterface(input: CreatePrivateVirtualInterfaceInput, completion: @escaping (ClientRuntime.SdkResult<CreatePrivateVirtualInterfaceOutputResponse, CreatePrivateVirtualInterfaceOutputError>) -> Void)
```

### createPublicVirtualInterface(input:completion:)

Creates a public virtual interface. A virtual interface is the VLAN that transports Direct Connect traffic. A public virtual interface supports sending traffic to public services of Amazon Web Services such as Amazon S3. When creating an IPv6 public virtual interface (addressFamily is ipv6), leave the customer and amazon address fields blank to use auto-assigned IPv6 space. Custom IPv6 addresses are not supported.

``` swift
func createPublicVirtualInterface(input: CreatePublicVirtualInterfaceInput, completion: @escaping (ClientRuntime.SdkResult<CreatePublicVirtualInterfaceOutputResponse, CreatePublicVirtualInterfaceOutputError>) -> Void)
```

### createTransitVirtualInterface(input:completion:)

Creates a transit virtual interface. A transit virtual interface should be used to access one or more transit gateways associated with Direct Connect gateways. A transit virtual interface enables the connection of multiple VPCs attached to a transit gateway to a Direct Connect gateway. If you associate your transit gateway with one or more Direct Connect gateways, the Autonomous System Number (ASN) used by the transit gateway and the Direct Connect gateway must be different. For example, if you use the default ASN 64512 for both your the transit gateway and Direct Connect gateway, the association request fails. Setting the MTU of a virtual interface to 8500 (jumbo frames) can cause an update to the underlying physical connection if it wasn't updated to support jumbo frames. Updating the connection disrupts network connectivity for all virtual interfaces associated with the connection for up to 30 seconds. To check whether your connection supports jumbo frames, call \[DescribeConnections\]. To check whether your virtual interface supports jumbo frames, call \[DescribeVirtualInterfaces\].

``` swift
func createTransitVirtualInterface(input: CreateTransitVirtualInterfaceInput, completion: @escaping (ClientRuntime.SdkResult<CreateTransitVirtualInterfaceOutputResponse, CreateTransitVirtualInterfaceOutputError>) -> Void)
```

### deleteBGPPeer(input:completion:)

Deletes the specified BGP peer on the specified virtual interface with the specified customer address and ASN. You cannot delete the last BGP peer from a virtual interface.

``` swift
func deleteBGPPeer(input: DeleteBGPPeerInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBGPPeerOutputResponse, DeleteBGPPeerOutputError>) -> Void)
```

### deleteConnection(input:completion:)

Deletes the specified connection. Deleting a connection only stops the Direct Connect port hour and data transfer charges. If you are partnering with any third parties to connect with the Direct Connect location, you must cancel your service with them separately.

``` swift
func deleteConnection(input: DeleteConnectionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteConnectionOutputResponse, DeleteConnectionOutputError>) -> Void)
```

### deleteDirectConnectGateway(input:completion:)

Deletes the specified Direct Connect gateway. You must first delete all virtual interfaces that are attached to the Direct Connect gateway and disassociate all virtual private gateways associated with the Direct Connect gateway.

``` swift
func deleteDirectConnectGateway(input: DeleteDirectConnectGatewayInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDirectConnectGatewayOutputResponse, DeleteDirectConnectGatewayOutputError>) -> Void)
```

### deleteDirectConnectGatewayAssociation(input:completion:)

Deletes the association between the specified Direct Connect gateway and virtual private gateway. We recommend that you specify the associationID to delete the association. Alternatively, if you own virtual gateway and a Direct Connect gateway association, you can specify the virtualGatewayId and directConnectGatewayId to delete an association.

``` swift
func deleteDirectConnectGatewayAssociation(input: DeleteDirectConnectGatewayAssociationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDirectConnectGatewayAssociationOutputResponse, DeleteDirectConnectGatewayAssociationOutputError>) -> Void)
```

### deleteDirectConnectGatewayAssociationProposal(input:completion:)

Deletes the association proposal request between the specified Direct Connect gateway and virtual private gateway or transit gateway.

``` swift
func deleteDirectConnectGatewayAssociationProposal(input: DeleteDirectConnectGatewayAssociationProposalInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDirectConnectGatewayAssociationProposalOutputResponse, DeleteDirectConnectGatewayAssociationProposalOutputError>) -> Void)
```

### deleteInterconnect(input:completion:)

Deletes the specified interconnect. Intended for use by Direct Connect Partners only.

``` swift
func deleteInterconnect(input: DeleteInterconnectInput, completion: @escaping (ClientRuntime.SdkResult<DeleteInterconnectOutputResponse, DeleteInterconnectOutputError>) -> Void)
```

### deleteLag(input:completion:)

Deletes the specified link aggregation group (LAG). You cannot delete a LAG if it has active virtual interfaces or hosted connections.

``` swift
func deleteLag(input: DeleteLagInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLagOutputResponse, DeleteLagOutputError>) -> Void)
```

### deleteVirtualInterface(input:completion:)

Deletes a virtual interface.

``` swift
func deleteVirtualInterface(input: DeleteVirtualInterfaceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVirtualInterfaceOutputResponse, DeleteVirtualInterfaceOutputError>) -> Void)
```

### describeConnectionLoa(input:completion:)

Deprecated. Use \[DescribeLoa\] instead. Gets the LOA-CFA for a connection. The Letter of Authorization - Connecting Facility Assignment (LOA-CFA) is a document that your APN partner or service provider uses when establishing your cross connect to Amazon Web Services at the colocation facility. For more information, see [Requesting Cross Connects at Direct Connect Locations](https://docs.aws.amazon.com/directconnect/latest/UserGuide/Colocation.html) in the Direct Connect User Guide.

``` swift
@available(*, deprecated)
    func describeConnectionLoa(input: DescribeConnectionLoaInput, completion: @escaping (ClientRuntime.SdkResult<DescribeConnectionLoaOutputResponse, DescribeConnectionLoaOutputError>) -> Void)
```

### describeConnections(input:completion:)

Displays the specified connection or all connections in this Region.

``` swift
func describeConnections(input: DescribeConnectionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeConnectionsOutputResponse, DescribeConnectionsOutputError>) -> Void)
```

### describeConnectionsOnInterconnect(input:completion:)

Deprecated. Use \[DescribeHostedConnections\] instead. Lists the connections that have been provisioned on the specified interconnect. Intended for use by Direct Connect Partners only.

``` swift
@available(*, deprecated)
    func describeConnectionsOnInterconnect(input: DescribeConnectionsOnInterconnectInput, completion: @escaping (ClientRuntime.SdkResult<DescribeConnectionsOnInterconnectOutputResponse, DescribeConnectionsOnInterconnectOutputError>) -> Void)
```

### describeDirectConnectGatewayAssociationProposals(input:completion:)

Describes one or more association proposals for connection between a virtual private gateway or transit gateway and a Direct Connect gateway.

``` swift
func describeDirectConnectGatewayAssociationProposals(input: DescribeDirectConnectGatewayAssociationProposalsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDirectConnectGatewayAssociationProposalsOutputResponse, DescribeDirectConnectGatewayAssociationProposalsOutputError>) -> Void)
```

### describeDirectConnectGatewayAssociations(input:completion:)

Lists the associations between your Direct Connect gateways and virtual private gateways and transit gateways. You must specify one of the following:

``` swift
func describeDirectConnectGatewayAssociations(input: DescribeDirectConnectGatewayAssociationsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDirectConnectGatewayAssociationsOutputResponse, DescribeDirectConnectGatewayAssociationsOutputError>) -> Void)
```

  - A Direct Connect gateway The response contains all virtual private gateways and transit gateways associated with the Direct Connect gateway.

  - A virtual private gateway The response contains the Direct Connect gateway.

  - A transit gateway The response contains the Direct Connect gateway.

  - A Direct Connect gateway and a virtual private gateway The response contains the association between the Direct Connect gateway and virtual private gateway.

  - A Direct Connect gateway and a transit gateway The response contains the association between the Direct Connect gateway and transit gateway.

### describeDirectConnectGatewayAttachments(input:completion:)

Lists the attachments between your Direct Connect gateways and virtual interfaces. You must specify a Direct Connect gateway, a virtual interface, or both. If you specify a Direct Connect gateway, the response contains all virtual interfaces attached to the Direct Connect gateway. If you specify a virtual interface, the response contains all Direct Connect gateways attached to the virtual interface. If you specify both, the response contains the attachment between the Direct Connect gateway and the virtual interface.

``` swift
func describeDirectConnectGatewayAttachments(input: DescribeDirectConnectGatewayAttachmentsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDirectConnectGatewayAttachmentsOutputResponse, DescribeDirectConnectGatewayAttachmentsOutputError>) -> Void)
```

### describeDirectConnectGateways(input:completion:)

Lists all your Direct Connect gateways or only the specified Direct Connect gateway. Deleted Direct Connect gateways are not returned.

``` swift
func describeDirectConnectGateways(input: DescribeDirectConnectGatewaysInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDirectConnectGatewaysOutputResponse, DescribeDirectConnectGatewaysOutputError>) -> Void)
```

### describeHostedConnections(input:completion:)

Lists the hosted connections that have been provisioned on the specified interconnect or link aggregation group (LAG). Intended for use by Direct Connect Partners only.

``` swift
func describeHostedConnections(input: DescribeHostedConnectionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeHostedConnectionsOutputResponse, DescribeHostedConnectionsOutputError>) -> Void)
```

### describeInterconnectLoa(input:completion:)

Deprecated. Use \[DescribeLoa\] instead. Gets the LOA-CFA for the specified interconnect. The Letter of Authorization - Connecting Facility Assignment (LOA-CFA) is a document that is used when establishing your cross connect to Amazon Web Services at the colocation facility. For more information, see [Requesting Cross Connects at Direct Connect Locations](https://docs.aws.amazon.com/directconnect/latest/UserGuide/Colocation.html) in the Direct Connect User Guide.

``` swift
@available(*, deprecated)
    func describeInterconnectLoa(input: DescribeInterconnectLoaInput, completion: @escaping (ClientRuntime.SdkResult<DescribeInterconnectLoaOutputResponse, DescribeInterconnectLoaOutputError>) -> Void)
```

### describeInterconnects(input:completion:)

Lists the interconnects owned by the account or only the specified interconnect.

``` swift
func describeInterconnects(input: DescribeInterconnectsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeInterconnectsOutputResponse, DescribeInterconnectsOutputError>) -> Void)
```

### describeLags(input:completion:)

Describes all your link aggregation groups (LAG) or the specified LAG.

``` swift
func describeLags(input: DescribeLagsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLagsOutputResponse, DescribeLagsOutputError>) -> Void)
```

### describeLoa(input:completion:)

Gets the LOA-CFA for a connection, interconnect, or link aggregation group (LAG). The Letter of Authorization - Connecting Facility Assignment (LOA-CFA) is a document that is used when establishing your cross connect to Amazon Web Services at the colocation facility. For more information, see [Requesting Cross Connects at Direct Connect Locations](https://docs.aws.amazon.com/directconnect/latest/UserGuide/Colocation.html) in the Direct Connect User Guide.

``` swift
func describeLoa(input: DescribeLoaInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLoaOutputResponse, DescribeLoaOutputError>) -> Void)
```

### describeLocations(input:completion:)

Lists the Direct Connect locations in the current Region. These are the locations that can be selected when calling \[CreateConnection\] or \[CreateInterconnect\].

``` swift
func describeLocations(input: DescribeLocationsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLocationsOutputResponse, DescribeLocationsOutputError>) -> Void)
```

### describeTags(input:completion:)

Describes the tags associated with the specified Direct Connect resources.

``` swift
func describeTags(input: DescribeTagsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTagsOutputResponse, DescribeTagsOutputError>) -> Void)
```

### describeVirtualGateways(input:completion:)

Lists the virtual private gateways owned by the account. You can create one or more Direct Connect private virtual interfaces linked to a virtual private gateway.

``` swift
func describeVirtualGateways(input: DescribeVirtualGatewaysInput, completion: @escaping (ClientRuntime.SdkResult<DescribeVirtualGatewaysOutputResponse, DescribeVirtualGatewaysOutputError>) -> Void)
```

### describeVirtualInterfaces(input:completion:)

Displays all virtual interfaces for an account. Virtual interfaces deleted fewer than 15 minutes before you make the request are also returned. If you specify a connection ID, only the virtual interfaces associated with the connection are returned. If you specify a virtual interface ID, then only a single virtual interface is returned. A virtual interface (VLAN) transmits the traffic between the Direct Connect location and the customer network.

``` swift
func describeVirtualInterfaces(input: DescribeVirtualInterfacesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeVirtualInterfacesOutputResponse, DescribeVirtualInterfacesOutputError>) -> Void)
```

### disassociateConnectionFromLag(input:completion:)

Disassociates a connection from a link aggregation group (LAG). The connection is interrupted and re-established as a standalone connection (the connection is not deleted; to delete the connection, use the \[DeleteConnection\] request). If the LAG has associated virtual interfaces or hosted connections, they remain associated with the LAG. A disassociated connection owned by an Direct Connect Partner is automatically converted to an interconnect. If disassociating the connection would cause the LAG to fall below its setting for minimum number of operational connections, the request fails, except when it's the last member of the LAG. If all connections are disassociated, the LAG continues to exist as an empty LAG with no physical connections.

``` swift
func disassociateConnectionFromLag(input: DisassociateConnectionFromLagInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateConnectionFromLagOutputResponse, DisassociateConnectionFromLagOutputError>) -> Void)
```

### disassociateMacSecKey(input:completion:)

Removes the association between a MAC Security (MACsec) security key and an Direct Connect dedicated connection.

``` swift
func disassociateMacSecKey(input: DisassociateMacSecKeyInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateMacSecKeyOutputResponse, DisassociateMacSecKeyOutputError>) -> Void)
```

### listVirtualInterfaceTestHistory(input:completion:)

Lists the virtual interface failover test history.

``` swift
func listVirtualInterfaceTestHistory(input: ListVirtualInterfaceTestHistoryInput, completion: @escaping (ClientRuntime.SdkResult<ListVirtualInterfaceTestHistoryOutputResponse, ListVirtualInterfaceTestHistoryOutputError>) -> Void)
```

### startBgpFailoverTest(input:completion:)

Starts the virtual interface failover test that verifies your configuration meets your resiliency requirements by placing the BGP peering session in the DOWN state. You can then send traffic to verify that there are no outages. You can run the test on public, private, transit, and hosted virtual interfaces. You can use [ListVirtualInterfaceTestHistory](https://docs.aws.amazon.com/directconnect/latest/APIReference/API_ListVirtualInterfaceTestHistory.html) to view the virtual interface test history. If you need to stop the test before the test interval completes, use [StopBgpFailoverTest](https://docs.aws.amazon.com/directconnect/latest/APIReference/API_StopBgpFailoverTest.html).

``` swift
func startBgpFailoverTest(input: StartBgpFailoverTestInput, completion: @escaping (ClientRuntime.SdkResult<StartBgpFailoverTestOutputResponse, StartBgpFailoverTestOutputError>) -> Void)
```

### stopBgpFailoverTest(input:completion:)

Stops the virtual interface failover test.

``` swift
func stopBgpFailoverTest(input: StopBgpFailoverTestInput, completion: @escaping (ClientRuntime.SdkResult<StopBgpFailoverTestOutputResponse, StopBgpFailoverTestOutputError>) -> Void)
```

### tagResource(input:completion:)

Adds the specified tags to the specified Direct Connect resource. Each resource can have a maximum of 50 tags. Each tag consists of a key and an optional value. If a tag with the same key is already associated with the resource, this action updates its value.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:completion:)

Removes one or more tags from the specified Direct Connect resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateConnection(input:completion:)

Updates the Direct Connect dedicated connection configuration. You can update the following parameters for a connection:

``` swift
func updateConnection(input: UpdateConnectionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateConnectionOutputResponse, UpdateConnectionOutputError>) -> Void)
```

  - The connection name

  - The connection's MAC Security (MACsec) encryption mode.

### updateDirectConnectGatewayAssociation(input:completion:)

Updates the specified attributes of the Direct Connect gateway association. Add or remove prefixes from the association.

``` swift
func updateDirectConnectGatewayAssociation(input: UpdateDirectConnectGatewayAssociationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDirectConnectGatewayAssociationOutputResponse, UpdateDirectConnectGatewayAssociationOutputError>) -> Void)
```

### updateLag(input:completion:)

Updates the attributes of the specified link aggregation group (LAG). You can update the following LAG attributes:

``` swift
func updateLag(input: UpdateLagInput, completion: @escaping (ClientRuntime.SdkResult<UpdateLagOutputResponse, UpdateLagOutputError>) -> Void)
```

  - The name of the LAG.

  - The value for the minimum number of connections that must be operational for the LAG itself to be operational.

  - The LAG's MACsec encryption mode. Amazon Web Services assigns this value to each connection which is part of the LAG.

  - The tags

If you adjust the threshold value for the minimum number of operational connections, ensure that the new value does not cause the LAG to fall below the threshold and become non-operational.

### updateVirtualInterfaceAttributes(input:completion:)

Updates the specified attributes of the specified virtual private interface. Setting the MTU of a virtual interface to 9001 (jumbo frames) can cause an update to the underlying physical connection if it wasn't updated to support jumbo frames. Updating the connection disrupts network connectivity for all virtual interfaces associated with the connection for up to 30 seconds. To check whether your connection supports jumbo frames, call \[DescribeConnections\]. To check whether your virtual q interface supports jumbo frames, call \[DescribeVirtualInterfaces\].

``` swift
func updateVirtualInterfaceAttributes(input: UpdateVirtualInterfaceAttributesInput, completion: @escaping (ClientRuntime.SdkResult<UpdateVirtualInterfaceAttributesOutputResponse, UpdateVirtualInterfaceAttributesOutputError>) -> Void)
```
