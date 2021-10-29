# MediaConnectClient

``` swift
public class MediaConnectClient 
```

## Inheritance

[`MediaConnectClientProtocol`](/aws-sdk-swift/reference/0.x/AWSMediaConnect/MediaConnectClientProtocol)

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
public static let clientName = "MediaConnectClient"
```

## Methods

### `addFlowMediaStreams(input:completion:)`

Adds media streams to an existing flow. After you add a media stream to a flow, you can associate it with a source and/or an output that uses the ST 2110 JPEG XS or CDI protocol.

``` swift
public func addFlowMediaStreams(input: AddFlowMediaStreamsInput, completion: @escaping (ClientRuntime.SdkResult<AddFlowMediaStreamsOutputResponse, AddFlowMediaStreamsOutputError>) -> Void)
```

### `addFlowOutputs(input:completion:)`

Adds outputs to an existing flow. You can create up to 50 outputs per flow.

``` swift
public func addFlowOutputs(input: AddFlowOutputsInput, completion: @escaping (ClientRuntime.SdkResult<AddFlowOutputsOutputResponse, AddFlowOutputsOutputError>) -> Void)
```

### `addFlowSources(input:completion:)`

Adds Sources to flow

``` swift
public func addFlowSources(input: AddFlowSourcesInput, completion: @escaping (ClientRuntime.SdkResult<AddFlowSourcesOutputResponse, AddFlowSourcesOutputError>) -> Void)
```

### `addFlowVpcInterfaces(input:completion:)`

Adds VPC interfaces to flow

``` swift
public func addFlowVpcInterfaces(input: AddFlowVpcInterfacesInput, completion: @escaping (ClientRuntime.SdkResult<AddFlowVpcInterfacesOutputResponse, AddFlowVpcInterfacesOutputError>) -> Void)
```

### `createFlow(input:completion:)`

Creates a new flow. The request must include one source. The request optionally can include outputs (up to 50) and entitlements (up to 50).

``` swift
public func createFlow(input: CreateFlowInput, completion: @escaping (ClientRuntime.SdkResult<CreateFlowOutputResponse, CreateFlowOutputError>) -> Void)
```

### `deleteFlow(input:completion:)`

Deletes a flow. Before you can delete a flow, you must stop the flow.

``` swift
public func deleteFlow(input: DeleteFlowInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFlowOutputResponse, DeleteFlowOutputError>) -> Void)
```

### `describeFlow(input:completion:)`

Displays the details of a flow. The response includes the flow ARN, name, and Availability Zone, as well as details about the source, outputs, and entitlements.

``` swift
public func describeFlow(input: DescribeFlowInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFlowOutputResponse, DescribeFlowOutputError>) -> Void)
```

### `describeOffering(input:completion:)`

Displays the details of an offering. The response includes the offering description, duration, outbound bandwidth, price, and Amazon Resource Name (ARN).

``` swift
public func describeOffering(input: DescribeOfferingInput, completion: @escaping (ClientRuntime.SdkResult<DescribeOfferingOutputResponse, DescribeOfferingOutputError>) -> Void)
```

### `describeReservation(input:completion:)`

Displays the details of a reservation. The response includes the reservation name, state, start date and time, and the details of the offering that make up the rest of the reservation (such as price, duration, and outbound bandwidth).

``` swift
public func describeReservation(input: DescribeReservationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeReservationOutputResponse, DescribeReservationOutputError>) -> Void)
```

### `grantFlowEntitlements(input:completion:)`

Grants entitlements to an existing flow.

``` swift
public func grantFlowEntitlements(input: GrantFlowEntitlementsInput, completion: @escaping (ClientRuntime.SdkResult<GrantFlowEntitlementsOutputResponse, GrantFlowEntitlementsOutputError>) -> Void)
```

### `listEntitlements(input:completion:)`

Displays a list of all entitlements that have been granted to this account. This request returns 20 results per page.

``` swift
public func listEntitlements(input: ListEntitlementsInput, completion: @escaping (ClientRuntime.SdkResult<ListEntitlementsOutputResponse, ListEntitlementsOutputError>) -> Void)
```

### `listFlows(input:completion:)`

Displays a list of flows that are associated with this account. This request returns a paginated result.

``` swift
public func listFlows(input: ListFlowsInput, completion: @escaping (ClientRuntime.SdkResult<ListFlowsOutputResponse, ListFlowsOutputError>) -> Void)
```

### `listOfferings(input:completion:)`

Displays a list of all offerings that are available to this account in the current AWS Region. If you have an active reservation (which means you've purchased an offering that has already started and hasn't expired yet), your account isn't eligible for other offerings.

``` swift
public func listOfferings(input: ListOfferingsInput, completion: @escaping (ClientRuntime.SdkResult<ListOfferingsOutputResponse, ListOfferingsOutputError>) -> Void)
```

### `listReservations(input:completion:)`

Displays a list of all reservations that have been purchased by this account in the current AWS Region. This list includes all reservations in all states (such as active and expired).

``` swift
public func listReservations(input: ListReservationsInput, completion: @escaping (ClientRuntime.SdkResult<ListReservationsOutputResponse, ListReservationsOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

List all tags on an AWS Elemental MediaConnect resource

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `purchaseOffering(input:completion:)`

Submits a request to purchase an offering. If you already have an active reservation, you can't purchase another offering.

``` swift
public func purchaseOffering(input: PurchaseOfferingInput, completion: @escaping (ClientRuntime.SdkResult<PurchaseOfferingOutputResponse, PurchaseOfferingOutputError>) -> Void)
```

### `removeFlowMediaStream(input:completion:)`

Removes a media stream from a flow. This action is only available if the media stream is not associated with a source or output.

``` swift
public func removeFlowMediaStream(input: RemoveFlowMediaStreamInput, completion: @escaping (ClientRuntime.SdkResult<RemoveFlowMediaStreamOutputResponse, RemoveFlowMediaStreamOutputError>) -> Void)
```

### `removeFlowOutput(input:completion:)`

Removes an output from an existing flow. This request can be made only on an output that does not have an entitlement associated with it. If the output has an entitlement, you must revoke the entitlement instead. When an entitlement is revoked from a flow, the service automatically removes the associated output.

``` swift
public func removeFlowOutput(input: RemoveFlowOutputInput, completion: @escaping (ClientRuntime.SdkResult<RemoveFlowOutputOutputResponse, RemoveFlowOutputOutputError>) -> Void)
```

### `removeFlowSource(input:completion:)`

Removes a source from an existing flow. This request can be made only if there is more than one source on the flow.

``` swift
public func removeFlowSource(input: RemoveFlowSourceInput, completion: @escaping (ClientRuntime.SdkResult<RemoveFlowSourceOutputResponse, RemoveFlowSourceOutputError>) -> Void)
```

### `removeFlowVpcInterface(input:completion:)`

Removes a VPC Interface from an existing flow. This request can be made only on a VPC interface that does not have a Source or Output associated with it. If the VPC interface is referenced by a Source or Output, you must first delete or update the Source or Output to no longer reference the VPC interface.

``` swift
public func removeFlowVpcInterface(input: RemoveFlowVpcInterfaceInput, completion: @escaping (ClientRuntime.SdkResult<RemoveFlowVpcInterfaceOutputResponse, RemoveFlowVpcInterfaceOutputError>) -> Void)
```

### `revokeFlowEntitlement(input:completion:)`

Revokes an entitlement from a flow. Once an entitlement is revoked, the content becomes unavailable to the subscriber and the associated output is removed.

``` swift
public func revokeFlowEntitlement(input: RevokeFlowEntitlementInput, completion: @escaping (ClientRuntime.SdkResult<RevokeFlowEntitlementOutputResponse, RevokeFlowEntitlementOutputError>) -> Void)
```

### `startFlow(input:completion:)`

Starts a flow.

``` swift
public func startFlow(input: StartFlowInput, completion: @escaping (ClientRuntime.SdkResult<StartFlowOutputResponse, StartFlowOutputError>) -> Void)
```

### `stopFlow(input:completion:)`

Stops a flow.

``` swift
public func stopFlow(input: StopFlowInput, completion: @escaping (ClientRuntime.SdkResult<StopFlowOutputResponse, StopFlowOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Associates the specified tags to a resource with the specified resourceArn. If existing tags on a resource are not specified in the request parameters, they are not changed. When a resource is deleted, the tags associated with that resource are deleted as well.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Deletes specified tags from a resource.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateFlow(input:completion:)`

Updates flow

``` swift
public func updateFlow(input: UpdateFlowInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFlowOutputResponse, UpdateFlowOutputError>) -> Void)
```

### `updateFlowEntitlement(input:completion:)`

You can change an entitlement's description, subscribers, and encryption. If you change the subscribers, the service will remove the outputs that are are used by the subscribers that are removed.

``` swift
public func updateFlowEntitlement(input: UpdateFlowEntitlementInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFlowEntitlementOutputResponse, UpdateFlowEntitlementOutputError>) -> Void)
```

### `updateFlowMediaStream(input:completion:)`

Updates an existing media stream.

``` swift
public func updateFlowMediaStream(input: UpdateFlowMediaStreamInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFlowMediaStreamOutputResponse, UpdateFlowMediaStreamOutputError>) -> Void)
```

### `updateFlowOutput(input:completion:)`

Updates an existing flow output.

``` swift
public func updateFlowOutput(input: UpdateFlowOutputInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFlowOutputOutputResponse, UpdateFlowOutputOutputError>) -> Void)
```

### `updateFlowSource(input:completion:)`

Updates the source of a flow.

``` swift
public func updateFlowSource(input: UpdateFlowSourceInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFlowSourceOutputResponse, UpdateFlowSourceOutputError>) -> Void)
```
