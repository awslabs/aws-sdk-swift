# HoneycodeClient

``` swift
public class HoneycodeClient 
```

## Inheritance

[`HoneycodeClientProtocol`](/aws-sdk-swift/reference/0.x/AWSHoneycode/HoneycodeClientProtocol)

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
public static let clientName = "HoneycodeClient"
```

## Methods

### `batchCreateTableRows(input:completion:)`

The BatchCreateTableRows API allows you to create one or more rows at the end of a table in a workbook. The API allows you to specify the values to set in some or all of the columns in the new rows. If a column is not explicitly set in a specific row, then the column level formula specified in the table will be applied to the new row. If there is no column level formula but the last row of the table has a formula, then that formula will be copied down to the new row. If there is no column level formula and no formula in the last row of the table, then that column will be left blank for the new rows.

``` swift
public func batchCreateTableRows(input: BatchCreateTableRowsInput, completion: @escaping (ClientRuntime.SdkResult<BatchCreateTableRowsOutputResponse, BatchCreateTableRowsOutputError>) -> Void)
```

### `batchDeleteTableRows(input:completion:)`

The BatchDeleteTableRows API allows you to delete one or more rows from a table in a workbook. You need to specify the ids of the rows that you want to delete from the table.

``` swift
public func batchDeleteTableRows(input: BatchDeleteTableRowsInput, completion: @escaping (ClientRuntime.SdkResult<BatchDeleteTableRowsOutputResponse, BatchDeleteTableRowsOutputError>) -> Void)
```

### `batchUpdateTableRows(input:completion:)`

The BatchUpdateTableRows API allows you to update one or more rows in a table in a workbook. You can specify the values to set in some or all of the columns in the table for the specified rows. If a column is not explicitly specified in a particular row, then that column will not be updated for that row. To clear out the data in a specific cell, you need to set the value as an empty string ("").

``` swift
public func batchUpdateTableRows(input: BatchUpdateTableRowsInput, completion: @escaping (ClientRuntime.SdkResult<BatchUpdateTableRowsOutputResponse, BatchUpdateTableRowsOutputError>) -> Void)
```

### `batchUpsertTableRows(input:completion:)`

The BatchUpsertTableRows API allows you to upsert one or more rows in a table. The upsert operation takes a filter expression as input and evaluates it to find matching rows on the destination table. If matching rows are found, it will update the cells in the matching rows to new values specified in the request. If no matching rows are found, a new row is added at the end of the table and the cells in that row are set to the new values specified in the request. You can specify the values to set in some or all of the columns in the table for the matching or newly appended rows. If a column is not explicitly specified for a particular row, then that column will not be updated for that row. To clear out the data in a specific cell, you need to set the value as an empty string ("").

``` swift
public func batchUpsertTableRows(input: BatchUpsertTableRowsInput, completion: @escaping (ClientRuntime.SdkResult<BatchUpsertTableRowsOutputResponse, BatchUpsertTableRowsOutputError>) -> Void)
```

### `describeTableDataImportJob(input:completion:)`

The DescribeTableDataImportJob API allows you to retrieve the status and details of a table data import job.

``` swift
public func describeTableDataImportJob(input: DescribeTableDataImportJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTableDataImportJobOutputResponse, DescribeTableDataImportJobOutputError>) -> Void)
```

### `getScreenData(input:completion:)`

The GetScreenData API allows retrieval of data from a screen in a Honeycode app. The API allows setting local variables in the screen to filter, sort or otherwise affect what will be displayed on the screen.

``` swift
public func getScreenData(input: GetScreenDataInput, completion: @escaping (ClientRuntime.SdkResult<GetScreenDataOutputResponse, GetScreenDataOutputError>) -> Void)
```

### `invokeScreenAutomation(input:completion:)`

The InvokeScreenAutomation API allows invoking an action defined in a screen in a Honeycode app. The API allows setting local variables, which can then be used in the automation being invoked. This allows automating the Honeycode app interactions to write, update or delete data in the workbook.

``` swift
public func invokeScreenAutomation(input: InvokeScreenAutomationInput, completion: @escaping (ClientRuntime.SdkResult<InvokeScreenAutomationOutputResponse, InvokeScreenAutomationOutputError>) -> Void)
```

### `listTableColumns(input:completion:)`

The ListTableColumns API allows you to retrieve a list of all the columns in a table in a workbook.

``` swift
public func listTableColumns(input: ListTableColumnsInput, completion: @escaping (ClientRuntime.SdkResult<ListTableColumnsOutputResponse, ListTableColumnsOutputError>) -> Void)
```

### `listTableRows(input:completion:)`

The ListTableRows API allows you to retrieve a list of all the rows in a table in a workbook.

``` swift
public func listTableRows(input: ListTableRowsInput, completion: @escaping (ClientRuntime.SdkResult<ListTableRowsOutputResponse, ListTableRowsOutputError>) -> Void)
```

### `listTables(input:completion:)`

The ListTables API allows you to retrieve a list of all the tables in a workbook.

``` swift
public func listTables(input: ListTablesInput, completion: @escaping (ClientRuntime.SdkResult<ListTablesOutputResponse, ListTablesOutputError>) -> Void)
```

### `queryTableRows(input:completion:)`

The QueryTableRows API allows you to use a filter formula to query for specific rows in a table.

``` swift
public func queryTableRows(input: QueryTableRowsInput, completion: @escaping (ClientRuntime.SdkResult<QueryTableRowsOutputResponse, QueryTableRowsOutputError>) -> Void)
```

### `startTableDataImportJob(input:completion:)`

The StartTableDataImportJob API allows you to start an import job on a table. This API will only return the id of the job that was started. To find out the status of the import request, you need to call the DescribeTableDataImportJob API.

``` swift
public func startTableDataImportJob(input: StartTableDataImportJobInput, completion: @escaping (ClientRuntime.SdkResult<StartTableDataImportJobOutputResponse, StartTableDataImportJobOutputError>) -> Void)
```
