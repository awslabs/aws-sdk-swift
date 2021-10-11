# ElasticLoadBalancingV2Client

``` swift
public class ElasticLoadBalancingV2Client 
```

## Inheritance

[`ElasticLoadBalancingV2ClientProtocol`](/aws-sdk-swift/reference/0.x/AWSElasticLoadBalancingv2/ElasticLoadBalancingV2ClientProtocol)

## Initializers

### `init(config:)`

``` swift
public init(config: AWSClientRuntime.AWSClientConfiguration) 
```

### `init(region:)`

``` swift
public convenience init(region: Swift.String? = nil) throws 
```

## Methods

### `addListenerCertificates(input:completion:)`

Adds the specified SSL server certificate to the certificate list for the specified HTTPS
or TLS listener.
If the certificate in already in the certificate list, the call is successful but the
certificate is not added again.

``` swift
public func addListenerCertificates(input: AddListenerCertificatesInput, completion: @escaping (ClientRuntime.SdkResult<AddListenerCertificatesOutputResponse, AddListenerCertificatesOutputError>) -> Void)
```

``` 
     For more information, see <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html">HTTPS
    listeners in the Application Load Balancers Guide or <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html">TLS
    listeners in the Network Load Balancers Guide.
```

### `addTags(input:completion:)`

Adds the specified tags to the specified Elastic Load Balancing resource. You can tag your
Application Load Balancers, Network Load Balancers, Gateway Load Balancers, target groups,
listeners, and rules.
Each tag consists of a key and an optional value. If a resource already has a tag with the
same key, AddTags updates its value.

``` swift
public func addTags(input: AddTagsInput, completion: @escaping (ClientRuntime.SdkResult<AddTagsOutputResponse, AddTagsOutputError>) -> Void)
```

### `createListener(input:completion:)`

Creates a listener for the specified Application Load Balancer, Network Load Balancer, or
Gateway Load Balancer.

``` swift
public func createListener(input: CreateListenerInput, completion: @escaping (ClientRuntime.SdkResult<CreateListenerOutputResponse, CreateListenerOutputError>) -> Void)
```

``` 
     For more information, see the following:



              <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html">Listeners for
        your Application Load Balancers




              <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-listeners.html">Listeners for
        your Network Load Balancers




              <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/gateway-listeners.html">Listeners for your
        Gateway Load Balancers




     This operation is idempotent, which means that it completes at most one time. If you
  attempt to create multiple listeners with the same settings, each call succeeds.
```

### `createLoadBalancer(input:completion:)`

Creates an Application Load Balancer, Network Load Balancer, or Gateway Load
Balancer.

``` swift
public func createLoadBalancer(input: CreateLoadBalancerInput, completion: @escaping (ClientRuntime.SdkResult<CreateLoadBalancerOutputResponse, CreateLoadBalancerOutputError>) -> Void)
```

``` 
     For more information, see the following:



              <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/application-load-balancers.html">Application Load Balancers




              <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/network-load-balancers.html">Network Load
        Balancers




              <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/gateway-load-balancers.html">Gateway Load
        Balancers




     This operation is idempotent, which means that it completes at most one time. If you
  attempt to create multiple load balancers with the same settings, each call succeeds.
```

### `createRule(input:completion:)`

Creates a rule for the specified listener. The listener must be associated with an
Application Load Balancer.
Each rule consists of a priority, one or more actions, and one or more conditions. Rules
are evaluated in priority order, from the lowest value to the highest value. When the
conditions for a rule are met, its actions are performed. If the conditions for no rules are
met, the actions for the default rule are performed. For more information, see <a href="https:​//docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html#listener-rules">Listener rules in the Application Load Balancers Guide.

``` swift
public func createRule(input: CreateRuleInput, completion: @escaping (ClientRuntime.SdkResult<CreateRuleOutputResponse, CreateRuleOutputError>) -> Void)
```

### `createTargetGroup(input:completion:)`

Creates a target group.

``` swift
public func createTargetGroup(input: CreateTargetGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateTargetGroupOutputResponse, CreateTargetGroupOutputError>) -> Void)
```

``` 
     For more information, see the following:



              <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html">Target
        groups for your Application Load Balancers




              <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-target-groups.html">Target groups
        for your Network Load Balancers




              <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/target-groups.html">Target groups for your
        Gateway Load Balancers




     This operation is idempotent, which means that it completes at most one time. If you
  attempt to create multiple target groups with the same settings, each call succeeds.
```

### `deleteListener(input:completion:)`

Deletes the specified listener.
Alternatively, your listener is deleted when you delete the load balancer to which it is
attached.

``` swift
public func deleteListener(input: DeleteListenerInput, completion: @escaping (ClientRuntime.SdkResult<DeleteListenerOutputResponse, DeleteListenerOutputError>) -> Void)
```

### `deleteLoadBalancer(input:completion:)`

Deletes the specified Application Load Balancer, Network Load Balancer, or Gateway Load
Balancer. Deleting a load balancer also deletes its listeners.
You can't delete a load balancer if deletion protection is enabled. If the load balancer
does not exist or has already been deleted, the call succeeds.
Deleting a load balancer does not affect its registered targets. For example, your EC2
instances continue to run and are still registered to their target groups. If you no longer
need these EC2 instances, you can stop or terminate them.

``` swift
public func deleteLoadBalancer(input: DeleteLoadBalancerInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLoadBalancerOutputResponse, DeleteLoadBalancerOutputError>) -> Void)
```

### `deleteRule(input:completion:)`

Deletes the specified rule.
You can't delete the default rule.

``` swift
public func deleteRule(input: DeleteRuleInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRuleOutputResponse, DeleteRuleOutputError>) -> Void)
```

### `deleteTargetGroup(input:completion:)`

Deletes the specified target group.
You can delete a target group if it is not referenced by any actions. Deleting a target
group also deletes any associated health checks. Deleting a target group does not affect its
registered targets. For example, any EC2 instances continue to run until you stop or terminate
them.

``` swift
public func deleteTargetGroup(input: DeleteTargetGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTargetGroupOutputResponse, DeleteTargetGroupOutputError>) -> Void)
```

### `deregisterTargets(input:completion:)`

Deregisters the specified targets from the specified target group. After the targets are
deregistered, they no longer receive traffic from the load balancer.

``` swift
public func deregisterTargets(input: DeregisterTargetsInput, completion: @escaping (ClientRuntime.SdkResult<DeregisterTargetsOutputResponse, DeregisterTargetsOutputError>) -> Void)
```

### `describeAccountLimits(input:completion:)`

Describes the current Elastic Load Balancing resource limits for your Amazon Web Services
account.
For more information, see the following:​

``` swift
public func describeAccountLimits(input: DescribeAccountLimitsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAccountLimitsOutputResponse, DescribeAccountLimitsOutputError>) -> Void)
```

``` 
              <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-limits.html">Quotas for your
        Application Load Balancers




              <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-limits.html">Quotas for your
        Network Load Balancers




              <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/quotas-limits.html">Quotas for your Gateway
        Load Balancers
```

### `describeListenerCertificates(input:completion:)`

Describes the default certificate and the certificate list for the specified HTTPS or TLS
listener.
If the default certificate is also in the certificate list, it appears twice in the
results (once with IsDefault set to true and once with IsDefault set
to false).
For more information, see <a href="https:​//docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html#https-listener-certificates">SSL certificates in the Application Load Balancers Guide or
<a href="https:​//docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html#tls-listener-certificate">Server certificates in the Network Load Balancers
Guide.

``` swift
public func describeListenerCertificates(input: DescribeListenerCertificatesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeListenerCertificatesOutputResponse, DescribeListenerCertificatesOutputError>) -> Void)
```

### `describeListeners(input:completion:)`

Describes the specified listeners or the listeners for the specified Application Load
Balancer, Network Load Balancer, or Gateway Load Balancer. You must specify either a load
balancer or one or more listeners.

``` swift
public func describeListeners(input: DescribeListenersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeListenersOutputResponse, DescribeListenersOutputError>) -> Void)
```

### `describeLoadBalancerAttributes(input:completion:)`

Describes the attributes for the specified Application Load Balancer, Network Load
Balancer, or Gateway Load Balancer.

``` swift
public func describeLoadBalancerAttributes(input: DescribeLoadBalancerAttributesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLoadBalancerAttributesOutputResponse, DescribeLoadBalancerAttributesOutputError>) -> Void)
```

``` 
     For more information, see the following:



              <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/application-load-balancers.html#load-balancer-attributes">Load balancer attributes in the Application Load Balancers
        Guide




              <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/network-load-balancers.html#load-balancer-attributes">Load balancer attributes in the Network Load Balancers
        Guide




              <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/gateway-load-balancers.html#load-balancer-attributes">Load balancer attributes in the Gateway Load Balancers
        Guide
```

### `describeLoadBalancers(input:completion:)`

Describes the specified load balancers or all of your load balancers.

``` swift
public func describeLoadBalancers(input: DescribeLoadBalancersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLoadBalancersOutputResponse, DescribeLoadBalancersOutputError>) -> Void)
```

### `describeRules(input:completion:)`

Describes the specified rules or the rules for the specified listener. You must specify
either a listener or one or more rules.

``` swift
public func describeRules(input: DescribeRulesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeRulesOutputResponse, DescribeRulesOutputError>) -> Void)
```

### `describeSSLPolicies(input:completion:)`

Describes the specified policies or all policies used for SSL negotiation.
For more information, see <a href="https:​//docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html#describe-ssl-policies">Security policies in the Application Load Balancers Guide or
<a href="https:​//docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html#describe-ssl-policies">Security policies in the Network Load Balancers Guide.

``` swift
public func describeSSLPolicies(input: DescribeSSLPoliciesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSSLPoliciesOutputResponse, DescribeSSLPoliciesOutputError>) -> Void)
```

### `describeTags(input:completion:)`

Describes the tags for the specified Elastic Load Balancing resources. You can describe
the tags for one or more Application Load Balancers, Network Load Balancers, Gateway Load
Balancers, target groups, listeners, or rules.

``` swift
public func describeTags(input: DescribeTagsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTagsOutputResponse, DescribeTagsOutputError>) -> Void)
```

### `describeTargetGroupAttributes(input:completion:)`

Describes the attributes for the specified target group.
For more information, see the following:​

``` swift
public func describeTargetGroupAttributes(input: DescribeTargetGroupAttributesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTargetGroupAttributesOutputResponse, DescribeTargetGroupAttributesOutputError>) -> Void)
```

``` 
              <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html#target-group-attributes">Target group attributes in the Application Load Balancers
        Guide




              <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-target-groups.html#target-group-attributes">Target group attributes in the Network Load Balancers
        Guide




              <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/target-groups.html#target-group-attributes">Target group attributes in the Gateway Load Balancers
        Guide
```

### `describeTargetGroups(input:completion:)`

Describes the specified target groups or all of your target groups. By default, all target
groups are described. Alternatively, you can specify one of the following to filter the
results:​ the ARN of the load balancer, the names of one or more target groups, or the ARNs of
one or more target groups.

``` swift
public func describeTargetGroups(input: DescribeTargetGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTargetGroupsOutputResponse, DescribeTargetGroupsOutputError>) -> Void)
```

### `describeTargetHealth(input:completion:)`

Describes the health of the specified targets or all of your targets.

``` swift
public func describeTargetHealth(input: DescribeTargetHealthInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTargetHealthOutputResponse, DescribeTargetHealthOutputError>) -> Void)
```

### `modifyListener(input:completion:)`

Replaces the specified properties of the specified listener. Any properties that you do
not specify remain unchanged.
Changing the protocol from HTTPS to HTTP, or from TLS to TCP, removes the security policy
and default certificate properties. If you change the protocol from HTTP to HTTPS, or from TCP
to TLS, you must add the security policy and default certificate properties.
To add an item to a list, remove an item from a list, or update an item in a list, you
must provide the entire list. For example, to add an action, specify a list with the current
actions plus the new action.

``` swift
public func modifyListener(input: ModifyListenerInput, completion: @escaping (ClientRuntime.SdkResult<ModifyListenerOutputResponse, ModifyListenerOutputError>) -> Void)
```

### `modifyLoadBalancerAttributes(input:completion:)`

Modifies the specified attributes of the specified Application Load Balancer, Network Load
Balancer, or Gateway Load Balancer.
If any of the specified attributes can't be modified as requested, the call fails. Any
existing attributes that you do not modify retain their current values.

``` swift
public func modifyLoadBalancerAttributes(input: ModifyLoadBalancerAttributesInput, completion: @escaping (ClientRuntime.SdkResult<ModifyLoadBalancerAttributesOutputResponse, ModifyLoadBalancerAttributesOutputError>) -> Void)
```

### `modifyRule(input:completion:)`

Replaces the specified properties of the specified rule. Any properties that you do not
specify are unchanged.
To add an item to a list, remove an item from a list, or update an item in a list, you
must provide the entire list. For example, to add an action, specify a list with the current
actions plus the new action.

``` swift
public func modifyRule(input: ModifyRuleInput, completion: @escaping (ClientRuntime.SdkResult<ModifyRuleOutputResponse, ModifyRuleOutputError>) -> Void)
```

### `modifyTargetGroup(input:completion:)`

Modifies the health checks used when evaluating the health state of the targets in the
specified target group.

``` swift
public func modifyTargetGroup(input: ModifyTargetGroupInput, completion: @escaping (ClientRuntime.SdkResult<ModifyTargetGroupOutputResponse, ModifyTargetGroupOutputError>) -> Void)
```

### `modifyTargetGroupAttributes(input:completion:)`

Modifies the specified attributes of the specified target group.

``` swift
public func modifyTargetGroupAttributes(input: ModifyTargetGroupAttributesInput, completion: @escaping (ClientRuntime.SdkResult<ModifyTargetGroupAttributesOutputResponse, ModifyTargetGroupAttributesOutputError>) -> Void)
```

### `registerTargets(input:completion:)`

Registers the specified targets with the specified target group.

``` swift
public func registerTargets(input: RegisterTargetsInput, completion: @escaping (ClientRuntime.SdkResult<RegisterTargetsOutputResponse, RegisterTargetsOutputError>) -> Void)
```

``` 
     If the target is an EC2 instance, it must be in the running state when you
  register it.

     By default, the load balancer routes requests to registered targets using the protocol and
  port for the target group. Alternatively, you can override the port for a target when you
  register it. You can register each EC2 instance or IP address with the same target group
  multiple times using different ports.

     With a Network Load Balancer, you cannot register instances by instance ID if they have
  the following instance types: C1, CC1, CC2, CG1, CG2, CR1, CS1, G1, G2, HI1, HS1, M1, M2, M3,
  and T1. You can register instances of these types by IP address.
```

### `removeListenerCertificates(input:completion:)`

Removes the specified certificate from the certificate list for the specified HTTPS or TLS
listener.

``` swift
public func removeListenerCertificates(input: RemoveListenerCertificatesInput, completion: @escaping (ClientRuntime.SdkResult<RemoveListenerCertificatesOutputResponse, RemoveListenerCertificatesOutputError>) -> Void)
```

### `removeTags(input:completion:)`

Removes the specified tags from the specified Elastic Load Balancing resources. You can
remove the tags for one or more Application Load Balancers, Network Load Balancers, Gateway
Load Balancers, target groups, listeners, or rules.

``` swift
public func removeTags(input: RemoveTagsInput, completion: @escaping (ClientRuntime.SdkResult<RemoveTagsOutputResponse, RemoveTagsOutputError>) -> Void)
```

### `setIpAddressType(input:completion:)`

Sets the type of IP addresses used by the subnets of the specified Application Load
Balancer or Network Load Balancer.

``` swift
public func setIpAddressType(input: SetIpAddressTypeInput, completion: @escaping (ClientRuntime.SdkResult<SetIpAddressTypeOutputResponse, SetIpAddressTypeOutputError>) -> Void)
```

### `setRulePriorities(input:completion:)`

Sets the priorities of the specified rules.
You can reorder the rules as long as there are no priority conflicts in the new order. Any
existing rules that you do not specify retain their current priority.

``` swift
public func setRulePriorities(input: SetRulePrioritiesInput, completion: @escaping (ClientRuntime.SdkResult<SetRulePrioritiesOutputResponse, SetRulePrioritiesOutputError>) -> Void)
```

### `setSecurityGroups(input:completion:)`

Associates the specified security groups with the specified Application Load Balancer. The
specified security groups override the previously associated security groups.
You can't specify a security group for a Network Load Balancer or Gateway Load
Balancer.

``` swift
public func setSecurityGroups(input: SetSecurityGroupsInput, completion: @escaping (ClientRuntime.SdkResult<SetSecurityGroupsOutputResponse, SetSecurityGroupsOutputError>) -> Void)
```

### `setSubnets(input:completion:)`

Enables the Availability Zones for the specified public subnets for the specified
Application Load Balancer or Network Load Balancer. The specified subnets replace the
previously enabled subnets.
When you specify subnets for a Network Load Balancer, you must include all subnets that
were enabled previously, with their existing configurations, plus any additional
subnets.

``` swift
public func setSubnets(input: SetSubnetsInput, completion: @escaping (ClientRuntime.SdkResult<SetSubnetsOutputResponse, SetSubnetsOutputError>) -> Void)
```
