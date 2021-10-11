# DataBrewClientProtocol

Glue DataBrew is a visual, cloud-scale data-preparation service. DataBrew
simplifies data preparation tasks, targeting data issues that are hard to spot and
time-consuming to fix. DataBrew empowers users of all technical levels to visualize the
data and perform one-click data transformations, with no coding required.

``` swift
public protocol DataBrewClientProtocol 
```

## Requirements

### batchDeleteRecipeVersion(input:​completion:​)

Deletes one or more versions of a recipe at a time.

``` swift
func batchDeleteRecipeVersion(input: BatchDeleteRecipeVersionInput, completion: @escaping (ClientRuntime.SdkResult<BatchDeleteRecipeVersionOutputResponse, BatchDeleteRecipeVersionOutputError>) -> Void)
```

``` 
    The entire request will be rejected if:


            The recipe does not exist.


            There is an invalid version identifier in the list of versions.


            The version list is empty.


            The version list size exceeds 50.


            The version list contains duplicate entries.



    The request will complete successfully, but with partial failures, if:


            A version does not exist.


            A version is being used by a job.


            You specify LATEST_WORKING, but it's being used by a
                project.


            The version fails to be deleted.


    The LATEST_WORKING version will only be deleted if the recipe has no
        other versions. If you try to delete LATEST_WORKING while other versions
        exist (or if they can't be deleted), then LATEST_WORKING will be listed as
        partial failure in the response.
```

### createDataset(input:​completion:​)

Creates a new DataBrew dataset.

``` swift
func createDataset(input: CreateDatasetInput, completion: @escaping (ClientRuntime.SdkResult<CreateDatasetOutputResponse, CreateDatasetOutputError>) -> Void)
```

### createProfileJob(input:​completion:​)

Creates a new job to analyze a dataset and create its data profile.

``` swift
func createProfileJob(input: CreateProfileJobInput, completion: @escaping (ClientRuntime.SdkResult<CreateProfileJobOutputResponse, CreateProfileJobOutputError>) -> Void)
```

### createProject(input:​completion:​)

Creates a new DataBrew project.

``` swift
func createProject(input: CreateProjectInput, completion: @escaping (ClientRuntime.SdkResult<CreateProjectOutputResponse, CreateProjectOutputError>) -> Void)
```

### createRecipe(input:​completion:​)

Creates a new DataBrew recipe.

``` swift
func createRecipe(input: CreateRecipeInput, completion: @escaping (ClientRuntime.SdkResult<CreateRecipeOutputResponse, CreateRecipeOutputError>) -> Void)
```

### createRecipeJob(input:​completion:​)

Creates a new job to transform input data, using steps defined in an existing Glue DataBrew recipe

``` swift
func createRecipeJob(input: CreateRecipeJobInput, completion: @escaping (ClientRuntime.SdkResult<CreateRecipeJobOutputResponse, CreateRecipeJobOutputError>) -> Void)
```

### createSchedule(input:​completion:​)

Creates a new schedule for one or more DataBrew jobs. Jobs can be run at a specific
date and time, or at regular intervals.

``` swift
func createSchedule(input: CreateScheduleInput, completion: @escaping (ClientRuntime.SdkResult<CreateScheduleOutputResponse, CreateScheduleOutputError>) -> Void)
```

### deleteDataset(input:​completion:​)

Deletes a dataset from DataBrew.

``` swift
func deleteDataset(input: DeleteDatasetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDatasetOutputResponse, DeleteDatasetOutputError>) -> Void)
```

### deleteJob(input:​completion:​)

Deletes the specified DataBrew job.

``` swift
func deleteJob(input: DeleteJobInput, completion: @escaping (ClientRuntime.SdkResult<DeleteJobOutputResponse, DeleteJobOutputError>) -> Void)
```

### deleteProject(input:​completion:​)

Deletes an existing DataBrew project.

``` swift
func deleteProject(input: DeleteProjectInput, completion: @escaping (ClientRuntime.SdkResult<DeleteProjectOutputResponse, DeleteProjectOutputError>) -> Void)
```

### deleteRecipeVersion(input:​completion:​)

Deletes a single version of a DataBrew recipe.

``` swift
func deleteRecipeVersion(input: DeleteRecipeVersionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRecipeVersionOutputResponse, DeleteRecipeVersionOutputError>) -> Void)
```

### deleteSchedule(input:​completion:​)

Deletes the specified DataBrew schedule.

``` swift
func deleteSchedule(input: DeleteScheduleInput, completion: @escaping (ClientRuntime.SdkResult<DeleteScheduleOutputResponse, DeleteScheduleOutputError>) -> Void)
```

### describeDataset(input:​completion:​)

Returns the definition of a specific DataBrew dataset.

``` swift
func describeDataset(input: DescribeDatasetInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDatasetOutputResponse, DescribeDatasetOutputError>) -> Void)
```

### describeJob(input:​completion:​)

Returns the definition of a specific DataBrew job.

``` swift
func describeJob(input: DescribeJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeJobOutputResponse, DescribeJobOutputError>) -> Void)
```

### describeJobRun(input:​completion:​)

Represents one run of a DataBrew job.

``` swift
func describeJobRun(input: DescribeJobRunInput, completion: @escaping (ClientRuntime.SdkResult<DescribeJobRunOutputResponse, DescribeJobRunOutputError>) -> Void)
```

### describeProject(input:​completion:​)

Returns the definition of a specific DataBrew project.

``` swift
func describeProject(input: DescribeProjectInput, completion: @escaping (ClientRuntime.SdkResult<DescribeProjectOutputResponse, DescribeProjectOutputError>) -> Void)
```

### describeRecipe(input:​completion:​)

Returns the definition of a specific DataBrew recipe corresponding to a particular
version.

``` swift
func describeRecipe(input: DescribeRecipeInput, completion: @escaping (ClientRuntime.SdkResult<DescribeRecipeOutputResponse, DescribeRecipeOutputError>) -> Void)
```

### describeSchedule(input:​completion:​)

Returns the definition of a specific DataBrew schedule.

``` swift
func describeSchedule(input: DescribeScheduleInput, completion: @escaping (ClientRuntime.SdkResult<DescribeScheduleOutputResponse, DescribeScheduleOutputError>) -> Void)
```

### listDatasets(input:​completion:​)

Lists all of the DataBrew datasets.

``` swift
func listDatasets(input: ListDatasetsInput, completion: @escaping (ClientRuntime.SdkResult<ListDatasetsOutputResponse, ListDatasetsOutputError>) -> Void)
```

### listJobRuns(input:​completion:​)

Lists all of the previous runs of a particular DataBrew job.

``` swift
func listJobRuns(input: ListJobRunsInput, completion: @escaping (ClientRuntime.SdkResult<ListJobRunsOutputResponse, ListJobRunsOutputError>) -> Void)
```

### listJobs(input:​completion:​)

Lists all of the DataBrew jobs that are defined.

``` swift
func listJobs(input: ListJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListJobsOutputResponse, ListJobsOutputError>) -> Void)
```

### listProjects(input:​completion:​)

Lists all of the DataBrew projects that are defined.

``` swift
func listProjects(input: ListProjectsInput, completion: @escaping (ClientRuntime.SdkResult<ListProjectsOutputResponse, ListProjectsOutputError>) -> Void)
```

### listRecipes(input:​completion:​)

Lists all of the DataBrew recipes that are defined.

``` swift
func listRecipes(input: ListRecipesInput, completion: @escaping (ClientRuntime.SdkResult<ListRecipesOutputResponse, ListRecipesOutputError>) -> Void)
```

### listRecipeVersions(input:​completion:​)

Lists the versions of a particular DataBrew recipe, except for
LATEST\_WORKING.

``` swift
func listRecipeVersions(input: ListRecipeVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListRecipeVersionsOutputResponse, ListRecipeVersionsOutputError>) -> Void)
```

### listSchedules(input:​completion:​)

Lists the DataBrew schedules that are defined.

``` swift
func listSchedules(input: ListSchedulesInput, completion: @escaping (ClientRuntime.SdkResult<ListSchedulesOutputResponse, ListSchedulesOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

Lists all the tags for a DataBrew resource.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### publishRecipe(input:​completion:​)

Publishes a new version of a DataBrew recipe.

``` swift
func publishRecipe(input: PublishRecipeInput, completion: @escaping (ClientRuntime.SdkResult<PublishRecipeOutputResponse, PublishRecipeOutputError>) -> Void)
```

### sendProjectSessionAction(input:​completion:​)

Performs a recipe step within an interactive DataBrew session that's currently
open.

``` swift
func sendProjectSessionAction(input: SendProjectSessionActionInput, completion: @escaping (ClientRuntime.SdkResult<SendProjectSessionActionOutputResponse, SendProjectSessionActionOutputError>) -> Void)
```

### startJobRun(input:​completion:​)

Runs a DataBrew job.

``` swift
func startJobRun(input: StartJobRunInput, completion: @escaping (ClientRuntime.SdkResult<StartJobRunOutputResponse, StartJobRunOutputError>) -> Void)
```

### startProjectSession(input:​completion:​)

Creates an interactive session, enabling you to manipulate data in a DataBrew
project.

``` swift
func startProjectSession(input: StartProjectSessionInput, completion: @escaping (ClientRuntime.SdkResult<StartProjectSessionOutputResponse, StartProjectSessionOutputError>) -> Void)
```

### stopJobRun(input:​completion:​)

Stops a particular run of a job.

``` swift
func stopJobRun(input: StopJobRunInput, completion: @escaping (ClientRuntime.SdkResult<StopJobRunOutputResponse, StopJobRunOutputError>) -> Void)
```

### tagResource(input:​completion:​)

Adds metadata tags to a DataBrew resource, such as a dataset, project, recipe, job, or
schedule.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:​completion:​)

Removes metadata tags from a DataBrew resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateDataset(input:​completion:​)

Modifies the definition of an existing DataBrew dataset.

``` swift
func updateDataset(input: UpdateDatasetInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDatasetOutputResponse, UpdateDatasetOutputError>) -> Void)
```

### updateProfileJob(input:​completion:​)

Modifies the definition of an existing profile job.

``` swift
func updateProfileJob(input: UpdateProfileJobInput, completion: @escaping (ClientRuntime.SdkResult<UpdateProfileJobOutputResponse, UpdateProfileJobOutputError>) -> Void)
```

### updateProject(input:​completion:​)

Modifies the definition of an existing DataBrew project.

``` swift
func updateProject(input: UpdateProjectInput, completion: @escaping (ClientRuntime.SdkResult<UpdateProjectOutputResponse, UpdateProjectOutputError>) -> Void)
```

### updateRecipe(input:​completion:​)

Modifies the definition of the LATEST\_WORKING version of a DataBrew
recipe.

``` swift
func updateRecipe(input: UpdateRecipeInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRecipeOutputResponse, UpdateRecipeOutputError>) -> Void)
```

### updateRecipeJob(input:​completion:​)

Modifies the definition of an existing DataBrew recipe job.

``` swift
func updateRecipeJob(input: UpdateRecipeJobInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRecipeJobOutputResponse, UpdateRecipeJobOutputError>) -> Void)
```

### updateSchedule(input:​completion:​)

Modifies the definition of an existing DataBrew schedule.

``` swift
func updateSchedule(input: UpdateScheduleInput, completion: @escaping (ClientRuntime.SdkResult<UpdateScheduleOutputResponse, UpdateScheduleOutputError>) -> Void)
```
