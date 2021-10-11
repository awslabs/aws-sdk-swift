# CodePipelineClient

``` swift
public class CodePipelineClient 
```

## Inheritance

[`CodePipelineClientProtocol`](/aws-sdk-swift/reference/0.x/AWSCodePipeline/CodePipelineClientProtocol)

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

### `acknowledgeJob(input:completion:)`

Returns information about a specified job and whether that job has been received by
the job worker. Used for custom actions only.

``` swift
public func acknowledgeJob(input: AcknowledgeJobInput, completion: @escaping (ClientRuntime.SdkResult<AcknowledgeJobOutputResponse, AcknowledgeJobOutputError>) -> Void)
```

### `acknowledgeThirdPartyJob(input:completion:)`

Confirms a job worker has received the specified job. Used for partner actions
only.

``` swift
public func acknowledgeThirdPartyJob(input: AcknowledgeThirdPartyJobInput, completion: @escaping (ClientRuntime.SdkResult<AcknowledgeThirdPartyJobOutputResponse, AcknowledgeThirdPartyJobOutputError>) -> Void)
```

### `createCustomActionType(input:completion:)`

Creates a new custom action that can be used in all pipelines associated with the
AWS account. Only used for custom actions.

``` swift
public func createCustomActionType(input: CreateCustomActionTypeInput, completion: @escaping (ClientRuntime.SdkResult<CreateCustomActionTypeOutputResponse, CreateCustomActionTypeOutputError>) -> Void)
```

### `createPipeline(input:completion:)`

Creates a pipeline.

``` swift
public func createPipeline(input: CreatePipelineInput, completion: @escaping (ClientRuntime.SdkResult<CreatePipelineOutputResponse, CreatePipelineOutputError>) -> Void)
```

``` 
        In the pipeline structure, you must include either artifactStore
            or artifactStores in your pipeline, but you cannot use both. If you
            create a cross-region action in your pipeline, you must use
                artifactStores.
```

### `deleteCustomActionType(input:completion:)`

Marks a custom action as deleted. PollForJobs for the custom action
fails after the action is marked for deletion. Used for custom actions only.

``` swift
public func deleteCustomActionType(input: DeleteCustomActionTypeInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCustomActionTypeOutputResponse, DeleteCustomActionTypeOutputError>) -> Void)
```

``` 
        To re-create a custom action after it has been deleted you must use a string in
            the version field that has never been used before. This string can be an incremented
            version number, for example. To restore a deleted custom action, use a JSON file
            that is identical to the deleted action, including the original string in the
            version field.
```

### `deletePipeline(input:completion:)`

Deletes the specified pipeline.

``` swift
public func deletePipeline(input: DeletePipelineInput, completion: @escaping (ClientRuntime.SdkResult<DeletePipelineOutputResponse, DeletePipelineOutputError>) -> Void)
```

### `deleteWebhook(input:completion:)`

Deletes a previously created webhook by name. Deleting the webhook stops AWS
CodePipeline from starting a pipeline every time an external event occurs. The API
returns successfully when trying to delete a webhook that is already deleted. If a
deleted webhook is re-created by calling PutWebhook with the same name, it will have a
different URL.

``` swift
public func deleteWebhook(input: DeleteWebhookInput, completion: @escaping (ClientRuntime.SdkResult<DeleteWebhookOutputResponse, DeleteWebhookOutputError>) -> Void)
```

### `deregisterWebhookWithThirdParty(input:completion:)`

Removes the connection between the webhook that was created by CodePipeline and the
external tool with events to be detected. Currently supported only for webhooks that
target an action type of GitHub.

``` swift
public func deregisterWebhookWithThirdParty(input: DeregisterWebhookWithThirdPartyInput, completion: @escaping (ClientRuntime.SdkResult<DeregisterWebhookWithThirdPartyOutputResponse, DeregisterWebhookWithThirdPartyOutputError>) -> Void)
```

### `disableStageTransition(input:completion:)`

Prevents artifacts in a pipeline from transitioning to the next stage in the
pipeline.

``` swift
public func disableStageTransition(input: DisableStageTransitionInput, completion: @escaping (ClientRuntime.SdkResult<DisableStageTransitionOutputResponse, DisableStageTransitionOutputError>) -> Void)
```

### `enableStageTransition(input:completion:)`

Enables artifacts in a pipeline to transition to a stage in a pipeline.

``` swift
public func enableStageTransition(input: EnableStageTransitionInput, completion: @escaping (ClientRuntime.SdkResult<EnableStageTransitionOutputResponse, EnableStageTransitionOutputError>) -> Void)
```

### `getActionType(input:completion:)`

Returns information about an action type created for an external provider, where the
action is to be used by customers of the external provider. The action can be created
with any supported integration model.

``` swift
public func getActionType(input: GetActionTypeInput, completion: @escaping (ClientRuntime.SdkResult<GetActionTypeOutputResponse, GetActionTypeOutputError>) -> Void)
```

### `getJobDetails(input:completion:)`

Returns information about a job. Used for custom actions only.

``` swift
public func getJobDetails(input: GetJobDetailsInput, completion: @escaping (ClientRuntime.SdkResult<GetJobDetailsOutputResponse, GetJobDetailsOutputError>) -> Void)
```

``` 
        When this API is called, AWS CodePipeline returns temporary credentials for the
            S3 bucket used to store artifacts for the pipeline, if the action requires access to
            that S3 bucket for input or output artifacts. This API also returns any secret
            values defined for the action.
```

### `getPipeline(input:completion:)`

Returns the metadata, structure, stages, and actions of a pipeline. Can be used to
return the entire structure of a pipeline in JSON format, which can then be modified and
used to update the pipeline structure with UpdatePipeline.

``` swift
public func getPipeline(input: GetPipelineInput, completion: @escaping (ClientRuntime.SdkResult<GetPipelineOutputResponse, GetPipelineOutputError>) -> Void)
```

### `getPipelineExecution(input:completion:)`

Returns information about an execution of a pipeline, including details about
artifacts, the pipeline execution ID, and the name, version, and status of the
pipeline.

``` swift
public func getPipelineExecution(input: GetPipelineExecutionInput, completion: @escaping (ClientRuntime.SdkResult<GetPipelineExecutionOutputResponse, GetPipelineExecutionOutputError>) -> Void)
```

### `getPipelineState(input:completion:)`

Returns information about the state of a pipeline, including the stages and
actions.

``` swift
public func getPipelineState(input: GetPipelineStateInput, completion: @escaping (ClientRuntime.SdkResult<GetPipelineStateOutputResponse, GetPipelineStateOutputError>) -> Void)
```

``` 
        Values returned in the revisionId and revisionUrl
            fields indicate the source revision information, such as the commit ID, for the
            current state.
```

### `getThirdPartyJobDetails(input:completion:)`

Requests the details of a job for a third party action. Used for partner actions
only.

``` swift
public func getThirdPartyJobDetails(input: GetThirdPartyJobDetailsInput, completion: @escaping (ClientRuntime.SdkResult<GetThirdPartyJobDetailsOutputResponse, GetThirdPartyJobDetailsOutputError>) -> Void)
```

``` 
        When this API is called, AWS CodePipeline returns temporary credentials for the
            S3 bucket used to store artifacts for the pipeline, if the action requires access to
            that S3 bucket for input or output artifacts. This API also returns any secret
            values defined for the action.
```

### `listActionExecutions(input:completion:)`

Lists the action executions that have occurred in a pipeline.

``` swift
public func listActionExecutions(input: ListActionExecutionsInput, completion: @escaping (ClientRuntime.SdkResult<ListActionExecutionsOutputResponse, ListActionExecutionsOutputError>) -> Void)
```

### `listActionTypes(input:completion:)`

Gets a summary of all AWS CodePipeline action types associated with your
account.

``` swift
public func listActionTypes(input: ListActionTypesInput, completion: @escaping (ClientRuntime.SdkResult<ListActionTypesOutputResponse, ListActionTypesOutputError>) -> Void)
```

### `listPipelineExecutions(input:completion:)`

Gets a summary of the most recent executions for a pipeline.

``` swift
public func listPipelineExecutions(input: ListPipelineExecutionsInput, completion: @escaping (ClientRuntime.SdkResult<ListPipelineExecutionsOutputResponse, ListPipelineExecutionsOutputError>) -> Void)
```

### `listPipelines(input:completion:)`

Gets a summary of all of the pipelines associated with your account.

``` swift
public func listPipelines(input: ListPipelinesInput, completion: @escaping (ClientRuntime.SdkResult<ListPipelinesOutputResponse, ListPipelinesOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Gets the set of key-value pairs (metadata) that are used to manage the
resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `listWebhooks(input:completion:)`

Gets a listing of all the webhooks in this AWS Region for this account. The output
lists all webhooks and includes the webhook URL and ARN and the configuration for each
webhook.

``` swift
public func listWebhooks(input: ListWebhooksInput, completion: @escaping (ClientRuntime.SdkResult<ListWebhooksOutputResponse, ListWebhooksOutputError>) -> Void)
```

### `pollForJobs(input:completion:)`

Returns information about any jobs for AWS CodePipeline to act on.
PollForJobs is valid only for action types with "Custom" in the owner
field. If the action type contains "AWS" or "ThirdParty" in the owner field, the
PollForJobs action returns an error.

``` swift
public func pollForJobs(input: PollForJobsInput, completion: @escaping (ClientRuntime.SdkResult<PollForJobsOutputResponse, PollForJobsOutputError>) -> Void)
```

``` 
        When this API is called, AWS CodePipeline returns temporary credentials for the
            S3 bucket used to store artifacts for the pipeline, if the action requires access to
            that S3 bucket for input or output artifacts. This API also returns any secret
            values defined for the action.
```

### `pollForThirdPartyJobs(input:completion:)`

Determines whether there are any third party jobs for a job worker to act on. Used
for partner actions only.

``` swift
public func pollForThirdPartyJobs(input: PollForThirdPartyJobsInput, completion: @escaping (ClientRuntime.SdkResult<PollForThirdPartyJobsOutputResponse, PollForThirdPartyJobsOutputError>) -> Void)
```

``` 
        When this API is called, AWS CodePipeline returns temporary credentials for the
            S3 bucket used to store artifacts for the pipeline, if the action requires access to
            that S3 bucket for input or output artifacts.
```

### `putActionRevision(input:completion:)`

Provides information to AWS CodePipeline about new revisions to a source.

``` swift
public func putActionRevision(input: PutActionRevisionInput, completion: @escaping (ClientRuntime.SdkResult<PutActionRevisionOutputResponse, PutActionRevisionOutputError>) -> Void)
```

### `putApprovalResult(input:completion:)`

Provides the response to a manual approval request to AWS CodePipeline. Valid
responses include Approved and Rejected.

``` swift
public func putApprovalResult(input: PutApprovalResultInput, completion: @escaping (ClientRuntime.SdkResult<PutApprovalResultOutputResponse, PutApprovalResultOutputError>) -> Void)
```

### `putJobFailureResult(input:completion:)`

Represents the failure of a job as returned to the pipeline by a job worker. Used
for custom actions only.

``` swift
public func putJobFailureResult(input: PutJobFailureResultInput, completion: @escaping (ClientRuntime.SdkResult<PutJobFailureResultOutputResponse, PutJobFailureResultOutputError>) -> Void)
```

### `putJobSuccessResult(input:completion:)`

Represents the success of a job as returned to the pipeline by a job worker. Used
for custom actions only.

``` swift
public func putJobSuccessResult(input: PutJobSuccessResultInput, completion: @escaping (ClientRuntime.SdkResult<PutJobSuccessResultOutputResponse, PutJobSuccessResultOutputError>) -> Void)
```

### `putThirdPartyJobFailureResult(input:completion:)`

Represents the failure of a third party job as returned to the pipeline by a job
worker. Used for partner actions only.

``` swift
public func putThirdPartyJobFailureResult(input: PutThirdPartyJobFailureResultInput, completion: @escaping (ClientRuntime.SdkResult<PutThirdPartyJobFailureResultOutputResponse, PutThirdPartyJobFailureResultOutputError>) -> Void)
```

### `putThirdPartyJobSuccessResult(input:completion:)`

Represents the success of a third party job as returned to the pipeline by a job
worker. Used for partner actions only.

``` swift
public func putThirdPartyJobSuccessResult(input: PutThirdPartyJobSuccessResultInput, completion: @escaping (ClientRuntime.SdkResult<PutThirdPartyJobSuccessResultOutputResponse, PutThirdPartyJobSuccessResultOutputError>) -> Void)
```

### `putWebhook(input:completion:)`

Defines a webhook and returns a unique webhook URL generated by CodePipeline. This
URL can be supplied to third party source hosting providers to call every time there's a
code change. When CodePipeline receives a POST request on this URL, the pipeline defined
in the webhook is started as long as the POST request satisfied the authentication and
filtering requirements supplied when defining the webhook. RegisterWebhookWithThirdParty
and DeregisterWebhookWithThirdParty APIs can be used to automatically configure
supported third parties to call the generated webhook URL.

``` swift
public func putWebhook(input: PutWebhookInput, completion: @escaping (ClientRuntime.SdkResult<PutWebhookOutputResponse, PutWebhookOutputError>) -> Void)
```

### `registerWebhookWithThirdParty(input:completion:)`

Configures a connection between the webhook that was created and the external tool
with events to be detected.

``` swift
public func registerWebhookWithThirdParty(input: RegisterWebhookWithThirdPartyInput, completion: @escaping (ClientRuntime.SdkResult<RegisterWebhookWithThirdPartyOutputResponse, RegisterWebhookWithThirdPartyOutputError>) -> Void)
```

### `retryStageExecution(input:completion:)`

Resumes the pipeline execution by retrying the last failed actions in a stage. You
can retry a stage immediately if any of the actions in the stage fail. When you retry,
all actions that are still in progress continue working, and failed actions are
triggered again.

``` swift
public func retryStageExecution(input: RetryStageExecutionInput, completion: @escaping (ClientRuntime.SdkResult<RetryStageExecutionOutputResponse, RetryStageExecutionOutputError>) -> Void)
```

### `startPipelineExecution(input:completion:)`

Starts the specified pipeline. Specifically, it begins processing the latest commit
to the source location specified as part of the pipeline.

``` swift
public func startPipelineExecution(input: StartPipelineExecutionInput, completion: @escaping (ClientRuntime.SdkResult<StartPipelineExecutionOutputResponse, StartPipelineExecutionOutputError>) -> Void)
```

### `stopPipelineExecution(input:completion:)`

Stops the specified pipeline execution. You choose to either stop the pipeline
execution by completing in-progress actions without starting subsequent actions, or by
abandoning in-progress actions. While completing or abandoning in-progress actions, the
pipeline execution is in a Stopping state. After all in-progress actions
are completed or abandoned, the pipeline execution is in a Stopped
state.

``` swift
public func stopPipelineExecution(input: StopPipelineExecutionInput, completion: @escaping (ClientRuntime.SdkResult<StopPipelineExecutionOutputResponse, StopPipelineExecutionOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Adds to or modifies the tags of the given resource. Tags are metadata that can be used
to manage a resource.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes tags from an AWS resource.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateActionType(input:completion:)`

Updates an action type that was created with any supported integration model, where
the action type is to be used by customers of the action type provider. Use a JSON file
with the action definition and UpdateActionType to provide the full
structure.

``` swift
public func updateActionType(input: UpdateActionTypeInput, completion: @escaping (ClientRuntime.SdkResult<UpdateActionTypeOutputResponse, UpdateActionTypeOutputError>) -> Void)
```

### `updatePipeline(input:completion:)`

Updates a specified pipeline with edits or changes to its structure. Use a JSON
file with the pipeline structure and UpdatePipeline to provide the full
structure of the pipeline. Updating the pipeline increases the version number of the
pipeline by 1.

``` swift
public func updatePipeline(input: UpdatePipelineInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePipelineOutputResponse, UpdatePipelineOutputError>) -> Void)
```
