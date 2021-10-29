# DatabaseMigrationClientProtocol

Database Migration Service Database Migration Service (DMS) can migrate your data to and from the most widely used commercial and open-source databases such as Oracle, PostgreSQL, Microsoft SQL Server, Amazon Redshift, MariaDB, Amazon Aurora, MySQL, and SAP Adaptive Server Enterprise (ASE). The service supports homogeneous migrations such as Oracle to Oracle, as well as heterogeneous migrations between different database platforms, such as Oracle to MySQL or SQL Server to PostgreSQL. For more information about DMS, see [What Is Database Migration Service?](https://docs.aws.amazon.com/dms/latest/userguide/Welcome.html) in the Database Migration Service User Guide.

``` swift
public protocol DatabaseMigrationClientProtocol 
```

## Requirements

### addTagsToResource(input:completion:)

Adds metadata tags to an DMS resource, including replication instance, endpoint, security group, and migration task. These tags can also be used with cost allocation reporting to track cost associated with DMS resources, or used in a Condition statement in an IAM policy for DMS. For more information, see [Tag](https://docs.aws.amazon.com/dms/latest/APIReference/API_Tag.html) data type description.

``` swift
func addTagsToResource(input: AddTagsToResourceInput, completion: @escaping (ClientRuntime.SdkResult<AddTagsToResourceOutputResponse, AddTagsToResourceOutputError>) -> Void)
```

### applyPendingMaintenanceAction(input:completion:)

Applies a pending maintenance action to a resource (for example, to a replication instance).

``` swift
func applyPendingMaintenanceAction(input: ApplyPendingMaintenanceActionInput, completion: @escaping (ClientRuntime.SdkResult<ApplyPendingMaintenanceActionOutputResponse, ApplyPendingMaintenanceActionOutputError>) -> Void)
```

### cancelReplicationTaskAssessmentRun(input:completion:)

Cancels a single premigration assessment run. This operation prevents any individual assessments from running if they haven't started running. It also attempts to cancel any individual assessments that are currently running.

``` swift
func cancelReplicationTaskAssessmentRun(input: CancelReplicationTaskAssessmentRunInput, completion: @escaping (ClientRuntime.SdkResult<CancelReplicationTaskAssessmentRunOutputResponse, CancelReplicationTaskAssessmentRunOutputError>) -> Void)
```

### createEndpoint(input:completion:)

Creates an endpoint using the provided settings. For a MySQL source or target endpoint, don't explicitly specify the database using the DatabaseName request parameter on the CreateEndpoint API call. Specifying DatabaseName when you create a MySQL endpoint replicates all the task tables to this single database. For MySQL endpoints, you specify the database only when you specify the schema in the table-mapping rules of the DMS task.

``` swift
func createEndpoint(input: CreateEndpointInput, completion: @escaping (ClientRuntime.SdkResult<CreateEndpointOutputResponse, CreateEndpointOutputError>) -> Void)
```

### createEventSubscription(input:completion:)

Creates an DMS event notification subscription. You can specify the type of source (SourceType) you want to be notified of, provide a list of DMS source IDs (SourceIds) that triggers the events, and provide a list of event categories (EventCategories) for events you want to be notified of. If you specify both the SourceType and SourceIds, such as SourceType = replication-instance and SourceIdentifier = my-replinstance, you will be notified of all the replication instance events for the specified source. If you specify a SourceType but don't specify a SourceIdentifier, you receive notice of the events for that source type for all your DMS sources. If you don't specify either SourceType nor SourceIdentifier, you will be notified of events generated from all DMS sources belonging to your customer account. For more information about DMS events, see [Working with Events and Notifications](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Events.html) in the Database Migration Service User Guide.

``` swift
func createEventSubscription(input: CreateEventSubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<CreateEventSubscriptionOutputResponse, CreateEventSubscriptionOutputError>) -> Void)
```

### createReplicationInstance(input:completion:)

Creates the replication instance using the specified parameters. DMS requires that your account have certain roles with appropriate permissions before you can create a replication instance. For information on the required roles, see [Creating the IAM Roles to Use With the CLI and DMS API](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.html#CHAP_Security.APIRole). For information on the required permissions, see [IAM Permissions Needed to Use DMS](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.html#CHAP_Security.IAMPermissions).

``` swift
func createReplicationInstance(input: CreateReplicationInstanceInput, completion: @escaping (ClientRuntime.SdkResult<CreateReplicationInstanceOutputResponse, CreateReplicationInstanceOutputError>) -> Void)
```

### createReplicationSubnetGroup(input:completion:)

Creates a replication subnet group given a list of the subnet IDs in a VPC. The VPC needs to have at least one subnet in at least two availability zones in the Amazon Web Services Region, otherwise the service will throw a ReplicationSubnetGroupDoesNotCoverEnoughAZs exception.

``` swift
func createReplicationSubnetGroup(input: CreateReplicationSubnetGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateReplicationSubnetGroupOutputResponse, CreateReplicationSubnetGroupOutputError>) -> Void)
```

### createReplicationTask(input:completion:)

Creates a replication task using the specified parameters.

``` swift
func createReplicationTask(input: CreateReplicationTaskInput, completion: @escaping (ClientRuntime.SdkResult<CreateReplicationTaskOutputResponse, CreateReplicationTaskOutputError>) -> Void)
```

### deleteCertificate(input:completion:)

Deletes the specified certificate.

``` swift
func deleteCertificate(input: DeleteCertificateInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCertificateOutputResponse, DeleteCertificateOutputError>) -> Void)
```

### deleteConnection(input:completion:)

Deletes the connection between a replication instance and an endpoint.

``` swift
func deleteConnection(input: DeleteConnectionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteConnectionOutputResponse, DeleteConnectionOutputError>) -> Void)
```

### deleteEndpoint(input:completion:)

Deletes the specified endpoint. All tasks associated with the endpoint must be deleted before you can delete the endpoint.

``` swift
func deleteEndpoint(input: DeleteEndpointInput, completion: @escaping (ClientRuntime.SdkResult<DeleteEndpointOutputResponse, DeleteEndpointOutputError>) -> Void)
```

### deleteEventSubscription(input:completion:)

Deletes an DMS event subscription.

``` swift
func deleteEventSubscription(input: DeleteEventSubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteEventSubscriptionOutputResponse, DeleteEventSubscriptionOutputError>) -> Void)
```

### deleteReplicationInstance(input:completion:)

Deletes the specified replication instance. You must delete any migration tasks that are associated with the replication instance before you can delete it.

``` swift
func deleteReplicationInstance(input: DeleteReplicationInstanceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteReplicationInstanceOutputResponse, DeleteReplicationInstanceOutputError>) -> Void)
```

### deleteReplicationSubnetGroup(input:completion:)

Deletes a subnet group.

``` swift
func deleteReplicationSubnetGroup(input: DeleteReplicationSubnetGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteReplicationSubnetGroupOutputResponse, DeleteReplicationSubnetGroupOutputError>) -> Void)
```

### deleteReplicationTask(input:completion:)

Deletes the specified replication task.

``` swift
func deleteReplicationTask(input: DeleteReplicationTaskInput, completion: @escaping (ClientRuntime.SdkResult<DeleteReplicationTaskOutputResponse, DeleteReplicationTaskOutputError>) -> Void)
```

### deleteReplicationTaskAssessmentRun(input:completion:)

Deletes the record of a single premigration assessment run. This operation removes all metadata that DMS maintains about this assessment run. However, the operation leaves untouched all information about this assessment run that is stored in your Amazon S3 bucket.

``` swift
func deleteReplicationTaskAssessmentRun(input: DeleteReplicationTaskAssessmentRunInput, completion: @escaping (ClientRuntime.SdkResult<DeleteReplicationTaskAssessmentRunOutputResponse, DeleteReplicationTaskAssessmentRunOutputError>) -> Void)
```

### describeAccountAttributes(input:completion:)

Lists all of the DMS attributes for a customer account. These attributes include DMS quotas for the account and a unique account identifier in a particular DMS region. DMS quotas include a list of resource quotas supported by the account, such as the number of replication instances allowed. The description for each resource quota, includes the quota name, current usage toward that quota, and the quota's maximum value. DMS uses the unique account identifier to name each artifact used by DMS in the given region. This command does not take any parameters.

``` swift
func describeAccountAttributes(input: DescribeAccountAttributesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAccountAttributesOutputResponse, DescribeAccountAttributesOutputError>) -> Void)
```

### describeApplicableIndividualAssessments(input:completion:)

Provides a list of individual assessments that you can specify for a new premigration assessment run, given one or more parameters. If you specify an existing migration task, this operation provides the default individual assessments you can specify for that task. Otherwise, the specified parameters model elements of a possible migration task on which to base a premigration assessment run. To use these migration task modeling parameters, you must specify an existing replication instance, a source database engine, a target database engine, and a migration type. This combination of parameters potentially limits the default individual assessments available for an assessment run created for a corresponding migration task. If you specify no parameters, this operation provides a list of all possible individual assessments that you can specify for an assessment run. If you specify any one of the task modeling parameters, you must specify all of them or the operation cannot provide a list of individual assessments. The only parameter that you can specify alone is for an existing migration task. The specified task definition then determines the default list of individual assessments that you can specify in an assessment run for the task.

``` swift
func describeApplicableIndividualAssessments(input: DescribeApplicableIndividualAssessmentsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeApplicableIndividualAssessmentsOutputResponse, DescribeApplicableIndividualAssessmentsOutputError>) -> Void)
```

### describeCertificates(input:completion:)

Provides a description of the certificate.

``` swift
func describeCertificates(input: DescribeCertificatesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCertificatesOutputResponse, DescribeCertificatesOutputError>) -> Void)
```

### describeConnections(input:completion:)

Describes the status of the connections that have been made between the replication instance and an endpoint. Connections are created when you test an endpoint.

``` swift
func describeConnections(input: DescribeConnectionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeConnectionsOutputResponse, DescribeConnectionsOutputError>) -> Void)
```

### describeEndpoints(input:completion:)

Returns information about the endpoints for your account in the current region.

``` swift
func describeEndpoints(input: DescribeEndpointsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEndpointsOutputResponse, DescribeEndpointsOutputError>) -> Void)
```

### describeEndpointSettings(input:completion:)

Returns information about the possible endpoint settings available when you create an endpoint for a specific database engine.

``` swift
func describeEndpointSettings(input: DescribeEndpointSettingsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEndpointSettingsOutputResponse, DescribeEndpointSettingsOutputError>) -> Void)
```

### describeEndpointTypes(input:completion:)

Returns information about the type of endpoints available.

``` swift
func describeEndpointTypes(input: DescribeEndpointTypesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEndpointTypesOutputResponse, DescribeEndpointTypesOutputError>) -> Void)
```

### describeEventCategories(input:completion:)

Lists categories for all event source types, or, if specified, for a specified source type. You can see a list of the event categories and source types in [Working with Events and Notifications](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Events.html) in the Database Migration Service User Guide.

``` swift
func describeEventCategories(input: DescribeEventCategoriesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEventCategoriesOutputResponse, DescribeEventCategoriesOutputError>) -> Void)
```

### describeEvents(input:completion:)

Lists events for a given source identifier and source type. You can also specify a start and end time. For more information on DMS events, see [Working with Events and Notifications](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Events.html) in the Database Migration Service User Guide.

``` swift
func describeEvents(input: DescribeEventsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEventsOutputResponse, DescribeEventsOutputError>) -> Void)
```

### describeEventSubscriptions(input:completion:)

Lists all the event subscriptions for a customer account. The description of a subscription includes SubscriptionName, SNSTopicARN, CustomerID, SourceType, SourceID, CreationTime, and Status. If you specify SubscriptionName, this action lists the description for that subscription.

``` swift
func describeEventSubscriptions(input: DescribeEventSubscriptionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEventSubscriptionsOutputResponse, DescribeEventSubscriptionsOutputError>) -> Void)
```

### describeOrderableReplicationInstances(input:completion:)

Returns information about the replication instance types that can be created in the specified region.

``` swift
func describeOrderableReplicationInstances(input: DescribeOrderableReplicationInstancesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeOrderableReplicationInstancesOutputResponse, DescribeOrderableReplicationInstancesOutputError>) -> Void)
```

### describePendingMaintenanceActions(input:completion:)

For internal use only

``` swift
func describePendingMaintenanceActions(input: DescribePendingMaintenanceActionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribePendingMaintenanceActionsOutputResponse, DescribePendingMaintenanceActionsOutputError>) -> Void)
```

### describeRefreshSchemasStatus(input:completion:)

Returns the status of the RefreshSchemas operation.

``` swift
func describeRefreshSchemasStatus(input: DescribeRefreshSchemasStatusInput, completion: @escaping (ClientRuntime.SdkResult<DescribeRefreshSchemasStatusOutputResponse, DescribeRefreshSchemasStatusOutputError>) -> Void)
```

### describeReplicationInstances(input:completion:)

Returns information about replication instances for your account in the current region.

``` swift
func describeReplicationInstances(input: DescribeReplicationInstancesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeReplicationInstancesOutputResponse, DescribeReplicationInstancesOutputError>) -> Void)
```

### describeReplicationInstanceTaskLogs(input:completion:)

Returns information about the task logs for the specified task.

``` swift
func describeReplicationInstanceTaskLogs(input: DescribeReplicationInstanceTaskLogsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeReplicationInstanceTaskLogsOutputResponse, DescribeReplicationInstanceTaskLogsOutputError>) -> Void)
```

### describeReplicationSubnetGroups(input:completion:)

Returns information about the replication subnet groups.

``` swift
func describeReplicationSubnetGroups(input: DescribeReplicationSubnetGroupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeReplicationSubnetGroupsOutputResponse, DescribeReplicationSubnetGroupsOutputError>) -> Void)
```

### describeReplicationTaskAssessmentResults(input:completion:)

Returns the task assessment results from the Amazon S3 bucket that DMS creates in your Amazon Web Services account. This action always returns the latest results. For more information about DMS task assessments, see [Creating a task assessment report](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.AssessmentReport.html) in the [ Database Migration Service User Guide](https://docs.aws.amazon.com/https:/docs.aws.amazon.com/dms/latest/userguide/Welcome.html).

``` swift
func describeReplicationTaskAssessmentResults(input: DescribeReplicationTaskAssessmentResultsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeReplicationTaskAssessmentResultsOutputResponse, DescribeReplicationTaskAssessmentResultsOutputError>) -> Void)
```

### describeReplicationTaskAssessmentRuns(input:completion:)

Returns a paginated list of premigration assessment runs based on filter settings. These filter settings can specify a combination of premigration assessment runs, migration tasks, replication instances, and assessment run status values. This operation doesn't return information about individual assessments. For this information, see the DescribeReplicationTaskIndividualAssessments operation.

``` swift
func describeReplicationTaskAssessmentRuns(input: DescribeReplicationTaskAssessmentRunsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeReplicationTaskAssessmentRunsOutputResponse, DescribeReplicationTaskAssessmentRunsOutputError>) -> Void)
```

### describeReplicationTaskIndividualAssessments(input:completion:)

Returns a paginated list of individual assessments based on filter settings. These filter settings can specify a combination of premigration assessment runs, migration tasks, and assessment status values.

``` swift
func describeReplicationTaskIndividualAssessments(input: DescribeReplicationTaskIndividualAssessmentsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeReplicationTaskIndividualAssessmentsOutputResponse, DescribeReplicationTaskIndividualAssessmentsOutputError>) -> Void)
```

### describeReplicationTasks(input:completion:)

Returns information about replication tasks for your account in the current region.

``` swift
func describeReplicationTasks(input: DescribeReplicationTasksInput, completion: @escaping (ClientRuntime.SdkResult<DescribeReplicationTasksOutputResponse, DescribeReplicationTasksOutputError>) -> Void)
```

### describeSchemas(input:completion:)

Returns information about the schema for the specified endpoint.

``` swift
func describeSchemas(input: DescribeSchemasInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSchemasOutputResponse, DescribeSchemasOutputError>) -> Void)
```

### describeTableStatistics(input:completion:)

Returns table statistics on the database migration task, including table name, rows inserted, rows updated, and rows deleted. Note that the "last updated" column the DMS console only indicates the time that DMS last updated the table statistics record for a table. It does not indicate the time of the last update to the table.

``` swift
func describeTableStatistics(input: DescribeTableStatisticsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTableStatisticsOutputResponse, DescribeTableStatisticsOutputError>) -> Void)
```

### importCertificate(input:completion:)

Uploads the specified certificate.

``` swift
func importCertificate(input: ImportCertificateInput, completion: @escaping (ClientRuntime.SdkResult<ImportCertificateOutputResponse, ImportCertificateOutputError>) -> Void)
```

### listTagsForResource(input:completion:)

Lists all metadata tags attached to an DMS resource, including replication instance, endpoint, security group, and migration task. For more information, see [Tag](https://docs.aws.amazon.com/dms/latest/APIReference/API_Tag.html) data type description.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### modifyEndpoint(input:completion:)

Modifies the specified endpoint. For a MySQL source or target endpoint, don't explicitly specify the database using the DatabaseName request parameter on the ModifyEndpoint API call. Specifying DatabaseName when you modify a MySQL endpoint replicates all the task tables to this single database. For MySQL endpoints, you specify the database only when you specify the schema in the table-mapping rules of the DMS task.

``` swift
func modifyEndpoint(input: ModifyEndpointInput, completion: @escaping (ClientRuntime.SdkResult<ModifyEndpointOutputResponse, ModifyEndpointOutputError>) -> Void)
```

### modifyEventSubscription(input:completion:)

Modifies an existing DMS event notification subscription.

``` swift
func modifyEventSubscription(input: ModifyEventSubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<ModifyEventSubscriptionOutputResponse, ModifyEventSubscriptionOutputError>) -> Void)
```

### modifyReplicationInstance(input:completion:)

Modifies the replication instance to apply new settings. You can change one or more parameters by specifying these parameters and the new values in the request. Some settings are applied during the maintenance window.

``` swift
func modifyReplicationInstance(input: ModifyReplicationInstanceInput, completion: @escaping (ClientRuntime.SdkResult<ModifyReplicationInstanceOutputResponse, ModifyReplicationInstanceOutputError>) -> Void)
```

### modifyReplicationSubnetGroup(input:completion:)

Modifies the settings for the specified replication subnet group.

``` swift
func modifyReplicationSubnetGroup(input: ModifyReplicationSubnetGroupInput, completion: @escaping (ClientRuntime.SdkResult<ModifyReplicationSubnetGroupOutputResponse, ModifyReplicationSubnetGroupOutputError>) -> Void)
```

### modifyReplicationTask(input:completion:)

Modifies the specified replication task. You can't modify the task endpoints. The task must be stopped before you can modify it. For more information about DMS tasks, see [Working with Migration Tasks](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.html) in the Database Migration Service User Guide.

``` swift
func modifyReplicationTask(input: ModifyReplicationTaskInput, completion: @escaping (ClientRuntime.SdkResult<ModifyReplicationTaskOutputResponse, ModifyReplicationTaskOutputError>) -> Void)
```

### moveReplicationTask(input:completion:)

Moves a replication task from its current replication instance to a different target replication instance using the specified parameters. The target replication instance must be created with the same or later DMS version as the current replication instance.

``` swift
func moveReplicationTask(input: MoveReplicationTaskInput, completion: @escaping (ClientRuntime.SdkResult<MoveReplicationTaskOutputResponse, MoveReplicationTaskOutputError>) -> Void)
```

### rebootReplicationInstance(input:completion:)

Reboots a replication instance. Rebooting results in a momentary outage, until the replication instance becomes available again.

``` swift
func rebootReplicationInstance(input: RebootReplicationInstanceInput, completion: @escaping (ClientRuntime.SdkResult<RebootReplicationInstanceOutputResponse, RebootReplicationInstanceOutputError>) -> Void)
```

### refreshSchemas(input:completion:)

Populates the schema for the specified endpoint. This is an asynchronous operation and can take several minutes. You can check the status of this operation by calling the DescribeRefreshSchemasStatus operation.

``` swift
func refreshSchemas(input: RefreshSchemasInput, completion: @escaping (ClientRuntime.SdkResult<RefreshSchemasOutputResponse, RefreshSchemasOutputError>) -> Void)
```

### reloadTables(input:completion:)

Reloads the target database table with the source data. You can only use this operation with a task in the RUNNING state, otherwise the service will throw an InvalidResourceStateFault exception.

``` swift
func reloadTables(input: ReloadTablesInput, completion: @escaping (ClientRuntime.SdkResult<ReloadTablesOutputResponse, ReloadTablesOutputError>) -> Void)
```

### removeTagsFromResource(input:completion:)

Removes metadata tags from an DMS resource, including replication instance, endpoint, security group, and migration task. For more information, see [Tag](https://docs.aws.amazon.com/dms/latest/APIReference/API_Tag.html) data type description.

``` swift
func removeTagsFromResource(input: RemoveTagsFromResourceInput, completion: @escaping (ClientRuntime.SdkResult<RemoveTagsFromResourceOutputResponse, RemoveTagsFromResourceOutputError>) -> Void)
```

### startReplicationTask(input:completion:)

Starts the replication task. For more information about DMS tasks, see [Working with Migration Tasks ](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.html) in the Database Migration Service User Guide.

``` swift
func startReplicationTask(input: StartReplicationTaskInput, completion: @escaping (ClientRuntime.SdkResult<StartReplicationTaskOutputResponse, StartReplicationTaskOutputError>) -> Void)
```

### startReplicationTaskAssessment(input:completion:)

Starts the replication task assessment for unsupported data types in the source database.

``` swift
func startReplicationTaskAssessment(input: StartReplicationTaskAssessmentInput, completion: @escaping (ClientRuntime.SdkResult<StartReplicationTaskAssessmentOutputResponse, StartReplicationTaskAssessmentOutputError>) -> Void)
```

### startReplicationTaskAssessmentRun(input:completion:)

Starts a new premigration assessment run for one or more individual assessments of a migration task. The assessments that you can specify depend on the source and target database engine and the migration type defined for the given task. To run this operation, your migration task must already be created. After you run this operation, you can review the status of each individual assessment. You can also run the migration task manually after the assessment run and its individual assessments complete.

``` swift
func startReplicationTaskAssessmentRun(input: StartReplicationTaskAssessmentRunInput, completion: @escaping (ClientRuntime.SdkResult<StartReplicationTaskAssessmentRunOutputResponse, StartReplicationTaskAssessmentRunOutputError>) -> Void)
```

### stopReplicationTask(input:completion:)

Stops the replication task.

``` swift
func stopReplicationTask(input: StopReplicationTaskInput, completion: @escaping (ClientRuntime.SdkResult<StopReplicationTaskOutputResponse, StopReplicationTaskOutputError>) -> Void)
```

### testConnection(input:completion:)

Tests the connection between the replication instance and the endpoint.

``` swift
func testConnection(input: TestConnectionInput, completion: @escaping (ClientRuntime.SdkResult<TestConnectionOutputResponse, TestConnectionOutputError>) -> Void)
```
