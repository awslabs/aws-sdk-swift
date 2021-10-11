# FinspaceDataClient

``` swift
public class FinspaceDataClient 
```

## Inheritance

[`FinspaceDataClientProtocol`](/aws-sdk-swift/reference/0.x/AWSFinspacedata/FinspaceDataClientProtocol)

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

### `createChangeset(input:completion:)`

Creates a new changeset in a FinSpace dataset.

``` swift
public func createChangeset(input: CreateChangesetInput, completion: @escaping (ClientRuntime.SdkResult<CreateChangesetOutputResponse, CreateChangesetOutputError>) -> Void)
```

### `getProgrammaticAccessCredentials(input:completion:)`

Request programmatic credentials to use with Habanero SDK.

``` swift
public func getProgrammaticAccessCredentials(input: GetProgrammaticAccessCredentialsInput, completion: @escaping (ClientRuntime.SdkResult<GetProgrammaticAccessCredentialsOutputResponse, GetProgrammaticAccessCredentialsOutputError>) -> Void)
```

### `getWorkingLocation(input:completion:)`

A temporary Amazon S3 location to copy your files from a source location to stage or use
as a scratch space in Habanero notebook.

``` swift
public func getWorkingLocation(input: GetWorkingLocationInput, completion: @escaping (ClientRuntime.SdkResult<GetWorkingLocationOutputResponse, GetWorkingLocationOutputError>) -> Void)
```
