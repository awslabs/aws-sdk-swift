# ComprehendClientProtocol

Amazon Comprehend is an AWS service for gaining insight into the content of documents. Use these actions to determine the topics contained in your documents, the topics they discuss, the predominant sentiment expressed in them, the predominant language used, and more.

``` swift
public protocol ComprehendClientProtocol 
```

## Requirements

### batchDetectDominantLanguage(input:completion:)

Determines the dominant language of the input text for a batch of documents. For a list of languages that Amazon Comprehend can detect, see [Amazon Comprehend Supported Languages](https://docs.aws.amazon.com/comprehend/latest/dg/how-languages.html).

``` swift
func batchDetectDominantLanguage(input: BatchDetectDominantLanguageInput, completion: @escaping (ClientRuntime.SdkResult<BatchDetectDominantLanguageOutputResponse, BatchDetectDominantLanguageOutputError>) -> Void)
```

### batchDetectEntities(input:completion:)

Inspects the text of a batch of documents for named entities and returns information about them. For more information about named entities, see \[how-entities\]

``` swift
func batchDetectEntities(input: BatchDetectEntitiesInput, completion: @escaping (ClientRuntime.SdkResult<BatchDetectEntitiesOutputResponse, BatchDetectEntitiesOutputError>) -> Void)
```

### batchDetectKeyPhrases(input:completion:)

Detects the key noun phrases found in a batch of documents.

``` swift
func batchDetectKeyPhrases(input: BatchDetectKeyPhrasesInput, completion: @escaping (ClientRuntime.SdkResult<BatchDetectKeyPhrasesOutputResponse, BatchDetectKeyPhrasesOutputError>) -> Void)
```

### batchDetectSentiment(input:completion:)

Inspects a batch of documents and returns an inference of the prevailing sentiment, POSITIVE, NEUTRAL, MIXED, or NEGATIVE, in each one.

``` swift
func batchDetectSentiment(input: BatchDetectSentimentInput, completion: @escaping (ClientRuntime.SdkResult<BatchDetectSentimentOutputResponse, BatchDetectSentimentOutputError>) -> Void)
```

### batchDetectSyntax(input:completion:)

Inspects the text of a batch of documents for the syntax and part of speech of the words in the document and returns information about them. For more information, see \[how-syntax\].

``` swift
func batchDetectSyntax(input: BatchDetectSyntaxInput, completion: @escaping (ClientRuntime.SdkResult<BatchDetectSyntaxOutputResponse, BatchDetectSyntaxOutputError>) -> Void)
```

### classifyDocument(input:completion:)

Creates a new document classification request to analyze a single document in real-time, using a previously created and trained custom model and an endpoint.

``` swift
func classifyDocument(input: ClassifyDocumentInput, completion: @escaping (ClientRuntime.SdkResult<ClassifyDocumentOutputResponse, ClassifyDocumentOutputError>) -> Void)
```

### containsPiiEntities(input:completion:)

Analyzes input text for the presence of personally identifiable information (PII) and returns the labels of identified PII entity types such as name, address, bank account number, or phone number.

``` swift
func containsPiiEntities(input: ContainsPiiEntitiesInput, completion: @escaping (ClientRuntime.SdkResult<ContainsPiiEntitiesOutputResponse, ContainsPiiEntitiesOutputError>) -> Void)
```

### createDocumentClassifier(input:completion:)

Creates a new document classifier that you can use to categorize documents. To create a classifier, you provide a set of training documents that labeled with the categories that you want to use. After the classifier is trained you can use it to categorize a set of labeled documents into the categories. For more information, see \[how-document-classification\].

``` swift
func createDocumentClassifier(input: CreateDocumentClassifierInput, completion: @escaping (ClientRuntime.SdkResult<CreateDocumentClassifierOutputResponse, CreateDocumentClassifierOutputError>) -> Void)
```

### createEndpoint(input:completion:)

Creates a model-specific endpoint for synchronous inference for a previously trained custom model

``` swift
func createEndpoint(input: CreateEndpointInput, completion: @escaping (ClientRuntime.SdkResult<CreateEndpointOutputResponse, CreateEndpointOutputError>) -> Void)
```

### createEntityRecognizer(input:completion:)

Creates an entity recognizer using submitted files. After your CreateEntityRecognizer request is submitted, you can check job status using the API.

``` swift
func createEntityRecognizer(input: CreateEntityRecognizerInput, completion: @escaping (ClientRuntime.SdkResult<CreateEntityRecognizerOutputResponse, CreateEntityRecognizerOutputError>) -> Void)
```

### deleteDocumentClassifier(input:completion:)

Deletes a previously created document classifier Only those classifiers that are in terminated states (IN\_ERROR, TRAINED) will be deleted. If an active inference job is using the model, a ResourceInUseException will be returned. This is an asynchronous action that puts the classifier into a DELETING state, and it is then removed by a background job. Once removed, the classifier disappears from your account and is no longer available for use.

``` swift
func deleteDocumentClassifier(input: DeleteDocumentClassifierInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDocumentClassifierOutputResponse, DeleteDocumentClassifierOutputError>) -> Void)
```

### deleteEndpoint(input:completion:)

Deletes a model-specific endpoint for a previously-trained custom model. All endpoints must be deleted in order for the model to be deleted.

``` swift
func deleteEndpoint(input: DeleteEndpointInput, completion: @escaping (ClientRuntime.SdkResult<DeleteEndpointOutputResponse, DeleteEndpointOutputError>) -> Void)
```

### deleteEntityRecognizer(input:completion:)

Deletes an entity recognizer. Only those recognizers that are in terminated states (IN\_ERROR, TRAINED) will be deleted. If an active inference job is using the model, a ResourceInUseException will be returned. This is an asynchronous action that puts the recognizer into a DELETING state, and it is then removed by a background job. Once removed, the recognizer disappears from your account and is no longer available for use.

``` swift
func deleteEntityRecognizer(input: DeleteEntityRecognizerInput, completion: @escaping (ClientRuntime.SdkResult<DeleteEntityRecognizerOutputResponse, DeleteEntityRecognizerOutputError>) -> Void)
```

### describeDocumentClassificationJob(input:completion:)

Gets the properties associated with a document classification job. Use this operation to get the status of a classification job.

``` swift
func describeDocumentClassificationJob(input: DescribeDocumentClassificationJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDocumentClassificationJobOutputResponse, DescribeDocumentClassificationJobOutputError>) -> Void)
```

### describeDocumentClassifier(input:completion:)

Gets the properties associated with a document classifier.

``` swift
func describeDocumentClassifier(input: DescribeDocumentClassifierInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDocumentClassifierOutputResponse, DescribeDocumentClassifierOutputError>) -> Void)
```

### describeDominantLanguageDetectionJob(input:completion:)

Gets the properties associated with a dominant language detection job. Use this operation to get the status of a detection job.

``` swift
func describeDominantLanguageDetectionJob(input: DescribeDominantLanguageDetectionJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDominantLanguageDetectionJobOutputResponse, DescribeDominantLanguageDetectionJobOutputError>) -> Void)
```

### describeEndpoint(input:completion:)

Gets the properties associated with a specific endpoint. Use this operation to get the status of an endpoint.

``` swift
func describeEndpoint(input: DescribeEndpointInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEndpointOutputResponse, DescribeEndpointOutputError>) -> Void)
```

### describeEntitiesDetectionJob(input:completion:)

Gets the properties associated with an entities detection job. Use this operation to get the status of a detection job.

``` swift
func describeEntitiesDetectionJob(input: DescribeEntitiesDetectionJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEntitiesDetectionJobOutputResponse, DescribeEntitiesDetectionJobOutputError>) -> Void)
```

### describeEntityRecognizer(input:completion:)

Provides details about an entity recognizer including status, S3 buckets containing training data, recognizer metadata, metrics, and so on.

``` swift
func describeEntityRecognizer(input: DescribeEntityRecognizerInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEntityRecognizerOutputResponse, DescribeEntityRecognizerOutputError>) -> Void)
```

### describeEventsDetectionJob(input:completion:)

Gets the status and details of an events detection job.

``` swift
func describeEventsDetectionJob(input: DescribeEventsDetectionJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEventsDetectionJobOutputResponse, DescribeEventsDetectionJobOutputError>) -> Void)
```

### describeKeyPhrasesDetectionJob(input:completion:)

Gets the properties associated with a key phrases detection job. Use this operation to get the status of a detection job.

``` swift
func describeKeyPhrasesDetectionJob(input: DescribeKeyPhrasesDetectionJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeKeyPhrasesDetectionJobOutputResponse, DescribeKeyPhrasesDetectionJobOutputError>) -> Void)
```

### describePiiEntitiesDetectionJob(input:completion:)

Gets the properties associated with a PII entities detection job. For example, you can use this operation to get the job status.

``` swift
func describePiiEntitiesDetectionJob(input: DescribePiiEntitiesDetectionJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribePiiEntitiesDetectionJobOutputResponse, DescribePiiEntitiesDetectionJobOutputError>) -> Void)
```

### describeSentimentDetectionJob(input:completion:)

Gets the properties associated with a sentiment detection job. Use this operation to get the status of a detection job.

``` swift
func describeSentimentDetectionJob(input: DescribeSentimentDetectionJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSentimentDetectionJobOutputResponse, DescribeSentimentDetectionJobOutputError>) -> Void)
```

### describeTopicsDetectionJob(input:completion:)

Gets the properties associated with a topic detection job. Use this operation to get the status of a detection job.

``` swift
func describeTopicsDetectionJob(input: DescribeTopicsDetectionJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTopicsDetectionJobOutputResponse, DescribeTopicsDetectionJobOutputError>) -> Void)
```

### detectDominantLanguage(input:completion:)

Determines the dominant language of the input text. For a list of languages that Amazon Comprehend can detect, see [Amazon Comprehend Supported Languages](https://docs.aws.amazon.com/comprehend/latest/dg/how-languages.html).

``` swift
func detectDominantLanguage(input: DetectDominantLanguageInput, completion: @escaping (ClientRuntime.SdkResult<DetectDominantLanguageOutputResponse, DetectDominantLanguageOutputError>) -> Void)
```

### detectEntities(input:completion:)

Inspects text for named entities, and returns information about them. For more information, about named entities, see \[how-entities\].

``` swift
func detectEntities(input: DetectEntitiesInput, completion: @escaping (ClientRuntime.SdkResult<DetectEntitiesOutputResponse, DetectEntitiesOutputError>) -> Void)
```

### detectKeyPhrases(input:completion:)

Detects the key noun phrases found in the text.

``` swift
func detectKeyPhrases(input: DetectKeyPhrasesInput, completion: @escaping (ClientRuntime.SdkResult<DetectKeyPhrasesOutputResponse, DetectKeyPhrasesOutputError>) -> Void)
```

### detectPiiEntities(input:completion:)

Inspects the input text for entities that contain personally identifiable information (PII) and returns information about them.

``` swift
func detectPiiEntities(input: DetectPiiEntitiesInput, completion: @escaping (ClientRuntime.SdkResult<DetectPiiEntitiesOutputResponse, DetectPiiEntitiesOutputError>) -> Void)
```

### detectSentiment(input:completion:)

Inspects text and returns an inference of the prevailing sentiment (POSITIVE, NEUTRAL, MIXED, or NEGATIVE).

``` swift
func detectSentiment(input: DetectSentimentInput, completion: @escaping (ClientRuntime.SdkResult<DetectSentimentOutputResponse, DetectSentimentOutputError>) -> Void)
```

### detectSyntax(input:completion:)

Inspects text for syntax and the part of speech of words in the document. For more information, \[how-syntax\].

``` swift
func detectSyntax(input: DetectSyntaxInput, completion: @escaping (ClientRuntime.SdkResult<DetectSyntaxOutputResponse, DetectSyntaxOutputError>) -> Void)
```

### listDocumentClassificationJobs(input:completion:)

Gets a list of the documentation classification jobs that you have submitted.

``` swift
func listDocumentClassificationJobs(input: ListDocumentClassificationJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListDocumentClassificationJobsOutputResponse, ListDocumentClassificationJobsOutputError>) -> Void)
```

### listDocumentClassifiers(input:completion:)

Gets a list of the document classifiers that you have created.

``` swift
func listDocumentClassifiers(input: ListDocumentClassifiersInput, completion: @escaping (ClientRuntime.SdkResult<ListDocumentClassifiersOutputResponse, ListDocumentClassifiersOutputError>) -> Void)
```

### listDocumentClassifierSummaries(input:completion:)

Gets a list of summaries of the document classifiers that you have created

``` swift
func listDocumentClassifierSummaries(input: ListDocumentClassifierSummariesInput, completion: @escaping (ClientRuntime.SdkResult<ListDocumentClassifierSummariesOutputResponse, ListDocumentClassifierSummariesOutputError>) -> Void)
```

### listDominantLanguageDetectionJobs(input:completion:)

Gets a list of the dominant language detection jobs that you have submitted.

``` swift
func listDominantLanguageDetectionJobs(input: ListDominantLanguageDetectionJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListDominantLanguageDetectionJobsOutputResponse, ListDominantLanguageDetectionJobsOutputError>) -> Void)
```

### listEndpoints(input:completion:)

Gets a list of all existing endpoints that you've created.

``` swift
func listEndpoints(input: ListEndpointsInput, completion: @escaping (ClientRuntime.SdkResult<ListEndpointsOutputResponse, ListEndpointsOutputError>) -> Void)
```

### listEntitiesDetectionJobs(input:completion:)

Gets a list of the entity detection jobs that you have submitted.

``` swift
func listEntitiesDetectionJobs(input: ListEntitiesDetectionJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListEntitiesDetectionJobsOutputResponse, ListEntitiesDetectionJobsOutputError>) -> Void)
```

### listEntityRecognizers(input:completion:)

Gets a list of the properties of all entity recognizers that you created, including recognizers currently in training. Allows you to filter the list of recognizers based on criteria such as status and submission time. This call returns up to 500 entity recognizers in the list, with a default number of 100 recognizers in the list. The results of this list are not in any particular order. Please get the list and sort locally if needed.

``` swift
func listEntityRecognizers(input: ListEntityRecognizersInput, completion: @escaping (ClientRuntime.SdkResult<ListEntityRecognizersOutputResponse, ListEntityRecognizersOutputError>) -> Void)
```

### listEntityRecognizerSummaries(input:completion:)

Gets a list of summaries for the entity recognizers that you have created.

``` swift
func listEntityRecognizerSummaries(input: ListEntityRecognizerSummariesInput, completion: @escaping (ClientRuntime.SdkResult<ListEntityRecognizerSummariesOutputResponse, ListEntityRecognizerSummariesOutputError>) -> Void)
```

### listEventsDetectionJobs(input:completion:)

Gets a list of the events detection jobs that you have submitted.

``` swift
func listEventsDetectionJobs(input: ListEventsDetectionJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListEventsDetectionJobsOutputResponse, ListEventsDetectionJobsOutputError>) -> Void)
```

### listKeyPhrasesDetectionJobs(input:completion:)

Get a list of key phrase detection jobs that you have submitted.

``` swift
func listKeyPhrasesDetectionJobs(input: ListKeyPhrasesDetectionJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListKeyPhrasesDetectionJobsOutputResponse, ListKeyPhrasesDetectionJobsOutputError>) -> Void)
```

### listPiiEntitiesDetectionJobs(input:completion:)

Gets a list of the PII entity detection jobs that you have submitted.

``` swift
func listPiiEntitiesDetectionJobs(input: ListPiiEntitiesDetectionJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListPiiEntitiesDetectionJobsOutputResponse, ListPiiEntitiesDetectionJobsOutputError>) -> Void)
```

### listSentimentDetectionJobs(input:completion:)

Gets a list of sentiment detection jobs that you have submitted.

``` swift
func listSentimentDetectionJobs(input: ListSentimentDetectionJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListSentimentDetectionJobsOutputResponse, ListSentimentDetectionJobsOutputError>) -> Void)
```

### listTagsForResource(input:completion:)

Lists all tags associated with a given Amazon Comprehend resource.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### listTopicsDetectionJobs(input:completion:)

Gets a list of the topic detection jobs that you have submitted.

``` swift
func listTopicsDetectionJobs(input: ListTopicsDetectionJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListTopicsDetectionJobsOutputResponse, ListTopicsDetectionJobsOutputError>) -> Void)
```

### startDocumentClassificationJob(input:completion:)

Starts an asynchronous document classification job. Use the operation to track the progress of the job.

``` swift
func startDocumentClassificationJob(input: StartDocumentClassificationJobInput, completion: @escaping (ClientRuntime.SdkResult<StartDocumentClassificationJobOutputResponse, StartDocumentClassificationJobOutputError>) -> Void)
```

### startDominantLanguageDetectionJob(input:completion:)

Starts an asynchronous dominant language detection job for a collection of documents. Use the operation to track the status of a job.

``` swift
func startDominantLanguageDetectionJob(input: StartDominantLanguageDetectionJobInput, completion: @escaping (ClientRuntime.SdkResult<StartDominantLanguageDetectionJobOutputResponse, StartDominantLanguageDetectionJobOutputError>) -> Void)
```

### startEntitiesDetectionJob(input:completion:)

Starts an asynchronous entity detection job for a collection of documents. Use the operation to track the status of a job. This API can be used for either standard entity detection or custom entity recognition. In order to be used for custom entity recognition, the optional EntityRecognizerArn must be used in order to provide access to the recognizer being used to detect the custom entity.

``` swift
func startEntitiesDetectionJob(input: StartEntitiesDetectionJobInput, completion: @escaping (ClientRuntime.SdkResult<StartEntitiesDetectionJobOutputResponse, StartEntitiesDetectionJobOutputError>) -> Void)
```

### startEventsDetectionJob(input:completion:)

Starts an asynchronous event detection job for a collection of documents.

``` swift
func startEventsDetectionJob(input: StartEventsDetectionJobInput, completion: @escaping (ClientRuntime.SdkResult<StartEventsDetectionJobOutputResponse, StartEventsDetectionJobOutputError>) -> Void)
```

### startKeyPhrasesDetectionJob(input:completion:)

Starts an asynchronous key phrase detection job for a collection of documents. Use the operation to track the status of a job.

``` swift
func startKeyPhrasesDetectionJob(input: StartKeyPhrasesDetectionJobInput, completion: @escaping (ClientRuntime.SdkResult<StartKeyPhrasesDetectionJobOutputResponse, StartKeyPhrasesDetectionJobOutputError>) -> Void)
```

### startPiiEntitiesDetectionJob(input:completion:)

Starts an asynchronous PII entity detection job for a collection of documents.

``` swift
func startPiiEntitiesDetectionJob(input: StartPiiEntitiesDetectionJobInput, completion: @escaping (ClientRuntime.SdkResult<StartPiiEntitiesDetectionJobOutputResponse, StartPiiEntitiesDetectionJobOutputError>) -> Void)
```

### startSentimentDetectionJob(input:completion:)

Starts an asynchronous sentiment detection job for a collection of documents. use the operation to track the status of a job.

``` swift
func startSentimentDetectionJob(input: StartSentimentDetectionJobInput, completion: @escaping (ClientRuntime.SdkResult<StartSentimentDetectionJobOutputResponse, StartSentimentDetectionJobOutputError>) -> Void)
```

### startTopicsDetectionJob(input:completion:)

Starts an asynchronous topic detection job. Use the DescribeTopicDetectionJob operation to track the status of a job.

``` swift
func startTopicsDetectionJob(input: StartTopicsDetectionJobInput, completion: @escaping (ClientRuntime.SdkResult<StartTopicsDetectionJobOutputResponse, StartTopicsDetectionJobOutputError>) -> Void)
```

### stopDominantLanguageDetectionJob(input:completion:)

Stops a dominant language detection job in progress. If the job state is IN\_PROGRESS the job is marked for termination and put into the STOP\_REQUESTED state. If the job completes before it can be stopped, it is put into the COMPLETED state; otherwise the job is stopped and put into the STOPPED state. If the job is in the COMPLETED or FAILED state when you call the StopDominantLanguageDetectionJob operation, the operation returns a 400 Internal Request Exception. When a job is stopped, any documents already processed are written to the output location.

``` swift
func stopDominantLanguageDetectionJob(input: StopDominantLanguageDetectionJobInput, completion: @escaping (ClientRuntime.SdkResult<StopDominantLanguageDetectionJobOutputResponse, StopDominantLanguageDetectionJobOutputError>) -> Void)
```

### stopEntitiesDetectionJob(input:completion:)

Stops an entities detection job in progress. If the job state is IN\_PROGRESS the job is marked for termination and put into the STOP\_REQUESTED state. If the job completes before it can be stopped, it is put into the COMPLETED state; otherwise the job is stopped and put into the STOPPED state. If the job is in the COMPLETED or FAILED state when you call the StopDominantLanguageDetectionJob operation, the operation returns a 400 Internal Request Exception. When a job is stopped, any documents already processed are written to the output location.

``` swift
func stopEntitiesDetectionJob(input: StopEntitiesDetectionJobInput, completion: @escaping (ClientRuntime.SdkResult<StopEntitiesDetectionJobOutputResponse, StopEntitiesDetectionJobOutputError>) -> Void)
```

### stopEventsDetectionJob(input:completion:)

Stops an events detection job in progress.

``` swift
func stopEventsDetectionJob(input: StopEventsDetectionJobInput, completion: @escaping (ClientRuntime.SdkResult<StopEventsDetectionJobOutputResponse, StopEventsDetectionJobOutputError>) -> Void)
```

### stopKeyPhrasesDetectionJob(input:completion:)

Stops a key phrases detection job in progress. If the job state is IN\_PROGRESS the job is marked for termination and put into the STOP\_REQUESTED state. If the job completes before it can be stopped, it is put into the COMPLETED state; otherwise the job is stopped and put into the STOPPED state. If the job is in the COMPLETED or FAILED state when you call the StopDominantLanguageDetectionJob operation, the operation returns a 400 Internal Request Exception. When a job is stopped, any documents already processed are written to the output location.

``` swift
func stopKeyPhrasesDetectionJob(input: StopKeyPhrasesDetectionJobInput, completion: @escaping (ClientRuntime.SdkResult<StopKeyPhrasesDetectionJobOutputResponse, StopKeyPhrasesDetectionJobOutputError>) -> Void)
```

### stopPiiEntitiesDetectionJob(input:completion:)

Stops a PII entities detection job in progress.

``` swift
func stopPiiEntitiesDetectionJob(input: StopPiiEntitiesDetectionJobInput, completion: @escaping (ClientRuntime.SdkResult<StopPiiEntitiesDetectionJobOutputResponse, StopPiiEntitiesDetectionJobOutputError>) -> Void)
```

### stopSentimentDetectionJob(input:completion:)

Stops a sentiment detection job in progress. If the job state is IN\_PROGRESS the job is marked for termination and put into the STOP\_REQUESTED state. If the job completes before it can be stopped, it is put into the COMPLETED state; otherwise the job is be stopped and put into the STOPPED state. If the job is in the COMPLETED or FAILED state when you call the StopDominantLanguageDetectionJob operation, the operation returns a 400 Internal Request Exception. When a job is stopped, any documents already processed are written to the output location.

``` swift
func stopSentimentDetectionJob(input: StopSentimentDetectionJobInput, completion: @escaping (ClientRuntime.SdkResult<StopSentimentDetectionJobOutputResponse, StopSentimentDetectionJobOutputError>) -> Void)
```

### stopTrainingDocumentClassifier(input:completion:)

Stops a document classifier training job while in progress. If the training job state is TRAINING, the job is marked for termination and put into the STOP\_REQUESTED state. If the training job completes before it can be stopped, it is put into the TRAINED; otherwise the training job is stopped and put into the STOPPED state and the service sends back an HTTP 200 response with an empty HTTP body.

``` swift
func stopTrainingDocumentClassifier(input: StopTrainingDocumentClassifierInput, completion: @escaping (ClientRuntime.SdkResult<StopTrainingDocumentClassifierOutputResponse, StopTrainingDocumentClassifierOutputError>) -> Void)
```

### stopTrainingEntityRecognizer(input:completion:)

Stops an entity recognizer training job while in progress. If the training job state is TRAINING, the job is marked for termination and put into the STOP\_REQUESTED state. If the training job completes before it can be stopped, it is put into the TRAINED; otherwise the training job is stopped and putted into the STOPPED state and the service sends back an HTTP 200 response with an empty HTTP body.

``` swift
func stopTrainingEntityRecognizer(input: StopTrainingEntityRecognizerInput, completion: @escaping (ClientRuntime.SdkResult<StopTrainingEntityRecognizerOutputResponse, StopTrainingEntityRecognizerOutputError>) -> Void)
```

### tagResource(input:completion:)

Associates a specific tag with an Amazon Comprehend resource. A tag is a key-value pair that adds as a metadata to a resource used by Amazon Comprehend. For example, a tag with "Sales" as the key might be added to a resource to indicate its use by the sales department.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:completion:)

Removes a specific tag associated with an Amazon Comprehend resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateEndpoint(input:completion:)

Updates information about the specified endpoint.

``` swift
func updateEndpoint(input: UpdateEndpointInput, completion: @escaping (ClientRuntime.SdkResult<UpdateEndpointOutputResponse, UpdateEndpointOutputError>) -> Void)
```
