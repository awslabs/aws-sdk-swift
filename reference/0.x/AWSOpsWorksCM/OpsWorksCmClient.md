# OpsWorksCmClient

``` swift
public class OpsWorksCmClient 
```

## Inheritance

[`OpsWorksCmClientProtocol`](/aws-sdk-swift/reference/0.x/AWSOpsWorksCM/OpsWorksCmClientProtocol)

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
public static let clientName = "OpsWorksCmClient"
```

## Methods

### `associateNode(input:completion:)`

Associates a new node with the server. For more information about how to disassociate a node, see \[DisassociateNode\]. On a Chef server: This command is an alternative to knife bootstrap. Example (Chef): aws opsworks-cm associate-node --server-name MyServer --node-name MyManagedNode --engine-attributes "Name=CHEF\_ORGANIZATION,Value=default" "Name=CHEF\_NODE\_PUBLIC\_KEY,Value=public-key-pem" On a Puppet server, this command is an alternative to the puppet cert sign command that signs a Puppet node CSR. Example (Puppet): aws opsworks-cm associate-node --server-name MyServer --node-name MyManagedNode --engine-attributes "Name=PUPPET\_NODE\_CSR,Value=csr-pem" A node can can only be associated with servers that are in a HEALTHY state. Otherwise, an InvalidStateException is thrown. A ResourceNotFoundException is thrown when the server does not exist. A ValidationException is raised when parameters of the request are not valid. The AssociateNode API call can be integrated into Auto Scaling configurations, AWS Cloudformation templates, or the user data of a server's instance.

``` swift
public func associateNode(input: AssociateNodeInput, completion: @escaping (ClientRuntime.SdkResult<AssociateNodeOutputResponse, AssociateNodeOutputError>) -> Void)
```

### `createBackup(input:completion:)`

Creates an application-level backup of a server. While the server is in the BACKING\_UP state, the server cannot be changed, and no additional backup can be created. Backups can be created for servers in RUNNING, HEALTHY, and UNHEALTHY states. By default, you can create a maximum of 50 manual backups. This operation is asynchronous. A LimitExceededException is thrown when the maximum number of manual backups is reached. An InvalidStateException is thrown when the server is not in any of the following states: RUNNING, HEALTHY, or UNHEALTHY. A ResourceNotFoundException is thrown when the server is not found. A ValidationException is thrown when parameters of the request are not valid.

``` swift
public func createBackup(input: CreateBackupInput, completion: @escaping (ClientRuntime.SdkResult<CreateBackupOutputResponse, CreateBackupOutputError>) -> Void)
```

### `createServer(input:completion:)`

Creates and immedately starts a new server. The server is ready to use when it is in the HEALTHY state. By default, you can create a maximum of 10 servers. This operation is asynchronous. A LimitExceededException is thrown when you have created the maximum number of servers (10). A ResourceAlreadyExistsException is thrown when a server with the same name already exists in the account. A ResourceNotFoundException is thrown when you specify a backup ID that is not valid or is for a backup that does not exist. A ValidationException is thrown when parameters of the request are not valid. If you do not specify a security group by adding the SecurityGroupIds parameter, AWS OpsWorks creates a new security group. Chef Automate: The default security group opens the Chef server to the world on TCP port 443. If a KeyName is present, AWS OpsWorks enables SSH access. SSH is also open to the world on TCP port 22. Puppet Enterprise: The default security group opens TCP ports 22, 443, 4433, 8140, 8142, 8143, and 8170. If a KeyName is present, AWS OpsWorks enables SSH access. SSH is also open to the world on TCP port 22. By default, your server is accessible from any IP address. We recommend that you update your security group rules to allow access from known IP addresses and address ranges only. To edit security group rules, open Security Groups in the navigation pane of the EC2 management console. To specify your own domain for a server, and provide your own self-signed or CA-signed certificate and private key, specify values for CustomDomain, CustomCertificate, and CustomPrivateKey.

``` swift
public func createServer(input: CreateServerInput, completion: @escaping (ClientRuntime.SdkResult<CreateServerOutputResponse, CreateServerOutputError>) -> Void)
```

### `deleteBackup(input:completion:)`

Deletes a backup. You can delete both manual and automated backups. This operation is asynchronous. An InvalidStateException is thrown when a backup deletion is already in progress. A ResourceNotFoundException is thrown when the backup does not exist. A ValidationException is thrown when parameters of the request are not valid.

``` swift
public func deleteBackup(input: DeleteBackupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBackupOutputResponse, DeleteBackupOutputError>) -> Void)
```

### `deleteServer(input:completion:)`

Deletes the server and the underlying AWS CloudFormation stacks (including the server's EC2 instance). When you run this command, the server state is updated to DELETING. After the server is deleted, it is no longer returned by DescribeServer requests. If the AWS CloudFormation stack cannot be deleted, the server cannot be deleted. This operation is asynchronous. An InvalidStateException is thrown when a server deletion is already in progress. A ResourceNotFoundException is thrown when the server does not exist. A ValidationException is raised when parameters of the request are not valid.

``` swift
public func deleteServer(input: DeleteServerInput, completion: @escaping (ClientRuntime.SdkResult<DeleteServerOutputResponse, DeleteServerOutputError>) -> Void)
```

### `describeAccountAttributes(input:completion:)`

Describes your OpsWorks-CM account attributes. This operation is synchronous.

``` swift
public func describeAccountAttributes(input: DescribeAccountAttributesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAccountAttributesOutputResponse, DescribeAccountAttributesOutputError>) -> Void)
```

### `describeBackups(input:completion:)`

Describes backups. The results are ordered by time, with newest backups first. If you do not specify a BackupId or ServerName, the command returns all backups. This operation is synchronous. A ResourceNotFoundException is thrown when the backup does not exist. A ValidationException is raised when parameters of the request are not valid.

``` swift
public func describeBackups(input: DescribeBackupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBackupsOutputResponse, DescribeBackupsOutputError>) -> Void)
```

### `describeEvents(input:completion:)`

Describes events for a specified server. Results are ordered by time, with newest events first. This operation is synchronous. A ResourceNotFoundException is thrown when the server does not exist. A ValidationException is raised when parameters of the request are not valid.

``` swift
public func describeEvents(input: DescribeEventsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEventsOutputResponse, DescribeEventsOutputError>) -> Void)
```

### `describeNodeAssociationStatus(input:completion:)`

Returns the current status of an existing association or disassociation request. A ResourceNotFoundException is thrown when no recent association or disassociation request with the specified token is found, or when the server does not exist. A ValidationException is raised when parameters of the request are not valid.

``` swift
public func describeNodeAssociationStatus(input: DescribeNodeAssociationStatusInput, completion: @escaping (ClientRuntime.SdkResult<DescribeNodeAssociationStatusOutputResponse, DescribeNodeAssociationStatusOutputError>) -> Void)
```

### `describeServers(input:completion:)`

Lists all configuration management servers that are identified with your account. Only the stored results from Amazon DynamoDB are returned. AWS OpsWorks CM does not query other services. This operation is synchronous. A ResourceNotFoundException is thrown when the server does not exist. A ValidationException is raised when parameters of the request are not valid.

``` swift
public func describeServers(input: DescribeServersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeServersOutputResponse, DescribeServersOutputError>) -> Void)
```

### `disassociateNode(input:completion:)`

Disassociates a node from an AWS OpsWorks CM server, and removes the node from the server's managed nodes. After a node is disassociated, the node key pair is no longer valid for accessing the configuration manager's API. For more information about how to associate a node, see \[AssociateNode\]. A node can can only be disassociated from a server that is in a HEALTHY state. Otherwise, an InvalidStateException is thrown. A ResourceNotFoundException is thrown when the server does not exist. A ValidationException is raised when parameters of the request are not valid.

``` swift
public func disassociateNode(input: DisassociateNodeInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateNodeOutputResponse, DisassociateNodeOutputError>) -> Void)
```

### `exportServerEngineAttribute(input:completion:)`

Exports a specified server engine attribute as a base64-encoded string. For example, you can export user data that you can use in EC2 to associate nodes with a server. This operation is synchronous. A ValidationException is raised when parameters of the request are not valid. A ResourceNotFoundException is thrown when the server does not exist. An InvalidStateException is thrown when the server is in any of the following states: CREATING, TERMINATED, FAILED or DELETING.

``` swift
public func exportServerEngineAttribute(input: ExportServerEngineAttributeInput, completion: @escaping (ClientRuntime.SdkResult<ExportServerEngineAttributeOutputResponse, ExportServerEngineAttributeOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Returns a list of tags that are applied to the specified AWS OpsWorks for Chef Automate or AWS OpsWorks for Puppet Enterprise servers or backups.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `restoreServer(input:completion:)`

Restores a backup to a server that is in a CONNECTION\_LOST, HEALTHY, RUNNING, UNHEALTHY, or TERMINATED state. When you run RestoreServer, the server's EC2 instance is deleted, and a new EC2 instance is configured. RestoreServer maintains the existing server endpoint, so configuration management of the server's client devices (nodes) should continue to work. Restoring from a backup is performed by creating a new EC2 instance. If restoration is successful, and the server is in a HEALTHY state, AWS OpsWorks CM switches traffic over to the new instance. After restoration is finished, the old EC2 instance is maintained in a Running or Stopped state, but is eventually terminated. This operation is asynchronous. An InvalidStateException is thrown when the server is not in a valid state. A ResourceNotFoundException is thrown when the server does not exist. A ValidationException is raised when parameters of the request are not valid.

``` swift
public func restoreServer(input: RestoreServerInput, completion: @escaping (ClientRuntime.SdkResult<RestoreServerOutputResponse, RestoreServerOutputError>) -> Void)
```

### `startMaintenance(input:completion:)`

Manually starts server maintenance. This command can be useful if an earlier maintenance attempt failed, and the underlying cause of maintenance failure has been resolved. The server is in an UNDER\_MAINTENANCE state while maintenance is in progress. Maintenance can only be started on servers in HEALTHY and UNHEALTHY states. Otherwise, an InvalidStateException is thrown. A ResourceNotFoundException is thrown when the server does not exist. A ValidationException is raised when parameters of the request are not valid.

``` swift
public func startMaintenance(input: StartMaintenanceInput, completion: @escaping (ClientRuntime.SdkResult<StartMaintenanceOutputResponse, StartMaintenanceOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Applies tags to an AWS OpsWorks for Chef Automate or AWS OpsWorks for Puppet Enterprise server, or to server backups.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes specified tags from an AWS OpsWorks-CM server or backup.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateServer(input:completion:)`

Updates settings for a server. This operation is synchronous.

``` swift
public func updateServer(input: UpdateServerInput, completion: @escaping (ClientRuntime.SdkResult<UpdateServerOutputResponse, UpdateServerOutputError>) -> Void)
```

### `updateServerEngineAttributes(input:completion:)`

Updates engine-specific attributes on a specified server. The server enters the MODIFYING state when this operation is in progress. Only one update can occur at a time. You can use this command to reset a Chef server's public key (CHEF\_PIVOTAL\_KEY) or a Puppet server's admin password (PUPPET\_ADMIN\_PASSWORD). This operation is asynchronous. This operation can only be called for servers in HEALTHY or UNHEALTHY states. Otherwise, an InvalidStateException is raised. A ResourceNotFoundException is thrown when the server does not exist. A ValidationException is raised when parameters of the request are not valid.

``` swift
public func updateServerEngineAttributes(input: UpdateServerEngineAttributesInput, completion: @escaping (ClientRuntime.SdkResult<UpdateServerEngineAttributesOutputResponse, UpdateServerEngineAttributesOutputError>) -> Void)
```
