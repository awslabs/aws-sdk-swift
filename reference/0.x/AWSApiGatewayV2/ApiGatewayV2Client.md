# ApiGatewayV2Client

``` swift
public class ApiGatewayV2Client 
```

## Inheritance

[`ApiGatewayV2ClientProtocol`](/aws-sdk-swift/reference/0.x/AWSApiGatewayV2/ApiGatewayV2ClientProtocol)

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
public static let clientName = "ApiGatewayV2Client"
```

## Methods

### `createApi(input:completion:)`

Creates an Api resource.

``` swift
public func createApi(input: CreateApiInput, completion: @escaping (ClientRuntime.SdkResult<CreateApiOutputResponse, CreateApiOutputError>) -> Void)
```

### `createApiMapping(input:completion:)`

Creates an API mapping.

``` swift
public func createApiMapping(input: CreateApiMappingInput, completion: @escaping (ClientRuntime.SdkResult<CreateApiMappingOutputResponse, CreateApiMappingOutputError>) -> Void)
```

### `createAuthorizer(input:completion:)`

Creates an Authorizer for an API.

``` swift
public func createAuthorizer(input: CreateAuthorizerInput, completion: @escaping (ClientRuntime.SdkResult<CreateAuthorizerOutputResponse, CreateAuthorizerOutputError>) -> Void)
```

### `createDeployment(input:completion:)`

Creates a Deployment for an API.

``` swift
public func createDeployment(input: CreateDeploymentInput, completion: @escaping (ClientRuntime.SdkResult<CreateDeploymentOutputResponse, CreateDeploymentOutputError>) -> Void)
```

### `createDomainName(input:completion:)`

Creates a domain name.

``` swift
public func createDomainName(input: CreateDomainNameInput, completion: @escaping (ClientRuntime.SdkResult<CreateDomainNameOutputResponse, CreateDomainNameOutputError>) -> Void)
```

### `createIntegration(input:completion:)`

Creates an Integration.

``` swift
public func createIntegration(input: CreateIntegrationInput, completion: @escaping (ClientRuntime.SdkResult<CreateIntegrationOutputResponse, CreateIntegrationOutputError>) -> Void)
```

### `createIntegrationResponse(input:completion:)`

Creates an IntegrationResponses.

``` swift
public func createIntegrationResponse(input: CreateIntegrationResponseInput, completion: @escaping (ClientRuntime.SdkResult<CreateIntegrationResponseOutputResponse, CreateIntegrationResponseOutputError>) -> Void)
```

### `createModel(input:completion:)`

Creates a Model for an API.

``` swift
public func createModel(input: CreateModelInput, completion: @escaping (ClientRuntime.SdkResult<CreateModelOutputResponse, CreateModelOutputError>) -> Void)
```

### `createRoute(input:completion:)`

Creates a Route for an API.

``` swift
public func createRoute(input: CreateRouteInput, completion: @escaping (ClientRuntime.SdkResult<CreateRouteOutputResponse, CreateRouteOutputError>) -> Void)
```

### `createRouteResponse(input:completion:)`

Creates a RouteResponse for a Route.

``` swift
public func createRouteResponse(input: CreateRouteResponseInput, completion: @escaping (ClientRuntime.SdkResult<CreateRouteResponseOutputResponse, CreateRouteResponseOutputError>) -> Void)
```

### `createStage(input:completion:)`

Creates a Stage for an API.

``` swift
public func createStage(input: CreateStageInput, completion: @escaping (ClientRuntime.SdkResult<CreateStageOutputResponse, CreateStageOutputError>) -> Void)
```

### `createVpcLink(input:completion:)`

Creates a VPC link.

``` swift
public func createVpcLink(input: CreateVpcLinkInput, completion: @escaping (ClientRuntime.SdkResult<CreateVpcLinkOutputResponse, CreateVpcLinkOutputError>) -> Void)
```

### `deleteAccessLogSettings(input:completion:)`

Deletes the AccessLogSettings for a Stage. To disable access logging for a Stage, delete its AccessLogSettings.

``` swift
public func deleteAccessLogSettings(input: DeleteAccessLogSettingsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAccessLogSettingsOutputResponse, DeleteAccessLogSettingsOutputError>) -> Void)
```

### `deleteApi(input:completion:)`

Deletes an Api resource.

``` swift
public func deleteApi(input: DeleteApiInput, completion: @escaping (ClientRuntime.SdkResult<DeleteApiOutputResponse, DeleteApiOutputError>) -> Void)
```

### `deleteApiMapping(input:completion:)`

Deletes an API mapping.

``` swift
public func deleteApiMapping(input: DeleteApiMappingInput, completion: @escaping (ClientRuntime.SdkResult<DeleteApiMappingOutputResponse, DeleteApiMappingOutputError>) -> Void)
```

### `deleteAuthorizer(input:completion:)`

Deletes an Authorizer.

``` swift
public func deleteAuthorizer(input: DeleteAuthorizerInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAuthorizerOutputResponse, DeleteAuthorizerOutputError>) -> Void)
```

### `deleteCorsConfiguration(input:completion:)`

Deletes a CORS configuration.

``` swift
public func deleteCorsConfiguration(input: DeleteCorsConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCorsConfigurationOutputResponse, DeleteCorsConfigurationOutputError>) -> Void)
```

### `deleteDeployment(input:completion:)`

Deletes a Deployment.

``` swift
public func deleteDeployment(input: DeleteDeploymentInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDeploymentOutputResponse, DeleteDeploymentOutputError>) -> Void)
```

### `deleteDomainName(input:completion:)`

Deletes a domain name.

``` swift
public func deleteDomainName(input: DeleteDomainNameInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDomainNameOutputResponse, DeleteDomainNameOutputError>) -> Void)
```

### `deleteIntegration(input:completion:)`

Deletes an Integration.

``` swift
public func deleteIntegration(input: DeleteIntegrationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteIntegrationOutputResponse, DeleteIntegrationOutputError>) -> Void)
```

### `deleteIntegrationResponse(input:completion:)`

Deletes an IntegrationResponses.

``` swift
public func deleteIntegrationResponse(input: DeleteIntegrationResponseInput, completion: @escaping (ClientRuntime.SdkResult<DeleteIntegrationResponseOutputResponse, DeleteIntegrationResponseOutputError>) -> Void)
```

### `deleteModel(input:completion:)`

Deletes a Model.

``` swift
public func deleteModel(input: DeleteModelInput, completion: @escaping (ClientRuntime.SdkResult<DeleteModelOutputResponse, DeleteModelOutputError>) -> Void)
```

### `deleteRoute(input:completion:)`

Deletes a Route.

``` swift
public func deleteRoute(input: DeleteRouteInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRouteOutputResponse, DeleteRouteOutputError>) -> Void)
```

### `deleteRouteRequestParameter(input:completion:)`

Deletes a route request parameter.

``` swift
public func deleteRouteRequestParameter(input: DeleteRouteRequestParameterInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRouteRequestParameterOutputResponse, DeleteRouteRequestParameterOutputError>) -> Void)
```

### `deleteRouteResponse(input:completion:)`

Deletes a RouteResponse.

``` swift
public func deleteRouteResponse(input: DeleteRouteResponseInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRouteResponseOutputResponse, DeleteRouteResponseOutputError>) -> Void)
```

### `deleteRouteSettings(input:completion:)`

Deletes the RouteSettings for a stage.

``` swift
public func deleteRouteSettings(input: DeleteRouteSettingsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRouteSettingsOutputResponse, DeleteRouteSettingsOutputError>) -> Void)
```

### `deleteStage(input:completion:)`

Deletes a Stage.

``` swift
public func deleteStage(input: DeleteStageInput, completion: @escaping (ClientRuntime.SdkResult<DeleteStageOutputResponse, DeleteStageOutputError>) -> Void)
```

### `deleteVpcLink(input:completion:)`

Deletes a VPC link.

``` swift
public func deleteVpcLink(input: DeleteVpcLinkInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVpcLinkOutputResponse, DeleteVpcLinkOutputError>) -> Void)
```

### `exportApi(input:completion:)`

``` swift
public func exportApi(input: ExportApiInput, completion: @escaping (ClientRuntime.SdkResult<ExportApiOutputResponse, ExportApiOutputError>) -> Void)
```

### `getApi(input:completion:)`

Gets an Api resource.

``` swift
public func getApi(input: GetApiInput, completion: @escaping (ClientRuntime.SdkResult<GetApiOutputResponse, GetApiOutputError>) -> Void)
```

### `getApiMapping(input:completion:)`

Gets an API mapping.

``` swift
public func getApiMapping(input: GetApiMappingInput, completion: @escaping (ClientRuntime.SdkResult<GetApiMappingOutputResponse, GetApiMappingOutputError>) -> Void)
```

### `getApiMappings(input:completion:)`

Gets API mappings.

``` swift
public func getApiMappings(input: GetApiMappingsInput, completion: @escaping (ClientRuntime.SdkResult<GetApiMappingsOutputResponse, GetApiMappingsOutputError>) -> Void)
```

### `getApis(input:completion:)`

Gets a collection of Api resources.

``` swift
public func getApis(input: GetApisInput, completion: @escaping (ClientRuntime.SdkResult<GetApisOutputResponse, GetApisOutputError>) -> Void)
```

### `getAuthorizer(input:completion:)`

Gets an Authorizer.

``` swift
public func getAuthorizer(input: GetAuthorizerInput, completion: @escaping (ClientRuntime.SdkResult<GetAuthorizerOutputResponse, GetAuthorizerOutputError>) -> Void)
```

### `getAuthorizers(input:completion:)`

Gets the Authorizers for an API.

``` swift
public func getAuthorizers(input: GetAuthorizersInput, completion: @escaping (ClientRuntime.SdkResult<GetAuthorizersOutputResponse, GetAuthorizersOutputError>) -> Void)
```

### `getDeployment(input:completion:)`

Gets a Deployment.

``` swift
public func getDeployment(input: GetDeploymentInput, completion: @escaping (ClientRuntime.SdkResult<GetDeploymentOutputResponse, GetDeploymentOutputError>) -> Void)
```

### `getDeployments(input:completion:)`

Gets the Deployments for an API.

``` swift
public func getDeployments(input: GetDeploymentsInput, completion: @escaping (ClientRuntime.SdkResult<GetDeploymentsOutputResponse, GetDeploymentsOutputError>) -> Void)
```

### `getDomainName(input:completion:)`

Gets a domain name.

``` swift
public func getDomainName(input: GetDomainNameInput, completion: @escaping (ClientRuntime.SdkResult<GetDomainNameOutputResponse, GetDomainNameOutputError>) -> Void)
```

### `getDomainNames(input:completion:)`

Gets the domain names for an AWS account.

``` swift
public func getDomainNames(input: GetDomainNamesInput, completion: @escaping (ClientRuntime.SdkResult<GetDomainNamesOutputResponse, GetDomainNamesOutputError>) -> Void)
```

### `getIntegration(input:completion:)`

Gets an Integration.

``` swift
public func getIntegration(input: GetIntegrationInput, completion: @escaping (ClientRuntime.SdkResult<GetIntegrationOutputResponse, GetIntegrationOutputError>) -> Void)
```

### `getIntegrationResponse(input:completion:)`

Gets an IntegrationResponses.

``` swift
public func getIntegrationResponse(input: GetIntegrationResponseInput, completion: @escaping (ClientRuntime.SdkResult<GetIntegrationResponseOutputResponse, GetIntegrationResponseOutputError>) -> Void)
```

### `getIntegrationResponses(input:completion:)`

Gets the IntegrationResponses for an Integration.

``` swift
public func getIntegrationResponses(input: GetIntegrationResponsesInput, completion: @escaping (ClientRuntime.SdkResult<GetIntegrationResponsesOutputResponse, GetIntegrationResponsesOutputError>) -> Void)
```

### `getIntegrations(input:completion:)`

Gets the Integrations for an API.

``` swift
public func getIntegrations(input: GetIntegrationsInput, completion: @escaping (ClientRuntime.SdkResult<GetIntegrationsOutputResponse, GetIntegrationsOutputError>) -> Void)
```

### `getModel(input:completion:)`

Gets a Model.

``` swift
public func getModel(input: GetModelInput, completion: @escaping (ClientRuntime.SdkResult<GetModelOutputResponse, GetModelOutputError>) -> Void)
```

### `getModelTemplate(input:completion:)`

Gets a model template.

``` swift
public func getModelTemplate(input: GetModelTemplateInput, completion: @escaping (ClientRuntime.SdkResult<GetModelTemplateOutputResponse, GetModelTemplateOutputError>) -> Void)
```

### `getModels(input:completion:)`

Gets the Models for an API.

``` swift
public func getModels(input: GetModelsInput, completion: @escaping (ClientRuntime.SdkResult<GetModelsOutputResponse, GetModelsOutputError>) -> Void)
```

### `getRoute(input:completion:)`

Gets a Route.

``` swift
public func getRoute(input: GetRouteInput, completion: @escaping (ClientRuntime.SdkResult<GetRouteOutputResponse, GetRouteOutputError>) -> Void)
```

### `getRouteResponse(input:completion:)`

Gets a RouteResponse.

``` swift
public func getRouteResponse(input: GetRouteResponseInput, completion: @escaping (ClientRuntime.SdkResult<GetRouteResponseOutputResponse, GetRouteResponseOutputError>) -> Void)
```

### `getRouteResponses(input:completion:)`

Gets the RouteResponses for a Route.

``` swift
public func getRouteResponses(input: GetRouteResponsesInput, completion: @escaping (ClientRuntime.SdkResult<GetRouteResponsesOutputResponse, GetRouteResponsesOutputError>) -> Void)
```

### `getRoutes(input:completion:)`

Gets the Routes for an API.

``` swift
public func getRoutes(input: GetRoutesInput, completion: @escaping (ClientRuntime.SdkResult<GetRoutesOutputResponse, GetRoutesOutputError>) -> Void)
```

### `getStage(input:completion:)`

Gets a Stage.

``` swift
public func getStage(input: GetStageInput, completion: @escaping (ClientRuntime.SdkResult<GetStageOutputResponse, GetStageOutputError>) -> Void)
```

### `getStages(input:completion:)`

Gets the Stages for an API.

``` swift
public func getStages(input: GetStagesInput, completion: @escaping (ClientRuntime.SdkResult<GetStagesOutputResponse, GetStagesOutputError>) -> Void)
```

### `getTags(input:completion:)`

Gets a collection of Tag resources.

``` swift
public func getTags(input: GetTagsInput, completion: @escaping (ClientRuntime.SdkResult<GetTagsOutputResponse, GetTagsOutputError>) -> Void)
```

### `getVpcLink(input:completion:)`

Gets a VPC link.

``` swift
public func getVpcLink(input: GetVpcLinkInput, completion: @escaping (ClientRuntime.SdkResult<GetVpcLinkOutputResponse, GetVpcLinkOutputError>) -> Void)
```

### `getVpcLinks(input:completion:)`

Gets a collection of VPC links.

``` swift
public func getVpcLinks(input: GetVpcLinksInput, completion: @escaping (ClientRuntime.SdkResult<GetVpcLinksOutputResponse, GetVpcLinksOutputError>) -> Void)
```

### `importApi(input:completion:)`

Imports an API.

``` swift
public func importApi(input: ImportApiInput, completion: @escaping (ClientRuntime.SdkResult<ImportApiOutputResponse, ImportApiOutputError>) -> Void)
```

### `reimportApi(input:completion:)`

Puts an Api resource.

``` swift
public func reimportApi(input: ReimportApiInput, completion: @escaping (ClientRuntime.SdkResult<ReimportApiOutputResponse, ReimportApiOutputError>) -> Void)
```

### `resetAuthorizersCache(input:completion:)`

Resets all authorizer cache entries on a stage. Supported only for HTTP APIs.

``` swift
public func resetAuthorizersCache(input: ResetAuthorizersCacheInput, completion: @escaping (ClientRuntime.SdkResult<ResetAuthorizersCacheOutputResponse, ResetAuthorizersCacheOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Creates a new Tag resource to represent a tag.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Deletes a Tag.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateApi(input:completion:)`

Updates an Api resource.

``` swift
public func updateApi(input: UpdateApiInput, completion: @escaping (ClientRuntime.SdkResult<UpdateApiOutputResponse, UpdateApiOutputError>) -> Void)
```

### `updateApiMapping(input:completion:)`

The API mapping.

``` swift
public func updateApiMapping(input: UpdateApiMappingInput, completion: @escaping (ClientRuntime.SdkResult<UpdateApiMappingOutputResponse, UpdateApiMappingOutputError>) -> Void)
```

### `updateAuthorizer(input:completion:)`

Updates an Authorizer.

``` swift
public func updateAuthorizer(input: UpdateAuthorizerInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAuthorizerOutputResponse, UpdateAuthorizerOutputError>) -> Void)
```

### `updateDeployment(input:completion:)`

Updates a Deployment.

``` swift
public func updateDeployment(input: UpdateDeploymentInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDeploymentOutputResponse, UpdateDeploymentOutputError>) -> Void)
```

### `updateDomainName(input:completion:)`

Updates a domain name.

``` swift
public func updateDomainName(input: UpdateDomainNameInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDomainNameOutputResponse, UpdateDomainNameOutputError>) -> Void)
```

### `updateIntegration(input:completion:)`

Updates an Integration.

``` swift
public func updateIntegration(input: UpdateIntegrationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateIntegrationOutputResponse, UpdateIntegrationOutputError>) -> Void)
```

### `updateIntegrationResponse(input:completion:)`

Updates an IntegrationResponses.

``` swift
public func updateIntegrationResponse(input: UpdateIntegrationResponseInput, completion: @escaping (ClientRuntime.SdkResult<UpdateIntegrationResponseOutputResponse, UpdateIntegrationResponseOutputError>) -> Void)
```

### `updateModel(input:completion:)`

Updates a Model.

``` swift
public func updateModel(input: UpdateModelInput, completion: @escaping (ClientRuntime.SdkResult<UpdateModelOutputResponse, UpdateModelOutputError>) -> Void)
```

### `updateRoute(input:completion:)`

Updates a Route.

``` swift
public func updateRoute(input: UpdateRouteInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRouteOutputResponse, UpdateRouteOutputError>) -> Void)
```

### `updateRouteResponse(input:completion:)`

Updates a RouteResponse.

``` swift
public func updateRouteResponse(input: UpdateRouteResponseInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRouteResponseOutputResponse, UpdateRouteResponseOutputError>) -> Void)
```

### `updateStage(input:completion:)`

Updates a Stage.

``` swift
public func updateStage(input: UpdateStageInput, completion: @escaping (ClientRuntime.SdkResult<UpdateStageOutputResponse, UpdateStageOutputError>) -> Void)
```

### `updateVpcLink(input:completion:)`

Updates a VPC link.

``` swift
public func updateVpcLink(input: UpdateVpcLinkInput, completion: @escaping (ClientRuntime.SdkResult<UpdateVpcLinkOutputResponse, UpdateVpcLinkOutputError>) -> Void)
```
