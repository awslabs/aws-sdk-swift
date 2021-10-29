# AmplifyBackendClientProtocol

AWS Amplify Admin API

``` swift
public protocol AmplifyBackendClientProtocol 
```

## Requirements

### cloneBackend(input:completion:)

This operation clones an existing backend.

``` swift
func cloneBackend(input: CloneBackendInput, completion: @escaping (ClientRuntime.SdkResult<CloneBackendOutputResponse, CloneBackendOutputError>) -> Void)
```

### createBackend(input:completion:)

This operation creates a backend for an Amplify app. Backends are automatically created at the time of app creation.

``` swift
func createBackend(input: CreateBackendInput, completion: @escaping (ClientRuntime.SdkResult<CreateBackendOutputResponse, CreateBackendOutputError>) -> Void)
```

### createBackendAPI(input:completion:)

Creates a new backend API resource.

``` swift
func createBackendAPI(input: CreateBackendAPIInput, completion: @escaping (ClientRuntime.SdkResult<CreateBackendAPIOutputResponse, CreateBackendAPIOutputError>) -> Void)
```

### createBackendAuth(input:completion:)

Creates a new backend authentication resource.

``` swift
func createBackendAuth(input: CreateBackendAuthInput, completion: @escaping (ClientRuntime.SdkResult<CreateBackendAuthOutputResponse, CreateBackendAuthOutputError>) -> Void)
```

### createBackendConfig(input:completion:)

Creates a config object for a backend.

``` swift
func createBackendConfig(input: CreateBackendConfigInput, completion: @escaping (ClientRuntime.SdkResult<CreateBackendConfigOutputResponse, CreateBackendConfigOutputError>) -> Void)
```

### createToken(input:completion:)

Generates a one-time challenge code to authenticate a user into your Amplify Admin UI.

``` swift
func createToken(input: CreateTokenInput, completion: @escaping (ClientRuntime.SdkResult<CreateTokenOutputResponse, CreateTokenOutputError>) -> Void)
```

### deleteBackend(input:completion:)

Removes an existing environment from your Amplify project.

``` swift
func deleteBackend(input: DeleteBackendInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBackendOutputResponse, DeleteBackendOutputError>) -> Void)
```

### deleteBackendAPI(input:completion:)

Deletes an existing backend API resource.

``` swift
func deleteBackendAPI(input: DeleteBackendAPIInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBackendAPIOutputResponse, DeleteBackendAPIOutputError>) -> Void)
```

### deleteBackendAuth(input:completion:)

Deletes an existing backend authentication resource.

``` swift
func deleteBackendAuth(input: DeleteBackendAuthInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBackendAuthOutputResponse, DeleteBackendAuthOutputError>) -> Void)
```

### deleteToken(input:completion:)

Deletes the challenge token based on the given appId and sessionId.

``` swift
func deleteToken(input: DeleteTokenInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTokenOutputResponse, DeleteTokenOutputError>) -> Void)
```

### generateBackendAPIModels(input:completion:)

Generates a model schema for an existing backend API resource.

``` swift
func generateBackendAPIModels(input: GenerateBackendAPIModelsInput, completion: @escaping (ClientRuntime.SdkResult<GenerateBackendAPIModelsOutputResponse, GenerateBackendAPIModelsOutputError>) -> Void)
```

### getBackend(input:completion:)

Provides project-level details for your Amplify UI project.

``` swift
func getBackend(input: GetBackendInput, completion: @escaping (ClientRuntime.SdkResult<GetBackendOutputResponse, GetBackendOutputError>) -> Void)
```

### getBackendAPI(input:completion:)

Gets the details for a backend API.

``` swift
func getBackendAPI(input: GetBackendAPIInput, completion: @escaping (ClientRuntime.SdkResult<GetBackendAPIOutputResponse, GetBackendAPIOutputError>) -> Void)
```

### getBackendAPIModels(input:completion:)

Generates a model schema for existing backend API resource.

``` swift
func getBackendAPIModels(input: GetBackendAPIModelsInput, completion: @escaping (ClientRuntime.SdkResult<GetBackendAPIModelsOutputResponse, GetBackendAPIModelsOutputError>) -> Void)
```

### getBackendAuth(input:completion:)

Gets a backend auth details.

``` swift
func getBackendAuth(input: GetBackendAuthInput, completion: @escaping (ClientRuntime.SdkResult<GetBackendAuthOutputResponse, GetBackendAuthOutputError>) -> Void)
```

### getBackendJob(input:completion:)

Returns information about a specific job.

``` swift
func getBackendJob(input: GetBackendJobInput, completion: @escaping (ClientRuntime.SdkResult<GetBackendJobOutputResponse, GetBackendJobOutputError>) -> Void)
```

### getToken(input:completion:)

Gets the challenge token based on the given appId and sessionId.

``` swift
func getToken(input: GetTokenInput, completion: @escaping (ClientRuntime.SdkResult<GetTokenOutputResponse, GetTokenOutputError>) -> Void)
```

### importBackendAuth(input:completion:)

Imports an existing backend authentication resource.

``` swift
func importBackendAuth(input: ImportBackendAuthInput, completion: @escaping (ClientRuntime.SdkResult<ImportBackendAuthOutputResponse, ImportBackendAuthOutputError>) -> Void)
```

### listBackendJobs(input:completion:)

Lists the jobs for the backend of an Amplify app.

``` swift
func listBackendJobs(input: ListBackendJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListBackendJobsOutputResponse, ListBackendJobsOutputError>) -> Void)
```

### removeAllBackends(input:completion:)

Removes all backend environments from your Amplify project.

``` swift
func removeAllBackends(input: RemoveAllBackendsInput, completion: @escaping (ClientRuntime.SdkResult<RemoveAllBackendsOutputResponse, RemoveAllBackendsOutputError>) -> Void)
```

### removeBackendConfig(input:completion:)

Removes the AWS resources required to access the Amplify Admin UI.

``` swift
func removeBackendConfig(input: RemoveBackendConfigInput, completion: @escaping (ClientRuntime.SdkResult<RemoveBackendConfigOutputResponse, RemoveBackendConfigOutputError>) -> Void)
```

### updateBackendAPI(input:completion:)

Updates an existing backend API resource.

``` swift
func updateBackendAPI(input: UpdateBackendAPIInput, completion: @escaping (ClientRuntime.SdkResult<UpdateBackendAPIOutputResponse, UpdateBackendAPIOutputError>) -> Void)
```

### updateBackendAuth(input:completion:)

Updates an existing backend authentication resource.

``` swift
func updateBackendAuth(input: UpdateBackendAuthInput, completion: @escaping (ClientRuntime.SdkResult<UpdateBackendAuthOutputResponse, UpdateBackendAuthOutputError>) -> Void)
```

### updateBackendConfig(input:completion:)

Updates the AWS resources required to access the Amplify Admin UI.

``` swift
func updateBackendConfig(input: UpdateBackendConfigInput, completion: @escaping (ClientRuntime.SdkResult<UpdateBackendConfigOutputResponse, UpdateBackendConfigOutputError>) -> Void)
```

### updateBackendJob(input:completion:)

Updates a specific job.

``` swift
func updateBackendJob(input: UpdateBackendJobInput, completion: @escaping (ClientRuntime.SdkResult<UpdateBackendJobOutputResponse, UpdateBackendJobOutputError>) -> Void)
```
