# RoboMakerClient

``` swift
public class RoboMakerClient 
```

## Inheritance

[`RoboMakerClientProtocol`](/aws-sdk-swift/reference/0.x/AWSRoboMaker/RoboMakerClientProtocol)

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
public static let clientName = "RoboMakerClient"
```

## Methods

### `batchDeleteWorlds(input:completion:)`

Deletes one or more worlds in a batch operation.

``` swift
public func batchDeleteWorlds(input: BatchDeleteWorldsInput, completion: @escaping (ClientRuntime.SdkResult<BatchDeleteWorldsOutputResponse, BatchDeleteWorldsOutputError>) -> Void)
```

### `batchDescribeSimulationJob(input:completion:)`

Describes one or more simulation jobs.

``` swift
public func batchDescribeSimulationJob(input: BatchDescribeSimulationJobInput, completion: @escaping (ClientRuntime.SdkResult<BatchDescribeSimulationJobOutputResponse, BatchDescribeSimulationJobOutputError>) -> Void)
```

### `cancelDeploymentJob(input:completion:)`

Cancels the specified deployment job.

``` swift
public func cancelDeploymentJob(input: CancelDeploymentJobInput, completion: @escaping (ClientRuntime.SdkResult<CancelDeploymentJobOutputResponse, CancelDeploymentJobOutputError>) -> Void)
```

### `cancelSimulationJob(input:completion:)`

Cancels the specified simulation job.

``` swift
public func cancelSimulationJob(input: CancelSimulationJobInput, completion: @escaping (ClientRuntime.SdkResult<CancelSimulationJobOutputResponse, CancelSimulationJobOutputError>) -> Void)
```

### `cancelSimulationJobBatch(input:completion:)`

Cancels a simulation job batch. When you cancel a simulation job batch, you are also cancelling all of the active simulation jobs created as part of the batch.

``` swift
public func cancelSimulationJobBatch(input: CancelSimulationJobBatchInput, completion: @escaping (ClientRuntime.SdkResult<CancelSimulationJobBatchOutputResponse, CancelSimulationJobBatchOutputError>) -> Void)
```

### `cancelWorldExportJob(input:completion:)`

Cancels the specified export job.

``` swift
public func cancelWorldExportJob(input: CancelWorldExportJobInput, completion: @escaping (ClientRuntime.SdkResult<CancelWorldExportJobOutputResponse, CancelWorldExportJobOutputError>) -> Void)
```

### `cancelWorldGenerationJob(input:completion:)`

Cancels the specified world generator job.

``` swift
public func cancelWorldGenerationJob(input: CancelWorldGenerationJobInput, completion: @escaping (ClientRuntime.SdkResult<CancelWorldGenerationJobOutputResponse, CancelWorldGenerationJobOutputError>) -> Void)
```

### `createDeploymentJob(input:completion:)`

Deploys a specific version of a robot application to robots in a fleet. The robot application must have a numbered applicationVersion for consistency reasons. To create a new version, use CreateRobotApplicationVersion or see [Creating a Robot Application Version](https://docs.aws.amazon.com/robomaker/latest/dg/create-robot-application-version.html). After 90 days, deployment jobs expire and will be deleted. They will no longer be accessible.

``` swift
public func createDeploymentJob(input: CreateDeploymentJobInput, completion: @escaping (ClientRuntime.SdkResult<CreateDeploymentJobOutputResponse, CreateDeploymentJobOutputError>) -> Void)
```

### `createFleet(input:completion:)`

Creates a fleet, a logical group of robots running the same robot application.

``` swift
public func createFleet(input: CreateFleetInput, completion: @escaping (ClientRuntime.SdkResult<CreateFleetOutputResponse, CreateFleetOutputError>) -> Void)
```

### `createRobot(input:completion:)`

Creates a robot.

``` swift
public func createRobot(input: CreateRobotInput, completion: @escaping (ClientRuntime.SdkResult<CreateRobotOutputResponse, CreateRobotOutputError>) -> Void)
```

### `createRobotApplication(input:completion:)`

Creates a robot application.

``` swift
public func createRobotApplication(input: CreateRobotApplicationInput, completion: @escaping (ClientRuntime.SdkResult<CreateRobotApplicationOutputResponse, CreateRobotApplicationOutputError>) -> Void)
```

### `createRobotApplicationVersion(input:completion:)`

Creates a version of a robot application.

``` swift
public func createRobotApplicationVersion(input: CreateRobotApplicationVersionInput, completion: @escaping (ClientRuntime.SdkResult<CreateRobotApplicationVersionOutputResponse, CreateRobotApplicationVersionOutputError>) -> Void)
```

### `createSimulationApplication(input:completion:)`

Creates a simulation application.

``` swift
public func createSimulationApplication(input: CreateSimulationApplicationInput, completion: @escaping (ClientRuntime.SdkResult<CreateSimulationApplicationOutputResponse, CreateSimulationApplicationOutputError>) -> Void)
```

### `createSimulationApplicationVersion(input:completion:)`

Creates a simulation application with a specific revision id.

``` swift
public func createSimulationApplicationVersion(input: CreateSimulationApplicationVersionInput, completion: @escaping (ClientRuntime.SdkResult<CreateSimulationApplicationVersionOutputResponse, CreateSimulationApplicationVersionOutputError>) -> Void)
```

### `createSimulationJob(input:completion:)`

Creates a simulation job. After 90 days, simulation jobs expire and will be deleted. They will no longer be accessible.

``` swift
public func createSimulationJob(input: CreateSimulationJobInput, completion: @escaping (ClientRuntime.SdkResult<CreateSimulationJobOutputResponse, CreateSimulationJobOutputError>) -> Void)
```

### `createWorldExportJob(input:completion:)`

Creates a world export job.

``` swift
public func createWorldExportJob(input: CreateWorldExportJobInput, completion: @escaping (ClientRuntime.SdkResult<CreateWorldExportJobOutputResponse, CreateWorldExportJobOutputError>) -> Void)
```

### `createWorldGenerationJob(input:completion:)`

Creates worlds using the specified template.

``` swift
public func createWorldGenerationJob(input: CreateWorldGenerationJobInput, completion: @escaping (ClientRuntime.SdkResult<CreateWorldGenerationJobOutputResponse, CreateWorldGenerationJobOutputError>) -> Void)
```

### `createWorldTemplate(input:completion:)`

Creates a world template.

``` swift
public func createWorldTemplate(input: CreateWorldTemplateInput, completion: @escaping (ClientRuntime.SdkResult<CreateWorldTemplateOutputResponse, CreateWorldTemplateOutputError>) -> Void)
```

### `deleteFleet(input:completion:)`

Deletes a fleet.

``` swift
public func deleteFleet(input: DeleteFleetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFleetOutputResponse, DeleteFleetOutputError>) -> Void)
```

### `deleteRobot(input:completion:)`

Deletes a robot.

``` swift
public func deleteRobot(input: DeleteRobotInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRobotOutputResponse, DeleteRobotOutputError>) -> Void)
```

### `deleteRobotApplication(input:completion:)`

Deletes a robot application.

``` swift
public func deleteRobotApplication(input: DeleteRobotApplicationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRobotApplicationOutputResponse, DeleteRobotApplicationOutputError>) -> Void)
```

### `deleteSimulationApplication(input:completion:)`

Deletes a simulation application.

``` swift
public func deleteSimulationApplication(input: DeleteSimulationApplicationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSimulationApplicationOutputResponse, DeleteSimulationApplicationOutputError>) -> Void)
```

### `deleteWorldTemplate(input:completion:)`

Deletes a world template.

``` swift
public func deleteWorldTemplate(input: DeleteWorldTemplateInput, completion: @escaping (ClientRuntime.SdkResult<DeleteWorldTemplateOutputResponse, DeleteWorldTemplateOutputError>) -> Void)
```

### `deregisterRobot(input:completion:)`

Deregisters a robot.

``` swift
public func deregisterRobot(input: DeregisterRobotInput, completion: @escaping (ClientRuntime.SdkResult<DeregisterRobotOutputResponse, DeregisterRobotOutputError>) -> Void)
```

### `describeDeploymentJob(input:completion:)`

Describes a deployment job.

``` swift
public func describeDeploymentJob(input: DescribeDeploymentJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDeploymentJobOutputResponse, DescribeDeploymentJobOutputError>) -> Void)
```

### `describeFleet(input:completion:)`

Describes a fleet.

``` swift
public func describeFleet(input: DescribeFleetInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFleetOutputResponse, DescribeFleetOutputError>) -> Void)
```

### `describeRobot(input:completion:)`

Describes a robot.

``` swift
public func describeRobot(input: DescribeRobotInput, completion: @escaping (ClientRuntime.SdkResult<DescribeRobotOutputResponse, DescribeRobotOutputError>) -> Void)
```

### `describeRobotApplication(input:completion:)`

Describes a robot application.

``` swift
public func describeRobotApplication(input: DescribeRobotApplicationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeRobotApplicationOutputResponse, DescribeRobotApplicationOutputError>) -> Void)
```

### `describeSimulationApplication(input:completion:)`

Describes a simulation application.

``` swift
public func describeSimulationApplication(input: DescribeSimulationApplicationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSimulationApplicationOutputResponse, DescribeSimulationApplicationOutputError>) -> Void)
```

### `describeSimulationJob(input:completion:)`

Describes a simulation job.

``` swift
public func describeSimulationJob(input: DescribeSimulationJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSimulationJobOutputResponse, DescribeSimulationJobOutputError>) -> Void)
```

### `describeSimulationJobBatch(input:completion:)`

Describes a simulation job batch.

``` swift
public func describeSimulationJobBatch(input: DescribeSimulationJobBatchInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSimulationJobBatchOutputResponse, DescribeSimulationJobBatchOutputError>) -> Void)
```

### `describeWorld(input:completion:)`

Describes a world.

``` swift
public func describeWorld(input: DescribeWorldInput, completion: @escaping (ClientRuntime.SdkResult<DescribeWorldOutputResponse, DescribeWorldOutputError>) -> Void)
```

### `describeWorldExportJob(input:completion:)`

Describes a world export job.

``` swift
public func describeWorldExportJob(input: DescribeWorldExportJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeWorldExportJobOutputResponse, DescribeWorldExportJobOutputError>) -> Void)
```

### `describeWorldGenerationJob(input:completion:)`

Describes a world generation job.

``` swift
public func describeWorldGenerationJob(input: DescribeWorldGenerationJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeWorldGenerationJobOutputResponse, DescribeWorldGenerationJobOutputError>) -> Void)
```

### `describeWorldTemplate(input:completion:)`

Describes a world template.

``` swift
public func describeWorldTemplate(input: DescribeWorldTemplateInput, completion: @escaping (ClientRuntime.SdkResult<DescribeWorldTemplateOutputResponse, DescribeWorldTemplateOutputError>) -> Void)
```

### `getWorldTemplateBody(input:completion:)`

Gets the world template body.

``` swift
public func getWorldTemplateBody(input: GetWorldTemplateBodyInput, completion: @escaping (ClientRuntime.SdkResult<GetWorldTemplateBodyOutputResponse, GetWorldTemplateBodyOutputError>) -> Void)
```

### `listDeploymentJobs(input:completion:)`

Returns a list of deployment jobs for a fleet. You can optionally provide filters to retrieve specific deployment jobs.

``` swift
public func listDeploymentJobs(input: ListDeploymentJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListDeploymentJobsOutputResponse, ListDeploymentJobsOutputError>) -> Void)
```

### `listFleets(input:completion:)`

Returns a list of fleets. You can optionally provide filters to retrieve specific fleets.

``` swift
public func listFleets(input: ListFleetsInput, completion: @escaping (ClientRuntime.SdkResult<ListFleetsOutputResponse, ListFleetsOutputError>) -> Void)
```

### `listRobotApplications(input:completion:)`

Returns a list of robot application. You can optionally provide filters to retrieve specific robot applications.

``` swift
public func listRobotApplications(input: ListRobotApplicationsInput, completion: @escaping (ClientRuntime.SdkResult<ListRobotApplicationsOutputResponse, ListRobotApplicationsOutputError>) -> Void)
```

### `listRobots(input:completion:)`

Returns a list of robots. You can optionally provide filters to retrieve specific robots.

``` swift
public func listRobots(input: ListRobotsInput, completion: @escaping (ClientRuntime.SdkResult<ListRobotsOutputResponse, ListRobotsOutputError>) -> Void)
```

### `listSimulationApplications(input:completion:)`

Returns a list of simulation applications. You can optionally provide filters to retrieve specific simulation applications.

``` swift
public func listSimulationApplications(input: ListSimulationApplicationsInput, completion: @escaping (ClientRuntime.SdkResult<ListSimulationApplicationsOutputResponse, ListSimulationApplicationsOutputError>) -> Void)
```

### `listSimulationJobBatches(input:completion:)`

Returns a list simulation job batches. You can optionally provide filters to retrieve specific simulation batch jobs.

``` swift
public func listSimulationJobBatches(input: ListSimulationJobBatchesInput, completion: @escaping (ClientRuntime.SdkResult<ListSimulationJobBatchesOutputResponse, ListSimulationJobBatchesOutputError>) -> Void)
```

### `listSimulationJobs(input:completion:)`

Returns a list of simulation jobs. You can optionally provide filters to retrieve specific simulation jobs.

``` swift
public func listSimulationJobs(input: ListSimulationJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListSimulationJobsOutputResponse, ListSimulationJobsOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Lists all tags on a AWS RoboMaker resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `listWorldExportJobs(input:completion:)`

Lists world export jobs.

``` swift
public func listWorldExportJobs(input: ListWorldExportJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListWorldExportJobsOutputResponse, ListWorldExportJobsOutputError>) -> Void)
```

### `listWorldGenerationJobs(input:completion:)`

Lists world generator jobs.

``` swift
public func listWorldGenerationJobs(input: ListWorldGenerationJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListWorldGenerationJobsOutputResponse, ListWorldGenerationJobsOutputError>) -> Void)
```

### `listWorldTemplates(input:completion:)`

Lists world templates.

``` swift
public func listWorldTemplates(input: ListWorldTemplatesInput, completion: @escaping (ClientRuntime.SdkResult<ListWorldTemplatesOutputResponse, ListWorldTemplatesOutputError>) -> Void)
```

### `listWorlds(input:completion:)`

Lists worlds.

``` swift
public func listWorlds(input: ListWorldsInput, completion: @escaping (ClientRuntime.SdkResult<ListWorldsOutputResponse, ListWorldsOutputError>) -> Void)
```

### `registerRobot(input:completion:)`

Registers a robot with a fleet.

``` swift
public func registerRobot(input: RegisterRobotInput, completion: @escaping (ClientRuntime.SdkResult<RegisterRobotOutputResponse, RegisterRobotOutputError>) -> Void)
```

### `restartSimulationJob(input:completion:)`

Restarts a running simulation job.

``` swift
public func restartSimulationJob(input: RestartSimulationJobInput, completion: @escaping (ClientRuntime.SdkResult<RestartSimulationJobOutputResponse, RestartSimulationJobOutputError>) -> Void)
```

### `startSimulationJobBatch(input:completion:)`

Starts a new simulation job batch. The batch is defined using one or more SimulationJobRequest objects.

``` swift
public func startSimulationJobBatch(input: StartSimulationJobBatchInput, completion: @escaping (ClientRuntime.SdkResult<StartSimulationJobBatchOutputResponse, StartSimulationJobBatchOutputError>) -> Void)
```

### `syncDeploymentJob(input:completion:)`

Syncrhonizes robots in a fleet to the latest deployment. This is helpful if robots were added after a deployment.

``` swift
public func syncDeploymentJob(input: SyncDeploymentJobInput, completion: @escaping (ClientRuntime.SdkResult<SyncDeploymentJobOutputResponse, SyncDeploymentJobOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Adds or edits tags for a AWS RoboMaker resource. Each tag consists of a tag key and a tag value. Tag keys and tag values are both required, but tag values can be empty strings. For information about the rules that apply to tag keys and tag values, see [User-Defined Tag Restrictions](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/allocation-tag-restrictions.html) in the AWS Billing and Cost Management User Guide.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes the specified tags from the specified AWS RoboMaker resource. To remove a tag, specify the tag key. To change the tag value of an existing tag key, use [TagResource](https://docs.aws.amazon.com/robomaker/latest/dg/API_TagResource.html).

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateRobotApplication(input:completion:)`

Updates a robot application.

``` swift
public func updateRobotApplication(input: UpdateRobotApplicationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRobotApplicationOutputResponse, UpdateRobotApplicationOutputError>) -> Void)
```

### `updateSimulationApplication(input:completion:)`

Updates a simulation application.

``` swift
public func updateSimulationApplication(input: UpdateSimulationApplicationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSimulationApplicationOutputResponse, UpdateSimulationApplicationOutputError>) -> Void)
```

### `updateWorldTemplate(input:completion:)`

Updates a world template.

``` swift
public func updateWorldTemplate(input: UpdateWorldTemplateInput, completion: @escaping (ClientRuntime.SdkResult<UpdateWorldTemplateOutputResponse, UpdateWorldTemplateOutputError>) -> Void)
```
