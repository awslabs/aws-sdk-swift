# IvsClient

``` swift
public class IvsClient 
```

## Inheritance

[`IvsClientProtocol`](/aws-sdk-swift/reference/0.x/AWSIvs/IvsClientProtocol)

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

### `batchGetChannel(input:completion:)`

Performs GetChannel on multiple ARNs simultaneously.

``` swift
public func batchGetChannel(input: BatchGetChannelInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetChannelOutputResponse, BatchGetChannelOutputError>) -> Void)
```

### `batchGetStreamKey(input:completion:)`

Performs GetStreamKey on multiple ARNs simultaneously.

``` swift
public func batchGetStreamKey(input: BatchGetStreamKeyInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetStreamKeyOutputResponse, BatchGetStreamKeyOutputError>) -> Void)
```

### `createChannel(input:completion:)`

Creates a new channel and an associated stream key to start streaming.

``` swift
public func createChannel(input: CreateChannelInput, completion: @escaping (ClientRuntime.SdkResult<CreateChannelOutputResponse, CreateChannelOutputError>) -> Void)
```

### `createRecordingConfiguration(input:completion:)`

Creates a new recording configuration, used to enable recording to Amazon S3.

``` swift
public func createRecordingConfiguration(input: CreateRecordingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<CreateRecordingConfigurationOutputResponse, CreateRecordingConfigurationOutputError>) -> Void)
```

``` 
        Known issue: In the us-east-1 region, if you use the AWS
  CLI to create a recording configuration, it returns success even if the S3 bucket is in a
  different region. In this case, the state of the recording configuration is
    CREATE_FAILED (instead of ACTIVE). (In other regions, the CLI
  correctly returns failure if the bucket is in a different region.)

        Workaround: Ensure that your S3 bucket is in the same region as the recording
  configuration. If you create a recording configuration in a different region as your S3
  bucket, delete that recording configuration and create a new one with an S3 bucket from the
  correct region.
```

### `createStreamKey(input:completion:)`

Creates a stream key, used to initiate a stream, for the specified channel ARN.
Note that CreateChannel creates a stream key. If you subsequently use
CreateStreamKey on the same channel, it will fail because a stream key already exists and
there is a limit of 1 stream key per channel. To reset the stream key on a channel, use DeleteStreamKey and then CreateStreamKey.

``` swift
public func createStreamKey(input: CreateStreamKeyInput, completion: @escaping (ClientRuntime.SdkResult<CreateStreamKeyOutputResponse, CreateStreamKeyOutputError>) -> Void)
```

### `deleteChannel(input:completion:)`

Deletes the specified channel and its associated stream keys.
If you try to delete a live channel, you will get an error (409 ConflictException). To
delete a channel that is live, call StopStream, wait for the Amazon
EventBridge "Stream End" event (to verify that the stream's state was changed from Live to
Offline), then call DeleteChannel. (See <a href="https:​//docs.aws.amazon.com/ivs/latest/userguide/eventbridge.html"> Using EventBridge with Amazon IVS.)

``` swift
public func deleteChannel(input: DeleteChannelInput, completion: @escaping (ClientRuntime.SdkResult<DeleteChannelOutputResponse, DeleteChannelOutputError>) -> Void)
```

### `deletePlaybackKeyPair(input:completion:)`

Deletes a specified authorization key pair. This invalidates future viewer tokens
generated using the key pair’s privateKey. For more information, see <a href="https:​//docs.aws.amazon.com/ivs/latest/userguide/private-channels.html">Setting Up Private
Channels in the Amazon IVS User Guide.

``` swift
public func deletePlaybackKeyPair(input: DeletePlaybackKeyPairInput, completion: @escaping (ClientRuntime.SdkResult<DeletePlaybackKeyPairOutputResponse, DeletePlaybackKeyPairOutputError>) -> Void)
```

### `deleteRecordingConfiguration(input:completion:)`

Deletes the recording configuration for the specified ARN.
If you try to delete a recording configuration that is associated with a channel, you will
get an error (409 ConflictException). To avoid this, for all channels that reference the
recording configuration, first use UpdateChannel to set the
recordingConfigurationArn field to an empty string, then use
DeleteRecordingConfiguration.

``` swift
public func deleteRecordingConfiguration(input: DeleteRecordingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRecordingConfigurationOutputResponse, DeleteRecordingConfigurationOutputError>) -> Void)
```

### `deleteStreamKey(input:completion:)`

Deletes the stream key for the specified ARN, so it can no longer be used to
stream.

``` swift
public func deleteStreamKey(input: DeleteStreamKeyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteStreamKeyOutputResponse, DeleteStreamKeyOutputError>) -> Void)
```

### `getChannel(input:completion:)`

Gets the channel configuration for the specified channel ARN. See also BatchGetChannel.

``` swift
public func getChannel(input: GetChannelInput, completion: @escaping (ClientRuntime.SdkResult<GetChannelOutputResponse, GetChannelOutputError>) -> Void)
```

### `getPlaybackKeyPair(input:completion:)`

Gets a specified playback authorization key pair and returns the arn and
fingerprint. The privateKey held by the caller can be used to
generate viewer authorization tokens, to grant viewers access to private channels. For more
information, see <a href="https:​//docs.aws.amazon.com/ivs/latest/userguide/private-channels.html">Setting Up Private Channels in the Amazon IVS User
Guide.

``` swift
public func getPlaybackKeyPair(input: GetPlaybackKeyPairInput, completion: @escaping (ClientRuntime.SdkResult<GetPlaybackKeyPairOutputResponse, GetPlaybackKeyPairOutputError>) -> Void)
```

### `getRecordingConfiguration(input:completion:)`

Gets the recording configuration for the specified ARN.

``` swift
public func getRecordingConfiguration(input: GetRecordingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetRecordingConfigurationOutputResponse, GetRecordingConfigurationOutputError>) -> Void)
```

### `getStream(input:completion:)`

Gets information about the active (live) stream on a specified channel.

``` swift
public func getStream(input: GetStreamInput, completion: @escaping (ClientRuntime.SdkResult<GetStreamOutputResponse, GetStreamOutputError>) -> Void)
```

### `getStreamKey(input:completion:)`

Gets stream-key information for a specified ARN.

``` swift
public func getStreamKey(input: GetStreamKeyInput, completion: @escaping (ClientRuntime.SdkResult<GetStreamKeyOutputResponse, GetStreamKeyOutputError>) -> Void)
```

### `importPlaybackKeyPair(input:completion:)`

Imports the public portion of a new key pair and returns its arn and
fingerprint. The privateKey can then be used to generate viewer
authorization tokens, to grant viewers access to private channels. For more information, see
<a href="https:​//docs.aws.amazon.com/ivs/latest/userguide/private-channels.html">Setting Up
Private Channels in the Amazon IVS User Guide.

``` swift
public func importPlaybackKeyPair(input: ImportPlaybackKeyPairInput, completion: @escaping (ClientRuntime.SdkResult<ImportPlaybackKeyPairOutputResponse, ImportPlaybackKeyPairOutputError>) -> Void)
```

### `listChannels(input:completion:)`

Gets summary information about all channels in your account, in the AWS region where the
API request is processed. This list can be filtered to match a specified name or
recording-configuration ARN. Filters are mutually exclusive and cannot be used together. If
you try to use both filters, you will get an error (409 ConflictException).

``` swift
public func listChannels(input: ListChannelsInput, completion: @escaping (ClientRuntime.SdkResult<ListChannelsOutputResponse, ListChannelsOutputError>) -> Void)
```

### `listPlaybackKeyPairs(input:completion:)`

Gets summary information about playback key pairs. For more information, see <a href="https:​//docs.aws.amazon.com/ivs/latest/userguide/private-channels.html">Setting Up Private
Channels in the Amazon IVS User Guide.

``` swift
public func listPlaybackKeyPairs(input: ListPlaybackKeyPairsInput, completion: @escaping (ClientRuntime.SdkResult<ListPlaybackKeyPairsOutputResponse, ListPlaybackKeyPairsOutputError>) -> Void)
```

### `listRecordingConfigurations(input:completion:)`

Gets summary information about all recording configurations in your account, in the AWS
region where the API request is processed.

``` swift
public func listRecordingConfigurations(input: ListRecordingConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<ListRecordingConfigurationsOutputResponse, ListRecordingConfigurationsOutputError>) -> Void)
```

### `listStreamKeys(input:completion:)`

Gets summary information about stream keys for the specified channel.

``` swift
public func listStreamKeys(input: ListStreamKeysInput, completion: @escaping (ClientRuntime.SdkResult<ListStreamKeysOutputResponse, ListStreamKeysOutputError>) -> Void)
```

### `listStreams(input:completion:)`

Gets summary information about live streams in your account, in the AWS region where the
API request is processed.

``` swift
public func listStreams(input: ListStreamsInput, completion: @escaping (ClientRuntime.SdkResult<ListStreamsOutputResponse, ListStreamsOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Gets information about AWS tags for the specified ARN.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `putMetadata(input:completion:)`

Inserts metadata into the active stream of the specified channel. A maximum of 5 requests
per second per channel is allowed, each with a maximum 1 KB payload. (If 5 TPS is not
sufficient for your needs, we recommend batching your data into a single PutMetadata call.)

``` swift
public func putMetadata(input: PutMetadataInput, completion: @escaping (ClientRuntime.SdkResult<PutMetadataOutputResponse, PutMetadataOutputError>) -> Void)
```

``` 
  Also see <a href="https://docs.aws.amazon.com/ivs/latest/userguide/metadata.html">Embedding Metadata

    within a Video Stream in the Amazon IVS User Guide.
```

### `stopStream(input:completion:)`

Disconnects the incoming RTMPS stream for the specified channel. Can be used in
conjunction with DeleteStreamKey to prevent further streaming to a
channel.

``` swift
public func stopStream(input: StopStreamInput, completion: @escaping (ClientRuntime.SdkResult<StopStreamOutputResponse, StopStreamOutputError>) -> Void)
```

``` 
        Many streaming client-software libraries automatically reconnect a dropped RTMPS
    session, so to stop the stream permanently, you may want to first revoke the
      streamKey attached to the channel.
```

### `tagResource(input:completion:)`

Adds or updates tags for the AWS resource with the specified ARN.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes tags from the resource with the specified ARN.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateChannel(input:completion:)`

Updates a channel's configuration. This does not affect an ongoing stream of this channel.
You must stop and restart the stream for the changes to take effect.

``` swift
public func updateChannel(input: UpdateChannelInput, completion: @escaping (ClientRuntime.SdkResult<UpdateChannelOutputResponse, UpdateChannelOutputError>) -> Void)
```
