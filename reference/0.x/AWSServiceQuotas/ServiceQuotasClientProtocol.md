# ServiceQuotasClientProtocol

With Service Quotas, you can view and manage your quotas easily as your AWS workloads grow. Quotas, also referred to as limits, are the maximum number of resources that you can create in your AWS account. For more information, see the [Service Quotas User Guide](https://docs.aws.amazon.com/servicequotas/latest/userguide/).

``` swift
public protocol ServiceQuotasClientProtocol 
```

## Requirements

### associateServiceQuotaTemplate(input:completion:)

Associates your quota request template with your organization. When a new account is created in your organization, the quota increase requests in the template are automatically applied to the account. You can add a quota increase request for any adjustable quota to your template.

``` swift
func associateServiceQuotaTemplate(input: AssociateServiceQuotaTemplateInput, completion: @escaping (ClientRuntime.SdkResult<AssociateServiceQuotaTemplateOutputResponse, AssociateServiceQuotaTemplateOutputError>) -> Void)
```

### deleteServiceQuotaIncreaseRequestFromTemplate(input:completion:)

Deletes the quota increase request for the specified quota from your quota request template.

``` swift
func deleteServiceQuotaIncreaseRequestFromTemplate(input: DeleteServiceQuotaIncreaseRequestFromTemplateInput, completion: @escaping (ClientRuntime.SdkResult<DeleteServiceQuotaIncreaseRequestFromTemplateOutputResponse, DeleteServiceQuotaIncreaseRequestFromTemplateOutputError>) -> Void)
```

### disassociateServiceQuotaTemplate(input:completion:)

Disables your quota request template. After a template is disabled, the quota increase requests in the template are not applied to new accounts in your organization. Disabling a quota request template does not apply its quota increase requests.

``` swift
func disassociateServiceQuotaTemplate(input: DisassociateServiceQuotaTemplateInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateServiceQuotaTemplateOutputResponse, DisassociateServiceQuotaTemplateOutputError>) -> Void)
```

### getAssociationForServiceQuotaTemplate(input:completion:)

Retrieves the status of the association for the quota request template.

``` swift
func getAssociationForServiceQuotaTemplate(input: GetAssociationForServiceQuotaTemplateInput, completion: @escaping (ClientRuntime.SdkResult<GetAssociationForServiceQuotaTemplateOutputResponse, GetAssociationForServiceQuotaTemplateOutputError>) -> Void)
```

### getAWSDefaultServiceQuota(input:completion:)

Retrieves the default value for the specified quota. The default value does not reflect any quota increases.

``` swift
func getAWSDefaultServiceQuota(input: GetAWSDefaultServiceQuotaInput, completion: @escaping (ClientRuntime.SdkResult<GetAWSDefaultServiceQuotaOutputResponse, GetAWSDefaultServiceQuotaOutputError>) -> Void)
```

### getRequestedServiceQuotaChange(input:completion:)

Retrieves information about the specified quota increase request.

``` swift
func getRequestedServiceQuotaChange(input: GetRequestedServiceQuotaChangeInput, completion: @escaping (ClientRuntime.SdkResult<GetRequestedServiceQuotaChangeOutputResponse, GetRequestedServiceQuotaChangeOutputError>) -> Void)
```

### getServiceQuota(input:completion:)

Retrieves the applied quota value for the specified quota. For some quotas, only the default values are available. If the applied quota value is not available for a quota, the quota is not retrieved.

``` swift
func getServiceQuota(input: GetServiceQuotaInput, completion: @escaping (ClientRuntime.SdkResult<GetServiceQuotaOutputResponse, GetServiceQuotaOutputError>) -> Void)
```

### getServiceQuotaIncreaseRequestFromTemplate(input:completion:)

Retrieves information about the specified quota increase request in your quota request template.

``` swift
func getServiceQuotaIncreaseRequestFromTemplate(input: GetServiceQuotaIncreaseRequestFromTemplateInput, completion: @escaping (ClientRuntime.SdkResult<GetServiceQuotaIncreaseRequestFromTemplateOutputResponse, GetServiceQuotaIncreaseRequestFromTemplateOutputError>) -> Void)
```

### listAWSDefaultServiceQuotas(input:completion:)

Lists the default values for the quotas for the specified AWS service. A default value does not reflect any quota increases.

``` swift
func listAWSDefaultServiceQuotas(input: ListAWSDefaultServiceQuotasInput, completion: @escaping (ClientRuntime.SdkResult<ListAWSDefaultServiceQuotasOutputResponse, ListAWSDefaultServiceQuotasOutputError>) -> Void)
```

### listRequestedServiceQuotaChangeHistory(input:completion:)

Retrieves the quota increase requests for the specified service.

``` swift
func listRequestedServiceQuotaChangeHistory(input: ListRequestedServiceQuotaChangeHistoryInput, completion: @escaping (ClientRuntime.SdkResult<ListRequestedServiceQuotaChangeHistoryOutputResponse, ListRequestedServiceQuotaChangeHistoryOutputError>) -> Void)
```

### listRequestedServiceQuotaChangeHistoryByQuota(input:completion:)

Retrieves the quota increase requests for the specified quota.

``` swift
func listRequestedServiceQuotaChangeHistoryByQuota(input: ListRequestedServiceQuotaChangeHistoryByQuotaInput, completion: @escaping (ClientRuntime.SdkResult<ListRequestedServiceQuotaChangeHistoryByQuotaOutputResponse, ListRequestedServiceQuotaChangeHistoryByQuotaOutputError>) -> Void)
```

### listServiceQuotaIncreaseRequestsInTemplate(input:completion:)

Lists the quota increase requests in the specified quota request template.

``` swift
func listServiceQuotaIncreaseRequestsInTemplate(input: ListServiceQuotaIncreaseRequestsInTemplateInput, completion: @escaping (ClientRuntime.SdkResult<ListServiceQuotaIncreaseRequestsInTemplateOutputResponse, ListServiceQuotaIncreaseRequestsInTemplateOutputError>) -> Void)
```

### listServiceQuotas(input:completion:)

Lists the applied quota values for the specified AWS service. For some quotas, only the default values are available. If the applied quota value is not available for a quota, the quota is not retrieved.

``` swift
func listServiceQuotas(input: ListServiceQuotasInput, completion: @escaping (ClientRuntime.SdkResult<ListServiceQuotasOutputResponse, ListServiceQuotasOutputError>) -> Void)
```

### listServices(input:completion:)

Lists the names and codes for the services integrated with Service Quotas.

``` swift
func listServices(input: ListServicesInput, completion: @escaping (ClientRuntime.SdkResult<ListServicesOutputResponse, ListServicesOutputError>) -> Void)
```

### listTagsForResource(input:completion:)

Returns a list of the tags assigned to the specified applied quota.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### putServiceQuotaIncreaseRequestIntoTemplate(input:completion:)

Adds a quota increase request to your quota request template.

``` swift
func putServiceQuotaIncreaseRequestIntoTemplate(input: PutServiceQuotaIncreaseRequestIntoTemplateInput, completion: @escaping (ClientRuntime.SdkResult<PutServiceQuotaIncreaseRequestIntoTemplateOutputResponse, PutServiceQuotaIncreaseRequestIntoTemplateOutputError>) -> Void)
```

### requestServiceQuotaIncrease(input:completion:)

Submits a quota increase request for the specified quota.

``` swift
func requestServiceQuotaIncrease(input: RequestServiceQuotaIncreaseInput, completion: @escaping (ClientRuntime.SdkResult<RequestServiceQuotaIncreaseOutputResponse, RequestServiceQuotaIncreaseOutputError>) -> Void)
```

### tagResource(input:completion:)

Adds tags to the specified applied quota. You can include one or more tags to add to the quota.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:completion:)

Removes tags from the specified applied quota. You can specify one or more tags to remove.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```
