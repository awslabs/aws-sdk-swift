# CloudControlClient

``` swift
public class CloudControlClient 
```

## Inheritance

[`CloudControlClientProtocol`](/aws-sdk-swift/reference/0.x/AWSCloudControl/CloudControlClientProtocol)

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

### `cancelResourceRequest(input:completion:)`

Cancels the specified resource operation request. For more information, see <a href="https:​//docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations-manage-requests.html#resource-operations-manage-requests-cancel">Canceling resource operation requests in the
Amazon Web Services Cloud Control API User Guide.
Only resource operations requests with a status of PENDING or
IN\_PROGRESS can be cancelled.

``` swift
public func cancelResourceRequest(input: CancelResourceRequestInput, completion: @escaping (ClientRuntime.SdkResult<CancelResourceRequestOutputResponse, CancelResourceRequestOutputError>) -> Void)
```

### `createResource(input:completion:)`

Creates the specified resource. For more information, see <a href="https:​//docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations-create.html">Creating a
resource in the Amazon Web Services Cloud Control API User Guide.
After you have initiated a resource creation request, you can monitor the progress of your
request by calling <a href="https:​//docs.aws.amazon.com/cloudcontrolapi/latest/APIReference/API_GetResourceRequestStatus.html">GetResourceRequestStatus using the RequestToken of the
ProgressEvent type returned by CreateResource.

``` swift
public func createResource(input: CreateResourceInput, completion: @escaping (ClientRuntime.SdkResult<CreateResourceOutputResponse, CreateResourceOutputError>) -> Void)
```

### `deleteResource(input:completion:)`

Deletes the specified resource. For details, see <a href="https:​//docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations-delete.html">Deleting a
resource in the Amazon Web Services Cloud Control API User Guide.
After you have initiated a resource deletion request, you can monitor the progress of your
request by calling <a href="https:​//docs.aws.amazon.com/cloudcontrolapi/latest/APIReference/API_GetResourceRequestStatus.html">GetResourceRequestStatus using the RequestToken of the
ProgressEvent returned by DeleteResource.

``` swift
public func deleteResource(input: DeleteResourceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteResourceOutputResponse, DeleteResourceOutputError>) -> Void)
```

### `getResource(input:completion:)`

Returns information about the current state of the specified resource. For details, see
<a href="https:​//docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations-read.html">Reading a resource's current state.
You can use this action to return information about an existing resource in your account
and Amazon Web Services Region, whether or not those resources were provisioned using Cloud Control API.

``` swift
public func getResource(input: GetResourceInput, completion: @escaping (ClientRuntime.SdkResult<GetResourceOutputResponse, GetResourceOutputError>) -> Void)
```

### `getResourceRequestStatus(input:completion:)`

Returns the current status of a resource operation request. For more information, see
<a href="https:​//docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations-manage-requests.html#resource-operations-manage-requests-track">Tracking the progress of resource operation requests in the
Amazon Web Services Cloud Control API User Guide.

``` swift
public func getResourceRequestStatus(input: GetResourceRequestStatusInput, completion: @escaping (ClientRuntime.SdkResult<GetResourceRequestStatusOutputResponse, GetResourceRequestStatusOutputError>) -> Void)
```

### `listResourceRequests(input:completion:)`

Returns existing resource operation requests. This includes requests of all status types.
For more information, see <a href="https:​//docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations-manage-requests.html#resource-operations-manage-requests-list">Listing active resource operation requests in the
Amazon Web Services Cloud Control API User Guide.

``` swift
public func listResourceRequests(input: ListResourceRequestsInput, completion: @escaping (ClientRuntime.SdkResult<ListResourceRequestsOutputResponse, ListResourceRequestsOutputError>) -> Void)
```

``` 
        Resource operation requests expire after seven days.
```

### `listResources(input:completion:)`

Returns information about the specified resources. For more information, see <a href="cloudcontrolapi/latest/userguide/resource-operations-list.html">Discovering
resources in the Amazon Web Services Cloud Control API User Guide.
You can use this action to return information about existing resources in your account and
Amazon Web Services Region, whether or not those resources were provisioned using Cloud Control API.

``` swift
public func listResources(input: ListResourcesInput, completion: @escaping (ClientRuntime.SdkResult<ListResourcesOutputResponse, ListResourcesOutputError>) -> Void)
```

### `updateResource(input:completion:)`

Updates the specified property values in the resource.
You specify your resource property updates as a list of patch operations contained in a
JSON patch document that adheres to the <a href="https:​//datatracker.ietf.org/doc/html/rfc6902">
RFC 6902 - JavaScript Object
Notation (JSON) Patch
standard.
For details on how Cloud Control API performs resource update operations, see <a href="https:​//docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations-update.html">Updating a resource in the Amazon Web Services Cloud Control API User Guide.
After you have initiated a resource update request, you can monitor the progress of your
request by calling <a href="https:​//docs.aws.amazon.com/cloudcontrolapi/latest/APIReference/API_GetResourceRequestStatus.html">GetResourceRequestStatus using the RequestToken of the
ProgressEvent returned by UpdateResource.
For more information about the properties of a specific resource, refer to the related
topic for the resource in the <a href="https:​//docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">Resource and property types reference in the Amazon Web Services
CloudFormation Users Guide.

``` swift
public func updateResource(input: UpdateResourceInput, completion: @escaping (ClientRuntime.SdkResult<UpdateResourceOutputResponse, UpdateResourceOutputError>) -> Void)
```
