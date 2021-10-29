# ApplicationCostProfilerClientProtocol

This reference provides descriptions of the AWS Application Cost Profiler API. The AWS Application Cost Profiler API provides programmatic access to view, create, update, and delete application cost report definitions, as well as to import your usage data into the Application Cost Profiler service. For more information about using this service, see the [AWS Application Cost Profiler User Guide](https://docs.aws.amazon.com/application-cost-profiler/latest/userguide/introduction.html).

``` swift
public protocol ApplicationCostProfilerClientProtocol 
```

## Requirements

### deleteReportDefinition(input:completion:)

Deletes the specified report definition in AWS Application Cost Profiler. This stops the report from being generated.

``` swift
func deleteReportDefinition(input: DeleteReportDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteReportDefinitionOutputResponse, DeleteReportDefinitionOutputError>) -> Void)
```

### getReportDefinition(input:completion:)

Retrieves the definition of a report already configured in AWS Application Cost Profiler.

``` swift
func getReportDefinition(input: GetReportDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<GetReportDefinitionOutputResponse, GetReportDefinitionOutputError>) -> Void)
```

### importApplicationUsage(input:completion:)

Ingests application usage data from Amazon Simple Storage Service (Amazon S3). The data must already exist in the S3 location. As part of the action, AWS Application Cost Profiler copies the object from your S3 bucket to an S3 bucket owned by Amazon for processing asynchronously.

``` swift
func importApplicationUsage(input: ImportApplicationUsageInput, completion: @escaping (ClientRuntime.SdkResult<ImportApplicationUsageOutputResponse, ImportApplicationUsageOutputError>) -> Void)
```

### listReportDefinitions(input:completion:)

Retrieves a list of all reports and their configurations for your AWS account. The maximum number of reports is one.

``` swift
func listReportDefinitions(input: ListReportDefinitionsInput, completion: @escaping (ClientRuntime.SdkResult<ListReportDefinitionsOutputResponse, ListReportDefinitionsOutputError>) -> Void)
```

### putReportDefinition(input:completion:)

Creates the report definition for a report in Application Cost Profiler.

``` swift
func putReportDefinition(input: PutReportDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<PutReportDefinitionOutputResponse, PutReportDefinitionOutputError>) -> Void)
```

### updateReportDefinition(input:completion:)

Updates existing report in AWS Application Cost Profiler.

``` swift
func updateReportDefinition(input: UpdateReportDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateReportDefinitionOutputResponse, UpdateReportDefinitionOutputError>) -> Void)
```
