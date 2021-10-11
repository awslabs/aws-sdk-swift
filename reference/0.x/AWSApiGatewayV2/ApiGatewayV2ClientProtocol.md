# ApiGatewayV2ClientProtocol

Amazon API Gateway V2

``` swift
public protocol ApiGatewayV2ClientProtocol 
```

## Requirements

### createApi(input:​completion:​)

Creates an Api resource.

``` swift
func createApi(input: CreateApiInput, completion: @escaping (ClientRuntime.SdkResult<CreateApiOutputResponse, CreateApiOutputError>) -> Void)
```

### createApiMapping(input:​completion:​)

Creates an API mapping.

``` swift
func createApiMapping(input: CreateApiMappingInput, completion: @escaping (ClientRuntime.SdkResult<CreateApiMappingOutputResponse, CreateApiMappingOutputError>) -> Void)
```

### createAuthorizer(input:​completion:​)

Creates an Authorizer for an API.

``` swift
func createAuthorizer(input: CreateAuthorizerInput, completion: @escaping (ClientRuntime.SdkResult<CreateAuthorizerOutputResponse, CreateAuthorizerOutputError>) -> Void)
```

### createDeployment(input:​completion:​)

Creates a Deployment for an API.

``` swift
func createDeployment(input: CreateDeploymentInput, completion: @escaping (ClientRuntime.SdkResult<CreateDeploymentOutputResponse, CreateDeploymentOutputError>) -> Void)
```

### createDomainName(input:​completion:​)

Creates a domain name.

``` swift
func createDomainName(input: CreateDomainNameInput, completion: @escaping (ClientRuntime.SdkResult<CreateDomainNameOutputResponse, CreateDomainNameOutputError>) -> Void)
```

### createIntegration(input:​completion:​)

Creates an Integration.

``` swift
func createIntegration(input: CreateIntegrationInput, completion: @escaping (ClientRuntime.SdkResult<CreateIntegrationOutputResponse, CreateIntegrationOutputError>) -> Void)
```

### createIntegrationResponse(input:​completion:​)

Creates an IntegrationResponses.

``` swift
func createIntegrationResponse(input: CreateIntegrationResponseInput, completion: @escaping (ClientRuntime.SdkResult<CreateIntegrationResponseOutputResponse, CreateIntegrationResponseOutputError>) -> Void)
```

### createModel(input:​completion:​)

Creates a Model for an API.

``` swift
func createModel(input: CreateModelInput, completion: @escaping (ClientRuntime.SdkResult<CreateModelOutputResponse, CreateModelOutputError>) -> Void)
```

### createRoute(input:​completion:​)

Creates a Route for an API.

``` swift
func createRoute(input: CreateRouteInput, completion: @escaping (ClientRuntime.SdkResult<CreateRouteOutputResponse, CreateRouteOutputError>) -> Void)
```

### createRouteResponse(input:​completion:​)

Creates a RouteResponse for a Route.

``` swift
func createRouteResponse(input: CreateRouteResponseInput, completion: @escaping (ClientRuntime.SdkResult<CreateRouteResponseOutputResponse, CreateRouteResponseOutputError>) -> Void)
```

### createStage(input:​completion:​)

Creates a Stage for an API.

``` swift
func createStage(input: CreateStageInput, completion: @escaping (ClientRuntime.SdkResult<CreateStageOutputResponse, CreateStageOutputError>) -> Void)
```

### createVpcLink(input:​completion:​)

Creates a VPC link.

``` swift
func createVpcLink(input: CreateVpcLinkInput, completion: @escaping (ClientRuntime.SdkResult<CreateVpcLinkOutputResponse, CreateVpcLinkOutputError>) -> Void)
```

### deleteAccessLogSettings(input:​completion:​)

Deletes the AccessLogSettings for a Stage. To disable access logging for a Stage, delete its AccessLogSettings.

``` swift
func deleteAccessLogSettings(input: DeleteAccessLogSettingsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAccessLogSettingsOutputResponse, DeleteAccessLogSettingsOutputError>) -> Void)
```

### deleteApi(input:​completion:​)

Deletes an Api resource.

``` swift
func deleteApi(input: DeleteApiInput, completion: @escaping (ClientRuntime.SdkResult<DeleteApiOutputResponse, DeleteApiOutputError>) -> Void)
```

### deleteApiMapping(input:​completion:​)

Deletes an API mapping.

``` swift
func deleteApiMapping(input: DeleteApiMappingInput, completion: @escaping (ClientRuntime.SdkResult<DeleteApiMappingOutputResponse, DeleteApiMappingOutputError>) -> Void)
```

### deleteAuthorizer(input:​completion:​)

Deletes an Authorizer.

``` swift
func deleteAuthorizer(input: DeleteAuthorizerInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAuthorizerOutputResponse, DeleteAuthorizerOutputError>) -> Void)
```

### deleteCorsConfiguration(input:​completion:​)

Deletes a CORS configuration.

``` swift
func deleteCorsConfiguration(input: DeleteCorsConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCorsConfigurationOutputResponse, DeleteCorsConfigurationOutputError>) -> Void)
```

### deleteDeployment(input:​completion:​)

Deletes a Deployment.

``` swift
func deleteDeployment(input: DeleteDeploymentInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDeploymentOutputResponse, DeleteDeploymentOutputError>) -> Void)
```

### deleteDomainName(input:​completion:​)

Deletes a domain name.

``` swift
func deleteDomainName(input: DeleteDomainNameInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDomainNameOutputResponse, DeleteDomainNameOutputError>) -> Void)
```

### deleteIntegration(input:​completion:​)

Deletes an Integration.

``` swift
func deleteIntegration(input: DeleteIntegrationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteIntegrationOutputResponse, DeleteIntegrationOutputError>) -> Void)
```

### deleteIntegrationResponse(input:​completion:​)

Deletes an IntegrationResponses.

``` swift
func deleteIntegrationResponse(input: DeleteIntegrationResponseInput, completion: @escaping (ClientRuntime.SdkResult<DeleteIntegrationResponseOutputResponse, DeleteIntegrationResponseOutputError>) -> Void)
```

### deleteModel(input:​completion:​)

Deletes a Model.

``` swift
func deleteModel(input: DeleteModelInput, completion: @escaping (ClientRuntime.SdkResult<DeleteModelOutputResponse, DeleteModelOutputError>) -> Void)
```

### deleteRoute(input:​completion:​)

Deletes a Route.

``` swift
func deleteRoute(input: DeleteRouteInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRouteOutputResponse, DeleteRouteOutputError>) -> Void)
```

### deleteRouteRequestParameter(input:​completion:​)

Deletes a route request parameter.

``` swift
func deleteRouteRequestParameter(input: DeleteRouteRequestParameterInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRouteRequestParameterOutputResponse, DeleteRouteRequestParameterOutputError>) -> Void)
```

### deleteRouteResponse(input:​completion:​)

Deletes a RouteResponse.

``` swift
func deleteRouteResponse(input: DeleteRouteResponseInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRouteResponseOutputResponse, DeleteRouteResponseOutputError>) -> Void)
```

### deleteRouteSettings(input:​completion:​)

Deletes the RouteSettings for a stage.

``` swift
func deleteRouteSettings(input: DeleteRouteSettingsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRouteSettingsOutputResponse, DeleteRouteSettingsOutputError>) -> Void)
```

### deleteStage(input:​completion:​)

Deletes a Stage.

``` swift
func deleteStage(input: DeleteStageInput, completion: @escaping (ClientRuntime.SdkResult<DeleteStageOutputResponse, DeleteStageOutputError>) -> Void)
```

### deleteVpcLink(input:​completion:​)

Deletes a VPC link.

``` swift
func deleteVpcLink(input: DeleteVpcLinkInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVpcLinkOutputResponse, DeleteVpcLinkOutputError>) -> Void)
```

### exportApi(input:​completion:​)

``` swift
func exportApi(input: ExportApiInput, completion: @escaping (ClientRuntime.SdkResult<ExportApiOutputResponse, ExportApiOutputError>) -> Void)
```

### getApi(input:​completion:​)

Gets an Api resource.

``` swift
func getApi(input: GetApiInput, completion: @escaping (ClientRuntime.SdkResult<GetApiOutputResponse, GetApiOutputError>) -> Void)
```

### getApiMapping(input:​completion:​)

Gets an API mapping.

``` swift
func getApiMapping(input: GetApiMappingInput, completion: @escaping (ClientRuntime.SdkResult<GetApiMappingOutputResponse, GetApiMappingOutputError>) -> Void)
```

### getApiMappings(input:​completion:​)

Gets API mappings.

``` swift
func getApiMappings(input: GetApiMappingsInput, completion: @escaping (ClientRuntime.SdkResult<GetApiMappingsOutputResponse, GetApiMappingsOutputError>) -> Void)
```

### getApis(input:​completion:​)

Gets a collection of Api resources.

``` swift
func getApis(input: GetApisInput, completion: @escaping (ClientRuntime.SdkResult<GetApisOutputResponse, GetApisOutputError>) -> Void)
```

### getAuthorizer(input:​completion:​)

Gets an Authorizer.

``` swift
func getAuthorizer(input: GetAuthorizerInput, completion: @escaping (ClientRuntime.SdkResult<GetAuthorizerOutputResponse, GetAuthorizerOutputError>) -> Void)
```

### getAuthorizers(input:​completion:​)

Gets the Authorizers for an API.

``` swift
func getAuthorizers(input: GetAuthorizersInput, completion: @escaping (ClientRuntime.SdkResult<GetAuthorizersOutputResponse, GetAuthorizersOutputError>) -> Void)
```

### getDeployment(input:​completion:​)

Gets a Deployment.

``` swift
func getDeployment(input: GetDeploymentInput, completion: @escaping (ClientRuntime.SdkResult<GetDeploymentOutputResponse, GetDeploymentOutputError>) -> Void)
```

### getDeployments(input:​completion:​)

Gets the Deployments for an API.

``` swift
func getDeployments(input: GetDeploymentsInput, completion: @escaping (ClientRuntime.SdkResult<GetDeploymentsOutputResponse, GetDeploymentsOutputError>) -> Void)
```

### getDomainName(input:​completion:​)

Gets a domain name.

``` swift
func getDomainName(input: GetDomainNameInput, completion: @escaping (ClientRuntime.SdkResult<GetDomainNameOutputResponse, GetDomainNameOutputError>) -> Void)
```

### getDomainNames(input:​completion:​)

Gets the domain names for an AWS account.

``` swift
func getDomainNames(input: GetDomainNamesInput, completion: @escaping (ClientRuntime.SdkResult<GetDomainNamesOutputResponse, GetDomainNamesOutputError>) -> Void)
```

### getIntegration(input:​completion:​)

Gets an Integration.

``` swift
func getIntegration(input: GetIntegrationInput, completion: @escaping (ClientRuntime.SdkResult<GetIntegrationOutputResponse, GetIntegrationOutputError>) -> Void)
```

### getIntegrationResponse(input:​completion:​)

Gets an IntegrationResponses.

``` swift
func getIntegrationResponse(input: GetIntegrationResponseInput, completion: @escaping (ClientRuntime.SdkResult<GetIntegrationResponseOutputResponse, GetIntegrationResponseOutputError>) -> Void)
```

### getIntegrationResponses(input:​completion:​)

Gets the IntegrationResponses for an Integration.

``` swift
func getIntegrationResponses(input: GetIntegrationResponsesInput, completion: @escaping (ClientRuntime.SdkResult<GetIntegrationResponsesOutputResponse, GetIntegrationResponsesOutputError>) -> Void)
```

### getIntegrations(input:​completion:​)

Gets the Integrations for an API.

``` swift
func getIntegrations(input: GetIntegrationsInput, completion: @escaping (ClientRuntime.SdkResult<GetIntegrationsOutputResponse, GetIntegrationsOutputError>) -> Void)
```

### getModel(input:​completion:​)

Gets a Model.

``` swift
func getModel(input: GetModelInput, completion: @escaping (ClientRuntime.SdkResult<GetModelOutputResponse, GetModelOutputError>) -> Void)
```

### getModels(input:​completion:​)

Gets the Models for an API.

``` swift
func getModels(input: GetModelsInput, completion: @escaping (ClientRuntime.SdkResult<GetModelsOutputResponse, GetModelsOutputError>) -> Void)
```

### getModelTemplate(input:​completion:​)

Gets a model template.

``` swift
func getModelTemplate(input: GetModelTemplateInput, completion: @escaping (ClientRuntime.SdkResult<GetModelTemplateOutputResponse, GetModelTemplateOutputError>) -> Void)
```

### getRoute(input:​completion:​)

Gets a Route.

``` swift
func getRoute(input: GetRouteInput, completion: @escaping (ClientRuntime.SdkResult<GetRouteOutputResponse, GetRouteOutputError>) -> Void)
```

### getRouteResponse(input:​completion:​)

Gets a RouteResponse.

``` swift
func getRouteResponse(input: GetRouteResponseInput, completion: @escaping (ClientRuntime.SdkResult<GetRouteResponseOutputResponse, GetRouteResponseOutputError>) -> Void)
```

### getRouteResponses(input:​completion:​)

Gets the RouteResponses for a Route.

``` swift
func getRouteResponses(input: GetRouteResponsesInput, completion: @escaping (ClientRuntime.SdkResult<GetRouteResponsesOutputResponse, GetRouteResponsesOutputError>) -> Void)
```

### getRoutes(input:​completion:​)

Gets the Routes for an API.

``` swift
func getRoutes(input: GetRoutesInput, completion: @escaping (ClientRuntime.SdkResult<GetRoutesOutputResponse, GetRoutesOutputError>) -> Void)
```

### getStage(input:​completion:​)

Gets a Stage.

``` swift
func getStage(input: GetStageInput, completion: @escaping (ClientRuntime.SdkResult<GetStageOutputResponse, GetStageOutputError>) -> Void)
```

### getStages(input:​completion:​)

Gets the Stages for an API.

``` swift
func getStages(input: GetStagesInput, completion: @escaping (ClientRuntime.SdkResult<GetStagesOutputResponse, GetStagesOutputError>) -> Void)
```

### getTags(input:​completion:​)

Gets a collection of Tag resources.

``` swift
func getTags(input: GetTagsInput, completion: @escaping (ClientRuntime.SdkResult<GetTagsOutputResponse, GetTagsOutputError>) -> Void)
```

### getVpcLink(input:​completion:​)

Gets a VPC link.

``` swift
func getVpcLink(input: GetVpcLinkInput, completion: @escaping (ClientRuntime.SdkResult<GetVpcLinkOutputResponse, GetVpcLinkOutputError>) -> Void)
```

### getVpcLinks(input:​completion:​)

Gets a collection of VPC links.

``` swift
func getVpcLinks(input: GetVpcLinksInput, completion: @escaping (ClientRuntime.SdkResult<GetVpcLinksOutputResponse, GetVpcLinksOutputError>) -> Void)
```

### importApi(input:​completion:​)

Imports an API.

``` swift
func importApi(input: ImportApiInput, completion: @escaping (ClientRuntime.SdkResult<ImportApiOutputResponse, ImportApiOutputError>) -> Void)
```

### reimportApi(input:​completion:​)

Puts an Api resource.

``` swift
func reimportApi(input: ReimportApiInput, completion: @escaping (ClientRuntime.SdkResult<ReimportApiOutputResponse, ReimportApiOutputError>) -> Void)
```

### resetAuthorizersCache(input:​completion:​)

Resets all authorizer cache entries on a stage. Supported only for HTTP APIs.

``` swift
func resetAuthorizersCache(input: ResetAuthorizersCacheInput, completion: @escaping (ClientRuntime.SdkResult<ResetAuthorizersCacheOutputResponse, ResetAuthorizersCacheOutputError>) -> Void)
```

### tagResource(input:​completion:​)

Creates a new Tag resource to represent a tag.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:​completion:​)

Deletes a Tag.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateApi(input:​completion:​)

Updates an Api resource.

``` swift
func updateApi(input: UpdateApiInput, completion: @escaping (ClientRuntime.SdkResult<UpdateApiOutputResponse, UpdateApiOutputError>) -> Void)
```

### updateApiMapping(input:​completion:​)

The API mapping.

``` swift
func updateApiMapping(input: UpdateApiMappingInput, completion: @escaping (ClientRuntime.SdkResult<UpdateApiMappingOutputResponse, UpdateApiMappingOutputError>) -> Void)
```

### updateAuthorizer(input:​completion:​)

Updates an Authorizer.

``` swift
func updateAuthorizer(input: UpdateAuthorizerInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAuthorizerOutputResponse, UpdateAuthorizerOutputError>) -> Void)
```

### updateDeployment(input:​completion:​)

Updates a Deployment.

``` swift
func updateDeployment(input: UpdateDeploymentInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDeploymentOutputResponse, UpdateDeploymentOutputError>) -> Void)
```

### updateDomainName(input:​completion:​)

Updates a domain name.

``` swift
func updateDomainName(input: UpdateDomainNameInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDomainNameOutputResponse, UpdateDomainNameOutputError>) -> Void)
```

### updateIntegration(input:​completion:​)

Updates an Integration.

``` swift
func updateIntegration(input: UpdateIntegrationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateIntegrationOutputResponse, UpdateIntegrationOutputError>) -> Void)
```

### updateIntegrationResponse(input:​completion:​)

Updates an IntegrationResponses.

``` swift
func updateIntegrationResponse(input: UpdateIntegrationResponseInput, completion: @escaping (ClientRuntime.SdkResult<UpdateIntegrationResponseOutputResponse, UpdateIntegrationResponseOutputError>) -> Void)
```

### updateModel(input:​completion:​)

Updates a Model.

``` swift
func updateModel(input: UpdateModelInput, completion: @escaping (ClientRuntime.SdkResult<UpdateModelOutputResponse, UpdateModelOutputError>) -> Void)
```

### updateRoute(input:​completion:​)

Updates a Route.

``` swift
func updateRoute(input: UpdateRouteInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRouteOutputResponse, UpdateRouteOutputError>) -> Void)
```

### updateRouteResponse(input:​completion:​)

Updates a RouteResponse.

``` swift
func updateRouteResponse(input: UpdateRouteResponseInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRouteResponseOutputResponse, UpdateRouteResponseOutputError>) -> Void)
```

### updateStage(input:​completion:​)

Updates a Stage.

``` swift
func updateStage(input: UpdateStageInput, completion: @escaping (ClientRuntime.SdkResult<UpdateStageOutputResponse, UpdateStageOutputError>) -> Void)
```

### updateVpcLink(input:​completion:​)

Updates a VPC link.

``` swift
func updateVpcLink(input: UpdateVpcLinkInput, completion: @escaping (ClientRuntime.SdkResult<UpdateVpcLinkOutputResponse, UpdateVpcLinkOutputError>) -> Void)
```
