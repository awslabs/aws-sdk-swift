# Route53RecoveryClusterClient

``` swift
public class Route53RecoveryClusterClient 
```

## Inheritance

[`Route53RecoveryClusterClientProtocol`](/aws-sdk-swift/reference/0.x/AWSRoute53RecoveryCluster/Route53RecoveryClusterClientProtocol)

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
public static let clientName = "Route53RecoveryClusterClient"
```

## Methods

### `getRoutingControlState(input:completion:)`

Get the state for a routing control. A routing control is a simple on/off switch that you can use to route traffic to cells. When the state is On, traffic flows to a cell. When it's off, traffic does not flow. Before you can create a routing control, you first must create a cluster to host the control. For more information, see [CreateCluster](https://docs.aws.amazon.com/recovery-cluster/latest/api/cluster.html). Access one of the endpoints for the cluster to get or update the routing control state to redirect traffic. For more information about working with routing controls, see [Routing control](https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.html) in the Route 53 Application Recovery Controller Developer Guide.

``` swift
public func getRoutingControlState(input: GetRoutingControlStateInput, completion: @escaping (ClientRuntime.SdkResult<GetRoutingControlStateOutputResponse, GetRoutingControlStateOutputError>) -> Void)
```

### `updateRoutingControlState(input:completion:)`

Set the state of the routing control to reroute traffic. You can set the value to be On or Off. When the state is On, traffic flows to a cell. When it's off, traffic does not flow. For more information about working with routing controls, see [Routing control](https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.html) in the Route 53 Application Recovery Controller Developer Guide.

``` swift
public func updateRoutingControlState(input: UpdateRoutingControlStateInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRoutingControlStateOutputResponse, UpdateRoutingControlStateOutputError>) -> Void)
```

### `updateRoutingControlStates(input:completion:)`

Set multiple routing control states. You can set the value for each state to be On or Off. When the state is On, traffic flows to a cell. When it's off, traffic does not flow. For more information about working with routing controls, see [Routing control](https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.html) in the Route 53 Application Recovery Controller Developer Guide.

``` swift
public func updateRoutingControlStates(input: UpdateRoutingControlStatesInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRoutingControlStatesOutputResponse, UpdateRoutingControlStatesOutputError>) -> Void)
```
