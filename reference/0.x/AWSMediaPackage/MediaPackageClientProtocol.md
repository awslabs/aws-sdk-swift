# MediaPackageClientProtocol

AWS Elemental MediaPackage

``` swift
public protocol MediaPackageClientProtocol 
```

## Requirements

### configureLogs(input:​completion:​)

Changes the Channel's properities to configure log subscription

``` swift
func configureLogs(input: ConfigureLogsInput, completion: @escaping (ClientRuntime.SdkResult<ConfigureLogsOutputResponse, ConfigureLogsOutputError>) -> Void)
```

### createChannel(input:​completion:​)

Creates a new Channel.

``` swift
func createChannel(input: CreateChannelInput, completion: @escaping (ClientRuntime.SdkResult<CreateChannelOutputResponse, CreateChannelOutputError>) -> Void)
```

### createHarvestJob(input:​completion:​)

Creates a new HarvestJob record.

``` swift
func createHarvestJob(input: CreateHarvestJobInput, completion: @escaping (ClientRuntime.SdkResult<CreateHarvestJobOutputResponse, CreateHarvestJobOutputError>) -> Void)
```

### createOriginEndpoint(input:​completion:​)

Creates a new OriginEndpoint record.

``` swift
func createOriginEndpoint(input: CreateOriginEndpointInput, completion: @escaping (ClientRuntime.SdkResult<CreateOriginEndpointOutputResponse, CreateOriginEndpointOutputError>) -> Void)
```

### deleteChannel(input:​completion:​)

Deletes an existing Channel.

``` swift
func deleteChannel(input: DeleteChannelInput, completion: @escaping (ClientRuntime.SdkResult<DeleteChannelOutputResponse, DeleteChannelOutputError>) -> Void)
```

### deleteOriginEndpoint(input:​completion:​)

Deletes an existing OriginEndpoint.

``` swift
func deleteOriginEndpoint(input: DeleteOriginEndpointInput, completion: @escaping (ClientRuntime.SdkResult<DeleteOriginEndpointOutputResponse, DeleteOriginEndpointOutputError>) -> Void)
```

### describeChannel(input:​completion:​)

Gets details about a Channel.

``` swift
func describeChannel(input: DescribeChannelInput, completion: @escaping (ClientRuntime.SdkResult<DescribeChannelOutputResponse, DescribeChannelOutputError>) -> Void)
```

### describeHarvestJob(input:​completion:​)

Gets details about an existing HarvestJob.

``` swift
func describeHarvestJob(input: DescribeHarvestJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeHarvestJobOutputResponse, DescribeHarvestJobOutputError>) -> Void)
```

### describeOriginEndpoint(input:​completion:​)

Gets details about an existing OriginEndpoint.

``` swift
func describeOriginEndpoint(input: DescribeOriginEndpointInput, completion: @escaping (ClientRuntime.SdkResult<DescribeOriginEndpointOutputResponse, DescribeOriginEndpointOutputError>) -> Void)
```

### listChannels(input:​completion:​)

Returns a collection of Channels.

``` swift
func listChannels(input: ListChannelsInput, completion: @escaping (ClientRuntime.SdkResult<ListChannelsOutputResponse, ListChannelsOutputError>) -> Void)
```

### listHarvestJobs(input:​completion:​)

Returns a collection of HarvestJob records.

``` swift
func listHarvestJobs(input: ListHarvestJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListHarvestJobsOutputResponse, ListHarvestJobsOutputError>) -> Void)
```

### listOriginEndpoints(input:​completion:​)

Returns a collection of OriginEndpoint records.

``` swift
func listOriginEndpoints(input: ListOriginEndpointsInput, completion: @escaping (ClientRuntime.SdkResult<ListOriginEndpointsOutputResponse, ListOriginEndpointsOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### rotateChannelCredentials(input:​completion:​)

Changes the Channel's first IngestEndpoint's username and password. WARNING - This API is deprecated. Please use RotateIngestEndpointCredentials instead

``` swift
@available(*, deprecated, message: "This API is deprecated. Please use RotateIngestEndpointCredentials instead")
    func rotateChannelCredentials(input: RotateChannelCredentialsInput, completion: @escaping (ClientRuntime.SdkResult<RotateChannelCredentialsOutputResponse, RotateChannelCredentialsOutputError>) -> Void)
```

### rotateIngestEndpointCredentials(input:​completion:​)

Rotate the IngestEndpoint's username and password, as specified by the IngestEndpoint's id.

``` swift
func rotateIngestEndpointCredentials(input: RotateIngestEndpointCredentialsInput, completion: @escaping (ClientRuntime.SdkResult<RotateIngestEndpointCredentialsOutputResponse, RotateIngestEndpointCredentialsOutputError>) -> Void)
```

### tagResource(input:​completion:​)

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:​completion:​)

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateChannel(input:​completion:​)

Updates an existing Channel.

``` swift
func updateChannel(input: UpdateChannelInput, completion: @escaping (ClientRuntime.SdkResult<UpdateChannelOutputResponse, UpdateChannelOutputError>) -> Void)
```

### updateOriginEndpoint(input:​completion:​)

Updates an existing OriginEndpoint.

``` swift
func updateOriginEndpoint(input: UpdateOriginEndpointInput, completion: @escaping (ClientRuntime.SdkResult<UpdateOriginEndpointOutputResponse, UpdateOriginEndpointOutputError>) -> Void)
```
