# CodeGuruProfilerClient

``` swift
public class CodeGuruProfilerClient 
```

## Inheritance

[`CodeGuruProfilerClientProtocol`](/aws-sdk-swift/reference/0.x/AWSCodeGuruProfiler/CodeGuruProfilerClientProtocol)

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
public static let clientName = "CodeGuruProfilerClient"
```

## Methods

### `addNotificationChannels(input:completion:)`

Add up to 2 anomaly notifications channels for a profiling group.

``` swift
public func addNotificationChannels(input: AddNotificationChannelsInput, completion: @escaping (ClientRuntime.SdkResult<AddNotificationChannelsOutputResponse, AddNotificationChannelsOutputError>) -> Void)
```

### `batchGetFrameMetricData(input:completion:)`

Returns the time series of values for a requested list of frame metrics from a time period.

``` swift
public func batchGetFrameMetricData(input: BatchGetFrameMetricDataInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetFrameMetricDataOutputResponse, BatchGetFrameMetricDataOutputError>) -> Void)
```

### `configureAgent(input:completion:)`

Used by profiler agents to report their current state and to receive remote configuration updates. For example, ConfigureAgent can be used to tell an agent whether to profile or not and for how long to return profiling data.

``` swift
public func configureAgent(input: ConfigureAgentInput, completion: @escaping (ClientRuntime.SdkResult<ConfigureAgentOutputResponse, ConfigureAgentOutputError>) -> Void)
```

### `createProfilingGroup(input:completion:)`

Creates a profiling group.

``` swift
public func createProfilingGroup(input: CreateProfilingGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateProfilingGroupOutputResponse, CreateProfilingGroupOutputError>) -> Void)
```

### `deleteProfilingGroup(input:completion:)`

Deletes a profiling group.

``` swift
public func deleteProfilingGroup(input: DeleteProfilingGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteProfilingGroupOutputResponse, DeleteProfilingGroupOutputError>) -> Void)
```

### `describeProfilingGroup(input:completion:)`

Returns a [ProfilingGroupDescription](https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ProfilingGroupDescription.html) object that contains information about the requested profiling group.

``` swift
public func describeProfilingGroup(input: DescribeProfilingGroupInput, completion: @escaping (ClientRuntime.SdkResult<DescribeProfilingGroupOutputResponse, DescribeProfilingGroupOutputError>) -> Void)
```

### `getFindingsReportAccountSummary(input:completion:)`

Returns a list of [FindingsReportSummary](https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_FindingsReportSummary.html) objects that contain analysis results for all profiling groups in your AWS account.

``` swift
public func getFindingsReportAccountSummary(input: GetFindingsReportAccountSummaryInput, completion: @escaping (ClientRuntime.SdkResult<GetFindingsReportAccountSummaryOutputResponse, GetFindingsReportAccountSummaryOutputError>) -> Void)
```

### `getNotificationConfiguration(input:completion:)`

Get the current configuration for anomaly notifications for a profiling group.

``` swift
public func getNotificationConfiguration(input: GetNotificationConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetNotificationConfigurationOutputResponse, GetNotificationConfigurationOutputError>) -> Void)
```

### `getPolicy(input:completion:)`

Returns the JSON-formatted resource-based policy on a profiling group.

``` swift
public func getPolicy(input: GetPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetPolicyOutputResponse, GetPolicyOutputError>) -> Void)
```

### `getProfile(input:completion:)`

Gets the aggregated profile of a profiling group for a specified time range. Amazon CodeGuru Profiler collects posted agent profiles for a profiling group into aggregated profiles. Because aggregated profiles expire over time GetProfile is not idempotent. Specify the time range for the requested aggregated profile using 1 or 2 of the following parameters: startTime, endTime, period. The maximum time range allowed is 7 days. If you specify all 3 parameters, an exception is thrown. If you specify only period, the latest aggregated profile is returned. Aggregated profiles are available with aggregation periods of 5 minutes, 1 hour, and 1 day, aligned to UTC. The aggregation period of an aggregated profile determines how long it is retained. For more information, see [AggregatedProfileTime](https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_AggregatedProfileTime.html). The aggregated profile's aggregation period determines how long

``` swift
public func getProfile(input: GetProfileInput, completion: @escaping (ClientRuntime.SdkResult<GetProfileOutputResponse, GetProfileOutputError>) -> Void)
```

it is retained by CodeGuru Profiler.

  - If the aggregation period is 5 minutes, the aggregated profile is retained for 15 days.

  - If the aggregation period is 1 hour, the aggregated profile is retained for 60 days.

  - If the aggregation period is 1 day, the aggregated profile is retained for 3 years.

There are two use cases for calling GetProfile.

  - If you want to return an aggregated profile that already exists, use [ListProfileTimes](https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ListProfileTimes.html) to view the time ranges of existing aggregated profiles. Use them in a GetProfile request to return a specific, existing aggregated profile.

  - If you want to return an aggregated profile for a time range that doesn't align with an existing aggregated profile, then CodeGuru Profiler makes a best effort to combine existing aggregated profiles from the requested time range and return them as one aggregated profile. If aggregated profiles do not exist for the full time range requested, then aggregated profiles for a smaller time range are returned. For example, if the requested time range is from 00:00 to 00:20, and the existing aggregated profiles are from 00:15 and 00:25, then the aggregated profiles from 00:15 to 00:20 are returned.

### `getRecommendations(input:completion:)`

Returns a list of [Recommendation](https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_Recommendation.html) objects that contain recommendations for a profiling group for a given time period. A list of [Anomaly](https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_Anomaly.html) objects that contains details about anomalies detected in the profiling group for the same time period is also returned.

``` swift
public func getRecommendations(input: GetRecommendationsInput, completion: @escaping (ClientRuntime.SdkResult<GetRecommendationsOutputResponse, GetRecommendationsOutputError>) -> Void)
```

### `listFindingsReports(input:completion:)`

List the available reports for a given profiling group and time range.

``` swift
public func listFindingsReports(input: ListFindingsReportsInput, completion: @escaping (ClientRuntime.SdkResult<ListFindingsReportsOutputResponse, ListFindingsReportsOutputError>) -> Void)
```

### `listProfileTimes(input:completion:)`

Lists the start times of the available aggregated profiles of a profiling group for an aggregation period within the specified time range.

``` swift
public func listProfileTimes(input: ListProfileTimesInput, completion: @escaping (ClientRuntime.SdkResult<ListProfileTimesOutputResponse, ListProfileTimesOutputError>) -> Void)
```

### `listProfilingGroups(input:completion:)`

Returns a list of profiling groups. The profiling groups are returned as [ProfilingGroupDescription](https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ProfilingGroupDescription.html) objects.

``` swift
public func listProfilingGroups(input: ListProfilingGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListProfilingGroupsOutputResponse, ListProfilingGroupsOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Returns a list of the tags that are assigned to a specified resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `postAgentProfile(input:completion:)`

Submits profiling data to an aggregated profile of a profiling group. To get an aggregated profile that is created with this profiling data, use [GetProfile](https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_GetProfile.html).

``` swift
public func postAgentProfile(input: PostAgentProfileInput, completion: @escaping (ClientRuntime.SdkResult<PostAgentProfileOutputResponse, PostAgentProfileOutputError>) -> Void)
```

### `putPermission(input:completion:)`

Adds permissions to a profiling group's resource-based policy that are provided using an action group. If a profiling group doesn't have a resource-based policy, one is created for it using the permissions in the action group and the roles and users in the principals parameter. The one supported action group that can be added is agentPermission which grants ConfigureAgent and PostAgent permissions. For more information, see [Resource-based policies in CodeGuru Profiler](https://docs.aws.amazon.com/codeguru/latest/profiler-ug/resource-based-policies.html) in the Amazon CodeGuru Profiler User Guide, [ConfigureAgent](https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ConfigureAgent.html), and [PostAgentProfile](https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_PostAgentProfile.html). The first time you call PutPermission on a profiling group, do not specify a revisionId because it doesn't have a resource-based policy. Subsequent calls must provide a revisionId to specify which revision of the resource-based policy to add the permissions to. The response contains the profiling group's JSON-formatted resource policy.

``` swift
public func putPermission(input: PutPermissionInput, completion: @escaping (ClientRuntime.SdkResult<PutPermissionOutputResponse, PutPermissionOutputError>) -> Void)
```

### `removeNotificationChannel(input:completion:)`

Remove one anomaly notifications channel for a profiling group.

``` swift
public func removeNotificationChannel(input: RemoveNotificationChannelInput, completion: @escaping (ClientRuntime.SdkResult<RemoveNotificationChannelOutputResponse, RemoveNotificationChannelOutputError>) -> Void)
```

### `removePermission(input:completion:)`

Removes permissions from a profiling group's resource-based policy that are provided using an action group. The one supported action group that can be removed is agentPermission which grants ConfigureAgent and PostAgent permissions. For more information, see [Resource-based policies in CodeGuru Profiler](https://docs.aws.amazon.com/codeguru/latest/profiler-ug/resource-based-policies.html) in the Amazon CodeGuru Profiler User Guide, [ConfigureAgent](https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ConfigureAgent.html), and [PostAgentProfile](https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_PostAgentProfile.html).

``` swift
public func removePermission(input: RemovePermissionInput, completion: @escaping (ClientRuntime.SdkResult<RemovePermissionOutputResponse, RemovePermissionOutputError>) -> Void)
```

### `submitFeedback(input:completion:)`

Sends feedback to CodeGuru Profiler about whether the anomaly detected by the analysis is useful or not.

``` swift
public func submitFeedback(input: SubmitFeedbackInput, completion: @escaping (ClientRuntime.SdkResult<SubmitFeedbackOutputResponse, SubmitFeedbackOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Use to assign one or more tags to a resource.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Use to remove one or more tags from a resource.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateProfilingGroup(input:completion:)`

Updates a profiling group.

``` swift
public func updateProfilingGroup(input: UpdateProfilingGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateProfilingGroupOutputResponse, UpdateProfilingGroupOutputError>) -> Void)
```
