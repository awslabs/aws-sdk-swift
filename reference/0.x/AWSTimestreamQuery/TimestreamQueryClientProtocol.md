# TimestreamQueryClientProtocol

``` swift
public protocol TimestreamQueryClientProtocol 
```

## Requirements

### cancelQuery(input:completion:)

Cancels a query that has been issued. Cancellation is guaranteed only if the query has not completed execution before the cancellation request was issued. Because cancellation is an idempotent operation, subsequent cancellation requests will return a CancellationMessage, indicating that the query has already been canceled.

``` swift
func cancelQuery(input: CancelQueryInput, completion: @escaping (ClientRuntime.SdkResult<CancelQueryOutputResponse, CancelQueryOutputError>) -> Void)
```

### describeEndpoints(input:completion:)

DescribeEndpoints returns a list of available endpoints to make Timestream API calls against. This API is available through both Write and Query. Because Timestream’s SDKs are designed to transparently work with the service’s architecture, including the management and mapping of the service endpoints, it is not recommended that you use this API unless:

``` swift
func describeEndpoints(input: DescribeEndpointsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEndpointsOutputResponse, DescribeEndpointsOutputError>) -> Void)
```

  - Your application uses a programming language that does not yet have SDK support

  - You require better control over the client-side implementation

For detailed information on how to use DescribeEndpoints, see [The Endpoint Discovery Pattern and REST APIs](https://docs.aws.amazon.com/timestream/latest/developerguide/Using-API.endpoint-discovery.html).

### query(input:completion:)

Query is a synchronous operation that enables you to execute a query. Query will timeout after 60 seconds. You must update the default timeout in the SDK to support a timeout of 60 seconds. The result set will be truncated to 1MB. Service quotas apply. For more information, see Quotas in the Timestream Developer Guide.

``` swift
func query(input: QueryInput, completion: @escaping (ClientRuntime.SdkResult<QueryOutputResponse, QueryOutputError>) -> Void)
```
