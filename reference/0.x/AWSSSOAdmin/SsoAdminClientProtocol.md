# SsoAdminClientProtocol

Amazon Web Services Single Sign On (SSO) is a cloud SSO service that makes it easy to centrally manage SSO access to multiple Amazon Web Services accounts and business applications. This guide provides information on SSO operations which could be used for access management of Amazon Web Services accounts. For information about Amazon Web Services SSO features, see the [Amazon Web Services Single Sign-On User Guide](https://docs.aws.amazon.com/singlesignon/latest/userguide/what-is.html). Many operations in the SSO APIs rely on identifiers for users and groups, known as principals. For more information about how to work with principals and principal IDs in Amazon Web Services SSO, see the [Amazon Web Services SSO Identity Store API Reference](https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/welcome.html).

``` swift
public protocol SsoAdminClientProtocol 
```

## Requirements

### attachManagedPolicyToPermissionSet(input:completion:)

Attaches an IAM managed policy ARN to a permission set. If the permission set is already referenced by one or more account assignments, you will need to call \[ProvisionPermissionSet\] after this operation. Calling ProvisionPermissionSet applies the corresponding IAM policy updates to all assigned accounts.

``` swift
func attachManagedPolicyToPermissionSet(input: AttachManagedPolicyToPermissionSetInput, completion: @escaping (ClientRuntime.SdkResult<AttachManagedPolicyToPermissionSetOutputResponse, AttachManagedPolicyToPermissionSetOutputError>) -> Void)
```

### createAccountAssignment(input:completion:)

Assigns access to a principal for a specified Amazon Web Services account using a specified permission set. The term principal here refers to a user or group that is defined in Amazon Web Services SSO. As part of a successful CreateAccountAssignment call, the specified permission set will automatically be provisioned to the account in the form of an IAM policy. That policy is attached to the SSO-created IAM role. If the permission set is subsequently updated, the corresponding IAM policies attached to roles in your accounts will not be updated automatically. In this case, you must call \[ProvisionPermissionSet\] to make these updates.

``` swift
func createAccountAssignment(input: CreateAccountAssignmentInput, completion: @escaping (ClientRuntime.SdkResult<CreateAccountAssignmentOutputResponse, CreateAccountAssignmentOutputError>) -> Void)
```

### createInstanceAccessControlAttributeConfiguration(input:completion:)

Enables the attributes-based access control (ABAC) feature for the specified Amazon Web Services SSO instance. You can also specify new attributes to add to your ABAC configuration during the enabling process. For more information about ABAC, see \[Attribute-Based Access Control\] in the Amazon Web Services SSO User Guide.

``` swift
func createInstanceAccessControlAttributeConfiguration(input: CreateInstanceAccessControlAttributeConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<CreateInstanceAccessControlAttributeConfigurationOutputResponse, CreateInstanceAccessControlAttributeConfigurationOutputError>) -> Void)
```

### createPermissionSet(input:completion:)

Creates a permission set within a specified SSO instance. To grant users and groups access to Amazon Web Services account resources, use \[CreateAccountAssignment\].

``` swift
func createPermissionSet(input: CreatePermissionSetInput, completion: @escaping (ClientRuntime.SdkResult<CreatePermissionSetOutputResponse, CreatePermissionSetOutputError>) -> Void)
```

### deleteAccountAssignment(input:completion:)

Deletes a principal's access from a specified Amazon Web Services account using a specified permission set.

``` swift
func deleteAccountAssignment(input: DeleteAccountAssignmentInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAccountAssignmentOutputResponse, DeleteAccountAssignmentOutputError>) -> Void)
```

### deleteInlinePolicyFromPermissionSet(input:completion:)

Deletes the inline policy from a specified permission set.

``` swift
func deleteInlinePolicyFromPermissionSet(input: DeleteInlinePolicyFromPermissionSetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteInlinePolicyFromPermissionSetOutputResponse, DeleteInlinePolicyFromPermissionSetOutputError>) -> Void)
```

### deleteInstanceAccessControlAttributeConfiguration(input:completion:)

Disables the attributes-based access control (ABAC) feature for the specified Amazon Web Services SSO instance and deletes all of the attribute mappings that have been configured. Once deleted, any attributes that are received from an identity source and any custom attributes you have previously configured will not be passed. For more information about ABAC, see \[Attribute-Based Access Control\] in the Amazon Web Services SSO User Guide.

``` swift
func deleteInstanceAccessControlAttributeConfiguration(input: DeleteInstanceAccessControlAttributeConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteInstanceAccessControlAttributeConfigurationOutputResponse, DeleteInstanceAccessControlAttributeConfigurationOutputError>) -> Void)
```

### deletePermissionSet(input:completion:)

Deletes the specified permission set.

``` swift
func deletePermissionSet(input: DeletePermissionSetInput, completion: @escaping (ClientRuntime.SdkResult<DeletePermissionSetOutputResponse, DeletePermissionSetOutputError>) -> Void)
```

### describeAccountAssignmentCreationStatus(input:completion:)

Describes the status of the assignment creation request.

``` swift
func describeAccountAssignmentCreationStatus(input: DescribeAccountAssignmentCreationStatusInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAccountAssignmentCreationStatusOutputResponse, DescribeAccountAssignmentCreationStatusOutputError>) -> Void)
```

### describeAccountAssignmentDeletionStatus(input:completion:)

Describes the status of the assignment deletion request.

``` swift
func describeAccountAssignmentDeletionStatus(input: DescribeAccountAssignmentDeletionStatusInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAccountAssignmentDeletionStatusOutputResponse, DescribeAccountAssignmentDeletionStatusOutputError>) -> Void)
```

### describeInstanceAccessControlAttributeConfiguration(input:completion:)

Returns the list of Amazon Web Services SSO identity store attributes that have been configured to work with attributes-based access control (ABAC) for the specified Amazon Web Services SSO instance. This will not return attributes configured and sent by an external identity provider. For more information about ABAC, see \[Attribute-Based Access Control\] in the Amazon Web Services SSO User Guide.

``` swift
func describeInstanceAccessControlAttributeConfiguration(input: DescribeInstanceAccessControlAttributeConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeInstanceAccessControlAttributeConfigurationOutputResponse, DescribeInstanceAccessControlAttributeConfigurationOutputError>) -> Void)
```

### describePermissionSet(input:completion:)

Gets the details of the permission set.

``` swift
func describePermissionSet(input: DescribePermissionSetInput, completion: @escaping (ClientRuntime.SdkResult<DescribePermissionSetOutputResponse, DescribePermissionSetOutputError>) -> Void)
```

### describePermissionSetProvisioningStatus(input:completion:)

Describes the status for the given permission set provisioning request.

``` swift
func describePermissionSetProvisioningStatus(input: DescribePermissionSetProvisioningStatusInput, completion: @escaping (ClientRuntime.SdkResult<DescribePermissionSetProvisioningStatusOutputResponse, DescribePermissionSetProvisioningStatusOutputError>) -> Void)
```

### detachManagedPolicyFromPermissionSet(input:completion:)

Detaches the attached IAM managed policy ARN from the specified permission set.

``` swift
func detachManagedPolicyFromPermissionSet(input: DetachManagedPolicyFromPermissionSetInput, completion: @escaping (ClientRuntime.SdkResult<DetachManagedPolicyFromPermissionSetOutputResponse, DetachManagedPolicyFromPermissionSetOutputError>) -> Void)
```

### getInlinePolicyForPermissionSet(input:completion:)

Obtains the inline policy assigned to the permission set.

``` swift
func getInlinePolicyForPermissionSet(input: GetInlinePolicyForPermissionSetInput, completion: @escaping (ClientRuntime.SdkResult<GetInlinePolicyForPermissionSetOutputResponse, GetInlinePolicyForPermissionSetOutputError>) -> Void)
```

### listAccountAssignmentCreationStatus(input:completion:)

Lists the status of the Amazon Web Services account assignment creation requests for a specified SSO instance.

``` swift
func listAccountAssignmentCreationStatus(input: ListAccountAssignmentCreationStatusInput, completion: @escaping (ClientRuntime.SdkResult<ListAccountAssignmentCreationStatusOutputResponse, ListAccountAssignmentCreationStatusOutputError>) -> Void)
```

### listAccountAssignmentDeletionStatus(input:completion:)

Lists the status of the Amazon Web Services account assignment deletion requests for a specified SSO instance.

``` swift
func listAccountAssignmentDeletionStatus(input: ListAccountAssignmentDeletionStatusInput, completion: @escaping (ClientRuntime.SdkResult<ListAccountAssignmentDeletionStatusOutputResponse, ListAccountAssignmentDeletionStatusOutputError>) -> Void)
```

### listAccountAssignments(input:completion:)

Lists the assignee of the specified Amazon Web Services account with the specified permission set.

``` swift
func listAccountAssignments(input: ListAccountAssignmentsInput, completion: @escaping (ClientRuntime.SdkResult<ListAccountAssignmentsOutputResponse, ListAccountAssignmentsOutputError>) -> Void)
```

### listAccountsForProvisionedPermissionSet(input:completion:)

Lists all the Amazon Web Services accounts where the specified permission set is provisioned.

``` swift
func listAccountsForProvisionedPermissionSet(input: ListAccountsForProvisionedPermissionSetInput, completion: @escaping (ClientRuntime.SdkResult<ListAccountsForProvisionedPermissionSetOutputResponse, ListAccountsForProvisionedPermissionSetOutputError>) -> Void)
```

### listInstances(input:completion:)

Lists the SSO instances that the caller has access to.

``` swift
func listInstances(input: ListInstancesInput, completion: @escaping (ClientRuntime.SdkResult<ListInstancesOutputResponse, ListInstancesOutputError>) -> Void)
```

### listManagedPoliciesInPermissionSet(input:completion:)

Lists the IAM managed policy that is attached to a specified permission set.

``` swift
func listManagedPoliciesInPermissionSet(input: ListManagedPoliciesInPermissionSetInput, completion: @escaping (ClientRuntime.SdkResult<ListManagedPoliciesInPermissionSetOutputResponse, ListManagedPoliciesInPermissionSetOutputError>) -> Void)
```

### listPermissionSetProvisioningStatus(input:completion:)

Lists the status of the permission set provisioning requests for a specified SSO instance.

``` swift
func listPermissionSetProvisioningStatus(input: ListPermissionSetProvisioningStatusInput, completion: @escaping (ClientRuntime.SdkResult<ListPermissionSetProvisioningStatusOutputResponse, ListPermissionSetProvisioningStatusOutputError>) -> Void)
```

### listPermissionSets(input:completion:)

Lists the \[PermissionSet\]s in an SSO instance.

``` swift
func listPermissionSets(input: ListPermissionSetsInput, completion: @escaping (ClientRuntime.SdkResult<ListPermissionSetsOutputResponse, ListPermissionSetsOutputError>) -> Void)
```

### listPermissionSetsProvisionedToAccount(input:completion:)

Lists all the permission sets that are provisioned to a specified Amazon Web Services account.

``` swift
func listPermissionSetsProvisionedToAccount(input: ListPermissionSetsProvisionedToAccountInput, completion: @escaping (ClientRuntime.SdkResult<ListPermissionSetsProvisionedToAccountOutputResponse, ListPermissionSetsProvisionedToAccountOutputError>) -> Void)
```

### listTagsForResource(input:completion:)

Lists the tags that are attached to a specified resource.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### provisionPermissionSet(input:completion:)

The process by which a specified permission set is provisioned to the specified target.

``` swift
func provisionPermissionSet(input: ProvisionPermissionSetInput, completion: @escaping (ClientRuntime.SdkResult<ProvisionPermissionSetOutputResponse, ProvisionPermissionSetOutputError>) -> Void)
```

### putInlinePolicyToPermissionSet(input:completion:)

Attaches an IAM inline policy to a permission set. If the permission set is already referenced by one or more account assignments, you will need to call \[ProvisionPermissionSet\] after this action to apply the corresponding IAM policy updates to all assigned accounts.

``` swift
func putInlinePolicyToPermissionSet(input: PutInlinePolicyToPermissionSetInput, completion: @escaping (ClientRuntime.SdkResult<PutInlinePolicyToPermissionSetOutputResponse, PutInlinePolicyToPermissionSetOutputError>) -> Void)
```

### tagResource(input:completion:)

Associates a set of tags with a specified resource.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:completion:)

Disassociates a set of tags from a specified resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateInstanceAccessControlAttributeConfiguration(input:completion:)

Updates the Amazon Web Services SSO identity store attributes that you can use with the Amazon Web Services SSO instance for attributes-based access control (ABAC). When using an external identity provider as an identity source, you can pass attributes through the SAML assertion as an alternative to configuring attributes from the Amazon Web Services SSO identity store. If a SAML assertion passes any of these attributes, Amazon Web Services SSO replaces the attribute value with the value from the Amazon Web Services SSO identity store. For more information about ABAC, see \[Attribute-Based Access Control\] in the Amazon Web Services SSO User Guide.

``` swift
func updateInstanceAccessControlAttributeConfiguration(input: UpdateInstanceAccessControlAttributeConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateInstanceAccessControlAttributeConfigurationOutputResponse, UpdateInstanceAccessControlAttributeConfigurationOutputError>) -> Void)
```

### updatePermissionSet(input:completion:)

Updates an existing permission set.

``` swift
func updatePermissionSet(input: UpdatePermissionSetInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePermissionSetOutputResponse, UpdatePermissionSetOutputError>) -> Void)
```
