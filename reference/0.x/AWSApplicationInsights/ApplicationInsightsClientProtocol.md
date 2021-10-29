# ApplicationInsightsClientProtocol

Amazon CloudWatch Application Insights Amazon CloudWatch Application Insights is a service that helps you detect common problems with your applications. It enables you to pinpoint the source of issues in your applications (built with technologies such as Microsoft IIS, .NET, and Microsoft SQL Server), by providing key insights into detected problems. After you onboard your application, CloudWatch Application Insights identifies, recommends, and sets up metrics and logs. It continuously analyzes and correlates your metrics and logs for unusual behavior to surface actionable problems with your application. For example, if your application is slow and unresponsive and leading to HTTP 500 errors in your Application Load Balancer (ALB), Application Insights informs you that a memory pressure problem with your SQL Server database is occurring. It bases this analysis on impactful metrics and log errors.

``` swift
public protocol ApplicationInsightsClientProtocol 
```

## Requirements

### createApplication(input:completion:)

Adds an application that is created from a resource group.

``` swift
func createApplication(input: CreateApplicationInput, completion: @escaping (ClientRuntime.SdkResult<CreateApplicationOutputResponse, CreateApplicationOutputError>) -> Void)
```

### createComponent(input:completion:)

Creates a custom component by grouping similar standalone instances to monitor.

``` swift
func createComponent(input: CreateComponentInput, completion: @escaping (ClientRuntime.SdkResult<CreateComponentOutputResponse, CreateComponentOutputError>) -> Void)
```

### createLogPattern(input:completion:)

Adds an log pattern to a LogPatternSet.

``` swift
func createLogPattern(input: CreateLogPatternInput, completion: @escaping (ClientRuntime.SdkResult<CreateLogPatternOutputResponse, CreateLogPatternOutputError>) -> Void)
```

### deleteApplication(input:completion:)

Removes the specified application from monitoring. Does not delete the application.

``` swift
func deleteApplication(input: DeleteApplicationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteApplicationOutputResponse, DeleteApplicationOutputError>) -> Void)
```

### deleteComponent(input:completion:)

Ungroups a custom component. When you ungroup custom components, all applicable monitors that are set up for the component are removed and the instances revert to their standalone status.

``` swift
func deleteComponent(input: DeleteComponentInput, completion: @escaping (ClientRuntime.SdkResult<DeleteComponentOutputResponse, DeleteComponentOutputError>) -> Void)
```

### deleteLogPattern(input:completion:)

Removes the specified log pattern from a LogPatternSet.

``` swift
func deleteLogPattern(input: DeleteLogPatternInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLogPatternOutputResponse, DeleteLogPatternOutputError>) -> Void)
```

### describeApplication(input:completion:)

Describes the application.

``` swift
func describeApplication(input: DescribeApplicationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeApplicationOutputResponse, DescribeApplicationOutputError>) -> Void)
```

### describeComponent(input:completion:)

Describes a component and lists the resources that are grouped together in a component.

``` swift
func describeComponent(input: DescribeComponentInput, completion: @escaping (ClientRuntime.SdkResult<DescribeComponentOutputResponse, DescribeComponentOutputError>) -> Void)
```

### describeComponentConfiguration(input:completion:)

Describes the monitoring configuration of the component.

``` swift
func describeComponentConfiguration(input: DescribeComponentConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeComponentConfigurationOutputResponse, DescribeComponentConfigurationOutputError>) -> Void)
```

### describeComponentConfigurationRecommendation(input:completion:)

Describes the recommended monitoring configuration of the component.

``` swift
func describeComponentConfigurationRecommendation(input: DescribeComponentConfigurationRecommendationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeComponentConfigurationRecommendationOutputResponse, DescribeComponentConfigurationRecommendationOutputError>) -> Void)
```

### describeLogPattern(input:completion:)

Describe a specific log pattern from a LogPatternSet.

``` swift
func describeLogPattern(input: DescribeLogPatternInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLogPatternOutputResponse, DescribeLogPatternOutputError>) -> Void)
```

### describeObservation(input:completion:)

Describes an anomaly or error with the application.

``` swift
func describeObservation(input: DescribeObservationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeObservationOutputResponse, DescribeObservationOutputError>) -> Void)
```

### describeProblem(input:completion:)

Describes an application problem.

``` swift
func describeProblem(input: DescribeProblemInput, completion: @escaping (ClientRuntime.SdkResult<DescribeProblemOutputResponse, DescribeProblemOutputError>) -> Void)
```

### describeProblemObservations(input:completion:)

Describes the anomalies or errors associated with the problem.

``` swift
func describeProblemObservations(input: DescribeProblemObservationsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeProblemObservationsOutputResponse, DescribeProblemObservationsOutputError>) -> Void)
```

### listApplications(input:completion:)

Lists the IDs of the applications that you are monitoring.

``` swift
func listApplications(input: ListApplicationsInput, completion: @escaping (ClientRuntime.SdkResult<ListApplicationsOutputResponse, ListApplicationsOutputError>) -> Void)
```

### listComponents(input:completion:)

Lists the auto-grouped, standalone, and custom components of the application.

``` swift
func listComponents(input: ListComponentsInput, completion: @escaping (ClientRuntime.SdkResult<ListComponentsOutputResponse, ListComponentsOutputError>) -> Void)
```

### listConfigurationHistory(input:completion:)

Lists the INFO, WARN, and ERROR events for periodic configuration updates performed by Application Insights. Examples of events represented are:

``` swift
func listConfigurationHistory(input: ListConfigurationHistoryInput, completion: @escaping (ClientRuntime.SdkResult<ListConfigurationHistoryOutputResponse, ListConfigurationHistoryOutputError>) -> Void)
```

  - INFO: creating a new alarm or updating an alarm threshold.

  - WARN: alarm not created due to insufficient data points used to predict thresholds.

  - ERROR: alarm not created due to permission errors or exceeding quotas.

### listLogPatterns(input:completion:)

Lists the log patterns in the specific log LogPatternSet.

``` swift
func listLogPatterns(input: ListLogPatternsInput, completion: @escaping (ClientRuntime.SdkResult<ListLogPatternsOutputResponse, ListLogPatternsOutputError>) -> Void)
```

### listLogPatternSets(input:completion:)

Lists the log pattern sets in the specific application.

``` swift
func listLogPatternSets(input: ListLogPatternSetsInput, completion: @escaping (ClientRuntime.SdkResult<ListLogPatternSetsOutputResponse, ListLogPatternSetsOutputError>) -> Void)
```

### listProblems(input:completion:)

Lists the problems with your application.

``` swift
func listProblems(input: ListProblemsInput, completion: @escaping (ClientRuntime.SdkResult<ListProblemsOutputResponse, ListProblemsOutputError>) -> Void)
```

### listTagsForResource(input:completion:)

Retrieve a list of the tags (keys and values) that are associated with a specified application. A tag is a label that you optionally define and associate with an application. Each tag consists of a required tag key and an optional associated tag value. A tag key is a general label that acts as a category for more specific tag values. A tag value acts as a descriptor within a tag key.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### tagResource(input:completion:)

Add one or more tags (keys and values) to a specified application. A tag is a label that you optionally define and associate with an application. Tags can help you categorize and manage application in different ways, such as by purpose, owner, environment, or other criteria. Each tag consists of a required tag key and an associated tag value, both of which you define. A tag key is a general label that acts as a category for more specific tag values. A tag value acts as a descriptor within a tag key.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:completion:)

Remove one or more tags (keys and values) from a specified application.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateApplication(input:completion:)

Updates the application.

``` swift
func updateApplication(input: UpdateApplicationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateApplicationOutputResponse, UpdateApplicationOutputError>) -> Void)
```

### updateComponent(input:completion:)

Updates the custom component name and/or the list of resources that make up the component.

``` swift
func updateComponent(input: UpdateComponentInput, completion: @escaping (ClientRuntime.SdkResult<UpdateComponentOutputResponse, UpdateComponentOutputError>) -> Void)
```

### updateComponentConfiguration(input:completion:)

Updates the monitoring configurations for the component. The configuration input parameter is an escaped JSON of the configuration and should match the schema of what is returned by DescribeComponentConfigurationRecommendation.

``` swift
func updateComponentConfiguration(input: UpdateComponentConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateComponentConfigurationOutputResponse, UpdateComponentConfigurationOutputError>) -> Void)
```

### updateLogPattern(input:completion:)

Adds a log pattern to a LogPatternSet.

``` swift
func updateLogPattern(input: UpdateLogPatternInput, completion: @escaping (ClientRuntime.SdkResult<UpdateLogPatternOutputResponse, UpdateLogPatternOutputError>) -> Void)
```
