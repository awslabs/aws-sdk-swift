# SfnClient

``` swift
public class SfnClient 
```

## Inheritance

[`SfnClientProtocol`](/aws-sdk-swift/reference/0.x/AWSSFN/SfnClientProtocol)

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
public static let clientName = "SfnClient"
```

## Methods

### `createActivity(input:completion:)`

Creates an activity. An activity is a task that you write in any programming language and host on any machine that has access to AWS Step Functions. Activities must poll Step Functions using the GetActivityTask API action and respond using SendTask\* API actions. This function lets Step Functions know the existence of your activity and returns an identifier for use in a state machine and when polling from the activity. This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes. CreateActivity is an idempotent API. Subsequent requests won’t create a duplicate resource if it was already created. CreateActivity's idempotency check is based on the activity name. If a following request has different tags values, Step Functions will ignore these differences and treat it as an idempotent request of the previous. In this case, tags will not be updated, even if they are different.

``` swift
public func createActivity(input: CreateActivityInput, completion: @escaping (ClientRuntime.SdkResult<CreateActivityOutputResponse, CreateActivityOutputError>) -> Void)
```

### `createStateMachine(input:completion:)`

Creates a state machine. A state machine consists of a collection of states that can do work (Task states), determine to which states to transition next (Choice states), stop an execution with an error (Fail states), and so on. State machines are specified using a JSON-based, structured language. For more information, see [Amazon States Language](https://docs.aws.amazon.com/step-functions/latest/dg/concepts-amazon-states-language.html) in the AWS Step Functions User Guide. This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes. CreateStateMachine is an idempotent API. Subsequent requests won’t create a duplicate resource if it was already created. CreateStateMachine's idempotency check is based on the state machine name, definition, type, LoggingConfiguration and TracingConfiguration. If a following request has a different roleArn or tags, Step Functions will ignore these differences and treat it as an idempotent request of the previous. In this case, roleArn and tags will not be updated, even if they are different.

``` swift
public func createStateMachine(input: CreateStateMachineInput, completion: @escaping (ClientRuntime.SdkResult<CreateStateMachineOutputResponse, CreateStateMachineOutputError>) -> Void)
```

### `deleteActivity(input:completion:)`

Deletes an activity.

``` swift
public func deleteActivity(input: DeleteActivityInput, completion: @escaping (ClientRuntime.SdkResult<DeleteActivityOutputResponse, DeleteActivityOutputError>) -> Void)
```

### `deleteStateMachine(input:completion:)`

Deletes a state machine. This is an asynchronous operation: It sets the state machine's status to DELETING and begins the deletion process. For EXPRESSstate machines, the deletion will happen eventually (usually less than a minute). Running executions may emit logs after DeleteStateMachine API is called.

``` swift
public func deleteStateMachine(input: DeleteStateMachineInput, completion: @escaping (ClientRuntime.SdkResult<DeleteStateMachineOutputResponse, DeleteStateMachineOutputError>) -> Void)
```

### `describeActivity(input:completion:)`

Describes an activity. This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.

``` swift
public func describeActivity(input: DescribeActivityInput, completion: @escaping (ClientRuntime.SdkResult<DescribeActivityOutputResponse, DescribeActivityOutputError>) -> Void)
```

### `describeExecution(input:completion:)`

Describes an execution. This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes. This API action is not supported by EXPRESS state machines.

``` swift
public func describeExecution(input: DescribeExecutionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeExecutionOutputResponse, DescribeExecutionOutputError>) -> Void)
```

### `describeStateMachine(input:completion:)`

Describes a state machine. This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.

``` swift
public func describeStateMachine(input: DescribeStateMachineInput, completion: @escaping (ClientRuntime.SdkResult<DescribeStateMachineOutputResponse, DescribeStateMachineOutputError>) -> Void)
```

### `describeStateMachineForExecution(input:completion:)`

Describes the state machine associated with a specific execution. This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes. This API action is not supported by EXPRESS state machines.

``` swift
public func describeStateMachineForExecution(input: DescribeStateMachineForExecutionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeStateMachineForExecutionOutputResponse, DescribeStateMachineForExecutionOutputError>) -> Void)
```

### `getActivityTask(input:completion:)`

Used by workers to retrieve a task (with the specified activity ARN) which has been scheduled for execution by a running state machine. This initiates a long poll, where the service holds the HTTP connection open and responds as soon as a task becomes available (i.e. an execution of a task of this type is needed.) The maximum time the service holds on to the request before responding is 60 seconds. If no task is available within 60 seconds, the poll returns a taskToken with a null string. Workers should set their client side socket timeout to at least 65 seconds (5 seconds higher than the maximum time the service may hold the poll request). Polling with GetActivityTask can cause latency in some implementations. See [Avoid Latency When Polling for Activity Tasks](https://docs.aws.amazon.com/step-functions/latest/dg/bp-activity-pollers.html) in the Step Functions Developer Guide.

``` swift
public func getActivityTask(input: GetActivityTaskInput, completion: @escaping (ClientRuntime.SdkResult<GetActivityTaskOutputResponse, GetActivityTaskOutputError>) -> Void)
```

### `getExecutionHistory(input:completion:)`

Returns the history of the specified execution as a list of events. By default, the results are returned in ascending order of the timeStamp of the events. Use the reverseOrder parameter to get the latest events first. If nextToken is returned, there are more results available. The value of nextToken is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an HTTP 400 InvalidToken error. This API action is not supported by EXPRESS state machines.

``` swift
public func getExecutionHistory(input: GetExecutionHistoryInput, completion: @escaping (ClientRuntime.SdkResult<GetExecutionHistoryOutputResponse, GetExecutionHistoryOutputError>) -> Void)
```

### `listActivities(input:completion:)`

Lists the existing activities. If nextToken is returned, there are more results available. The value of nextToken is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an HTTP 400 InvalidToken error. This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.

``` swift
public func listActivities(input: ListActivitiesInput, completion: @escaping (ClientRuntime.SdkResult<ListActivitiesOutputResponse, ListActivitiesOutputError>) -> Void)
```

### `listExecutions(input:completion:)`

Lists the executions of a state machine that meet the filtering criteria. Results are sorted by time, with the most recent execution first. If nextToken is returned, there are more results available. The value of nextToken is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an HTTP 400 InvalidToken error. This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes. This API action is not supported by EXPRESS state machines.

``` swift
public func listExecutions(input: ListExecutionsInput, completion: @escaping (ClientRuntime.SdkResult<ListExecutionsOutputResponse, ListExecutionsOutputError>) -> Void)
```

### `listStateMachines(input:completion:)`

Lists the existing state machines. If nextToken is returned, there are more results available. The value of nextToken is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an HTTP 400 InvalidToken error. This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.

``` swift
public func listStateMachines(input: ListStateMachinesInput, completion: @escaping (ClientRuntime.SdkResult<ListStateMachinesOutputResponse, ListStateMachinesOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

List tags for a given resource. Tags may only contain Unicode letters, digits, white space, or these symbols: \_ . : / = + - @.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `sendTaskFailure(input:completion:)`

Used by activity workers and task states using the [callback](https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-wait-token) pattern to report that the task identified by the taskToken failed.

``` swift
public func sendTaskFailure(input: SendTaskFailureInput, completion: @escaping (ClientRuntime.SdkResult<SendTaskFailureOutputResponse, SendTaskFailureOutputError>) -> Void)
```

### `sendTaskHeartbeat(input:completion:)`

Used by activity workers and task states using the [callback](https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-wait-token) pattern to report to Step Functions that the task represented by the specified taskToken is still making progress. This action resets the Heartbeat clock. The Heartbeat threshold is specified in the state machine's Amazon States Language definition (HeartbeatSeconds). This action does not in itself create an event in the execution history. However, if the task times out, the execution history contains an ActivityTimedOut entry for activities, or a TaskTimedOut entry for for tasks using the [job run](https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-sync) or [callback](https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-wait-token) pattern. The Timeout of a task, defined in the state machine's Amazon States Language definition, is its maximum allowed duration, regardless of the number of \[SendTaskHeartbeat\] requests received. Use HeartbeatSeconds to configure the timeout interval for heartbeats.

``` swift
public func sendTaskHeartbeat(input: SendTaskHeartbeatInput, completion: @escaping (ClientRuntime.SdkResult<SendTaskHeartbeatOutputResponse, SendTaskHeartbeatOutputError>) -> Void)
```

### `sendTaskSuccess(input:completion:)`

Used by activity workers and task states using the [callback](https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-wait-token) pattern to report that the task identified by the taskToken completed successfully.

``` swift
public func sendTaskSuccess(input: SendTaskSuccessInput, completion: @escaping (ClientRuntime.SdkResult<SendTaskSuccessOutputResponse, SendTaskSuccessOutputError>) -> Void)
```

### `startExecution(input:completion:)`

Starts a state machine execution. StartExecution is idempotent. If StartExecution is called with the same name and input as a running execution, the call will succeed and return the same response as the original request. If the execution is closed or if the input is different, it will return a 400 ExecutionAlreadyExists error. Names can be reused after 90 days.

``` swift
public func startExecution(input: StartExecutionInput, completion: @escaping (ClientRuntime.SdkResult<StartExecutionOutputResponse, StartExecutionOutputError>) -> Void)
```

### `startSyncExecution(input:completion:)`

Starts a Synchronous Express state machine execution.

``` swift
public func startSyncExecution(input: StartSyncExecutionInput, completion: @escaping (ClientRuntime.SdkResult<StartSyncExecutionOutputResponse, StartSyncExecutionOutputError>) -> Void)
```

### `stopExecution(input:completion:)`

Stops an execution. This API action is not supported by EXPRESS state machines.

``` swift
public func stopExecution(input: StopExecutionInput, completion: @escaping (ClientRuntime.SdkResult<StopExecutionOutputResponse, StopExecutionOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Add a tag to a Step Functions resource. An array of key-value pairs. For more information, see [Using Cost Allocation Tags](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html) in the AWS Billing and Cost Management User Guide, and [Controlling Access Using IAM Tags](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_iam-tags.html). Tags may only contain Unicode letters, digits, white space, or these symbols: \_ . : / = + - @.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Remove a tag from a Step Functions resource

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateStateMachine(input:completion:)`

Updates an existing state machine by modifying its definition, roleArn, or loggingConfiguration. Running executions will continue to use the previous definition and roleArn. You must include at least one of definition or roleArn or you will receive a MissingRequiredParameter error. All StartExecution calls within a few seconds will use the updated definition and roleArn. Executions started immediately after calling UpdateStateMachine may use the previous state machine definition and roleArn.

``` swift
public func updateStateMachine(input: UpdateStateMachineInput, completion: @escaping (ClientRuntime.SdkResult<UpdateStateMachineOutputResponse, UpdateStateMachineOutputError>) -> Void)
```
