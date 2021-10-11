# MigrationHubConfigClient

``` swift
public class MigrationHubConfigClient 
```

## Inheritance

[`MigrationHubConfigClientProtocol`](/aws-sdk-swift/reference/0.x/AWSMigrationHubConfig/MigrationHubConfigClientProtocol)

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

### `createHomeRegionControl(input:completion:)`

This API sets up the home region for the calling account only.

``` swift
public func createHomeRegionControl(input: CreateHomeRegionControlInput, completion: @escaping (ClientRuntime.SdkResult<CreateHomeRegionControlOutputResponse, CreateHomeRegionControlOutputError>) -> Void)
```

### `describeHomeRegionControls(input:completion:)`

This API permits filtering on the ControlId and HomeRegion
fields.

``` swift
public func describeHomeRegionControls(input: DescribeHomeRegionControlsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeHomeRegionControlsOutputResponse, DescribeHomeRegionControlsOutputError>) -> Void)
```

### `getHomeRegion(input:completion:)`

Returns the calling account’s home region, if configured. This API is used by other AWS
services to determine the regional endpoint for calling AWS Application Discovery Service and
Migration Hub. You must call GetHomeRegion at least once before you call any
other AWS Application Discovery Service and AWS Migration Hub APIs, to obtain the account's
Migration Hub home region.

``` swift
public func getHomeRegion(input: GetHomeRegionInput, completion: @escaping (ClientRuntime.SdkResult<GetHomeRegionOutputResponse, GetHomeRegionOutputError>) -> Void)
```
