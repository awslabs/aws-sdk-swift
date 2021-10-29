# TransferClientProtocol

Amazon Web Services Transfer Family is a fully managed service that enables the transfer of files over the File Transfer Protocol (FTP), File Transfer Protocol over SSL (FTPS), or Secure Shell (SSH) File Transfer Protocol (SFTP) directly into and out of Amazon Simple Storage Service (Amazon S3). Amazon Web Services helps you seamlessly migrate your file transfer workflows to Amazon Web Services Transfer Family by integrating with existing authentication systems, and providing DNS routing with Amazon Route 53 so nothing changes for your customers and partners, or their applications. With your data in Amazon S3, you can use it with Amazon Web Services services for processing, analytics, machine learning, and archiving. Getting started with Amazon Web Services Transfer Family is easy since there is no infrastructure to buy and set up.

``` swift
public protocol TransferClientProtocol 
```

## Requirements

### createAccess(input:completion:)

Used by administrators to choose which groups in the directory should have access to upload and download files over the enabled protocols using Amazon Web Services Transfer Family. For example, a Microsoft Active Directory might contain 50,000 users, but only a small fraction might need the ability to transfer files to the server. An administrator can use CreateAccess to limit the access to the correct set of users who need this ability.

``` swift
func createAccess(input: CreateAccessInput, completion: @escaping (ClientRuntime.SdkResult<CreateAccessOutputResponse, CreateAccessOutputError>) -> Void)
```

### createServer(input:completion:)

Instantiates an auto-scaling virtual server based on the selected file transfer protocol in Amazon Web Services. When you make updates to your file transfer protocol-enabled server or when you work with users, use the service-generated ServerId property that is assigned to the newly created server.

``` swift
func createServer(input: CreateServerInput, completion: @escaping (ClientRuntime.SdkResult<CreateServerOutputResponse, CreateServerOutputError>) -> Void)
```

### createUser(input:completion:)

Creates a user and associates them with an existing file transfer protocol-enabled server. You can only create and associate users with servers that have the IdentityProviderType set to SERVICE\_MANAGED. Using parameters for CreateUser, you can specify the user name, set the home directory, store the user's public key, and assign the user's Amazon Web Services Identity and Access Management (IAM) role. You can also optionally add a session policy, and assign metadata with tags that can be used to group and search for users.

``` swift
func createUser(input: CreateUserInput, completion: @escaping (ClientRuntime.SdkResult<CreateUserOutputResponse, CreateUserOutputError>) -> Void)
```

### createWorkflow(input:completion:)

Allows you to create a workflow with specified steps and step details the workflow invokes after file transfer completes. After creating a workflow, you can associate the workflow created with any transfer servers by specifying the workflow-details field in CreateServer and UpdateServer operations.

``` swift
func createWorkflow(input: CreateWorkflowInput, completion: @escaping (ClientRuntime.SdkResult<CreateWorkflowOutputResponse, CreateWorkflowOutputError>) -> Void)
```

### deleteAccess(input:completion:)

Allows you to delete the access specified in the ServerID and ExternalID parameters.

``` swift
func deleteAccess(input: DeleteAccessInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAccessOutputResponse, DeleteAccessOutputError>) -> Void)
```

### deleteServer(input:completion:)

Deletes the file transfer protocol-enabled server that you specify. No response returns from this operation.

``` swift
func deleteServer(input: DeleteServerInput, completion: @escaping (ClientRuntime.SdkResult<DeleteServerOutputResponse, DeleteServerOutputError>) -> Void)
```

### deleteSshPublicKey(input:completion:)

Deletes a user's Secure Shell (SSH) public key.

``` swift
func deleteSshPublicKey(input: DeleteSshPublicKeyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSshPublicKeyOutputResponse, DeleteSshPublicKeyOutputError>) -> Void)
```

### deleteUser(input:completion:)

Deletes the user belonging to a file transfer protocol-enabled server you specify. No response returns from this operation. When you delete a user from a server, the user's information is lost.

``` swift
func deleteUser(input: DeleteUserInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUserOutputResponse, DeleteUserOutputError>) -> Void)
```

### deleteWorkflow(input:completion:)

Deletes the specified workflow.

``` swift
func deleteWorkflow(input: DeleteWorkflowInput, completion: @escaping (ClientRuntime.SdkResult<DeleteWorkflowOutputResponse, DeleteWorkflowOutputError>) -> Void)
```

### describeAccess(input:completion:)

Describes the access that is assigned to the specific file transfer protocol-enabled server, as identified by its ServerId property and its ExternalID. The response from this call returns the properties of the access that is associated with the ServerId value that was specified.

``` swift
func describeAccess(input: DescribeAccessInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAccessOutputResponse, DescribeAccessOutputError>) -> Void)
```

### describeExecution(input:completion:)

You can use DescribeExecution to check the details of the execution of the specified workflow.

``` swift
func describeExecution(input: DescribeExecutionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeExecutionOutputResponse, DescribeExecutionOutputError>) -> Void)
```

### describeSecurityPolicy(input:completion:)

Describes the security policy that is attached to your file transfer protocol-enabled server. The response contains a description of the security policy's properties. For more information about security policies, see [Working with security policies](https://docs.aws.amazon.com/transfer/latest/userguide/security-policies.html).

``` swift
func describeSecurityPolicy(input: DescribeSecurityPolicyInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSecurityPolicyOutputResponse, DescribeSecurityPolicyOutputError>) -> Void)
```

### describeServer(input:completion:)

Describes a file transfer protocol-enabled server that you specify by passing the ServerId parameter. The response contains a description of a server's properties. When you set EndpointType to VPC, the response will contain the EndpointDetails.

``` swift
func describeServer(input: DescribeServerInput, completion: @escaping (ClientRuntime.SdkResult<DescribeServerOutputResponse, DescribeServerOutputError>) -> Void)
```

### describeUser(input:completion:)

Describes the user assigned to the specific file transfer protocol-enabled server, as identified by its ServerId property. The response from this call returns the properties of the user associated with the ServerId value that was specified.

``` swift
func describeUser(input: DescribeUserInput, completion: @escaping (ClientRuntime.SdkResult<DescribeUserOutputResponse, DescribeUserOutputError>) -> Void)
```

### describeWorkflow(input:completion:)

Describes the specified workflow.

``` swift
func describeWorkflow(input: DescribeWorkflowInput, completion: @escaping (ClientRuntime.SdkResult<DescribeWorkflowOutputResponse, DescribeWorkflowOutputError>) -> Void)
```

### importSshPublicKey(input:completion:)

Adds a Secure Shell (SSH) public key to a user account identified by a UserName value assigned to the specific file transfer protocol-enabled server, identified by ServerId. The response returns the UserName value, the ServerId value, and the name of the SshPublicKeyId.

``` swift
func importSshPublicKey(input: ImportSshPublicKeyInput, completion: @escaping (ClientRuntime.SdkResult<ImportSshPublicKeyOutputResponse, ImportSshPublicKeyOutputError>) -> Void)
```

### listAccesses(input:completion:)

Lists the details for all the accesses you have on your server.

``` swift
func listAccesses(input: ListAccessesInput, completion: @escaping (ClientRuntime.SdkResult<ListAccessesOutputResponse, ListAccessesOutputError>) -> Void)
```

### listExecutions(input:completion:)

Lists all executions for the specified workflow.

``` swift
func listExecutions(input: ListExecutionsInput, completion: @escaping (ClientRuntime.SdkResult<ListExecutionsOutputResponse, ListExecutionsOutputError>) -> Void)
```

### listSecurityPolicies(input:completion:)

Lists the security policies that are attached to your file transfer protocol-enabled servers.

``` swift
func listSecurityPolicies(input: ListSecurityPoliciesInput, completion: @escaping (ClientRuntime.SdkResult<ListSecurityPoliciesOutputResponse, ListSecurityPoliciesOutputError>) -> Void)
```

### listServers(input:completion:)

Lists the file transfer protocol-enabled servers that are associated with your Amazon Web Services account.

``` swift
func listServers(input: ListServersInput, completion: @escaping (ClientRuntime.SdkResult<ListServersOutputResponse, ListServersOutputError>) -> Void)
```

### listTagsForResource(input:completion:)

Lists all of the tags associated with the Amazon Resource Name (ARN) that you specify. The resource can be a user, server, or role.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### listUsers(input:completion:)

Lists the users for a file transfer protocol-enabled server that you specify by passing the ServerId parameter.

``` swift
func listUsers(input: ListUsersInput, completion: @escaping (ClientRuntime.SdkResult<ListUsersOutputResponse, ListUsersOutputError>) -> Void)
```

### listWorkflows(input:completion:)

Lists all of your workflows.

``` swift
func listWorkflows(input: ListWorkflowsInput, completion: @escaping (ClientRuntime.SdkResult<ListWorkflowsOutputResponse, ListWorkflowsOutputError>) -> Void)
```

### sendWorkflowStepState(input:completion:)

Sends a callback for asynchronous custom steps. The ExecutionId, WorkflowId, and Token are passed to the target resource during execution of a custom step of a workflow. You must include those with their callback as well as providing a status.

``` swift
func sendWorkflowStepState(input: SendWorkflowStepStateInput, completion: @escaping (ClientRuntime.SdkResult<SendWorkflowStepStateOutputResponse, SendWorkflowStepStateOutputError>) -> Void)
```

### startServer(input:completion:)

Changes the state of a file transfer protocol-enabled server from OFFLINE to ONLINE. It has no impact on a server that is already ONLINE. An ONLINE server can accept and process file transfer jobs. The state of STARTING indicates that the server is in an intermediate state, either not fully able to respond, or not fully online. The values of START\_FAILED can indicate an error condition. No response is returned from this call.

``` swift
func startServer(input: StartServerInput, completion: @escaping (ClientRuntime.SdkResult<StartServerOutputResponse, StartServerOutputError>) -> Void)
```

### stopServer(input:completion:)

Changes the state of a file transfer protocol-enabled server from ONLINE to OFFLINE. An OFFLINE server cannot accept and process file transfer jobs. Information tied to your server, such as server and user properties, are not affected by stopping your server. Stopping the server will not reduce or impact your file transfer protocol endpoint billing; you must delete the server to stop being billed. The state of STOPPING indicates that the server is in an intermediate state, either not fully able to respond, or not fully offline. The values of STOP\_FAILED can indicate an error condition. No response is returned from this call.

``` swift
func stopServer(input: StopServerInput, completion: @escaping (ClientRuntime.SdkResult<StopServerOutputResponse, StopServerOutputError>) -> Void)
```

### tagResource(input:completion:)

Attaches a key-value pair to a resource, as identified by its Amazon Resource Name (ARN). Resources are users, servers, roles, and other entities. There is no response returned from this call.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### testIdentityProvider(input:completion:)

If the IdentityProviderType of a file transfer protocol-enabled server is AWS\_DIRECTORY\_SERVICE or API\_Gateway, tests whether your identity provider is set up successfully. We highly recommend that you call this operation to test your authentication method as soon as you create your server. By doing so, you can troubleshoot issues with the identity provider integration to ensure that your users can successfully use the service. The ServerId and UserName parameters are required. The ServerProtocol, SourceIp, and UserPassword are all optional. You cannot use TestIdentityProvider if the IdentityProviderType of your server is SERVICE\_MANAGED.

``` swift
func testIdentityProvider(input: TestIdentityProviderInput, completion: @escaping (ClientRuntime.SdkResult<TestIdentityProviderOutputResponse, TestIdentityProviderOutputError>) -> Void)
```

  - If you provide any incorrect values for any parameters, the Response field is empty.

  - If you provide a server ID for a server that uses service-managed users, you get an error:  An error occurred (InvalidRequestException) when calling the TestIdentityProvider operation: s-server-ID not configured for external auth

  - If you enter a Server ID for the --server-id parameter that does not identify an actual Transfer server, you receive the following error: An error occurred (ResourceNotFoundException) when calling the TestIdentityProvider operation: Unknown server

### untagResource(input:completion:)

Detaches a key-value pair from a resource, as identified by its Amazon Resource Name (ARN). Resources are users, servers, roles, and other entities. No response is returned from this call.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateAccess(input:completion:)

Allows you to update parameters for the access specified in the ServerID and ExternalID parameters.

``` swift
func updateAccess(input: UpdateAccessInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAccessOutputResponse, UpdateAccessOutputError>) -> Void)
```

### updateServer(input:completion:)

Updates the file transfer protocol-enabled server's properties after that server has been created. The UpdateServer call returns the ServerId of the server you updated.

``` swift
func updateServer(input: UpdateServerInput, completion: @escaping (ClientRuntime.SdkResult<UpdateServerOutputResponse, UpdateServerOutputError>) -> Void)
```

### updateUser(input:completion:)

Assigns new properties to a user. Parameters you pass modify any or all of the following: the home directory, role, and policy for the UserName and ServerId you specify. The response returns the ServerId and the UserName for the updated user.

``` swift
func updateUser(input: UpdateUserInput, completion: @escaping (ClientRuntime.SdkResult<UpdateUserOutputResponse, UpdateUserOutputError>) -> Void)
```
