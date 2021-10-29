# DynamoDbStreamsClient

``` swift
public class DynamoDbStreamsClient 
```

## Inheritance

[`DynamoDbStreamsClientProtocol`](/aws-sdk-swift/reference/0.x/AWSDynamoDBStreams/DynamoDbStreamsClientProtocol)

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
public static let clientName = "DynamoDbStreamsClient"
```

## Methods

### `describeStream(input:completion:)`

Returns information about a stream, including the current status of the stream, its Amazon Resource Name (ARN), the composition of its shards, and its corresponding DynamoDB table. You can call DescribeStream at a maximum rate of 10 times per second. Each shard in the stream has a SequenceNumberRange associated with it. If the SequenceNumberRange has a StartingSequenceNumber but no EndingSequenceNumber, then the shard is still open (able to receive more stream records). If both StartingSequenceNumber and EndingSequenceNumber are present, then that shard is closed and can no longer receive more data.

``` swift
public func describeStream(input: DescribeStreamInput, completion: @escaping (ClientRuntime.SdkResult<DescribeStreamOutputResponse, DescribeStreamOutputError>) -> Void)
```

### `getRecords(input:completion:)`

Retrieves the stream records from a given shard. Specify a shard iterator using the ShardIterator parameter. The shard iterator specifies the position in the shard from which you want to start reading stream records sequentially. If there are no stream records available in the portion of the shard that the iterator points to, GetRecords returns an empty list. Note that it might take multiple calls to get to a portion of the shard that contains stream records. GetRecords can retrieve a maximum of 1 MB of data or 1000 stream records, whichever comes first.

``` swift
public func getRecords(input: GetRecordsInput, completion: @escaping (ClientRuntime.SdkResult<GetRecordsOutputResponse, GetRecordsOutputError>) -> Void)
```

### `getShardIterator(input:completion:)`

Returns a shard iterator. A shard iterator provides information about how to retrieve the stream records from within a shard. Use the shard iterator in a subsequent GetRecords request to read the stream records from the shard. A shard iterator expires 15 minutes after it is returned to the requester.

``` swift
public func getShardIterator(input: GetShardIteratorInput, completion: @escaping (ClientRuntime.SdkResult<GetShardIteratorOutputResponse, GetShardIteratorOutputError>) -> Void)
```

### `listStreams(input:completion:)`

Returns an array of stream ARNs associated with the current account and endpoint. If the TableName parameter is present, then ListStreams will return only the streams ARNs for that table. You can call ListStreams at a maximum rate of 5 times per second.

``` swift
public func listStreams(input: ListStreamsInput, completion: @escaping (ClientRuntime.SdkResult<ListStreamsOutputResponse, ListStreamsOutputError>) -> Void)
```
