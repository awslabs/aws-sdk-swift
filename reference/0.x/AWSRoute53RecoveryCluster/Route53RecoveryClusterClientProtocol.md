# Route53RecoveryClusterClientProtocol

Welcome to the Amazon Route 53 Application Recovery Controller API Reference Guide for Recovery Control Data Plane .
Recovery control in Route 53 Application Recovery Controller includes extremely reliable routing controls that enable you to recover applications
by rerouting traffic, for example, across Availability Zones or AWS Regions. Routing controls are simple on/off switches
hosted on a cluster. A cluster is a set of five redundant regional endpoints against which you can execute API calls to update or
get the state of routing controls. You use routing controls to failover traffic to recover your application
across Availability Zones or Regions.
This API guide includes information about how to get and update routing control states in Route 53 Application Recovery Controller.
For more information about Route 53 Application Recovery Controller, see the following:​

``` swift
public protocol Route53RecoveryClusterClientProtocol 
```

``` 
           You can create clusters, routing controls, and control panels by using the control plane API for Recovery
				Control. For more information, see <a href="https://docs.aws.amazon.com/recovery-cluster/latest/api/">Amazon Route 53 Application Recovery Controller Recovery Control API Reference.


           Route 53 Application Recovery Controller also provides continuous readiness checks to ensure that your applications are scaled to handle failover traffic.
				For more information about the related API actions, see <a href="https://docs.aws.amazon.com/recovery-readiness/latest/api/">Amazon Route 53 Application Recovery Controller Recovery Readiness API Reference.


           For more information about creating resilient applications and preparing for recovery readiness with Route 53 Application Recovery Controller,
				see the <a href="r53recovery/latest/dg/">Amazon Route 53 Application Recovery Controller Developer Guide.
```

## Requirements

### getRoutingControlState(input:​completion:​)

Get the state for a routing control. A routing control is a simple on/off switch
that you can use to route traffic to cells. When the state is On, traffic flows to a cell. When it's off, traffic does not flow.
Before you can create a routing control, you first must create a cluster to host the control.
For more information, see
<a href="https:​//docs.aws.amazon.com/recovery-cluster/latest/api/cluster.html">CreateCluster.
Access one of the endpoints for the cluster to get or update the routing control state to
redirect traffic.
For more information about working with routing controls, see
<a href="https:​//docs.aws.amazon.com/r53recovery/latest/dg/routing-control.html">Routing control
in the Route 53 Application Recovery Controller Developer Guide.

``` swift
func getRoutingControlState(input: GetRoutingControlStateInput, completion: @escaping (ClientRuntime.SdkResult<GetRoutingControlStateOutputResponse, GetRoutingControlStateOutputError>) -> Void)
```

### updateRoutingControlState(input:​completion:​)

Set the state of the routing control to reroute traffic. You can set the value to be On or Off.
When the state is On, traffic flows to a cell. When it's off, traffic does not flow.
For more information about working with routing controls, see
<a href="https:​//docs.aws.amazon.com/r53recovery/latest/dg/routing-control.html">Routing control
in the Route 53 Application Recovery Controller Developer Guide.

``` swift
func updateRoutingControlState(input: UpdateRoutingControlStateInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRoutingControlStateOutputResponse, UpdateRoutingControlStateOutputError>) -> Void)
```

### updateRoutingControlStates(input:​completion:​)

Set multiple routing control states. You can set the value for each state to be On or Off.
When the state is On, traffic flows to a cell. When it's off, traffic does not flow.
For more information about working with routing controls, see
<a href="https:​//docs.aws.amazon.com/r53recovery/latest/dg/routing-control.html">Routing control
in the Route 53 Application Recovery Controller Developer Guide.

``` swift
func updateRoutingControlStates(input: UpdateRoutingControlStatesInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRoutingControlStatesOutputResponse, UpdateRoutingControlStatesOutputError>) -> Void)
```
