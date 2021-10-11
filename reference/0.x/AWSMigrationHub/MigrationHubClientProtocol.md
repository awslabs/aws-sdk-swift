# MigrationHubClientProtocol

The AWS Migration Hub API methods help to obtain server and application migration status
and integrate your resource-specific migration tool by providing a programmatic interface
to Migration Hub.
Remember that you must set your AWS Migration Hub home region before you call any of
these APIs, or a HomeRegionNotSetException error will be returned. Also, you
must make the API calls while in your home region.

``` swift
public protocol MigrationHubClientProtocol 
```

## Requirements

### associateCreatedArtifact(input:​completion:​)

Associates a created artifact of an AWS cloud resource, the target receiving the
migration, with the migration task performed by a migration tool. This API has the
following traits:​

``` swift
func associateCreatedArtifact(input: AssociateCreatedArtifactInput, completion: @escaping (ClientRuntime.SdkResult<AssociateCreatedArtifactOutputResponse, AssociateCreatedArtifactOutputError>) -> Void)
```

``` 
           Migration tools can call the AssociateCreatedArtifact operation to
           indicate which AWS artifact is associated with a migration task.


           The created artifact name must be provided in ARN (Amazon Resource Name) format
           which will contain information about type and region; for example:
              arn:aws:ec2:us-east-1:488216288981:image/ami-6d0ba87b.


           Examples of the AWS resource behind the created artifact are, AMI's, EC2 instance,
           or DMS endpoint, etc.
```

### associateDiscoveredResource(input:​completion:​)

Associates a discovered resource ID from Application Discovery Service with a migration
task.

``` swift
func associateDiscoveredResource(input: AssociateDiscoveredResourceInput, completion: @escaping (ClientRuntime.SdkResult<AssociateDiscoveredResourceOutputResponse, AssociateDiscoveredResourceOutputError>) -> Void)
```

### createProgressUpdateStream(input:​completion:​)

Creates a progress update stream which is an AWS resource used for access control as
well as a namespace for migration task names that is implicitly linked to your AWS account.
It must uniquely identify the migration tool as it is used for all updates made by the
tool; however, it does not need to be unique for each AWS account because it is scoped to
the AWS account.

``` swift
func createProgressUpdateStream(input: CreateProgressUpdateStreamInput, completion: @escaping (ClientRuntime.SdkResult<CreateProgressUpdateStreamOutputResponse, CreateProgressUpdateStreamOutputError>) -> Void)
```

### deleteProgressUpdateStream(input:​completion:​)

Deletes a progress update stream, including all of its tasks, which was previously
created as an AWS resource used for access control. This API has the following
traits:​

``` swift
func deleteProgressUpdateStream(input: DeleteProgressUpdateStreamInput, completion: @escaping (ClientRuntime.SdkResult<DeleteProgressUpdateStreamOutputResponse, DeleteProgressUpdateStreamOutputError>) -> Void)
```

``` 
           The only parameter needed for DeleteProgressUpdateStream is the
           stream name (same as a CreateProgressUpdateStream call).


           The call will return, and a background process will asynchronously delete the
           stream and all of its resources (tasks, associated resources, resource attributes,
           created artifacts).


           If the stream takes time to be deleted, it might still show up on a
              ListProgressUpdateStreams call.



              CreateProgressUpdateStream, ImportMigrationTask,
              NotifyMigrationTaskState, and all Associate[*] APIs related to the
           tasks belonging to the stream will throw "InvalidInputException" if the stream of the
           same name is in the process of being deleted.


           Once the stream and all of its resources are deleted,
              CreateProgressUpdateStream for a stream of the same name will
           succeed, and that stream will be an entirely new logical resource (without any
           resources associated with the old stream).
```

### describeApplicationState(input:​completion:​)

Gets the migration status of an application.

``` swift
func describeApplicationState(input: DescribeApplicationStateInput, completion: @escaping (ClientRuntime.SdkResult<DescribeApplicationStateOutputResponse, DescribeApplicationStateOutputError>) -> Void)
```

### describeMigrationTask(input:​completion:​)

Retrieves a list of all attributes associated with a specific migration task.

``` swift
func describeMigrationTask(input: DescribeMigrationTaskInput, completion: @escaping (ClientRuntime.SdkResult<DescribeMigrationTaskOutputResponse, DescribeMigrationTaskOutputError>) -> Void)
```

### disassociateCreatedArtifact(input:​completion:​)

Disassociates a created artifact of an AWS resource with a migration task performed by a
migration tool that was previously associated. This API has the following traits:​

``` swift
func disassociateCreatedArtifact(input: DisassociateCreatedArtifactInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateCreatedArtifactOutputResponse, DisassociateCreatedArtifactOutputError>) -> Void)
```

``` 
           A migration user can call the DisassociateCreatedArtifacts operation
           to disassociate a created AWS Artifact from a migration task.


           The created artifact name must be provided in ARN (Amazon Resource Name) format
           which will contain information about type and region; for example:
              arn:aws:ec2:us-east-1:488216288981:image/ami-6d0ba87b.


           Examples of the AWS resource behind the created artifact are, AMI's, EC2 instance,
           or RDS instance, etc.
```

### disassociateDiscoveredResource(input:​completion:​)

Disassociate an Application Discovery Service discovered resource from a migration
task.

``` swift
func disassociateDiscoveredResource(input: DisassociateDiscoveredResourceInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateDiscoveredResourceOutputResponse, DisassociateDiscoveredResourceOutputError>) -> Void)
```

### importMigrationTask(input:​completion:​)

Registers a new migration task which represents a server, database, etc., being migrated
to AWS by a migration tool.
This API is a prerequisite to calling the NotifyMigrationTaskState API as
the migration tool must first register the migration task with Migration Hub.

``` swift
func importMigrationTask(input: ImportMigrationTaskInput, completion: @escaping (ClientRuntime.SdkResult<ImportMigrationTaskOutputResponse, ImportMigrationTaskOutputError>) -> Void)
```

### listApplicationStates(input:​completion:​)

Lists all the migration statuses for your applications. If you use the optional
ApplicationIds parameter, only the migration statuses for those
applications will be returned.

``` swift
func listApplicationStates(input: ListApplicationStatesInput, completion: @escaping (ClientRuntime.SdkResult<ListApplicationStatesOutputResponse, ListApplicationStatesOutputError>) -> Void)
```

### listCreatedArtifacts(input:​completion:​)

Lists the created artifacts attached to a given migration task in an update stream. This
API has the following traits:​

``` swift
func listCreatedArtifacts(input: ListCreatedArtifactsInput, completion: @escaping (ClientRuntime.SdkResult<ListCreatedArtifactsOutputResponse, ListCreatedArtifactsOutputError>) -> Void)
```

``` 
           Gets the list of the created artifacts while
           migration is taking place.


           Shows the artifacts created by the migration tool that was associated by the
              AssociateCreatedArtifact API.


           Lists created artifacts in a paginated interface.
```

### listDiscoveredResources(input:​completion:​)

Lists discovered resources associated with the given MigrationTask.

``` swift
func listDiscoveredResources(input: ListDiscoveredResourcesInput, completion: @escaping (ClientRuntime.SdkResult<ListDiscoveredResourcesOutputResponse, ListDiscoveredResourcesOutputError>) -> Void)
```

### listMigrationTasks(input:​completion:​)

Lists all, or filtered by resource name, migration tasks associated with the user
account making this call. This API has the following traits:​

``` swift
func listMigrationTasks(input: ListMigrationTasksInput, completion: @escaping (ClientRuntime.SdkResult<ListMigrationTasksOutputResponse, ListMigrationTasksOutputError>) -> Void)
```

``` 
           Can show a summary list of the most recent migration tasks.


           Can show a summary list of migration tasks associated with a given discovered
           resource.


           Lists migration tasks in a paginated interface.
```

### listProgressUpdateStreams(input:​completion:​)

Lists progress update streams associated with the user account making this call.

``` swift
func listProgressUpdateStreams(input: ListProgressUpdateStreamsInput, completion: @escaping (ClientRuntime.SdkResult<ListProgressUpdateStreamsOutputResponse, ListProgressUpdateStreamsOutputError>) -> Void)
```

### notifyApplicationState(input:​completion:​)

Sets the migration state of an application. For a given application identified by the
value passed to ApplicationId, its status is set or updated by passing one of
three values to Status:​ NOT\_STARTED | IN\_PROGRESS |
COMPLETED.

``` swift
func notifyApplicationState(input: NotifyApplicationStateInput, completion: @escaping (ClientRuntime.SdkResult<NotifyApplicationStateOutputResponse, NotifyApplicationStateOutputError>) -> Void)
```

### notifyMigrationTaskState(input:​completion:​)

Notifies Migration Hub of the current status, progress, or other detail regarding a
migration task. This API has the following traits:​

``` swift
func notifyMigrationTaskState(input: NotifyMigrationTaskStateInput, completion: @escaping (ClientRuntime.SdkResult<NotifyMigrationTaskStateOutputResponse, NotifyMigrationTaskStateOutputError>) -> Void)
```

``` 
           Migration tools will call the NotifyMigrationTaskState API to share
           the latest progress and status.



              MigrationTaskName is used for addressing updates to the correct
           target.



              ProgressUpdateStream is used for access control and to provide a
           namespace for each migration tool.
```

### putResourceAttributes(input:​completion:​)

Provides identifying details of the resource being migrated so that it can be associated
in the Application Discovery Service repository. This association occurs asynchronously
after PutResourceAttributes returns.

``` swift
func putResourceAttributes(input: PutResourceAttributesInput, completion: @escaping (ClientRuntime.SdkResult<PutResourceAttributesOutputResponse, PutResourceAttributesOutputError>) -> Void)
```

``` 
              Keep in mind that subsequent calls to PutResourceAttributes will override
              previously stored attributes. For example, if it is first called with a MAC
              address, but later, it is desired to add an IP address, it
              will then be required to call it with both the IP and MAC
              addresses to prevent overriding the MAC address.


              Note the instructions regarding the special use case of the <a href="https://docs.aws.amazon.com/migrationhub/latest/ug/API_PutResourceAttributes.html#migrationhub-PutResourceAttributes-request-ResourceAttributeList">
                    ResourceAttributeList
                  parameter when specifying any
              "VM" related value.





        Because this is an asynchronous call, it will always return 200, whether an
        association occurs or not. To confirm if an association was found based on the provided
        details, call ListDiscoveredResources.
```
