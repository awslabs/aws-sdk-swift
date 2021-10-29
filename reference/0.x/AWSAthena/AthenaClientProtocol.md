# AthenaClientProtocol

Amazon Athena is an interactive query service that lets you use standard SQL to analyze data directly in Amazon S3. You can point Athena at your data in Amazon S3 and run ad-hoc queries and get results in seconds. Athena is serverless, so there is no infrastructure to set up or manage. You pay only for the queries you run. Athena scales automatically—executing queries in parallel—so results are fast, even with large datasets and complex queries. For more information, see [What is Amazon Athena](http://docs.aws.amazon.com/athena/latest/ug/what-is.html) in the Amazon Athena User Guide. If you connect to Athena using the JDBC driver, use version 1.1.0 of the driver or later with the Amazon Athena API. Earlier version drivers do not support the API. For more information and to download the driver, see [Accessing Amazon Athena with JDBC](https://docs.aws.amazon.com/athena/latest/ug/connect-with-jdbc.html). For code samples using the Amazon Web Services SDK for Java, see [Examples and Code Samples](https://docs.aws.amazon.com/athena/latest/ug/code-samples.html) in the Amazon Athena User Guide.

``` swift
public protocol AthenaClientProtocol 
```

## Requirements

### batchGetNamedQuery(input:completion:)

Returns the details of a single named query or a list of up to 50 queries, which you provide as an array of query ID strings. Requires you to have access to the workgroup in which the queries were saved. Use \[ListNamedQueriesInput\] to get the list of named query IDs in the specified workgroup. If information could not be retrieved for a submitted query ID, information about the query ID submitted is listed under \[UnprocessedNamedQueryId\]. Named queries differ from executed queries. Use \[BatchGetQueryExecutionInput\] to get details about each unique query execution, and \[ListQueryExecutionsInput\] to get a list of query execution IDs.

``` swift
func batchGetNamedQuery(input: BatchGetNamedQueryInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetNamedQueryOutputResponse, BatchGetNamedQueryOutputError>) -> Void)
```

### batchGetQueryExecution(input:completion:)

Returns the details of a single query execution or a list of up to 50 query executions, which you provide as an array of query execution ID strings. Requires you to have access to the workgroup in which the queries ran. To get a list of query execution IDs, use \[ListQueryExecutionsInput$WorkGroup\]. Query executions differ from named (saved) queries. Use \[BatchGetNamedQueryInput\] to get details about named queries.

``` swift
func batchGetQueryExecution(input: BatchGetQueryExecutionInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetQueryExecutionOutputResponse, BatchGetQueryExecutionOutputError>) -> Void)
```

### createDataCatalog(input:completion:)

Creates (registers) a data catalog with the specified name and properties. Catalogs created are visible to all users of the same Amazon Web Services account.

``` swift
func createDataCatalog(input: CreateDataCatalogInput, completion: @escaping (ClientRuntime.SdkResult<CreateDataCatalogOutputResponse, CreateDataCatalogOutputError>) -> Void)
```

### createNamedQuery(input:completion:)

Creates a named query in the specified workgroup. Requires that you have access to the workgroup. For code samples using the Amazon Web Services SDK for Java, see [Examples and Code Samples](http://docs.aws.amazon.com/athena/latest/ug/code-samples.html) in the Amazon Athena User Guide.

``` swift
func createNamedQuery(input: CreateNamedQueryInput, completion: @escaping (ClientRuntime.SdkResult<CreateNamedQueryOutputResponse, CreateNamedQueryOutputError>) -> Void)
```

### createPreparedStatement(input:completion:)

Creates a prepared statement for use with SQL queries in Athena.

``` swift
func createPreparedStatement(input: CreatePreparedStatementInput, completion: @escaping (ClientRuntime.SdkResult<CreatePreparedStatementOutputResponse, CreatePreparedStatementOutputError>) -> Void)
```

### createWorkGroup(input:completion:)

Creates a workgroup with the specified name.

``` swift
func createWorkGroup(input: CreateWorkGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateWorkGroupOutputResponse, CreateWorkGroupOutputError>) -> Void)
```

### deleteDataCatalog(input:completion:)

Deletes a data catalog.

``` swift
func deleteDataCatalog(input: DeleteDataCatalogInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDataCatalogOutputResponse, DeleteDataCatalogOutputError>) -> Void)
```

### deleteNamedQuery(input:completion:)

Deletes the named query if you have access to the workgroup in which the query was saved. For code samples using the Amazon Web Services SDK for Java, see [Examples and Code Samples](http://docs.aws.amazon.com/athena/latest/ug/code-samples.html) in the Amazon Athena User Guide.

``` swift
func deleteNamedQuery(input: DeleteNamedQueryInput, completion: @escaping (ClientRuntime.SdkResult<DeleteNamedQueryOutputResponse, DeleteNamedQueryOutputError>) -> Void)
```

### deletePreparedStatement(input:completion:)

Deletes the prepared statement with the specified name from the specified workgroup.

``` swift
func deletePreparedStatement(input: DeletePreparedStatementInput, completion: @escaping (ClientRuntime.SdkResult<DeletePreparedStatementOutputResponse, DeletePreparedStatementOutputError>) -> Void)
```

### deleteWorkGroup(input:completion:)

Deletes the workgroup with the specified name. The primary workgroup cannot be deleted.

``` swift
func deleteWorkGroup(input: DeleteWorkGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteWorkGroupOutputResponse, DeleteWorkGroupOutputError>) -> Void)
```

### getDatabase(input:completion:)

Returns a database object for the specified database and data catalog.

``` swift
func getDatabase(input: GetDatabaseInput, completion: @escaping (ClientRuntime.SdkResult<GetDatabaseOutputResponse, GetDatabaseOutputError>) -> Void)
```

### getDataCatalog(input:completion:)

Returns the specified data catalog.

``` swift
func getDataCatalog(input: GetDataCatalogInput, completion: @escaping (ClientRuntime.SdkResult<GetDataCatalogOutputResponse, GetDataCatalogOutputError>) -> Void)
```

### getNamedQuery(input:completion:)

Returns information about a single query. Requires that you have access to the workgroup in which the query was saved.

``` swift
func getNamedQuery(input: GetNamedQueryInput, completion: @escaping (ClientRuntime.SdkResult<GetNamedQueryOutputResponse, GetNamedQueryOutputError>) -> Void)
```

### getPreparedStatement(input:completion:)

Retrieves the prepared statement with the specified name from the specified workgroup.

``` swift
func getPreparedStatement(input: GetPreparedStatementInput, completion: @escaping (ClientRuntime.SdkResult<GetPreparedStatementOutputResponse, GetPreparedStatementOutputError>) -> Void)
```

### getQueryExecution(input:completion:)

Returns information about a single execution of a query if you have access to the workgroup in which the query ran. Each time a query executes, information about the query execution is saved with a unique ID.

``` swift
func getQueryExecution(input: GetQueryExecutionInput, completion: @escaping (ClientRuntime.SdkResult<GetQueryExecutionOutputResponse, GetQueryExecutionOutputError>) -> Void)
```

### getQueryResults(input:completion:)

Streams the results of a single query execution specified by QueryExecutionId from the Athena query results location in Amazon S3. For more information, see [Query Results](https://docs.aws.amazon.com/athena/latest/ug/querying.html) in the Amazon Athena User Guide. This request does not execute the query but returns results. Use \[StartQueryExecution\] to run a query. To stream query results successfully, the IAM principal with permission to call GetQueryResults also must have permissions to the Amazon S3 GetObject action for the Athena query results location. IAM principals with permission to the Amazon S3 GetObject action for the query results location are able to retrieve query results from Amazon S3 even if permission to the GetQueryResults action is denied. To restrict user or role access, ensure that Amazon S3 permissions to the Athena query location are denied.

``` swift
func getQueryResults(input: GetQueryResultsInput, completion: @escaping (ClientRuntime.SdkResult<GetQueryResultsOutputResponse, GetQueryResultsOutputError>) -> Void)
```

### getTableMetadata(input:completion:)

Returns table metadata for the specified catalog, database, and table.

``` swift
func getTableMetadata(input: GetTableMetadataInput, completion: @escaping (ClientRuntime.SdkResult<GetTableMetadataOutputResponse, GetTableMetadataOutputError>) -> Void)
```

### getWorkGroup(input:completion:)

Returns information about the workgroup with the specified name.

``` swift
func getWorkGroup(input: GetWorkGroupInput, completion: @escaping (ClientRuntime.SdkResult<GetWorkGroupOutputResponse, GetWorkGroupOutputError>) -> Void)
```

### listDatabases(input:completion:)

Lists the databases in the specified data catalog.

``` swift
func listDatabases(input: ListDatabasesInput, completion: @escaping (ClientRuntime.SdkResult<ListDatabasesOutputResponse, ListDatabasesOutputError>) -> Void)
```

### listDataCatalogs(input:completion:)

Lists the data catalogs in the current Amazon Web Services account.

``` swift
func listDataCatalogs(input: ListDataCatalogsInput, completion: @escaping (ClientRuntime.SdkResult<ListDataCatalogsOutputResponse, ListDataCatalogsOutputError>) -> Void)
```

### listEngineVersions(input:completion:)

Returns a list of engine versions that are available to choose from, including the Auto option.

``` swift
func listEngineVersions(input: ListEngineVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListEngineVersionsOutputResponse, ListEngineVersionsOutputError>) -> Void)
```

### listNamedQueries(input:completion:)

Provides a list of available query IDs only for queries saved in the specified workgroup. Requires that you have access to the specified workgroup. If a workgroup is not specified, lists the saved queries for the primary workgroup. For code samples using the Amazon Web Services SDK for Java, see [Examples and Code Samples](http://docs.aws.amazon.com/athena/latest/ug/code-samples.html) in the Amazon Athena User Guide.

``` swift
func listNamedQueries(input: ListNamedQueriesInput, completion: @escaping (ClientRuntime.SdkResult<ListNamedQueriesOutputResponse, ListNamedQueriesOutputError>) -> Void)
```

### listPreparedStatements(input:completion:)

Lists the prepared statements in the specfied workgroup.

``` swift
func listPreparedStatements(input: ListPreparedStatementsInput, completion: @escaping (ClientRuntime.SdkResult<ListPreparedStatementsOutputResponse, ListPreparedStatementsOutputError>) -> Void)
```

### listQueryExecutions(input:completion:)

Provides a list of available query execution IDs for the queries in the specified workgroup. If a workgroup is not specified, returns a list of query execution IDs for the primary workgroup. Requires you to have access to the workgroup in which the queries ran. For code samples using the Amazon Web Services SDK for Java, see [Examples and Code Samples](http://docs.aws.amazon.com/athena/latest/ug/code-samples.html) in the Amazon Athena User Guide.

``` swift
func listQueryExecutions(input: ListQueryExecutionsInput, completion: @escaping (ClientRuntime.SdkResult<ListQueryExecutionsOutputResponse, ListQueryExecutionsOutputError>) -> Void)
```

### listTableMetadata(input:completion:)

Lists the metadata for the tables in the specified data catalog database.

``` swift
func listTableMetadata(input: ListTableMetadataInput, completion: @escaping (ClientRuntime.SdkResult<ListTableMetadataOutputResponse, ListTableMetadataOutputError>) -> Void)
```

### listTagsForResource(input:completion:)

Lists the tags associated with an Athena workgroup or data catalog resource.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### listWorkGroups(input:completion:)

Lists available workgroups for the account.

``` swift
func listWorkGroups(input: ListWorkGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListWorkGroupsOutputResponse, ListWorkGroupsOutputError>) -> Void)
```

### startQueryExecution(input:completion:)

Runs the SQL query statements contained in the Query. Requires you to have access to the workgroup in which the query ran. Running queries against an external catalog requires \[GetDataCatalog\] permission to the catalog. For code samples using the Amazon Web Services SDK for Java, see [Examples and Code Samples](http://docs.aws.amazon.com/athena/latest/ug/code-samples.html) in the Amazon Athena User Guide.

``` swift
func startQueryExecution(input: StartQueryExecutionInput, completion: @escaping (ClientRuntime.SdkResult<StartQueryExecutionOutputResponse, StartQueryExecutionOutputError>) -> Void)
```

### stopQueryExecution(input:completion:)

Stops a query execution. Requires you to have access to the workgroup in which the query ran. For code samples using the Amazon Web Services SDK for Java, see [Examples and Code Samples](http://docs.aws.amazon.com/athena/latest/ug/code-samples.html) in the Amazon Athena User Guide.

``` swift
func stopQueryExecution(input: StopQueryExecutionInput, completion: @escaping (ClientRuntime.SdkResult<StopQueryExecutionOutputResponse, StopQueryExecutionOutputError>) -> Void)
```

### tagResource(input:completion:)

Adds one or more tags to an Athena resource. A tag is a label that you assign to a resource. In Athena, a resource can be a workgroup or data catalog. Each tag consists of a key and an optional value, both of which you define. For example, you can use tags to categorize Athena workgroups or data catalogs by purpose, owner, or environment. Use a consistent set of tag keys to make it easier to search and filter workgroups or data catalogs in your account. For best practices, see [Tagging Best Practices](https://aws.amazon.com/answers/account-management/aws-tagging-strategies/). Tag keys can be from 1 to 128 UTF-8 Unicode characters, and tag values can be from 0 to 256 UTF-8 Unicode characters. Tags can use letters and numbers representable in UTF-8, and the following characters: + - = . \_ : / @. Tag keys and values are case-sensitive. Tag keys must be unique per resource. If you specify more than one tag, separate them by commas.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:completion:)

Removes one or more tags from a data catalog or workgroup resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateDataCatalog(input:completion:)

Updates the data catalog that has the specified name.

``` swift
func updateDataCatalog(input: UpdateDataCatalogInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDataCatalogOutputResponse, UpdateDataCatalogOutputError>) -> Void)
```

### updatePreparedStatement(input:completion:)

Updates a prepared statement.

``` swift
func updatePreparedStatement(input: UpdatePreparedStatementInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePreparedStatementOutputResponse, UpdatePreparedStatementOutputError>) -> Void)
```

### updateWorkGroup(input:completion:)

Updates the workgroup with the specified name. The workgroup's name cannot be changed.

``` swift
func updateWorkGroup(input: UpdateWorkGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateWorkGroupOutputResponse, UpdateWorkGroupOutputError>) -> Void)
```
