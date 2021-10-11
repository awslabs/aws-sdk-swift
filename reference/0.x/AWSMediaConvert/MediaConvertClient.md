# MediaConvertClient

``` swift
public class MediaConvertClient 
```

## Inheritance

[`MediaConvertClientProtocol`](/aws-sdk-swift/reference/0.x/AWSMediaConvert/MediaConvertClientProtocol)

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

### `associateCertificate(input:completion:)`

Associates an AWS Certificate Manager (ACM) Amazon Resource Name (ARN) with AWS Elemental MediaConvert.

``` swift
public func associateCertificate(input: AssociateCertificateInput, completion: @escaping (ClientRuntime.SdkResult<AssociateCertificateOutputResponse, AssociateCertificateOutputError>) -> Void)
```

### `cancelJob(input:completion:)`

Permanently cancel a job. Once you have canceled a job, you can't start it again.

``` swift
public func cancelJob(input: CancelJobInput, completion: @escaping (ClientRuntime.SdkResult<CancelJobOutputResponse, CancelJobOutputError>) -> Void)
```

### `createJob(input:completion:)`

Create a new transcoding job. For information about jobs and job settings, see the User Guide at http:​//docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html

``` swift
public func createJob(input: CreateJobInput, completion: @escaping (ClientRuntime.SdkResult<CreateJobOutputResponse, CreateJobOutputError>) -> Void)
```

### `createJobTemplate(input:completion:)`

Create a new job template. For information about job templates see the User Guide at http:​//docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html

``` swift
public func createJobTemplate(input: CreateJobTemplateInput, completion: @escaping (ClientRuntime.SdkResult<CreateJobTemplateOutputResponse, CreateJobTemplateOutputError>) -> Void)
```

### `createPreset(input:completion:)`

Create a new preset. For information about job templates see the User Guide at http:​//docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html

``` swift
public func createPreset(input: CreatePresetInput, completion: @escaping (ClientRuntime.SdkResult<CreatePresetOutputResponse, CreatePresetOutputError>) -> Void)
```

### `createQueue(input:completion:)`

Create a new transcoding queue. For information about queues, see Working With Queues in the User Guide at https:​//docs.aws.amazon.com/mediaconvert/latest/ug/working-with-queues.html

``` swift
public func createQueue(input: CreateQueueInput, completion: @escaping (ClientRuntime.SdkResult<CreateQueueOutputResponse, CreateQueueOutputError>) -> Void)
```

### `deleteJobTemplate(input:completion:)`

Permanently delete a job template you have created.

``` swift
public func deleteJobTemplate(input: DeleteJobTemplateInput, completion: @escaping (ClientRuntime.SdkResult<DeleteJobTemplateOutputResponse, DeleteJobTemplateOutputError>) -> Void)
```

### `deletePreset(input:completion:)`

Permanently delete a preset you have created.

``` swift
public func deletePreset(input: DeletePresetInput, completion: @escaping (ClientRuntime.SdkResult<DeletePresetOutputResponse, DeletePresetOutputError>) -> Void)
```

### `deleteQueue(input:completion:)`

Permanently delete a queue you have created.

``` swift
public func deleteQueue(input: DeleteQueueInput, completion: @escaping (ClientRuntime.SdkResult<DeleteQueueOutputResponse, DeleteQueueOutputError>) -> Void)
```

### `describeEndpoints(input:completion:)`

Send an request with an empty body to the regional API endpoint to get your account API endpoint.

``` swift
public func describeEndpoints(input: DescribeEndpointsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEndpointsOutputResponse, DescribeEndpointsOutputError>) -> Void)
```

### `disassociateCertificate(input:completion:)`

Removes an association between the Amazon Resource Name (ARN) of an AWS Certificate Manager (ACM) certificate and an AWS Elemental MediaConvert resource.

``` swift
public func disassociateCertificate(input: DisassociateCertificateInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateCertificateOutputResponse, DisassociateCertificateOutputError>) -> Void)
```

### `getJob(input:completion:)`

Retrieve the JSON for a specific completed transcoding job.

``` swift
public func getJob(input: GetJobInput, completion: @escaping (ClientRuntime.SdkResult<GetJobOutputResponse, GetJobOutputError>) -> Void)
```

### `getJobTemplate(input:completion:)`

Retrieve the JSON for a specific job template.

``` swift
public func getJobTemplate(input: GetJobTemplateInput, completion: @escaping (ClientRuntime.SdkResult<GetJobTemplateOutputResponse, GetJobTemplateOutputError>) -> Void)
```

### `getPreset(input:completion:)`

Retrieve the JSON for a specific preset.

``` swift
public func getPreset(input: GetPresetInput, completion: @escaping (ClientRuntime.SdkResult<GetPresetOutputResponse, GetPresetOutputError>) -> Void)
```

### `getQueue(input:completion:)`

Retrieve the JSON for a specific queue.

``` swift
public func getQueue(input: GetQueueInput, completion: @escaping (ClientRuntime.SdkResult<GetQueueOutputResponse, GetQueueOutputError>) -> Void)
```

### `listJobTemplates(input:completion:)`

Retrieve a JSON array of up to twenty of your job templates. This will return the templates themselves, not just a list of them. To retrieve the next twenty templates, use the nextToken string returned with the array

``` swift
public func listJobTemplates(input: ListJobTemplatesInput, completion: @escaping (ClientRuntime.SdkResult<ListJobTemplatesOutputResponse, ListJobTemplatesOutputError>) -> Void)
```

### `listJobs(input:completion:)`

Retrieve a JSON array of up to twenty of your most recently created jobs. This array includes in-process, completed, and errored jobs. This will return the jobs themselves, not just a list of the jobs. To retrieve the twenty next most recent jobs, use the nextToken string returned with the array.

``` swift
public func listJobs(input: ListJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListJobsOutputResponse, ListJobsOutputError>) -> Void)
```

### `listPresets(input:completion:)`

Retrieve a JSON array of up to twenty of your presets. This will return the presets themselves, not just a list of them. To retrieve the next twenty presets, use the nextToken string returned with the array.

``` swift
public func listPresets(input: ListPresetsInput, completion: @escaping (ClientRuntime.SdkResult<ListPresetsOutputResponse, ListPresetsOutputError>) -> Void)
```

### `listQueues(input:completion:)`

Retrieve a JSON array of up to twenty of your queues. This will return the queues themselves, not just a list of them. To retrieve the next twenty queues, use the nextToken string returned with the array.

``` swift
public func listQueues(input: ListQueuesInput, completion: @escaping (ClientRuntime.SdkResult<ListQueuesOutputResponse, ListQueuesOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Retrieve the tags for a MediaConvert resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Add tags to a MediaConvert queue, preset, or job template. For information about tagging, see the User Guide at https:​//docs.aws.amazon.com/mediaconvert/latest/ug/tagging-resources.html

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Remove tags from a MediaConvert queue, preset, or job template. For information about tagging, see the User Guide at https:​//docs.aws.amazon.com/mediaconvert/latest/ug/tagging-resources.html

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateJobTemplate(input:completion:)`

Modify one of your existing job templates.

``` swift
public func updateJobTemplate(input: UpdateJobTemplateInput, completion: @escaping (ClientRuntime.SdkResult<UpdateJobTemplateOutputResponse, UpdateJobTemplateOutputError>) -> Void)
```

### `updatePreset(input:completion:)`

Modify one of your existing presets.

``` swift
public func updatePreset(input: UpdatePresetInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePresetOutputResponse, UpdatePresetOutputError>) -> Void)
```

### `updateQueue(input:completion:)`

Modify one of your existing queues.

``` swift
public func updateQueue(input: UpdateQueueInput, completion: @escaping (ClientRuntime.SdkResult<UpdateQueueOutputResponse, UpdateQueueOutputError>) -> Void)
```
