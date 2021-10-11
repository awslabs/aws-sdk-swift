# ElasticLoadBalancingClient

``` swift
public class ElasticLoadBalancingClient 
```

## Inheritance

[`ElasticLoadBalancingClientProtocol`](/aws-sdk-swift/reference/0.x/AWSElasticLoadBalancing/ElasticLoadBalancingClientProtocol)

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

### `addTags(input:completion:)`

Adds the specified tags to the specified load balancer. Each load balancer can have a maximum of 10 tags.

``` swift
public func addTags(input: AddTagsInput, completion: @escaping (ClientRuntime.SdkResult<AddTagsOutputResponse, AddTagsOutputError>) -> Void)
```

``` 
    Each tag consists of a key and an optional value. If a tag with the same key is already associated
        with the load balancer, AddTags updates its value.

    For more information, see <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/add-remove-tags.html">Tag Your Classic Load Balancer
        in the Classic Load Balancers Guide.
```

### `applySecurityGroupsToLoadBalancer(input:completion:)`

Associates one or more security groups with your load balancer in a virtual private cloud (VPC). The specified security groups override the previously associated security groups.
For more information, see <a href="https:​//docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-security-groups.html#elb-vpc-security-groups">Security Groups for Load Balancers in a VPC
in the Classic Load Balancers Guide.

``` swift
public func applySecurityGroupsToLoadBalancer(input: ApplySecurityGroupsToLoadBalancerInput, completion: @escaping (ClientRuntime.SdkResult<ApplySecurityGroupsToLoadBalancerOutputResponse, ApplySecurityGroupsToLoadBalancerOutputError>) -> Void)
```

### `attachLoadBalancerToSubnets(input:completion:)`

Adds one or more subnets to the set of configured subnets for the specified load balancer.
The load balancer evenly distributes requests across all registered subnets.
For more information, see <a href="https:​//docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-manage-subnets.html">Add or Remove Subnets for Your Load Balancer in a VPC
in the Classic Load Balancers Guide.

``` swift
public func attachLoadBalancerToSubnets(input: AttachLoadBalancerToSubnetsInput, completion: @escaping (ClientRuntime.SdkResult<AttachLoadBalancerToSubnetsOutputResponse, AttachLoadBalancerToSubnetsOutputError>) -> Void)
```

### `configureHealthCheck(input:completion:)`

Specifies the health check settings to use when evaluating the health state of your EC2 instances.
For more information, see <a href="https:​//docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-healthchecks.html">Configure Health Checks for Your Load Balancer
in the Classic Load Balancers Guide.

``` swift
public func configureHealthCheck(input: ConfigureHealthCheckInput, completion: @escaping (ClientRuntime.SdkResult<ConfigureHealthCheckOutputResponse, ConfigureHealthCheckOutputError>) -> Void)
```

### `createAppCookieStickinessPolicy(input:completion:)`

Generates a stickiness policy with sticky session lifetimes that follow that of an application-generated cookie. This policy can be associated only with HTTP/HTTPS listeners.
This policy is similar to the policy created by CreateLBCookieStickinessPolicy,
except that the lifetime of the special Elastic Load Balancing cookie, AWSELB,
follows the lifetime of the application-generated cookie specified in the policy configuration.
The load balancer only inserts a new stickiness cookie when the application response
includes a new application cookie.
If the application cookie is explicitly removed or expires, the session stops being sticky until a new application cookie is issued.
For more information, see <a href="https:​//docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-sticky-sessions.html#enable-sticky-sessions-application">Application-Controlled Session Stickiness
in the Classic Load Balancers Guide.

``` swift
public func createAppCookieStickinessPolicy(input: CreateAppCookieStickinessPolicyInput, completion: @escaping (ClientRuntime.SdkResult<CreateAppCookieStickinessPolicyOutputResponse, CreateAppCookieStickinessPolicyOutputError>) -> Void)
```

### `createLBCookieStickinessPolicy(input:completion:)`

Generates a stickiness policy with sticky session lifetimes controlled by the lifetime of the browser (user-agent) or a specified expiration period. This policy can be associated only with HTTP/HTTPS listeners.
When a load balancer implements this policy, the load balancer uses a special cookie to track the instance for each request. When the load balancer receives a request, it first checks to see if this cookie is present in the request.
If so, the load balancer sends the request to the application server specified in the cookie. If not, the load balancer sends the request to a server that is chosen based on the existing load-balancing algorithm.
A cookie is inserted into the response for binding subsequent requests from the same user to that server. The validity of the cookie is based on the cookie expiration time, which is specified in the policy configuration.

``` swift
public func createLBCookieStickinessPolicy(input: CreateLBCookieStickinessPolicyInput, completion: @escaping (ClientRuntime.SdkResult<CreateLBCookieStickinessPolicyOutputResponse, CreateLBCookieStickinessPolicyOutputError>) -> Void)
```

``` 
    For more information, see <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-sticky-sessions.html#enable-sticky-sessions-duration">Duration-Based Session Stickiness
        in the Classic Load Balancers Guide.
```

### `createLoadBalancer(input:completion:)`

Creates a Classic Load Balancer.

``` swift
public func createLoadBalancer(input: CreateLoadBalancerInput, completion: @escaping (ClientRuntime.SdkResult<CreateLoadBalancerOutputResponse, CreateLoadBalancerOutputError>) -> Void)
```

``` 
    You can add listeners, security groups, subnets, and tags when you create your load balancer,
        or you can add them later using CreateLoadBalancerListeners,
        ApplySecurityGroupsToLoadBalancer, AttachLoadBalancerToSubnets,
        and AddTags.
    To describe your current load balancers, see DescribeLoadBalancers.
        When you are finished with a load balancer, you can delete it using
        DeleteLoadBalancer.

    You can create up to 20 load balancers per region per account.
        You can request an increase for the number of load balancers for your account.
        For more information, see <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-limits.html">Limits for Your Classic Load Balancer
        in the Classic Load Balancers Guide.
```

### `createLoadBalancerListeners(input:completion:)`

Creates one or more listeners for the specified load balancer. If a listener with the specified port does not already exist, it is created; otherwise, the properties of the new listener must match the properties of the existing listener.
For more information, see <a href="https:​//docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-listener-config.html">Listeners for Your Classic Load Balancer
in the Classic Load Balancers Guide.

``` swift
public func createLoadBalancerListeners(input: CreateLoadBalancerListenersInput, completion: @escaping (ClientRuntime.SdkResult<CreateLoadBalancerListenersOutputResponse, CreateLoadBalancerListenersOutputError>) -> Void)
```

### `createLoadBalancerPolicy(input:completion:)`

Creates a policy with the specified attributes for the specified load balancer.
Policies are settings that are saved for your load balancer and that can be applied to the listener or the application server, depending on the policy type.

``` swift
public func createLoadBalancerPolicy(input: CreateLoadBalancerPolicyInput, completion: @escaping (ClientRuntime.SdkResult<CreateLoadBalancerPolicyOutputResponse, CreateLoadBalancerPolicyOutputError>) -> Void)
```

### `deleteLoadBalancer(input:completion:)`

Deletes the specified load balancer.
If you are attempting to recreate a load balancer, you must reconfigure all settings. The DNS name associated with a deleted load balancer are no longer usable. The name and associated DNS record of the deleted load balancer no longer exist and traffic sent to any of its IP addresses is no longer delivered to your instances.
If the load balancer does not exist or has already been deleted, the call to
DeleteLoadBalancer still succeeds.

``` swift
public func deleteLoadBalancer(input: DeleteLoadBalancerInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLoadBalancerOutputResponse, DeleteLoadBalancerOutputError>) -> Void)
```

### `deleteLoadBalancerListeners(input:completion:)`

Deletes the specified listeners from the specified load balancer.

``` swift
public func deleteLoadBalancerListeners(input: DeleteLoadBalancerListenersInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLoadBalancerListenersOutputResponse, DeleteLoadBalancerListenersOutputError>) -> Void)
```

### `deleteLoadBalancerPolicy(input:completion:)`

Deletes the specified policy from the specified load balancer. This policy must not be enabled for any listeners.

``` swift
public func deleteLoadBalancerPolicy(input: DeleteLoadBalancerPolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLoadBalancerPolicyOutputResponse, DeleteLoadBalancerPolicyOutputError>) -> Void)
```

### `deregisterInstancesFromLoadBalancer(input:completion:)`

Deregisters the specified instances from the specified load balancer. After the instance is deregistered, it no longer receives traffic from the load balancer.

``` swift
public func deregisterInstancesFromLoadBalancer(input: DeregisterInstancesFromLoadBalancerInput, completion: @escaping (ClientRuntime.SdkResult<DeregisterInstancesFromLoadBalancerOutputResponse, DeregisterInstancesFromLoadBalancerOutputError>) -> Void)
```

``` 
    You can use DescribeLoadBalancers to verify that the instance is deregistered from the load balancer.

    For more information, see <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-deregister-register-instances.html">Register or De-Register EC2 Instances
        in the Classic Load Balancers Guide.
```

### `describeAccountLimits(input:completion:)`

Describes the current Elastic Load Balancing resource limits for your AWS account.
For more information, see <a href="https:​//docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-limits.html">Limits for Your Classic Load Balancer
in the Classic Load Balancers Guide.

``` swift
public func describeAccountLimits(input: DescribeAccountLimitsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAccountLimitsOutputResponse, DescribeAccountLimitsOutputError>) -> Void)
```

### `describeInstanceHealth(input:completion:)`

Describes the state of the specified instances with respect to the specified load balancer. If no instances are specified, the call describes the state of all instances that are currently registered with the load balancer. If instances are specified, their state is returned even if they are no longer registered with the load balancer. The state of terminated instances is not returned.

``` swift
public func describeInstanceHealth(input: DescribeInstanceHealthInput, completion: @escaping (ClientRuntime.SdkResult<DescribeInstanceHealthOutputResponse, DescribeInstanceHealthOutputError>) -> Void)
```

### `describeLoadBalancerAttributes(input:completion:)`

Describes the attributes for the specified load balancer.

``` swift
public func describeLoadBalancerAttributes(input: DescribeLoadBalancerAttributesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLoadBalancerAttributesOutputResponse, DescribeLoadBalancerAttributesOutputError>) -> Void)
```

### `describeLoadBalancerPolicies(input:completion:)`

Describes the specified policies.
If you specify a load balancer name, the action returns the descriptions of all policies created for the load balancer.
If you specify a policy name associated with your load balancer, the action returns the description of that policy.
If you don't specify a load balancer name, the action returns descriptions of the specified sample policies, or descriptions of all sample policies.
The names of the sample policies have the ELBSample- prefix.

``` swift
public func describeLoadBalancerPolicies(input: DescribeLoadBalancerPoliciesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLoadBalancerPoliciesOutputResponse, DescribeLoadBalancerPoliciesOutputError>) -> Void)
```

### `describeLoadBalancerPolicyTypes(input:completion:)`

Describes the specified load balancer policy types or all load balancer policy types.
The description of each type indicates how it can be used. For example,
some policies can be used only with layer 7 listeners,
some policies can be used only with layer 4 listeners,
and some policies can be used only with your EC2 instances.
You can use CreateLoadBalancerPolicy to create a policy configuration for any of these policy types.
Then, depending on the policy type, use either SetLoadBalancerPoliciesOfListener or
SetLoadBalancerPoliciesForBackendServer to set the policy.

``` swift
public func describeLoadBalancerPolicyTypes(input: DescribeLoadBalancerPolicyTypesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLoadBalancerPolicyTypesOutputResponse, DescribeLoadBalancerPolicyTypesOutputError>) -> Void)
```

### `describeLoadBalancers(input:completion:)`

Describes the specified the load balancers. If no load balancers are specified, the call describes all of your load balancers.

``` swift
public func describeLoadBalancers(input: DescribeLoadBalancersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLoadBalancersOutputResponse, DescribeLoadBalancersOutputError>) -> Void)
```

### `describeTags(input:completion:)`

Describes the tags associated with the specified load balancers.

``` swift
public func describeTags(input: DescribeTagsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTagsOutputResponse, DescribeTagsOutputError>) -> Void)
```

### `detachLoadBalancerFromSubnets(input:completion:)`

Removes the specified subnets from the set of configured subnets for the load balancer.
After a subnet is removed, all EC2 instances registered with the load balancer
in the removed subnet go into the OutOfService state. Then,
the load balancer balances the traffic among the remaining routable subnets.

``` swift
public func detachLoadBalancerFromSubnets(input: DetachLoadBalancerFromSubnetsInput, completion: @escaping (ClientRuntime.SdkResult<DetachLoadBalancerFromSubnetsOutputResponse, DetachLoadBalancerFromSubnetsOutputError>) -> Void)
```

### `disableAvailabilityZonesForLoadBalancer(input:completion:)`

Removes the specified Availability Zones from the set of Availability Zones for the specified load balancer
in EC2-Classic or a default VPC.
For load balancers in a non-default VPC, use DetachLoadBalancerFromSubnets.
There must be at least one Availability Zone registered with a load balancer at all times.
After an Availability Zone is removed, all instances registered with the load balancer that are in the removed
Availability Zone go into the OutOfService state. Then, the load balancer attempts to equally balance
the traffic among its remaining Availability Zones.
For more information, see <a href="https:​//docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-disable-az.html">Add or Remove Availability Zones
in the Classic Load Balancers Guide.

``` swift
public func disableAvailabilityZonesForLoadBalancer(input: DisableAvailabilityZonesForLoadBalancerInput, completion: @escaping (ClientRuntime.SdkResult<DisableAvailabilityZonesForLoadBalancerOutputResponse, DisableAvailabilityZonesForLoadBalancerOutputError>) -> Void)
```

### `enableAvailabilityZonesForLoadBalancer(input:completion:)`

Adds the specified Availability Zones to the set of Availability Zones for the specified load balancer
in EC2-Classic or a default VPC.
For load balancers in a non-default VPC, use AttachLoadBalancerToSubnets.
The load balancer evenly distributes requests across all its registered Availability Zones
that contain instances. For more information, see <a href="https:​//docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-disable-az.html">Add or Remove Availability Zones
in the Classic Load Balancers Guide.

``` swift
public func enableAvailabilityZonesForLoadBalancer(input: EnableAvailabilityZonesForLoadBalancerInput, completion: @escaping (ClientRuntime.SdkResult<EnableAvailabilityZonesForLoadBalancerOutputResponse, EnableAvailabilityZonesForLoadBalancerOutputError>) -> Void)
```

### `modifyLoadBalancerAttributes(input:completion:)`

Modifies the attributes of the specified load balancer.
You can modify the load balancer attributes, such as AccessLogs, ConnectionDraining, and
CrossZoneLoadBalancing by either enabling or disabling them. Or, you can modify the load balancer attribute
ConnectionSettings by specifying an idle connection timeout value for your load balancer.
For more information, see the following in the Classic Load Balancers Guide:​

``` swift
public func modifyLoadBalancerAttributes(input: ModifyLoadBalancerAttributesInput, completion: @escaping (ClientRuntime.SdkResult<ModifyLoadBalancerAttributesOutputResponse, ModifyLoadBalancerAttributesOutputError>) -> Void)
```

``` 
              <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-disable-crosszone-lb.html">Cross-Zone Load Balancing




              <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/config-conn-drain.html">Connection Draining




              <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/access-log-collection.html">Access Logs




              <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/config-idle-timeout.html">Idle Connection Timeout
```

### `registerInstancesWithLoadBalancer(input:completion:)`

Adds the specified instances to the specified load balancer.

``` swift
public func registerInstancesWithLoadBalancer(input: RegisterInstancesWithLoadBalancerInput, completion: @escaping (ClientRuntime.SdkResult<RegisterInstancesWithLoadBalancerOutputResponse, RegisterInstancesWithLoadBalancerOutputError>) -> Void)
```

``` 
    The instance must be a running instance in the same network as the load balancer (EC2-Classic or the same VPC). If you have EC2-Classic instances and a load balancer in a VPC with ClassicLink enabled, you can link the EC2-Classic instances to that VPC and then register the linked EC2-Classic instances with the load balancer in the VPC.

    Note that RegisterInstanceWithLoadBalancer completes when the request has been registered.
     Instance registration takes a little time to complete. To check the state of the registered instances, use
     DescribeLoadBalancers or DescribeInstanceHealth.

    After the instance is registered, it starts receiving traffic
     and requests from the load balancer. Any instance that is not
     in one of the Availability Zones registered for the load balancer
     is moved to the OutOfService state. If an Availability Zone
     is added to the load balancer later, any instances registered with the
     load balancer move to the InService state.

    To deregister instances from a load balancer, use DeregisterInstancesFromLoadBalancer.

    For more information, see <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-deregister-register-instances.html">Register or De-Register EC2 Instances
        in the Classic Load Balancers Guide.
```

### `removeTags(input:completion:)`

Removes one or more tags from the specified load balancer.

``` swift
public func removeTags(input: RemoveTagsInput, completion: @escaping (ClientRuntime.SdkResult<RemoveTagsOutputResponse, RemoveTagsOutputError>) -> Void)
```

### `setLoadBalancerListenerSSLCertificate(input:completion:)`

Sets the certificate that terminates the specified listener's SSL connections. The specified certificate replaces any prior certificate that was used on the same load balancer and port.

``` swift
public func setLoadBalancerListenerSSLCertificate(input: SetLoadBalancerListenerSSLCertificateInput, completion: @escaping (ClientRuntime.SdkResult<SetLoadBalancerListenerSSLCertificateOutputResponse, SetLoadBalancerListenerSSLCertificateOutputError>) -> Void)
```

``` 
    For more information about updating your SSL certificate, see
        <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-update-ssl-cert.html">Replace the SSL Certificate for Your Load Balancer
            in the Classic Load Balancers Guide.
```

### `setLoadBalancerPoliciesForBackendServer(input:completion:)`

Replaces the set of policies associated with the specified port on which the EC2 instance is listening with a new set of policies.
At this time, only the back-end server authentication policy type can be applied to the instance ports; this policy type is composed of multiple public key policies.
Each time you use SetLoadBalancerPoliciesForBackendServer to enable the policies,
use the PolicyNames parameter to list the policies that you want to enable.
You can use DescribeLoadBalancers or DescribeLoadBalancerPolicies to verify that the policy
is associated with the EC2 instance.

``` swift
public func setLoadBalancerPoliciesForBackendServer(input: SetLoadBalancerPoliciesForBackendServerInput, completion: @escaping (ClientRuntime.SdkResult<SetLoadBalancerPoliciesForBackendServerOutputResponse, SetLoadBalancerPoliciesForBackendServerOutputError>) -> Void)
```

``` 
    For more information about enabling back-end instance authentication, see <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-create-https-ssl-load-balancer.html#configure_backendauth_clt">Configure Back-end Instance Authentication
        in the Classic Load Balancers Guide. For more information about Proxy Protocol, see
        <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-proxy-protocol.html">Configure Proxy Protocol Support
        in the Classic Load Balancers Guide.
```

### `setLoadBalancerPoliciesOfListener(input:completion:)`

Replaces the current set of policies for the specified load balancer port with the specified set of policies.
To enable back-end server authentication, use SetLoadBalancerPoliciesForBackendServer.
For more information about setting policies, see
<a href="https:​//docs.aws.amazon.com/elasticloadbalancing/latest/classic/ssl-config-update.html">Update the SSL Negotiation Configuration,
<a href="https:​//docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-sticky-sessions.html#enable-sticky-sessions-duration">Duration-Based Session Stickiness, and
<a href="https:​//docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-sticky-sessions.html#enable-sticky-sessions-application">Application-Controlled Session Stickiness
in the Classic Load Balancers Guide.

``` swift
public func setLoadBalancerPoliciesOfListener(input: SetLoadBalancerPoliciesOfListenerInput, completion: @escaping (ClientRuntime.SdkResult<SetLoadBalancerPoliciesOfListenerOutputResponse, SetLoadBalancerPoliciesOfListenerOutputError>) -> Void)
```
