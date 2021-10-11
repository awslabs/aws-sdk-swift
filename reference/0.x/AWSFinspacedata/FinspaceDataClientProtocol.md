# FinspaceDataClientProtocol

The FinSpace APIs let you take actions inside the FinSpace environment.

``` swift
public protocol FinspaceDataClientProtocol 
```

## Requirements

### createChangeset(input:​completion:​)

Creates a new changeset in a FinSpace dataset.

``` swift
func createChangeset(input: CreateChangesetInput, completion: @escaping (ClientRuntime.SdkResult<CreateChangesetOutputResponse, CreateChangesetOutputError>) -> Void)
```

### getProgrammaticAccessCredentials(input:​completion:​)

Request programmatic credentials to use with Habanero SDK.

``` swift
func getProgrammaticAccessCredentials(input: GetProgrammaticAccessCredentialsInput, completion: @escaping (ClientRuntime.SdkResult<GetProgrammaticAccessCredentialsOutputResponse, GetProgrammaticAccessCredentialsOutputError>) -> Void)
```

### getWorkingLocation(input:​completion:​)

A temporary Amazon S3 location to copy your files from a source location to stage or use
as a scratch space in Habanero notebook.

``` swift
func getWorkingLocation(input: GetWorkingLocationInput, completion: @escaping (ClientRuntime.SdkResult<GetWorkingLocationOutputResponse, GetWorkingLocationOutputError>) -> Void)
```
