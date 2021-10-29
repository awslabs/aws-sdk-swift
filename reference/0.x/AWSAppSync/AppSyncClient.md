# AppSyncClient

``` swift
public class AppSyncClient 
```

## Inheritance

[`AppSyncClientProtocol`](/aws-sdk-swift/reference/0.x/AWSAppSync/AppSyncClientProtocol)

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
public static let clientName = "AppSyncClient"
```

## Methods

### `createApiCache(input:completion:)`

Creates a cache for the GraphQL API.

``` swift
public func createApiCache(input: CreateApiCacheInput, completion: @escaping (ClientRuntime.SdkResult<CreateApiCacheOutputResponse, CreateApiCacheOutputError>) -> Void)
```

### `createApiKey(input:completion:)`

Creates a unique key that you can distribute to clients who are executing your API.

``` swift
public func createApiKey(input: CreateApiKeyInput, completion: @escaping (ClientRuntime.SdkResult<CreateApiKeyOutputResponse, CreateApiKeyOutputError>) -> Void)
```

### `createDataSource(input:completion:)`

Creates a DataSource object.

``` swift
public func createDataSource(input: CreateDataSourceInput, completion: @escaping (ClientRuntime.SdkResult<CreateDataSourceOutputResponse, CreateDataSourceOutputError>) -> Void)
```

### `createFunction(input:completion:)`

Creates a Function object. A function is a reusable entity. Multiple functions can be used to compose the resolver logic.

``` swift
public func createFunction(input: CreateFunctionInput, completion: @escaping (ClientRuntime.SdkResult<CreateFunctionOutputResponse, CreateFunctionOutputError>) -> Void)
```

### `createGraphqlApi(input:completion:)`

Creates a GraphqlApi object.

``` swift
public func createGraphqlApi(input: CreateGraphqlApiInput, completion: @escaping (ClientRuntime.SdkResult<CreateGraphqlApiOutputResponse, CreateGraphqlApiOutputError>) -> Void)
```

### `createResolver(input:completion:)`

Creates a Resolver object. A resolver converts incoming requests into a format that a data source can understand and converts the data source's responses into GraphQL.

``` swift
public func createResolver(input: CreateResolverInput, completion: @escaping (ClientRuntime.SdkResult<CreateResolverOutputResponse, CreateResolverOutputError>) -> Void)
```

### `createType(input:completion:)`

Creates a Type object.

``` swift
public func createType(input: CreateTypeInput, completion: @escaping (ClientRuntime.SdkResult<CreateTypeOutputResponse, CreateTypeOutputError>) -> Void)
```

### `deleteApiCache(input:completion:)`

Deletes an ApiCache object.

``` swift
public func deleteApiCache(input: DeleteApiCacheInput, completion: @escaping (ClientRuntime.SdkResult<DeleteApiCacheOutputResponse, DeleteApiCacheOutputError>) -> Void)
```

### `deleteApiKey(input:completion:)`

Deletes an API key.

``` swift
public func deleteApiKey(input: DeleteApiKeyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteApiKeyOutputResponse, DeleteApiKeyOutputError>) -> Void)
```

### `deleteDataSource(input:completion:)`

Deletes a DataSource object.

``` swift
public func deleteDataSource(input: DeleteDataSourceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDataSourceOutputResponse, DeleteDataSourceOutputError>) -> Void)
```

### `deleteFunction(input:completion:)`

Deletes a Function.

``` swift
public func deleteFunction(input: DeleteFunctionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFunctionOutputResponse, DeleteFunctionOutputError>) -> Void)
```

### `deleteGraphqlApi(input:completion:)`

Deletes a GraphqlApi object.

``` swift
public func deleteGraphqlApi(input: DeleteGraphqlApiInput, completion: @escaping (ClientRuntime.SdkResult<DeleteGraphqlApiOutputResponse, DeleteGraphqlApiOutputError>) -> Void)
```

### `deleteResolver(input:completion:)`

Deletes a Resolver object.

``` swift
public func deleteResolver(input: DeleteResolverInput, completion: @escaping (ClientRuntime.SdkResult<DeleteResolverOutputResponse, DeleteResolverOutputError>) -> Void)
```

### `deleteType(input:completion:)`

Deletes a Type object.

``` swift
public func deleteType(input: DeleteTypeInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTypeOutputResponse, DeleteTypeOutputError>) -> Void)
```

### `flushApiCache(input:completion:)`

Flushes an ApiCache object.

``` swift
public func flushApiCache(input: FlushApiCacheInput, completion: @escaping (ClientRuntime.SdkResult<FlushApiCacheOutputResponse, FlushApiCacheOutputError>) -> Void)
```

### `getApiCache(input:completion:)`

Retrieves an ApiCache object.

``` swift
public func getApiCache(input: GetApiCacheInput, completion: @escaping (ClientRuntime.SdkResult<GetApiCacheOutputResponse, GetApiCacheOutputError>) -> Void)
```

### `getDataSource(input:completion:)`

Retrieves a DataSource object.

``` swift
public func getDataSource(input: GetDataSourceInput, completion: @escaping (ClientRuntime.SdkResult<GetDataSourceOutputResponse, GetDataSourceOutputError>) -> Void)
```

### `getFunction(input:completion:)`

Get a Function.

``` swift
public func getFunction(input: GetFunctionInput, completion: @escaping (ClientRuntime.SdkResult<GetFunctionOutputResponse, GetFunctionOutputError>) -> Void)
```

### `getGraphqlApi(input:completion:)`

Retrieves a GraphqlApi object.

``` swift
public func getGraphqlApi(input: GetGraphqlApiInput, completion: @escaping (ClientRuntime.SdkResult<GetGraphqlApiOutputResponse, GetGraphqlApiOutputError>) -> Void)
```

### `getIntrospectionSchema(input:completion:)`

Retrieves the introspection schema for a GraphQL API.

``` swift
public func getIntrospectionSchema(input: GetIntrospectionSchemaInput, completion: @escaping (ClientRuntime.SdkResult<GetIntrospectionSchemaOutputResponse, GetIntrospectionSchemaOutputError>) -> Void)
```

### `getResolver(input:completion:)`

Retrieves a Resolver object.

``` swift
public func getResolver(input: GetResolverInput, completion: @escaping (ClientRuntime.SdkResult<GetResolverOutputResponse, GetResolverOutputError>) -> Void)
```

### `getSchemaCreationStatus(input:completion:)`

Retrieves the current status of a schema creation operation.

``` swift
public func getSchemaCreationStatus(input: GetSchemaCreationStatusInput, completion: @escaping (ClientRuntime.SdkResult<GetSchemaCreationStatusOutputResponse, GetSchemaCreationStatusOutputError>) -> Void)
```

### `getType(input:completion:)`

Retrieves a Type object.

``` swift
public func getType(input: GetTypeInput, completion: @escaping (ClientRuntime.SdkResult<GetTypeOutputResponse, GetTypeOutputError>) -> Void)
```

### `listApiKeys(input:completion:)`

Lists the API keys for a given API. API keys are deleted automatically 60 days after they expire. However, they may still be included in the response until they have actually been deleted. You can safely call DeleteApiKey to manually delete a key before it's automatically deleted.

``` swift
public func listApiKeys(input: ListApiKeysInput, completion: @escaping (ClientRuntime.SdkResult<ListApiKeysOutputResponse, ListApiKeysOutputError>) -> Void)
```

### `listDataSources(input:completion:)`

Lists the data sources for a given API.

``` swift
public func listDataSources(input: ListDataSourcesInput, completion: @escaping (ClientRuntime.SdkResult<ListDataSourcesOutputResponse, ListDataSourcesOutputError>) -> Void)
```

### `listFunctions(input:completion:)`

List multiple functions.

``` swift
public func listFunctions(input: ListFunctionsInput, completion: @escaping (ClientRuntime.SdkResult<ListFunctionsOutputResponse, ListFunctionsOutputError>) -> Void)
```

### `listGraphqlApis(input:completion:)`

Lists your GraphQL APIs.

``` swift
public func listGraphqlApis(input: ListGraphqlApisInput, completion: @escaping (ClientRuntime.SdkResult<ListGraphqlApisOutputResponse, ListGraphqlApisOutputError>) -> Void)
```

### `listResolvers(input:completion:)`

Lists the resolvers for a given API and type.

``` swift
public func listResolvers(input: ListResolversInput, completion: @escaping (ClientRuntime.SdkResult<ListResolversOutputResponse, ListResolversOutputError>) -> Void)
```

### `listResolversByFunction(input:completion:)`

List the resolvers that are associated with a specific function.

``` swift
public func listResolversByFunction(input: ListResolversByFunctionInput, completion: @escaping (ClientRuntime.SdkResult<ListResolversByFunctionOutputResponse, ListResolversByFunctionOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Lists the tags for a resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `listTypes(input:completion:)`

Lists the types for a given API.

``` swift
public func listTypes(input: ListTypesInput, completion: @escaping (ClientRuntime.SdkResult<ListTypesOutputResponse, ListTypesOutputError>) -> Void)
```

### `startSchemaCreation(input:completion:)`

Adds a new schema to your GraphQL API. This operation is asynchronous. Use to determine when it has completed.

``` swift
public func startSchemaCreation(input: StartSchemaCreationInput, completion: @escaping (ClientRuntime.SdkResult<StartSchemaCreationOutputResponse, StartSchemaCreationOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Tags a resource with user-supplied tags.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Untags a resource.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateApiCache(input:completion:)`

Updates the cache for the GraphQL API.

``` swift
public func updateApiCache(input: UpdateApiCacheInput, completion: @escaping (ClientRuntime.SdkResult<UpdateApiCacheOutputResponse, UpdateApiCacheOutputError>) -> Void)
```

### `updateApiKey(input:completion:)`

Updates an API key. The key can be updated while it is not deleted.

``` swift
public func updateApiKey(input: UpdateApiKeyInput, completion: @escaping (ClientRuntime.SdkResult<UpdateApiKeyOutputResponse, UpdateApiKeyOutputError>) -> Void)
```

### `updateDataSource(input:completion:)`

Updates a DataSource object.

``` swift
public func updateDataSource(input: UpdateDataSourceInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDataSourceOutputResponse, UpdateDataSourceOutputError>) -> Void)
```

### `updateFunction(input:completion:)`

Updates a Function object.

``` swift
public func updateFunction(input: UpdateFunctionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFunctionOutputResponse, UpdateFunctionOutputError>) -> Void)
```

### `updateGraphqlApi(input:completion:)`

Updates a GraphqlApi object.

``` swift
public func updateGraphqlApi(input: UpdateGraphqlApiInput, completion: @escaping (ClientRuntime.SdkResult<UpdateGraphqlApiOutputResponse, UpdateGraphqlApiOutputError>) -> Void)
```

### `updateResolver(input:completion:)`

Updates a Resolver object.

``` swift
public func updateResolver(input: UpdateResolverInput, completion: @escaping (ClientRuntime.SdkResult<UpdateResolverOutputResponse, UpdateResolverOutputError>) -> Void)
```

### `updateType(input:completion:)`

Updates a Type object.

``` swift
public func updateType(input: UpdateTypeInput, completion: @escaping (ClientRuntime.SdkResult<UpdateTypeOutputResponse, UpdateTypeOutputError>) -> Void)
```
