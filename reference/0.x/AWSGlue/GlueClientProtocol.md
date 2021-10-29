# GlueClientProtocol

Glue Defines the public endpoint for the Glue service.

``` swift
public protocol GlueClientProtocol 
```

## Requirements

### batchCreatePartition(input:completion:)

Creates one or more partitions in a batch operation.

``` swift
func batchCreatePartition(input: BatchCreatePartitionInput, completion: @escaping (ClientRuntime.SdkResult<BatchCreatePartitionOutputResponse, BatchCreatePartitionOutputError>) -> Void)
```

### batchDeleteConnection(input:completion:)

Deletes a list of connection definitions from the Data Catalog.

``` swift
func batchDeleteConnection(input: BatchDeleteConnectionInput, completion: @escaping (ClientRuntime.SdkResult<BatchDeleteConnectionOutputResponse, BatchDeleteConnectionOutputError>) -> Void)
```

### batchDeletePartition(input:completion:)

Deletes one or more partitions in a batch operation.

``` swift
func batchDeletePartition(input: BatchDeletePartitionInput, completion: @escaping (ClientRuntime.SdkResult<BatchDeletePartitionOutputResponse, BatchDeletePartitionOutputError>) -> Void)
```

### batchDeleteTable(input:completion:)

Deletes multiple tables at once. After completing this operation, you no longer have access to the table versions and partitions that belong to the deleted table. Glue deletes these "orphaned" resources asynchronously in a timely manner, at the discretion of the service. To ensure the immediate deletion of all related resources, before calling BatchDeleteTable, use DeleteTableVersion or BatchDeleteTableVersion, and DeletePartition or BatchDeletePartition, to delete any resources that belong to the table.

``` swift
func batchDeleteTable(input: BatchDeleteTableInput, completion: @escaping (ClientRuntime.SdkResult<BatchDeleteTableOutputResponse, BatchDeleteTableOutputError>) -> Void)
```

### batchDeleteTableVersion(input:completion:)

Deletes a specified batch of versions of a table.

``` swift
func batchDeleteTableVersion(input: BatchDeleteTableVersionInput, completion: @escaping (ClientRuntime.SdkResult<BatchDeleteTableVersionOutputResponse, BatchDeleteTableVersionOutputError>) -> Void)
```

### batchGetBlueprints(input:completion:)

Retrieves information about a list of blueprints.

``` swift
func batchGetBlueprints(input: BatchGetBlueprintsInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetBlueprintsOutputResponse, BatchGetBlueprintsOutputError>) -> Void)
```

### batchGetCrawlers(input:completion:)

Returns a list of resource metadata for a given list of crawler names. After calling the ListCrawlers operation, you can call this operation to access the data to which you have been granted permissions. This operation supports all IAM permissions, including permission conditions that uses tags.

``` swift
func batchGetCrawlers(input: BatchGetCrawlersInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetCrawlersOutputResponse, BatchGetCrawlersOutputError>) -> Void)
```

### batchGetDevEndpoints(input:completion:)

Returns a list of resource metadata for a given list of development endpoint names. After calling the ListDevEndpoints operation, you can call this operation to access the data to which you have been granted permissions. This operation supports all IAM permissions, including permission conditions that uses tags.

``` swift
func batchGetDevEndpoints(input: BatchGetDevEndpointsInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetDevEndpointsOutputResponse, BatchGetDevEndpointsOutputError>) -> Void)
```

### batchGetJobs(input:completion:)

Returns a list of resource metadata for a given list of job names. After calling the ListJobs operation, you can call this operation to access the data to which you have been granted permissions. This operation supports all IAM permissions, including permission conditions that uses tags.

``` swift
func batchGetJobs(input: BatchGetJobsInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetJobsOutputResponse, BatchGetJobsOutputError>) -> Void)
```

### batchGetPartition(input:completion:)

Retrieves partitions in a batch request.

``` swift
func batchGetPartition(input: BatchGetPartitionInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetPartitionOutputResponse, BatchGetPartitionOutputError>) -> Void)
```

### batchGetTriggers(input:completion:)

Returns a list of resource metadata for a given list of trigger names. After calling the ListTriggers operation, you can call this operation to access the data to which you have been granted permissions. This operation supports all IAM permissions, including permission conditions that uses tags.

``` swift
func batchGetTriggers(input: BatchGetTriggersInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetTriggersOutputResponse, BatchGetTriggersOutputError>) -> Void)
```

### batchGetWorkflows(input:completion:)

Returns a list of resource metadata for a given list of workflow names. After calling the ListWorkflows operation, you can call this operation to access the data to which you have been granted permissions. This operation supports all IAM permissions, including permission conditions that uses tags.

``` swift
func batchGetWorkflows(input: BatchGetWorkflowsInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetWorkflowsOutputResponse, BatchGetWorkflowsOutputError>) -> Void)
```

### batchStopJobRun(input:completion:)

Stops one or more job runs for a specified job definition.

``` swift
func batchStopJobRun(input: BatchStopJobRunInput, completion: @escaping (ClientRuntime.SdkResult<BatchStopJobRunOutputResponse, BatchStopJobRunOutputError>) -> Void)
```

### batchUpdatePartition(input:completion:)

Updates one or more partitions in a batch operation.

``` swift
func batchUpdatePartition(input: BatchUpdatePartitionInput, completion: @escaping (ClientRuntime.SdkResult<BatchUpdatePartitionOutputResponse, BatchUpdatePartitionOutputError>) -> Void)
```

### cancelMLTaskRun(input:completion:)

Cancels (stops) a task run. Machine learning task runs are asynchronous tasks that Glue runs on your behalf as part of various machine learning workflows. You can cancel a machine learning task run at any time by calling CancelMLTaskRun with a task run's parent transform's TransformID and the task run's TaskRunId.

``` swift
func cancelMLTaskRun(input: CancelMLTaskRunInput, completion: @escaping (ClientRuntime.SdkResult<CancelMLTaskRunOutputResponse, CancelMLTaskRunOutputError>) -> Void)
```

### checkSchemaVersionValidity(input:completion:)

Validates the supplied schema. This call has no side effects, it simply validates using the supplied schema using DataFormat as the format. Since it does not take a schema set name, no compatibility checks are performed.

``` swift
func checkSchemaVersionValidity(input: CheckSchemaVersionValidityInput, completion: @escaping (ClientRuntime.SdkResult<CheckSchemaVersionValidityOutputResponse, CheckSchemaVersionValidityOutputError>) -> Void)
```

### createBlueprint(input:completion:)

Registers a blueprint with Glue.

``` swift
func createBlueprint(input: CreateBlueprintInput, completion: @escaping (ClientRuntime.SdkResult<CreateBlueprintOutputResponse, CreateBlueprintOutputError>) -> Void)
```

### createClassifier(input:completion:)

Creates a classifier in the user's account. This can be a GrokClassifier, an XMLClassifier, a JsonClassifier, or a CsvClassifier, depending on which field of the request is present.

``` swift
func createClassifier(input: CreateClassifierInput, completion: @escaping (ClientRuntime.SdkResult<CreateClassifierOutputResponse, CreateClassifierOutputError>) -> Void)
```

### createConnection(input:completion:)

Creates a connection definition in the Data Catalog.

``` swift
func createConnection(input: CreateConnectionInput, completion: @escaping (ClientRuntime.SdkResult<CreateConnectionOutputResponse, CreateConnectionOutputError>) -> Void)
```

### createCrawler(input:completion:)

Creates a new crawler with specified targets, role, configuration, and optional schedule. At least one crawl target must be specified, in the s3Targets field, the jdbcTargets field, or the DynamoDBTargets field.

``` swift
func createCrawler(input: CreateCrawlerInput, completion: @escaping (ClientRuntime.SdkResult<CreateCrawlerOutputResponse, CreateCrawlerOutputError>) -> Void)
```

### createDatabase(input:completion:)

Creates a new database in a Data Catalog.

``` swift
func createDatabase(input: CreateDatabaseInput, completion: @escaping (ClientRuntime.SdkResult<CreateDatabaseOutputResponse, CreateDatabaseOutputError>) -> Void)
```

### createDevEndpoint(input:completion:)

Creates a new development endpoint.

``` swift
func createDevEndpoint(input: CreateDevEndpointInput, completion: @escaping (ClientRuntime.SdkResult<CreateDevEndpointOutputResponse, CreateDevEndpointOutputError>) -> Void)
```

### createJob(input:completion:)

Creates a new job definition.

``` swift
func createJob(input: CreateJobInput, completion: @escaping (ClientRuntime.SdkResult<CreateJobOutputResponse, CreateJobOutputError>) -> Void)
```

### createMLTransform(input:completion:)

Creates an Glue machine learning transform. This operation creates the transform and all the necessary parameters to train it. Call this operation as the first step in the process of using a machine learning transform (such as the FindMatches transform) for deduplicating data. You can provide an optional Description, in addition to the parameters that you want to use for your algorithm. You must also specify certain parameters for the tasks that Glue runs on your behalf as part of learning from your data and creating a high-quality machine learning transform. These parameters include Role, and optionally, AllocatedCapacity, Timeout, and MaxRetries. For more information, see [Jobs](https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-jobs-job.html).

``` swift
func createMLTransform(input: CreateMLTransformInput, completion: @escaping (ClientRuntime.SdkResult<CreateMLTransformOutputResponse, CreateMLTransformOutputError>) -> Void)
```

### createPartition(input:completion:)

Creates a new partition.

``` swift
func createPartition(input: CreatePartitionInput, completion: @escaping (ClientRuntime.SdkResult<CreatePartitionOutputResponse, CreatePartitionOutputError>) -> Void)
```

### createPartitionIndex(input:completion:)

Creates a specified partition index in an existing table.

``` swift
func createPartitionIndex(input: CreatePartitionIndexInput, completion: @escaping (ClientRuntime.SdkResult<CreatePartitionIndexOutputResponse, CreatePartitionIndexOutputError>) -> Void)
```

### createRegistry(input:completion:)

Creates a new registry which may be used to hold a collection of schemas.

``` swift
func createRegistry(input: CreateRegistryInput, completion: @escaping (ClientRuntime.SdkResult<CreateRegistryOutputResponse, CreateRegistryOutputError>) -> Void)
```

### createSchema(input:completion:)

Creates a new schema set and registers the schema definition. Returns an error if the schema set already exists without actually registering the version. When the schema set is created, a version checkpoint will be set to the first version. Compatibility mode "DISABLED" restricts any additional schema versions from being added after the first schema version. For all other compatibility modes, validation of compatibility settings will be applied only from the second version onwards when the RegisterSchemaVersion API is used. When this API is called without a RegistryId, this will create an entry for a "default-registry" in the registry database tables, if it is not already present.

``` swift
func createSchema(input: CreateSchemaInput, completion: @escaping (ClientRuntime.SdkResult<CreateSchemaOutputResponse, CreateSchemaOutputError>) -> Void)
```

### createScript(input:completion:)

Transforms a directed acyclic graph (DAG) into code.

``` swift
func createScript(input: CreateScriptInput, completion: @escaping (ClientRuntime.SdkResult<CreateScriptOutputResponse, CreateScriptOutputError>) -> Void)
```

### createSecurityConfiguration(input:completion:)

Creates a new security configuration. A security configuration is a set of security properties that can be used by Glue. You can use a security configuration to encrypt data at rest. For information about using security configurations in Glue, see [Encrypting Data Written by Crawlers, Jobs, and Development Endpoints](https://docs.aws.amazon.com/glue/latest/dg/encryption-security-configuration.html).

``` swift
func createSecurityConfiguration(input: CreateSecurityConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<CreateSecurityConfigurationOutputResponse, CreateSecurityConfigurationOutputError>) -> Void)
```

### createTable(input:completion:)

Creates a new table definition in the Data Catalog.

``` swift
func createTable(input: CreateTableInput, completion: @escaping (ClientRuntime.SdkResult<CreateTableOutputResponse, CreateTableOutputError>) -> Void)
```

### createTrigger(input:completion:)

Creates a new trigger.

``` swift
func createTrigger(input: CreateTriggerInput, completion: @escaping (ClientRuntime.SdkResult<CreateTriggerOutputResponse, CreateTriggerOutputError>) -> Void)
```

### createUserDefinedFunction(input:completion:)

Creates a new function definition in the Data Catalog.

``` swift
func createUserDefinedFunction(input: CreateUserDefinedFunctionInput, completion: @escaping (ClientRuntime.SdkResult<CreateUserDefinedFunctionOutputResponse, CreateUserDefinedFunctionOutputError>) -> Void)
```

### createWorkflow(input:completion:)

Creates a new workflow.

``` swift
func createWorkflow(input: CreateWorkflowInput, completion: @escaping (ClientRuntime.SdkResult<CreateWorkflowOutputResponse, CreateWorkflowOutputError>) -> Void)
```

### deleteBlueprint(input:completion:)

Deletes an existing blueprint.

``` swift
func deleteBlueprint(input: DeleteBlueprintInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBlueprintOutputResponse, DeleteBlueprintOutputError>) -> Void)
```

### deleteClassifier(input:completion:)

Removes a classifier from the Data Catalog.

``` swift
func deleteClassifier(input: DeleteClassifierInput, completion: @escaping (ClientRuntime.SdkResult<DeleteClassifierOutputResponse, DeleteClassifierOutputError>) -> Void)
```

### deleteColumnStatisticsForPartition(input:completion:)

Delete the partition column statistics of a column. The Identity and Access Management (IAM) permission required for this operation is DeletePartition.

``` swift
func deleteColumnStatisticsForPartition(input: DeleteColumnStatisticsForPartitionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteColumnStatisticsForPartitionOutputResponse, DeleteColumnStatisticsForPartitionOutputError>) -> Void)
```

### deleteColumnStatisticsForTable(input:completion:)

Retrieves table statistics of columns. The Identity and Access Management (IAM) permission required for this operation is DeleteTable.

``` swift
func deleteColumnStatisticsForTable(input: DeleteColumnStatisticsForTableInput, completion: @escaping (ClientRuntime.SdkResult<DeleteColumnStatisticsForTableOutputResponse, DeleteColumnStatisticsForTableOutputError>) -> Void)
```

### deleteConnection(input:completion:)

Deletes a connection from the Data Catalog.

``` swift
func deleteConnection(input: DeleteConnectionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteConnectionOutputResponse, DeleteConnectionOutputError>) -> Void)
```

### deleteCrawler(input:completion:)

Removes a specified crawler from the Glue Data Catalog, unless the crawler state is RUNNING.

``` swift
func deleteCrawler(input: DeleteCrawlerInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCrawlerOutputResponse, DeleteCrawlerOutputError>) -> Void)
```

### deleteDatabase(input:completion:)

Removes a specified database from a Data Catalog. After completing this operation, you no longer have access to the tables (and all table versions and partitions that might belong to the tables) and the user-defined functions in the deleted database. Glue deletes these "orphaned" resources asynchronously in a timely manner, at the discretion of the service. To ensure the immediate deletion of all related resources, before calling DeleteDatabase, use DeleteTableVersion or BatchDeleteTableVersion, DeletePartition or BatchDeletePartition, DeleteUserDefinedFunction, and DeleteTable or BatchDeleteTable, to delete any resources that belong to the database.

``` swift
func deleteDatabase(input: DeleteDatabaseInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDatabaseOutputResponse, DeleteDatabaseOutputError>) -> Void)
```

### deleteDevEndpoint(input:completion:)

Deletes a specified development endpoint.

``` swift
func deleteDevEndpoint(input: DeleteDevEndpointInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDevEndpointOutputResponse, DeleteDevEndpointOutputError>) -> Void)
```

### deleteJob(input:completion:)

Deletes a specified job definition. If the job definition is not found, no exception is thrown.

``` swift
func deleteJob(input: DeleteJobInput, completion: @escaping (ClientRuntime.SdkResult<DeleteJobOutputResponse, DeleteJobOutputError>) -> Void)
```

### deleteMLTransform(input:completion:)

Deletes an Glue machine learning transform. Machine learning transforms are a special type of transform that use machine learning to learn the details of the transformation to be performed by learning from examples provided by humans. These transformations are then saved by Glue. If you no longer need a transform, you can delete it by calling DeleteMLTransforms. However, any Glue jobs that still reference the deleted transform will no longer succeed.

``` swift
func deleteMLTransform(input: DeleteMLTransformInput, completion: @escaping (ClientRuntime.SdkResult<DeleteMLTransformOutputResponse, DeleteMLTransformOutputError>) -> Void)
```

### deletePartition(input:completion:)

Deletes a specified partition.

``` swift
func deletePartition(input: DeletePartitionInput, completion: @escaping (ClientRuntime.SdkResult<DeletePartitionOutputResponse, DeletePartitionOutputError>) -> Void)
```

### deletePartitionIndex(input:completion:)

Deletes a specified partition index from an existing table.

``` swift
func deletePartitionIndex(input: DeletePartitionIndexInput, completion: @escaping (ClientRuntime.SdkResult<DeletePartitionIndexOutputResponse, DeletePartitionIndexOutputError>) -> Void)
```

### deleteRegistry(input:completion:)

Delete the entire registry including schema and all of its versions. To get the status of the delete operation, you can call the GetRegistry API after the asynchronous call. Deleting a registry will deactivate all online operations for the registry such as the UpdateRegistry, CreateSchema, UpdateSchema, and RegisterSchemaVersion APIs.

``` swift
func deleteRegistry(input: DeleteRegistryInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRegistryOutputResponse, DeleteRegistryOutputError>) -> Void)
```

### deleteResourcePolicy(input:completion:)

Deletes a specified policy.

``` swift
func deleteResourcePolicy(input: DeleteResourcePolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteResourcePolicyOutputResponse, DeleteResourcePolicyOutputError>) -> Void)
```

### deleteSchema(input:completion:)

Deletes the entire schema set, including the schema set and all of its versions. To get the status of the delete operation, you can call GetSchema API after the asynchronous call. Deleting a registry will deactivate all online operations for the schema, such as the GetSchemaByDefinition, and RegisterSchemaVersion APIs.

``` swift
func deleteSchema(input: DeleteSchemaInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSchemaOutputResponse, DeleteSchemaOutputError>) -> Void)
```

### deleteSchemaVersions(input:completion:)

Remove versions from the specified schema. A version number or range may be supplied. If the compatibility mode forbids deleting of a version that is necessary, such as BACKWARDS\_FULL, an error is returned. Calling the GetSchemaVersions API after this call will list the status of the deleted versions. When the range of version numbers contain check pointed version, the API will return a 409 conflict and will not proceed with the deletion. You have to remove the checkpoint first using the DeleteSchemaCheckpoint API before using this API. You cannot use the DeleteSchemaVersions API to delete the first schema version in the schema set. The first schema version can only be deleted by the DeleteSchema API. This operation will also delete the attached SchemaVersionMetadata under the schema versions. Hard deletes will be enforced on the database. If the compatibility mode forbids deleting of a version that is necessary, such as BACKWARDS\_FULL, an error is returned.

``` swift
func deleteSchemaVersions(input: DeleteSchemaVersionsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSchemaVersionsOutputResponse, DeleteSchemaVersionsOutputError>) -> Void)
```

### deleteSecurityConfiguration(input:completion:)

Deletes a specified security configuration.

``` swift
func deleteSecurityConfiguration(input: DeleteSecurityConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSecurityConfigurationOutputResponse, DeleteSecurityConfigurationOutputError>) -> Void)
```

### deleteTable(input:completion:)

Removes a table definition from the Data Catalog. After completing this operation, you no longer have access to the table versions and partitions that belong to the deleted table. Glue deletes these "orphaned" resources asynchronously in a timely manner, at the discretion of the service. To ensure the immediate deletion of all related resources, before calling DeleteTable, use DeleteTableVersion or BatchDeleteTableVersion, and DeletePartition or BatchDeletePartition, to delete any resources that belong to the table.

``` swift
func deleteTable(input: DeleteTableInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTableOutputResponse, DeleteTableOutputError>) -> Void)
```

### deleteTableVersion(input:completion:)

Deletes a specified version of a table.

``` swift
func deleteTableVersion(input: DeleteTableVersionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTableVersionOutputResponse, DeleteTableVersionOutputError>) -> Void)
```

### deleteTrigger(input:completion:)

Deletes a specified trigger. If the trigger is not found, no exception is thrown.

``` swift
func deleteTrigger(input: DeleteTriggerInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTriggerOutputResponse, DeleteTriggerOutputError>) -> Void)
```

### deleteUserDefinedFunction(input:completion:)

Deletes an existing function definition from the Data Catalog.

``` swift
func deleteUserDefinedFunction(input: DeleteUserDefinedFunctionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUserDefinedFunctionOutputResponse, DeleteUserDefinedFunctionOutputError>) -> Void)
```

### deleteWorkflow(input:completion:)

Deletes a workflow.

``` swift
func deleteWorkflow(input: DeleteWorkflowInput, completion: @escaping (ClientRuntime.SdkResult<DeleteWorkflowOutputResponse, DeleteWorkflowOutputError>) -> Void)
```

### getBlueprint(input:completion:)

Retrieves the details of a blueprint.

``` swift
func getBlueprint(input: GetBlueprintInput, completion: @escaping (ClientRuntime.SdkResult<GetBlueprintOutputResponse, GetBlueprintOutputError>) -> Void)
```

### getBlueprintRun(input:completion:)

Retrieves the details of a blueprint run.

``` swift
func getBlueprintRun(input: GetBlueprintRunInput, completion: @escaping (ClientRuntime.SdkResult<GetBlueprintRunOutputResponse, GetBlueprintRunOutputError>) -> Void)
```

### getBlueprintRuns(input:completion:)

Retrieves the details of blueprint runs for a specified blueprint.

``` swift
func getBlueprintRuns(input: GetBlueprintRunsInput, completion: @escaping (ClientRuntime.SdkResult<GetBlueprintRunsOutputResponse, GetBlueprintRunsOutputError>) -> Void)
```

### getCatalogImportStatus(input:completion:)

Retrieves the status of a migration operation.

``` swift
func getCatalogImportStatus(input: GetCatalogImportStatusInput, completion: @escaping (ClientRuntime.SdkResult<GetCatalogImportStatusOutputResponse, GetCatalogImportStatusOutputError>) -> Void)
```

### getClassifier(input:completion:)

Retrieve a classifier by name.

``` swift
func getClassifier(input: GetClassifierInput, completion: @escaping (ClientRuntime.SdkResult<GetClassifierOutputResponse, GetClassifierOutputError>) -> Void)
```

### getClassifiers(input:completion:)

Lists all classifier objects in the Data Catalog.

``` swift
func getClassifiers(input: GetClassifiersInput, completion: @escaping (ClientRuntime.SdkResult<GetClassifiersOutputResponse, GetClassifiersOutputError>) -> Void)
```

### getColumnStatisticsForPartition(input:completion:)

Retrieves partition statistics of columns. The Identity and Access Management (IAM) permission required for this operation is GetPartition.

``` swift
func getColumnStatisticsForPartition(input: GetColumnStatisticsForPartitionInput, completion: @escaping (ClientRuntime.SdkResult<GetColumnStatisticsForPartitionOutputResponse, GetColumnStatisticsForPartitionOutputError>) -> Void)
```

### getColumnStatisticsForTable(input:completion:)

Retrieves table statistics of columns. The Identity and Access Management (IAM) permission required for this operation is GetTable.

``` swift
func getColumnStatisticsForTable(input: GetColumnStatisticsForTableInput, completion: @escaping (ClientRuntime.SdkResult<GetColumnStatisticsForTableOutputResponse, GetColumnStatisticsForTableOutputError>) -> Void)
```

### getConnection(input:completion:)

Retrieves a connection definition from the Data Catalog.

``` swift
func getConnection(input: GetConnectionInput, completion: @escaping (ClientRuntime.SdkResult<GetConnectionOutputResponse, GetConnectionOutputError>) -> Void)
```

### getConnections(input:completion:)

Retrieves a list of connection definitions from the Data Catalog.

``` swift
func getConnections(input: GetConnectionsInput, completion: @escaping (ClientRuntime.SdkResult<GetConnectionsOutputResponse, GetConnectionsOutputError>) -> Void)
```

### getCrawler(input:completion:)

Retrieves metadata for a specified crawler.

``` swift
func getCrawler(input: GetCrawlerInput, completion: @escaping (ClientRuntime.SdkResult<GetCrawlerOutputResponse, GetCrawlerOutputError>) -> Void)
```

### getCrawlerMetrics(input:completion:)

Retrieves metrics about specified crawlers.

``` swift
func getCrawlerMetrics(input: GetCrawlerMetricsInput, completion: @escaping (ClientRuntime.SdkResult<GetCrawlerMetricsOutputResponse, GetCrawlerMetricsOutputError>) -> Void)
```

### getCrawlers(input:completion:)

Retrieves metadata for all crawlers defined in the customer account.

``` swift
func getCrawlers(input: GetCrawlersInput, completion: @escaping (ClientRuntime.SdkResult<GetCrawlersOutputResponse, GetCrawlersOutputError>) -> Void)
```

### getDatabase(input:completion:)

Retrieves the definition of a specified database.

``` swift
func getDatabase(input: GetDatabaseInput, completion: @escaping (ClientRuntime.SdkResult<GetDatabaseOutputResponse, GetDatabaseOutputError>) -> Void)
```

### getDatabases(input:completion:)

Retrieves all databases defined in a given Data Catalog.

``` swift
func getDatabases(input: GetDatabasesInput, completion: @escaping (ClientRuntime.SdkResult<GetDatabasesOutputResponse, GetDatabasesOutputError>) -> Void)
```

### getDataCatalogEncryptionSettings(input:completion:)

Retrieves the security configuration for a specified catalog.

``` swift
func getDataCatalogEncryptionSettings(input: GetDataCatalogEncryptionSettingsInput, completion: @escaping (ClientRuntime.SdkResult<GetDataCatalogEncryptionSettingsOutputResponse, GetDataCatalogEncryptionSettingsOutputError>) -> Void)
```

### getDataflowGraph(input:completion:)

Transforms a Python script into a directed acyclic graph (DAG).

``` swift
func getDataflowGraph(input: GetDataflowGraphInput, completion: @escaping (ClientRuntime.SdkResult<GetDataflowGraphOutputResponse, GetDataflowGraphOutputError>) -> Void)
```

### getDevEndpoint(input:completion:)

Retrieves information about a specified development endpoint. When you create a development endpoint in a virtual private cloud (VPC), Glue returns only a private IP address, and the public IP address field is not populated. When you create a non-VPC development endpoint, Glue returns only a public IP address.

``` swift
func getDevEndpoint(input: GetDevEndpointInput, completion: @escaping (ClientRuntime.SdkResult<GetDevEndpointOutputResponse, GetDevEndpointOutputError>) -> Void)
```

### getDevEndpoints(input:completion:)

Retrieves all the development endpoints in this AWS account. When you create a development endpoint in a virtual private cloud (VPC), Glue returns only a private IP address and the public IP address field is not populated. When you create a non-VPC development endpoint, Glue returns only a public IP address.

``` swift
func getDevEndpoints(input: GetDevEndpointsInput, completion: @escaping (ClientRuntime.SdkResult<GetDevEndpointsOutputResponse, GetDevEndpointsOutputError>) -> Void)
```

### getJob(input:completion:)

Retrieves an existing job definition.

``` swift
func getJob(input: GetJobInput, completion: @escaping (ClientRuntime.SdkResult<GetJobOutputResponse, GetJobOutputError>) -> Void)
```

### getJobBookmark(input:completion:)

Returns information on a job bookmark entry.

``` swift
func getJobBookmark(input: GetJobBookmarkInput, completion: @escaping (ClientRuntime.SdkResult<GetJobBookmarkOutputResponse, GetJobBookmarkOutputError>) -> Void)
```

### getJobRun(input:completion:)

Retrieves the metadata for a given job run.

``` swift
func getJobRun(input: GetJobRunInput, completion: @escaping (ClientRuntime.SdkResult<GetJobRunOutputResponse, GetJobRunOutputError>) -> Void)
```

### getJobRuns(input:completion:)

Retrieves metadata for all runs of a given job definition.

``` swift
func getJobRuns(input: GetJobRunsInput, completion: @escaping (ClientRuntime.SdkResult<GetJobRunsOutputResponse, GetJobRunsOutputError>) -> Void)
```

### getJobs(input:completion:)

Retrieves all current job definitions.

``` swift
func getJobs(input: GetJobsInput, completion: @escaping (ClientRuntime.SdkResult<GetJobsOutputResponse, GetJobsOutputError>) -> Void)
```

### getMapping(input:completion:)

Creates mappings.

``` swift
func getMapping(input: GetMappingInput, completion: @escaping (ClientRuntime.SdkResult<GetMappingOutputResponse, GetMappingOutputError>) -> Void)
```

### getMLTaskRun(input:completion:)

Gets details for a specific task run on a machine learning transform. Machine learning task runs are asynchronous tasks that Glue runs on your behalf as part of various machine learning workflows. You can check the stats of any task run by calling GetMLTaskRun with the TaskRunID and its parent transform's TransformID.

``` swift
func getMLTaskRun(input: GetMLTaskRunInput, completion: @escaping (ClientRuntime.SdkResult<GetMLTaskRunOutputResponse, GetMLTaskRunOutputError>) -> Void)
```

### getMLTaskRuns(input:completion:)

Gets a list of runs for a machine learning transform. Machine learning task runs are asynchronous tasks that Glue runs on your behalf as part of various machine learning workflows. You can get a sortable, filterable list of machine learning task runs by calling GetMLTaskRuns with their parent transform's TransformID and other optional parameters as documented in this section. This operation returns a list of historic runs and must be paginated.

``` swift
func getMLTaskRuns(input: GetMLTaskRunsInput, completion: @escaping (ClientRuntime.SdkResult<GetMLTaskRunsOutputResponse, GetMLTaskRunsOutputError>) -> Void)
```

### getMLTransform(input:completion:)

Gets an Glue machine learning transform artifact and all its corresponding metadata. Machine learning transforms are a special type of transform that use machine learning to learn the details of the transformation to be performed by learning from examples provided by humans. These transformations are then saved by Glue. You can retrieve their metadata by calling GetMLTransform.

``` swift
func getMLTransform(input: GetMLTransformInput, completion: @escaping (ClientRuntime.SdkResult<GetMLTransformOutputResponse, GetMLTransformOutputError>) -> Void)
```

### getMLTransforms(input:completion:)

Gets a sortable, filterable list of existing Glue machine learning transforms. Machine learning transforms are a special type of transform that use machine learning to learn the details of the transformation to be performed by learning from examples provided by humans. These transformations are then saved by Glue, and you can retrieve their metadata by calling GetMLTransforms.

``` swift
func getMLTransforms(input: GetMLTransformsInput, completion: @escaping (ClientRuntime.SdkResult<GetMLTransformsOutputResponse, GetMLTransformsOutputError>) -> Void)
```

### getPartition(input:completion:)

Retrieves information about a specified partition.

``` swift
func getPartition(input: GetPartitionInput, completion: @escaping (ClientRuntime.SdkResult<GetPartitionOutputResponse, GetPartitionOutputError>) -> Void)
```

### getPartitionIndexes(input:completion:)

Retrieves the partition indexes associated with a table.

``` swift
func getPartitionIndexes(input: GetPartitionIndexesInput, completion: @escaping (ClientRuntime.SdkResult<GetPartitionIndexesOutputResponse, GetPartitionIndexesOutputError>) -> Void)
```

### getPartitions(input:completion:)

Retrieves information about the partitions in a table.

``` swift
func getPartitions(input: GetPartitionsInput, completion: @escaping (ClientRuntime.SdkResult<GetPartitionsOutputResponse, GetPartitionsOutputError>) -> Void)
```

### getPlan(input:completion:)

Gets code to perform a specified mapping.

``` swift
func getPlan(input: GetPlanInput, completion: @escaping (ClientRuntime.SdkResult<GetPlanOutputResponse, GetPlanOutputError>) -> Void)
```

### getRegistry(input:completion:)

Describes the specified registry in detail.

``` swift
func getRegistry(input: GetRegistryInput, completion: @escaping (ClientRuntime.SdkResult<GetRegistryOutputResponse, GetRegistryOutputError>) -> Void)
```

### getResourcePolicies(input:completion:)

Retrieves the resource policies set on individual resources by Resource Access Manager during cross-account permission grants. Also retrieves the Data Catalog resource policy. If you enabled metadata encryption in Data Catalog settings, and you do not have permission on the KMS key, the operation can't return the Data Catalog resource policy.

``` swift
func getResourcePolicies(input: GetResourcePoliciesInput, completion: @escaping (ClientRuntime.SdkResult<GetResourcePoliciesOutputResponse, GetResourcePoliciesOutputError>) -> Void)
```

### getResourcePolicy(input:completion:)

Retrieves a specified resource policy.

``` swift
func getResourcePolicy(input: GetResourcePolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetResourcePolicyOutputResponse, GetResourcePolicyOutputError>) -> Void)
```

### getSchema(input:completion:)

Describes the specified schema in detail.

``` swift
func getSchema(input: GetSchemaInput, completion: @escaping (ClientRuntime.SdkResult<GetSchemaOutputResponse, GetSchemaOutputError>) -> Void)
```

### getSchemaByDefinition(input:completion:)

Retrieves a schema by the SchemaDefinition. The schema definition is sent to the Schema Registry, canonicalized, and hashed. If the hash is matched within the scope of the SchemaName or ARN (or the default registry, if none is supplied), that schema’s metadata is returned. Otherwise, a 404 or NotFound error is returned. Schema versions in Deleted statuses will not be included in the results.

``` swift
func getSchemaByDefinition(input: GetSchemaByDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<GetSchemaByDefinitionOutputResponse, GetSchemaByDefinitionOutputError>) -> Void)
```

### getSchemaVersion(input:completion:)

Get the specified schema by its unique ID assigned when a version of the schema is created or registered. Schema versions in Deleted status will not be included in the results.

``` swift
func getSchemaVersion(input: GetSchemaVersionInput, completion: @escaping (ClientRuntime.SdkResult<GetSchemaVersionOutputResponse, GetSchemaVersionOutputError>) -> Void)
```

### getSchemaVersionsDiff(input:completion:)

Fetches the schema version difference in the specified difference type between two stored schema versions in the Schema Registry. This API allows you to compare two schema versions between two schema definitions under the same schema.

``` swift
func getSchemaVersionsDiff(input: GetSchemaVersionsDiffInput, completion: @escaping (ClientRuntime.SdkResult<GetSchemaVersionsDiffOutputResponse, GetSchemaVersionsDiffOutputError>) -> Void)
```

### getSecurityConfiguration(input:completion:)

Retrieves a specified security configuration.

``` swift
func getSecurityConfiguration(input: GetSecurityConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetSecurityConfigurationOutputResponse, GetSecurityConfigurationOutputError>) -> Void)
```

### getSecurityConfigurations(input:completion:)

Retrieves a list of all security configurations.

``` swift
func getSecurityConfigurations(input: GetSecurityConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<GetSecurityConfigurationsOutputResponse, GetSecurityConfigurationsOutputError>) -> Void)
```

### getTable(input:completion:)

Retrieves the Table definition in a Data Catalog for a specified table.

``` swift
func getTable(input: GetTableInput, completion: @escaping (ClientRuntime.SdkResult<GetTableOutputResponse, GetTableOutputError>) -> Void)
```

### getTables(input:completion:)

Retrieves the definitions of some or all of the tables in a given Database.

``` swift
func getTables(input: GetTablesInput, completion: @escaping (ClientRuntime.SdkResult<GetTablesOutputResponse, GetTablesOutputError>) -> Void)
```

### getTableVersion(input:completion:)

Retrieves a specified version of a table.

``` swift
func getTableVersion(input: GetTableVersionInput, completion: @escaping (ClientRuntime.SdkResult<GetTableVersionOutputResponse, GetTableVersionOutputError>) -> Void)
```

### getTableVersions(input:completion:)

Retrieves a list of strings that identify available versions of a specified table.

``` swift
func getTableVersions(input: GetTableVersionsInput, completion: @escaping (ClientRuntime.SdkResult<GetTableVersionsOutputResponse, GetTableVersionsOutputError>) -> Void)
```

### getTags(input:completion:)

Retrieves a list of tags associated with a resource.

``` swift
func getTags(input: GetTagsInput, completion: @escaping (ClientRuntime.SdkResult<GetTagsOutputResponse, GetTagsOutputError>) -> Void)
```

### getTrigger(input:completion:)

Retrieves the definition of a trigger.

``` swift
func getTrigger(input: GetTriggerInput, completion: @escaping (ClientRuntime.SdkResult<GetTriggerOutputResponse, GetTriggerOutputError>) -> Void)
```

### getTriggers(input:completion:)

Gets all the triggers associated with a job.

``` swift
func getTriggers(input: GetTriggersInput, completion: @escaping (ClientRuntime.SdkResult<GetTriggersOutputResponse, GetTriggersOutputError>) -> Void)
```

### getUserDefinedFunction(input:completion:)

Retrieves a specified function definition from the Data Catalog.

``` swift
func getUserDefinedFunction(input: GetUserDefinedFunctionInput, completion: @escaping (ClientRuntime.SdkResult<GetUserDefinedFunctionOutputResponse, GetUserDefinedFunctionOutputError>) -> Void)
```

### getUserDefinedFunctions(input:completion:)

Retrieves multiple function definitions from the Data Catalog.

``` swift
func getUserDefinedFunctions(input: GetUserDefinedFunctionsInput, completion: @escaping (ClientRuntime.SdkResult<GetUserDefinedFunctionsOutputResponse, GetUserDefinedFunctionsOutputError>) -> Void)
```

### getWorkflow(input:completion:)

Retrieves resource metadata for a workflow.

``` swift
func getWorkflow(input: GetWorkflowInput, completion: @escaping (ClientRuntime.SdkResult<GetWorkflowOutputResponse, GetWorkflowOutputError>) -> Void)
```

### getWorkflowRun(input:completion:)

Retrieves the metadata for a given workflow run.

``` swift
func getWorkflowRun(input: GetWorkflowRunInput, completion: @escaping (ClientRuntime.SdkResult<GetWorkflowRunOutputResponse, GetWorkflowRunOutputError>) -> Void)
```

### getWorkflowRunProperties(input:completion:)

Retrieves the workflow run properties which were set during the run.

``` swift
func getWorkflowRunProperties(input: GetWorkflowRunPropertiesInput, completion: @escaping (ClientRuntime.SdkResult<GetWorkflowRunPropertiesOutputResponse, GetWorkflowRunPropertiesOutputError>) -> Void)
```

### getWorkflowRuns(input:completion:)

Retrieves metadata for all runs of a given workflow.

``` swift
func getWorkflowRuns(input: GetWorkflowRunsInput, completion: @escaping (ClientRuntime.SdkResult<GetWorkflowRunsOutputResponse, GetWorkflowRunsOutputError>) -> Void)
```

### importCatalogToGlue(input:completion:)

Imports an existing Amazon Athena Data Catalog to Glue.

``` swift
func importCatalogToGlue(input: ImportCatalogToGlueInput, completion: @escaping (ClientRuntime.SdkResult<ImportCatalogToGlueOutputResponse, ImportCatalogToGlueOutputError>) -> Void)
```

### listBlueprints(input:completion:)

Lists all the blueprint names in an account.

``` swift
func listBlueprints(input: ListBlueprintsInput, completion: @escaping (ClientRuntime.SdkResult<ListBlueprintsOutputResponse, ListBlueprintsOutputError>) -> Void)
```

### listCrawlers(input:completion:)

Retrieves the names of all crawler resources in this Amazon Web Services account, or the resources with the specified tag. This operation allows you to see which resources are available in your account, and their names. This operation takes the optional Tags field, which you can use as a filter on the response so that tagged resources can be retrieved as a group. If you choose to use tags filtering, only resources with the tag are retrieved.

``` swift
func listCrawlers(input: ListCrawlersInput, completion: @escaping (ClientRuntime.SdkResult<ListCrawlersOutputResponse, ListCrawlersOutputError>) -> Void)
```

### listDevEndpoints(input:completion:)

Retrieves the names of all DevEndpoint resources in this Amazon Web Services account, or the resources with the specified tag. This operation allows you to see which resources are available in your account, and their names. This operation takes the optional Tags field, which you can use as a filter on the response so that tagged resources can be retrieved as a group. If you choose to use tags filtering, only resources with the tag are retrieved.

``` swift
func listDevEndpoints(input: ListDevEndpointsInput, completion: @escaping (ClientRuntime.SdkResult<ListDevEndpointsOutputResponse, ListDevEndpointsOutputError>) -> Void)
```

### listJobs(input:completion:)

Retrieves the names of all job resources in this Amazon Web Services account, or the resources with the specified tag. This operation allows you to see which resources are available in your account, and their names. This operation takes the optional Tags field, which you can use as a filter on the response so that tagged resources can be retrieved as a group. If you choose to use tags filtering, only resources with the tag are retrieved.

``` swift
func listJobs(input: ListJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListJobsOutputResponse, ListJobsOutputError>) -> Void)
```

### listMLTransforms(input:completion:)

Retrieves a sortable, filterable list of existing Glue machine learning transforms in this Amazon Web Services account, or the resources with the specified tag. This operation takes the optional Tags field, which you can use as a filter of the responses so that tagged resources can be retrieved as a group. If you choose to use tag filtering, only resources with the tags are retrieved.

``` swift
func listMLTransforms(input: ListMLTransformsInput, completion: @escaping (ClientRuntime.SdkResult<ListMLTransformsOutputResponse, ListMLTransformsOutputError>) -> Void)
```

### listRegistries(input:completion:)

Returns a list of registries that you have created, with minimal registry information. Registries in the Deleting status will not be included in the results. Empty results will be returned if there are no registries available.

``` swift
func listRegistries(input: ListRegistriesInput, completion: @escaping (ClientRuntime.SdkResult<ListRegistriesOutputResponse, ListRegistriesOutputError>) -> Void)
```

### listSchemas(input:completion:)

Returns a list of schemas with minimal details. Schemas in Deleting status will not be included in the results. Empty results will be returned if there are no schemas available. When the RegistryId is not provided, all the schemas across registries will be part of the API response.

``` swift
func listSchemas(input: ListSchemasInput, completion: @escaping (ClientRuntime.SdkResult<ListSchemasOutputResponse, ListSchemasOutputError>) -> Void)
```

### listSchemaVersions(input:completion:)

Returns a list of schema versions that you have created, with minimal information. Schema versions in Deleted status will not be included in the results. Empty results will be returned if there are no schema versions available.

``` swift
func listSchemaVersions(input: ListSchemaVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListSchemaVersionsOutputResponse, ListSchemaVersionsOutputError>) -> Void)
```

### listTriggers(input:completion:)

Retrieves the names of all trigger resources in this Amazon Web Services account, or the resources with the specified tag. This operation allows you to see which resources are available in your account, and their names. This operation takes the optional Tags field, which you can use as a filter on the response so that tagged resources can be retrieved as a group. If you choose to use tags filtering, only resources with the tag are retrieved.

``` swift
func listTriggers(input: ListTriggersInput, completion: @escaping (ClientRuntime.SdkResult<ListTriggersOutputResponse, ListTriggersOutputError>) -> Void)
```

### listWorkflows(input:completion:)

Lists names of workflows created in the account.

``` swift
func listWorkflows(input: ListWorkflowsInput, completion: @escaping (ClientRuntime.SdkResult<ListWorkflowsOutputResponse, ListWorkflowsOutputError>) -> Void)
```

### putDataCatalogEncryptionSettings(input:completion:)

Sets the security configuration for a specified catalog. After the configuration has been set, the specified encryption is applied to every catalog write thereafter.

``` swift
func putDataCatalogEncryptionSettings(input: PutDataCatalogEncryptionSettingsInput, completion: @escaping (ClientRuntime.SdkResult<PutDataCatalogEncryptionSettingsOutputResponse, PutDataCatalogEncryptionSettingsOutputError>) -> Void)
```

### putResourcePolicy(input:completion:)

Sets the Data Catalog resource policy for access control.

``` swift
func putResourcePolicy(input: PutResourcePolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutResourcePolicyOutputResponse, PutResourcePolicyOutputError>) -> Void)
```

### putSchemaVersionMetadata(input:completion:)

Puts the metadata key value pair for a specified schema version ID. A maximum of 10 key value pairs will be allowed per schema version. They can be added over one or more calls.

``` swift
func putSchemaVersionMetadata(input: PutSchemaVersionMetadataInput, completion: @escaping (ClientRuntime.SdkResult<PutSchemaVersionMetadataOutputResponse, PutSchemaVersionMetadataOutputError>) -> Void)
```

### putWorkflowRunProperties(input:completion:)

Puts the specified workflow run properties for the given workflow run. If a property already exists for the specified run, then it overrides the value otherwise adds the property to existing properties.

``` swift
func putWorkflowRunProperties(input: PutWorkflowRunPropertiesInput, completion: @escaping (ClientRuntime.SdkResult<PutWorkflowRunPropertiesOutputResponse, PutWorkflowRunPropertiesOutputError>) -> Void)
```

### querySchemaVersionMetadata(input:completion:)

Queries for the schema version metadata information.

``` swift
func querySchemaVersionMetadata(input: QuerySchemaVersionMetadataInput, completion: @escaping (ClientRuntime.SdkResult<QuerySchemaVersionMetadataOutputResponse, QuerySchemaVersionMetadataOutputError>) -> Void)
```

### registerSchemaVersion(input:completion:)

Adds a new version to the existing schema. Returns an error if new version of schema does not meet the compatibility requirements of the schema set. This API will not create a new schema set and will return a 404 error if the schema set is not already present in the Schema Registry. If this is the first schema definition to be registered in the Schema Registry, this API will store the schema version and return immediately. Otherwise, this call has the potential to run longer than other operations due to compatibility modes. You can call the GetSchemaVersion API with the SchemaVersionId to check compatibility modes. If the same schema definition is already stored in Schema Registry as a version, the schema ID of the existing schema is returned to the caller.

``` swift
func registerSchemaVersion(input: RegisterSchemaVersionInput, completion: @escaping (ClientRuntime.SdkResult<RegisterSchemaVersionOutputResponse, RegisterSchemaVersionOutputError>) -> Void)
```

### removeSchemaVersionMetadata(input:completion:)

Removes a key value pair from the schema version metadata for the specified schema version ID.

``` swift
func removeSchemaVersionMetadata(input: RemoveSchemaVersionMetadataInput, completion: @escaping (ClientRuntime.SdkResult<RemoveSchemaVersionMetadataOutputResponse, RemoveSchemaVersionMetadataOutputError>) -> Void)
```

### resetJobBookmark(input:completion:)

Resets a bookmark entry.

``` swift
func resetJobBookmark(input: ResetJobBookmarkInput, completion: @escaping (ClientRuntime.SdkResult<ResetJobBookmarkOutputResponse, ResetJobBookmarkOutputError>) -> Void)
```

### resumeWorkflowRun(input:completion:)

Restarts selected nodes of a previous partially completed workflow run and resumes the workflow run. The selected nodes and all nodes that are downstream from the selected nodes are run.

``` swift
func resumeWorkflowRun(input: ResumeWorkflowRunInput, completion: @escaping (ClientRuntime.SdkResult<ResumeWorkflowRunOutputResponse, ResumeWorkflowRunOutputError>) -> Void)
```

### searchTables(input:completion:)

Searches a set of tables based on properties in the table metadata as well as on the parent database. You can search against text or filter conditions. You can only get tables that you have access to based on the security policies defined in Lake Formation. You need at least a read-only access to the table for it to be returned. If you do not have access to all the columns in the table, these columns will not be searched against when returning the list of tables back to you. If you have access to the columns but not the data in the columns, those columns and the associated metadata for those columns will be included in the search.

``` swift
func searchTables(input: SearchTablesInput, completion: @escaping (ClientRuntime.SdkResult<SearchTablesOutputResponse, SearchTablesOutputError>) -> Void)
```

### startBlueprintRun(input:completion:)

Starts a new run of the specified blueprint.

``` swift
func startBlueprintRun(input: StartBlueprintRunInput, completion: @escaping (ClientRuntime.SdkResult<StartBlueprintRunOutputResponse, StartBlueprintRunOutputError>) -> Void)
```

### startCrawler(input:completion:)

Starts a crawl using the specified crawler, regardless of what is scheduled. If the crawler is already running, returns a [CrawlerRunningException](https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-exceptions.html#aws-glue-api-exceptions-CrawlerRunningException).

``` swift
func startCrawler(input: StartCrawlerInput, completion: @escaping (ClientRuntime.SdkResult<StartCrawlerOutputResponse, StartCrawlerOutputError>) -> Void)
```

### startCrawlerSchedule(input:completion:)

Changes the schedule state of the specified crawler to SCHEDULED, unless the crawler is already running or the schedule state is already SCHEDULED.

``` swift
func startCrawlerSchedule(input: StartCrawlerScheduleInput, completion: @escaping (ClientRuntime.SdkResult<StartCrawlerScheduleOutputResponse, StartCrawlerScheduleOutputError>) -> Void)
```

### startExportLabelsTaskRun(input:completion:)

Begins an asynchronous task to export all labeled data for a particular transform. This task is the only label-related API call that is not part of the typical active learning workflow. You typically use StartExportLabelsTaskRun when you want to work with all of your existing labels at the same time, such as when you want to remove or change labels that were previously submitted as truth. This API operation accepts the TransformId whose labels you want to export and an Amazon Simple Storage Service (Amazon S3) path to export the labels to. The operation returns a TaskRunId. You can check on the status of your task run by calling the GetMLTaskRun API.

``` swift
func startExportLabelsTaskRun(input: StartExportLabelsTaskRunInput, completion: @escaping (ClientRuntime.SdkResult<StartExportLabelsTaskRunOutputResponse, StartExportLabelsTaskRunOutputError>) -> Void)
```

### startImportLabelsTaskRun(input:completion:)

Enables you to provide additional labels (examples of truth) to be used to teach the machine learning transform and improve its quality. This API operation is generally used as part of the active learning workflow that starts with the StartMLLabelingSetGenerationTaskRun call and that ultimately results in improving the quality of your machine learning transform. After the StartMLLabelingSetGenerationTaskRun finishes, Glue machine learning will have generated a series of questions for humans to answer. (Answering these questions is often called 'labeling' in the machine learning workflows). In the case of the FindMatches transform, these questions are of the form, “What is the correct way to group these rows together into groups composed entirely of matching records?” After the labeling process is finished, users upload their answers/labels with a call to StartImportLabelsTaskRun. After StartImportLabelsTaskRun finishes, all future runs of the machine learning transform use the new and improved labels and perform a higher-quality transformation. By default, StartMLLabelingSetGenerationTaskRun continually learns from and combines all labels that you upload unless you set Replace to true. If you set Replace to true, StartImportLabelsTaskRun deletes and forgets all previously uploaded labels and learns only from the exact set that you upload. Replacing labels can be helpful if you realize that you previously uploaded incorrect labels, and you believe that they are having a negative effect on your transform quality. You can check on the status of your task run by calling the GetMLTaskRun operation.

``` swift
func startImportLabelsTaskRun(input: StartImportLabelsTaskRunInput, completion: @escaping (ClientRuntime.SdkResult<StartImportLabelsTaskRunOutputResponse, StartImportLabelsTaskRunOutputError>) -> Void)
```

### startJobRun(input:completion:)

Starts a job run using a job definition.

``` swift
func startJobRun(input: StartJobRunInput, completion: @escaping (ClientRuntime.SdkResult<StartJobRunOutputResponse, StartJobRunOutputError>) -> Void)
```

### startMLEvaluationTaskRun(input:completion:)

Starts a task to estimate the quality of the transform. When you provide label sets as examples of truth, Glue machine learning uses some of those examples to learn from them. The rest of the labels are used as a test to estimate quality. Returns a unique identifier for the run. You can call GetMLTaskRun to get more information about the stats of the EvaluationTaskRun.

``` swift
func startMLEvaluationTaskRun(input: StartMLEvaluationTaskRunInput, completion: @escaping (ClientRuntime.SdkResult<StartMLEvaluationTaskRunOutputResponse, StartMLEvaluationTaskRunOutputError>) -> Void)
```

### startMLLabelingSetGenerationTaskRun(input:completion:)

Starts the active learning workflow for your machine learning transform to improve the transform's quality by generating label sets and adding labels. When the StartMLLabelingSetGenerationTaskRun finishes, Glue will have generated a "labeling set" or a set of questions for humans to answer. In the case of the FindMatches transform, these questions are of the form, “What is the correct way to group these rows together into groups composed entirely of matching records?” After the labeling process is finished, you can upload your labels with a call to StartImportLabelsTaskRun. After StartImportLabelsTaskRun finishes, all future runs of the machine learning transform will use the new and improved labels and perform a higher-quality transformation.

``` swift
func startMLLabelingSetGenerationTaskRun(input: StartMLLabelingSetGenerationTaskRunInput, completion: @escaping (ClientRuntime.SdkResult<StartMLLabelingSetGenerationTaskRunOutputResponse, StartMLLabelingSetGenerationTaskRunOutputError>) -> Void)
```

### startTrigger(input:completion:)

Starts an existing trigger. See [Triggering Jobs](https://docs.aws.amazon.com/glue/latest/dg/trigger-job.html) for information about how different types of trigger are started.

``` swift
func startTrigger(input: StartTriggerInput, completion: @escaping (ClientRuntime.SdkResult<StartTriggerOutputResponse, StartTriggerOutputError>) -> Void)
```

### startWorkflowRun(input:completion:)

Starts a new run of the specified workflow.

``` swift
func startWorkflowRun(input: StartWorkflowRunInput, completion: @escaping (ClientRuntime.SdkResult<StartWorkflowRunOutputResponse, StartWorkflowRunOutputError>) -> Void)
```

### stopCrawler(input:completion:)

If the specified crawler is running, stops the crawl.

``` swift
func stopCrawler(input: StopCrawlerInput, completion: @escaping (ClientRuntime.SdkResult<StopCrawlerOutputResponse, StopCrawlerOutputError>) -> Void)
```

### stopCrawlerSchedule(input:completion:)

Sets the schedule state of the specified crawler to NOT\_SCHEDULED, but does not stop the crawler if it is already running.

``` swift
func stopCrawlerSchedule(input: StopCrawlerScheduleInput, completion: @escaping (ClientRuntime.SdkResult<StopCrawlerScheduleOutputResponse, StopCrawlerScheduleOutputError>) -> Void)
```

### stopTrigger(input:completion:)

Stops a specified trigger.

``` swift
func stopTrigger(input: StopTriggerInput, completion: @escaping (ClientRuntime.SdkResult<StopTriggerOutputResponse, StopTriggerOutputError>) -> Void)
```

### stopWorkflowRun(input:completion:)

Stops the execution of the specified workflow run.

``` swift
func stopWorkflowRun(input: StopWorkflowRunInput, completion: @escaping (ClientRuntime.SdkResult<StopWorkflowRunOutputResponse, StopWorkflowRunOutputError>) -> Void)
```

### tagResource(input:completion:)

Adds tags to a resource. A tag is a label you can assign to an Amazon Web Services resource. In Glue, you can tag only certain resources. For information about what resources you can tag, see [Amazon Web Services Tags in Glue](https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html).

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:completion:)

Removes tags from a resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateBlueprint(input:completion:)

Updates a registered blueprint.

``` swift
func updateBlueprint(input: UpdateBlueprintInput, completion: @escaping (ClientRuntime.SdkResult<UpdateBlueprintOutputResponse, UpdateBlueprintOutputError>) -> Void)
```

### updateClassifier(input:completion:)

Modifies an existing classifier (a GrokClassifier, an XMLClassifier, a JsonClassifier, or a CsvClassifier, depending on which field is present).

``` swift
func updateClassifier(input: UpdateClassifierInput, completion: @escaping (ClientRuntime.SdkResult<UpdateClassifierOutputResponse, UpdateClassifierOutputError>) -> Void)
```

### updateColumnStatisticsForPartition(input:completion:)

Creates or updates partition statistics of columns. The Identity and Access Management (IAM) permission required for this operation is UpdatePartition.

``` swift
func updateColumnStatisticsForPartition(input: UpdateColumnStatisticsForPartitionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateColumnStatisticsForPartitionOutputResponse, UpdateColumnStatisticsForPartitionOutputError>) -> Void)
```

### updateColumnStatisticsForTable(input:completion:)

Creates or updates table statistics of columns. The Identity and Access Management (IAM) permission required for this operation is UpdateTable.

``` swift
func updateColumnStatisticsForTable(input: UpdateColumnStatisticsForTableInput, completion: @escaping (ClientRuntime.SdkResult<UpdateColumnStatisticsForTableOutputResponse, UpdateColumnStatisticsForTableOutputError>) -> Void)
```

### updateConnection(input:completion:)

Updates a connection definition in the Data Catalog.

``` swift
func updateConnection(input: UpdateConnectionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateConnectionOutputResponse, UpdateConnectionOutputError>) -> Void)
```

### updateCrawler(input:completion:)

Updates a crawler. If a crawler is running, you must stop it using StopCrawler before updating it.

``` swift
func updateCrawler(input: UpdateCrawlerInput, completion: @escaping (ClientRuntime.SdkResult<UpdateCrawlerOutputResponse, UpdateCrawlerOutputError>) -> Void)
```

### updateCrawlerSchedule(input:completion:)

Updates the schedule of a crawler using a cron expression.

``` swift
func updateCrawlerSchedule(input: UpdateCrawlerScheduleInput, completion: @escaping (ClientRuntime.SdkResult<UpdateCrawlerScheduleOutputResponse, UpdateCrawlerScheduleOutputError>) -> Void)
```

### updateDatabase(input:completion:)

Updates an existing database definition in a Data Catalog.

``` swift
func updateDatabase(input: UpdateDatabaseInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDatabaseOutputResponse, UpdateDatabaseOutputError>) -> Void)
```

### updateDevEndpoint(input:completion:)

Updates a specified development endpoint.

``` swift
func updateDevEndpoint(input: UpdateDevEndpointInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDevEndpointOutputResponse, UpdateDevEndpointOutputError>) -> Void)
```

### updateJob(input:completion:)

Updates an existing job definition.

``` swift
func updateJob(input: UpdateJobInput, completion: @escaping (ClientRuntime.SdkResult<UpdateJobOutputResponse, UpdateJobOutputError>) -> Void)
```

### updateMLTransform(input:completion:)

Updates an existing machine learning transform. Call this operation to tune the algorithm parameters to achieve better results. After calling this operation, you can call the StartMLEvaluationTaskRun operation to assess how well your new parameters achieved your goals (such as improving the quality of your machine learning transform, or making it more cost-effective).

``` swift
func updateMLTransform(input: UpdateMLTransformInput, completion: @escaping (ClientRuntime.SdkResult<UpdateMLTransformOutputResponse, UpdateMLTransformOutputError>) -> Void)
```

### updatePartition(input:completion:)

Updates a partition.

``` swift
func updatePartition(input: UpdatePartitionInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePartitionOutputResponse, UpdatePartitionOutputError>) -> Void)
```

### updateRegistry(input:completion:)

Updates an existing registry which is used to hold a collection of schemas. The updated properties relate to the registry, and do not modify any of the schemas within the registry.

``` swift
func updateRegistry(input: UpdateRegistryInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRegistryOutputResponse, UpdateRegistryOutputError>) -> Void)
```

### updateSchema(input:completion:)

Updates the description, compatibility setting, or version checkpoint for a schema set. For updating the compatibility setting, the call will not validate compatibility for the entire set of schema versions with the new compatibility setting. If the value for Compatibility is provided, the VersionNumber (a checkpoint) is also required. The API will validate the checkpoint version number for consistency. If the value for the VersionNumber (checkpoint) is provided, Compatibility is optional and this can be used to set/reset a checkpoint for the schema. This update will happen only if the schema is in the AVAILABLE state.

``` swift
func updateSchema(input: UpdateSchemaInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSchemaOutputResponse, UpdateSchemaOutputError>) -> Void)
```

### updateTable(input:completion:)

Updates a metadata table in the Data Catalog.

``` swift
func updateTable(input: UpdateTableInput, completion: @escaping (ClientRuntime.SdkResult<UpdateTableOutputResponse, UpdateTableOutputError>) -> Void)
```

### updateTrigger(input:completion:)

Updates a trigger definition.

``` swift
func updateTrigger(input: UpdateTriggerInput, completion: @escaping (ClientRuntime.SdkResult<UpdateTriggerOutputResponse, UpdateTriggerOutputError>) -> Void)
```

### updateUserDefinedFunction(input:completion:)

Updates an existing function definition in the Data Catalog.

``` swift
func updateUserDefinedFunction(input: UpdateUserDefinedFunctionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateUserDefinedFunctionOutputResponse, UpdateUserDefinedFunctionOutputError>) -> Void)
```

### updateWorkflow(input:completion:)

Updates an existing workflow.

``` swift
func updateWorkflow(input: UpdateWorkflowInput, completion: @escaping (ClientRuntime.SdkResult<UpdateWorkflowOutputResponse, UpdateWorkflowOutputError>) -> Void)
```
