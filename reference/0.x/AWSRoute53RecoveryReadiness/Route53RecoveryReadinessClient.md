# Route53RecoveryReadinessClient

``` swift
public class Route53RecoveryReadinessClient 
```

## Inheritance

[`Route53RecoveryReadinessClientProtocol`](/aws-sdk-swift/reference/0.x/AWSRoute53RecoveryReadiness/Route53RecoveryReadinessClientProtocol)

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

### `createCell(input:completion:)`

Creates a new Cell.

``` swift
public func createCell(input: CreateCellInput, completion: @escaping (ClientRuntime.SdkResult<CreateCellOutputResponse, CreateCellOutputError>) -> Void)
```

### `createCrossAccountAuthorization(input:completion:)`

Create a new cross account readiness authorization.

``` swift
public func createCrossAccountAuthorization(input: CreateCrossAccountAuthorizationInput, completion: @escaping (ClientRuntime.SdkResult<CreateCrossAccountAuthorizationOutputResponse, CreateCrossAccountAuthorizationOutputError>) -> Void)
```

### `createReadinessCheck(input:completion:)`

Creates a new Readiness Check.

``` swift
public func createReadinessCheck(input: CreateReadinessCheckInput, completion: @escaping (ClientRuntime.SdkResult<CreateReadinessCheckOutputResponse, CreateReadinessCheckOutputError>) -> Void)
```

### `createRecoveryGroup(input:completion:)`

Creates a new Recovery Group.

``` swift
public func createRecoveryGroup(input: CreateRecoveryGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateRecoveryGroupOutputResponse, CreateRecoveryGroupOutputError>) -> Void)
```

### `createResourceSet(input:completion:)`

Creates a new Resource Set.

``` swift
public func createResourceSet(input: CreateResourceSetInput, completion: @escaping (ClientRuntime.SdkResult<CreateResourceSetOutputResponse, CreateResourceSetOutputError>) -> Void)
```

### `deleteCell(input:completion:)`

Deletes an existing Cell.

``` swift
public func deleteCell(input: DeleteCellInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCellOutputResponse, DeleteCellOutputError>) -> Void)
```

### `deleteCrossAccountAuthorization(input:completion:)`

Delete cross account readiness authorization

``` swift
public func deleteCrossAccountAuthorization(input: DeleteCrossAccountAuthorizationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCrossAccountAuthorizationOutputResponse, DeleteCrossAccountAuthorizationOutputError>) -> Void)
```

### `deleteReadinessCheck(input:completion:)`

Deletes an existing Readiness Check.

``` swift
public func deleteReadinessCheck(input: DeleteReadinessCheckInput, completion: @escaping (ClientRuntime.SdkResult<DeleteReadinessCheckOutputResponse, DeleteReadinessCheckOutputError>) -> Void)
```

### `deleteRecoveryGroup(input:completion:)`

Deletes an existing Recovery Group.

``` swift
public func deleteRecoveryGroup(input: DeleteRecoveryGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRecoveryGroupOutputResponse, DeleteRecoveryGroupOutputError>) -> Void)
```

### `deleteResourceSet(input:completion:)`

Deletes an existing Resource Set.

``` swift
public func deleteResourceSet(input: DeleteResourceSetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteResourceSetOutputResponse, DeleteResourceSetOutputError>) -> Void)
```

### `getArchitectureRecommendations(input:completion:)`

Returns a collection of recommendations to improve resilliance and readiness check quality for a Recovery Group.

``` swift
public func getArchitectureRecommendations(input: GetArchitectureRecommendationsInput, completion: @escaping (ClientRuntime.SdkResult<GetArchitectureRecommendationsOutputResponse, GetArchitectureRecommendationsOutputError>) -> Void)
```

### `getCell(input:completion:)`

Returns information about a Cell.

``` swift
public func getCell(input: GetCellInput, completion: @escaping (ClientRuntime.SdkResult<GetCellOutputResponse, GetCellOutputError>) -> Void)
```

### `getCellReadinessSummary(input:completion:)`

Returns information about readiness of a Cell.

``` swift
public func getCellReadinessSummary(input: GetCellReadinessSummaryInput, completion: @escaping (ClientRuntime.SdkResult<GetCellReadinessSummaryOutputResponse, GetCellReadinessSummaryOutputError>) -> Void)
```

### `getReadinessCheck(input:completion:)`

Returns information about a ReadinessCheck.

``` swift
public func getReadinessCheck(input: GetReadinessCheckInput, completion: @escaping (ClientRuntime.SdkResult<GetReadinessCheckOutputResponse, GetReadinessCheckOutputError>) -> Void)
```

### `getReadinessCheckResourceStatus(input:completion:)`

Returns detailed information about the status of an individual resource within a Readiness Check's Resource Set.

``` swift
public func getReadinessCheckResourceStatus(input: GetReadinessCheckResourceStatusInput, completion: @escaping (ClientRuntime.SdkResult<GetReadinessCheckResourceStatusOutputResponse, GetReadinessCheckResourceStatusOutputError>) -> Void)
```

### `getReadinessCheckStatus(input:completion:)`

Returns information about the status of a Readiness Check.

``` swift
public func getReadinessCheckStatus(input: GetReadinessCheckStatusInput, completion: @escaping (ClientRuntime.SdkResult<GetReadinessCheckStatusOutputResponse, GetReadinessCheckStatusOutputError>) -> Void)
```

### `getRecoveryGroup(input:completion:)`

Returns information about a Recovery Group.

``` swift
public func getRecoveryGroup(input: GetRecoveryGroupInput, completion: @escaping (ClientRuntime.SdkResult<GetRecoveryGroupOutputResponse, GetRecoveryGroupOutputError>) -> Void)
```

### `getRecoveryGroupReadinessSummary(input:completion:)`

Returns information about a Recovery Group.

``` swift
public func getRecoveryGroupReadinessSummary(input: GetRecoveryGroupReadinessSummaryInput, completion: @escaping (ClientRuntime.SdkResult<GetRecoveryGroupReadinessSummaryOutputResponse, GetRecoveryGroupReadinessSummaryOutputError>) -> Void)
```

### `getResourceSet(input:completion:)`

Returns information about a Resource Set.

``` swift
public func getResourceSet(input: GetResourceSetInput, completion: @escaping (ClientRuntime.SdkResult<GetResourceSetOutputResponse, GetResourceSetOutputError>) -> Void)
```

### `listCells(input:completion:)`

Returns a collection of Cells.

``` swift
public func listCells(input: ListCellsInput, completion: @escaping (ClientRuntime.SdkResult<ListCellsOutputResponse, ListCellsOutputError>) -> Void)
```

### `listCrossAccountAuthorizations(input:completion:)`

Returns a collection of cross account readiness authorizations.

``` swift
public func listCrossAccountAuthorizations(input: ListCrossAccountAuthorizationsInput, completion: @escaping (ClientRuntime.SdkResult<ListCrossAccountAuthorizationsOutputResponse, ListCrossAccountAuthorizationsOutputError>) -> Void)
```

### `listReadinessChecks(input:completion:)`

Returns a collection of Readiness Checks.

``` swift
public func listReadinessChecks(input: ListReadinessChecksInput, completion: @escaping (ClientRuntime.SdkResult<ListReadinessChecksOutputResponse, ListReadinessChecksOutputError>) -> Void)
```

### `listRecoveryGroups(input:completion:)`

Returns a collection of Recovery Groups.

``` swift
public func listRecoveryGroups(input: ListRecoveryGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListRecoveryGroupsOutputResponse, ListRecoveryGroupsOutputError>) -> Void)
```

### `listResourceSets(input:completion:)`

Returns a collection of Resource Sets.

``` swift
public func listResourceSets(input: ListResourceSetsInput, completion: @escaping (ClientRuntime.SdkResult<ListResourceSetsOutputResponse, ListResourceSetsOutputError>) -> Void)
```

### `listRules(input:completion:)`

Returns a collection of rules that are applied as part of Readiness Checks.

``` swift
public func listRules(input: ListRulesInput, completion: @escaping (ClientRuntime.SdkResult<ListRulesOutputResponse, ListRulesOutputError>) -> Void)
```

### `listTagsForResources(input:completion:)`

Returns a list of the tags assigned to the specified resource.

``` swift
public func listTagsForResources(input: ListTagsForResourcesInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourcesOutputResponse, ListTagsForResourcesOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Adds tags to the specified resource. You can specify one or more tags to add.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes tags from the specified resource. You can specify one or more tags to remove.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateCell(input:completion:)`

Updates an existing Cell.

``` swift
public func updateCell(input: UpdateCellInput, completion: @escaping (ClientRuntime.SdkResult<UpdateCellOutputResponse, UpdateCellOutputError>) -> Void)
```

### `updateReadinessCheck(input:completion:)`

Updates an exisiting Readiness Check.

``` swift
public func updateReadinessCheck(input: UpdateReadinessCheckInput, completion: @escaping (ClientRuntime.SdkResult<UpdateReadinessCheckOutputResponse, UpdateReadinessCheckOutputError>) -> Void)
```

### `updateRecoveryGroup(input:completion:)`

Updates an existing Recovery Group.

``` swift
public func updateRecoveryGroup(input: UpdateRecoveryGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRecoveryGroupOutputResponse, UpdateRecoveryGroupOutputError>) -> Void)
```

### `updateResourceSet(input:completion:)`

Updates an existing Resource Set.

``` swift
public func updateResourceSet(input: UpdateResourceSetInput, completion: @escaping (ClientRuntime.SdkResult<UpdateResourceSetOutputResponse, UpdateResourceSetOutputError>) -> Void)
```
