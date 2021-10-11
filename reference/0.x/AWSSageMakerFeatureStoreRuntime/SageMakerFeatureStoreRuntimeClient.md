# SageMakerFeatureStoreRuntimeClient

``` swift
public class SageMakerFeatureStoreRuntimeClient 
```

## Inheritance

[`SageMakerFeatureStoreRuntimeClientProtocol`](/aws-sdk-swift/reference/0.x/AWSSageMakerFeatureStoreRuntime/SageMakerFeatureStoreRuntimeClientProtocol)

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

### `batchGetRecord(input:completion:)`

Retrieves a batch of Records from a FeatureGroup.

``` swift
public func batchGetRecord(input: BatchGetRecordInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetRecordOutputResponse, BatchGetRecordOutputError>) -> Void)
```

### `deleteRecord(input:completion:)`

Deletes a Record from a FeatureGroup. A new record will show
up in the OfflineStore when the DeleteRecord API is called. This
record will have a value of True in the is\_deleted column.

``` swift
public func deleteRecord(input: DeleteRecordInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRecordOutputResponse, DeleteRecordOutputError>) -> Void)
```

### `getRecord(input:completion:)`

Use for OnlineStore serving from a FeatureStore. Only the
latest records stored in the OnlineStore can be retrieved. If no Record with
RecordIdentifierValue is found, then an empty result is returned.

``` swift
public func getRecord(input: GetRecordInput, completion: @escaping (ClientRuntime.SdkResult<GetRecordOutputResponse, GetRecordOutputError>) -> Void)
```

### `putRecord(input:completion:)`

Used for data ingestion into the FeatureStore. The PutRecord
API writes to both the OnlineStore and OfflineStore. If the
record is the latest record for the recordIdentifier, the record is written to
both the OnlineStore and OfflineStore. If the record is a
historic record, it is written only to the OfflineStore.

``` swift
public func putRecord(input: PutRecordInput, completion: @escaping (ClientRuntime.SdkResult<PutRecordOutputResponse, PutRecordOutputError>) -> Void)
```
