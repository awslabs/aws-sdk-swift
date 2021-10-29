# CloudHsmV2ClientProtocol

For more information about AWS CloudHSM, see [AWS CloudHSM](http://aws.amazon.com/cloudhsm/) and the [AWS CloudHSM User Guide](https://docs.aws.amazon.com/cloudhsm/latest/userguide/).

``` swift
public protocol CloudHsmV2ClientProtocol 
```

## Requirements

### copyBackupToRegion(input:completion:)

Copy an AWS CloudHSM cluster backup to a different region.

``` swift
func copyBackupToRegion(input: CopyBackupToRegionInput, completion: @escaping (ClientRuntime.SdkResult<CopyBackupToRegionOutputResponse, CopyBackupToRegionOutputError>) -> Void)
```

### createCluster(input:completion:)

Creates a new AWS CloudHSM cluster.

``` swift
func createCluster(input: CreateClusterInput, completion: @escaping (ClientRuntime.SdkResult<CreateClusterOutputResponse, CreateClusterOutputError>) -> Void)
```

### createHsm(input:completion:)

Creates a new hardware security module (HSM) in the specified AWS CloudHSM cluster.

``` swift
func createHsm(input: CreateHsmInput, completion: @escaping (ClientRuntime.SdkResult<CreateHsmOutputResponse, CreateHsmOutputError>) -> Void)
```

### deleteBackup(input:completion:)

Deletes a specified AWS CloudHSM backup. A backup can be restored up to 7 days after the DeleteBackup request is made. For more information on restoring a backup, see \[RestoreBackup\].

``` swift
func deleteBackup(input: DeleteBackupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBackupOutputResponse, DeleteBackupOutputError>) -> Void)
```

### deleteCluster(input:completion:)

Deletes the specified AWS CloudHSM cluster. Before you can delete a cluster, you must delete all HSMs in the cluster. To see if the cluster contains any HSMs, use \[DescribeClusters\]. To delete an HSM, use \[DeleteHsm\].

``` swift
func deleteCluster(input: DeleteClusterInput, completion: @escaping (ClientRuntime.SdkResult<DeleteClusterOutputResponse, DeleteClusterOutputError>) -> Void)
```

### deleteHsm(input:completion:)

Deletes the specified HSM. To specify an HSM, you can use its identifier (ID), the IP address of the HSM's elastic network interface (ENI), or the ID of the HSM's ENI. You need to specify only one of these values. To find these values, use \[DescribeClusters\].

``` swift
func deleteHsm(input: DeleteHsmInput, completion: @escaping (ClientRuntime.SdkResult<DeleteHsmOutputResponse, DeleteHsmOutputError>) -> Void)
```

### describeBackups(input:completion:)

Gets information about backups of AWS CloudHSM clusters. This is a paginated operation, which means that each response might contain only a subset of all the backups. When the response contains only a subset of backups, it includes a NextToken value. Use this value in a subsequent DescribeBackups request to get more backups. When you receive a response with no NextToken (or an empty or null value), that means there are no more backups to get.

``` swift
func describeBackups(input: DescribeBackupsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBackupsOutputResponse, DescribeBackupsOutputError>) -> Void)
```

### describeClusters(input:completion:)

Gets information about AWS CloudHSM clusters. This is a paginated operation, which means that each response might contain only a subset of all the clusters. When the response contains only a subset of clusters, it includes a NextToken value. Use this value in a subsequent DescribeClusters request to get more clusters. When you receive a response with no NextToken (or an empty or null value), that means there are no more clusters to get.

``` swift
func describeClusters(input: DescribeClustersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeClustersOutputResponse, DescribeClustersOutputError>) -> Void)
```

### initializeCluster(input:completion:)

Claims an AWS CloudHSM cluster by submitting the cluster certificate issued by your issuing certificate authority (CA) and the CA's root certificate. Before you can claim a cluster, you must sign the cluster's certificate signing request (CSR) with your issuing CA. To get the cluster's CSR, use \[DescribeClusters\].

``` swift
func initializeCluster(input: InitializeClusterInput, completion: @escaping (ClientRuntime.SdkResult<InitializeClusterOutputResponse, InitializeClusterOutputError>) -> Void)
```

### listTags(input:completion:)

Gets a list of tags for the specified AWS CloudHSM cluster. This is a paginated operation, which means that each response might contain only a subset of all the tags. When the response contains only a subset of tags, it includes a NextToken value. Use this value in a subsequent ListTags request to get more tags. When you receive a response with no NextToken (or an empty or null value), that means there are no more tags to get.

``` swift
func listTags(input: ListTagsInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsOutputResponse, ListTagsOutputError>) -> Void)
```

### modifyBackupAttributes(input:completion:)

Modifies attributes for AWS CloudHSM backup.

``` swift
func modifyBackupAttributes(input: ModifyBackupAttributesInput, completion: @escaping (ClientRuntime.SdkResult<ModifyBackupAttributesOutputResponse, ModifyBackupAttributesOutputError>) -> Void)
```

### modifyCluster(input:completion:)

Modifies AWS CloudHSM cluster.

``` swift
func modifyCluster(input: ModifyClusterInput, completion: @escaping (ClientRuntime.SdkResult<ModifyClusterOutputResponse, ModifyClusterOutputError>) -> Void)
```

### restoreBackup(input:completion:)

Restores a specified AWS CloudHSM backup that is in the PENDING\_DELETION state. For mor information on deleting a backup, see \[DeleteBackup\].

``` swift
func restoreBackup(input: RestoreBackupInput, completion: @escaping (ClientRuntime.SdkResult<RestoreBackupOutputResponse, RestoreBackupOutputError>) -> Void)
```

### tagResource(input:completion:)

Adds or overwrites one or more tags for the specified AWS CloudHSM cluster.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:completion:)

Removes the specified tag or tags from the specified AWS CloudHSM cluster.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```
