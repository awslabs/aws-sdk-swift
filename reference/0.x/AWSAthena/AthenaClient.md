# AthenaClient

``` swift
public class AthenaClient 
```

## Inheritance

[`AthenaClientProtocol`](/aws-sdk-swift/reference/0.x/AWSAthena/AthenaClientProtocol)

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
public static let clientName = "AthenaClient"
```

## Methods

### `batchGetNamedQuery(input:completion:)`

Returns the details of a single named query or a list of up to 50 queries, which you provide as an array of query ID strings. Requires you to have access to the workgroup in which the queries were saved. Use \[ListNamedQueriesInput\] to get the list of named query IDs in the specified workgroup. If information could not be retrieved for a submitted query ID, information about the query ID submitted is listed under \[UnprocessedNamedQueryId\]. Named queries differ from executed queries. Use \[BatchGetQueryExecutionInput\] to get details about each unique query execution, and \[ListQueryExecutionsInput\] to get a list of query execution IDs.

``` swift
public func batchGetNamedQuery(input: BatchGetNamedQueryInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetNamedQueryOutputResponse, BatchGetNamedQueryOutputError>) -> Void)
```

### `batchGetQueryExecution(input:completion:)`

Returns the details of a single query execution or a list of up to 50 query executions, which you provide as an array of query execution ID strings. Requires you to have access to the workgroup in which the queries ran. To get a list of query execution IDs, use \[ListQueryExecutionsInput$WorkGroup\]. Query executions differ from named (saved) queries. Use \[BatchGetNamedQueryInput\] to get details about named queries.

``` swift
public func batchGetQueryExecution(input: BatchGetQueryExecutionInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetQueryExecutionOutputResponse, BatchGetQueryExecutionOutputError>) -> Void)
```

### `createDataCatalog(input:completion:)`

Creates (registers) a data catalog with the specified name and properties. Catalogs created are visible to all users of the same Amazon Web Services account.

``` swift
public func createDataCatalog(input: CreateDataCatalogInput, completion: @escaping (ClientRuntime.SdkResult<CreateDataCatalogOutputResponse, CreateDataCatalogOutputError>) -> Void)
```

### `createNamedQuery(input:completion:)`

Creates a named query in the specified workgroup. Requires that you have access to the workgroup. For code samples using the Amazon Web Services SDK for Java, see [Examples and Code Samples](http://docs.aws.amazon.com/athena/latest/ug/code-samples.html) in the Amazon Athena User Guide.

``` swift
public func createNamedQuery(input: CreateNamedQueryInput, completion: @escaping (ClientRuntime.SdkResult<CreateNamedQueryOutputResponse, CreateNamedQueryOutputError>) -> Void)
```

### `createPreparedStatement(input:completion:)`

Creates a prepared statement for use with SQL queries in Athena.

``` swift
public func createPreparedStatement(input: CreatePreparedStatementInput, completion: @escaping (ClientRuntime.SdkResult<CreatePreparedStatementOutputResponse, CreatePreparedStatementOutputError>) -> Void)
```

### `createWorkGroup(input:completion:)`

Creates a workgroup with the specified name.

``` swift
public func createWorkGroup(input: CreateWorkGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateWorkGroupOutputResponse, CreateWorkGroupOutputError>) -> Void)
```

### `deleteDataCatalog(input:completion:)`

Deletes a data catalog.

``` swift
public func deleteDataCatalog(input: DeleteDataCatalogInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDataCatalogOutputResponse, DeleteDataCatalogOutputError>) -> Void)
```

### `deleteNamedQuery(input:completion:)`

Deletes the named query if you have access to the workgroup in which the query was saved. For code samples using the Amazon Web Services SDK for Java, see [Examples and Code Samples](http://docs.aws.amazon.com/athena/latest/ug/code-samples.html) in the Amazon Athena User Guide.

``` swift
public func deleteNamedQuery(input: DeleteNamedQueryInput, completion: @escaping (ClientRuntime.SdkResult<DeleteNamedQueryOutputResponse, DeleteNamedQueryOutputError>) -> Void)
```

### `deletePreparedStatement(input:completion:)`

Deletes the prepared statement with the specified name from the specified workgroup.

``` swift
public func deletePreparedStatement(input: DeletePreparedStatementInput, completion: @escaping (ClientRuntime.SdkResult<DeletePreparedStatementOutputResponse, DeletePreparedStatementOutputError>) -> Void)
```

### `deleteWorkGroup(input:completion:)`

Deletes the workgroup with the specified name. The primary workgroup cannot be deleted.

``` swift
public func deleteWorkGroup(input: DeleteWorkGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteWorkGroupOutputResponse, DeleteWorkGroupOutputError>) -> Void)
```

### `getDataCatalog(input:completion:)`

Returns the specified data catalog.

``` swift
public func getDataCatalog(input: GetDataCatalogInput, completion: @escaping (ClientRuntime.SdkResult<GetDataCatalogOutputResponse, GetDataCatalogOutputError>) -> Void)
```

### `getDatabase(input:completion:)`

Returns a database object for the specified database and data catalog.

``` swift
public func getDatabase(input: GetDatabaseInput, completion: @escaping (ClientRuntime.SdkResult<GetDatabaseOutputResponse, GetDatabaseOutputError>) -> Void)
```

### `getNamedQuery(input:completion:)`

Returns information about a single query. Requires that you have access to the workgroup in which the query was saved.

``` swift
public func getNamedQuery(input: GetNamedQueryInput, completion: @escaping (ClientRuntime.SdkResult<GetNamedQueryOutputResponse, GetNamedQueryOutputError>) -> Void)
```

### `getPreparedStatement(input:completion:)`

Retrieves the prepared statement with the specified name from the specified workgroup.

``` swift
public func getPreparedStatement(input: GetPreparedStatementInput, completion: @escaping (ClientRuntime.SdkResult<GetPreparedStatementOutputResponse, GetPreparedStatementOutputError>) -> Void)
```

### `getQueryExecution(input:completion:)`

Returns information about a single execution of a query if you have access to the workgroup in which the query ran. Each time a query executes, information about the query execution is saved with a unique ID.

``` swift
public func getQueryExecution(input: GetQueryExecutionInput, completion: @escaping (ClientRuntime.SdkResult<GetQueryExecutionOutputResponse, GetQueryExecutionOutputError>) -> Void)
```

### `getQueryResults(input:completion:)`

Streams the results of a single query execution specified by QueryExecutionId from the Athena query results location in Amazon S3. For more information, see [Query Results](https://docs.aws.amazon.com/athena/latest/ug/querying.html) in the Amazon Athena User Guide. This request does not execute the query but returns results. Use \[StartQueryExecution\] to run a query. To stream query results successfully, the IAM principal with permission to call GetQueryResults also must have permissions to the Amazon S3 GetObject action for the Athena query results location. IAM principals with permission to the Amazon S3 GetObject action for the query results location are able to retrieve query results from Amazon S3 even if permission to the GetQueryResults action is denied. To restrict user or role access, ensure that Amazon S3 permissions to the Athena query location are denied.

``` swift
public func getQueryResults(input: GetQueryResultsInput, completion: @escaping (ClientRuntime.SdkResult<GetQueryResultsOutputResponse, GetQueryResultsOutputError>) -> Void)
```

### `getTableMetadata(input:completion:)`

Returns table metadata for the specified catalog, database, and table.

``` swift
public func getTableMetadata(input: GetTableMetadataInput, completion: @escaping (ClientRuntime.SdkResult<GetTableMetadataOutputResponse, GetTableMetadataOutputError>) -> Void)
```

### `getWorkGroup(input:completion:)`

Returns information about the workgroup with the specified name.

``` swift
public func getWorkGroup(input: GetWorkGroupInput, completion: @escaping (ClientRuntime.SdkResult<GetWorkGroupOutputResponse, GetWorkGroupOutputError>) -> Void)
```

### `listDataCatalogs(input:completion:)`

Lists the data catalogs in the current Amazon Web Services account.

``` swift
public func listDataCatalogs(input: ListDataCatalogsInput, completion: @escaping (ClientRuntime.SdkResult<ListDataCatalogsOutputResponse, ListDataCatalogsOutputError>) -> Void)
```

### `listDatabases(input:completion:)`

Lists the databases in the specified data catalog.

``` swift
public func listDatabases(input: ListDatabasesInput, completion: @escaping (ClientRuntime.SdkResult<ListDatabasesOutputResponse, ListDatabasesOutputError>) -> Void)
```

### `listEngineVersions(input:completion:)`

Returns a list of engine versions that are available to choose from, including the Auto option.

``` swift
public func listEngineVersions(input: ListEngineVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListEngineVersionsOutputResponse, ListEngineVersionsOutputError>) -> Void)
```

### `listNamedQueries(input:completion:)`

Provides a list of available query IDs only for queries saved in the specified workgroup. Requires that you have access to the specified workgroup. If a workgroup is not specified, lists the saved queries for the primary workgroup. For code samples using the Amazon Web Services SDK for Java, see [Examples and Code Samples](http://docs.aws.amazon.com/athena/latest/ug/code-samples.html) in the Amazon Athena User Guide.

``` swift
public func listNamedQueries(input: ListNamedQueriesInput, completion: @escaping (ClientRuntime.SdkResult<ListNamedQueriesOutputResponse, ListNamedQueriesOutputError>) -> Void)
```

### `listPreparedStatements(input:completion:)`

Lists the prepared statements in the specfied workgroup.

``` swift
public func listPreparedStatements(input: ListPreparedStatementsInput, completion: @escaping (ClientRuntime.SdkResult<ListPreparedStatementsOutputResponse, ListPreparedStatementsOutputError>) -> Void)
```

### `listQueryExecutions(input:completion:)`

Provides a list of available query execution IDs for the queries in the specified workgroup. If a workgroup is not specified, returns a list of query execution IDs for the primary workgroup. Requires you to have access to the workgroup in which the queries ran. For code samples using the Amazon Web Services SDK for Java, see [Examples and Code Samples](http://docs.aws.amazon.com/athena/latest/ug/code-samples.html) in the Amazon Athena User Guide.

``` swift
public func listQueryExecutions(input: ListQueryExecutionsInput, completion: @escaping (ClientRuntime.SdkResult<ListQueryExecutionsOutputResponse, ListQueryExecutionsOutputError>) -> Void)
```

### `listTableMetadata(input:completion:)`

Lists the metadata for the tables in the specified data catalog database.

``` swift
public func listTableMetadata(input: ListTableMetadataInput, completion: @escaping (ClientRuntime.SdkResult<ListTableMetadataOutputResponse, ListTableMetadataOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Lists the tags associated with an Athena workgroup or data catalog resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `listWorkGroups(input:completion:)`

Lists available workgroups for the account.

``` swift
public func listWorkGroups(input: ListWorkGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListWorkGroupsOutputResponse, ListWorkGroupsOutputError>) -> Void)
```

### `startQueryExecution(input:completion:)`

Runs the SQL query statements contained in the Query. Requires you to have access to the workgroup in which the query ran. Running queries against an external catalog requires \[GetDataCatalog\] permission to the catalog. For code samples using the Amazon Web Services SDK for Java, see [Examples and Code Samples](http://docs.aws.amazon.com/athena/latest/ug/code-samples.html) in the Amazon Athena User Guide.

``` swift
public func startQueryExecution(input: StartQueryExecutionInput, completion: @escaping (ClientRuntime.SdkResult<StartQueryExecutionOutputResponse, StartQueryExecutionOutputError>) -> Void)
```

### `stopQueryExecution(input:completion:)`

Stops a query execution. Requires you to have access to the workgroup in which the query ran. For code samples using the Amazon Web Services SDK for Java, see [Examples and Code Samples](http://docs.aws.amazon.com/athena/latest/ug/code-samples.html) in the Amazon Athena User Guide.

``` swift
public func stopQueryExecution(input: StopQueryExecutionInput, completion: @escaping (ClientRuntime.SdkResult<StopQueryExecutionOutputResponse, StopQueryExecutionOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Adds one or more tags to an Athena resource. A tag is a label that you assign to a resource. In Athena, a resource can be a workgroup or data catalog. Each tag consists of a key and an optional value, both of which you define. For example, you can use tags to categorize Athena workgroups or data catalogs by purpose, owner, or environment. Use a consistent set of tag keys to make it easier to search and filter workgroups or data catalogs in your account. For best practices, see [Tagging Best Practices](https://aws.amazon.com/answers/account-management/aws-tagging-strategies/). Tag keys can be from 1 to 128 UTF-8 Unicode characters, and tag values can be from 0 to 256 UTF-8 Unicode characters. Tags can use letters and numbers representable in UTF-8, and the following characters: + - = . \_ : / @. Tag keys and values are case-sensitive. Tag keys must be unique per resource. If you specify more than one tag, separate them by commas.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes one or more tags from a data catalog or workgroup resource.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateDataCatalog(input:completion:)`

Updates the data catalog that has the specified name.

``` swift
public func updateDataCatalog(input: UpdateDataCatalogInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDataCatalogOutputResponse, UpdateDataCatalogOutputError>) -> Void)
```

### `updatePreparedStatement(input:completion:)`

Updates a prepared statement.

``` swift
public func updatePreparedStatement(input: UpdatePreparedStatementInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePreparedStatementOutputResponse, UpdatePreparedStatementOutputError>) -> Void)
```

### `updateWorkGroup(input:completion:)`

Updates the workgroup with the specified name. The workgroup's name cannot be changed.

``` swift
public func updateWorkGroup(input: UpdateWorkGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateWorkGroupOutputResponse, UpdateWorkGroupOutputError>) -> Void)
```
