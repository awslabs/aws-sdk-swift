# WorkLinkClientProtocol

Amazon WorkLink is a cloud-based service that provides secure access
to internal websites and web apps from iOS and Android phones. In a single step, your users, such as
employees, can access internal websites as efficiently as they access any other public website.
They enter a URL in their web browser, or choose a link to an internal website in an email. Amazon WorkLink
authenticates the user's access and securely renders authorized internal web content in a secure
rendering service in the AWS cloud. Amazon WorkLink doesn't download or store any internal web content on
mobile devices.

``` swift
public protocol WorkLinkClientProtocol 
```

## Requirements

### associateDomain(input:​completion:​)

Specifies a domain to be associated to Amazon WorkLink.

``` swift
func associateDomain(input: AssociateDomainInput, completion: @escaping (ClientRuntime.SdkResult<AssociateDomainOutputResponse, AssociateDomainOutputError>) -> Void)
```

### associateWebsiteAuthorizationProvider(input:​completion:​)

Associates a website authorization provider with a specified fleet. This is used to authorize users against associated websites in the company network.

``` swift
func associateWebsiteAuthorizationProvider(input: AssociateWebsiteAuthorizationProviderInput, completion: @escaping (ClientRuntime.SdkResult<AssociateWebsiteAuthorizationProviderOutputResponse, AssociateWebsiteAuthorizationProviderOutputError>) -> Void)
```

### associateWebsiteCertificateAuthority(input:​completion:​)

Imports the root certificate of a certificate authority (CA) used to obtain TLS
certificates used by associated websites within the company network.

``` swift
func associateWebsiteCertificateAuthority(input: AssociateWebsiteCertificateAuthorityInput, completion: @escaping (ClientRuntime.SdkResult<AssociateWebsiteCertificateAuthorityOutputResponse, AssociateWebsiteCertificateAuthorityOutputError>) -> Void)
```

### createFleet(input:​completion:​)

Creates a fleet. A fleet consists of resources and the configuration that delivers
associated websites to authorized users who download and set up the Amazon WorkLink app.

``` swift
func createFleet(input: CreateFleetInput, completion: @escaping (ClientRuntime.SdkResult<CreateFleetOutputResponse, CreateFleetOutputError>) -> Void)
```

### deleteFleet(input:​completion:​)

Deletes a fleet. Prevents users from accessing previously associated websites.

``` swift
func deleteFleet(input: DeleteFleetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFleetOutputResponse, DeleteFleetOutputError>) -> Void)
```

### describeAuditStreamConfiguration(input:​completion:​)

Describes the configuration for delivering audit streams to the customer account.

``` swift
func describeAuditStreamConfiguration(input: DescribeAuditStreamConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAuditStreamConfigurationOutputResponse, DescribeAuditStreamConfigurationOutputError>) -> Void)
```

### describeCompanyNetworkConfiguration(input:​completion:​)

Describes the networking configuration to access the internal websites associated with
the specified fleet.

``` swift
func describeCompanyNetworkConfiguration(input: DescribeCompanyNetworkConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCompanyNetworkConfigurationOutputResponse, DescribeCompanyNetworkConfigurationOutputError>) -> Void)
```

### describeDevice(input:​completion:​)

Provides information about a user's device.

``` swift
func describeDevice(input: DescribeDeviceInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDeviceOutputResponse, DescribeDeviceOutputError>) -> Void)
```

### describeDevicePolicyConfiguration(input:​completion:​)

Describes the device policy configuration for the specified fleet.

``` swift
func describeDevicePolicyConfiguration(input: DescribeDevicePolicyConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDevicePolicyConfigurationOutputResponse, DescribeDevicePolicyConfigurationOutputError>) -> Void)
```

### describeDomain(input:​completion:​)

Provides information about the domain.

``` swift
func describeDomain(input: DescribeDomainInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDomainOutputResponse, DescribeDomainOutputError>) -> Void)
```

### describeFleetMetadata(input:​completion:​)

Provides basic information for the specified fleet, excluding identity provider,
networking, and device configuration details.

``` swift
func describeFleetMetadata(input: DescribeFleetMetadataInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFleetMetadataOutputResponse, DescribeFleetMetadataOutputError>) -> Void)
```

### describeIdentityProviderConfiguration(input:​completion:​)

Describes the identity provider configuration of the specified fleet.

``` swift
func describeIdentityProviderConfiguration(input: DescribeIdentityProviderConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeIdentityProviderConfigurationOutputResponse, DescribeIdentityProviderConfigurationOutputError>) -> Void)
```

### describeWebsiteCertificateAuthority(input:​completion:​)

Provides information about the certificate authority.

``` swift
func describeWebsiteCertificateAuthority(input: DescribeWebsiteCertificateAuthorityInput, completion: @escaping (ClientRuntime.SdkResult<DescribeWebsiteCertificateAuthorityOutputResponse, DescribeWebsiteCertificateAuthorityOutputError>) -> Void)
```

### disassociateDomain(input:​completion:​)

Disassociates a domain from Amazon WorkLink. End users lose the ability to access the domain with Amazon WorkLink.

``` swift
func disassociateDomain(input: DisassociateDomainInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateDomainOutputResponse, DisassociateDomainOutputError>) -> Void)
```

### disassociateWebsiteAuthorizationProvider(input:​completion:​)

Disassociates a website authorization provider from a specified fleet. After the
disassociation, users can't load any associated websites that require this authorization
provider.

``` swift
func disassociateWebsiteAuthorizationProvider(input: DisassociateWebsiteAuthorizationProviderInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateWebsiteAuthorizationProviderOutputResponse, DisassociateWebsiteAuthorizationProviderOutputError>) -> Void)
```

### disassociateWebsiteCertificateAuthority(input:​completion:​)

Removes a certificate authority (CA).

``` swift
func disassociateWebsiteCertificateAuthority(input: DisassociateWebsiteCertificateAuthorityInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateWebsiteCertificateAuthorityOutputResponse, DisassociateWebsiteCertificateAuthorityOutputError>) -> Void)
```

### listDevices(input:​completion:​)

Retrieves a list of devices registered with the specified fleet.

``` swift
func listDevices(input: ListDevicesInput, completion: @escaping (ClientRuntime.SdkResult<ListDevicesOutputResponse, ListDevicesOutputError>) -> Void)
```

### listDomains(input:​completion:​)

Retrieves a list of domains associated to a specified fleet.

``` swift
func listDomains(input: ListDomainsInput, completion: @escaping (ClientRuntime.SdkResult<ListDomainsOutputResponse, ListDomainsOutputError>) -> Void)
```

### listFleets(input:​completion:​)

Retrieves a list of fleets for the current account and Region.

``` swift
func listFleets(input: ListFleetsInput, completion: @escaping (ClientRuntime.SdkResult<ListFleetsOutputResponse, ListFleetsOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

Retrieves a list of tags for the specified resource.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### listWebsiteAuthorizationProviders(input:​completion:​)

Retrieves a list of website authorization providers associated with a specified fleet.

``` swift
func listWebsiteAuthorizationProviders(input: ListWebsiteAuthorizationProvidersInput, completion: @escaping (ClientRuntime.SdkResult<ListWebsiteAuthorizationProvidersOutputResponse, ListWebsiteAuthorizationProvidersOutputError>) -> Void)
```

### listWebsiteCertificateAuthorities(input:​completion:​)

Retrieves a list of certificate authorities added for the current account and
Region.

``` swift
func listWebsiteCertificateAuthorities(input: ListWebsiteCertificateAuthoritiesInput, completion: @escaping (ClientRuntime.SdkResult<ListWebsiteCertificateAuthoritiesOutputResponse, ListWebsiteCertificateAuthoritiesOutputError>) -> Void)
```

### restoreDomainAccess(input:​completion:​)

Moves a domain to ACTIVE status if it was in the INACTIVE status.

``` swift
func restoreDomainAccess(input: RestoreDomainAccessInput, completion: @escaping (ClientRuntime.SdkResult<RestoreDomainAccessOutputResponse, RestoreDomainAccessOutputError>) -> Void)
```

### revokeDomainAccess(input:​completion:​)

Moves a domain to INACTIVE status if it was in the ACTIVE status.

``` swift
func revokeDomainAccess(input: RevokeDomainAccessInput, completion: @escaping (ClientRuntime.SdkResult<RevokeDomainAccessOutputResponse, RevokeDomainAccessOutputError>) -> Void)
```

### signOutUser(input:​completion:​)

Signs the user out from all of their devices. The user can sign in again if they have
valid credentials.

``` swift
func signOutUser(input: SignOutUserInput, completion: @escaping (ClientRuntime.SdkResult<SignOutUserOutputResponse, SignOutUserOutputError>) -> Void)
```

### tagResource(input:​completion:​)

Adds or overwrites one or more tags for the specified resource, such as a fleet. Each tag consists of a key and an optional value. If a resource already has a tag with the same key, this operation updates its value.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:​completion:​)

Removes one or more tags from the specified resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateAuditStreamConfiguration(input:​completion:​)

Updates the audit stream configuration for the fleet.

``` swift
func updateAuditStreamConfiguration(input: UpdateAuditStreamConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAuditStreamConfigurationOutputResponse, UpdateAuditStreamConfigurationOutputError>) -> Void)
```

### updateCompanyNetworkConfiguration(input:​completion:​)

Updates the company network configuration for the fleet.

``` swift
func updateCompanyNetworkConfiguration(input: UpdateCompanyNetworkConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateCompanyNetworkConfigurationOutputResponse, UpdateCompanyNetworkConfigurationOutputError>) -> Void)
```

### updateDevicePolicyConfiguration(input:​completion:​)

Updates the device policy configuration for the fleet.

``` swift
func updateDevicePolicyConfiguration(input: UpdateDevicePolicyConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDevicePolicyConfigurationOutputResponse, UpdateDevicePolicyConfigurationOutputError>) -> Void)
```

### updateDomainMetadata(input:​completion:​)

Updates domain metadata, such as DisplayName.

``` swift
func updateDomainMetadata(input: UpdateDomainMetadataInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDomainMetadataOutputResponse, UpdateDomainMetadataOutputError>) -> Void)
```

### updateFleetMetadata(input:​completion:​)

Updates fleet metadata, such as DisplayName.

``` swift
func updateFleetMetadata(input: UpdateFleetMetadataInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFleetMetadataOutputResponse, UpdateFleetMetadataOutputError>) -> Void)
```

### updateIdentityProviderConfiguration(input:​completion:​)

Updates the identity provider configuration for the fleet.

``` swift
func updateIdentityProviderConfiguration(input: UpdateIdentityProviderConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateIdentityProviderConfigurationOutputResponse, UpdateIdentityProviderConfigurationOutputError>) -> Void)
```
