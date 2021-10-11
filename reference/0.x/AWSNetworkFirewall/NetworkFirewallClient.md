# NetworkFirewallClient

``` swift
public class NetworkFirewallClient 
```

## Inheritance

[`NetworkFirewallClientProtocol`](/aws-sdk-swift/reference/0.x/AWSNetworkFirewall/NetworkFirewallClientProtocol)

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

### `associateFirewallPolicy(input:completion:)`

Associates a FirewallPolicy to a Firewall.
A firewall policy defines how to monitor and manage your VPC network traffic, using a
collection of inspection rule groups and other settings. Each firewall requires one
firewall policy association, and you can use the same firewall policy for multiple
firewalls.

``` swift
public func associateFirewallPolicy(input: AssociateFirewallPolicyInput, completion: @escaping (ClientRuntime.SdkResult<AssociateFirewallPolicyOutputResponse, AssociateFirewallPolicyOutputError>) -> Void)
```

### `associateSubnets(input:completion:)`

Associates the specified subnets in the Amazon VPC to the firewall. You can specify one
subnet for each of the Availability Zones that the VPC spans.
This request creates an AWS Network Firewall firewall endpoint in each of the subnets. To
enable the firewall's protections, you must also modify the VPC's route tables for each
subnet's Availability Zone, to redirect the traffic that's coming into and going out of the
zone through the firewall endpoint.

``` swift
public func associateSubnets(input: AssociateSubnetsInput, completion: @escaping (ClientRuntime.SdkResult<AssociateSubnetsOutputResponse, AssociateSubnetsOutputError>) -> Void)
```

### `createFirewall(input:completion:)`

Creates an AWS Network Firewall Firewall and accompanying FirewallStatus for a VPC.
The firewall defines the configuration settings for an AWS Network Firewall firewall. The settings that you can define at creation include the firewall policy, the subnets in your VPC to use for the firewall endpoints, and any tags that are attached to the firewall AWS resource.
After you create a firewall, you can provide additional settings, like the logging configuration.
To update the settings for a firewall, you use the operations that apply to the settings
themselves, for example UpdateLoggingConfiguration, AssociateSubnets, and UpdateFirewallDeleteProtection.
To manage a firewall's tags, use the standard AWS resource tagging operations, ListTagsForResource, TagResource, and UntagResource.
To retrieve information about firewalls, use ListFirewalls and DescribeFirewall.

``` swift
public func createFirewall(input: CreateFirewallInput, completion: @escaping (ClientRuntime.SdkResult<CreateFirewallOutputResponse, CreateFirewallOutputError>) -> Void)
```

### `createFirewallPolicy(input:completion:)`

Creates the firewall policy for the firewall according to the specifications.
An AWS Network Firewall firewall policy defines the behavior of a firewall, in a collection of
stateless and stateful rule groups and other settings. You can use one firewall policy for
multiple firewalls.

``` swift
public func createFirewallPolicy(input: CreateFirewallPolicyInput, completion: @escaping (ClientRuntime.SdkResult<CreateFirewallPolicyOutputResponse, CreateFirewallPolicyOutputError>) -> Void)
```

### `createRuleGroup(input:completion:)`

Creates the specified stateless or stateful rule group, which includes the rules for
network traffic inspection, a capacity setting, and tags.
You provide your rule group specification in your request using either
RuleGroup or Rules.

``` swift
public func createRuleGroup(input: CreateRuleGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateRuleGroupOutputResponse, CreateRuleGroupOutputError>) -> Void)
```

### `deleteFirewall(input:completion:)`

Deletes the specified Firewall and its FirewallStatus.
This operation requires the firewall's DeleteProtection flag to be
FALSE. You can't revert this operation.
You can check whether a firewall is
in use by reviewing the route tables for the Availability Zones where you have
firewall subnet mappings. Retrieve the subnet mappings by calling DescribeFirewall.
You define and update the route tables through Amazon VPC. As needed, update the route tables for the
zones to remove the firewall endpoints. When the route tables no longer use the firewall endpoints,
you can remove the firewall safely.
To delete a firewall, remove the delete protection if you need to using UpdateFirewallDeleteProtection,
then delete the firewall by calling DeleteFirewall.

``` swift
public func deleteFirewall(input: DeleteFirewallInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFirewallOutputResponse, DeleteFirewallOutputError>) -> Void)
```

### `deleteFirewallPolicy(input:completion:)`

Deletes the specified FirewallPolicy.

``` swift
public func deleteFirewallPolicy(input: DeleteFirewallPolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFirewallPolicyOutputResponse, DeleteFirewallPolicyOutputError>) -> Void)
```

### `deleteResourcePolicy(input:completion:)`

Deletes a resource policy that you created in a PutResourcePolicy request.

``` swift
public func deleteResourcePolicy(input: DeleteResourcePolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteResourcePolicyOutputResponse, DeleteResourcePolicyOutputError>) -> Void)
```

### `deleteRuleGroup(input:completion:)`

Deletes the specified RuleGroup.

``` swift
public func deleteRuleGroup(input: DeleteRuleGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRuleGroupOutputResponse, DeleteRuleGroupOutputError>) -> Void)
```

### `describeFirewall(input:completion:)`

Returns the data objects for the specified firewall.

``` swift
public func describeFirewall(input: DescribeFirewallInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFirewallOutputResponse, DescribeFirewallOutputError>) -> Void)
```

### `describeFirewallPolicy(input:completion:)`

Returns the data objects for the specified firewall policy.

``` swift
public func describeFirewallPolicy(input: DescribeFirewallPolicyInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFirewallPolicyOutputResponse, DescribeFirewallPolicyOutputError>) -> Void)
```

### `describeLoggingConfiguration(input:completion:)`

Returns the logging configuration for the specified firewall.

``` swift
public func describeLoggingConfiguration(input: DescribeLoggingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLoggingConfigurationOutputResponse, DescribeLoggingConfigurationOutputError>) -> Void)
```

### `describeResourcePolicy(input:completion:)`

Retrieves a resource policy that you created in a PutResourcePolicy request.

``` swift
public func describeResourcePolicy(input: DescribeResourcePolicyInput, completion: @escaping (ClientRuntime.SdkResult<DescribeResourcePolicyOutputResponse, DescribeResourcePolicyOutputError>) -> Void)
```

### `describeRuleGroup(input:completion:)`

Returns the data objects for the specified rule group.

``` swift
public func describeRuleGroup(input: DescribeRuleGroupInput, completion: @escaping (ClientRuntime.SdkResult<DescribeRuleGroupOutputResponse, DescribeRuleGroupOutputError>) -> Void)
```

### `disassociateSubnets(input:completion:)`

Removes the specified subnet associations from the firewall. This removes the
firewall endpoints from the subnets and removes any network filtering protections that the endpoints
were providing.

``` swift
public func disassociateSubnets(input: DisassociateSubnetsInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateSubnetsOutputResponse, DisassociateSubnetsOutputError>) -> Void)
```

### `listFirewallPolicies(input:completion:)`

Retrieves the metadata for the firewall policies that you have defined. Depending on
your setting for max results and the number of firewall policies, a single call might not
return the full list.

``` swift
public func listFirewallPolicies(input: ListFirewallPoliciesInput, completion: @escaping (ClientRuntime.SdkResult<ListFirewallPoliciesOutputResponse, ListFirewallPoliciesOutputError>) -> Void)
```

### `listFirewalls(input:completion:)`

Retrieves the metadata for the firewalls that you have defined. If you provide VPC
identifiers in your request, this returns only the firewalls for those VPCs.
Depending on your setting for max results and the number of firewalls, a single call
might not return the full list.

``` swift
public func listFirewalls(input: ListFirewallsInput, completion: @escaping (ClientRuntime.SdkResult<ListFirewallsOutputResponse, ListFirewallsOutputError>) -> Void)
```

### `listRuleGroups(input:completion:)`

Retrieves the metadata for the rule groups that you have defined. Depending on your
setting for max results and the number of rule groups, a single call might not return the
full list.

``` swift
public func listRuleGroups(input: ListRuleGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListRuleGroupsOutputResponse, ListRuleGroupsOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Retrieves the tags associated with the specified resource. Tags are key:​value pairs that
you can use to categorize and manage your resources, for purposes like billing. For
example, you might set the tag key to "customer" and the value to the customer name or ID.
You can specify one or more tags to add to each AWS resource, up to 50 tags for a
resource.
You can tag the AWS resources that you manage through AWS Network Firewall:​ firewalls, firewall
policies, and rule groups.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `putResourcePolicy(input:completion:)`

Creates or updates an AWS Identity and Access Management policy for your rule group or firewall policy. Use this to share rule groups and firewall policies between accounts. This operation works in conjunction with the AWS Resource Access Manager (RAM) service
to manage resource sharing for Network Firewall.
Use this operation to create or update a resource policy for your rule group or firewall policy. In the policy, you specify the accounts that you want to share the resource with and the operations that you want the accounts to be able to perform.
When you add an account in the resource policy, you then run the following Resource Access Manager (RAM) operations to access and accept the shared rule group or firewall policy.

``` swift
public func putResourcePolicy(input: PutResourcePolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutResourcePolicyOutputResponse, PutResourcePolicyOutputError>) -> Void)
```

``` 
              <a href="https://docs.aws.amazon.com/ram/latest/APIReference/API_GetResourceShareInvitations.html">GetResourceShareInvitations - Returns the Amazon Resource Names (ARNs) of the resource share invitations.



              <a href="https://docs.aws.amazon.com/ram/latest/APIReference/API_AcceptResourceShareInvitation.html">AcceptResourceShareInvitation - Accepts the share invitation for a specified resource share.


     For additional information about resource sharing using RAM, see <a href="https://docs.aws.amazon.com/ram/latest/userguide/what-is.html">AWS Resource Access Manager User Guide.
```

### `tagResource(input:completion:)`

Adds the specified tags to the specified resource. Tags are key:​value pairs that you can
use to categorize and manage your resources, for purposes like billing. For example, you
might set the tag key to "customer" and the value to the customer name or ID. You can
specify one or more tags to add to each AWS resource, up to 50 tags for a resource.
You can tag the AWS resources that you manage through AWS Network Firewall:​ firewalls, firewall
policies, and rule groups.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes the tags with the specified keys from the specified resource. Tags are key:​value
pairs that you can use to categorize and manage your resources, for purposes like billing.
For example, you might set the tag key to "customer" and the value to the customer name or
ID. You can specify one or more tags to add to each AWS resource, up to 50 tags for a
resource.
You can manage tags for the AWS resources that you manage through AWS Network Firewall:​
firewalls, firewall policies, and rule groups.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateFirewallDeleteProtection(input:completion:)`

Modifies the flag, DeleteProtection, which indicates whether it is possible
to delete the firewall. If the flag is set to TRUE, the firewall is protected
against deletion. This setting helps protect against accidentally deleting a firewall
that's in use.

``` swift
public func updateFirewallDeleteProtection(input: UpdateFirewallDeleteProtectionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFirewallDeleteProtectionOutputResponse, UpdateFirewallDeleteProtectionOutputError>) -> Void)
```

### `updateFirewallDescription(input:completion:)`

Modifies the description for the specified firewall. Use the description to help you
identify the firewall when you're working with it.

``` swift
public func updateFirewallDescription(input: UpdateFirewallDescriptionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFirewallDescriptionOutputResponse, UpdateFirewallDescriptionOutputError>) -> Void)
```

### `updateFirewallPolicy(input:completion:)`

Updates the properties of the specified firewall policy.

``` swift
public func updateFirewallPolicy(input: UpdateFirewallPolicyInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFirewallPolicyOutputResponse, UpdateFirewallPolicyOutputError>) -> Void)
```

### `updateFirewallPolicyChangeProtection(input:completion:)`

``` swift
public func updateFirewallPolicyChangeProtection(input: UpdateFirewallPolicyChangeProtectionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFirewallPolicyChangeProtectionOutputResponse, UpdateFirewallPolicyChangeProtectionOutputError>) -> Void)
```

### `updateLoggingConfiguration(input:completion:)`

Sets the logging configuration for the specified firewall.
To change the logging configuration, retrieve the LoggingConfiguration by calling DescribeLoggingConfiguration, then change it and provide
the modified object to this update call. You must change the logging configuration one
LogDestinationConfig at a time inside the retrieved LoggingConfiguration object.
You can perform only one of the following actions in any call to
UpdateLoggingConfiguration:​

``` swift
public func updateLoggingConfiguration(input: UpdateLoggingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateLoggingConfigurationOutputResponse, UpdateLoggingConfigurationOutputError>) -> Void)
```

``` 
           Create a new log destination object by adding a single
              LogDestinationConfig array element to
              LogDestinationConfigs.


           Delete a log destination object by removing a single
              LogDestinationConfig array element from
              LogDestinationConfigs.


           Change the LogDestination setting in a single
              LogDestinationConfig array element.


     You can't change the LogDestinationType or LogType in a
        LogDestinationConfig. To change these settings, delete the existing
        LogDestinationConfig object and create a new one, using two separate calls
     to this update operation.
```

### `updateRuleGroup(input:completion:)`

Updates the rule settings for the specified rule group. You use a rule group by
reference in one or more firewall policies. When you modify a rule group, you modify all
firewall policies that use the rule group.
To update a rule group, first call DescribeRuleGroup to retrieve the
current RuleGroup object, update the object as needed, and then provide
the updated object to this call.

``` swift
public func updateRuleGroup(input: UpdateRuleGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRuleGroupOutputResponse, UpdateRuleGroupOutputError>) -> Void)
```

### `updateSubnetChangeProtection(input:completion:)`

``` swift
public func updateSubnetChangeProtection(input: UpdateSubnetChangeProtectionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSubnetChangeProtectionOutputResponse, UpdateSubnetChangeProtectionOutputError>) -> Void)
```
