# PiClientProtocol

Amazon RDS Performance Insights Amazon RDS Performance Insights enables you to monitor and explore different dimensions of database load based on data captured from a running DB instance. The guide provides detailed information about Performance Insights data types, parameters and errors. When Performance Insights is enabled, the Amazon RDS Performance Insights API provides visibility into the performance of your DB instance. Amazon CloudWatch provides the authoritative source for AWS service-vended monitoring metrics. Performance Insights offers a domain-specific view of DB load. DB load is measured as Average Active Sessions. Performance Insights provides the data to API consumers as a two-dimensional time-series dataset. The time dimension provides DB load data for each time point in the queried time range. Each time point decomposes overall load in relation to the requested dimensions, measured at that time point. Examples include SQL, Wait event, User, and Host.

``` swift
public protocol PiClientProtocol 
```

  - To learn more about Performance Insights and Amazon Aurora DB instances, go to the [Amazon Aurora User Guide](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_PerfInsights.html).

  - To learn more about Performance Insights and Amazon RDS DB instances, go to the [Amazon RDS User Guide](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PerfInsights.html).

## Requirements

### describeDimensionKeys(input:completion:)

For a specific time period, retrieve the top N dimension keys for a metric. Each response element returns a maximum of 500 bytes. For larger elements, such as SQL statements, only the first 500 bytes are returned.

``` swift
func describeDimensionKeys(input: DescribeDimensionKeysInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDimensionKeysOutputResponse, DescribeDimensionKeysOutputError>) -> Void)
```

### getDimensionKeyDetails(input:completion:)

Get the attributes of the specified dimension group for a DB instance or data source. For example, if you specify a SQL ID, GetDimensionKeyDetails retrieves the full text of the dimension db.sql.statement associated with this ID. This operation is useful because GetResourceMetrics and DescribeDimensionKeys don't support retrieval of large SQL statement text.

``` swift
func getDimensionKeyDetails(input: GetDimensionKeyDetailsInput, completion: @escaping (ClientRuntime.SdkResult<GetDimensionKeyDetailsOutputResponse, GetDimensionKeyDetailsOutputError>) -> Void)
```

### getResourceMetrics(input:completion:)

Retrieve Performance Insights metrics for a set of data sources, over a time period. You can provide specific dimension groups and dimensions, and provide aggregation and filtering criteria for each group. Each response element returns a maximum of 500 bytes. For larger elements, such as SQL statements, only the first 500 bytes are returned.

``` swift
func getResourceMetrics(input: GetResourceMetricsInput, completion: @escaping (ClientRuntime.SdkResult<GetResourceMetricsOutputResponse, GetResourceMetricsOutputError>) -> Void)
```
