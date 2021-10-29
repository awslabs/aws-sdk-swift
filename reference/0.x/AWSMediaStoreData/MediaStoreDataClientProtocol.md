# MediaStoreDataClientProtocol

An AWS Elemental MediaStore asset is an object, similar to an object in the Amazon S3 service. Objects are the fundamental entities that are stored in AWS Elemental MediaStore.

``` swift
public protocol MediaStoreDataClientProtocol 
```

## Requirements

### deleteObject(input:completion:)

Deletes an object at the specified path.

``` swift
func deleteObject(input: DeleteObjectInput, completion: @escaping (ClientRuntime.SdkResult<DeleteObjectOutputResponse, DeleteObjectOutputError>) -> Void)
```

### describeObject(input:completion:)

Gets the headers for an object at the specified path.

``` swift
func describeObject(input: DescribeObjectInput, completion: @escaping (ClientRuntime.SdkResult<DescribeObjectOutputResponse, DescribeObjectOutputError>) -> Void)
```

### getObject(input:completion:)

Downloads the object at the specified path. If the object’s upload availability is set to streaming, AWS Elemental MediaStore downloads the object even if it’s still uploading the object.

``` swift
func getObject(input: GetObjectInput, completion: @escaping (ClientRuntime.SdkResult<GetObjectOutputResponse, GetObjectOutputError>) -> Void)
```

### listItems(input:completion:)

Provides a list of metadata entries about folders and objects in the specified folder.

``` swift
func listItems(input: ListItemsInput, completion: @escaping (ClientRuntime.SdkResult<ListItemsOutputResponse, ListItemsOutputError>) -> Void)
```

### putObject(input:completion:)

Uploads an object to the specified path. Object sizes are limited to 25 MB for standard upload availability and 10 MB for streaming upload availability.

``` swift
func putObject(input: PutObjectInput, completion: @escaping (ClientRuntime.SdkResult<PutObjectOutputResponse, PutObjectOutputError>) -> Void)
```
