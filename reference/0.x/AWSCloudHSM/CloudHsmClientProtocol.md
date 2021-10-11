# CloudHsmClientProtocol

<fullname>AWS CloudHSM Service</fullname>
This is documentation for AWS CloudHSM Classic. For
more information, see <a href="http:​//aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM
Classic FAQs, the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
CloudHSM Classic User Guide, and the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS CloudHSM Classic API Reference.

``` swift
public protocol CloudHsmClientProtocol 
```

``` 
        For information about the current version of AWS
  CloudHSM, see <a href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM, the
  <a href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM User Guide,
  and the <a href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS CloudHSM API
  Reference.
```

## Requirements

### addTagsToResource(input:​completion:​)

This is documentation for AWS CloudHSM Classic. For
more information, see <a href="http:​//aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM
Classic FAQs, the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
CloudHSM Classic User Guide, and the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS CloudHSM Classic API Reference.

``` swift
func addTagsToResource(input: AddTagsToResourceInput, completion: @escaping (ClientRuntime.SdkResult<AddTagsToResourceOutputResponse, AddTagsToResourceOutputError>) -> Void)
```

``` 
        For information about the current version of AWS
  CloudHSM, see <a href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM, the
  <a href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM User Guide,
  and the <a href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS CloudHSM API
  Reference.
     Adds or overwrites one or more tags for the specified AWS CloudHSM resource.
     Each tag consists of a key and a value. Tag keys must be unique to each
  resource.
```

### createHapg(input:​completion:​)

This is documentation for AWS CloudHSM Classic. For
more information, see <a href="http:​//aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM
Classic FAQs, the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
CloudHSM Classic User Guide, and the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS CloudHSM Classic API Reference.

``` swift
func createHapg(input: CreateHapgInput, completion: @escaping (ClientRuntime.SdkResult<CreateHapgOutputResponse, CreateHapgOutputError>) -> Void)
```

``` 
        For information about the current version of AWS
  CloudHSM, see <a href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM, the
  <a href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM User Guide,
  and the <a href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS CloudHSM API
  Reference.
     Creates a high-availability partition group. A high-availability partition group is a
  group of partitions that spans multiple physical HSMs.
```

### createHsm(input:​completion:​)

This is documentation for AWS CloudHSM Classic. For
more information, see <a href="http:​//aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM
Classic FAQs, the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
CloudHSM Classic User Guide, and the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS CloudHSM Classic API Reference.

``` swift
func createHsm(input: CreateHsmInput, completion: @escaping (ClientRuntime.SdkResult<CreateHsmOutputResponse, CreateHsmOutputError>) -> Void)
```

``` 
        For information about the current version of AWS
  CloudHSM, see <a href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM, the
  <a href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM User Guide,
  and the <a href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS CloudHSM API
  Reference.
     Creates an uninitialized HSM instance.
     There is an upfront fee charged for each HSM instance that you create with the
    CreateHsm operation. If you accidentally provision an HSM and want to request a
  refund, delete the instance using the DeleteHsm operation, go to the <a href="https://console.aws.amazon.com/support/home">AWS Support Center, create a new case, and select
    Account and Billing Support.

        It can take up to 20 minutes to create and provision an HSM. You can monitor the
    status of the HSM with the DescribeHsm operation. The HSM is ready to be
    initialized when the status changes to RUNNING.
```

### createLunaClient(input:​completion:​)

This is documentation for AWS CloudHSM Classic. For
more information, see <a href="http:​//aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM
Classic FAQs, the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
CloudHSM Classic User Guide, and the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS CloudHSM Classic API Reference.

``` swift
func createLunaClient(input: CreateLunaClientInput, completion: @escaping (ClientRuntime.SdkResult<CreateLunaClientOutputResponse, CreateLunaClientOutputError>) -> Void)
```

``` 
        For information about the current version of AWS
  CloudHSM, see <a href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM, the
  <a href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM User Guide,
  and the <a href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS CloudHSM API
  Reference.
     Creates an HSM client.
```

### deleteHapg(input:​completion:​)

This is documentation for AWS CloudHSM Classic. For
more information, see <a href="http:​//aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM
Classic FAQs, the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
CloudHSM Classic User Guide, and the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS CloudHSM Classic API Reference.

``` swift
func deleteHapg(input: DeleteHapgInput, completion: @escaping (ClientRuntime.SdkResult<DeleteHapgOutputResponse, DeleteHapgOutputError>) -> Void)
```

``` 
        For information about the current version of AWS
  CloudHSM, see <a href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM, the
  <a href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM User Guide,
  and the <a href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS CloudHSM API
  Reference.
     Deletes a high-availability partition group.
```

### deleteHsm(input:​completion:​)

This is documentation for AWS CloudHSM Classic. For
more information, see <a href="http:​//aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM
Classic FAQs, the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
CloudHSM Classic User Guide, and the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS CloudHSM Classic API Reference.

``` swift
func deleteHsm(input: DeleteHsmInput, completion: @escaping (ClientRuntime.SdkResult<DeleteHsmOutputResponse, DeleteHsmOutputError>) -> Void)
```

``` 
        For information about the current version of AWS
  CloudHSM, see <a href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM, the
  <a href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM User Guide,
  and the <a href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS CloudHSM API
  Reference.
     Deletes an HSM. After completion, this operation cannot be undone and your key material
  cannot be recovered.
```

### deleteLunaClient(input:​completion:​)

This is documentation for AWS CloudHSM Classic. For
more information, see <a href="http:​//aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM
Classic FAQs, the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
CloudHSM Classic User Guide, and the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS CloudHSM Classic API Reference.

``` swift
func deleteLunaClient(input: DeleteLunaClientInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLunaClientOutputResponse, DeleteLunaClientOutputError>) -> Void)
```

``` 
        For information about the current version of AWS
  CloudHSM, see <a href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM, the
  <a href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM User Guide,
  and the <a href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS CloudHSM API
  Reference.
     Deletes a client.
```

### describeHapg(input:​completion:​)

This is documentation for AWS CloudHSM Classic. For
more information, see <a href="http:​//aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM
Classic FAQs, the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
CloudHSM Classic User Guide, and the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS CloudHSM Classic API Reference.

``` swift
func describeHapg(input: DescribeHapgInput, completion: @escaping (ClientRuntime.SdkResult<DescribeHapgOutputResponse, DescribeHapgOutputError>) -> Void)
```

``` 
        For information about the current version of AWS
  CloudHSM, see <a href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM, the
  <a href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM User Guide,
  and the <a href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS CloudHSM API
  Reference.
     Retrieves information about a high-availability partition group.
```

### describeHsm(input:​completion:​)

This is documentation for AWS CloudHSM Classic. For
more information, see <a href="http:​//aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM
Classic FAQs, the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
CloudHSM Classic User Guide, and the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS CloudHSM Classic API Reference.

``` swift
func describeHsm(input: DescribeHsmInput, completion: @escaping (ClientRuntime.SdkResult<DescribeHsmOutputResponse, DescribeHsmOutputError>) -> Void)
```

``` 
        For information about the current version of AWS
  CloudHSM, see <a href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM, the
  <a href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM User Guide,
  and the <a href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS CloudHSM API
  Reference.
     Retrieves information about an HSM. You can identify the HSM by its ARN or its serial
  number.
```

### describeLunaClient(input:​completion:​)

This is documentation for AWS CloudHSM Classic. For
more information, see <a href="http:​//aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM
Classic FAQs, the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
CloudHSM Classic User Guide, and the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS CloudHSM Classic API Reference.

``` swift
func describeLunaClient(input: DescribeLunaClientInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLunaClientOutputResponse, DescribeLunaClientOutputError>) -> Void)
```

``` 
        For information about the current version of AWS
  CloudHSM, see <a href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM, the
  <a href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM User Guide,
  and the <a href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS CloudHSM API
  Reference.
     Retrieves information about an HSM client.
```

### getConfig(input:​completion:​)

This is documentation for AWS CloudHSM Classic. For
more information, see <a href="http:​//aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM
Classic FAQs, the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
CloudHSM Classic User Guide, and the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS CloudHSM Classic API Reference.

``` swift
func getConfig(input: GetConfigInput, completion: @escaping (ClientRuntime.SdkResult<GetConfigOutputResponse, GetConfigOutputError>) -> Void)
```

``` 
        For information about the current version of AWS
  CloudHSM, see <a href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM, the
  <a href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM User Guide,
  and the <a href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS CloudHSM API
  Reference.
     Gets the configuration files necessary to connect to all high availability partition
  groups the client is associated with.
```

### listAvailableZones(input:​completion:​)

This is documentation for AWS CloudHSM Classic. For
more information, see <a href="http:​//aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM
Classic FAQs, the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
CloudHSM Classic User Guide, and the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS CloudHSM Classic API Reference.

``` swift
func listAvailableZones(input: ListAvailableZonesInput, completion: @escaping (ClientRuntime.SdkResult<ListAvailableZonesOutputResponse, ListAvailableZonesOutputError>) -> Void)
```

``` 
        For information about the current version of AWS
  CloudHSM, see <a href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM, the
  <a href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM User Guide,
  and the <a href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS CloudHSM API
  Reference.
     Lists the Availability Zones that have available AWS CloudHSM capacity.
```

### listHapgs(input:​completion:​)

This is documentation for AWS CloudHSM Classic. For
more information, see <a href="http:​//aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM
Classic FAQs, the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
CloudHSM Classic User Guide, and the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS CloudHSM Classic API Reference.

``` swift
func listHapgs(input: ListHapgsInput, completion: @escaping (ClientRuntime.SdkResult<ListHapgsOutputResponse, ListHapgsOutputError>) -> Void)
```

``` 
        For information about the current version of AWS
  CloudHSM, see <a href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM, the
  <a href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM User Guide,
  and the <a href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS CloudHSM API
  Reference.
     Lists the high-availability partition groups for the account.
     This operation supports pagination with the use of the NextToken member.
  If more results are available, the NextToken member of the response contains a
  token that you pass in the next call to ListHapgs to retrieve the next set of
  items.
```

### listHsms(input:​completion:​)

This is documentation for AWS CloudHSM Classic. For
more information, see <a href="http:​//aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM
Classic FAQs, the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
CloudHSM Classic User Guide, and the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS CloudHSM Classic API Reference.

``` swift
func listHsms(input: ListHsmsInput, completion: @escaping (ClientRuntime.SdkResult<ListHsmsOutputResponse, ListHsmsOutputError>) -> Void)
```

``` 
        For information about the current version of AWS
  CloudHSM, see <a href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM, the
  <a href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM User Guide,
  and the <a href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS CloudHSM API
  Reference.
     Retrieves the identifiers of all of the HSMs provisioned for the current
  customer.
     This operation supports pagination with the use of the NextToken member.
  If more results are available, the NextToken member of the response contains a
  token that you pass in the next call to ListHsms to retrieve the next set of
  items.
```

### listLunaClients(input:​completion:​)

This is documentation for AWS CloudHSM Classic. For
more information, see <a href="http:​//aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM
Classic FAQs, the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
CloudHSM Classic User Guide, and the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS CloudHSM Classic API Reference.

``` swift
func listLunaClients(input: ListLunaClientsInput, completion: @escaping (ClientRuntime.SdkResult<ListLunaClientsOutputResponse, ListLunaClientsOutputError>) -> Void)
```

``` 
        For information about the current version of AWS
  CloudHSM, see <a href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM, the
  <a href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM User Guide,
  and the <a href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS CloudHSM API
  Reference.
     Lists all of the clients.
     This operation supports pagination with the use of the NextToken member.
  If more results are available, the NextToken member of the response contains a
  token that you pass in the next call to ListLunaClients to retrieve the next set
  of items.
```

### listTagsForResource(input:​completion:​)

This is documentation for AWS CloudHSM Classic. For
more information, see <a href="http:​//aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM
Classic FAQs, the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
CloudHSM Classic User Guide, and the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS CloudHSM Classic API Reference.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

``` 
        For information about the current version of AWS
  CloudHSM, see <a href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM, the
  <a href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM User Guide,
  and the <a href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS CloudHSM API
  Reference.
     Returns a list of all tags for the specified AWS CloudHSM resource.
```

### modifyHapg(input:​completion:​)

This is documentation for AWS CloudHSM Classic. For
more information, see <a href="http:​//aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM
Classic FAQs, the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
CloudHSM Classic User Guide, and the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS CloudHSM Classic API Reference.

``` swift
func modifyHapg(input: ModifyHapgInput, completion: @escaping (ClientRuntime.SdkResult<ModifyHapgOutputResponse, ModifyHapgOutputError>) -> Void)
```

``` 
        For information about the current version of AWS
  CloudHSM, see <a href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM, the
  <a href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM User Guide,
  and the <a href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS CloudHSM API
  Reference.
     Modifies an existing high-availability partition group.
```

### modifyHsm(input:​completion:​)

This is documentation for AWS CloudHSM Classic. For
more information, see <a href="http:​//aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM
Classic FAQs, the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
CloudHSM Classic User Guide, and the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS CloudHSM Classic API Reference.

``` swift
func modifyHsm(input: ModifyHsmInput, completion: @escaping (ClientRuntime.SdkResult<ModifyHsmOutputResponse, ModifyHsmOutputError>) -> Void)
```

``` 
        For information about the current version of AWS
  CloudHSM, see <a href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM, the
  <a href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM User Guide,
  and the <a href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS CloudHSM API
  Reference.
     Modifies an HSM.

        This operation can result in the HSM being offline for up to 15 minutes while the AWS
    CloudHSM service is reconfigured. If you are modifying a production HSM, you should ensure
    that your AWS CloudHSM service is configured for high availability, and consider executing this
    operation during a maintenance window.
```

### modifyLunaClient(input:​completion:​)

This is documentation for AWS CloudHSM Classic. For
more information, see <a href="http:​//aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM
Classic FAQs, the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
CloudHSM Classic User Guide, and the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS CloudHSM Classic API Reference.

``` swift
func modifyLunaClient(input: ModifyLunaClientInput, completion: @escaping (ClientRuntime.SdkResult<ModifyLunaClientOutputResponse, ModifyLunaClientOutputError>) -> Void)
```

``` 
        For information about the current version of AWS
  CloudHSM, see <a href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM, the
  <a href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM User Guide,
  and the <a href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS CloudHSM API
  Reference.
     Modifies the certificate used by the client.
     This action can potentially start a workflow to install the new certificate on the
  client's HSMs.
```

### removeTagsFromResource(input:​completion:​)

This is documentation for AWS CloudHSM Classic. For
more information, see <a href="http:​//aws.amazon.com/cloudhsm/faqs-classic/">AWS CloudHSM
Classic FAQs, the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/userguide/">AWS
CloudHSM Classic User Guide, and the <a href="https:​//docs.aws.amazon.com/cloudhsm/classic/APIReference/">AWS CloudHSM Classic API Reference.

``` swift
func removeTagsFromResource(input: RemoveTagsFromResourceInput, completion: @escaping (ClientRuntime.SdkResult<RemoveTagsFromResourceOutputResponse, RemoveTagsFromResourceOutputError>) -> Void)
```

``` 
        For information about the current version of AWS
  CloudHSM, see <a href="http://aws.amazon.com/cloudhsm/">AWS CloudHSM, the
  <a href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/">AWS CloudHSM User Guide,
  and the <a href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/">AWS CloudHSM API
  Reference.
     Removes one or more tags from the specified AWS CloudHSM resource.
     To remove a tag, specify only the tag key to remove (not the value). To overwrite the
  value for an existing tag, use AddTagsToResource.
```
