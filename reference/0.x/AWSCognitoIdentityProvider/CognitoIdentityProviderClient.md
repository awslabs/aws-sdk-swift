# CognitoIdentityProviderClient

``` swift
public class CognitoIdentityProviderClient 
```

## Inheritance

[`CognitoIdentityProviderClientProtocol`](/aws-sdk-swift/reference/0.x/AWSCognitoIdentityProvider/CognitoIdentityProviderClientProtocol)

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
public static let clientName = "CognitoIdentityProviderClient"
```

## Methods

### `addCustomAttributes(input:completion:)`

Adds additional user attributes to the user pool schema.

``` swift
public func addCustomAttributes(input: AddCustomAttributesInput, completion: @escaping (ClientRuntime.SdkResult<AddCustomAttributesOutputResponse, AddCustomAttributesOutputError>) -> Void)
```

### `adminAddUserToGroup(input:completion:)`

Adds the specified user to the specified group. Calling this action requires developer credentials.

``` swift
public func adminAddUserToGroup(input: AdminAddUserToGroupInput, completion: @escaping (ClientRuntime.SdkResult<AdminAddUserToGroupOutputResponse, AdminAddUserToGroupOutputError>) -> Void)
```

### `adminConfirmSignUp(input:completion:)`

Confirms user registration as an admin without using a confirmation code. Works on any user. Calling this action requires developer credentials.

``` swift
public func adminConfirmSignUp(input: AdminConfirmSignUpInput, completion: @escaping (ClientRuntime.SdkResult<AdminConfirmSignUpOutputResponse, AdminConfirmSignUpOutputError>) -> Void)
```

### `adminCreateUser(input:completion:)`

Creates a new user in the specified user pool. If MessageAction is not set, the default is to send a welcome message via email or phone (SMS). This action might generate an SMS text message. Starting June 1, 2021, U.S. telecom carriers require that you register an origination phone number before you can send SMS messages to U.S. phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with [Amazon Pinpoint](https://console.aws.amazon.com/pinpoint/home/). Cognito will use the the registered number automatically. Otherwise, Cognito users that must receive SMS messages might be unable to sign up, activate their accounts, or sign in. If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon SNS might place your account in SMS sandbox. In [sandbox mode](https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html) , you’ll have limitations, such as sending messages to only verified phone numbers. After testing in the sandbox environment, you can move out of the SMS sandbox and into production. For more information, see [ SMS message settings for Cognito User Pools](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html) in the Amazon Cognito Developer Guide. This message is based on a template that you configured in your call to create or update a user pool. This template includes your custom sign-up instructions and placeholders for user name and temporary password. Alternatively, you can call AdminCreateUser with “SUPPRESS” for the MessageAction parameter, and Amazon Cognito will not send any email. In either case, the user will be in the FORCE\_CHANGE\_PASSWORD state until they sign in and change their password. AdminCreateUser requires developer credentials.

``` swift
public func adminCreateUser(input: AdminCreateUserInput, completion: @escaping (ClientRuntime.SdkResult<AdminCreateUserOutputResponse, AdminCreateUserOutputError>) -> Void)
```

### `adminDeleteUser(input:completion:)`

Deletes a user as an administrator. Works on any user. Calling this action requires developer credentials.

``` swift
public func adminDeleteUser(input: AdminDeleteUserInput, completion: @escaping (ClientRuntime.SdkResult<AdminDeleteUserOutputResponse, AdminDeleteUserOutputError>) -> Void)
```

### `adminDeleteUserAttributes(input:completion:)`

Deletes the user attributes in a user pool as an administrator. Works on any user. Calling this action requires developer credentials.

``` swift
public func adminDeleteUserAttributes(input: AdminDeleteUserAttributesInput, completion: @escaping (ClientRuntime.SdkResult<AdminDeleteUserAttributesOutputResponse, AdminDeleteUserAttributesOutputError>) -> Void)
```

### `adminDisableProviderForUser(input:completion:)`

Disables the user from signing in with the specified external (SAML or social) identity provider. If the user to disable is a Cognito User Pools native username + password user, they are not permitted to use their password to sign-in. If the user to disable is a linked external IdP user, any link between that user and an existing user is removed. The next time the external user (no longer attached to the previously linked DestinationUser) signs in, they must create a new user account. See [AdminLinkProviderForUser](https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminLinkProviderForUser.html). This action is enabled only for admin access and requires developer credentials. The ProviderName must match the value specified when creating an IdP for the pool. To disable a native username + password user, the ProviderName value must be Cognito and the ProviderAttributeName must be Cognito\_Subject, with the ProviderAttributeValue being the name that is used in the user pool for the user. The ProviderAttributeName must always be Cognito\_Subject for social identity providers. The ProviderAttributeValue must always be the exact subject that was used when the user was originally linked as a source user. For de-linking a SAML identity, there are two scenarios. If the linked identity has not yet been used to sign-in, the ProviderAttributeName and ProviderAttributeValue must be the same values that were used for the SourceUser when the identities were originally linked using  AdminLinkProviderForUser call. (If the linking was done with ProviderAttributeName set to Cognito\_Subject, the same applies here). However, if the user has already signed in, the ProviderAttributeName must be Cognito\_Subject and ProviderAttributeValue must be the subject of the SAML assertion.

``` swift
public func adminDisableProviderForUser(input: AdminDisableProviderForUserInput, completion: @escaping (ClientRuntime.SdkResult<AdminDisableProviderForUserOutputResponse, AdminDisableProviderForUserOutputError>) -> Void)
```

### `adminDisableUser(input:completion:)`

Disables the specified user. Calling this action requires developer credentials.

``` swift
public func adminDisableUser(input: AdminDisableUserInput, completion: @escaping (ClientRuntime.SdkResult<AdminDisableUserOutputResponse, AdminDisableUserOutputError>) -> Void)
```

### `adminEnableUser(input:completion:)`

Enables the specified user as an administrator. Works on any user. Calling this action requires developer credentials.

``` swift
public func adminEnableUser(input: AdminEnableUserInput, completion: @escaping (ClientRuntime.SdkResult<AdminEnableUserOutputResponse, AdminEnableUserOutputError>) -> Void)
```

### `adminForgetDevice(input:completion:)`

Forgets the device, as an administrator. Calling this action requires developer credentials.

``` swift
public func adminForgetDevice(input: AdminForgetDeviceInput, completion: @escaping (ClientRuntime.SdkResult<AdminForgetDeviceOutputResponse, AdminForgetDeviceOutputError>) -> Void)
```

### `adminGetDevice(input:completion:)`

Gets the device, as an administrator. Calling this action requires developer credentials.

``` swift
public func adminGetDevice(input: AdminGetDeviceInput, completion: @escaping (ClientRuntime.SdkResult<AdminGetDeviceOutputResponse, AdminGetDeviceOutputError>) -> Void)
```

### `adminGetUser(input:completion:)`

Gets the specified user by user name in a user pool as an administrator. Works on any user. Calling this action requires developer credentials.

``` swift
public func adminGetUser(input: AdminGetUserInput, completion: @escaping (ClientRuntime.SdkResult<AdminGetUserOutputResponse, AdminGetUserOutputError>) -> Void)
```

### `adminInitiateAuth(input:completion:)`

Initiates the authentication flow, as an administrator. This action might generate an SMS text message. Starting June 1, 2021, U.S. telecom carriers require that you register an origination phone number before you can send SMS messages to U.S. phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with [Amazon Pinpoint](https://console.aws.amazon.com/pinpoint/home/). Cognito will use the the registered number automatically. Otherwise, Cognito users that must receive SMS messages might be unable to sign up, activate their accounts, or sign in. If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon SNS might place your account in SMS sandbox. In [sandbox mode](https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html) , you’ll have limitations, such as sending messages to only verified phone numbers. After testing in the sandbox environment, you can move out of the SMS sandbox and into production. For more information, see [ SMS message settings for Cognito User Pools](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html) in the Amazon Cognito Developer Guide. Calling this action requires developer credentials.

``` swift
public func adminInitiateAuth(input: AdminInitiateAuthInput, completion: @escaping (ClientRuntime.SdkResult<AdminInitiateAuthOutputResponse, AdminInitiateAuthOutputError>) -> Void)
```

### `adminLinkProviderForUser(input:completion:)`

Links an existing user account in a user pool (DestinationUser) to an identity from an external identity provider (SourceUser) based on a specified attribute name and value from the external identity provider. This allows you to create a link from the existing user account to an external federated user identity that has not yet been used to sign in, so that the federated user identity can be used to sign in as the existing user account. For example, if there is an existing user with a username and password, this API links that user to a federated user identity, so that when the federated user identity is used, the user signs in as the existing user account. The maximum number of federated identities linked to a user is 5. Because this API allows a user with an external federated identity to sign in as an existing user in the user pool, it is critical that it only be used with external identity providers and provider attributes that have been trusted by the application owner. This action is enabled only for admin access and requires developer credentials.

``` swift
public func adminLinkProviderForUser(input: AdminLinkProviderForUserInput, completion: @escaping (ClientRuntime.SdkResult<AdminLinkProviderForUserOutputResponse, AdminLinkProviderForUserOutputError>) -> Void)
```

### `adminListDevices(input:completion:)`

Lists devices, as an administrator. Calling this action requires developer credentials.

``` swift
public func adminListDevices(input: AdminListDevicesInput, completion: @escaping (ClientRuntime.SdkResult<AdminListDevicesOutputResponse, AdminListDevicesOutputError>) -> Void)
```

### `adminListGroupsForUser(input:completion:)`

Lists the groups that the user belongs to. Calling this action requires developer credentials.

``` swift
public func adminListGroupsForUser(input: AdminListGroupsForUserInput, completion: @escaping (ClientRuntime.SdkResult<AdminListGroupsForUserOutputResponse, AdminListGroupsForUserOutputError>) -> Void)
```

### `adminListUserAuthEvents(input:completion:)`

Lists a history of user activity and any risks detected as part of Amazon Cognito advanced security.

``` swift
public func adminListUserAuthEvents(input: AdminListUserAuthEventsInput, completion: @escaping (ClientRuntime.SdkResult<AdminListUserAuthEventsOutputResponse, AdminListUserAuthEventsOutputError>) -> Void)
```

### `adminRemoveUserFromGroup(input:completion:)`

Removes the specified user from the specified group. Calling this action requires developer credentials.

``` swift
public func adminRemoveUserFromGroup(input: AdminRemoveUserFromGroupInput, completion: @escaping (ClientRuntime.SdkResult<AdminRemoveUserFromGroupOutputResponse, AdminRemoveUserFromGroupOutputError>) -> Void)
```

### `adminResetUserPassword(input:completion:)`

Resets the specified user's password in a user pool as an administrator. Works on any user. When a developer calls this API, the current password is invalidated, so it must be changed. If a user tries to sign in after the API is called, the app will get a PasswordResetRequiredException exception back and should direct the user down the flow to reset the password, which is the same as the forgot password flow. In addition, if the user pool has phone verification selected and a verified phone number exists for the user, or if email verification is selected and a verified email exists for the user, calling this API will also result in sending a message to the end user with the code to change their password. This action might generate an SMS text message. Starting June 1, 2021, U.S. telecom carriers require that you register an origination phone number before you can send SMS messages to U.S. phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with [Amazon Pinpoint](https://console.aws.amazon.com/pinpoint/home/). Cognito will use the the registered number automatically. Otherwise, Cognito users that must receive SMS messages might be unable to sign up, activate their accounts, or sign in. If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon SNS might place your account in SMS sandbox. In [sandbox mode](https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html) , you’ll have limitations, such as sending messages to only verified phone numbers. After testing in the sandbox environment, you can move out of the SMS sandbox and into production. For more information, see [ SMS message settings for Cognito User Pools](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html) in the Amazon Cognito Developer Guide. Calling this action requires developer credentials.

``` swift
public func adminResetUserPassword(input: AdminResetUserPasswordInput, completion: @escaping (ClientRuntime.SdkResult<AdminResetUserPasswordOutputResponse, AdminResetUserPasswordOutputError>) -> Void)
```

### `adminRespondToAuthChallenge(input:completion:)`

Responds to an authentication challenge, as an administrator. This action might generate an SMS text message. Starting June 1, 2021, U.S. telecom carriers require that you register an origination phone number before you can send SMS messages to U.S. phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with [Amazon Pinpoint](https://console.aws.amazon.com/pinpoint/home/). Cognito will use the the registered number automatically. Otherwise, Cognito users that must receive SMS messages might be unable to sign up, activate their accounts, or sign in. If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon SNS might place your account in SMS sandbox. In [sandbox mode](https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html) , you’ll have limitations, such as sending messages to only verified phone numbers. After testing in the sandbox environment, you can move out of the SMS sandbox and into production. For more information, see [ SMS message settings for Cognito User Pools](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html) in the Amazon Cognito Developer Guide. Calling this action requires developer credentials.

``` swift
public func adminRespondToAuthChallenge(input: AdminRespondToAuthChallengeInput, completion: @escaping (ClientRuntime.SdkResult<AdminRespondToAuthChallengeOutputResponse, AdminRespondToAuthChallengeOutputError>) -> Void)
```

### `adminSetUserMFAPreference(input:completion:)`

Sets the user's multi-factor authentication (MFA) preference, including which MFA options are enabled and if any are preferred. Only one factor can be set as preferred. The preferred MFA factor will be used to authenticate a user if multiple factors are enabled. If multiple options are enabled and no preference is set, a challenge to choose an MFA option will be returned during sign in.

``` swift
public func adminSetUserMFAPreference(input: AdminSetUserMFAPreferenceInput, completion: @escaping (ClientRuntime.SdkResult<AdminSetUserMFAPreferenceOutputResponse, AdminSetUserMFAPreferenceOutputError>) -> Void)
```

### `adminSetUserPassword(input:completion:)`

Sets the specified user's password in a user pool as an administrator. Works on any user. The password can be temporary or permanent. If it is temporary, the user status will be placed into the FORCE\_CHANGE\_PASSWORD state. When the user next tries to sign in, the InitiateAuth/AdminInitiateAuth response will contain the NEW\_PASSWORD\_REQUIRED challenge. If the user does not sign in before it expires, the user will not be able to sign in and their password will need to be reset by an administrator. Once the user has set a new password, or the password is permanent, the user status will be set to Confirmed.

``` swift
public func adminSetUserPassword(input: AdminSetUserPasswordInput, completion: @escaping (ClientRuntime.SdkResult<AdminSetUserPasswordOutputResponse, AdminSetUserPasswordOutputError>) -> Void)
```

### `adminSetUserSettings(input:completion:)`

This action is no longer supported. You can use it to configure only SMS MFA. You can't use it to configure TOTP software token MFA. To configure either type of MFA, use [AdminSetUserMFAPreference](https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminSetUserMFAPreference.html) instead.

``` swift
public func adminSetUserSettings(input: AdminSetUserSettingsInput, completion: @escaping (ClientRuntime.SdkResult<AdminSetUserSettingsOutputResponse, AdminSetUserSettingsOutputError>) -> Void)
```

### `adminUpdateAuthEventFeedback(input:completion:)`

Provides feedback for an authentication event as to whether it was from a valid user. This feedback is used for improving the risk evaluation decision for the user pool as part of Amazon Cognito advanced security.

``` swift
public func adminUpdateAuthEventFeedback(input: AdminUpdateAuthEventFeedbackInput, completion: @escaping (ClientRuntime.SdkResult<AdminUpdateAuthEventFeedbackOutputResponse, AdminUpdateAuthEventFeedbackOutputError>) -> Void)
```

### `adminUpdateDeviceStatus(input:completion:)`

Updates the device status as an administrator. Calling this action requires developer credentials.

``` swift
public func adminUpdateDeviceStatus(input: AdminUpdateDeviceStatusInput, completion: @escaping (ClientRuntime.SdkResult<AdminUpdateDeviceStatusOutputResponse, AdminUpdateDeviceStatusOutputError>) -> Void)
```

### `adminUpdateUserAttributes(input:completion:)`

Updates the specified user's attributes, including developer attributes, as an administrator. Works on any user. For custom attributes, you must prepend the custom: prefix to the attribute name. In addition to updating user attributes, this API can also be used to mark phone and email as verified. This action might generate an SMS text message. Starting June 1, 2021, U.S. telecom carriers require that you register an origination phone number before you can send SMS messages to U.S. phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with [Amazon Pinpoint](https://console.aws.amazon.com/pinpoint/home/). Cognito will use the the registered number automatically. Otherwise, Cognito users that must receive SMS messages might be unable to sign up, activate their accounts, or sign in. If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon SNS might place your account in SMS sandbox. In [sandbox mode](https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html) , you’ll have limitations, such as sending messages to only verified phone numbers. After testing in the sandbox environment, you can move out of the SMS sandbox and into production. For more information, see [ SMS message settings for Cognito User Pools](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html) in the Amazon Cognito Developer Guide. Calling this action requires developer credentials.

``` swift
public func adminUpdateUserAttributes(input: AdminUpdateUserAttributesInput, completion: @escaping (ClientRuntime.SdkResult<AdminUpdateUserAttributesOutputResponse, AdminUpdateUserAttributesOutputError>) -> Void)
```

### `adminUserGlobalSignOut(input:completion:)`

Signs out users from all devices, as an administrator. It also invalidates all refresh tokens issued to a user. The user's current access and Id tokens remain valid until their expiry. Access and Id tokens expire one hour after they are issued. Calling this action requires developer credentials.

``` swift
public func adminUserGlobalSignOut(input: AdminUserGlobalSignOutInput, completion: @escaping (ClientRuntime.SdkResult<AdminUserGlobalSignOutOutputResponse, AdminUserGlobalSignOutOutputError>) -> Void)
```

### `associateSoftwareToken(input:completion:)`

Returns a unique generated shared secret key code for the user account. The request takes an access token or a session string, but not both. Calling AssociateSoftwareToken immediately disassociates the existing software token from the user account. If the user doesn't subsequently verify the software token, their account is essentially set up to authenticate without MFA. If MFA config is set to Optional at the user pool level, the user can then login without MFA. However, if MFA is set to Required for the user pool, the user will be asked to setup a new software token MFA during sign in.

``` swift
public func associateSoftwareToken(input: AssociateSoftwareTokenInput, completion: @escaping (ClientRuntime.SdkResult<AssociateSoftwareTokenOutputResponse, AssociateSoftwareTokenOutputError>) -> Void)
```

### `changePassword(input:completion:)`

Changes the password for a specified user in a user pool.

``` swift
public func changePassword(input: ChangePasswordInput, completion: @escaping (ClientRuntime.SdkResult<ChangePasswordOutputResponse, ChangePasswordOutputError>) -> Void)
```

### `confirmDevice(input:completion:)`

Confirms tracking of the device. This API call is the call that begins device tracking.

``` swift
public func confirmDevice(input: ConfirmDeviceInput, completion: @escaping (ClientRuntime.SdkResult<ConfirmDeviceOutputResponse, ConfirmDeviceOutputError>) -> Void)
```

### `confirmForgotPassword(input:completion:)`

Allows a user to enter a confirmation code to reset a forgotten password.

``` swift
public func confirmForgotPassword(input: ConfirmForgotPasswordInput, completion: @escaping (ClientRuntime.SdkResult<ConfirmForgotPasswordOutputResponse, ConfirmForgotPasswordOutputError>) -> Void)
```

### `confirmSignUp(input:completion:)`

Confirms registration of a user and handles the existing alias from a previous user.

``` swift
public func confirmSignUp(input: ConfirmSignUpInput, completion: @escaping (ClientRuntime.SdkResult<ConfirmSignUpOutputResponse, ConfirmSignUpOutputError>) -> Void)
```

### `createGroup(input:completion:)`

Creates a new group in the specified user pool. Calling this action requires developer credentials.

``` swift
public func createGroup(input: CreateGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateGroupOutputResponse, CreateGroupOutputError>) -> Void)
```

### `createIdentityProvider(input:completion:)`

Creates an identity provider for a user pool.

``` swift
public func createIdentityProvider(input: CreateIdentityProviderInput, completion: @escaping (ClientRuntime.SdkResult<CreateIdentityProviderOutputResponse, CreateIdentityProviderOutputError>) -> Void)
```

### `createResourceServer(input:completion:)`

Creates a new OAuth2.0 resource server and defines custom scopes in it.

``` swift
public func createResourceServer(input: CreateResourceServerInput, completion: @escaping (ClientRuntime.SdkResult<CreateResourceServerOutputResponse, CreateResourceServerOutputError>) -> Void)
```

### `createUserImportJob(input:completion:)`

Creates the user import job.

``` swift
public func createUserImportJob(input: CreateUserImportJobInput, completion: @escaping (ClientRuntime.SdkResult<CreateUserImportJobOutputResponse, CreateUserImportJobOutputError>) -> Void)
```

### `createUserPool(input:completion:)`

Creates a new Amazon Cognito user pool and sets the password policy for the pool. This action might generate an SMS text message. Starting June 1, 2021, U.S. telecom carriers require that you register an origination phone number before you can send SMS messages to U.S. phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with [Amazon Pinpoint](https://console.aws.amazon.com/pinpoint/home/). Cognito will use the the registered number automatically. Otherwise, Cognito users that must receive SMS messages might be unable to sign up, activate their accounts, or sign in. If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon SNS might place your account in SMS sandbox. In [sandbox mode](https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html) , you’ll have limitations, such as sending messages to only verified phone numbers. After testing in the sandbox environment, you can move out of the SMS sandbox and into production. For more information, see [ SMS message settings for Cognito User Pools](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html) in the Amazon Cognito Developer Guide.

``` swift
public func createUserPool(input: CreateUserPoolInput, completion: @escaping (ClientRuntime.SdkResult<CreateUserPoolOutputResponse, CreateUserPoolOutputError>) -> Void)
```

### `createUserPoolClient(input:completion:)`

Creates the user pool client. When you create a new user pool client, token revocation is automatically enabled. For more information about revoking tokens, see [RevokeToken](https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_RevokeToken.html).

``` swift
public func createUserPoolClient(input: CreateUserPoolClientInput, completion: @escaping (ClientRuntime.SdkResult<CreateUserPoolClientOutputResponse, CreateUserPoolClientOutputError>) -> Void)
```

### `createUserPoolDomain(input:completion:)`

Creates a new domain for a user pool.

``` swift
public func createUserPoolDomain(input: CreateUserPoolDomainInput, completion: @escaping (ClientRuntime.SdkResult<CreateUserPoolDomainOutputResponse, CreateUserPoolDomainOutputError>) -> Void)
```

### `deleteGroup(input:completion:)`

Deletes a group. Calling this action requires developer credentials.

``` swift
public func deleteGroup(input: DeleteGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteGroupOutputResponse, DeleteGroupOutputError>) -> Void)
```

### `deleteIdentityProvider(input:completion:)`

Deletes an identity provider for a user pool.

``` swift
public func deleteIdentityProvider(input: DeleteIdentityProviderInput, completion: @escaping (ClientRuntime.SdkResult<DeleteIdentityProviderOutputResponse, DeleteIdentityProviderOutputError>) -> Void)
```

### `deleteResourceServer(input:completion:)`

Deletes a resource server.

``` swift
public func deleteResourceServer(input: DeleteResourceServerInput, completion: @escaping (ClientRuntime.SdkResult<DeleteResourceServerOutputResponse, DeleteResourceServerOutputError>) -> Void)
```

### `deleteUser(input:completion:)`

Allows a user to delete himself or herself.

``` swift
public func deleteUser(input: DeleteUserInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUserOutputResponse, DeleteUserOutputError>) -> Void)
```

### `deleteUserAttributes(input:completion:)`

Deletes the attributes for a user.

``` swift
public func deleteUserAttributes(input: DeleteUserAttributesInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUserAttributesOutputResponse, DeleteUserAttributesOutputError>) -> Void)
```

### `deleteUserPool(input:completion:)`

Deletes the specified Amazon Cognito user pool.

``` swift
public func deleteUserPool(input: DeleteUserPoolInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUserPoolOutputResponse, DeleteUserPoolOutputError>) -> Void)
```

### `deleteUserPoolClient(input:completion:)`

Allows the developer to delete the user pool client.

``` swift
public func deleteUserPoolClient(input: DeleteUserPoolClientInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUserPoolClientOutputResponse, DeleteUserPoolClientOutputError>) -> Void)
```

### `deleteUserPoolDomain(input:completion:)`

Deletes a domain for a user pool.

``` swift
public func deleteUserPoolDomain(input: DeleteUserPoolDomainInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUserPoolDomainOutputResponse, DeleteUserPoolDomainOutputError>) -> Void)
```

### `describeIdentityProvider(input:completion:)`

Gets information about a specific identity provider.

``` swift
public func describeIdentityProvider(input: DescribeIdentityProviderInput, completion: @escaping (ClientRuntime.SdkResult<DescribeIdentityProviderOutputResponse, DescribeIdentityProviderOutputError>) -> Void)
```

### `describeResourceServer(input:completion:)`

Describes a resource server.

``` swift
public func describeResourceServer(input: DescribeResourceServerInput, completion: @escaping (ClientRuntime.SdkResult<DescribeResourceServerOutputResponse, DescribeResourceServerOutputError>) -> Void)
```

### `describeRiskConfiguration(input:completion:)`

Describes the risk configuration.

``` swift
public func describeRiskConfiguration(input: DescribeRiskConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeRiskConfigurationOutputResponse, DescribeRiskConfigurationOutputError>) -> Void)
```

### `describeUserImportJob(input:completion:)`

Describes the user import job.

``` swift
public func describeUserImportJob(input: DescribeUserImportJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeUserImportJobOutputResponse, DescribeUserImportJobOutputError>) -> Void)
```

### `describeUserPool(input:completion:)`

Returns the configuration information and metadata of the specified user pool.

``` swift
public func describeUserPool(input: DescribeUserPoolInput, completion: @escaping (ClientRuntime.SdkResult<DescribeUserPoolOutputResponse, DescribeUserPoolOutputError>) -> Void)
```

### `describeUserPoolClient(input:completion:)`

Client method for returning the configuration information and metadata of the specified user pool app client.

``` swift
public func describeUserPoolClient(input: DescribeUserPoolClientInput, completion: @escaping (ClientRuntime.SdkResult<DescribeUserPoolClientOutputResponse, DescribeUserPoolClientOutputError>) -> Void)
```

### `describeUserPoolDomain(input:completion:)`

Gets information about a domain.

``` swift
public func describeUserPoolDomain(input: DescribeUserPoolDomainInput, completion: @escaping (ClientRuntime.SdkResult<DescribeUserPoolDomainOutputResponse, DescribeUserPoolDomainOutputError>) -> Void)
```

### `forgetDevice(input:completion:)`

Forgets the specified device.

``` swift
public func forgetDevice(input: ForgetDeviceInput, completion: @escaping (ClientRuntime.SdkResult<ForgetDeviceOutputResponse, ForgetDeviceOutputError>) -> Void)
```

### `forgotPassword(input:completion:)`

Calling this API causes a message to be sent to the end user with a confirmation code that is required to change the user's password. For the Username parameter, you can use the username or user alias. The method used to send the confirmation code is sent according to the specified AccountRecoverySetting. For more information, see [Recovering User Accounts](https://docs.aws.amazon.com/cognito/latest/developerguide/how-to-recover-a-user-account.html) in the Amazon Cognito Developer Guide. If neither a verified phone number nor a verified email exists, an InvalidParameterException is thrown. To use the confirmation code for resetting the password, call [ConfirmForgotPassword](https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_ConfirmForgotPassword.html). This action might generate an SMS text message. Starting June 1, 2021, U.S. telecom carriers require that you register an origination phone number before you can send SMS messages to U.S. phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with [Amazon Pinpoint](https://console.aws.amazon.com/pinpoint/home/). Cognito will use the the registered number automatically. Otherwise, Cognito users that must receive SMS messages might be unable to sign up, activate their accounts, or sign in. If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon SNS might place your account in SMS sandbox. In [sandbox mode](https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html) , you’ll have limitations, such as sending messages to only verified phone numbers. After testing in the sandbox environment, you can move out of the SMS sandbox and into production. For more information, see [ SMS message settings for Cognito User Pools](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html) in the Amazon Cognito Developer Guide.

``` swift
public func forgotPassword(input: ForgotPasswordInput, completion: @escaping (ClientRuntime.SdkResult<ForgotPasswordOutputResponse, ForgotPasswordOutputError>) -> Void)
```

### `getCSVHeader(input:completion:)`

Gets the header information for the .csv file to be used as input for the user import job.

``` swift
public func getCSVHeader(input: GetCSVHeaderInput, completion: @escaping (ClientRuntime.SdkResult<GetCSVHeaderOutputResponse, GetCSVHeaderOutputError>) -> Void)
```

### `getDevice(input:completion:)`

Gets the device.

``` swift
public func getDevice(input: GetDeviceInput, completion: @escaping (ClientRuntime.SdkResult<GetDeviceOutputResponse, GetDeviceOutputError>) -> Void)
```

### `getGroup(input:completion:)`

Gets a group. Calling this action requires developer credentials.

``` swift
public func getGroup(input: GetGroupInput, completion: @escaping (ClientRuntime.SdkResult<GetGroupOutputResponse, GetGroupOutputError>) -> Void)
```

### `getIdentityProviderByIdentifier(input:completion:)`

Gets the specified identity provider.

``` swift
public func getIdentityProviderByIdentifier(input: GetIdentityProviderByIdentifierInput, completion: @escaping (ClientRuntime.SdkResult<GetIdentityProviderByIdentifierOutputResponse, GetIdentityProviderByIdentifierOutputError>) -> Void)
```

### `getSigningCertificate(input:completion:)`

This method takes a user pool ID, and returns the signing certificate.

``` swift
public func getSigningCertificate(input: GetSigningCertificateInput, completion: @escaping (ClientRuntime.SdkResult<GetSigningCertificateOutputResponse, GetSigningCertificateOutputError>) -> Void)
```

### `getUICustomization(input:completion:)`

Gets the UI Customization information for a particular app client's app UI, if there is something set. If nothing is set for the particular client, but there is an existing pool level customization (app clientId will be ALL), then that is returned. If nothing is present, then an empty shape is returned.

``` swift
public func getUICustomization(input: GetUICustomizationInput, completion: @escaping (ClientRuntime.SdkResult<GetUICustomizationOutputResponse, GetUICustomizationOutputError>) -> Void)
```

### `getUser(input:completion:)`

Gets the user attributes and metadata for a user.

``` swift
public func getUser(input: GetUserInput, completion: @escaping (ClientRuntime.SdkResult<GetUserOutputResponse, GetUserOutputError>) -> Void)
```

### `getUserAttributeVerificationCode(input:completion:)`

Gets the user attribute verification code for the specified attribute name. This action might generate an SMS text message. Starting June 1, 2021, U.S. telecom carriers require that you register an origination phone number before you can send SMS messages to U.S. phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with [Amazon Pinpoint](https://console.aws.amazon.com/pinpoint/home/). Cognito will use the the registered number automatically. Otherwise, Cognito users that must receive SMS messages might be unable to sign up, activate their accounts, or sign in. If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon SNS might place your account in SMS sandbox. In [sandbox mode](https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html) , you’ll have limitations, such as sending messages to only verified phone numbers. After testing in the sandbox environment, you can move out of the SMS sandbox and into production. For more information, see [ SMS message settings for Cognito User Pools](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html) in the Amazon Cognito Developer Guide.

``` swift
public func getUserAttributeVerificationCode(input: GetUserAttributeVerificationCodeInput, completion: @escaping (ClientRuntime.SdkResult<GetUserAttributeVerificationCodeOutputResponse, GetUserAttributeVerificationCodeOutputError>) -> Void)
```

### `getUserPoolMfaConfig(input:completion:)`

Gets the user pool multi-factor authentication (MFA) configuration.

``` swift
public func getUserPoolMfaConfig(input: GetUserPoolMfaConfigInput, completion: @escaping (ClientRuntime.SdkResult<GetUserPoolMfaConfigOutputResponse, GetUserPoolMfaConfigOutputError>) -> Void)
```

### `globalSignOut(input:completion:)`

Signs out users from all devices. It also invalidates all refresh tokens issued to a user. The user's current access and Id tokens remain valid until their expiry. Access and Id tokens expire one hour after they are issued.

``` swift
public func globalSignOut(input: GlobalSignOutInput, completion: @escaping (ClientRuntime.SdkResult<GlobalSignOutOutputResponse, GlobalSignOutOutputError>) -> Void)
```

### `initiateAuth(input:completion:)`

Initiates the authentication flow. This action might generate an SMS text message. Starting June 1, 2021, U.S. telecom carriers require that you register an origination phone number before you can send SMS messages to U.S. phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with [Amazon Pinpoint](https://console.aws.amazon.com/pinpoint/home/). Cognito will use the the registered number automatically. Otherwise, Cognito users that must receive SMS messages might be unable to sign up, activate their accounts, or sign in. If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon SNS might place your account in SMS sandbox. In [sandbox mode](https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html) , you’ll have limitations, such as sending messages to only verified phone numbers. After testing in the sandbox environment, you can move out of the SMS sandbox and into production. For more information, see [ SMS message settings for Cognito User Pools](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html) in the Amazon Cognito Developer Guide.

``` swift
public func initiateAuth(input: InitiateAuthInput, completion: @escaping (ClientRuntime.SdkResult<InitiateAuthOutputResponse, InitiateAuthOutputError>) -> Void)
```

### `listDevices(input:completion:)`

Lists the devices.

``` swift
public func listDevices(input: ListDevicesInput, completion: @escaping (ClientRuntime.SdkResult<ListDevicesOutputResponse, ListDevicesOutputError>) -> Void)
```

### `listGroups(input:completion:)`

Lists the groups associated with a user pool. Calling this action requires developer credentials.

``` swift
public func listGroups(input: ListGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListGroupsOutputResponse, ListGroupsOutputError>) -> Void)
```

### `listIdentityProviders(input:completion:)`

Lists information about all identity providers for a user pool.

``` swift
public func listIdentityProviders(input: ListIdentityProvidersInput, completion: @escaping (ClientRuntime.SdkResult<ListIdentityProvidersOutputResponse, ListIdentityProvidersOutputError>) -> Void)
```

### `listResourceServers(input:completion:)`

Lists the resource servers for a user pool.

``` swift
public func listResourceServers(input: ListResourceServersInput, completion: @escaping (ClientRuntime.SdkResult<ListResourceServersOutputResponse, ListResourceServersOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Lists the tags that are assigned to an Amazon Cognito user pool. A tag is a label that you can apply to user pools to categorize and manage them in different ways, such as by purpose, owner, environment, or other criteria. You can use this action up to 10 times per second, per account.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `listUserImportJobs(input:completion:)`

Lists the user import jobs.

``` swift
public func listUserImportJobs(input: ListUserImportJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListUserImportJobsOutputResponse, ListUserImportJobsOutputError>) -> Void)
```

### `listUserPoolClients(input:completion:)`

Lists the clients that have been created for the specified user pool.

``` swift
public func listUserPoolClients(input: ListUserPoolClientsInput, completion: @escaping (ClientRuntime.SdkResult<ListUserPoolClientsOutputResponse, ListUserPoolClientsOutputError>) -> Void)
```

### `listUserPools(input:completion:)`

Lists the user pools associated with an account.

``` swift
public func listUserPools(input: ListUserPoolsInput, completion: @escaping (ClientRuntime.SdkResult<ListUserPoolsOutputResponse, ListUserPoolsOutputError>) -> Void)
```

### `listUsers(input:completion:)`

Lists the users in the Amazon Cognito user pool.

``` swift
public func listUsers(input: ListUsersInput, completion: @escaping (ClientRuntime.SdkResult<ListUsersOutputResponse, ListUsersOutputError>) -> Void)
```

### `listUsersInGroup(input:completion:)`

Lists the users in the specified group. Calling this action requires developer credentials.

``` swift
public func listUsersInGroup(input: ListUsersInGroupInput, completion: @escaping (ClientRuntime.SdkResult<ListUsersInGroupOutputResponse, ListUsersInGroupOutputError>) -> Void)
```

### `resendConfirmationCode(input:completion:)`

Resends the confirmation (for confirmation of registration) to a specific user in the user pool. This action might generate an SMS text message. Starting June 1, 2021, U.S. telecom carriers require that you register an origination phone number before you can send SMS messages to U.S. phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with [Amazon Pinpoint](https://console.aws.amazon.com/pinpoint/home/). Cognito will use the the registered number automatically. Otherwise, Cognito users that must receive SMS messages might be unable to sign up, activate their accounts, or sign in. If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon SNS might place your account in SMS sandbox. In [sandbox mode](https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html) , you’ll have limitations, such as sending messages to only verified phone numbers. After testing in the sandbox environment, you can move out of the SMS sandbox and into production. For more information, see [ SMS message settings for Cognito User Pools](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html) in the Amazon Cognito Developer Guide.

``` swift
public func resendConfirmationCode(input: ResendConfirmationCodeInput, completion: @escaping (ClientRuntime.SdkResult<ResendConfirmationCodeOutputResponse, ResendConfirmationCodeOutputError>) -> Void)
```

### `respondToAuthChallenge(input:completion:)`

Responds to the authentication challenge. This action might generate an SMS text message. Starting June 1, 2021, U.S. telecom carriers require that you register an origination phone number before you can send SMS messages to U.S. phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with [Amazon Pinpoint](https://console.aws.amazon.com/pinpoint/home/). Cognito will use the the registered number automatically. Otherwise, Cognito users that must receive SMS messages might be unable to sign up, activate their accounts, or sign in. If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon SNS might place your account in SMS sandbox. In [sandbox mode](https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html) , you’ll have limitations, such as sending messages to only verified phone numbers. After testing in the sandbox environment, you can move out of the SMS sandbox and into production. For more information, see [ SMS message settings for Cognito User Pools](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html) in the Amazon Cognito Developer Guide.

``` swift
public func respondToAuthChallenge(input: RespondToAuthChallengeInput, completion: @escaping (ClientRuntime.SdkResult<RespondToAuthChallengeOutputResponse, RespondToAuthChallengeOutputError>) -> Void)
```

### `revokeToken(input:completion:)`

Revokes all of the access tokens generated by the specified refresh token. After the token is revoked, you can not use the revoked token to access Cognito authenticated APIs.

``` swift
public func revokeToken(input: RevokeTokenInput, completion: @escaping (ClientRuntime.SdkResult<RevokeTokenOutputResponse, RevokeTokenOutputError>) -> Void)
```

### `setRiskConfiguration(input:completion:)`

Configures actions on detected risks. To delete the risk configuration for UserPoolId or ClientId, pass null values for all four configuration types. To enable Amazon Cognito advanced security features, update the user pool to include the UserPoolAddOns keyAdvancedSecurityMode.

``` swift
public func setRiskConfiguration(input: SetRiskConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<SetRiskConfigurationOutputResponse, SetRiskConfigurationOutputError>) -> Void)
```

### `setUICustomization(input:completion:)`

Sets the UI customization information for a user pool's built-in app UI. You can specify app UI customization settings for a single client (with a specific clientId) or for all clients (by setting the clientId to ALL). If you specify ALL, the default configuration will be used for every client that has no UI customization set previously. If you specify UI customization settings for a particular client, it will no longer fall back to the ALL configuration. To use this API, your user pool must have a domain associated with it. Otherwise, there is no place to host the app's pages, and the service will throw an error.

``` swift
public func setUICustomization(input: SetUICustomizationInput, completion: @escaping (ClientRuntime.SdkResult<SetUICustomizationOutputResponse, SetUICustomizationOutputError>) -> Void)
```

### `setUserMFAPreference(input:completion:)`

Set the user's multi-factor authentication (MFA) method preference, including which MFA factors are enabled and if any are preferred. Only one factor can be set as preferred. The preferred MFA factor will be used to authenticate a user if multiple factors are enabled. If multiple options are enabled and no preference is set, a challenge to choose an MFA option will be returned during sign in. If an MFA type is enabled for a user, the user will be prompted for MFA during all sign in attempts, unless device tracking is turned on and the device has been trusted. If you would like MFA to be applied selectively based on the assessed risk level of sign in attempts, disable MFA for users and turn on Adaptive Authentication for the user pool.

``` swift
public func setUserMFAPreference(input: SetUserMFAPreferenceInput, completion: @escaping (ClientRuntime.SdkResult<SetUserMFAPreferenceOutputResponse, SetUserMFAPreferenceOutputError>) -> Void)
```

### `setUserPoolMfaConfig(input:completion:)`

Set the user pool multi-factor authentication (MFA) configuration. This action might generate an SMS text message. Starting June 1, 2021, U.S. telecom carriers require that you register an origination phone number before you can send SMS messages to U.S. phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with [Amazon Pinpoint](https://console.aws.amazon.com/pinpoint/home/). Cognito will use the the registered number automatically. Otherwise, Cognito users that must receive SMS messages might be unable to sign up, activate their accounts, or sign in. If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon SNS might place your account in SMS sandbox. In [sandbox mode](https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html) , you’ll have limitations, such as sending messages to only verified phone numbers. After testing in the sandbox environment, you can move out of the SMS sandbox and into production. For more information, see [ SMS message settings for Cognito User Pools](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html) in the Amazon Cognito Developer Guide.

``` swift
public func setUserPoolMfaConfig(input: SetUserPoolMfaConfigInput, completion: @escaping (ClientRuntime.SdkResult<SetUserPoolMfaConfigOutputResponse, SetUserPoolMfaConfigOutputError>) -> Void)
```

### `setUserSettings(input:completion:)`

This action is no longer supported. You can use it to configure only SMS MFA. You can't use it to configure TOTP software token MFA. To configure either type of MFA, use [SetUserMFAPreference](https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_SetUserMFAPreference.html) instead.

``` swift
public func setUserSettings(input: SetUserSettingsInput, completion: @escaping (ClientRuntime.SdkResult<SetUserSettingsOutputResponse, SetUserSettingsOutputError>) -> Void)
```

### `signUp(input:completion:)`

Registers the user in the specified user pool and creates a user name, password, and user attributes. This action might generate an SMS text message. Starting June 1, 2021, U.S. telecom carriers require that you register an origination phone number before you can send SMS messages to U.S. phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with [Amazon Pinpoint](https://console.aws.amazon.com/pinpoint/home/). Cognito will use the the registered number automatically. Otherwise, Cognito users that must receive SMS messages might be unable to sign up, activate their accounts, or sign in. If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon SNS might place your account in SMS sandbox. In [sandbox mode](https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html) , you’ll have limitations, such as sending messages to only verified phone numbers. After testing in the sandbox environment, you can move out of the SMS sandbox and into production. For more information, see [ SMS message settings for Cognito User Pools](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html) in the Amazon Cognito Developer Guide.

``` swift
public func signUp(input: SignUpInput, completion: @escaping (ClientRuntime.SdkResult<SignUpOutputResponse, SignUpOutputError>) -> Void)
```

### `startUserImportJob(input:completion:)`

Starts the user import.

``` swift
public func startUserImportJob(input: StartUserImportJobInput, completion: @escaping (ClientRuntime.SdkResult<StartUserImportJobOutputResponse, StartUserImportJobOutputError>) -> Void)
```

### `stopUserImportJob(input:completion:)`

Stops the user import job.

``` swift
public func stopUserImportJob(input: StopUserImportJobInput, completion: @escaping (ClientRuntime.SdkResult<StopUserImportJobOutputResponse, StopUserImportJobOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Assigns a set of tags to an Amazon Cognito user pool. A tag is a label that you can use to categorize and manage user pools in different ways, such as by purpose, owner, environment, or other criteria. Each tag consists of a key and value, both of which you define. A key is a general category for more specific values. For example, if you have two versions of a user pool, one for testing and another for production, you might assign an Environment tag key to both user pools. The value of this key might be Test for one user pool and Production for the other. Tags are useful for cost tracking and access control. You can activate your tags so that they appear on the Billing and Cost Management console, where you can track the costs associated with your user pools. In an IAM policy, you can constrain permissions for user pools based on specific tags or tag values. You can use this action up to 5 times per second, per account. A user pool can have as many as 50 tags.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes the specified tags from an Amazon Cognito user pool. You can use this action up to 5 times per second, per account

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateAuthEventFeedback(input:completion:)`

Provides the feedback for an authentication event whether it was from a valid user or not. This feedback is used for improving the risk evaluation decision for the user pool as part of Amazon Cognito advanced security.

``` swift
public func updateAuthEventFeedback(input: UpdateAuthEventFeedbackInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAuthEventFeedbackOutputResponse, UpdateAuthEventFeedbackOutputError>) -> Void)
```

### `updateDeviceStatus(input:completion:)`

Updates the device status.

``` swift
public func updateDeviceStatus(input: UpdateDeviceStatusInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDeviceStatusOutputResponse, UpdateDeviceStatusOutputError>) -> Void)
```

### `updateGroup(input:completion:)`

Updates the specified group with the specified attributes. Calling this action requires developer credentials.

``` swift
public func updateGroup(input: UpdateGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateGroupOutputResponse, UpdateGroupOutputError>) -> Void)
```

### `updateIdentityProvider(input:completion:)`

Updates identity provider information for a user pool.

``` swift
public func updateIdentityProvider(input: UpdateIdentityProviderInput, completion: @escaping (ClientRuntime.SdkResult<UpdateIdentityProviderOutputResponse, UpdateIdentityProviderOutputError>) -> Void)
```

### `updateResourceServer(input:completion:)`

Updates the name and scopes of resource server. All other fields are read-only. If you don't provide a value for an attribute, it will be set to the default value.

``` swift
public func updateResourceServer(input: UpdateResourceServerInput, completion: @escaping (ClientRuntime.SdkResult<UpdateResourceServerOutputResponse, UpdateResourceServerOutputError>) -> Void)
```

### `updateUserAttributes(input:completion:)`

Allows a user to update a specific attribute (one at a time). This action might generate an SMS text message. Starting June 1, 2021, U.S. telecom carriers require that you register an origination phone number before you can send SMS messages to U.S. phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with [Amazon Pinpoint](https://console.aws.amazon.com/pinpoint/home/). Cognito will use the the registered number automatically. Otherwise, Cognito users that must receive SMS messages might be unable to sign up, activate their accounts, or sign in. If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon SNS might place your account in SMS sandbox. In [sandbox mode](https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html) , you’ll have limitations, such as sending messages to only verified phone numbers. After testing in the sandbox environment, you can move out of the SMS sandbox and into production. For more information, see [ SMS message settings for Cognito User Pools](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html) in the Amazon Cognito Developer Guide.

``` swift
public func updateUserAttributes(input: UpdateUserAttributesInput, completion: @escaping (ClientRuntime.SdkResult<UpdateUserAttributesOutputResponse, UpdateUserAttributesOutputError>) -> Void)
```

### `updateUserPool(input:completion:)`

Updates the specified user pool with the specified attributes. You can get a list of the current user pool settings using [DescribeUserPool](https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_DescribeUserPool.html). If you don't provide a value for an attribute, it will be set to the default value. This action might generate an SMS text message. Starting June 1, 2021, U.S. telecom carriers require that you register an origination phone number before you can send SMS messages to U.S. phone numbers. If you use SMS text messages in Amazon Cognito, you must register a phone number with [Amazon Pinpoint](https://console.aws.amazon.com/pinpoint/home/). Cognito will use the the registered number automatically. Otherwise, Cognito users that must receive SMS messages might be unable to sign up, activate their accounts, or sign in. If you have never used SMS text messages with Amazon Cognito or any other Amazon Web Service, Amazon SNS might place your account in SMS sandbox. In [sandbox mode](https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html) , you’ll have limitations, such as sending messages to only verified phone numbers. After testing in the sandbox environment, you can move out of the SMS sandbox and into production. For more information, see [ SMS message settings for Cognito User Pools](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-sms-userpool-settings.html) in the Amazon Cognito Developer Guide.

``` swift
public func updateUserPool(input: UpdateUserPoolInput, completion: @escaping (ClientRuntime.SdkResult<UpdateUserPoolOutputResponse, UpdateUserPoolOutputError>) -> Void)
```

### `updateUserPoolClient(input:completion:)`

Updates the specified user pool app client with the specified attributes. You can get a list of the current user pool app client settings using [DescribeUserPoolClient](https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_DescribeUserPoolClient.html). If you don't provide a value for an attribute, it will be set to the default value. You can also use this operation to enable token revocation for user pool clients. For more information about revoking tokens, see [RevokeToken](https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_RevokeToken.html).

``` swift
public func updateUserPoolClient(input: UpdateUserPoolClientInput, completion: @escaping (ClientRuntime.SdkResult<UpdateUserPoolClientOutputResponse, UpdateUserPoolClientOutputError>) -> Void)
```

### `updateUserPoolDomain(input:completion:)`

Updates the Secure Sockets Layer (SSL) certificate for the custom domain for your user pool. You can use this operation to provide the Amazon Resource Name (ARN) of a new certificate to Amazon Cognito. You cannot use it to change the domain for a user pool. A custom domain is used to host the Amazon Cognito hosted UI, which provides sign-up and sign-in pages for your application. When you set up a custom domain, you provide a certificate that you manage with Certificate Manager (ACM). When necessary, you can use this operation to change the certificate that you applied to your custom domain. Usually, this is unnecessary following routine certificate renewal with ACM. When you renew your existing certificate in ACM, the ARN for your certificate remains the same, and your custom domain uses the new certificate automatically. However, if you replace your existing certificate with a new one, ACM gives the new certificate a new ARN. To apply the new certificate to your custom domain, you must provide this ARN to Amazon Cognito. When you add your new certificate in ACM, you must choose US East (N. Virginia) as the Region. After you submit your request, Amazon Cognito requires up to 1 hour to distribute your new certificate to your custom domain. For more information about adding a custom domain to your user pool, see [Using Your Own Domain for the Hosted UI](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-add-custom-domain.html).

``` swift
public func updateUserPoolDomain(input: UpdateUserPoolDomainInput, completion: @escaping (ClientRuntime.SdkResult<UpdateUserPoolDomainOutputResponse, UpdateUserPoolDomainOutputError>) -> Void)
```

### `verifySoftwareToken(input:completion:)`

Use this API to register a user's entered TOTP code and mark the user's software token MFA status as "verified" if successful. The request takes an access token or a session string, but not both.

``` swift
public func verifySoftwareToken(input: VerifySoftwareTokenInput, completion: @escaping (ClientRuntime.SdkResult<VerifySoftwareTokenOutputResponse, VerifySoftwareTokenOutputError>) -> Void)
```

### `verifyUserAttribute(input:completion:)`

Verifies the specified user attributes in the user pool.

``` swift
public func verifyUserAttribute(input: VerifyUserAttributeInput, completion: @escaping (ClientRuntime.SdkResult<VerifyUserAttributeOutputResponse, VerifyUserAttributeOutputError>) -> Void)
```
