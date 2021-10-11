# NetworkFirewallClientProtocol

This is the API Reference for AWS Network Firewall. This guide is for developers who need
detailed information about the Network Firewall API actions, data types, and errors.

``` swift
public protocol NetworkFirewallClientProtocol 
```

``` 
           The REST API requires you to handle connection details, such as calculating
           signatures, handling request retries, and error handling. For general information
           about using the AWS REST APIs, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-apis.html">AWS APIs.
           To access Network Firewall using the REST API endpoint:
              https://network-firewall.<region>.amazonaws.com



           Alternatively, you can use one of the AWS SDKs to access an API that's tailored to
           the programming language or platform that you're using. For more information, see
              <a href="http://aws.amazon.com/tools/#SDKs">AWS SDKs.


           For descriptions of Network Firewall features, including and step-by-step
           instructions on how to use them through the Network Firewall console, see the <a href="https://docs.aws.amazon.com/network-firewall/latest/developerguide/">Network Firewall Developer
              Guide.


     Network Firewall is a stateful, managed, network firewall and intrusion detection and
     prevention service for Amazon Virtual Private Cloud (Amazon VPC). With Network Firewall, you can filter traffic at the
     perimeter of your VPC. This includes filtering traffic going to and coming from an internet
     gateway, NAT gateway, or over VPN or AWS Direct Connect. Network Firewall uses rules that are compatible
  with Suricata, a free, open source intrusion detection system (IDS) engine.
  AWS Network Firewall supports Suricata version 5.0.2. For information about Suricata,
      see the <a href="https://suricata-ids.org/">Suricata website.
     You can use Network Firewall to monitor and protect your VPC traffic in a number of ways.
     The following are just a few examples:


           Allow domains or IP addresses for known AWS service endpoints, such as Amazon S3, and
           block all other forms of traffic.


           Use custom lists of known bad domains to limit the types of domain names that your
           applications can access.


           Perform deep packet inspection on traffic entering or leaving your VPC.


           Use stateful protocol detection to filter protocols like HTTPS, regardless of the
           port used.


     To enable Network Firewall for your VPCs, you perform steps in both Amazon VPC and in
     Network Firewall. For information about using Amazon VPC, see <a href="https://docs.aws.amazon.com/vpc/latest/userguide/">Amazon VPC User Guide.
     To start using Network Firewall, do the following:
     <ol>

           (Optional) If you don't already have a VPC that you want to protect, create it in
           Amazon VPC.


           In Amazon VPC, in each Availability Zone where you want to have a firewall endpoint, create a
           subnet for the sole use of Network Firewall.


           In Network Firewall, create stateless and stateful rule groups,
             to define the components of the network traffic filtering behavior that you want your firewall to have.


           In Network Firewall, create a firewall policy that uses your rule groups and
             specifies additional default traffic filtering behavior.


           In Network Firewall, create a firewall and specify your new firewall policy and
             VPC subnets. Network Firewall creates a firewall endpoint in each subnet that you
           specify, with the behavior that's defined in the firewall policy.


           In Amazon VPC, use ingress routing enhancements to route traffic through the new firewall
           endpoints.

     </ol>
```

## Requirements

### associateFirewallPolicy(input:​completion:​)

Associates a FirewallPolicy to a Firewall.
A firewall policy defines how to monitor and manage your VPC network traffic, using a
collection of inspection rule groups and other settings. Each firewall requires one
firewall policy association, and you can use the same firewall policy for multiple
firewalls.

``` swift
func associateFirewallPolicy(input: AssociateFirewallPolicyInput, completion: @escaping (ClientRuntime.SdkResult<AssociateFirewallPolicyOutputResponse, AssociateFirewallPolicyOutputError>) -> Void)
```

### associateSubnets(input:​completion:​)

Associates the specified subnets in the Amazon VPC to the firewall. You can specify one
subnet for each of the Availability Zones that the VPC spans.
This request creates an AWS Network Firewall firewall endpoint in each of the subnets. To
enable the firewall's protections, you must also modify the VPC's route tables for each
subnet's Availability Zone, to redirect the traffic that's coming into and going out of the
zone through the firewall endpoint.

``` swift
func associateSubnets(input: AssociateSubnetsInput, completion: @escaping (ClientRuntime.SdkResult<AssociateSubnetsOutputResponse, AssociateSubnetsOutputError>) -> Void)
```

### createFirewall(input:​completion:​)

Creates an AWS Network Firewall Firewall and accompanying FirewallStatus for a VPC.
The firewall defines the configuration settings for an AWS Network Firewall firewall. The settings that you can define at creation include the firewall policy, the subnets in your VPC to use for the firewall endpoints, and any tags that are attached to the firewall AWS resource.
After you create a firewall, you can provide additional settings, like the logging configuration.
To update the settings for a firewall, you use the operations that apply to the settings
themselves, for example UpdateLoggingConfiguration, AssociateSubnets, and UpdateFirewallDeleteProtection.
To manage a firewall's tags, use the standard AWS resource tagging operations, ListTagsForResource, TagResource, and UntagResource.
To retrieve information about firewalls, use ListFirewalls and DescribeFirewall.

``` swift
func createFirewall(input: CreateFirewallInput, completion: @escaping (ClientRuntime.SdkResult<CreateFirewallOutputResponse, CreateFirewallOutputError>) -> Void)
```

### createFirewallPolicy(input:​completion:​)

Creates the firewall policy for the firewall according to the specifications.
An AWS Network Firewall firewall policy defines the behavior of a firewall, in a collection of
stateless and stateful rule groups and other settings. You can use one firewall policy for
multiple firewalls.

``` swift
func createFirewallPolicy(input: CreateFirewallPolicyInput, completion: @escaping (ClientRuntime.SdkResult<CreateFirewallPolicyOutputResponse, CreateFirewallPolicyOutputError>) -> Void)
```

### createRuleGroup(input:​completion:​)

Creates the specified stateless or stateful rule group, which includes the rules for
network traffic inspection, a capacity setting, and tags.
You provide your rule group specification in your request using either
RuleGroup or Rules.

``` swift
func createRuleGroup(input: CreateRuleGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateRuleGroupOutputResponse, CreateRuleGroupOutputError>) -> Void)
```

### deleteFirewall(input:​completion:​)

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
func deleteFirewall(input: DeleteFirewallInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFirewallOutputResponse, DeleteFirewallOutputError>) -> Void)
```

### deleteFirewallPolicy(input:​completion:​)

Deletes the specified FirewallPolicy.

``` swift
func deleteFirewallPolicy(input: DeleteFirewallPolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFirewallPolicyOutputResponse, DeleteFirewallPolicyOutputError>) -> Void)
```

### deleteResourcePolicy(input:​completion:​)

Deletes a resource policy that you created in a PutResourcePolicy request.

``` swift
func deleteResourcePolicy(input: DeleteResourcePolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteResourcePolicyOutputResponse, DeleteResourcePolicyOutputError>) -> Void)
```

### deleteRuleGroup(input:​completion:​)

Deletes the specified RuleGroup.

``` swift
func deleteRuleGroup(input: DeleteRuleGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRuleGroupOutputResponse, DeleteRuleGroupOutputError>) -> Void)
```

### describeFirewall(input:​completion:​)

Returns the data objects for the specified firewall.

``` swift
func describeFirewall(input: DescribeFirewallInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFirewallOutputResponse, DescribeFirewallOutputError>) -> Void)
```

### describeFirewallPolicy(input:​completion:​)

Returns the data objects for the specified firewall policy.

``` swift
func describeFirewallPolicy(input: DescribeFirewallPolicyInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFirewallPolicyOutputResponse, DescribeFirewallPolicyOutputError>) -> Void)
```

### describeLoggingConfiguration(input:​completion:​)

Returns the logging configuration for the specified firewall.

``` swift
func describeLoggingConfiguration(input: DescribeLoggingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLoggingConfigurationOutputResponse, DescribeLoggingConfigurationOutputError>) -> Void)
```

### describeResourcePolicy(input:​completion:​)

Retrieves a resource policy that you created in a PutResourcePolicy request.

``` swift
func describeResourcePolicy(input: DescribeResourcePolicyInput, completion: @escaping (ClientRuntime.SdkResult<DescribeResourcePolicyOutputResponse, DescribeResourcePolicyOutputError>) -> Void)
```

### describeRuleGroup(input:​completion:​)

Returns the data objects for the specified rule group.

``` swift
func describeRuleGroup(input: DescribeRuleGroupInput, completion: @escaping (ClientRuntime.SdkResult<DescribeRuleGroupOutputResponse, DescribeRuleGroupOutputError>) -> Void)
```

### disassociateSubnets(input:​completion:​)

Removes the specified subnet associations from the firewall. This removes the
firewall endpoints from the subnets and removes any network filtering protections that the endpoints
were providing.

``` swift
func disassociateSubnets(input: DisassociateSubnetsInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateSubnetsOutputResponse, DisassociateSubnetsOutputError>) -> Void)
```

### listFirewallPolicies(input:​completion:​)

Retrieves the metadata for the firewall policies that you have defined. Depending on
your setting for max results and the number of firewall policies, a single call might not
return the full list.

``` swift
func listFirewallPolicies(input: ListFirewallPoliciesInput, completion: @escaping (ClientRuntime.SdkResult<ListFirewallPoliciesOutputResponse, ListFirewallPoliciesOutputError>) -> Void)
```

### listFirewalls(input:​completion:​)

Retrieves the metadata for the firewalls that you have defined. If you provide VPC
identifiers in your request, this returns only the firewalls for those VPCs.
Depending on your setting for max results and the number of firewalls, a single call
might not return the full list.

``` swift
func listFirewalls(input: ListFirewallsInput, completion: @escaping (ClientRuntime.SdkResult<ListFirewallsOutputResponse, ListFirewallsOutputError>) -> Void)
```

### listRuleGroups(input:​completion:​)

Retrieves the metadata for the rule groups that you have defined. Depending on your
setting for max results and the number of rule groups, a single call might not return the
full list.

``` swift
func listRuleGroups(input: ListRuleGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListRuleGroupsOutputResponse, ListRuleGroupsOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

Retrieves the tags associated with the specified resource. Tags are key:​value pairs that
you can use to categorize and manage your resources, for purposes like billing. For
example, you might set the tag key to "customer" and the value to the customer name or ID.
You can specify one or more tags to add to each AWS resource, up to 50 tags for a
resource.
You can tag the AWS resources that you manage through AWS Network Firewall:​ firewalls, firewall
policies, and rule groups.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### putResourcePolicy(input:​completion:​)

Creates or updates an AWS Identity and Access Management policy for your rule group or firewall policy. Use this to share rule groups and firewall policies between accounts. This operation works in conjunction with the AWS Resource Access Manager (RAM) service
to manage resource sharing for Network Firewall.
Use this operation to create or update a resource policy for your rule group or firewall policy. In the policy, you specify the accounts that you want to share the resource with and the operations that you want the accounts to be able to perform.
When you add an account in the resource policy, you then run the following Resource Access Manager (RAM) operations to access and accept the shared rule group or firewall policy.

``` swift
func putResourcePolicy(input: PutResourcePolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutResourcePolicyOutputResponse, PutResourcePolicyOutputError>) -> Void)
```

``` 
              <a href="https://docs.aws.amazon.com/ram/latest/APIReference/API_GetResourceShareInvitations.html">GetResourceShareInvitations - Returns the Amazon Resource Names (ARNs) of the resource share invitations.



              <a href="https://docs.aws.amazon.com/ram/latest/APIReference/API_AcceptResourceShareInvitation.html">AcceptResourceShareInvitation - Accepts the share invitation for a specified resource share.


     For additional information about resource sharing using RAM, see <a href="https://docs.aws.amazon.com/ram/latest/userguide/what-is.html">AWS Resource Access Manager User Guide.
```

### tagResource(input:​completion:​)

Adds the specified tags to the specified resource. Tags are key:​value pairs that you can
use to categorize and manage your resources, for purposes like billing. For example, you
might set the tag key to "customer" and the value to the customer name or ID. You can
specify one or more tags to add to each AWS resource, up to 50 tags for a resource.
You can tag the AWS resources that you manage through AWS Network Firewall:​ firewalls, firewall
policies, and rule groups.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:​completion:​)

Removes the tags with the specified keys from the specified resource. Tags are key:​value
pairs that you can use to categorize and manage your resources, for purposes like billing.
For example, you might set the tag key to "customer" and the value to the customer name or
ID. You can specify one or more tags to add to each AWS resource, up to 50 tags for a
resource.
You can manage tags for the AWS resources that you manage through AWS Network Firewall:​
firewalls, firewall policies, and rule groups.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateFirewallDeleteProtection(input:​completion:​)

Modifies the flag, DeleteProtection, which indicates whether it is possible
to delete the firewall. If the flag is set to TRUE, the firewall is protected
against deletion. This setting helps protect against accidentally deleting a firewall
that's in use.

``` swift
func updateFirewallDeleteProtection(input: UpdateFirewallDeleteProtectionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFirewallDeleteProtectionOutputResponse, UpdateFirewallDeleteProtectionOutputError>) -> Void)
```

### updateFirewallDescription(input:​completion:​)

Modifies the description for the specified firewall. Use the description to help you
identify the firewall when you're working with it.

``` swift
func updateFirewallDescription(input: UpdateFirewallDescriptionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFirewallDescriptionOutputResponse, UpdateFirewallDescriptionOutputError>) -> Void)
```

### updateFirewallPolicy(input:​completion:​)

Updates the properties of the specified firewall policy.

``` swift
func updateFirewallPolicy(input: UpdateFirewallPolicyInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFirewallPolicyOutputResponse, UpdateFirewallPolicyOutputError>) -> Void)
```

### updateFirewallPolicyChangeProtection(input:​completion:​)

``` swift
func updateFirewallPolicyChangeProtection(input: UpdateFirewallPolicyChangeProtectionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFirewallPolicyChangeProtectionOutputResponse, UpdateFirewallPolicyChangeProtectionOutputError>) -> Void)
```

### updateLoggingConfiguration(input:​completion:​)

Sets the logging configuration for the specified firewall.
To change the logging configuration, retrieve the LoggingConfiguration by calling DescribeLoggingConfiguration, then change it and provide
the modified object to this update call. You must change the logging configuration one
LogDestinationConfig at a time inside the retrieved LoggingConfiguration object.
You can perform only one of the following actions in any call to
UpdateLoggingConfiguration:​

``` swift
func updateLoggingConfiguration(input: UpdateLoggingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateLoggingConfigurationOutputResponse, UpdateLoggingConfigurationOutputError>) -> Void)
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

### updateRuleGroup(input:​completion:​)

Updates the rule settings for the specified rule group. You use a rule group by
reference in one or more firewall policies. When you modify a rule group, you modify all
firewall policies that use the rule group.
To update a rule group, first call DescribeRuleGroup to retrieve the
current RuleGroup object, update the object as needed, and then provide
the updated object to this call.

``` swift
func updateRuleGroup(input: UpdateRuleGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRuleGroupOutputResponse, UpdateRuleGroupOutputError>) -> Void)
```

### updateSubnetChangeProtection(input:​completion:​)

``` swift
func updateSubnetChangeProtection(input: UpdateSubnetChangeProtectionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSubnetChangeProtectionOutputResponse, UpdateSubnetChangeProtectionOutputError>) -> Void)
```
