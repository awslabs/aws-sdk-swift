# CostAndUsageReportClient

``` swift
public class CostAndUsageReportClient 
```

## Inheritance

[`CostAndUsageReportClientProtocol`](/aws-sdk-swift/reference/0.x/AWSCostandUsageReportService/CostAndUsageReportClientProtocol)

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
public static let clientName = "CostAndUsageReportClient"
```

## Methods

### `deleteReportDefinition(input:completion:)`

Deletes the specified report.

``` swift
public func deleteReportDefinition(input: DeleteReportDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteReportDefinitionOutputResponse, DeleteReportDefinitionOutputError>) -> Void)
```

### `describeReportDefinitions(input:completion:)`

Lists the AWS Cost and Usage reports available to this account.

``` swift
public func describeReportDefinitions(input: DescribeReportDefinitionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeReportDefinitionsOutputResponse, DescribeReportDefinitionsOutputError>) -> Void)
```

### `modifyReportDefinition(input:completion:)`

Allows you to programatically update your report preferences.

``` swift
public func modifyReportDefinition(input: ModifyReportDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<ModifyReportDefinitionOutputResponse, ModifyReportDefinitionOutputError>) -> Void)
```

### `putReportDefinition(input:completion:)`

Creates a new report using the description that you provide.

``` swift
public func putReportDefinition(input: PutReportDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<PutReportDefinitionOutputResponse, PutReportDefinitionOutputError>) -> Void)
```
