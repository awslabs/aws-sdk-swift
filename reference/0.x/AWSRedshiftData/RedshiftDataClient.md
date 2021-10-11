# RedshiftDataClient

``` swift
public class RedshiftDataClient 
```

## Inheritance

[`RedshiftDataClientProtocol`](/aws-sdk-swift/reference/0.x/AWSRedshiftData/RedshiftDataClientProtocol)

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

### `batchExecuteStatement(input:completion:)`

Runs one or more SQL statements, which can be data manipulation language (DML) or data definition
language (DDL).
Depending on the authorization
method, use one of the following combinations of request parameters:​

``` swift
public func batchExecuteStatement(input: BatchExecuteStatementInput, completion: @escaping (ClientRuntime.SdkResult<BatchExecuteStatementOutputResponse, BatchExecuteStatementOutputError>) -> Void)
```

``` 
           Secrets Manager - specify the Amazon Resource Name (ARN) of the secret, the database name, and the
    cluster identifier that matches the cluster in the secret.


           Temporary credentials - specify the cluster identifier, the database name, and the
      database user name. Permission to call the redshift:GetClusterCredentials
      operation is required to use this method.
```

### `cancelStatement(input:completion:)`

Cancels a running query. To be canceled, a query must be running.

``` swift
public func cancelStatement(input: CancelStatementInput, completion: @escaping (ClientRuntime.SdkResult<CancelStatementOutputResponse, CancelStatementOutputError>) -> Void)
```

### `describeStatement(input:completion:)`

Describes the details about a specific instance when a query was run by the Amazon Redshift Data API. The information
includes when the query started, when it finished, the query status, the number of rows returned, and the SQL
statement.

``` swift
public func describeStatement(input: DescribeStatementInput, completion: @escaping (ClientRuntime.SdkResult<DescribeStatementOutputResponse, DescribeStatementOutputError>) -> Void)
```

### `describeTable(input:completion:)`

Describes the detailed information about a table from metadata in the cluster. The
information includes its columns.
A token is returned to page through the column list.
Depending on the authorization method, use one of the
following combinations of request parameters:​

``` swift
public func describeTable(input: DescribeTableInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTableOutputResponse, DescribeTableOutputError>) -> Void)
```

``` 
           Secrets Manager - specify the Amazon Resource Name (ARN) of the secret, the database name, and the
     cluster identifier that matches the cluster in the secret.


           Temporary credentials - specify the cluster identifier, the database name, and the database
      user name. Permission to call the redshift:GetClusterCredentials operation is
      required to use this method.
```

### `executeStatement(input:completion:)`

Runs an SQL statement, which can be data manipulation language (DML) or data definition
language (DDL). This statement must be a single SQL statement.
Depending on the authorization
method, use one of the following combinations of request parameters:​

``` swift
public func executeStatement(input: ExecuteStatementInput, completion: @escaping (ClientRuntime.SdkResult<ExecuteStatementOutputResponse, ExecuteStatementOutputError>) -> Void)
```

``` 
           Secrets Manager - specify the Amazon Resource Name (ARN) of the secret, the database name, and the
     cluster identifier that matches the cluster in the secret.


           Temporary credentials - specify the cluster identifier, the database name, and the
      database user name. Permission to call the redshift:GetClusterCredentials
      operation is required to use this method.
```

### `getStatementResult(input:completion:)`

Fetches the temporarily cached result of an SQL statement.
A token is returned to page through the statement results.

``` swift
public func getStatementResult(input: GetStatementResultInput, completion: @escaping (ClientRuntime.SdkResult<GetStatementResultOutputResponse, GetStatementResultOutputError>) -> Void)
```

### `listDatabases(input:completion:)`

List the databases in a cluster.
A token is returned to page through the database list.
Depending on the authorization method, use one of the
following combinations of request parameters:​

``` swift
public func listDatabases(input: ListDatabasesInput, completion: @escaping (ClientRuntime.SdkResult<ListDatabasesOutputResponse, ListDatabasesOutputError>) -> Void)
```

``` 
           Secrets Manager - specify the Amazon Resource Name (ARN) of the secret, the database name, and the
     cluster identifier that matches the cluster in the secret.


           Temporary credentials - specify the cluster identifier, the database name, and the
      database user name. Permission to call the redshift:GetClusterCredentials
      operation is required to use this method.
```

### `listSchemas(input:completion:)`

Lists the schemas in a database.
A token is returned to page through the schema list.
Depending on the authorization method, use one of the
following combinations of request parameters:​

``` swift
public func listSchemas(input: ListSchemasInput, completion: @escaping (ClientRuntime.SdkResult<ListSchemasOutputResponse, ListSchemasOutputError>) -> Void)
```

``` 
           Secrets Manager - specify the Amazon Resource Name (ARN) of the secret, the database name, and the
     cluster identifier that matches the cluster in the secret.


           Temporary credentials - specify the cluster identifier, the database name, and the
      database user name. Permission to call the redshift:GetClusterCredentials
      operation is required to use this method.
```

### `listStatements(input:completion:)`

List of SQL statements. By default, only finished statements are shown.
A token is returned to page through the statement list.

``` swift
public func listStatements(input: ListStatementsInput, completion: @escaping (ClientRuntime.SdkResult<ListStatementsOutputResponse, ListStatementsOutputError>) -> Void)
```

### `listTables(input:completion:)`

List the tables in a database. If neither SchemaPattern nor TablePattern are specified, then
all tables in the database are returned.
A token is returned to page through the table list.
Depending on the authorization method, use one of the
following combinations of request parameters:​

``` swift
public func listTables(input: ListTablesInput, completion: @escaping (ClientRuntime.SdkResult<ListTablesOutputResponse, ListTablesOutputError>) -> Void)
```

``` 
           Secrets Manager - specify the Amazon Resource Name (ARN) of the secret, the database name, and the
     cluster identifier that matches the cluster in the secret.


           Temporary credentials - specify the cluster identifier, the database name, and the
      database user name. Permission to call the redshift:GetClusterCredentials
      operation is required to use this method.
```
