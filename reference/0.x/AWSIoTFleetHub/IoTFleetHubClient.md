# IoTFleetHubClient

``` swift
public class IoTFleetHubClient 
```

## Inheritance

[`IoTFleetHubClientProtocol`](/aws-sdk-swift/reference/0.x/AWSIoTFleetHub/IoTFleetHubClientProtocol)

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

### `createApplication(input:completion:)`

Creates a Fleet Hub for AWS IoT Device Management web application.

``` swift
public func createApplication(input: CreateApplicationInput, completion: @escaping (ClientRuntime.SdkResult<CreateApplicationOutputResponse, CreateApplicationOutputError>) -> Void)
```

``` 
        Fleet Hub for AWS IoT Device Management is in public preview and is subject to change.
```

### `deleteApplication(input:completion:)`

Deletes a Fleet Hub for AWS IoT Device Management web application.

``` swift
public func deleteApplication(input: DeleteApplicationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteApplicationOutputResponse, DeleteApplicationOutputError>) -> Void)
```

``` 
        Fleet Hub for AWS IoT Device Management is in public preview and is subject to change.
```

### `describeApplication(input:completion:)`

Gets information about a Fleet Hub for AWS IoT Device Management web application.

``` swift
public func describeApplication(input: DescribeApplicationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeApplicationOutputResponse, DescribeApplicationOutputError>) -> Void)
```

``` 
        Fleet Hub for AWS IoT Device Management is in public preview and is subject to change.
```

### `listApplications(input:completion:)`

Gets a list of Fleet Hub for AWS IoT Device Management web applications for the current account.

``` swift
public func listApplications(input: ListApplicationsInput, completion: @escaping (ClientRuntime.SdkResult<ListApplicationsOutputResponse, ListApplicationsOutputError>) -> Void)
```

``` 
        Fleet Hub for AWS IoT Device Management is in public preview and is subject to change.
```

### `listTagsForResource(input:completion:)`

Lists the tags for the specified resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

``` 
        Fleet Hub for AWS IoT Device Management is in public preview and is subject to change.
```

### `tagResource(input:completion:)`

Adds to or modifies the tags of the specified resource. Tags are metadata which can be used to manage a resource.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

``` 
        Fleet Hub for AWS IoT Device Management is in public preview and is subject to change.
```

### `untagResource(input:completion:)`

Removes the specified tags (metadata) from the resource.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

``` 
        Fleet Hub for AWS IoT Device Management is in public preview and is subject to change.
```

### `updateApplication(input:completion:)`

Updates information about a Fleet Hub for a AWS IoT Device Management web application.

``` swift
public func updateApplication(input: UpdateApplicationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateApplicationOutputResponse, UpdateApplicationOutputError>) -> Void)
```

``` 
        Fleet Hub for AWS IoT Device Management is in public preview and is subject to change.
```
