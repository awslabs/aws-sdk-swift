# Route53RecoveryControlConfigClientProtocol

Recovery Control Configuration API Reference for Amazon Route 53 Application Recovery Controller

``` swift
public protocol Route53RecoveryControlConfigClientProtocol 
```

## Requirements

### createCluster(input:​completion:​)

Create a new cluster. A cluster is a set of redundant Regional endpoints against which you can run API calls to update or get the state of one or more routing controls. Each cluster has a name, status, Amazon Resource Name (ARN), and an array of the five cluster endpoints (one for each supported Amazon Web Services Region) that you can use with API calls to the Amazon Route 53 Application Recovery Controller cluster data plane.

``` swift
func createCluster(input: CreateClusterInput, completion: @escaping (ClientRuntime.SdkResult<CreateClusterOutputResponse, CreateClusterOutputError>) -> Void)
```

### createControlPanel(input:​completion:​)

Creates a new control panel. A control panel represents a group of routing controls that can be changed together in a single transaction. You can use a control panel to centrally view the operational status of applications across your organization, and trigger multi-app failovers in a single transaction, for example, to fail over an Availability Zone or AWS Region.

``` swift
func createControlPanel(input: CreateControlPanelInput, completion: @escaping (ClientRuntime.SdkResult<CreateControlPanelOutputResponse, CreateControlPanelOutputError>) -> Void)
```

### createRoutingControl(input:​completion:​)

Creates a new routing control. A routing control has one of two states:​ ON and OFF. You can map the routing control state to the state of an Amazon Route 53 health check, which can be used to control traffic routing. To get or update the routing control state, see the Recovery Cluster (data plane) API actions for Amazon Route 53 Application Recovery Controller.

``` swift
func createRoutingControl(input: CreateRoutingControlInput, completion: @escaping (ClientRuntime.SdkResult<CreateRoutingControlOutputResponse, CreateRoutingControlOutputError>) -> Void)
```

### createSafetyRule(input:​completion:​)

Creates a safety rule in a control panel. Safety rules let you add safeguards around enabling and disabling routing controls, to help prevent unexpected outcomes. There are two types of safety rules:​ assertion rules and gating rules. Assertion rule:​ An assertion rule enforces that, when a routing control state is changed, the criteria set by the rule configuration is met. Otherwise, the change to the routing control is not accepted. Gating rule:​ A gating rule verifies that a set of gating controls evaluates as true, based on a rule configuration that you specify. If the gating rule evaluates to true, Amazon Route 53 Application Recovery Controller allows a set of routing control state changes to run and complete against the set of target controls.

``` swift
func createSafetyRule(input: CreateSafetyRuleInput, completion: @escaping (ClientRuntime.SdkResult<CreateSafetyRuleOutputResponse, CreateSafetyRuleOutputError>) -> Void)
```

### deleteCluster(input:​completion:​)

Delete a cluster.

``` swift
func deleteCluster(input: DeleteClusterInput, completion: @escaping (ClientRuntime.SdkResult<DeleteClusterOutputResponse, DeleteClusterOutputError>) -> Void)
```

### deleteControlPanel(input:​completion:​)

Deletes a control panel.

``` swift
func deleteControlPanel(input: DeleteControlPanelInput, completion: @escaping (ClientRuntime.SdkResult<DeleteControlPanelOutputResponse, DeleteControlPanelOutputError>) -> Void)
```

### deleteRoutingControl(input:​completion:​)

Deletes a routing control.

``` swift
func deleteRoutingControl(input: DeleteRoutingControlInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRoutingControlOutputResponse, DeleteRoutingControlOutputError>) -> Void)
```

### deleteSafetyRule(input:​completion:​)

Deletes a safety rule./\>

``` swift
func deleteSafetyRule(input: DeleteSafetyRuleInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSafetyRuleOutputResponse, DeleteSafetyRuleOutputError>) -> Void)
```

### describeCluster(input:​completion:​)

Display the details about a cluster. The response includes the cluster name, endpoints, status, and Amazon Resource Name (ARN).

``` swift
func describeCluster(input: DescribeClusterInput, completion: @escaping (ClientRuntime.SdkResult<DescribeClusterOutputResponse, DescribeClusterOutputError>) -> Void)
```

### describeControlPanel(input:​completion:​)

Displays details about a control panel.

``` swift
func describeControlPanel(input: DescribeControlPanelInput, completion: @escaping (ClientRuntime.SdkResult<DescribeControlPanelOutputResponse, DescribeControlPanelOutputError>) -> Void)
```

### describeRoutingControl(input:​completion:​)

Displays details about a routing control. A routing control has one of two states:​ ON and OFF. You can map the routing control state to the state of an Amazon Route 53 health check, which can be used to control routing. To get or update the routing control state, see the Recovery Cluster (data plane) API actions for Amazon Route 53 Application Recovery Controller.

``` swift
func describeRoutingControl(input: DescribeRoutingControlInput, completion: @escaping (ClientRuntime.SdkResult<DescribeRoutingControlOutputResponse, DescribeRoutingControlOutputError>) -> Void)
```

### describeSafetyRule(input:​completion:​)

Describes the safety rules (that is, the assertion rules and gating rules) for the routing controls in a control panel.

``` swift
func describeSafetyRule(input: DescribeSafetyRuleInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSafetyRuleOutputResponse, DescribeSafetyRuleOutputError>) -> Void)
```

### listAssociatedRoute53HealthChecks(input:​completion:​)

Returns an array of all Amazon Route 53 health checks associated with a specific routing control.

``` swift
func listAssociatedRoute53HealthChecks(input: ListAssociatedRoute53HealthChecksInput, completion: @escaping (ClientRuntime.SdkResult<ListAssociatedRoute53HealthChecksOutputResponse, ListAssociatedRoute53HealthChecksOutputError>) -> Void)
```

### listClusters(input:​completion:​)

Returns an array of all the clusters in an account.

``` swift
func listClusters(input: ListClustersInput, completion: @escaping (ClientRuntime.SdkResult<ListClustersOutputResponse, ListClustersOutputError>) -> Void)
```

### listControlPanels(input:​completion:​)

Returns an array of control panels for a cluster.

``` swift
func listControlPanels(input: ListControlPanelsInput, completion: @escaping (ClientRuntime.SdkResult<ListControlPanelsOutputResponse, ListControlPanelsOutputError>) -> Void)
```

### listRoutingControls(input:​completion:​)

Returns an array of routing controls for a control panel. A routing control is an Amazon Route 53 Application Recovery Controller construct that has one of two states:​ ON and OFF. You can map the routing control state to the state of an Amazon Route 53 health check, which can be used to control routing.

``` swift
func listRoutingControls(input: ListRoutingControlsInput, completion: @escaping (ClientRuntime.SdkResult<ListRoutingControlsOutputResponse, ListRoutingControlsOutputError>) -> Void)
```

### listSafetyRules(input:​completion:​)

List the safety rules (the assertion rules and gating rules) that you've defined for the routing controls in a control panel.

``` swift
func listSafetyRules(input: ListSafetyRulesInput, completion: @escaping (ClientRuntime.SdkResult<ListSafetyRulesOutputResponse, ListSafetyRulesOutputError>) -> Void)
```

### updateControlPanel(input:​completion:​)

Updates a control panel. The only update you can make to a control panel is to change the name of the control panel.

``` swift
func updateControlPanel(input: UpdateControlPanelInput, completion: @escaping (ClientRuntime.SdkResult<UpdateControlPanelOutputResponse, UpdateControlPanelOutputError>) -> Void)
```

### updateRoutingControl(input:​completion:​)

Updates a routing control. You can only update the name of the routing control. To get or update the routing control state, see the Recovery Cluster (data plane) API actions for Amazon Route 53 Application Recovery Controller.

``` swift
func updateRoutingControl(input: UpdateRoutingControlInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRoutingControlOutputResponse, UpdateRoutingControlOutputError>) -> Void)
```

### updateSafetyRule(input:​completion:​)

Update a safety rule (an assertion rule or gating rule) for the routing controls in a control panel. You can only update the name and the waiting period for a safety rule. To make other updates, delete the safety rule and create a new safety rule.

``` swift
func updateSafetyRule(input: UpdateSafetyRuleInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSafetyRuleOutputResponse, UpdateSafetyRuleOutputError>) -> Void)
```
