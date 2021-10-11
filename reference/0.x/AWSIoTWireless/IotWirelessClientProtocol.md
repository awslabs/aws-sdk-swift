# IotWirelessClientProtocol

AWS IoT Wireless API documentation

``` swift
public protocol IotWirelessClientProtocol 
```

## Requirements

### associateAwsAccountWithPartnerAccount(input:​completion:​)

Associates a partner account with your AWS account.

``` swift
func associateAwsAccountWithPartnerAccount(input: AssociateAwsAccountWithPartnerAccountInput, completion: @escaping (ClientRuntime.SdkResult<AssociateAwsAccountWithPartnerAccountOutputResponse, AssociateAwsAccountWithPartnerAccountOutputError>) -> Void)
```

### associateWirelessDeviceWithThing(input:​completion:​)

Associates a wireless device with a thing.

``` swift
func associateWirelessDeviceWithThing(input: AssociateWirelessDeviceWithThingInput, completion: @escaping (ClientRuntime.SdkResult<AssociateWirelessDeviceWithThingOutputResponse, AssociateWirelessDeviceWithThingOutputError>) -> Void)
```

### associateWirelessGatewayWithCertificate(input:​completion:​)

Associates a wireless gateway with a certificate.

``` swift
func associateWirelessGatewayWithCertificate(input: AssociateWirelessGatewayWithCertificateInput, completion: @escaping (ClientRuntime.SdkResult<AssociateWirelessGatewayWithCertificateOutputResponse, AssociateWirelessGatewayWithCertificateOutputError>) -> Void)
```

### associateWirelessGatewayWithThing(input:​completion:​)

Associates a wireless gateway with a thing.

``` swift
func associateWirelessGatewayWithThing(input: AssociateWirelessGatewayWithThingInput, completion: @escaping (ClientRuntime.SdkResult<AssociateWirelessGatewayWithThingOutputResponse, AssociateWirelessGatewayWithThingOutputError>) -> Void)
```

### createDestination(input:​completion:​)

Creates a new destination that maps a device message to an AWS IoT rule.

``` swift
func createDestination(input: CreateDestinationInput, completion: @escaping (ClientRuntime.SdkResult<CreateDestinationOutputResponse, CreateDestinationOutputError>) -> Void)
```

### createDeviceProfile(input:​completion:​)

Creates a new device profile.

``` swift
func createDeviceProfile(input: CreateDeviceProfileInput, completion: @escaping (ClientRuntime.SdkResult<CreateDeviceProfileOutputResponse, CreateDeviceProfileOutputError>) -> Void)
```

### createServiceProfile(input:​completion:​)

Creates a new service profile.

``` swift
func createServiceProfile(input: CreateServiceProfileInput, completion: @escaping (ClientRuntime.SdkResult<CreateServiceProfileOutputResponse, CreateServiceProfileOutputError>) -> Void)
```

### createWirelessDevice(input:​completion:​)

Provisions a wireless device.

``` swift
func createWirelessDevice(input: CreateWirelessDeviceInput, completion: @escaping (ClientRuntime.SdkResult<CreateWirelessDeviceOutputResponse, CreateWirelessDeviceOutputError>) -> Void)
```

### createWirelessGateway(input:​completion:​)

Provisions a wireless gateway.

``` swift
func createWirelessGateway(input: CreateWirelessGatewayInput, completion: @escaping (ClientRuntime.SdkResult<CreateWirelessGatewayOutputResponse, CreateWirelessGatewayOutputError>) -> Void)
```

### createWirelessGatewayTask(input:​completion:​)

Creates a task for a wireless gateway.

``` swift
func createWirelessGatewayTask(input: CreateWirelessGatewayTaskInput, completion: @escaping (ClientRuntime.SdkResult<CreateWirelessGatewayTaskOutputResponse, CreateWirelessGatewayTaskOutputError>) -> Void)
```

### createWirelessGatewayTaskDefinition(input:​completion:​)

Creates a gateway task definition.

``` swift
func createWirelessGatewayTaskDefinition(input: CreateWirelessGatewayTaskDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<CreateWirelessGatewayTaskDefinitionOutputResponse, CreateWirelessGatewayTaskDefinitionOutputError>) -> Void)
```

### deleteDestination(input:​completion:​)

Deletes a destination.

``` swift
func deleteDestination(input: DeleteDestinationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDestinationOutputResponse, DeleteDestinationOutputError>) -> Void)
```

### deleteDeviceProfile(input:​completion:​)

Deletes a device profile.

``` swift
func deleteDeviceProfile(input: DeleteDeviceProfileInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDeviceProfileOutputResponse, DeleteDeviceProfileOutputError>) -> Void)
```

### deleteServiceProfile(input:​completion:​)

Deletes a service profile.

``` swift
func deleteServiceProfile(input: DeleteServiceProfileInput, completion: @escaping (ClientRuntime.SdkResult<DeleteServiceProfileOutputResponse, DeleteServiceProfileOutputError>) -> Void)
```

### deleteWirelessDevice(input:​completion:​)

Deletes a wireless device.

``` swift
func deleteWirelessDevice(input: DeleteWirelessDeviceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteWirelessDeviceOutputResponse, DeleteWirelessDeviceOutputError>) -> Void)
```

### deleteWirelessGateway(input:​completion:​)

Deletes a wireless gateway.

``` swift
func deleteWirelessGateway(input: DeleteWirelessGatewayInput, completion: @escaping (ClientRuntime.SdkResult<DeleteWirelessGatewayOutputResponse, DeleteWirelessGatewayOutputError>) -> Void)
```

### deleteWirelessGatewayTask(input:​completion:​)

Deletes a wireless gateway task.

``` swift
func deleteWirelessGatewayTask(input: DeleteWirelessGatewayTaskInput, completion: @escaping (ClientRuntime.SdkResult<DeleteWirelessGatewayTaskOutputResponse, DeleteWirelessGatewayTaskOutputError>) -> Void)
```

### deleteWirelessGatewayTaskDefinition(input:​completion:​)

Deletes a wireless gateway task definition. Deleting this task definition does not affect tasks that are currently in progress.

``` swift
func deleteWirelessGatewayTaskDefinition(input: DeleteWirelessGatewayTaskDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteWirelessGatewayTaskDefinitionOutputResponse, DeleteWirelessGatewayTaskDefinitionOutputError>) -> Void)
```

### disassociateAwsAccountFromPartnerAccount(input:​completion:​)

Disassociates your AWS account from a partner account. If PartnerAccountId and PartnerType are null, disassociates your AWS account from all partner accounts.

``` swift
func disassociateAwsAccountFromPartnerAccount(input: DisassociateAwsAccountFromPartnerAccountInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateAwsAccountFromPartnerAccountOutputResponse, DisassociateAwsAccountFromPartnerAccountOutputError>) -> Void)
```

### disassociateWirelessDeviceFromThing(input:​completion:​)

Disassociates a wireless device from its currently associated thing.

``` swift
func disassociateWirelessDeviceFromThing(input: DisassociateWirelessDeviceFromThingInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateWirelessDeviceFromThingOutputResponse, DisassociateWirelessDeviceFromThingOutputError>) -> Void)
```

### disassociateWirelessGatewayFromCertificate(input:​completion:​)

Disassociates a wireless gateway from its currently associated certificate.

``` swift
func disassociateWirelessGatewayFromCertificate(input: DisassociateWirelessGatewayFromCertificateInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateWirelessGatewayFromCertificateOutputResponse, DisassociateWirelessGatewayFromCertificateOutputError>) -> Void)
```

### disassociateWirelessGatewayFromThing(input:​completion:​)

Disassociates a wireless gateway from its currently associated thing.

``` swift
func disassociateWirelessGatewayFromThing(input: DisassociateWirelessGatewayFromThingInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateWirelessGatewayFromThingOutputResponse, DisassociateWirelessGatewayFromThingOutputError>) -> Void)
```

### getDestination(input:​completion:​)

Gets information about a destination.

``` swift
func getDestination(input: GetDestinationInput, completion: @escaping (ClientRuntime.SdkResult<GetDestinationOutputResponse, GetDestinationOutputError>) -> Void)
```

### getDeviceProfile(input:​completion:​)

Gets information about a device profile.

``` swift
func getDeviceProfile(input: GetDeviceProfileInput, completion: @escaping (ClientRuntime.SdkResult<GetDeviceProfileOutputResponse, GetDeviceProfileOutputError>) -> Void)
```

### getLogLevelsByResourceTypes(input:​completion:​)

Returns current default log levels or log levels by resource types. Based on resource types, log levels can be
for wireless device log options or wireless gateway log options.

``` swift
func getLogLevelsByResourceTypes(input: GetLogLevelsByResourceTypesInput, completion: @escaping (ClientRuntime.SdkResult<GetLogLevelsByResourceTypesOutputResponse, GetLogLevelsByResourceTypesOutputError>) -> Void)
```

### getPartnerAccount(input:​completion:​)

Gets information about a partner account. If PartnerAccountId and PartnerType are null, returns all partner accounts.

``` swift
func getPartnerAccount(input: GetPartnerAccountInput, completion: @escaping (ClientRuntime.SdkResult<GetPartnerAccountOutputResponse, GetPartnerAccountOutputError>) -> Void)
```

### getResourceLogLevel(input:​completion:​)

Fetches the log-level override, if any, for a given resource-ID and resource-type. It can be used for
a wireless device or a wireless gateway.

``` swift
func getResourceLogLevel(input: GetResourceLogLevelInput, completion: @escaping (ClientRuntime.SdkResult<GetResourceLogLevelOutputResponse, GetResourceLogLevelOutputError>) -> Void)
```

### getServiceEndpoint(input:​completion:​)

Gets the account-specific endpoint for Configuration and Update Server (CUPS) protocol or LoRaWAN Network Server (LNS) connections.

``` swift
func getServiceEndpoint(input: GetServiceEndpointInput, completion: @escaping (ClientRuntime.SdkResult<GetServiceEndpointOutputResponse, GetServiceEndpointOutputError>) -> Void)
```

### getServiceProfile(input:​completion:​)

Gets information about a service profile.

``` swift
func getServiceProfile(input: GetServiceProfileInput, completion: @escaping (ClientRuntime.SdkResult<GetServiceProfileOutputResponse, GetServiceProfileOutputError>) -> Void)
```

### getWirelessDevice(input:​completion:​)

Gets information about a wireless device.

``` swift
func getWirelessDevice(input: GetWirelessDeviceInput, completion: @escaping (ClientRuntime.SdkResult<GetWirelessDeviceOutputResponse, GetWirelessDeviceOutputError>) -> Void)
```

### getWirelessDeviceStatistics(input:​completion:​)

Gets operating information about a wireless device.

``` swift
func getWirelessDeviceStatistics(input: GetWirelessDeviceStatisticsInput, completion: @escaping (ClientRuntime.SdkResult<GetWirelessDeviceStatisticsOutputResponse, GetWirelessDeviceStatisticsOutputError>) -> Void)
```

### getWirelessGateway(input:​completion:​)

Gets information about a wireless gateway.

``` swift
func getWirelessGateway(input: GetWirelessGatewayInput, completion: @escaping (ClientRuntime.SdkResult<GetWirelessGatewayOutputResponse, GetWirelessGatewayOutputError>) -> Void)
```

### getWirelessGatewayCertificate(input:​completion:​)

Gets the ID of the certificate that is currently associated with a wireless gateway.

``` swift
func getWirelessGatewayCertificate(input: GetWirelessGatewayCertificateInput, completion: @escaping (ClientRuntime.SdkResult<GetWirelessGatewayCertificateOutputResponse, GetWirelessGatewayCertificateOutputError>) -> Void)
```

### getWirelessGatewayFirmwareInformation(input:​completion:​)

Gets the firmware version and other information about a wireless gateway.

``` swift
func getWirelessGatewayFirmwareInformation(input: GetWirelessGatewayFirmwareInformationInput, completion: @escaping (ClientRuntime.SdkResult<GetWirelessGatewayFirmwareInformationOutputResponse, GetWirelessGatewayFirmwareInformationOutputError>) -> Void)
```

### getWirelessGatewayStatistics(input:​completion:​)

Gets operating information about a wireless gateway.

``` swift
func getWirelessGatewayStatistics(input: GetWirelessGatewayStatisticsInput, completion: @escaping (ClientRuntime.SdkResult<GetWirelessGatewayStatisticsOutputResponse, GetWirelessGatewayStatisticsOutputError>) -> Void)
```

### getWirelessGatewayTask(input:​completion:​)

Gets information about a wireless gateway task.

``` swift
func getWirelessGatewayTask(input: GetWirelessGatewayTaskInput, completion: @escaping (ClientRuntime.SdkResult<GetWirelessGatewayTaskOutputResponse, GetWirelessGatewayTaskOutputError>) -> Void)
```

### getWirelessGatewayTaskDefinition(input:​completion:​)

Gets information about a wireless gateway task definition.

``` swift
func getWirelessGatewayTaskDefinition(input: GetWirelessGatewayTaskDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<GetWirelessGatewayTaskDefinitionOutputResponse, GetWirelessGatewayTaskDefinitionOutputError>) -> Void)
```

### listDestinations(input:​completion:​)

Lists the destinations registered to your AWS account.

``` swift
func listDestinations(input: ListDestinationsInput, completion: @escaping (ClientRuntime.SdkResult<ListDestinationsOutputResponse, ListDestinationsOutputError>) -> Void)
```

### listDeviceProfiles(input:​completion:​)

Lists the device profiles registered to your AWS account.

``` swift
func listDeviceProfiles(input: ListDeviceProfilesInput, completion: @escaping (ClientRuntime.SdkResult<ListDeviceProfilesOutputResponse, ListDeviceProfilesOutputError>) -> Void)
```

### listPartnerAccounts(input:​completion:​)

Lists the partner accounts associated with your AWS account.

``` swift
func listPartnerAccounts(input: ListPartnerAccountsInput, completion: @escaping (ClientRuntime.SdkResult<ListPartnerAccountsOutputResponse, ListPartnerAccountsOutputError>) -> Void)
```

### listServiceProfiles(input:​completion:​)

Lists the service profiles registered to your AWS account.

``` swift
func listServiceProfiles(input: ListServiceProfilesInput, completion: @escaping (ClientRuntime.SdkResult<ListServiceProfilesOutputResponse, ListServiceProfilesOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

Lists the tags (metadata) you have assigned to the resource.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### listWirelessDevices(input:​completion:​)

Lists the wireless devices registered to your AWS account.

``` swift
func listWirelessDevices(input: ListWirelessDevicesInput, completion: @escaping (ClientRuntime.SdkResult<ListWirelessDevicesOutputResponse, ListWirelessDevicesOutputError>) -> Void)
```

### listWirelessGateways(input:​completion:​)

Lists the wireless gateways registered to your AWS account.

``` swift
func listWirelessGateways(input: ListWirelessGatewaysInput, completion: @escaping (ClientRuntime.SdkResult<ListWirelessGatewaysOutputResponse, ListWirelessGatewaysOutputError>) -> Void)
```

### listWirelessGatewayTaskDefinitions(input:​completion:​)

List the wireless gateway tasks definitions registered to your AWS account.

``` swift
func listWirelessGatewayTaskDefinitions(input: ListWirelessGatewayTaskDefinitionsInput, completion: @escaping (ClientRuntime.SdkResult<ListWirelessGatewayTaskDefinitionsOutputResponse, ListWirelessGatewayTaskDefinitionsOutputError>) -> Void)
```

### putResourceLogLevel(input:​completion:​)

Sets the log-level override for a resource-ID and resource-type. This option can be specified for a wireless gateway
or a wireless device. A limit of 200 log level override can be set per account.

``` swift
func putResourceLogLevel(input: PutResourceLogLevelInput, completion: @escaping (ClientRuntime.SdkResult<PutResourceLogLevelOutputResponse, PutResourceLogLevelOutputError>) -> Void)
```

### resetAllResourceLogLevels(input:​completion:​)

Removes the log-level overrides for all resources; both wireless devices and wireless gateways.

``` swift
func resetAllResourceLogLevels(input: ResetAllResourceLogLevelsInput, completion: @escaping (ClientRuntime.SdkResult<ResetAllResourceLogLevelsOutputResponse, ResetAllResourceLogLevelsOutputError>) -> Void)
```

### resetResourceLogLevel(input:​completion:​)

Removes the log-level override, if any, for a specific resource-ID and resource-type. It can be used for
a wireless device or a wireless gateway.

``` swift
func resetResourceLogLevel(input: ResetResourceLogLevelInput, completion: @escaping (ClientRuntime.SdkResult<ResetResourceLogLevelOutputResponse, ResetResourceLogLevelOutputError>) -> Void)
```

### sendDataToWirelessDevice(input:​completion:​)

Sends a decrypted application data frame to a device.

``` swift
func sendDataToWirelessDevice(input: SendDataToWirelessDeviceInput, completion: @escaping (ClientRuntime.SdkResult<SendDataToWirelessDeviceOutputResponse, SendDataToWirelessDeviceOutputError>) -> Void)
```

### tagResource(input:​completion:​)

Adds a tag to a resource.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### testWirelessDevice(input:​completion:​)

Simulates a provisioned device by sending an uplink data payload of Hello.

``` swift
func testWirelessDevice(input: TestWirelessDeviceInput, completion: @escaping (ClientRuntime.SdkResult<TestWirelessDeviceOutputResponse, TestWirelessDeviceOutputError>) -> Void)
```

### untagResource(input:​completion:​)

Removes one or more tags from a resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateDestination(input:​completion:​)

Updates properties of a destination.

``` swift
func updateDestination(input: UpdateDestinationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDestinationOutputResponse, UpdateDestinationOutputError>) -> Void)
```

### updateLogLevelsByResourceTypes(input:​completion:​)

Set default log level, or log levels by resource types. This can be for wireless device log options or
wireless gateways log options and is used to control the log messages that'll be displayed in CloudWatch.

``` swift
func updateLogLevelsByResourceTypes(input: UpdateLogLevelsByResourceTypesInput, completion: @escaping (ClientRuntime.SdkResult<UpdateLogLevelsByResourceTypesOutputResponse, UpdateLogLevelsByResourceTypesOutputError>) -> Void)
```

### updatePartnerAccount(input:​completion:​)

Updates properties of a partner account.

``` swift
func updatePartnerAccount(input: UpdatePartnerAccountInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePartnerAccountOutputResponse, UpdatePartnerAccountOutputError>) -> Void)
```

### updateWirelessDevice(input:​completion:​)

Updates properties of a wireless device.

``` swift
func updateWirelessDevice(input: UpdateWirelessDeviceInput, completion: @escaping (ClientRuntime.SdkResult<UpdateWirelessDeviceOutputResponse, UpdateWirelessDeviceOutputError>) -> Void)
```

### updateWirelessGateway(input:​completion:​)

Updates properties of a wireless gateway.

``` swift
func updateWirelessGateway(input: UpdateWirelessGatewayInput, completion: @escaping (ClientRuntime.SdkResult<UpdateWirelessGatewayOutputResponse, UpdateWirelessGatewayOutputError>) -> Void)
```
