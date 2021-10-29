# IoTSiteWiseClientProtocol

Welcome to the IoT SiteWise API Reference. IoT SiteWise is an Amazon Web Services service that connects [Industrial Internet of Things (IIoT)](https://en.wikipedia.org/wiki/Internet_of_things#Industrial_applications) devices to the power of the Amazon Web Services Cloud. For more information, see the [IoT SiteWise User Guide](https://docs.aws.amazon.com/iot-sitewise/latest/userguide/). For information about IoT SiteWise quotas, see [Quotas](https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html) in the IoT SiteWise User Guide.

``` swift
public protocol IoTSiteWiseClientProtocol 
```

## Requirements

### associateAssets(input:completion:)

Associates a child asset with the given parent asset through a hierarchy defined in the parent asset's model. For more information, see [Associating assets](https://docs.aws.amazon.com/iot-sitewise/latest/userguide/add-associated-assets.html) in the IoT SiteWise User Guide.

``` swift
func associateAssets(input: AssociateAssetsInput, completion: @escaping (ClientRuntime.SdkResult<AssociateAssetsOutputResponse, AssociateAssetsOutputError>) -> Void)
```

### batchAssociateProjectAssets(input:completion:)

Associates a group (batch) of assets with an IoT SiteWise Monitor project.

``` swift
func batchAssociateProjectAssets(input: BatchAssociateProjectAssetsInput, completion: @escaping (ClientRuntime.SdkResult<BatchAssociateProjectAssetsOutputResponse, BatchAssociateProjectAssetsOutputError>) -> Void)
```

### batchDisassociateProjectAssets(input:completion:)

Disassociates a group (batch) of assets from an IoT SiteWise Monitor project.

``` swift
func batchDisassociateProjectAssets(input: BatchDisassociateProjectAssetsInput, completion: @escaping (ClientRuntime.SdkResult<BatchDisassociateProjectAssetsOutputResponse, BatchDisassociateProjectAssetsOutputError>) -> Void)
```

### batchPutAssetPropertyValue(input:completion:)

Sends a list of asset property values to IoT SiteWise. Each value is a timestamp-quality-value (TQV) data point. For more information, see [Ingesting data using the API](https://docs.aws.amazon.com/iot-sitewise/latest/userguide/ingest-api.html) in the IoT SiteWise User Guide. To identify an asset property, you must specify one of the following:

``` swift
func batchPutAssetPropertyValue(input: BatchPutAssetPropertyValueInput, completion: @escaping (ClientRuntime.SdkResult<BatchPutAssetPropertyValueOutputResponse, BatchPutAssetPropertyValueOutputError>) -> Void)
```

  - The assetId and propertyId of an asset property.

  - A propertyAlias, which is a data stream alias (for example, /company/windfarm/3/turbine/7/temperature). To define an asset property's alias, see [UpdateAssetProperty](https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html).

With respect to Unix epoch time, IoT SiteWise accepts only TQVs that have a timestamp of no more than 7 days in the past and no more than 10 minutes in the future. IoT SiteWise rejects timestamps outside of the inclusive range of \[-7 days, +10 minutes\] and returns a TimestampOutOfRangeException error. For each asset property, IoT SiteWise overwrites TQVs with duplicate timestamps unless the newer TQV has a different quality. For example, if you store a TQV {T1, GOOD, V1}, then storing {T1, GOOD, V2} replaces the existing TQV. IoT SiteWise authorizes access to each BatchPutAssetPropertyValue entry individually. For more information, see [BatchPutAssetPropertyValue authorization](https://docs.aws.amazon.com/iot-sitewise/latest/userguide/security_iam_service-with-iam.html#security_iam_service-with-iam-id-based-policies-batchputassetpropertyvalue-action) in the IoT SiteWise User Guide.

### createAccessPolicy(input:completion:)

Creates an access policy that grants the specified identity (Amazon Web Services SSO user, Amazon Web Services SSO group, or IAM user) access to the specified IoT SiteWise Monitor portal or project resource.

``` swift
func createAccessPolicy(input: CreateAccessPolicyInput, completion: @escaping (ClientRuntime.SdkResult<CreateAccessPolicyOutputResponse, CreateAccessPolicyOutputError>) -> Void)
```

### createAsset(input:completion:)

Creates an asset from an existing asset model. For more information, see [Creating assets](https://docs.aws.amazon.com/iot-sitewise/latest/userguide/create-assets.html) in the IoT SiteWise User Guide.

``` swift
func createAsset(input: CreateAssetInput, completion: @escaping (ClientRuntime.SdkResult<CreateAssetOutputResponse, CreateAssetOutputError>) -> Void)
```

### createAssetModel(input:completion:)

Creates an asset model from specified property and hierarchy definitions. You create assets from asset models. With asset models, you can easily create assets of the same type that have standardized definitions. Each asset created from a model inherits the asset model's property and hierarchy definitions. For more information, see [Defining asset models](https://docs.aws.amazon.com/iot-sitewise/latest/userguide/define-models.html) in the IoT SiteWise User Guide.

``` swift
func createAssetModel(input: CreateAssetModelInput, completion: @escaping (ClientRuntime.SdkResult<CreateAssetModelOutputResponse, CreateAssetModelOutputError>) -> Void)
```

### createDashboard(input:completion:)

Creates a dashboard in an IoT SiteWise Monitor project.

``` swift
func createDashboard(input: CreateDashboardInput, completion: @escaping (ClientRuntime.SdkResult<CreateDashboardOutputResponse, CreateDashboardOutputError>) -> Void)
```

### createGateway(input:completion:)

Creates a gateway, which is a virtual or edge device that delivers industrial data streams from local servers to IoT SiteWise. For more information, see [Ingesting data using a gateway](https://docs.aws.amazon.com/iot-sitewise/latest/userguide/gateway-connector.html) in the IoT SiteWise User Guide.

``` swift
func createGateway(input: CreateGatewayInput, completion: @escaping (ClientRuntime.SdkResult<CreateGatewayOutputResponse, CreateGatewayOutputError>) -> Void)
```

### createPortal(input:completion:)

Creates a portal, which can contain projects and dashboards. IoT SiteWise Monitor uses Amazon Web Services SSO or IAM to authenticate portal users and manage user permissions. Before you can sign in to a new portal, you must add at least one identity to that portal. For more information, see [Adding or removing portal administrators](https://docs.aws.amazon.com/iot-sitewise/latest/userguide/administer-portals.html#portal-change-admins) in the IoT SiteWise User Guide.

``` swift
func createPortal(input: CreatePortalInput, completion: @escaping (ClientRuntime.SdkResult<CreatePortalOutputResponse, CreatePortalOutputError>) -> Void)
```

### createProject(input:completion:)

Creates a project in the specified portal.

``` swift
func createProject(input: CreateProjectInput, completion: @escaping (ClientRuntime.SdkResult<CreateProjectOutputResponse, CreateProjectOutputError>) -> Void)
```

### deleteAccessPolicy(input:completion:)

Deletes an access policy that grants the specified identity access to the specified IoT SiteWise Monitor resource. You can use this operation to revoke access to an IoT SiteWise Monitor resource.

``` swift
func deleteAccessPolicy(input: DeleteAccessPolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAccessPolicyOutputResponse, DeleteAccessPolicyOutputError>) -> Void)
```

### deleteAsset(input:completion:)

Deletes an asset. This action can't be undone. For more information, see [Deleting assets and models](https://docs.aws.amazon.com/iot-sitewise/latest/userguide/delete-assets-and-models.html) in the IoT SiteWise User Guide. You can't delete an asset that's associated to another asset. For more information, see [DisassociateAssets](https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DisassociateAssets.html).

``` swift
func deleteAsset(input: DeleteAssetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAssetOutputResponse, DeleteAssetOutputError>) -> Void)
```

### deleteAssetModel(input:completion:)

Deletes an asset model. This action can't be undone. You must delete all assets created from an asset model before you can delete the model. Also, you can't delete an asset model if a parent asset model exists that contains a property formula expression that depends on the asset model that you want to delete. For more information, see [Deleting assets and models](https://docs.aws.amazon.com/iot-sitewise/latest/userguide/delete-assets-and-models.html) in the IoT SiteWise User Guide.

``` swift
func deleteAssetModel(input: DeleteAssetModelInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAssetModelOutputResponse, DeleteAssetModelOutputError>) -> Void)
```

### deleteDashboard(input:completion:)

Deletes a dashboard from IoT SiteWise Monitor.

``` swift
func deleteDashboard(input: DeleteDashboardInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDashboardOutputResponse, DeleteDashboardOutputError>) -> Void)
```

### deleteGateway(input:completion:)

Deletes a gateway from IoT SiteWise. When you delete a gateway, some of the gateway's files remain in your gateway's file system.

``` swift
func deleteGateway(input: DeleteGatewayInput, completion: @escaping (ClientRuntime.SdkResult<DeleteGatewayOutputResponse, DeleteGatewayOutputError>) -> Void)
```

### deletePortal(input:completion:)

Deletes a portal from IoT SiteWise Monitor.

``` swift
func deletePortal(input: DeletePortalInput, completion: @escaping (ClientRuntime.SdkResult<DeletePortalOutputResponse, DeletePortalOutputError>) -> Void)
```

### deleteProject(input:completion:)

Deletes a project from IoT SiteWise Monitor.

``` swift
func deleteProject(input: DeleteProjectInput, completion: @escaping (ClientRuntime.SdkResult<DeleteProjectOutputResponse, DeleteProjectOutputError>) -> Void)
```

### describeAccessPolicy(input:completion:)

Describes an access policy, which specifies an identity's access to an IoT SiteWise Monitor portal or project.

``` swift
func describeAccessPolicy(input: DescribeAccessPolicyInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAccessPolicyOutputResponse, DescribeAccessPolicyOutputError>) -> Void)
```

### describeAsset(input:completion:)

Retrieves information about an asset.

``` swift
func describeAsset(input: DescribeAssetInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAssetOutputResponse, DescribeAssetOutputError>) -> Void)
```

### describeAssetModel(input:completion:)

Retrieves information about an asset model.

``` swift
func describeAssetModel(input: DescribeAssetModelInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAssetModelOutputResponse, DescribeAssetModelOutputError>) -> Void)
```

### describeAssetProperty(input:completion:)

Retrieves information about an asset property. When you call this operation for an attribute property, this response includes the default attribute value that you define in the asset model. If you update the default value in the model, this operation's response includes the new default value. This operation doesn't return the value of the asset property. To get the value of an asset property, use [GetAssetPropertyValue](https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_GetAssetPropertyValue.html).

``` swift
func describeAssetProperty(input: DescribeAssetPropertyInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAssetPropertyOutputResponse, DescribeAssetPropertyOutputError>) -> Void)
```

### describeDashboard(input:completion:)

Retrieves information about a dashboard.

``` swift
func describeDashboard(input: DescribeDashboardInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDashboardOutputResponse, DescribeDashboardOutputError>) -> Void)
```

### describeDefaultEncryptionConfiguration(input:completion:)

Retrieves information about the default encryption configuration for the Amazon Web Services account in the default or specified Region. For more information, see [Key management](https://docs.aws.amazon.com/iot-sitewise/latest/userguide/key-management.html) in the IoT SiteWise User Guide.

``` swift
func describeDefaultEncryptionConfiguration(input: DescribeDefaultEncryptionConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDefaultEncryptionConfigurationOutputResponse, DescribeDefaultEncryptionConfigurationOutputError>) -> Void)
```

### describeGateway(input:completion:)

Retrieves information about a gateway.

``` swift
func describeGateway(input: DescribeGatewayInput, completion: @escaping (ClientRuntime.SdkResult<DescribeGatewayOutputResponse, DescribeGatewayOutputError>) -> Void)
```

### describeGatewayCapabilityConfiguration(input:completion:)

Retrieves information about a gateway capability configuration. Each gateway capability defines data sources for a gateway. A capability configuration can contain multiple data source configurations. If you define OPC-UA sources for a gateway in the IoT SiteWise console, all of your OPC-UA sources are stored in one capability configuration. To list all capability configurations for a gateway, use [DescribeGateway](https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeGateway.html).

``` swift
func describeGatewayCapabilityConfiguration(input: DescribeGatewayCapabilityConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeGatewayCapabilityConfigurationOutputResponse, DescribeGatewayCapabilityConfigurationOutputError>) -> Void)
```

### describeLoggingOptions(input:completion:)

Retrieves the current IoT SiteWise logging options.

``` swift
func describeLoggingOptions(input: DescribeLoggingOptionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLoggingOptionsOutputResponse, DescribeLoggingOptionsOutputError>) -> Void)
```

### describePortal(input:completion:)

Retrieves information about a portal.

``` swift
func describePortal(input: DescribePortalInput, completion: @escaping (ClientRuntime.SdkResult<DescribePortalOutputResponse, DescribePortalOutputError>) -> Void)
```

### describeProject(input:completion:)

Retrieves information about a project.

``` swift
func describeProject(input: DescribeProjectInput, completion: @escaping (ClientRuntime.SdkResult<DescribeProjectOutputResponse, DescribeProjectOutputError>) -> Void)
```

### describeStorageConfiguration(input:completion:)

Retrieves information about the storage configuration for IoT SiteWise.

``` swift
func describeStorageConfiguration(input: DescribeStorageConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeStorageConfigurationOutputResponse, DescribeStorageConfigurationOutputError>) -> Void)
```

### disassociateAssets(input:completion:)

Disassociates a child asset from the given parent asset through a hierarchy defined in the parent asset's model.

``` swift
func disassociateAssets(input: DisassociateAssetsInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateAssetsOutputResponse, DisassociateAssetsOutputError>) -> Void)
```

### getAssetPropertyAggregates(input:completion:)

Gets aggregated values for an asset property. For more information, see [Querying aggregates](https://docs.aws.amazon.com/iot-sitewise/latest/userguide/query-industrial-data.html#aggregates) in the IoT SiteWise User Guide. To identify an asset property, you must specify one of the following:

``` swift
func getAssetPropertyAggregates(input: GetAssetPropertyAggregatesInput, completion: @escaping (ClientRuntime.SdkResult<GetAssetPropertyAggregatesOutputResponse, GetAssetPropertyAggregatesOutputError>) -> Void)
```

  - The assetId and propertyId of an asset property.

  - A propertyAlias, which is a data stream alias (for example, /company/windfarm/3/turbine/7/temperature). To define an asset property's alias, see [UpdateAssetProperty](https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html).

### getAssetPropertyValue(input:completion:)

Gets an asset property's current value. For more information, see [Querying current values](https://docs.aws.amazon.com/iot-sitewise/latest/userguide/query-industrial-data.html#current-values) in the IoT SiteWise User Guide. To identify an asset property, you must specify one of the following:

``` swift
func getAssetPropertyValue(input: GetAssetPropertyValueInput, completion: @escaping (ClientRuntime.SdkResult<GetAssetPropertyValueOutputResponse, GetAssetPropertyValueOutputError>) -> Void)
```

  - The assetId and propertyId of an asset property.

  - A propertyAlias, which is a data stream alias (for example, /company/windfarm/3/turbine/7/temperature). To define an asset property's alias, see [UpdateAssetProperty](https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html).

### getAssetPropertyValueHistory(input:completion:)

Gets the history of an asset property's values. For more information, see [Querying historical values](https://docs.aws.amazon.com/iot-sitewise/latest/userguide/query-industrial-data.html#historical-values) in the IoT SiteWise User Guide. To identify an asset property, you must specify one of the following:

``` swift
func getAssetPropertyValueHistory(input: GetAssetPropertyValueHistoryInput, completion: @escaping (ClientRuntime.SdkResult<GetAssetPropertyValueHistoryOutputResponse, GetAssetPropertyValueHistoryOutputError>) -> Void)
```

  - The assetId and propertyId of an asset property.

  - A propertyAlias, which is a data stream alias (for example, /company/windfarm/3/turbine/7/temperature). To define an asset property's alias, see [UpdateAssetProperty](https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html).

### getInterpolatedAssetPropertyValues(input:completion:)

Get interpolated values for an asset property for a specified time interval, during a period of time. If your time series is missing data points during the specified time interval, you can use interpolation to estimate the missing data. For example, you can use this operation to return the interpolated temperature values for a wind turbine every 24 hours over a duration of 7 days. To identify an asset property, you must specify one of the following:

``` swift
func getInterpolatedAssetPropertyValues(input: GetInterpolatedAssetPropertyValuesInput, completion: @escaping (ClientRuntime.SdkResult<GetInterpolatedAssetPropertyValuesOutputResponse, GetInterpolatedAssetPropertyValuesOutputError>) -> Void)
```

  - The assetId and propertyId of an asset property.

  - A propertyAlias, which is a data stream alias (for example, /company/windfarm/3/turbine/7/temperature). To define an asset property's alias, see [UpdateAssetProperty](https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html).

### listAccessPolicies(input:completion:)

Retrieves a paginated list of access policies for an identity (an Amazon Web Services SSO user, an Amazon Web Services SSO group, or an IAM user) or an IoT SiteWise Monitor resource (a portal or project).

``` swift
func listAccessPolicies(input: ListAccessPoliciesInput, completion: @escaping (ClientRuntime.SdkResult<ListAccessPoliciesOutputResponse, ListAccessPoliciesOutputError>) -> Void)
```

### listAssetModels(input:completion:)

Retrieves a paginated list of summaries of all asset models.

``` swift
func listAssetModels(input: ListAssetModelsInput, completion: @escaping (ClientRuntime.SdkResult<ListAssetModelsOutputResponse, ListAssetModelsOutputError>) -> Void)
```

### listAssetRelationships(input:completion:)

Retrieves a paginated list of asset relationships for an asset. You can use this operation to identify an asset's root asset and all associated assets between that asset and its root.

``` swift
func listAssetRelationships(input: ListAssetRelationshipsInput, completion: @escaping (ClientRuntime.SdkResult<ListAssetRelationshipsOutputResponse, ListAssetRelationshipsOutputError>) -> Void)
```

### listAssets(input:completion:)

Retrieves a paginated list of asset summaries. You can use this operation to do the following:

``` swift
func listAssets(input: ListAssetsInput, completion: @escaping (ClientRuntime.SdkResult<ListAssetsOutputResponse, ListAssetsOutputError>) -> Void)
```

  - List assets based on a specific asset model.

  - List top-level assets.

You can't use this operation to list all assets. To retrieve summaries for all of your assets, use [ListAssetModels](https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_ListAssetModels.html) to get all of your asset model IDs. Then, use ListAssets to get all assets for each asset model.

### listAssociatedAssets(input:completion:)

Retrieves a paginated list of associated assets. You can use this operation to do the following:

``` swift
func listAssociatedAssets(input: ListAssociatedAssetsInput, completion: @escaping (ClientRuntime.SdkResult<ListAssociatedAssetsOutputResponse, ListAssociatedAssetsOutputError>) -> Void)
```

  - List child assets associated to a parent asset by a hierarchy that you specify.

  - List an asset's parent asset.

### listDashboards(input:completion:)

Retrieves a paginated list of dashboards for an IoT SiteWise Monitor project.

``` swift
func listDashboards(input: ListDashboardsInput, completion: @escaping (ClientRuntime.SdkResult<ListDashboardsOutputResponse, ListDashboardsOutputError>) -> Void)
```

### listGateways(input:completion:)

Retrieves a paginated list of gateways.

``` swift
func listGateways(input: ListGatewaysInput, completion: @escaping (ClientRuntime.SdkResult<ListGatewaysOutputResponse, ListGatewaysOutputError>) -> Void)
```

### listPortals(input:completion:)

Retrieves a paginated list of IoT SiteWise Monitor portals.

``` swift
func listPortals(input: ListPortalsInput, completion: @escaping (ClientRuntime.SdkResult<ListPortalsOutputResponse, ListPortalsOutputError>) -> Void)
```

### listProjectAssets(input:completion:)

Retrieves a paginated list of assets associated with an IoT SiteWise Monitor project.

``` swift
func listProjectAssets(input: ListProjectAssetsInput, completion: @escaping (ClientRuntime.SdkResult<ListProjectAssetsOutputResponse, ListProjectAssetsOutputError>) -> Void)
```

### listProjects(input:completion:)

Retrieves a paginated list of projects for an IoT SiteWise Monitor portal.

``` swift
func listProjects(input: ListProjectsInput, completion: @escaping (ClientRuntime.SdkResult<ListProjectsOutputResponse, ListProjectsOutputError>) -> Void)
```

### listTagsForResource(input:completion:)

Retrieves the list of tags for an IoT SiteWise resource.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### putDefaultEncryptionConfiguration(input:completion:)

Sets the default encryption configuration for the Amazon Web Services account. For more information, see [Key management](https://docs.aws.amazon.com/iot-sitewise/latest/userguide/key-management.html) in the IoT SiteWise User Guide.

``` swift
func putDefaultEncryptionConfiguration(input: PutDefaultEncryptionConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<PutDefaultEncryptionConfigurationOutputResponse, PutDefaultEncryptionConfigurationOutputError>) -> Void)
```

### putLoggingOptions(input:completion:)

Sets logging options for IoT SiteWise.

``` swift
func putLoggingOptions(input: PutLoggingOptionsInput, completion: @escaping (ClientRuntime.SdkResult<PutLoggingOptionsOutputResponse, PutLoggingOptionsOutputError>) -> Void)
```

### putStorageConfiguration(input:completion:)

Configures storage settings for IoT SiteWise.

``` swift
func putStorageConfiguration(input: PutStorageConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<PutStorageConfigurationOutputResponse, PutStorageConfigurationOutputError>) -> Void)
```

### tagResource(input:completion:)

Adds tags to an IoT SiteWise resource. If a tag already exists for the resource, this operation updates the tag's value.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:completion:)

Removes a tag from an IoT SiteWise resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateAccessPolicy(input:completion:)

Updates an existing access policy that specifies an identity's access to an IoT SiteWise Monitor portal or project resource.

``` swift
func updateAccessPolicy(input: UpdateAccessPolicyInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAccessPolicyOutputResponse, UpdateAccessPolicyOutputError>) -> Void)
```

### updateAsset(input:completion:)

Updates an asset's name. For more information, see [Updating assets and models](https://docs.aws.amazon.com/iot-sitewise/latest/userguide/update-assets-and-models.html) in the IoT SiteWise User Guide.

``` swift
func updateAsset(input: UpdateAssetInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAssetOutputResponse, UpdateAssetOutputError>) -> Void)
```

### updateAssetModel(input:completion:)

Updates an asset model and all of the assets that were created from the model. Each asset created from the model inherits the updated asset model's property and hierarchy definitions. For more information, see [Updating assets and models](https://docs.aws.amazon.com/iot-sitewise/latest/userguide/update-assets-and-models.html) in the IoT SiteWise User Guide. This operation overwrites the existing model with the provided model. To avoid deleting your asset model's properties or hierarchies, you must include their IDs and definitions in the updated asset model payload. For more information, see [DescribeAssetModel](https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeAssetModel.html). If you remove a property from an asset model, IoT SiteWise deletes all previous data for that property. If you remove a hierarchy definition from an asset model, IoT SiteWise disassociates every asset associated with that hierarchy. You can't change the type or data type of an existing property.

``` swift
func updateAssetModel(input: UpdateAssetModelInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAssetModelOutputResponse, UpdateAssetModelOutputError>) -> Void)
```

### updateAssetProperty(input:completion:)

Updates an asset property's alias and notification state. This operation overwrites the property's existing alias and notification state. To keep your existing property's alias or notification state, you must include the existing values in the UpdateAssetProperty request. For more information, see [DescribeAssetProperty](https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeAssetProperty.html).

``` swift
func updateAssetProperty(input: UpdateAssetPropertyInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAssetPropertyOutputResponse, UpdateAssetPropertyOutputError>) -> Void)
```

### updateDashboard(input:completion:)

Updates an IoT SiteWise Monitor dashboard.

``` swift
func updateDashboard(input: UpdateDashboardInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDashboardOutputResponse, UpdateDashboardOutputError>) -> Void)
```

### updateGateway(input:completion:)

Updates a gateway's name.

``` swift
func updateGateway(input: UpdateGatewayInput, completion: @escaping (ClientRuntime.SdkResult<UpdateGatewayOutputResponse, UpdateGatewayOutputError>) -> Void)
```

### updateGatewayCapabilityConfiguration(input:completion:)

Updates a gateway capability configuration or defines a new capability configuration. Each gateway capability defines data sources for a gateway. A capability configuration can contain multiple data source configurations. If you define OPC-UA sources for a gateway in the IoT SiteWise console, all of your OPC-UA sources are stored in one capability configuration. To list all capability configurations for a gateway, use [DescribeGateway](https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeGateway.html).

``` swift
func updateGatewayCapabilityConfiguration(input: UpdateGatewayCapabilityConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateGatewayCapabilityConfigurationOutputResponse, UpdateGatewayCapabilityConfigurationOutputError>) -> Void)
```

### updatePortal(input:completion:)

Updates an IoT SiteWise Monitor portal.

``` swift
func updatePortal(input: UpdatePortalInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePortalOutputResponse, UpdatePortalOutputError>) -> Void)
```

### updateProject(input:completion:)

Updates an IoT SiteWise Monitor project.

``` swift
func updateProject(input: UpdateProjectInput, completion: @escaping (ClientRuntime.SdkResult<UpdateProjectOutputResponse, UpdateProjectOutputError>) -> Void)
```
