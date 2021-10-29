# GlobalAcceleratorClient

``` swift
public class GlobalAcceleratorClient 
```

## Inheritance

[`GlobalAcceleratorClientProtocol`](/aws-sdk-swift/reference/0.x/AWSGlobalAccelerator/GlobalAcceleratorClientProtocol)

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
public static let clientName = "GlobalAcceleratorClient"
```

## Methods

### `addCustomRoutingEndpoints(input:completion:)`

Associate a virtual private cloud (VPC) subnet endpoint with your custom routing accelerator. The listener port range must be large enough to support the number of IP addresses that can be specified in your subnet. The number of ports required is: subnet size times the number of ports per destination EC2 instances. For example, a subnet defined as /24 requires a listener port range of at least 255 ports. Note: You must have enough remaining listener ports available to map to the subnet ports, or the call will fail with a LimitExceededException. By default, all destinations in a subnet in a custom routing accelerator cannot receive traffic. To enable all destinations to receive traffic, or to specify individual port mappings that can receive traffic, see the [ AllowCustomRoutingTraffic](https://docs.aws.amazon.com/global-accelerator/latest/api/API_AllowCustomRoutingTraffic.html) operation.

``` swift
public func addCustomRoutingEndpoints(input: AddCustomRoutingEndpointsInput, completion: @escaping (ClientRuntime.SdkResult<AddCustomRoutingEndpointsOutputResponse, AddCustomRoutingEndpointsOutputError>) -> Void)
```

### `advertiseByoipCidr(input:completion:)`

Advertises an IPv4 address range that is provisioned for use with your AWS resources through bring your own IP addresses (BYOIP). It can take a few minutes before traffic to the specified addresses starts routing to AWS because of propagation delays. To stop advertising the BYOIP address range, use [ WithdrawByoipCidr](https://docs.aws.amazon.com/global-accelerator/latest/api/WithdrawByoipCidr.html). For more information, see [Bring Your Own IP Addresses (BYOIP)](https://docs.aws.amazon.com/global-accelerator/latest/dg/using-byoip.html) in the AWS Global Accelerator Developer Guide.

``` swift
public func advertiseByoipCidr(input: AdvertiseByoipCidrInput, completion: @escaping (ClientRuntime.SdkResult<AdvertiseByoipCidrOutputResponse, AdvertiseByoipCidrOutputError>) -> Void)
```

### `allowCustomRoutingTraffic(input:completion:)`

Specify the Amazon EC2 instance (destination) IP addresses and ports for a VPC subnet endpoint that can receive traffic for a custom routing accelerator. You can allow traffic to all destinations in the subnet endpoint, or allow traffic to a specified list of destination IP addresses and ports in the subnet. Note that you cannot specify IP addresses or ports outside of the range that you configured for the endpoint group. After you make changes, you can verify that the updates are complete by checking the status of your accelerator: the status changes from IN\_PROGRESS to DEPLOYED.

``` swift
public func allowCustomRoutingTraffic(input: AllowCustomRoutingTrafficInput, completion: @escaping (ClientRuntime.SdkResult<AllowCustomRoutingTrafficOutputResponse, AllowCustomRoutingTrafficOutputError>) -> Void)
```

### `createAccelerator(input:completion:)`

Create an accelerator. An accelerator includes one or more listeners that process inbound connections and direct traffic to one or more endpoint groups, each of which includes endpoints, such as Network Load Balancers. Global Accelerator is a global service that supports endpoints in multiple AWS Regions but you must specify the US West (Oregon) Region to create or update accelerators.

``` swift
public func createAccelerator(input: CreateAcceleratorInput, completion: @escaping (ClientRuntime.SdkResult<CreateAcceleratorOutputResponse, CreateAcceleratorOutputError>) -> Void)
```

### `createCustomRoutingAccelerator(input:completion:)`

Create a custom routing accelerator. A custom routing accelerator directs traffic to one of possibly thousands of Amazon EC2 instance destinations running in a single or multiple virtual private clouds (VPC) subnet endpoints. Be aware that, by default, all destination EC2 instances in a VPC subnet endpoint cannot receive traffic. To enable all destinations to receive traffic, or to specify individual port mappings that can receive traffic, see the [ AllowCustomRoutingTraffic](https://docs.aws.amazon.com/global-accelerator/latest/api/API_AllowCustomRoutingTraffic.html) operation. Global Accelerator is a global service that supports endpoints in multiple AWS Regions but you must specify the US West (Oregon) Region to create or update accelerators.

``` swift
public func createCustomRoutingAccelerator(input: CreateCustomRoutingAcceleratorInput, completion: @escaping (ClientRuntime.SdkResult<CreateCustomRoutingAcceleratorOutputResponse, CreateCustomRoutingAcceleratorOutputError>) -> Void)
```

### `createCustomRoutingEndpointGroup(input:completion:)`

Create an endpoint group for the specified listener for a custom routing accelerator. An endpoint group is a collection of endpoints in one AWS Region.

``` swift
public func createCustomRoutingEndpointGroup(input: CreateCustomRoutingEndpointGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateCustomRoutingEndpointGroupOutputResponse, CreateCustomRoutingEndpointGroupOutputError>) -> Void)
```

### `createCustomRoutingListener(input:completion:)`

Create a listener to process inbound connections from clients to a custom routing accelerator. Connections arrive to assigned static IP addresses on the port range that you specify.

``` swift
public func createCustomRoutingListener(input: CreateCustomRoutingListenerInput, completion: @escaping (ClientRuntime.SdkResult<CreateCustomRoutingListenerOutputResponse, CreateCustomRoutingListenerOutputError>) -> Void)
```

### `createEndpointGroup(input:completion:)`

Create an endpoint group for the specified listener. An endpoint group is a collection of endpoints in one AWS Region. A resource must be valid and active when you add it as an endpoint.

``` swift
public func createEndpointGroup(input: CreateEndpointGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateEndpointGroupOutputResponse, CreateEndpointGroupOutputError>) -> Void)
```

### `createListener(input:completion:)`

Create a listener to process inbound connections from clients to an accelerator. Connections arrive to assigned static IP addresses on a port, port range, or list of port ranges that you specify.

``` swift
public func createListener(input: CreateListenerInput, completion: @escaping (ClientRuntime.SdkResult<CreateListenerOutputResponse, CreateListenerOutputError>) -> Void)
```

### `deleteAccelerator(input:completion:)`

Delete an accelerator. Before you can delete an accelerator, you must disable it and remove all dependent resources (listeners and endpoint groups). To disable the accelerator, update the accelerator to set Enabled to false. When you create an accelerator, by default, Global Accelerator provides you with a set of two static IP addresses. Alternatively, you can bring your own IP address ranges to Global Accelerator and assign IP addresses from those ranges. The IP addresses are assigned to your accelerator for as long as it exists, even if you disable the accelerator and it no longer accepts or routes traffic. However, when you delete an accelerator, you lose the static IP addresses that are assigned to the accelerator, so you can no longer route traffic by using them. As a best practice, ensure that you have permissions in place to avoid inadvertently deleting accelerators. You can use IAM policies with Global Accelerator to limit the users who have permissions to delete an accelerator. For more information, see [Authentication and Access Control](https://docs.aws.amazon.com/global-accelerator/latest/dg/auth-and-access-control.html) in the AWS Global Accelerator Developer Guide.

``` swift
public func deleteAccelerator(input: DeleteAcceleratorInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAcceleratorOutputResponse, DeleteAcceleratorOutputError>) -> Void)
```

### `deleteCustomRoutingAccelerator(input:completion:)`

Delete a custom routing accelerator. Before you can delete an accelerator, you must disable it and remove all dependent resources (listeners and endpoint groups). To disable the accelerator, update the accelerator to set Enabled to false. When you create a custom routing accelerator, by default, Global Accelerator provides you with a set of two static IP addresses. The IP addresses are assigned to your accelerator for as long as it exists, even if you disable the accelerator and it no longer accepts or routes traffic. However, when you delete an accelerator, you lose the static IP addresses that are assigned to the accelerator, so you can no longer route traffic by using them. As a best practice, ensure that you have permissions in place to avoid inadvertently deleting accelerators. You can use IAM policies with Global Accelerator to limit the users who have permissions to delete an accelerator. For more information, see [Authentication and Access Control](https://docs.aws.amazon.com/global-accelerator/latest/dg/auth-and-access-control.html) in the AWS Global Accelerator Developer Guide.

``` swift
public func deleteCustomRoutingAccelerator(input: DeleteCustomRoutingAcceleratorInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCustomRoutingAcceleratorOutputResponse, DeleteCustomRoutingAcceleratorOutputError>) -> Void)
```

### `deleteCustomRoutingEndpointGroup(input:completion:)`

Delete an endpoint group from a listener for a custom routing accelerator.

``` swift
public func deleteCustomRoutingEndpointGroup(input: DeleteCustomRoutingEndpointGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCustomRoutingEndpointGroupOutputResponse, DeleteCustomRoutingEndpointGroupOutputError>) -> Void)
```

### `deleteCustomRoutingListener(input:completion:)`

Delete a listener for a custom routing accelerator.

``` swift
public func deleteCustomRoutingListener(input: DeleteCustomRoutingListenerInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCustomRoutingListenerOutputResponse, DeleteCustomRoutingListenerOutputError>) -> Void)
```

### `deleteEndpointGroup(input:completion:)`

Delete an endpoint group from a listener.

``` swift
public func deleteEndpointGroup(input: DeleteEndpointGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteEndpointGroupOutputResponse, DeleteEndpointGroupOutputError>) -> Void)
```

### `deleteListener(input:completion:)`

Delete a listener from an accelerator.

``` swift
public func deleteListener(input: DeleteListenerInput, completion: @escaping (ClientRuntime.SdkResult<DeleteListenerOutputResponse, DeleteListenerOutputError>) -> Void)
```

### `denyCustomRoutingTraffic(input:completion:)`

Specify the Amazon EC2 instance (destination) IP addresses and ports for a VPC subnet endpoint that cannot receive traffic for a custom routing accelerator. You can deny traffic to all destinations in the VPC endpoint, or deny traffic to a specified list of destination IP addresses and ports. Note that you cannot specify IP addresses or ports outside of the range that you configured for the endpoint group. After you make changes, you can verify that the updates are complete by checking the status of your accelerator: the status changes from IN\_PROGRESS to DEPLOYED.

``` swift
public func denyCustomRoutingTraffic(input: DenyCustomRoutingTrafficInput, completion: @escaping (ClientRuntime.SdkResult<DenyCustomRoutingTrafficOutputResponse, DenyCustomRoutingTrafficOutputError>) -> Void)
```

### `deprovisionByoipCidr(input:completion:)`

Releases the specified address range that you provisioned to use with your AWS resources through bring your own IP addresses (BYOIP) and deletes the corresponding address pool. Before you can release an address range, you must stop advertising it by using [WithdrawByoipCidr](https://docs.aws.amazon.com/global-accelerator/latest/api/WithdrawByoipCidr.html) and you must not have any accelerators that are using static IP addresses allocated from its address range. For more information, see [Bring Your Own IP Addresses (BYOIP)](https://docs.aws.amazon.com/global-accelerator/latest/dg/using-byoip.html) in the AWS Global Accelerator Developer Guide.

``` swift
public func deprovisionByoipCidr(input: DeprovisionByoipCidrInput, completion: @escaping (ClientRuntime.SdkResult<DeprovisionByoipCidrOutputResponse, DeprovisionByoipCidrOutputError>) -> Void)
```

### `describeAccelerator(input:completion:)`

Describe an accelerator.

``` swift
public func describeAccelerator(input: DescribeAcceleratorInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAcceleratorOutputResponse, DescribeAcceleratorOutputError>) -> Void)
```

### `describeAcceleratorAttributes(input:completion:)`

Describe the attributes of an accelerator.

``` swift
public func describeAcceleratorAttributes(input: DescribeAcceleratorAttributesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAcceleratorAttributesOutputResponse, DescribeAcceleratorAttributesOutputError>) -> Void)
```

### `describeCustomRoutingAccelerator(input:completion:)`

Describe a custom routing accelerator.

``` swift
public func describeCustomRoutingAccelerator(input: DescribeCustomRoutingAcceleratorInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCustomRoutingAcceleratorOutputResponse, DescribeCustomRoutingAcceleratorOutputError>) -> Void)
```

### `describeCustomRoutingAcceleratorAttributes(input:completion:)`

Describe the attributes of a custom routing accelerator.

``` swift
public func describeCustomRoutingAcceleratorAttributes(input: DescribeCustomRoutingAcceleratorAttributesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCustomRoutingAcceleratorAttributesOutputResponse, DescribeCustomRoutingAcceleratorAttributesOutputError>) -> Void)
```

### `describeCustomRoutingEndpointGroup(input:completion:)`

Describe an endpoint group for a custom routing accelerator.

``` swift
public func describeCustomRoutingEndpointGroup(input: DescribeCustomRoutingEndpointGroupInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCustomRoutingEndpointGroupOutputResponse, DescribeCustomRoutingEndpointGroupOutputError>) -> Void)
```

### `describeCustomRoutingListener(input:completion:)`

The description of a listener for a custom routing accelerator.

``` swift
public func describeCustomRoutingListener(input: DescribeCustomRoutingListenerInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCustomRoutingListenerOutputResponse, DescribeCustomRoutingListenerOutputError>) -> Void)
```

### `describeEndpointGroup(input:completion:)`

Describe an endpoint group.

``` swift
public func describeEndpointGroup(input: DescribeEndpointGroupInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEndpointGroupOutputResponse, DescribeEndpointGroupOutputError>) -> Void)
```

### `describeListener(input:completion:)`

Describe a listener.

``` swift
public func describeListener(input: DescribeListenerInput, completion: @escaping (ClientRuntime.SdkResult<DescribeListenerOutputResponse, DescribeListenerOutputError>) -> Void)
```

### `listAccelerators(input:completion:)`

List the accelerators for an AWS account.

``` swift
public func listAccelerators(input: ListAcceleratorsInput, completion: @escaping (ClientRuntime.SdkResult<ListAcceleratorsOutputResponse, ListAcceleratorsOutputError>) -> Void)
```

### `listByoipCidrs(input:completion:)`

Lists the IP address ranges that were specified in calls to [ProvisionByoipCidr](https://docs.aws.amazon.com/global-accelerator/latest/api/ProvisionByoipCidr.html), including the current state and a history of state changes.

``` swift
public func listByoipCidrs(input: ListByoipCidrsInput, completion: @escaping (ClientRuntime.SdkResult<ListByoipCidrsOutputResponse, ListByoipCidrsOutputError>) -> Void)
```

### `listCustomRoutingAccelerators(input:completion:)`

List the custom routing accelerators for an AWS account.

``` swift
public func listCustomRoutingAccelerators(input: ListCustomRoutingAcceleratorsInput, completion: @escaping (ClientRuntime.SdkResult<ListCustomRoutingAcceleratorsOutputResponse, ListCustomRoutingAcceleratorsOutputError>) -> Void)
```

### `listCustomRoutingEndpointGroups(input:completion:)`

List the endpoint groups that are associated with a listener for a custom routing accelerator.

``` swift
public func listCustomRoutingEndpointGroups(input: ListCustomRoutingEndpointGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListCustomRoutingEndpointGroupsOutputResponse, ListCustomRoutingEndpointGroupsOutputError>) -> Void)
```

### `listCustomRoutingListeners(input:completion:)`

List the listeners for a custom routing accelerator.

``` swift
public func listCustomRoutingListeners(input: ListCustomRoutingListenersInput, completion: @escaping (ClientRuntime.SdkResult<ListCustomRoutingListenersOutputResponse, ListCustomRoutingListenersOutputError>) -> Void)
```

### `listCustomRoutingPortMappings(input:completion:)`

Provides a complete mapping from the public accelerator IP address and port to destination EC2 instance IP addresses and ports in the virtual public cloud (VPC) subnet endpoint for a custom routing accelerator. For each subnet endpoint that you add, Global Accelerator creates a new static port mapping for the accelerator. The port mappings don't change after Global Accelerator generates them, so you can retrieve and cache the full mapping on your servers. If you remove a subnet from your accelerator, Global Accelerator removes (reclaims) the port mappings. If you add a subnet to your accelerator, Global Accelerator creates new port mappings (the existing ones don't change). If you add or remove EC2 instances in your subnet, the port mappings don't change, because the mappings are created when you add the subnet to Global Accelerator. The mappings also include a flag for each destination denoting which destination IP addresses and ports are allowed or denied traffic.

``` swift
public func listCustomRoutingPortMappings(input: ListCustomRoutingPortMappingsInput, completion: @escaping (ClientRuntime.SdkResult<ListCustomRoutingPortMappingsOutputResponse, ListCustomRoutingPortMappingsOutputError>) -> Void)
```

### `listCustomRoutingPortMappingsByDestination(input:completion:)`

List the port mappings for a specific EC2 instance (destination) in a VPC subnet endpoint. The response is the mappings for one destination IP address. This is useful when your subnet endpoint has mappings that span multiple custom routing accelerators in your account, or for scenarios where you only want to list the port mappings for a specific destination instance.

``` swift
public func listCustomRoutingPortMappingsByDestination(input: ListCustomRoutingPortMappingsByDestinationInput, completion: @escaping (ClientRuntime.SdkResult<ListCustomRoutingPortMappingsByDestinationOutputResponse, ListCustomRoutingPortMappingsByDestinationOutputError>) -> Void)
```

### `listEndpointGroups(input:completion:)`

List the endpoint groups that are associated with a listener.

``` swift
public func listEndpointGroups(input: ListEndpointGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListEndpointGroupsOutputResponse, ListEndpointGroupsOutputError>) -> Void)
```

### `listListeners(input:completion:)`

List the listeners for an accelerator.

``` swift
public func listListeners(input: ListListenersInput, completion: @escaping (ClientRuntime.SdkResult<ListListenersOutputResponse, ListListenersOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

List all tags for an accelerator. For more information, see [Tagging in AWS Global Accelerator](https://docs.aws.amazon.com/global-accelerator/latest/dg/tagging-in-global-accelerator.html) in the AWS Global Accelerator Developer Guide.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `provisionByoipCidr(input:completion:)`

Provisions an IP address range to use with your AWS resources through bring your own IP addresses (BYOIP) and creates a corresponding address pool. After the address range is provisioned, it is ready to be advertised using [ AdvertiseByoipCidr](https://docs.aws.amazon.com/global-accelerator/latest/api/AdvertiseByoipCidr.html). For more information, see [Bring Your Own IP Addresses (BYOIP)](https://docs.aws.amazon.com/global-accelerator/latest/dg/using-byoip.html) in the AWS Global Accelerator Developer Guide.

``` swift
public func provisionByoipCidr(input: ProvisionByoipCidrInput, completion: @escaping (ClientRuntime.SdkResult<ProvisionByoipCidrOutputResponse, ProvisionByoipCidrOutputError>) -> Void)
```

### `removeCustomRoutingEndpoints(input:completion:)`

Remove endpoints from a custom routing accelerator.

``` swift
public func removeCustomRoutingEndpoints(input: RemoveCustomRoutingEndpointsInput, completion: @escaping (ClientRuntime.SdkResult<RemoveCustomRoutingEndpointsOutputResponse, RemoveCustomRoutingEndpointsOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Add tags to an accelerator resource. For more information, see [Tagging in AWS Global Accelerator](https://docs.aws.amazon.com/global-accelerator/latest/dg/tagging-in-global-accelerator.html) in the AWS Global Accelerator Developer Guide.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Remove tags from a Global Accelerator resource. When you specify a tag key, the action removes both that key and its associated value. The operation succeeds even if you attempt to remove tags from an accelerator that was already removed. For more information, see [Tagging in AWS Global Accelerator](https://docs.aws.amazon.com/global-accelerator/latest/dg/tagging-in-global-accelerator.html) in the AWS Global Accelerator Developer Guide.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateAccelerator(input:completion:)`

Update an accelerator. Global Accelerator is a global service that supports endpoints in multiple AWS Regions but you must specify the US West (Oregon) Region to create or update accelerators.

``` swift
public func updateAccelerator(input: UpdateAcceleratorInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAcceleratorOutputResponse, UpdateAcceleratorOutputError>) -> Void)
```

### `updateAcceleratorAttributes(input:completion:)`

Update the attributes for an accelerator.

``` swift
public func updateAcceleratorAttributes(input: UpdateAcceleratorAttributesInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAcceleratorAttributesOutputResponse, UpdateAcceleratorAttributesOutputError>) -> Void)
```

### `updateCustomRoutingAccelerator(input:completion:)`

Update a custom routing accelerator.

``` swift
public func updateCustomRoutingAccelerator(input: UpdateCustomRoutingAcceleratorInput, completion: @escaping (ClientRuntime.SdkResult<UpdateCustomRoutingAcceleratorOutputResponse, UpdateCustomRoutingAcceleratorOutputError>) -> Void)
```

### `updateCustomRoutingAcceleratorAttributes(input:completion:)`

Update the attributes for a custom routing accelerator.

``` swift
public func updateCustomRoutingAcceleratorAttributes(input: UpdateCustomRoutingAcceleratorAttributesInput, completion: @escaping (ClientRuntime.SdkResult<UpdateCustomRoutingAcceleratorAttributesOutputResponse, UpdateCustomRoutingAcceleratorAttributesOutputError>) -> Void)
```

### `updateCustomRoutingListener(input:completion:)`

Update a listener for a custom routing accelerator.

``` swift
public func updateCustomRoutingListener(input: UpdateCustomRoutingListenerInput, completion: @escaping (ClientRuntime.SdkResult<UpdateCustomRoutingListenerOutputResponse, UpdateCustomRoutingListenerOutputError>) -> Void)
```

### `updateEndpointGroup(input:completion:)`

Update an endpoint group. A resource must be valid and active when you add it as an endpoint.

``` swift
public func updateEndpointGroup(input: UpdateEndpointGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateEndpointGroupOutputResponse, UpdateEndpointGroupOutputError>) -> Void)
```

### `updateListener(input:completion:)`

Update a listener.

``` swift
public func updateListener(input: UpdateListenerInput, completion: @escaping (ClientRuntime.SdkResult<UpdateListenerOutputResponse, UpdateListenerOutputError>) -> Void)
```

### `withdrawByoipCidr(input:completion:)`

Stops advertising an address range that is provisioned as an address pool. You can perform this operation at most once every 10 seconds, even if you specify different address ranges each time. It can take a few minutes before traffic to the specified addresses stops routing to AWS because of propagation delays. For more information, see [Bring Your Own IP Addresses (BYOIP)](https://docs.aws.amazon.com/global-accelerator/latest/dg/using-byoip.html) in the AWS Global Accelerator Developer Guide.

``` swift
public func withdrawByoipCidr(input: WithdrawByoipCidrInput, completion: @escaping (ClientRuntime.SdkResult<WithdrawByoipCidrOutputResponse, WithdrawByoipCidrOutputError>) -> Void)
```
