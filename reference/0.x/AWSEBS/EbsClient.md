# EbsClient

``` swift
public class EbsClient 
```

## Inheritance

[`EbsClientProtocol`](/aws-sdk-swift/reference/0.x/AWSEBS/EbsClientProtocol)

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

### `completeSnapshot(input:completion:)`

Seals and completes the snapshot after all of the required blocks of data have been
written to it. Completing the snapshot changes the status to completed. You
cannot write new blocks to a snapshot after it has been completed.

``` swift
public func completeSnapshot(input: CompleteSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<CompleteSnapshotOutputResponse, CompleteSnapshotOutputError>) -> Void)
```

### `getSnapshotBlock(input:completion:)`

Returns the data in a block in an Amazon Elastic Block Store snapshot.

``` swift
public func getSnapshotBlock(input: GetSnapshotBlockInput, completion: @escaping (ClientRuntime.SdkResult<GetSnapshotBlockOutputResponse, GetSnapshotBlockOutputError>) -> Void)
```

### `listChangedBlocks(input:completion:)`

Returns information about the blocks that are different between two
Amazon Elastic Block Store snapshots of the same volume/snapshot lineage.

``` swift
public func listChangedBlocks(input: ListChangedBlocksInput, completion: @escaping (ClientRuntime.SdkResult<ListChangedBlocksOutputResponse, ListChangedBlocksOutputError>) -> Void)
```

### `listSnapshotBlocks(input:completion:)`

Returns information about the blocks in an Amazon Elastic Block Store snapshot.

``` swift
public func listSnapshotBlocks(input: ListSnapshotBlocksInput, completion: @escaping (ClientRuntime.SdkResult<ListSnapshotBlocksOutputResponse, ListSnapshotBlocksOutputError>) -> Void)
```

### `putSnapshotBlock(input:completion:)`

Writes a block of data to a snapshot. If the specified block contains
data, the existing data is overwritten. The target snapshot must be in the
pending state.
Data written to a snapshot must be aligned with 512-KiB sectors.

``` swift
public func putSnapshotBlock(input: PutSnapshotBlockInput, completion: @escaping (ClientRuntime.SdkResult<PutSnapshotBlockOutputResponse, PutSnapshotBlockOutputError>) -> Void)
```

### `startSnapshot(input:completion:)`

Creates a new Amazon EBS snapshot. The new snapshot enters the pending state
after the request completes.
After creating the snapshot, use <a href="https:​//docs.aws.amazon.com/ebs/latest/APIReference/API_PutSnapshotBlock.html"> PutSnapshotBlock to
write blocks of data to the snapshot.

``` swift
public func startSnapshot(input: StartSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<StartSnapshotOutputResponse, StartSnapshotOutputError>) -> Void)
```
