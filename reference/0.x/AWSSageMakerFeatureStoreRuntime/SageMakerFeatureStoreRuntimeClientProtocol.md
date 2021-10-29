# SageMakerFeatureStoreRuntimeClientProtocol

Contains all data plane API operations and data types for the Amazon SageMaker Feature Store. Use this API to put, delete, and retrieve (get) features from a feature store. Use the following operations to configure your OnlineStore and OfflineStore features, and to create and manage feature groups:

``` swift
public protocol SageMakerFeatureStoreRuntimeClientProtocol 
```

  - [CreateFeatureGroup](https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreateFeatureGroup.html)

  - [DeleteFeatureGroup](https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_DeleteFeatureGroup.html)

  - [DescribeFeatureGroup](https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_DescribeFeatureGroup.html)

  - [ListFeatureGroups](https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_ListFeatureGroups.html)

## Requirements

### batchGetRecord(input:completion:)

Retrieves a batch of Records from a FeatureGroup.

``` swift
func batchGetRecord(input: BatchGetRecordInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetRecordOutputResponse, BatchGetRecordOutputError>) -> Void)
```

### deleteRecord(input:completion:)

Deletes a Record from a FeatureGroup. A new record will show up in the OfflineStore when the DeleteRecord API is called. This record will have a value of True in the is\_deleted column.

``` swift
func deleteRecord(input: DeleteRecordInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRecordOutputResponse, DeleteRecordOutputError>) -> Void)
```

### getRecord(input:completion:)

Use for OnlineStore serving from a FeatureStore. Only the latest records stored in the OnlineStore can be retrieved. If no Record with RecordIdentifierValue is found, then an empty result is returned.

``` swift
func getRecord(input: GetRecordInput, completion: @escaping (ClientRuntime.SdkResult<GetRecordOutputResponse, GetRecordOutputError>) -> Void)
```

### putRecord(input:completion:)

Used for data ingestion into the FeatureStore. The PutRecord API writes to both the OnlineStore and OfflineStore. If the record is the latest record for the recordIdentifier, the record is written to both the OnlineStore and OfflineStore. If the record is a historic record, it is written only to the OfflineStore.

``` swift
func putRecord(input: PutRecordInput, completion: @escaping (ClientRuntime.SdkResult<PutRecordOutputResponse, PutRecordOutputError>) -> Void)
```
