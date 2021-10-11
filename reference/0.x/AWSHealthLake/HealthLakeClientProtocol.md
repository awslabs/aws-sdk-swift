# HealthLakeClientProtocol

Amazon HealthLake is a HIPAA eligibile service that allows customers to store,
transform, query, and analyze their FHIR-formatted data in a consistent fashion in the cloud.

``` swift
public protocol HealthLakeClientProtocol 
```

## Requirements

### createFHIRDatastore(input:​completion:​)

Creates a Data Store that can ingest and export FHIR formatted data.

``` swift
func createFHIRDatastore(input: CreateFHIRDatastoreInput, completion: @escaping (ClientRuntime.SdkResult<CreateFHIRDatastoreOutputResponse, CreateFHIRDatastoreOutputError>) -> Void)
```

### deleteFHIRDatastore(input:​completion:​)

Deletes a Data Store.

``` swift
func deleteFHIRDatastore(input: DeleteFHIRDatastoreInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFHIRDatastoreOutputResponse, DeleteFHIRDatastoreOutputError>) -> Void)
```

### describeFHIRDatastore(input:​completion:​)

Gets the properties associated with the FHIR Data Store, including the Data Store ID,
Data Store ARN, Data Store name, Data Store status, created at, Data Store type version, and
Data Store endpoint.

``` swift
func describeFHIRDatastore(input: DescribeFHIRDatastoreInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFHIRDatastoreOutputResponse, DescribeFHIRDatastoreOutputError>) -> Void)
```

### describeFHIRExportJob(input:​completion:​)

Displays the properties of a FHIR export job, including the ID, ARN, name, and the status of the job.

``` swift
func describeFHIRExportJob(input: DescribeFHIRExportJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFHIRExportJobOutputResponse, DescribeFHIRExportJobOutputError>) -> Void)
```

### describeFHIRImportJob(input:​completion:​)

Displays the properties of a FHIR import job, including the ID, ARN, name, and the status of the job.

``` swift
func describeFHIRImportJob(input: DescribeFHIRImportJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFHIRImportJobOutputResponse, DescribeFHIRImportJobOutputError>) -> Void)
```

### listFHIRDatastores(input:​completion:​)

Lists all FHIR Data Stores that are in the user’s account, regardless of Data Store
status.

``` swift
func listFHIRDatastores(input: ListFHIRDatastoresInput, completion: @escaping (ClientRuntime.SdkResult<ListFHIRDatastoresOutputResponse, ListFHIRDatastoresOutputError>) -> Void)
```

### listFHIRExportJobs(input:​completion:​)

Lists all FHIR export jobs associated with an account and their statuses.

``` swift
func listFHIRExportJobs(input: ListFHIRExportJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListFHIRExportJobsOutputResponse, ListFHIRExportJobsOutputError>) -> Void)
```

### listFHIRImportJobs(input:​completion:​)

Lists all FHIR import jobs associated with an account and their statuses.

``` swift
func listFHIRImportJobs(input: ListFHIRImportJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListFHIRImportJobsOutputResponse, ListFHIRImportJobsOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

Returns a list of all existing tags associated with a Data Store.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### startFHIRExportJob(input:​completion:​)

Begins a FHIR export job.

``` swift
func startFHIRExportJob(input: StartFHIRExportJobInput, completion: @escaping (ClientRuntime.SdkResult<StartFHIRExportJobOutputResponse, StartFHIRExportJobOutputError>) -> Void)
```

### startFHIRImportJob(input:​completion:​)

Begins a FHIR Import job.

``` swift
func startFHIRImportJob(input: StartFHIRImportJobInput, completion: @escaping (ClientRuntime.SdkResult<StartFHIRImportJobOutputResponse, StartFHIRImportJobOutputError>) -> Void)
```

### tagResource(input:​completion:​)

Adds a user specifed key and value tag to a Data Store.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:​completion:​)

Removes tags from a Data Store.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```
