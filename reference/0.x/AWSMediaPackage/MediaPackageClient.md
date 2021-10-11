# MediaPackageClient

``` swift
public class MediaPackageClient 
```

## Inheritance

[`MediaPackageClientProtocol`](/aws-sdk-swift/reference/0.x/AWSMediaPackage/MediaPackageClientProtocol)

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

### `configureLogs(input:completion:)`

Changes the Channel's properities to configure log subscription

``` swift
public func configureLogs(input: ConfigureLogsInput, completion: @escaping (ClientRuntime.SdkResult<ConfigureLogsOutputResponse, ConfigureLogsOutputError>) -> Void)
```

### `createChannel(input:completion:)`

Creates a new Channel.

``` swift
public func createChannel(input: CreateChannelInput, completion: @escaping (ClientRuntime.SdkResult<CreateChannelOutputResponse, CreateChannelOutputError>) -> Void)
```

### `createHarvestJob(input:completion:)`

Creates a new HarvestJob record.

``` swift
public func createHarvestJob(input: CreateHarvestJobInput, completion: @escaping (ClientRuntime.SdkResult<CreateHarvestJobOutputResponse, CreateHarvestJobOutputError>) -> Void)
```

### `createOriginEndpoint(input:completion:)`

Creates a new OriginEndpoint record.

``` swift
public func createOriginEndpoint(input: CreateOriginEndpointInput, completion: @escaping (ClientRuntime.SdkResult<CreateOriginEndpointOutputResponse, CreateOriginEndpointOutputError>) -> Void)
```

### `deleteChannel(input:completion:)`

Deletes an existing Channel.

``` swift
public func deleteChannel(input: DeleteChannelInput, completion: @escaping (ClientRuntime.SdkResult<DeleteChannelOutputResponse, DeleteChannelOutputError>) -> Void)
```

### `deleteOriginEndpoint(input:completion:)`

Deletes an existing OriginEndpoint.

``` swift
public func deleteOriginEndpoint(input: DeleteOriginEndpointInput, completion: @escaping (ClientRuntime.SdkResult<DeleteOriginEndpointOutputResponse, DeleteOriginEndpointOutputError>) -> Void)
```

### `describeChannel(input:completion:)`

Gets details about a Channel.

``` swift
public func describeChannel(input: DescribeChannelInput, completion: @escaping (ClientRuntime.SdkResult<DescribeChannelOutputResponse, DescribeChannelOutputError>) -> Void)
```

### `describeHarvestJob(input:completion:)`

Gets details about an existing HarvestJob.

``` swift
public func describeHarvestJob(input: DescribeHarvestJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeHarvestJobOutputResponse, DescribeHarvestJobOutputError>) -> Void)
```

### `describeOriginEndpoint(input:completion:)`

Gets details about an existing OriginEndpoint.

``` swift
public func describeOriginEndpoint(input: DescribeOriginEndpointInput, completion: @escaping (ClientRuntime.SdkResult<DescribeOriginEndpointOutputResponse, DescribeOriginEndpointOutputError>) -> Void)
```

### `listChannels(input:completion:)`

Returns a collection of Channels.

``` swift
public func listChannels(input: ListChannelsInput, completion: @escaping (ClientRuntime.SdkResult<ListChannelsOutputResponse, ListChannelsOutputError>) -> Void)
```

### `listHarvestJobs(input:completion:)`

Returns a collection of HarvestJob records.

``` swift
public func listHarvestJobs(input: ListHarvestJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListHarvestJobsOutputResponse, ListHarvestJobsOutputError>) -> Void)
```

### `listOriginEndpoints(input:completion:)`

Returns a collection of OriginEndpoint records.

``` swift
public func listOriginEndpoints(input: ListOriginEndpointsInput, completion: @escaping (ClientRuntime.SdkResult<ListOriginEndpointsOutputResponse, ListOriginEndpointsOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `rotateChannelCredentials(input:completion:)`

Changes the Channel's first IngestEndpoint's username and password. WARNING - This API is deprecated. Please use RotateIngestEndpointCredentials instead

``` swift
@available(*, deprecated, message: "This API is deprecated. Please use RotateIngestEndpointCredentials instead")
    public func rotateChannelCredentials(input: RotateChannelCredentialsInput, completion: @escaping (ClientRuntime.SdkResult<RotateChannelCredentialsOutputResponse, RotateChannelCredentialsOutputError>) -> Void)
```

### `rotateIngestEndpointCredentials(input:completion:)`

Rotate the IngestEndpoint's username and password, as specified by the IngestEndpoint's id.

``` swift
public func rotateIngestEndpointCredentials(input: RotateIngestEndpointCredentialsInput, completion: @escaping (ClientRuntime.SdkResult<RotateIngestEndpointCredentialsOutputResponse, RotateIngestEndpointCredentialsOutputError>) -> Void)
```

### `tagResource(input:completion:)`

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateChannel(input:completion:)`

Updates an existing Channel.

``` swift
public func updateChannel(input: UpdateChannelInput, completion: @escaping (ClientRuntime.SdkResult<UpdateChannelOutputResponse, UpdateChannelOutputError>) -> Void)
```

### `updateOriginEndpoint(input:completion:)`

Updates an existing OriginEndpoint.

``` swift
public func updateOriginEndpoint(input: UpdateOriginEndpointInput, completion: @escaping (ClientRuntime.SdkResult<UpdateOriginEndpointOutputResponse, UpdateOriginEndpointOutputError>) -> Void)
```
