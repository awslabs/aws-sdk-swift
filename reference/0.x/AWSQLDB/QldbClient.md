# QldbClient

``` swift
public class QldbClient 
```

## Inheritance

[`QldbClientProtocol`](/aws-sdk-swift/reference/0.x/AWSQLDB/QldbClientProtocol)

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

### `cancelJournalKinesisStream(input:completion:)`

Ends a given Amazon QLDB journal stream. Before a stream can be canceled, its current
status must be ACTIVE.
You can't restart a stream after you cancel it. Canceled QLDB stream resources are
subject to a 7-day retention period, so they are automatically deleted after this limit
expires.

``` swift
public func cancelJournalKinesisStream(input: CancelJournalKinesisStreamInput, completion: @escaping (ClientRuntime.SdkResult<CancelJournalKinesisStreamOutputResponse, CancelJournalKinesisStreamOutputError>) -> Void)
```

### `createLedger(input:completion:)`

Creates a new ledger in your account in the current Region.

``` swift
public func createLedger(input: CreateLedgerInput, completion: @escaping (ClientRuntime.SdkResult<CreateLedgerOutputResponse, CreateLedgerOutputError>) -> Void)
```

### `deleteLedger(input:completion:)`

Deletes a ledger and all of its contents. This action is irreversible.
If deletion protection is enabled, you must first disable it before you can delete the
ledger. You can disable it by calling the UpdateLedger operation to set the flag to false.

``` swift
public func deleteLedger(input: DeleteLedgerInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLedgerOutputResponse, DeleteLedgerOutputError>) -> Void)
```

### `describeJournalKinesisStream(input:completion:)`

Returns detailed information about a given Amazon QLDB journal stream. The output
includes the Amazon Resource Name (ARN), stream name, current status, creation time, and
the parameters of the original stream creation request.
This action does not return any expired journal streams. For more information, see
<a href="https:​//docs.aws.amazon.com/qldb/latest/developerguide/streams.create.html#streams.create.states.expiration">Expiration for terminal streams in the Amazon QLDB Developer
Guide.

``` swift
public func describeJournalKinesisStream(input: DescribeJournalKinesisStreamInput, completion: @escaping (ClientRuntime.SdkResult<DescribeJournalKinesisStreamOutputResponse, DescribeJournalKinesisStreamOutputError>) -> Void)
```

### `describeJournalS3Export(input:completion:)`

Returns information about a journal export job, including the ledger name, export ID,
creation time, current status, and the parameters of the original export creation
request.
This action does not return any expired export jobs. For more information, see <a href="https:​//docs.aws.amazon.com/qldb/latest/developerguide/export-journal.request.html#export-journal.request.expiration">Export job expiration in the Amazon QLDB Developer
Guide.
If the export job with the given ExportId doesn't exist, then throws
ResourceNotFoundException.
If the ledger with the given Name doesn't exist, then throws
ResourceNotFoundException.

``` swift
public func describeJournalS3Export(input: DescribeJournalS3ExportInput, completion: @escaping (ClientRuntime.SdkResult<DescribeJournalS3ExportOutputResponse, DescribeJournalS3ExportOutputError>) -> Void)
```

### `describeLedger(input:completion:)`

Returns information about a ledger, including its state, permissions mode, encryption at
rest settings, and when it was created.

``` swift
public func describeLedger(input: DescribeLedgerInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLedgerOutputResponse, DescribeLedgerOutputError>) -> Void)
```

### `exportJournalToS3(input:completion:)`

Exports journal contents within a date and time range from a ledger into a specified
Amazon Simple Storage Service (Amazon S3) bucket. The data is written as files in Amazon Ion format.
If the ledger with the given Name doesn't exist, then throws
ResourceNotFoundException.
If the ledger with the given Name is in CREATING status, then
throws ResourcePreconditionNotMetException.
You can initiate up to two concurrent journal export requests for each ledger. Beyond
this limit, journal export requests throw LimitExceededException.

``` swift
public func exportJournalToS3(input: ExportJournalToS3Input, completion: @escaping (ClientRuntime.SdkResult<ExportJournalToS3OutputResponse, ExportJournalToS3OutputError>) -> Void)
```

### `getBlock(input:completion:)`

Returns a block object at a specified address in a journal. Also returns a proof of the
specified block for verification if DigestTipAddress is provided.
For information about the data contents in a block, see <a href="https:​//docs.aws.amazon.com/qldb/latest/developerguide/journal-contents.html">Journal contents in the
Amazon QLDB Developer Guide.
If the specified ledger doesn't exist or is in DELETING status, then throws
ResourceNotFoundException.
If the specified ledger is in CREATING status, then throws
ResourcePreconditionNotMetException.
If no block exists with the specified address, then throws
InvalidParameterException.

``` swift
public func getBlock(input: GetBlockInput, completion: @escaping (ClientRuntime.SdkResult<GetBlockOutputResponse, GetBlockOutputError>) -> Void)
```

### `getDigest(input:completion:)`

Returns the digest of a ledger at the latest committed block in the journal. The
response includes a 256-bit hash value and a block address.

``` swift
public func getDigest(input: GetDigestInput, completion: @escaping (ClientRuntime.SdkResult<GetDigestOutputResponse, GetDigestOutputError>) -> Void)
```

### `getRevision(input:completion:)`

Returns a revision data object for a specified document ID and block address. Also
returns a proof of the specified revision for verification if DigestTipAddress
is provided.

``` swift
public func getRevision(input: GetRevisionInput, completion: @escaping (ClientRuntime.SdkResult<GetRevisionOutputResponse, GetRevisionOutputError>) -> Void)
```

### `listJournalKinesisStreamsForLedger(input:completion:)`

Returns an array of all Amazon QLDB journal stream descriptors for a given ledger. The
output of each stream descriptor includes the same details that are returned by
DescribeJournalKinesisStream.
This action does not return any expired journal streams. For more information, see
<a href="https:​//docs.aws.amazon.com/qldb/latest/developerguide/streams.create.html#streams.create.states.expiration">Expiration for terminal streams in the Amazon QLDB Developer
Guide.
This action returns a maximum of MaxResults items. It is paginated so that
you can retrieve all the items by calling ListJournalKinesisStreamsForLedger
multiple times.

``` swift
public func listJournalKinesisStreamsForLedger(input: ListJournalKinesisStreamsForLedgerInput, completion: @escaping (ClientRuntime.SdkResult<ListJournalKinesisStreamsForLedgerOutputResponse, ListJournalKinesisStreamsForLedgerOutputError>) -> Void)
```

### `listJournalS3Exports(input:completion:)`

Returns an array of journal export job descriptions for all ledgers that are associated
with the current account and Region.
This action returns a maximum of MaxResults items, and is paginated so that
you can retrieve all the items by calling ListJournalS3Exports multiple
times.
This action does not return any expired export jobs. For more information, see <a href="https:​//docs.aws.amazon.com/qldb/latest/developerguide/export-journal.request.html#export-journal.request.expiration">Export job expiration in the Amazon QLDB Developer
Guide.

``` swift
public func listJournalS3Exports(input: ListJournalS3ExportsInput, completion: @escaping (ClientRuntime.SdkResult<ListJournalS3ExportsOutputResponse, ListJournalS3ExportsOutputError>) -> Void)
```

### `listJournalS3ExportsForLedger(input:completion:)`

Returns an array of journal export job descriptions for a specified ledger.
This action returns a maximum of MaxResults items, and is paginated so that
you can retrieve all the items by calling ListJournalS3ExportsForLedger
multiple times.
This action does not return any expired export jobs. For more information, see <a href="https:​//docs.aws.amazon.com/qldb/latest/developerguide/export-journal.request.html#export-journal.request.expiration">Export job expiration in the Amazon QLDB Developer
Guide.

``` swift
public func listJournalS3ExportsForLedger(input: ListJournalS3ExportsForLedgerInput, completion: @escaping (ClientRuntime.SdkResult<ListJournalS3ExportsForLedgerOutputResponse, ListJournalS3ExportsForLedgerOutputError>) -> Void)
```

### `listLedgers(input:completion:)`

Returns an array of ledger summaries that are associated with the current account
and Region.
This action returns a maximum of 100 items and is paginated so that you can
retrieve all the items by calling ListLedgers multiple times.

``` swift
public func listLedgers(input: ListLedgersInput, completion: @escaping (ClientRuntime.SdkResult<ListLedgersOutputResponse, ListLedgersOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Returns all tags for a specified Amazon QLDB resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `streamJournalToKinesis(input:completion:)`

Creates a journal stream for a given Amazon QLDB ledger. The stream captures every
document revision that is committed to the ledger's journal and delivers the data to a
specified Amazon Kinesis Data Streams resource.

``` swift
public func streamJournalToKinesis(input: StreamJournalToKinesisInput, completion: @escaping (ClientRuntime.SdkResult<StreamJournalToKinesisOutputResponse, StreamJournalToKinesisOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Adds one or more tags to a specified Amazon QLDB resource.
A resource can have up to 50 tags. If you try to create more than 50 tags for a
resource, your request fails and returns an error.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes one or more tags from a specified Amazon QLDB resource. You can specify up to 50
tag keys to remove.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateLedger(input:completion:)`

Updates properties on a ledger.

``` swift
public func updateLedger(input: UpdateLedgerInput, completion: @escaping (ClientRuntime.SdkResult<UpdateLedgerOutputResponse, UpdateLedgerOutputError>) -> Void)
```

### `updateLedgerPermissionsMode(input:completion:)`

Updates the permissions mode of a ledger.

``` swift
public func updateLedgerPermissionsMode(input: UpdateLedgerPermissionsModeInput, completion: @escaping (ClientRuntime.SdkResult<UpdateLedgerPermissionsModeOutputResponse, UpdateLedgerPermissionsModeOutputError>) -> Void)
```

``` 
        Before you switch to the STANDARD permissions mode, you must first
        create all required IAM policies and table tags to avoid disruption to your users. To
        learn more, see <a href="https://docs.aws.amazon.com/qldb/latest/developerguide/ledger-management.basics.html#ledger-mgmt.basics.update-permissions.migrating">Migrating to the standard permissions mode in the Amazon QLDB
           Developer Guide.
```
