# MediaTailorClient

``` swift
public class MediaTailorClient 
```

## Inheritance

[`MediaTailorClientProtocol`](/aws-sdk-swift/reference/0.x/AWSMediaTailor/MediaTailorClientProtocol)

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

### `configureLogsForPlaybackConfiguration(input:completion:)`

Configures Amazon CloudWatch log settings for a playback configuration.

``` swift
public func configureLogsForPlaybackConfiguration(input: ConfigureLogsForPlaybackConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<ConfigureLogsForPlaybackConfigurationOutputResponse, ConfigureLogsForPlaybackConfigurationOutputError>) -> Void)
```

### `createChannel(input:completion:)`

Creates a channel.

``` swift
public func createChannel(input: CreateChannelInput, completion: @escaping (ClientRuntime.SdkResult<CreateChannelOutputResponse, CreateChannelOutputError>) -> Void)
```

### `createProgram(input:completion:)`

Creates a program.

``` swift
public func createProgram(input: CreateProgramInput, completion: @escaping (ClientRuntime.SdkResult<CreateProgramOutputResponse, CreateProgramOutputError>) -> Void)
```

### `createSourceLocation(input:completion:)`

Creates a source location on a specific channel.

``` swift
public func createSourceLocation(input: CreateSourceLocationInput, completion: @escaping (ClientRuntime.SdkResult<CreateSourceLocationOutputResponse, CreateSourceLocationOutputError>) -> Void)
```

### `createVodSource(input:completion:)`

Creates name for a specific VOD source in a source location.

``` swift
public func createVodSource(input: CreateVodSourceInput, completion: @escaping (ClientRuntime.SdkResult<CreateVodSourceOutputResponse, CreateVodSourceOutputError>) -> Void)
```

### `deleteChannel(input:completion:)`

Deletes a channel. You must stop the channel before it can be deleted.

``` swift
public func deleteChannel(input: DeleteChannelInput, completion: @escaping (ClientRuntime.SdkResult<DeleteChannelOutputResponse, DeleteChannelOutputError>) -> Void)
```

### `deleteChannelPolicy(input:completion:)`

Deletes a channel's IAM policy.

``` swift
public func deleteChannelPolicy(input: DeleteChannelPolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteChannelPolicyOutputResponse, DeleteChannelPolicyOutputError>) -> Void)
```

### `deletePlaybackConfiguration(input:completion:)`

Deletes the playback configuration for the specified name.

``` swift
public func deletePlaybackConfiguration(input: DeletePlaybackConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DeletePlaybackConfigurationOutputResponse, DeletePlaybackConfigurationOutputError>) -> Void)
```

### `deleteProgram(input:completion:)`

Deletes a specific program on a specific channel.

``` swift
public func deleteProgram(input: DeleteProgramInput, completion: @escaping (ClientRuntime.SdkResult<DeleteProgramOutputResponse, DeleteProgramOutputError>) -> Void)
```

### `deleteSourceLocation(input:completion:)`

Deletes a source location on a specific channel.

``` swift
public func deleteSourceLocation(input: DeleteSourceLocationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSourceLocationOutputResponse, DeleteSourceLocationOutputError>) -> Void)
```

### `deleteVodSource(input:completion:)`

Deletes a specific VOD source in a specific source location.

``` swift
public func deleteVodSource(input: DeleteVodSourceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVodSourceOutputResponse, DeleteVodSourceOutputError>) -> Void)
```

### `describeChannel(input:completion:)`

Describes the properties of a specific channel.

``` swift
public func describeChannel(input: DescribeChannelInput, completion: @escaping (ClientRuntime.SdkResult<DescribeChannelOutputResponse, DescribeChannelOutputError>) -> Void)
```

### `describeProgram(input:completion:)`

Retrieves the properties of the requested program.

``` swift
public func describeProgram(input: DescribeProgramInput, completion: @escaping (ClientRuntime.SdkResult<DescribeProgramOutputResponse, DescribeProgramOutputError>) -> Void)
```

### `describeSourceLocation(input:completion:)`

Retrieves the properties of the requested source location.

``` swift
public func describeSourceLocation(input: DescribeSourceLocationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSourceLocationOutputResponse, DescribeSourceLocationOutputError>) -> Void)
```

### `describeVodSource(input:completion:)`

Provides details about a specific VOD source in a specific source location.

``` swift
public func describeVodSource(input: DescribeVodSourceInput, completion: @escaping (ClientRuntime.SdkResult<DescribeVodSourceOutputResponse, DescribeVodSourceOutputError>) -> Void)
```

### `getChannelPolicy(input:completion:)`

Retrieves information about a channel's IAM policy.

``` swift
public func getChannelPolicy(input: GetChannelPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetChannelPolicyOutputResponse, GetChannelPolicyOutputError>) -> Void)
```

### `getChannelSchedule(input:completion:)`

Retrieves information about your channel's schedule.

``` swift
public func getChannelSchedule(input: GetChannelScheduleInput, completion: @escaping (ClientRuntime.SdkResult<GetChannelScheduleOutputResponse, GetChannelScheduleOutputError>) -> Void)
```

### `getPlaybackConfiguration(input:completion:)`

Returns the playback configuration for the specified name.

``` swift
public func getPlaybackConfiguration(input: GetPlaybackConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetPlaybackConfigurationOutputResponse, GetPlaybackConfigurationOutputError>) -> Void)
```

### `listAlerts(input:completion:)`

Returns a list of alerts for the given resource.

``` swift
public func listAlerts(input: ListAlertsInput, completion: @escaping (ClientRuntime.SdkResult<ListAlertsOutputResponse, ListAlertsOutputError>) -> Void)
```

### `listChannels(input:completion:)`

Retrieves a list of channels that are associated with this account.

``` swift
public func listChannels(input: ListChannelsInput, completion: @escaping (ClientRuntime.SdkResult<ListChannelsOutputResponse, ListChannelsOutputError>) -> Void)
```

### `listPlaybackConfigurations(input:completion:)`

Returns a list of the playback configurations defined in AWS Elemental MediaTailor. You can specify a maximum number of configurations to return at a time. The default maximum is 50. Results are returned in pagefuls. If MediaTailor has more configurations than the specified maximum, it provides parameters in the response that you can use to retrieve the next pageful.

``` swift
public func listPlaybackConfigurations(input: ListPlaybackConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<ListPlaybackConfigurationsOutputResponse, ListPlaybackConfigurationsOutputError>) -> Void)
```

### `listSourceLocations(input:completion:)`

Retrieves a list of source locations.

``` swift
public func listSourceLocations(input: ListSourceLocationsInput, completion: @escaping (ClientRuntime.SdkResult<ListSourceLocationsOutputResponse, ListSourceLocationsOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Returns a list of the tags assigned to the specified playback configuration resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `listVodSources(input:completion:)`

Lists all the VOD sources in a source location.

``` swift
public func listVodSources(input: ListVodSourcesInput, completion: @escaping (ClientRuntime.SdkResult<ListVodSourcesOutputResponse, ListVodSourcesOutputError>) -> Void)
```

### `putChannelPolicy(input:completion:)`

Creates an IAM policy for the channel.

``` swift
public func putChannelPolicy(input: PutChannelPolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutChannelPolicyOutputResponse, PutChannelPolicyOutputError>) -> Void)
```

### `putPlaybackConfiguration(input:completion:)`

Adds a new playback configuration to AWS Elemental MediaTailor.

``` swift
public func putPlaybackConfiguration(input: PutPlaybackConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<PutPlaybackConfigurationOutputResponse, PutPlaybackConfigurationOutputError>) -> Void)
```

### `startChannel(input:completion:)`

Starts a specific channel.

``` swift
public func startChannel(input: StartChannelInput, completion: @escaping (ClientRuntime.SdkResult<StartChannelOutputResponse, StartChannelOutputError>) -> Void)
```

### `stopChannel(input:completion:)`

Stops a specific channel.

``` swift
public func stopChannel(input: StopChannelInput, completion: @escaping (ClientRuntime.SdkResult<StopChannelOutputResponse, StopChannelOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Adds tags to the specified playback configuration resource. You can specify one or more tags to add.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes tags from the specified playback configuration resource. You can specify one or more tags to remove.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateChannel(input:completion:)`

Updates an existing channel.

``` swift
public func updateChannel(input: UpdateChannelInput, completion: @escaping (ClientRuntime.SdkResult<UpdateChannelOutputResponse, UpdateChannelOutputError>) -> Void)
```

### `updateSourceLocation(input:completion:)`

Updates a source location on a specific channel.

``` swift
public func updateSourceLocation(input: UpdateSourceLocationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSourceLocationOutputResponse, UpdateSourceLocationOutputError>) -> Void)
```

### `updateVodSource(input:completion:)`

Updates a specific VOD source in a specific source location.

``` swift
public func updateVodSource(input: UpdateVodSourceInput, completion: @escaping (ClientRuntime.SdkResult<UpdateVodSourceOutputResponse, UpdateVodSourceOutputError>) -> Void)
```
