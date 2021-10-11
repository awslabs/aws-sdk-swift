# ServiceQuotasClient

``` swift
public class ServiceQuotasClient 
```

## Inheritance

[`ServiceQuotasClientProtocol`](/aws-sdk-swift/reference/0.x/AWSServiceQuotas/ServiceQuotasClientProtocol)

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

### `associateServiceQuotaTemplate(input:completion:)`

Associates your quota request template with your organization. When a new account is
created in your organization, the quota increase requests in the template are automatically
applied to the account. You can add a quota increase request for any adjustable quota to your
template.

``` swift
public func associateServiceQuotaTemplate(input: AssociateServiceQuotaTemplateInput, completion: @escaping (ClientRuntime.SdkResult<AssociateServiceQuotaTemplateOutputResponse, AssociateServiceQuotaTemplateOutputError>) -> Void)
```

### `deleteServiceQuotaIncreaseRequestFromTemplate(input:completion:)`

Deletes the quota increase request for the specified quota from your quota request
template.

``` swift
public func deleteServiceQuotaIncreaseRequestFromTemplate(input: DeleteServiceQuotaIncreaseRequestFromTemplateInput, completion: @escaping (ClientRuntime.SdkResult<DeleteServiceQuotaIncreaseRequestFromTemplateOutputResponse, DeleteServiceQuotaIncreaseRequestFromTemplateOutputError>) -> Void)
```

### `disassociateServiceQuotaTemplate(input:completion:)`

Disables your quota request template. After a template is disabled, the quota increase
requests in the template are not applied to new accounts in your organization. Disabling a
quota request template does not apply its quota increase requests.

``` swift
public func disassociateServiceQuotaTemplate(input: DisassociateServiceQuotaTemplateInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateServiceQuotaTemplateOutputResponse, DisassociateServiceQuotaTemplateOutputError>) -> Void)
```

### `getAWSDefaultServiceQuota(input:completion:)`

Retrieves the default value for the specified quota. The default value does not reflect
any quota increases.

``` swift
public func getAWSDefaultServiceQuota(input: GetAWSDefaultServiceQuotaInput, completion: @escaping (ClientRuntime.SdkResult<GetAWSDefaultServiceQuotaOutputResponse, GetAWSDefaultServiceQuotaOutputError>) -> Void)
```

### `getAssociationForServiceQuotaTemplate(input:completion:)`

Retrieves the status of the association for the quota request template.

``` swift
public func getAssociationForServiceQuotaTemplate(input: GetAssociationForServiceQuotaTemplateInput, completion: @escaping (ClientRuntime.SdkResult<GetAssociationForServiceQuotaTemplateOutputResponse, GetAssociationForServiceQuotaTemplateOutputError>) -> Void)
```

### `getRequestedServiceQuotaChange(input:completion:)`

Retrieves information about the specified quota increase request.

``` swift
public func getRequestedServiceQuotaChange(input: GetRequestedServiceQuotaChangeInput, completion: @escaping (ClientRuntime.SdkResult<GetRequestedServiceQuotaChangeOutputResponse, GetRequestedServiceQuotaChangeOutputError>) -> Void)
```

### `getServiceQuota(input:completion:)`

Retrieves the applied quota value for the specified quota. For some quotas, only the
default values are available. If the applied quota value is not available for a quota, the
quota is not retrieved.

``` swift
public func getServiceQuota(input: GetServiceQuotaInput, completion: @escaping (ClientRuntime.SdkResult<GetServiceQuotaOutputResponse, GetServiceQuotaOutputError>) -> Void)
```

### `getServiceQuotaIncreaseRequestFromTemplate(input:completion:)`

Retrieves information about the specified quota increase request in your quota request
template.

``` swift
public func getServiceQuotaIncreaseRequestFromTemplate(input: GetServiceQuotaIncreaseRequestFromTemplateInput, completion: @escaping (ClientRuntime.SdkResult<GetServiceQuotaIncreaseRequestFromTemplateOutputResponse, GetServiceQuotaIncreaseRequestFromTemplateOutputError>) -> Void)
```

### `listAWSDefaultServiceQuotas(input:completion:)`

Lists the default values for the quotas for the specified AWS service. A default value
does not reflect any quota increases.

``` swift
public func listAWSDefaultServiceQuotas(input: ListAWSDefaultServiceQuotasInput, completion: @escaping (ClientRuntime.SdkResult<ListAWSDefaultServiceQuotasOutputResponse, ListAWSDefaultServiceQuotasOutputError>) -> Void)
```

### `listRequestedServiceQuotaChangeHistory(input:completion:)`

Retrieves the quota increase requests for the specified service.

``` swift
public func listRequestedServiceQuotaChangeHistory(input: ListRequestedServiceQuotaChangeHistoryInput, completion: @escaping (ClientRuntime.SdkResult<ListRequestedServiceQuotaChangeHistoryOutputResponse, ListRequestedServiceQuotaChangeHistoryOutputError>) -> Void)
```

### `listRequestedServiceQuotaChangeHistoryByQuota(input:completion:)`

Retrieves the quota increase requests for the specified quota.

``` swift
public func listRequestedServiceQuotaChangeHistoryByQuota(input: ListRequestedServiceQuotaChangeHistoryByQuotaInput, completion: @escaping (ClientRuntime.SdkResult<ListRequestedServiceQuotaChangeHistoryByQuotaOutputResponse, ListRequestedServiceQuotaChangeHistoryByQuotaOutputError>) -> Void)
```

### `listServiceQuotaIncreaseRequestsInTemplate(input:completion:)`

Lists the quota increase requests in the specified quota request template.

``` swift
public func listServiceQuotaIncreaseRequestsInTemplate(input: ListServiceQuotaIncreaseRequestsInTemplateInput, completion: @escaping (ClientRuntime.SdkResult<ListServiceQuotaIncreaseRequestsInTemplateOutputResponse, ListServiceQuotaIncreaseRequestsInTemplateOutputError>) -> Void)
```

### `listServiceQuotas(input:completion:)`

Lists the applied quota values for the specified AWS service. For some quotas, only the
default values are available. If the applied quota value is not available for a quota, the
quota is not retrieved.

``` swift
public func listServiceQuotas(input: ListServiceQuotasInput, completion: @escaping (ClientRuntime.SdkResult<ListServiceQuotasOutputResponse, ListServiceQuotasOutputError>) -> Void)
```

### `listServices(input:completion:)`

Lists the names and codes for the services integrated with Service Quotas.

``` swift
public func listServices(input: ListServicesInput, completion: @escaping (ClientRuntime.SdkResult<ListServicesOutputResponse, ListServicesOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Returns a list of the tags assigned to the specified applied quota.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `putServiceQuotaIncreaseRequestIntoTemplate(input:completion:)`

Adds a quota increase request to your quota request template.

``` swift
public func putServiceQuotaIncreaseRequestIntoTemplate(input: PutServiceQuotaIncreaseRequestIntoTemplateInput, completion: @escaping (ClientRuntime.SdkResult<PutServiceQuotaIncreaseRequestIntoTemplateOutputResponse, PutServiceQuotaIncreaseRequestIntoTemplateOutputError>) -> Void)
```

### `requestServiceQuotaIncrease(input:completion:)`

Submits a quota increase request for the specified quota.

``` swift
public func requestServiceQuotaIncrease(input: RequestServiceQuotaIncreaseInput, completion: @escaping (ClientRuntime.SdkResult<RequestServiceQuotaIncreaseOutputResponse, RequestServiceQuotaIncreaseOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Adds tags to the specified applied quota. You can include one or more tags to add to the
quota.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes tags from the specified applied quota. You can specify one or more tags to
remove.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```
