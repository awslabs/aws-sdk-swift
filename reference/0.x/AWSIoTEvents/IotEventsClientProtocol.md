# IotEventsClientProtocol

AWS IoT Events monitors your equipment or device fleets for failures or changes in operation, and triggers actions when such events occur. You can use AWS IoT Events API operations to create, read, update, and delete inputs and detector models, and to list their versions.

``` swift
public protocol IotEventsClientProtocol 
```

## Requirements

### createAlarmModel(input:completion:)

Creates an alarm model to monitor an AWS IoT Events input attribute. You can use the alarm to get notified when the value is outside a specified range. For more information, see [Create an alarm model](https://docs.aws.amazon.com/iotevents/latest/developerguide/create-alarms.html) in the AWS IoT Events Developer Guide.

``` swift
func createAlarmModel(input: CreateAlarmModelInput, completion: @escaping (ClientRuntime.SdkResult<CreateAlarmModelOutputResponse, CreateAlarmModelOutputError>) -> Void)
```

### createDetectorModel(input:completion:)

Creates a detector model.

``` swift
func createDetectorModel(input: CreateDetectorModelInput, completion: @escaping (ClientRuntime.SdkResult<CreateDetectorModelOutputResponse, CreateDetectorModelOutputError>) -> Void)
```

### createInput(input:completion:)

Creates an input.

``` swift
func createInput(input: CreateInputInput, completion: @escaping (ClientRuntime.SdkResult<CreateInputOutputResponse, CreateInputOutputError>) -> Void)
```

### deleteAlarmModel(input:completion:)

Deletes an alarm model. Any alarm instances that were created based on this alarm model are also deleted. This action can't be undone.

``` swift
func deleteAlarmModel(input: DeleteAlarmModelInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAlarmModelOutputResponse, DeleteAlarmModelOutputError>) -> Void)
```

### deleteDetectorModel(input:completion:)

Deletes a detector model. Any active instances of the detector model are also deleted.

``` swift
func deleteDetectorModel(input: DeleteDetectorModelInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDetectorModelOutputResponse, DeleteDetectorModelOutputError>) -> Void)
```

### deleteInput(input:completion:)

Deletes an input.

``` swift
func deleteInput(input: DeleteInputInput, completion: @escaping (ClientRuntime.SdkResult<DeleteInputOutputResponse, DeleteInputOutputError>) -> Void)
```

### describeAlarmModel(input:completion:)

Retrieves information about an alarm model. If you don't specify a value for the alarmModelVersion parameter, the latest version is returned.

``` swift
func describeAlarmModel(input: DescribeAlarmModelInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAlarmModelOutputResponse, DescribeAlarmModelOutputError>) -> Void)
```

### describeDetectorModel(input:completion:)

Describes a detector model. If the version parameter is not specified, information about the latest version is returned.

``` swift
func describeDetectorModel(input: DescribeDetectorModelInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDetectorModelOutputResponse, DescribeDetectorModelOutputError>) -> Void)
```

### describeDetectorModelAnalysis(input:completion:)

Retrieves runtime information about a detector model analysis. After AWS IoT Events starts analyzing your detector model, you have up to 24 hours to retrieve the analysis results.

``` swift
func describeDetectorModelAnalysis(input: DescribeDetectorModelAnalysisInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDetectorModelAnalysisOutputResponse, DescribeDetectorModelAnalysisOutputError>) -> Void)
```

### describeInput(input:completion:)

Describes an input.

``` swift
func describeInput(input: DescribeInputInput, completion: @escaping (ClientRuntime.SdkResult<DescribeInputOutputResponse, DescribeInputOutputError>) -> Void)
```

### describeLoggingOptions(input:completion:)

Retrieves the current settings of the AWS IoT Events logging options.

``` swift
func describeLoggingOptions(input: DescribeLoggingOptionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLoggingOptionsOutputResponse, DescribeLoggingOptionsOutputError>) -> Void)
```

### getDetectorModelAnalysisResults(input:completion:)

Retrieves one or more analysis results of the detector model. After AWS IoT Events starts analyzing your detector model, you have up to 24 hours to retrieve the analysis results.

``` swift
func getDetectorModelAnalysisResults(input: GetDetectorModelAnalysisResultsInput, completion: @escaping (ClientRuntime.SdkResult<GetDetectorModelAnalysisResultsOutputResponse, GetDetectorModelAnalysisResultsOutputError>) -> Void)
```

### listAlarmModels(input:completion:)

Lists the alarm models that you created. The operation returns only the metadata associated with each alarm model.

``` swift
func listAlarmModels(input: ListAlarmModelsInput, completion: @escaping (ClientRuntime.SdkResult<ListAlarmModelsOutputResponse, ListAlarmModelsOutputError>) -> Void)
```

### listAlarmModelVersions(input:completion:)

Lists all the versions of an alarm model. The operation returns only the metadata associated with each alarm model version.

``` swift
func listAlarmModelVersions(input: ListAlarmModelVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListAlarmModelVersionsOutputResponse, ListAlarmModelVersionsOutputError>) -> Void)
```

### listDetectorModels(input:completion:)

Lists the detector models you have created. Only the metadata associated with each detector model is returned.

``` swift
func listDetectorModels(input: ListDetectorModelsInput, completion: @escaping (ClientRuntime.SdkResult<ListDetectorModelsOutputResponse, ListDetectorModelsOutputError>) -> Void)
```

### listDetectorModelVersions(input:completion:)

Lists all the versions of a detector model. Only the metadata associated with each detector model version is returned.

``` swift
func listDetectorModelVersions(input: ListDetectorModelVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListDetectorModelVersionsOutputResponse, ListDetectorModelVersionsOutputError>) -> Void)
```

### listInputRoutings(input:completion:)

Lists one or more input routings.

``` swift
func listInputRoutings(input: ListInputRoutingsInput, completion: @escaping (ClientRuntime.SdkResult<ListInputRoutingsOutputResponse, ListInputRoutingsOutputError>) -> Void)
```

### listInputs(input:completion:)

Lists the inputs you have created.

``` swift
func listInputs(input: ListInputsInput, completion: @escaping (ClientRuntime.SdkResult<ListInputsOutputResponse, ListInputsOutputError>) -> Void)
```

### listTagsForResource(input:completion:)

Lists the tags (metadata) you have assigned to the resource.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### putLoggingOptions(input:completion:)

Sets or updates the AWS IoT Events logging options. If you update the value of any loggingOptions field, it takes up to one minute for the change to take effect. If you change the policy attached to the role you specified in the roleArn field (for example, to correct an invalid policy), it takes up to five minutes for that change to take effect.

``` swift
func putLoggingOptions(input: PutLoggingOptionsInput, completion: @escaping (ClientRuntime.SdkResult<PutLoggingOptionsOutputResponse, PutLoggingOptionsOutputError>) -> Void)
```

### startDetectorModelAnalysis(input:completion:)

Performs an analysis of your detector model. For more information, see [Troubleshooting a detector model](https://docs.aws.amazon.com/iotevents/latest/developerguide/iotevents-analyze-api.html) in the AWS IoT Events Developer Guide.

``` swift
func startDetectorModelAnalysis(input: StartDetectorModelAnalysisInput, completion: @escaping (ClientRuntime.SdkResult<StartDetectorModelAnalysisOutputResponse, StartDetectorModelAnalysisOutputError>) -> Void)
```

### tagResource(input:completion:)

Adds to or modifies the tags of the given resource. Tags are metadata that can be used to manage a resource.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:completion:)

Removes the given tags (metadata) from the resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateAlarmModel(input:completion:)

Updates an alarm model. Any alarms that were created based on the previous version are deleted and then created again as new data arrives.

``` swift
func updateAlarmModel(input: UpdateAlarmModelInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAlarmModelOutputResponse, UpdateAlarmModelOutputError>) -> Void)
```

### updateDetectorModel(input:completion:)

Updates a detector model. Detectors (instances) spawned by the previous version are deleted and then re-created as new inputs arrive.

``` swift
func updateDetectorModel(input: UpdateDetectorModelInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDetectorModelOutputResponse, UpdateDetectorModelOutputError>) -> Void)
```

### updateInput(input:completion:)

Updates an input.

``` swift
func updateInput(input: UpdateInputInput, completion: @escaping (ClientRuntime.SdkResult<UpdateInputOutputResponse, UpdateInputOutputError>) -> Void)
```
