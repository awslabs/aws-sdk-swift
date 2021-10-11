# ComputeOptimizerClientProtocol

Compute Optimizer is a service that analyzes the configuration and utilization
metrics of your Amazon Web Services compute resources, such as Amazon EC2
instances, Amazon EC2 Auto Scaling groups, Lambda functions, and Amazon EBS volumes. It reports whether your resources are optimal, and generates
optimization recommendations to reduce the cost and improve the performance of your
workloads. Compute Optimizer also provides recent utilization metric data, in addition
to projected utilization metric data for the recommendations, which you can use to
evaluate which recommendation provides the best price-performance trade-off. The
analysis of your usage patterns can help you decide when to move or resize your running
resources, and still meet your performance and capacity requirements. For more
information about Compute Optimizer, including the required permissions to use the
service, see the <a href="https:​//docs.aws.amazon.com/compute-optimizer/latest/ug/">Compute Optimizer User Guide.

``` swift
public protocol ComputeOptimizerClientProtocol 
```

## Requirements

### describeRecommendationExportJobs(input:​completion:​)

Describes recommendation export jobs created in the last seven days.

``` swift
func describeRecommendationExportJobs(input: DescribeRecommendationExportJobsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeRecommendationExportJobsOutputResponse, DescribeRecommendationExportJobsOutputError>) -> Void)
```

``` 
    Use the ExportAutoScalingGroupRecommendations or ExportEC2InstanceRecommendations actions to request an export of your
        recommendations. Then use the DescribeRecommendationExportJobs action
        to view your export jobs.
```

### exportAutoScalingGroupRecommendations(input:​completion:​)

Exports optimization recommendations for Auto Scaling groups.

``` swift
func exportAutoScalingGroupRecommendations(input: ExportAutoScalingGroupRecommendationsInput, completion: @escaping (ClientRuntime.SdkResult<ExportAutoScalingGroupRecommendationsOutputResponse, ExportAutoScalingGroupRecommendationsOutputError>) -> Void)
```

``` 
    Recommendations are exported in a comma-separated values (.csv) file, and its metadata
        in a JavaScript Object Notation (JSON) (.json) file, to an existing Amazon Simple Storage Service (Amazon S3) bucket that you specify. For more information, see <a href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html">Exporting
            Recommendations in the Compute Optimizer User
        Guide.

    You can have only one Auto Scaling group export job in progress per Amazon Web Services Region.
```

### exportEBSVolumeRecommendations(input:​completion:​)

Exports optimization recommendations for Amazon EBS volumes.

``` swift
func exportEBSVolumeRecommendations(input: ExportEBSVolumeRecommendationsInput, completion: @escaping (ClientRuntime.SdkResult<ExportEBSVolumeRecommendationsOutputResponse, ExportEBSVolumeRecommendationsOutputError>) -> Void)
```

``` 
    Recommendations are exported in a comma-separated values (.csv) file, and its metadata
        in a JavaScript Object Notation (JSON)   (.json) file, to an existing Amazon Simple Storage Service (Amazon S3) bucket that you specify. For more information, see
            <a href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html">Exporting
            Recommendations in the Compute Optimizer User
        Guide.

    You can have only one Amazon EBS volume export job in progress per Amazon Web Services Region.
```

### exportEC2InstanceRecommendations(input:​completion:​)

Exports optimization recommendations for Amazon EC2 instances.

``` swift
func exportEC2InstanceRecommendations(input: ExportEC2InstanceRecommendationsInput, completion: @escaping (ClientRuntime.SdkResult<ExportEC2InstanceRecommendationsOutputResponse, ExportEC2InstanceRecommendationsOutputError>) -> Void)
```

``` 
    Recommendations are exported in a comma-separated values (.csv) file, and its metadata
        in a JavaScript Object Notation (JSON)   (.json) file, to an existing Amazon Simple Storage Service (Amazon S3) bucket that you specify. For more information, see
            <a href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html">Exporting
            Recommendations in the Compute Optimizer User
        Guide.

    You can have only one Amazon EC2 instance export job in progress per Amazon Web Services Region.
```

### exportLambdaFunctionRecommendations(input:​completion:​)

Exports optimization recommendations for Lambda functions.

``` swift
func exportLambdaFunctionRecommendations(input: ExportLambdaFunctionRecommendationsInput, completion: @escaping (ClientRuntime.SdkResult<ExportLambdaFunctionRecommendationsOutputResponse, ExportLambdaFunctionRecommendationsOutputError>) -> Void)
```

``` 
    Recommendations are exported in a comma-separated values (.csv) file, and its metadata
        in a JavaScript Object Notation (JSON)   (.json) file, to an existing Amazon Simple Storage Service (Amazon S3) bucket that you specify. For more information, see
            <a href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html">Exporting
            Recommendations in the Compute Optimizer User
        Guide.

    You can have only one Lambda function export job in progress per Amazon Web Services Region.
```

### getAutoScalingGroupRecommendations(input:​completion:​)

Returns Auto Scaling group recommendations.

``` swift
func getAutoScalingGroupRecommendations(input: GetAutoScalingGroupRecommendationsInput, completion: @escaping (ClientRuntime.SdkResult<GetAutoScalingGroupRecommendationsOutputResponse, GetAutoScalingGroupRecommendationsOutputError>) -> Void)
```

``` 
    Compute Optimizer generates recommendations for Amazon EC2 Auto Scaling groups that
        meet a specific set of requirements. For more information, see the <a href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/requirements.html">Supported
            resources and requirements in the Compute Optimizer User
            Guide.
```

### getEBSVolumeRecommendations(input:​completion:​)

Returns Amazon Elastic Block Store (Amazon EBS) volume recommendations.

``` swift
func getEBSVolumeRecommendations(input: GetEBSVolumeRecommendationsInput, completion: @escaping (ClientRuntime.SdkResult<GetEBSVolumeRecommendationsOutputResponse, GetEBSVolumeRecommendationsOutputError>) -> Void)
```

``` 
    Compute Optimizer generates recommendations for Amazon EBS volumes that
        meet a specific set of requirements. For more information, see the <a href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/requirements.html">Supported
            resources and requirements in the Compute Optimizer User
            Guide.
```

### getEC2InstanceRecommendations(input:​completion:​)

Returns Amazon EC2 instance recommendations.

``` swift
func getEC2InstanceRecommendations(input: GetEC2InstanceRecommendationsInput, completion: @escaping (ClientRuntime.SdkResult<GetEC2InstanceRecommendationsOutputResponse, GetEC2InstanceRecommendationsOutputError>) -> Void)
```

``` 
    Compute Optimizer generates recommendations for Amazon Elastic Compute Cloud (Amazon EC2) instances that meet a specific set of requirements. For more
        information, see the <a href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/requirements.html">Supported resources and
            requirements in the Compute Optimizer User
        Guide.
```

### getEC2RecommendationProjectedMetrics(input:​completion:​)

Returns the projected utilization metrics of Amazon EC2 instance
recommendations.

``` swift
func getEC2RecommendationProjectedMetrics(input: GetEC2RecommendationProjectedMetricsInput, completion: @escaping (ClientRuntime.SdkResult<GetEC2RecommendationProjectedMetricsOutputResponse, GetEC2RecommendationProjectedMetricsOutputError>) -> Void)
```

``` 
        The Cpu and Memory metrics are the only projected
            utilization metrics returned when you run this action. Additionally, the
                Memory metric is returned only for resources that have the unified
                CloudWatch agent installed on them. For more information, see <a href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#cw-agent">Enabling Memory Utilization with the CloudWatch Agent.
```

### getEnrollmentStatus(input:​completion:​)

Returns the enrollment (opt in) status of an account to the Compute Optimizer
service.

``` swift
func getEnrollmentStatus(input: GetEnrollmentStatusInput, completion: @escaping (ClientRuntime.SdkResult<GetEnrollmentStatusOutputResponse, GetEnrollmentStatusOutputError>) -> Void)
```

``` 
    If the account is the management account of an organization, this action also confirms
        the enrollment status of member accounts of the organization. Use the GetEnrollmentStatusesForOrganization action to get detailed information
        about the enrollment status of member accounts of an organization.
```

### getEnrollmentStatusesForOrganization(input:​completion:​)

Returns the Compute Optimizer enrollment (opt-in) status of organization member
accounts, if your account is an organization management account.

``` swift
func getEnrollmentStatusesForOrganization(input: GetEnrollmentStatusesForOrganizationInput, completion: @escaping (ClientRuntime.SdkResult<GetEnrollmentStatusesForOrganizationOutputResponse, GetEnrollmentStatusesForOrganizationOutputError>) -> Void)
```

``` 
    To get the enrollment status of standalone accounts, use the GetEnrollmentStatus action.
```

### getLambdaFunctionRecommendations(input:​completion:​)

Returns Lambda function recommendations.

``` swift
func getLambdaFunctionRecommendations(input: GetLambdaFunctionRecommendationsInput, completion: @escaping (ClientRuntime.SdkResult<GetLambdaFunctionRecommendationsOutputResponse, GetLambdaFunctionRecommendationsOutputError>) -> Void)
```

``` 
    Compute Optimizer generates recommendations for functions that meet a specific set
        of requirements. For more information, see the <a href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/requirements.html">Supported resources and
            requirements in the Compute Optimizer User
        Guide.
```

### getRecommendationSummaries(input:​completion:​)

Returns the optimization findings for an account.

``` swift
func getRecommendationSummaries(input: GetRecommendationSummariesInput, completion: @escaping (ClientRuntime.SdkResult<GetRecommendationSummariesOutputResponse, GetRecommendationSummariesOutputError>) -> Void)
```

``` 
    It returns the number of:



            Amazon EC2 instances in an account that are
                    Underprovisioned, Overprovisioned, or
                    Optimized.


            Auto Scaling groups in an account that are NotOptimized, or
                    Optimized.


            Amazon EBS volumes in an account that are NotOptimized,
                or Optimized.


            Lambda functions in an account that are NotOptimized,
                or Optimized.
```

### updateEnrollmentStatus(input:​completion:​)

Updates the enrollment (opt in and opt out) status of an account to the Compute Optimizer service.

``` swift
func updateEnrollmentStatus(input: UpdateEnrollmentStatusInput, completion: @escaping (ClientRuntime.SdkResult<UpdateEnrollmentStatusOutputResponse, UpdateEnrollmentStatusOutputError>) -> Void)
```

``` 
    If the account is a management account of an organization, this action can also be
        used to enroll member accounts of the organization.

    You must have the appropriate permissions to opt in to Compute Optimizer, to view its
        recommendations, and to opt out. For more information, see <a href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/security-iam.html">Controlling access with Amazon Web Services Identity and Access Management in the Compute Optimizer User Guide.

    When you opt in, Compute Optimizer automatically creates a service-linked role in your
        account to access its data. For more information, see <a href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/using-service-linked-roles.html">Using
            Service-Linked Roles for Compute Optimizer in the Compute Optimizer User Guide.
```
