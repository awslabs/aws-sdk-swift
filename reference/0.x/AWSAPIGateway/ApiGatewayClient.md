# ApiGatewayClient

``` swift
public class ApiGatewayClient 
```

## Inheritance

[`ApiGatewayClientProtocol`](/aws-sdk-swift/reference/0.x/AWSAPIGateway/ApiGatewayClientProtocol)

## Initializers

### `init(config:)`

``` swift
public init(config: AWSClientRuntime.AWSClientConfiguration) 
```

### `init(region:)`

``` swift
public convenience init(region: Swift.String? = nil) throws 
```

## Properties

### `clientName`

``` swift
public static let clientName = "ApiGatewayClient"
```

## Methods

### `createApiKey(input:completion:)`

Create an \[ApiKey\] resource. [AWS CLI](https://docs.aws.amazon.com/cli/latest/reference/apigateway/create-api-key.html)

``` swift
public func createApiKey(input: CreateApiKeyInput, completion: @escaping (ClientRuntime.SdkResult<CreateApiKeyOutputResponse, CreateApiKeyOutputError>) -> Void)
```

### `createAuthorizer(input:completion:)`

Adds a new \[Authorizer\] resource to an existing \[RestApi\] resource. [AWS CLI](https://docs.aws.amazon.com/cli/latest/reference/apigateway/create-authorizer.html)

``` swift
public func createAuthorizer(input: CreateAuthorizerInput, completion: @escaping (ClientRuntime.SdkResult<CreateAuthorizerOutputResponse, CreateAuthorizerOutputError>) -> Void)
```

### `createBasePathMapping(input:completion:)`

Creates a new \[BasePathMapping\] resource.

``` swift
public func createBasePathMapping(input: CreateBasePathMappingInput, completion: @escaping (ClientRuntime.SdkResult<CreateBasePathMappingOutputResponse, CreateBasePathMappingOutputError>) -> Void)
```

### `createDeployment(input:completion:)`

Creates a \[Deployment\] resource, which makes a specified \[RestApi\] callable over the internet.

``` swift
public func createDeployment(input: CreateDeploymentInput, completion: @escaping (ClientRuntime.SdkResult<CreateDeploymentOutputResponse, CreateDeploymentOutputError>) -> Void)
```

### `createDocumentationPart(input:completion:)`

``` swift
public func createDocumentationPart(input: CreateDocumentationPartInput, completion: @escaping (ClientRuntime.SdkResult<CreateDocumentationPartOutputResponse, CreateDocumentationPartOutputError>) -> Void)
```

### `createDocumentationVersion(input:completion:)`

``` swift
public func createDocumentationVersion(input: CreateDocumentationVersionInput, completion: @escaping (ClientRuntime.SdkResult<CreateDocumentationVersionOutputResponse, CreateDocumentationVersionOutputError>) -> Void)
```

### `createDomainName(input:completion:)`

Creates a new domain name.

``` swift
public func createDomainName(input: CreateDomainNameInput, completion: @escaping (ClientRuntime.SdkResult<CreateDomainNameOutputResponse, CreateDomainNameOutputError>) -> Void)
```

### `createModel(input:completion:)`

Adds a new \[Model\] resource to an existing \[RestApi\] resource.

``` swift
public func createModel(input: CreateModelInput, completion: @escaping (ClientRuntime.SdkResult<CreateModelOutputResponse, CreateModelOutputError>) -> Void)
```

### `createRequestValidator(input:completion:)`

Creates a \[ReqeustValidator\] of a given \[RestApi\].

``` swift
public func createRequestValidator(input: CreateRequestValidatorInput, completion: @escaping (ClientRuntime.SdkResult<CreateRequestValidatorOutputResponse, CreateRequestValidatorOutputError>) -> Void)
```

### `createResource(input:completion:)`

Creates a \[Resource\] resource.

``` swift
public func createResource(input: CreateResourceInput, completion: @escaping (ClientRuntime.SdkResult<CreateResourceOutputResponse, CreateResourceOutputError>) -> Void)
```

### `createRestApi(input:completion:)`

Creates a new \[RestApi\] resource.

``` swift
public func createRestApi(input: CreateRestApiInput, completion: @escaping (ClientRuntime.SdkResult<CreateRestApiOutputResponse, CreateRestApiOutputError>) -> Void)
```

### `createStage(input:completion:)`

Creates a new \[Stage\] resource that references a pre-existing \[Deployment\] for the API.

``` swift
public func createStage(input: CreateStageInput, completion: @escaping (ClientRuntime.SdkResult<CreateStageOutputResponse, CreateStageOutputError>) -> Void)
```

### `createUsagePlan(input:completion:)`

Creates a usage plan with the throttle and quota limits, as well as the associated API stages, specified in the payload.

``` swift
public func createUsagePlan(input: CreateUsagePlanInput, completion: @escaping (ClientRuntime.SdkResult<CreateUsagePlanOutputResponse, CreateUsagePlanOutputError>) -> Void)
```

### `createUsagePlanKey(input:completion:)`

Creates a usage plan key for adding an existing API key to a usage plan.

``` swift
public func createUsagePlanKey(input: CreateUsagePlanKeyInput, completion: @escaping (ClientRuntime.SdkResult<CreateUsagePlanKeyOutputResponse, CreateUsagePlanKeyOutputError>) -> Void)
```

### `createVpcLink(input:completion:)`

Creates a VPC link, under the caller's account in a selected region, in an asynchronous operation that typically takes 2-4 minutes to complete and become operational. The caller must have permissions to create and update VPC Endpoint services.

``` swift
public func createVpcLink(input: CreateVpcLinkInput, completion: @escaping (ClientRuntime.SdkResult<CreateVpcLinkOutputResponse, CreateVpcLinkOutputError>) -> Void)
```

### `deleteApiKey(input:completion:)`

Deletes the \[ApiKey\] resource.

``` swift
public func deleteApiKey(input: DeleteApiKeyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteApiKeyOutputResponse, DeleteApiKeyOutputError>) -> Void)
```

### `deleteAuthorizer(input:completion:)`

Deletes an existing \[Authorizer\] resource. [AWS CLI](https://docs.aws.amazon.com/cli/latest/reference/apigateway/delete-authorizer.html)

``` swift
public func deleteAuthorizer(input: DeleteAuthorizerInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAuthorizerOutputResponse, DeleteAuthorizerOutputError>) -> Void)
```

### `deleteBasePathMapping(input:completion:)`

Deletes the \[BasePathMapping\] resource.

``` swift
public func deleteBasePathMapping(input: DeleteBasePathMappingInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBasePathMappingOutputResponse, DeleteBasePathMappingOutputError>) -> Void)
```

### `deleteClientCertificate(input:completion:)`

Deletes the \[ClientCertificate\] resource.

``` swift
public func deleteClientCertificate(input: DeleteClientCertificateInput, completion: @escaping (ClientRuntime.SdkResult<DeleteClientCertificateOutputResponse, DeleteClientCertificateOutputError>) -> Void)
```

### `deleteDeployment(input:completion:)`

Deletes a \[Deployment\] resource. Deleting a deployment will only succeed if there are no \[Stage\] resources associated with it.

``` swift
public func deleteDeployment(input: DeleteDeploymentInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDeploymentOutputResponse, DeleteDeploymentOutputError>) -> Void)
```

### `deleteDocumentationPart(input:completion:)`

``` swift
public func deleteDocumentationPart(input: DeleteDocumentationPartInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDocumentationPartOutputResponse, DeleteDocumentationPartOutputError>) -> Void)
```

### `deleteDocumentationVersion(input:completion:)`

``` swift
public func deleteDocumentationVersion(input: DeleteDocumentationVersionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDocumentationVersionOutputResponse, DeleteDocumentationVersionOutputError>) -> Void)
```

### `deleteDomainName(input:completion:)`

Deletes the \[DomainName\] resource.

``` swift
public func deleteDomainName(input: DeleteDomainNameInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDomainNameOutputResponse, DeleteDomainNameOutputError>) -> Void)
```

### `deleteGatewayResponse(input:completion:)`

Clears any customization of a \[GatewayResponse\] of a specified response type on the given \[RestApi\] and resets it with the default settings.

``` swift
public func deleteGatewayResponse(input: DeleteGatewayResponseInput, completion: @escaping (ClientRuntime.SdkResult<DeleteGatewayResponseOutputResponse, DeleteGatewayResponseOutputError>) -> Void)
```

### `deleteIntegration(input:completion:)`

Represents a delete integration.

``` swift
public func deleteIntegration(input: DeleteIntegrationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteIntegrationOutputResponse, DeleteIntegrationOutputError>) -> Void)
```

### `deleteIntegrationResponse(input:completion:)`

Represents a delete integration response.

``` swift
public func deleteIntegrationResponse(input: DeleteIntegrationResponseInput, completion: @escaping (ClientRuntime.SdkResult<DeleteIntegrationResponseOutputResponse, DeleteIntegrationResponseOutputError>) -> Void)
```

### `deleteMethod(input:completion:)`

Deletes an existing \[Method\] resource.

``` swift
public func deleteMethod(input: DeleteMethodInput, completion: @escaping (ClientRuntime.SdkResult<DeleteMethodOutputResponse, DeleteMethodOutputError>) -> Void)
```

### `deleteMethodResponse(input:completion:)`

Deletes an existing \[MethodResponse\] resource.

``` swift
public func deleteMethodResponse(input: DeleteMethodResponseInput, completion: @escaping (ClientRuntime.SdkResult<DeleteMethodResponseOutputResponse, DeleteMethodResponseOutputError>) -> Void)
```

### `deleteModel(input:completion:)`

Deletes a model.

``` swift
public func deleteModel(input: DeleteModelInput, completion: @escaping (ClientRuntime.SdkResult<DeleteModelOutputResponse, DeleteModelOutputError>) -> Void)
```

### `deleteRequestValidator(input:completion:)`

Deletes a \[RequestValidator\] of a given \[RestApi\].

``` swift
public func deleteRequestValidator(input: DeleteRequestValidatorInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRequestValidatorOutputResponse, DeleteRequestValidatorOutputError>) -> Void)
```

### `deleteResource(input:completion:)`

Deletes a \[Resource\] resource.

``` swift
public func deleteResource(input: DeleteResourceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteResourceOutputResponse, DeleteResourceOutputError>) -> Void)
```

### `deleteRestApi(input:completion:)`

Deletes the specified API.

``` swift
public func deleteRestApi(input: DeleteRestApiInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRestApiOutputResponse, DeleteRestApiOutputError>) -> Void)
```

### `deleteStage(input:completion:)`

Deletes a \[Stage\] resource.

``` swift
public func deleteStage(input: DeleteStageInput, completion: @escaping (ClientRuntime.SdkResult<DeleteStageOutputResponse, DeleteStageOutputError>) -> Void)
```

### `deleteUsagePlan(input:completion:)`

Deletes a usage plan of a given plan Id.

``` swift
public func deleteUsagePlan(input: DeleteUsagePlanInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUsagePlanOutputResponse, DeleteUsagePlanOutputError>) -> Void)
```

### `deleteUsagePlanKey(input:completion:)`

Deletes a usage plan key and remove the underlying API key from the associated usage plan.

``` swift
public func deleteUsagePlanKey(input: DeleteUsagePlanKeyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUsagePlanKeyOutputResponse, DeleteUsagePlanKeyOutputError>) -> Void)
```

### `deleteVpcLink(input:completion:)`

Deletes an existing \[VpcLink\] of a specified identifier.

``` swift
public func deleteVpcLink(input: DeleteVpcLinkInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVpcLinkOutputResponse, DeleteVpcLinkOutputError>) -> Void)
```

### `flushStageAuthorizersCache(input:completion:)`

Flushes all authorizer cache entries on a stage.

``` swift
public func flushStageAuthorizersCache(input: FlushStageAuthorizersCacheInput, completion: @escaping (ClientRuntime.SdkResult<FlushStageAuthorizersCacheOutputResponse, FlushStageAuthorizersCacheOutputError>) -> Void)
```

### `flushStageCache(input:completion:)`

Flushes a stage's cache.

``` swift
public func flushStageCache(input: FlushStageCacheInput, completion: @escaping (ClientRuntime.SdkResult<FlushStageCacheOutputResponse, FlushStageCacheOutputError>) -> Void)
```

### `generateClientCertificate(input:completion:)`

Generates a \[ClientCertificate\] resource.

``` swift
public func generateClientCertificate(input: GenerateClientCertificateInput, completion: @escaping (ClientRuntime.SdkResult<GenerateClientCertificateOutputResponse, GenerateClientCertificateOutputError>) -> Void)
```

### `getAccount(input:completion:)`

Gets information about the current \[Account\] resource.

``` swift
public func getAccount(input: GetAccountInput, completion: @escaping (ClientRuntime.SdkResult<GetAccountOutputResponse, GetAccountOutputError>) -> Void)
```

### `getApiKey(input:completion:)`

Gets information about the current \[ApiKey\] resource.

``` swift
public func getApiKey(input: GetApiKeyInput, completion: @escaping (ClientRuntime.SdkResult<GetApiKeyOutputResponse, GetApiKeyOutputError>) -> Void)
```

### `getApiKeys(input:completion:)`

Gets information about the current \[ApiKeys\] resource.

``` swift
public func getApiKeys(input: GetApiKeysInput, completion: @escaping (ClientRuntime.SdkResult<GetApiKeysOutputResponse, GetApiKeysOutputError>) -> Void)
```

### `getAuthorizer(input:completion:)`

Describe an existing \[Authorizer\] resource. [AWS CLI](https://docs.aws.amazon.com/cli/latest/reference/apigateway/get-authorizer.html)

``` swift
public func getAuthorizer(input: GetAuthorizerInput, completion: @escaping (ClientRuntime.SdkResult<GetAuthorizerOutputResponse, GetAuthorizerOutputError>) -> Void)
```

### `getAuthorizers(input:completion:)`

Describe an existing \[Authorizers\] resource. [AWS CLI](https://docs.aws.amazon.com/cli/latest/reference/apigateway/get-authorizers.html)

``` swift
public func getAuthorizers(input: GetAuthorizersInput, completion: @escaping (ClientRuntime.SdkResult<GetAuthorizersOutputResponse, GetAuthorizersOutputError>) -> Void)
```

### `getBasePathMapping(input:completion:)`

Describe a \[BasePathMapping\] resource.

``` swift
public func getBasePathMapping(input: GetBasePathMappingInput, completion: @escaping (ClientRuntime.SdkResult<GetBasePathMappingOutputResponse, GetBasePathMappingOutputError>) -> Void)
```

### `getBasePathMappings(input:completion:)`

Represents a collection of \[BasePathMapping\] resources.

``` swift
public func getBasePathMappings(input: GetBasePathMappingsInput, completion: @escaping (ClientRuntime.SdkResult<GetBasePathMappingsOutputResponse, GetBasePathMappingsOutputError>) -> Void)
```

### `getClientCertificate(input:completion:)`

Gets information about the current \[ClientCertificate\] resource.

``` swift
public func getClientCertificate(input: GetClientCertificateInput, completion: @escaping (ClientRuntime.SdkResult<GetClientCertificateOutputResponse, GetClientCertificateOutputError>) -> Void)
```

### `getClientCertificates(input:completion:)`

Gets a collection of \[ClientCertificate\] resources.

``` swift
public func getClientCertificates(input: GetClientCertificatesInput, completion: @escaping (ClientRuntime.SdkResult<GetClientCertificatesOutputResponse, GetClientCertificatesOutputError>) -> Void)
```

### `getDeployment(input:completion:)`

Gets information about a \[Deployment\] resource.

``` swift
public func getDeployment(input: GetDeploymentInput, completion: @escaping (ClientRuntime.SdkResult<GetDeploymentOutputResponse, GetDeploymentOutputError>) -> Void)
```

### `getDeployments(input:completion:)`

Gets information about a \[Deployments\] collection.

``` swift
public func getDeployments(input: GetDeploymentsInput, completion: @escaping (ClientRuntime.SdkResult<GetDeploymentsOutputResponse, GetDeploymentsOutputError>) -> Void)
```

### `getDocumentationPart(input:completion:)`

``` swift
public func getDocumentationPart(input: GetDocumentationPartInput, completion: @escaping (ClientRuntime.SdkResult<GetDocumentationPartOutputResponse, GetDocumentationPartOutputError>) -> Void)
```

### `getDocumentationParts(input:completion:)`

``` swift
public func getDocumentationParts(input: GetDocumentationPartsInput, completion: @escaping (ClientRuntime.SdkResult<GetDocumentationPartsOutputResponse, GetDocumentationPartsOutputError>) -> Void)
```

### `getDocumentationVersion(input:completion:)`

``` swift
public func getDocumentationVersion(input: GetDocumentationVersionInput, completion: @escaping (ClientRuntime.SdkResult<GetDocumentationVersionOutputResponse, GetDocumentationVersionOutputError>) -> Void)
```

### `getDocumentationVersions(input:completion:)`

``` swift
public func getDocumentationVersions(input: GetDocumentationVersionsInput, completion: @escaping (ClientRuntime.SdkResult<GetDocumentationVersionsOutputResponse, GetDocumentationVersionsOutputError>) -> Void)
```

### `getDomainName(input:completion:)`

Represents a domain name that is contained in a simpler, more intuitive URL that can be called.

``` swift
public func getDomainName(input: GetDomainNameInput, completion: @escaping (ClientRuntime.SdkResult<GetDomainNameOutputResponse, GetDomainNameOutputError>) -> Void)
```

### `getDomainNames(input:completion:)`

Represents a collection of \[DomainName\] resources.

``` swift
public func getDomainNames(input: GetDomainNamesInput, completion: @escaping (ClientRuntime.SdkResult<GetDomainNamesOutputResponse, GetDomainNamesOutputError>) -> Void)
```

### `getExport(input:completion:)`

Exports a deployed version of a \[RestApi\] in a specified format.

``` swift
public func getExport(input: GetExportInput, completion: @escaping (ClientRuntime.SdkResult<GetExportOutputResponse, GetExportOutputError>) -> Void)
```

### `getGatewayResponse(input:completion:)`

Gets a \[GatewayResponse\] of a specified response type on the given \[RestApi\].

``` swift
public func getGatewayResponse(input: GetGatewayResponseInput, completion: @escaping (ClientRuntime.SdkResult<GetGatewayResponseOutputResponse, GetGatewayResponseOutputError>) -> Void)
```

### `getGatewayResponses(input:completion:)`

Gets the \[GatewayResponses\] collection on the given \[RestApi\]. If an API developer has not added any definitions for gateway responses, the result will be the API Gateway-generated default \[GatewayResponses\] collection for the supported response types.

``` swift
public func getGatewayResponses(input: GetGatewayResponsesInput, completion: @escaping (ClientRuntime.SdkResult<GetGatewayResponsesOutputResponse, GetGatewayResponsesOutputError>) -> Void)
```

### `getIntegration(input:completion:)`

Get the integration settings.

``` swift
public func getIntegration(input: GetIntegrationInput, completion: @escaping (ClientRuntime.SdkResult<GetIntegrationOutputResponse, GetIntegrationOutputError>) -> Void)
```

### `getIntegrationResponse(input:completion:)`

Represents a get integration response.

``` swift
public func getIntegrationResponse(input: GetIntegrationResponseInput, completion: @escaping (ClientRuntime.SdkResult<GetIntegrationResponseOutputResponse, GetIntegrationResponseOutputError>) -> Void)
```

### `getMethod(input:completion:)`

Describe an existing \[Method\] resource.

``` swift
public func getMethod(input: GetMethodInput, completion: @escaping (ClientRuntime.SdkResult<GetMethodOutputResponse, GetMethodOutputError>) -> Void)
```

### `getMethodResponse(input:completion:)`

Describes a \[MethodResponse\] resource.

``` swift
public func getMethodResponse(input: GetMethodResponseInput, completion: @escaping (ClientRuntime.SdkResult<GetMethodResponseOutputResponse, GetMethodResponseOutputError>) -> Void)
```

### `getModel(input:completion:)`

Describes an existing model defined for a \[RestApi\] resource.

``` swift
public func getModel(input: GetModelInput, completion: @escaping (ClientRuntime.SdkResult<GetModelOutputResponse, GetModelOutputError>) -> Void)
```

### `getModelTemplate(input:completion:)`

Generates a sample mapping template that can be used to transform a payload into the structure of a model.

``` swift
public func getModelTemplate(input: GetModelTemplateInput, completion: @escaping (ClientRuntime.SdkResult<GetModelTemplateOutputResponse, GetModelTemplateOutputError>) -> Void)
```

### `getModels(input:completion:)`

Describes existing \[Models\] defined for a \[RestApi\] resource.

``` swift
public func getModels(input: GetModelsInput, completion: @escaping (ClientRuntime.SdkResult<GetModelsOutputResponse, GetModelsOutputError>) -> Void)
```

### `getRequestValidator(input:completion:)`

Gets a \[RequestValidator\] of a given \[RestApi\].

``` swift
public func getRequestValidator(input: GetRequestValidatorInput, completion: @escaping (ClientRuntime.SdkResult<GetRequestValidatorOutputResponse, GetRequestValidatorOutputError>) -> Void)
```

### `getRequestValidators(input:completion:)`

Gets the \[RequestValidators\] collection of a given \[RestApi\].

``` swift
public func getRequestValidators(input: GetRequestValidatorsInput, completion: @escaping (ClientRuntime.SdkResult<GetRequestValidatorsOutputResponse, GetRequestValidatorsOutputError>) -> Void)
```

### `getResource(input:completion:)`

Lists information about a resource.

``` swift
public func getResource(input: GetResourceInput, completion: @escaping (ClientRuntime.SdkResult<GetResourceOutputResponse, GetResourceOutputError>) -> Void)
```

### `getResources(input:completion:)`

Lists information about a collection of \[Resource\] resources.

``` swift
public func getResources(input: GetResourcesInput, completion: @escaping (ClientRuntime.SdkResult<GetResourcesOutputResponse, GetResourcesOutputError>) -> Void)
```

### `getRestApi(input:completion:)`

Lists the \[RestApi\] resource in the collection.

``` swift
public func getRestApi(input: GetRestApiInput, completion: @escaping (ClientRuntime.SdkResult<GetRestApiOutputResponse, GetRestApiOutputError>) -> Void)
```

### `getRestApis(input:completion:)`

Lists the \[RestApis\] resources for your collection.

``` swift
public func getRestApis(input: GetRestApisInput, completion: @escaping (ClientRuntime.SdkResult<GetRestApisOutputResponse, GetRestApisOutputError>) -> Void)
```

### `getSdk(input:completion:)`

Generates a client SDK for a \[RestApi\] and \[Stage\].

``` swift
public func getSdk(input: GetSdkInput, completion: @escaping (ClientRuntime.SdkResult<GetSdkOutputResponse, GetSdkOutputError>) -> Void)
```

### `getSdkType(input:completion:)`

``` swift
public func getSdkType(input: GetSdkTypeInput, completion: @escaping (ClientRuntime.SdkResult<GetSdkTypeOutputResponse, GetSdkTypeOutputError>) -> Void)
```

### `getSdkTypes(input:completion:)`

``` swift
public func getSdkTypes(input: GetSdkTypesInput, completion: @escaping (ClientRuntime.SdkResult<GetSdkTypesOutputResponse, GetSdkTypesOutputError>) -> Void)
```

### `getStage(input:completion:)`

Gets information about a \[Stage\] resource.

``` swift
public func getStage(input: GetStageInput, completion: @escaping (ClientRuntime.SdkResult<GetStageOutputResponse, GetStageOutputError>) -> Void)
```

### `getStages(input:completion:)`

Gets information about one or more \[Stage\] resources.

``` swift
public func getStages(input: GetStagesInput, completion: @escaping (ClientRuntime.SdkResult<GetStagesOutputResponse, GetStagesOutputError>) -> Void)
```

### `getTags(input:completion:)`

Gets the \[Tags\] collection for a given resource.

``` swift
public func getTags(input: GetTagsInput, completion: @escaping (ClientRuntime.SdkResult<GetTagsOutputResponse, GetTagsOutputError>) -> Void)
```

### `getUsage(input:completion:)`

Gets the usage data of a usage plan in a specified time interval.

``` swift
public func getUsage(input: GetUsageInput, completion: @escaping (ClientRuntime.SdkResult<GetUsageOutputResponse, GetUsageOutputError>) -> Void)
```

### `getUsagePlan(input:completion:)`

Gets a usage plan of a given plan identifier.

``` swift
public func getUsagePlan(input: GetUsagePlanInput, completion: @escaping (ClientRuntime.SdkResult<GetUsagePlanOutputResponse, GetUsagePlanOutputError>) -> Void)
```

### `getUsagePlanKey(input:completion:)`

Gets a usage plan key of a given key identifier.

``` swift
public func getUsagePlanKey(input: GetUsagePlanKeyInput, completion: @escaping (ClientRuntime.SdkResult<GetUsagePlanKeyOutputResponse, GetUsagePlanKeyOutputError>) -> Void)
```

### `getUsagePlanKeys(input:completion:)`

Gets all the usage plan keys representing the API keys added to a specified usage plan.

``` swift
public func getUsagePlanKeys(input: GetUsagePlanKeysInput, completion: @escaping (ClientRuntime.SdkResult<GetUsagePlanKeysOutputResponse, GetUsagePlanKeysOutputError>) -> Void)
```

### `getUsagePlans(input:completion:)`

Gets all the usage plans of the caller's account.

``` swift
public func getUsagePlans(input: GetUsagePlansInput, completion: @escaping (ClientRuntime.SdkResult<GetUsagePlansOutputResponse, GetUsagePlansOutputError>) -> Void)
```

### `getVpcLink(input:completion:)`

Gets a specified VPC link under the caller's account in a region.

``` swift
public func getVpcLink(input: GetVpcLinkInput, completion: @escaping (ClientRuntime.SdkResult<GetVpcLinkOutputResponse, GetVpcLinkOutputError>) -> Void)
```

### `getVpcLinks(input:completion:)`

Gets the \[VpcLinks\] collection under the caller's account in a selected region.

``` swift
public func getVpcLinks(input: GetVpcLinksInput, completion: @escaping (ClientRuntime.SdkResult<GetVpcLinksOutputResponse, GetVpcLinksOutputError>) -> Void)
```

### `importApiKeys(input:completion:)`

Import API keys from an external source, such as a CSV-formatted file.

``` swift
public func importApiKeys(input: ImportApiKeysInput, completion: @escaping (ClientRuntime.SdkResult<ImportApiKeysOutputResponse, ImportApiKeysOutputError>) -> Void)
```

### `importDocumentationParts(input:completion:)`

``` swift
public func importDocumentationParts(input: ImportDocumentationPartsInput, completion: @escaping (ClientRuntime.SdkResult<ImportDocumentationPartsOutputResponse, ImportDocumentationPartsOutputError>) -> Void)
```

### `importRestApi(input:completion:)`

A feature of the API Gateway control service for creating a new API from an external API definition file.

``` swift
public func importRestApi(input: ImportRestApiInput, completion: @escaping (ClientRuntime.SdkResult<ImportRestApiOutputResponse, ImportRestApiOutputError>) -> Void)
```

### `putGatewayResponse(input:completion:)`

Creates a customization of a \[GatewayResponse\] of a specified response type and status code on the given \[RestApi\].

``` swift
public func putGatewayResponse(input: PutGatewayResponseInput, completion: @escaping (ClientRuntime.SdkResult<PutGatewayResponseOutputResponse, PutGatewayResponseOutputError>) -> Void)
```

### `putIntegration(input:completion:)`

Sets up a method's integration.

``` swift
public func putIntegration(input: PutIntegrationInput, completion: @escaping (ClientRuntime.SdkResult<PutIntegrationOutputResponse, PutIntegrationOutputError>) -> Void)
```

### `putIntegrationResponse(input:completion:)`

Represents a put integration.

``` swift
public func putIntegrationResponse(input: PutIntegrationResponseInput, completion: @escaping (ClientRuntime.SdkResult<PutIntegrationResponseOutputResponse, PutIntegrationResponseOutputError>) -> Void)
```

### `putMethod(input:completion:)`

Add a method to an existing \[Resource\] resource.

``` swift
public func putMethod(input: PutMethodInput, completion: @escaping (ClientRuntime.SdkResult<PutMethodOutputResponse, PutMethodOutputError>) -> Void)
```

### `putMethodResponse(input:completion:)`

Adds a \[MethodResponse\] to an existing \[Method\] resource.

``` swift
public func putMethodResponse(input: PutMethodResponseInput, completion: @escaping (ClientRuntime.SdkResult<PutMethodResponseOutputResponse, PutMethodResponseOutputError>) -> Void)
```

### `putRestApi(input:completion:)`

A feature of the API Gateway control service for updating an existing API with an input of external API definitions. The update can take the form of merging the supplied definition into the existing API or overwriting the existing API.

``` swift
public func putRestApi(input: PutRestApiInput, completion: @escaping (ClientRuntime.SdkResult<PutRestApiOutputResponse, PutRestApiOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Adds or updates a tag on a given resource.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `testInvokeAuthorizer(input:completion:)`

Simulate the execution of an \[Authorizer\] in your \[RestApi\] with headers, parameters, and an incoming request body. [Use Lambda Function as Authorizer](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-use-lambda-authorizer.html)[Use Cognito User Pool as Authorizer](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-integrate-with-cognito.html)

``` swift
public func testInvokeAuthorizer(input: TestInvokeAuthorizerInput, completion: @escaping (ClientRuntime.SdkResult<TestInvokeAuthorizerOutputResponse, TestInvokeAuthorizerOutputError>) -> Void)
```

### `testInvokeMethod(input:completion:)`

Simulate the execution of a \[Method\] in your \[RestApi\] with headers, parameters, and an incoming request body.

``` swift
public func testInvokeMethod(input: TestInvokeMethodInput, completion: @escaping (ClientRuntime.SdkResult<TestInvokeMethodOutputResponse, TestInvokeMethodOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes a tag from a given resource.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateAccount(input:completion:)`

Changes information about the current \[Account\] resource.

``` swift
public func updateAccount(input: UpdateAccountInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAccountOutputResponse, UpdateAccountOutputError>) -> Void)
```

### `updateApiKey(input:completion:)`

Changes information about an \[ApiKey\] resource.

``` swift
public func updateApiKey(input: UpdateApiKeyInput, completion: @escaping (ClientRuntime.SdkResult<UpdateApiKeyOutputResponse, UpdateApiKeyOutputError>) -> Void)
```

### `updateAuthorizer(input:completion:)`

Updates an existing \[Authorizer\] resource. [AWS CLI](https://docs.aws.amazon.com/cli/latest/reference/apigateway/update-authorizer.html)

``` swift
public func updateAuthorizer(input: UpdateAuthorizerInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAuthorizerOutputResponse, UpdateAuthorizerOutputError>) -> Void)
```

### `updateBasePathMapping(input:completion:)`

Changes information about the \[BasePathMapping\] resource.

``` swift
public func updateBasePathMapping(input: UpdateBasePathMappingInput, completion: @escaping (ClientRuntime.SdkResult<UpdateBasePathMappingOutputResponse, UpdateBasePathMappingOutputError>) -> Void)
```

### `updateClientCertificate(input:completion:)`

Changes information about an \[ClientCertificate\] resource.

``` swift
public func updateClientCertificate(input: UpdateClientCertificateInput, completion: @escaping (ClientRuntime.SdkResult<UpdateClientCertificateOutputResponse, UpdateClientCertificateOutputError>) -> Void)
```

### `updateDeployment(input:completion:)`

Changes information about a \[Deployment\] resource.

``` swift
public func updateDeployment(input: UpdateDeploymentInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDeploymentOutputResponse, UpdateDeploymentOutputError>) -> Void)
```

### `updateDocumentationPart(input:completion:)`

``` swift
public func updateDocumentationPart(input: UpdateDocumentationPartInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDocumentationPartOutputResponse, UpdateDocumentationPartOutputError>) -> Void)
```

### `updateDocumentationVersion(input:completion:)`

``` swift
public func updateDocumentationVersion(input: UpdateDocumentationVersionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDocumentationVersionOutputResponse, UpdateDocumentationVersionOutputError>) -> Void)
```

### `updateDomainName(input:completion:)`

Changes information about the \[DomainName\] resource.

``` swift
public func updateDomainName(input: UpdateDomainNameInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDomainNameOutputResponse, UpdateDomainNameOutputError>) -> Void)
```

### `updateGatewayResponse(input:completion:)`

Updates a \[GatewayResponse\] of a specified response type on the given \[RestApi\].

``` swift
public func updateGatewayResponse(input: UpdateGatewayResponseInput, completion: @escaping (ClientRuntime.SdkResult<UpdateGatewayResponseOutputResponse, UpdateGatewayResponseOutputError>) -> Void)
```

### `updateIntegration(input:completion:)`

Represents an update integration.

``` swift
public func updateIntegration(input: UpdateIntegrationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateIntegrationOutputResponse, UpdateIntegrationOutputError>) -> Void)
```

### `updateIntegrationResponse(input:completion:)`

Represents an update integration response.

``` swift
public func updateIntegrationResponse(input: UpdateIntegrationResponseInput, completion: @escaping (ClientRuntime.SdkResult<UpdateIntegrationResponseOutputResponse, UpdateIntegrationResponseOutputError>) -> Void)
```

### `updateMethod(input:completion:)`

Updates an existing \[Method\] resource.

``` swift
public func updateMethod(input: UpdateMethodInput, completion: @escaping (ClientRuntime.SdkResult<UpdateMethodOutputResponse, UpdateMethodOutputError>) -> Void)
```

### `updateMethodResponse(input:completion:)`

Updates an existing \[MethodResponse\] resource.

``` swift
public func updateMethodResponse(input: UpdateMethodResponseInput, completion: @escaping (ClientRuntime.SdkResult<UpdateMethodResponseOutputResponse, UpdateMethodResponseOutputError>) -> Void)
```

### `updateModel(input:completion:)`

Changes information about a model.

``` swift
public func updateModel(input: UpdateModelInput, completion: @escaping (ClientRuntime.SdkResult<UpdateModelOutputResponse, UpdateModelOutputError>) -> Void)
```

### `updateRequestValidator(input:completion:)`

Updates a \[RequestValidator\] of a given \[RestApi\].

``` swift
public func updateRequestValidator(input: UpdateRequestValidatorInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRequestValidatorOutputResponse, UpdateRequestValidatorOutputError>) -> Void)
```

### `updateResource(input:completion:)`

Changes information about a \[Resource\] resource.

``` swift
public func updateResource(input: UpdateResourceInput, completion: @escaping (ClientRuntime.SdkResult<UpdateResourceOutputResponse, UpdateResourceOutputError>) -> Void)
```

### `updateRestApi(input:completion:)`

Changes information about the specified API.

``` swift
public func updateRestApi(input: UpdateRestApiInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRestApiOutputResponse, UpdateRestApiOutputError>) -> Void)
```

### `updateStage(input:completion:)`

Changes information about a \[Stage\] resource.

``` swift
public func updateStage(input: UpdateStageInput, completion: @escaping (ClientRuntime.SdkResult<UpdateStageOutputResponse, UpdateStageOutputError>) -> Void)
```

### `updateUsage(input:completion:)`

Grants a temporary extension to the remaining quota of a usage plan associated with a specified API key.

``` swift
public func updateUsage(input: UpdateUsageInput, completion: @escaping (ClientRuntime.SdkResult<UpdateUsageOutputResponse, UpdateUsageOutputError>) -> Void)
```

### `updateUsagePlan(input:completion:)`

Updates a usage plan of a given plan Id.

``` swift
public func updateUsagePlan(input: UpdateUsagePlanInput, completion: @escaping (ClientRuntime.SdkResult<UpdateUsagePlanOutputResponse, UpdateUsagePlanOutputError>) -> Void)
```

### `updateVpcLink(input:completion:)`

Updates an existing \[VpcLink\] of a specified identifier.

``` swift
public func updateVpcLink(input: UpdateVpcLinkInput, completion: @escaping (ClientRuntime.SdkResult<UpdateVpcLinkOutputResponse, UpdateVpcLinkOutputError>) -> Void)
```
