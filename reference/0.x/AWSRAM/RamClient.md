# RamClient

``` swift
public class RamClient 
```

## Inheritance

[`RamClientProtocol`](/aws-sdk-swift/reference/0.x/AWSRAM/RamClientProtocol)

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
public static let clientName = "RamClient"
```

## Methods

### `acceptResourceShareInvitation(input:completion:)`

Accepts an invitation to a resource share from another Amazon Web Services account.

``` swift
public func acceptResourceShareInvitation(input: AcceptResourceShareInvitationInput, completion: @escaping (ClientRuntime.SdkResult<AcceptResourceShareInvitationOutputResponse, AcceptResourceShareInvitationOutputError>) -> Void)
```

### `associateResourceShare(input:completion:)`

Associates the specified resource share with the specified principals and resources.

``` swift
public func associateResourceShare(input: AssociateResourceShareInput, completion: @escaping (ClientRuntime.SdkResult<AssociateResourceShareOutputResponse, AssociateResourceShareOutputError>) -> Void)
```

### `associateResourceSharePermission(input:completion:)`

Associates a permission with a resource share.

``` swift
public func associateResourceSharePermission(input: AssociateResourceSharePermissionInput, completion: @escaping (ClientRuntime.SdkResult<AssociateResourceSharePermissionOutputResponse, AssociateResourceSharePermissionOutputError>) -> Void)
```

### `createResourceShare(input:completion:)`

Creates a resource share. You must provide a list of the Amazon Resource Names (ARNs) for the resources you want to share. You must also specify who you want to share the resources with, and the permissions that you grant them. Sharing a resource makes it available for use by principals outside of the Amazon Web Services account that created the resource. Sharing doesn't change any permissions or quotas that apply to the resource in the account that created it.

``` swift
public func createResourceShare(input: CreateResourceShareInput, completion: @escaping (ClientRuntime.SdkResult<CreateResourceShareOutputResponse, CreateResourceShareOutputError>) -> Void)
```

### `deleteResourceShare(input:completion:)`

Deletes the specified resource share.

``` swift
public func deleteResourceShare(input: DeleteResourceShareInput, completion: @escaping (ClientRuntime.SdkResult<DeleteResourceShareOutputResponse, DeleteResourceShareOutputError>) -> Void)
```

### `disassociateResourceShare(input:completion:)`

Disassociates the specified principals or resources from the specified resource share.

``` swift
public func disassociateResourceShare(input: DisassociateResourceShareInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateResourceShareOutputResponse, DisassociateResourceShareOutputError>) -> Void)
```

### `disassociateResourceSharePermission(input:completion:)`

Disassociates an RAM permission from a resource share.

``` swift
public func disassociateResourceSharePermission(input: DisassociateResourceSharePermissionInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateResourceSharePermissionOutputResponse, DisassociateResourceSharePermissionOutputError>) -> Void)
```

### `enableSharingWithAwsOrganization(input:completion:)`

Enables resource sharing within your organization in Organizations. The caller must be the master account for the organization.

``` swift
public func enableSharingWithAwsOrganization(input: EnableSharingWithAwsOrganizationInput, completion: @escaping (ClientRuntime.SdkResult<EnableSharingWithAwsOrganizationOutputResponse, EnableSharingWithAwsOrganizationOutputError>) -> Void)
```

### `getPermission(input:completion:)`

Gets the contents of an RAM permission in JSON format.

``` swift
public func getPermission(input: GetPermissionInput, completion: @escaping (ClientRuntime.SdkResult<GetPermissionOutputResponse, GetPermissionOutputError>) -> Void)
```

### `getResourcePolicies(input:completion:)`

Gets the policies for the specified resources that you own and have shared.

``` swift
public func getResourcePolicies(input: GetResourcePoliciesInput, completion: @escaping (ClientRuntime.SdkResult<GetResourcePoliciesOutputResponse, GetResourcePoliciesOutputError>) -> Void)
```

### `getResourceShareAssociations(input:completion:)`

Gets the resources or principals for the resource shares that you own.

``` swift
public func getResourceShareAssociations(input: GetResourceShareAssociationsInput, completion: @escaping (ClientRuntime.SdkResult<GetResourceShareAssociationsOutputResponse, GetResourceShareAssociationsOutputError>) -> Void)
```

### `getResourceShareInvitations(input:completion:)`

Gets the invitations that you have received for resource shares.

``` swift
public func getResourceShareInvitations(input: GetResourceShareInvitationsInput, completion: @escaping (ClientRuntime.SdkResult<GetResourceShareInvitationsOutputResponse, GetResourceShareInvitationsOutputError>) -> Void)
```

### `getResourceShares(input:completion:)`

Gets the resource shares that you own or the resource shares that are shared with you.

``` swift
public func getResourceShares(input: GetResourceSharesInput, completion: @escaping (ClientRuntime.SdkResult<GetResourceSharesOutputResponse, GetResourceSharesOutputError>) -> Void)
```

### `listPendingInvitationResources(input:completion:)`

Lists the resources in a resource share that is shared with you but that the invitation is still pending for.

``` swift
public func listPendingInvitationResources(input: ListPendingInvitationResourcesInput, completion: @escaping (ClientRuntime.SdkResult<ListPendingInvitationResourcesOutputResponse, ListPendingInvitationResourcesOutputError>) -> Void)
```

### `listPermissions(input:completion:)`

Lists the RAM permissions.

``` swift
public func listPermissions(input: ListPermissionsInput, completion: @escaping (ClientRuntime.SdkResult<ListPermissionsOutputResponse, ListPermissionsOutputError>) -> Void)
```

### `listPrincipals(input:completion:)`

Lists the principals that you have shared resources with or that have shared resources with you.

``` swift
public func listPrincipals(input: ListPrincipalsInput, completion: @escaping (ClientRuntime.SdkResult<ListPrincipalsOutputResponse, ListPrincipalsOutputError>) -> Void)
```

### `listResourceSharePermissions(input:completion:)`

Lists the RAM permissions that are associated with a resource share.

``` swift
public func listResourceSharePermissions(input: ListResourceSharePermissionsInput, completion: @escaping (ClientRuntime.SdkResult<ListResourceSharePermissionsOutputResponse, ListResourceSharePermissionsOutputError>) -> Void)
```

### `listResourceTypes(input:completion:)`

Lists the shareable resource types supported by RAM.

``` swift
public func listResourceTypes(input: ListResourceTypesInput, completion: @escaping (ClientRuntime.SdkResult<ListResourceTypesOutputResponse, ListResourceTypesOutputError>) -> Void)
```

### `listResources(input:completion:)`

Lists the resources that you added to a resource shares or the resources that are shared with you.

``` swift
public func listResources(input: ListResourcesInput, completion: @escaping (ClientRuntime.SdkResult<ListResourcesOutputResponse, ListResourcesOutputError>) -> Void)
```

### `promoteResourceShareCreatedFromPolicy(input:completion:)`

Resource shares that were created by attaching a policy to a resource are visible only to the resource share owner, and the resource share cannot be modified in RAM. Use this API action to promote the resource share. When you promote the resource share, it becomes:

``` swift
public func promoteResourceShareCreatedFromPolicy(input: PromoteResourceShareCreatedFromPolicyInput, completion: @escaping (ClientRuntime.SdkResult<PromoteResourceShareCreatedFromPolicyOutputResponse, PromoteResourceShareCreatedFromPolicyOutputError>) -> Void)
```

  - Visible to all principals that it is shared with.

  - Modifiable in RAM.

### `rejectResourceShareInvitation(input:completion:)`

Rejects an invitation to a resource share from another Amazon Web Services account.

``` swift
public func rejectResourceShareInvitation(input: RejectResourceShareInvitationInput, completion: @escaping (ClientRuntime.SdkResult<RejectResourceShareInvitationOutputResponse, RejectResourceShareInvitationOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Adds the specified tags to the specified resource share that you own.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes the specified tags from the specified resource share that you own.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateResourceShare(input:completion:)`

Updates the specified resource share that you own.

``` swift
public func updateResourceShare(input: UpdateResourceShareInput, completion: @escaping (ClientRuntime.SdkResult<UpdateResourceShareOutputResponse, UpdateResourceShareOutputError>) -> Void)
```
