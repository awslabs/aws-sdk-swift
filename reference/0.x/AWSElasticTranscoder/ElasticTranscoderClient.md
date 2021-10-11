# ElasticTranscoderClient

``` swift
public class ElasticTranscoderClient 
```

## Inheritance

[`ElasticTranscoderClientProtocol`](/aws-sdk-swift/reference/0.x/AWSElasticTranscoder/ElasticTranscoderClientProtocol)

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

### `cancelJob(input:completion:)`

The CancelJob operation cancels an unfinished job.

``` swift
public func cancelJob(input: CancelJobInput, completion: @escaping (ClientRuntime.SdkResult<CancelJobOutputResponse, CancelJobOutputError>) -> Void)
```

``` 
        You can only cancel a job that has a status of Submitted. To prevent a
        pipeline from starting to process a job while you're getting the job identifier, use
            UpdatePipelineStatus to temporarily pause the pipeline.
```

### `createJob(input:completion:)`

When you create a job, Elastic Transcoder returns JSON data that includes the values that you specified
plus information about the job that is created.
If you have specified more than one output for your jobs (for example, one output for the
Kindle Fire and another output for the Apple iPhone 4s), you currently must use the Elastic Transcoder API to
list the jobs (as opposed to the AWS Console).

``` swift
public func createJob(input: CreateJobInput, completion: @escaping (ClientRuntime.SdkResult<CreateJobOutputResponse, CreateJobOutputError>) -> Void)
```

### `createPipeline(input:completion:)`

The CreatePipeline operation creates a pipeline with settings that you specify.

``` swift
public func createPipeline(input: CreatePipelineInput, completion: @escaping (ClientRuntime.SdkResult<CreatePipelineOutputResponse, CreatePipelineOutputError>) -> Void)
```

### `createPreset(input:completion:)`

The CreatePreset operation creates a preset with settings that you specify.

``` swift
public func createPreset(input: CreatePresetInput, completion: @escaping (ClientRuntime.SdkResult<CreatePresetOutputResponse, CreatePresetOutputError>) -> Void)
```

``` 
        Elastic Transcoder checks the CreatePreset settings to ensure that they meet Elastic Transcoder requirements
        and to determine whether they comply with H.264 standards. If your settings are not
        valid for Elastic Transcoder, Elastic Transcoder returns an HTTP 400 response (ValidationException) and
        does not create the preset. If the settings are valid for Elastic Transcoder but aren't strictly
        compliant with the H.264 standard, Elastic Transcoder creates the preset and returns a warning message
        in the response. This helps you determine whether your settings comply with the H.264
        standard while giving you greater flexibility with respect to the video that Elastic Transcoder
        produces.

    Elastic Transcoder uses the H.264 video-compression format. For more information, see the International
        Telecommunication Union publication Recommendation ITU-T H.264: Advanced video coding
            for generic audiovisual services.
```

### `deletePipeline(input:completion:)`

The DeletePipeline operation removes a pipeline.
You can only delete a pipeline that has never been used or that is not currently in use
(doesn't contain any active jobs). If the pipeline is currently in use,
DeletePipeline returns an error.

``` swift
public func deletePipeline(input: DeletePipelineInput, completion: @escaping (ClientRuntime.SdkResult<DeletePipelineOutputResponse, DeletePipelineOutputError>) -> Void)
```

### `deletePreset(input:completion:)`

The DeletePreset operation removes a preset that you've added in an AWS region.

``` swift
public func deletePreset(input: DeletePresetInput, completion: @escaping (ClientRuntime.SdkResult<DeletePresetOutputResponse, DeletePresetOutputError>) -> Void)
```

``` 
        You can't delete the default presets that are included with Elastic Transcoder.
```

### `listJobsByPipeline(input:completion:)`

The ListJobsByPipeline operation gets a list of the jobs currently in a pipeline.
Elastic Transcoder returns all of the jobs currently in the specified pipeline. The response body contains
one element for each job that satisfies the search criteria.

``` swift
public func listJobsByPipeline(input: ListJobsByPipelineInput, completion: @escaping (ClientRuntime.SdkResult<ListJobsByPipelineOutputResponse, ListJobsByPipelineOutputError>) -> Void)
```

### `listJobsByStatus(input:completion:)`

The ListJobsByStatus operation gets a list of jobs that have a specified status. The response
body contains one element for each job that satisfies the search criteria.

``` swift
public func listJobsByStatus(input: ListJobsByStatusInput, completion: @escaping (ClientRuntime.SdkResult<ListJobsByStatusOutputResponse, ListJobsByStatusOutputError>) -> Void)
```

### `listPipelines(input:completion:)`

The ListPipelines operation gets a list of the pipelines associated with the current AWS account.

``` swift
public func listPipelines(input: ListPipelinesInput, completion: @escaping (ClientRuntime.SdkResult<ListPipelinesOutputResponse, ListPipelinesOutputError>) -> Void)
```

### `listPresets(input:completion:)`

The ListPresets operation gets a list of the default presets included with Elastic Transcoder and the presets that
you've added in an AWS region.

``` swift
public func listPresets(input: ListPresetsInput, completion: @escaping (ClientRuntime.SdkResult<ListPresetsOutputResponse, ListPresetsOutputError>) -> Void)
```

### `readJob(input:completion:)`

The ReadJob operation returns detailed information about a job.

``` swift
public func readJob(input: ReadJobInput, completion: @escaping (ClientRuntime.SdkResult<ReadJobOutputResponse, ReadJobOutputError>) -> Void)
```

### `readPipeline(input:completion:)`

The ReadPipeline operation gets detailed information about a pipeline.

``` swift
public func readPipeline(input: ReadPipelineInput, completion: @escaping (ClientRuntime.SdkResult<ReadPipelineOutputResponse, ReadPipelineOutputError>) -> Void)
```

### `readPreset(input:completion:)`

The ReadPreset operation gets detailed information about a preset.

``` swift
public func readPreset(input: ReadPresetInput, completion: @escaping (ClientRuntime.SdkResult<ReadPresetOutputResponse, ReadPresetOutputError>) -> Void)
```

### `testRole(input:completion:)`

The TestRole operation tests the IAM role used to create the pipeline.
The TestRole action lets you determine whether the IAM role you are using
has sufficient permissions to let Elastic Transcoder perform tasks associated with the transcoding
process. The action attempts to assume the specified IAM role, checks read access to the
input and output buckets, and tries to send a test notification to Amazon SNS topics
that you specify.

``` swift
@available(*, deprecated)
    public func testRole(input: TestRoleInput, completion: @escaping (ClientRuntime.SdkResult<TestRoleOutputResponse, TestRoleOutputError>) -> Void)
```

### `updatePipeline(input:completion:)`

Use the UpdatePipeline operation to update settings for a pipeline.

``` swift
public func updatePipeline(input: UpdatePipelineInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePipelineOutputResponse, UpdatePipelineOutputError>) -> Void)
```

``` 
       When you change pipeline settings, your changes take effect immediately.
       Jobs that you have already submitted and that Elastic Transcoder has not started to process are
       affected in addition to jobs that you submit after you change settings.
```

### `updatePipelineNotifications(input:completion:)`

With the UpdatePipelineNotifications operation, you can update Amazon Simple Notification Service (Amazon SNS) notifications for a pipeline.
When you update notifications for a pipeline, Elastic Transcoder returns the values that you specified in the request.

``` swift
public func updatePipelineNotifications(input: UpdatePipelineNotificationsInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePipelineNotificationsOutputResponse, UpdatePipelineNotificationsOutputError>) -> Void)
```

### `updatePipelineStatus(input:completion:)`

The UpdatePipelineStatus operation pauses or reactivates a pipeline, so that the pipeline
stops or restarts the processing of jobs.
Changing the pipeline status is useful if you want to cancel one or more jobs. You can't
cancel jobs after Elastic Transcoder has started processing them; if you pause the pipeline to which
you submitted the jobs, you have more time to get the job IDs for the jobs that you want
to cancel, and to send a CancelJob request.

``` swift
public func updatePipelineStatus(input: UpdatePipelineStatusInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePipelineStatusOutputResponse, UpdatePipelineStatusOutputError>) -> Void)
```
