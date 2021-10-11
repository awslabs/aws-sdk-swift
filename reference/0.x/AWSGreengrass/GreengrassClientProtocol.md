# GreengrassClientProtocol

AWS IoT Greengrass seamlessly extends AWS onto physical devices so they can act locally on the data they generate, while still using the cloud for management, analytics, and durable storage. AWS IoT Greengrass ensures your devices can respond quickly to local events and operate with intermittent connectivity. AWS IoT Greengrass minimizes the cost of transmitting data to the cloud by allowing you to author AWS Lambda functions that execute locally.

``` swift
public protocol GreengrassClientProtocol 
```

## Requirements

### associateRoleToGroup(input:​completion:​)

Associates a role with a group. Your Greengrass core will use the role to access AWS cloud services. The role's permissions should allow Greengrass core Lambda functions to perform actions against the cloud.

``` swift
func associateRoleToGroup(input: AssociateRoleToGroupInput, completion: @escaping (ClientRuntime.SdkResult<AssociateRoleToGroupOutputResponse, AssociateRoleToGroupOutputError>) -> Void)
```

### associateServiceRoleToAccount(input:​completion:​)

Associates a role with your account. AWS IoT Greengrass will use the role to access your Lambda functions and AWS IoT resources. This is necessary for deployments to succeed. The role must have at least minimum permissions in the policy ''AWSGreengrassResourceAccessRolePolicy''.

``` swift
func associateServiceRoleToAccount(input: AssociateServiceRoleToAccountInput, completion: @escaping (ClientRuntime.SdkResult<AssociateServiceRoleToAccountOutputResponse, AssociateServiceRoleToAccountOutputError>) -> Void)
```

### createConnectorDefinition(input:​completion:​)

Creates a connector definition. You may provide the initial version of the connector definition now or use ''CreateConnectorDefinitionVersion'' at a later time.

``` swift
func createConnectorDefinition(input: CreateConnectorDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<CreateConnectorDefinitionOutputResponse, CreateConnectorDefinitionOutputError>) -> Void)
```

### createConnectorDefinitionVersion(input:​completion:​)

Creates a version of a connector definition which has already been defined.

``` swift
func createConnectorDefinitionVersion(input: CreateConnectorDefinitionVersionInput, completion: @escaping (ClientRuntime.SdkResult<CreateConnectorDefinitionVersionOutputResponse, CreateConnectorDefinitionVersionOutputError>) -> Void)
```

### createCoreDefinition(input:​completion:​)

Creates a core definition. You may provide the initial version of the core definition now or use ''CreateCoreDefinitionVersion'' at a later time. Greengrass groups must each contain exactly one Greengrass core.

``` swift
func createCoreDefinition(input: CreateCoreDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<CreateCoreDefinitionOutputResponse, CreateCoreDefinitionOutputError>) -> Void)
```

### createCoreDefinitionVersion(input:​completion:​)

Creates a version of a core definition that has already been defined. Greengrass groups must each contain exactly one Greengrass core.

``` swift
func createCoreDefinitionVersion(input: CreateCoreDefinitionVersionInput, completion: @escaping (ClientRuntime.SdkResult<CreateCoreDefinitionVersionOutputResponse, CreateCoreDefinitionVersionOutputError>) -> Void)
```

### createDeployment(input:​completion:​)

Creates a deployment. ''CreateDeployment'' requests are idempotent with respect to the ''X-Amzn-Client-Token'' token and the request parameters.

``` swift
func createDeployment(input: CreateDeploymentInput, completion: @escaping (ClientRuntime.SdkResult<CreateDeploymentOutputResponse, CreateDeploymentOutputError>) -> Void)
```

### createDeviceDefinition(input:​completion:​)

Creates a device definition. You may provide the initial version of the device definition now or use ''CreateDeviceDefinitionVersion'' at a later time.

``` swift
func createDeviceDefinition(input: CreateDeviceDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<CreateDeviceDefinitionOutputResponse, CreateDeviceDefinitionOutputError>) -> Void)
```

### createDeviceDefinitionVersion(input:​completion:​)

Creates a version of a device definition that has already been defined.

``` swift
func createDeviceDefinitionVersion(input: CreateDeviceDefinitionVersionInput, completion: @escaping (ClientRuntime.SdkResult<CreateDeviceDefinitionVersionOutputResponse, CreateDeviceDefinitionVersionOutputError>) -> Void)
```

### createFunctionDefinition(input:​completion:​)

Creates a Lambda function definition which contains a list of Lambda functions and their configurations to be used in a group. You can create an initial version of the definition by providing a list of Lambda functions and their configurations now, or use ''CreateFunctionDefinitionVersion'' later.

``` swift
func createFunctionDefinition(input: CreateFunctionDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<CreateFunctionDefinitionOutputResponse, CreateFunctionDefinitionOutputError>) -> Void)
```

### createFunctionDefinitionVersion(input:​completion:​)

Creates a version of a Lambda function definition that has already been defined.

``` swift
func createFunctionDefinitionVersion(input: CreateFunctionDefinitionVersionInput, completion: @escaping (ClientRuntime.SdkResult<CreateFunctionDefinitionVersionOutputResponse, CreateFunctionDefinitionVersionOutputError>) -> Void)
```

### createGroup(input:​completion:​)

Creates a group. You may provide the initial version of the group or use ''CreateGroupVersion'' at a later time. Tip:​ You can use the ''gg\_group\_setup'' package (https:​//github.com/awslabs/aws-greengrass-group-setup) as a library or command-line application to create and deploy Greengrass groups.

``` swift
func createGroup(input: CreateGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateGroupOutputResponse, CreateGroupOutputError>) -> Void)
```

### createGroupCertificateAuthority(input:​completion:​)

Creates a CA for the group. If a CA already exists, it will rotate the existing CA.

``` swift
func createGroupCertificateAuthority(input: CreateGroupCertificateAuthorityInput, completion: @escaping (ClientRuntime.SdkResult<CreateGroupCertificateAuthorityOutputResponse, CreateGroupCertificateAuthorityOutputError>) -> Void)
```

### createGroupVersion(input:​completion:​)

Creates a version of a group which has already been defined.

``` swift
func createGroupVersion(input: CreateGroupVersionInput, completion: @escaping (ClientRuntime.SdkResult<CreateGroupVersionOutputResponse, CreateGroupVersionOutputError>) -> Void)
```

### createLoggerDefinition(input:​completion:​)

Creates a logger definition. You may provide the initial version of the logger definition now or use ''CreateLoggerDefinitionVersion'' at a later time.

``` swift
func createLoggerDefinition(input: CreateLoggerDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<CreateLoggerDefinitionOutputResponse, CreateLoggerDefinitionOutputError>) -> Void)
```

### createLoggerDefinitionVersion(input:​completion:​)

Creates a version of a logger definition that has already been defined.

``` swift
func createLoggerDefinitionVersion(input: CreateLoggerDefinitionVersionInput, completion: @escaping (ClientRuntime.SdkResult<CreateLoggerDefinitionVersionOutputResponse, CreateLoggerDefinitionVersionOutputError>) -> Void)
```

### createResourceDefinition(input:​completion:​)

Creates a resource definition which contains a list of resources to be used in a group. You can create an initial version of the definition by providing a list of resources now, or use ''CreateResourceDefinitionVersion'' later.

``` swift
func createResourceDefinition(input: CreateResourceDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<CreateResourceDefinitionOutputResponse, CreateResourceDefinitionOutputError>) -> Void)
```

### createResourceDefinitionVersion(input:​completion:​)

Creates a version of a resource definition that has already been defined.

``` swift
func createResourceDefinitionVersion(input: CreateResourceDefinitionVersionInput, completion: @escaping (ClientRuntime.SdkResult<CreateResourceDefinitionVersionOutputResponse, CreateResourceDefinitionVersionOutputError>) -> Void)
```

### createSoftwareUpdateJob(input:​completion:​)

Creates a software update for a core or group of cores (specified as an IoT thing group.) Use this to update the OTA Agent as well as the Greengrass core software. It makes use of the IoT Jobs feature which provides additional commands to manage a Greengrass core software update job.

``` swift
func createSoftwareUpdateJob(input: CreateSoftwareUpdateJobInput, completion: @escaping (ClientRuntime.SdkResult<CreateSoftwareUpdateJobOutputResponse, CreateSoftwareUpdateJobOutputError>) -> Void)
```

### createSubscriptionDefinition(input:​completion:​)

Creates a subscription definition. You may provide the initial version of the subscription definition now or use ''CreateSubscriptionDefinitionVersion'' at a later time.

``` swift
func createSubscriptionDefinition(input: CreateSubscriptionDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<CreateSubscriptionDefinitionOutputResponse, CreateSubscriptionDefinitionOutputError>) -> Void)
```

### createSubscriptionDefinitionVersion(input:​completion:​)

Creates a version of a subscription definition which has already been defined.

``` swift
func createSubscriptionDefinitionVersion(input: CreateSubscriptionDefinitionVersionInput, completion: @escaping (ClientRuntime.SdkResult<CreateSubscriptionDefinitionVersionOutputResponse, CreateSubscriptionDefinitionVersionOutputError>) -> Void)
```

### deleteConnectorDefinition(input:​completion:​)

Deletes a connector definition.

``` swift
func deleteConnectorDefinition(input: DeleteConnectorDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteConnectorDefinitionOutputResponse, DeleteConnectorDefinitionOutputError>) -> Void)
```

### deleteCoreDefinition(input:​completion:​)

Deletes a core definition.

``` swift
func deleteCoreDefinition(input: DeleteCoreDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCoreDefinitionOutputResponse, DeleteCoreDefinitionOutputError>) -> Void)
```

### deleteDeviceDefinition(input:​completion:​)

Deletes a device definition.

``` swift
func deleteDeviceDefinition(input: DeleteDeviceDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDeviceDefinitionOutputResponse, DeleteDeviceDefinitionOutputError>) -> Void)
```

### deleteFunctionDefinition(input:​completion:​)

Deletes a Lambda function definition.

``` swift
func deleteFunctionDefinition(input: DeleteFunctionDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFunctionDefinitionOutputResponse, DeleteFunctionDefinitionOutputError>) -> Void)
```

### deleteGroup(input:​completion:​)

Deletes a group.

``` swift
func deleteGroup(input: DeleteGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteGroupOutputResponse, DeleteGroupOutputError>) -> Void)
```

### deleteLoggerDefinition(input:​completion:​)

Deletes a logger definition.

``` swift
func deleteLoggerDefinition(input: DeleteLoggerDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLoggerDefinitionOutputResponse, DeleteLoggerDefinitionOutputError>) -> Void)
```

### deleteResourceDefinition(input:​completion:​)

Deletes a resource definition.

``` swift
func deleteResourceDefinition(input: DeleteResourceDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteResourceDefinitionOutputResponse, DeleteResourceDefinitionOutputError>) -> Void)
```

### deleteSubscriptionDefinition(input:​completion:​)

Deletes a subscription definition.

``` swift
func deleteSubscriptionDefinition(input: DeleteSubscriptionDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSubscriptionDefinitionOutputResponse, DeleteSubscriptionDefinitionOutputError>) -> Void)
```

### disassociateRoleFromGroup(input:​completion:​)

Disassociates the role from a group.

``` swift
func disassociateRoleFromGroup(input: DisassociateRoleFromGroupInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateRoleFromGroupOutputResponse, DisassociateRoleFromGroupOutputError>) -> Void)
```

### disassociateServiceRoleFromAccount(input:​completion:​)

Disassociates the service role from your account. Without a service role, deployments will not work.

``` swift
func disassociateServiceRoleFromAccount(input: DisassociateServiceRoleFromAccountInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateServiceRoleFromAccountOutputResponse, DisassociateServiceRoleFromAccountOutputError>) -> Void)
```

### getAssociatedRole(input:​completion:​)

Retrieves the role associated with a particular group.

``` swift
func getAssociatedRole(input: GetAssociatedRoleInput, completion: @escaping (ClientRuntime.SdkResult<GetAssociatedRoleOutputResponse, GetAssociatedRoleOutputError>) -> Void)
```

### getBulkDeploymentStatus(input:​completion:​)

Returns the status of a bulk deployment.

``` swift
func getBulkDeploymentStatus(input: GetBulkDeploymentStatusInput, completion: @escaping (ClientRuntime.SdkResult<GetBulkDeploymentStatusOutputResponse, GetBulkDeploymentStatusOutputError>) -> Void)
```

### getConnectivityInfo(input:​completion:​)

Retrieves the connectivity information for a core.

``` swift
func getConnectivityInfo(input: GetConnectivityInfoInput, completion: @escaping (ClientRuntime.SdkResult<GetConnectivityInfoOutputResponse, GetConnectivityInfoOutputError>) -> Void)
```

### getConnectorDefinition(input:​completion:​)

Retrieves information about a connector definition.

``` swift
func getConnectorDefinition(input: GetConnectorDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<GetConnectorDefinitionOutputResponse, GetConnectorDefinitionOutputError>) -> Void)
```

### getConnectorDefinitionVersion(input:​completion:​)

Retrieves information about a connector definition version, including the connectors that the version contains. Connectors are prebuilt modules that interact with local infrastructure, device protocols, AWS, and other cloud services.

``` swift
func getConnectorDefinitionVersion(input: GetConnectorDefinitionVersionInput, completion: @escaping (ClientRuntime.SdkResult<GetConnectorDefinitionVersionOutputResponse, GetConnectorDefinitionVersionOutputError>) -> Void)
```

### getCoreDefinition(input:​completion:​)

Retrieves information about a core definition version.

``` swift
func getCoreDefinition(input: GetCoreDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<GetCoreDefinitionOutputResponse, GetCoreDefinitionOutputError>) -> Void)
```

### getCoreDefinitionVersion(input:​completion:​)

Retrieves information about a core definition version.

``` swift
func getCoreDefinitionVersion(input: GetCoreDefinitionVersionInput, completion: @escaping (ClientRuntime.SdkResult<GetCoreDefinitionVersionOutputResponse, GetCoreDefinitionVersionOutputError>) -> Void)
```

### getDeploymentStatus(input:​completion:​)

Returns the status of a deployment.

``` swift
func getDeploymentStatus(input: GetDeploymentStatusInput, completion: @escaping (ClientRuntime.SdkResult<GetDeploymentStatusOutputResponse, GetDeploymentStatusOutputError>) -> Void)
```

### getDeviceDefinition(input:​completion:​)

Retrieves information about a device definition.

``` swift
func getDeviceDefinition(input: GetDeviceDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<GetDeviceDefinitionOutputResponse, GetDeviceDefinitionOutputError>) -> Void)
```

### getDeviceDefinitionVersion(input:​completion:​)

Retrieves information about a device definition version.

``` swift
func getDeviceDefinitionVersion(input: GetDeviceDefinitionVersionInput, completion: @escaping (ClientRuntime.SdkResult<GetDeviceDefinitionVersionOutputResponse, GetDeviceDefinitionVersionOutputError>) -> Void)
```

### getFunctionDefinition(input:​completion:​)

Retrieves information about a Lambda function definition, including its creation time and latest version.

``` swift
func getFunctionDefinition(input: GetFunctionDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<GetFunctionDefinitionOutputResponse, GetFunctionDefinitionOutputError>) -> Void)
```

### getFunctionDefinitionVersion(input:​completion:​)

Retrieves information about a Lambda function definition version, including which Lambda functions are included in the version and their configurations.

``` swift
func getFunctionDefinitionVersion(input: GetFunctionDefinitionVersionInput, completion: @escaping (ClientRuntime.SdkResult<GetFunctionDefinitionVersionOutputResponse, GetFunctionDefinitionVersionOutputError>) -> Void)
```

### getGroup(input:​completion:​)

Retrieves information about a group.

``` swift
func getGroup(input: GetGroupInput, completion: @escaping (ClientRuntime.SdkResult<GetGroupOutputResponse, GetGroupOutputError>) -> Void)
```

### getGroupCertificateAuthority(input:​completion:​)

Retreives the CA associated with a group. Returns the public key of the CA.

``` swift
func getGroupCertificateAuthority(input: GetGroupCertificateAuthorityInput, completion: @escaping (ClientRuntime.SdkResult<GetGroupCertificateAuthorityOutputResponse, GetGroupCertificateAuthorityOutputError>) -> Void)
```

### getGroupCertificateConfiguration(input:​completion:​)

Retrieves the current configuration for the CA used by the group.

``` swift
func getGroupCertificateConfiguration(input: GetGroupCertificateConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetGroupCertificateConfigurationOutputResponse, GetGroupCertificateConfigurationOutputError>) -> Void)
```

### getGroupVersion(input:​completion:​)

Retrieves information about a group version.

``` swift
func getGroupVersion(input: GetGroupVersionInput, completion: @escaping (ClientRuntime.SdkResult<GetGroupVersionOutputResponse, GetGroupVersionOutputError>) -> Void)
```

### getLoggerDefinition(input:​completion:​)

Retrieves information about a logger definition.

``` swift
func getLoggerDefinition(input: GetLoggerDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<GetLoggerDefinitionOutputResponse, GetLoggerDefinitionOutputError>) -> Void)
```

### getLoggerDefinitionVersion(input:​completion:​)

Retrieves information about a logger definition version.

``` swift
func getLoggerDefinitionVersion(input: GetLoggerDefinitionVersionInput, completion: @escaping (ClientRuntime.SdkResult<GetLoggerDefinitionVersionOutputResponse, GetLoggerDefinitionVersionOutputError>) -> Void)
```

### getResourceDefinition(input:​completion:​)

Retrieves information about a resource definition, including its creation time and latest version.

``` swift
func getResourceDefinition(input: GetResourceDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<GetResourceDefinitionOutputResponse, GetResourceDefinitionOutputError>) -> Void)
```

### getResourceDefinitionVersion(input:​completion:​)

Retrieves information about a resource definition version, including which resources are included in the version.

``` swift
func getResourceDefinitionVersion(input: GetResourceDefinitionVersionInput, completion: @escaping (ClientRuntime.SdkResult<GetResourceDefinitionVersionOutputResponse, GetResourceDefinitionVersionOutputError>) -> Void)
```

### getServiceRoleForAccount(input:​completion:​)

Retrieves the service role that is attached to your account.

``` swift
func getServiceRoleForAccount(input: GetServiceRoleForAccountInput, completion: @escaping (ClientRuntime.SdkResult<GetServiceRoleForAccountOutputResponse, GetServiceRoleForAccountOutputError>) -> Void)
```

### getSubscriptionDefinition(input:​completion:​)

Retrieves information about a subscription definition.

``` swift
func getSubscriptionDefinition(input: GetSubscriptionDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<GetSubscriptionDefinitionOutputResponse, GetSubscriptionDefinitionOutputError>) -> Void)
```

### getSubscriptionDefinitionVersion(input:​completion:​)

Retrieves information about a subscription definition version.

``` swift
func getSubscriptionDefinitionVersion(input: GetSubscriptionDefinitionVersionInput, completion: @escaping (ClientRuntime.SdkResult<GetSubscriptionDefinitionVersionOutputResponse, GetSubscriptionDefinitionVersionOutputError>) -> Void)
```

### getThingRuntimeConfiguration(input:​completion:​)

Get the runtime configuration of a thing.

``` swift
func getThingRuntimeConfiguration(input: GetThingRuntimeConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetThingRuntimeConfigurationOutputResponse, GetThingRuntimeConfigurationOutputError>) -> Void)
```

### listBulkDeploymentDetailedReports(input:​completion:​)

Gets a paginated list of the deployments that have been started in a bulk deployment operation, and their current deployment status.

``` swift
func listBulkDeploymentDetailedReports(input: ListBulkDeploymentDetailedReportsInput, completion: @escaping (ClientRuntime.SdkResult<ListBulkDeploymentDetailedReportsOutputResponse, ListBulkDeploymentDetailedReportsOutputError>) -> Void)
```

### listBulkDeployments(input:​completion:​)

Returns a list of bulk deployments.

``` swift
func listBulkDeployments(input: ListBulkDeploymentsInput, completion: @escaping (ClientRuntime.SdkResult<ListBulkDeploymentsOutputResponse, ListBulkDeploymentsOutputError>) -> Void)
```

### listConnectorDefinitions(input:​completion:​)

Retrieves a list of connector definitions.

``` swift
func listConnectorDefinitions(input: ListConnectorDefinitionsInput, completion: @escaping (ClientRuntime.SdkResult<ListConnectorDefinitionsOutputResponse, ListConnectorDefinitionsOutputError>) -> Void)
```

### listConnectorDefinitionVersions(input:​completion:​)

Lists the versions of a connector definition, which are containers for connectors. Connectors run on the Greengrass core and contain built-in integration with local infrastructure, device protocols, AWS, and other cloud services.

``` swift
func listConnectorDefinitionVersions(input: ListConnectorDefinitionVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListConnectorDefinitionVersionsOutputResponse, ListConnectorDefinitionVersionsOutputError>) -> Void)
```

### listCoreDefinitions(input:​completion:​)

Retrieves a list of core definitions.

``` swift
func listCoreDefinitions(input: ListCoreDefinitionsInput, completion: @escaping (ClientRuntime.SdkResult<ListCoreDefinitionsOutputResponse, ListCoreDefinitionsOutputError>) -> Void)
```

### listCoreDefinitionVersions(input:​completion:​)

Lists the versions of a core definition.

``` swift
func listCoreDefinitionVersions(input: ListCoreDefinitionVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListCoreDefinitionVersionsOutputResponse, ListCoreDefinitionVersionsOutputError>) -> Void)
```

### listDeployments(input:​completion:​)

Returns a history of deployments for the group.

``` swift
func listDeployments(input: ListDeploymentsInput, completion: @escaping (ClientRuntime.SdkResult<ListDeploymentsOutputResponse, ListDeploymentsOutputError>) -> Void)
```

### listDeviceDefinitions(input:​completion:​)

Retrieves a list of device definitions.

``` swift
func listDeviceDefinitions(input: ListDeviceDefinitionsInput, completion: @escaping (ClientRuntime.SdkResult<ListDeviceDefinitionsOutputResponse, ListDeviceDefinitionsOutputError>) -> Void)
```

### listDeviceDefinitionVersions(input:​completion:​)

Lists the versions of a device definition.

``` swift
func listDeviceDefinitionVersions(input: ListDeviceDefinitionVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListDeviceDefinitionVersionsOutputResponse, ListDeviceDefinitionVersionsOutputError>) -> Void)
```

### listFunctionDefinitions(input:​completion:​)

Retrieves a list of Lambda function definitions.

``` swift
func listFunctionDefinitions(input: ListFunctionDefinitionsInput, completion: @escaping (ClientRuntime.SdkResult<ListFunctionDefinitionsOutputResponse, ListFunctionDefinitionsOutputError>) -> Void)
```

### listFunctionDefinitionVersions(input:​completion:​)

Lists the versions of a Lambda function definition.

``` swift
func listFunctionDefinitionVersions(input: ListFunctionDefinitionVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListFunctionDefinitionVersionsOutputResponse, ListFunctionDefinitionVersionsOutputError>) -> Void)
```

### listGroupCertificateAuthorities(input:​completion:​)

Retrieves the current CAs for a group.

``` swift
func listGroupCertificateAuthorities(input: ListGroupCertificateAuthoritiesInput, completion: @escaping (ClientRuntime.SdkResult<ListGroupCertificateAuthoritiesOutputResponse, ListGroupCertificateAuthoritiesOutputError>) -> Void)
```

### listGroups(input:​completion:​)

Retrieves a list of groups.

``` swift
func listGroups(input: ListGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListGroupsOutputResponse, ListGroupsOutputError>) -> Void)
```

### listGroupVersions(input:​completion:​)

Lists the versions of a group.

``` swift
func listGroupVersions(input: ListGroupVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListGroupVersionsOutputResponse, ListGroupVersionsOutputError>) -> Void)
```

### listLoggerDefinitions(input:​completion:​)

Retrieves a list of logger definitions.

``` swift
func listLoggerDefinitions(input: ListLoggerDefinitionsInput, completion: @escaping (ClientRuntime.SdkResult<ListLoggerDefinitionsOutputResponse, ListLoggerDefinitionsOutputError>) -> Void)
```

### listLoggerDefinitionVersions(input:​completion:​)

Lists the versions of a logger definition.

``` swift
func listLoggerDefinitionVersions(input: ListLoggerDefinitionVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListLoggerDefinitionVersionsOutputResponse, ListLoggerDefinitionVersionsOutputError>) -> Void)
```

### listResourceDefinitions(input:​completion:​)

Retrieves a list of resource definitions.

``` swift
func listResourceDefinitions(input: ListResourceDefinitionsInput, completion: @escaping (ClientRuntime.SdkResult<ListResourceDefinitionsOutputResponse, ListResourceDefinitionsOutputError>) -> Void)
```

### listResourceDefinitionVersions(input:​completion:​)

Lists the versions of a resource definition.

``` swift
func listResourceDefinitionVersions(input: ListResourceDefinitionVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListResourceDefinitionVersionsOutputResponse, ListResourceDefinitionVersionsOutputError>) -> Void)
```

### listSubscriptionDefinitions(input:​completion:​)

Retrieves a list of subscription definitions.

``` swift
func listSubscriptionDefinitions(input: ListSubscriptionDefinitionsInput, completion: @escaping (ClientRuntime.SdkResult<ListSubscriptionDefinitionsOutputResponse, ListSubscriptionDefinitionsOutputError>) -> Void)
```

### listSubscriptionDefinitionVersions(input:​completion:​)

Lists the versions of a subscription definition.

``` swift
func listSubscriptionDefinitionVersions(input: ListSubscriptionDefinitionVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListSubscriptionDefinitionVersionsOutputResponse, ListSubscriptionDefinitionVersionsOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

Retrieves a list of resource tags for a resource arn.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### resetDeployments(input:​completion:​)

Resets a group's deployments.

``` swift
func resetDeployments(input: ResetDeploymentsInput, completion: @escaping (ClientRuntime.SdkResult<ResetDeploymentsOutputResponse, ResetDeploymentsOutputError>) -> Void)
```

### startBulkDeployment(input:​completion:​)

Deploys multiple groups in one operation. This action starts the bulk deployment of a specified set of group versions. Each group version deployment will be triggered with an adaptive rate that has a fixed upper limit. We recommend that you include an ''X-Amzn-Client-Token'' token in every ''StartBulkDeployment'' request. These requests are idempotent with respect to the token and the request parameters.

``` swift
func startBulkDeployment(input: StartBulkDeploymentInput, completion: @escaping (ClientRuntime.SdkResult<StartBulkDeploymentOutputResponse, StartBulkDeploymentOutputError>) -> Void)
```

### stopBulkDeployment(input:​completion:​)

Stops the execution of a bulk deployment. This action returns a status of ''Stopping'' until the deployment is stopped. You cannot start a new bulk deployment while a previous deployment is in the ''Stopping'' state. This action doesn't rollback completed deployments or cancel pending deployments.

``` swift
func stopBulkDeployment(input: StopBulkDeploymentInput, completion: @escaping (ClientRuntime.SdkResult<StopBulkDeploymentOutputResponse, StopBulkDeploymentOutputError>) -> Void)
```

### tagResource(input:​completion:​)

Adds tags to a Greengrass resource. Valid resources are 'Group', 'ConnectorDefinition', 'CoreDefinition', 'DeviceDefinition', 'FunctionDefinition', 'LoggerDefinition', 'SubscriptionDefinition', 'ResourceDefinition', and 'BulkDeployment'.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:​completion:​)

Remove resource tags from a Greengrass Resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateConnectivityInfo(input:​completion:​)

Updates the connectivity information for the core. Any devices that belong to the group which has this core will receive this information in order to find the location of the core and connect to it.

``` swift
func updateConnectivityInfo(input: UpdateConnectivityInfoInput, completion: @escaping (ClientRuntime.SdkResult<UpdateConnectivityInfoOutputResponse, UpdateConnectivityInfoOutputError>) -> Void)
```

### updateConnectorDefinition(input:​completion:​)

Updates a connector definition.

``` swift
func updateConnectorDefinition(input: UpdateConnectorDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateConnectorDefinitionOutputResponse, UpdateConnectorDefinitionOutputError>) -> Void)
```

### updateCoreDefinition(input:​completion:​)

Updates a core definition.

``` swift
func updateCoreDefinition(input: UpdateCoreDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateCoreDefinitionOutputResponse, UpdateCoreDefinitionOutputError>) -> Void)
```

### updateDeviceDefinition(input:​completion:​)

Updates a device definition.

``` swift
func updateDeviceDefinition(input: UpdateDeviceDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDeviceDefinitionOutputResponse, UpdateDeviceDefinitionOutputError>) -> Void)
```

### updateFunctionDefinition(input:​completion:​)

Updates a Lambda function definition.

``` swift
func updateFunctionDefinition(input: UpdateFunctionDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFunctionDefinitionOutputResponse, UpdateFunctionDefinitionOutputError>) -> Void)
```

### updateGroup(input:​completion:​)

Updates a group.

``` swift
func updateGroup(input: UpdateGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateGroupOutputResponse, UpdateGroupOutputError>) -> Void)
```

### updateGroupCertificateConfiguration(input:​completion:​)

Updates the Certificate expiry time for a group.

``` swift
func updateGroupCertificateConfiguration(input: UpdateGroupCertificateConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateGroupCertificateConfigurationOutputResponse, UpdateGroupCertificateConfigurationOutputError>) -> Void)
```

### updateLoggerDefinition(input:​completion:​)

Updates a logger definition.

``` swift
func updateLoggerDefinition(input: UpdateLoggerDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateLoggerDefinitionOutputResponse, UpdateLoggerDefinitionOutputError>) -> Void)
```

### updateResourceDefinition(input:​completion:​)

Updates a resource definition.

``` swift
func updateResourceDefinition(input: UpdateResourceDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateResourceDefinitionOutputResponse, UpdateResourceDefinitionOutputError>) -> Void)
```

### updateSubscriptionDefinition(input:​completion:​)

Updates a subscription definition.

``` swift
func updateSubscriptionDefinition(input: UpdateSubscriptionDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSubscriptionDefinitionOutputResponse, UpdateSubscriptionDefinitionOutputError>) -> Void)
```

### updateThingRuntimeConfiguration(input:​completion:​)

Updates the runtime configuration of a thing.

``` swift
func updateThingRuntimeConfiguration(input: UpdateThingRuntimeConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateThingRuntimeConfigurationOutputResponse, UpdateThingRuntimeConfigurationOutputError>) -> Void)
```
