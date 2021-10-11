# KinesisAnalyticsV2ClientProtocol

Amazon Kinesis Data Analytics is a fully managed service that you can use to process and analyze streaming data using Java, SQL, or Scala. The service
enables you to quickly author and run Java, SQL, or Scala code against streaming sources to perform time
series analytics, feed real-time dashboards, and create real-time metrics.

``` swift
public protocol KinesisAnalyticsV2ClientProtocol 
```

## Requirements

### addApplicationCloudWatchLoggingOption(input:​completion:​)

Adds an Amazon CloudWatch log stream to monitor application configuration errors.

``` swift
func addApplicationCloudWatchLoggingOption(input: AddApplicationCloudWatchLoggingOptionInput, completion: @escaping (ClientRuntime.SdkResult<AddApplicationCloudWatchLoggingOptionOutputResponse, AddApplicationCloudWatchLoggingOptionOutputError>) -> Void)
```

### addApplicationInput(input:​completion:​)

Adds a streaming source to your SQL-based Kinesis Data Analytics application.

``` swift
func addApplicationInput(input: AddApplicationInputInput, completion: @escaping (ClientRuntime.SdkResult<AddApplicationInputOutputResponse, AddApplicationInputOutputError>) -> Void)
```

You can add a streaming source when you create an application, or you can use this
operation to add a streaming source after you create an application. For more information, see
CreateApplication.
Any configuration update, including adding a streaming source using this operation,
results in a new version of the application. You can use the DescribeApplication operation
to find the current application version.

### addApplicationInputProcessingConfiguration(input:​completion:​)

Adds an InputProcessingConfiguration to a SQL-based Kinesis Data Analytics application. An input processor pre-processes records
on the input stream before the
application's SQL code executes. Currently, the only input processor available is <a href="https:​//docs.aws.amazon.com/lambda/">AWS Lambda.

``` swift
func addApplicationInputProcessingConfiguration(input: AddApplicationInputProcessingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<AddApplicationInputProcessingConfigurationOutputResponse, AddApplicationInputProcessingConfigurationOutputError>) -> Void)
```

### addApplicationOutput(input:​completion:​)

Adds an external destination to your SQL-based Kinesis Data Analytics application.
If you want Kinesis Data Analytics to deliver data from an in-application stream within
your application to an external destination (such as an Kinesis data stream, a Kinesis Data
Firehose delivery stream, or an AWS Lambda function), you add the relevant configuration to
your application using this operation. You can configure one or more outputs for your
application. Each output configuration maps an in-application stream and an external
destination.
You can use one of the output configurations to deliver data from your
in-application error stream to an external destination so that you can analyze the
errors.
Any configuration update, including adding a streaming source using this
operation, results in a new version of the application. You can use the DescribeApplication operation to find the current application
version.

``` swift
func addApplicationOutput(input: AddApplicationOutputInput, completion: @escaping (ClientRuntime.SdkResult<AddApplicationOutputOutputResponse, AddApplicationOutputOutputError>) -> Void)
```

### addApplicationReferenceDataSource(input:​completion:​)

Adds a reference data source to an existing SQL-based Kinesis Data Analytics application.
Kinesis Data Analytics reads reference data (that is, an Amazon S3 object) and creates an
in-application table within your application. In the request, you provide the source (S3
bucket name and object key name), name of the in-application table to create, and the
necessary mapping information that describes how data in an Amazon S3 object maps to columns
in the resulting in-application table.

``` swift
func addApplicationReferenceDataSource(input: AddApplicationReferenceDataSourceInput, completion: @escaping (ClientRuntime.SdkResult<AddApplicationReferenceDataSourceOutputResponse, AddApplicationReferenceDataSourceOutputError>) -> Void)
```

### addApplicationVpcConfiguration(input:​completion:​)

Adds a Virtual Private Cloud (VPC) configuration to the application. Applications can use VPCs to store
and access resources securely.
Note the following about VPC configurations for Kinesis Data Analytics applications:​

``` swift
func addApplicationVpcConfiguration(input: AddApplicationVpcConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<AddApplicationVpcConfigurationOutputResponse, AddApplicationVpcConfigurationOutputError>) -> Void)
```

``` 
           VPC configurations are not supported for SQL applications.


           When a VPC is added to a Kinesis Data Analytics application, the application can no longer be accessed from the
       Internet directly. To enable Internet access to the application, add an Internet gateway to your VPC.
```

### createApplication(input:​completion:​)

Creates a Kinesis Data Analytics application. For information about creating a
Kinesis Data Analytics application, see <a href="https:​//docs.aws.amazon.com/kinesisanalytics/latest/java/getting-started.html">Creating an
Application.

``` swift
func createApplication(input: CreateApplicationInput, completion: @escaping (ClientRuntime.SdkResult<CreateApplicationOutputResponse, CreateApplicationOutputError>) -> Void)
```

### createApplicationPresignedUrl(input:​completion:​)

Creates and returns a URL that you can use to connect to
an application's extension. Currently, the only
available extension is the Apache Flink dashboard.
The IAM role or user used to call this API defines the permissions to access the
extension. After the presigned URL is created, no additional permission is required to access
this URL. IAM authorization policies for this API are also enforced for every HTTP request
that attempts to connect to the extension.
You    control the amount of time that the URL will be valid using the SessionExpirationDurationInSeconds
parameter. If you do not provide this parameter, the returned URL is valid for twelve hours.

``` swift
func createApplicationPresignedUrl(input: CreateApplicationPresignedUrlInput, completion: @escaping (ClientRuntime.SdkResult<CreateApplicationPresignedUrlOutputResponse, CreateApplicationPresignedUrlOutputError>) -> Void)
```

``` 
        The URL that you get from a call to CreateApplicationPresignedUrl must be used within 3 minutes
        to be valid.
        If you first try to use the URL after the 3-minute limit expires, the service returns an HTTP 403 Forbidden error.
```

### createApplicationSnapshot(input:​completion:​)

Creates a snapshot of the application's state data.

``` swift
func createApplicationSnapshot(input: CreateApplicationSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<CreateApplicationSnapshotOutputResponse, CreateApplicationSnapshotOutputError>) -> Void)
```

### deleteApplication(input:​completion:​)

Deletes the specified application. Kinesis Data Analytics halts application execution and deletes the application.

``` swift
func deleteApplication(input: DeleteApplicationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteApplicationOutputResponse, DeleteApplicationOutputError>) -> Void)
```

### deleteApplicationCloudWatchLoggingOption(input:​completion:​)

Deletes an Amazon CloudWatch log stream from an Kinesis Data Analytics application.

``` swift
func deleteApplicationCloudWatchLoggingOption(input: DeleteApplicationCloudWatchLoggingOptionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteApplicationCloudWatchLoggingOptionOutputResponse, DeleteApplicationCloudWatchLoggingOptionOutputError>) -> Void)
```

### deleteApplicationInputProcessingConfiguration(input:​completion:​)

Deletes an InputProcessingConfiguration from an input.

``` swift
func deleteApplicationInputProcessingConfiguration(input: DeleteApplicationInputProcessingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteApplicationInputProcessingConfigurationOutputResponse, DeleteApplicationInputProcessingConfigurationOutputError>) -> Void)
```

### deleteApplicationOutput(input:​completion:​)

Deletes the output destination configuration from your SQL-based Kinesis Data Analytics application's configuration.
Kinesis Data Analytics will no longer write data from
the corresponding in-application stream to the external output destination.

``` swift
func deleteApplicationOutput(input: DeleteApplicationOutputInput, completion: @escaping (ClientRuntime.SdkResult<DeleteApplicationOutputOutputResponse, DeleteApplicationOutputOutputError>) -> Void)
```

### deleteApplicationReferenceDataSource(input:​completion:​)

Deletes a reference data source configuration from the specified SQL-based Kinesis Data Analytics application's configuration.
If the application is running, Kinesis Data Analytics immediately removes the in-application table
that you created using the AddApplicationReferenceDataSource operation.

``` swift
func deleteApplicationReferenceDataSource(input: DeleteApplicationReferenceDataSourceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteApplicationReferenceDataSourceOutputResponse, DeleteApplicationReferenceDataSourceOutputError>) -> Void)
```

### deleteApplicationSnapshot(input:​completion:​)

Deletes a snapshot of application state.

``` swift
func deleteApplicationSnapshot(input: DeleteApplicationSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<DeleteApplicationSnapshotOutputResponse, DeleteApplicationSnapshotOutputError>) -> Void)
```

### deleteApplicationVpcConfiguration(input:​completion:​)

Removes a VPC configuration from a Kinesis Data Analytics application.

``` swift
func deleteApplicationVpcConfiguration(input: DeleteApplicationVpcConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteApplicationVpcConfigurationOutputResponse, DeleteApplicationVpcConfigurationOutputError>) -> Void)
```

### describeApplication(input:​completion:​)

Returns information about a specific Kinesis Data Analytics application.
If you want to retrieve a list of all applications in your account,
use the ListApplications operation.

``` swift
func describeApplication(input: DescribeApplicationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeApplicationOutputResponse, DescribeApplicationOutputError>) -> Void)
```

### describeApplicationSnapshot(input:​completion:​)

Returns information about a snapshot of application state data.

``` swift
func describeApplicationSnapshot(input: DescribeApplicationSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<DescribeApplicationSnapshotOutputResponse, DescribeApplicationSnapshotOutputError>) -> Void)
```

### describeApplicationVersion(input:​completion:​)

Provides a detailed description of a specified version of the application. To see a list of all the versions of an application, invoke the ListApplicationVersions operation.

``` swift
func describeApplicationVersion(input: DescribeApplicationVersionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeApplicationVersionOutputResponse, DescribeApplicationVersionOutputError>) -> Void)
```

``` 
        This operation is supported only for Amazon Kinesis Data Analytics for Apache Flink.
```

### discoverInputSchema(input:​completion:​)

Infers a schema for a SQL-based Kinesis Data Analytics application by evaluating
sample records on the specified streaming source (Kinesis data stream or Kinesis Data Firehose
delivery stream) or Amazon S3 object. In the response, the operation returns the inferred
schema and also the sample records that the operation used to infer the schema.
You can use the inferred schema when configuring a streaming source for your application.
When you create an application using the Kinesis Data Analytics console, the console uses this
operation to infer a schema and show it in the console user interface.

``` swift
func discoverInputSchema(input: DiscoverInputSchemaInput, completion: @escaping (ClientRuntime.SdkResult<DiscoverInputSchemaOutputResponse, DiscoverInputSchemaOutputError>) -> Void)
```

### listApplications(input:​completion:​)

Returns a list of Kinesis Data Analytics applications in your account. For each
application, the response includes the application name, Amazon Resource Name (ARN), and
status.
If you want detailed information about a specific application, use
DescribeApplication.

``` swift
func listApplications(input: ListApplicationsInput, completion: @escaping (ClientRuntime.SdkResult<ListApplicationsOutputResponse, ListApplicationsOutputError>) -> Void)
```

### listApplicationSnapshots(input:​completion:​)

Lists information about the current application snapshots.

``` swift
func listApplicationSnapshots(input: ListApplicationSnapshotsInput, completion: @escaping (ClientRuntime.SdkResult<ListApplicationSnapshotsOutputResponse, ListApplicationSnapshotsOutputError>) -> Void)
```

### listApplicationVersions(input:​completion:​)

Lists all the versions for the specified application, including versions that were rolled back. The response also includes a summary of the configuration
associated with each version.

``` swift
func listApplicationVersions(input: ListApplicationVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListApplicationVersionsOutputResponse, ListApplicationVersionsOutputError>) -> Void)
```

``` 
     To get the complete description of a specific application version, invoke the DescribeApplicationVersion operation.

        This operation is supported only for Amazon Kinesis Data Analytics for Apache Flink.
```

### listTagsForResource(input:​completion:​)

Retrieves the list of key-value tags assigned to the application. For more information, see
<a href="https:​//docs.aws.amazon.com/kinesisanalytics/latest/java/how-tagging.html">Using Tagging.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### rollbackApplication(input:​completion:​)

Reverts the application to the previous running version. You can
roll back an application if you suspect it is stuck in a transient status.
You can roll back an application only if it is in the UPDATING
or AUTOSCALING status.
When you rollback an application, it loads state data from the last successful snapshot.
If the application has no snapshots, Kinesis Data Analytics rejects the rollback request.
This action is not supported for Kinesis Data Analytics for SQL applications.

``` swift
func rollbackApplication(input: RollbackApplicationInput, completion: @escaping (ClientRuntime.SdkResult<RollbackApplicationOutputResponse, RollbackApplicationOutputError>) -> Void)
```

### startApplication(input:​completion:​)

Starts the specified Kinesis Data Analytics application. After creating an application, you must exclusively call this operation to
start your application.

``` swift
func startApplication(input: StartApplicationInput, completion: @escaping (ClientRuntime.SdkResult<StartApplicationOutputResponse, StartApplicationOutputError>) -> Void)
```

### stopApplication(input:​completion:​)

Stops the application from processing data. You can stop
an application only if it is in the running status, unless you set the Force
parameter to true.
You can use the DescribeApplication operation to find the application status.

``` swift
func stopApplication(input: StopApplicationInput, completion: @escaping (ClientRuntime.SdkResult<StopApplicationOutputResponse, StopApplicationOutputError>) -> Void)
```

``` 
     Kinesis Data Analytics takes a snapshot when the application is stopped, unless Force is set
      to true.
```

### tagResource(input:​completion:​)

Adds one or more key-value tags to a Kinesis Data Analytics application. Note that the maximum number of application
tags includes system tags. The maximum number of user-defined application tags is 50.
For more information, see <a href="https:​//docs.aws.amazon.com/kinesisanalytics/latest/java/how-tagging.html">Using Tagging.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:​completion:​)

Removes one or more tags from a Kinesis Data Analytics application. For more information, see
<a href="https:​//docs.aws.amazon.com/kinesisanalytics/latest/java/how-tagging.html">Using Tagging.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateApplication(input:​completion:​)

Updates an existing Kinesis Data Analytics application. Using this operation, you
can update application code, input configuration, and output configuration.
Kinesis Data Analytics updates the ApplicationVersionId each time you update
your application.

``` swift
func updateApplication(input: UpdateApplicationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateApplicationOutputResponse, UpdateApplicationOutputError>) -> Void)
```

``` 
        You cannot update the RuntimeEnvironment of an existing application. If you
need to update an application's RuntimeEnvironment, you must delete the application
and create it again.
```

### updateApplicationMaintenanceConfiguration(input:​completion:​)

Updates the maintenance configuration of the Kinesis Data Analytics application.
You can invoke this operation on an application that is in one of the two following
states:​ READY or RUNNING. If you invoke it when the application is
in a state other than these two states, it throws a ResourceInUseException. The
service makes use of the updated configuration the next time it schedules maintenance for the
application. If you invoke this operation after the service schedules maintenance, the service
will apply the configuration update the next time it schedules maintenance for the
application. This means that you might not see the maintenance configuration update applied to
the maintenance process that follows a successful invocation of this operation, but to the
following maintenance process instead.
To see the current maintenance configuration of your application, invoke the
DescribeApplication operation.
For information about application maintenance, see <a href="https:​//docs.aws.amazon.com/kinesisanalytics/latest/java/maintenance.html">Kinesis Data Analytics for Apache Flink Maintenance.

``` swift
func updateApplicationMaintenanceConfiguration(input: UpdateApplicationMaintenanceConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateApplicationMaintenanceConfigurationOutputResponse, UpdateApplicationMaintenanceConfigurationOutputError>) -> Void)
```

``` 
        This operation is supported only for Amazon Kinesis Data Analytics for Apache Flink.
```
