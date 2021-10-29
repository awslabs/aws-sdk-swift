# ApplicationDiscoveryClient

``` swift
public class ApplicationDiscoveryClient 
```

## Inheritance

[`ApplicationDiscoveryClientProtocol`](/aws-sdk-swift/reference/0.x/AWSApplicationDiscoveryService/ApplicationDiscoveryClientProtocol)

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
public static let clientName = "ApplicationDiscoveryClient"
```

## Methods

### `associateConfigurationItemsToApplication(input:completion:)`

Associates one or more configuration items with an application.

``` swift
public func associateConfigurationItemsToApplication(input: AssociateConfigurationItemsToApplicationInput, completion: @escaping (ClientRuntime.SdkResult<AssociateConfigurationItemsToApplicationOutputResponse, AssociateConfigurationItemsToApplicationOutputError>) -> Void)
```

### `batchDeleteImportData(input:completion:)`

Deletes one or more import tasks, each identified by their import ID. Each import task has a number of records that can identify servers or applications. AWS Application Discovery Service has built-in matching logic that will identify when discovered servers match existing entries that you've previously discovered, the information for the already-existing discovered server is updated. When you delete an import task that contains records that were used to match, the information in those matched records that comes from the deleted records will also be deleted.

``` swift
public func batchDeleteImportData(input: BatchDeleteImportDataInput, completion: @escaping (ClientRuntime.SdkResult<BatchDeleteImportDataOutputResponse, BatchDeleteImportDataOutputError>) -> Void)
```

### `createApplication(input:completion:)`

Creates an application with the given name and description.

``` swift
public func createApplication(input: CreateApplicationInput, completion: @escaping (ClientRuntime.SdkResult<CreateApplicationOutputResponse, CreateApplicationOutputError>) -> Void)
```

### `createTags(input:completion:)`

Creates one or more tags for configuration items. Tags are metadata that help you categorize IT assets. This API accepts a list of multiple configuration items.

``` swift
public func createTags(input: CreateTagsInput, completion: @escaping (ClientRuntime.SdkResult<CreateTagsOutputResponse, CreateTagsOutputError>) -> Void)
```

### `deleteApplications(input:completion:)`

Deletes a list of applications and their associations with configuration items.

``` swift
public func deleteApplications(input: DeleteApplicationsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteApplicationsOutputResponse, DeleteApplicationsOutputError>) -> Void)
```

### `deleteTags(input:completion:)`

Deletes the association between configuration items and one or more tags. This API accepts a list of multiple configuration items.

``` swift
public func deleteTags(input: DeleteTagsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTagsOutputResponse, DeleteTagsOutputError>) -> Void)
```

### `describeAgents(input:completion:)`

Lists agents or connectors as specified by ID or other filters. All agents/connectors associated with your user account can be listed if you call DescribeAgents as is without passing any parameters.

``` swift
public func describeAgents(input: DescribeAgentsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAgentsOutputResponse, DescribeAgentsOutputError>) -> Void)
```

### `describeConfigurations(input:completion:)`

Retrieves attributes for a list of configuration item IDs. All of the supplied IDs must be for the same asset type from one of the following:

``` swift
public func describeConfigurations(input: DescribeConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeConfigurationsOutputResponse, DescribeConfigurationsOutputError>) -> Void)
```

  - server

  - application

  - process

  - connection

Output fields are specific to the asset type specified. For example, the output for a server configuration item includes a list of attributes about the server, such as host name, operating system, number of network cards, etc. For a complete list of outputs for each asset type, see [Using the DescribeConfigurations Action](https://docs.aws.amazon.com/application-discovery/latest/userguide/discovery-api-queries.html#DescribeConfigurations) in the AWS Application Discovery Service User Guide.

### `describeContinuousExports(input:completion:)`

Lists exports as specified by ID. All continuous exports associated with your user account can be listed if you call DescribeContinuousExports as is without passing any parameters.

``` swift
public func describeContinuousExports(input: DescribeContinuousExportsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeContinuousExportsOutputResponse, DescribeContinuousExportsOutputError>) -> Void)
```

### `describeExportConfigurations(input:completion:)`

DescribeExportConfigurations is deprecated. Use [DescribeImportTasks](https://docs.aws.amazon.com/application-discovery/latest/APIReference/API_DescribeExportTasks.html), instead.

``` swift
@available(*, deprecated)
    public func describeExportConfigurations(input: DescribeExportConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeExportConfigurationsOutputResponse, DescribeExportConfigurationsOutputError>) -> Void)
```

### `describeExportTasks(input:completion:)`

Retrieve status of one or more export tasks. You can retrieve the status of up to 100 export tasks.

``` swift
public func describeExportTasks(input: DescribeExportTasksInput, completion: @escaping (ClientRuntime.SdkResult<DescribeExportTasksOutputResponse, DescribeExportTasksOutputError>) -> Void)
```

### `describeImportTasks(input:completion:)`

Returns an array of import tasks for your account, including status information, times, IDs, the Amazon S3 Object URL for the import file, and more.

``` swift
public func describeImportTasks(input: DescribeImportTasksInput, completion: @escaping (ClientRuntime.SdkResult<DescribeImportTasksOutputResponse, DescribeImportTasksOutputError>) -> Void)
```

### `describeTags(input:completion:)`

Retrieves a list of configuration items that have tags as specified by the key-value pairs, name and value, passed to the optional parameter filters. There are three valid tag filter names:

``` swift
public func describeTags(input: DescribeTagsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTagsOutputResponse, DescribeTagsOutputError>) -> Void)
```

  - tagKey

  - tagValue

  - configurationId

Also, all configuration items associated with your user account that have tags can be listed if you call DescribeTags as is without passing any parameters.

### `disassociateConfigurationItemsFromApplication(input:completion:)`

Disassociates one or more configuration items from an application.

``` swift
public func disassociateConfigurationItemsFromApplication(input: DisassociateConfigurationItemsFromApplicationInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateConfigurationItemsFromApplicationOutputResponse, DisassociateConfigurationItemsFromApplicationOutputError>) -> Void)
```

### `exportConfigurations(input:completion:)`

Deprecated. Use StartExportTask instead. Exports all discovered configuration data to an Amazon S3 bucket or an application that enables you to view and evaluate the data. Data includes tags and tag associations, processes, connections, servers, and system performance. This API returns an export ID that you can query using the DescribeExportConfigurations API. The system imposes a limit of two configuration exports in six hours.

``` swift
@available(*, deprecated)
    public func exportConfigurations(input: ExportConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<ExportConfigurationsOutputResponse, ExportConfigurationsOutputError>) -> Void)
```

### `getDiscoverySummary(input:completion:)`

Retrieves a short summary of discovered assets. This API operation takes no request parameters and is called as is at the command prompt as shown in the example.

``` swift
public func getDiscoverySummary(input: GetDiscoverySummaryInput, completion: @escaping (ClientRuntime.SdkResult<GetDiscoverySummaryOutputResponse, GetDiscoverySummaryOutputError>) -> Void)
```

### `listConfigurations(input:completion:)`

Retrieves a list of configuration items as specified by the value passed to the required parameter configurationType. Optional filtering may be applied to refine search results.

``` swift
public func listConfigurations(input: ListConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<ListConfigurationsOutputResponse, ListConfigurationsOutputError>) -> Void)
```

### `listServerNeighbors(input:completion:)`

Retrieves a list of servers that are one network hop away from a specified server.

``` swift
public func listServerNeighbors(input: ListServerNeighborsInput, completion: @escaping (ClientRuntime.SdkResult<ListServerNeighborsOutputResponse, ListServerNeighborsOutputError>) -> Void)
```

### `startContinuousExport(input:completion:)`

Start the continuous flow of agent's discovered data into Amazon Athena.

``` swift
public func startContinuousExport(input: StartContinuousExportInput, completion: @escaping (ClientRuntime.SdkResult<StartContinuousExportOutputResponse, StartContinuousExportOutputError>) -> Void)
```

### `startDataCollectionByAgentIds(input:completion:)`

Instructs the specified agents or connectors to start collecting data.

``` swift
public func startDataCollectionByAgentIds(input: StartDataCollectionByAgentIdsInput, completion: @escaping (ClientRuntime.SdkResult<StartDataCollectionByAgentIdsOutputResponse, StartDataCollectionByAgentIdsOutputError>) -> Void)
```

### `startExportTask(input:completion:)`

Begins the export of discovered data to an S3 bucket. If you specify agentIds in a filter, the task exports up to 72 hours of detailed data collected by the identified Application Discovery Agent, including network, process, and performance details. A time range for exported agent data may be set by using startTime and endTime. Export of detailed agent data is limited to five concurrently running exports. If you do not include an agentIds filter, summary data is exported that includes both AWS Agentless Discovery Connector data and summary data from AWS Discovery Agents. Export of summary data is limited to two exports per day.

``` swift
public func startExportTask(input: StartExportTaskInput, completion: @escaping (ClientRuntime.SdkResult<StartExportTaskOutputResponse, StartExportTaskOutputError>) -> Void)
```

### `startImportTask(input:completion:)`

Starts an import task, which allows you to import details of your on-premises environment directly into AWS Migration Hub without having to use the Application Discovery Service (ADS) tools such as the Discovery Connector or Discovery Agent. This gives you the option to perform migration assessment and planning directly from your imported data, including the ability to group your devices as applications and track their migration status. To start an import request, do this:

``` swift
public func startImportTask(input: StartImportTaskInput, completion: @escaping (ClientRuntime.SdkResult<StartImportTaskOutputResponse, StartImportTaskOutputError>) -> Void)
```

  - Download the specially formatted comma separated value (CSV) import template, which you can find here: <https://s3-us-west-2.amazonaws.com/templates-7cffcf56-bd96-4b1c-b45b-a5b42f282e46/import_template.csv>.

  - Fill out the template with your server and application data.

  - Upload your import file to an Amazon S3 bucket, and make a note of it's Object URL. Your import file must be in the CSV format.

  - Use the console or the StartImportTask command with the AWS CLI or one of the AWS SDKs to import the records from your file.

For more information, including step-by-step procedures, see [Migration Hub Import](https://docs.aws.amazon.com/application-discovery/latest/userguide/discovery-import.html) in the AWS Application Discovery Service User Guide. There are limits to the number of import tasks you can create (and delete) in an AWS account. For more information, see [AWS Application Discovery Service Limits](https://docs.aws.amazon.com/application-discovery/latest/userguide/ads_service_limits.html) in the AWS Application Discovery Service User Guide.

### `stopContinuousExport(input:completion:)`

Stop the continuous flow of agent's discovered data into Amazon Athena.

``` swift
public func stopContinuousExport(input: StopContinuousExportInput, completion: @escaping (ClientRuntime.SdkResult<StopContinuousExportOutputResponse, StopContinuousExportOutputError>) -> Void)
```

### `stopDataCollectionByAgentIds(input:completion:)`

Instructs the specified agents or connectors to stop collecting data.

``` swift
public func stopDataCollectionByAgentIds(input: StopDataCollectionByAgentIdsInput, completion: @escaping (ClientRuntime.SdkResult<StopDataCollectionByAgentIdsOutputResponse, StopDataCollectionByAgentIdsOutputError>) -> Void)
```

### `updateApplication(input:completion:)`

Updates metadata about an application.

``` swift
public func updateApplication(input: UpdateApplicationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateApplicationOutputResponse, UpdateApplicationOutputError>) -> Void)
```
