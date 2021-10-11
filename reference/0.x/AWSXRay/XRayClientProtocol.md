# XRayClientProtocol

Amazon Web Services X-Ray provides APIs for managing debug traces and retrieving service maps
and other data created by processing those traces.

``` swift
public protocol XRayClientProtocol 
```

## Requirements

### batchGetTraces(input:​completion:​)

Retrieves a list of traces specified by ID. Each trace is a collection of segment
documents that originates from a single request. Use GetTraceSummaries to get a
list of trace IDs.

``` swift
func batchGetTraces(input: BatchGetTracesInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetTracesOutputResponse, BatchGetTracesOutputError>) -> Void)
```

### createGroup(input:​completion:​)

Creates a group resource with a name and a filter expression.

``` swift
func createGroup(input: CreateGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateGroupOutputResponse, CreateGroupOutputError>) -> Void)
```

### createSamplingRule(input:​completion:​)

Creates a rule to control sampling behavior for instrumented applications. Services
retrieve rules with <a href="https:​//docs.aws.amazon.com/xray/latest/api/API_GetSamplingRules.html">GetSamplingRules, and evaluate each rule in ascending
order of priority for each request. If a rule matches, the service
records a trace, borrowing it from the reservoir size. After 10 seconds, the service
reports back to X-Ray with <a href="https:​//docs.aws.amazon.com/xray/latest/api/API_GetSamplingTargets.html">GetSamplingTargets to get updated versions of
each in-use rule. The updated rule contains a trace quota that the service can use instead
of borrowing from the reservoir.

``` swift
func createSamplingRule(input: CreateSamplingRuleInput, completion: @escaping (ClientRuntime.SdkResult<CreateSamplingRuleOutputResponse, CreateSamplingRuleOutputError>) -> Void)
```

### deleteGroup(input:​completion:​)

Deletes a group resource.

``` swift
func deleteGroup(input: DeleteGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteGroupOutputResponse, DeleteGroupOutputError>) -> Void)
```

### deleteSamplingRule(input:​completion:​)

Deletes a sampling rule.

``` swift
func deleteSamplingRule(input: DeleteSamplingRuleInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSamplingRuleOutputResponse, DeleteSamplingRuleOutputError>) -> Void)
```

### getEncryptionConfig(input:​completion:​)

Retrieves the current encryption configuration for X-Ray data.

``` swift
func getEncryptionConfig(input: GetEncryptionConfigInput, completion: @escaping (ClientRuntime.SdkResult<GetEncryptionConfigOutputResponse, GetEncryptionConfigOutputError>) -> Void)
```

### getGroup(input:​completion:​)

Retrieves group resource details.

``` swift
func getGroup(input: GetGroupInput, completion: @escaping (ClientRuntime.SdkResult<GetGroupOutputResponse, GetGroupOutputError>) -> Void)
```

### getGroups(input:​completion:​)

Retrieves all active group details.

``` swift
func getGroups(input: GetGroupsInput, completion: @escaping (ClientRuntime.SdkResult<GetGroupsOutputResponse, GetGroupsOutputError>) -> Void)
```

### getInsight(input:​completion:​)

Retrieves the summary information of an insight. This includes impact to clients and
root cause services, the top anomalous services, the category, the state of the insight,
and the start and end time of the insight.

``` swift
func getInsight(input: GetInsightInput, completion: @escaping (ClientRuntime.SdkResult<GetInsightOutputResponse, GetInsightOutputError>) -> Void)
```

### getInsightEvents(input:​completion:​)

X-Ray reevaluates insights periodically until they're resolved, and records each intermediate state as an
event. You can review an insight's events in the Impact Timeline on the Inspect page in the X-Ray
console.

``` swift
func getInsightEvents(input: GetInsightEventsInput, completion: @escaping (ClientRuntime.SdkResult<GetInsightEventsOutputResponse, GetInsightEventsOutputError>) -> Void)
```

### getInsightImpactGraph(input:​completion:​)

Retrieves a service graph structure filtered by the specified insight. The service graph is limited to only
structural information. For a complete service graph, use this API with the GetServiceGraph API.

``` swift
func getInsightImpactGraph(input: GetInsightImpactGraphInput, completion: @escaping (ClientRuntime.SdkResult<GetInsightImpactGraphOutputResponse, GetInsightImpactGraphOutputError>) -> Void)
```

### getInsightSummaries(input:​completion:​)

Retrieves the summaries of all insights in the specified group matching the provided filter values.

``` swift
func getInsightSummaries(input: GetInsightSummariesInput, completion: @escaping (ClientRuntime.SdkResult<GetInsightSummariesOutputResponse, GetInsightSummariesOutputError>) -> Void)
```

### getSamplingRules(input:​completion:​)

Retrieves all sampling rules.

``` swift
func getSamplingRules(input: GetSamplingRulesInput, completion: @escaping (ClientRuntime.SdkResult<GetSamplingRulesOutputResponse, GetSamplingRulesOutputError>) -> Void)
```

### getSamplingStatisticSummaries(input:​completion:​)

Retrieves information about recent sampling results for all sampling rules.

``` swift
func getSamplingStatisticSummaries(input: GetSamplingStatisticSummariesInput, completion: @escaping (ClientRuntime.SdkResult<GetSamplingStatisticSummariesOutputResponse, GetSamplingStatisticSummariesOutputError>) -> Void)
```

### getSamplingTargets(input:​completion:​)

Requests a sampling quota for rules that the service is using to sample requests.

``` swift
func getSamplingTargets(input: GetSamplingTargetsInput, completion: @escaping (ClientRuntime.SdkResult<GetSamplingTargetsOutputResponse, GetSamplingTargetsOutputError>) -> Void)
```

### getServiceGraph(input:​completion:​)

Retrieves a document that describes services that process incoming requests, and
downstream services that they call as a result. Root services process incoming requests and
make calls to downstream services. Root services are applications that use the <a href="https:​//docs.aws.amazon.com/xray/index.html">Amazon Web Services X-Ray SDK.
Downstream services can be other applications, Amazon Web Services resources, HTTP web APIs, or SQL
databases.

``` swift
func getServiceGraph(input: GetServiceGraphInput, completion: @escaping (ClientRuntime.SdkResult<GetServiceGraphOutputResponse, GetServiceGraphOutputError>) -> Void)
```

### getTimeSeriesServiceStatistics(input:​completion:​)

Get an aggregation of service statistics defined by a specific time
range.

``` swift
func getTimeSeriesServiceStatistics(input: GetTimeSeriesServiceStatisticsInput, completion: @escaping (ClientRuntime.SdkResult<GetTimeSeriesServiceStatisticsOutputResponse, GetTimeSeriesServiceStatisticsOutputError>) -> Void)
```

### getTraceGraph(input:​completion:​)

Retrieves a service graph for one or more specific trace IDs.

``` swift
func getTraceGraph(input: GetTraceGraphInput, completion: @escaping (ClientRuntime.SdkResult<GetTraceGraphOutputResponse, GetTraceGraphOutputError>) -> Void)
```

### getTraceSummaries(input:​completion:​)

Retrieves IDs and annotations for traces available for a specified time frame using an
optional filter. To get the full traces, pass the trace IDs to
BatchGetTraces.
A filter expression can target traced requests that hit specific service nodes or
edges, have errors, or come from a known user. For example, the following filter expression
targets traces that pass through api.example.com:​

``` swift
func getTraceSummaries(input: GetTraceSummariesInput, completion: @escaping (ClientRuntime.SdkResult<GetTraceSummariesOutputResponse, GetTraceSummariesOutputError>) -> Void)
```

``` 
        service("api.example.com")

     This filter expression finds traces that have an annotation named account
  with the value 12345:

        annotation.account = "12345"

     For a full list of indexed fields and keywords that you can use in filter expressions,
  see <a href="https://docs.aws.amazon.com/xray/latest/devguide/xray-console-filters.html">Using Filter
    Expressions in the Amazon Web Services X-Ray Developer Guide.
```

### listTagsForResource(input:​completion:​)

Returns a list of tags that are applied to the specified Amazon Web Services X-Ray group or sampling rule.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### putEncryptionConfig(input:​completion:​)

Updates the encryption configuration for X-Ray data.

``` swift
func putEncryptionConfig(input: PutEncryptionConfigInput, completion: @escaping (ClientRuntime.SdkResult<PutEncryptionConfigOutputResponse, PutEncryptionConfigOutputError>) -> Void)
```

### putTelemetryRecords(input:​completion:​)

Used by the Amazon Web Services X-Ray daemon to upload telemetry.

``` swift
func putTelemetryRecords(input: PutTelemetryRecordsInput, completion: @escaping (ClientRuntime.SdkResult<PutTelemetryRecordsOutputResponse, PutTelemetryRecordsOutputError>) -> Void)
```

### putTraceSegments(input:​completion:​)

Uploads segment documents to Amazon Web Services X-Ray. The <a href="https:​//docs.aws.amazon.com/xray/index.html">X-Ray SDK generates segment documents and sends them to the X-Ray daemon, which uploads them in
batches. A segment document can be a completed segment, an in-progress segment, or an array of
subsegments.
Segments must include the following fields. For the full segment document schema, see
<a href="https:​//docs.aws.amazon.com/xray/latest/devguide/xray-api-segmentdocuments.html">Amazon Web Services X-Ray
Segment Documents in the Amazon Web Services X-Ray Developer Guide.

<p class="title">
Required segment document fields

``` swift
func putTraceSegments(input: PutTraceSegmentsInput, completion: @escaping (ClientRuntime.SdkResult<PutTraceSegmentsOutputResponse, PutTraceSegmentsOutputError>) -> Void)
```

``` 
              name - The name of the service that handled the request.



              id - A 64-bit identifier for the segment, unique among segments in the same trace, in 16
      hexadecimal digits.



              trace_id - A unique identifier that connects all segments and subsegments originating from
      a single client request.



              start_time - Time the segment or subsegment was created, in floating point seconds in
      epoch time, accurate to milliseconds. For example, 1480615200.010 or
        1.480615200010E9.



              end_time - Time the segment or subsegment was closed. For example,
        1480615200.090 or 1.480615200090E9. Specify either an end_time or
        in_progress.



              in_progress - Set to true instead of specifying an end_time to
      record that a segment has been started, but is not complete. Send an in-progress segment when your application
      receives a request that will take a long time to serve, to trace that the request was received. When the
      response is sent, send the complete segment to overwrite the in-progress segment.


     A trace_id consists of three numbers separated by hyphens. For example,
  1-58406520-a006649127e371903a2de979. This includes:
     <p class="title">
        Trace ID Format



           The version number, for instance, 1.


           The time of the original request, in Unix epoch time, in 8 hexadecimal digits. For
      example, 10:00AM December 2nd, 2016 PST in epoch time is 1480615200 seconds,
      or 58406520 in hexadecimal.


           A 96-bit identifier for the trace, globally unique, in 24 hexadecimal
      digits.
```

### tagResource(input:​completion:​)

Applies tags to an existing Amazon Web Services X-Ray group or sampling rule.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:​completion:​)

Removes tags from an Amazon Web Services X-Ray group or sampling rule. You cannot edit or delete system
tags (those with an aws:​ prefix).

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateGroup(input:​completion:​)

Updates a group resource.

``` swift
func updateGroup(input: UpdateGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateGroupOutputResponse, UpdateGroupOutputError>) -> Void)
```

### updateSamplingRule(input:​completion:​)

Modifies a sampling rule's configuration.

``` swift
func updateSamplingRule(input: UpdateSamplingRuleInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSamplingRuleOutputResponse, UpdateSamplingRuleOutputError>) -> Void)
```
