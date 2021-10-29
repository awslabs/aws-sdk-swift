# ServiceCatalogClient

``` swift
public class ServiceCatalogClient 
```

## Inheritance

[`ServiceCatalogClientProtocol`](/aws-sdk-swift/reference/0.x/AWSServiceCatalog/ServiceCatalogClientProtocol)

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
public static let clientName = "ServiceCatalogClient"
```

## Methods

### `acceptPortfolioShare(input:completion:)`

Accepts an offer to share the specified portfolio.

``` swift
public func acceptPortfolioShare(input: AcceptPortfolioShareInput, completion: @escaping (ClientRuntime.SdkResult<AcceptPortfolioShareOutputResponse, AcceptPortfolioShareOutputError>) -> Void)
```

### `associateBudgetWithResource(input:completion:)`

Associates the specified budget with the specified resource.

``` swift
public func associateBudgetWithResource(input: AssociateBudgetWithResourceInput, completion: @escaping (ClientRuntime.SdkResult<AssociateBudgetWithResourceOutputResponse, AssociateBudgetWithResourceOutputError>) -> Void)
```

### `associatePrincipalWithPortfolio(input:completion:)`

Associates the specified principal ARN with the specified portfolio.

``` swift
public func associatePrincipalWithPortfolio(input: AssociatePrincipalWithPortfolioInput, completion: @escaping (ClientRuntime.SdkResult<AssociatePrincipalWithPortfolioOutputResponse, AssociatePrincipalWithPortfolioOutputError>) -> Void)
```

### `associateProductWithPortfolio(input:completion:)`

Associates the specified product with the specified portfolio. A delegated admin is authorized to invoke this command.

``` swift
public func associateProductWithPortfolio(input: AssociateProductWithPortfolioInput, completion: @escaping (ClientRuntime.SdkResult<AssociateProductWithPortfolioOutputResponse, AssociateProductWithPortfolioOutputError>) -> Void)
```

### `associateServiceActionWithProvisioningArtifact(input:completion:)`

Associates a self-service action with a provisioning artifact.

``` swift
public func associateServiceActionWithProvisioningArtifact(input: AssociateServiceActionWithProvisioningArtifactInput, completion: @escaping (ClientRuntime.SdkResult<AssociateServiceActionWithProvisioningArtifactOutputResponse, AssociateServiceActionWithProvisioningArtifactOutputError>) -> Void)
```

### `associateTagOptionWithResource(input:completion:)`

Associate the specified TagOption with the specified portfolio or product.

``` swift
public func associateTagOptionWithResource(input: AssociateTagOptionWithResourceInput, completion: @escaping (ClientRuntime.SdkResult<AssociateTagOptionWithResourceOutputResponse, AssociateTagOptionWithResourceOutputError>) -> Void)
```

### `batchAssociateServiceActionWithProvisioningArtifact(input:completion:)`

Associates multiple self-service actions with provisioning artifacts.

``` swift
public func batchAssociateServiceActionWithProvisioningArtifact(input: BatchAssociateServiceActionWithProvisioningArtifactInput, completion: @escaping (ClientRuntime.SdkResult<BatchAssociateServiceActionWithProvisioningArtifactOutputResponse, BatchAssociateServiceActionWithProvisioningArtifactOutputError>) -> Void)
```

### `batchDisassociateServiceActionFromProvisioningArtifact(input:completion:)`

Disassociates a batch of self-service actions from the specified provisioning artifact.

``` swift
public func batchDisassociateServiceActionFromProvisioningArtifact(input: BatchDisassociateServiceActionFromProvisioningArtifactInput, completion: @escaping (ClientRuntime.SdkResult<BatchDisassociateServiceActionFromProvisioningArtifactOutputResponse, BatchDisassociateServiceActionFromProvisioningArtifactOutputError>) -> Void)
```

### `copyProduct(input:completion:)`

Copies the specified source product to the specified target product or a new product. You can copy a product to the same account or another account. You can copy a product to the same region or another region. This operation is performed asynchronously. To track the progress of the operation, use \[DescribeCopyProductStatus\].

``` swift
public func copyProduct(input: CopyProductInput, completion: @escaping (ClientRuntime.SdkResult<CopyProductOutputResponse, CopyProductOutputError>) -> Void)
```

### `createConstraint(input:completion:)`

Creates a constraint. A delegated admin is authorized to invoke this command.

``` swift
public func createConstraint(input: CreateConstraintInput, completion: @escaping (ClientRuntime.SdkResult<CreateConstraintOutputResponse, CreateConstraintOutputError>) -> Void)
```

### `createPortfolio(input:completion:)`

Creates a portfolio. A delegated admin is authorized to invoke this command.

``` swift
public func createPortfolio(input: CreatePortfolioInput, completion: @escaping (ClientRuntime.SdkResult<CreatePortfolioOutputResponse, CreatePortfolioOutputError>) -> Void)
```

### `createPortfolioShare(input:completion:)`

Shares the specified portfolio with the specified account or organization node. Shares to an organization node can only be created by the management account of an organization or by a delegated administrator. You can share portfolios to an organization, an organizational unit, or a specific account. Note that if a delegated admin is de-registered, they can no longer create portfolio shares. AWSOrganizationsAccess must be enabled in order to create a portfolio share to an organization node. You can't share a shared resource, including portfolios that contain a shared product. If the portfolio share with the specified account or organization node already exists, this action will have no effect and will not return an error. To update an existing share, you must use the  UpdatePortfolioShare API instead.

``` swift
public func createPortfolioShare(input: CreatePortfolioShareInput, completion: @escaping (ClientRuntime.SdkResult<CreatePortfolioShareOutputResponse, CreatePortfolioShareOutputError>) -> Void)
```

### `createProduct(input:completion:)`

Creates a product. A delegated admin is authorized to invoke this command. The user or role that performs this operation must have the cloudformation:GetTemplate IAM policy permission. This policy permission is required when using the ImportFromPhysicalId template source in the information data section.

``` swift
public func createProduct(input: CreateProductInput, completion: @escaping (ClientRuntime.SdkResult<CreateProductOutputResponse, CreateProductOutputError>) -> Void)
```

### `createProvisionedProductPlan(input:completion:)`

Creates a plan. A plan includes the list of resources to be created (when provisioning a new product) or modified (when updating a provisioned product) when the plan is executed. You can create one plan per provisioned product. To create a plan for an existing provisioned product, the product status must be AVAILBLE or TAINTED. To view the resource changes in the change set, use \[DescribeProvisionedProductPlan\]. To create or modify the provisioned product, use \[ExecuteProvisionedProductPlan\].

``` swift
public func createProvisionedProductPlan(input: CreateProvisionedProductPlanInput, completion: @escaping (ClientRuntime.SdkResult<CreateProvisionedProductPlanOutputResponse, CreateProvisionedProductPlanOutputError>) -> Void)
```

### `createProvisioningArtifact(input:completion:)`

Creates a provisioning artifact (also known as a version) for the specified product. You cannot create a provisioning artifact for a product that was shared with you. The user or role that performs this operation must have the cloudformation:GetTemplate IAM policy permission. This policy permission is required when using the ImportFromPhysicalId template source in the information data section.

``` swift
public func createProvisioningArtifact(input: CreateProvisioningArtifactInput, completion: @escaping (ClientRuntime.SdkResult<CreateProvisioningArtifactOutputResponse, CreateProvisioningArtifactOutputError>) -> Void)
```

### `createServiceAction(input:completion:)`

Creates a self-service action.

``` swift
public func createServiceAction(input: CreateServiceActionInput, completion: @escaping (ClientRuntime.SdkResult<CreateServiceActionOutputResponse, CreateServiceActionOutputError>) -> Void)
```

### `createTagOption(input:completion:)`

Creates a TagOption.

``` swift
public func createTagOption(input: CreateTagOptionInput, completion: @escaping (ClientRuntime.SdkResult<CreateTagOptionOutputResponse, CreateTagOptionOutputError>) -> Void)
```

### `deleteConstraint(input:completion:)`

Deletes the specified constraint. A delegated admin is authorized to invoke this command.

``` swift
public func deleteConstraint(input: DeleteConstraintInput, completion: @escaping (ClientRuntime.SdkResult<DeleteConstraintOutputResponse, DeleteConstraintOutputError>) -> Void)
```

### `deletePortfolio(input:completion:)`

Deletes the specified portfolio. You cannot delete a portfolio if it was shared with you or if it has associated products, users, constraints, or shared accounts. A delegated admin is authorized to invoke this command.

``` swift
public func deletePortfolio(input: DeletePortfolioInput, completion: @escaping (ClientRuntime.SdkResult<DeletePortfolioOutputResponse, DeletePortfolioOutputError>) -> Void)
```

### `deletePortfolioShare(input:completion:)`

Stops sharing the specified portfolio with the specified account or organization node. Shares to an organization node can only be deleted by the management account of an organization or by a delegated administrator. Note that if a delegated admin is de-registered, portfolio shares created from that account are removed.

``` swift
public func deletePortfolioShare(input: DeletePortfolioShareInput, completion: @escaping (ClientRuntime.SdkResult<DeletePortfolioShareOutputResponse, DeletePortfolioShareOutputError>) -> Void)
```

### `deleteProduct(input:completion:)`

Deletes the specified product. You cannot delete a product if it was shared with you or is associated with a portfolio. A delegated admin is authorized to invoke this command.

``` swift
public func deleteProduct(input: DeleteProductInput, completion: @escaping (ClientRuntime.SdkResult<DeleteProductOutputResponse, DeleteProductOutputError>) -> Void)
```

### `deleteProvisionedProductPlan(input:completion:)`

Deletes the specified plan.

``` swift
public func deleteProvisionedProductPlan(input: DeleteProvisionedProductPlanInput, completion: @escaping (ClientRuntime.SdkResult<DeleteProvisionedProductPlanOutputResponse, DeleteProvisionedProductPlanOutputError>) -> Void)
```

### `deleteProvisioningArtifact(input:completion:)`

Deletes the specified provisioning artifact (also known as a version) for the specified product. You cannot delete a provisioning artifact associated with a product that was shared with you. You cannot delete the last provisioning artifact for a product, because a product must have at least one provisioning artifact.

``` swift
public func deleteProvisioningArtifact(input: DeleteProvisioningArtifactInput, completion: @escaping (ClientRuntime.SdkResult<DeleteProvisioningArtifactOutputResponse, DeleteProvisioningArtifactOutputError>) -> Void)
```

### `deleteServiceAction(input:completion:)`

Deletes a self-service action.

``` swift
public func deleteServiceAction(input: DeleteServiceActionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteServiceActionOutputResponse, DeleteServiceActionOutputError>) -> Void)
```

### `deleteTagOption(input:completion:)`

Deletes the specified TagOption. You cannot delete a TagOption if it is associated with a product or portfolio.

``` swift
public func deleteTagOption(input: DeleteTagOptionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTagOptionOutputResponse, DeleteTagOptionOutputError>) -> Void)
```

### `describeConstraint(input:completion:)`

Gets information about the specified constraint.

``` swift
public func describeConstraint(input: DescribeConstraintInput, completion: @escaping (ClientRuntime.SdkResult<DescribeConstraintOutputResponse, DescribeConstraintOutputError>) -> Void)
```

### `describeCopyProductStatus(input:completion:)`

Gets the status of the specified copy product operation.

``` swift
public func describeCopyProductStatus(input: DescribeCopyProductStatusInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCopyProductStatusOutputResponse, DescribeCopyProductStatusOutputError>) -> Void)
```

### `describePortfolio(input:completion:)`

Gets information about the specified portfolio. A delegated admin is authorized to invoke this command.

``` swift
public func describePortfolio(input: DescribePortfolioInput, completion: @escaping (ClientRuntime.SdkResult<DescribePortfolioOutputResponse, DescribePortfolioOutputError>) -> Void)
```

### `describePortfolioShareStatus(input:completion:)`

Gets the status of the specified portfolio share operation. This API can only be called by the management account in the organization or by a delegated admin.

``` swift
public func describePortfolioShareStatus(input: DescribePortfolioShareStatusInput, completion: @escaping (ClientRuntime.SdkResult<DescribePortfolioShareStatusOutputResponse, DescribePortfolioShareStatusOutputError>) -> Void)
```

### `describePortfolioShares(input:completion:)`

Returns a summary of each of the portfolio shares that were created for the specified portfolio. You can use this API to determine which accounts or organizational nodes this portfolio have been shared, whether the recipient entity has imported the share, and whether TagOptions are included with the share. The PortfolioId and Type parameters are both required.

``` swift
public func describePortfolioShares(input: DescribePortfolioSharesInput, completion: @escaping (ClientRuntime.SdkResult<DescribePortfolioSharesOutputResponse, DescribePortfolioSharesOutputError>) -> Void)
```

### `describeProduct(input:completion:)`

Gets information about the specified product.

``` swift
public func describeProduct(input: DescribeProductInput, completion: @escaping (ClientRuntime.SdkResult<DescribeProductOutputResponse, DescribeProductOutputError>) -> Void)
```

### `describeProductAsAdmin(input:completion:)`

Gets information about the specified product. This operation is run with administrator access.

``` swift
public func describeProductAsAdmin(input: DescribeProductAsAdminInput, completion: @escaping (ClientRuntime.SdkResult<DescribeProductAsAdminOutputResponse, DescribeProductAsAdminOutputError>) -> Void)
```

### `describeProductView(input:completion:)`

Gets information about the specified product.

``` swift
public func describeProductView(input: DescribeProductViewInput, completion: @escaping (ClientRuntime.SdkResult<DescribeProductViewOutputResponse, DescribeProductViewOutputError>) -> Void)
```

### `describeProvisionedProduct(input:completion:)`

Gets information about the specified provisioned product.

``` swift
public func describeProvisionedProduct(input: DescribeProvisionedProductInput, completion: @escaping (ClientRuntime.SdkResult<DescribeProvisionedProductOutputResponse, DescribeProvisionedProductOutputError>) -> Void)
```

### `describeProvisionedProductPlan(input:completion:)`

Gets information about the resource changes for the specified plan.

``` swift
public func describeProvisionedProductPlan(input: DescribeProvisionedProductPlanInput, completion: @escaping (ClientRuntime.SdkResult<DescribeProvisionedProductPlanOutputResponse, DescribeProvisionedProductPlanOutputError>) -> Void)
```

### `describeProvisioningArtifact(input:completion:)`

Gets information about the specified provisioning artifact (also known as a version) for the specified product.

``` swift
public func describeProvisioningArtifact(input: DescribeProvisioningArtifactInput, completion: @escaping (ClientRuntime.SdkResult<DescribeProvisioningArtifactOutputResponse, DescribeProvisioningArtifactOutputError>) -> Void)
```

### `describeProvisioningParameters(input:completion:)`

Gets information about the configuration required to provision the specified product using the specified provisioning artifact. If the output contains a TagOption key with an empty list of values, there is a TagOption conflict for that key. The end user cannot take action to fix the conflict, and launch is not blocked. In subsequent calls to \[ProvisionProduct\], do not include conflicted TagOption keys as tags, or this causes the error "Parameter validation failed: Missing required parameter in Tags\[N\]:Value". Tag the provisioned product with the value sc-tagoption-conflict-portfolioId-productId.

``` swift
public func describeProvisioningParameters(input: DescribeProvisioningParametersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeProvisioningParametersOutputResponse, DescribeProvisioningParametersOutputError>) -> Void)
```

### `describeRecord(input:completion:)`

Gets information about the specified request operation. Use this operation after calling a request operation (for example, \[ProvisionProduct\], \[TerminateProvisionedProduct\], or \[UpdateProvisionedProduct\]). If a provisioned product was transferred to a new owner using \[UpdateProvisionedProductProperties\], the new owner will be able to describe all past records for that product. The previous owner will no longer be able to describe the records, but will be able to use \[ListRecordHistory\] to see the product's history from when he was the owner.

``` swift
public func describeRecord(input: DescribeRecordInput, completion: @escaping (ClientRuntime.SdkResult<DescribeRecordOutputResponse, DescribeRecordOutputError>) -> Void)
```

### `describeServiceAction(input:completion:)`

Describes a self-service action.

``` swift
public func describeServiceAction(input: DescribeServiceActionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeServiceActionOutputResponse, DescribeServiceActionOutputError>) -> Void)
```

### `describeServiceActionExecutionParameters(input:completion:)`

Finds the default parameters for a specific self-service action on a specific provisioned product and returns a map of the results to the user.

``` swift
public func describeServiceActionExecutionParameters(input: DescribeServiceActionExecutionParametersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeServiceActionExecutionParametersOutputResponse, DescribeServiceActionExecutionParametersOutputError>) -> Void)
```

### `describeTagOption(input:completion:)`

Gets information about the specified TagOption.

``` swift
public func describeTagOption(input: DescribeTagOptionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTagOptionOutputResponse, DescribeTagOptionOutputError>) -> Void)
```

### `disableAWSOrganizationsAccess(input:completion:)`

Disable portfolio sharing through AWS Organizations feature. This feature will not delete your current shares but it will prevent you from creating new shares throughout your organization. Current shares will not be in sync with your organization structure if it changes after calling this API. This API can only be called by the management account in the organization. This API can't be invoked if there are active delegated administrators in the organization. Note that a delegated administrator is not authorized to invoke DisableAWSOrganizationsAccess.

``` swift
public func disableAWSOrganizationsAccess(input: DisableAWSOrganizationsAccessInput, completion: @escaping (ClientRuntime.SdkResult<DisableAWSOrganizationsAccessOutputResponse, DisableAWSOrganizationsAccessOutputError>) -> Void)
```

### `disassociateBudgetFromResource(input:completion:)`

Disassociates the specified budget from the specified resource.

``` swift
public func disassociateBudgetFromResource(input: DisassociateBudgetFromResourceInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateBudgetFromResourceOutputResponse, DisassociateBudgetFromResourceOutputError>) -> Void)
```

### `disassociatePrincipalFromPortfolio(input:completion:)`

Disassociates a previously associated principal ARN from a specified portfolio.

``` swift
public func disassociatePrincipalFromPortfolio(input: DisassociatePrincipalFromPortfolioInput, completion: @escaping (ClientRuntime.SdkResult<DisassociatePrincipalFromPortfolioOutputResponse, DisassociatePrincipalFromPortfolioOutputError>) -> Void)
```

### `disassociateProductFromPortfolio(input:completion:)`

Disassociates the specified product from the specified portfolio. A delegated admin is authorized to invoke this command.

``` swift
public func disassociateProductFromPortfolio(input: DisassociateProductFromPortfolioInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateProductFromPortfolioOutputResponse, DisassociateProductFromPortfolioOutputError>) -> Void)
```

### `disassociateServiceActionFromProvisioningArtifact(input:completion:)`

Disassociates the specified self-service action association from the specified provisioning artifact.

``` swift
public func disassociateServiceActionFromProvisioningArtifact(input: DisassociateServiceActionFromProvisioningArtifactInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateServiceActionFromProvisioningArtifactOutputResponse, DisassociateServiceActionFromProvisioningArtifactOutputError>) -> Void)
```

### `disassociateTagOptionFromResource(input:completion:)`

Disassociates the specified TagOption from the specified resource.

``` swift
public func disassociateTagOptionFromResource(input: DisassociateTagOptionFromResourceInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateTagOptionFromResourceOutputResponse, DisassociateTagOptionFromResourceOutputError>) -> Void)
```

### `enableAWSOrganizationsAccess(input:completion:)`

Enable portfolio sharing feature through AWS Organizations. This API will allow Service Catalog to receive updates on your organization in order to sync your shares with the current structure. This API can only be called by the management account in the organization. By calling this API Service Catalog will make a call to organizations:EnableAWSServiceAccess on your behalf so that your shares can be in sync with any changes in your AWS Organizations structure. Note that a delegated administrator is not authorized to invoke EnableAWSOrganizationsAccess.

``` swift
public func enableAWSOrganizationsAccess(input: EnableAWSOrganizationsAccessInput, completion: @escaping (ClientRuntime.SdkResult<EnableAWSOrganizationsAccessOutputResponse, EnableAWSOrganizationsAccessOutputError>) -> Void)
```

### `executeProvisionedProductPlan(input:completion:)`

Provisions or modifies a product based on the resource changes for the specified plan.

``` swift
public func executeProvisionedProductPlan(input: ExecuteProvisionedProductPlanInput, completion: @escaping (ClientRuntime.SdkResult<ExecuteProvisionedProductPlanOutputResponse, ExecuteProvisionedProductPlanOutputError>) -> Void)
```

### `executeProvisionedProductServiceAction(input:completion:)`

Executes a self-service action against a provisioned product.

``` swift
public func executeProvisionedProductServiceAction(input: ExecuteProvisionedProductServiceActionInput, completion: @escaping (ClientRuntime.SdkResult<ExecuteProvisionedProductServiceActionOutputResponse, ExecuteProvisionedProductServiceActionOutputError>) -> Void)
```

### `getAWSOrganizationsAccessStatus(input:completion:)`

Get the Access Status for AWS Organization portfolio share feature. This API can only be called by the management account in the organization or by a delegated admin.

``` swift
public func getAWSOrganizationsAccessStatus(input: GetAWSOrganizationsAccessStatusInput, completion: @escaping (ClientRuntime.SdkResult<GetAWSOrganizationsAccessStatusOutputResponse, GetAWSOrganizationsAccessStatusOutputError>) -> Void)
```

### `getProvisionedProductOutputs(input:completion:)`

This API takes either a ProvisonedProductId or a ProvisionedProductName, along with a list of one or more output keys, and responds with the key/value pairs of those outputs.

``` swift
public func getProvisionedProductOutputs(input: GetProvisionedProductOutputsInput, completion: @escaping (ClientRuntime.SdkResult<GetProvisionedProductOutputsOutputResponse, GetProvisionedProductOutputsOutputError>) -> Void)
```

### `importAsProvisionedProduct(input:completion:)`

Requests the import of a resource as a Service Catalog provisioned product that is associated to a Service Catalog product and provisioning artifact. Once imported, all supported Service Catalog governance actions are supported on the provisioned product. Resource import only supports CloudFormation stack ARNs. CloudFormation StackSets and non-root nested stacks are not supported. The CloudFormation stack must have one of the following statuses to be imported: CREATE\_COMPLETE, UPDATE\_COMPLETE, UPDATE\_ROLLBACK\_COMPLETE, IMPORT\_COMPLETE, IMPORT\_ROLLBACK\_COMPLETE. Import of the resource requires that the CloudFormation stack template matches the associated Service Catalog product provisioning artifact. The user or role that performs this operation must have the cloudformation:GetTemplate and cloudformation:DescribeStacks IAM policy permissions.

``` swift
public func importAsProvisionedProduct(input: ImportAsProvisionedProductInput, completion: @escaping (ClientRuntime.SdkResult<ImportAsProvisionedProductOutputResponse, ImportAsProvisionedProductOutputError>) -> Void)
```

### `listAcceptedPortfolioShares(input:completion:)`

Lists all portfolios for which sharing was accepted by this account.

``` swift
public func listAcceptedPortfolioShares(input: ListAcceptedPortfolioSharesInput, completion: @escaping (ClientRuntime.SdkResult<ListAcceptedPortfolioSharesOutputResponse, ListAcceptedPortfolioSharesOutputError>) -> Void)
```

### `listBudgetsForResource(input:completion:)`

Lists all the budgets associated to the specified resource.

``` swift
public func listBudgetsForResource(input: ListBudgetsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListBudgetsForResourceOutputResponse, ListBudgetsForResourceOutputError>) -> Void)
```

### `listConstraintsForPortfolio(input:completion:)`

Lists the constraints for the specified portfolio and product.

``` swift
public func listConstraintsForPortfolio(input: ListConstraintsForPortfolioInput, completion: @escaping (ClientRuntime.SdkResult<ListConstraintsForPortfolioOutputResponse, ListConstraintsForPortfolioOutputError>) -> Void)
```

### `listLaunchPaths(input:completion:)`

Lists the paths to the specified product. A path is how the user has access to a specified product, and is necessary when provisioning a product. A path also determines the constraints put on the product.

``` swift
public func listLaunchPaths(input: ListLaunchPathsInput, completion: @escaping (ClientRuntime.SdkResult<ListLaunchPathsOutputResponse, ListLaunchPathsOutputError>) -> Void)
```

### `listOrganizationPortfolioAccess(input:completion:)`

Lists the organization nodes that have access to the specified portfolio. This API can only be called by the management account in the organization or by a delegated admin. If a delegated admin is de-registered, they can no longer perform this operation.

``` swift
public func listOrganizationPortfolioAccess(input: ListOrganizationPortfolioAccessInput, completion: @escaping (ClientRuntime.SdkResult<ListOrganizationPortfolioAccessOutputResponse, ListOrganizationPortfolioAccessOutputError>) -> Void)
```

### `listPortfolioAccess(input:completion:)`

Lists the account IDs that have access to the specified portfolio. A delegated admin can list the accounts that have access to the shared portfolio. Note that if a delegated admin is de-registered, they can no longer perform this operation.

``` swift
public func listPortfolioAccess(input: ListPortfolioAccessInput, completion: @escaping (ClientRuntime.SdkResult<ListPortfolioAccessOutputResponse, ListPortfolioAccessOutputError>) -> Void)
```

### `listPortfolios(input:completion:)`

Lists all portfolios in the catalog.

``` swift
public func listPortfolios(input: ListPortfoliosInput, completion: @escaping (ClientRuntime.SdkResult<ListPortfoliosOutputResponse, ListPortfoliosOutputError>) -> Void)
```

### `listPortfoliosForProduct(input:completion:)`

Lists all portfolios that the specified product is associated with.

``` swift
public func listPortfoliosForProduct(input: ListPortfoliosForProductInput, completion: @escaping (ClientRuntime.SdkResult<ListPortfoliosForProductOutputResponse, ListPortfoliosForProductOutputError>) -> Void)
```

### `listPrincipalsForPortfolio(input:completion:)`

Lists all principal ARNs associated with the specified portfolio.

``` swift
public func listPrincipalsForPortfolio(input: ListPrincipalsForPortfolioInput, completion: @escaping (ClientRuntime.SdkResult<ListPrincipalsForPortfolioOutputResponse, ListPrincipalsForPortfolioOutputError>) -> Void)
```

### `listProvisionedProductPlans(input:completion:)`

Lists the plans for the specified provisioned product or all plans to which the user has access.

``` swift
public func listProvisionedProductPlans(input: ListProvisionedProductPlansInput, completion: @escaping (ClientRuntime.SdkResult<ListProvisionedProductPlansOutputResponse, ListProvisionedProductPlansOutputError>) -> Void)
```

### `listProvisioningArtifacts(input:completion:)`

Lists all provisioning artifacts (also known as versions) for the specified product.

``` swift
public func listProvisioningArtifacts(input: ListProvisioningArtifactsInput, completion: @escaping (ClientRuntime.SdkResult<ListProvisioningArtifactsOutputResponse, ListProvisioningArtifactsOutputError>) -> Void)
```

### `listProvisioningArtifactsForServiceAction(input:completion:)`

Lists all provisioning artifacts (also known as versions) for the specified self-service action.

``` swift
public func listProvisioningArtifactsForServiceAction(input: ListProvisioningArtifactsForServiceActionInput, completion: @escaping (ClientRuntime.SdkResult<ListProvisioningArtifactsForServiceActionOutputResponse, ListProvisioningArtifactsForServiceActionOutputError>) -> Void)
```

### `listRecordHistory(input:completion:)`

Lists the specified requests or all performed requests.

``` swift
public func listRecordHistory(input: ListRecordHistoryInput, completion: @escaping (ClientRuntime.SdkResult<ListRecordHistoryOutputResponse, ListRecordHistoryOutputError>) -> Void)
```

### `listResourcesForTagOption(input:completion:)`

Lists the resources associated with the specified TagOption.

``` swift
public func listResourcesForTagOption(input: ListResourcesForTagOptionInput, completion: @escaping (ClientRuntime.SdkResult<ListResourcesForTagOptionOutputResponse, ListResourcesForTagOptionOutputError>) -> Void)
```

### `listServiceActions(input:completion:)`

Lists all self-service actions.

``` swift
public func listServiceActions(input: ListServiceActionsInput, completion: @escaping (ClientRuntime.SdkResult<ListServiceActionsOutputResponse, ListServiceActionsOutputError>) -> Void)
```

### `listServiceActionsForProvisioningArtifact(input:completion:)`

Returns a paginated list of self-service actions associated with the specified Product ID and Provisioning Artifact ID.

``` swift
public func listServiceActionsForProvisioningArtifact(input: ListServiceActionsForProvisioningArtifactInput, completion: @escaping (ClientRuntime.SdkResult<ListServiceActionsForProvisioningArtifactOutputResponse, ListServiceActionsForProvisioningArtifactOutputError>) -> Void)
```

### `listStackInstancesForProvisionedProduct(input:completion:)`

Returns summary information about stack instances that are associated with the specified CFN\_STACKSET type provisioned product. You can filter for stack instances that are associated with a specific AWS account name or region.

``` swift
public func listStackInstancesForProvisionedProduct(input: ListStackInstancesForProvisionedProductInput, completion: @escaping (ClientRuntime.SdkResult<ListStackInstancesForProvisionedProductOutputResponse, ListStackInstancesForProvisionedProductOutputError>) -> Void)
```

### `listTagOptions(input:completion:)`

Lists the specified TagOptions or all TagOptions.

``` swift
public func listTagOptions(input: ListTagOptionsInput, completion: @escaping (ClientRuntime.SdkResult<ListTagOptionsOutputResponse, ListTagOptionsOutputError>) -> Void)
```

### `provisionProduct(input:completion:)`

Provisions the specified product. A provisioned product is a resourced instance of a product. For example, provisioning a product based on a CloudFormation template launches a CloudFormation stack and its underlying resources. You can check the status of this request using \[DescribeRecord\]. If the request contains a tag key with an empty list of values, there is a tag conflict for that key. Do not include conflicted keys as tags, or this causes the error "Parameter validation failed: Missing required parameter in Tags\[N\]:Value".

``` swift
public func provisionProduct(input: ProvisionProductInput, completion: @escaping (ClientRuntime.SdkResult<ProvisionProductOutputResponse, ProvisionProductOutputError>) -> Void)
```

### `rejectPortfolioShare(input:completion:)`

Rejects an offer to share the specified portfolio.

``` swift
public func rejectPortfolioShare(input: RejectPortfolioShareInput, completion: @escaping (ClientRuntime.SdkResult<RejectPortfolioShareOutputResponse, RejectPortfolioShareOutputError>) -> Void)
```

### `scanProvisionedProducts(input:completion:)`

Lists the provisioned products that are available (not terminated). To use additional filtering, see \[SearchProvisionedProducts\].

``` swift
public func scanProvisionedProducts(input: ScanProvisionedProductsInput, completion: @escaping (ClientRuntime.SdkResult<ScanProvisionedProductsOutputResponse, ScanProvisionedProductsOutputError>) -> Void)
```

### `searchProducts(input:completion:)`

Gets information about the products to which the caller has access.

``` swift
public func searchProducts(input: SearchProductsInput, completion: @escaping (ClientRuntime.SdkResult<SearchProductsOutputResponse, SearchProductsOutputError>) -> Void)
```

### `searchProductsAsAdmin(input:completion:)`

Gets information about the products for the specified portfolio or all products.

``` swift
public func searchProductsAsAdmin(input: SearchProductsAsAdminInput, completion: @escaping (ClientRuntime.SdkResult<SearchProductsAsAdminOutputResponse, SearchProductsAsAdminOutputError>) -> Void)
```

### `searchProvisionedProducts(input:completion:)`

Gets information about the provisioned products that meet the specified criteria.

``` swift
public func searchProvisionedProducts(input: SearchProvisionedProductsInput, completion: @escaping (ClientRuntime.SdkResult<SearchProvisionedProductsOutputResponse, SearchProvisionedProductsOutputError>) -> Void)
```

### `terminateProvisionedProduct(input:completion:)`

Terminates the specified provisioned product. This operation does not delete any records associated with the provisioned product. You can check the status of this request using \[DescribeRecord\].

``` swift
public func terminateProvisionedProduct(input: TerminateProvisionedProductInput, completion: @escaping (ClientRuntime.SdkResult<TerminateProvisionedProductOutputResponse, TerminateProvisionedProductOutputError>) -> Void)
```

### `updateConstraint(input:completion:)`

Updates the specified constraint.

``` swift
public func updateConstraint(input: UpdateConstraintInput, completion: @escaping (ClientRuntime.SdkResult<UpdateConstraintOutputResponse, UpdateConstraintOutputError>) -> Void)
```

### `updatePortfolio(input:completion:)`

Updates the specified portfolio. You cannot update a product that was shared with you.

``` swift
public func updatePortfolio(input: UpdatePortfolioInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePortfolioOutputResponse, UpdatePortfolioOutputError>) -> Void)
```

### `updatePortfolioShare(input:completion:)`

Updates the specified portfolio share. You can use this API to enable or disable TagOptions sharing for an existing portfolio share. The portfolio share cannot be updated if the  CreatePortfolioShare operation is IN\_PROGRESS, as the share is not available to recipient entities. In this case, you must wait for the portfolio share to be COMPLETED. You must provide the accountId or organization node in the input, but not both. If the portfolio is shared to both an external account and an organization node, and both shares need to be updated, you must invoke UpdatePortfolioShare separately for each share type. This API cannot be used for removing the portfolio share. You must use DeletePortfolioShare API for that action.

``` swift
public func updatePortfolioShare(input: UpdatePortfolioShareInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePortfolioShareOutputResponse, UpdatePortfolioShareOutputError>) -> Void)
```

### `updateProduct(input:completion:)`

Updates the specified product.

``` swift
public func updateProduct(input: UpdateProductInput, completion: @escaping (ClientRuntime.SdkResult<UpdateProductOutputResponse, UpdateProductOutputError>) -> Void)
```

### `updateProvisionedProduct(input:completion:)`

Requests updates to the configuration of the specified provisioned product. If there are tags associated with the object, they cannot be updated or added. Depending on the specific updates requested, this operation can update with no interruption, with some interruption, or replace the provisioned product entirely. You can check the status of this request using \[DescribeRecord\].

``` swift
public func updateProvisionedProduct(input: UpdateProvisionedProductInput, completion: @escaping (ClientRuntime.SdkResult<UpdateProvisionedProductOutputResponse, UpdateProvisionedProductOutputError>) -> Void)
```

### `updateProvisionedProductProperties(input:completion:)`

Requests updates to the properties of the specified provisioned product.

``` swift
public func updateProvisionedProductProperties(input: UpdateProvisionedProductPropertiesInput, completion: @escaping (ClientRuntime.SdkResult<UpdateProvisionedProductPropertiesOutputResponse, UpdateProvisionedProductPropertiesOutputError>) -> Void)
```

### `updateProvisioningArtifact(input:completion:)`

Updates the specified provisioning artifact (also known as a version) for the specified product. You cannot update a provisioning artifact for a product that was shared with you.

``` swift
public func updateProvisioningArtifact(input: UpdateProvisioningArtifactInput, completion: @escaping (ClientRuntime.SdkResult<UpdateProvisioningArtifactOutputResponse, UpdateProvisioningArtifactOutputError>) -> Void)
```

### `updateServiceAction(input:completion:)`

Updates a self-service action.

``` swift
public func updateServiceAction(input: UpdateServiceActionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateServiceActionOutputResponse, UpdateServiceActionOutputError>) -> Void)
```

### `updateTagOption(input:completion:)`

Updates the specified TagOption.

``` swift
public func updateTagOption(input: UpdateTagOptionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateTagOptionOutputResponse, UpdateTagOptionOutputError>) -> Void)
```
