# ComprehendMedicalClient

``` swift
public class ComprehendMedicalClient 
```

## Inheritance

[`ComprehendMedicalClientProtocol`](/aws-sdk-swift/reference/0.x/AWSComprehendMedical/ComprehendMedicalClientProtocol)

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

### `describeEntitiesDetectionV2Job(input:completion:)`

Gets the properties associated with a medical entities detection job. Use this operation
to get the status of a detection job.

``` swift
public func describeEntitiesDetectionV2Job(input: DescribeEntitiesDetectionV2JobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEntitiesDetectionV2JobOutputResponse, DescribeEntitiesDetectionV2JobOutputError>) -> Void)
```

### `describeICD10CMInferenceJob(input:completion:)`

Gets the properties associated with an InferICD10CM job. Use this operation to get the
status of an inference job.

``` swift
public func describeICD10CMInferenceJob(input: DescribeICD10CMInferenceJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeICD10CMInferenceJobOutputResponse, DescribeICD10CMInferenceJobOutputError>) -> Void)
```

### `describePHIDetectionJob(input:completion:)`

Gets the properties associated with a protected health information (PHI) detection job.
Use this operation to get the status of a detection job.

``` swift
public func describePHIDetectionJob(input: DescribePHIDetectionJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribePHIDetectionJobOutputResponse, DescribePHIDetectionJobOutputError>) -> Void)
```

### `describeRxNormInferenceJob(input:completion:)`

Gets the properties associated with an InferRxNorm job. Use this operation to get the
status of an inference job.

``` swift
public func describeRxNormInferenceJob(input: DescribeRxNormInferenceJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeRxNormInferenceJobOutputResponse, DescribeRxNormInferenceJobOutputError>) -> Void)
```

### `detectEntities(input:completion:)`

The DetectEntities operation is deprecated. You should use the DetectEntitiesV2 operation instead.
Inspects the clinical text for a variety of medical entities and returns specific
information about them such as entity category, location, and confidence score on that
information .

``` swift
@available(*, deprecated, message: "This operation is deprecated, use DetectEntitiesV2 instead.")
    public func detectEntities(input: DetectEntitiesInput, completion: @escaping (ClientRuntime.SdkResult<DetectEntitiesOutputResponse, DetectEntitiesOutputError>) -> Void)
```

### `detectEntitiesV2(input:completion:)`

Inspects the clinical text for a variety of medical entities and returns specific
information about them such as entity category, location, and confidence score on that
information. Amazon Comprehend Medical only detects medical entities in English language
texts.
The DetectEntitiesV2 operation replaces the DetectEntities
operation. This new action uses a different model for determining the entities in your medical
text and changes the way that some entities are returned in the output. You should use the
DetectEntitiesV2 operation in all new applications.
The DetectEntitiesV2 operation returns the Acuity and
Direction entities as attributes instead of types.

``` swift
public func detectEntitiesV2(input: DetectEntitiesV2Input, completion: @escaping (ClientRuntime.SdkResult<DetectEntitiesV2OutputResponse, DetectEntitiesV2OutputError>) -> Void)
```

### `detectPHI(input:completion:)`

Inspects the clinical text for protected health information (PHI) entities and returns
the entity category, location, and confidence score for each entity. Amazon Comprehend Medical
only detects entities in English language texts.

``` swift
public func detectPHI(input: DetectPHIInput, completion: @escaping (ClientRuntime.SdkResult<DetectPHIOutputResponse, DetectPHIOutputError>) -> Void)
```

### `inferICD10CM(input:completion:)`

InferICD10CM detects medical conditions as entities listed in a patient record and links
those entities to normalized concept identifiers in the ICD-10-CM knowledge base from the
Centers for Disease Control. Amazon Comprehend Medical only detects medical entities in
English language texts.

``` swift
public func inferICD10CM(input: InferICD10CMInput, completion: @escaping (ClientRuntime.SdkResult<InferICD10CMOutputResponse, InferICD10CMOutputError>) -> Void)
```

### `inferRxNorm(input:completion:)`

InferRxNorm detects medications as entities listed in a patient record and links to the
normalized concept identifiers in the RxNorm database from the National Library of Medicine.
Amazon Comprehend Medical only detects medical entities in English language texts.

``` swift
public func inferRxNorm(input: InferRxNormInput, completion: @escaping (ClientRuntime.SdkResult<InferRxNormOutputResponse, InferRxNormOutputError>) -> Void)
```

### `listEntitiesDetectionV2Jobs(input:completion:)`

Gets a list of medical entity detection jobs that you have submitted.

``` swift
public func listEntitiesDetectionV2Jobs(input: ListEntitiesDetectionV2JobsInput, completion: @escaping (ClientRuntime.SdkResult<ListEntitiesDetectionV2JobsOutputResponse, ListEntitiesDetectionV2JobsOutputError>) -> Void)
```

### `listICD10CMInferenceJobs(input:completion:)`

Gets a list of InferICD10CM jobs that you have submitted.

``` swift
public func listICD10CMInferenceJobs(input: ListICD10CMInferenceJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListICD10CMInferenceJobsOutputResponse, ListICD10CMInferenceJobsOutputError>) -> Void)
```

### `listPHIDetectionJobs(input:completion:)`

Gets a list of protected health information (PHI) detection jobs that you have
submitted.

``` swift
public func listPHIDetectionJobs(input: ListPHIDetectionJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListPHIDetectionJobsOutputResponse, ListPHIDetectionJobsOutputError>) -> Void)
```

### `listRxNormInferenceJobs(input:completion:)`

Gets a list of InferRxNorm jobs that you have submitted.

``` swift
public func listRxNormInferenceJobs(input: ListRxNormInferenceJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListRxNormInferenceJobsOutputResponse, ListRxNormInferenceJobsOutputError>) -> Void)
```

### `startEntitiesDetectionV2Job(input:completion:)`

Starts an asynchronous medical entity detection job for a collection of documents. Use the
DescribeEntitiesDetectionV2Job operation to track the status of a job.

``` swift
public func startEntitiesDetectionV2Job(input: StartEntitiesDetectionV2JobInput, completion: @escaping (ClientRuntime.SdkResult<StartEntitiesDetectionV2JobOutputResponse, StartEntitiesDetectionV2JobOutputError>) -> Void)
```

### `startICD10CMInferenceJob(input:completion:)`

Starts an asynchronous job to detect medical conditions and link them to the ICD-10-CM
ontology. Use the DescribeICD10CMInferenceJob operation to track the status of a
job.

``` swift
public func startICD10CMInferenceJob(input: StartICD10CMInferenceJobInput, completion: @escaping (ClientRuntime.SdkResult<StartICD10CMInferenceJobOutputResponse, StartICD10CMInferenceJobOutputError>) -> Void)
```

### `startPHIDetectionJob(input:completion:)`

Starts an asynchronous job to detect protected health information (PHI). Use the
DescribePHIDetectionJob operation to track the status of a job.

``` swift
public func startPHIDetectionJob(input: StartPHIDetectionJobInput, completion: @escaping (ClientRuntime.SdkResult<StartPHIDetectionJobOutputResponse, StartPHIDetectionJobOutputError>) -> Void)
```

### `startRxNormInferenceJob(input:completion:)`

Starts an asynchronous job to detect medication entities and link them to the RxNorm
ontology. Use the DescribeRxNormInferenceJob operation to track the status of a
job.

``` swift
public func startRxNormInferenceJob(input: StartRxNormInferenceJobInput, completion: @escaping (ClientRuntime.SdkResult<StartRxNormInferenceJobOutputResponse, StartRxNormInferenceJobOutputError>) -> Void)
```

### `stopEntitiesDetectionV2Job(input:completion:)`

Stops a medical entities detection job in progress.

``` swift
public func stopEntitiesDetectionV2Job(input: StopEntitiesDetectionV2JobInput, completion: @escaping (ClientRuntime.SdkResult<StopEntitiesDetectionV2JobOutputResponse, StopEntitiesDetectionV2JobOutputError>) -> Void)
```

### `stopICD10CMInferenceJob(input:completion:)`

Stops an InferICD10CM inference job in progress.

``` swift
public func stopICD10CMInferenceJob(input: StopICD10CMInferenceJobInput, completion: @escaping (ClientRuntime.SdkResult<StopICD10CMInferenceJobOutputResponse, StopICD10CMInferenceJobOutputError>) -> Void)
```

### `stopPHIDetectionJob(input:completion:)`

Stops a protected health information (PHI) detection job in progress.

``` swift
public func stopPHIDetectionJob(input: StopPHIDetectionJobInput, completion: @escaping (ClientRuntime.SdkResult<StopPHIDetectionJobOutputResponse, StopPHIDetectionJobOutputError>) -> Void)
```

### `stopRxNormInferenceJob(input:completion:)`

Stops an InferRxNorm inference job in progress.

``` swift
public func stopRxNormInferenceJob(input: StopRxNormInferenceJobInput, completion: @escaping (ClientRuntime.SdkResult<StopRxNormInferenceJobOutputResponse, StopRxNormInferenceJobOutputError>) -> Void)
```
