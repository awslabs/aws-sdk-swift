# AppflowClient

``` swift
public class AppflowClient 
```

## Inheritance

[`AppflowClientProtocol`](/aws-sdk-swift/reference/0.x/AWSAppflow/AppflowClientProtocol)

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
public static let clientName = "AppflowClient"
```

## Methods

### `createConnectorProfile(input:completion:)`

Creates a new connector profile associated with your Amazon Web Services account. There is a soft quota of 100 connector profiles per Amazon Web Services account. If you need more connector profiles than this quota allows, you can submit a request to the Amazon AppFlow team through the Amazon AppFlow support channel.

``` swift
public func createConnectorProfile(input: CreateConnectorProfileInput, completion: @escaping (ClientRuntime.SdkResult<CreateConnectorProfileOutputResponse, CreateConnectorProfileOutputError>) -> Void)
```

### `createFlow(input:completion:)`

Enables your application to create a new flow using Amazon AppFlow. You must create a connector profile before calling this API. Please note that the Request Syntax below shows syntax for multiple destinations, however, you can only transfer data to one item in this list at a time. Amazon AppFlow does not currently support flows to multiple destinations at once.

``` swift
public func createFlow(input: CreateFlowInput, completion: @escaping (ClientRuntime.SdkResult<CreateFlowOutputResponse, CreateFlowOutputError>) -> Void)
```

### `deleteConnectorProfile(input:completion:)`

Enables you to delete an existing connector profile.

``` swift
public func deleteConnectorProfile(input: DeleteConnectorProfileInput, completion: @escaping (ClientRuntime.SdkResult<DeleteConnectorProfileOutputResponse, DeleteConnectorProfileOutputError>) -> Void)
```

### `deleteFlow(input:completion:)`

Enables your application to delete an existing flow. Before deleting the flow, Amazon AppFlow validates the request by checking the flow configuration and status. You can delete flows one at a time.

``` swift
public func deleteFlow(input: DeleteFlowInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFlowOutputResponse, DeleteFlowOutputError>) -> Void)
```

### `describeConnectorEntity(input:completion:)`

Provides details regarding the entity used with the connector, with a description of the data model for each entity.

``` swift
public func describeConnectorEntity(input: DescribeConnectorEntityInput, completion: @escaping (ClientRuntime.SdkResult<DescribeConnectorEntityOutputResponse, DescribeConnectorEntityOutputError>) -> Void)
```

### `describeConnectorProfiles(input:completion:)`

Returns a list of connector-profile details matching the provided connector-profile names and connector-types. Both input lists are optional, and you can use them to filter the result. If no names or connector-types are provided, returns all connector profiles in a paginated form. If there is no match, this operation returns an empty list.

``` swift
public func describeConnectorProfiles(input: DescribeConnectorProfilesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeConnectorProfilesOutputResponse, DescribeConnectorProfilesOutputError>) -> Void)
```

### `describeConnectors(input:completion:)`

Describes the connectors vended by Amazon AppFlow for specified connector types. If you don't specify a connector type, this operation describes all connectors vended by Amazon AppFlow. If there are more connectors than can be returned in one page, the response contains a nextToken object, which can be be passed in to the next call to the DescribeConnectors API operation to retrieve the next page.

``` swift
public func describeConnectors(input: DescribeConnectorsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeConnectorsOutputResponse, DescribeConnectorsOutputError>) -> Void)
```

### `describeFlow(input:completion:)`

Provides a description of the specified flow.

``` swift
public func describeFlow(input: DescribeFlowInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFlowOutputResponse, DescribeFlowOutputError>) -> Void)
```

### `describeFlowExecutionRecords(input:completion:)`

Fetches the execution history of the flow.

``` swift
public func describeFlowExecutionRecords(input: DescribeFlowExecutionRecordsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFlowExecutionRecordsOutputResponse, DescribeFlowExecutionRecordsOutputError>) -> Void)
```

### `listConnectorEntities(input:completion:)`

Returns the list of available connector entities supported by Amazon AppFlow. For example, you can query Salesforce for Account and Opportunity entities, or query ServiceNow for the Incident entity.

``` swift
public func listConnectorEntities(input: ListConnectorEntitiesInput, completion: @escaping (ClientRuntime.SdkResult<ListConnectorEntitiesOutputResponse, ListConnectorEntitiesOutputError>) -> Void)
```

### `listFlows(input:completion:)`

Lists all of the flows associated with your account.

``` swift
public func listFlows(input: ListFlowsInput, completion: @escaping (ClientRuntime.SdkResult<ListFlowsOutputResponse, ListFlowsOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Retrieves the tags that are associated with a specified flow.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `startFlow(input:completion:)`

Activates an existing flow. For on-demand flows, this operation runs the flow immediately. For schedule and event-triggered flows, this operation activates the flow.

``` swift
public func startFlow(input: StartFlowInput, completion: @escaping (ClientRuntime.SdkResult<StartFlowOutputResponse, StartFlowOutputError>) -> Void)
```

### `stopFlow(input:completion:)`

Deactivates the existing flow. For on-demand flows, this operation returns an unsupportedOperationException error message. For schedule and event-triggered flows, this operation deactivates the flow.

``` swift
public func stopFlow(input: StopFlowInput, completion: @escaping (ClientRuntime.SdkResult<StopFlowOutputResponse, StopFlowOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Applies a tag to the specified flow.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes a tag from the specified flow.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateConnectorProfile(input:completion:)`

Updates a given connector profile associated with your account.

``` swift
public func updateConnectorProfile(input: UpdateConnectorProfileInput, completion: @escaping (ClientRuntime.SdkResult<UpdateConnectorProfileOutputResponse, UpdateConnectorProfileOutputError>) -> Void)
```

### `updateFlow(input:completion:)`

Updates an existing flow.

``` swift
public func updateFlow(input: UpdateFlowInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFlowOutputResponse, UpdateFlowOutputError>) -> Void)
```
