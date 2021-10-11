# CodeGuruProfilerClientProtocol

This section provides documentation for the Amazon CodeGuru Profiler API operations.

``` swift
public protocol CodeGuruProfilerClientProtocol 
```

Amazon CodeGuru Profiler collects runtime performance data from your live applications, and provides
recommendations that can help you fine-tune your application performance. Using machine learning
algorithms, CodeGuru Profiler can help you find your most expensive lines of code and suggest ways you can
improve efficiency and remove CPU bottlenecks.

Amazon CodeGuru Profiler provides different visualizations of profiling data to help you identify what code is
running on the CPU, see how much time is consumed, and suggest ways to reduce CPU utilization.

Amazon CodeGuru Profiler currently supports applications written in all Java virtual machine (JVM)
languages and Python. While CodeGuru Profiler supports both visualizations and recommendations for applications
written in Java, it can also generate visualizations and a subset of recommendations for
applications written in other JVM languages and Python.

For more information, see <a href="https://docs.aws.amazon.com/codeguru/latest/profiler-ug/what-is-codeguru-profiler.html">What is Amazon CodeGuru Profiler in
the Amazon CodeGuru Profiler User Guide.

## Requirements

### addNotificationChannels(input:​completion:​)

Add up to 2 anomaly notifications channels for a profiling group.

``` swift
func addNotificationChannels(input: AddNotificationChannelsInput, completion: @escaping (ClientRuntime.SdkResult<AddNotificationChannelsOutputResponse, AddNotificationChannelsOutputError>) -> Void)
```

### batchGetFrameMetricData(input:​completion:​)

Returns the time series of values for a requested list
of frame metrics from a time period.

``` swift
func batchGetFrameMetricData(input: BatchGetFrameMetricDataInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetFrameMetricDataOutputResponse, BatchGetFrameMetricDataOutputError>) -> Void)
```

### configureAgent(input:​completion:​)

Used by profiler agents to report their current state and to receive remote
configuration updates. For example, ConfigureAgent can be used
to tell an agent whether to profile or not and for how long to return profiling data.

``` swift
func configureAgent(input: ConfigureAgentInput, completion: @escaping (ClientRuntime.SdkResult<ConfigureAgentOutputResponse, ConfigureAgentOutputError>) -> Void)
```

### createProfilingGroup(input:​completion:​)

Creates a profiling group.

``` swift
func createProfilingGroup(input: CreateProfilingGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateProfilingGroupOutputResponse, CreateProfilingGroupOutputError>) -> Void)
```

### deleteProfilingGroup(input:​completion:​)

Deletes a profiling group.

``` swift
func deleteProfilingGroup(input: DeleteProfilingGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteProfilingGroupOutputResponse, DeleteProfilingGroupOutputError>) -> Void)
```

### describeProfilingGroup(input:​completion:​)

Returns a <a href="https:​//docs.aws.amazon.com/codeguru/latest/profiler-api/API_ProfilingGroupDescription.html">
ProfilingGroupDescription

``` swift
func describeProfilingGroup(input: DescribeProfilingGroupInput, completion: @escaping (ClientRuntime.SdkResult<DescribeProfilingGroupOutputResponse, DescribeProfilingGroupOutputError>) -> Void)
```

object that contains information about the requested profiling group.

### getFindingsReportAccountSummary(input:​completion:​)

Returns a list of
<a href="https:​//docs.aws.amazon.com/codeguru/latest/profiler-api/API_FindingsReportSummary.html">
FindingsReportSummary

``` swift
func getFindingsReportAccountSummary(input: GetFindingsReportAccountSummaryInput, completion: @escaping (ClientRuntime.SdkResult<GetFindingsReportAccountSummaryOutputResponse, GetFindingsReportAccountSummaryOutputError>) -> Void)
```

objects that contain analysis results for all profiling groups in your AWS account.

### getNotificationConfiguration(input:​completion:​)

Get the current configuration for anomaly notifications for a profiling group.

``` swift
func getNotificationConfiguration(input: GetNotificationConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetNotificationConfigurationOutputResponse, GetNotificationConfigurationOutputError>) -> Void)
```

### getPolicy(input:​completion:​)

Returns the JSON-formatted resource-based policy on a profiling group.

``` swift
func getPolicy(input: GetPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetPolicyOutputResponse, GetPolicyOutputError>) -> Void)
```

### getProfile(input:​completion:​)

Gets the aggregated profile of a profiling group for a specified time range.
Amazon CodeGuru Profiler collects posted agent profiles for a profiling group
into aggregated profiles.

``` swift
func getProfile(input: GetProfileInput, completion: @escaping (ClientRuntime.SdkResult<GetProfileOutputResponse, GetProfileOutputError>) -> Void)
```

Because aggregated profiles expire over time GetProfile is not idempotent.

Specify the time range for the requested aggregated profile using 1 or 2 of the following parameters: startTime,
endTime, period. The maximum time range allowed is 7 days. If you specify all 3 parameters,
an exception is thrown. If you specify only period, the latest aggregated profile is returned.

Aggregated profiles are available with aggregation periods of 5 minutes, 1 hour, and 1 day, aligned to
UTC. The aggregation period of an aggregated profile determines how long it is retained. For more
information, see <a href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_AggregatedProfileTime.html">
AggregatedProfileTime
. The aggregated profile's aggregation period determines how long
it is retained by CodeGuru Profiler.

``` 
  If the aggregation period is 5 minutes, the aggregated profile is retained for 15 days.




  If the aggregation period is 1 hour, the aggregated profile is retained for 60 days.




  If the aggregation period is 1 day, the aggregated profile is retained for 3 years.
```

There are two use cases for calling GetProfile.

<ol>

``` 
  If you want to return an aggregated profile that already exists, use
  <a href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ListProfileTimes.html">
        ListProfileTimes
      to
  view the time ranges of existing aggregated profiles. Use them in a GetProfile request to return a specific,
  existing aggregated profile.




  If you want to return an aggregated profile for a time range that doesn't align with an existing aggregated profile,
  then CodeGuru Profiler makes a best effort to combine existing aggregated profiles from the requested time
  range and return them as one aggregated profile.


   If aggregated profiles do not exist for the full time range requested, then
  aggregated profiles for a smaller time range are returned. For example, if the
  requested time range is from 00:00 to 00:20, and the existing aggregated profiles are
  from 00:15 and 00:25, then the aggregated profiles from 00:15 to 00:20 are returned.
```

</ol>

### getRecommendations(input:​completion:​)

Returns a list of
<a href="https:​//docs.aws.amazon.com/codeguru/latest/profiler-api/API_Recommendation.html">
Recommendation

``` swift
func getRecommendations(input: GetRecommendationsInput, completion: @escaping (ClientRuntime.SdkResult<GetRecommendationsOutputResponse, GetRecommendationsOutputError>) -> Void)
```

objects that contain recommendations for a profiling group for a given time period. A list of
<a href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_Anomaly.html">
Anomaly

objects that contains details about anomalies detected in the profiling group for the same time period is also
returned.

### listFindingsReports(input:​completion:​)

List the available reports for a given profiling group and time range.

``` swift
func listFindingsReports(input: ListFindingsReportsInput, completion: @escaping (ClientRuntime.SdkResult<ListFindingsReportsOutputResponse, ListFindingsReportsOutputError>) -> Void)
```

### listProfileTimes(input:​completion:​)

Lists the start times of the available aggregated profiles of a profiling group
for an aggregation period within the specified time range.

``` swift
func listProfileTimes(input: ListProfileTimesInput, completion: @escaping (ClientRuntime.SdkResult<ListProfileTimesOutputResponse, ListProfileTimesOutputError>) -> Void)
```

### listProfilingGroups(input:​completion:​)

Returns a list of profiling groups. The profiling groups are returned as
<a href="https:​//docs.aws.amazon.com/codeguru/latest/profiler-api/API_ProfilingGroupDescription.html">
ProfilingGroupDescription

``` swift
func listProfilingGroups(input: ListProfilingGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListProfilingGroupsOutputResponse, ListProfilingGroupsOutputError>) -> Void)
```

objects.

### listTagsForResource(input:​completion:​)

Returns a list of the tags that are assigned to a specified resource.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### postAgentProfile(input:​completion:​)

Submits profiling data to an aggregated profile of a profiling group. To get an
aggregated profile that is created with this profiling data, use
<a href="https:​//docs.aws.amazon.com/codeguru/latest/profiler-api/API_GetProfile.html">
GetProfile
.

``` swift
func postAgentProfile(input: PostAgentProfileInput, completion: @escaping (ClientRuntime.SdkResult<PostAgentProfileOutputResponse, PostAgentProfileOutputError>) -> Void)
```

### putPermission(input:​completion:​)

Adds permissions to a profiling group's resource-based policy
that are provided using an action group. If a profiling group doesn't have
a resource-based policy, one is created for it using the permissions in the action group and
the roles and users in the principals parameter.

``` swift
func putPermission(input: PutPermissionInput, completion: @escaping (ClientRuntime.SdkResult<PutPermissionOutputResponse, PutPermissionOutputError>) -> Void)
```

The one supported action group that can be added is agentPermission
which grants ConfigureAgent and PostAgent permissions. For
more information, see <a href="https://docs.aws.amazon.com/codeguru/latest/profiler-ug/resource-based-policies.html">Resource-based
policies in CodeGuru Profiler in the Amazon CodeGuru Profiler User
Guide, <a href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ConfigureAgent.html">
ConfigureAgent
, and <a href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_PostAgentProfile.html">
PostAgentProfile
.

The first time you call PutPermission on a profiling group, do not specify a revisionId because
it doesn't have a resource-based policy. Subsequent calls must provide a revisionId to specify
which revision of the resource-based policy to add the permissions to.

The response contains the profiling group's JSON-formatted resource policy.

### removeNotificationChannel(input:​completion:​)

Remove one anomaly notifications channel for a profiling group.

``` swift
func removeNotificationChannel(input: RemoveNotificationChannelInput, completion: @escaping (ClientRuntime.SdkResult<RemoveNotificationChannelOutputResponse, RemoveNotificationChannelOutputError>) -> Void)
```

### removePermission(input:​completion:​)

Removes permissions from a profiling group's resource-based policy that are provided
using an action group. The one supported action group that can be removed is
agentPermission which grants ConfigureAgent and
PostAgent permissions. For more information, see <a href="https:​//docs.aws.amazon.com/codeguru/latest/profiler-ug/resource-based-policies.html">Resource-based policies in CodeGuru Profiler in the Amazon
CodeGuru Profiler User Guide, <a href="https:​//docs.aws.amazon.com/codeguru/latest/profiler-api/API_ConfigureAgent.html">
ConfigureAgent
, and <a href="https:​//docs.aws.amazon.com/codeguru/latest/profiler-api/API_PostAgentProfile.html">
PostAgentProfile
.

``` swift
func removePermission(input: RemovePermissionInput, completion: @escaping (ClientRuntime.SdkResult<RemovePermissionOutputResponse, RemovePermissionOutputError>) -> Void)
```

### submitFeedback(input:​completion:​)

Sends feedback to CodeGuru Profiler about whether the anomaly detected by the analysis is
useful or not.

``` swift
func submitFeedback(input: SubmitFeedbackInput, completion: @escaping (ClientRuntime.SdkResult<SubmitFeedbackOutputResponse, SubmitFeedbackOutputError>) -> Void)
```

### tagResource(input:​completion:​)

Use to assign one or more tags to a resource.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:​completion:​)

Use to remove one or more tags from a resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateProfilingGroup(input:​completion:​)

Updates a profiling group.

``` swift
func updateProfilingGroup(input: UpdateProfilingGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateProfilingGroupOutputResponse, UpdateProfilingGroupOutputError>) -> Void)
```
