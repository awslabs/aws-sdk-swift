# CostAndUsageReportClientProtocol

The AWS Cost and Usage Report API enables you to programmatically create, query, and delete
AWS Cost and Usage report definitions.
AWS Cost and Usage reports track the monthly AWS costs and usage
associated with your AWS account.

``` swift
public protocol CostAndUsageReportClientProtocol 
```

``` 
    The report contains line items for each unique combination of AWS product,
    usage type, and operation that your AWS account uses.

    You can configure the AWS Cost and Usage report to show only the data that you want, using the
    AWS Cost and Usage API.

     Service Endpoint
     The AWS Cost and Usage Report API provides the following endpoint:


           cur.us-east-1.amazonaws.com
```

## Requirements

### deleteReportDefinition(input:​completion:​)

Deletes the specified report.

``` swift
func deleteReportDefinition(input: DeleteReportDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteReportDefinitionOutputResponse, DeleteReportDefinitionOutputError>) -> Void)
```

### describeReportDefinitions(input:​completion:​)

Lists the AWS Cost and Usage reports available to this account.

``` swift
func describeReportDefinitions(input: DescribeReportDefinitionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeReportDefinitionsOutputResponse, DescribeReportDefinitionsOutputError>) -> Void)
```

### modifyReportDefinition(input:​completion:​)

Allows you to programatically update your report preferences.

``` swift
func modifyReportDefinition(input: ModifyReportDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<ModifyReportDefinitionOutputResponse, ModifyReportDefinitionOutputError>) -> Void)
```

### putReportDefinition(input:​completion:​)

Creates a new report using the description that you provide.

``` swift
func putReportDefinition(input: PutReportDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<PutReportDefinitionOutputResponse, PutReportDefinitionOutputError>) -> Void)
```
