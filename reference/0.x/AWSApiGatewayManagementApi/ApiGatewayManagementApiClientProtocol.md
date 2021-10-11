# ApiGatewayManagementApiClientProtocol

The Amazon API Gateway Management API allows you to directly manage runtime aspects of your deployed APIs. To use it, you must explicitly set the SDK's endpoint to point to the endpoint of your deployed API. The endpoint will be of the form https:​//{api-id}.execute-api.{region}.amazonaws.com/{stage}, or will be the endpoint corresponding to your API's custom domain and base path, if applicable.

``` swift
public protocol ApiGatewayManagementApiClientProtocol 
```

## Requirements

### deleteConnection(input:​completion:​)

Delete the connection with the provided id.

``` swift
func deleteConnection(input: DeleteConnectionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteConnectionOutputResponse, DeleteConnectionOutputError>) -> Void)
```

### getConnection(input:​completion:​)

Get information about the connection with the provided id.

``` swift
func getConnection(input: GetConnectionInput, completion: @escaping (ClientRuntime.SdkResult<GetConnectionOutputResponse, GetConnectionOutputError>) -> Void)
```

### postToConnection(input:​completion:​)

Sends the provided data to the specified connection.

``` swift
func postToConnection(input: PostToConnectionInput, completion: @escaping (ClientRuntime.SdkResult<PostToConnectionOutputResponse, PostToConnectionOutputError>) -> Void)
```
