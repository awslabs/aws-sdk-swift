# CloudHsmClient

``` swift
public class CloudHsmClient 
```

## Inheritance

[`CloudHsmClientProtocol`](/aws-sdk-swift/reference/0.x/AWSCloudHSM/CloudHsmClientProtocol)

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
public static let clientName = "CloudHsmClient"
```

## Methods

### `addTagsToResource(input:completion:)`

This is documentation for AWS CloudHSM Classic. For more information, see [AWS CloudHSM Classic FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM Classic User Guide](https://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the [AWS CloudHSM Classic API Reference](https://docs.aws.amazon.com/cloudhsm/classic/APIReference/). For information about the current version of AWS CloudHSM, see [AWS CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User Guide](https://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the [AWS CloudHSM API Reference](https://docs.aws.amazon.com/cloudhsm/latest/APIReference/). Adds or overwrites one or more tags for the specified AWS CloudHSM resource. Each tag consists of a key and a value. Tag keys must be unique to each resource.

``` swift
public func addTagsToResource(input: AddTagsToResourceInput, completion: @escaping (ClientRuntime.SdkResult<AddTagsToResourceOutputResponse, AddTagsToResourceOutputError>) -> Void)
```

### `createHapg(input:completion:)`

This is documentation for AWS CloudHSM Classic. For more information, see [AWS CloudHSM Classic FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM Classic User Guide](https://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the [AWS CloudHSM Classic API Reference](https://docs.aws.amazon.com/cloudhsm/classic/APIReference/). For information about the current version of AWS CloudHSM, see [AWS CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User Guide](https://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the [AWS CloudHSM API Reference](https://docs.aws.amazon.com/cloudhsm/latest/APIReference/). Creates a high-availability partition group. A high-availability partition group is a group of partitions that spans multiple physical HSMs.

``` swift
public func createHapg(input: CreateHapgInput, completion: @escaping (ClientRuntime.SdkResult<CreateHapgOutputResponse, CreateHapgOutputError>) -> Void)
```

### `createHsm(input:completion:)`

This is documentation for AWS CloudHSM Classic. For more information, see [AWS CloudHSM Classic FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM Classic User Guide](https://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the [AWS CloudHSM Classic API Reference](https://docs.aws.amazon.com/cloudhsm/classic/APIReference/). For information about the current version of AWS CloudHSM, see [AWS CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User Guide](https://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the [AWS CloudHSM API Reference](https://docs.aws.amazon.com/cloudhsm/latest/APIReference/). Creates an uninitialized HSM instance. There is an upfront fee charged for each HSM instance that you create with the CreateHsm operation. If you accidentally provision an HSM and want to request a refund, delete the instance using the \[DeleteHsm\] operation, go to the [AWS Support Center](https://console.aws.amazon.com/support/home), create a new case, and select Account and Billing Support. It can take up to 20 minutes to create and provision an HSM. You can monitor the status of the HSM with the \[DescribeHsm\] operation. The HSM is ready to be initialized when the status changes to RUNNING.

``` swift
public func createHsm(input: CreateHsmInput, completion: @escaping (ClientRuntime.SdkResult<CreateHsmOutputResponse, CreateHsmOutputError>) -> Void)
```

### `createLunaClient(input:completion:)`

This is documentation for AWS CloudHSM Classic. For more information, see [AWS CloudHSM Classic FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM Classic User Guide](https://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the [AWS CloudHSM Classic API Reference](https://docs.aws.amazon.com/cloudhsm/classic/APIReference/). For information about the current version of AWS CloudHSM, see [AWS CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User Guide](https://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the [AWS CloudHSM API Reference](https://docs.aws.amazon.com/cloudhsm/latest/APIReference/). Creates an HSM client.

``` swift
public func createLunaClient(input: CreateLunaClientInput, completion: @escaping (ClientRuntime.SdkResult<CreateLunaClientOutputResponse, CreateLunaClientOutputError>) -> Void)
```

### `deleteHapg(input:completion:)`

This is documentation for AWS CloudHSM Classic. For more information, see [AWS CloudHSM Classic FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM Classic User Guide](https://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the [AWS CloudHSM Classic API Reference](https://docs.aws.amazon.com/cloudhsm/classic/APIReference/). For information about the current version of AWS CloudHSM, see [AWS CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User Guide](https://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the [AWS CloudHSM API Reference](https://docs.aws.amazon.com/cloudhsm/latest/APIReference/). Deletes a high-availability partition group.

``` swift
public func deleteHapg(input: DeleteHapgInput, completion: @escaping (ClientRuntime.SdkResult<DeleteHapgOutputResponse, DeleteHapgOutputError>) -> Void)
```

### `deleteHsm(input:completion:)`

This is documentation for AWS CloudHSM Classic. For more information, see [AWS CloudHSM Classic FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM Classic User Guide](https://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the [AWS CloudHSM Classic API Reference](https://docs.aws.amazon.com/cloudhsm/classic/APIReference/). For information about the current version of AWS CloudHSM, see [AWS CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User Guide](https://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the [AWS CloudHSM API Reference](https://docs.aws.amazon.com/cloudhsm/latest/APIReference/). Deletes an HSM. After completion, this operation cannot be undone and your key material cannot be recovered.

``` swift
public func deleteHsm(input: DeleteHsmInput, completion: @escaping (ClientRuntime.SdkResult<DeleteHsmOutputResponse, DeleteHsmOutputError>) -> Void)
```

### `deleteLunaClient(input:completion:)`

This is documentation for AWS CloudHSM Classic. For more information, see [AWS CloudHSM Classic FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM Classic User Guide](https://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the [AWS CloudHSM Classic API Reference](https://docs.aws.amazon.com/cloudhsm/classic/APIReference/). For information about the current version of AWS CloudHSM, see [AWS CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User Guide](https://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the [AWS CloudHSM API Reference](https://docs.aws.amazon.com/cloudhsm/latest/APIReference/). Deletes a client.

``` swift
public func deleteLunaClient(input: DeleteLunaClientInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLunaClientOutputResponse, DeleteLunaClientOutputError>) -> Void)
```

### `describeHapg(input:completion:)`

This is documentation for AWS CloudHSM Classic. For more information, see [AWS CloudHSM Classic FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM Classic User Guide](https://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the [AWS CloudHSM Classic API Reference](https://docs.aws.amazon.com/cloudhsm/classic/APIReference/). For information about the current version of AWS CloudHSM, see [AWS CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User Guide](https://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the [AWS CloudHSM API Reference](https://docs.aws.amazon.com/cloudhsm/latest/APIReference/). Retrieves information about a high-availability partition group.

``` swift
public func describeHapg(input: DescribeHapgInput, completion: @escaping (ClientRuntime.SdkResult<DescribeHapgOutputResponse, DescribeHapgOutputError>) -> Void)
```

### `describeHsm(input:completion:)`

This is documentation for AWS CloudHSM Classic. For more information, see [AWS CloudHSM Classic FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM Classic User Guide](https://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the [AWS CloudHSM Classic API Reference](https://docs.aws.amazon.com/cloudhsm/classic/APIReference/). For information about the current version of AWS CloudHSM, see [AWS CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User Guide](https://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the [AWS CloudHSM API Reference](https://docs.aws.amazon.com/cloudhsm/latest/APIReference/). Retrieves information about an HSM. You can identify the HSM by its ARN or its serial number.

``` swift
public func describeHsm(input: DescribeHsmInput, completion: @escaping (ClientRuntime.SdkResult<DescribeHsmOutputResponse, DescribeHsmOutputError>) -> Void)
```

### `describeLunaClient(input:completion:)`

This is documentation for AWS CloudHSM Classic. For more information, see [AWS CloudHSM Classic FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM Classic User Guide](https://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the [AWS CloudHSM Classic API Reference](https://docs.aws.amazon.com/cloudhsm/classic/APIReference/). For information about the current version of AWS CloudHSM, see [AWS CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User Guide](https://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the [AWS CloudHSM API Reference](https://docs.aws.amazon.com/cloudhsm/latest/APIReference/). Retrieves information about an HSM client.

``` swift
public func describeLunaClient(input: DescribeLunaClientInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLunaClientOutputResponse, DescribeLunaClientOutputError>) -> Void)
```

### `getConfig(input:completion:)`

This is documentation for AWS CloudHSM Classic. For more information, see [AWS CloudHSM Classic FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM Classic User Guide](https://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the [AWS CloudHSM Classic API Reference](https://docs.aws.amazon.com/cloudhsm/classic/APIReference/). For information about the current version of AWS CloudHSM, see [AWS CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User Guide](https://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the [AWS CloudHSM API Reference](https://docs.aws.amazon.com/cloudhsm/latest/APIReference/). Gets the configuration files necessary to connect to all high availability partition groups the client is associated with.

``` swift
public func getConfig(input: GetConfigInput, completion: @escaping (ClientRuntime.SdkResult<GetConfigOutputResponse, GetConfigOutputError>) -> Void)
```

### `listAvailableZones(input:completion:)`

This is documentation for AWS CloudHSM Classic. For more information, see [AWS CloudHSM Classic FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM Classic User Guide](https://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the [AWS CloudHSM Classic API Reference](https://docs.aws.amazon.com/cloudhsm/classic/APIReference/). For information about the current version of AWS CloudHSM, see [AWS CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User Guide](https://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the [AWS CloudHSM API Reference](https://docs.aws.amazon.com/cloudhsm/latest/APIReference/). Lists the Availability Zones that have available AWS CloudHSM capacity.

``` swift
public func listAvailableZones(input: ListAvailableZonesInput, completion: @escaping (ClientRuntime.SdkResult<ListAvailableZonesOutputResponse, ListAvailableZonesOutputError>) -> Void)
```

### `listHapgs(input:completion:)`

This is documentation for AWS CloudHSM Classic. For more information, see [AWS CloudHSM Classic FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM Classic User Guide](https://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the [AWS CloudHSM Classic API Reference](https://docs.aws.amazon.com/cloudhsm/classic/APIReference/). For information about the current version of AWS CloudHSM, see [AWS CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User Guide](https://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the [AWS CloudHSM API Reference](https://docs.aws.amazon.com/cloudhsm/latest/APIReference/). Lists the high-availability partition groups for the account. This operation supports pagination with the use of the NextToken member. If more results are available, the NextToken member of the response contains a token that you pass in the next call to ListHapgs to retrieve the next set of items.

``` swift
public func listHapgs(input: ListHapgsInput, completion: @escaping (ClientRuntime.SdkResult<ListHapgsOutputResponse, ListHapgsOutputError>) -> Void)
```

### `listHsms(input:completion:)`

This is documentation for AWS CloudHSM Classic. For more information, see [AWS CloudHSM Classic FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM Classic User Guide](https://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the [AWS CloudHSM Classic API Reference](https://docs.aws.amazon.com/cloudhsm/classic/APIReference/). For information about the current version of AWS CloudHSM, see [AWS CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User Guide](https://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the [AWS CloudHSM API Reference](https://docs.aws.amazon.com/cloudhsm/latest/APIReference/). Retrieves the identifiers of all of the HSMs provisioned for the current customer. This operation supports pagination with the use of the NextToken member. If more results are available, the NextToken member of the response contains a token that you pass in the next call to ListHsms to retrieve the next set of items.

``` swift
public func listHsms(input: ListHsmsInput, completion: @escaping (ClientRuntime.SdkResult<ListHsmsOutputResponse, ListHsmsOutputError>) -> Void)
```

### `listLunaClients(input:completion:)`

This is documentation for AWS CloudHSM Classic. For more information, see [AWS CloudHSM Classic FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM Classic User Guide](https://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the [AWS CloudHSM Classic API Reference](https://docs.aws.amazon.com/cloudhsm/classic/APIReference/). For information about the current version of AWS CloudHSM, see [AWS CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User Guide](https://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the [AWS CloudHSM API Reference](https://docs.aws.amazon.com/cloudhsm/latest/APIReference/). Lists all of the clients. This operation supports pagination with the use of the NextToken member. If more results are available, the NextToken member of the response contains a token that you pass in the next call to ListLunaClients to retrieve the next set of items.

``` swift
public func listLunaClients(input: ListLunaClientsInput, completion: @escaping (ClientRuntime.SdkResult<ListLunaClientsOutputResponse, ListLunaClientsOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

This is documentation for AWS CloudHSM Classic. For more information, see [AWS CloudHSM Classic FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM Classic User Guide](https://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the [AWS CloudHSM Classic API Reference](https://docs.aws.amazon.com/cloudhsm/classic/APIReference/). For information about the current version of AWS CloudHSM, see [AWS CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User Guide](https://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the [AWS CloudHSM API Reference](https://docs.aws.amazon.com/cloudhsm/latest/APIReference/). Returns a list of all tags for the specified AWS CloudHSM resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `modifyHapg(input:completion:)`

This is documentation for AWS CloudHSM Classic. For more information, see [AWS CloudHSM Classic FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM Classic User Guide](https://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the [AWS CloudHSM Classic API Reference](https://docs.aws.amazon.com/cloudhsm/classic/APIReference/). For information about the current version of AWS CloudHSM, see [AWS CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User Guide](https://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the [AWS CloudHSM API Reference](https://docs.aws.amazon.com/cloudhsm/latest/APIReference/). Modifies an existing high-availability partition group.

``` swift
public func modifyHapg(input: ModifyHapgInput, completion: @escaping (ClientRuntime.SdkResult<ModifyHapgOutputResponse, ModifyHapgOutputError>) -> Void)
```

### `modifyHsm(input:completion:)`

This is documentation for AWS CloudHSM Classic. For more information, see [AWS CloudHSM Classic FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM Classic User Guide](https://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the [AWS CloudHSM Classic API Reference](https://docs.aws.amazon.com/cloudhsm/classic/APIReference/). For information about the current version of AWS CloudHSM, see [AWS CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User Guide](https://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the [AWS CloudHSM API Reference](https://docs.aws.amazon.com/cloudhsm/latest/APIReference/). Modifies an HSM. This operation can result in the HSM being offline for up to 15 minutes while the AWS CloudHSM service is reconfigured. If you are modifying a production HSM, you should ensure that your AWS CloudHSM service is configured for high availability, and consider executing this operation during a maintenance window.

``` swift
public func modifyHsm(input: ModifyHsmInput, completion: @escaping (ClientRuntime.SdkResult<ModifyHsmOutputResponse, ModifyHsmOutputError>) -> Void)
```

### `modifyLunaClient(input:completion:)`

This is documentation for AWS CloudHSM Classic. For more information, see [AWS CloudHSM Classic FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM Classic User Guide](https://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the [AWS CloudHSM Classic API Reference](https://docs.aws.amazon.com/cloudhsm/classic/APIReference/). For information about the current version of AWS CloudHSM, see [AWS CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User Guide](https://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the [AWS CloudHSM API Reference](https://docs.aws.amazon.com/cloudhsm/latest/APIReference/). Modifies the certificate used by the client. This action can potentially start a workflow to install the new certificate on the client's HSMs.

``` swift
public func modifyLunaClient(input: ModifyLunaClientInput, completion: @escaping (ClientRuntime.SdkResult<ModifyLunaClientOutputResponse, ModifyLunaClientOutputError>) -> Void)
```

### `removeTagsFromResource(input:completion:)`

This is documentation for AWS CloudHSM Classic. For more information, see [AWS CloudHSM Classic FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM Classic User Guide](https://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the [AWS CloudHSM Classic API Reference](https://docs.aws.amazon.com/cloudhsm/classic/APIReference/). For information about the current version of AWS CloudHSM, see [AWS CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User Guide](https://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the [AWS CloudHSM API Reference](https://docs.aws.amazon.com/cloudhsm/latest/APIReference/). Removes one or more tags from the specified AWS CloudHSM resource. To remove a tag, specify only the tag key to remove (not the value). To overwrite the value for an existing tag, use \[AddTagsToResource\].

``` swift
public func removeTagsFromResource(input: RemoveTagsFromResourceInput, completion: @escaping (ClientRuntime.SdkResult<RemoveTagsFromResourceOutputResponse, RemoveTagsFromResourceOutputError>) -> Void)
```
