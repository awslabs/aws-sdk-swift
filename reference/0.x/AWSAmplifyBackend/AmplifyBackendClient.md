# AmplifyBackendClient

``` swift
public class AmplifyBackendClient 
```

## Inheritance

[`AmplifyBackendClientProtocol`](/aws-sdk-swift/reference/0.x/AWSAmplifyBackend/AmplifyBackendClientProtocol)

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
public static let clientName = "AmplifyBackendClient"
```

## Methods

### `cloneBackend(input:completion:)`

This operation clones an existing backend.

``` swift
public func cloneBackend(input: CloneBackendInput, completion: @escaping (ClientRuntime.SdkResult<CloneBackendOutputResponse, CloneBackendOutputError>) -> Void)
```

### `createBackend(input:completion:)`

This operation creates a backend for an Amplify app. Backends are automatically created at the time of app creation.

``` swift
public func createBackend(input: CreateBackendInput, completion: @escaping (ClientRuntime.SdkResult<CreateBackendOutputResponse, CreateBackendOutputError>) -> Void)
```

### `createBackendAPI(input:completion:)`

Creates a new backend API resource.

``` swift
public func createBackendAPI(input: CreateBackendAPIInput, completion: @escaping (ClientRuntime.SdkResult<CreateBackendAPIOutputResponse, CreateBackendAPIOutputError>) -> Void)
```

### `createBackendAuth(input:completion:)`

Creates a new backend authentication resource.

``` swift
public func createBackendAuth(input: CreateBackendAuthInput, completion: @escaping (ClientRuntime.SdkResult<CreateBackendAuthOutputResponse, CreateBackendAuthOutputError>) -> Void)
```

### `createBackendConfig(input:completion:)`

Creates a config object for a backend.

``` swift
public func createBackendConfig(input: CreateBackendConfigInput, completion: @escaping (ClientRuntime.SdkResult<CreateBackendConfigOutputResponse, CreateBackendConfigOutputError>) -> Void)
```

### `createToken(input:completion:)`

Generates a one-time challenge code to authenticate a user into your Amplify Admin UI.

``` swift
public func createToken(input: CreateTokenInput, completion: @escaping (ClientRuntime.SdkResult<CreateTokenOutputResponse, CreateTokenOutputError>) -> Void)
```

### `deleteBackend(input:completion:)`

Removes an existing environment from your Amplify project.

``` swift
public func deleteBackend(input: DeleteBackendInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBackendOutputResponse, DeleteBackendOutputError>) -> Void)
```

### `deleteBackendAPI(input:completion:)`

Deletes an existing backend API resource.

``` swift
public func deleteBackendAPI(input: DeleteBackendAPIInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBackendAPIOutputResponse, DeleteBackendAPIOutputError>) -> Void)
```

### `deleteBackendAuth(input:completion:)`

Deletes an existing backend authentication resource.

``` swift
public func deleteBackendAuth(input: DeleteBackendAuthInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBackendAuthOutputResponse, DeleteBackendAuthOutputError>) -> Void)
```

### `deleteToken(input:completion:)`

Deletes the challenge token based on the given appId and sessionId.

``` swift
public func deleteToken(input: DeleteTokenInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTokenOutputResponse, DeleteTokenOutputError>) -> Void)
```

### `generateBackendAPIModels(input:completion:)`

Generates a model schema for an existing backend API resource.

``` swift
public func generateBackendAPIModels(input: GenerateBackendAPIModelsInput, completion: @escaping (ClientRuntime.SdkResult<GenerateBackendAPIModelsOutputResponse, GenerateBackendAPIModelsOutputError>) -> Void)
```

### `getBackend(input:completion:)`

Provides project-level details for your Amplify UI project.

``` swift
public func getBackend(input: GetBackendInput, completion: @escaping (ClientRuntime.SdkResult<GetBackendOutputResponse, GetBackendOutputError>) -> Void)
```

### `getBackendAPI(input:completion:)`

Gets the details for a backend API.

``` swift
public func getBackendAPI(input: GetBackendAPIInput, completion: @escaping (ClientRuntime.SdkResult<GetBackendAPIOutputResponse, GetBackendAPIOutputError>) -> Void)
```

### `getBackendAPIModels(input:completion:)`

Generates a model schema for existing backend API resource.

``` swift
public func getBackendAPIModels(input: GetBackendAPIModelsInput, completion: @escaping (ClientRuntime.SdkResult<GetBackendAPIModelsOutputResponse, GetBackendAPIModelsOutputError>) -> Void)
```

### `getBackendAuth(input:completion:)`

Gets a backend auth details.

``` swift
public func getBackendAuth(input: GetBackendAuthInput, completion: @escaping (ClientRuntime.SdkResult<GetBackendAuthOutputResponse, GetBackendAuthOutputError>) -> Void)
```

### `getBackendJob(input:completion:)`

Returns information about a specific job.

``` swift
public func getBackendJob(input: GetBackendJobInput, completion: @escaping (ClientRuntime.SdkResult<GetBackendJobOutputResponse, GetBackendJobOutputError>) -> Void)
```

### `getToken(input:completion:)`

Gets the challenge token based on the given appId and sessionId.

``` swift
public func getToken(input: GetTokenInput, completion: @escaping (ClientRuntime.SdkResult<GetTokenOutputResponse, GetTokenOutputError>) -> Void)
```

### `importBackendAuth(input:completion:)`

Imports an existing backend authentication resource.

``` swift
public func importBackendAuth(input: ImportBackendAuthInput, completion: @escaping (ClientRuntime.SdkResult<ImportBackendAuthOutputResponse, ImportBackendAuthOutputError>) -> Void)
```

### `listBackendJobs(input:completion:)`

Lists the jobs for the backend of an Amplify app.

``` swift
public func listBackendJobs(input: ListBackendJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListBackendJobsOutputResponse, ListBackendJobsOutputError>) -> Void)
```

### `removeAllBackends(input:completion:)`

Removes all backend environments from your Amplify project.

``` swift
public func removeAllBackends(input: RemoveAllBackendsInput, completion: @escaping (ClientRuntime.SdkResult<RemoveAllBackendsOutputResponse, RemoveAllBackendsOutputError>) -> Void)
```

### `removeBackendConfig(input:completion:)`

Removes the AWS resources required to access the Amplify Admin UI.

``` swift
public func removeBackendConfig(input: RemoveBackendConfigInput, completion: @escaping (ClientRuntime.SdkResult<RemoveBackendConfigOutputResponse, RemoveBackendConfigOutputError>) -> Void)
```

### `updateBackendAPI(input:completion:)`

Updates an existing backend API resource.

``` swift
public func updateBackendAPI(input: UpdateBackendAPIInput, completion: @escaping (ClientRuntime.SdkResult<UpdateBackendAPIOutputResponse, UpdateBackendAPIOutputError>) -> Void)
```

### `updateBackendAuth(input:completion:)`

Updates an existing backend authentication resource.

``` swift
public func updateBackendAuth(input: UpdateBackendAuthInput, completion: @escaping (ClientRuntime.SdkResult<UpdateBackendAuthOutputResponse, UpdateBackendAuthOutputError>) -> Void)
```

### `updateBackendConfig(input:completion:)`

Updates the AWS resources required to access the Amplify Admin UI.

``` swift
public func updateBackendConfig(input: UpdateBackendConfigInput, completion: @escaping (ClientRuntime.SdkResult<UpdateBackendConfigOutputResponse, UpdateBackendConfigOutputError>) -> Void)
```

### `updateBackendJob(input:completion:)`

Updates a specific job.

``` swift
public func updateBackendJob(input: UpdateBackendJobInput, completion: @escaping (ClientRuntime.SdkResult<UpdateBackendJobOutputResponse, UpdateBackendJobOutputError>) -> Void)
```
