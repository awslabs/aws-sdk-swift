# TranslateClient

``` swift
public class TranslateClient 
```

## Inheritance

[`TranslateClientProtocol`](/aws-sdk-swift/reference/0.x/AWSTranslate/TranslateClientProtocol)

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

### `createParallelData(input:completion:)`

Creates a parallel data resource in Amazon Translate by importing an input file from
Amazon S3. Parallel data files contain examples of source phrases and their translations from
your translation memory. By adding parallel data, you can influence the style, tone, and word
choice in your translation output.

``` swift
public func createParallelData(input: CreateParallelDataInput, completion: @escaping (ClientRuntime.SdkResult<CreateParallelDataOutputResponse, CreateParallelDataOutputError>) -> Void)
```

### `deleteParallelData(input:completion:)`

Deletes a parallel data resource in Amazon Translate.

``` swift
public func deleteParallelData(input: DeleteParallelDataInput, completion: @escaping (ClientRuntime.SdkResult<DeleteParallelDataOutputResponse, DeleteParallelDataOutputError>) -> Void)
```

### `deleteTerminology(input:completion:)`

A synchronous action that deletes a custom terminology.

``` swift
public func deleteTerminology(input: DeleteTerminologyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTerminologyOutputResponse, DeleteTerminologyOutputError>) -> Void)
```

### `describeTextTranslationJob(input:completion:)`

Gets the properties associated with an asycnhronous batch translation job including name,
ID, status, source and target languages, input/output S3 buckets, and so on.

``` swift
public func describeTextTranslationJob(input: DescribeTextTranslationJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTextTranslationJobOutputResponse, DescribeTextTranslationJobOutputError>) -> Void)
```

### `getParallelData(input:completion:)`

Provides information about a parallel data resource.

``` swift
public func getParallelData(input: GetParallelDataInput, completion: @escaping (ClientRuntime.SdkResult<GetParallelDataOutputResponse, GetParallelDataOutputError>) -> Void)
```

### `getTerminology(input:completion:)`

Retrieves a custom terminology.

``` swift
public func getTerminology(input: GetTerminologyInput, completion: @escaping (ClientRuntime.SdkResult<GetTerminologyOutputResponse, GetTerminologyOutputError>) -> Void)
```

### `importTerminology(input:completion:)`

Creates or updates a custom terminology, depending on whether or not one already exists
for the given terminology name. Importing a terminology with the same name as an existing one
will merge the terminologies based on the chosen merge strategy. Currently, the only supported
merge strategy is OVERWRITE, and so the imported terminology will overwrite an existing
terminology of the same name.
If you import a terminology that overwrites an existing one, the new terminology take up
to 10 minutes to fully propagate and be available for use in a translation due to cache
policies with the DataPlane service that performs the translations.

``` swift
public func importTerminology(input: ImportTerminologyInput, completion: @escaping (ClientRuntime.SdkResult<ImportTerminologyOutputResponse, ImportTerminologyOutputError>) -> Void)
```

### `listParallelData(input:completion:)`

Provides a list of your parallel data resources in Amazon Translate.

``` swift
public func listParallelData(input: ListParallelDataInput, completion: @escaping (ClientRuntime.SdkResult<ListParallelDataOutputResponse, ListParallelDataOutputError>) -> Void)
```

### `listTerminologies(input:completion:)`

Provides a list of custom terminologies associated with your account.

``` swift
public func listTerminologies(input: ListTerminologiesInput, completion: @escaping (ClientRuntime.SdkResult<ListTerminologiesOutputResponse, ListTerminologiesOutputError>) -> Void)
```

### `listTextTranslationJobs(input:completion:)`

Gets a list of the batch translation jobs that you have submitted.

``` swift
public func listTextTranslationJobs(input: ListTextTranslationJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListTextTranslationJobsOutputResponse, ListTextTranslationJobsOutputError>) -> Void)
```

### `startTextTranslationJob(input:completion:)`

Starts an asynchronous batch translation job. Batch translation jobs can be used to
translate large volumes of text across multiple documents at once. For more information, see
async.

``` swift
public func startTextTranslationJob(input: StartTextTranslationJobInput, completion: @escaping (ClientRuntime.SdkResult<StartTextTranslationJobOutputResponse, StartTextTranslationJobOutputError>) -> Void)
```

``` 
     Batch translation jobs can be described with the DescribeTextTranslationJob operation, listed with the ListTextTranslationJobs operation, and stopped with the StopTextTranslationJob operation.

        Amazon Translate does not support batch translation of multiple source languages at once.
```

### `stopTextTranslationJob(input:completion:)`

Stops an asynchronous batch translation job that is in progress.
If the job's state is IN\_PROGRESS, the job will be marked for termination and
put into the STOP\_REQUESTED state. If the job completes before it can be stopped,
it is put into the COMPLETED state. Otherwise, the job is put into the
STOPPED state.
Asynchronous batch translation jobs are started with the StartTextTranslationJob operation. You can use the DescribeTextTranslationJob or ListTextTranslationJobs
operations to get a batch translation job's JobId.

``` swift
public func stopTextTranslationJob(input: StopTextTranslationJobInput, completion: @escaping (ClientRuntime.SdkResult<StopTextTranslationJobOutputResponse, StopTextTranslationJobOutputError>) -> Void)
```

### `translateText(input:completion:)`

Translates input text from the source language to the target language. For a list of
available languages and language codes, see what-is-languages.

``` swift
public func translateText(input: TranslateTextInput, completion: @escaping (ClientRuntime.SdkResult<TranslateTextOutputResponse, TranslateTextOutputError>) -> Void)
```

### `updateParallelData(input:completion:)`

Updates a previously created parallel data resource by importing a new input file from
Amazon S3.

``` swift
public func updateParallelData(input: UpdateParallelDataInput, completion: @escaping (ClientRuntime.SdkResult<UpdateParallelDataOutputResponse, UpdateParallelDataOutputError>) -> Void)
```
