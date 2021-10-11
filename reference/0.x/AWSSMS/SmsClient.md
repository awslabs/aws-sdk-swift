# SmsClient

``` swift
public class SmsClient 
```

## Inheritance

[`SmsClientProtocol`](/aws-sdk-swift/reference/0.x/AWSSMS/SmsClientProtocol)

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

### `createApp(input:completion:)`

Creates an application. An application consists of one or more server groups. Each
server group contain one or more servers.

``` swift
public func createApp(input: CreateAppInput, completion: @escaping (ClientRuntime.SdkResult<CreateAppOutputResponse, CreateAppOutputError>) -> Void)
```

### `createReplicationJob(input:completion:)`

Creates a replication job. The replication job schedules periodic replication runs
to replicate your server to AWS. Each replication run creates an Amazon Machine Image
(AMI).

``` swift
public func createReplicationJob(input: CreateReplicationJobInput, completion: @escaping (ClientRuntime.SdkResult<CreateReplicationJobOutputResponse, CreateReplicationJobOutputError>) -> Void)
```

### `deleteApp(input:completion:)`

Deletes the specified application. Optionally deletes the launched stack associated with
the application and all AWS SMS replication jobs for servers in the application.

``` swift
public func deleteApp(input: DeleteAppInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAppOutputResponse, DeleteAppOutputError>) -> Void)
```

### `deleteAppLaunchConfiguration(input:completion:)`

Deletes the launch configuration for the specified application.

``` swift
public func deleteAppLaunchConfiguration(input: DeleteAppLaunchConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAppLaunchConfigurationOutputResponse, DeleteAppLaunchConfigurationOutputError>) -> Void)
```

### `deleteAppReplicationConfiguration(input:completion:)`

Deletes the replication configuration for the specified application.

``` swift
public func deleteAppReplicationConfiguration(input: DeleteAppReplicationConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAppReplicationConfigurationOutputResponse, DeleteAppReplicationConfigurationOutputError>) -> Void)
```

### `deleteAppValidationConfiguration(input:completion:)`

Deletes the validation configuration for the specified application.

``` swift
public func deleteAppValidationConfiguration(input: DeleteAppValidationConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAppValidationConfigurationOutputResponse, DeleteAppValidationConfigurationOutputError>) -> Void)
```

### `deleteReplicationJob(input:completion:)`

Deletes the specified replication job.
After you delete a replication job, there are no further replication runs. AWS
deletes the contents of the Amazon S3 bucket used to store AWS SMS artifacts. The AMIs created
by the replication runs are not deleted.

``` swift
public func deleteReplicationJob(input: DeleteReplicationJobInput, completion: @escaping (ClientRuntime.SdkResult<DeleteReplicationJobOutputResponse, DeleteReplicationJobOutputError>) -> Void)
```

### `deleteServerCatalog(input:completion:)`

Deletes all servers from your server catalog.

``` swift
public func deleteServerCatalog(input: DeleteServerCatalogInput, completion: @escaping (ClientRuntime.SdkResult<DeleteServerCatalogOutputResponse, DeleteServerCatalogOutputError>) -> Void)
```

### `disassociateConnector(input:completion:)`

Disassociates the specified connector from AWS SMS.
After you disassociate a connector, it is no longer available to support
replication jobs.

``` swift
public func disassociateConnector(input: DisassociateConnectorInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateConnectorOutputResponse, DisassociateConnectorOutputError>) -> Void)
```

### `generateChangeSet(input:completion:)`

Generates a target change set for a currently launched stack and writes it to an Amazon S3
object in the customer’s Amazon S3 bucket.

``` swift
public func generateChangeSet(input: GenerateChangeSetInput, completion: @escaping (ClientRuntime.SdkResult<GenerateChangeSetOutputResponse, GenerateChangeSetOutputError>) -> Void)
```

### `generateTemplate(input:completion:)`

Generates an AWS CloudFormation template based on the current launch configuration and writes it to
an Amazon S3 object in the customer’s Amazon S3 bucket.

``` swift
public func generateTemplate(input: GenerateTemplateInput, completion: @escaping (ClientRuntime.SdkResult<GenerateTemplateOutputResponse, GenerateTemplateOutputError>) -> Void)
```

### `getApp(input:completion:)`

Retrieve information about the specified application.

``` swift
public func getApp(input: GetAppInput, completion: @escaping (ClientRuntime.SdkResult<GetAppOutputResponse, GetAppOutputError>) -> Void)
```

### `getAppLaunchConfiguration(input:completion:)`

Retrieves the application launch configuration associated with the specified application.

``` swift
public func getAppLaunchConfiguration(input: GetAppLaunchConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetAppLaunchConfigurationOutputResponse, GetAppLaunchConfigurationOutputError>) -> Void)
```

### `getAppReplicationConfiguration(input:completion:)`

Retrieves the application replication configuration associated with the specified
application.

``` swift
public func getAppReplicationConfiguration(input: GetAppReplicationConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetAppReplicationConfigurationOutputResponse, GetAppReplicationConfigurationOutputError>) -> Void)
```

### `getAppValidationConfiguration(input:completion:)`

Retrieves information about a configuration for validating an application.

``` swift
public func getAppValidationConfiguration(input: GetAppValidationConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetAppValidationConfigurationOutputResponse, GetAppValidationConfigurationOutputError>) -> Void)
```

### `getAppValidationOutput(input:completion:)`

Retrieves output from validating an application.

``` swift
public func getAppValidationOutput(input: GetAppValidationOutputInput, completion: @escaping (ClientRuntime.SdkResult<GetAppValidationOutputOutputResponse, GetAppValidationOutputOutputError>) -> Void)
```

### `getConnectors(input:completion:)`

Describes the connectors registered with the AWS SMS.

``` swift
public func getConnectors(input: GetConnectorsInput, completion: @escaping (ClientRuntime.SdkResult<GetConnectorsOutputResponse, GetConnectorsOutputError>) -> Void)
```

### `getReplicationJobs(input:completion:)`

Describes the specified replication job or all of your replication jobs.

``` swift
public func getReplicationJobs(input: GetReplicationJobsInput, completion: @escaping (ClientRuntime.SdkResult<GetReplicationJobsOutputResponse, GetReplicationJobsOutputError>) -> Void)
```

### `getReplicationRuns(input:completion:)`

Describes the replication runs for the specified replication job.

``` swift
public func getReplicationRuns(input: GetReplicationRunsInput, completion: @escaping (ClientRuntime.SdkResult<GetReplicationRunsOutputResponse, GetReplicationRunsOutputError>) -> Void)
```

### `getServers(input:completion:)`

Describes the servers in your server catalog.
Before you can describe your servers, you must import them using ImportServerCatalog.

``` swift
public func getServers(input: GetServersInput, completion: @escaping (ClientRuntime.SdkResult<GetServersOutputResponse, GetServersOutputError>) -> Void)
```

### `importAppCatalog(input:completion:)`

Allows application import from AWS Migration Hub.

``` swift
public func importAppCatalog(input: ImportAppCatalogInput, completion: @escaping (ClientRuntime.SdkResult<ImportAppCatalogOutputResponse, ImportAppCatalogOutputError>) -> Void)
```

### `importServerCatalog(input:completion:)`

Gathers a complete list of on-premises servers. Connectors must be installed and
monitoring all servers to import.
This call returns immediately, but might take additional time to retrieve all the
servers.

``` swift
public func importServerCatalog(input: ImportServerCatalogInput, completion: @escaping (ClientRuntime.SdkResult<ImportServerCatalogOutputResponse, ImportServerCatalogOutputError>) -> Void)
```

### `launchApp(input:completion:)`

Launches the specified application as a stack in AWS CloudFormation.

``` swift
public func launchApp(input: LaunchAppInput, completion: @escaping (ClientRuntime.SdkResult<LaunchAppOutputResponse, LaunchAppOutputError>) -> Void)
```

### `listApps(input:completion:)`

Retrieves summaries for all applications.

``` swift
public func listApps(input: ListAppsInput, completion: @escaping (ClientRuntime.SdkResult<ListAppsOutputResponse, ListAppsOutputError>) -> Void)
```

### `notifyAppValidationOutput(input:completion:)`

Provides information to AWS SMS about whether application validation is successful.

``` swift
public func notifyAppValidationOutput(input: NotifyAppValidationOutputInput, completion: @escaping (ClientRuntime.SdkResult<NotifyAppValidationOutputOutputResponse, NotifyAppValidationOutputOutputError>) -> Void)
```

### `putAppLaunchConfiguration(input:completion:)`

Creates or updates the launch configuration for the specified application.

``` swift
public func putAppLaunchConfiguration(input: PutAppLaunchConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<PutAppLaunchConfigurationOutputResponse, PutAppLaunchConfigurationOutputError>) -> Void)
```

### `putAppReplicationConfiguration(input:completion:)`

Creates or updates the replication configuration for the specified application.

``` swift
public func putAppReplicationConfiguration(input: PutAppReplicationConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<PutAppReplicationConfigurationOutputResponse, PutAppReplicationConfigurationOutputError>) -> Void)
```

### `putAppValidationConfiguration(input:completion:)`

Creates or updates a validation configuration for the specified application.

``` swift
public func putAppValidationConfiguration(input: PutAppValidationConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<PutAppValidationConfigurationOutputResponse, PutAppValidationConfigurationOutputError>) -> Void)
```

### `startAppReplication(input:completion:)`

Starts replicating the specified application by creating replication jobs for each server in the
application.

``` swift
public func startAppReplication(input: StartAppReplicationInput, completion: @escaping (ClientRuntime.SdkResult<StartAppReplicationOutputResponse, StartAppReplicationOutputError>) -> Void)
```

### `startOnDemandAppReplication(input:completion:)`

Starts an on-demand replication run for the specified application.

``` swift
public func startOnDemandAppReplication(input: StartOnDemandAppReplicationInput, completion: @escaping (ClientRuntime.SdkResult<StartOnDemandAppReplicationOutputResponse, StartOnDemandAppReplicationOutputError>) -> Void)
```

### `startOnDemandReplicationRun(input:completion:)`

Starts an on-demand replication run for the specified replication job. This
replication run starts immediately. This replication run is in addition to the ones
already scheduled.
There is a limit on the number of on-demand replications runs that you can request
in a 24-hour period.

``` swift
public func startOnDemandReplicationRun(input: StartOnDemandReplicationRunInput, completion: @escaping (ClientRuntime.SdkResult<StartOnDemandReplicationRunOutputResponse, StartOnDemandReplicationRunOutputError>) -> Void)
```

### `stopAppReplication(input:completion:)`

Stops replicating the specified application by deleting the replication job for each server in
the application.

``` swift
public func stopAppReplication(input: StopAppReplicationInput, completion: @escaping (ClientRuntime.SdkResult<StopAppReplicationOutputResponse, StopAppReplicationOutputError>) -> Void)
```

### `terminateApp(input:completion:)`

Terminates the stack for the specified application.

``` swift
public func terminateApp(input: TerminateAppInput, completion: @escaping (ClientRuntime.SdkResult<TerminateAppOutputResponse, TerminateAppOutputError>) -> Void)
```

### `updateApp(input:completion:)`

Updates the specified application.

``` swift
public func updateApp(input: UpdateAppInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAppOutputResponse, UpdateAppOutputError>) -> Void)
```

### `updateReplicationJob(input:completion:)`

Updates the specified settings for the specified replication job.

``` swift
public func updateReplicationJob(input: UpdateReplicationJobInput, completion: @escaping (ClientRuntime.SdkResult<UpdateReplicationJobOutputResponse, UpdateReplicationJobOutputError>) -> Void)
```
