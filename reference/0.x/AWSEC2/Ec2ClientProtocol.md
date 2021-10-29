# Ec2ClientProtocol

Amazon Elastic Compute Cloud Amazon Elastic Compute Cloud (Amazon EC2) provides secure and resizable computing capacity in the AWS Cloud. Using Amazon EC2 eliminates the need to invest in hardware up front, so you can develop and deploy applications faster. Amazon Virtual Private Cloud (Amazon VPC) enables you to provision a logically isolated section of the AWS Cloud where you can launch AWS resources in a virtual network that you've defined. Amazon Elastic Block Store (Amazon EBS) provides block level storage volumes for use with EC2 instances. EBS volumes are highly available

``` swift
public protocol Ec2ClientProtocol 
```

and reliable storage volumes that can be attached to any running instance and used like a hard drive. To learn more, see the following resources:

  - Amazon EC2: [AmazonEC2 product page](http://aws.amazon.com/ec2), [Amazon EC2 documentation](http://aws.amazon.com/documentation/ec2)

  - Amazon EBS: [Amazon EBS product page](http://aws.amazon.com/ebs), [Amazon EBS documentation](http://aws.amazon.com/documentation/ebs)

  - Amazon VPC: [Amazon VPC product page](http://aws.amazon.com/vpc), [Amazon VPC documentation](http://aws.amazon.com/documentation/vpc)

  - AWS VPN: [AWS VPN product page](http://aws.amazon.com/vpn), [AWS VPN documentation](http://aws.amazon.com/documentation/vpn)

## Requirements

### acceptReservedInstancesExchangeQuote(input:completion:)

Accepts the Convertible Reserved Instance exchange quote described in the \[GetReservedInstancesExchangeQuote\] call.

``` swift
func acceptReservedInstancesExchangeQuote(input: AcceptReservedInstancesExchangeQuoteInput, completion: @escaping (ClientRuntime.SdkResult<AcceptReservedInstancesExchangeQuoteOutputResponse, AcceptReservedInstancesExchangeQuoteOutputError>) -> Void)
```

### acceptTransitGatewayMulticastDomainAssociations(input:completion:)

Accepts a request to associate subnets with a transit gateway multicast domain.

``` swift
func acceptTransitGatewayMulticastDomainAssociations(input: AcceptTransitGatewayMulticastDomainAssociationsInput, completion: @escaping (ClientRuntime.SdkResult<AcceptTransitGatewayMulticastDomainAssociationsOutputResponse, AcceptTransitGatewayMulticastDomainAssociationsOutputError>) -> Void)
```

### acceptTransitGatewayPeeringAttachment(input:completion:)

Accepts a transit gateway peering attachment request. The peering attachment must be in the pendingAcceptance state.

``` swift
func acceptTransitGatewayPeeringAttachment(input: AcceptTransitGatewayPeeringAttachmentInput, completion: @escaping (ClientRuntime.SdkResult<AcceptTransitGatewayPeeringAttachmentOutputResponse, AcceptTransitGatewayPeeringAttachmentOutputError>) -> Void)
```

### acceptTransitGatewayVpcAttachment(input:completion:)

Accepts a request to attach a VPC to a transit gateway. The VPC attachment must be in the pendingAcceptance state. Use \[DescribeTransitGatewayVpcAttachments\] to view your pending VPC attachment requests. Use \[RejectTransitGatewayVpcAttachment\] to reject a VPC attachment request.

``` swift
func acceptTransitGatewayVpcAttachment(input: AcceptTransitGatewayVpcAttachmentInput, completion: @escaping (ClientRuntime.SdkResult<AcceptTransitGatewayVpcAttachmentOutputResponse, AcceptTransitGatewayVpcAttachmentOutputError>) -> Void)
```

### acceptVpcEndpointConnections(input:completion:)

Accepts one or more interface VPC endpoint connection requests to your VPC endpoint service.

``` swift
func acceptVpcEndpointConnections(input: AcceptVpcEndpointConnectionsInput, completion: @escaping (ClientRuntime.SdkResult<AcceptVpcEndpointConnectionsOutputResponse, AcceptVpcEndpointConnectionsOutputError>) -> Void)
```

### acceptVpcPeeringConnection(input:completion:)

Accept a VPC peering connection request. To accept a request, the VPC peering connection must be in the pending-acceptance state, and you must be the owner of the peer VPC. Use \[DescribeVpcPeeringConnections\] to view your outstanding VPC peering connection requests. For an inter-Region VPC peering connection request, you must accept the VPC peering connection in the Region of the accepter VPC.

``` swift
func acceptVpcPeeringConnection(input: AcceptVpcPeeringConnectionInput, completion: @escaping (ClientRuntime.SdkResult<AcceptVpcPeeringConnectionOutputResponse, AcceptVpcPeeringConnectionOutputError>) -> Void)
```

### advertiseByoipCidr(input:completion:)

Advertises an IPv4 or IPv6 address range that is provisioned for use with your Amazon Web Services resources through bring your own IP addresses (BYOIP). You can perform this operation at most once every 10 seconds, even if you specify different address ranges each time. We recommend that you stop advertising the BYOIP CIDR from other locations when you advertise it from Amazon Web Services. To minimize down time, you can configure your Amazon Web Services resources to use an address from a BYOIP CIDR before it is advertised, and then simultaneously stop advertising it from the current location and start advertising it through Amazon Web Services. It can take a few minutes before traffic to the specified addresses starts routing to Amazon Web Services because of BGP propagation delays. To stop advertising the BYOIP CIDR, use \[WithdrawByoipCidr\].

``` swift
func advertiseByoipCidr(input: AdvertiseByoipCidrInput, completion: @escaping (ClientRuntime.SdkResult<AdvertiseByoipCidrOutputResponse, AdvertiseByoipCidrOutputError>) -> Void)
```

### allocateAddress(input:completion:)

Allocates an Elastic IP address to your Amazon Web Services account. After you allocate the Elastic IP address you can associate it with an instance or network interface. After you release an Elastic IP address, it is released to the IP address pool and can be allocated to a different Amazon Web Services account. You can allocate an Elastic IP address from an address pool owned by Amazon Web Services or from an address pool created from a public IPv4 address range that you have brought to Amazon Web Services for use with your Amazon Web Services resources using bring your own IP addresses (BYOIP). For more information, see [Bring Your Own IP Addresses (BYOIP)](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-byoip.html) in the Amazon Elastic Compute Cloud User Guide. \[EC2-VPC\] If you release an Elastic IP address, you might be able to recover it. You cannot recover an Elastic IP address that you released after it is allocated to another Amazon Web Services account. You cannot recover an Elastic IP address for EC2-Classic. To attempt to recover an Elastic IP address that you released, specify it in this operation. An Elastic IP address is for use either in the EC2-Classic platform or in a VPC. By default, you can allocate 5 Elastic IP addresses for EC2-Classic per Region and 5 Elastic IP addresses for EC2-VPC per Region. For more information, see [Elastic IP Addresses](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html) in the Amazon Elastic Compute Cloud User Guide. You can allocate a carrier IP address which is a public IP address from a telecommunication carrier, to a network interface which resides in a subnet in a Wavelength Zone (for example an EC2 instance).

``` swift
func allocateAddress(input: AllocateAddressInput, completion: @escaping (ClientRuntime.SdkResult<AllocateAddressOutputResponse, AllocateAddressOutputError>) -> Void)
```

### allocateHosts(input:completion:)

Allocates a Dedicated Host to your account. At a minimum, specify the supported instance type or instance family, the Availability Zone in which to allocate the host, and the number of hosts to allocate.

``` swift
func allocateHosts(input: AllocateHostsInput, completion: @escaping (ClientRuntime.SdkResult<AllocateHostsOutputResponse, AllocateHostsOutputError>) -> Void)
```

### applySecurityGroupsToClientVpnTargetNetwork(input:completion:)

Applies a security group to the association between the target network and the Client VPN endpoint. This action replaces the existing security groups with the specified security groups.

``` swift
func applySecurityGroupsToClientVpnTargetNetwork(input: ApplySecurityGroupsToClientVpnTargetNetworkInput, completion: @escaping (ClientRuntime.SdkResult<ApplySecurityGroupsToClientVpnTargetNetworkOutputResponse, ApplySecurityGroupsToClientVpnTargetNetworkOutputError>) -> Void)
```

### assignIpv6Addresses(input:completion:)

Assigns one or more IPv6 addresses to the specified network interface. You can specify one or more specific IPv6 addresses, or you can specify the number of IPv6 addresses to be automatically assigned from within the subnet's IPv6 CIDR block range. You can assign as many IPv6 addresses to a network interface as you can assign private IPv4 addresses, and the limit varies per instance type. For information, see [IP Addresses Per Network Interface Per Instance Type](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html#AvailableIpPerENI) in the Amazon Elastic Compute Cloud User Guide. You must specify either the IPv6 addresses or the IPv6 address count in the request. You can optionally use Prefix Delegation on the network interface. You must specify either the IPV6 Prefix Delegation prefixes, or the IPv6 Prefix Delegation count. For information, see [ Assigning prefixes to Amazon EC2 network interfaces](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-prefix-eni.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func assignIpv6Addresses(input: AssignIpv6AddressesInput, completion: @escaping (ClientRuntime.SdkResult<AssignIpv6AddressesOutputResponse, AssignIpv6AddressesOutputError>) -> Void)
```

### assignPrivateIpAddresses(input:completion:)

Assigns one or more secondary private IP addresses to the specified network interface. You can specify one or more specific secondary IP addresses, or you can specify the number of secondary IP addresses to be automatically assigned within the subnet's CIDR block range. The number of secondary IP addresses that you can assign to an instance varies by instance type. For information about instance types, see [Instance Types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html) in the Amazon Elastic Compute Cloud User Guide. For more information about Elastic IP addresses, see [Elastic IP Addresses](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html) in the Amazon Elastic Compute Cloud User Guide. When you move a secondary private IP address to another network interface, any Elastic IP address that is associated with the IP address is also moved. Remapping an IP address is an asynchronous operation. When you move an IP address from one network interface to another, check network/interfaces/macs/mac/local-ipv4s in the instance metadata to confirm that the remapping is complete. You must specify either the IP addresses or the IP address count in the request. You can optionally use Prefix Delegation on the network interface. You must specify either the IPv4 Prefix Delegation prefixes, or the IPv4 Prefix Delegation count. For information, see [ Assigning prefixes to Amazon EC2 network interfaces](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-prefix-eni.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func assignPrivateIpAddresses(input: AssignPrivateIpAddressesInput, completion: @escaping (ClientRuntime.SdkResult<AssignPrivateIpAddressesOutputResponse, AssignPrivateIpAddressesOutputError>) -> Void)
```

### associateAddress(input:completion:)

Associates an Elastic IP address, or carrier IP address (for instances that are in subnets in Wavelength Zones) with an instance or a network interface. Before you can use an Elastic IP address, you must allocate it to your account. An Elastic IP address is for use in either the EC2-Classic platform or in a VPC. For more information, see [Elastic IP Addresses](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html) in the Amazon Elastic Compute Cloud User Guide. \[EC2-Classic, VPC in an EC2-VPC-only account\] If the Elastic IP address is already associated with a different instance, it is disassociated from that instance and associated with the specified instance. If you associate an Elastic IP address with an instance that has an existing Elastic IP address, the existing address is disassociated from the instance, but remains allocated to your account. \[VPC in an EC2-Classic account\] If you don't specify a private IP address, the Elastic IP address is associated with the primary IP address. If the Elastic IP address is already associated with a different instance or a network interface, you get an error unless you allow reassociation. You cannot associate an Elastic IP address with an instance or network interface that has an existing Elastic IP address. \[Subnets in Wavelength Zones\] You can associate an IP address from the telecommunication carrier to the instance or network interface. You cannot associate an Elastic IP address with an interface in a different network border group. This is an idempotent operation. If you perform the operation more than once, Amazon EC2 doesn't return an error, and you may be charged for each time the Elastic IP address is remapped to the same instance. For more information, see the Elastic IP Addresses section of [Amazon EC2 Pricing](http://aws.amazon.com/ec2/pricing/).

``` swift
func associateAddress(input: AssociateAddressInput, completion: @escaping (ClientRuntime.SdkResult<AssociateAddressOutputResponse, AssociateAddressOutputError>) -> Void)
```

### associateClientVpnTargetNetwork(input:completion:)

Associates a target network with a Client VPN endpoint. A target network is a subnet in a VPC. You can associate multiple subnets from the same VPC with a Client VPN endpoint. You can associate only one subnet in each Availability Zone. We recommend that you associate at least two subnets to provide Availability Zone redundancy. If you specified a VPC when you created the Client VPN endpoint or if you have previous subnet associations, the specified subnet must be in the same VPC. To specify a subnet that's in a different VPC, you must first modify the Client VPN endpoint (\[ModifyClientVpnEndpoint\]) and change the VPC that's associated with it.

``` swift
func associateClientVpnTargetNetwork(input: AssociateClientVpnTargetNetworkInput, completion: @escaping (ClientRuntime.SdkResult<AssociateClientVpnTargetNetworkOutputResponse, AssociateClientVpnTargetNetworkOutputError>) -> Void)
```

### associateDhcpOptions(input:completion:)

Associates a set of DHCP options (that you've previously created) with the specified VPC, or associates no DHCP options with the VPC. After you associate the options with the VPC, any existing instances and all new instances that you launch in that VPC use the options. You don't need to restart or relaunch the instances. They automatically pick up the changes within a few hours, depending on how frequently the instance renews its DHCP lease. You can explicitly renew the lease using the operating system on the instance. For more information, see [DHCP options sets](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_DHCP_Options.html) in the Amazon Virtual Private Cloud User Guide.

``` swift
func associateDhcpOptions(input: AssociateDhcpOptionsInput, completion: @escaping (ClientRuntime.SdkResult<AssociateDhcpOptionsOutputResponse, AssociateDhcpOptionsOutputError>) -> Void)
```

### associateEnclaveCertificateIamRole(input:completion:)

Associates an Identity and Access Management (IAM) role with an Certificate Manager (ACM) certificate. This enables the certificate to be used by the ACM for Nitro Enclaves application inside an enclave. For more information, see [Certificate Manager for Nitro Enclaves](https://docs.aws.amazon.com/enclaves/latest/user/nitro-enclave-refapp.html) in the Amazon Web Services Nitro Enclaves User Guide. When the IAM role is associated with the ACM certificate, the certificate, certificate chain, and encrypted private key are placed in an Amazon S3 bucket that only the associated IAM role can access. The private key of the certificate is encrypted with an Amazon Web Services managed key that has an attached attestation-based key policy. To enable the IAM role to access the Amazon S3 object, you must grant it permission to call s3:GetObject on the Amazon S3 bucket returned by the command. To enable the IAM role to access the KMS key, you must grant it permission to call kms:Decrypt on the KMS key returned by the command. For more information, see [ Grant the role permission to access the certificate and encryption key](https://docs.aws.amazon.com/enclaves/latest/user/nitro-enclave-refapp.html#add-policy) in the Amazon Web Services Nitro Enclaves User Guide.

``` swift
func associateEnclaveCertificateIamRole(input: AssociateEnclaveCertificateIamRoleInput, completion: @escaping (ClientRuntime.SdkResult<AssociateEnclaveCertificateIamRoleOutputResponse, AssociateEnclaveCertificateIamRoleOutputError>) -> Void)
```

### associateIamInstanceProfile(input:completion:)

Associates an IAM instance profile with a running or stopped instance. You cannot associate more than one IAM instance profile with an instance.

``` swift
func associateIamInstanceProfile(input: AssociateIamInstanceProfileInput, completion: @escaping (ClientRuntime.SdkResult<AssociateIamInstanceProfileOutputResponse, AssociateIamInstanceProfileOutputError>) -> Void)
```

### associateInstanceEventWindow(input:completion:)

Associates one or more targets with an event window. Only one type of target (instance IDs, Dedicated Host IDs, or tags) can be specified with an event window. For more information, see [Define event windows for scheduled events](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/event-windows.html) in the Amazon EC2 User Guide.

``` swift
func associateInstanceEventWindow(input: AssociateInstanceEventWindowInput, completion: @escaping (ClientRuntime.SdkResult<AssociateInstanceEventWindowOutputResponse, AssociateInstanceEventWindowOutputError>) -> Void)
```

### associateRouteTable(input:completion:)

Associates a subnet in your VPC or an internet gateway or virtual private gateway attached to your VPC with a route table in your VPC. This association causes traffic from the subnet or gateway to be routed according to the routes in the route table. The action returns an association ID, which you need in order to disassociate the route table later. A route table can be associated with multiple subnets. For more information, see [Route tables](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html) in the Amazon Virtual Private Cloud User Guide.

``` swift
func associateRouteTable(input: AssociateRouteTableInput, completion: @escaping (ClientRuntime.SdkResult<AssociateRouteTableOutputResponse, AssociateRouteTableOutputError>) -> Void)
```

### associateSubnetCidrBlock(input:completion:)

Associates a CIDR block with your subnet. You can only associate a single IPv6 CIDR block with your subnet. An IPv6 CIDR block must have a prefix length of /64.

``` swift
func associateSubnetCidrBlock(input: AssociateSubnetCidrBlockInput, completion: @escaping (ClientRuntime.SdkResult<AssociateSubnetCidrBlockOutputResponse, AssociateSubnetCidrBlockOutputError>) -> Void)
```

### associateTransitGatewayMulticastDomain(input:completion:)

Associates the specified subnets and transit gateway attachments with the specified transit gateway multicast domain. The transit gateway attachment must be in the available state before you can add a resource. Use [DescribeTransitGatewayAttachments](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeTransitGatewayAttachments.html) to see the state of the attachment.

``` swift
func associateTransitGatewayMulticastDomain(input: AssociateTransitGatewayMulticastDomainInput, completion: @escaping (ClientRuntime.SdkResult<AssociateTransitGatewayMulticastDomainOutputResponse, AssociateTransitGatewayMulticastDomainOutputError>) -> Void)
```

### associateTransitGatewayRouteTable(input:completion:)

Associates the specified attachment with the specified transit gateway route table. You can associate only one route table with an attachment.

``` swift
func associateTransitGatewayRouteTable(input: AssociateTransitGatewayRouteTableInput, completion: @escaping (ClientRuntime.SdkResult<AssociateTransitGatewayRouteTableOutputResponse, AssociateTransitGatewayRouteTableOutputError>) -> Void)
```

### associateTrunkInterface(input:completion:)

This API action is currently in limited preview only. If you are interested in using this feature, contact your account manager. Associates a branch network interface with a trunk network interface. Before you create the association, run the [create-network-interface](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateNetworkInterface.html) command and set --interface-type to trunk. You must also create a network interface for each branch network interface that you want to associate with the trunk network interface.

``` swift
func associateTrunkInterface(input: AssociateTrunkInterfaceInput, completion: @escaping (ClientRuntime.SdkResult<AssociateTrunkInterfaceOutputResponse, AssociateTrunkInterfaceOutputError>) -> Void)
```

### associateVpcCidrBlock(input:completion:)

Associates a CIDR block with your VPC. You can associate a secondary IPv4 CIDR block, an Amazon-provided IPv6 CIDR block, or an IPv6 CIDR block from an IPv6 address pool that you provisioned through bring your own IP addresses ([BYOIP](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-byoip.html)). The IPv6 CIDR block size is fixed at /56. You must specify one of the following in the request: an IPv4 CIDR block, an IPv6 pool, or an Amazon-provided IPv6 CIDR block. For more information about associating CIDR blocks with your VPC and applicable restrictions, see [VPC and subnet sizing](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html#VPC_Sizing) in the Amazon Virtual Private Cloud User Guide.

``` swift
func associateVpcCidrBlock(input: AssociateVpcCidrBlockInput, completion: @escaping (ClientRuntime.SdkResult<AssociateVpcCidrBlockOutputResponse, AssociateVpcCidrBlockOutputError>) -> Void)
```

### attachClassicLinkVpc(input:completion:)

Links an EC2-Classic instance to a ClassicLink-enabled VPC through one or more of the VPC's security groups. You cannot link an EC2-Classic instance to more than one VPC at a time. You can only link an instance that's in the running state. An instance is automatically unlinked from a VPC when it's stopped - you can link it to the VPC again when you restart it. After you've linked an instance, you cannot change the VPC security groups that are associated with it. To change the security groups, you must first unlink the instance, and then link it again. Linking your instance to a VPC is sometimes referred to as attaching your instance.

``` swift
func attachClassicLinkVpc(input: AttachClassicLinkVpcInput, completion: @escaping (ClientRuntime.SdkResult<AttachClassicLinkVpcOutputResponse, AttachClassicLinkVpcOutputError>) -> Void)
```

### attachInternetGateway(input:completion:)

Attaches an internet gateway or a virtual private gateway to a VPC, enabling connectivity between the internet and the VPC. For more information about your VPC and internet gateway, see the [Amazon Virtual Private Cloud User Guide](https://docs.aws.amazon.com/vpc/latest/userguide/).

``` swift
func attachInternetGateway(input: AttachInternetGatewayInput, completion: @escaping (ClientRuntime.SdkResult<AttachInternetGatewayOutputResponse, AttachInternetGatewayOutputError>) -> Void)
```

### attachNetworkInterface(input:completion:)

Attaches a network interface to an instance.

``` swift
func attachNetworkInterface(input: AttachNetworkInterfaceInput, completion: @escaping (ClientRuntime.SdkResult<AttachNetworkInterfaceOutputResponse, AttachNetworkInterfaceOutputError>) -> Void)
```

### attachVolume(input:completion:)

Attaches an EBS volume to a running or stopped instance and exposes it to the instance with the specified device name. Encrypted EBS volumes must be attached to instances that support Amazon EBS encryption. For more information, see [Amazon EBS encryption](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html) in the Amazon Elastic Compute Cloud User Guide. After you attach an EBS volume, you must make it available. For more information, see [Make an EBS volume available for use](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-using-volumes.html). If a volume has an Amazon Web Services Marketplace product code:

``` swift
func attachVolume(input: AttachVolumeInput, completion: @escaping (ClientRuntime.SdkResult<AttachVolumeOutputResponse, AttachVolumeOutputError>) -> Void)
```

  - The volume can be attached only to a stopped instance.

  - Amazon Web Services Marketplace product codes are copied from the volume to the instance.

  - You must be subscribed to the product.

  - The instance type and operating system of the instance must support the product. For example, you can't detach a volume from a Windows instance and attach it to a Linux instance.

For more information, see [Attach an Amazon EBS volume to an instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-attaching-volume.html) in the Amazon Elastic Compute Cloud User Guide.

### attachVpnGateway(input:completion:)

Attaches a virtual private gateway to a VPC. You can attach one virtual private gateway to one VPC at a time. For more information, see [Amazon Web Services Site-to-Site VPN](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html) in the Amazon Web Services Site-to-Site VPN User Guide.

``` swift
func attachVpnGateway(input: AttachVpnGatewayInput, completion: @escaping (ClientRuntime.SdkResult<AttachVpnGatewayOutputResponse, AttachVpnGatewayOutputError>) -> Void)
```

### authorizeClientVpnIngress(input:completion:)

Adds an ingress authorization rule to a Client VPN endpoint. Ingress authorization rules act as firewall rules that grant access to networks. You must configure ingress authorization rules to enable clients to access resources in Amazon Web Services or on-premises networks.

``` swift
func authorizeClientVpnIngress(input: AuthorizeClientVpnIngressInput, completion: @escaping (ClientRuntime.SdkResult<AuthorizeClientVpnIngressOutputResponse, AuthorizeClientVpnIngressOutputError>) -> Void)
```

### authorizeSecurityGroupEgress(input:completion:)

\[VPC only\] Adds the specified outbound (egress) rules to a security group for use with a VPC. An outbound rule permits instances to send traffic to the specified IPv4 or IPv6 CIDR address ranges, or to the instances that are associated with the specified destination security groups. You specify a protocol for each rule (for example, TCP). For the TCP and UDP protocols, you must also specify the destination port or port range. For the ICMP protocol, you must also specify the ICMP type and code. You can use -1 for the type or code to mean all types or all codes. Rule changes are propagated to affected instances as quickly as possible. However, a small delay might occur. For information about VPC security group quotas, see [Amazon VPC quotas](https://docs.aws.amazon.com/vpc/latest/userguide/amazon-vpc-limits.html).

``` swift
func authorizeSecurityGroupEgress(input: AuthorizeSecurityGroupEgressInput, completion: @escaping (ClientRuntime.SdkResult<AuthorizeSecurityGroupEgressOutputResponse, AuthorizeSecurityGroupEgressOutputError>) -> Void)
```

### authorizeSecurityGroupIngress(input:completion:)

Adds the specified inbound (ingress) rules to a security group. An inbound rule permits instances to receive traffic from the specified IPv4 or IPv6 CIDR address range, or from the instances that are associated with the specified destination security groups. You specify a protocol for each rule (for example, TCP). For TCP and UDP, you must also specify the destination port or port range. For ICMP/ICMPv6, you must also specify the ICMP/ICMPv6 type and code. You can use -1 to mean all types or all codes. Rule changes are propagated to instances within the security group as quickly as possible. However, a small delay might occur. For more information about VPC security group quotas, see [Amazon VPC quotas](https://docs.aws.amazon.com/vpc/latest/userguide/amazon-vpc-limits.html).

``` swift
func authorizeSecurityGroupIngress(input: AuthorizeSecurityGroupIngressInput, completion: @escaping (ClientRuntime.SdkResult<AuthorizeSecurityGroupIngressOutputResponse, AuthorizeSecurityGroupIngressOutputError>) -> Void)
```

### bundleInstance(input:completion:)

Bundles an Amazon instance store-backed Windows instance. During bundling, only the root device volume (C:) is bundled. Data on other instance store volumes is not preserved. This action is not applicable for Linux/Unix instances or Windows instances that are backed by Amazon EBS.

``` swift
func bundleInstance(input: BundleInstanceInput, completion: @escaping (ClientRuntime.SdkResult<BundleInstanceOutputResponse, BundleInstanceOutputError>) -> Void)
```

### cancelBundleTask(input:completion:)

Cancels a bundling operation for an instance store-backed Windows instance.

``` swift
func cancelBundleTask(input: CancelBundleTaskInput, completion: @escaping (ClientRuntime.SdkResult<CancelBundleTaskOutputResponse, CancelBundleTaskOutputError>) -> Void)
```

### cancelCapacityReservation(input:completion:)

Cancels the specified Capacity Reservation, releases the reserved capacity, and changes the Capacity Reservation's state to cancelled. Instances running in the reserved capacity continue running until you stop them. Stopped instances that target the Capacity Reservation can no longer launch. Modify these instances to either target a different Capacity Reservation, launch On-Demand Instance capacity, or run in any open Capacity Reservation that has matching attributes and sufficient capacity.

``` swift
func cancelCapacityReservation(input: CancelCapacityReservationInput, completion: @escaping (ClientRuntime.SdkResult<CancelCapacityReservationOutputResponse, CancelCapacityReservationOutputError>) -> Void)
```

### cancelConversionTask(input:completion:)

Cancels an active conversion task. The task can be the import of an instance or volume. The action removes all artifacts of the conversion, including a partially uploaded volume or instance. If the conversion is complete or is in the process of transferring the final disk image, the command fails and returns an exception. For more information, see [Importing a Virtual Machine Using the Amazon EC2 CLI](https://docs.aws.amazon.com/AWSEC2/latest/CommandLineReference/ec2-cli-vmimport-export.html).

``` swift
func cancelConversionTask(input: CancelConversionTaskInput, completion: @escaping (ClientRuntime.SdkResult<CancelConversionTaskOutputResponse, CancelConversionTaskOutputError>) -> Void)
```

### cancelExportTask(input:completion:)

Cancels an active export task. The request removes all artifacts of the export, including any partially-created Amazon S3 objects. If the export task is complete or is in the process of transferring the final disk image, the command fails and returns an error.

``` swift
func cancelExportTask(input: CancelExportTaskInput, completion: @escaping (ClientRuntime.SdkResult<CancelExportTaskOutputResponse, CancelExportTaskOutputError>) -> Void)
```

### cancelImportTask(input:completion:)

Cancels an in-process import virtual machine or import snapshot task.

``` swift
func cancelImportTask(input: CancelImportTaskInput, completion: @escaping (ClientRuntime.SdkResult<CancelImportTaskOutputResponse, CancelImportTaskOutputError>) -> Void)
```

### cancelReservedInstancesListing(input:completion:)

Cancels the specified Reserved Instance listing in the Reserved Instance Marketplace. For more information, see [Reserved Instance Marketplace](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html) in the Amazon EC2 User Guide.

``` swift
func cancelReservedInstancesListing(input: CancelReservedInstancesListingInput, completion: @escaping (ClientRuntime.SdkResult<CancelReservedInstancesListingOutputResponse, CancelReservedInstancesListingOutputError>) -> Void)
```

### cancelSpotFleetRequests(input:completion:)

Cancels the specified Spot Fleet requests. After you cancel a Spot Fleet request, the Spot Fleet launches no new Spot Instances. You must specify whether the Spot Fleet should also terminate its Spot Instances. If you terminate the instances, the Spot Fleet request enters the cancelled\_terminating state. Otherwise, the Spot Fleet request enters the cancelled\_running state and the instances continue to run until they are interrupted or you terminate them manually.

``` swift
func cancelSpotFleetRequests(input: CancelSpotFleetRequestsInput, completion: @escaping (ClientRuntime.SdkResult<CancelSpotFleetRequestsOutputResponse, CancelSpotFleetRequestsOutputError>) -> Void)
```

### cancelSpotInstanceRequests(input:completion:)

Cancels one or more Spot Instance requests. Canceling a Spot Instance request does not terminate running Spot Instances associated with the request.

``` swift
func cancelSpotInstanceRequests(input: CancelSpotInstanceRequestsInput, completion: @escaping (ClientRuntime.SdkResult<CancelSpotInstanceRequestsOutputResponse, CancelSpotInstanceRequestsOutputError>) -> Void)
```

### confirmProductInstance(input:completion:)

Determines whether a product code is associated with an instance. This action can only be used by the owner of the product code. It is useful when a product code owner must verify whether another user's instance is eligible for support.

``` swift
func confirmProductInstance(input: ConfirmProductInstanceInput, completion: @escaping (ClientRuntime.SdkResult<ConfirmProductInstanceOutputResponse, ConfirmProductInstanceOutputError>) -> Void)
```

### copyFpgaImage(input:completion:)

Copies the specified Amazon FPGA Image (AFI) to the current Region.

``` swift
func copyFpgaImage(input: CopyFpgaImageInput, completion: @escaping (ClientRuntime.SdkResult<CopyFpgaImageOutputResponse, CopyFpgaImageOutputError>) -> Void)
```

### copyImage(input:completion:)

Initiates the copy of an AMI. You can copy an AMI from one Region to another, or from a Region to an Outpost. You can't copy an AMI from an Outpost to a Region, from one Outpost to another, or within the same Outpost. To copy an AMI to another partition, see [CreateStoreImageTask](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateStoreImageTask.html). To copy an AMI from one Region to another, specify the source Region using the

``` swift
func copyImage(input: CopyImageInput, completion: @escaping (ClientRuntime.SdkResult<CopyImageOutputResponse, CopyImageOutputError>) -> Void)
```

SourceRegion parameter, and specify the destination Region using its endpoint. Copies of encrypted backing snapshots for the AMI are encrypted. Copies of unencrypted backing snapshots remain unencrypted, unless you set Encrypted during the copy operation. You cannot create an unencrypted copy of an encrypted backing snapshot. To copy an AMI from a Region to an Outpost, specify the source Region using the

SourceRegion parameter, and specify the ARN of the destination Outpost using DestinationOutpostArn. Backing snapshots copied to an Outpost are encrypted by default using the default encryption key for the Region, or a different key that you specify in the request using KmsKeyId. Outposts do not support unencrypted snapshots. For more information, [ Amazon EBS local snapshots on Outposts](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/snapshots-outposts.html#ami) in the Amazon Elastic Compute Cloud User Guide. For more information about the prerequisites and limits when copying an AMI, see [Copying an AMI](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/CopyingAMIs.html) in the Amazon Elastic Compute Cloud User Guide.

### copySnapshot(input:completion:)

Copies a point-in-time snapshot of an EBS volume and stores it in Amazon S3. You can copy a snapshot within the same Region, from one Region to another, or from a Region to an Outpost. You can't copy a snapshot from an Outpost to a Region, from one Outpost to another, or within the same Outpost. You can use the snapshot to create EBS volumes or Amazon Machine Images (AMIs). When copying snapshots to a Region, copies of encrypted EBS snapshots remain encrypted. Copies of unencrypted snapshots remain unencrypted, unless you enable encryption for the snapshot copy operation. By default, encrypted snapshot copies use the default Key Management Service (KMS) KMS key; however, you can specify a different KMS key. To copy an encrypted snapshot that has been shared from another account, you must have permissions for the KMS key used to encrypt the snapshot. Snapshots copied to an Outpost are encrypted by default using the default encryption key for the Region, or a different key that you specify in the request using KmsKeyId. Outposts do not support unencrypted snapshots. For more information, [ Amazon EBS local snapshots on Outposts](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/snapshots-outposts.html#ami) in the Amazon Elastic Compute Cloud User Guide. Snapshots created by copying another snapshot have an arbitrary volume ID that should not be used for any purpose. For more information, see [Copy an Amazon EBS snapshot](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-copy-snapshot.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func copySnapshot(input: CopySnapshotInput, completion: @escaping (ClientRuntime.SdkResult<CopySnapshotOutputResponse, CopySnapshotOutputError>) -> Void)
```

### createCapacityReservation(input:completion:)

Creates a new Capacity Reservation with the specified attributes. Capacity Reservations enable you to reserve capacity for your Amazon EC2 instances in a specific Availability Zone for any duration. This gives you the flexibility to selectively add capacity reservations and still get the Regional RI discounts for that usage. By creating Capacity Reservations, you ensure that you always have access to Amazon EC2 capacity when you need it, for as long as you need it. For more information, see [Capacity Reservations](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-capacity-reservations.html) in the Amazon EC2 User Guide. Your request to create a Capacity Reservation could fail if Amazon EC2 does not have sufficient capacity to fulfill the request. If your request fails due to Amazon EC2 capacity constraints, either try again at a later time, try in a different Availability Zone, or request a smaller capacity reservation. If your application is flexible across instance types and sizes, try to create a Capacity Reservation with different instance attributes. Your request could also fail if the requested quantity exceeds your On-Demand Instance limit for the selected instance type. If your request fails due to limit constraints, increase your On-Demand Instance limit for the required instance type and try again. For more information about increasing your instance limits, see [Amazon EC2 Service Quotas](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-resource-limits.html) in the Amazon EC2 User Guide.

``` swift
func createCapacityReservation(input: CreateCapacityReservationInput, completion: @escaping (ClientRuntime.SdkResult<CreateCapacityReservationOutputResponse, CreateCapacityReservationOutputError>) -> Void)
```

### createCarrierGateway(input:completion:)

Creates a carrier gateway. For more information about carrier gateways, see [Carrier gateways](https://docs.aws.amazon.com/wavelength/latest/developerguide/how-wavelengths-work.html#wavelength-carrier-gateway) in the Amazon Web Services Wavelength Developer Guide.

``` swift
func createCarrierGateway(input: CreateCarrierGatewayInput, completion: @escaping (ClientRuntime.SdkResult<CreateCarrierGatewayOutputResponse, CreateCarrierGatewayOutputError>) -> Void)
```

### createClientVpnEndpoint(input:completion:)

Creates a Client VPN endpoint. A Client VPN endpoint is the resource you create and configure to enable and manage client VPN sessions. It is the destination endpoint at which all client VPN sessions are terminated.

``` swift
func createClientVpnEndpoint(input: CreateClientVpnEndpointInput, completion: @escaping (ClientRuntime.SdkResult<CreateClientVpnEndpointOutputResponse, CreateClientVpnEndpointOutputError>) -> Void)
```

### createClientVpnRoute(input:completion:)

Adds a route to a network to a Client VPN endpoint. Each Client VPN endpoint has a route table that describes the available destination network routes. Each route in the route table specifies the path for traﬃc to speciﬁc resources or networks.

``` swift
func createClientVpnRoute(input: CreateClientVpnRouteInput, completion: @escaping (ClientRuntime.SdkResult<CreateClientVpnRouteOutputResponse, CreateClientVpnRouteOutputError>) -> Void)
```

### createCustomerGateway(input:completion:)

Provides information to Amazon Web Services about your VPN customer gateway device. The customer gateway is the appliance at your end of the VPN connection. (The device on the Amazon Web Services side of the VPN connection is the virtual private gateway.) You must provide the internet-routable IP address of the customer gateway's external interface. The IP address must be static and can be behind a device performing network address translation (NAT). For devices that use Border Gateway Protocol (BGP), you can also provide the device's BGP Autonomous System Number (ASN). You can use an existing ASN assigned to your network. If you don't have an ASN already, you can use a private ASN (in the 64512 - 65534 range). Amazon EC2 supports all 4-byte ASN numbers in the range of 1 - 2147483647, with the exception of the following:

``` swift
func createCustomerGateway(input: CreateCustomerGatewayInput, completion: @escaping (ClientRuntime.SdkResult<CreateCustomerGatewayOutputResponse, CreateCustomerGatewayOutputError>) -> Void)
```

  - 7224 - reserved in the us-east-1 Region

  - 9059 - reserved in the eu-west-1 Region

  - 17943 - reserved in the ap-southeast-1 Region

  - 10124 - reserved in the ap-northeast-1 Region

For more information, see [Amazon Web Services Site-to-Site VPN](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html) in the Amazon Web Services Site-to-Site VPN User Guide. To create more than one customer gateway with the same VPN type, IP address, and BGP ASN, specify a unique device name for each customer gateway. Identical requests return information about the existing customer gateway and do not create new customer gateways.

### createDefaultSubnet(input:completion:)

Creates a default subnet with a size /20 IPv4 CIDR block in the specified Availability Zone in your default VPC. You can have only one default subnet per Availability Zone. For more information, see [Creating a default subnet](https://docs.aws.amazon.com/vpc/latest/userguide/default-vpc.html#create-default-subnet) in the Amazon Virtual Private Cloud User Guide.

``` swift
func createDefaultSubnet(input: CreateDefaultSubnetInput, completion: @escaping (ClientRuntime.SdkResult<CreateDefaultSubnetOutputResponse, CreateDefaultSubnetOutputError>) -> Void)
```

### createDefaultVpc(input:completion:)

Creates a default VPC with a size /16 IPv4 CIDR block and a default subnet in each Availability Zone. For more information about the components of a default VPC, see [Default VPC and default subnets](https://docs.aws.amazon.com/vpc/latest/userguide/default-vpc.html) in the Amazon Virtual Private Cloud User Guide. You cannot specify the components of the default VPC yourself. If you deleted your previous default VPC, you can create a default VPC. You cannot have more than one default VPC per Region. If your account supports EC2-Classic, you cannot use this action to create a default VPC in a Region that supports EC2-Classic. If you want a default VPC in a Region that supports EC2-Classic, see "I really want a default VPC for my existing EC2 account. Is that possible?" in the [Default VPCs FAQ](http://aws.amazon.com/vpc/faqs/#Default_VPCs).

``` swift
func createDefaultVpc(input: CreateDefaultVpcInput, completion: @escaping (ClientRuntime.SdkResult<CreateDefaultVpcOutputResponse, CreateDefaultVpcOutputError>) -> Void)
```

### createDhcpOptions(input:completion:)

Creates a set of DHCP options for your VPC. After creating the set, you must associate it with the VPC, causing all existing and new instances that you launch in the VPC to use this set of DHCP options. The following are the individual DHCP options you can specify. For more information about the options, see [RFC 2132](http://www.ietf.org/rfc/rfc2132.txt).

``` swift
func createDhcpOptions(input: CreateDhcpOptionsInput, completion: @escaping (ClientRuntime.SdkResult<CreateDhcpOptionsOutputResponse, CreateDhcpOptionsOutputError>) -> Void)
```

  - domain-name-servers - The IP addresses of up to four domain name servers, or AmazonProvidedDNS. The default DHCP option set specifies AmazonProvidedDNS. If specifying more than one domain name server, specify the IP addresses in a single parameter, separated by commas. To have your instance receive a custom DNS hostname as specified in domain-name, you must set domain-name-servers to a custom DNS server.

  - domain-name - If you're using AmazonProvidedDNS in us-east-1, specify ec2.internal. If you're using AmazonProvidedDNS in another Region, specify region.compute.internal (for example, ap-northeast-1.compute.internal). Otherwise, specify a domain name (for example, ExampleCompany.com). This value is used to complete unqualified DNS hostnames. Important: Some Linux operating systems accept multiple domain names separated by spaces. However, Windows and other Linux operating systems treat the value as a single domain, which results in unexpected behavior. If your DHCP options set is associated with a VPC that has instances with multiple operating systems, specify only one domain name.

  - ntp-servers - The IP addresses of up to four Network Time Protocol (NTP) servers.

  - netbios-name-servers - The IP addresses of up to four NetBIOS name servers.

  - netbios-node-type - The NetBIOS node type (1, 2, 4, or 8). We recommend that you specify 2 (broadcast and multicast are not currently supported). For more information about these node types, see [RFC 2132](http://www.ietf.org/rfc/rfc2132.txt).

Your VPC automatically starts out with a set of DHCP options that includes only a DNS server that we provide (AmazonProvidedDNS). If you create a set of options, and if your VPC has an internet gateway, make sure to set the domain-name-servers option either to AmazonProvidedDNS or to a domain name server of your choice. For more information, see [DHCP options sets](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_DHCP_Options.html) in the Amazon Virtual Private Cloud User Guide.

### createEgressOnlyInternetGateway(input:completion:)

\[IPv6 only\] Creates an egress-only internet gateway for your VPC. An egress-only internet gateway is used to enable outbound communication over IPv6 from instances in your VPC to the internet, and prevents hosts outside of your VPC from initiating an IPv6 connection with your instance.

``` swift
func createEgressOnlyInternetGateway(input: CreateEgressOnlyInternetGatewayInput, completion: @escaping (ClientRuntime.SdkResult<CreateEgressOnlyInternetGatewayOutputResponse, CreateEgressOnlyInternetGatewayOutputError>) -> Void)
```

### createFleet(input:completion:)

Launches an EC2 Fleet. You can create a single EC2 Fleet that includes multiple launch specifications that vary by instance type, AMI, Availability Zone, or subnet. For more information, see [Launching an EC2 Fleet](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-fleet.html) in the Amazon EC2 User Guide.

``` swift
func createFleet(input: CreateFleetInput, completion: @escaping (ClientRuntime.SdkResult<CreateFleetOutputResponse, CreateFleetOutputError>) -> Void)
```

### createFlowLogs(input:completion:)

Creates one or more flow logs to capture information about IP traffic for a specific network interface, subnet, or VPC. Flow log data for a monitored network interface is recorded as flow log records, which are log events consisting of fields that describe the traffic flow. For more information, see [Flow log records](https://docs.aws.amazon.com/vpc/latest/userguide/flow-logs.html#flow-log-records) in the Amazon Virtual Private Cloud User Guide. When publishing to CloudWatch Logs, flow log records are published to a log group, and each network interface has a unique log stream in the log group. When publishing to Amazon S3, flow log records for all of the monitored network interfaces are published to a single log file object that is stored in the specified bucket. For more information, see [VPC Flow Logs](https://docs.aws.amazon.com/vpc/latest/userguide/flow-logs.html) in the Amazon Virtual Private Cloud User Guide.

``` swift
func createFlowLogs(input: CreateFlowLogsInput, completion: @escaping (ClientRuntime.SdkResult<CreateFlowLogsOutputResponse, CreateFlowLogsOutputError>) -> Void)
```

### createFpgaImage(input:completion:)

Creates an Amazon FPGA Image (AFI) from the specified design checkpoint (DCP). The create operation is asynchronous. To verify that the AFI is ready for use, check the output logs. An AFI contains the FPGA bitstream that is ready to download to an FPGA. You can securely deploy an AFI on multiple FPGA-accelerated instances. For more information, see the [AWS FPGA Hardware Development Kit](https://github.com/aws/aws-fpga/).

``` swift
func createFpgaImage(input: CreateFpgaImageInput, completion: @escaping (ClientRuntime.SdkResult<CreateFpgaImageOutputResponse, CreateFpgaImageOutputError>) -> Void)
```

### createImage(input:completion:)

Creates an Amazon EBS-backed AMI from an Amazon EBS-backed instance that is either running or stopped. If you customized your instance with instance store volumes or Amazon EBS volumes in addition to the root device volume, the new AMI contains block device mapping information for those volumes. When you launch an instance from this new AMI, the instance automatically launches with those additional volumes. For more information, see [Creating Amazon EBS-Backed Linux AMIs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/creating-an-ami-ebs.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func createImage(input: CreateImageInput, completion: @escaping (ClientRuntime.SdkResult<CreateImageOutputResponse, CreateImageOutputError>) -> Void)
```

### createInstanceEventWindow(input:completion:)

Creates an event window in which scheduled events for the associated Amazon EC2 instances can run. You can define either a set of time ranges or a cron expression when creating the event window, but not both. All event window times are in UTC. You can create up to 200 event windows per Amazon Web Services Region. When you create the event window, targets (instance IDs, Dedicated Host IDs, or tags) are not yet associated with it. To ensure that the event window can be used, you must associate one or more targets with it by using the \[AssociateInstanceEventWindow\] API. Event windows are applicable only for scheduled events that stop, reboot, or terminate instances. Event windows are not applicable for:

``` swift
func createInstanceEventWindow(input: CreateInstanceEventWindowInput, completion: @escaping (ClientRuntime.SdkResult<CreateInstanceEventWindowOutputResponse, CreateInstanceEventWindowOutputError>) -> Void)
```

  - Expedited scheduled events and network maintenance events.

  - Unscheduled maintenance such as AutoRecovery and unplanned reboots.

For more information, see [Define event windows for scheduled events](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/event-windows.html) in the Amazon EC2 User Guide.

### createInstanceExportTask(input:completion:)

Exports a running or stopped instance to an Amazon S3 bucket. For information about the supported operating systems, image formats, and known limitations for the types of instances you can export, see [Exporting an instance as a VM Using VM Import/Export](https://docs.aws.amazon.com/vm-import/latest/userguide/vmexport.html) in the VM Import/Export User Guide.

``` swift
func createInstanceExportTask(input: CreateInstanceExportTaskInput, completion: @escaping (ClientRuntime.SdkResult<CreateInstanceExportTaskOutputResponse, CreateInstanceExportTaskOutputError>) -> Void)
```

### createInternetGateway(input:completion:)

Creates an internet gateway for use with a VPC. After creating the internet gateway, you attach it to a VPC using \[AttachInternetGateway\]. For more information about your VPC and internet gateway, see the [Amazon Virtual Private Cloud User Guide](https://docs.aws.amazon.com/vpc/latest/userguide/).

``` swift
func createInternetGateway(input: CreateInternetGatewayInput, completion: @escaping (ClientRuntime.SdkResult<CreateInternetGatewayOutputResponse, CreateInternetGatewayOutputError>) -> Void)
```

### createKeyPair(input:completion:)

Creates an ED25519 or 2048-bit RSA key pair with the specified name. Amazon EC2 stores the public key and displays the private key for you to save to a file. The private key is returned as an unencrypted PEM encoded PKCS\#1 private key. If a key with the specified name already exists, Amazon EC2 returns an error. The key pair returned to you is available only in the Amazon Web Services Region in which you create it. If you prefer, you can create your own key pair using a third-party tool and upload it to any Region using \[ImportKeyPair\]. You can have up to 5,000 key pairs per Amazon Web Services Region. For more information, see [Amazon EC2 key pairs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func createKeyPair(input: CreateKeyPairInput, completion: @escaping (ClientRuntime.SdkResult<CreateKeyPairOutputResponse, CreateKeyPairOutputError>) -> Void)
```

### createLaunchTemplate(input:completion:)

Creates a launch template. A launch template contains the parameters to launch an instance. When you launch an instance using \[RunInstances\], you can specify a launch template instead of providing the launch parameters in the request. For more information, see [Launching an instance from a launch template](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-launch-templates.html)in the Amazon Elastic Compute Cloud User Guide.

``` swift
func createLaunchTemplate(input: CreateLaunchTemplateInput, completion: @escaping (ClientRuntime.SdkResult<CreateLaunchTemplateOutputResponse, CreateLaunchTemplateOutputError>) -> Void)
```

### createLaunchTemplateVersion(input:completion:)

Creates a new version for a launch template. You can specify an existing version of launch template from which to base the new version. Launch template versions are numbered in the order in which they are created. You cannot specify, change, or replace the numbering of launch template versions. For more information, see [Managing launch template versions](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-launch-templates.html#manage-launch-template-versions)in the Amazon Elastic Compute Cloud User Guide.

``` swift
func createLaunchTemplateVersion(input: CreateLaunchTemplateVersionInput, completion: @escaping (ClientRuntime.SdkResult<CreateLaunchTemplateVersionOutputResponse, CreateLaunchTemplateVersionOutputError>) -> Void)
```

### createLocalGatewayRoute(input:completion:)

Creates a static route for the specified local gateway route table.

``` swift
func createLocalGatewayRoute(input: CreateLocalGatewayRouteInput, completion: @escaping (ClientRuntime.SdkResult<CreateLocalGatewayRouteOutputResponse, CreateLocalGatewayRouteOutputError>) -> Void)
```

### createLocalGatewayRouteTableVpcAssociation(input:completion:)

Associates the specified VPC with the specified local gateway route table.

``` swift
func createLocalGatewayRouteTableVpcAssociation(input: CreateLocalGatewayRouteTableVpcAssociationInput, completion: @escaping (ClientRuntime.SdkResult<CreateLocalGatewayRouteTableVpcAssociationOutputResponse, CreateLocalGatewayRouteTableVpcAssociationOutputError>) -> Void)
```

### createManagedPrefixList(input:completion:)

Creates a managed prefix list. You can specify one or more entries for the prefix list. Each entry consists of a CIDR block and an optional description.

``` swift
func createManagedPrefixList(input: CreateManagedPrefixListInput, completion: @escaping (ClientRuntime.SdkResult<CreateManagedPrefixListOutputResponse, CreateManagedPrefixListOutputError>) -> Void)
```

### createNatGateway(input:completion:)

Creates a NAT gateway in the specified subnet. This action creates a network interface in the specified subnet with a private IP address from the IP address range of the subnet. You can create either a public NAT gateway or a private NAT gateway. With a public NAT gateway, internet-bound traffic from a private subnet can be routed to the NAT gateway, so that instances in a private subnet can connect to the internet. With a private NAT gateway, private communication is routed across VPCs and on-premises networks through a transit gateway or virtual private gateway. Common use cases include running large workloads behind a small pool of allowlisted IPv4 addresses, preserving private IPv4 addresses, and communicating between overlapping networks. For more information, see [NAT gateways](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html) in the Amazon Virtual Private Cloud User Guide.

``` swift
func createNatGateway(input: CreateNatGatewayInput, completion: @escaping (ClientRuntime.SdkResult<CreateNatGatewayOutputResponse, CreateNatGatewayOutputError>) -> Void)
```

### createNetworkAcl(input:completion:)

Creates a network ACL in a VPC. Network ACLs provide an optional layer of security (in addition to security groups) for the instances in your VPC. For more information, see [Network ACLs](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_ACLs.html) in the Amazon Virtual Private Cloud User Guide.

``` swift
func createNetworkAcl(input: CreateNetworkAclInput, completion: @escaping (ClientRuntime.SdkResult<CreateNetworkAclOutputResponse, CreateNetworkAclOutputError>) -> Void)
```

### createNetworkAclEntry(input:completion:)

Creates an entry (a rule) in a network ACL with the specified rule number. Each network ACL has a set of numbered ingress rules and a separate set of numbered egress rules. When determining whether a packet should be allowed in or out of a subnet associated with the ACL, we process the entries in the ACL according to the rule numbers, in ascending order. Each network ACL has a set of ingress rules and a separate set of egress rules. We recommend that you leave room between the rule numbers (for example, 100, 110, 120, ...), and not number them one right after the other (for example, 101, 102, 103, ...). This makes it easier to add a rule between existing ones without having to renumber the rules. After you add an entry, you can't modify it; you must either replace it, or create an entry and delete the old one. For more information about network ACLs, see [Network ACLs](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_ACLs.html) in the Amazon Virtual Private Cloud User Guide.

``` swift
func createNetworkAclEntry(input: CreateNetworkAclEntryInput, completion: @escaping (ClientRuntime.SdkResult<CreateNetworkAclEntryOutputResponse, CreateNetworkAclEntryOutputError>) -> Void)
```

### createNetworkInsightsPath(input:completion:)

Creates a path to analyze for reachability. Reachability Analyzer enables you to analyze and debug network reachability between two resources in your virtual private cloud (VPC). For more information, see [What is Reachability Analyzer](https://docs.aws.amazon.com/vpc/latest/reachability/).

``` swift
func createNetworkInsightsPath(input: CreateNetworkInsightsPathInput, completion: @escaping (ClientRuntime.SdkResult<CreateNetworkInsightsPathOutputResponse, CreateNetworkInsightsPathOutputError>) -> Void)
```

### createNetworkInterface(input:completion:)

Creates a network interface in the specified subnet. For more information about network interfaces, see [Elastic Network Interfaces](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html) in the Amazon Virtual Private Cloud User Guide.

``` swift
func createNetworkInterface(input: CreateNetworkInterfaceInput, completion: @escaping (ClientRuntime.SdkResult<CreateNetworkInterfaceOutputResponse, CreateNetworkInterfaceOutputError>) -> Void)
```

### createNetworkInterfacePermission(input:completion:)

Grants an Amazon Web Services-authorized account permission to attach the specified network interface to an instance in their account. You can grant permission to a single Amazon Web Services account only, and only one account at a time.

``` swift
func createNetworkInterfacePermission(input: CreateNetworkInterfacePermissionInput, completion: @escaping (ClientRuntime.SdkResult<CreateNetworkInterfacePermissionOutputResponse, CreateNetworkInterfacePermissionOutputError>) -> Void)
```

### createPlacementGroup(input:completion:)

Creates a placement group in which to launch instances. The strategy of the placement group determines how the instances are organized within the group. A cluster placement group is a logical grouping of instances within a single Availability Zone that benefit from low network latency, high network throughput. A spread placement group places instances on distinct hardware. A partition placement group places groups of instances in different partitions, where instances in one partition do not share the same hardware with instances in another partition. For more information, see [Placement groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html) in the Amazon EC2 User Guide.

``` swift
func createPlacementGroup(input: CreatePlacementGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreatePlacementGroupOutputResponse, CreatePlacementGroupOutputError>) -> Void)
```

### createReplaceRootVolumeTask(input:completion:)

Creates a root volume replacement task for an Amazon EC2 instance. The root volume can either be restored to its initial launch state, or it can be restored using a specific snapshot. For more information, see [Replace a root volume](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-restoring-volume.html#replace-root) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func createReplaceRootVolumeTask(input: CreateReplaceRootVolumeTaskInput, completion: @escaping (ClientRuntime.SdkResult<CreateReplaceRootVolumeTaskOutputResponse, CreateReplaceRootVolumeTaskOutputError>) -> Void)
```

### createReservedInstancesListing(input:completion:)

Creates a listing for Amazon EC2 Standard Reserved Instances to be sold in the Reserved Instance Marketplace. You can submit one Standard Reserved Instance listing at a time. To get a list of your Standard Reserved Instances, you can use the \[DescribeReservedInstances\] operation. Only Standard Reserved Instances can be sold in the Reserved Instance Marketplace. Convertible Reserved Instances cannot be sold. The Reserved Instance Marketplace matches sellers who want to resell Standard Reserved Instance capacity that they no longer need with buyers who want to purchase additional capacity. Reserved Instances bought and sold through the Reserved Instance Marketplace work like any other Reserved Instances. To sell your Standard Reserved Instances, you must first register as a seller in the Reserved Instance Marketplace. After completing the registration process, you can create a Reserved Instance Marketplace listing of some or all of your Standard Reserved Instances, and specify the upfront price to receive for them. Your Standard Reserved Instance listings then become available for purchase. To view the details of your Standard Reserved Instance listing, you can use the \[DescribeReservedInstancesListings\] operation. For more information, see [Reserved Instance Marketplace](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html) in the Amazon EC2 User Guide.

``` swift
func createReservedInstancesListing(input: CreateReservedInstancesListingInput, completion: @escaping (ClientRuntime.SdkResult<CreateReservedInstancesListingOutputResponse, CreateReservedInstancesListingOutputError>) -> Void)
```

### createRestoreImageTask(input:completion:)

Starts a task that restores an AMI from an Amazon S3 object that was previously created by using [CreateStoreImageTask](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateStoreImageTask.html). To use this API, you must have the required permissions. For more information, see [Permissions for storing and restoring AMIs using Amazon S3](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ami-store-restore.html#ami-s3-permissions) in the Amazon Elastic Compute Cloud User Guide. For more information, see [Store and restore an AMI using Amazon S3](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ami-store-restore.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func createRestoreImageTask(input: CreateRestoreImageTaskInput, completion: @escaping (ClientRuntime.SdkResult<CreateRestoreImageTaskOutputResponse, CreateRestoreImageTaskOutputError>) -> Void)
```

### createRoute(input:completion:)

Creates a route in a route table within a VPC. You must specify one of the following targets: internet gateway or virtual private gateway, NAT instance, NAT gateway, VPC peering connection, network interface, egress-only internet gateway, or transit gateway. When determining how to route traffic, we use the route with the most specific match. For example, traffic is destined for the IPv4 address 192.0.2.3, and the route table includes the following two IPv4 routes:

``` swift
func createRoute(input: CreateRouteInput, completion: @escaping (ClientRuntime.SdkResult<CreateRouteOutputResponse, CreateRouteOutputError>) -> Void)
```

  - 192.0.2.0/24 (goes to some target A)

  - 192.0.2.0/28 (goes to some target B)

Both routes apply to the traffic destined for 192.0.2.3. However, the second route in the list covers a smaller number of IP addresses and is therefore more specific, so we use that route to determine where to target the traffic. For more information about route tables, see [Route tables](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html) in the Amazon Virtual Private Cloud User Guide.

### createRouteTable(input:completion:)

Creates a route table for the specified VPC. After you create a route table, you can add routes and associate the table with a subnet. For more information, see [Route tables](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html) in the Amazon Virtual Private Cloud User Guide.

``` swift
func createRouteTable(input: CreateRouteTableInput, completion: @escaping (ClientRuntime.SdkResult<CreateRouteTableOutputResponse, CreateRouteTableOutputError>) -> Void)
```

### createSecurityGroup(input:completion:)

Creates a security group. A security group acts as a virtual firewall for your instance to control inbound and outbound traffic. For more information, see [Amazon EC2 security groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html) in the Amazon Elastic Compute Cloud User Guide and [Security groups for your VPC](https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html) in the Amazon Virtual Private Cloud User Guide. When you create a security group, you specify a friendly name of your choice. You can have a security group for use in EC2-Classic with the same name as a security group for use in a VPC. However, you can't have two security groups for use in EC2-Classic with the same name or two security groups for use in a VPC with the same name. You have a default security group for use in EC2-Classic and a default security group for use in your VPC. If you don't specify a security group when you launch an instance, the instance is launched into the appropriate default security group. A default security group includes a default rule that grants instances unrestricted network access to each other. You can add or remove rules from your security groups using \[AuthorizeSecurityGroupIngress\], \[AuthorizeSecurityGroupEgress\], \[RevokeSecurityGroupIngress\], and \[RevokeSecurityGroupEgress\]. For more information about VPC security group limits, see [Amazon VPC Limits](https://docs.aws.amazon.com/vpc/latest/userguide/amazon-vpc-limits.html).

``` swift
func createSecurityGroup(input: CreateSecurityGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateSecurityGroupOutputResponse, CreateSecurityGroupOutputError>) -> Void)
```

### createSnapshot(input:completion:)

Creates a snapshot of an EBS volume and stores it in Amazon S3. You can use snapshots for backups, to make copies of EBS volumes, and to save data before shutting down an instance. You can create snapshots of volumes in a Region and volumes on an Outpost. If you create a snapshot of a volume in a Region, the snapshot must be stored in the same Region as the volume. If you create a snapshot of a volume on an Outpost, the snapshot can be stored on the same Outpost as the volume, or in the Region for that Outpost. When a snapshot is created, any Amazon Web Services Marketplace product codes that are associated with the source volume are propagated to the snapshot. You can take a snapshot of an attached volume that is in use. However, snapshots only capture data that has been written to your Amazon EBS volume at the time the snapshot command is issued; this might exclude any data that has been cached by any applications or the operating system. If you can pause any file systems on the volume long enough to take a snapshot, your snapshot should be complete. However, if you cannot pause all file writes to the volume, you should unmount the volume from within the instance, issue the snapshot command, and then remount the volume to ensure a consistent and complete snapshot. You may remount and use your volume while the snapshot status is pending. To create a snapshot for Amazon EBS volumes that serve as root devices, you should stop the instance before taking the snapshot. Snapshots that are taken from encrypted volumes are automatically encrypted. Volumes that are created from encrypted snapshots are also automatically encrypted. Your encrypted volumes and any associated snapshots always remain protected. You can tag your snapshots during creation. For more information, see [Tag your Amazon EC2 resources](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html) in the Amazon Elastic Compute Cloud User Guide. For more information, see [Amazon Elastic Block Store](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AmazonEBS.html) and [Amazon EBS encryption](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func createSnapshot(input: CreateSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<CreateSnapshotOutputResponse, CreateSnapshotOutputError>) -> Void)
```

### createSnapshots(input:completion:)

Creates crash-consistent snapshots of multiple EBS volumes and stores the data in S3. Volumes are chosen by specifying an instance. Any attached volumes will produce one snapshot each that is crash-consistent across the instance. Boot volumes can be excluded by changing the parameters. You can create multi-volume snapshots of instances in a Region and instances on an Outpost. If you create snapshots from an instance in a Region, the snapshots must be stored in the same Region as the instance. If you create snapshots from an instance on an Outpost, the snapshots can be stored on the same Outpost as the instance, or in the Region for that Outpost.

``` swift
func createSnapshots(input: CreateSnapshotsInput, completion: @escaping (ClientRuntime.SdkResult<CreateSnapshotsOutputResponse, CreateSnapshotsOutputError>) -> Void)
```

### createSpotDatafeedSubscription(input:completion:)

Creates a data feed for Spot Instances, enabling you to view Spot Instance usage logs. You can create one data feed per Amazon Web Services account. For more information, see [Spot Instance data feed](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-data-feeds.html) in the Amazon EC2 User Guide for Linux Instances.

``` swift
func createSpotDatafeedSubscription(input: CreateSpotDatafeedSubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<CreateSpotDatafeedSubscriptionOutputResponse, CreateSpotDatafeedSubscriptionOutputError>) -> Void)
```

### createStoreImageTask(input:completion:)

Stores an AMI as a single object in an Amazon S3 bucket. To use this API, you must have the required permissions. For more information, see [Permissions for storing and restoring AMIs using Amazon S3](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ami-store-restore.html#ami-s3-permissions) in the Amazon Elastic Compute Cloud User Guide. For more information, see [Store and restore an AMI using Amazon S3](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ami-store-restore.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func createStoreImageTask(input: CreateStoreImageTaskInput, completion: @escaping (ClientRuntime.SdkResult<CreateStoreImageTaskOutputResponse, CreateStoreImageTaskOutputError>) -> Void)
```

### createSubnet(input:completion:)

Creates a subnet in a specified VPC. You must specify an IPv4 CIDR block for the subnet. After you create a subnet, you can't change its CIDR block. The allowed block size is between a /16 netmask (65,536 IP addresses) and /28 netmask (16 IP addresses). The CIDR block must not overlap with the CIDR block of an existing subnet in the VPC. If you've associated an IPv6 CIDR block with your VPC, you can create a subnet with an IPv6 CIDR block that uses a /64 prefix length. Amazon Web Services reserves both the first four and the last IPv4 address in each subnet's CIDR block. They're not available for use. If you add more than one subnet to a VPC, they're set up in a star topology with a logical router in the middle. When you stop an instance in a subnet, it retains its private IPv4 address. It's therefore possible to have a subnet with no running instances (they're all stopped), but no remaining IP addresses available. For more information about subnets, see [Your VPC and subnets](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html) in the Amazon Virtual Private Cloud User Guide.

``` swift
func createSubnet(input: CreateSubnetInput, completion: @escaping (ClientRuntime.SdkResult<CreateSubnetOutputResponse, CreateSubnetOutputError>) -> Void)
```

### createSubnetCidrReservation(input:completion:)

Creates a subnet CIDR reservation. For information about subnet CIDR reservations, see [Subnet CIDR reservations](https://docs.aws.amazon.com/vpc/latest/userguide/subnet-cidr-reservation.html) in the Amazon Virtual Private Cloud User Guide.

``` swift
func createSubnetCidrReservation(input: CreateSubnetCidrReservationInput, completion: @escaping (ClientRuntime.SdkResult<CreateSubnetCidrReservationOutputResponse, CreateSubnetCidrReservationOutputError>) -> Void)
```

### createTags(input:completion:)

Adds or overwrites only the specified tags for the specified Amazon EC2 resource or resources. When you specify an existing tag key, the value is overwritten with the new value. Each resource can have a maximum of 50 tags. Each tag consists of a key and optional value. Tag keys must be unique per resource. For more information about tags, see [Tagging Your Resources](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html) in the Amazon Elastic Compute Cloud User Guide. For more information about creating IAM policies that control users' access to resources based on tags, see [Supported Resource-Level Permissions for Amazon EC2 API Actions](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-supported-iam-actions-resources.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func createTags(input: CreateTagsInput, completion: @escaping (ClientRuntime.SdkResult<CreateTagsOutputResponse, CreateTagsOutputError>) -> Void)
```

### createTrafficMirrorFilter(input:completion:)

Creates a Traffic Mirror filter. A Traffic Mirror filter is a set of rules that defines the traffic to mirror. By default, no traffic is mirrored. To mirror traffic, use [CreateTrafficMirrorFilterRule](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateTrafficMirrorFilterRule.htm) to add Traffic Mirror rules to the filter. The rules you add define what traffic gets mirrored. You can also use [ModifyTrafficMirrorFilterNetworkServices](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_ModifyTrafficMirrorFilterNetworkServices.html) to mirror supported network services.

``` swift
func createTrafficMirrorFilter(input: CreateTrafficMirrorFilterInput, completion: @escaping (ClientRuntime.SdkResult<CreateTrafficMirrorFilterOutputResponse, CreateTrafficMirrorFilterOutputError>) -> Void)
```

### createTrafficMirrorFilterRule(input:completion:)

Creates a Traffic Mirror filter rule. A Traffic Mirror rule defines the Traffic Mirror source traffic to mirror. You need the Traffic Mirror filter ID when you create the rule.

``` swift
func createTrafficMirrorFilterRule(input: CreateTrafficMirrorFilterRuleInput, completion: @escaping (ClientRuntime.SdkResult<CreateTrafficMirrorFilterRuleOutputResponse, CreateTrafficMirrorFilterRuleOutputError>) -> Void)
```

### createTrafficMirrorSession(input:completion:)

Creates a Traffic Mirror session. A Traffic Mirror session actively copies packets from a Traffic Mirror source to a Traffic Mirror target. Create a filter, and then assign it to the session to define a subset of the traffic to mirror, for example all TCP traffic. The Traffic Mirror source and the Traffic Mirror target (monitoring appliances) can be in the same VPC, or in a different VPC connected via VPC peering or a transit gateway. By default, no traffic is mirrored. Use [CreateTrafficMirrorFilter](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateTrafficMirrorFilter.htm) to create filter rules that specify the traffic to mirror.

``` swift
func createTrafficMirrorSession(input: CreateTrafficMirrorSessionInput, completion: @escaping (ClientRuntime.SdkResult<CreateTrafficMirrorSessionOutputResponse, CreateTrafficMirrorSessionOutputError>) -> Void)
```

### createTrafficMirrorTarget(input:completion:)

Creates a target for your Traffic Mirror session. A Traffic Mirror target is the destination for mirrored traffic. The Traffic Mirror source and the Traffic Mirror target (monitoring appliances) can be in the same VPC, or in different VPCs connected via VPC peering or a transit gateway. A Traffic Mirror target can be a network interface, or a Network Load Balancer. To use the target in a Traffic Mirror session, use [CreateTrafficMirrorSession](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateTrafficMirrorSession.htm).

``` swift
func createTrafficMirrorTarget(input: CreateTrafficMirrorTargetInput, completion: @escaping (ClientRuntime.SdkResult<CreateTrafficMirrorTargetOutputResponse, CreateTrafficMirrorTargetOutputError>) -> Void)
```

### createTransitGateway(input:completion:)

Creates a transit gateway. You can use a transit gateway to interconnect your virtual private clouds (VPC) and on-premises networks. After the transit gateway enters the available state, you can attach your VPCs and VPN connections to the transit gateway. To attach your VPCs, use \[CreateTransitGatewayVpcAttachment\]. To attach a VPN connection, use \[CreateCustomerGateway\] to create a customer gateway and specify the ID of the customer gateway and the ID of the transit gateway in a call to \[CreateVpnConnection\]. When you create a transit gateway, we create a default transit gateway route table and use it as the default association route table and the default propagation route table. You can use \[CreateTransitGatewayRouteTable\] to create additional transit gateway route tables. If you disable automatic route propagation, we do not create a default transit gateway route table. You can use \[EnableTransitGatewayRouteTablePropagation\] to propagate routes from a resource attachment to a transit gateway route table. If you disable automatic associations, you can use \[AssociateTransitGatewayRouteTable\] to associate a resource attachment with a transit gateway route table.

``` swift
func createTransitGateway(input: CreateTransitGatewayInput, completion: @escaping (ClientRuntime.SdkResult<CreateTransitGatewayOutputResponse, CreateTransitGatewayOutputError>) -> Void)
```

### createTransitGatewayConnect(input:completion:)

Creates a Connect attachment from a specified transit gateway attachment. A Connect attachment is a GRE-based tunnel attachment that you can use to establish a connection between a transit gateway and an appliance. A Connect attachment uses an existing VPC or Amazon Web Services Direct Connect attachment as the underlying transport mechanism.

``` swift
func createTransitGatewayConnect(input: CreateTransitGatewayConnectInput, completion: @escaping (ClientRuntime.SdkResult<CreateTransitGatewayConnectOutputResponse, CreateTransitGatewayConnectOutputError>) -> Void)
```

### createTransitGatewayConnectPeer(input:completion:)

Creates a Connect peer for a specified transit gateway Connect attachment between a transit gateway and an appliance. The peer address and transit gateway address must be the same IP address family (IPv4 or IPv6). For more information, see [Connect peers](https://docs.aws.amazon.com/vpc/latest/tgw/tgw-connect.html#tgw-connect-peer) in the Transit Gateways Guide.

``` swift
func createTransitGatewayConnectPeer(input: CreateTransitGatewayConnectPeerInput, completion: @escaping (ClientRuntime.SdkResult<CreateTransitGatewayConnectPeerOutputResponse, CreateTransitGatewayConnectPeerOutputError>) -> Void)
```

### createTransitGatewayMulticastDomain(input:completion:)

Creates a multicast domain using the specified transit gateway. The transit gateway must be in the available state before you create a domain. Use [DescribeTransitGateways](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeTransitGateways.html) to see the state of transit gateway.

``` swift
func createTransitGatewayMulticastDomain(input: CreateTransitGatewayMulticastDomainInput, completion: @escaping (ClientRuntime.SdkResult<CreateTransitGatewayMulticastDomainOutputResponse, CreateTransitGatewayMulticastDomainOutputError>) -> Void)
```

### createTransitGatewayPeeringAttachment(input:completion:)

Requests a transit gateway peering attachment between the specified transit gateway (requester) and a peer transit gateway (accepter). The transit gateways must be in different Regions. The peer transit gateway can be in your account or a different Amazon Web Services account. After you create the peering attachment, the owner of the accepter transit gateway must accept the attachment request.

``` swift
func createTransitGatewayPeeringAttachment(input: CreateTransitGatewayPeeringAttachmentInput, completion: @escaping (ClientRuntime.SdkResult<CreateTransitGatewayPeeringAttachmentOutputResponse, CreateTransitGatewayPeeringAttachmentOutputError>) -> Void)
```

### createTransitGatewayPrefixListReference(input:completion:)

Creates a reference (route) to a prefix list in a specified transit gateway route table.

``` swift
func createTransitGatewayPrefixListReference(input: CreateTransitGatewayPrefixListReferenceInput, completion: @escaping (ClientRuntime.SdkResult<CreateTransitGatewayPrefixListReferenceOutputResponse, CreateTransitGatewayPrefixListReferenceOutputError>) -> Void)
```

### createTransitGatewayRoute(input:completion:)

Creates a static route for the specified transit gateway route table.

``` swift
func createTransitGatewayRoute(input: CreateTransitGatewayRouteInput, completion: @escaping (ClientRuntime.SdkResult<CreateTransitGatewayRouteOutputResponse, CreateTransitGatewayRouteOutputError>) -> Void)
```

### createTransitGatewayRouteTable(input:completion:)

Creates a route table for the specified transit gateway.

``` swift
func createTransitGatewayRouteTable(input: CreateTransitGatewayRouteTableInput, completion: @escaping (ClientRuntime.SdkResult<CreateTransitGatewayRouteTableOutputResponse, CreateTransitGatewayRouteTableOutputError>) -> Void)
```

### createTransitGatewayVpcAttachment(input:completion:)

Attaches the specified VPC to the specified transit gateway. If you attach a VPC with a CIDR range that overlaps the CIDR range of a VPC that is already attached, the new VPC CIDR range is not propagated to the default propagation route table. To send VPC traffic to an attached transit gateway, add a route to the VPC route table using \[CreateRoute\].

``` swift
func createTransitGatewayVpcAttachment(input: CreateTransitGatewayVpcAttachmentInput, completion: @escaping (ClientRuntime.SdkResult<CreateTransitGatewayVpcAttachmentOutputResponse, CreateTransitGatewayVpcAttachmentOutputError>) -> Void)
```

### createVolume(input:completion:)

Creates an EBS volume that can be attached to an instance in the same Availability Zone. You can create a new empty volume or restore a volume from an EBS snapshot. Any Amazon Web Services Marketplace product codes from the snapshot are propagated to the volume. You can create encrypted volumes. Encrypted volumes must be attached to instances that support Amazon EBS encryption. Volumes that are created from encrypted snapshots are also automatically encrypted. For more information, see [Amazon EBS encryption](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html) in the Amazon Elastic Compute Cloud User Guide. You can tag your volumes during creation. For more information, see [Tag your Amazon EC2 resources](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html) in the Amazon Elastic Compute Cloud User Guide. For more information, see [Create an Amazon EBS volume](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-creating-volume.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func createVolume(input: CreateVolumeInput, completion: @escaping (ClientRuntime.SdkResult<CreateVolumeOutputResponse, CreateVolumeOutputError>) -> Void)
```

### createVpc(input:completion:)

Creates a VPC with the specified IPv4 CIDR block. The smallest VPC you can create uses a /28 netmask (16 IPv4 addresses), and the largest uses a /16 netmask (65,536 IPv4 addresses). For more information about how large to make your VPC, see [Your VPC and subnets](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html) in the Amazon Virtual Private Cloud User Guide. You can optionally request an IPv6 CIDR block for the VPC. You can request an Amazon-provided IPv6 CIDR block from Amazon's pool of IPv6 addresses, or an IPv6 CIDR block from an IPv6 address pool that you provisioned through bring your own IP addresses ([BYOIP](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-byoip.html)). By default, each instance you launch in the VPC has the default DHCP options, which include only a default DNS server that we provide (AmazonProvidedDNS). For more information, see [DHCP options sets](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_DHCP_Options.html) in the Amazon Virtual Private Cloud User Guide. You can specify the instance tenancy value for the VPC when you create it. You can't change this value for the VPC after you create it. For more information, see [Dedicated Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-instance.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func createVpc(input: CreateVpcInput, completion: @escaping (ClientRuntime.SdkResult<CreateVpcOutputResponse, CreateVpcOutputError>) -> Void)
```

### createVpcEndpoint(input:completion:)

Creates a VPC endpoint for a specified service. An endpoint enables you to create a private connection between your VPC and the service. The service may be provided by AWS, an AWS Marketplace Partner, or another AWS account. For more information, see [VPC Endpoints](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-endpoints.html) in the Amazon Virtual Private Cloud User Guide. A gateway endpoint serves as a target for a route in your route table for traffic destined for the AWS service. You can specify an endpoint policy to attach to the endpoint, which will control access to the service from your VPC. You can also specify the VPC route tables that use the endpoint. An interface endpoint is a network interface in your subnet that serves as an endpoint for communicating with the specified service. You can specify the subnets in which to create an endpoint, and the security groups to associate with the endpoint network interface. A GatewayLoadBalancer endpoint is a network interface in your subnet that serves an endpoint for communicating with a Gateway Load Balancer that you've configured as a VPC endpoint service. Use \[DescribeVpcEndpointServices\] to get a list of supported services.

``` swift
func createVpcEndpoint(input: CreateVpcEndpointInput, completion: @escaping (ClientRuntime.SdkResult<CreateVpcEndpointOutputResponse, CreateVpcEndpointOutputError>) -> Void)
```

### createVpcEndpointConnectionNotification(input:completion:)

Creates a connection notification for a specified VPC endpoint or VPC endpoint service. A connection notification notifies you of specific endpoint events. You must create an SNS topic to receive notifications. For more information, see [Create a Topic](https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html) in the Amazon Simple Notification Service Developer Guide. You can create a connection notification for interface endpoints only.

``` swift
func createVpcEndpointConnectionNotification(input: CreateVpcEndpointConnectionNotificationInput, completion: @escaping (ClientRuntime.SdkResult<CreateVpcEndpointConnectionNotificationOutputResponse, CreateVpcEndpointConnectionNotificationOutputError>) -> Void)
```

### createVpcEndpointServiceConfiguration(input:completion:)

Creates a VPC endpoint service configuration to which service consumers (AWS accounts, IAM users, and IAM roles) can connect. To create an endpoint service configuration, you must first create one of the following for your service:

``` swift
func createVpcEndpointServiceConfiguration(input: CreateVpcEndpointServiceConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<CreateVpcEndpointServiceConfigurationOutputResponse, CreateVpcEndpointServiceConfigurationOutputError>) -> Void)
```

  - A [Network Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/introduction.html). Service consumers connect to your service using an interface endpoint.

  - A [Gateway Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/introduction.html). Service consumers connect to your service using a Gateway Load Balancer endpoint.

For more information, see [VPC Endpoint Services](https://docs.aws.amazon.com/vpc/latest/userguide/endpoint-service.html) in the Amazon Virtual Private Cloud User Guide. If you set the private DNS name, you must prove that you own the private DNS domain name. For more information, see [VPC Endpoint Service Private DNS Name Verification](https://docs.aws.amazon.com/vpc/latest/userguide/endpoint-services-dns-validation.html) in the Amazon Virtual Private Cloud User Guide.

### createVpcPeeringConnection(input:completion:)

Requests a VPC peering connection between two VPCs: a requester VPC that you own and an accepter VPC with which to create the connection. The accepter VPC can belong to another Amazon Web Services account and can be in a different Region to the requester VPC. The requester VPC and accepter VPC cannot have overlapping CIDR blocks. Limitations and rules apply to a VPC peering connection. For more information, see the [limitations](https://docs.aws.amazon.com/vpc/latest/peering/vpc-peering-basics.html#vpc-peering-limitations) section in the VPC Peering Guide. The owner of the accepter VPC must accept the peering request to activate the peering connection. The VPC peering connection request expires after 7 days, after which it cannot be accepted or rejected. If you create a VPC peering connection request between VPCs with overlapping CIDR blocks, the VPC peering connection has a status of failed.

``` swift
func createVpcPeeringConnection(input: CreateVpcPeeringConnectionInput, completion: @escaping (ClientRuntime.SdkResult<CreateVpcPeeringConnectionOutputResponse, CreateVpcPeeringConnectionOutputError>) -> Void)
```

### createVpnConnection(input:completion:)

Creates a VPN connection between an existing virtual private gateway or transit gateway and a customer gateway. The supported connection type is ipsec.1. The response includes information that you need to give to your network administrator to configure your customer gateway. We strongly recommend that you use HTTPS when calling this operation because the response contains sensitive cryptographic information for configuring your customer gateway device. If you decide to shut down your VPN connection for any reason and later create a new VPN connection, you must reconfigure your customer gateway with the new information returned from this call. This is an idempotent operation. If you perform the operation more than once, Amazon EC2 doesn't return an error. For more information, see [Amazon Web Services Site-to-Site VPN](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html) in the Amazon Web Services Site-to-Site VPN User Guide.

``` swift
func createVpnConnection(input: CreateVpnConnectionInput, completion: @escaping (ClientRuntime.SdkResult<CreateVpnConnectionOutputResponse, CreateVpnConnectionOutputError>) -> Void)
```

### createVpnConnectionRoute(input:completion:)

Creates a static route associated with a VPN connection between an existing virtual private gateway and a VPN customer gateway. The static route allows traffic to be routed from the virtual private gateway to the VPN customer gateway. For more information, see [Amazon Web Services Site-to-Site VPN](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html) in the Amazon Web Services Site-to-Site VPN User Guide.

``` swift
func createVpnConnectionRoute(input: CreateVpnConnectionRouteInput, completion: @escaping (ClientRuntime.SdkResult<CreateVpnConnectionRouteOutputResponse, CreateVpnConnectionRouteOutputError>) -> Void)
```

### createVpnGateway(input:completion:)

Creates a virtual private gateway. A virtual private gateway is the endpoint on the VPC side of your VPN connection. You can create a virtual private gateway before creating the VPC itself. For more information, see [Amazon Web Services Site-to-Site VPN](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html) in the Amazon Web Services Site-to-Site VPN User Guide.

``` swift
func createVpnGateway(input: CreateVpnGatewayInput, completion: @escaping (ClientRuntime.SdkResult<CreateVpnGatewayOutputResponse, CreateVpnGatewayOutputError>) -> Void)
```

### deleteCarrierGateway(input:completion:)

Deletes a carrier gateway. If you do not delete the route that contains the carrier gateway as the Target, the route is a blackhole route. For information about how to delete a route, see [DeleteRoute](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DeleteRoute.html).

``` swift
func deleteCarrierGateway(input: DeleteCarrierGatewayInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCarrierGatewayOutputResponse, DeleteCarrierGatewayOutputError>) -> Void)
```

### deleteClientVpnEndpoint(input:completion:)

Deletes the specified Client VPN endpoint. You must disassociate all target networks before you can delete a Client VPN endpoint.

``` swift
func deleteClientVpnEndpoint(input: DeleteClientVpnEndpointInput, completion: @escaping (ClientRuntime.SdkResult<DeleteClientVpnEndpointOutputResponse, DeleteClientVpnEndpointOutputError>) -> Void)
```

### deleteClientVpnRoute(input:completion:)

Deletes a route from a Client VPN endpoint. You can only delete routes that you manually added using the CreateClientVpnRoute action. You cannot delete routes that were automatically added when associating a subnet. To remove routes that have been automatically added, disassociate the target subnet from the Client VPN endpoint.

``` swift
func deleteClientVpnRoute(input: DeleteClientVpnRouteInput, completion: @escaping (ClientRuntime.SdkResult<DeleteClientVpnRouteOutputResponse, DeleteClientVpnRouteOutputError>) -> Void)
```

### deleteCustomerGateway(input:completion:)

Deletes the specified customer gateway. You must delete the VPN connection before you can delete the customer gateway.

``` swift
func deleteCustomerGateway(input: DeleteCustomerGatewayInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCustomerGatewayOutputResponse, DeleteCustomerGatewayOutputError>) -> Void)
```

### deleteDhcpOptions(input:completion:)

Deletes the specified set of DHCP options. You must disassociate the set of DHCP options before you can delete it. You can disassociate the set of DHCP options by associating either a new set of options or the default set of options with the VPC.

``` swift
func deleteDhcpOptions(input: DeleteDhcpOptionsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDhcpOptionsOutputResponse, DeleteDhcpOptionsOutputError>) -> Void)
```

### deleteEgressOnlyInternetGateway(input:completion:)

Deletes an egress-only internet gateway.

``` swift
func deleteEgressOnlyInternetGateway(input: DeleteEgressOnlyInternetGatewayInput, completion: @escaping (ClientRuntime.SdkResult<DeleteEgressOnlyInternetGatewayOutputResponse, DeleteEgressOnlyInternetGatewayOutputError>) -> Void)
```

### deleteFleets(input:completion:)

Deletes the specified EC2 Fleet. After you delete an EC2 Fleet, it launches no new instances. You must specify whether a deleted EC2 Fleet should also terminate its instances. If you choose to terminate the instances, the EC2 Fleet enters the deleted\_terminating state. Otherwise, the EC2 Fleet enters the deleted\_running state, and the instances continue to run until they are interrupted or you terminate them manually. For instant fleets, EC2 Fleet must terminate the instances when the fleet is deleted. A deleted instant fleet with running instances is not supported. Restrictions

``` swift
func deleteFleets(input: DeleteFleetsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFleetsOutputResponse, DeleteFleetsOutputError>) -> Void)
```

  - You can delete up to 25 instant fleets in a single request. If you exceed this number, no instant fleets are deleted and an error is returned. There is no restriction on the number of fleets of type maintain or request that can be deleted in a single request.

  - Up to 1000 instances can be terminated in a single request to delete instant fleets.

For more information, see [Deleting an EC2 Fleet](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/manage-ec2-fleet.html#delete-fleet) in the Amazon EC2 User Guide.

### deleteFlowLogs(input:completion:)

Deletes one or more flow logs.

``` swift
func deleteFlowLogs(input: DeleteFlowLogsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFlowLogsOutputResponse, DeleteFlowLogsOutputError>) -> Void)
```

### deleteFpgaImage(input:completion:)

Deletes the specified Amazon FPGA Image (AFI).

``` swift
func deleteFpgaImage(input: DeleteFpgaImageInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFpgaImageOutputResponse, DeleteFpgaImageOutputError>) -> Void)
```

### deleteInstanceEventWindow(input:completion:)

Deletes the specified event window. For more information, see [Define event windows for scheduled events](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/event-windows.html) in the Amazon EC2 User Guide.

``` swift
func deleteInstanceEventWindow(input: DeleteInstanceEventWindowInput, completion: @escaping (ClientRuntime.SdkResult<DeleteInstanceEventWindowOutputResponse, DeleteInstanceEventWindowOutputError>) -> Void)
```

### deleteInternetGateway(input:completion:)

Deletes the specified internet gateway. You must detach the internet gateway from the VPC before you can delete it.

``` swift
func deleteInternetGateway(input: DeleteInternetGatewayInput, completion: @escaping (ClientRuntime.SdkResult<DeleteInternetGatewayOutputResponse, DeleteInternetGatewayOutputError>) -> Void)
```

### deleteKeyPair(input:completion:)

Deletes the specified key pair, by removing the public key from Amazon EC2.

``` swift
func deleteKeyPair(input: DeleteKeyPairInput, completion: @escaping (ClientRuntime.SdkResult<DeleteKeyPairOutputResponse, DeleteKeyPairOutputError>) -> Void)
```

### deleteLaunchTemplate(input:completion:)

Deletes a launch template. Deleting a launch template deletes all of its versions.

``` swift
func deleteLaunchTemplate(input: DeleteLaunchTemplateInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLaunchTemplateOutputResponse, DeleteLaunchTemplateOutputError>) -> Void)
```

### deleteLaunchTemplateVersions(input:completion:)

Deletes one or more versions of a launch template. You cannot delete the default version of a launch template; you must first assign a different version as the default. If the default version is the only version for the launch template, you must delete the entire launch template using \[DeleteLaunchTemplate\].

``` swift
func deleteLaunchTemplateVersions(input: DeleteLaunchTemplateVersionsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLaunchTemplateVersionsOutputResponse, DeleteLaunchTemplateVersionsOutputError>) -> Void)
```

### deleteLocalGatewayRoute(input:completion:)

Deletes the specified route from the specified local gateway route table.

``` swift
func deleteLocalGatewayRoute(input: DeleteLocalGatewayRouteInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLocalGatewayRouteOutputResponse, DeleteLocalGatewayRouteOutputError>) -> Void)
```

### deleteLocalGatewayRouteTableVpcAssociation(input:completion:)

Deletes the specified association between a VPC and local gateway route table.

``` swift
func deleteLocalGatewayRouteTableVpcAssociation(input: DeleteLocalGatewayRouteTableVpcAssociationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLocalGatewayRouteTableVpcAssociationOutputResponse, DeleteLocalGatewayRouteTableVpcAssociationOutputError>) -> Void)
```

### deleteManagedPrefixList(input:completion:)

Deletes the specified managed prefix list. You must first remove all references to the prefix list in your resources.

``` swift
func deleteManagedPrefixList(input: DeleteManagedPrefixListInput, completion: @escaping (ClientRuntime.SdkResult<DeleteManagedPrefixListOutputResponse, DeleteManagedPrefixListOutputError>) -> Void)
```

### deleteNatGateway(input:completion:)

Deletes the specified NAT gateway. Deleting a public NAT gateway disassociates its Elastic IP address, but does not release the address from your account. Deleting a NAT gateway does not delete any NAT gateway routes in your route tables.

``` swift
func deleteNatGateway(input: DeleteNatGatewayInput, completion: @escaping (ClientRuntime.SdkResult<DeleteNatGatewayOutputResponse, DeleteNatGatewayOutputError>) -> Void)
```

### deleteNetworkAcl(input:completion:)

Deletes the specified network ACL. You can't delete the ACL if it's associated with any subnets. You can't delete the default network ACL.

``` swift
func deleteNetworkAcl(input: DeleteNetworkAclInput, completion: @escaping (ClientRuntime.SdkResult<DeleteNetworkAclOutputResponse, DeleteNetworkAclOutputError>) -> Void)
```

### deleteNetworkAclEntry(input:completion:)

Deletes the specified ingress or egress entry (rule) from the specified network ACL.

``` swift
func deleteNetworkAclEntry(input: DeleteNetworkAclEntryInput, completion: @escaping (ClientRuntime.SdkResult<DeleteNetworkAclEntryOutputResponse, DeleteNetworkAclEntryOutputError>) -> Void)
```

### deleteNetworkInsightsAnalysis(input:completion:)

Deletes the specified network insights analysis.

``` swift
func deleteNetworkInsightsAnalysis(input: DeleteNetworkInsightsAnalysisInput, completion: @escaping (ClientRuntime.SdkResult<DeleteNetworkInsightsAnalysisOutputResponse, DeleteNetworkInsightsAnalysisOutputError>) -> Void)
```

### deleteNetworkInsightsPath(input:completion:)

Deletes the specified path.

``` swift
func deleteNetworkInsightsPath(input: DeleteNetworkInsightsPathInput, completion: @escaping (ClientRuntime.SdkResult<DeleteNetworkInsightsPathOutputResponse, DeleteNetworkInsightsPathOutputError>) -> Void)
```

### deleteNetworkInterface(input:completion:)

Deletes the specified network interface. You must detach the network interface before you can delete it.

``` swift
func deleteNetworkInterface(input: DeleteNetworkInterfaceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteNetworkInterfaceOutputResponse, DeleteNetworkInterfaceOutputError>) -> Void)
```

### deleteNetworkInterfacePermission(input:completion:)

Deletes a permission for a network interface. By default, you cannot delete the permission if the account for which you're removing the permission has attached the network interface to an instance. However, you can force delete the permission, regardless of any attachment.

``` swift
func deleteNetworkInterfacePermission(input: DeleteNetworkInterfacePermissionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteNetworkInterfacePermissionOutputResponse, DeleteNetworkInterfacePermissionOutputError>) -> Void)
```

### deletePlacementGroup(input:completion:)

Deletes the specified placement group. You must terminate all instances in the placement group before you can delete the placement group. For more information, see [Placement groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html) in the Amazon EC2 User Guide.

``` swift
func deletePlacementGroup(input: DeletePlacementGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeletePlacementGroupOutputResponse, DeletePlacementGroupOutputError>) -> Void)
```

### deleteQueuedReservedInstances(input:completion:)

Deletes the queued purchases for the specified Reserved Instances.

``` swift
func deleteQueuedReservedInstances(input: DeleteQueuedReservedInstancesInput, completion: @escaping (ClientRuntime.SdkResult<DeleteQueuedReservedInstancesOutputResponse, DeleteQueuedReservedInstancesOutputError>) -> Void)
```

### deleteRoute(input:completion:)

Deletes the specified route from the specified route table.

``` swift
func deleteRoute(input: DeleteRouteInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRouteOutputResponse, DeleteRouteOutputError>) -> Void)
```

### deleteRouteTable(input:completion:)

Deletes the specified route table. You must disassociate the route table from any subnets before you can delete it. You can't delete the main route table.

``` swift
func deleteRouteTable(input: DeleteRouteTableInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRouteTableOutputResponse, DeleteRouteTableOutputError>) -> Void)
```

### deleteSecurityGroup(input:completion:)

Deletes a security group. If you attempt to delete a security group that is associated with an instance, or is referenced by another security group, the operation fails with InvalidGroup.InUse in EC2-Classic or DependencyViolation in EC2-VPC.

``` swift
func deleteSecurityGroup(input: DeleteSecurityGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSecurityGroupOutputResponse, DeleteSecurityGroupOutputError>) -> Void)
```

### deleteSnapshot(input:completion:)

Deletes the specified snapshot. When you make periodic snapshots of a volume, the snapshots are incremental, and only the blocks on the device that have changed since your last snapshot are saved in the new snapshot. When you delete a snapshot, only the data not needed for any other snapshot is removed. So regardless of which prior snapshots have been deleted, all active snapshots will have access to all the information needed to restore the volume. You cannot delete a snapshot of the root device of an EBS volume used by a registered AMI. You must first de-register the AMI before you can delete the snapshot. For more information, see [Delete an Amazon EBS snapshot](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-deleting-snapshot.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func deleteSnapshot(input: DeleteSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSnapshotOutputResponse, DeleteSnapshotOutputError>) -> Void)
```

### deleteSpotDatafeedSubscription(input:completion:)

Deletes the data feed for Spot Instances.

``` swift
func deleteSpotDatafeedSubscription(input: DeleteSpotDatafeedSubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSpotDatafeedSubscriptionOutputResponse, DeleteSpotDatafeedSubscriptionOutputError>) -> Void)
```

### deleteSubnet(input:completion:)

Deletes the specified subnet. You must terminate all running instances in the subnet before you can delete the subnet.

``` swift
func deleteSubnet(input: DeleteSubnetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSubnetOutputResponse, DeleteSubnetOutputError>) -> Void)
```

### deleteSubnetCidrReservation(input:completion:)

Deletes a subnet CIDR reservation.

``` swift
func deleteSubnetCidrReservation(input: DeleteSubnetCidrReservationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSubnetCidrReservationOutputResponse, DeleteSubnetCidrReservationOutputError>) -> Void)
```

### deleteTags(input:completion:)

Deletes the specified set of tags from the specified set of resources. To list the current tags, use \[DescribeTags\]. For more information about tags, see [Tagging Your Resources](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func deleteTags(input: DeleteTagsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTagsOutputResponse, DeleteTagsOutputError>) -> Void)
```

### deleteTrafficMirrorFilter(input:completion:)

Deletes the specified Traffic Mirror filter. You cannot delete a Traffic Mirror filter that is in use by a Traffic Mirror session.

``` swift
func deleteTrafficMirrorFilter(input: DeleteTrafficMirrorFilterInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTrafficMirrorFilterOutputResponse, DeleteTrafficMirrorFilterOutputError>) -> Void)
```

### deleteTrafficMirrorFilterRule(input:completion:)

Deletes the specified Traffic Mirror rule.

``` swift
func deleteTrafficMirrorFilterRule(input: DeleteTrafficMirrorFilterRuleInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTrafficMirrorFilterRuleOutputResponse, DeleteTrafficMirrorFilterRuleOutputError>) -> Void)
```

### deleteTrafficMirrorSession(input:completion:)

Deletes the specified Traffic Mirror session.

``` swift
func deleteTrafficMirrorSession(input: DeleteTrafficMirrorSessionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTrafficMirrorSessionOutputResponse, DeleteTrafficMirrorSessionOutputError>) -> Void)
```

### deleteTrafficMirrorTarget(input:completion:)

Deletes the specified Traffic Mirror target. You cannot delete a Traffic Mirror target that is in use by a Traffic Mirror session.

``` swift
func deleteTrafficMirrorTarget(input: DeleteTrafficMirrorTargetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTrafficMirrorTargetOutputResponse, DeleteTrafficMirrorTargetOutputError>) -> Void)
```

### deleteTransitGateway(input:completion:)

Deletes the specified transit gateway.

``` swift
func deleteTransitGateway(input: DeleteTransitGatewayInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTransitGatewayOutputResponse, DeleteTransitGatewayOutputError>) -> Void)
```

### deleteTransitGatewayConnect(input:completion:)

Deletes the specified Connect attachment. You must first delete any Connect peers for the attachment.

``` swift
func deleteTransitGatewayConnect(input: DeleteTransitGatewayConnectInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTransitGatewayConnectOutputResponse, DeleteTransitGatewayConnectOutputError>) -> Void)
```

### deleteTransitGatewayConnectPeer(input:completion:)

Deletes the specified Connect peer.

``` swift
func deleteTransitGatewayConnectPeer(input: DeleteTransitGatewayConnectPeerInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTransitGatewayConnectPeerOutputResponse, DeleteTransitGatewayConnectPeerOutputError>) -> Void)
```

### deleteTransitGatewayMulticastDomain(input:completion:)

Deletes the specified transit gateway multicast domain.

``` swift
func deleteTransitGatewayMulticastDomain(input: DeleteTransitGatewayMulticastDomainInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTransitGatewayMulticastDomainOutputResponse, DeleteTransitGatewayMulticastDomainOutputError>) -> Void)
```

### deleteTransitGatewayPeeringAttachment(input:completion:)

Deletes a transit gateway peering attachment.

``` swift
func deleteTransitGatewayPeeringAttachment(input: DeleteTransitGatewayPeeringAttachmentInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTransitGatewayPeeringAttachmentOutputResponse, DeleteTransitGatewayPeeringAttachmentOutputError>) -> Void)
```

### deleteTransitGatewayPrefixListReference(input:completion:)

Deletes a reference (route) to a prefix list in a specified transit gateway route table.

``` swift
func deleteTransitGatewayPrefixListReference(input: DeleteTransitGatewayPrefixListReferenceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTransitGatewayPrefixListReferenceOutputResponse, DeleteTransitGatewayPrefixListReferenceOutputError>) -> Void)
```

### deleteTransitGatewayRoute(input:completion:)

Deletes the specified route from the specified transit gateway route table.

``` swift
func deleteTransitGatewayRoute(input: DeleteTransitGatewayRouteInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTransitGatewayRouteOutputResponse, DeleteTransitGatewayRouteOutputError>) -> Void)
```

### deleteTransitGatewayRouteTable(input:completion:)

Deletes the specified transit gateway route table. You must disassociate the route table from any transit gateway route tables before you can delete it.

``` swift
func deleteTransitGatewayRouteTable(input: DeleteTransitGatewayRouteTableInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTransitGatewayRouteTableOutputResponse, DeleteTransitGatewayRouteTableOutputError>) -> Void)
```

### deleteTransitGatewayVpcAttachment(input:completion:)

Deletes the specified VPC attachment.

``` swift
func deleteTransitGatewayVpcAttachment(input: DeleteTransitGatewayVpcAttachmentInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTransitGatewayVpcAttachmentOutputResponse, DeleteTransitGatewayVpcAttachmentOutputError>) -> Void)
```

### deleteVolume(input:completion:)

Deletes the specified EBS volume. The volume must be in the available state (not attached to an instance). The volume can remain in the deleting state for several minutes. For more information, see [Delete an Amazon EBS volume](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-deleting-volume.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func deleteVolume(input: DeleteVolumeInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVolumeOutputResponse, DeleteVolumeOutputError>) -> Void)
```

### deleteVpc(input:completion:)

Deletes the specified VPC. You must detach or delete all gateways and resources that are associated with the VPC before you can delete it. For example, you must terminate all instances running in the VPC, delete all security groups associated with the VPC (except the default one), delete all route tables associated with the VPC (except the default one), and so on.

``` swift
func deleteVpc(input: DeleteVpcInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVpcOutputResponse, DeleteVpcOutputError>) -> Void)
```

### deleteVpcEndpointConnectionNotifications(input:completion:)

Deletes one or more VPC endpoint connection notifications.

``` swift
func deleteVpcEndpointConnectionNotifications(input: DeleteVpcEndpointConnectionNotificationsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVpcEndpointConnectionNotificationsOutputResponse, DeleteVpcEndpointConnectionNotificationsOutputError>) -> Void)
```

### deleteVpcEndpoints(input:completion:)

Deletes one or more specified VPC endpoints. You can delete any of the following types of VPC endpoints.

``` swift
func deleteVpcEndpoints(input: DeleteVpcEndpointsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVpcEndpointsOutputResponse, DeleteVpcEndpointsOutputError>) -> Void)
```

  - Gateway endpoint,

  - Gateway Load Balancer endpoint,

  - Interface endpoint

The following rules apply when you delete a VPC endpoint:

  - When you delete a gateway endpoint, we delete the endpoint routes in the route tables that are associated with the endpoint.

  - When you delete a Gateway Load Balancer endpoint, we delete the endpoint network interfaces. You can only delete Gateway Load Balancer endpoints when the routes that are associated with the endpoint are deleted.

  - When you delete an interface endpoint, we delete the endpoint network interfaces.

### deleteVpcEndpointServiceConfigurations(input:completion:)

Deletes one or more VPC endpoint service configurations in your account. Before you delete the endpoint service configuration, you must reject any Available or PendingAcceptance interface endpoint connections that are attached to the service.

``` swift
func deleteVpcEndpointServiceConfigurations(input: DeleteVpcEndpointServiceConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVpcEndpointServiceConfigurationsOutputResponse, DeleteVpcEndpointServiceConfigurationsOutputError>) -> Void)
```

### deleteVpcPeeringConnection(input:completion:)

Deletes a VPC peering connection. Either the owner of the requester VPC or the owner of the accepter VPC can delete the VPC peering connection if it's in the active state. The owner of the requester VPC can delete a VPC peering connection in the pending-acceptance state. You cannot delete a VPC peering connection that's in the failed state.

``` swift
func deleteVpcPeeringConnection(input: DeleteVpcPeeringConnectionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVpcPeeringConnectionOutputResponse, DeleteVpcPeeringConnectionOutputError>) -> Void)
```

### deleteVpnConnection(input:completion:)

Deletes the specified VPN connection. If you're deleting the VPC and its associated components, we recommend that you detach the virtual private gateway from the VPC and delete the VPC before deleting the VPN connection. If you believe that the tunnel credentials for your VPN connection have been compromised, you can delete the VPN connection and create a new one that has new keys, without needing to delete the VPC or virtual private gateway. If you create a new VPN connection, you must reconfigure the customer gateway device using the new configuration information returned with the new VPN connection ID. For certificate-based authentication, delete all Certificate Manager (ACM) private certificates used for the Amazon Web Services-side tunnel endpoints for the VPN connection before deleting the VPN connection.

``` swift
func deleteVpnConnection(input: DeleteVpnConnectionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVpnConnectionOutputResponse, DeleteVpnConnectionOutputError>) -> Void)
```

### deleteVpnConnectionRoute(input:completion:)

Deletes the specified static route associated with a VPN connection between an existing virtual private gateway and a VPN customer gateway. The static route allows traffic to be routed from the virtual private gateway to the VPN customer gateway.

``` swift
func deleteVpnConnectionRoute(input: DeleteVpnConnectionRouteInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVpnConnectionRouteOutputResponse, DeleteVpnConnectionRouteOutputError>) -> Void)
```

### deleteVpnGateway(input:completion:)

Deletes the specified virtual private gateway. You must first detach the virtual private gateway from the VPC. Note that you don't need to delete the virtual private gateway if you plan to delete and recreate the VPN connection between your VPC and your network.

``` swift
func deleteVpnGateway(input: DeleteVpnGatewayInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVpnGatewayOutputResponse, DeleteVpnGatewayOutputError>) -> Void)
```

### deprovisionByoipCidr(input:completion:)

Releases the specified address range that you provisioned for use with your Amazon Web Services resources through bring your own IP addresses (BYOIP) and deletes the corresponding address pool. Before you can release an address range, you must stop advertising it using \[WithdrawByoipCidr\] and you must not have any IP addresses allocated from its address range.

``` swift
func deprovisionByoipCidr(input: DeprovisionByoipCidrInput, completion: @escaping (ClientRuntime.SdkResult<DeprovisionByoipCidrOutputResponse, DeprovisionByoipCidrOutputError>) -> Void)
```

### deregisterImage(input:completion:)

Deregisters the specified AMI. After you deregister an AMI, it can't be used to launch new instances; however, it doesn't affect any instances that you've already launched from the AMI. You'll continue to incur usage costs for those instances until you terminate them. When you deregister an Amazon EBS-backed AMI, it doesn't affect the snapshot that was created for the root volume of the instance during the AMI creation process. When you deregister an instance store-backed AMI, it doesn't affect the files that you uploaded to Amazon S3 when you created the AMI.

``` swift
func deregisterImage(input: DeregisterImageInput, completion: @escaping (ClientRuntime.SdkResult<DeregisterImageOutputResponse, DeregisterImageOutputError>) -> Void)
```

### deregisterInstanceEventNotificationAttributes(input:completion:)

c Deregisters tag keys to prevent tags that have the specified tag keys from being included in scheduled event notifications for resources in the Region.

``` swift
func deregisterInstanceEventNotificationAttributes(input: DeregisterInstanceEventNotificationAttributesInput, completion: @escaping (ClientRuntime.SdkResult<DeregisterInstanceEventNotificationAttributesOutputResponse, DeregisterInstanceEventNotificationAttributesOutputError>) -> Void)
```

### deregisterTransitGatewayMulticastGroupMembers(input:completion:)

Deregisters the specified members (network interfaces) from the transit gateway multicast group.

``` swift
func deregisterTransitGatewayMulticastGroupMembers(input: DeregisterTransitGatewayMulticastGroupMembersInput, completion: @escaping (ClientRuntime.SdkResult<DeregisterTransitGatewayMulticastGroupMembersOutputResponse, DeregisterTransitGatewayMulticastGroupMembersOutputError>) -> Void)
```

### deregisterTransitGatewayMulticastGroupSources(input:completion:)

Deregisters the specified sources (network interfaces) from the transit gateway multicast group.

``` swift
func deregisterTransitGatewayMulticastGroupSources(input: DeregisterTransitGatewayMulticastGroupSourcesInput, completion: @escaping (ClientRuntime.SdkResult<DeregisterTransitGatewayMulticastGroupSourcesOutputResponse, DeregisterTransitGatewayMulticastGroupSourcesOutputError>) -> Void)
```

### describeAccountAttributes(input:completion:)

Describes attributes of your AWS account. The following are the supported account attributes:

``` swift
func describeAccountAttributes(input: DescribeAccountAttributesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAccountAttributesOutputResponse, DescribeAccountAttributesOutputError>) -> Void)
```

  - supported-platforms: Indicates whether your account can launch instances into EC2-Classic and EC2-VPC, or only into EC2-VPC.

  - default-vpc: The ID of the default VPC for your account, or none.

  - max-instances: This attribute is no longer supported. The returned value does not reflect your actual vCPU limit for running On-Demand Instances. For more information, see [On-Demand Instance Limits](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-on-demand-instances.html#ec2-on-demand-instances-limits) in the Amazon Elastic Compute Cloud User Guide.

  - vpc-max-security-groups-per-interface: The maximum number of security groups that you can assign to a network interface.

  - max-elastic-ips: The maximum number of Elastic IP addresses that you can allocate for use with EC2-Classic.

  - vpc-max-elastic-ips: The maximum number of Elastic IP addresses that you can allocate for use with EC2-VPC.

### describeAddresses(input:completion:)

Describes the specified Elastic IP addresses or all of your Elastic IP addresses. An Elastic IP address is for use in either the EC2-Classic platform or in a VPC. For more information, see [Elastic IP Addresses](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func describeAddresses(input: DescribeAddressesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAddressesOutputResponse, DescribeAddressesOutputError>) -> Void)
```

### describeAddressesAttribute(input:completion:)

Describes the attributes of the specified Elastic IP addresses. For requirements, see [Using reverse DNS for email applications](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html#Using_Elastic_Addressing_Reverse_DNS).

``` swift
func describeAddressesAttribute(input: DescribeAddressesAttributeInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAddressesAttributeOutputResponse, DescribeAddressesAttributeOutputError>) -> Void)
```

### describeAggregateIdFormat(input:completion:)

Describes the longer ID format settings for all resource types in a specific Region. This request is useful for performing a quick audit to determine whether a specific Region is fully opted in for longer IDs (17-character IDs). This request only returns information about resource types that support longer IDs. The following resource types support longer IDs: bundle | conversion-task | customer-gateway | dhcp-options | elastic-ip-allocation | elastic-ip-association | export-task | flow-log | image | import-task | instance | internet-gateway | network-acl | network-acl-association | network-interface | network-interface-attachment | prefix-list | reservation | route-table | route-table-association | security-group | snapshot | subnet | subnet-cidr-block-association | volume | vpc | vpc-cidr-block-association | vpc-endpoint | vpc-peering-connection | vpn-connection | vpn-gateway.

``` swift
func describeAggregateIdFormat(input: DescribeAggregateIdFormatInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAggregateIdFormatOutputResponse, DescribeAggregateIdFormatOutputError>) -> Void)
```

### describeAvailabilityZones(input:completion:)

Describes the Availability Zones, Local Zones, and Wavelength Zones that are available to you. If there is an event impacting a zone, you can use this request to view the state and any provided messages for that zone. For more information about Availability Zones, Local Zones, and Wavelength Zones, see [Regions, Zones and Outposts](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func describeAvailabilityZones(input: DescribeAvailabilityZonesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAvailabilityZonesOutputResponse, DescribeAvailabilityZonesOutputError>) -> Void)
```

### describeBundleTasks(input:completion:)

Describes the specified bundle tasks or all of your bundle tasks. Completed bundle tasks are listed for only a limited time. If your bundle task is no longer in the list, you can still register an AMI from it. Just use RegisterImage with the Amazon S3 bucket name and image manifest name you provided to the bundle task.

``` swift
func describeBundleTasks(input: DescribeBundleTasksInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBundleTasksOutputResponse, DescribeBundleTasksOutputError>) -> Void)
```

### describeByoipCidrs(input:completion:)

Describes the IP address ranges that were specified in calls to \[ProvisionByoipCidr\]. To describe the address pools that were created when you provisioned the address ranges, use \[DescribePublicIpv4Pools\] or \[DescribeIpv6Pools\].

``` swift
func describeByoipCidrs(input: DescribeByoipCidrsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeByoipCidrsOutputResponse, DescribeByoipCidrsOutputError>) -> Void)
```

### describeCapacityReservations(input:completion:)

Describes one or more of your Capacity Reservations. The results describe only the Capacity Reservations in the Amazon Web Services Region that you're currently using.

``` swift
func describeCapacityReservations(input: DescribeCapacityReservationsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCapacityReservationsOutputResponse, DescribeCapacityReservationsOutputError>) -> Void)
```

### describeCarrierGateways(input:completion:)

Describes one or more of your carrier gateways.

``` swift
func describeCarrierGateways(input: DescribeCarrierGatewaysInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCarrierGatewaysOutputResponse, DescribeCarrierGatewaysOutputError>) -> Void)
```

### describeClassicLinkInstances(input:completion:)

Describes one or more of your linked EC2-Classic instances. This request only returns information about EC2-Classic instances linked to a VPC through ClassicLink. You cannot use this request to return information about other instances.

``` swift
func describeClassicLinkInstances(input: DescribeClassicLinkInstancesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeClassicLinkInstancesOutputResponse, DescribeClassicLinkInstancesOutputError>) -> Void)
```

### describeClientVpnAuthorizationRules(input:completion:)

Describes the authorization rules for a specified Client VPN endpoint.

``` swift
func describeClientVpnAuthorizationRules(input: DescribeClientVpnAuthorizationRulesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeClientVpnAuthorizationRulesOutputResponse, DescribeClientVpnAuthorizationRulesOutputError>) -> Void)
```

### describeClientVpnConnections(input:completion:)

Describes active client connections and connections that have been terminated within the last 60 minutes for the specified Client VPN endpoint.

``` swift
func describeClientVpnConnections(input: DescribeClientVpnConnectionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeClientVpnConnectionsOutputResponse, DescribeClientVpnConnectionsOutputError>) -> Void)
```

### describeClientVpnEndpoints(input:completion:)

Describes one or more Client VPN endpoints in the account.

``` swift
func describeClientVpnEndpoints(input: DescribeClientVpnEndpointsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeClientVpnEndpointsOutputResponse, DescribeClientVpnEndpointsOutputError>) -> Void)
```

### describeClientVpnRoutes(input:completion:)

Describes the routes for the specified Client VPN endpoint.

``` swift
func describeClientVpnRoutes(input: DescribeClientVpnRoutesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeClientVpnRoutesOutputResponse, DescribeClientVpnRoutesOutputError>) -> Void)
```

### describeClientVpnTargetNetworks(input:completion:)

Describes the target networks associated with the specified Client VPN endpoint.

``` swift
func describeClientVpnTargetNetworks(input: DescribeClientVpnTargetNetworksInput, completion: @escaping (ClientRuntime.SdkResult<DescribeClientVpnTargetNetworksOutputResponse, DescribeClientVpnTargetNetworksOutputError>) -> Void)
```

### describeCoipPools(input:completion:)

Describes the specified customer-owned address pools or all of your customer-owned address pools.

``` swift
func describeCoipPools(input: DescribeCoipPoolsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCoipPoolsOutputResponse, DescribeCoipPoolsOutputError>) -> Void)
```

### describeConversionTasks(input:completion:)

Describes the specified conversion tasks or all your conversion tasks. For more information, see the [VM Import/Export User Guide](https://docs.aws.amazon.com/vm-import/latest/userguide/). For information about the import manifest referenced by this API action, see [VM Import Manifest](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/manifest.html).

``` swift
func describeConversionTasks(input: DescribeConversionTasksInput, completion: @escaping (ClientRuntime.SdkResult<DescribeConversionTasksOutputResponse, DescribeConversionTasksOutputError>) -> Void)
```

### describeCustomerGateways(input:completion:)

Describes one or more of your VPN customer gateways. For more information, see [Amazon Web Services Site-to-Site VPN](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html) in the Amazon Web Services Site-to-Site VPN User Guide.

``` swift
func describeCustomerGateways(input: DescribeCustomerGatewaysInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCustomerGatewaysOutputResponse, DescribeCustomerGatewaysOutputError>) -> Void)
```

### describeDhcpOptions(input:completion:)

Describes one or more of your DHCP options sets. For more information, see [DHCP options sets](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_DHCP_Options.html) in the Amazon Virtual Private Cloud User Guide.

``` swift
func describeDhcpOptions(input: DescribeDhcpOptionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDhcpOptionsOutputResponse, DescribeDhcpOptionsOutputError>) -> Void)
```

### describeEgressOnlyInternetGateways(input:completion:)

Describes one or more of your egress-only internet gateways.

``` swift
func describeEgressOnlyInternetGateways(input: DescribeEgressOnlyInternetGatewaysInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEgressOnlyInternetGatewaysOutputResponse, DescribeEgressOnlyInternetGatewaysOutputError>) -> Void)
```

### describeElasticGpus(input:completion:)

Describes the Elastic Graphics accelerator associated with your instances. For more information about Elastic Graphics, see [Amazon Elastic Graphics](https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/elastic-graphics.html).

``` swift
func describeElasticGpus(input: DescribeElasticGpusInput, completion: @escaping (ClientRuntime.SdkResult<DescribeElasticGpusOutputResponse, DescribeElasticGpusOutputError>) -> Void)
```

### describeExportImageTasks(input:completion:)

Describes the specified export image tasks or all of your export image tasks.

``` swift
func describeExportImageTasks(input: DescribeExportImageTasksInput, completion: @escaping (ClientRuntime.SdkResult<DescribeExportImageTasksOutputResponse, DescribeExportImageTasksOutputError>) -> Void)
```

### describeExportTasks(input:completion:)

Describes the specified export instance tasks or all of your export instance tasks.

``` swift
func describeExportTasks(input: DescribeExportTasksInput, completion: @escaping (ClientRuntime.SdkResult<DescribeExportTasksOutputResponse, DescribeExportTasksOutputError>) -> Void)
```

### describeFastSnapshotRestores(input:completion:)

Describes the state of fast snapshot restores for your snapshots.

``` swift
func describeFastSnapshotRestores(input: DescribeFastSnapshotRestoresInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFastSnapshotRestoresOutputResponse, DescribeFastSnapshotRestoresOutputError>) -> Void)
```

### describeFleetHistory(input:completion:)

Describes the events for the specified EC2 Fleet during the specified time. EC2 Fleet events are delayed by up to 30 seconds before they can be described. This ensures that you can query by the last evaluated time and not miss a recorded event. EC2 Fleet events are available for 48 hours. For more information, see [Monitoring your EC2 Fleet](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-fleet.html#monitor-ec2-fleet) in the Amazon EC2 User Guide.

``` swift
func describeFleetHistory(input: DescribeFleetHistoryInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFleetHistoryOutputResponse, DescribeFleetHistoryOutputError>) -> Void)
```

### describeFleetInstances(input:completion:)

Describes the running instances for the specified EC2 Fleet. For more information, see [Monitoring your EC2 Fleet](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-fleet.html#monitor-ec2-fleet) in the Amazon EC2 User Guide.

``` swift
func describeFleetInstances(input: DescribeFleetInstancesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFleetInstancesOutputResponse, DescribeFleetInstancesOutputError>) -> Void)
```

### describeFleets(input:completion:)

Describes the specified EC2 Fleets or all of your EC2 Fleets. For more information, see [Monitoring your EC2 Fleet](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-fleet.html#monitor-ec2-fleet) in the Amazon EC2 User Guide.

``` swift
func describeFleets(input: DescribeFleetsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFleetsOutputResponse, DescribeFleetsOutputError>) -> Void)
```

### describeFlowLogs(input:completion:)

Describes one or more flow logs. To view the information in your flow logs (the log streams for the network interfaces), you must use the CloudWatch Logs console or the CloudWatch Logs API.

``` swift
func describeFlowLogs(input: DescribeFlowLogsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFlowLogsOutputResponse, DescribeFlowLogsOutputError>) -> Void)
```

### describeFpgaImageAttribute(input:completion:)

Describes the specified attribute of the specified Amazon FPGA Image (AFI).

``` swift
func describeFpgaImageAttribute(input: DescribeFpgaImageAttributeInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFpgaImageAttributeOutputResponse, DescribeFpgaImageAttributeOutputError>) -> Void)
```

### describeFpgaImages(input:completion:)

Describes the Amazon FPGA Images (AFIs) available to you. These include public AFIs, private AFIs that you own, and AFIs owned by other AWS accounts for which you have load permissions.

``` swift
func describeFpgaImages(input: DescribeFpgaImagesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFpgaImagesOutputResponse, DescribeFpgaImagesOutputError>) -> Void)
```

### describeHostReservationOfferings(input:completion:)

Describes the Dedicated Host reservations that are available to purchase. The results describe all of the Dedicated Host reservation offerings, including offerings that might not match the instance family and Region of your Dedicated Hosts. When purchasing an offering, ensure that the instance family and Region of the offering matches that of the Dedicated Hosts with which it is to be associated. For more information about supported instance types, see [Dedicated Hosts](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-hosts-overview.html) in the Amazon EC2 User Guide.

``` swift
func describeHostReservationOfferings(input: DescribeHostReservationOfferingsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeHostReservationOfferingsOutputResponse, DescribeHostReservationOfferingsOutputError>) -> Void)
```

### describeHostReservations(input:completion:)

Describes reservations that are associated with Dedicated Hosts in your account.

``` swift
func describeHostReservations(input: DescribeHostReservationsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeHostReservationsOutputResponse, DescribeHostReservationsOutputError>) -> Void)
```

### describeHosts(input:completion:)

Describes the specified Dedicated Hosts or all your Dedicated Hosts. The results describe only the Dedicated Hosts in the Region you're currently using. All listed instances consume capacity on your Dedicated Host. Dedicated Hosts that have recently been released are listed with the state released.

``` swift
func describeHosts(input: DescribeHostsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeHostsOutputResponse, DescribeHostsOutputError>) -> Void)
```

### describeIamInstanceProfileAssociations(input:completion:)

Describes your IAM instance profile associations.

``` swift
func describeIamInstanceProfileAssociations(input: DescribeIamInstanceProfileAssociationsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeIamInstanceProfileAssociationsOutputResponse, DescribeIamInstanceProfileAssociationsOutputError>) -> Void)
```

### describeIdentityIdFormat(input:completion:)

Describes the ID format settings for resources for the specified IAM user, IAM role, or root user. For example, you can view the resource types that are enabled for longer IDs. This request only returns information about resource types whose ID formats can be modified; it does not return information about other resource types. For more information, see [Resource IDs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/resource-ids.html) in the Amazon Elastic Compute Cloud User Guide. The following resource types support longer IDs: bundle | conversion-task | customer-gateway | dhcp-options | elastic-ip-allocation | elastic-ip-association | export-task | flow-log | image | import-task | instance | internet-gateway | network-acl | network-acl-association | network-interface | network-interface-attachment | prefix-list | reservation | route-table | route-table-association | security-group | snapshot | subnet | subnet-cidr-block-association | volume | vpc | vpc-cidr-block-association | vpc-endpoint | vpc-peering-connection | vpn-connection | vpn-gateway. These settings apply to the principal specified in the request. They do not apply to the principal that makes the request.

``` swift
func describeIdentityIdFormat(input: DescribeIdentityIdFormatInput, completion: @escaping (ClientRuntime.SdkResult<DescribeIdentityIdFormatOutputResponse, DescribeIdentityIdFormatOutputError>) -> Void)
```

### describeIdFormat(input:completion:)

Describes the ID format settings for your resources on a per-Region basis, for example, to view which resource types are enabled for longer IDs. This request only returns information about resource types whose ID formats can be modified; it does not return information about other resource types. The following resource types support longer IDs: bundle | conversion-task | customer-gateway | dhcp-options | elastic-ip-allocation | elastic-ip-association | export-task | flow-log | image | import-task | instance | internet-gateway | network-acl | network-acl-association | network-interface | network-interface-attachment | prefix-list | reservation | route-table | route-table-association | security-group | snapshot | subnet | subnet-cidr-block-association | volume | vpc | vpc-cidr-block-association | vpc-endpoint | vpc-peering-connection | vpn-connection | vpn-gateway. These settings apply to the IAM user who makes the request; they do not apply to the entire AWS account. By default, an IAM user defaults to the same settings as the root user, unless they explicitly override the settings by running the \[ModifyIdFormat\] command. Resources created with longer IDs are visible to all IAM users, regardless of these settings and provided that they have permission to use the relevant Describe command for the resource type.

``` swift
func describeIdFormat(input: DescribeIdFormatInput, completion: @escaping (ClientRuntime.SdkResult<DescribeIdFormatOutputResponse, DescribeIdFormatOutputError>) -> Void)
```

### describeImageAttribute(input:completion:)

Describes the specified attribute of the specified AMI. You can specify only one attribute at a time.

``` swift
func describeImageAttribute(input: DescribeImageAttributeInput, completion: @escaping (ClientRuntime.SdkResult<DescribeImageAttributeOutputResponse, DescribeImageAttributeOutputError>) -> Void)
```

### describeImages(input:completion:)

Describes the specified images (AMIs, AKIs, and ARIs) available to you or all of the images available to you. The images available to you include public images, private images that you own, and private images owned by other Amazon Web Services accounts for which you have explicit launch permissions. Recently deregistered images appear in the returned results for a short interval and then return empty results. After all instances that reference a deregistered AMI are terminated, specifying the ID of the image will eventually return an error indicating that the AMI ID cannot be found.

``` swift
func describeImages(input: DescribeImagesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeImagesOutputResponse, DescribeImagesOutputError>) -> Void)
```

### describeImportImageTasks(input:completion:)

Displays details about an import virtual machine or import snapshot tasks that are already created.

``` swift
func describeImportImageTasks(input: DescribeImportImageTasksInput, completion: @escaping (ClientRuntime.SdkResult<DescribeImportImageTasksOutputResponse, DescribeImportImageTasksOutputError>) -> Void)
```

### describeImportSnapshotTasks(input:completion:)

Describes your import snapshot tasks.

``` swift
func describeImportSnapshotTasks(input: DescribeImportSnapshotTasksInput, completion: @escaping (ClientRuntime.SdkResult<DescribeImportSnapshotTasksOutputResponse, DescribeImportSnapshotTasksOutputError>) -> Void)
```

### describeInstanceAttribute(input:completion:)

Describes the specified attribute of the specified instance. You can specify only one attribute at a time. Valid attribute values are: instanceType | kernel | ramdisk | userData | disableApiTermination | instanceInitiatedShutdownBehavior | rootDeviceName | blockDeviceMapping | productCodes | sourceDestCheck | groupSet | ebsOptimized | sriovNetSupport

``` swift
func describeInstanceAttribute(input: DescribeInstanceAttributeInput, completion: @escaping (ClientRuntime.SdkResult<DescribeInstanceAttributeOutputResponse, DescribeInstanceAttributeOutputError>) -> Void)
```

### describeInstanceCreditSpecifications(input:completion:)

Describes the credit option for CPU usage of the specified burstable performance instances. The credit options are standard and unlimited. If you do not specify an instance ID, Amazon EC2 returns burstable performance instances with the unlimited credit option, as well as instances that were previously configured as T2, T3, and T3a with the unlimited credit option. For example, if you resize a T2 instance, while it is configured as unlimited, to an M4 instance, Amazon EC2 returns the M4 instance. If you specify one or more instance IDs, Amazon EC2 returns the credit option (standard or unlimited) of those instances. If you specify an instance ID that is not valid, such as an instance that is not a burstable performance instance, an error is returned. Recently terminated instances might appear in the returned results. This interval is usually less than one hour. If an Availability Zone is experiencing a service disruption and you specify instance IDs in the affected zone, or do not specify any instance IDs at all, the call fails. If you specify only instance IDs in an unaffected zone, the call works normally. For more information, see [Burstable performance instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/burstable-performance-instances.html) in the Amazon EC2 User Guide.

``` swift
func describeInstanceCreditSpecifications(input: DescribeInstanceCreditSpecificationsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeInstanceCreditSpecificationsOutputResponse, DescribeInstanceCreditSpecificationsOutputError>) -> Void)
```

### describeInstanceEventNotificationAttributes(input:completion:)

Describes the tag keys that are registered to appear in scheduled event notifications for resources in the current Region.

``` swift
func describeInstanceEventNotificationAttributes(input: DescribeInstanceEventNotificationAttributesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeInstanceEventNotificationAttributesOutputResponse, DescribeInstanceEventNotificationAttributesOutputError>) -> Void)
```

### describeInstanceEventWindows(input:completion:)

Describes the specified event windows or all event windows. If you specify event window IDs, the output includes information for only the specified event windows. If you specify filters, the output includes information for only those event windows that meet the filter criteria. If you do not specify event windows IDs or filters, the output includes information for all event windows, which can affect performance. We recommend that you use pagination to ensure that the operation returns quickly and successfully. For more information, see [Define event windows for scheduled events](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/event-windows.html) in the Amazon EC2 User Guide.

``` swift
func describeInstanceEventWindows(input: DescribeInstanceEventWindowsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeInstanceEventWindowsOutputResponse, DescribeInstanceEventWindowsOutputError>) -> Void)
```

### describeInstances(input:completion:)

Describes the specified instances or all instances. If you specify instance IDs, the output includes information for only the specified instances. If you specify filters, the output includes information for only those instances that meet the filter criteria. If you do not specify instance IDs or filters, the output includes information for all instances, which can affect performance. We recommend that you use pagination to ensure that the operation returns quickly and successfully. If you specify an instance ID that is not valid, an error is returned. If you specify an instance that you do not own, it is not included in the output. Recently terminated instances might appear in the returned results. This interval is usually less than one hour. If you describe instances in the rare case where an Availability Zone is experiencing a service disruption and you specify instance IDs that are in the affected zone, or do not specify any instance IDs at all, the call fails. If you describe instances and specify only instance IDs that are in an unaffected zone, the call works normally.

``` swift
func describeInstances(input: DescribeInstancesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeInstancesOutputResponse, DescribeInstancesOutputError>) -> Void)
```

### describeInstanceStatus(input:completion:)

Describes the status of the specified instances or all of your instances. By default, only running instances are described, unless you specifically indicate to return the status of all instances. Instance status includes the following components:

``` swift
func describeInstanceStatus(input: DescribeInstanceStatusInput, completion: @escaping (ClientRuntime.SdkResult<DescribeInstanceStatusOutputResponse, DescribeInstanceStatusOutputError>) -> Void)
```

  - Status checks - Amazon EC2 performs status checks on running EC2 instances to identify hardware and software issues. For more information, see [Status checks for your instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/monitoring-system-instance-status-check.html) and [Troubleshooting instances with failed status checks](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstances.html) in the Amazon EC2 User Guide.

  - Scheduled events - Amazon EC2 can schedule events (such as reboot, stop, or terminate) for your instances related to hardware issues, software updates, or system maintenance. For more information, see [Scheduled events for your instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/monitoring-instances-status-check_sched.html) in the Amazon EC2 User Guide.

  - Instance state - You can manage your instances from the moment you launch them through their termination. For more information, see [Instance lifecycle](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-lifecycle.html) in the Amazon EC2 User Guide.

### describeInstanceTypeOfferings(input:completion:)

Returns a list of all instance types offered. The results can be filtered by location (Region or Availability Zone). If no location is specified, the instance types offered in the current Region are returned.

``` swift
func describeInstanceTypeOfferings(input: DescribeInstanceTypeOfferingsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeInstanceTypeOfferingsOutputResponse, DescribeInstanceTypeOfferingsOutputError>) -> Void)
```

### describeInstanceTypes(input:completion:)

Describes the details of the instance types that are offered in a location. The results can be filtered by the attributes of the instance types.

``` swift
func describeInstanceTypes(input: DescribeInstanceTypesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeInstanceTypesOutputResponse, DescribeInstanceTypesOutputError>) -> Void)
```

### describeInternetGateways(input:completion:)

Describes one or more of your internet gateways.

``` swift
func describeInternetGateways(input: DescribeInternetGatewaysInput, completion: @escaping (ClientRuntime.SdkResult<DescribeInternetGatewaysOutputResponse, DescribeInternetGatewaysOutputError>) -> Void)
```

### describeIpv6Pools(input:completion:)

Describes your IPv6 address pools.

``` swift
func describeIpv6Pools(input: DescribeIpv6PoolsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeIpv6PoolsOutputResponse, DescribeIpv6PoolsOutputError>) -> Void)
```

### describeKeyPairs(input:completion:)

Describes the specified key pairs or all of your key pairs. For more information about key pairs, see [Amazon EC2 key pairs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func describeKeyPairs(input: DescribeKeyPairsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeKeyPairsOutputResponse, DescribeKeyPairsOutputError>) -> Void)
```

### describeLaunchTemplates(input:completion:)

Describes one or more launch templates.

``` swift
func describeLaunchTemplates(input: DescribeLaunchTemplatesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLaunchTemplatesOutputResponse, DescribeLaunchTemplatesOutputError>) -> Void)
```

### describeLaunchTemplateVersions(input:completion:)

Describes one or more versions of a specified launch template. You can describe all versions, individual versions, or a range of versions. You can also describe all the latest versions or all the default versions of all the launch templates in your account.

``` swift
func describeLaunchTemplateVersions(input: DescribeLaunchTemplateVersionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLaunchTemplateVersionsOutputResponse, DescribeLaunchTemplateVersionsOutputError>) -> Void)
```

### describeLocalGatewayRouteTables(input:completion:)

Describes one or more local gateway route tables. By default, all local gateway route tables are described. Alternatively, you can filter the results.

``` swift
func describeLocalGatewayRouteTables(input: DescribeLocalGatewayRouteTablesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLocalGatewayRouteTablesOutputResponse, DescribeLocalGatewayRouteTablesOutputError>) -> Void)
```

### describeLocalGatewayRouteTableVirtualInterfaceGroupAssociations(input:completion:)

Describes the associations between virtual interface groups and local gateway route tables.

``` swift
func describeLocalGatewayRouteTableVirtualInterfaceGroupAssociations(input: DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociationsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociationsOutputResponse, DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociationsOutputError>) -> Void)
```

### describeLocalGatewayRouteTableVpcAssociations(input:completion:)

Describes the specified associations between VPCs and local gateway route tables.

``` swift
func describeLocalGatewayRouteTableVpcAssociations(input: DescribeLocalGatewayRouteTableVpcAssociationsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLocalGatewayRouteTableVpcAssociationsOutputResponse, DescribeLocalGatewayRouteTableVpcAssociationsOutputError>) -> Void)
```

### describeLocalGateways(input:completion:)

Describes one or more local gateways. By default, all local gateways are described. Alternatively, you can filter the results.

``` swift
func describeLocalGateways(input: DescribeLocalGatewaysInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLocalGatewaysOutputResponse, DescribeLocalGatewaysOutputError>) -> Void)
```

### describeLocalGatewayVirtualInterfaceGroups(input:completion:)

Describes the specified local gateway virtual interface groups.

``` swift
func describeLocalGatewayVirtualInterfaceGroups(input: DescribeLocalGatewayVirtualInterfaceGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLocalGatewayVirtualInterfaceGroupsOutputResponse, DescribeLocalGatewayVirtualInterfaceGroupsOutputError>) -> Void)
```

### describeLocalGatewayVirtualInterfaces(input:completion:)

Describes the specified local gateway virtual interfaces.

``` swift
func describeLocalGatewayVirtualInterfaces(input: DescribeLocalGatewayVirtualInterfacesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLocalGatewayVirtualInterfacesOutputResponse, DescribeLocalGatewayVirtualInterfacesOutputError>) -> Void)
```

### describeManagedPrefixLists(input:completion:)

Describes your managed prefix lists and any Amazon Web Services-managed prefix lists. To view the entries for your prefix list, use \[GetManagedPrefixListEntries\].

``` swift
func describeManagedPrefixLists(input: DescribeManagedPrefixListsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeManagedPrefixListsOutputResponse, DescribeManagedPrefixListsOutputError>) -> Void)
```

### describeMovingAddresses(input:completion:)

Describes your Elastic IP addresses that are being moved to the EC2-VPC platform, or that are being restored to the EC2-Classic platform. This request does not return information about any other Elastic IP addresses in your account.

``` swift
func describeMovingAddresses(input: DescribeMovingAddressesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeMovingAddressesOutputResponse, DescribeMovingAddressesOutputError>) -> Void)
```

### describeNatGateways(input:completion:)

Describes one or more of your NAT gateways.

``` swift
func describeNatGateways(input: DescribeNatGatewaysInput, completion: @escaping (ClientRuntime.SdkResult<DescribeNatGatewaysOutputResponse, DescribeNatGatewaysOutputError>) -> Void)
```

### describeNetworkAcls(input:completion:)

Describes one or more of your network ACLs. For more information, see [Network ACLs](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_ACLs.html) in the Amazon Virtual Private Cloud User Guide.

``` swift
func describeNetworkAcls(input: DescribeNetworkAclsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeNetworkAclsOutputResponse, DescribeNetworkAclsOutputError>) -> Void)
```

### describeNetworkInsightsAnalyses(input:completion:)

Describes one or more of your network insights analyses.

``` swift
func describeNetworkInsightsAnalyses(input: DescribeNetworkInsightsAnalysesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeNetworkInsightsAnalysesOutputResponse, DescribeNetworkInsightsAnalysesOutputError>) -> Void)
```

### describeNetworkInsightsPaths(input:completion:)

Describes one or more of your paths.

``` swift
func describeNetworkInsightsPaths(input: DescribeNetworkInsightsPathsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeNetworkInsightsPathsOutputResponse, DescribeNetworkInsightsPathsOutputError>) -> Void)
```

### describeNetworkInterfaceAttribute(input:completion:)

Describes a network interface attribute. You can specify only one attribute at a time.

``` swift
func describeNetworkInterfaceAttribute(input: DescribeNetworkInterfaceAttributeInput, completion: @escaping (ClientRuntime.SdkResult<DescribeNetworkInterfaceAttributeOutputResponse, DescribeNetworkInterfaceAttributeOutputError>) -> Void)
```

### describeNetworkInterfacePermissions(input:completion:)

Describes the permissions for your network interfaces.

``` swift
func describeNetworkInterfacePermissions(input: DescribeNetworkInterfacePermissionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeNetworkInterfacePermissionsOutputResponse, DescribeNetworkInterfacePermissionsOutputError>) -> Void)
```

### describeNetworkInterfaces(input:completion:)

Describes one or more of your network interfaces.

``` swift
func describeNetworkInterfaces(input: DescribeNetworkInterfacesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeNetworkInterfacesOutputResponse, DescribeNetworkInterfacesOutputError>) -> Void)
```

### describePlacementGroups(input:completion:)

Describes the specified placement groups or all of your placement groups. For more information, see [Placement groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html) in the Amazon EC2 User Guide.

``` swift
func describePlacementGroups(input: DescribePlacementGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribePlacementGroupsOutputResponse, DescribePlacementGroupsOutputError>) -> Void)
```

### describePrefixLists(input:completion:)

Describes available Amazon Web Services services in a prefix list format, which includes the prefix list name and prefix list ID of the service and the IP address range for the service. We recommend that you use \[DescribeManagedPrefixLists\] instead.

``` swift
func describePrefixLists(input: DescribePrefixListsInput, completion: @escaping (ClientRuntime.SdkResult<DescribePrefixListsOutputResponse, DescribePrefixListsOutputError>) -> Void)
```

### describePrincipalIdFormat(input:completion:)

Describes the ID format settings for the root user and all IAM roles and IAM users that have explicitly specified a longer ID (17-character ID) preference. By default, all IAM roles and IAM users default to the same ID settings as the root user, unless they explicitly override the settings. This request is useful for identifying those IAM users and IAM roles that have overridden the default ID settings. The following resource types support longer IDs: bundle | conversion-task | customer-gateway | dhcp-options | elastic-ip-allocation | elastic-ip-association | export-task | flow-log | image | import-task | instance | internet-gateway | network-acl | network-acl-association | network-interface | network-interface-attachment | prefix-list | reservation | route-table | route-table-association | security-group | snapshot | subnet | subnet-cidr-block-association | volume | vpc | vpc-cidr-block-association | vpc-endpoint | vpc-peering-connection | vpn-connection | vpn-gateway.

``` swift
func describePrincipalIdFormat(input: DescribePrincipalIdFormatInput, completion: @escaping (ClientRuntime.SdkResult<DescribePrincipalIdFormatOutputResponse, DescribePrincipalIdFormatOutputError>) -> Void)
```

### describePublicIpv4Pools(input:completion:)

Describes the specified IPv4 address pools.

``` swift
func describePublicIpv4Pools(input: DescribePublicIpv4PoolsInput, completion: @escaping (ClientRuntime.SdkResult<DescribePublicIpv4PoolsOutputResponse, DescribePublicIpv4PoolsOutputError>) -> Void)
```

### describeRegions(input:completion:)

Describes the Regions that are enabled for your account, or all Regions. For a list of the Regions supported by Amazon EC2, see [ Regions and Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html#ec2_region). For information about enabling and disabling Regions for your account, see [Managing AWS Regions](https://docs.aws.amazon.com/general/latest/gr/rande-manage.html) in the AWS General Reference.

``` swift
func describeRegions(input: DescribeRegionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeRegionsOutputResponse, DescribeRegionsOutputError>) -> Void)
```

### describeReplaceRootVolumeTasks(input:completion:)

Describes a root volume replacement task. For more information, see [Replace a root volume](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-restoring-volume.html#replace-root) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func describeReplaceRootVolumeTasks(input: DescribeReplaceRootVolumeTasksInput, completion: @escaping (ClientRuntime.SdkResult<DescribeReplaceRootVolumeTasksOutputResponse, DescribeReplaceRootVolumeTasksOutputError>) -> Void)
```

### describeReservedInstances(input:completion:)

Describes one or more of the Reserved Instances that you purchased. For more information about Reserved Instances, see [Reserved Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts-on-demand-reserved-instances.html) in the Amazon EC2 User Guide.

``` swift
func describeReservedInstances(input: DescribeReservedInstancesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeReservedInstancesOutputResponse, DescribeReservedInstancesOutputError>) -> Void)
```

### describeReservedInstancesListings(input:completion:)

Describes your account's Reserved Instance listings in the Reserved Instance Marketplace. The Reserved Instance Marketplace matches sellers who want to resell Reserved Instance capacity that they no longer need with buyers who want to purchase additional capacity. Reserved Instances bought and sold through the Reserved Instance Marketplace work like any other Reserved Instances. As a seller, you choose to list some or all of your Reserved Instances, and you specify the upfront price to receive for them. Your Reserved Instances are then listed in the Reserved Instance Marketplace and are available for purchase. As a buyer, you specify the configuration of the Reserved Instance to purchase, and the Marketplace matches what you're searching for with what's available. The Marketplace first sells the lowest priced Reserved Instances to you, and continues to sell available Reserved Instance listings to you until your demand is met. You are charged based on the total price of all of the listings that you purchase. For more information, see [Reserved Instance Marketplace](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html) in the Amazon EC2 User Guide.

``` swift
func describeReservedInstancesListings(input: DescribeReservedInstancesListingsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeReservedInstancesListingsOutputResponse, DescribeReservedInstancesListingsOutputError>) -> Void)
```

### describeReservedInstancesModifications(input:completion:)

Describes the modifications made to your Reserved Instances. If no parameter is specified, information about all your Reserved Instances modification requests is returned. If a modification ID is specified, only information about the specific modification is returned. For more information, see [Modifying Reserved Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-modifying.html) in the Amazon EC2 User Guide.

``` swift
func describeReservedInstancesModifications(input: DescribeReservedInstancesModificationsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeReservedInstancesModificationsOutputResponse, DescribeReservedInstancesModificationsOutputError>) -> Void)
```

### describeReservedInstancesOfferings(input:completion:)

Describes Reserved Instance offerings that are available for purchase. With Reserved Instances, you purchase the right to launch instances for a period of time. During that time period, you do not receive insufficient capacity errors, and you pay a lower usage rate than the rate charged for On-Demand instances for the actual time used. If you have listed your own Reserved Instances for sale in the Reserved Instance Marketplace, they will be excluded from these results. This is to ensure that you do not purchase your own Reserved Instances. For more information, see [Reserved Instance Marketplace](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html) in the Amazon EC2 User Guide.

``` swift
func describeReservedInstancesOfferings(input: DescribeReservedInstancesOfferingsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeReservedInstancesOfferingsOutputResponse, DescribeReservedInstancesOfferingsOutputError>) -> Void)
```

### describeRouteTables(input:completion:)

Describes one or more of your route tables. Each subnet in your VPC must be associated with a route table. If a subnet is not explicitly associated with any route table, it is implicitly associated with the main route table. This command does not return the subnet ID for implicit associations. For more information, see [Route tables](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html) in the Amazon Virtual Private Cloud User Guide.

``` swift
func describeRouteTables(input: DescribeRouteTablesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeRouteTablesOutputResponse, DescribeRouteTablesOutputError>) -> Void)
```

### describeScheduledInstanceAvailability(input:completion:)

Finds available schedules that meet the specified criteria. You can search for an available schedule no more than 3 months in advance. You must meet the minimum required duration of 1,200 hours per year. For example, the minimum daily schedule is 4 hours, the minimum weekly schedule is 24 hours, and the minimum monthly schedule is 100 hours. After you find a schedule that meets your needs, call \[PurchaseScheduledInstances\] to purchase Scheduled Instances with that schedule.

``` swift
func describeScheduledInstanceAvailability(input: DescribeScheduledInstanceAvailabilityInput, completion: @escaping (ClientRuntime.SdkResult<DescribeScheduledInstanceAvailabilityOutputResponse, DescribeScheduledInstanceAvailabilityOutputError>) -> Void)
```

### describeScheduledInstances(input:completion:)

Describes the specified Scheduled Instances or all your Scheduled Instances.

``` swift
func describeScheduledInstances(input: DescribeScheduledInstancesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeScheduledInstancesOutputResponse, DescribeScheduledInstancesOutputError>) -> Void)
```

### describeSecurityGroupReferences(input:completion:)

\[VPC only\] Describes the VPCs on the other side of a VPC peering connection that are referencing the security groups you've specified in this request.

``` swift
func describeSecurityGroupReferences(input: DescribeSecurityGroupReferencesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSecurityGroupReferencesOutputResponse, DescribeSecurityGroupReferencesOutputError>) -> Void)
```

### describeSecurityGroupRules(input:completion:)

Describes one or more of your security group rules.

``` swift
func describeSecurityGroupRules(input: DescribeSecurityGroupRulesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSecurityGroupRulesOutputResponse, DescribeSecurityGroupRulesOutputError>) -> Void)
```

### describeSecurityGroups(input:completion:)

Describes the specified security groups or all of your security groups. A security group is for use with instances either in the EC2-Classic platform or in a specific VPC. For more information, see [Amazon EC2 security groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html) in the Amazon Elastic Compute Cloud User Guide and [Security groups for your VPC](https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html) in the Amazon Virtual Private Cloud User Guide.

``` swift
func describeSecurityGroups(input: DescribeSecurityGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSecurityGroupsOutputResponse, DescribeSecurityGroupsOutputError>) -> Void)
```

### describeSnapshotAttribute(input:completion:)

Describes the specified attribute of the specified snapshot. You can specify only one attribute at a time. For more information about EBS snapshots, see [Amazon EBS snapshots](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSSnapshots.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func describeSnapshotAttribute(input: DescribeSnapshotAttributeInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSnapshotAttributeOutputResponse, DescribeSnapshotAttributeOutputError>) -> Void)
```

### describeSnapshots(input:completion:)

Describes the specified EBS snapshots available to you or all of the EBS snapshots available to you. The snapshots available to you include public snapshots, private snapshots that you own, and private snapshots owned by other Amazon Web Services accounts for which you have explicit create volume permissions. The create volume permissions fall into the following categories:

``` swift
func describeSnapshots(input: DescribeSnapshotsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSnapshotsOutputResponse, DescribeSnapshotsOutputError>) -> Void)
```

  - public: The owner of the snapshot granted create volume permissions for the snapshot to the all group. All Amazon Web Services accounts have create volume permissions for these snapshots.

  - explicit: The owner of the snapshot granted create volume permissions to a specific Amazon Web Services account.

  - implicit: An Amazon Web Services account has implicit create volume permissions for all snapshots it owns.

The list of snapshots returned can be filtered by specifying snapshot IDs, snapshot owners, or Amazon Web Services accounts with create volume permissions. If no options are specified, Amazon EC2 returns all snapshots for which you have create volume permissions. If you specify one or more snapshot IDs, only snapshots that have the specified IDs are returned. If you specify an invalid snapshot ID, an error is returned. If you specify a snapshot ID for which you do not have access, it is not included in the returned results. If you specify one or more snapshot owners using the OwnerIds option, only snapshots from the specified owners and for which you have access are returned. The results can include the Amazon Web Services account IDs of the specified owners, amazon for snapshots owned by Amazon, or self for snapshots that you own. If you specify a list of restorable users, only snapshots with create snapshot permissions for those users are returned. You can specify Amazon Web Services account IDs (if you own the snapshots), self for snapshots for which you own or have explicit permissions, or all for public snapshots. If you are describing a long list of snapshots, we recommend that you paginate the output to make the list more manageable. The MaxResults parameter sets the maximum number of results returned in a single page. If the list of results exceeds your MaxResults value, then that number of results is returned along with a NextToken value that can be passed to a subsequent DescribeSnapshots request to retrieve the remaining results. To get the state of fast snapshot restores for a snapshot, use \[DescribeFastSnapshotRestores\]. For more information about EBS snapshots, see [Amazon EBS snapshots](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSSnapshots.html) in the Amazon Elastic Compute Cloud User Guide.

### describeSpotDatafeedSubscription(input:completion:)

Describes the data feed for Spot Instances. For more information, see [Spot Instance data feed](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-data-feeds.html) in the Amazon EC2 User Guide for Linux Instances.

``` swift
func describeSpotDatafeedSubscription(input: DescribeSpotDatafeedSubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSpotDatafeedSubscriptionOutputResponse, DescribeSpotDatafeedSubscriptionOutputError>) -> Void)
```

### describeSpotFleetInstances(input:completion:)

Describes the running instances for the specified Spot Fleet.

``` swift
func describeSpotFleetInstances(input: DescribeSpotFleetInstancesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSpotFleetInstancesOutputResponse, DescribeSpotFleetInstancesOutputError>) -> Void)
```

### describeSpotFleetRequestHistory(input:completion:)

Describes the events for the specified Spot Fleet request during the specified time. Spot Fleet events are delayed by up to 30 seconds before they can be described. This ensures that you can query by the last evaluated time and not miss a recorded event. Spot Fleet events are available for 48 hours.

``` swift
func describeSpotFleetRequestHistory(input: DescribeSpotFleetRequestHistoryInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSpotFleetRequestHistoryOutputResponse, DescribeSpotFleetRequestHistoryOutputError>) -> Void)
```

### describeSpotFleetRequests(input:completion:)

Describes your Spot Fleet requests. Spot Fleet requests are deleted 48 hours after they are canceled and their instances are terminated.

``` swift
func describeSpotFleetRequests(input: DescribeSpotFleetRequestsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSpotFleetRequestsOutputResponse, DescribeSpotFleetRequestsOutputError>) -> Void)
```

### describeSpotInstanceRequests(input:completion:)

Describes the specified Spot Instance requests. You can use DescribeSpotInstanceRequests to find a running Spot Instance by examining the response. If the status of the Spot Instance is fulfilled, the instance ID appears in the response and contains the identifier of the instance. Alternatively, you can use [DescribeInstances](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeInstances) with a filter to look for instances where the instance lifecycle is spot. We recommend that you set MaxResults to a value between 5 and 1000 to limit the number of results returned. This paginates the output, which makes the list more manageable and returns the results faster. If the list of results exceeds your MaxResults value, then that number of results is returned along with a NextToken value that can be passed to a subsequent DescribeSpotInstanceRequests request to retrieve the remaining results. Spot Instance requests are deleted four hours after they are canceled and their instances are terminated.

``` swift
func describeSpotInstanceRequests(input: DescribeSpotInstanceRequestsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSpotInstanceRequestsOutputResponse, DescribeSpotInstanceRequestsOutputError>) -> Void)
```

### describeSpotPriceHistory(input:completion:)

Describes the Spot price history. For more information, see [Spot Instance pricing history](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances-history.html) in the Amazon EC2 User Guide for Linux Instances. When you specify a start and end time, the operation returns the prices of the instance types within that time range. It also returns the last price change before the start time, which is the effective price as of the start time.

``` swift
func describeSpotPriceHistory(input: DescribeSpotPriceHistoryInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSpotPriceHistoryOutputResponse, DescribeSpotPriceHistoryOutputError>) -> Void)
```

### describeStaleSecurityGroups(input:completion:)

\[VPC only\] Describes the stale security group rules for security groups in a specified VPC. Rules are stale when they reference a deleted security group in a peer VPC, or a security group in a peer VPC for which the VPC peering connection has been deleted.

``` swift
func describeStaleSecurityGroups(input: DescribeStaleSecurityGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeStaleSecurityGroupsOutputResponse, DescribeStaleSecurityGroupsOutputError>) -> Void)
```

### describeStoreImageTasks(input:completion:)

Describes the progress of the AMI store tasks. You can describe the store tasks for specified AMIs. If you don't specify the AMIs, you get a paginated list of store tasks from the last 31 days. For each AMI task, the response indicates if the task is InProgress, Completed, or Failed. For tasks InProgress, the response shows the estimated progress as a percentage. Tasks are listed in reverse chronological order. Currently, only tasks from the past 31 days can be viewed. To use this API, you must have the required permissions. For more information, see [Permissions for storing and restoring AMIs using Amazon S3](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ami-store-restore.html#ami-s3-permissions) in the Amazon Elastic Compute Cloud User Guide. For more information, see [Store and restore an AMI using Amazon S3](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ami-store-restore.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func describeStoreImageTasks(input: DescribeStoreImageTasksInput, completion: @escaping (ClientRuntime.SdkResult<DescribeStoreImageTasksOutputResponse, DescribeStoreImageTasksOutputError>) -> Void)
```

### describeSubnets(input:completion:)

Describes one or more of your subnets. For more information, see [Your VPC and subnets](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html) in the Amazon Virtual Private Cloud User Guide.

``` swift
func describeSubnets(input: DescribeSubnetsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSubnetsOutputResponse, DescribeSubnetsOutputError>) -> Void)
```

### describeTags(input:completion:)

Describes the specified tags for your EC2 resources. For more information about tags, see [Tagging Your Resources](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func describeTags(input: DescribeTagsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTagsOutputResponse, DescribeTagsOutputError>) -> Void)
```

### describeTrafficMirrorFilters(input:completion:)

Describes one or more Traffic Mirror filters.

``` swift
func describeTrafficMirrorFilters(input: DescribeTrafficMirrorFiltersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTrafficMirrorFiltersOutputResponse, DescribeTrafficMirrorFiltersOutputError>) -> Void)
```

### describeTrafficMirrorSessions(input:completion:)

Describes one or more Traffic Mirror sessions. By default, all Traffic Mirror sessions are described. Alternatively, you can filter the results.

``` swift
func describeTrafficMirrorSessions(input: DescribeTrafficMirrorSessionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTrafficMirrorSessionsOutputResponse, DescribeTrafficMirrorSessionsOutputError>) -> Void)
```

### describeTrafficMirrorTargets(input:completion:)

Information about one or more Traffic Mirror targets.

``` swift
func describeTrafficMirrorTargets(input: DescribeTrafficMirrorTargetsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTrafficMirrorTargetsOutputResponse, DescribeTrafficMirrorTargetsOutputError>) -> Void)
```

### describeTransitGatewayAttachments(input:completion:)

Describes one or more attachments between resources and transit gateways. By default, all attachments are described. Alternatively, you can filter the results by attachment ID, attachment state, resource ID, or resource owner.

``` swift
func describeTransitGatewayAttachments(input: DescribeTransitGatewayAttachmentsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTransitGatewayAttachmentsOutputResponse, DescribeTransitGatewayAttachmentsOutputError>) -> Void)
```

### describeTransitGatewayConnectPeers(input:completion:)

Describes one or more Connect peers.

``` swift
func describeTransitGatewayConnectPeers(input: DescribeTransitGatewayConnectPeersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTransitGatewayConnectPeersOutputResponse, DescribeTransitGatewayConnectPeersOutputError>) -> Void)
```

### describeTransitGatewayConnects(input:completion:)

Describes one or more Connect attachments.

``` swift
func describeTransitGatewayConnects(input: DescribeTransitGatewayConnectsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTransitGatewayConnectsOutputResponse, DescribeTransitGatewayConnectsOutputError>) -> Void)
```

### describeTransitGatewayMulticastDomains(input:completion:)

Describes one or more transit gateway multicast domains.

``` swift
func describeTransitGatewayMulticastDomains(input: DescribeTransitGatewayMulticastDomainsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTransitGatewayMulticastDomainsOutputResponse, DescribeTransitGatewayMulticastDomainsOutputError>) -> Void)
```

### describeTransitGatewayPeeringAttachments(input:completion:)

Describes your transit gateway peering attachments.

``` swift
func describeTransitGatewayPeeringAttachments(input: DescribeTransitGatewayPeeringAttachmentsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTransitGatewayPeeringAttachmentsOutputResponse, DescribeTransitGatewayPeeringAttachmentsOutputError>) -> Void)
```

### describeTransitGatewayRouteTables(input:completion:)

Describes one or more transit gateway route tables. By default, all transit gateway route tables are described. Alternatively, you can filter the results.

``` swift
func describeTransitGatewayRouteTables(input: DescribeTransitGatewayRouteTablesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTransitGatewayRouteTablesOutputResponse, DescribeTransitGatewayRouteTablesOutputError>) -> Void)
```

### describeTransitGateways(input:completion:)

Describes one or more transit gateways. By default, all transit gateways are described. Alternatively, you can filter the results.

``` swift
func describeTransitGateways(input: DescribeTransitGatewaysInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTransitGatewaysOutputResponse, DescribeTransitGatewaysOutputError>) -> Void)
```

### describeTransitGatewayVpcAttachments(input:completion:)

Describes one or more VPC attachments. By default, all VPC attachments are described. Alternatively, you can filter the results.

``` swift
func describeTransitGatewayVpcAttachments(input: DescribeTransitGatewayVpcAttachmentsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTransitGatewayVpcAttachmentsOutputResponse, DescribeTransitGatewayVpcAttachmentsOutputError>) -> Void)
```

### describeTrunkInterfaceAssociations(input:completion:)

This API action is currently in limited preview only. If you are interested in using this feature, contact your account manager. Describes one or more network interface trunk associations.

``` swift
func describeTrunkInterfaceAssociations(input: DescribeTrunkInterfaceAssociationsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTrunkInterfaceAssociationsOutputResponse, DescribeTrunkInterfaceAssociationsOutputError>) -> Void)
```

### describeVolumeAttribute(input:completion:)

Describes the specified attribute of the specified volume. You can specify only one attribute at a time. For more information about EBS volumes, see [Amazon EBS volumes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumes.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func describeVolumeAttribute(input: DescribeVolumeAttributeInput, completion: @escaping (ClientRuntime.SdkResult<DescribeVolumeAttributeOutputResponse, DescribeVolumeAttributeOutputError>) -> Void)
```

### describeVolumes(input:completion:)

Describes the specified EBS volumes or all of your EBS volumes. If you are describing a long list of volumes, we recommend that you paginate the output to make the list more manageable. The MaxResults parameter sets the maximum number of results returned in a single page. If the list of results exceeds your MaxResults value, then that number of results is returned along with a NextToken value that can be passed to a subsequent DescribeVolumes request to retrieve the remaining results. For more information about EBS volumes, see [Amazon EBS volumes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumes.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func describeVolumes(input: DescribeVolumesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeVolumesOutputResponse, DescribeVolumesOutputError>) -> Void)
```

### describeVolumesModifications(input:completion:)

Describes the most recent volume modification request for the specified EBS volumes. If a volume has never been modified, some information in the output will be null. If a volume has been modified more than once, the output includes only the most recent modification request. You can also use CloudWatch Events to check the status of a modification to an EBS volume. For information about CloudWatch Events, see the [Amazon CloudWatch Events User Guide](https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/). For more information, see [Monitor the progress of volume modifications](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/monitoring-volume-modifications.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func describeVolumesModifications(input: DescribeVolumesModificationsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeVolumesModificationsOutputResponse, DescribeVolumesModificationsOutputError>) -> Void)
```

### describeVolumeStatus(input:completion:)

Describes the status of the specified volumes. Volume status provides the result of the checks performed on your volumes to determine events that can impair the performance of your volumes. The performance of a volume can be affected if an issue occurs on the volume's underlying host. If the volume's underlying host experiences a power outage or system issue, after the system is restored, there could be data inconsistencies on the volume. Volume events notify you if this occurs. Volume actions notify you if any action needs to be taken in response to the event. The DescribeVolumeStatus operation provides the following information about the specified volumes: Status: Reflects the current status of the volume. The possible values are ok, impaired , warning, or insufficient-data. If all checks pass, the overall status of the volume is ok. If the check fails, the overall status is impaired. If the status is insufficient-data, then the checks might still be taking place on your volume at the time. We recommend that you retry the request. For more information about volume status, see [Monitor the status of your volumes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/monitoring-volume-status.html) in the Amazon Elastic Compute Cloud User Guide. Events: Reflect the cause of a volume status and might require you to take action. For example, if your volume returns an impaired status, then the volume event might be potential-data-inconsistency. This means that your volume has been affected by an issue with the underlying host, has all I/O operations disabled, and might have inconsistent data. Actions: Reflect the actions you might have to take in response to an event. For example, if the status of the volume is impaired and the volume event shows potential-data-inconsistency, then the action shows enable-volume-io. This means that you may want to enable the I/O operations for the volume by calling the \[EnableVolumeIO\] action and then check the volume for data consistency. Volume status is based on the volume status checks, and does not reflect the volume state. Therefore, volume status does not indicate volumes in the error state (for example, when a volume is incapable of accepting I/O.)

``` swift
func describeVolumeStatus(input: DescribeVolumeStatusInput, completion: @escaping (ClientRuntime.SdkResult<DescribeVolumeStatusOutputResponse, DescribeVolumeStatusOutputError>) -> Void)
```

### describeVpcAttribute(input:completion:)

Describes the specified attribute of the specified VPC. You can specify only one attribute at a time.

``` swift
func describeVpcAttribute(input: DescribeVpcAttributeInput, completion: @escaping (ClientRuntime.SdkResult<DescribeVpcAttributeOutputResponse, DescribeVpcAttributeOutputError>) -> Void)
```

### describeVpcClassicLink(input:completion:)

Describes the ClassicLink status of one or more VPCs.

``` swift
func describeVpcClassicLink(input: DescribeVpcClassicLinkInput, completion: @escaping (ClientRuntime.SdkResult<DescribeVpcClassicLinkOutputResponse, DescribeVpcClassicLinkOutputError>) -> Void)
```

### describeVpcClassicLinkDnsSupport(input:completion:)

Describes the ClassicLink DNS support status of one or more VPCs. If enabled, the DNS hostname of a linked EC2-Classic instance resolves to its private IP address when addressed from an instance in the VPC to which it's linked. Similarly, the DNS hostname of an instance in a VPC resolves to its private IP address when addressed from a linked EC2-Classic instance. For more information, see [ClassicLink](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func describeVpcClassicLinkDnsSupport(input: DescribeVpcClassicLinkDnsSupportInput, completion: @escaping (ClientRuntime.SdkResult<DescribeVpcClassicLinkDnsSupportOutputResponse, DescribeVpcClassicLinkDnsSupportOutputError>) -> Void)
```

### describeVpcEndpointConnectionNotifications(input:completion:)

Describes the connection notifications for VPC endpoints and VPC endpoint services.

``` swift
func describeVpcEndpointConnectionNotifications(input: DescribeVpcEndpointConnectionNotificationsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeVpcEndpointConnectionNotificationsOutputResponse, DescribeVpcEndpointConnectionNotificationsOutputError>) -> Void)
```

### describeVpcEndpointConnections(input:completion:)

Describes the VPC endpoint connections to your VPC endpoint services, including any endpoints that are pending your acceptance.

``` swift
func describeVpcEndpointConnections(input: DescribeVpcEndpointConnectionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeVpcEndpointConnectionsOutputResponse, DescribeVpcEndpointConnectionsOutputError>) -> Void)
```

### describeVpcEndpoints(input:completion:)

Describes one or more of your VPC endpoints.

``` swift
func describeVpcEndpoints(input: DescribeVpcEndpointsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeVpcEndpointsOutputResponse, DescribeVpcEndpointsOutputError>) -> Void)
```

### describeVpcEndpointServiceConfigurations(input:completion:)

Describes the VPC endpoint service configurations in your account (your services).

``` swift
func describeVpcEndpointServiceConfigurations(input: DescribeVpcEndpointServiceConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeVpcEndpointServiceConfigurationsOutputResponse, DescribeVpcEndpointServiceConfigurationsOutputError>) -> Void)
```

### describeVpcEndpointServicePermissions(input:completion:)

Describes the principals (service consumers) that are permitted to discover your VPC endpoint service.

``` swift
func describeVpcEndpointServicePermissions(input: DescribeVpcEndpointServicePermissionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeVpcEndpointServicePermissionsOutputResponse, DescribeVpcEndpointServicePermissionsOutputError>) -> Void)
```

### describeVpcEndpointServices(input:completion:)

Describes available services to which you can create a VPC endpoint. When the service provider and the consumer have different accounts in multiple Availability Zones, and the consumer views the VPC endpoint service information, the response only includes the common Availability Zones. For example, when the service provider account uses us-east-1a and us-east-1c and the consumer uses us-east-1a and us-east-1b, the response includes the VPC endpoint services in the common Availability Zone, us-east-1a.

``` swift
func describeVpcEndpointServices(input: DescribeVpcEndpointServicesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeVpcEndpointServicesOutputResponse, DescribeVpcEndpointServicesOutputError>) -> Void)
```

### describeVpcPeeringConnections(input:completion:)

Describes one or more of your VPC peering connections.

``` swift
func describeVpcPeeringConnections(input: DescribeVpcPeeringConnectionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeVpcPeeringConnectionsOutputResponse, DescribeVpcPeeringConnectionsOutputError>) -> Void)
```

### describeVpcs(input:completion:)

Describes one or more of your VPCs.

``` swift
func describeVpcs(input: DescribeVpcsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeVpcsOutputResponse, DescribeVpcsOutputError>) -> Void)
```

### describeVpnConnections(input:completion:)

Describes one or more of your VPN connections. For more information, see [Amazon Web Services Site-to-Site VPN](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html) in the Amazon Web Services Site-to-Site VPN User Guide.

``` swift
func describeVpnConnections(input: DescribeVpnConnectionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeVpnConnectionsOutputResponse, DescribeVpnConnectionsOutputError>) -> Void)
```

### describeVpnGateways(input:completion:)

Describes one or more of your virtual private gateways. For more information, see [Amazon Web Services Site-to-Site VPN](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html) in the Amazon Web Services Site-to-Site VPN User Guide.

``` swift
func describeVpnGateways(input: DescribeVpnGatewaysInput, completion: @escaping (ClientRuntime.SdkResult<DescribeVpnGatewaysOutputResponse, DescribeVpnGatewaysOutputError>) -> Void)
```

### detachClassicLinkVpc(input:completion:)

Unlinks (detaches) a linked EC2-Classic instance from a VPC. After the instance has been unlinked, the VPC security groups are no longer associated with it. An instance is automatically unlinked from a VPC when it's stopped.

``` swift
func detachClassicLinkVpc(input: DetachClassicLinkVpcInput, completion: @escaping (ClientRuntime.SdkResult<DetachClassicLinkVpcOutputResponse, DetachClassicLinkVpcOutputError>) -> Void)
```

### detachInternetGateway(input:completion:)

Detaches an internet gateway from a VPC, disabling connectivity between the internet and the VPC. The VPC must not contain any running instances with Elastic IP addresses or public IPv4 addresses.

``` swift
func detachInternetGateway(input: DetachInternetGatewayInput, completion: @escaping (ClientRuntime.SdkResult<DetachInternetGatewayOutputResponse, DetachInternetGatewayOutputError>) -> Void)
```

### detachNetworkInterface(input:completion:)

Detaches a network interface from an instance.

``` swift
func detachNetworkInterface(input: DetachNetworkInterfaceInput, completion: @escaping (ClientRuntime.SdkResult<DetachNetworkInterfaceOutputResponse, DetachNetworkInterfaceOutputError>) -> Void)
```

### detachVolume(input:completion:)

Detaches an EBS volume from an instance. Make sure to unmount any file systems on the device within your operating system before detaching the volume. Failure to do so can result in the volume becoming stuck in the busy state while detaching. If this happens, detachment can be delayed indefinitely until you unmount the volume, force detachment, reboot the instance, or all three. If an EBS volume is the root device of an instance, it can't be detached while the instance is running. To detach the root volume, stop the instance first. When a volume with an Amazon Web Services Marketplace product code is detached from an instance, the product code is no longer associated with the instance. For more information, see [Detach an Amazon EBS volume](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-detaching-volume.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func detachVolume(input: DetachVolumeInput, completion: @escaping (ClientRuntime.SdkResult<DetachVolumeOutputResponse, DetachVolumeOutputError>) -> Void)
```

### detachVpnGateway(input:completion:)

Detaches a virtual private gateway from a VPC. You do this if you're planning to turn off the VPC and not use it anymore. You can confirm a virtual private gateway has been completely detached from a VPC by describing the virtual private gateway (any attachments to the virtual private gateway are also described). You must wait for the attachment's state to switch to detached before you can delete the VPC or attach a different VPC to the virtual private gateway.

``` swift
func detachVpnGateway(input: DetachVpnGatewayInput, completion: @escaping (ClientRuntime.SdkResult<DetachVpnGatewayOutputResponse, DetachVpnGatewayOutputError>) -> Void)
```

### disableEbsEncryptionByDefault(input:completion:)

Disables EBS encryption by default for your account in the current Region. After you disable encryption by default, you can still create encrypted volumes by enabling encryption when you create each volume. Disabling encryption by default does not change the encryption status of your existing volumes. For more information, see [Amazon EBS encryption](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func disableEbsEncryptionByDefault(input: DisableEbsEncryptionByDefaultInput, completion: @escaping (ClientRuntime.SdkResult<DisableEbsEncryptionByDefaultOutputResponse, DisableEbsEncryptionByDefaultOutputError>) -> Void)
```

### disableFastSnapshotRestores(input:completion:)

Disables fast snapshot restores for the specified snapshots in the specified Availability Zones.

``` swift
func disableFastSnapshotRestores(input: DisableFastSnapshotRestoresInput, completion: @escaping (ClientRuntime.SdkResult<DisableFastSnapshotRestoresOutputResponse, DisableFastSnapshotRestoresOutputError>) -> Void)
```

### disableImageDeprecation(input:completion:)

Cancels the deprecation of the specified AMI. For more information, see [Deprecate an AMI](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ami-deprecate.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func disableImageDeprecation(input: DisableImageDeprecationInput, completion: @escaping (ClientRuntime.SdkResult<DisableImageDeprecationOutputResponse, DisableImageDeprecationOutputError>) -> Void)
```

### disableSerialConsoleAccess(input:completion:)

Disables access to the EC2 serial console of all instances for your account. By default, access to the EC2 serial console is disabled for your account. For more information, see [Manage account access to the EC2 serial console](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configure-access-to-serial-console.html#serial-console-account-access) in the Amazon EC2 User Guide.

``` swift
func disableSerialConsoleAccess(input: DisableSerialConsoleAccessInput, completion: @escaping (ClientRuntime.SdkResult<DisableSerialConsoleAccessOutputResponse, DisableSerialConsoleAccessOutputError>) -> Void)
```

### disableTransitGatewayRouteTablePropagation(input:completion:)

Disables the specified resource attachment from propagating routes to the specified propagation route table.

``` swift
func disableTransitGatewayRouteTablePropagation(input: DisableTransitGatewayRouteTablePropagationInput, completion: @escaping (ClientRuntime.SdkResult<DisableTransitGatewayRouteTablePropagationOutputResponse, DisableTransitGatewayRouteTablePropagationOutputError>) -> Void)
```

### disableVgwRoutePropagation(input:completion:)

Disables a virtual private gateway (VGW) from propagating routes to a specified route table of a VPC.

``` swift
func disableVgwRoutePropagation(input: DisableVgwRoutePropagationInput, completion: @escaping (ClientRuntime.SdkResult<DisableVgwRoutePropagationOutputResponse, DisableVgwRoutePropagationOutputError>) -> Void)
```

### disableVpcClassicLink(input:completion:)

Disables ClassicLink for a VPC. You cannot disable ClassicLink for a VPC that has EC2-Classic instances linked to it.

``` swift
func disableVpcClassicLink(input: DisableVpcClassicLinkInput, completion: @escaping (ClientRuntime.SdkResult<DisableVpcClassicLinkOutputResponse, DisableVpcClassicLinkOutputError>) -> Void)
```

### disableVpcClassicLinkDnsSupport(input:completion:)

Disables ClassicLink DNS support for a VPC. If disabled, DNS hostnames resolve to public IP addresses when addressed between a linked EC2-Classic instance and instances in the VPC to which it's linked. For more information, see [ClassicLink](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html) in the Amazon Elastic Compute Cloud User Guide. You must specify a VPC ID in the request.

``` swift
func disableVpcClassicLinkDnsSupport(input: DisableVpcClassicLinkDnsSupportInput, completion: @escaping (ClientRuntime.SdkResult<DisableVpcClassicLinkDnsSupportOutputResponse, DisableVpcClassicLinkDnsSupportOutputError>) -> Void)
```

### disassociateAddress(input:completion:)

Disassociates an Elastic IP address from the instance or network interface it's associated with. An Elastic IP address is for use in either the EC2-Classic platform or in a VPC. For more information, see [Elastic IP Addresses](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html) in the Amazon Elastic Compute Cloud User Guide. This is an idempotent operation. If you perform the operation more than once, Amazon EC2 doesn't return an error.

``` swift
func disassociateAddress(input: DisassociateAddressInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateAddressOutputResponse, DisassociateAddressOutputError>) -> Void)
```

### disassociateClientVpnTargetNetwork(input:completion:)

Disassociates a target network from the specified Client VPN endpoint. When you disassociate the last target network from a Client VPN, the following happens:

``` swift
func disassociateClientVpnTargetNetwork(input: DisassociateClientVpnTargetNetworkInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateClientVpnTargetNetworkOutputResponse, DisassociateClientVpnTargetNetworkOutputError>) -> Void)
```

  - The route that was automatically added for the VPC is deleted

  - All active client connections are terminated

  - New client connections are disallowed

  - The Client VPN endpoint's status changes to pending-associate

### disassociateEnclaveCertificateIamRole(input:completion:)

Disassociates an IAM role from an Certificate Manager (ACM) certificate. Disassociating an IAM role from an ACM certificate removes the Amazon S3 object that contains the certificate, certificate chain, and encrypted private key from the Amazon S3 bucket. It also revokes the IAM role's permission to use the KMS key used to encrypt the private key. This effectively revokes the role's permission to use the certificate.

``` swift
func disassociateEnclaveCertificateIamRole(input: DisassociateEnclaveCertificateIamRoleInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateEnclaveCertificateIamRoleOutputResponse, DisassociateEnclaveCertificateIamRoleOutputError>) -> Void)
```

### disassociateIamInstanceProfile(input:completion:)

Disassociates an IAM instance profile from a running or stopped instance. Use \[DescribeIamInstanceProfileAssociations\] to get the association ID.

``` swift
func disassociateIamInstanceProfile(input: DisassociateIamInstanceProfileInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateIamInstanceProfileOutputResponse, DisassociateIamInstanceProfileOutputError>) -> Void)
```

### disassociateInstanceEventWindow(input:completion:)

Disassociates one or more targets from an event window. For more information, see [Define event windows for scheduled events](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/event-windows.html) in the Amazon EC2 User Guide.

``` swift
func disassociateInstanceEventWindow(input: DisassociateInstanceEventWindowInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateInstanceEventWindowOutputResponse, DisassociateInstanceEventWindowOutputError>) -> Void)
```

### disassociateRouteTable(input:completion:)

Disassociates a subnet or gateway from a route table. After you perform this action, the subnet no longer uses the routes in the route table. Instead, it uses the routes in the VPC's main route table. For more information about route tables, see [Route tables](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html) in the Amazon Virtual Private Cloud User Guide.

``` swift
func disassociateRouteTable(input: DisassociateRouteTableInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateRouteTableOutputResponse, DisassociateRouteTableOutputError>) -> Void)
```

### disassociateSubnetCidrBlock(input:completion:)

Disassociates a CIDR block from a subnet. Currently, you can disassociate an IPv6 CIDR block only. You must detach or delete all gateways and resources that are associated with the CIDR block before you can disassociate it.

``` swift
func disassociateSubnetCidrBlock(input: DisassociateSubnetCidrBlockInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateSubnetCidrBlockOutputResponse, DisassociateSubnetCidrBlockOutputError>) -> Void)
```

### disassociateTransitGatewayMulticastDomain(input:completion:)

Disassociates the specified subnets from the transit gateway multicast domain.

``` swift
func disassociateTransitGatewayMulticastDomain(input: DisassociateTransitGatewayMulticastDomainInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateTransitGatewayMulticastDomainOutputResponse, DisassociateTransitGatewayMulticastDomainOutputError>) -> Void)
```

### disassociateTransitGatewayRouteTable(input:completion:)

Disassociates a resource attachment from a transit gateway route table.

``` swift
func disassociateTransitGatewayRouteTable(input: DisassociateTransitGatewayRouteTableInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateTransitGatewayRouteTableOutputResponse, DisassociateTransitGatewayRouteTableOutputError>) -> Void)
```

### disassociateTrunkInterface(input:completion:)

This API action is currently in limited preview only. If you are interested in using this feature, contact your account manager. Removes an association between a branch network interface with a trunk network interface.

``` swift
func disassociateTrunkInterface(input: DisassociateTrunkInterfaceInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateTrunkInterfaceOutputResponse, DisassociateTrunkInterfaceOutputError>) -> Void)
```

### disassociateVpcCidrBlock(input:completion:)

Disassociates a CIDR block from a VPC. To disassociate the CIDR block, you must specify its association ID. You can get the association ID by using \[DescribeVpcs\]. You must detach or delete all gateways and resources that are associated with the CIDR block before you can disassociate it. You cannot disassociate the CIDR block with which you originally created the VPC (the primary CIDR block).

``` swift
func disassociateVpcCidrBlock(input: DisassociateVpcCidrBlockInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateVpcCidrBlockOutputResponse, DisassociateVpcCidrBlockOutputError>) -> Void)
```

### enableEbsEncryptionByDefault(input:completion:)

Enables EBS encryption by default for your account in the current Region. After you enable encryption by default, the EBS volumes that you create are always encrypted, either using the default KMS key or the KMS key that you specified when you created each volume. For more information, see [Amazon EBS encryption](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html) in the Amazon Elastic Compute Cloud User Guide. You can specify the default KMS key for encryption by default using \[ModifyEbsDefaultKmsKeyId\] or \[ResetEbsDefaultKmsKeyId\]. Enabling encryption by default has no effect on the encryption status of your existing volumes. After you enable encryption by default, you can no longer launch instances using instance types that do not support encryption. For more information, see [Supported instance types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html#EBSEncryption_supported_instances).

``` swift
func enableEbsEncryptionByDefault(input: EnableEbsEncryptionByDefaultInput, completion: @escaping (ClientRuntime.SdkResult<EnableEbsEncryptionByDefaultOutputResponse, EnableEbsEncryptionByDefaultOutputError>) -> Void)
```

### enableFastSnapshotRestores(input:completion:)

Enables fast snapshot restores for the specified snapshots in the specified Availability Zones. You get the full benefit of fast snapshot restores after they enter the enabled state. To get the current state of fast snapshot restores, use \[DescribeFastSnapshotRestores\]. To disable fast snapshot restores, use \[DisableFastSnapshotRestores\]. For more information, see [Amazon EBS fast snapshot restore](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-fast-snapshot-restore.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func enableFastSnapshotRestores(input: EnableFastSnapshotRestoresInput, completion: @escaping (ClientRuntime.SdkResult<EnableFastSnapshotRestoresOutputResponse, EnableFastSnapshotRestoresOutputError>) -> Void)
```

### enableImageDeprecation(input:completion:)

Enables deprecation of the specified AMI at the specified date and time. For more information, see [Deprecate an AMI](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ami-deprecate.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func enableImageDeprecation(input: EnableImageDeprecationInput, completion: @escaping (ClientRuntime.SdkResult<EnableImageDeprecationOutputResponse, EnableImageDeprecationOutputError>) -> Void)
```

### enableSerialConsoleAccess(input:completion:)

Enables access to the EC2 serial console of all instances for your account. By default, access to the EC2 serial console is disabled for your account. For more information, see [Manage account access to the EC2 serial console](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configure-access-to-serial-console.html#serial-console-account-access) in the Amazon EC2 User Guide.

``` swift
func enableSerialConsoleAccess(input: EnableSerialConsoleAccessInput, completion: @escaping (ClientRuntime.SdkResult<EnableSerialConsoleAccessOutputResponse, EnableSerialConsoleAccessOutputError>) -> Void)
```

### enableTransitGatewayRouteTablePropagation(input:completion:)

Enables the specified attachment to propagate routes to the specified propagation route table.

``` swift
func enableTransitGatewayRouteTablePropagation(input: EnableTransitGatewayRouteTablePropagationInput, completion: @escaping (ClientRuntime.SdkResult<EnableTransitGatewayRouteTablePropagationOutputResponse, EnableTransitGatewayRouteTablePropagationOutputError>) -> Void)
```

### enableVgwRoutePropagation(input:completion:)

Enables a virtual private gateway (VGW) to propagate routes to the specified route table of a VPC.

``` swift
func enableVgwRoutePropagation(input: EnableVgwRoutePropagationInput, completion: @escaping (ClientRuntime.SdkResult<EnableVgwRoutePropagationOutputResponse, EnableVgwRoutePropagationOutputError>) -> Void)
```

### enableVolumeIO(input:completion:)

Enables I/O operations for a volume that had I/O operations disabled because the data on the volume was potentially inconsistent.

``` swift
func enableVolumeIO(input: EnableVolumeIOInput, completion: @escaping (ClientRuntime.SdkResult<EnableVolumeIOOutputResponse, EnableVolumeIOOutputError>) -> Void)
```

### enableVpcClassicLink(input:completion:)

Enables a VPC for ClassicLink. You can then link EC2-Classic instances to your ClassicLink-enabled VPC to allow communication over private IP addresses. You cannot enable your VPC for ClassicLink if any of your VPC route tables have existing routes for address ranges within the 10.0.0.0/8 IP address range, excluding local routes for VPCs in the 10.0.0.0/16 and 10.1.0.0/16 IP address ranges. For more information, see [ClassicLink](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func enableVpcClassicLink(input: EnableVpcClassicLinkInput, completion: @escaping (ClientRuntime.SdkResult<EnableVpcClassicLinkOutputResponse, EnableVpcClassicLinkOutputError>) -> Void)
```

### enableVpcClassicLinkDnsSupport(input:completion:)

Enables a VPC to support DNS hostname resolution for ClassicLink. If enabled, the DNS hostname of a linked EC2-Classic instance resolves to its private IP address when addressed from an instance in the VPC to which it's linked. Similarly, the DNS hostname of an instance in a VPC resolves to its private IP address when addressed from a linked EC2-Classic instance. For more information, see [ClassicLink](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html) in the Amazon Elastic Compute Cloud User Guide. You must specify a VPC ID in the request.

``` swift
func enableVpcClassicLinkDnsSupport(input: EnableVpcClassicLinkDnsSupportInput, completion: @escaping (ClientRuntime.SdkResult<EnableVpcClassicLinkDnsSupportOutputResponse, EnableVpcClassicLinkDnsSupportOutputError>) -> Void)
```

### exportClientVpnClientCertificateRevocationList(input:completion:)

Downloads the client certificate revocation list for the specified Client VPN endpoint.

``` swift
func exportClientVpnClientCertificateRevocationList(input: ExportClientVpnClientCertificateRevocationListInput, completion: @escaping (ClientRuntime.SdkResult<ExportClientVpnClientCertificateRevocationListOutputResponse, ExportClientVpnClientCertificateRevocationListOutputError>) -> Void)
```

### exportClientVpnClientConfiguration(input:completion:)

Downloads the contents of the Client VPN endpoint configuration file for the specified Client VPN endpoint. The Client VPN endpoint configuration file includes the Client VPN endpoint and certificate information clients need to establish a connection with the Client VPN endpoint.

``` swift
func exportClientVpnClientConfiguration(input: ExportClientVpnClientConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<ExportClientVpnClientConfigurationOutputResponse, ExportClientVpnClientConfigurationOutputError>) -> Void)
```

### exportImage(input:completion:)

Exports an Amazon Machine Image (AMI) to a VM file. For more information, see [Exporting a VM directly from an Amazon Machine Image (AMI)](https://docs.aws.amazon.com/vm-import/latest/userguide/vmexport_image.html) in the VM Import/Export User Guide.

``` swift
func exportImage(input: ExportImageInput, completion: @escaping (ClientRuntime.SdkResult<ExportImageOutputResponse, ExportImageOutputError>) -> Void)
```

### exportTransitGatewayRoutes(input:completion:)

Exports routes from the specified transit gateway route table to the specified S3 bucket. By default, all routes are exported. Alternatively, you can filter by CIDR range. The routes are saved to the specified bucket in a JSON file. For more information, see [Export Route Tables to Amazon S3](https://docs.aws.amazon.com/vpc/latest/tgw/tgw-route-tables.html#tgw-export-route-tables) in Transit Gateways.

``` swift
func exportTransitGatewayRoutes(input: ExportTransitGatewayRoutesInput, completion: @escaping (ClientRuntime.SdkResult<ExportTransitGatewayRoutesOutputResponse, ExportTransitGatewayRoutesOutputError>) -> Void)
```

### getAssociatedEnclaveCertificateIamRoles(input:completion:)

Returns the IAM roles that are associated with the specified ACM (ACM) certificate. It also returns the name of the Amazon S3 bucket and the Amazon S3 object key where the certificate, certificate chain, and encrypted private key bundle are stored, and the ARN of the KMS key that's used to encrypt the private key.

``` swift
func getAssociatedEnclaveCertificateIamRoles(input: GetAssociatedEnclaveCertificateIamRolesInput, completion: @escaping (ClientRuntime.SdkResult<GetAssociatedEnclaveCertificateIamRolesOutputResponse, GetAssociatedEnclaveCertificateIamRolesOutputError>) -> Void)
```

### getAssociatedIpv6PoolCidrs(input:completion:)

Gets information about the IPv6 CIDR block associations for a specified IPv6 address pool.

``` swift
func getAssociatedIpv6PoolCidrs(input: GetAssociatedIpv6PoolCidrsInput, completion: @escaping (ClientRuntime.SdkResult<GetAssociatedIpv6PoolCidrsOutputResponse, GetAssociatedIpv6PoolCidrsOutputError>) -> Void)
```

### getCapacityReservationUsage(input:completion:)

Gets usage information about a Capacity Reservation. If the Capacity Reservation is shared, it shows usage information for the Capacity Reservation owner and each Amazon Web Services account that is currently using the shared capacity. If the Capacity Reservation is not shared, it shows only the Capacity Reservation owner's usage.

``` swift
func getCapacityReservationUsage(input: GetCapacityReservationUsageInput, completion: @escaping (ClientRuntime.SdkResult<GetCapacityReservationUsageOutputResponse, GetCapacityReservationUsageOutputError>) -> Void)
```

### getCoipPoolUsage(input:completion:)

Describes the allocations from the specified customer-owned address pool.

``` swift
func getCoipPoolUsage(input: GetCoipPoolUsageInput, completion: @escaping (ClientRuntime.SdkResult<GetCoipPoolUsageOutputResponse, GetCoipPoolUsageOutputError>) -> Void)
```

### getConsoleOutput(input:completion:)

Gets the console output for the specified instance. For Linux instances, the instance console output displays the exact console output that would normally be displayed on a physical monitor attached to a computer. For Windows instances, the instance console output includes the last three system event log errors. By default, the console output returns buffered information that was posted shortly after an instance transition state (start, stop, reboot, or terminate). This information is available for at least one hour after the most recent post. Only the most recent 64 KB of console output is available. You can optionally retrieve the latest serial console output at any time during the instance lifecycle. This option is supported on instance types that use the Nitro hypervisor. For more information, see [Instance console output](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-console.html#instance-console-console-output) in the Amazon EC2 User Guide.

``` swift
func getConsoleOutput(input: GetConsoleOutputInput, completion: @escaping (ClientRuntime.SdkResult<GetConsoleOutputOutputResponse, GetConsoleOutputOutputError>) -> Void)
```

### getConsoleScreenshot(input:completion:)

Retrieve a JPG-format screenshot of a running instance to help with troubleshooting. The returned content is Base64-encoded.

``` swift
func getConsoleScreenshot(input: GetConsoleScreenshotInput, completion: @escaping (ClientRuntime.SdkResult<GetConsoleScreenshotOutputResponse, GetConsoleScreenshotOutputError>) -> Void)
```

### getDefaultCreditSpecification(input:completion:)

Describes the default credit option for CPU usage of a burstable performance instance family. For more information, see [Burstable performance instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/burstable-performance-instances.html) in the Amazon EC2 User Guide.

``` swift
func getDefaultCreditSpecification(input: GetDefaultCreditSpecificationInput, completion: @escaping (ClientRuntime.SdkResult<GetDefaultCreditSpecificationOutputResponse, GetDefaultCreditSpecificationOutputError>) -> Void)
```

### getEbsDefaultKmsKeyId(input:completion:)

Describes the default KMS key for EBS encryption by default for your account in this Region. You can change the default KMS key for encryption by default using \[ModifyEbsDefaultKmsKeyId\] or \[ResetEbsDefaultKmsKeyId\]. For more information, see [Amazon EBS encryption](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func getEbsDefaultKmsKeyId(input: GetEbsDefaultKmsKeyIdInput, completion: @escaping (ClientRuntime.SdkResult<GetEbsDefaultKmsKeyIdOutputResponse, GetEbsDefaultKmsKeyIdOutputError>) -> Void)
```

### getEbsEncryptionByDefault(input:completion:)

Describes whether EBS encryption by default is enabled for your account in the current Region. For more information, see [Amazon EBS encryption](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func getEbsEncryptionByDefault(input: GetEbsEncryptionByDefaultInput, completion: @escaping (ClientRuntime.SdkResult<GetEbsEncryptionByDefaultOutputResponse, GetEbsEncryptionByDefaultOutputError>) -> Void)
```

### getFlowLogsIntegrationTemplate(input:completion:)

Generates a CloudFormation template that streamlines and automates the integration of VPC flow logs with Amazon Athena. This make it easier for you to query and gain insights from VPC flow logs data. Based on the information that you provide, we configure resources in the template to do the following:

``` swift
func getFlowLogsIntegrationTemplate(input: GetFlowLogsIntegrationTemplateInput, completion: @escaping (ClientRuntime.SdkResult<GetFlowLogsIntegrationTemplateOutputResponse, GetFlowLogsIntegrationTemplateOutputError>) -> Void)
```

  - Create a table in Athena that maps fields to a custom log format

  - Create a Lambda function that updates the table with new partitions on a daily, weekly, or monthly basis

  - Create a table partitioned between two timestamps in the past

  - Create a set of named queries in Athena that you can use to get started quickly

### getGroupsForCapacityReservation(input:completion:)

Lists the resource groups to which a Capacity Reservation has been added.

``` swift
func getGroupsForCapacityReservation(input: GetGroupsForCapacityReservationInput, completion: @escaping (ClientRuntime.SdkResult<GetGroupsForCapacityReservationOutputResponse, GetGroupsForCapacityReservationOutputError>) -> Void)
```

### getHostReservationPurchasePreview(input:completion:)

Preview a reservation purchase with configurations that match those of your Dedicated Host. You must have active Dedicated Hosts in your account before you purchase a reservation. This is a preview of the \[PurchaseHostReservation\] action and does not result in the offering being purchased.

``` swift
func getHostReservationPurchasePreview(input: GetHostReservationPurchasePreviewInput, completion: @escaping (ClientRuntime.SdkResult<GetHostReservationPurchasePreviewOutputResponse, GetHostReservationPurchasePreviewOutputError>) -> Void)
```

### getLaunchTemplateData(input:completion:)

Retrieves the configuration data of the specified instance. You can use this data to create a launch template. This action calls on other describe actions to get instance information. Depending on your instance configuration, you may need to allow the following actions in your IAM policy: DescribeSpotInstanceRequests, DescribeInstanceCreditSpecifications, DescribeVolumes, DescribeInstanceAttribute, and DescribeElasticGpus. Or, you can allow describe\* depending on your instance requirements.

``` swift
func getLaunchTemplateData(input: GetLaunchTemplateDataInput, completion: @escaping (ClientRuntime.SdkResult<GetLaunchTemplateDataOutputResponse, GetLaunchTemplateDataOutputError>) -> Void)
```

### getManagedPrefixListAssociations(input:completion:)

Gets information about the resources that are associated with the specified managed prefix list.

``` swift
func getManagedPrefixListAssociations(input: GetManagedPrefixListAssociationsInput, completion: @escaping (ClientRuntime.SdkResult<GetManagedPrefixListAssociationsOutputResponse, GetManagedPrefixListAssociationsOutputError>) -> Void)
```

### getManagedPrefixListEntries(input:completion:)

Gets information about the entries for a specified managed prefix list.

``` swift
func getManagedPrefixListEntries(input: GetManagedPrefixListEntriesInput, completion: @escaping (ClientRuntime.SdkResult<GetManagedPrefixListEntriesOutputResponse, GetManagedPrefixListEntriesOutputError>) -> Void)
```

### getPasswordData(input:completion:)

Retrieves the encrypted administrator password for a running Windows instance. The Windows password is generated at boot by the EC2Config service or EC2Launch scripts (Windows Server 2016 and later). This usually only happens the first time an instance is launched. For more information, see [EC2Config](https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/UsingConfig_WinAMI.html) and [EC2Launch](https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ec2launch.html) in the Amazon EC2 User Guide. For the EC2Config service, the password is not generated for rebundled AMIs unless Ec2SetPassword is enabled before bundling. The password is encrypted using the key pair that you specified when you launched the instance. You must provide the corresponding key pair file. When you launch an instance, password generation and encryption may take a few minutes. If you try to retrieve the password before it's available, the output returns an empty string. We recommend that you wait up to 15 minutes after launching an instance before trying to retrieve the generated password.

``` swift
func getPasswordData(input: GetPasswordDataInput, completion: @escaping (ClientRuntime.SdkResult<GetPasswordDataOutputResponse, GetPasswordDataOutputError>) -> Void)
```

### getReservedInstancesExchangeQuote(input:completion:)

Returns a quote and exchange information for exchanging one or more specified Convertible Reserved Instances for a new Convertible Reserved Instance. If the exchange cannot be performed, the reason is returned in the response. Use \[AcceptReservedInstancesExchangeQuote\] to perform the exchange.

``` swift
func getReservedInstancesExchangeQuote(input: GetReservedInstancesExchangeQuoteInput, completion: @escaping (ClientRuntime.SdkResult<GetReservedInstancesExchangeQuoteOutputResponse, GetReservedInstancesExchangeQuoteOutputError>) -> Void)
```

### getSerialConsoleAccessStatus(input:completion:)

Retrieves the access status of your account to the EC2 serial console of all instances. By default, access to the EC2 serial console is disabled for your account. For more information, see [Manage account access to the EC2 serial console](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configure-access-to-serial-console.html#serial-console-account-access) in the Amazon EC2 User Guide.

``` swift
func getSerialConsoleAccessStatus(input: GetSerialConsoleAccessStatusInput, completion: @escaping (ClientRuntime.SdkResult<GetSerialConsoleAccessStatusOutputResponse, GetSerialConsoleAccessStatusOutputError>) -> Void)
```

### getSubnetCidrReservations(input:completion:)

Gets information about the subnet CIDR reservations.

``` swift
func getSubnetCidrReservations(input: GetSubnetCidrReservationsInput, completion: @escaping (ClientRuntime.SdkResult<GetSubnetCidrReservationsOutputResponse, GetSubnetCidrReservationsOutputError>) -> Void)
```

### getTransitGatewayAttachmentPropagations(input:completion:)

Lists the route tables to which the specified resource attachment propagates routes.

``` swift
func getTransitGatewayAttachmentPropagations(input: GetTransitGatewayAttachmentPropagationsInput, completion: @escaping (ClientRuntime.SdkResult<GetTransitGatewayAttachmentPropagationsOutputResponse, GetTransitGatewayAttachmentPropagationsOutputError>) -> Void)
```

### getTransitGatewayMulticastDomainAssociations(input:completion:)

Gets information about the associations for the transit gateway multicast domain.

``` swift
func getTransitGatewayMulticastDomainAssociations(input: GetTransitGatewayMulticastDomainAssociationsInput, completion: @escaping (ClientRuntime.SdkResult<GetTransitGatewayMulticastDomainAssociationsOutputResponse, GetTransitGatewayMulticastDomainAssociationsOutputError>) -> Void)
```

### getTransitGatewayPrefixListReferences(input:completion:)

Gets information about the prefix list references in a specified transit gateway route table.

``` swift
func getTransitGatewayPrefixListReferences(input: GetTransitGatewayPrefixListReferencesInput, completion: @escaping (ClientRuntime.SdkResult<GetTransitGatewayPrefixListReferencesOutputResponse, GetTransitGatewayPrefixListReferencesOutputError>) -> Void)
```

### getTransitGatewayRouteTableAssociations(input:completion:)

Gets information about the associations for the specified transit gateway route table.

``` swift
func getTransitGatewayRouteTableAssociations(input: GetTransitGatewayRouteTableAssociationsInput, completion: @escaping (ClientRuntime.SdkResult<GetTransitGatewayRouteTableAssociationsOutputResponse, GetTransitGatewayRouteTableAssociationsOutputError>) -> Void)
```

### getTransitGatewayRouteTablePropagations(input:completion:)

Gets information about the route table propagations for the specified transit gateway route table.

``` swift
func getTransitGatewayRouteTablePropagations(input: GetTransitGatewayRouteTablePropagationsInput, completion: @escaping (ClientRuntime.SdkResult<GetTransitGatewayRouteTablePropagationsOutputResponse, GetTransitGatewayRouteTablePropagationsOutputError>) -> Void)
```

### getVpnConnectionDeviceSampleConfiguration(input:completion:)

Download an AWS-provided sample configuration file to be used with the customer gateway device specified for your Site-to-Site VPN connection.

``` swift
func getVpnConnectionDeviceSampleConfiguration(input: GetVpnConnectionDeviceSampleConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetVpnConnectionDeviceSampleConfigurationOutputResponse, GetVpnConnectionDeviceSampleConfigurationOutputError>) -> Void)
```

### getVpnConnectionDeviceTypes(input:completion:)

Obtain a list of customer gateway devices for which sample configuration files can be provided. The request has no additional parameters. You can also see the list of device types with sample configuration files available under [Your customer gateway device](https://docs.aws.amazon.com/vpn/latest/s2svpn/your-cgw.html) in the Amazon Web Services Site-to-Site VPN User Guide.

``` swift
func getVpnConnectionDeviceTypes(input: GetVpnConnectionDeviceTypesInput, completion: @escaping (ClientRuntime.SdkResult<GetVpnConnectionDeviceTypesOutputResponse, GetVpnConnectionDeviceTypesOutputError>) -> Void)
```

### importClientVpnClientCertificateRevocationList(input:completion:)

Uploads a client certificate revocation list to the specified Client VPN endpoint. Uploading a client certificate revocation list overwrites the existing client certificate revocation list. Uploading a client certificate revocation list resets existing client connections.

``` swift
func importClientVpnClientCertificateRevocationList(input: ImportClientVpnClientCertificateRevocationListInput, completion: @escaping (ClientRuntime.SdkResult<ImportClientVpnClientCertificateRevocationListOutputResponse, ImportClientVpnClientCertificateRevocationListOutputError>) -> Void)
```

### importImage(input:completion:)

Import single or multi-volume disk images or EBS snapshots into an Amazon Machine Image (AMI). For more information, see [Importing a VM as an image using VM Import/Export](https://docs.aws.amazon.com/vm-import/latest/userguide/vmimport-image-import.html) in the VM Import/Export User Guide.

``` swift
func importImage(input: ImportImageInput, completion: @escaping (ClientRuntime.SdkResult<ImportImageOutputResponse, ImportImageOutputError>) -> Void)
```

### importInstance(input:completion:)

Creates an import instance task using metadata from the specified disk image. This API action supports only single-volume VMs. To import multi-volume VMs, use \[ImportImage\] instead. This API action is not supported by the Command Line Interface (CLI). For information about using the Amazon EC2 CLI, which is deprecated, see [Importing a VM to Amazon EC2](https://awsdocs.s3.amazonaws.com/EC2/ec2-clt.pdf#UsingVirtualMachinesinAmazonEC2) in the Amazon EC2 CLI Reference PDF file. For information about the import manifest referenced by this API action, see [VM Import Manifest](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/manifest.html).

``` swift
func importInstance(input: ImportInstanceInput, completion: @escaping (ClientRuntime.SdkResult<ImportInstanceOutputResponse, ImportInstanceOutputError>) -> Void)
```

### importKeyPair(input:completion:)

Imports the public key from an RSA or ED25519 key pair that you created with a third-party tool. Compare this with \[CreateKeyPair\], in which Amazon Web Services creates the key pair and gives the keys to you (Amazon Web Services keeps a copy of the public key). With ImportKeyPair, you create the key pair and give Amazon Web Services just the public key. The private key is never transferred between you and Amazon Web Services. For more information about key pairs, see [Amazon EC2 key pairs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func importKeyPair(input: ImportKeyPairInput, completion: @escaping (ClientRuntime.SdkResult<ImportKeyPairOutputResponse, ImportKeyPairOutputError>) -> Void)
```

### importSnapshot(input:completion:)

Imports a disk into an EBS snapshot. For more information, see [Importing a disk as a snapshot using VM Import/Export](https://docs.aws.amazon.com/vm-import/latest/userguide/vmimport-import-snapshot.html) in the VM Import/Export User Guide.

``` swift
func importSnapshot(input: ImportSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<ImportSnapshotOutputResponse, ImportSnapshotOutputError>) -> Void)
```

### importVolume(input:completion:)

Creates an import volume task using metadata from the specified disk image. This API action supports only single-volume VMs. To import multi-volume VMs, use \[ImportImage\] instead. To import a disk to a snapshot, use \[ImportSnapshot\] instead. This API action is not supported by the Command Line Interface (CLI). For information about using the Amazon EC2 CLI, which is deprecated, see [Importing Disks to Amazon EBS](https://awsdocs.s3.amazonaws.com/EC2/ec2-clt.pdf#importing-your-volumes-into-amazon-ebs) in the Amazon EC2 CLI Reference PDF file. For information about the import manifest referenced by this API action, see [VM Import Manifest](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/manifest.html).

``` swift
func importVolume(input: ImportVolumeInput, completion: @escaping (ClientRuntime.SdkResult<ImportVolumeOutputResponse, ImportVolumeOutputError>) -> Void)
```

### modifyAddressAttribute(input:completion:)

Modifies an attribute of the specified Elastic IP address. For requirements, see [Using reverse DNS for email applications](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html#Using_Elastic_Addressing_Reverse_DNS).

``` swift
func modifyAddressAttribute(input: ModifyAddressAttributeInput, completion: @escaping (ClientRuntime.SdkResult<ModifyAddressAttributeOutputResponse, ModifyAddressAttributeOutputError>) -> Void)
```

### modifyAvailabilityZoneGroup(input:completion:)

Changes the opt-in status of the Local Zone and Wavelength Zone group for your account. Use [ DescribeAvailabilityZones](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeAvailabilityZones.html) to view the value for GroupName.

``` swift
func modifyAvailabilityZoneGroup(input: ModifyAvailabilityZoneGroupInput, completion: @escaping (ClientRuntime.SdkResult<ModifyAvailabilityZoneGroupOutputResponse, ModifyAvailabilityZoneGroupOutputError>) -> Void)
```

### modifyCapacityReservation(input:completion:)

Modifies a Capacity Reservation's capacity and the conditions under which it is to be released. You cannot change a Capacity Reservation's instance type, EBS optimization, instance store settings, platform, Availability Zone, or instance eligibility. If you need to modify any of these attributes, we recommend that you cancel the Capacity Reservation, and then create a new one with the required attributes.

``` swift
func modifyCapacityReservation(input: ModifyCapacityReservationInput, completion: @escaping (ClientRuntime.SdkResult<ModifyCapacityReservationOutputResponse, ModifyCapacityReservationOutputError>) -> Void)
```

### modifyClientVpnEndpoint(input:completion:)

Modifies the specified Client VPN endpoint. Modifying the DNS server resets existing client connections.

``` swift
func modifyClientVpnEndpoint(input: ModifyClientVpnEndpointInput, completion: @escaping (ClientRuntime.SdkResult<ModifyClientVpnEndpointOutputResponse, ModifyClientVpnEndpointOutputError>) -> Void)
```

### modifyDefaultCreditSpecification(input:completion:)

Modifies the default credit option for CPU usage of burstable performance instances. The default credit option is set at the account level per Amazon Web Services Region, and is specified per instance family. All new burstable performance instances in the account launch using the default credit option. ModifyDefaultCreditSpecification is an asynchronous operation, which works at an Amazon Web Services Region level and modifies the credit option for each Availability Zone. All zones in a Region are updated within five minutes. But if instances are launched during this operation, they might not get the new credit option until the zone is updated. To verify whether the update has occurred, you can call GetDefaultCreditSpecification and check DefaultCreditSpecification for updates. For more information, see [Burstable performance instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/burstable-performance-instances.html) in the Amazon EC2 User Guide.

``` swift
func modifyDefaultCreditSpecification(input: ModifyDefaultCreditSpecificationInput, completion: @escaping (ClientRuntime.SdkResult<ModifyDefaultCreditSpecificationOutputResponse, ModifyDefaultCreditSpecificationOutputError>) -> Void)
```

### modifyEbsDefaultKmsKeyId(input:completion:)

Changes the default KMS key for EBS encryption by default for your account in this Region. Amazon Web Services creates a unique Amazon Web Services managed KMS key in each Region for use with encryption by default. If you change the default KMS key to a symmetric customer managed KMS key, it is used instead of the Amazon Web Services managed KMS key. To reset the default KMS key to the Amazon Web Services managed KMS key for EBS, use \[ResetEbsDefaultKmsKeyId\]. Amazon EBS does not support asymmetric KMS keys. If you delete or disable the customer managed KMS key that you specified for use with encryption by default, your instances will fail to launch. For more information, see [Amazon EBS encryption](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func modifyEbsDefaultKmsKeyId(input: ModifyEbsDefaultKmsKeyIdInput, completion: @escaping (ClientRuntime.SdkResult<ModifyEbsDefaultKmsKeyIdOutputResponse, ModifyEbsDefaultKmsKeyIdOutputError>) -> Void)
```

### modifyFleet(input:completion:)

Modifies the specified EC2 Fleet. You can only modify an EC2 Fleet request of type maintain. While the EC2 Fleet is being modified, it is in the modifying state. To scale up your EC2 Fleet, increase its target capacity. The EC2 Fleet launches the additional Spot Instances according to the allocation strategy for the EC2 Fleet request. If the allocation strategy is lowest-price, the EC2 Fleet launches instances using the Spot Instance pool with the lowest price. If the allocation strategy is diversified, the EC2 Fleet distributes the instances across the Spot Instance pools. If the allocation strategy is capacity-optimized, EC2 Fleet launches instances from Spot Instance pools with optimal capacity for the number of instances that are launching. To scale down your EC2 Fleet, decrease its target capacity. First, the EC2 Fleet cancels any open requests that exceed the new target capacity. You can request that the EC2 Fleet terminate Spot Instances until the size of the fleet no longer exceeds the new target capacity. If the allocation strategy is lowest-price, the EC2 Fleet terminates the instances with the highest price per unit. If the allocation strategy is capacity-optimized, the EC2 Fleet terminates the instances in the Spot Instance pools that have the least available Spot Instance capacity. If the allocation strategy is diversified, the EC2 Fleet terminates instances across the Spot Instance pools. Alternatively, you can request that the EC2 Fleet keep the fleet at its current size, but not replace any Spot Instances that are interrupted or that you terminate manually. If you are finished with your EC2 Fleet for now, but will use it again later, you can set the target capacity to 0.

``` swift
func modifyFleet(input: ModifyFleetInput, completion: @escaping (ClientRuntime.SdkResult<ModifyFleetOutputResponse, ModifyFleetOutputError>) -> Void)
```

### modifyFpgaImageAttribute(input:completion:)

Modifies the specified attribute of the specified Amazon FPGA Image (AFI).

``` swift
func modifyFpgaImageAttribute(input: ModifyFpgaImageAttributeInput, completion: @escaping (ClientRuntime.SdkResult<ModifyFpgaImageAttributeOutputResponse, ModifyFpgaImageAttributeOutputError>) -> Void)
```

### modifyHosts(input:completion:)

Modify the auto-placement setting of a Dedicated Host. When auto-placement is enabled, any instances that you launch with a tenancy of host but without a specific host ID are placed onto any available Dedicated Host in your account that has auto-placement enabled. When auto-placement is disabled, you need to provide a host ID to have the instance launch onto a specific host. If no host ID is provided, the instance is launched onto a suitable host with auto-placement enabled. You can also use this API action to modify a Dedicated Host to support either multiple instance types in an instance family, or to support a specific instance type only.

``` swift
func modifyHosts(input: ModifyHostsInput, completion: @escaping (ClientRuntime.SdkResult<ModifyHostsOutputResponse, ModifyHostsOutputError>) -> Void)
```

### modifyIdentityIdFormat(input:completion:)

Modifies the ID format of a resource for a specified IAM user, IAM role, or the root user for an account; or all IAM users, IAM roles, and the root user for an account. You can specify that resources should receive longer IDs (17-character IDs) when they are created. This request can only be used to modify longer ID settings for resource types that are within the opt-in period. Resources currently in their opt-in period include: bundle | conversion-task | customer-gateway | dhcp-options | elastic-ip-allocation | elastic-ip-association | export-task | flow-log | image | import-task | internet-gateway | network-acl | network-acl-association | network-interface | network-interface-attachment | prefix-list | route-table | route-table-association | security-group | subnet | subnet-cidr-block-association | vpc | vpc-cidr-block-association | vpc-endpoint | vpc-peering-connection | vpn-connection | vpn-gateway. For more information, see [Resource IDs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/resource-ids.html) in the Amazon Elastic Compute Cloud User Guide. This setting applies to the principal specified in the request; it does not apply to the principal that makes the request. Resources created with longer IDs are visible to all IAM roles and users, regardless of these settings and provided that they have permission to use the relevant Describe command for the resource type.

``` swift
func modifyIdentityIdFormat(input: ModifyIdentityIdFormatInput, completion: @escaping (ClientRuntime.SdkResult<ModifyIdentityIdFormatOutputResponse, ModifyIdentityIdFormatOutputError>) -> Void)
```

### modifyIdFormat(input:completion:)

Modifies the ID format for the specified resource on a per-Region basis. You can specify that resources should receive longer IDs (17-character IDs) when they are created. This request can only be used to modify longer ID settings for resource types that are within the opt-in period. Resources currently in their opt-in period include: bundle | conversion-task | customer-gateway | dhcp-options | elastic-ip-allocation | elastic-ip-association | export-task | flow-log | image | import-task | internet-gateway | network-acl | network-acl-association | network-interface | network-interface-attachment | prefix-list | route-table | route-table-association | security-group | subnet | subnet-cidr-block-association | vpc | vpc-cidr-block-association | vpc-endpoint | vpc-peering-connection | vpn-connection | vpn-gateway. This setting applies to the IAM user who makes the request; it does not apply to the entire AWS account. By default, an IAM user defaults to the same settings as the root user. If you're using this action as the root user, then these settings apply to the entire account, unless an IAM user explicitly overrides these settings for themselves. For more information, see [Resource IDs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/resource-ids.html) in the Amazon Elastic Compute Cloud User Guide. Resources created with longer IDs are visible to all IAM roles and users, regardless of these settings and provided that they have permission to use the relevant Describe command for the resource type.

``` swift
func modifyIdFormat(input: ModifyIdFormatInput, completion: @escaping (ClientRuntime.SdkResult<ModifyIdFormatOutputResponse, ModifyIdFormatOutputError>) -> Void)
```

### modifyImageAttribute(input:completion:)

Modifies the specified attribute of the specified AMI. You can specify only one attribute at a time. You can use the Attribute parameter to specify the attribute or one of the following parameters: Description or LaunchPermission. Images with an Amazon Web Services Marketplace product code cannot be made public. To enable the SriovNetSupport enhanced networking attribute of an image, enable SriovNetSupport on an instance and create an AMI from the instance.

``` swift
func modifyImageAttribute(input: ModifyImageAttributeInput, completion: @escaping (ClientRuntime.SdkResult<ModifyImageAttributeOutputResponse, ModifyImageAttributeOutputError>) -> Void)
```

### modifyInstanceAttribute(input:completion:)

Modifies the specified attribute of the specified instance. You can specify only one attribute at a time. Note: Using this action to change the security groups associated with an elastic network interface (ENI) attached to an instance in a VPC can result in an error if the instance has more than one ENI. To change the security groups associated with an ENI attached to an instance that has multiple ENIs, we recommend that you use the \[ModifyNetworkInterfaceAttribute\] action. To modify some attributes, the instance must be stopped. For more information, see [Modifying attributes of a stopped instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_ChangingAttributesWhileInstanceStopped.html) in the Amazon EC2 User Guide.

``` swift
func modifyInstanceAttribute(input: ModifyInstanceAttributeInput, completion: @escaping (ClientRuntime.SdkResult<ModifyInstanceAttributeOutputResponse, ModifyInstanceAttributeOutputError>) -> Void)
```

### modifyInstanceCapacityReservationAttributes(input:completion:)

Modifies the Capacity Reservation settings for a stopped instance. Use this action to configure an instance to target a specific Capacity Reservation, run in any open Capacity Reservation with matching attributes, or run On-Demand Instance capacity.

``` swift
func modifyInstanceCapacityReservationAttributes(input: ModifyInstanceCapacityReservationAttributesInput, completion: @escaping (ClientRuntime.SdkResult<ModifyInstanceCapacityReservationAttributesOutputResponse, ModifyInstanceCapacityReservationAttributesOutputError>) -> Void)
```

### modifyInstanceCreditSpecification(input:completion:)

Modifies the credit option for CPU usage on a running or stopped burstable performance instance. The credit options are standard and unlimited. For more information, see [Burstable performance instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/burstable-performance-instances.html) in the Amazon EC2 User Guide.

``` swift
func modifyInstanceCreditSpecification(input: ModifyInstanceCreditSpecificationInput, completion: @escaping (ClientRuntime.SdkResult<ModifyInstanceCreditSpecificationOutputResponse, ModifyInstanceCreditSpecificationOutputError>) -> Void)
```

### modifyInstanceEventStartTime(input:completion:)

Modifies the start time for a scheduled Amazon EC2 instance event.

``` swift
func modifyInstanceEventStartTime(input: ModifyInstanceEventStartTimeInput, completion: @escaping (ClientRuntime.SdkResult<ModifyInstanceEventStartTimeOutputResponse, ModifyInstanceEventStartTimeOutputError>) -> Void)
```

### modifyInstanceEventWindow(input:completion:)

Modifies the specified event window. You can define either a set of time ranges or a cron expression when modifying the event window, but not both. To modify the targets associated with the event window, use the \[AssociateInstanceEventWindow\] and \[DisassociateInstanceEventWindow\] API. If Amazon Web Services has already scheduled an event, modifying an event window won't change the time of the scheduled event. For more information, see [Define event windows for scheduled events](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/event-windows.html) in the Amazon EC2 User Guide.

``` swift
func modifyInstanceEventWindow(input: ModifyInstanceEventWindowInput, completion: @escaping (ClientRuntime.SdkResult<ModifyInstanceEventWindowOutputResponse, ModifyInstanceEventWindowOutputError>) -> Void)
```

### modifyInstanceMetadataOptions(input:completion:)

Modify the instance metadata parameters on a running or stopped instance. When you modify the parameters on a stopped instance, they are applied when the instance is started. When you modify the parameters on a running instance, the API responds with a state of “pending”. After the parameter modifications are successfully applied to the instance, the state of the modifications changes from “pending” to “applied” in subsequent describe-instances API calls. For more information, see [Instance metadata and user data](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html) in the Amazon EC2 User Guide.

``` swift
func modifyInstanceMetadataOptions(input: ModifyInstanceMetadataOptionsInput, completion: @escaping (ClientRuntime.SdkResult<ModifyInstanceMetadataOptionsOutputResponse, ModifyInstanceMetadataOptionsOutputError>) -> Void)
```

### modifyInstancePlacement(input:completion:)

Modifies the placement attributes for a specified instance. You can do the following:

``` swift
func modifyInstancePlacement(input: ModifyInstancePlacementInput, completion: @escaping (ClientRuntime.SdkResult<ModifyInstancePlacementOutputResponse, ModifyInstancePlacementOutputError>) -> Void)
```

  - Modify the affinity between an instance and a [Dedicated Host](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-hosts-overview.html). When affinity is set to host and the instance is not associated with a specific Dedicated Host, the next time the instance is launched, it is automatically associated with the host on which it lands. If the instance is restarted or rebooted, this relationship persists.

  - Change the Dedicated Host with which an instance is associated.

  - Change the instance tenancy of an instance.

  - Move an instance to or from a [placement group](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html).

At least one attribute for affinity, host ID, tenancy, or placement group name must be specified in the request. Affinity and tenancy can be modified in the same request. To modify the host ID, tenancy, placement group, or partition for an instance, the instance must be in the stopped state.

### modifyLaunchTemplate(input:completion:)

Modifies a launch template. You can specify which version of the launch template to set as the default version. When launching an instance, the default version applies when a launch template version is not specified.

``` swift
func modifyLaunchTemplate(input: ModifyLaunchTemplateInput, completion: @escaping (ClientRuntime.SdkResult<ModifyLaunchTemplateOutputResponse, ModifyLaunchTemplateOutputError>) -> Void)
```

### modifyManagedPrefixList(input:completion:)

Modifies the specified managed prefix list. Adding or removing entries in a prefix list creates a new version of the prefix list. Changing the name of the prefix list does not affect the version. If you specify a current version number that does not match the true current version number, the request fails.

``` swift
func modifyManagedPrefixList(input: ModifyManagedPrefixListInput, completion: @escaping (ClientRuntime.SdkResult<ModifyManagedPrefixListOutputResponse, ModifyManagedPrefixListOutputError>) -> Void)
```

### modifyNetworkInterfaceAttribute(input:completion:)

Modifies the specified network interface attribute. You can specify only one attribute at a time. You can use this action to attach and detach security groups from an existing EC2 instance.

``` swift
func modifyNetworkInterfaceAttribute(input: ModifyNetworkInterfaceAttributeInput, completion: @escaping (ClientRuntime.SdkResult<ModifyNetworkInterfaceAttributeOutputResponse, ModifyNetworkInterfaceAttributeOutputError>) -> Void)
```

### modifyReservedInstances(input:completion:)

Modifies the Availability Zone, instance count, instance type, or network platform (EC2-Classic or EC2-VPC) of your Reserved Instances. The Reserved Instances to be modified must be identical, except for Availability Zone, network platform, and instance type. For more information, see [Modifying Reserved Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-modifying.html) in the Amazon EC2 User Guide.

``` swift
func modifyReservedInstances(input: ModifyReservedInstancesInput, completion: @escaping (ClientRuntime.SdkResult<ModifyReservedInstancesOutputResponse, ModifyReservedInstancesOutputError>) -> Void)
```

### modifySecurityGroupRules(input:completion:)

Modifies the rules of a security group.

``` swift
func modifySecurityGroupRules(input: ModifySecurityGroupRulesInput, completion: @escaping (ClientRuntime.SdkResult<ModifySecurityGroupRulesOutputResponse, ModifySecurityGroupRulesOutputError>) -> Void)
```

### modifySnapshotAttribute(input:completion:)

Adds or removes permission settings for the specified snapshot. You may add or remove specified Amazon Web Services account IDs from a snapshot's list of create volume permissions, but you cannot do both in a single operation. If you need to both add and remove account IDs for a snapshot, you must use multiple operations. You can make up to 500 modifications to a snapshot in a single operation. Encrypted snapshots and snapshots with Amazon Web Services Marketplace product codes cannot be made public. Snapshots encrypted with your default KMS key cannot be shared with other accounts. For more information about modifying snapshot permissions, see [Share a snapshot](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-modifying-snapshot-permissions.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func modifySnapshotAttribute(input: ModifySnapshotAttributeInput, completion: @escaping (ClientRuntime.SdkResult<ModifySnapshotAttributeOutputResponse, ModifySnapshotAttributeOutputError>) -> Void)
```

### modifySpotFleetRequest(input:completion:)

Modifies the specified Spot Fleet request. You can only modify a Spot Fleet request of type maintain. While the Spot Fleet request is being modified, it is in the modifying state. To scale up your Spot Fleet, increase its target capacity. The Spot Fleet launches the additional Spot Instances according to the allocation strategy for the Spot Fleet request. If the allocation strategy is lowestPrice, the Spot Fleet launches instances using the Spot Instance pool with the lowest price. If the allocation strategy is diversified, the Spot Fleet distributes the instances across the Spot Instance pools. If the allocation strategy is capacityOptimized, Spot Fleet launches instances from Spot Instance pools with optimal capacity for the number of instances that are launching. To scale down your Spot Fleet, decrease its target capacity. First, the Spot Fleet cancels any open requests that exceed the new target capacity. You can request that the Spot Fleet terminate Spot Instances until the size of the fleet no longer exceeds the new target capacity. If the allocation strategy is lowestPrice, the Spot Fleet terminates the instances with the highest price per unit. If the allocation strategy is capacityOptimized, the Spot Fleet terminates the instances in the Spot Instance pools that have the least available Spot Instance capacity. If the allocation strategy is diversified, the Spot Fleet terminates instances across the Spot Instance pools. Alternatively, you can request that the Spot Fleet keep the fleet at its current size, but not replace any Spot Instances that are interrupted or that you terminate manually. If you are finished with your Spot Fleet for now, but will use it again later, you can set the target capacity to 0.

``` swift
func modifySpotFleetRequest(input: ModifySpotFleetRequestInput, completion: @escaping (ClientRuntime.SdkResult<ModifySpotFleetRequestOutputResponse, ModifySpotFleetRequestOutputError>) -> Void)
```

### modifySubnetAttribute(input:completion:)

Modifies a subnet attribute. You can only modify one attribute at a time.

``` swift
func modifySubnetAttribute(input: ModifySubnetAttributeInput, completion: @escaping (ClientRuntime.SdkResult<ModifySubnetAttributeOutputResponse, ModifySubnetAttributeOutputError>) -> Void)
```

### modifyTrafficMirrorFilterNetworkServices(input:completion:)

Allows or restricts mirroring network services. By default, Amazon DNS network services are not eligible for Traffic Mirror. Use AddNetworkServices to add network services to a Traffic Mirror filter. When a network service is added to the Traffic Mirror filter, all traffic related to that network service will be mirrored. When you no longer want to mirror network services, use RemoveNetworkServices to remove the network services from the Traffic Mirror filter. For information about filter rule properties, see [Network Services](https://docs.aws.amazon.com/vpc/latest/mirroring/traffic-mirroring-considerations.html) in the Traffic Mirroring User Guide .

``` swift
func modifyTrafficMirrorFilterNetworkServices(input: ModifyTrafficMirrorFilterNetworkServicesInput, completion: @escaping (ClientRuntime.SdkResult<ModifyTrafficMirrorFilterNetworkServicesOutputResponse, ModifyTrafficMirrorFilterNetworkServicesOutputError>) -> Void)
```

### modifyTrafficMirrorFilterRule(input:completion:)

Modifies the specified Traffic Mirror rule. DestinationCidrBlock and SourceCidrBlock must both be an IPv4 range or an IPv6 range.

``` swift
func modifyTrafficMirrorFilterRule(input: ModifyTrafficMirrorFilterRuleInput, completion: @escaping (ClientRuntime.SdkResult<ModifyTrafficMirrorFilterRuleOutputResponse, ModifyTrafficMirrorFilterRuleOutputError>) -> Void)
```

### modifyTrafficMirrorSession(input:completion:)

Modifies a Traffic Mirror session.

``` swift
func modifyTrafficMirrorSession(input: ModifyTrafficMirrorSessionInput, completion: @escaping (ClientRuntime.SdkResult<ModifyTrafficMirrorSessionOutputResponse, ModifyTrafficMirrorSessionOutputError>) -> Void)
```

### modifyTransitGateway(input:completion:)

Modifies the specified transit gateway. When you modify a transit gateway, the modified options are applied to new transit gateway attachments only. Your existing transit gateway attachments are not modified.

``` swift
func modifyTransitGateway(input: ModifyTransitGatewayInput, completion: @escaping (ClientRuntime.SdkResult<ModifyTransitGatewayOutputResponse, ModifyTransitGatewayOutputError>) -> Void)
```

### modifyTransitGatewayPrefixListReference(input:completion:)

Modifies a reference (route) to a prefix list in a specified transit gateway route table.

``` swift
func modifyTransitGatewayPrefixListReference(input: ModifyTransitGatewayPrefixListReferenceInput, completion: @escaping (ClientRuntime.SdkResult<ModifyTransitGatewayPrefixListReferenceOutputResponse, ModifyTransitGatewayPrefixListReferenceOutputError>) -> Void)
```

### modifyTransitGatewayVpcAttachment(input:completion:)

Modifies the specified VPC attachment.

``` swift
func modifyTransitGatewayVpcAttachment(input: ModifyTransitGatewayVpcAttachmentInput, completion: @escaping (ClientRuntime.SdkResult<ModifyTransitGatewayVpcAttachmentOutputResponse, ModifyTransitGatewayVpcAttachmentOutputError>) -> Void)
```

### modifyVolume(input:completion:)

You can modify several parameters of an existing EBS volume, including volume size, volume type, and IOPS capacity. If your EBS volume is attached to a current-generation EC2 instance type, you might be able to apply these changes without stopping the instance or detaching the volume from it. For more information about modifying EBS volumes, see [Amazon EBS Elastic Volumes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-modify-volume.html) (Linux instances) or [Amazon EBS Elastic Volumes](https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ebs-modify-volume.html) (Windows instances). When you complete a resize operation on your volume, you need to extend the volume's file-system size to take advantage of the new storage capacity. For more information, see [Extend a Linux file system](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-expand-volume.html#recognize-expanded-volume-linux) or [Extend a Windows file system](https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ebs-expand-volume.html#recognize-expanded-volume-windows). You can use CloudWatch Events to check the status of a modification to an EBS volume. For information about CloudWatch Events, see the [Amazon CloudWatch Events User Guide](https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/). You can also track the status of a modification using \[DescribeVolumesModifications\]. For information about tracking status changes using either method, see [Monitor the progress of volume modifications](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/monitoring-volume-modifications.html). With previous-generation instance types, resizing an EBS volume might require detaching and reattaching the volume or stopping and restarting the instance. If you reach the maximum volume modification rate per volume limit, you must wait at least six hours before applying further modifications to the affected EBS volume.

``` swift
func modifyVolume(input: ModifyVolumeInput, completion: @escaping (ClientRuntime.SdkResult<ModifyVolumeOutputResponse, ModifyVolumeOutputError>) -> Void)
```

### modifyVolumeAttribute(input:completion:)

Modifies a volume attribute. By default, all I/O operations for the volume are suspended when the data on the volume is determined to be potentially inconsistent, to prevent undetectable, latent data corruption. The I/O access to the volume can be resumed by first enabling I/O access and then checking the data consistency on your volume. You can change the default behavior to resume I/O operations. We recommend that you change this only for boot volumes or for volumes that are stateless or disposable.

``` swift
func modifyVolumeAttribute(input: ModifyVolumeAttributeInput, completion: @escaping (ClientRuntime.SdkResult<ModifyVolumeAttributeOutputResponse, ModifyVolumeAttributeOutputError>) -> Void)
```

### modifyVpcAttribute(input:completion:)

Modifies the specified attribute of the specified VPC.

``` swift
func modifyVpcAttribute(input: ModifyVpcAttributeInput, completion: @escaping (ClientRuntime.SdkResult<ModifyVpcAttributeOutputResponse, ModifyVpcAttributeOutputError>) -> Void)
```

### modifyVpcEndpoint(input:completion:)

Modifies attributes of a specified VPC endpoint. The attributes that you can modify depend on the type of VPC endpoint (interface, gateway, or Gateway Load Balancer). For more information, see [VPC Endpoints](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-endpoints.html) in the Amazon Virtual Private Cloud User Guide.

``` swift
func modifyVpcEndpoint(input: ModifyVpcEndpointInput, completion: @escaping (ClientRuntime.SdkResult<ModifyVpcEndpointOutputResponse, ModifyVpcEndpointOutputError>) -> Void)
```

### modifyVpcEndpointConnectionNotification(input:completion:)

Modifies a connection notification for VPC endpoint or VPC endpoint service. You can change the SNS topic for the notification, or the events for which to be notified.

``` swift
func modifyVpcEndpointConnectionNotification(input: ModifyVpcEndpointConnectionNotificationInput, completion: @escaping (ClientRuntime.SdkResult<ModifyVpcEndpointConnectionNotificationOutputResponse, ModifyVpcEndpointConnectionNotificationOutputError>) -> Void)
```

### modifyVpcEndpointServiceConfiguration(input:completion:)

Modifies the attributes of your VPC endpoint service configuration. You can change the Network Load Balancers or Gateway Load Balancers for your service, and you can specify whether acceptance is required for requests to connect to your endpoint service through an interface VPC endpoint. If you set or modify the private DNS name, you must prove that you own the private DNS domain name. For more information, see [VPC Endpoint Service Private DNS Name Verification](https://docs.aws.amazon.com/vpc/latest/userguide/endpoint-services-dns-validation.html) in the Amazon Virtual Private Cloud User Guide.

``` swift
func modifyVpcEndpointServiceConfiguration(input: ModifyVpcEndpointServiceConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<ModifyVpcEndpointServiceConfigurationOutputResponse, ModifyVpcEndpointServiceConfigurationOutputError>) -> Void)
```

### modifyVpcEndpointServicePermissions(input:completion:)

Modifies the permissions for your [VPC endpoint service](https://docs.aws.amazon.com/vpc/latest/userguide/endpoint-service.html). You can add or remove permissions for service consumers (IAM users, IAM roles, and AWS accounts) to connect to your endpoint service. If you grant permissions to all principals, the service is public. Any users who know the name of a public service can send a request to attach an endpoint. If the service does not require manual approval, attachments are automatically approved.

``` swift
func modifyVpcEndpointServicePermissions(input: ModifyVpcEndpointServicePermissionsInput, completion: @escaping (ClientRuntime.SdkResult<ModifyVpcEndpointServicePermissionsOutputResponse, ModifyVpcEndpointServicePermissionsOutputError>) -> Void)
```

### modifyVpcPeeringConnectionOptions(input:completion:)

Modifies the VPC peering connection options on one side of a VPC peering connection. You can do the following:

``` swift
func modifyVpcPeeringConnectionOptions(input: ModifyVpcPeeringConnectionOptionsInput, completion: @escaping (ClientRuntime.SdkResult<ModifyVpcPeeringConnectionOptionsOutputResponse, ModifyVpcPeeringConnectionOptionsOutputError>) -> Void)
```

  - Enable/disable communication over the peering connection between an EC2-Classic instance that's linked to your VPC (using ClassicLink) and instances in the peer VPC.

  - Enable/disable communication over the peering connection between instances in your VPC and an EC2-Classic instance that's linked to the peer VPC.

  - Enable/disable the ability to resolve public DNS hostnames to private IP addresses when queried from instances in the peer VPC.

If the peered VPCs are in the same Amazon Web Services account, you can enable DNS resolution for queries from the local VPC. This ensures that queries from the local VPC resolve to private IP addresses in the peer VPC. This option is not available if the peered VPCs are in different different Amazon Web Services accounts or different Regions. For peered VPCs in different Amazon Web Services accounts, each Amazon Web Services account owner must initiate a separate request to modify the peering connection options. For inter-region peering connections, you must use the Region for the requester VPC to modify the requester VPC peering options and the Region for the accepter VPC to modify the accepter VPC peering options. To verify which VPCs are the accepter and the requester for a VPC peering connection, use the \[DescribeVpcPeeringConnections\] command.

### modifyVpcTenancy(input:completion:)

Modifies the instance tenancy attribute of the specified VPC. You can change the instance tenancy attribute of a VPC to default only. You cannot change the instance tenancy attribute to dedicated. After you modify the tenancy of the VPC, any new instances that you launch into the VPC have a tenancy of default, unless you specify otherwise during launch. The tenancy of any existing instances in the VPC is not affected. For more information, see [Dedicated Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-instance.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func modifyVpcTenancy(input: ModifyVpcTenancyInput, completion: @escaping (ClientRuntime.SdkResult<ModifyVpcTenancyOutputResponse, ModifyVpcTenancyOutputError>) -> Void)
```

### modifyVpnConnection(input:completion:)

Modifies the customer gateway or the target gateway of an Amazon Web Services Site-to-Site VPN connection. To modify the target gateway, the following migration options are available:

``` swift
func modifyVpnConnection(input: ModifyVpnConnectionInput, completion: @escaping (ClientRuntime.SdkResult<ModifyVpnConnectionOutputResponse, ModifyVpnConnectionOutputError>) -> Void)
```

  - An existing virtual private gateway to a new virtual private gateway

  - An existing virtual private gateway to a transit gateway

  - An existing transit gateway to a new transit gateway

  - An existing transit gateway to a virtual private gateway

Before you perform the migration to the new gateway, you must configure the new gateway. Use \[CreateVpnGateway\] to create a virtual private gateway, or \[CreateTransitGateway\] to create a transit gateway. This step is required when you migrate from a virtual private gateway with static routes to a transit gateway. You must delete the static routes before you migrate to the new gateway. Keep a copy of the static route before you delete it. You will need to add back these routes to the transit gateway after the VPN connection migration is complete. After you migrate to the new gateway, you might need to modify your VPC route table. Use \[CreateRoute\] and \[DeleteRoute\] to make the changes described in [Update VPC route tables](https://docs.aws.amazon.com/vpn/latest/s2svpn/modify-vpn-target.html#step-update-routing) in the Amazon Web Services Site-to-Site VPN User Guide. When the new gateway is a transit gateway, modify the transit gateway route table to allow traffic between the VPC and the Amazon Web Services Site-to-Site VPN connection. Use \[CreateTransitGatewayRoute\] to add the routes. If you deleted VPN static routes, you must add the static routes to the transit gateway route table. After you perform this operation, the VPN endpoint's IP addresses on the Amazon Web Services side and the tunnel options remain intact. Your Amazon Web Services Site-to-Site VPN connection will be temporarily unavailable for a brief period while we provision the new endpoints.

### modifyVpnConnectionOptions(input:completion:)

Modifies the connection options for your Site-to-Site VPN connection. When you modify the VPN connection options, the VPN endpoint IP addresses on the Amazon Web Services side do not change, and the tunnel options do not change. Your VPN connection will be temporarily unavailable for a brief period while the VPN connection is updated.

``` swift
func modifyVpnConnectionOptions(input: ModifyVpnConnectionOptionsInput, completion: @escaping (ClientRuntime.SdkResult<ModifyVpnConnectionOptionsOutputResponse, ModifyVpnConnectionOptionsOutputError>) -> Void)
```

### modifyVpnTunnelCertificate(input:completion:)

Modifies the VPN tunnel endpoint certificate.

``` swift
func modifyVpnTunnelCertificate(input: ModifyVpnTunnelCertificateInput, completion: @escaping (ClientRuntime.SdkResult<ModifyVpnTunnelCertificateOutputResponse, ModifyVpnTunnelCertificateOutputError>) -> Void)
```

### modifyVpnTunnelOptions(input:completion:)

Modifies the options for a VPN tunnel in an Amazon Web Services Site-to-Site VPN connection. You can modify multiple options for a tunnel in a single request, but you can only modify one tunnel at a time. For more information, see [Site-to-Site VPN tunnel options for your Site-to-Site VPN connection](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPNTunnels.html) in the Amazon Web Services Site-to-Site VPN User Guide.

``` swift
func modifyVpnTunnelOptions(input: ModifyVpnTunnelOptionsInput, completion: @escaping (ClientRuntime.SdkResult<ModifyVpnTunnelOptionsOutputResponse, ModifyVpnTunnelOptionsOutputError>) -> Void)
```

### monitorInstances(input:completion:)

Enables detailed monitoring for a running instance. Otherwise, basic monitoring is enabled. For more information, see [Monitoring your instances and volumes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-cloudwatch.html) in the Amazon EC2 User Guide. To disable detailed monitoring, see .

``` swift
func monitorInstances(input: MonitorInstancesInput, completion: @escaping (ClientRuntime.SdkResult<MonitorInstancesOutputResponse, MonitorInstancesOutputError>) -> Void)
```

### moveAddressToVpc(input:completion:)

Moves an Elastic IP address from the EC2-Classic platform to the EC2-VPC platform. The Elastic IP address must be allocated to your account for more than 24 hours, and it must not be associated with an instance. After the Elastic IP address is moved, it is no longer available for use in the EC2-Classic platform, unless you move it back using the \[RestoreAddressToClassic\] request. You cannot move an Elastic IP address that was originally allocated for use in the EC2-VPC platform to the EC2-Classic platform.

``` swift
func moveAddressToVpc(input: MoveAddressToVpcInput, completion: @escaping (ClientRuntime.SdkResult<MoveAddressToVpcOutputResponse, MoveAddressToVpcOutputError>) -> Void)
```

### provisionByoipCidr(input:completion:)

Provisions an IPv4 or IPv6 address range for use with your Amazon Web Services resources through bring your own IP addresses (BYOIP) and creates a corresponding address pool. After the address range is provisioned, it is ready to be advertised using \[AdvertiseByoipCidr\]. Amazon Web Services verifies that you own the address range and are authorized to advertise it. You must ensure that the address range is registered to you and that you created an RPKI ROA to authorize Amazon ASNs 16509 and 14618 to advertise the address range. For more information, see [Bring your own IP addresses (BYOIP)](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-byoip.html) in the Amazon Elastic Compute Cloud User Guide. Provisioning an address range is an asynchronous operation, so the call returns immediately, but the address range is not ready to use until its status changes from pending-provision to provisioned. To monitor the status of an address range, use \[DescribeByoipCidrs\]. To allocate an Elastic IP address from your IPv4 address pool, use \[AllocateAddress\] with either the specific address from the address pool or the ID of the address pool.

``` swift
func provisionByoipCidr(input: ProvisionByoipCidrInput, completion: @escaping (ClientRuntime.SdkResult<ProvisionByoipCidrOutputResponse, ProvisionByoipCidrOutputError>) -> Void)
```

### purchaseHostReservation(input:completion:)

Purchase a reservation with configurations that match those of your Dedicated Host. You must have active Dedicated Hosts in your account before you purchase a reservation. This action results in the specified reservation being purchased and charged to your account.

``` swift
func purchaseHostReservation(input: PurchaseHostReservationInput, completion: @escaping (ClientRuntime.SdkResult<PurchaseHostReservationOutputResponse, PurchaseHostReservationOutputError>) -> Void)
```

### purchaseReservedInstancesOffering(input:completion:)

Purchases a Reserved Instance for use with your account. With Reserved Instances, you pay a lower hourly rate compared to On-Demand instance pricing. Use \[DescribeReservedInstancesOfferings\] to get a list of Reserved Instance offerings that match your specifications. After you've purchased a Reserved Instance, you can check for your new Reserved Instance with \[DescribeReservedInstances\]. To queue a purchase for a future date and time, specify a purchase time. If you do not specify a purchase time, the default is the current time. For more information, see [Reserved Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts-on-demand-reserved-instances.html) and [Reserved Instance Marketplace](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html) in the Amazon EC2 User Guide.

``` swift
func purchaseReservedInstancesOffering(input: PurchaseReservedInstancesOfferingInput, completion: @escaping (ClientRuntime.SdkResult<PurchaseReservedInstancesOfferingOutputResponse, PurchaseReservedInstancesOfferingOutputError>) -> Void)
```

### purchaseScheduledInstances(input:completion:)

Purchases the Scheduled Instances with the specified schedule. Scheduled Instances enable you to purchase Amazon EC2 compute capacity by the hour for a one-year term. Before you can purchase a Scheduled Instance, you must call \[DescribeScheduledInstanceAvailability\] to check for available schedules and obtain a purchase token. After you purchase a Scheduled Instance, you must call \[RunScheduledInstances\] during each scheduled time period. After you purchase a Scheduled Instance, you can't cancel, modify, or resell your purchase.

``` swift
func purchaseScheduledInstances(input: PurchaseScheduledInstancesInput, completion: @escaping (ClientRuntime.SdkResult<PurchaseScheduledInstancesOutputResponse, PurchaseScheduledInstancesOutputError>) -> Void)
```

### rebootInstances(input:completion:)

Requests a reboot of the specified instances. This operation is asynchronous; it only queues a request to reboot the specified instances. The operation succeeds if the instances are valid and belong to you. Requests to reboot terminated instances are ignored. If an instance does not cleanly shut down within a few minutes, Amazon EC2 performs a hard reboot. For more information about troubleshooting, see [Getting console output and rebooting instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-console.html) in the Amazon EC2 User Guide.

``` swift
func rebootInstances(input: RebootInstancesInput, completion: @escaping (ClientRuntime.SdkResult<RebootInstancesOutputResponse, RebootInstancesOutputError>) -> Void)
```

### registerImage(input:completion:)

Registers an AMI. When you're creating an AMI, this is the final step you must complete before you can launch an instance from the AMI. For more information about creating AMIs, see [Creating your own AMIs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/creating-an-ami.html) in the Amazon Elastic Compute Cloud User Guide. For Amazon EBS-backed instances, \[CreateImage\] creates and registers the AMI in a single request, so you don't have to register the AMI yourself. If needed, you can deregister an AMI at any time. Any modifications you make to an AMI backed by an instance store volume invalidates its registration. If you make changes to an image, deregister the previous image and register the new image. Register a snapshot of a root device volume You can use RegisterImage to create an Amazon EBS-backed Linux AMI from a snapshot of a root device volume. You specify the snapshot using a block device mapping. You can't set the encryption state of the volume using the block device mapping. If the snapshot is encrypted, or encryption by default is enabled, the root volume of an instance launched from the AMI is encrypted. For more information, see [Create a Linux AMI from a snapshot](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/creating-an-ami-ebs.html#creating-launching-ami-from-snapshot) and [Use encryption with Amazon EBS-backed AMIs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIEncryption.html) in the Amazon Elastic Compute Cloud User Guide. Amazon Web Services Marketplace product codes If any snapshots have Amazon Web Services Marketplace product codes, they are copied to the new AMI. Windows and some Linux distributions, such as Red Hat Enterprise Linux (RHEL) and SUSE Linux Enterprise Server (SLES), use the Amazon EC2 billing product code associated with an AMI to verify the subscription status for package updates. To create a new AMI for operating systems that require a billing product code, instead of registering the AMI, do the following to preserve the billing product code association:

``` swift
func registerImage(input: RegisterImageInput, completion: @escaping (ClientRuntime.SdkResult<RegisterImageOutputResponse, RegisterImageOutputError>) -> Void)
```

  - Launch an instance from an existing AMI with that billing product code.

  - Customize the instance.

  - Create an AMI from the instance using \[CreateImage\].

If you purchase a Reserved Instance to apply to an On-Demand Instance that was launched from an AMI with a billing product code, make sure that the Reserved Instance has the matching billing product code. If you purchase a Reserved Instance without the matching billing product code, the Reserved Instance will not be applied to the On-Demand Instance. For information about how to obtain the platform details and billing information of an AMI, see [Understanding AMI billing](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ami-billing-info.html) in the Amazon Elastic Compute Cloud User Guide.

### registerInstanceEventNotificationAttributes(input:completion:)

Registers a set of tag keys to include in scheduled event notifications for your resources. To remove tags, use .

``` swift
func registerInstanceEventNotificationAttributes(input: RegisterInstanceEventNotificationAttributesInput, completion: @escaping (ClientRuntime.SdkResult<RegisterInstanceEventNotificationAttributesOutputResponse, RegisterInstanceEventNotificationAttributesOutputError>) -> Void)
```

### registerTransitGatewayMulticastGroupMembers(input:completion:)

Registers members (network interfaces) with the transit gateway multicast group. A member is a network interface associated with a supported EC2 instance that receives multicast traffic. For information about supported instances, see [Multicast Consideration](https://docs.aws.amazon.com/vpc/latest/tgw/transit-gateway-limits.html#multicast-limits) in Amazon VPC Transit Gateways. After you add the members, use [SearchTransitGatewayMulticastGroups](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_SearchTransitGatewayMulticastGroups.html) to verify that the members were added to the transit gateway multicast group.

``` swift
func registerTransitGatewayMulticastGroupMembers(input: RegisterTransitGatewayMulticastGroupMembersInput, completion: @escaping (ClientRuntime.SdkResult<RegisterTransitGatewayMulticastGroupMembersOutputResponse, RegisterTransitGatewayMulticastGroupMembersOutputError>) -> Void)
```

### registerTransitGatewayMulticastGroupSources(input:completion:)

Registers sources (network interfaces) with the specified transit gateway multicast group. A multicast source is a network interface attached to a supported instance that sends multicast traffic. For information about supported instances, see [Multicast Considerations](https://docs.aws.amazon.com/vpc/latest/tgw/transit-gateway-limits.html#multicast-limits) in Amazon VPC Transit Gateways. After you add the source, use [SearchTransitGatewayMulticastGroups](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_SearchTransitGatewayMulticastGroups.html) to verify that the source was added to the multicast group.

``` swift
func registerTransitGatewayMulticastGroupSources(input: RegisterTransitGatewayMulticastGroupSourcesInput, completion: @escaping (ClientRuntime.SdkResult<RegisterTransitGatewayMulticastGroupSourcesOutputResponse, RegisterTransitGatewayMulticastGroupSourcesOutputError>) -> Void)
```

### rejectTransitGatewayMulticastDomainAssociations(input:completion:)

Rejects a request to associate cross-account subnets with a transit gateway multicast domain.

``` swift
func rejectTransitGatewayMulticastDomainAssociations(input: RejectTransitGatewayMulticastDomainAssociationsInput, completion: @escaping (ClientRuntime.SdkResult<RejectTransitGatewayMulticastDomainAssociationsOutputResponse, RejectTransitGatewayMulticastDomainAssociationsOutputError>) -> Void)
```

### rejectTransitGatewayPeeringAttachment(input:completion:)

Rejects a transit gateway peering attachment request.

``` swift
func rejectTransitGatewayPeeringAttachment(input: RejectTransitGatewayPeeringAttachmentInput, completion: @escaping (ClientRuntime.SdkResult<RejectTransitGatewayPeeringAttachmentOutputResponse, RejectTransitGatewayPeeringAttachmentOutputError>) -> Void)
```

### rejectTransitGatewayVpcAttachment(input:completion:)

Rejects a request to attach a VPC to a transit gateway. The VPC attachment must be in the pendingAcceptance state. Use \[DescribeTransitGatewayVpcAttachments\] to view your pending VPC attachment requests. Use \[AcceptTransitGatewayVpcAttachment\] to accept a VPC attachment request.

``` swift
func rejectTransitGatewayVpcAttachment(input: RejectTransitGatewayVpcAttachmentInput, completion: @escaping (ClientRuntime.SdkResult<RejectTransitGatewayVpcAttachmentOutputResponse, RejectTransitGatewayVpcAttachmentOutputError>) -> Void)
```

### rejectVpcEndpointConnections(input:completion:)

Rejects one or more VPC endpoint connection requests to your VPC endpoint service.

``` swift
func rejectVpcEndpointConnections(input: RejectVpcEndpointConnectionsInput, completion: @escaping (ClientRuntime.SdkResult<RejectVpcEndpointConnectionsOutputResponse, RejectVpcEndpointConnectionsOutputError>) -> Void)
```

### rejectVpcPeeringConnection(input:completion:)

Rejects a VPC peering connection request. The VPC peering connection must be in the pending-acceptance state. Use the \[DescribeVpcPeeringConnections\] request to view your outstanding VPC peering connection requests. To delete an active VPC peering connection, or to delete a VPC peering connection request that you initiated, use \[DeleteVpcPeeringConnection\].

``` swift
func rejectVpcPeeringConnection(input: RejectVpcPeeringConnectionInput, completion: @escaping (ClientRuntime.SdkResult<RejectVpcPeeringConnectionOutputResponse, RejectVpcPeeringConnectionOutputError>) -> Void)
```

### releaseAddress(input:completion:)

Releases the specified Elastic IP address. \[EC2-Classic, default VPC\] Releasing an Elastic IP address automatically disassociates it from any instance that it's associated with. To disassociate an Elastic IP address without releasing it, use \[DisassociateAddress\]. \[Nondefault VPC\] You must use \[DisassociateAddress\] to disassociate the Elastic IP address before you can release it. Otherwise, Amazon EC2 returns an error (InvalidIPAddress.InUse). After releasing an Elastic IP address, it is released to the IP address pool. Be sure to update your DNS records and any servers or devices that communicate with the address. If you attempt to release an Elastic IP address that you already released, you'll get an AuthFailure error if the address is already allocated to another Amazon Web Services account. \[EC2-VPC\] After you release an Elastic IP address for use in a VPC, you might be able to recover it. For more information, see \[AllocateAddress\].

``` swift
func releaseAddress(input: ReleaseAddressInput, completion: @escaping (ClientRuntime.SdkResult<ReleaseAddressOutputResponse, ReleaseAddressOutputError>) -> Void)
```

### releaseHosts(input:completion:)

When you no longer want to use an On-Demand Dedicated Host it can be released. On-Demand billing is stopped and the host goes into released state. The host ID of Dedicated Hosts that have been released can no longer be specified in another request, for example, to modify the host. You must stop or terminate all instances on a host before it can be released. When Dedicated Hosts are released, it may take some time for them to stop counting toward your limit and you may receive capacity errors when trying to allocate new Dedicated Hosts. Wait a few minutes and then try again. Released hosts still appear in a \[DescribeHosts\] response.

``` swift
func releaseHosts(input: ReleaseHostsInput, completion: @escaping (ClientRuntime.SdkResult<ReleaseHostsOutputResponse, ReleaseHostsOutputError>) -> Void)
```

### replaceIamInstanceProfileAssociation(input:completion:)

Replaces an IAM instance profile for the specified running instance. You can use this action to change the IAM instance profile that's associated with an instance without having to disassociate the existing IAM instance profile first. Use \[DescribeIamInstanceProfileAssociations\] to get the association ID.

``` swift
func replaceIamInstanceProfileAssociation(input: ReplaceIamInstanceProfileAssociationInput, completion: @escaping (ClientRuntime.SdkResult<ReplaceIamInstanceProfileAssociationOutputResponse, ReplaceIamInstanceProfileAssociationOutputError>) -> Void)
```

### replaceNetworkAclAssociation(input:completion:)

Changes which network ACL a subnet is associated with. By default when you create a subnet, it's automatically associated with the default network ACL. For more information, see [Network ACLs](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_ACLs.html) in the Amazon Virtual Private Cloud User Guide. This is an idempotent operation.

``` swift
func replaceNetworkAclAssociation(input: ReplaceNetworkAclAssociationInput, completion: @escaping (ClientRuntime.SdkResult<ReplaceNetworkAclAssociationOutputResponse, ReplaceNetworkAclAssociationOutputError>) -> Void)
```

### replaceNetworkAclEntry(input:completion:)

Replaces an entry (rule) in a network ACL. For more information, see [Network ACLs](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_ACLs.html) in the Amazon Virtual Private Cloud User Guide.

``` swift
func replaceNetworkAclEntry(input: ReplaceNetworkAclEntryInput, completion: @escaping (ClientRuntime.SdkResult<ReplaceNetworkAclEntryOutputResponse, ReplaceNetworkAclEntryOutputError>) -> Void)
```

### replaceRoute(input:completion:)

Replaces an existing route within a route table in a VPC. You must provide only one of the following: internet gateway, virtual private gateway, NAT instance, NAT gateway, VPC peering connection, network interface, egress-only internet gateway, or transit gateway. For more information, see [Route tables](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html) in the Amazon Virtual Private Cloud User Guide.

``` swift
func replaceRoute(input: ReplaceRouteInput, completion: @escaping (ClientRuntime.SdkResult<ReplaceRouteOutputResponse, ReplaceRouteOutputError>) -> Void)
```

### replaceRouteTableAssociation(input:completion:)

Changes the route table associated with a given subnet, internet gateway, or virtual private gateway in a VPC. After the operation completes, the subnet or gateway uses the routes in the new route table. For more information about route tables, see [Route tables](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html) in the Amazon Virtual Private Cloud User Guide. You can also use this operation to change which table is the main route table in the VPC. Specify the main route table's association ID and the route table ID of the new main route table.

``` swift
func replaceRouteTableAssociation(input: ReplaceRouteTableAssociationInput, completion: @escaping (ClientRuntime.SdkResult<ReplaceRouteTableAssociationOutputResponse, ReplaceRouteTableAssociationOutputError>) -> Void)
```

### replaceTransitGatewayRoute(input:completion:)

Replaces the specified route in the specified transit gateway route table.

``` swift
func replaceTransitGatewayRoute(input: ReplaceTransitGatewayRouteInput, completion: @escaping (ClientRuntime.SdkResult<ReplaceTransitGatewayRouteOutputResponse, ReplaceTransitGatewayRouteOutputError>) -> Void)
```

### reportInstanceStatus(input:completion:)

Submits feedback about the status of an instance. The instance must be in the running state. If your experience with the instance differs from the instance status returned by \[DescribeInstanceStatus\], use \[ReportInstanceStatus\] to report your experience with the instance. Amazon EC2 collects this information to improve the accuracy of status checks. Use of this action does not change the value returned by \[DescribeInstanceStatus\].

``` swift
func reportInstanceStatus(input: ReportInstanceStatusInput, completion: @escaping (ClientRuntime.SdkResult<ReportInstanceStatusOutputResponse, ReportInstanceStatusOutputError>) -> Void)
```

### requestSpotFleet(input:completion:)

Creates a Spot Fleet request. The Spot Fleet request specifies the total target capacity and the On-Demand target capacity. Amazon EC2 calculates the difference between the total capacity and On-Demand capacity, and launches the difference as Spot capacity. You can submit a single request that includes multiple launch specifications that vary by instance type, AMI, Availability Zone, or subnet. By default, the Spot Fleet requests Spot Instances in the Spot Instance pool where the price per unit is the lowest. Each launch specification can include its own instance weighting that reflects the value of the instance type to your application workload. Alternatively, you can specify that the Spot Fleet distribute the target capacity across the Spot pools included in its launch specifications. By ensuring that the Spot Instances in your Spot Fleet are in different Spot pools, you can improve the availability of your fleet. You can specify tags for the Spot Fleet request and instances launched by the fleet. You cannot tag other resource types in a Spot Fleet request because only the spot-fleet-request and instance resource types are supported. For more information, see [Spot Fleet requests](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-fleet-requests.html) in the Amazon EC2 User Guide for Linux Instances.

``` swift
func requestSpotFleet(input: RequestSpotFleetInput, completion: @escaping (ClientRuntime.SdkResult<RequestSpotFleetOutputResponse, RequestSpotFleetOutputError>) -> Void)
```

### requestSpotInstances(input:completion:)

Creates a Spot Instance request. For more information, see [Spot Instance requests](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-requests.html) in the Amazon EC2 User Guide for Linux Instances.

``` swift
func requestSpotInstances(input: RequestSpotInstancesInput, completion: @escaping (ClientRuntime.SdkResult<RequestSpotInstancesOutputResponse, RequestSpotInstancesOutputError>) -> Void)
```

### resetAddressAttribute(input:completion:)

Resets the attribute of the specified IP address. For requirements, see [Using reverse DNS for email applications](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html#Using_Elastic_Addressing_Reverse_DNS).

``` swift
func resetAddressAttribute(input: ResetAddressAttributeInput, completion: @escaping (ClientRuntime.SdkResult<ResetAddressAttributeOutputResponse, ResetAddressAttributeOutputError>) -> Void)
```

### resetEbsDefaultKmsKeyId(input:completion:)

Resets the default KMS key for EBS encryption for your account in this Region to the Amazon Web Services managed KMS key for EBS. After resetting the default KMS key to the Amazon Web Services managed KMS key, you can continue to encrypt by a customer managed KMS key by specifying it when you create the volume. For more information, see [Amazon EBS encryption](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func resetEbsDefaultKmsKeyId(input: ResetEbsDefaultKmsKeyIdInput, completion: @escaping (ClientRuntime.SdkResult<ResetEbsDefaultKmsKeyIdOutputResponse, ResetEbsDefaultKmsKeyIdOutputError>) -> Void)
```

### resetFpgaImageAttribute(input:completion:)

Resets the specified attribute of the specified Amazon FPGA Image (AFI) to its default value. You can only reset the load permission attribute.

``` swift
func resetFpgaImageAttribute(input: ResetFpgaImageAttributeInput, completion: @escaping (ClientRuntime.SdkResult<ResetFpgaImageAttributeOutputResponse, ResetFpgaImageAttributeOutputError>) -> Void)
```

### resetImageAttribute(input:completion:)

Resets an attribute of an AMI to its default value.

``` swift
func resetImageAttribute(input: ResetImageAttributeInput, completion: @escaping (ClientRuntime.SdkResult<ResetImageAttributeOutputResponse, ResetImageAttributeOutputError>) -> Void)
```

### resetInstanceAttribute(input:completion:)

Resets an attribute of an instance to its default value. To reset the kernel or ramdisk, the instance must be in a stopped state. To reset the sourceDestCheck, the instance can be either running or stopped. The sourceDestCheck attribute controls whether source/destination checking is enabled. The default value is true, which means checking is enabled. This value must be false for a NAT instance to perform NAT. For more information, see [NAT Instances](https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_NAT_Instance.html) in the Amazon VPC User Guide.

``` swift
func resetInstanceAttribute(input: ResetInstanceAttributeInput, completion: @escaping (ClientRuntime.SdkResult<ResetInstanceAttributeOutputResponse, ResetInstanceAttributeOutputError>) -> Void)
```

### resetNetworkInterfaceAttribute(input:completion:)

Resets a network interface attribute. You can specify only one attribute at a time.

``` swift
func resetNetworkInterfaceAttribute(input: ResetNetworkInterfaceAttributeInput, completion: @escaping (ClientRuntime.SdkResult<ResetNetworkInterfaceAttributeOutputResponse, ResetNetworkInterfaceAttributeOutputError>) -> Void)
```

### resetSnapshotAttribute(input:completion:)

Resets permission settings for the specified snapshot. For more information about modifying snapshot permissions, see [Share a snapshot](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-modifying-snapshot-permissions.html) in the Amazon Elastic Compute Cloud User Guide.

``` swift
func resetSnapshotAttribute(input: ResetSnapshotAttributeInput, completion: @escaping (ClientRuntime.SdkResult<ResetSnapshotAttributeOutputResponse, ResetSnapshotAttributeOutputError>) -> Void)
```

### restoreAddressToClassic(input:completion:)

Restores an Elastic IP address that was previously moved to the EC2-VPC platform back to the EC2-Classic platform. You cannot move an Elastic IP address that was originally allocated for use in EC2-VPC. The Elastic IP address must not be associated with an instance or network interface.

``` swift
func restoreAddressToClassic(input: RestoreAddressToClassicInput, completion: @escaping (ClientRuntime.SdkResult<RestoreAddressToClassicOutputResponse, RestoreAddressToClassicOutputError>) -> Void)
```

### restoreManagedPrefixListVersion(input:completion:)

Restores the entries from a previous version of a managed prefix list to a new version of the prefix list.

``` swift
func restoreManagedPrefixListVersion(input: RestoreManagedPrefixListVersionInput, completion: @escaping (ClientRuntime.SdkResult<RestoreManagedPrefixListVersionOutputResponse, RestoreManagedPrefixListVersionOutputError>) -> Void)
```

### revokeClientVpnIngress(input:completion:)

Removes an ingress authorization rule from a Client VPN endpoint.

``` swift
func revokeClientVpnIngress(input: RevokeClientVpnIngressInput, completion: @escaping (ClientRuntime.SdkResult<RevokeClientVpnIngressOutputResponse, RevokeClientVpnIngressOutputError>) -> Void)
```

### revokeSecurityGroupEgress(input:completion:)

\[VPC only\] Removes the specified outbound (egress) rules from a security group for EC2-VPC. This action does not apply to security groups for use in EC2-Classic. You can specify rules using either rule IDs or security group rule properties. If you use rule properties, the values that you specify (for example, ports) must match the existing rule's values exactly. Each rule has a protocol, from and to ports, and destination (CIDR range, security group, or prefix list). For the TCP and UDP protocols, you must also specify the destination port or range of ports. For the ICMP protocol, you must also specify the ICMP type and code. If the security group rule has a description, you do not need to specify the description to revoke the rule. \[Default VPC\] If the values you specify do not match the existing rule's values, no error is returned, and the output describes the security group rules that were not revoked. Amazon Web Services recommends that you describe the security group to verify that the rules were removed. Rule changes are propagated to instances within the security group as quickly as possible. However, a small delay might occur.

``` swift
func revokeSecurityGroupEgress(input: RevokeSecurityGroupEgressInput, completion: @escaping (ClientRuntime.SdkResult<RevokeSecurityGroupEgressOutputResponse, RevokeSecurityGroupEgressOutputError>) -> Void)
```

### revokeSecurityGroupIngress(input:completion:)

Removes the specified inbound (ingress) rules from a security group. You can specify rules using either rule IDs or security group rule properties. If you use rule properties, the values that you specify (for example, ports) must match the existing rule's values exactly. Each rule has a protocol, from and to ports, and source (CIDR range, security group, or prefix list). For the TCP and UDP protocols, you must also specify the destination port or range of ports. For the ICMP protocol, you must also specify the ICMP type and code. If the security group rule has a description, you do not need to specify the description to revoke the rule. \[EC2-Classic, default VPC\] If the values you specify do not match the existing rule's values, no error is returned, and the output describes the security group rules that were not revoked. Amazon Web Services recommends that you describe the security group to verify that the rules were removed. Rule changes are propagated to instances within the security group as quickly as possible. However, a small delay might occur.

``` swift
func revokeSecurityGroupIngress(input: RevokeSecurityGroupIngressInput, completion: @escaping (ClientRuntime.SdkResult<RevokeSecurityGroupIngressOutputResponse, RevokeSecurityGroupIngressOutputError>) -> Void)
```

### runInstances(input:completion:)

Launches the specified number of instances using an AMI for which you have permissions. You can specify a number of options, or leave the default options. The following rules apply:

``` swift
func runInstances(input: RunInstancesInput, completion: @escaping (ClientRuntime.SdkResult<RunInstancesOutputResponse, RunInstancesOutputError>) -> Void)
```

  - \[EC2-VPC\] If you don't specify a subnet ID, we choose a default subnet from your default VPC for you. If you don't have a default VPC, you must specify a subnet ID in the request.

  - \[EC2-Classic\] If don't specify an Availability Zone, we choose one for you.

  - Some instance types must be launched into a VPC. If you do not have a default VPC, or if you do not specify a subnet ID, the request fails. For more information, see [Instance types available only in a VPC](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-vpc.html#vpc-only-instance-types).

  - \[EC2-VPC\] All instances have a network interface with a primary private IPv4 address. If you don't specify this address, we choose one from the IPv4 range of your subnet.

  - Not all instance types support IPv6 addresses. For more information, see [Instance types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html).

  - If you don't specify a security group ID, we use the default security group. For more information, see [Security groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html).

  - If any of the AMIs have a product code attached for which the user has not subscribed, the request fails.

You can create a [launch template](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-launch-templates.html), which is a resource that contains the parameters to launch an instance. When you launch an instance using \[RunInstances\], you can specify the launch template instead of specifying the launch parameters. To ensure faster instance launches, break up large requests into smaller batches. For example, create five separate launch requests for 100 instances each instead of one launch request for 500 instances. An instance is ready for you to use when it's in the running state. You can check the state of your instance using \[DescribeInstances\]. You can tag instances and EBS volumes during launch, after launch, or both. For more information, see \[CreateTags\] and [Tagging your Amazon EC2 resources](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html). Linux instances have access to the public key of the key pair at boot. You can use this key to provide secure access to the instance. Amazon EC2 public images use this feature to provide secure access without passwords. For more information, see [Key pairs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html). For troubleshooting, see [What to do if an instance immediately terminates](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_InstanceStraightToTerminated.html), and [Troubleshooting connecting to your instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstancesConnecting.html).

### runScheduledInstances(input:completion:)

Launches the specified Scheduled Instances. Before you can launch a Scheduled Instance, you must purchase it and obtain an identifier using \[PurchaseScheduledInstances\]. You must launch a Scheduled Instance during its scheduled time period. You can't stop or reboot a Scheduled Instance, but you can terminate it as needed. If you terminate a Scheduled Instance before the current scheduled time period ends, you can launch it again after a few minutes. For more information, see [Scheduled Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-scheduled-instances.html) in the Amazon EC2 User Guide.

``` swift
func runScheduledInstances(input: RunScheduledInstancesInput, completion: @escaping (ClientRuntime.SdkResult<RunScheduledInstancesOutputResponse, RunScheduledInstancesOutputError>) -> Void)
```

### searchLocalGatewayRoutes(input:completion:)

Searches for routes in the specified local gateway route table.

``` swift
func searchLocalGatewayRoutes(input: SearchLocalGatewayRoutesInput, completion: @escaping (ClientRuntime.SdkResult<SearchLocalGatewayRoutesOutputResponse, SearchLocalGatewayRoutesOutputError>) -> Void)
```

### searchTransitGatewayMulticastGroups(input:completion:)

Searches one or more transit gateway multicast groups and returns the group membership information.

``` swift
func searchTransitGatewayMulticastGroups(input: SearchTransitGatewayMulticastGroupsInput, completion: @escaping (ClientRuntime.SdkResult<SearchTransitGatewayMulticastGroupsOutputResponse, SearchTransitGatewayMulticastGroupsOutputError>) -> Void)
```

### searchTransitGatewayRoutes(input:completion:)

Searches for routes in the specified transit gateway route table.

``` swift
func searchTransitGatewayRoutes(input: SearchTransitGatewayRoutesInput, completion: @escaping (ClientRuntime.SdkResult<SearchTransitGatewayRoutesOutputResponse, SearchTransitGatewayRoutesOutputError>) -> Void)
```

### sendDiagnosticInterrupt(input:completion:)

Sends a diagnostic interrupt to the specified Amazon EC2 instance to trigger a kernel panic (on Linux instances), or a blue screen/stop error (on Windows instances). For instances based on Intel and AMD processors, the interrupt is received as a non-maskable interrupt (NMI). In general, the operating system crashes and reboots when a kernel panic or stop error is triggered. The operating system can also be configured to perform diagnostic tasks, such as generating a memory dump file, loading a secondary kernel, or obtaining a call trace. Before sending a diagnostic interrupt to your instance, ensure that its operating system is configured to perform the required diagnostic tasks. For more information about configuring your operating system to generate a crash dump when a kernel panic or stop error occurs, see [Send a diagnostic interrupt](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/diagnostic-interrupt.html) (Linux instances) or [Send a Diagnostic Interrupt](https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/diagnostic-interrupt.html) (Windows instances).

``` swift
func sendDiagnosticInterrupt(input: SendDiagnosticInterruptInput, completion: @escaping (ClientRuntime.SdkResult<SendDiagnosticInterruptOutputResponse, SendDiagnosticInterruptOutputError>) -> Void)
```

### startInstances(input:completion:)

Starts an Amazon EBS-backed instance that you've previously stopped. Instances that use Amazon EBS volumes as their root devices can be quickly stopped and started. When an instance is stopped, the compute resources are released and you are not billed for instance usage. However, your root partition Amazon EBS volume remains and continues to persist your data, and you are charged for Amazon EBS volume usage. You can restart your instance at any time. Every time you start your instance, Amazon EC2 charges a one-minute minimum for instance usage, and thereafter charges per second for instance usage. Before stopping an instance, make sure it is in a state from which it can be restarted. Stopping an instance does not preserve data stored in RAM. Performing this operation on an instance that uses an instance store as its root device returns an error. If you attempt to start a T3 instance with host tenancy and the unlimted CPU credit option, the request fails. The unlimited CPU credit option is not supported on Dedicated Hosts. Before you start the instance, either change its CPU credit option to standard, or change its tenancy to default or dedicated. For more information, see [Stopping instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Stop_Start.html) in the Amazon EC2 User Guide.

``` swift
func startInstances(input: StartInstancesInput, completion: @escaping (ClientRuntime.SdkResult<StartInstancesOutputResponse, StartInstancesOutputError>) -> Void)
```

### startNetworkInsightsAnalysis(input:completion:)

Starts analyzing the specified path. If the path is reachable, the operation returns the shortest feasible path.

``` swift
func startNetworkInsightsAnalysis(input: StartNetworkInsightsAnalysisInput, completion: @escaping (ClientRuntime.SdkResult<StartNetworkInsightsAnalysisOutputResponse, StartNetworkInsightsAnalysisOutputError>) -> Void)
```

### startVpcEndpointServicePrivateDnsVerification(input:completion:)

Initiates the verification process to prove that the service provider owns the private DNS name domain for the endpoint service. The service provider must successfully perform the verification before the consumer can use the name to access the service. Before the service provider runs this command, they must add a record to the DNS server. For more information, see [Adding a TXT Record to Your Domain's DNS Server ](https://docs.aws.amazon.com/vpc/latest/userguide/endpoint-services-dns-validation.html#add-dns-txt-record) in the Amazon VPC User Guide.

``` swift
func startVpcEndpointServicePrivateDnsVerification(input: StartVpcEndpointServicePrivateDnsVerificationInput, completion: @escaping (ClientRuntime.SdkResult<StartVpcEndpointServicePrivateDnsVerificationOutputResponse, StartVpcEndpointServicePrivateDnsVerificationOutputError>) -> Void)
```

### stopInstances(input:completion:)

Stops an Amazon EBS-backed instance. You can use the Stop action to hibernate an instance if the instance is [enabled for hibernation](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Hibernate.html#enabling-hibernation) and it meets the [hibernation prerequisites](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Hibernate.html#hibernating-prerequisites). For more information, see [Hibernate your instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Hibernate.html) in the Amazon EC2 User Guide. We don't charge usage for a stopped instance, or data transfer fees; however, your root partition Amazon EBS volume remains and continues to persist your data, and you are charged for Amazon EBS volume usage. Every time you start your instance, Amazon EC2 charges a one-minute minimum for instance usage, and thereafter charges per second for instance usage. You can't stop or hibernate instance store-backed instances. You can't use the Stop action to hibernate Spot Instances, but you can specify that Amazon EC2 should hibernate Spot Instances when they are interrupted. For more information, see [Hibernating interrupted Spot Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-interruptions.html#hibernate-spot-instances) in the Amazon EC2 User Guide. When you stop or hibernate an instance, we shut it down. You can restart your instance at any time. Before stopping or hibernating an instance, make sure it is in a state from which it can be restarted. Stopping an instance does not preserve data stored in RAM, but hibernating an instance does preserve data stored in RAM. If an instance cannot hibernate successfully, a normal shutdown occurs. Stopping and hibernating an instance is different to rebooting or terminating it. For example, when you stop or hibernate an instance, the root device and any other devices attached to the instance persist. When you terminate an instance, the root device and any other devices attached during the instance launch are automatically deleted. For more information about the differences between rebooting, stopping, hibernating, and terminating instances, see [Instance lifecycle](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-lifecycle.html) in the Amazon EC2 User Guide. When you stop an instance, we attempt to shut it down forcibly after a short while. If your instance appears stuck in the stopping state after a period of time, there may be an issue with the underlying host computer. For more information, see [Troubleshooting stopping your instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstancesStopping.html) in the Amazon EC2 User Guide.

``` swift
func stopInstances(input: StopInstancesInput, completion: @escaping (ClientRuntime.SdkResult<StopInstancesOutputResponse, StopInstancesOutputError>) -> Void)
```

### terminateClientVpnConnections(input:completion:)

Terminates active Client VPN endpoint connections. This action can be used to terminate a specific client connection, or up to five connections established by a specific user.

``` swift
func terminateClientVpnConnections(input: TerminateClientVpnConnectionsInput, completion: @escaping (ClientRuntime.SdkResult<TerminateClientVpnConnectionsOutputResponse, TerminateClientVpnConnectionsOutputError>) -> Void)
```

### terminateInstances(input:completion:)

Shuts down the specified instances. This operation is idempotent; if you terminate an instance more than once, each call succeeds. If you specify multiple instances and the request fails (for example, because of a single incorrect instance ID), none of the instances are terminated. If you terminate multiple instances across multiple Availability Zones, and one or more of the specified instances are enabled for termination protection, the request fails with the following results:

``` swift
func terminateInstances(input: TerminateInstancesInput, completion: @escaping (ClientRuntime.SdkResult<TerminateInstancesOutputResponse, TerminateInstancesOutputError>) -> Void)
```

  - The specified instances that are in the same Availability Zone as the protected instance are not terminated.

  - The specified instances that are in different Availability Zones, where no other specified instances are protected, are successfully terminated.

For example, say you have the following instances:

  - Instance A: us-east-1a; Not protected

  - Instance B: us-east-1a; Not protected

  - Instance C: us-east-1b; Protected

  - Instance D: us-east-1b; not protected

If you attempt to terminate all of these instances in the same request, the request reports failure with the following results:

  - Instance A and Instance B are successfully terminated because none of the specified instances in us-east-1a are enabled for termination protection.

  - Instance C and Instance D fail to terminate because at least one of the specified instances in us-east-1b (Instance C) is enabled for termination protection.

Terminated instances remain visible after termination (for approximately one hour). By default, Amazon EC2 deletes all EBS volumes that were attached when the instance launched. Volumes attached after instance launch continue running. You can stop, start, and terminate EBS-backed instances. You can only terminate instance store-backed instances. What happens to an instance differs if you stop it or terminate it. For example, when you stop an instance, the root device and any other devices attached to the instance persist. When you terminate an instance, any attached EBS volumes with the DeleteOnTermination block device mapping parameter set to true are automatically deleted. For more information about the differences between stopping and terminating instances, see [Instance lifecycle](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-lifecycle.html) in the Amazon EC2 User Guide. For more information about troubleshooting, see [Troubleshooting terminating your instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstancesShuttingDown.html) in the Amazon EC2 User Guide.

### unassignIpv6Addresses(input:completion:)

Unassigns one or more IPv6 addresses IPv4 Prefix Delegation prefixes from a network interface.

``` swift
func unassignIpv6Addresses(input: UnassignIpv6AddressesInput, completion: @escaping (ClientRuntime.SdkResult<UnassignIpv6AddressesOutputResponse, UnassignIpv6AddressesOutputError>) -> Void)
```

### unassignPrivateIpAddresses(input:completion:)

Unassigns one or more secondary private IP addresses, or IPv4 Prefix Delegation prefixes from a network interface.

``` swift
func unassignPrivateIpAddresses(input: UnassignPrivateIpAddressesInput, completion: @escaping (ClientRuntime.SdkResult<UnassignPrivateIpAddressesOutputResponse, UnassignPrivateIpAddressesOutputError>) -> Void)
```

### unmonitorInstances(input:completion:)

Disables detailed monitoring for a running instance. For more information, see [Monitoring your instances and volumes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-cloudwatch.html) in the Amazon EC2 User Guide.

``` swift
func unmonitorInstances(input: UnmonitorInstancesInput, completion: @escaping (ClientRuntime.SdkResult<UnmonitorInstancesOutputResponse, UnmonitorInstancesOutputError>) -> Void)
```

### updateSecurityGroupRuleDescriptionsEgress(input:completion:)

\[VPC only\] Updates the description of an egress (outbound) security group rule. You can replace an existing description, or add a description to a rule that did not have one previously. You can remove a description for a security group rule by omitting the description parameter in the request.

``` swift
func updateSecurityGroupRuleDescriptionsEgress(input: UpdateSecurityGroupRuleDescriptionsEgressInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSecurityGroupRuleDescriptionsEgressOutputResponse, UpdateSecurityGroupRuleDescriptionsEgressOutputError>) -> Void)
```

### updateSecurityGroupRuleDescriptionsIngress(input:completion:)

Updates the description of an ingress (inbound) security group rule. You can replace an existing description, or add a description to a rule that did not have one previously. You can remove a description for a security group rule by omitting the description parameter in the request.

``` swift
func updateSecurityGroupRuleDescriptionsIngress(input: UpdateSecurityGroupRuleDescriptionsIngressInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSecurityGroupRuleDescriptionsIngressOutputResponse, UpdateSecurityGroupRuleDescriptionsIngressOutputError>) -> Void)
```

### withdrawByoipCidr(input:completion:)

Stops advertising an address range that is provisioned as an address pool. You can perform this operation at most once every 10 seconds, even if you specify different address ranges each time. It can take a few minutes before traffic to the specified addresses stops routing to Amazon Web Services because of BGP propagation delays.

``` swift
func withdrawByoipCidr(input: WithdrawByoipCidrInput, completion: @escaping (ClientRuntime.SdkResult<WithdrawByoipCidrOutputResponse, WithdrawByoipCidrOutputError>) -> Void)
```
