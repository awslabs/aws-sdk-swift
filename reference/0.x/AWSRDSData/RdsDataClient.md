# RdsDataClient

``` swift
public class RdsDataClient 
```

## Inheritance

[`RdsDataClientProtocol`](/aws-sdk-swift/reference/0.x/AWSRDSData/RdsDataClientProtocol)

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
public static let clientName = "RdsDataClient"
```

## Methods

### `batchExecuteStatement(input:completion:)`

Runs a batch SQL statement over an array of data. You can run bulk update and insert operations for multiple records using a DML statement with different parameter sets. Bulk operations can provide a significant performance improvement over individual insert and update operations. If a call isn't part of a transaction because it doesn't include the transactionID parameter, changes that result from the call are committed automatically.

``` swift
public func batchExecuteStatement(input: BatchExecuteStatementInput, completion: @escaping (ClientRuntime.SdkResult<BatchExecuteStatementOutputResponse, BatchExecuteStatementOutputError>) -> Void)
```

### `beginTransaction(input:completion:)`

Starts a SQL transaction. A transaction can run for a maximum of 24 hours. A transaction is terminated and rolled back automatically after 24 hours. A transaction times out if no calls use its transaction ID in three minutes. If a transaction times out before it's committed, it's rolled back automatically. DDL statements inside a transaction cause an implicit commit. We recommend that you run each DDL statement in a separate ExecuteStatement call with continueAfterTimeout enabled.

``` swift
public func beginTransaction(input: BeginTransactionInput, completion: @escaping (ClientRuntime.SdkResult<BeginTransactionOutputResponse, BeginTransactionOutputError>) -> Void)
```

### `commitTransaction(input:completion:)`

Ends a SQL transaction started with the BeginTransaction operation and commits the changes.

``` swift
public func commitTransaction(input: CommitTransactionInput, completion: @escaping (ClientRuntime.SdkResult<CommitTransactionOutputResponse, CommitTransactionOutputError>) -> Void)
```

### `executeSql(input:completion:)`

Runs one or more SQL statements. This operation is deprecated. Use the BatchExecuteStatement or ExecuteStatement operation.

``` swift
@available(*, deprecated, message: "The ExecuteSql API is deprecated, please use the ExecuteStatement API. API deprecated since 2019-03-21")
    public func executeSql(input: ExecuteSqlInput, completion: @escaping (ClientRuntime.SdkResult<ExecuteSqlOutputResponse, ExecuteSqlOutputError>) -> Void)
```

### `executeStatement(input:completion:)`

Runs a SQL statement against a database. If a call isn't part of a transaction because it doesn't include the transactionID parameter, changes that result from the call are committed automatically. The response size limit is 1 MB. If the call returns more than 1 MB of response data, the call is terminated.

``` swift
public func executeStatement(input: ExecuteStatementInput, completion: @escaping (ClientRuntime.SdkResult<ExecuteStatementOutputResponse, ExecuteStatementOutputError>) -> Void)
```

### `rollbackTransaction(input:completion:)`

Performs a rollback of a transaction. Rolling back a transaction cancels its changes.

``` swift
public func rollbackTransaction(input: RollbackTransactionInput, completion: @escaping (ClientRuntime.SdkResult<RollbackTransactionOutputResponse, RollbackTransactionOutputError>) -> Void)
```
