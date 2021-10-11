# Route53ResolverClientProtocol

When you create a VPC using Amazon VPC, you automatically get DNS resolution within the VPC
from Route 53 Resolver. By default, Resolver answers DNS queries for VPC domain names
such as domain names for EC2 instances or Elastic Load Balancing load balancers.
Resolver performs recursive lookups against public name servers for all other domain
names.

``` swift
public protocol Route53ResolverClientProtocol 
```

``` 
	       You can also configure DNS resolution between your VPC and your network over a Direct Connect or VPN connection:

	
        Forward DNS queries from resolvers on your network to Route 53 Resolver


	       DNS resolvers on your network can forward DNS queries to Resolver in a specified VPC. This allows your DNS resolvers
		to easily resolve domain names for Amazon Web Services resources such as EC2 instances or records in a Route 53 private hosted zone.
		For more information, see
		<a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resolver.html#resolver-overview-forward-network-to-vpc">How DNS Resolvers
		on Your Network Forward DNS Queries to Route 53 Resolver in the Amazon Route 53 Developer Guide.
	
	
        Conditionally forward queries from a VPC to resolvers on your network


	       You can configure Resolver to forward queries that it receives from EC2 instances in your VPCs to DNS resolvers on your network.
		To forward selected queries, you create Resolver rules that specify the domain names for the DNS queries that you want to forward
		(such as example.com), and the IP addresses of the DNS resolvers on your network that you want to forward the queries to.
		If a query matches multiple rules (example.com, acme.example.com), Resolver chooses the rule with the most specific match
		(acme.example.com) and forwards the query to the IP addresses that you specified in that rule. For more information, see
		<a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resolver.html#resolver-overview-forward-vpc-to-network">How Route 53 Resolver
		Forwards DNS Queries from Your VPCs to Your Network in the Amazon Route 53 Developer Guide.

	       Like Amazon VPC, Resolver is Regional. In each Region where you have VPCs, you can choose
		whether to forward queries from your VPCs to your network (outbound queries), from your
		network to your VPCs (inbound queries), or both.
```

## Requirements

### associateFirewallRuleGroup(input:​completion:​)

Associates a FirewallRuleGroup with a VPC, to provide DNS filtering for the VPC.

``` swift
func associateFirewallRuleGroup(input: AssociateFirewallRuleGroupInput, completion: @escaping (ClientRuntime.SdkResult<AssociateFirewallRuleGroupOutputResponse, AssociateFirewallRuleGroupOutputError>) -> Void)
```

### associateResolverEndpointIpAddress(input:​completion:​)

Adds IP addresses to an inbound or an outbound Resolver endpoint. If you want to add more than one IP address,
submit one AssociateResolverEndpointIpAddress request for each IP address.
To remove an IP address from an endpoint, see
<a href="https:​//docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_DisassociateResolverEndpointIpAddress.html">DisassociateResolverEndpointIpAddress.

``` swift
func associateResolverEndpointIpAddress(input: AssociateResolverEndpointIpAddressInput, completion: @escaping (ClientRuntime.SdkResult<AssociateResolverEndpointIpAddressOutputResponse, AssociateResolverEndpointIpAddressOutputError>) -> Void)
```

### associateResolverQueryLogConfig(input:​completion:​)

Associates an Amazon VPC with a specified query logging configuration. Route 53 Resolver logs DNS queries that originate in all of the Amazon VPCs
that are associated with a specified query logging configuration. To associate more than one VPC with a configuration, submit one AssociateResolverQueryLogConfig
request for each VPC.

``` swift
func associateResolverQueryLogConfig(input: AssociateResolverQueryLogConfigInput, completion: @escaping (ClientRuntime.SdkResult<AssociateResolverQueryLogConfigOutputResponse, AssociateResolverQueryLogConfigOutputError>) -> Void)
```

``` 
        The VPCs that you associate with a query logging configuration must be in the same Region as the configuration.

	
	       To remove a VPC from a query logging configuration, see
		<a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_DisassociateResolverQueryLogConfig.html">DisassociateResolverQueryLogConfig.
```

### associateResolverRule(input:​completion:​)

Associates a Resolver rule with a VPC. When you associate a rule with a VPC, Resolver forwards all DNS queries
for the domain name that is specified in the rule and that originate in the VPC. The queries are forwarded to the
IP addresses for the DNS resolvers that are specified in the rule. For more information about rules, see
<a href="https:​//docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_CreateResolverRule.html">CreateResolverRule.

``` swift
func associateResolverRule(input: AssociateResolverRuleInput, completion: @escaping (ClientRuntime.SdkResult<AssociateResolverRuleOutputResponse, AssociateResolverRuleOutputError>) -> Void)
```

### createFirewallDomainList(input:​completion:​)

Creates an empty firewall domain list for use in DNS Firewall rules. You can populate the domains for the new list with a file, using ImportFirewallDomains, or with domain strings, using UpdateFirewallDomains.

``` swift
func createFirewallDomainList(input: CreateFirewallDomainListInput, completion: @escaping (ClientRuntime.SdkResult<CreateFirewallDomainListOutputResponse, CreateFirewallDomainListOutputError>) -> Void)
```

### createFirewallRule(input:​completion:​)

Creates a single DNS Firewall rule in the specified rule group, using the specified domain list.

``` swift
func createFirewallRule(input: CreateFirewallRuleInput, completion: @escaping (ClientRuntime.SdkResult<CreateFirewallRuleOutputResponse, CreateFirewallRuleOutputError>) -> Void)
```

### createFirewallRuleGroup(input:​completion:​)

Creates an empty DNS Firewall rule group for filtering DNS network traffic in a VPC. You can add rules to the new rule group
by calling CreateFirewallRule.

``` swift
func createFirewallRuleGroup(input: CreateFirewallRuleGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateFirewallRuleGroupOutputResponse, CreateFirewallRuleGroupOutputError>) -> Void)
```

### createResolverEndpoint(input:​completion:​)

Creates a Resolver endpoint. There are two types of Resolver endpoints, inbound and outbound:​

``` swift
func createResolverEndpoint(input: CreateResolverEndpointInput, completion: @escaping (ClientRuntime.SdkResult<CreateResolverEndpointOutputResponse, CreateResolverEndpointOutputError>) -> Void)
```

``` 
           An inbound Resolver endpoint forwards DNS queries to the DNS service for a VPC
			from your network.


           An outbound Resolver endpoint forwards DNS queries from the DNS service for a VPC
			to your network.
```

### createResolverQueryLogConfig(input:​completion:​)

Creates a Resolver query logging configuration, which defines where you want Resolver to save DNS query logs that originate in your VPCs.
Resolver can log queries only for VPCs that are in the same Region as the query logging configuration.

``` swift
func createResolverQueryLogConfig(input: CreateResolverQueryLogConfigInput, completion: @escaping (ClientRuntime.SdkResult<CreateResolverQueryLogConfigOutputResponse, CreateResolverQueryLogConfigOutputError>) -> Void)
```

``` 
	       To specify which VPCs you want to log queries for, you use AssociateResolverQueryLogConfig. For more information, see
		<a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_AssociateResolverQueryLogConfig.html">AssociateResolverQueryLogConfig.
	
	       You can optionally use Resource Access Manager (RAM) to share a query logging configuration with other Amazon Web Services accounts. The other accounts
		can then associate VPCs with the configuration. The query logs that Resolver creates for a configuration include all DNS queries that originate in all
		VPCs that are associated with the configuration.
```

### createResolverRule(input:​completion:​)

For DNS queries that originate in your VPCs, specifies which Resolver endpoint the queries pass through,
one domain name that you want to forward to your network, and the IP addresses of the DNS resolvers in your network.

``` swift
func createResolverRule(input: CreateResolverRuleInput, completion: @escaping (ClientRuntime.SdkResult<CreateResolverRuleOutputResponse, CreateResolverRuleOutputError>) -> Void)
```

### deleteFirewallDomainList(input:​completion:​)

Deletes the specified domain list.

``` swift
func deleteFirewallDomainList(input: DeleteFirewallDomainListInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFirewallDomainListOutputResponse, DeleteFirewallDomainListOutputError>) -> Void)
```

### deleteFirewallRule(input:​completion:​)

Deletes the specified firewall rule.

``` swift
func deleteFirewallRule(input: DeleteFirewallRuleInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFirewallRuleOutputResponse, DeleteFirewallRuleOutputError>) -> Void)
```

### deleteFirewallRuleGroup(input:​completion:​)

Deletes the specified firewall rule group.

``` swift
func deleteFirewallRuleGroup(input: DeleteFirewallRuleGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFirewallRuleGroupOutputResponse, DeleteFirewallRuleGroupOutputError>) -> Void)
```

### deleteResolverEndpoint(input:​completion:​)

Deletes a Resolver endpoint. The effect of deleting a Resolver endpoint depends on whether it's an inbound or an outbound
Resolver endpoint:​

``` swift
func deleteResolverEndpoint(input: DeleteResolverEndpointInput, completion: @escaping (ClientRuntime.SdkResult<DeleteResolverEndpointOutputResponse, DeleteResolverEndpointOutputError>) -> Void)
```

``` 
              Inbound: DNS queries from your network are no longer routed
			to the DNS service for the specified VPC.



              Outbound: DNS queries from a VPC are no longer routed to your network.
```

### deleteResolverQueryLogConfig(input:​completion:​)

Deletes a query logging configuration. When you delete a configuration, Resolver stops logging DNS queries for all of the Amazon VPCs that are
associated with the configuration. This also applies if the query logging configuration is shared with other Amazon Web Services accounts, and
the other accounts have associated VPCs with the shared configuration.

``` swift
func deleteResolverQueryLogConfig(input: DeleteResolverQueryLogConfigInput, completion: @escaping (ClientRuntime.SdkResult<DeleteResolverQueryLogConfigOutputResponse, DeleteResolverQueryLogConfigOutputError>) -> Void)
```

``` 
	       Before you can delete a query logging configuration, you must first disassociate all VPCs from the configuration. See
		<a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_DisassociateResolverQueryLogConfig.html">DisassociateResolverQueryLogConfig.
		
	       If you used Resource Access Manager (RAM) to share a query logging configuration with other accounts, you must stop sharing
		the configuration before you can delete a configuration. The accounts that you shared the configuration with can first disassociate VPCs
		that they associated with the configuration, but that's not necessary. If you stop sharing the configuration, those VPCs are automatically
		disassociated from the configuration.
```

### deleteResolverRule(input:​completion:​)

Deletes a Resolver rule. Before you can delete a Resolver rule, you must disassociate it from all the VPCs that you
associated the Resolver rule with. For more information, see
<a href="https:​//docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_DisassociateResolverRule.html">DisassociateResolverRule.

``` swift
func deleteResolverRule(input: DeleteResolverRuleInput, completion: @escaping (ClientRuntime.SdkResult<DeleteResolverRuleOutputResponse, DeleteResolverRuleOutputError>) -> Void)
```

### disassociateFirewallRuleGroup(input:​completion:​)

Disassociates a FirewallRuleGroup from a VPC, to remove DNS filtering from the VPC.

``` swift
func disassociateFirewallRuleGroup(input: DisassociateFirewallRuleGroupInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateFirewallRuleGroupOutputResponse, DisassociateFirewallRuleGroupOutputError>) -> Void)
```

### disassociateResolverEndpointIpAddress(input:​completion:​)

Removes IP addresses from an inbound or an outbound Resolver endpoint. If you want to remove more than one IP address,
submit one DisassociateResolverEndpointIpAddress request for each IP address.
To add an IP address to an endpoint, see
<a href="https:​//docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_AssociateResolverEndpointIpAddress.html">AssociateResolverEndpointIpAddress.

``` swift
func disassociateResolverEndpointIpAddress(input: DisassociateResolverEndpointIpAddressInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateResolverEndpointIpAddressOutputResponse, DisassociateResolverEndpointIpAddressOutputError>) -> Void)
```

### disassociateResolverQueryLogConfig(input:​completion:​)

Disassociates a VPC from a query logging configuration.

``` swift
func disassociateResolverQueryLogConfig(input: DisassociateResolverQueryLogConfigInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateResolverQueryLogConfigOutputResponse, DisassociateResolverQueryLogConfigOutputError>) -> Void)
```

``` 
		         Before you can delete a query logging configuration, you must first disassociate all VPCs
			from the configuration. If you used Resource Access Manager (RAM) to share a
			query logging configuration with other accounts, VPCs can be disassociated from the
			configuration in the following ways:
		

              The accounts that you shared the configuration with can disassociate VPCs from the configuration.


              You can stop sharing the configuration.
```

### disassociateResolverRule(input:​completion:​)

Removes the association between a specified Resolver rule and a specified VPC.

``` swift
func disassociateResolverRule(input: DisassociateResolverRuleInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateResolverRuleOutputResponse, DisassociateResolverRuleOutputError>) -> Void)
```

``` 
		         If you disassociate a Resolver rule from a VPC, Resolver stops forwarding DNS queries for the
			domain name that you specified in the Resolver rule.
```

### getFirewallConfig(input:​completion:​)

Retrieves the configuration of the firewall behavior provided by DNS Firewall for a
single VPC from Amazon Virtual Private Cloud (Amazon VPC).

``` swift
func getFirewallConfig(input: GetFirewallConfigInput, completion: @escaping (ClientRuntime.SdkResult<GetFirewallConfigOutputResponse, GetFirewallConfigOutputError>) -> Void)
```

### getFirewallDomainList(input:​completion:​)

Retrieves the specified firewall domain list.

``` swift
func getFirewallDomainList(input: GetFirewallDomainListInput, completion: @escaping (ClientRuntime.SdkResult<GetFirewallDomainListOutputResponse, GetFirewallDomainListOutputError>) -> Void)
```

### getFirewallRuleGroup(input:​completion:​)

Retrieves the specified firewall rule group.

``` swift
func getFirewallRuleGroup(input: GetFirewallRuleGroupInput, completion: @escaping (ClientRuntime.SdkResult<GetFirewallRuleGroupOutputResponse, GetFirewallRuleGroupOutputError>) -> Void)
```

### getFirewallRuleGroupAssociation(input:​completion:​)

Retrieves a firewall rule group association, which enables DNS filtering for a VPC with one rule group. A VPC can have more than one firewall rule group association, and a rule group can be associated with more than one VPC.

``` swift
func getFirewallRuleGroupAssociation(input: GetFirewallRuleGroupAssociationInput, completion: @escaping (ClientRuntime.SdkResult<GetFirewallRuleGroupAssociationOutputResponse, GetFirewallRuleGroupAssociationOutputError>) -> Void)
```

### getFirewallRuleGroupPolicy(input:​completion:​)

Returns the Identity and Access Management (Amazon Web Services IAM) policy for sharing the
specified rule group. You can use the policy to share the rule group using Resource Access Manager (RAM).

``` swift
func getFirewallRuleGroupPolicy(input: GetFirewallRuleGroupPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetFirewallRuleGroupPolicyOutputResponse, GetFirewallRuleGroupPolicyOutputError>) -> Void)
```

### getResolverDnssecConfig(input:​completion:​)

Gets DNSSEC validation information for a specified resource.

``` swift
func getResolverDnssecConfig(input: GetResolverDnssecConfigInput, completion: @escaping (ClientRuntime.SdkResult<GetResolverDnssecConfigOutputResponse, GetResolverDnssecConfigOutputError>) -> Void)
```

### getResolverEndpoint(input:​completion:​)

Gets information about a specified Resolver endpoint, such as whether it's an inbound or an outbound Resolver endpoint, and the
current status of the endpoint.

``` swift
func getResolverEndpoint(input: GetResolverEndpointInput, completion: @escaping (ClientRuntime.SdkResult<GetResolverEndpointOutputResponse, GetResolverEndpointOutputError>) -> Void)
```

### getResolverQueryLogConfig(input:​completion:​)

Gets information about a specified Resolver query logging configuration, such as the number of VPCs that the configuration
is logging queries for and the location that logs are sent to.

``` swift
func getResolverQueryLogConfig(input: GetResolverQueryLogConfigInput, completion: @escaping (ClientRuntime.SdkResult<GetResolverQueryLogConfigOutputResponse, GetResolverQueryLogConfigOutputError>) -> Void)
```

### getResolverQueryLogConfigAssociation(input:​completion:​)

Gets information about a specified association between a Resolver query logging configuration and an Amazon VPC. When you associate a VPC
with a query logging configuration, Resolver logs DNS queries that originate in that VPC.

``` swift
func getResolverQueryLogConfigAssociation(input: GetResolverQueryLogConfigAssociationInput, completion: @escaping (ClientRuntime.SdkResult<GetResolverQueryLogConfigAssociationOutputResponse, GetResolverQueryLogConfigAssociationOutputError>) -> Void)
```

### getResolverQueryLogConfigPolicy(input:​completion:​)

Gets information about a query logging policy. A query logging policy specifies the Resolver query logging
operations and resources that you want to allow another Amazon Web Services account to be able to use.

``` swift
func getResolverQueryLogConfigPolicy(input: GetResolverQueryLogConfigPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetResolverQueryLogConfigPolicyOutputResponse, GetResolverQueryLogConfigPolicyOutputError>) -> Void)
```

### getResolverRule(input:​completion:​)

Gets information about a specified Resolver rule, such as the domain name that the rule forwards DNS queries for and the ID of the
outbound Resolver endpoint that the rule is associated with.

``` swift
func getResolverRule(input: GetResolverRuleInput, completion: @escaping (ClientRuntime.SdkResult<GetResolverRuleOutputResponse, GetResolverRuleOutputError>) -> Void)
```

### getResolverRuleAssociation(input:​completion:​)

Gets information about an association between a specified Resolver rule and a VPC. You associate a Resolver rule and a VPC using
<a href="https:​//docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_AssociateResolverRule.html">AssociateResolverRule.

``` swift
func getResolverRuleAssociation(input: GetResolverRuleAssociationInput, completion: @escaping (ClientRuntime.SdkResult<GetResolverRuleAssociationOutputResponse, GetResolverRuleAssociationOutputError>) -> Void)
```

### getResolverRulePolicy(input:​completion:​)

Gets information about the Resolver rule policy for a specified rule. A Resolver rule policy includes the rule that you want to share
with another account, the account that you want to share the rule with, and the Resolver operations that you want to allow the account to use.

``` swift
func getResolverRulePolicy(input: GetResolverRulePolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetResolverRulePolicyOutputResponse, GetResolverRulePolicyOutputError>) -> Void)
```

### importFirewallDomains(input:​completion:​)

Imports domain names from a file into a domain list, for use in a DNS firewall rule group.
Each domain specification in your domain list must satisfy the following
requirements:​

``` swift
func importFirewallDomains(input: ImportFirewallDomainsInput, completion: @escaping (ClientRuntime.SdkResult<ImportFirewallDomainsOutputResponse, ImportFirewallDomainsOutputError>) -> Void)
```

``` 
  	        It can optionally start with * (asterisk).
  	

  	        With the exception of the optional starting asterisk, it must only contain
  	   the following characters: A-Z, a-z,
  	   0-9, - (hyphen).
  	

  	        It must be from 1-255 characters in length.
```

### listFirewallConfigs(input:​completion:​)

Retrieves the firewall configurations that you have defined. DNS Firewall uses the configurations to manage firewall behavior for your VPCs.
A single call might return only a partial list of the configurations. For information, see MaxResults.

``` swift
func listFirewallConfigs(input: ListFirewallConfigsInput, completion: @escaping (ClientRuntime.SdkResult<ListFirewallConfigsOutputResponse, ListFirewallConfigsOutputError>) -> Void)
```

### listFirewallDomainLists(input:​completion:​)

Retrieves the firewall domain lists that you have defined. For each firewall domain list, you can retrieve the domains that are defined for a list by calling ListFirewallDomains.
A single call to this list operation might return only a partial list of the domain lists. For information, see MaxResults.

``` swift
func listFirewallDomainLists(input: ListFirewallDomainListsInput, completion: @escaping (ClientRuntime.SdkResult<ListFirewallDomainListsOutputResponse, ListFirewallDomainListsOutputError>) -> Void)
```

### listFirewallDomains(input:​completion:​)

Retrieves the domains that you have defined for the specified firewall domain list.
A single call might return only a partial list of the domains. For information, see MaxResults.

``` swift
func listFirewallDomains(input: ListFirewallDomainsInput, completion: @escaping (ClientRuntime.SdkResult<ListFirewallDomainsOutputResponse, ListFirewallDomainsOutputError>) -> Void)
```

### listFirewallRuleGroupAssociations(input:​completion:​)

Retrieves the firewall rule group associations that you have defined. Each association enables DNS filtering for a VPC with one rule group.
A single call might return only a partial list of the associations. For information, see MaxResults.

``` swift
func listFirewallRuleGroupAssociations(input: ListFirewallRuleGroupAssociationsInput, completion: @escaping (ClientRuntime.SdkResult<ListFirewallRuleGroupAssociationsOutputResponse, ListFirewallRuleGroupAssociationsOutputError>) -> Void)
```

### listFirewallRuleGroups(input:​completion:​)

Retrieves the minimal high-level information for the rule groups that you have defined.
A single call might return only a partial list of the rule groups. For information, see MaxResults.

``` swift
func listFirewallRuleGroups(input: ListFirewallRuleGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListFirewallRuleGroupsOutputResponse, ListFirewallRuleGroupsOutputError>) -> Void)
```

### listFirewallRules(input:​completion:​)

Retrieves the firewall rules that you have defined for the specified firewall rule group. DNS Firewall uses the rules in a rule group to filter DNS network traffic for a VPC.
A single call might return only a partial list of the rules. For information, see MaxResults.

``` swift
func listFirewallRules(input: ListFirewallRulesInput, completion: @escaping (ClientRuntime.SdkResult<ListFirewallRulesOutputResponse, ListFirewallRulesOutputError>) -> Void)
```

### listResolverDnssecConfigs(input:​completion:​)

Lists the configurations for DNSSEC validation that are associated with the current Amazon Web Services account.

``` swift
func listResolverDnssecConfigs(input: ListResolverDnssecConfigsInput, completion: @escaping (ClientRuntime.SdkResult<ListResolverDnssecConfigsOutputResponse, ListResolverDnssecConfigsOutputError>) -> Void)
```

### listResolverEndpointIpAddresses(input:​completion:​)

Gets the IP addresses for a specified Resolver endpoint.

``` swift
func listResolverEndpointIpAddresses(input: ListResolverEndpointIpAddressesInput, completion: @escaping (ClientRuntime.SdkResult<ListResolverEndpointIpAddressesOutputResponse, ListResolverEndpointIpAddressesOutputError>) -> Void)
```

### listResolverEndpoints(input:​completion:​)

Lists all the Resolver endpoints that were created using the current Amazon Web Services account.

``` swift
func listResolverEndpoints(input: ListResolverEndpointsInput, completion: @escaping (ClientRuntime.SdkResult<ListResolverEndpointsOutputResponse, ListResolverEndpointsOutputError>) -> Void)
```

### listResolverQueryLogConfigAssociations(input:​completion:​)

Lists information about associations between Amazon VPCs and query logging configurations.

``` swift
func listResolverQueryLogConfigAssociations(input: ListResolverQueryLogConfigAssociationsInput, completion: @escaping (ClientRuntime.SdkResult<ListResolverQueryLogConfigAssociationsOutputResponse, ListResolverQueryLogConfigAssociationsOutputError>) -> Void)
```

### listResolverQueryLogConfigs(input:​completion:​)

Lists information about the specified query logging configurations. Each configuration defines where you want Resolver to save
DNS query logs and specifies the VPCs that you want to log queries for.

``` swift
func listResolverQueryLogConfigs(input: ListResolverQueryLogConfigsInput, completion: @escaping (ClientRuntime.SdkResult<ListResolverQueryLogConfigsOutputResponse, ListResolverQueryLogConfigsOutputError>) -> Void)
```

### listResolverRuleAssociations(input:​completion:​)

Lists the associations that were created between Resolver rules and VPCs using the current Amazon Web Services account.

``` swift
func listResolverRuleAssociations(input: ListResolverRuleAssociationsInput, completion: @escaping (ClientRuntime.SdkResult<ListResolverRuleAssociationsOutputResponse, ListResolverRuleAssociationsOutputError>) -> Void)
```

### listResolverRules(input:​completion:​)

Lists the Resolver rules that were created using the current Amazon Web Services account.

``` swift
func listResolverRules(input: ListResolverRulesInput, completion: @escaping (ClientRuntime.SdkResult<ListResolverRulesOutputResponse, ListResolverRulesOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

Lists the tags that you associated with the specified resource.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### putFirewallRuleGroupPolicy(input:​completion:​)

Attaches an Identity and Access Management (Amazon Web Services IAM) policy for sharing the rule
group. You can use the policy to share the rule group using Resource Access Manager
(RAM).

``` swift
func putFirewallRuleGroupPolicy(input: PutFirewallRuleGroupPolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutFirewallRuleGroupPolicyOutputResponse, PutFirewallRuleGroupPolicyOutputError>) -> Void)
```

### putResolverQueryLogConfigPolicy(input:​completion:​)

Specifies an Amazon Web Services account that you want to share a query logging configuration with, the query logging configuration that you want to share,
and the operations that you want the account to be able to perform on the configuration.

``` swift
func putResolverQueryLogConfigPolicy(input: PutResolverQueryLogConfigPolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutResolverQueryLogConfigPolicyOutputResponse, PutResolverQueryLogConfigPolicyOutputError>) -> Void)
```

### putResolverRulePolicy(input:​completion:​)

Specifies an Amazon Web Services rule that you want to share with another account, the account that you want to share the rule with,
and the operations that you want the account to be able to perform on the rule.

``` swift
func putResolverRulePolicy(input: PutResolverRulePolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutResolverRulePolicyOutputResponse, PutResolverRulePolicyOutputError>) -> Void)
```

### tagResource(input:​completion:​)

Adds one or more tags to a specified resource.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:​completion:​)

Removes one or more tags from a specified resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateFirewallConfig(input:​completion:​)

Updates the configuration of the firewall behavior provided by DNS Firewall for a single
VPC from Amazon Virtual Private Cloud (Amazon VPC).

``` swift
func updateFirewallConfig(input: UpdateFirewallConfigInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFirewallConfigOutputResponse, UpdateFirewallConfigOutputError>) -> Void)
```

### updateFirewallDomains(input:​completion:​)

Updates the firewall domain list from an array of domain specifications.

``` swift
func updateFirewallDomains(input: UpdateFirewallDomainsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFirewallDomainsOutputResponse, UpdateFirewallDomainsOutputError>) -> Void)
```

### updateFirewallRule(input:​completion:​)

Updates the specified firewall rule.

``` swift
func updateFirewallRule(input: UpdateFirewallRuleInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFirewallRuleOutputResponse, UpdateFirewallRuleOutputError>) -> Void)
```

### updateFirewallRuleGroupAssociation(input:​completion:​)

Changes the association of a FirewallRuleGroup with a VPC. The association enables DNS filtering for the VPC.

``` swift
func updateFirewallRuleGroupAssociation(input: UpdateFirewallRuleGroupAssociationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFirewallRuleGroupAssociationOutputResponse, UpdateFirewallRuleGroupAssociationOutputError>) -> Void)
```

### updateResolverDnssecConfig(input:​completion:​)

Updates an existing DNSSEC validation configuration. If there is no existing DNSSEC validation configuration, one is created.

``` swift
func updateResolverDnssecConfig(input: UpdateResolverDnssecConfigInput, completion: @escaping (ClientRuntime.SdkResult<UpdateResolverDnssecConfigOutputResponse, UpdateResolverDnssecConfigOutputError>) -> Void)
```

### updateResolverEndpoint(input:​completion:​)

Updates the name of an inbound or an outbound Resolver endpoint.

``` swift
func updateResolverEndpoint(input: UpdateResolverEndpointInput, completion: @escaping (ClientRuntime.SdkResult<UpdateResolverEndpointOutputResponse, UpdateResolverEndpointOutputError>) -> Void)
```

### updateResolverRule(input:​completion:​)

Updates settings for a specified Resolver rule. ResolverRuleId is required, and all other parameters are optional.
If you don't specify a parameter, it retains its current value.

``` swift
func updateResolverRule(input: UpdateResolverRuleInput, completion: @escaping (ClientRuntime.SdkResult<UpdateResolverRuleOutputResponse, UpdateResolverRuleOutputError>) -> Void)
```
