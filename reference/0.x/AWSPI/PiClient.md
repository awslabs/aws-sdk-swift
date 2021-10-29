# PiClient

``` swift
public class PiClient 
```

## Inheritance

[`PiClientProtocol`](/aws-sdk-swift/reference/0.x/AWSPI/PiClientProtocol)

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
public static let clientName = "PiClient"
```

## Methods

### `describeDimensionKeys(input:completion:)`

For a specific time period, retrieve the top N dimension keys for a metric. Each response element returns a maximum of 500 bytes. For larger elements, such as SQL statements, only the first 500 bytes are returned.

``` swift
public func describeDimensionKeys(input: DescribeDimensionKeysInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDimensionKeysOutputResponse, DescribeDimensionKeysOutputError>) -> Void)
```

### `getDimensionKeyDetails(input:completion:)`

Get the attributes of the specified dimension group for a DB instance or data source. For example, if you specify a SQL ID, GetDimensionKeyDetails retrieves the full text of the dimension db.sql.statement associated with this ID. This operation is useful because GetResourceMetrics and DescribeDimensionKeys don't support retrieval of large SQL statement text.

``` swift
public func getDimensionKeyDetails(input: GetDimensionKeyDetailsInput, completion: @escaping (ClientRuntime.SdkResult<GetDimensionKeyDetailsOutputResponse, GetDimensionKeyDetailsOutputError>) -> Void)
```

### `getResourceMetrics(input:completion:)`

Retrieve Performance Insights metrics for a set of data sources, over a time period. You can provide specific dimension groups and dimensions, and provide aggregation and filtering criteria for each group. Each response element returns a maximum of 500 bytes. For larger elements, such as SQL statements, only the first 500 bytes are returned.

``` swift
public func getResourceMetrics(input: GetResourceMetricsInput, completion: @escaping (ClientRuntime.SdkResult<GetResourceMetricsOutputResponse, GetResourceMetricsOutputError>) -> Void)
```
