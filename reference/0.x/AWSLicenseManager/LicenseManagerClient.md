# LicenseManagerClient

``` swift
public class LicenseManagerClient 
```

## Inheritance

[`LicenseManagerClientProtocol`](/aws-sdk-swift/reference/0.x/AWSLicenseManager/LicenseManagerClientProtocol)

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

### `acceptGrant(input:completion:)`

Accepts the specified grant.

``` swift
public func acceptGrant(input: AcceptGrantInput, completion: @escaping (ClientRuntime.SdkResult<AcceptGrantOutputResponse, AcceptGrantOutputError>) -> Void)
```

### `checkInLicense(input:completion:)`

Checks in the specified license. Check in a license when it is no longer in use.

``` swift
public func checkInLicense(input: CheckInLicenseInput, completion: @escaping (ClientRuntime.SdkResult<CheckInLicenseOutputResponse, CheckInLicenseOutputError>) -> Void)
```

### `checkoutBorrowLicense(input:completion:)`

Checks out the specified license for offline use.

``` swift
public func checkoutBorrowLicense(input: CheckoutBorrowLicenseInput, completion: @escaping (ClientRuntime.SdkResult<CheckoutBorrowLicenseOutputResponse, CheckoutBorrowLicenseOutputError>) -> Void)
```

### `checkoutLicense(input:completion:)`

Checks out the specified license.

``` swift
public func checkoutLicense(input: CheckoutLicenseInput, completion: @escaping (ClientRuntime.SdkResult<CheckoutLicenseOutputResponse, CheckoutLicenseOutputError>) -> Void)
```

### `createGrant(input:completion:)`

Creates a grant for the specified license. A grant shares the use of license entitlements with specific Amazon Web Services accounts.

``` swift
public func createGrant(input: CreateGrantInput, completion: @escaping (ClientRuntime.SdkResult<CreateGrantOutputResponse, CreateGrantOutputError>) -> Void)
```

### `createGrantVersion(input:completion:)`

Creates a new version of the specified grant.

``` swift
public func createGrantVersion(input: CreateGrantVersionInput, completion: @escaping (ClientRuntime.SdkResult<CreateGrantVersionOutputResponse, CreateGrantVersionOutputError>) -> Void)
```

### `createLicense(input:completion:)`

Creates a license.

``` swift
public func createLicense(input: CreateLicenseInput, completion: @escaping (ClientRuntime.SdkResult<CreateLicenseOutputResponse, CreateLicenseOutputError>) -> Void)
```

### `createLicenseConfiguration(input:completion:)`

Creates a license configuration.
A license configuration is an abstraction of a customer license agreement that can be
consumed and enforced by License Manager. Components include specifications for the license
type (licensing by instance, socket, CPU, or vCPU), allowed tenancy (shared tenancy,
Dedicated Instance, Dedicated Host, or all of these), license affinity  to host (how long a
license must be associated with a host), and the number of licenses purchased and used.

``` swift
public func createLicenseConfiguration(input: CreateLicenseConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<CreateLicenseConfigurationOutputResponse, CreateLicenseConfigurationOutputError>) -> Void)
```

### `createLicenseConversionTaskForResource(input:completion:)`

Creates a new license conversion task.

``` swift
public func createLicenseConversionTaskForResource(input: CreateLicenseConversionTaskForResourceInput, completion: @escaping (ClientRuntime.SdkResult<CreateLicenseConversionTaskForResourceOutputResponse, CreateLicenseConversionTaskForResourceOutputError>) -> Void)
```

### `createLicenseManagerReportGenerator(input:completion:)`

Creates a report generator.

``` swift
public func createLicenseManagerReportGenerator(input: CreateLicenseManagerReportGeneratorInput, completion: @escaping (ClientRuntime.SdkResult<CreateLicenseManagerReportGeneratorOutputResponse, CreateLicenseManagerReportGeneratorOutputError>) -> Void)
```

### `createLicenseVersion(input:completion:)`

Creates a new version of the specified license.

``` swift
public func createLicenseVersion(input: CreateLicenseVersionInput, completion: @escaping (ClientRuntime.SdkResult<CreateLicenseVersionOutputResponse, CreateLicenseVersionOutputError>) -> Void)
```

### `createToken(input:completion:)`

Creates a long-lived token.
A refresh token is a JWT token used to get an access token. With an access token,
you can call AssumeRoleWithWebIdentity to get role credentials that you can use to
call License Manager to manage the specified license.

``` swift
public func createToken(input: CreateTokenInput, completion: @escaping (ClientRuntime.SdkResult<CreateTokenOutputResponse, CreateTokenOutputError>) -> Void)
```

### `deleteGrant(input:completion:)`

Deletes the specified grant.

``` swift
public func deleteGrant(input: DeleteGrantInput, completion: @escaping (ClientRuntime.SdkResult<DeleteGrantOutputResponse, DeleteGrantOutputError>) -> Void)
```

### `deleteLicense(input:completion:)`

Deletes the specified license.

``` swift
public func deleteLicense(input: DeleteLicenseInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLicenseOutputResponse, DeleteLicenseOutputError>) -> Void)
```

### `deleteLicenseConfiguration(input:completion:)`

Deletes the specified license configuration.
You cannot delete a license configuration that is in use.

``` swift
public func deleteLicenseConfiguration(input: DeleteLicenseConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLicenseConfigurationOutputResponse, DeleteLicenseConfigurationOutputError>) -> Void)
```

### `deleteLicenseManagerReportGenerator(input:completion:)`

Deletes the specified report generator.
This action deletes the report generator, which stops it from generating future reports.
The action cannot be reversed. It has no effect on the previous reports from this generator.

``` swift
public func deleteLicenseManagerReportGenerator(input: DeleteLicenseManagerReportGeneratorInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLicenseManagerReportGeneratorOutputResponse, DeleteLicenseManagerReportGeneratorOutputError>) -> Void)
```

### `deleteToken(input:completion:)`

Deletes the specified token. Must be called in the license home Region.

``` swift
public func deleteToken(input: DeleteTokenInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTokenOutputResponse, DeleteTokenOutputError>) -> Void)
```

### `extendLicenseConsumption(input:completion:)`

Extends the expiration date for license consumption.

``` swift
public func extendLicenseConsumption(input: ExtendLicenseConsumptionInput, completion: @escaping (ClientRuntime.SdkResult<ExtendLicenseConsumptionOutputResponse, ExtendLicenseConsumptionOutputError>) -> Void)
```

### `getAccessToken(input:completion:)`

Gets a temporary access token to use with AssumeRoleWithWebIdentity. Access tokens
are valid for one hour.

``` swift
public func getAccessToken(input: GetAccessTokenInput, completion: @escaping (ClientRuntime.SdkResult<GetAccessTokenOutputResponse, GetAccessTokenOutputError>) -> Void)
```

### `getGrant(input:completion:)`

Gets detailed information about the specified grant.

``` swift
public func getGrant(input: GetGrantInput, completion: @escaping (ClientRuntime.SdkResult<GetGrantOutputResponse, GetGrantOutputError>) -> Void)
```

### `getLicense(input:completion:)`

Gets detailed information about the specified license.

``` swift
public func getLicense(input: GetLicenseInput, completion: @escaping (ClientRuntime.SdkResult<GetLicenseOutputResponse, GetLicenseOutputError>) -> Void)
```

### `getLicenseConfiguration(input:completion:)`

Gets detailed information about the specified license configuration.

``` swift
public func getLicenseConfiguration(input: GetLicenseConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetLicenseConfigurationOutputResponse, GetLicenseConfigurationOutputError>) -> Void)
```

### `getLicenseConversionTask(input:completion:)`

Gets information about the specified license type conversion task.

``` swift
public func getLicenseConversionTask(input: GetLicenseConversionTaskInput, completion: @escaping (ClientRuntime.SdkResult<GetLicenseConversionTaskOutputResponse, GetLicenseConversionTaskOutputError>) -> Void)
```

### `getLicenseManagerReportGenerator(input:completion:)`

Gets information about the specified report generator.

``` swift
public func getLicenseManagerReportGenerator(input: GetLicenseManagerReportGeneratorInput, completion: @escaping (ClientRuntime.SdkResult<GetLicenseManagerReportGeneratorOutputResponse, GetLicenseManagerReportGeneratorOutputError>) -> Void)
```

### `getLicenseUsage(input:completion:)`

Gets detailed information about the usage of the specified license.

``` swift
public func getLicenseUsage(input: GetLicenseUsageInput, completion: @escaping (ClientRuntime.SdkResult<GetLicenseUsageOutputResponse, GetLicenseUsageOutputError>) -> Void)
```

### `getServiceSettings(input:completion:)`

Gets the License Manager settings for the current Region.

``` swift
public func getServiceSettings(input: GetServiceSettingsInput, completion: @escaping (ClientRuntime.SdkResult<GetServiceSettingsOutputResponse, GetServiceSettingsOutputError>) -> Void)
```

### `listAssociationsForLicenseConfiguration(input:completion:)`

Lists the resource associations for the specified license configuration.
Resource associations need not consume licenses from a license configuration.
For example, an AMI or a stopped instance might not consume a license (depending on
the license rules).

``` swift
public func listAssociationsForLicenseConfiguration(input: ListAssociationsForLicenseConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<ListAssociationsForLicenseConfigurationOutputResponse, ListAssociationsForLicenseConfigurationOutputError>) -> Void)
```

### `listDistributedGrants(input:completion:)`

Lists the grants distributed for the specified license.

``` swift
public func listDistributedGrants(input: ListDistributedGrantsInput, completion: @escaping (ClientRuntime.SdkResult<ListDistributedGrantsOutputResponse, ListDistributedGrantsOutputError>) -> Void)
```

### `listFailuresForLicenseConfigurationOperations(input:completion:)`

Lists the license configuration operations that failed.

``` swift
public func listFailuresForLicenseConfigurationOperations(input: ListFailuresForLicenseConfigurationOperationsInput, completion: @escaping (ClientRuntime.SdkResult<ListFailuresForLicenseConfigurationOperationsOutputResponse, ListFailuresForLicenseConfigurationOperationsOutputError>) -> Void)
```

### `listLicenseConfigurations(input:completion:)`

Lists the license configurations for your account.

``` swift
public func listLicenseConfigurations(input: ListLicenseConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<ListLicenseConfigurationsOutputResponse, ListLicenseConfigurationsOutputError>) -> Void)
```

### `listLicenseConversionTasks(input:completion:)`

Lists the license type conversion tasks for your account.

``` swift
public func listLicenseConversionTasks(input: ListLicenseConversionTasksInput, completion: @escaping (ClientRuntime.SdkResult<ListLicenseConversionTasksOutputResponse, ListLicenseConversionTasksOutputError>) -> Void)
```

### `listLicenseManagerReportGenerators(input:completion:)`

Lists the report generators for your account.

``` swift
public func listLicenseManagerReportGenerators(input: ListLicenseManagerReportGeneratorsInput, completion: @escaping (ClientRuntime.SdkResult<ListLicenseManagerReportGeneratorsOutputResponse, ListLicenseManagerReportGeneratorsOutputError>) -> Void)
```

### `listLicenseSpecificationsForResource(input:completion:)`

Describes the license configurations for the specified resource.

``` swift
public func listLicenseSpecificationsForResource(input: ListLicenseSpecificationsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListLicenseSpecificationsForResourceOutputResponse, ListLicenseSpecificationsForResourceOutputError>) -> Void)
```

### `listLicenseVersions(input:completion:)`

Lists all versions of the specified license.

``` swift
public func listLicenseVersions(input: ListLicenseVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListLicenseVersionsOutputResponse, ListLicenseVersionsOutputError>) -> Void)
```

### `listLicenses(input:completion:)`

Lists the licenses for your account.

``` swift
public func listLicenses(input: ListLicensesInput, completion: @escaping (ClientRuntime.SdkResult<ListLicensesOutputResponse, ListLicensesOutputError>) -> Void)
```

### `listReceivedGrants(input:completion:)`

Lists grants that are received but not accepted.

``` swift
public func listReceivedGrants(input: ListReceivedGrantsInput, completion: @escaping (ClientRuntime.SdkResult<ListReceivedGrantsOutputResponse, ListReceivedGrantsOutputError>) -> Void)
```

### `listReceivedLicenses(input:completion:)`

Lists received licenses.

``` swift
public func listReceivedLicenses(input: ListReceivedLicensesInput, completion: @escaping (ClientRuntime.SdkResult<ListReceivedLicensesOutputResponse, ListReceivedLicensesOutputError>) -> Void)
```

### `listResourceInventory(input:completion:)`

Lists resources managed using Systems Manager inventory.

``` swift
public func listResourceInventory(input: ListResourceInventoryInput, completion: @escaping (ClientRuntime.SdkResult<ListResourceInventoryOutputResponse, ListResourceInventoryOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Lists the tags for the specified license configuration.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `listTokens(input:completion:)`

Lists your tokens.

``` swift
public func listTokens(input: ListTokensInput, completion: @escaping (ClientRuntime.SdkResult<ListTokensOutputResponse, ListTokensOutputError>) -> Void)
```

### `listUsageForLicenseConfiguration(input:completion:)`

Lists all license usage records for a license configuration, displaying license
consumption details by resource at a selected point in time. Use this action to audit the
current license consumption for any license inventory and configuration.

``` swift
public func listUsageForLicenseConfiguration(input: ListUsageForLicenseConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<ListUsageForLicenseConfigurationOutputResponse, ListUsageForLicenseConfigurationOutputError>) -> Void)
```

### `rejectGrant(input:completion:)`

Rejects the specified grant.

``` swift
public func rejectGrant(input: RejectGrantInput, completion: @escaping (ClientRuntime.SdkResult<RejectGrantOutputResponse, RejectGrantOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Adds the specified tags to the specified license configuration.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes the specified tags from the specified license configuration.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateLicenseConfiguration(input:completion:)`

Modifies the attributes of an existing license configuration.

``` swift
public func updateLicenseConfiguration(input: UpdateLicenseConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateLicenseConfigurationOutputResponse, UpdateLicenseConfigurationOutputError>) -> Void)
```

### `updateLicenseManagerReportGenerator(input:completion:)`

Updates a report generator.
After you make changes to a report generator, it starts generating new reports within 60 minutes of being updated.

``` swift
public func updateLicenseManagerReportGenerator(input: UpdateLicenseManagerReportGeneratorInput, completion: @escaping (ClientRuntime.SdkResult<UpdateLicenseManagerReportGeneratorOutputResponse, UpdateLicenseManagerReportGeneratorOutputError>) -> Void)
```

### `updateLicenseSpecificationsForResource(input:completion:)`

Adds or removes the specified license configurations for the specified Amazon Web Services resource.
You can update the license specifications of AMIs, instances, and hosts.
You cannot update the license specifications for launch templates and CloudFormation templates,
as they send license configurations to the operation that creates the resource.

``` swift
public func updateLicenseSpecificationsForResource(input: UpdateLicenseSpecificationsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<UpdateLicenseSpecificationsForResourceOutputResponse, UpdateLicenseSpecificationsForResourceOutputError>) -> Void)
```

### `updateServiceSettings(input:completion:)`

Updates License Manager settings for the current Region.

``` swift
public func updateServiceSettings(input: UpdateServiceSettingsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateServiceSettingsOutputResponse, UpdateServiceSettingsOutputError>) -> Void)
```
