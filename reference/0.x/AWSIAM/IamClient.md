# IamClient

``` swift
public class IamClient 
```

## Inheritance

[`IamClientProtocol`](/aws-sdk-swift/reference/0.x/AWSIAM/IamClientProtocol)

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

### `addClientIDToOpenIDConnectProvider(input:completion:)`

Adds a new client ID (also known as audience) to the list of client IDs already
registered for the specified IAM OpenID Connect (OIDC) provider resource.
This operation is idempotent; it does not fail or return an error if you add an
existing client ID to the provider.

``` swift
public func addClientIDToOpenIDConnectProvider(input: AddClientIDToOpenIDConnectProviderInput, completion: @escaping (ClientRuntime.SdkResult<AddClientIDToOpenIDConnectProviderOutputResponse, AddClientIDToOpenIDConnectProviderOutputError>) -> Void)
```

### `addRoleToInstanceProfile(input:completion:)`

Adds the specified IAM role to the specified instance profile. An instance profile
can contain only one role, and this quota cannot be increased. You can remove the
existing role and then add a different role to an instance profile. You must then wait
for the change to appear across all of Amazon Web Services because of <a href="https:​//en.wikipedia.org/wiki/Eventual_consistency">eventual
consistency. To force the change, you must <a href="https:​//docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DisassociateIamInstanceProfile.html">disassociate the instance profile and then <a href="https:​//docs.aws.amazon.com/AWSEC2/latest/APIReference/API_AssociateIamInstanceProfile.html">associate the
instance profile, or you can stop your instance and then restart it.

``` swift
public func addRoleToInstanceProfile(input: AddRoleToInstanceProfileInput, completion: @escaping (ClientRuntime.SdkResult<AddRoleToInstanceProfileOutputResponse, AddRoleToInstanceProfileOutputError>) -> Void)
```

``` 
        The caller of this operation must be granted the PassRole permission
            on the IAM role by a permissions policy.

    For more information about roles, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/WorkingWithRoles.html">Working with roles. For more
        information about instance profiles, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/AboutInstanceProfiles.html">About instance
        profiles.
```

### `addUserToGroup(input:completion:)`

Adds the specified user to the specified group.

``` swift
public func addUserToGroup(input: AddUserToGroupInput, completion: @escaping (ClientRuntime.SdkResult<AddUserToGroupOutputResponse, AddUserToGroupOutputError>) -> Void)
```

### `attachGroupPolicy(input:completion:)`

Attaches the specified managed policy to the specified IAM group.
You use this operation to attach a managed policy to a group. To embed an inline
policy in a group, use PutGroupPolicy.
As a best practice, you can validate your IAM policies.
To learn more, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_policy-validator.html">Validating IAM policies
in the IAM User Guide.
For more information about policies, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed policies and inline
policies in the IAM User Guide.

``` swift
public func attachGroupPolicy(input: AttachGroupPolicyInput, completion: @escaping (ClientRuntime.SdkResult<AttachGroupPolicyOutputResponse, AttachGroupPolicyOutputError>) -> Void)
```

### `attachRolePolicy(input:completion:)`

Attaches the specified managed policy to the specified IAM role. When you attach a
managed policy to a role, the managed policy becomes part of the role's permission
(access) policy.

``` swift
public func attachRolePolicy(input: AttachRolePolicyInput, completion: @escaping (ClientRuntime.SdkResult<AttachRolePolicyOutputResponse, AttachRolePolicyOutputError>) -> Void)
```

``` 
        You cannot use a managed policy as the role's trust policy. The role's trust
            policy is created at the same time as the role, using CreateRole.
            You can update a role's trust policy using UpdateAssumeRolePolicy.

    Use this operation to attach a managed policy to a role. To embed
        an inline policy in a role, use PutRolePolicy. For more information
        about policies, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed policies and inline
            policies in the IAM User Guide.
    As a best practice, you can validate your IAM policies.
 To learn more, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_policy-validator.html">Validating IAM policies
        in the IAM User Guide.
```

### `attachUserPolicy(input:completion:)`

Attaches the specified managed policy to the specified user.
You use this operation to attach a managed policy to a user. To
embed an inline policy in a user, use PutUserPolicy.
As a best practice, you can validate your IAM policies.
To learn more, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_policy-validator.html">Validating IAM policies
in the IAM User Guide.
For more information about policies, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed policies and inline
policies in the IAM User Guide.

``` swift
public func attachUserPolicy(input: AttachUserPolicyInput, completion: @escaping (ClientRuntime.SdkResult<AttachUserPolicyOutputResponse, AttachUserPolicyOutputError>) -> Void)
```

### `changePassword(input:completion:)`

Changes the password of the IAM user who is calling this operation. This operation

``` swift
public func changePassword(input: ChangePasswordInput, completion: @escaping (ClientRuntime.SdkResult<ChangePasswordOutputResponse, ChangePasswordOutputError>) -> Void)
```

``` 
        can be performed using the CLI, the Amazon Web Services API, or the My
            Security Credentials page in the Amazon Web Services Management Console. The Amazon Web Services account root user
        password is not affected by this operation.
    Use UpdateLoginProfile to use the CLI, the Amazon Web Services API, or the
            Users page in the IAM console to change the
       password for any IAM user. For more information about modifying passwords, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingLogins.html">Managing
            passwords in the IAM User Guide.
```

### `createAccessKey(input:completion:)`

Creates a new Amazon Web Services secret access key and corresponding Amazon Web Services access key ID for the
specified user. The default status for new keys is Active.
If you do not specify a user name, IAM determines the user name implicitly based on
the Amazon Web Services access key ID signing the request. This operation works for access keys under
the Amazon Web Services account. Consequently, you can use this operation to manage Amazon Web Services account root
user credentials. This is true even if the Amazon Web Services account has no associated users.
For information about quotas on the number of keys you can create, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html">IAM and STS
quotas in the IAM User Guide.

``` swift
public func createAccessKey(input: CreateAccessKeyInput, completion: @escaping (ClientRuntime.SdkResult<CreateAccessKeyOutputResponse, CreateAccessKeyOutputError>) -> Void)
```

``` 
       To ensure the security of your Amazon Web Services account, the secret access key is accessible
           only during key and user creation. You must save the key (for example, in a text
           file) if you want to be able to access it again. If a secret key is lost, you can
           delete the access keys for the associated user and then create new keys.
```

### `createAccountAlias(input:completion:)`

Creates an alias for your Amazon Web Services account. For information about using an Amazon Web Services account
alias, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/AccountAlias.html">Using an
alias for your Amazon Web Services account ID in the
IAM User Guide.

``` swift
public func createAccountAlias(input: CreateAccountAliasInput, completion: @escaping (ClientRuntime.SdkResult<CreateAccountAliasOutputResponse, CreateAccountAliasOutputError>) -> Void)
```

### `createGroup(input:completion:)`

Creates a new group.
For information about the number of groups you can create, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html">IAM and STS
quotas in the IAM User Guide.

``` swift
public func createGroup(input: CreateGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateGroupOutputResponse, CreateGroupOutputError>) -> Void)
```

### `createInstanceProfile(input:completion:)`

Creates a new instance profile. For information about instance profiles, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2.html">Using
roles for applications on Amazon EC2 in the
IAM User Guide, and <a href="https:​//docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html#ec2-instance-profile">Instance profiles in the Amazon EC2 User Guide.
For information about the number of instance profiles you can create, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html">IAM object
quotas in the IAM User Guide.

``` swift
public func createInstanceProfile(input: CreateInstanceProfileInput, completion: @escaping (ClientRuntime.SdkResult<CreateInstanceProfileOutputResponse, CreateInstanceProfileOutputError>) -> Void)
```

### `createLoginProfile(input:completion:)`

Creates a password for the specified IAM user. A password allows an IAM user to
access Amazon Web Services services through the Amazon Web Services Management Console.
You can use the CLI, the Amazon Web Services API, or the Users page in the IAM console to create a password for any IAM user.
Use ChangePassword to update your own existing password in the
My Security Credentials page in the
Amazon Web Services Management Console.
For more information about managing passwords, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingLogins.html">Managing passwords in the
IAM User Guide.

``` swift
public func createLoginProfile(input: CreateLoginProfileInput, completion: @escaping (ClientRuntime.SdkResult<CreateLoginProfileOutputResponse, CreateLoginProfileOutputError>) -> Void)
```

### `createOpenIDConnectProvider(input:completion:)`

Creates an IAM entity to describe an identity provider (IdP) that supports <a href="http:​//openid.net/connect/">OpenID Connect (OIDC).
The OIDC provider that you create with this operation can be used as a principal in a
role's trust policy. Such a policy establishes a trust relationship between Amazon Web Services and
the OIDC provider.
If you are using an OIDC identity provider from Google, Facebook, or Amazon Cognito, you don't
need to create a separate IAM identity provider. These OIDC identity providers are
already built-in to Amazon Web Services and are available for your use. Instead, you can move directly
to creating new roles using your identity provider. To learn more, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-idp_oidc.html">Creating
a role for web identity or OpenID connect federation in the IAM
User Guide.
When you create the IAM OIDC provider, you specify the following:​

``` swift
public func createOpenIDConnectProvider(input: CreateOpenIDConnectProviderInput, completion: @escaping (ClientRuntime.SdkResult<CreateOpenIDConnectProviderOutputResponse, CreateOpenIDConnectProviderOutputError>) -> Void)
```

``` 
            The URL of the OIDC identity provider (IdP) to trust


            A list of client IDs (also known as audiences) that identify the application
                or applications  allowed to authenticate using the OIDC provider


            A list of thumbprints of one or more server certificates that the IdP
                uses


    You get all of this information from the OIDC IdP you want to use to access
        Amazon Web Services.

        Amazon Web Services secures communication with some OIDC identity providers (IdPs) through our
        library of trusted certificate authorities (CAs) instead of using a certificate
        thumbprint to verify your IdP server certificate. These OIDC IdPs include Google, and
        those that use an Amazon S3 bucket to host a JSON Web Key Set (JWKS) endpoint. In these
        cases, your legacy thumbprint remains in your configuration, but is no longer used for validation.


        The trust for the OIDC provider is derived from the IAM provider that this
            operation creates. Therefore, it is best to limit access to the CreateOpenIDConnectProvider operation to highly privileged
            users.
```

### `createPolicy(input:completion:)`

Creates a new managed policy for your Amazon Web Services account.
This operation creates a policy version with a version identifier of v1
and sets v1 as the policy's default version. For more information about policy versions,
see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html">Versioning for managed policies in the
IAM User Guide.
As a best practice, you can validate your IAM policies.
To learn more, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_policy-validator.html">Validating IAM policies
in the IAM User Guide.
For more information about managed policies in general, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
policies and inline policies in the
IAM User Guide.

``` swift
public func createPolicy(input: CreatePolicyInput, completion: @escaping (ClientRuntime.SdkResult<CreatePolicyOutputResponse, CreatePolicyOutputError>) -> Void)
```

### `createPolicyVersion(input:completion:)`

Creates a new version of the specified managed policy. To update a managed policy, you
create a new policy version. A managed policy can have up to five versions. If the
policy has five versions, you must delete an existing version using DeletePolicyVersion before you create a new version.
Optionally, you can set the new version as the policy's default version. The default
version is the version that is in effect for the IAM users, groups, and roles to which
the policy is attached.
For more information about managed policy versions, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html">Versioning for managed
policies in the IAM User Guide.

``` swift
public func createPolicyVersion(input: CreatePolicyVersionInput, completion: @escaping (ClientRuntime.SdkResult<CreatePolicyVersionOutputResponse, CreatePolicyVersionOutputError>) -> Void)
```

### `createRole(input:completion:)`

Creates a new role for your Amazon Web Services account. For more information about roles, see
<a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/WorkingWithRoles.html">IAM
roles. For information about quotas for role names and the number of roles
you can create, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html">IAM and STS quotas in the
IAM User Guide.

``` swift
public func createRole(input: CreateRoleInput, completion: @escaping (ClientRuntime.SdkResult<CreateRoleOutputResponse, CreateRoleOutputError>) -> Void)
```

### `createSAMLProvider(input:completion:)`

Creates an IAM resource that describes an identity provider (IdP) that supports SAML
2.0.
The SAML provider resource that you create with this operation can be used as a
principal in an IAM role's trust policy. Such a policy can enable federated users who
sign in using the SAML IdP to assume the role. You can create an IAM role that
supports Web-based single sign-on (SSO) to the Amazon Web Services Management Console or one that supports API access
to Amazon Web Services.
When you create the SAML provider resource, you upload a SAML metadata document that
you get from your IdP. That document includes the issuer's name, expiration information,
and keys that can be used to validate the SAML authentication response (assertions) that
the IdP sends. You must generate the metadata document using the identity management
software that is used as your organization's IdP.

``` swift
public func createSAMLProvider(input: CreateSAMLProviderInput, completion: @escaping (ClientRuntime.SdkResult<CreateSAMLProviderOutputResponse, CreateSAMLProviderOutputError>) -> Void)
```

``` 
         This operation requires <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4.

     For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_enable-console-saml.html">Enabling SAML 2.0
            federated users to access the Amazon Web Services Management Console and <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_saml.html">About SAML 2.0-based
            federation in the IAM User Guide.
```

### `createServiceLinkedRole(input:completion:)`

Creates an IAM role that is linked to a specific Amazon Web Services service. The service controls
the attached policies and when the role can be deleted. This helps ensure that the
service is not broken by an unexpectedly changed or deleted role, which could put your
Amazon Web Services resources into an unknown state. Allowing the service to control the role helps
improve service stability and proper cleanup when a service and its role are no longer
needed. For more information, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/using-service-linked-roles.html">Using service-linked
roles in the IAM User Guide.
To attach a policy to this service-linked role, you must make the request using the
Amazon Web Services service that depends on this role.

``` swift
public func createServiceLinkedRole(input: CreateServiceLinkedRoleInput, completion: @escaping (ClientRuntime.SdkResult<CreateServiceLinkedRoleOutputResponse, CreateServiceLinkedRoleOutputError>) -> Void)
```

### `createServiceSpecificCredential(input:completion:)`

Generates a set of credentials consisting of a user name and password that can be used
to access the service specified in the request. These credentials are generated by
IAM, and can be used only for the specified service.
You can have a maximum of two sets of service-specific credentials for each supported
service per user.
You can create service-specific credentials for CodeCommit and Amazon Keyspaces (for Apache
Cassandra).
You can reset the password to a new service-generated value by calling ResetServiceSpecificCredential.
For more information about service-specific credentials, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_ssh-keys.html">Using IAM
with CodeCommit:​ Git credentials, SSH keys, and Amazon Web Services access keys in the
IAM User Guide.

``` swift
public func createServiceSpecificCredential(input: CreateServiceSpecificCredentialInput, completion: @escaping (ClientRuntime.SdkResult<CreateServiceSpecificCredentialOutputResponse, CreateServiceSpecificCredentialOutputError>) -> Void)
```

### `createUser(input:completion:)`

Creates a new IAM user for your Amazon Web Services account.
For information about quotas for the number of IAM users you can create, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html">IAM and STS
quotas in the IAM User Guide.

``` swift
public func createUser(input: CreateUserInput, completion: @escaping (ClientRuntime.SdkResult<CreateUserOutputResponse, CreateUserOutputError>) -> Void)
```

### `createVirtualMFADevice(input:completion:)`

Creates a new virtual MFA device for the Amazon Web Services account. After creating the virtual
MFA, use EnableMFADevice to attach the MFA device to an IAM user.
For more information about creating and working with virtual MFA devices, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/Using_VirtualMFA.html">Using a virtual MFA
device in the IAM User Guide.
For information about the maximum number of MFA devices you can create, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html">IAM and STS
quotas in the IAM User Guide.

``` swift
public func createVirtualMFADevice(input: CreateVirtualMFADeviceInput, completion: @escaping (ClientRuntime.SdkResult<CreateVirtualMFADeviceOutputResponse, CreateVirtualMFADeviceOutputError>) -> Void)
```

``` 
        The seed information contained in the QR code and the Base32 string should be
            treated like any other secret access information. In other words, protect the seed
            information as you would your Amazon Web Services access keys or your passwords. After you
            provision your virtual device, you should ensure that the information is destroyed
            following secure procedures.
```

### `deactivateMFADevice(input:completion:)`

Deactivates the specified MFA device and removes it from association with the user
name for which it was originally enabled.
For more information about creating and working with virtual MFA devices, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/Using_VirtualMFA.html">Enabling a virtual
multi-factor authentication (MFA) device in the
IAM User Guide.

``` swift
public func deactivateMFADevice(input: DeactivateMFADeviceInput, completion: @escaping (ClientRuntime.SdkResult<DeactivateMFADeviceOutputResponse, DeactivateMFADeviceOutputError>) -> Void)
```

### `deleteAccessKey(input:completion:)`

Deletes the access key pair associated with the specified IAM user.
If you do not specify a user name, IAM determines the user name implicitly based on
the Amazon Web Services access key ID signing the request. This operation works for access keys under
the Amazon Web Services account. Consequently, you can use this operation to manage Amazon Web Services account root
user credentials even if the Amazon Web Services account has no associated users.

``` swift
public func deleteAccessKey(input: DeleteAccessKeyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAccessKeyOutputResponse, DeleteAccessKeyOutputError>) -> Void)
```

### `deleteAccountAlias(input:completion:)`

Deletes the specified Amazon Web Services account alias. For information about using an Amazon Web Services
account alias, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/AccountAlias.html">Using an alias for your Amazon Web Services account ID in the
IAM User Guide.

``` swift
public func deleteAccountAlias(input: DeleteAccountAliasInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAccountAliasOutputResponse, DeleteAccountAliasOutputError>) -> Void)
```

### `deleteAccountPasswordPolicy(input:completion:)`

Deletes the password policy for the Amazon Web Services account. There are no parameters.

``` swift
public func deleteAccountPasswordPolicy(input: DeleteAccountPasswordPolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAccountPasswordPolicyOutputResponse, DeleteAccountPasswordPolicyOutputError>) -> Void)
```

### `deleteGroup(input:completion:)`

Deletes the specified IAM group. The group must not contain any users or have any
attached policies.

``` swift
public func deleteGroup(input: DeleteGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteGroupOutputResponse, DeleteGroupOutputError>) -> Void)
```

### `deleteGroupPolicy(input:completion:)`

Deletes the specified inline policy that is embedded in the specified IAM
group.
A group can also have managed policies attached to it. To detach a managed policy from
a group, use DetachGroupPolicy. For more information about policies,
refer to <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed policies and inline
policies in the IAM User Guide.

``` swift
public func deleteGroupPolicy(input: DeleteGroupPolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteGroupPolicyOutputResponse, DeleteGroupPolicyOutputError>) -> Void)
```

### `deleteInstanceProfile(input:completion:)`

Deletes the specified instance profile. The instance profile must not have an
associated role.

``` swift
public func deleteInstanceProfile(input: DeleteInstanceProfileInput, completion: @escaping (ClientRuntime.SdkResult<DeleteInstanceProfileOutputResponse, DeleteInstanceProfileOutputError>) -> Void)
```

``` 
        Make sure that you do not have any Amazon EC2 instances running with the instance
            profile you are about to delete. Deleting a role or instance profile that is
            associated with a running instance will break any applications running on the
            instance.

    For more information about instance profiles, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/AboutInstanceProfiles.html">About instance
        profiles.
```

### `deleteLoginProfile(input:completion:)`

Deletes the password for the specified IAM user, which terminates the user's ability
to access Amazon Web Services services through the Amazon Web Services Management Console.
You can use the CLI, the Amazon Web Services API, or the Users page in the IAM console to delete a password for any IAM user.
You can use ChangePassword to update, but not delete, your own
password in the My Security Credentials page in the
Amazon Web Services Management Console.

``` swift
public func deleteLoginProfile(input: DeleteLoginProfileInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLoginProfileOutputResponse, DeleteLoginProfileOutputError>) -> Void)
```

``` 
         Deleting a user's password does not prevent a user from accessing Amazon Web Services through
            the command line interface or the API. To prevent all user access, you must also
            either make any access keys inactive or delete them. For more information about
            making keys inactive or deleting them, see UpdateAccessKey and
                DeleteAccessKey.
```

### `deleteOpenIDConnectProvider(input:completion:)`

Deletes an OpenID Connect identity provider (IdP) resource object in IAM.
Deleting an IAM OIDC provider resource does not update any roles that reference the
provider as a principal in their trust policies. Any attempt to assume a role that
references a deleted provider fails.
This operation is idempotent; it does not fail or return an error if you call the
operation for a provider that does not exist.

``` swift
public func deleteOpenIDConnectProvider(input: DeleteOpenIDConnectProviderInput, completion: @escaping (ClientRuntime.SdkResult<DeleteOpenIDConnectProviderOutputResponse, DeleteOpenIDConnectProviderOutputError>) -> Void)
```

### `deletePolicy(input:completion:)`

Deletes the specified managed policy.
Before you can delete a managed policy, you must first detach the policy from all
users, groups, and roles that it is attached to. In addition, you must delete all the
policy's versions. The following steps describe the process for deleting a managed
policy:​

``` swift
public func deletePolicy(input: DeletePolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeletePolicyOutputResponse, DeletePolicyOutputError>) -> Void)
```

``` 
            Detach the policy from all users, groups, and roles that the policy is
                attached to, using DetachUserPolicy, DetachGroupPolicy, or DetachRolePolicy. To
                list all the users, groups, and roles that a policy is attached to, use ListEntitiesForPolicy.


            Delete all versions of the policy using DeletePolicyVersion.
                To list the policy's versions, use ListPolicyVersions. You
                cannot use DeletePolicyVersion to delete the version that is
                marked as the default version. You delete the policy's default version in the
                next step of the process.


            Delete the policy (this automatically deletes the policy's default version)
                using this operation.


    For information about managed policies, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed policies and inline
            policies in the IAM User Guide.
```

### `deletePolicyVersion(input:completion:)`

Deletes the specified version from the specified managed policy.
You cannot delete the default version from a policy using this operation. To delete
the default version from a policy, use DeletePolicy. To find out which
version of a policy is marked as the default version, use ListPolicyVersions.
For information about versions for managed policies, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html">Versioning for managed
policies in the IAM User Guide.

``` swift
public func deletePolicyVersion(input: DeletePolicyVersionInput, completion: @escaping (ClientRuntime.SdkResult<DeletePolicyVersionOutputResponse, DeletePolicyVersionOutputError>) -> Void)
```

### `deleteRole(input:completion:)`

Deletes the specified role. The role must not have any policies attached. For more
information about roles, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/WorkingWithRoles.html">Working with roles.

``` swift
public func deleteRole(input: DeleteRoleInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRoleOutputResponse, DeleteRoleOutputError>) -> Void)
```

``` 
        Make sure that you do not have any Amazon EC2 instances running with the role you
            are about to delete. Deleting a role or instance profile that is associated with a
            running instance will break any applications running on the instance.
```

### `deleteRolePermissionsBoundary(input:completion:)`

Deletes the permissions boundary for the specified IAM role.

``` swift
public func deleteRolePermissionsBoundary(input: DeleteRolePermissionsBoundaryInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRolePermissionsBoundaryOutputResponse, DeleteRolePermissionsBoundaryOutputError>) -> Void)
```

``` 
        Deleting the permissions boundary for a role might increase its permissions. For
            example, it might allow anyone who assumes the role to perform all the actions
            granted in its permissions policies.
```

### `deleteRolePolicy(input:completion:)`

Deletes the specified inline policy that is embedded in the specified IAM
role.
A role can also have managed policies attached to it. To detach a managed policy from
a role, use DetachRolePolicy. For more information about policies,
refer to <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed policies and inline
policies in the IAM User Guide.

``` swift
public func deleteRolePolicy(input: DeleteRolePolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRolePolicyOutputResponse, DeleteRolePolicyOutputError>) -> Void)
```

### `deleteSAMLProvider(input:completion:)`

Deletes a SAML provider resource in IAM.
Deleting the provider resource from IAM does not update any roles that reference the
SAML provider resource's ARN as a principal in their trust policies. Any attempt to
assume a role that references a non-existent provider resource ARN fails.

``` swift
public func deleteSAMLProvider(input: DeleteSAMLProviderInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSAMLProviderOutputResponse, DeleteSAMLProviderOutputError>) -> Void)
```

``` 
         This operation requires <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4.
```

### `deleteSSHPublicKey(input:completion:)`

Deletes the specified SSH public key.
The SSH public key deleted by this operation is used only for authenticating the
associated IAM user to an CodeCommit repository. For more information about using SSH keys
to authenticate to an CodeCommit repository, see <a href="https:​//docs.aws.amazon.com/codecommit/latest/userguide/setting-up-credentials-ssh.html">Set up CodeCommit for
SSH connections in the CodeCommit User Guide.

``` swift
public func deleteSSHPublicKey(input: DeleteSSHPublicKeyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSSHPublicKeyOutputResponse, DeleteSSHPublicKeyOutputError>) -> Void)
```

### `deleteServerCertificate(input:completion:)`

Deletes the specified server certificate.
For more information about working with server certificates, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html">Working
with server certificates in the IAM User Guide. This
topic also includes a list of Amazon Web Services services that can use the server certificates that
you manage with IAM.

``` swift
public func deleteServerCertificate(input: DeleteServerCertificateInput, completion: @escaping (ClientRuntime.SdkResult<DeleteServerCertificateOutputResponse, DeleteServerCertificateOutputError>) -> Void)
```

``` 
         If you are using a server certificate with Elastic Load Balancing, deleting the
            certificate could have implications for your application. If Elastic Load Balancing
            doesn't detect the deletion of bound certificates, it may continue to use the
            certificates. This could cause Elastic Load Balancing to stop accepting traffic. We
            recommend that you remove the reference to the certificate from Elastic Load
            Balancing before using this command to delete the certificate. For more information,
            see <a href="https://docs.aws.amazon.com/ElasticLoadBalancing/latest/APIReference/API_DeleteLoadBalancerListeners.html">DeleteLoadBalancerListeners in the Elastic Load Balancing API
                Reference.
```

### `deleteServiceLinkedRole(input:completion:)`

Submits a service-linked role deletion request and returns a
DeletionTaskId, which you can use to check the status of the deletion.
Before you call this operation, confirm that the role has no active sessions and that
any resources used by the role in the linked service are deleted. If you call this
operation more than once for the same service-linked role and an earlier deletion task
is not complete, then the DeletionTaskId of the earlier request is
returned.
If you submit a deletion request for a service-linked role whose linked service is
still accessing a resource, then the deletion task fails. If it fails, the GetServiceLinkedRoleDeletionStatus operation returns the reason for the
failure, usually including the resources that must be deleted. To delete the
service-linked role, you must first remove those resources from the linked service and
then submit the deletion request again. Resources are specific to the service that is
linked to the role. For more information about removing resources from a service, see
the <a href="http:​//docs.aws.amazon.com/">Amazon Web Services documentation for your
service.
For more information about service-linked roles, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_terms-and-concepts.html#iam-term-service-linked-role">Roles terms and concepts:​ Amazon Web Services service-linked role in the
IAM User Guide.

``` swift
public func deleteServiceLinkedRole(input: DeleteServiceLinkedRoleInput, completion: @escaping (ClientRuntime.SdkResult<DeleteServiceLinkedRoleOutputResponse, DeleteServiceLinkedRoleOutputError>) -> Void)
```

### `deleteServiceSpecificCredential(input:completion:)`

Deletes the specified service-specific credential.

``` swift
public func deleteServiceSpecificCredential(input: DeleteServiceSpecificCredentialInput, completion: @escaping (ClientRuntime.SdkResult<DeleteServiceSpecificCredentialOutputResponse, DeleteServiceSpecificCredentialOutputError>) -> Void)
```

### `deleteSigningCertificate(input:completion:)`

Deletes a signing certificate associated with the specified IAM user.
If you do not specify a user name, IAM determines the user name implicitly based on
the Amazon Web Services access key ID signing the request. This operation works for access keys under
the Amazon Web Services account. Consequently, you can use this operation to manage Amazon Web Services account root
user credentials even if the Amazon Web Services account has no associated IAM users.

``` swift
public func deleteSigningCertificate(input: DeleteSigningCertificateInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSigningCertificateOutputResponse, DeleteSigningCertificateOutputError>) -> Void)
```

### `deleteUser(input:completion:)`

Deletes the specified IAM user. Unlike the Amazon Web Services Management Console, when you delete a user
programmatically, you must delete the items attached to the user manually, or the
deletion fails. For more information, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_users_manage.html#id_users_deleting_cli">Deleting an IAM
user. Before attempting to delete a user, remove the following items:​

``` swift
public func deleteUser(input: DeleteUserInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUserOutputResponse, DeleteUserOutputError>) -> Void)
```

``` 
            Password (DeleteLoginProfile)


            Access keys (DeleteAccessKey)


            Signing certificate (DeleteSigningCertificate)


            SSH public key (DeleteSSHPublicKey)


            Git credentials (DeleteServiceSpecificCredential)


            Multi-factor authentication (MFA) device (DeactivateMFADevice, DeleteVirtualMFADevice)


            Inline policies (DeleteUserPolicy)


            Attached managed policies (DetachUserPolicy)


            Group memberships (RemoveUserFromGroup)
```

### `deleteUserPermissionsBoundary(input:completion:)`

Deletes the permissions boundary for the specified IAM user.

``` swift
public func deleteUserPermissionsBoundary(input: DeleteUserPermissionsBoundaryInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUserPermissionsBoundaryOutputResponse, DeleteUserPermissionsBoundaryOutputError>) -> Void)
```

``` 
        Deleting the permissions boundary for a user might increase its permissions by
            allowing the user to perform all the actions granted in its permissions policies.
```

### `deleteUserPolicy(input:completion:)`

Deletes the specified inline policy that is embedded in the specified IAM
user.
A user can also have managed policies attached to it. To detach a managed policy from
a user, use DetachUserPolicy. For more information about policies,
refer to <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed policies and inline
policies in the IAM User Guide.

``` swift
public func deleteUserPolicy(input: DeleteUserPolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUserPolicyOutputResponse, DeleteUserPolicyOutputError>) -> Void)
```

### `deleteVirtualMFADevice(input:completion:)`

Deletes a virtual MFA device.

``` swift
public func deleteVirtualMFADevice(input: DeleteVirtualMFADeviceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVirtualMFADeviceOutputResponse, DeleteVirtualMFADeviceOutputError>) -> Void)
```

``` 
         You must deactivate a user's virtual MFA device before you can delete it. For
            information about deactivating MFA devices, see DeactivateMFADevice.
```

### `detachGroupPolicy(input:completion:)`

Removes the specified managed policy from the specified IAM group.
A group can also have inline policies embedded with it. To delete an inline policy,
use DeleteGroupPolicy. For information about policies, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
policies and inline policies in the
IAM User Guide.

``` swift
public func detachGroupPolicy(input: DetachGroupPolicyInput, completion: @escaping (ClientRuntime.SdkResult<DetachGroupPolicyOutputResponse, DetachGroupPolicyOutputError>) -> Void)
```

### `detachRolePolicy(input:completion:)`

Removes the specified managed policy from the specified role.
A role can also have inline policies embedded with it. To delete an inline policy, use
DeleteRolePolicy. For information about policies, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
policies and inline policies in the
IAM User Guide.

``` swift
public func detachRolePolicy(input: DetachRolePolicyInput, completion: @escaping (ClientRuntime.SdkResult<DetachRolePolicyOutputResponse, DetachRolePolicyOutputError>) -> Void)
```

### `detachUserPolicy(input:completion:)`

Removes the specified managed policy from the specified user.
A user can also have inline policies embedded with it. To delete an inline policy, use
DeleteUserPolicy. For information about policies, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
policies and inline policies in the
IAM User Guide.

``` swift
public func detachUserPolicy(input: DetachUserPolicyInput, completion: @escaping (ClientRuntime.SdkResult<DetachUserPolicyOutputResponse, DetachUserPolicyOutputError>) -> Void)
```

### `enableMFADevice(input:completion:)`

Enables the specified MFA device and associates it with the specified IAM user. When
enabled, the MFA device is required for every subsequent login by the IAM user
associated with the device.

``` swift
public func enableMFADevice(input: EnableMFADeviceInput, completion: @escaping (ClientRuntime.SdkResult<EnableMFADeviceOutputResponse, EnableMFADeviceOutputError>) -> Void)
```

### `generateCredentialReport(input:completion:)`

Generates a credential report for the Amazon Web Services account. For more information about the
credential report, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/credential-reports.html">Getting credential reports in
the IAM User Guide.

``` swift
public func generateCredentialReport(input: GenerateCredentialReportInput, completion: @escaping (ClientRuntime.SdkResult<GenerateCredentialReportOutputResponse, GenerateCredentialReportOutputError>) -> Void)
```

### `generateOrganizationsAccessReport(input:completion:)`

Generates a report for service last accessed data for Organizations. You can generate a
report for any entities (organization root, organizational unit, or account) or policies
in your organization.
To call this operation, you must be signed in using your Organizations management account
credentials. You can use your long-term IAM user or root user credentials, or
temporary credentials from assuming an IAM role. SCPs must be enabled for your
organization root. You must have the required IAM and Organizations permissions. For more
information, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html">Refining permissions using
service last accessed data in the
IAM User Guide.
You can generate a service last accessed data report for entities by specifying only
the entity's path. This data includes a list of services that are allowed by any service
control policies (SCPs) that apply to the entity.
You can generate a service last accessed data report for a policy by specifying an
entity's path and an optional Organizations policy ID. This data includes a list of services that
are allowed by the specified SCP.
For each service in both report types, the data includes the most recent account
activity that the policy allows to account principals in the entity or the entity's
children. For important information about the data, reporting period, permissions
required, troubleshooting, and supported Regions see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html">Reducing permissions using
service last accessed data in the
IAM User Guide.

``` swift
public func generateOrganizationsAccessReport(input: GenerateOrganizationsAccessReportInput, completion: @escaping (ClientRuntime.SdkResult<GenerateOrganizationsAccessReportOutputResponse, GenerateOrganizationsAccessReportOutputError>) -> Void)
```

``` 
        The data includes all attempts to access Amazon Web Services, not just the successful ones. This
            includes all attempts that were made using the Amazon Web Services Management Console, the Amazon Web Services API through any
            of the SDKs, or any of the command line tools. An unexpected entry in the service
            last accessed data does not mean that an account has been compromised, because the
            request might have been denied. Refer to your CloudTrail logs as the authoritative
            source for information about all API calls and whether they were successful or
            denied access. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/cloudtrail-integration.html">Logging IAM events with
                CloudTrail in the IAM User Guide.

    This operation returns a JobId. Use this parameter in the
           GetOrganizationsAccessReport
         operation to check the status of
        the report generation. To check the status of this request, use the JobId
        parameter in the
           GetOrganizationsAccessReport
         operation
        and test the JobStatus response parameter. When the job is complete, you
        can retrieve the report.
    To generate a service last accessed data report for entities, specify an entity path
        without specifying the optional Organizations policy ID. The type of entity that you specify
        determines the data returned in the report.



              Root – When you specify the
                organizations root as the entity, the resulting report lists all of the services
                allowed by SCPs that are attached to your root. For each service, the report
                includes data for all accounts in your organization except the
                management account, because the management account is not limited by SCPs.



              OU – When you specify an
                organizational unit (OU) as the entity, the resulting report lists all of the
                services allowed by SCPs that are attached to the OU and its parents. For each
                service, the report includes data for all accounts in the OU or its children.
                This data excludes the management account, because the management account is not
                limited by SCPs.



              management account – When you specify the
                management account, the resulting report lists all Amazon Web Services services, because the
                management account is not limited by SCPs. For each service, the report includes
                data for only the management account.



              Account – When you specify another
                account as the entity, the resulting report lists all of the services allowed by
                SCPs that are attached to the account and its parents. For each service, the
                report includes data for only the specified account.


    To generate a service last accessed data report for policies, specify an entity path
        and the optional Organizations policy ID. The type of entity that you specify determines the data
        returned for each service.



              Root – When you specify the root
                entity and a policy ID, the resulting report lists all of the services that are
                allowed by the specified SCP. For each service, the report includes data for all
                accounts in your organization to which the SCP applies. This data excludes the
                management account, because the management account is not limited by SCPs. If the
                SCP is not attached to any entities in the organization, then the report will
                return a list of services with no data.



              OU – When you specify an OU entity and
                a policy ID, the resulting report lists all of the services that are allowed by
                the specified SCP. For each service, the report includes data for all accounts
                in the OU or its children to which the SCP applies. This means that other
                accounts outside the OU that are affected by the SCP might not be included in
                the data. This data excludes the management account, because the
                management account is not limited by SCPs. If the SCP is not attached to the OU
                or one of its children, the report will return a list of services with no
                data.



              management account – When you specify the
                management account, the resulting report lists all Amazon Web Services services, because the
                management account is not limited by SCPs. If you specify a policy ID in the CLI
                or API, the policy is ignored. For each service, the report includes data for
                only the management account.



              Account – When you specify another
                account entity and a policy ID, the resulting report lists all of the services
                that are allowed by the specified SCP. For each service, the report includes
                data for only the specified account. This means that other accounts in the
                organization that are affected by the SCP might not be included in the data. If
                the SCP is not attached to the account, the report will return a list of
                services with no data.



        Service last accessed data does not use other policy types when determining
            whether a principal could access a service. These other policy types include
            identity-based policies, resource-based policies, access control lists, IAM
            permissions boundaries, and STS assume role policies. It only applies SCP logic.
            For more about the evaluation of policy types, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html#policy-eval-basics">Evaluating policies in the
            IAM User Guide.

    For more information about service last accessed data, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html">Reducing policy scope by
            viewing user activity in the IAM User Guide.
```

### `generateServiceLastAccessedDetails(input:completion:)`

Generates a report that includes details about when an IAM resource (user, group,
role, or policy) was last used in an attempt to access Amazon Web Services services. Recent activity
usually appears within four hours. IAM reports activity for the last 365 days, or less
if your Region began supporting this feature within the last year. For more information,
see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#access-advisor_tracking-period">Regions where data is tracked.

``` swift
public func generateServiceLastAccessedDetails(input: GenerateServiceLastAccessedDetailsInput, completion: @escaping (ClientRuntime.SdkResult<GenerateServiceLastAccessedDetailsOutputResponse, GenerateServiceLastAccessedDetailsOutputError>) -> Void)
```

``` 
        The service last accessed data includes all attempts to access an Amazon Web Services API, not
            just the successful ones. This includes all attempts that were made using the
            Amazon Web Services Management Console, the Amazon Web Services API through any of the SDKs, or any of the command line tools.
            An unexpected entry in the service last accessed data does not mean that your
            account has been compromised, because the request might have been denied. Refer to
            your CloudTrail logs as the authoritative source for information about all API calls
            and whether they were successful or denied access. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/cloudtrail-integration.html">Logging
                IAM events with CloudTrail in the
                IAM User Guide.

    The GenerateServiceLastAccessedDetails operation returns a
            JobId. Use this parameter in the following operations to retrieve the
        following details from your report:



              GetServiceLastAccessedDetails – Use this operation
                for users, groups, roles, or policies to list every Amazon Web Services service that the
                resource could access using permissions policies. For each service, the response
                includes information about the most recent access attempt.
            The JobId returned by
                    GenerateServiceLastAccessedDetail must be used by the same role
                within a session, or by the same user when used to call
                    GetServiceLastAccessedDetail.



              GetServiceLastAccessedDetailsWithEntities – Use this
                operation for groups and policies to list information about the associated
                entities (users or roles) that attempted to access a specific Amazon Web Services service.



    To check the status of the GenerateServiceLastAccessedDetails request,
        use the JobId parameter in the same operations and test the
            JobStatus response parameter.
    For additional information about the permissions policies that allow an identity
        (user, group, or role) to access specific services, use the ListPoliciesGrantingServiceAccess operation.

        Service last accessed data does not use other policy types when determining
            whether a resource could access a service. These other policy types include
            resource-based policies, access control lists, Organizations policies, IAM
            permissions boundaries, and STS assume role policies. It only applies
            permissions policy logic. For more about the evaluation of policy types, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html#policy-eval-basics">Evaluating policies in the
            IAM User Guide.

    For more information about service and action last accessed data, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html">Reducing permissions using service last accessed data in the
            IAM User Guide.
```

### `getAccessKeyLastUsed(input:completion:)`

Retrieves information about when the specified access key was last used. The
information includes the date and time of last use, along with the Amazon Web Services service and
Region that were specified in the last request made with that key.

``` swift
public func getAccessKeyLastUsed(input: GetAccessKeyLastUsedInput, completion: @escaping (ClientRuntime.SdkResult<GetAccessKeyLastUsedOutputResponse, GetAccessKeyLastUsedOutputError>) -> Void)
```

### `getAccountAuthorizationDetails(input:completion:)`

Retrieves information about all IAM users, groups, roles, and policies in your Amazon Web Services
account, including their relationships to one another. Use this operation to obtain a
snapshot of the configuration of IAM permissions (users, groups, roles, and policies)
in your account.

``` swift
public func getAccountAuthorizationDetails(input: GetAccountAuthorizationDetailsInput, completion: @escaping (ClientRuntime.SdkResult<GetAccountAuthorizationDetailsOutputResponse, GetAccountAuthorizationDetailsOutputError>) -> Void)
```

``` 
        Policies returned by this operation are URL-encoded compliant
with <a href="https://tools.ietf.org/html/rfc3986">RFC 3986. You can use a URL
decoding method to convert the policy back to plain JSON text. For example, if you use Java, you
can use the decode method of the java.net.URLDecoder utility class in
the Java SDK. Other languages and SDKs provide similar functionality.

    You can optionally filter the results using the Filter parameter. You can
        paginate the results using the MaxItems and Marker
        parameters.
```

### `getAccountPasswordPolicy(input:completion:)`

Retrieves the password policy for the Amazon Web Services account. This tells you the complexity
requirements and mandatory rotation periods for the IAM user passwords in your account.
For more information about using a password policy, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingPasswordPolicies.html">Managing an IAM password
policy.

``` swift
public func getAccountPasswordPolicy(input: GetAccountPasswordPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetAccountPasswordPolicyOutputResponse, GetAccountPasswordPolicyOutputError>) -> Void)
```

### `getAccountSummary(input:completion:)`

Retrieves information about IAM entity usage and IAM quotas in the Amazon Web Services
account.
For information about IAM quotas, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html">IAM and STS quotas in the
IAM User Guide.

``` swift
public func getAccountSummary(input: GetAccountSummaryInput, completion: @escaping (ClientRuntime.SdkResult<GetAccountSummaryOutputResponse, GetAccountSummaryOutputError>) -> Void)
```

### `getContextKeysForCustomPolicy(input:completion:)`

Gets a list of all of the context keys referenced in the input policies. The policies
are supplied as a list of one or more strings. To get the context keys from policies
associated with an IAM user, group, or role, use GetContextKeysForPrincipalPolicy.
Context keys are variables maintained by Amazon Web Services and its services that provide details
about the context of an API query request. Context keys can be evaluated by testing
against a value specified in an IAM policy. Use
GetContextKeysForCustomPolicy to understand what key names and values
you must supply when you call SimulateCustomPolicy. Note that all
parameters are shown in unencoded form here for clarity but must be URL encoded to be
included as a part of a real HTML request.

``` swift
public func getContextKeysForCustomPolicy(input: GetContextKeysForCustomPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetContextKeysForCustomPolicyOutputResponse, GetContextKeysForCustomPolicyOutputError>) -> Void)
```

### `getContextKeysForPrincipalPolicy(input:completion:)`

Gets a list of all of the context keys referenced in all the IAM policies that are
attached to the specified IAM entity. The entity can be an IAM user, group, or role.
If you specify a user, then the request also includes all of the policies attached to
groups that the user is a member of.
You can optionally include a list of one or more additional policies, specified as
strings. If you want to include only a list of policies by string,
use GetContextKeysForCustomPolicy instead.

``` swift
public func getContextKeysForPrincipalPolicy(input: GetContextKeysForPrincipalPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetContextKeysForPrincipalPolicyOutputResponse, GetContextKeysForPrincipalPolicyOutputError>) -> Void)
```

``` 
        Note: This operation discloses information about the
        permissions granted to other users. If you do not want users to see other user's
        permissions, then consider allowing them to use GetContextKeysForCustomPolicy instead.
    Context keys are variables maintained by Amazon Web Services and its services that provide details
        about the context of an API query request. Context keys can be evaluated by testing
        against a value in an IAM policy. Use GetContextKeysForPrincipalPolicy to understand what key names and values you must supply when you call SimulatePrincipalPolicy.
```

### `getCredentialReport(input:completion:)`

Retrieves a credential report for the Amazon Web Services account. For more information about the
credential report, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/credential-reports.html">Getting credential reports in
the IAM User Guide.

``` swift
public func getCredentialReport(input: GetCredentialReportInput, completion: @escaping (ClientRuntime.SdkResult<GetCredentialReportOutputResponse, GetCredentialReportOutputError>) -> Void)
```

### `getGroup(input:completion:)`

Returns a list of IAM users that are in the specified IAM group. You can paginate
the results using the MaxItems and Marker parameters.

``` swift
public func getGroup(input: GetGroupInput, completion: @escaping (ClientRuntime.SdkResult<GetGroupOutputResponse, GetGroupOutputError>) -> Void)
```

### `getGroupPolicy(input:completion:)`

Retrieves the specified inline policy document that is embedded in the specified IAM
group.

``` swift
public func getGroupPolicy(input: GetGroupPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetGroupPolicyOutputResponse, GetGroupPolicyOutputError>) -> Void)
```

``` 
        Policies returned by this operation are URL-encoded compliant
with <a href="https://tools.ietf.org/html/rfc3986">RFC 3986. You can use a URL
decoding method to convert the policy back to plain JSON text. For example, if you use Java, you
can use the decode method of the java.net.URLDecoder utility class in
the Java SDK. Other languages and SDKs provide similar functionality.

    An IAM group can also have managed policies attached to it. To retrieve a managed
        policy document that is attached to a group, use GetPolicy to
        determine the policy's default version, then use GetPolicyVersion to
        retrieve the policy document.
    For more information about policies, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed policies and inline
            policies in the IAM User Guide.
```

### `getInstanceProfile(input:completion:)`

Retrieves information about the specified instance profile, including the instance
profile's path, GUID, ARN, and role. For more information about instance profiles, see
<a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/AboutInstanceProfiles.html">About
instance profiles in the IAM User Guide.

``` swift
public func getInstanceProfile(input: GetInstanceProfileInput, completion: @escaping (ClientRuntime.SdkResult<GetInstanceProfileOutputResponse, GetInstanceProfileOutputError>) -> Void)
```

### `getLoginProfile(input:completion:)`

Retrieves the user name for the specified IAM user. A login profile is created when
you create a password for the user to access the Amazon Web Services Management Console. If the user does not exist
or does not have a password, the operation returns a 404 (NoSuchEntity)
error.
If you create an IAM user with access to the console, the CreateDate
reflects the date you created the initial password for the user.
If you create an IAM user with programmatic access, and then later add a password
for the user to access the Amazon Web Services Management Console, the CreateDate reflects the initial
password creation date. A user with programmatic access does not have a login profile
unless you create a password for the user to access the Amazon Web Services Management Console.

``` swift
public func getLoginProfile(input: GetLoginProfileInput, completion: @escaping (ClientRuntime.SdkResult<GetLoginProfileOutputResponse, GetLoginProfileOutputError>) -> Void)
```

### `getOpenIDConnectProvider(input:completion:)`

Returns information about the specified OpenID Connect (OIDC) provider resource object
in IAM.

``` swift
public func getOpenIDConnectProvider(input: GetOpenIDConnectProviderInput, completion: @escaping (ClientRuntime.SdkResult<GetOpenIDConnectProviderOutputResponse, GetOpenIDConnectProviderOutputError>) -> Void)
```

### `getOrganizationsAccessReport(input:completion:)`

Retrieves the service last accessed data report for Organizations that was previously
generated using the
GenerateOrganizationsAccessReport

``` swift
public func getOrganizationsAccessReport(input: GetOrganizationsAccessReportInput, completion: @escaping (ClientRuntime.SdkResult<GetOrganizationsAccessReportOutputResponse, GetOrganizationsAccessReportOutputError>) -> Void)
```

``` 
        operation. This operation retrieves the status of your report job and the report
        contents.
    Depending on the parameters that you passed when you generated the report, the data
        returned could include different information. For details, see GenerateOrganizationsAccessReport.
    To call this operation, you must be signed in to the management account in your
        organization. SCPs must be enabled for your organization root. You must have permissions
        to perform this operation. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html">Refining permissions using
            service last accessed data in the
        IAM User Guide.
    For each service that principals in an account (root users, IAM users, or IAM
        roles) could access using SCPs, the operation returns details about the most recent
        access attempt. If there was no attempt, the service is listed without details about the
        most recent attempt to access the service. If the operation fails, it returns the reason
        that it failed.
    By default, the list is sorted by service namespace.
```

### `getPolicy(input:completion:)`

Retrieves information about the specified managed policy, including the policy's
default version and the total number of IAM users, groups, and roles to which the
policy is attached. To retrieve the list of the specific users, groups, and roles that
the policy is attached to, use ListEntitiesForPolicy. This operation
returns metadata about the policy. To retrieve the actual policy document for a specific
version of the policy, use GetPolicyVersion.
This operation retrieves information about managed policies. To retrieve information
about an inline policy that is embedded with an IAM user, group, or role, use GetUserPolicy, GetGroupPolicy, or GetRolePolicy.
For more information about policies, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed policies and inline
policies in the IAM User Guide.

``` swift
public func getPolicy(input: GetPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetPolicyOutputResponse, GetPolicyOutputError>) -> Void)
```

### `getPolicyVersion(input:completion:)`

Retrieves information about the specified version of the specified managed policy,
including the policy document.

``` swift
public func getPolicyVersion(input: GetPolicyVersionInput, completion: @escaping (ClientRuntime.SdkResult<GetPolicyVersionOutputResponse, GetPolicyVersionOutputError>) -> Void)
```

``` 
        Policies returned by this operation are URL-encoded compliant
with <a href="https://tools.ietf.org/html/rfc3986">RFC 3986. You can use a URL
decoding method to convert the policy back to plain JSON text. For example, if you use Java, you
can use the decode method of the java.net.URLDecoder utility class in
the Java SDK. Other languages and SDKs provide similar functionality.

    To list the available versions for a policy, use ListPolicyVersions.
    This operation retrieves information about managed policies. To retrieve information
        about an inline policy that is embedded in a user, group, or role, use GetUserPolicy, GetGroupPolicy, or GetRolePolicy.
    For more information about the types of policies, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed policies and inline
            policies in the IAM User Guide.
    For more information about managed policy versions, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html">Versioning for managed
            policies in the IAM User Guide.
```

### `getRole(input:completion:)`

Retrieves information about the specified role, including the role's path, GUID, ARN,
and the role's trust policy that grants permission to assume the role. For more
information about roles, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/WorkingWithRoles.html">Working with roles.

``` swift
public func getRole(input: GetRoleInput, completion: @escaping (ClientRuntime.SdkResult<GetRoleOutputResponse, GetRoleOutputError>) -> Void)
```

``` 
        Policies returned by this operation are URL-encoded compliant
with <a href="https://tools.ietf.org/html/rfc3986">RFC 3986. You can use a URL
decoding method to convert the policy back to plain JSON text. For example, if you use Java, you
can use the decode method of the java.net.URLDecoder utility class in
the Java SDK. Other languages and SDKs provide similar functionality.
```

### `getRolePolicy(input:completion:)`

Retrieves the specified inline policy document that is embedded with the specified
IAM role.

``` swift
public func getRolePolicy(input: GetRolePolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetRolePolicyOutputResponse, GetRolePolicyOutputError>) -> Void)
```

``` 
        Policies returned by this operation are URL-encoded compliant
with <a href="https://tools.ietf.org/html/rfc3986">RFC 3986. You can use a URL
decoding method to convert the policy back to plain JSON text. For example, if you use Java, you
can use the decode method of the java.net.URLDecoder utility class in
the Java SDK. Other languages and SDKs provide similar functionality.

    An IAM role can also have managed policies attached to it. To retrieve a managed
        policy document that is attached to a role, use GetPolicy to determine
        the policy's default version, then use GetPolicyVersion to retrieve
        the policy document.
    For more information about policies, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed policies and inline
            policies in the IAM User Guide.
    For more information about roles, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/roles-toplevel.html">Using roles to delegate permissions and
            federate identities.
```

### `getSAMLProvider(input:completion:)`

Returns the SAML provider metadocument that was uploaded when the IAM SAML provider
resource object was created or updated.

``` swift
public func getSAMLProvider(input: GetSAMLProviderInput, completion: @escaping (ClientRuntime.SdkResult<GetSAMLProviderOutputResponse, GetSAMLProviderOutputError>) -> Void)
```

``` 
        This operation requires <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4.
```

### `getSSHPublicKey(input:completion:)`

Retrieves the specified SSH public key, including metadata about the key.
The SSH public key retrieved by this operation is used only for authenticating the
associated IAM user to an CodeCommit repository. For more information about using SSH keys
to authenticate to an CodeCommit repository, see <a href="https:​//docs.aws.amazon.com/codecommit/latest/userguide/setting-up-credentials-ssh.html">Set up CodeCommit for SSH
connections in the CodeCommit User Guide.

``` swift
public func getSSHPublicKey(input: GetSSHPublicKeyInput, completion: @escaping (ClientRuntime.SdkResult<GetSSHPublicKeyOutputResponse, GetSSHPublicKeyOutputError>) -> Void)
```

### `getServerCertificate(input:completion:)`

Retrieves information about the specified server certificate stored in IAM.
For more information about working with server certificates, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html">Working
with server certificates in the IAM User Guide. This
topic includes a list of Amazon Web Services services that can use the server certificates that you
manage with IAM.

``` swift
public func getServerCertificate(input: GetServerCertificateInput, completion: @escaping (ClientRuntime.SdkResult<GetServerCertificateOutputResponse, GetServerCertificateOutputError>) -> Void)
```

### `getServiceLastAccessedDetails(input:completion:)`

Retrieves a service last accessed report that was created using the
GenerateServiceLastAccessedDetails operation. You can use the
JobId parameter in GetServiceLastAccessedDetails to
retrieve the status of your report job. When the report is complete, you can retrieve
the generated report. The report includes a list of Amazon Web Services services that the resource
(user, group, role, or managed policy) can access.

``` swift
public func getServiceLastAccessedDetails(input: GetServiceLastAccessedDetailsInput, completion: @escaping (ClientRuntime.SdkResult<GetServiceLastAccessedDetailsOutputResponse, GetServiceLastAccessedDetailsOutputError>) -> Void)
```

``` 
        Service last accessed data does not use other policy types when determining
            whether a resource could access a service. These other policy types include
            resource-based policies, access control lists, Organizations policies, IAM
            permissions boundaries, and STS assume role policies. It only applies
            permissions policy logic. For more about the evaluation of policy types, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html#policy-eval-basics">Evaluating policies in the
            IAM User Guide.

    For each service that the resource could access using permissions policies, the
        operation returns details about the most recent access attempt. If there was no attempt,
        the service is listed without details about the most recent attempt to access the
        service. If the operation fails, the GetServiceLastAccessedDetails
        operation returns the reason that it failed.
    The GetServiceLastAccessedDetails operation returns a list of services.
        This list includes the number of entities that have attempted to access the service and
        the date and time of the last attempt. It also returns the ARN of the following entity,
        depending on the resource ARN that you used to generate the report:



              User – Returns the user ARN that you
                used to generate the report



              Group – Returns the ARN of the group
                member (user) that last attempted to access the service



              Role – Returns the role ARN that you
                used to generate the report



              Policy – Returns the ARN of the user
                or role that last used the policy to attempt to access the service


    By default, the list is sorted by service namespace.
    If you specified ACTION_LEVEL granularity when you generated the report,
        this operation returns service and action last accessed data. This includes the most
        recent access attempt for each tracked action within a service. Otherwise, this
        operation returns only service data.
    For more information about service and action last accessed data, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html">Reducing permissions using service last accessed data in the
            IAM User Guide.
```

### `getServiceLastAccessedDetailsWithEntities(input:completion:)`

After you generate a group or policy report using the
GenerateServiceLastAccessedDetails operation, you can use the
JobId parameter in
GetServiceLastAccessedDetailsWithEntities. This operation retrieves the
status of your report job and a list of entities that could have used group or policy
permissions to access the specified service.

``` swift
public func getServiceLastAccessedDetailsWithEntities(input: GetServiceLastAccessedDetailsWithEntitiesInput, completion: @escaping (ClientRuntime.SdkResult<GetServiceLastAccessedDetailsWithEntitiesOutputResponse, GetServiceLastAccessedDetailsWithEntitiesOutputError>) -> Void)
```

``` 
              Group – For a group report, this
                operation returns a list of users in the group that could have used the group’s
                policies in an attempt to access the service.



              Policy – For a policy report, this
                operation returns a list of entities (users or roles) that could have used the
                policy in an attempt to access the service.


    You can also use this operation for user or role reports to retrieve details about
        those entities.
    If the operation fails, the GetServiceLastAccessedDetailsWithEntities
        operation returns the reason that it failed.
    By default, the list of associated entities is sorted by date, with the most recent
        access listed first.
```

### `getServiceLinkedRoleDeletionStatus(input:completion:)`

Retrieves the status of your service-linked role deletion. After you use DeleteServiceLinkedRole to submit a service-linked role for deletion,
you can use the DeletionTaskId parameter in
GetServiceLinkedRoleDeletionStatus to check the status of the deletion.
If the deletion fails, this operation returns the reason that it failed, if that
information is returned by the service.

``` swift
public func getServiceLinkedRoleDeletionStatus(input: GetServiceLinkedRoleDeletionStatusInput, completion: @escaping (ClientRuntime.SdkResult<GetServiceLinkedRoleDeletionStatusOutputResponse, GetServiceLinkedRoleDeletionStatusOutputError>) -> Void)
```

### `getUser(input:completion:)`

Retrieves information about the specified IAM user, including the user's creation
date, path, unique ID, and ARN.
If you do not specify a user name, IAM determines the user name implicitly based on
the Amazon Web Services access key ID used to sign the request to this operation.

``` swift
public func getUser(input: GetUserInput, completion: @escaping (ClientRuntime.SdkResult<GetUserOutputResponse, GetUserOutputError>) -> Void)
```

### `getUserPolicy(input:completion:)`

Retrieves the specified inline policy document that is embedded in the specified IAM
user.

``` swift
public func getUserPolicy(input: GetUserPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetUserPolicyOutputResponse, GetUserPolicyOutputError>) -> Void)
```

``` 
        Policies returned by this operation are URL-encoded compliant
with <a href="https://tools.ietf.org/html/rfc3986">RFC 3986. You can use a URL
decoding method to convert the policy back to plain JSON text. For example, if you use Java, you
can use the decode method of the java.net.URLDecoder utility class in
the Java SDK. Other languages and SDKs provide similar functionality.

    An IAM user can also have managed policies attached to it. To retrieve a managed
        policy document that is attached to a user, use GetPolicy to determine
        the policy's default version. Then use GetPolicyVersion to retrieve
        the policy document.
    For more information about policies, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed policies and inline
            policies in the IAM User Guide.
```

### `listAccessKeys(input:completion:)`

Returns information about the access key IDs associated with the specified IAM user.
If there is none, the operation returns an empty list.
Although each user is limited to a small number of keys, you can still paginate the
results using the MaxItems and Marker parameters.
If the UserName field is not specified, the user name is determined
implicitly based on the Amazon Web Services access key ID used to sign the request. This operation
works for access keys under the Amazon Web Services account. Consequently, you can use this operation
to manage Amazon Web Services account root user credentials even if the Amazon Web Services account has no
associated users.

``` swift
public func listAccessKeys(input: ListAccessKeysInput, completion: @escaping (ClientRuntime.SdkResult<ListAccessKeysOutputResponse, ListAccessKeysOutputError>) -> Void)
```

``` 
        To ensure the security of your Amazon Web Services account, the secret access key is accessible
            only during key and user creation.
```

### `listAccountAliases(input:completion:)`

Lists the account alias associated with the Amazon Web Services account (Note:​ you can have only
one). For information about using an Amazon Web Services account alias, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/AccountAlias.html">Using an alias for your
Amazon Web Services account ID in the IAM User Guide.

``` swift
public func listAccountAliases(input: ListAccountAliasesInput, completion: @escaping (ClientRuntime.SdkResult<ListAccountAliasesOutputResponse, ListAccountAliasesOutputError>) -> Void)
```

### `listAttachedGroupPolicies(input:completion:)`

Lists all managed policies that are attached to the specified IAM group.
An IAM group can also have inline policies embedded with it. To list the inline
policies for a group, use ListGroupPolicies. For information about
policies, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed policies and inline
policies in the IAM User Guide.
You can paginate the results using the MaxItems and Marker
parameters. You can use the PathPrefix parameter to limit the list of
policies to only those matching the specified path prefix. If there are no policies
attached to the specified group (or none that match the specified path prefix), the
operation returns an empty list.

``` swift
public func listAttachedGroupPolicies(input: ListAttachedGroupPoliciesInput, completion: @escaping (ClientRuntime.SdkResult<ListAttachedGroupPoliciesOutputResponse, ListAttachedGroupPoliciesOutputError>) -> Void)
```

### `listAttachedRolePolicies(input:completion:)`

Lists all managed policies that are attached to the specified IAM role.
An IAM role can also have inline policies embedded with it. To list the inline
policies for a role, use ListRolePolicies. For information about
policies, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed policies and inline
policies in the IAM User Guide.
You can paginate the results using the MaxItems and Marker
parameters. You can use the PathPrefix parameter to limit the list of
policies to only those matching the specified path prefix. If there are no policies
attached to the specified role (or none that match the specified path prefix), the
operation returns an empty list.

``` swift
public func listAttachedRolePolicies(input: ListAttachedRolePoliciesInput, completion: @escaping (ClientRuntime.SdkResult<ListAttachedRolePoliciesOutputResponse, ListAttachedRolePoliciesOutputError>) -> Void)
```

### `listAttachedUserPolicies(input:completion:)`

Lists all managed policies that are attached to the specified IAM user.
An IAM user can also have inline policies embedded with it. To list the inline
policies for a user, use ListUserPolicies. For information about
policies, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed policies and inline
policies in the IAM User Guide.
You can paginate the results using the MaxItems and Marker
parameters. You can use the PathPrefix parameter to limit the list of
policies to only those matching the specified path prefix. If there are no policies
attached to the specified group (or none that match the specified path prefix), the
operation returns an empty list.

``` swift
public func listAttachedUserPolicies(input: ListAttachedUserPoliciesInput, completion: @escaping (ClientRuntime.SdkResult<ListAttachedUserPoliciesOutputResponse, ListAttachedUserPoliciesOutputError>) -> Void)
```

### `listEntitiesForPolicy(input:completion:)`

Lists all IAM users, groups, and roles that the specified managed policy is attached
to.
You can use the optional EntityFilter parameter to limit the results to a
particular type of entity (users, groups, or roles). For example, to list only the roles
that are attached to the specified policy, set EntityFilter to
Role.
You can paginate the results using the MaxItems and Marker
parameters.

``` swift
public func listEntitiesForPolicy(input: ListEntitiesForPolicyInput, completion: @escaping (ClientRuntime.SdkResult<ListEntitiesForPolicyOutputResponse, ListEntitiesForPolicyOutputError>) -> Void)
```

### `listGroupPolicies(input:completion:)`

Lists the names of the inline policies that are embedded in the specified IAM
group.
An IAM group can also have managed policies attached to it. To list the managed
policies that are attached to a group, use ListAttachedGroupPolicies.
For more information about policies, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed policies and inline
policies in the IAM User Guide.
You can paginate the results using the MaxItems and Marker
parameters. If there are no inline policies embedded with the specified group, the
operation returns an empty list.

``` swift
public func listGroupPolicies(input: ListGroupPoliciesInput, completion: @escaping (ClientRuntime.SdkResult<ListGroupPoliciesOutputResponse, ListGroupPoliciesOutputError>) -> Void)
```

### `listGroups(input:completion:)`

Lists the IAM groups that have the specified path prefix.
You can paginate the results using the MaxItems and Marker
parameters.

``` swift
public func listGroups(input: ListGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListGroupsOutputResponse, ListGroupsOutputError>) -> Void)
```

### `listGroupsForUser(input:completion:)`

Lists the IAM groups that the specified IAM user belongs to.
You can paginate the results using the MaxItems and Marker
parameters.

``` swift
public func listGroupsForUser(input: ListGroupsForUserInput, completion: @escaping (ClientRuntime.SdkResult<ListGroupsForUserOutputResponse, ListGroupsForUserOutputError>) -> Void)
```

### `listInstanceProfileTags(input:completion:)`

Lists the tags that are attached to the specified IAM instance profile. The returned list of tags is sorted by tag key.
For more information about tagging, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging IAM resources in the
IAM User Guide.

``` swift
public func listInstanceProfileTags(input: ListInstanceProfileTagsInput, completion: @escaping (ClientRuntime.SdkResult<ListInstanceProfileTagsOutputResponse, ListInstanceProfileTagsOutputError>) -> Void)
```

### `listInstanceProfiles(input:completion:)`

Lists the instance profiles that have the specified path prefix. If there are none,
the operation returns an empty list. For more information about instance profiles, see
<a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/AboutInstanceProfiles.html">About
instance profiles.

``` swift
public func listInstanceProfiles(input: ListInstanceProfilesInput, completion: @escaping (ClientRuntime.SdkResult<ListInstanceProfilesOutputResponse, ListInstanceProfilesOutputError>) -> Void)
```

``` 
        IAM resource-listing operations return a subset of the available
```

attributes for the resource. For example, this operation does not return tags, even though they are an attribute of the returned object. To view all of the information for an instance profile, see GetInstanceProfile.

``` 
    You can paginate the results using the MaxItems and Marker
        parameters.
```

### `listInstanceProfilesForRole(input:completion:)`

Lists the instance profiles that have the specified associated IAM role. If there
are none, the operation returns an empty list. For more information about instance
profiles, go to <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/AboutInstanceProfiles.html">About instance
profiles.
You can paginate the results using the MaxItems and Marker
parameters.

``` swift
public func listInstanceProfilesForRole(input: ListInstanceProfilesForRoleInput, completion: @escaping (ClientRuntime.SdkResult<ListInstanceProfilesForRoleOutputResponse, ListInstanceProfilesForRoleOutputError>) -> Void)
```

### `listMFADeviceTags(input:completion:)`

Lists the tags that are attached to the specified IAM virtual multi-factor authentication (MFA) device. The returned list of tags is
sorted by tag key. For more information about tagging, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging IAM resources in the
IAM User Guide.

``` swift
public func listMFADeviceTags(input: ListMFADeviceTagsInput, completion: @escaping (ClientRuntime.SdkResult<ListMFADeviceTagsOutputResponse, ListMFADeviceTagsOutputError>) -> Void)
```

### `listMFADevices(input:completion:)`

Lists the MFA devices for an IAM user. If the request includes a IAM user name,
then this operation lists all the MFA devices associated with the specified user. If you
do not specify a user name, IAM determines the user name implicitly based on the Amazon Web Services
access key ID signing the request for this operation.
You can paginate the results using the MaxItems and Marker
parameters.

``` swift
public func listMFADevices(input: ListMFADevicesInput, completion: @escaping (ClientRuntime.SdkResult<ListMFADevicesOutputResponse, ListMFADevicesOutputError>) -> Void)
```

### `listOpenIDConnectProviderTags(input:completion:)`

Lists the tags that are attached to the specified OpenID Connect (OIDC)-compatible
identity provider. The returned list of tags is sorted by tag key. For more information, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_oidc.html">About web identity
federation.
For more information about tagging, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging IAM resources in the
IAM User Guide.

``` swift
public func listOpenIDConnectProviderTags(input: ListOpenIDConnectProviderTagsInput, completion: @escaping (ClientRuntime.SdkResult<ListOpenIDConnectProviderTagsOutputResponse, ListOpenIDConnectProviderTagsOutputError>) -> Void)
```

### `listOpenIDConnectProviders(input:completion:)`

Lists information about the IAM OpenID Connect (OIDC) provider resource objects
defined in the Amazon Web Services account.

``` swift
public func listOpenIDConnectProviders(input: ListOpenIDConnectProvidersInput, completion: @escaping (ClientRuntime.SdkResult<ListOpenIDConnectProvidersOutputResponse, ListOpenIDConnectProvidersOutputError>) -> Void)
```

``` 
        IAM resource-listing operations return a subset of the available
```

attributes for the resource. For example, this operation does not return tags, even though they are an attribute of the returned object. To view all of the information for an OIDC provider, see GetOpenIDConnectProvider.

### `listPolicies(input:completion:)`

Lists all the managed policies that are available in your Amazon Web Services account, including
your own customer-defined managed policies and all Amazon Web Services managed policies.
You can filter the list of policies that is returned using the optional
OnlyAttached, Scope, and PathPrefix
parameters. For example, to list only the customer managed policies in your Amazon Web Services
account, set Scope to Local. To list only Amazon Web Services managed
policies, set Scope to AWS.
You can paginate the results using the MaxItems and Marker
parameters.
For more information about managed policies, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed policies and inline
policies in the IAM User Guide.

``` swift
public func listPolicies(input: ListPoliciesInput, completion: @escaping (ClientRuntime.SdkResult<ListPoliciesOutputResponse, ListPoliciesOutputError>) -> Void)
```

``` 
        IAM resource-listing operations return a subset of the available
```

attributes for the resource. For example, this operation does not return tags, even though they are an attribute of the returned object. To view all of the information for a customer manged policy, see
GetPolicy.

### `listPoliciesGrantingServiceAccess(input:completion:)`

Retrieves a list of policies that the IAM identity (user, group, or role) can use to
access each specified service.

``` swift
public func listPoliciesGrantingServiceAccess(input: ListPoliciesGrantingServiceAccessInput, completion: @escaping (ClientRuntime.SdkResult<ListPoliciesGrantingServiceAccessOutputResponse, ListPoliciesGrantingServiceAccessOutputError>) -> Void)
```

``` 
        This operation does not use other policy types when determining whether a resource
            could access a service. These other policy types include resource-based policies,
            access control lists, Organizations policies, IAM permissions boundaries, and
            STS assume role policies. It only applies permissions policy logic. For more
            about the evaluation of policy types, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html#policy-eval-basics">Evaluating policies in the
            IAM User Guide.

    The list of policies returned by the operation depends on the ARN of the identity that
        you provide.



              User – The list of policies includes
                the managed and inline policies that are attached to the user directly. The list
                also includes any additional managed and inline policies that are attached to
                the group to which the user belongs.



              Group – The list of policies includes
                only the managed and inline policies that are attached to the group directly.
                Policies that are attached to the group’s user are not included.



              Role – The list of policies includes
                only the managed and inline policies that are attached to the role.


    For each managed policy, this operation returns the ARN and policy name. For each
        inline policy, it returns the policy name and the entity to which it is attached. Inline
        policies do not have an ARN. For more information about these policy types, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-vs-inline.html">Managed policies and inline policies in the
            IAM User Guide.
    Policies that are attached to users and roles as permissions boundaries are not
        returned. To view which managed policy is currently used to set the permissions boundary
        for a user or role, use the GetUser or GetRole
        operations.
```

### `listPolicyTags(input:completion:)`

Lists the tags that are attached to the specified IAM customer managed policy.
The returned list of tags is sorted by tag key. For more information about tagging, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging IAM resources in the
IAM User Guide.

``` swift
public func listPolicyTags(input: ListPolicyTagsInput, completion: @escaping (ClientRuntime.SdkResult<ListPolicyTagsOutputResponse, ListPolicyTagsOutputError>) -> Void)
```

### `listPolicyVersions(input:completion:)`

Lists information about the versions of the specified managed policy, including the
version that is currently set as the policy's default version.
For more information about managed policies, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed policies and inline
policies in the IAM User Guide.

``` swift
public func listPolicyVersions(input: ListPolicyVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListPolicyVersionsOutputResponse, ListPolicyVersionsOutputError>) -> Void)
```

### `listRolePolicies(input:completion:)`

Lists the names of the inline policies that are embedded in the specified IAM
role.
An IAM role can also have managed policies attached to it. To list the managed
policies that are attached to a role, use ListAttachedRolePolicies.
For more information about policies, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed policies and inline
policies in the IAM User Guide.
You can paginate the results using the MaxItems and Marker
parameters. If there are no inline policies embedded with the specified role, the
operation returns an empty list.

``` swift
public func listRolePolicies(input: ListRolePoliciesInput, completion: @escaping (ClientRuntime.SdkResult<ListRolePoliciesOutputResponse, ListRolePoliciesOutputError>) -> Void)
```

### `listRoleTags(input:completion:)`

Lists the tags that are attached to the specified role. The returned list of tags is
sorted by tag key. For more information about tagging, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging IAM resources in the
IAM User Guide.

``` swift
public func listRoleTags(input: ListRoleTagsInput, completion: @escaping (ClientRuntime.SdkResult<ListRoleTagsOutputResponse, ListRoleTagsOutputError>) -> Void)
```

### `listRoles(input:completion:)`

Lists the IAM roles that have the specified path prefix. If there are none, the
operation returns an empty list. For more information about roles, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/WorkingWithRoles.html">Working with
roles.

``` swift
public func listRoles(input: ListRolesInput, completion: @escaping (ClientRuntime.SdkResult<ListRolesOutputResponse, ListRolesOutputError>) -> Void)
```

``` 
        IAM resource-listing operations return a subset of the available
```

attributes for the resource. For example, this operation does not return tags, even though they are an attribute of the returned object. To view all of the information for a role, see GetRole.

``` 
    You can paginate the results using the MaxItems and Marker
        parameters.
```

### `listSAMLProviderTags(input:completion:)`

Lists the tags that are attached to the specified Security Assertion Markup Language
(SAML) identity provider. The returned list of tags is sorted by tag key. For more information, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_saml.html">About SAML 2.0-based
federation.
For more information about tagging, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging IAM resources in the
IAM User Guide.

``` swift
public func listSAMLProviderTags(input: ListSAMLProviderTagsInput, completion: @escaping (ClientRuntime.SdkResult<ListSAMLProviderTagsOutputResponse, ListSAMLProviderTagsOutputError>) -> Void)
```

### `listSAMLProviders(input:completion:)`

Lists the SAML provider resource objects defined in IAM in the account.
IAM resource-listing operations return a subset of the available
attributes for the resource. For example, this operation does not return tags, even though they are an attribute of the returned object. To view all of the information for a SAML provider, see GetSAMLProvider.

``` swift
public func listSAMLProviders(input: ListSAMLProvidersInput, completion: @escaping (ClientRuntime.SdkResult<ListSAMLProvidersOutputResponse, ListSAMLProvidersOutputError>) -> Void)
```

``` 
         This operation requires <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4.
```

### `listSSHPublicKeys(input:completion:)`

Returns information about the SSH public keys associated with the specified IAM
user. If none exists, the operation returns an empty list.
The SSH public keys returned by this operation are used only for authenticating the
IAM user to an CodeCommit repository. For more information about using SSH keys to
authenticate to an CodeCommit repository, see <a href="https:​//docs.aws.amazon.com/codecommit/latest/userguide/setting-up-credentials-ssh.html">Set up CodeCommit for
SSH connections in the CodeCommit User Guide.
Although each user is limited to a small number of keys, you can still paginate the
results using the MaxItems and Marker parameters.

``` swift
public func listSSHPublicKeys(input: ListSSHPublicKeysInput, completion: @escaping (ClientRuntime.SdkResult<ListSSHPublicKeysOutputResponse, ListSSHPublicKeysOutputError>) -> Void)
```

### `listServerCertificateTags(input:completion:)`

Lists the tags that are attached to the specified IAM server certificate. The
returned list of tags is sorted by tag key. For more information about tagging, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging IAM resources in the
IAM User Guide.

``` swift
public func listServerCertificateTags(input: ListServerCertificateTagsInput, completion: @escaping (ClientRuntime.SdkResult<ListServerCertificateTagsOutputResponse, ListServerCertificateTagsOutputError>) -> Void)
```

``` 
        For certificates in a Region supported by Certificate Manager (ACM), we
    recommend that you don't use IAM server certificates. Instead, use ACM to provision,
    manage, and deploy your server certificates. For more information about IAM server
    certificates, <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html">Working with server
      certificates in the IAM User Guide.
```

### `listServerCertificates(input:completion:)`

Lists the server certificates stored in IAM that have the specified path prefix. If
none exist, the operation returns an empty list.
You can paginate the results using the MaxItems and Marker
parameters.
For more information about working with server certificates, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html">Working
with server certificates in the IAM User Guide. This
topic also includes a list of Amazon Web Services services that can use the server certificates that
you manage with IAM.

``` swift
public func listServerCertificates(input: ListServerCertificatesInput, completion: @escaping (ClientRuntime.SdkResult<ListServerCertificatesOutputResponse, ListServerCertificatesOutputError>) -> Void)
```

``` 
        IAM resource-listing operations return a subset of the available
```

attributes for the resource. For example, this operation does not return tags, even though they are an attribute of the returned object. To view all of the information for a servercertificate, see GetServerCertificate.

### `listServiceSpecificCredentials(input:completion:)`

Returns information about the service-specific credentials associated with the
specified IAM user. If none exists, the operation returns an empty list. The
service-specific credentials returned by this operation are used only for authenticating
the IAM user to a specific service. For more information about using service-specific
credentials to authenticate to an Amazon Web Services service, see <a href="https:​//docs.aws.amazon.com/codecommit/latest/userguide/setting-up-gc.html">Set up service-specific credentials
in the CodeCommit User Guide.

``` swift
public func listServiceSpecificCredentials(input: ListServiceSpecificCredentialsInput, completion: @escaping (ClientRuntime.SdkResult<ListServiceSpecificCredentialsOutputResponse, ListServiceSpecificCredentialsOutputError>) -> Void)
```

### `listSigningCertificates(input:completion:)`

Returns information about the signing certificates associated with the specified IAM
user. If none exists, the operation returns an empty list.
Although each user is limited to a small number of signing certificates, you can still
paginate the results using the MaxItems and Marker
parameters.
If the UserName field is not specified, the user name is determined
implicitly based on the Amazon Web Services access key ID used to sign the request for this operation.
This operation works for access keys under the Amazon Web Services account. Consequently, you can use
this operation to manage Amazon Web Services account root user credentials even if the Amazon Web Services account
has no associated users.

``` swift
public func listSigningCertificates(input: ListSigningCertificatesInput, completion: @escaping (ClientRuntime.SdkResult<ListSigningCertificatesOutputResponse, ListSigningCertificatesOutputError>) -> Void)
```

### `listUserPolicies(input:completion:)`

Lists the names of the inline policies embedded in the specified IAM user.
An IAM user can also have managed policies attached to it. To list the managed
policies that are attached to a user, use ListAttachedUserPolicies.
For more information about policies, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed policies and inline
policies in the IAM User Guide.
You can paginate the results using the MaxItems and Marker
parameters. If there are no inline policies embedded with the specified user, the
operation returns an empty list.

``` swift
public func listUserPolicies(input: ListUserPoliciesInput, completion: @escaping (ClientRuntime.SdkResult<ListUserPoliciesOutputResponse, ListUserPoliciesOutputError>) -> Void)
```

### `listUserTags(input:completion:)`

Lists the tags that are attached to the specified IAM user. The returned list of tags is sorted by tag key. For more information about tagging, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging IAM resources in the
IAM User Guide.

``` swift
public func listUserTags(input: ListUserTagsInput, completion: @escaping (ClientRuntime.SdkResult<ListUserTagsOutputResponse, ListUserTagsOutputError>) -> Void)
```

### `listUsers(input:completion:)`

Lists the IAM users that have the specified path prefix. If no path prefix is
specified, the operation returns all users in the Amazon Web Services account. If there are none, the
operation returns an empty list.

``` swift
public func listUsers(input: ListUsersInput, completion: @escaping (ClientRuntime.SdkResult<ListUsersOutputResponse, ListUsersOutputError>) -> Void)
```

``` 
        IAM resource-listing operations return a subset of the available
```

attributes for the resource. For example, this operation does not return tags, even though they are an attribute of the returned object. To view all of the information for a user, see GetUser.

``` 
    You can paginate the results using the MaxItems and Marker
        parameters.
```

### `listVirtualMFADevices(input:completion:)`

Lists the virtual MFA devices defined in the Amazon Web Services account by assignment status. If
you do not specify an assignment status, the operation returns a list of all virtual MFA
devices. Assignment status can be Assigned, Unassigned, or
Any.

``` swift
public func listVirtualMFADevices(input: ListVirtualMFADevicesInput, completion: @escaping (ClientRuntime.SdkResult<ListVirtualMFADevicesOutputResponse, ListVirtualMFADevicesOutputError>) -> Void)
```

``` 
        IAM resource-listing operations return a subset of the available
```

attributes for the resource. For example, this operation does not return tags, even though they are an attribute of the returned object. To view all of the information for a virtual MFA device, see
ListVirtualMFADevices.

``` 
    You can paginate the results using the MaxItems and Marker
        parameters.
```

### `putGroupPolicy(input:completion:)`

Adds or updates an inline policy document that is embedded in the specified IAM
group.
A user can also have managed policies attached to it. To attach a managed policy to a
group, use AttachGroupPolicy. To create a new managed policy, use
CreatePolicy. For information about policies, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
policies and inline policies in the
IAM User Guide.
For information about the maximum number of inline policies that you can embed in a
group, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html">IAM and STS quotas in the IAM User Guide.

``` swift
public func putGroupPolicy(input: PutGroupPolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutGroupPolicyOutputResponse, PutGroupPolicyOutputError>) -> Void)
```

``` 
        Because policy documents can be large, you should use POST rather than GET when
            calling PutGroupPolicy. For general information about using the Query
            API with IAM, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/IAM_UsingQueryAPI.html">Making query requests in the
                IAM User Guide.
```

### `putRolePermissionsBoundary(input:completion:)`

Adds or updates the policy that is specified as the IAM role's permissions boundary.
You can use an Amazon Web Services managed policy or a customer managed policy to set the boundary for
a role. Use the boundary to control the maximum permissions that the role can have.
Setting a permissions boundary is an advanced feature that can affect the permissions
for the role.
You cannot set the boundary for a service-linked role.

``` swift
public func putRolePermissionsBoundary(input: PutRolePermissionsBoundaryInput, completion: @escaping (ClientRuntime.SdkResult<PutRolePermissionsBoundaryOutputResponse, PutRolePermissionsBoundaryOutputError>) -> Void)
```

``` 
        Policies used as permissions boundaries do not provide permissions. You must also
            attach a permissions policy to the role. To learn how the effective permissions for
            a role are evaluated, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html">IAM JSON policy
                evaluation logic in the IAM User Guide.
```

### `putRolePolicy(input:completion:)`

Adds or updates an inline policy document that is embedded in the specified IAM
role.
When you embed an inline policy in a role, the inline policy is used as part of the
role's access (permissions) policy. The role's trust policy is created at the same time
as the role, using CreateRole. You can update a role's trust policy
using UpdateAssumeRolePolicy. For more information about IAM roles,
see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/roles-toplevel.html">Using roles to
delegate permissions and federate identities.
A role can also have a managed policy attached to it. To attach a managed policy to a
role, use AttachRolePolicy. To create a new managed policy, use CreatePolicy. For information about policies, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
policies and inline policies in the
IAM User Guide.
For information about the maximum number of inline policies that you can embed with a
role, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html">IAM and STS quotas in the IAM User Guide.

``` swift
public func putRolePolicy(input: PutRolePolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutRolePolicyOutputResponse, PutRolePolicyOutputError>) -> Void)
```

``` 
        Because policy documents can be large, you should use POST rather than GET when
            calling PutRolePolicy. For general information about using the Query
            API with IAM, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/IAM_UsingQueryAPI.html">Making query requests in the
                IAM User Guide.
```

### `putUserPermissionsBoundary(input:completion:)`

Adds or updates the policy that is specified as the IAM user's permissions boundary.
You can use an Amazon Web Services managed policy or a customer managed policy to set the boundary for
a user. Use the boundary to control the maximum permissions that the user can have.
Setting a permissions boundary is an advanced feature that can affect the permissions
for the user.

``` swift
public func putUserPermissionsBoundary(input: PutUserPermissionsBoundaryInput, completion: @escaping (ClientRuntime.SdkResult<PutUserPermissionsBoundaryOutputResponse, PutUserPermissionsBoundaryOutputError>) -> Void)
```

``` 
        Policies that are used as permissions boundaries do not provide permissions. You
            must also attach a permissions policy to the user. To learn how the effective
            permissions for a user are evaluated, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html">IAM JSON policy
                evaluation logic in the IAM User Guide.
```

### `putUserPolicy(input:completion:)`

Adds or updates an inline policy document that is embedded in the specified IAM
user.
An IAM user can also have a managed policy attached to it. To attach a managed
policy to a user, use AttachUserPolicy. To create a new managed
policy, use CreatePolicy. For information about policies, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
policies and inline policies in the
IAM User Guide.
For information about the maximum number of inline policies that you can embed in a
user, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html">IAM and STS quotas in the IAM User Guide.

``` swift
public func putUserPolicy(input: PutUserPolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutUserPolicyOutputResponse, PutUserPolicyOutputError>) -> Void)
```

``` 
        Because policy documents can be large, you should use POST rather than GET when
            calling PutUserPolicy. For general information about using the Query
            API with IAM, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/IAM_UsingQueryAPI.html">Making query requests in the
                IAM User Guide.
```

### `removeClientIDFromOpenIDConnectProvider(input:completion:)`

Removes the specified client ID (also known as audience) from the list of client IDs
registered for the specified IAM OpenID Connect (OIDC) provider resource
object.
This operation is idempotent; it does not fail or return an error if you try to remove
a client ID that does not exist.

``` swift
public func removeClientIDFromOpenIDConnectProvider(input: RemoveClientIDFromOpenIDConnectProviderInput, completion: @escaping (ClientRuntime.SdkResult<RemoveClientIDFromOpenIDConnectProviderOutputResponse, RemoveClientIDFromOpenIDConnectProviderOutputError>) -> Void)
```

### `removeRoleFromInstanceProfile(input:completion:)`

Removes the specified IAM role from the specified EC2 instance profile.

``` swift
public func removeRoleFromInstanceProfile(input: RemoveRoleFromInstanceProfileInput, completion: @escaping (ClientRuntime.SdkResult<RemoveRoleFromInstanceProfileOutputResponse, RemoveRoleFromInstanceProfileOutputError>) -> Void)
```

``` 
        Make sure that you do not have any Amazon EC2 instances running with the role you
            are about to remove from the instance profile. Removing a role from an instance
            profile that is associated with a running instance might break any applications
            running on the instance.

     For more information about IAM roles, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/WorkingWithRoles.html">Working with roles. For more
        information about instance profiles, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/AboutInstanceProfiles.html">About instance
        profiles.
```

### `removeUserFromGroup(input:completion:)`

Removes the specified user from the specified group.

``` swift
public func removeUserFromGroup(input: RemoveUserFromGroupInput, completion: @escaping (ClientRuntime.SdkResult<RemoveUserFromGroupOutputResponse, RemoveUserFromGroupOutputError>) -> Void)
```

### `resetServiceSpecificCredential(input:completion:)`

Resets the password for a service-specific credential. The new password is Amazon Web Services
generated and cryptographically strong. It cannot be configured by the user. Resetting
the password immediately invalidates the previous password associated with this
user.

``` swift
public func resetServiceSpecificCredential(input: ResetServiceSpecificCredentialInput, completion: @escaping (ClientRuntime.SdkResult<ResetServiceSpecificCredentialOutputResponse, ResetServiceSpecificCredentialOutputError>) -> Void)
```

### `resyncMFADevice(input:completion:)`

Synchronizes the specified MFA device with its IAM resource object on the Amazon Web Services
servers.
For more information about creating and working with virtual MFA devices, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/Using_VirtualMFA.html">Using a virtual MFA
device in the IAM User Guide.

``` swift
public func resyncMFADevice(input: ResyncMFADeviceInput, completion: @escaping (ClientRuntime.SdkResult<ResyncMFADeviceOutputResponse, ResyncMFADeviceOutputError>) -> Void)
```

### `setDefaultPolicyVersion(input:completion:)`

Sets the specified version of the specified policy as the policy's default (operative)
version.
This operation affects all users, groups, and roles that the policy is attached to. To
list the users, groups, and roles that the policy is attached to, use ListEntitiesForPolicy.
For information about managed policies, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed policies and inline
policies in the IAM User Guide.

``` swift
public func setDefaultPolicyVersion(input: SetDefaultPolicyVersionInput, completion: @escaping (ClientRuntime.SdkResult<SetDefaultPolicyVersionOutputResponse, SetDefaultPolicyVersionOutputError>) -> Void)
```

### `setSecurityTokenServicePreferences(input:completion:)`

Sets the specified version of the global endpoint token as the token version used for
the Amazon Web Services account.
By default, Security Token Service (STS) is available as a global service, and all STS requests
go to a single endpoint at https:​//sts.amazonaws.com. Amazon Web Services recommends
using Regional STS endpoints to reduce latency, build in redundancy, and increase
session token availability. For information about Regional endpoints for STS, see
<a href="https:​//docs.aws.amazon.com/general/latest/gr/sts.html">Security Token Service
endpoints and quotas in the Amazon Web Services General Reference.
If you make an STS call to the global endpoint, the resulting session tokens might
be valid in some Regions but not others. It depends on the version that is set in this
operation. Version 1 tokens are valid only in Amazon Web Services Regions that are
available by default. These tokens do not work in manually enabled Regions, such as Asia
Pacific (Hong Kong). Version 2 tokens are valid in all Regions. However, version 2
tokens are longer and might affect systems where you temporarily store tokens. For
information, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html">Activating and
deactivating STS in an Amazon Web Services Region in the
IAM User Guide.
To view the current session token version, see the
GlobalEndpointTokenVersion entry in the response of the GetAccountSummary operation.

``` swift
public func setSecurityTokenServicePreferences(input: SetSecurityTokenServicePreferencesInput, completion: @escaping (ClientRuntime.SdkResult<SetSecurityTokenServicePreferencesOutputResponse, SetSecurityTokenServicePreferencesOutputError>) -> Void)
```

### `simulateCustomPolicy(input:completion:)`

Simulate how a set of IAM policies and optionally a resource-based policy works with
a list of API operations and Amazon Web Services resources to determine the policies' effective
permissions. The policies are provided as strings.
The simulation does not perform the API operations; it only checks the authorization
to determine if the simulated policies allow or deny the operations. You can simulate
resources that don't exist in your account.
If you want to simulate existing policies that are attached to an IAM user, group,
or role, use SimulatePrincipalPolicy instead.
Context keys are variables that are maintained by Amazon Web Services and its services and which
provide details about the context of an API query request. You can use the
Condition element of an IAM policy to evaluate context keys. To get
the list of context keys that the policies require for correct simulation, use GetContextKeysForCustomPolicy.
If the output is long, you can use MaxItems and Marker
parameters to paginate the results.
For more information about using the policy simulator, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_testing-policies.html">Testing IAM policies
with the IAM policy simulator in the
IAM User Guide.

``` swift
public func simulateCustomPolicy(input: SimulateCustomPolicyInput, completion: @escaping (ClientRuntime.SdkResult<SimulateCustomPolicyOutputResponse, SimulateCustomPolicyOutputError>) -> Void)
```

### `simulatePrincipalPolicy(input:completion:)`

Simulate how a set of IAM policies attached to an IAM entity works with a list of
API operations and Amazon Web Services resources to determine the policies' effective permissions. The
entity can be an IAM user, group, or role. If you specify a user, then the simulation
also includes all of the policies that are attached to groups that the user belongs to.
You can simulate resources that don't exist in your account.
You can optionally include a list of one or more additional policies specified as
strings to include in the simulation. If you want to simulate only policies specified as
strings, use SimulateCustomPolicy instead.
You can also optionally include one resource-based policy to be evaluated with each of
the resources included in the simulation.
The simulation does not perform the API operations; it only checks the authorization
to determine if the simulated policies allow or deny the operations.

``` swift
public func simulatePrincipalPolicy(input: SimulatePrincipalPolicyInput, completion: @escaping (ClientRuntime.SdkResult<SimulatePrincipalPolicyOutputResponse, SimulatePrincipalPolicyOutputError>) -> Void)
```

``` 
        Note: This operation discloses information about the
        permissions granted to other users. If you do not want users to see other user's
        permissions, then consider allowing them to use SimulateCustomPolicy
        instead.
    Context keys are variables maintained by Amazon Web Services and its services that provide details
        about the context of an API query request. You can use the Condition
        element of an IAM policy to evaluate context keys. To get the list of context keys
        that the policies require for correct simulation, use GetContextKeysForPrincipalPolicy.
    If the output is long, you can use the MaxItems and Marker
        parameters to paginate the results.
    For more information about using the policy simulator, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_testing-policies.html">Testing IAM policies
            with the IAM policy simulator in the
        IAM User Guide.
```

### `tagInstanceProfile(input:completion:)`

Adds one or more tags to an IAM instance profile. If a tag with the same key name
already exists, then that tag is overwritten with the new value.
Each tag consists of a key name and an associated value. By assigning tags to your resources, you can do the
following:​

``` swift
public func tagInstanceProfile(input: TagInstanceProfileInput, completion: @escaping (ClientRuntime.SdkResult<TagInstanceProfileOutputResponse, TagInstanceProfileOutputError>) -> Void)
```

``` 
              Administrative grouping and discovery - Attach
      tags to resources to aid in organization and search. For example, you could search for all
      resources with the key name Project and the value
        MyImportantProject. Or search for all resources with the key name
        Cost Center and the value 41200.



              Access control - Include tags in IAM user-based
      and resource-based policies. You can use tags to restrict access to only an IAM instance
      profile that has a specified tag attached. For examples of policies that show how to use
      tags to control access, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">Control access using IAM tags in the
        IAM User Guide.





              If any one of the tags is invalid or if you exceed the allowed maximum number of tags, then the entire request
```

fails and the resource is not created. For more information about tagging, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging IAM resources in the
IAM User Guide.

``` 
              Amazon Web Services always interprets the tag Value as a single string. If you
        need to store an array, you can store comma-separated values in the string. However, you
        must interpret the value in your code.
```

### `tagMFADevice(input:completion:)`

Adds one or more tags to an IAM virtual multi-factor authentication (MFA) device. If
a tag with the same key name already exists, then that tag is overwritten with the new
value.
A tag consists of a key name and an associated value. By assigning tags to your
resources, you can do the following:​

``` swift
public func tagMFADevice(input: TagMFADeviceInput, completion: @escaping (ClientRuntime.SdkResult<TagMFADeviceOutputResponse, TagMFADeviceOutputError>) -> Void)
```

``` 
              Administrative grouping and discovery - Attach
      tags to resources to aid in organization and search. For example, you could search for all
      resources with the key name Project and the value
        MyImportantProject. Or search for all resources with the key name
        Cost Center and the value 41200.



              Access control - Include tags in IAM user-based
      and resource-based policies. You can use tags to restrict access to only an IAM virtual
      MFA device that has a specified tag attached. For examples of policies that show how to
      use tags to control access, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">Control access using IAM tags in the
        IAM User Guide.





              If any one of the tags is invalid or if you exceed the allowed maximum number of tags, then the entire request
```

fails and the resource is not created. For more information about tagging, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging IAM resources in the
IAM User Guide.

``` 
              Amazon Web Services always interprets the tag Value as a single string. If you
        need to store an array, you can store comma-separated values in the string. However, you
        must interpret the value in your code.
```

### `tagOpenIDConnectProvider(input:completion:)`

Adds one or more tags to an OpenID Connect (OIDC)-compatible identity provider. For
more information about these providers, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_oidc.html">About web identity federation. If
a tag with the same key name already exists, then that tag is overwritten with the new
value.
A tag consists of a key name and an associated value. By assigning tags to your
resources, you can do the following:​

``` swift
public func tagOpenIDConnectProvider(input: TagOpenIDConnectProviderInput, completion: @escaping (ClientRuntime.SdkResult<TagOpenIDConnectProviderOutputResponse, TagOpenIDConnectProviderOutputError>) -> Void)
```

``` 
              Administrative grouping and discovery - Attach
      tags to resources to aid in organization and search. For example, you could search for all
      resources with the key name Project and the value
        MyImportantProject. Or search for all resources with the key name
        Cost Center and the value 41200.



              Access control - Include tags in IAM user-based
      and resource-based policies. You can use tags to restrict access to only an OIDC provider
      that has a specified tag attached. For examples of policies that show how to use tags to
      control access, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">Control access using IAM tags in the
      IAM User Guide.





              If any one of the tags is invalid or if you exceed the allowed maximum number of tags, then the entire request
```

fails and the resource is not created. For more information about tagging, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging IAM resources in the
IAM User Guide.

``` 
              Amazon Web Services always interprets the tag Value as a single string. If you
        need to store an array, you can store comma-separated values in the string. However, you
        must interpret the value in your code.
```

### `tagPolicy(input:completion:)`

Adds one or more tags to an IAM customer managed policy. If a tag with the same key
name already exists, then that tag is overwritten with the new value.
A tag consists of a key name and an associated value. By assigning tags to your
resources, you can do the following:​

``` swift
public func tagPolicy(input: TagPolicyInput, completion: @escaping (ClientRuntime.SdkResult<TagPolicyOutputResponse, TagPolicyOutputError>) -> Void)
```

``` 
              Administrative grouping and discovery - Attach
      tags to resources to aid in organization and search. For example, you could search for all
      resources with the key name Project and the value
        MyImportantProject. Or search for all resources with the key name
        Cost Center and the value 41200.



              Access control - Include tags in IAM user-based
      and resource-based policies. You can use tags to restrict access to only an IAM customer
      managed policy that has a specified tag attached. For examples of policies that show how
      to use tags to control access, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">Control access using IAM tags in the
        IAM User Guide.





              If any one of the tags is invalid or if you exceed the allowed maximum number of tags, then the entire request
```

fails and the resource is not created. For more information about tagging, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging IAM resources in the
IAM User Guide.

``` 
              Amazon Web Services always interprets the tag Value as a single string. If you
        need to store an array, you can store comma-separated values in the string. However, you
        must interpret the value in your code.
```

### `tagRole(input:completion:)`

Adds one or more tags to an IAM role. The role can be a regular role or a
service-linked role. If a tag with the same key name already exists, then that tag is
overwritten with the new value.
A tag consists of a key name and an associated value. By assigning tags to your
resources, you can do the following:​

``` swift
public func tagRole(input: TagRoleInput, completion: @escaping (ClientRuntime.SdkResult<TagRoleOutputResponse, TagRoleOutputError>) -> Void)
```

``` 
              Administrative grouping and discovery - Attach
      tags to resources to aid in organization and search. For example, you could search for all
      resources with the key name Project and the value
        MyImportantProject. Or search for all resources with the key name
        Cost Center and the value 41200.



              Access control - Include tags in IAM user-based
      and resource-based policies. You can use tags to restrict access to only an IAM role
      that has a specified tag attached. You can also restrict access to only those resources
      that have a certain tag attached. For examples of policies that show how to use tags to
      control access, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">Control access using IAM tags in the
      IAM User Guide.



              Cost allocation - Use tags to help track which
      individuals and teams are using which Amazon Web Services resources.





              If any one of the tags is invalid or if you exceed the allowed maximum number of tags, then the entire request
```

fails and the resource is not created. For more information about tagging, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging IAM resources in the
IAM User Guide.

``` 
              Amazon Web Services always interprets the tag Value as a single string. If you
        need to store an array, you can store comma-separated values in the string. However, you
        must interpret the value in your code.



     For more information about tagging, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging IAM identities in the
    IAM User Guide.
```

### `tagSAMLProvider(input:completion:)`

Adds one or more tags to a Security Assertion Markup Language (SAML) identity provider.
For more information about these providers, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_saml.html">About SAML 2.0-based federation .
If a tag with the same key name already exists, then that tag is overwritten with the new
value.
A tag consists of a key name and an associated value. By assigning tags to your
resources, you can do the following:​

``` swift
public func tagSAMLProvider(input: TagSAMLProviderInput, completion: @escaping (ClientRuntime.SdkResult<TagSAMLProviderOutputResponse, TagSAMLProviderOutputError>) -> Void)
```

``` 
              Administrative grouping and discovery - Attach
      tags to resources to aid in organization and search. For example, you could search for all
      resources with the key name Project and the value
        MyImportantProject. Or search for all resources with the key name
        Cost Center and the value 41200.



              Access control - Include tags in IAM user-based
      and resource-based policies. You can use tags to restrict access to only a SAML identity
      provider that has a specified tag attached. For examples of policies that show how to use
      tags to control access, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">Control access using IAM tags in the
        IAM User Guide.





              If any one of the tags is invalid or if you exceed the allowed maximum number of tags, then the entire request
```

fails and the resource is not created. For more information about tagging, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging IAM resources in the
IAM User Guide.

``` 
              Amazon Web Services always interprets the tag Value as a single string. If you
        need to store an array, you can store comma-separated values in the string. However, you
        must interpret the value in your code.
```

### `tagServerCertificate(input:completion:)`

Adds one or more tags to an IAM server certificate. If a tag with the same key name
already exists, then that tag is overwritten with the new value.

``` swift
public func tagServerCertificate(input: TagServerCertificateInput, completion: @escaping (ClientRuntime.SdkResult<TagServerCertificateOutputResponse, TagServerCertificateOutputError>) -> Void)
```

``` 
        For certificates in a Region supported by Certificate Manager (ACM), we
    recommend that you don't use IAM server certificates. Instead, use ACM to provision,
    manage, and deploy your server certificates. For more information about IAM server
    certificates, <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html">Working with server
      certificates in the IAM User Guide.

     A tag consists of a key name and an associated value. By assigning tags to your
  resources, you can do the following:



              Administrative grouping and discovery - Attach
      tags to resources to aid in organization and search. For example, you could search for all
      resources with the key name Project and the value
        MyImportantProject. Or search for all resources with the key name
        Cost Center and the value 41200.



              Access control - Include tags in IAM user-based
      and resource-based policies. You can use tags to restrict access to only a server
      certificate that has a specified tag attached. For examples of policies that show how to
      use tags to control access, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">Control access using IAM tags in the
        IAM User Guide.



              Cost allocation - Use tags to help track which
      individuals and teams are using which Amazon Web Services resources.





              If any one of the tags is invalid or if you exceed the allowed maximum number of tags, then the entire request
```

fails and the resource is not created. For more information about tagging, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging IAM resources in the
IAM User Guide.

``` 
              Amazon Web Services always interprets the tag Value as a single string. If you
        need to store an array, you can store comma-separated values in the string. However, you
        must interpret the value in your code.
```

### `tagUser(input:completion:)`

Adds one or more tags to an IAM user. If a tag with the same key name already exists,
then that tag is overwritten with the new value.
A tag consists of a key name and an associated value. By assigning tags to your
resources, you can do the following:​

``` swift
public func tagUser(input: TagUserInput, completion: @escaping (ClientRuntime.SdkResult<TagUserOutputResponse, TagUserOutputError>) -> Void)
```

``` 
              Administrative grouping and discovery - Attach
      tags to resources to aid in organization and search. For example, you could search for all
      resources with the key name Project and the value
        MyImportantProject. Or search for all resources with the key name
        Cost Center and the value 41200.



              Access control - Include tags in IAM user-based
      and resource-based policies. You can use tags to restrict access to only an IAM
      requesting user that has a specified tag attached. You can also restrict access to only
      those resources that have a certain tag attached. For examples of policies that show how
      to use tags to control access, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">Control access using IAM tags in the
        IAM User Guide.



              Cost allocation - Use tags to help track which
      individuals and teams are using which Amazon Web Services resources.





              If any one of the tags is invalid or if you exceed the allowed maximum number of tags, then the entire request
```

fails and the resource is not created. For more information about tagging, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging IAM resources in the
IAM User Guide.

``` 
              Amazon Web Services always interprets the tag Value as a single string. If you
        need to store an array, you can store comma-separated values in the string. However, you
        must interpret the value in your code.



     For more information about tagging, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging IAM identities in the
    IAM User Guide.
```

### `untagInstanceProfile(input:completion:)`

Removes the specified tags from the IAM instance profile. For more information about tagging, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging IAM resources in the
IAM User Guide.

``` swift
public func untagInstanceProfile(input: UntagInstanceProfileInput, completion: @escaping (ClientRuntime.SdkResult<UntagInstanceProfileOutputResponse, UntagInstanceProfileOutputError>) -> Void)
```

### `untagMFADevice(input:completion:)`

Removes the specified tags from the IAM virtual multi-factor authentication (MFA)
device. For more information about tagging, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging IAM resources in the
IAM User Guide.

``` swift
public func untagMFADevice(input: UntagMFADeviceInput, completion: @escaping (ClientRuntime.SdkResult<UntagMFADeviceOutputResponse, UntagMFADeviceOutputError>) -> Void)
```

### `untagOpenIDConnectProvider(input:completion:)`

Removes the specified tags from the specified OpenID Connect (OIDC)-compatible identity
provider in IAM. For more information about OIDC providers, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_oidc.html">About web identity federation.
For more information about tagging, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging IAM resources in the
IAM User Guide.

``` swift
public func untagOpenIDConnectProvider(input: UntagOpenIDConnectProviderInput, completion: @escaping (ClientRuntime.SdkResult<UntagOpenIDConnectProviderOutputResponse, UntagOpenIDConnectProviderOutputError>) -> Void)
```

### `untagPolicy(input:completion:)`

Removes the specified tags from the customer managed policy. For more information about tagging, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging IAM resources in the
IAM User Guide.

``` swift
public func untagPolicy(input: UntagPolicyInput, completion: @escaping (ClientRuntime.SdkResult<UntagPolicyOutputResponse, UntagPolicyOutputError>) -> Void)
```

### `untagRole(input:completion:)`

Removes the specified tags from the role. For more information about tagging, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging IAM resources in the
IAM User Guide.

``` swift
public func untagRole(input: UntagRoleInput, completion: @escaping (ClientRuntime.SdkResult<UntagRoleOutputResponse, UntagRoleOutputError>) -> Void)
```

### `untagSAMLProvider(input:completion:)`

Removes the specified tags from the specified Security Assertion Markup Language (SAML)
identity provider in IAM. For more information about these providers, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_oidc.html">About web identity
federation. For more information about tagging, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging IAM resources in the
IAM User Guide.

``` swift
public func untagSAMLProvider(input: UntagSAMLProviderInput, completion: @escaping (ClientRuntime.SdkResult<UntagSAMLProviderOutputResponse, UntagSAMLProviderOutputError>) -> Void)
```

### `untagServerCertificate(input:completion:)`

Removes the specified tags from the IAM server certificate.
For more information about tagging, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging IAM resources in the
IAM User Guide.

``` swift
public func untagServerCertificate(input: UntagServerCertificateInput, completion: @escaping (ClientRuntime.SdkResult<UntagServerCertificateOutputResponse, UntagServerCertificateOutputError>) -> Void)
```

``` 
        For certificates in a Region supported by Certificate Manager (ACM), we
    recommend that you don't use IAM server certificates. Instead, use ACM to provision,
    manage, and deploy your server certificates. For more information about IAM server
    certificates, <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html">Working with server
      certificates in the IAM User Guide.
```

### `untagUser(input:completion:)`

Removes the specified tags from the user. For more information about tagging, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging IAM resources in the
IAM User Guide.

``` swift
public func untagUser(input: UntagUserInput, completion: @escaping (ClientRuntime.SdkResult<UntagUserOutputResponse, UntagUserOutputError>) -> Void)
```

### `updateAccessKey(input:completion:)`

Changes the status of the specified access key from Active to Inactive, or vice versa.
This operation can be used to disable a user's key as part of a key rotation
workflow.
If the UserName is not specified, the user name is determined implicitly
based on the Amazon Web Services access key ID used to sign the request. This operation works for
access keys under the Amazon Web Services account. Consequently, you can use this operation to manage
Amazon Web Services account root user credentials even if the Amazon Web Services account has no associated
users.
For information about rotating keys, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/ManagingCredentials.html">Managing keys and certificates
in the IAM User Guide.

``` swift
public func updateAccessKey(input: UpdateAccessKeyInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAccessKeyOutputResponse, UpdateAccessKeyOutputError>) -> Void)
```

### `updateAccountPasswordPolicy(input:completion:)`

Updates the password policy settings for the Amazon Web Services account.

``` swift
public func updateAccountPasswordPolicy(input: UpdateAccountPasswordPolicyInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAccountPasswordPolicyOutputResponse, UpdateAccountPasswordPolicyOutputError>) -> Void)
```

``` 
                This operation does not support partial updates. No parameters are
                    required, but if you do not specify a parameter, that parameter's value
                    reverts to its default value. See the Request
                        Parameters section for each parameter's default value. Also
                    note that some parameters do not allow the default parameter to be
                    explicitly set. Instead, to invoke the default value, do not include that
                    parameter when you invoke the operation.



     For more information about using a password policy, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingPasswordPolicies.html">Managing an IAM password
            policy in the IAM User Guide.
```

### `updateAssumeRolePolicy(input:completion:)`

Updates the policy that grants an IAM entity permission to assume a role. This is
typically referred to as the "role trust policy". For more information about roles, see
<a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/roles-toplevel.html">Using roles to
delegate permissions and federate identities.

``` swift
public func updateAssumeRolePolicy(input: UpdateAssumeRolePolicyInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAssumeRolePolicyOutputResponse, UpdateAssumeRolePolicyOutputError>) -> Void)
```

### `updateGroup(input:completion:)`

Updates the name and/or the path of the specified IAM group.

``` swift
public func updateGroup(input: UpdateGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateGroupOutputResponse, UpdateGroupOutputError>) -> Void)
```

``` 
         You should understand the implications of changing a group's path or name. For
            more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_WorkingWithGroupsAndUsers.html">Renaming users and
                groups in the IAM User Guide.


        The person making the request (the principal), must have permission to change the
            role group with the old name and the new name. For example, to change the group
            named Managers to MGRs, the principal must have a policy
            that allows them to update both groups. If the principal has permission to update
            the Managers group, but not the MGRs group, then the
            update fails. For more information about permissions, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access.html">Access management.
```

### `updateLoginProfile(input:completion:)`

Changes the password for the specified IAM user. You can use the CLI,
the Amazon Web Services API, or the Users page in the IAM console
to change the password for any IAM user. Use ChangePassword to
change your own password in the My Security Credentials
page in the Amazon Web Services Management Console.
For more information about modifying passwords, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingLogins.html">Managing passwords in the
IAM User Guide.

``` swift
public func updateLoginProfile(input: UpdateLoginProfileInput, completion: @escaping (ClientRuntime.SdkResult<UpdateLoginProfileOutputResponse, UpdateLoginProfileOutputError>) -> Void)
```

### `updateOpenIDConnectProviderThumbprint(input:completion:)`

Replaces the existing list of server certificate thumbprints associated with an OpenID
Connect (OIDC) provider resource object with a new list of thumbprints.
The list that you pass with this operation completely replaces the existing list of
thumbprints. (The lists are not merged.)
Typically, you need to update a thumbprint only when the identity provider
certificate changes, which occurs rarely. However, if the provider's certificate
does change, any attempt to assume an IAM role that specifies
the OIDC provider as a principal fails until the certificate thumbprint is
updated.

``` swift
public func updateOpenIDConnectProviderThumbprint(input: UpdateOpenIDConnectProviderThumbprintInput, completion: @escaping (ClientRuntime.SdkResult<UpdateOpenIDConnectProviderThumbprintOutputResponse, UpdateOpenIDConnectProviderThumbprintOutputError>) -> Void)
```

``` 
        Amazon Web Services secures communication with some OIDC identity providers (IdPs) through our
        library of trusted certificate authorities (CAs) instead of using a certificate
        thumbprint to verify your IdP server certificate. These OIDC IdPs include Google, and
        those that use an Amazon S3 bucket to host a JSON Web Key Set (JWKS) endpoint. In these
        cases, your legacy thumbprint remains in your configuration, but is no longer used for validation.


        Trust for the OIDC provider is derived from the provider certificate and is
            validated by the thumbprint. Therefore, it is best to limit access to the
                UpdateOpenIDConnectProviderThumbprint operation to highly
            privileged users.
```

### `updateRole(input:completion:)`

Updates the description or maximum session duration setting of a role.

``` swift
public func updateRole(input: UpdateRoleInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRoleOutputResponse, UpdateRoleOutputError>) -> Void)
```

### `updateRoleDescription(input:completion:)`

Use UpdateRole instead.
Modifies only the description of a role. This operation performs the same function as
the Description parameter in the UpdateRole operation.

``` swift
public func updateRoleDescription(input: UpdateRoleDescriptionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRoleDescriptionOutputResponse, UpdateRoleDescriptionOutputError>) -> Void)
```

### `updateSAMLProvider(input:completion:)`

Updates the metadata document for an existing SAML provider resource object.

``` swift
public func updateSAMLProvider(input: UpdateSAMLProviderInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSAMLProviderOutputResponse, UpdateSAMLProviderOutputError>) -> Void)
```

``` 
        This operation requires <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4.
```

### `updateSSHPublicKey(input:completion:)`

Sets the status of an IAM user's SSH public key to active or inactive. SSH public
keys that are inactive cannot be used for authentication. This operation can be used to
disable a user's SSH public key as part of a key rotation work flow.
The SSH public key affected by this operation is used only for authenticating the
associated IAM user to an CodeCommit repository. For more information about using SSH keys
to authenticate to an CodeCommit repository, see <a href="https:​//docs.aws.amazon.com/codecommit/latest/userguide/setting-up-credentials-ssh.html">Set up CodeCommit for
SSH connections in the CodeCommit User Guide.

``` swift
public func updateSSHPublicKey(input: UpdateSSHPublicKeyInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSSHPublicKeyOutputResponse, UpdateSSHPublicKeyOutputError>) -> Void)
```

### `updateServerCertificate(input:completion:)`

Updates the name and/or the path of the specified server certificate stored in
IAM.
For more information about working with server certificates, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html">Working
with server certificates in the IAM User Guide. This
topic also includes a list of Amazon Web Services services that can use the server certificates that
you manage with IAM.

``` swift
public func updateServerCertificate(input: UpdateServerCertificateInput, completion: @escaping (ClientRuntime.SdkResult<UpdateServerCertificateOutputResponse, UpdateServerCertificateOutputError>) -> Void)
```

``` 
        You should understand the implications of changing a server certificate's path or
            name. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs_manage.html#RenamingServerCerts">Renaming a server certificate in the
                IAM User Guide.


        The person making the request (the principal), must have permission to change the
            server certificate with the old name and the new name. For example, to change the
            certificate named ProductionCert to ProdCert, the
            principal must have a policy that allows them to update both certificates. If the
            principal has permission to update the ProductionCert group, but not
            the ProdCert certificate, then the update fails. For more information
            about permissions, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access.html">Access management in the IAM User Guide.
```

### `updateServiceSpecificCredential(input:completion:)`

Sets the status of a service-specific credential to Active or
Inactive. Service-specific credentials that are inactive cannot be used
for authentication to the service. This operation can be used to disable a user's
service-specific credential as part of a credential rotation work flow.

``` swift
public func updateServiceSpecificCredential(input: UpdateServiceSpecificCredentialInput, completion: @escaping (ClientRuntime.SdkResult<UpdateServiceSpecificCredentialOutputResponse, UpdateServiceSpecificCredentialOutputError>) -> Void)
```

### `updateSigningCertificate(input:completion:)`

Changes the status of the specified user signing certificate from active to disabled,
or vice versa. This operation can be used to disable an IAM user's signing certificate
as part of a certificate rotation work flow.
If the UserName field is not specified, the user name is determined
implicitly based on the Amazon Web Services access key ID used to sign the request. This operation
works for access keys under the Amazon Web Services account. Consequently, you can use this operation
to manage Amazon Web Services account root user credentials even if the Amazon Web Services account has no
associated users.

``` swift
public func updateSigningCertificate(input: UpdateSigningCertificateInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSigningCertificateOutputResponse, UpdateSigningCertificateOutputError>) -> Void)
```

### `updateUser(input:completion:)`

Updates the name and/or the path of the specified IAM user.

``` swift
public func updateUser(input: UpdateUserInput, completion: @escaping (ClientRuntime.SdkResult<UpdateUserOutputResponse, UpdateUserOutputError>) -> Void)
```

``` 
         You should understand the implications of changing an IAM user's path or name.
            For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_manage.html#id_users_renaming">Renaming an IAM
                user and <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_groups_manage_rename.html">Renaming an IAM
                group in the IAM User Guide.


         To change a user name, the requester must have appropriate permissions on both
            the source object and the target object. For example, to change Bob to Robert, the
            entity making the request must have permission on Bob and Robert, or must have
            permission on all (*). For more information about permissions, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/PermissionsAndPolicies.html">Permissions and policies.
```

### `uploadSSHPublicKey(input:completion:)`

Uploads an SSH public key and associates it with the specified IAM user.
The SSH public key uploaded by this operation can be used only for authenticating the
associated IAM user to an CodeCommit repository. For more information about using SSH keys
to authenticate to an CodeCommit repository, see <a href="https:​//docs.aws.amazon.com/codecommit/latest/userguide/setting-up-credentials-ssh.html">Set up CodeCommit for
SSH connections in the CodeCommit User Guide.

``` swift
public func uploadSSHPublicKey(input: UploadSSHPublicKeyInput, completion: @escaping (ClientRuntime.SdkResult<UploadSSHPublicKeyOutputResponse, UploadSSHPublicKeyOutputError>) -> Void)
```

### `uploadServerCertificate(input:completion:)`

Uploads a server certificate entity for the Amazon Web Services account. The server certificate
entity includes a public key certificate, a private key, and an optional certificate
chain, which should all be PEM-encoded.
We recommend that you use <a href="https:​//docs.aws.amazon.com/acm/">Certificate Manager to provision, manage, and deploy your server certificates. With ACM
you can request a certificate, deploy it to Amazon Web Services resources, and let ACM handle
certificate renewals for you. Certificates provided by ACM are free. For more
information about using ACM, see the <a href="https:​//docs.aws.amazon.com/acm/latest/userguide/">Certificate Manager User Guide.
For more information about working with server certificates, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html">Working
with server certificates in the IAM User Guide. This
topic includes a list of Amazon Web Services services that can use the server certificates that you
manage with IAM.
For information about the number of server certificates you can upload, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html">IAM and STS
quotas in the IAM User Guide.

``` swift
public func uploadServerCertificate(input: UploadServerCertificateInput, completion: @escaping (ClientRuntime.SdkResult<UploadServerCertificateOutputResponse, UploadServerCertificateOutputError>) -> Void)
```

``` 
        Because the body of the public key certificate, private key, and the certificate
            chain can be large, you should use POST rather than GET when calling
                UploadServerCertificate. For information about setting up
            signatures and authorization through the API, see <a href="https://docs.aws.amazon.com/general/latest/gr/signing_aws_api_requests.html">Signing Amazon Web Services API
                requests in the Amazon Web Services General Reference. For general
            information about using the Query API with IAM, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/programming.html">Calling the API by making HTTP query
                requests in the IAM User Guide.
```

### `uploadSigningCertificate(input:completion:)`

Uploads an X.509 signing certificate and associates it with the specified IAM user.
Some Amazon Web Services services require you to use certificates to validate requests that are signed
with a corresponding private key. When you upload the certificate, its default status is
Active.
For information about when you would use an X.509 signing certificate, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html">Managing
server certificates in IAM in the
IAM User Guide.
If the UserName is not specified, the IAM user name is determined
implicitly based on the Amazon Web Services access key ID used to sign the request. This operation
works for access keys under the Amazon Web Services account. Consequently, you can use this operation
to manage Amazon Web Services account root user credentials even if the Amazon Web Services account has no
associated users.

``` swift
public func uploadSigningCertificate(input: UploadSigningCertificateInput, completion: @escaping (ClientRuntime.SdkResult<UploadSigningCertificateOutputResponse, UploadSigningCertificateOutputError>) -> Void)
```

``` 
        Because the body of an X.509 certificate can be large, you should use POST rather
            than GET when calling UploadSigningCertificate. For information about
            setting up signatures and authorization through the API, see <a href="https://docs.aws.amazon.com/general/latest/gr/signing_aws_api_requests.html">Signing
                Amazon Web Services API requests in the Amazon Web Services General Reference. For
            general information about using the Query API with IAM, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/IAM_UsingQueryAPI.html">Making query
                requests in the IAM User Guide.
```
