# ChimeClientProtocol

The Amazon Chime API (application programming interface) is designed for developers to perform key tasks, such as creating and managing Amazon Chime accounts, users, and Voice Connectors. This guide provides detailed information about the Amazon Chime API, including operations, types, inputs and outputs, and error codes. It also includes some server-side API actions to use with the Amazon Chime SDK. For more information about the Amazon Chime SDK, see [ Using the Amazon Chime SDK ](https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html) in the Amazon Chime Developer Guide. You can use an AWS SDK, the AWS Command Line Interface (AWS CLI), or the REST API to make API calls. We recommend using an AWS SDK or the AWS CLI. Each API operation includes links to information about using it with a language-specific AWS SDK or the AWS CLI. Using an AWS SDK You don't need to write code to calculate a signature for request authentication. The SDK clients authenticate your requests by using access keys that you provide. For more information about AWS SDKs, see the [AWS Developer Center](http://aws.amazon.com/developer/). Using the AWS CLI Use your access keys with the AWS CLI to make API calls. For information about setting up the AWS CLI, see [Installing the AWS Command Line Interface](https://docs.aws.amazon.com/cli/latest/userguide/installing.html) in the AWS Command Line Interface User Guide. For a list of available Amazon Chime commands, see the [Amazon Chime commands](https://docs.aws.amazon.com/cli/latest/reference/chime/index.html) in the AWS CLI Command Reference. Using REST APIs If you use REST to make API calls, you must authenticate your request by providing a signature. Amazon Chime supports signature version 4. For more information, see [Signature Version 4 Signing Process](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html) in the Amazon Web Services General Reference. When making REST API calls, use the service name chime and REST endpoint https://service.chime.aws.amazon.com. Administrative permissions are controlled using AWS Identity and Access Management (IAM). For more information, see [Identity and Access Management for Amazon Chime](https://docs.aws.amazon.com/chime/latest/ag/security-iam.html) in the Amazon Chime Administration Guide.

``` swift
public protocol ChimeClientProtocol 
```

## Requirements

### associatePhoneNumbersWithVoiceConnector(input:completion:)

Associates phone numbers with the specified Amazon Chime Voice Connector.

``` swift
func associatePhoneNumbersWithVoiceConnector(input: AssociatePhoneNumbersWithVoiceConnectorInput, completion: @escaping (ClientRuntime.SdkResult<AssociatePhoneNumbersWithVoiceConnectorOutputResponse, AssociatePhoneNumbersWithVoiceConnectorOutputError>) -> Void)
```

### associatePhoneNumbersWithVoiceConnectorGroup(input:completion:)

Associates phone numbers with the specified Amazon Chime Voice Connector group.

``` swift
func associatePhoneNumbersWithVoiceConnectorGroup(input: AssociatePhoneNumbersWithVoiceConnectorGroupInput, completion: @escaping (ClientRuntime.SdkResult<AssociatePhoneNumbersWithVoiceConnectorGroupOutputResponse, AssociatePhoneNumbersWithVoiceConnectorGroupOutputError>) -> Void)
```

### associatePhoneNumberWithUser(input:completion:)

Associates a phone number with the specified Amazon Chime user.

``` swift
func associatePhoneNumberWithUser(input: AssociatePhoneNumberWithUserInput, completion: @escaping (ClientRuntime.SdkResult<AssociatePhoneNumberWithUserOutputResponse, AssociatePhoneNumberWithUserOutputError>) -> Void)
```

### associateSigninDelegateGroupsWithAccount(input:completion:)

Associates the specified sign-in delegate groups with the specified Amazon Chime account.

``` swift
func associateSigninDelegateGroupsWithAccount(input: AssociateSigninDelegateGroupsWithAccountInput, completion: @escaping (ClientRuntime.SdkResult<AssociateSigninDelegateGroupsWithAccountOutputResponse, AssociateSigninDelegateGroupsWithAccountOutputError>) -> Void)
```

### batchCreateAttendee(input:completion:)

Creates up to 100 new attendees for an active Amazon Chime SDK meeting. For more information about the Amazon Chime SDK, see [Using the Amazon Chime SDK](https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html) in the Amazon Chime Developer Guide.

``` swift
func batchCreateAttendee(input: BatchCreateAttendeeInput, completion: @escaping (ClientRuntime.SdkResult<BatchCreateAttendeeOutputResponse, BatchCreateAttendeeOutputError>) -> Void)
```

### batchCreateChannelMembership(input:completion:)

Adds a specified number of users to a channel.

``` swift
func batchCreateChannelMembership(input: BatchCreateChannelMembershipInput, completion: @escaping (ClientRuntime.SdkResult<BatchCreateChannelMembershipOutputResponse, BatchCreateChannelMembershipOutputError>) -> Void)
```

### batchCreateRoomMembership(input:completion:)

Adds up to 50 members to a chat room in an Amazon Chime Enterprise account. Members can be users or bots. The member role designates whether the member is a chat room administrator or a general chat room member.

``` swift
func batchCreateRoomMembership(input: BatchCreateRoomMembershipInput, completion: @escaping (ClientRuntime.SdkResult<BatchCreateRoomMembershipOutputResponse, BatchCreateRoomMembershipOutputError>) -> Void)
```

### batchDeletePhoneNumber(input:completion:)

Moves phone numbers into the Deletion queue. Phone numbers must be disassociated from any users or Amazon Chime Voice Connectors before they can be deleted. Phone numbers remain in the Deletion queue for 7 days before they are deleted permanently.

``` swift
func batchDeletePhoneNumber(input: BatchDeletePhoneNumberInput, completion: @escaping (ClientRuntime.SdkResult<BatchDeletePhoneNumberOutputResponse, BatchDeletePhoneNumberOutputError>) -> Void)
```

### batchSuspendUser(input:completion:)

Suspends up to 50 users from a Team or EnterpriseLWA Amazon Chime account. For more information about different account types, see [Managing Your Amazon Chime Accounts](https://docs.aws.amazon.com/chime/latest/ag/manage-chime-account.html) in the Amazon Chime Administration Guide. Users suspended from a Team account are disassociated from the account,but they can continue to use Amazon Chime as free users. To remove the suspension from suspended Team account users, invite them to the Team account again. You can use the \[InviteUsers\] action to do so. Users suspended from an EnterpriseLWA account are immediately signed out of Amazon Chime and can no longer sign in. To remove the suspension from suspended EnterpriseLWA account users, use the \[BatchUnsuspendUser\] action. To sign out users without suspending them, use the \[LogoutUser\] action.

``` swift
func batchSuspendUser(input: BatchSuspendUserInput, completion: @escaping (ClientRuntime.SdkResult<BatchSuspendUserOutputResponse, BatchSuspendUserOutputError>) -> Void)
```

### batchUnsuspendUser(input:completion:)

Removes the suspension from up to 50 previously suspended users for the specified Amazon Chime EnterpriseLWA account. Only users on EnterpriseLWA accounts can be unsuspended using this action. For more information about different account types, see [ Managing Your Amazon Chime Accounts ](https://docs.aws.amazon.com/chime/latest/ag/manage-chime-account.html) in the account types, in the Amazon Chime Administration Guide. Previously suspended users who are unsuspended using this action are returned to Registered status. Users who are not previously suspended are ignored.

``` swift
func batchUnsuspendUser(input: BatchUnsuspendUserInput, completion: @escaping (ClientRuntime.SdkResult<BatchUnsuspendUserOutputResponse, BatchUnsuspendUserOutputError>) -> Void)
```

### batchUpdatePhoneNumber(input:completion:)

Updates phone number product types or calling names. You can update one attribute at a time for each UpdatePhoneNumberRequestItem. For example, you can update the product type or the calling name. For toll-free numbers, you cannot use the Amazon Chime Business Calling product type. For numbers outside the U.S., you must use the Amazon Chime SIP Media Application Dial-In product type. Updates to outbound calling names can take up to 72 hours to complete. Pending updates to outbound calling names must be complete before you can request another update.

``` swift
func batchUpdatePhoneNumber(input: BatchUpdatePhoneNumberInput, completion: @escaping (ClientRuntime.SdkResult<BatchUpdatePhoneNumberOutputResponse, BatchUpdatePhoneNumberOutputError>) -> Void)
```

### batchUpdateUser(input:completion:)

Updates user details within the \[UpdateUserRequestItem\] object for up to 20 users for the specified Amazon Chime account. Currently, only LicenseType updates are supported for this action.

``` swift
func batchUpdateUser(input: BatchUpdateUserInput, completion: @escaping (ClientRuntime.SdkResult<BatchUpdateUserOutputResponse, BatchUpdateUserOutputError>) -> Void)
```

### createAccount(input:completion:)

Creates an Amazon Chime account under the administrator's AWS account. Only Team account types are currently supported for this action. For more information about different account types, see [Managing Your Amazon Chime Accounts](https://docs.aws.amazon.com/chime/latest/ag/manage-chime-account.html) in the Amazon Chime Administration Guide.

``` swift
func createAccount(input: CreateAccountInput, completion: @escaping (ClientRuntime.SdkResult<CreateAccountOutputResponse, CreateAccountOutputError>) -> Void)
```

### createAppInstance(input:completion:)

Creates an Amazon Chime SDK messaging AppInstance under an AWS account. Only SDK messaging customers use this API. CreateAppInstance supports idempotency behavior as described in the AWS API Standard.

``` swift
func createAppInstance(input: CreateAppInstanceInput, completion: @escaping (ClientRuntime.SdkResult<CreateAppInstanceOutputResponse, CreateAppInstanceOutputError>) -> Void)
```

### createAppInstanceAdmin(input:completion:)

Promotes an AppInstanceUser to an AppInstanceAdmin. The promoted user can perform the following actions.

``` swift
func createAppInstanceAdmin(input: CreateAppInstanceAdminInput, completion: @escaping (ClientRuntime.SdkResult<CreateAppInstanceAdminOutputResponse, CreateAppInstanceAdminOutputError>) -> Void)
```

  - ChannelModerator actions across all channels in the AppInstance.

  - DeleteChannelMessage actions.

Only an AppInstanceUser can be promoted to an AppInstanceAdmin role.

### createAppInstanceUser(input:completion:)

Creates a user under an Amazon Chime AppInstance. The request consists of a unique appInstanceUserId and Name for that user.

``` swift
func createAppInstanceUser(input: CreateAppInstanceUserInput, completion: @escaping (ClientRuntime.SdkResult<CreateAppInstanceUserOutputResponse, CreateAppInstanceUserOutputError>) -> Void)
```

### createAttendee(input:completion:)

Creates a new attendee for an active Amazon Chime SDK meeting. For more information about the Amazon Chime SDK, see [Using the Amazon Chime SDK](https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html) in the Amazon Chime Developer Guide.

``` swift
func createAttendee(input: CreateAttendeeInput, completion: @escaping (ClientRuntime.SdkResult<CreateAttendeeOutputResponse, CreateAttendeeOutputError>) -> Void)
```

### createBot(input:completion:)

Creates a bot for an Amazon Chime Enterprise account.

``` swift
func createBot(input: CreateBotInput, completion: @escaping (ClientRuntime.SdkResult<CreateBotOutputResponse, CreateBotOutputError>) -> Void)
```

### createChannel(input:completion:)

Creates a channel to which you can add users and send messages. Restriction: You can't change a channel's privacy. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
func createChannel(input: CreateChannelInput, completion: @escaping (ClientRuntime.SdkResult<CreateChannelOutputResponse, CreateChannelOutputError>) -> Void)
```

### createChannelBan(input:completion:)

Permanently bans a member from a channel. Moderators can't add banned members to a channel. To undo a ban, you first have to DeleteChannelBan, and then CreateChannelMembership. Bans are cleaned up when you delete users or channels. If you ban a user who is already part of a channel, that user is automatically kicked from the channel. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
func createChannelBan(input: CreateChannelBanInput, completion: @escaping (ClientRuntime.SdkResult<CreateChannelBanOutputResponse, CreateChannelBanOutputError>) -> Void)
```

### createChannelMembership(input:completion:)

Adds a user to a channel. The InvitedBy response field is derived from the request header. A channel member can:

``` swift
func createChannelMembership(input: CreateChannelMembershipInput, completion: @escaping (ClientRuntime.SdkResult<CreateChannelMembershipOutputResponse, CreateChannelMembershipOutputError>) -> Void)
```

  - List messages

  - Send messages

  - Receive messages

  - Edit their own messages

  - Leave the channel

Privacy settings impact this action as follows:

  - Public Channels: You do not need to be a member to list messages, but you must be a member to send messages.

  - Private Channels: You must be a member to list or send messages.

The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

### createChannelModerator(input:completion:)

Creates a new ChannelModerator. A channel moderator can:

``` swift
func createChannelModerator(input: CreateChannelModeratorInput, completion: @escaping (ClientRuntime.SdkResult<CreateChannelModeratorOutputResponse, CreateChannelModeratorOutputError>) -> Void)
```

  - Add and remove other members of the channel.

  - Add and remove other moderators of the channel.

  - Add and remove user bans for the channel.

  - Redact messages in the channel.

  - List messages in the channel.

The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

### createMediaCapturePipeline(input:completion:)

Creates a media capture pipeline.

``` swift
func createMediaCapturePipeline(input: CreateMediaCapturePipelineInput, completion: @escaping (ClientRuntime.SdkResult<CreateMediaCapturePipelineOutputResponse, CreateMediaCapturePipelineOutputError>) -> Void)
```

### createMeeting(input:completion:)

Creates a new Amazon Chime SDK meeting in the specified media Region with no initial attendees. For more information about specifying media Regions, see [Amazon Chime SDK Media Regions](https://docs.aws.amazon.com/chime/latest/dg/chime-sdk-meetings-regions.html) in the Amazon Chime Developer Guide . For more information about the Amazon Chime SDK, see [Using the Amazon Chime SDK](https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html) in the Amazon Chime Developer Guide .

``` swift
func createMeeting(input: CreateMeetingInput, completion: @escaping (ClientRuntime.SdkResult<CreateMeetingOutputResponse, CreateMeetingOutputError>) -> Void)
```

### createMeetingDialOut(input:completion:)

Uses the join token and call metadata in a meeting request (From number, To number, and so forth) to initiate an outbound call to a public switched telephone network (PSTN) and join them into a Chime meeting. Also ensures that the From number belongs to the customer. To play welcome audio or implement an interactive voice response (IVR), use the CreateSipMediaApplicationCall action with the corresponding SIP media application ID.

``` swift
func createMeetingDialOut(input: CreateMeetingDialOutInput, completion: @escaping (ClientRuntime.SdkResult<CreateMeetingDialOutOutputResponse, CreateMeetingDialOutOutputError>) -> Void)
```

### createMeetingWithAttendees(input:completion:)

Creates a new Amazon Chime SDK meeting in the specified media Region, with attendees. For more information about specifying media Regions, see [Amazon Chime SDK Media Regions](https://docs.aws.amazon.com/chime/latest/dg/chime-sdk-meetings-regions.html) in the Amazon Chime Developer Guide . For more information about the Amazon Chime SDK, see [Using the Amazon Chime SDK](https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html) in the Amazon Chime Developer Guide .

``` swift
func createMeetingWithAttendees(input: CreateMeetingWithAttendeesInput, completion: @escaping (ClientRuntime.SdkResult<CreateMeetingWithAttendeesOutputResponse, CreateMeetingWithAttendeesOutputError>) -> Void)
```

### createPhoneNumberOrder(input:completion:)

Creates an order for phone numbers to be provisioned. For toll-free numbers, you cannot use the Amazon Chime Business Calling product type. For numbers outside the U.S., you must use the Amazon Chime SIP Media Application Dial-In product type.

``` swift
func createPhoneNumberOrder(input: CreatePhoneNumberOrderInput, completion: @escaping (ClientRuntime.SdkResult<CreatePhoneNumberOrderOutputResponse, CreatePhoneNumberOrderOutputError>) -> Void)
```

### createProxySession(input:completion:)

Creates a proxy session on the specified Amazon Chime Voice Connector for the specified participant phone numbers.

``` swift
func createProxySession(input: CreateProxySessionInput, completion: @escaping (ClientRuntime.SdkResult<CreateProxySessionOutputResponse, CreateProxySessionOutputError>) -> Void)
```

### createRoom(input:completion:)

Creates a chat room for the specified Amazon Chime Enterprise account.

``` swift
func createRoom(input: CreateRoomInput, completion: @escaping (ClientRuntime.SdkResult<CreateRoomOutputResponse, CreateRoomOutputError>) -> Void)
```

### createRoomMembership(input:completion:)

Adds a member to a chat room in an Amazon Chime Enterprise account. A member can be either a user or a bot. The member role designates whether the member is a chat room administrator or a general chat room member.

``` swift
func createRoomMembership(input: CreateRoomMembershipInput, completion: @escaping (ClientRuntime.SdkResult<CreateRoomMembershipOutputResponse, CreateRoomMembershipOutputError>) -> Void)
```

### createSipMediaApplication(input:completion:)

Creates a SIP media application.

``` swift
func createSipMediaApplication(input: CreateSipMediaApplicationInput, completion: @escaping (ClientRuntime.SdkResult<CreateSipMediaApplicationOutputResponse, CreateSipMediaApplicationOutputError>) -> Void)
```

### createSipMediaApplicationCall(input:completion:)

Creates an outbound call to a phone number from the phone number specified in the request, and it invokes the endpoint of the specified sipMediaApplicationId.

``` swift
func createSipMediaApplicationCall(input: CreateSipMediaApplicationCallInput, completion: @escaping (ClientRuntime.SdkResult<CreateSipMediaApplicationCallOutputResponse, CreateSipMediaApplicationCallOutputError>) -> Void)
```

### createSipRule(input:completion:)

Creates a SIP rule which can be used to run a SIP media application as a target for a specific trigger type.

``` swift
func createSipRule(input: CreateSipRuleInput, completion: @escaping (ClientRuntime.SdkResult<CreateSipRuleOutputResponse, CreateSipRuleOutputError>) -> Void)
```

### createUser(input:completion:)

Creates a user under the specified Amazon Chime account.

``` swift
func createUser(input: CreateUserInput, completion: @escaping (ClientRuntime.SdkResult<CreateUserOutputResponse, CreateUserOutputError>) -> Void)
```

### createVoiceConnector(input:completion:)

Creates an Amazon Chime Voice Connector under the administrator's AWS account. You can choose to create an Amazon Chime Voice Connector in a specific AWS Region. Enabling \[CreateVoiceConnectorRequest$RequireEncryption\] configures your Amazon Chime Voice Connector to use TLS transport for SIP signaling and Secure RTP (SRTP) for media. Inbound calls use TLS transport, and unencrypted outbound calls are blocked.

``` swift
func createVoiceConnector(input: CreateVoiceConnectorInput, completion: @escaping (ClientRuntime.SdkResult<CreateVoiceConnectorOutputResponse, CreateVoiceConnectorOutputError>) -> Void)
```

### createVoiceConnectorGroup(input:completion:)

Creates an Amazon Chime Voice Connector group under the administrator's AWS account. You can associate Amazon Chime Voice Connectors with the Amazon Chime Voice Connector group by including VoiceConnectorItems in the request. You can include Amazon Chime Voice Connectors from different AWS Regions in your group. This creates a fault tolerant mechanism for fallback in case of availability events.

``` swift
func createVoiceConnectorGroup(input: CreateVoiceConnectorGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateVoiceConnectorGroupOutputResponse, CreateVoiceConnectorGroupOutputError>) -> Void)
```

### deleteAccount(input:completion:)

Deletes the specified Amazon Chime account. You must suspend all users before deleting Team account. You can use the \[BatchSuspendUser\] action to dodo. For EnterpriseLWA and EnterpriseAD accounts, you must release the claimed domains for your Amazon Chime account before deletion. As soon as you release the domain, all users under that account are suspended. Deleted accounts appear in your Disabled accounts list for 90 days. To restore deleted account from your Disabled accounts list, you must contact AWS Support. After 90 days, deleted accounts are permanently removed from your Disabled accounts list.

``` swift
func deleteAccount(input: DeleteAccountInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAccountOutputResponse, DeleteAccountOutputError>) -> Void)
```

### deleteAppInstance(input:completion:)

Deletes an AppInstance and all associated data asynchronously.

``` swift
func deleteAppInstance(input: DeleteAppInstanceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAppInstanceOutputResponse, DeleteAppInstanceOutputError>) -> Void)
```

### deleteAppInstanceAdmin(input:completion:)

Demotes an AppInstanceAdmin to an AppInstanceUser. This action does not delete the user.

``` swift
func deleteAppInstanceAdmin(input: DeleteAppInstanceAdminInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAppInstanceAdminOutputResponse, DeleteAppInstanceAdminOutputError>) -> Void)
```

### deleteAppInstanceStreamingConfigurations(input:completion:)

Deletes the streaming configurations of an AppInstance.

``` swift
func deleteAppInstanceStreamingConfigurations(input: DeleteAppInstanceStreamingConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAppInstanceStreamingConfigurationsOutputResponse, DeleteAppInstanceStreamingConfigurationsOutputError>) -> Void)
```

### deleteAppInstanceUser(input:completion:)

Deletes an AppInstanceUser.

``` swift
func deleteAppInstanceUser(input: DeleteAppInstanceUserInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAppInstanceUserOutputResponse, DeleteAppInstanceUserOutputError>) -> Void)
```

### deleteAttendee(input:completion:)

Deletes an attendee from the specified Amazon Chime SDK meeting and deletes their JoinToken. Attendees are automatically deleted when a Amazon Chime SDK meeting is deleted. For more information about the Amazon Chime SDK, see [Using the Amazon Chime SDK](https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html) in the Amazon Chime Developer Guide.

``` swift
func deleteAttendee(input: DeleteAttendeeInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAttendeeOutputResponse, DeleteAttendeeOutputError>) -> Void)
```

### deleteChannel(input:completion:)

Immediately makes a channel and its memberships inaccessible and marks them for deletion. This is an irreversible process. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
func deleteChannel(input: DeleteChannelInput, completion: @escaping (ClientRuntime.SdkResult<DeleteChannelOutputResponse, DeleteChannelOutputError>) -> Void)
```

### deleteChannelBan(input:completion:)

Removes a user from a channel's ban list. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
func deleteChannelBan(input: DeleteChannelBanInput, completion: @escaping (ClientRuntime.SdkResult<DeleteChannelBanOutputResponse, DeleteChannelBanOutputError>) -> Void)
```

### deleteChannelMembership(input:completion:)

Removes a member from a channel. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
func deleteChannelMembership(input: DeleteChannelMembershipInput, completion: @escaping (ClientRuntime.SdkResult<DeleteChannelMembershipOutputResponse, DeleteChannelMembershipOutputError>) -> Void)
```

### deleteChannelMessage(input:completion:)

Deletes a channel message. Only admins can perform this action. Deletion makes messages inaccessible immediately. A background process deletes any revisions created by UpdateChannelMessage. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
func deleteChannelMessage(input: DeleteChannelMessageInput, completion: @escaping (ClientRuntime.SdkResult<DeleteChannelMessageOutputResponse, DeleteChannelMessageOutputError>) -> Void)
```

### deleteChannelModerator(input:completion:)

Deletes a channel moderator. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
func deleteChannelModerator(input: DeleteChannelModeratorInput, completion: @escaping (ClientRuntime.SdkResult<DeleteChannelModeratorOutputResponse, DeleteChannelModeratorOutputError>) -> Void)
```

### deleteEventsConfiguration(input:completion:)

Deletes the events configuration that allows a bot to receive outgoing events.

``` swift
func deleteEventsConfiguration(input: DeleteEventsConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteEventsConfigurationOutputResponse, DeleteEventsConfigurationOutputError>) -> Void)
```

### deleteMediaCapturePipeline(input:completion:)

Deletes the media capture pipeline.

``` swift
func deleteMediaCapturePipeline(input: DeleteMediaCapturePipelineInput, completion: @escaping (ClientRuntime.SdkResult<DeleteMediaCapturePipelineOutputResponse, DeleteMediaCapturePipelineOutputError>) -> Void)
```

### deleteMeeting(input:completion:)

Deletes the specified Amazon Chime SDK meeting. The operation deletes all attendees, disconnects all clients, and prevents new clients from joining the meeting. For more information about the Amazon Chime SDK, see [Using the Amazon Chime SDK](https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html) in the Amazon Chime Developer Guide.

``` swift
func deleteMeeting(input: DeleteMeetingInput, completion: @escaping (ClientRuntime.SdkResult<DeleteMeetingOutputResponse, DeleteMeetingOutputError>) -> Void)
```

### deletePhoneNumber(input:completion:)

Moves the specified phone number into the Deletion queue. A phone number must be disassociated from any users or Amazon Chime Voice Connectors before it can be deleted. Deleted phone numbers remain in the Deletion queue for 7 days before they are deleted permanently.

``` swift
func deletePhoneNumber(input: DeletePhoneNumberInput, completion: @escaping (ClientRuntime.SdkResult<DeletePhoneNumberOutputResponse, DeletePhoneNumberOutputError>) -> Void)
```

### deleteProxySession(input:completion:)

Deletes the specified proxy session from the specified Amazon Chime Voice Connector.

``` swift
func deleteProxySession(input: DeleteProxySessionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteProxySessionOutputResponse, DeleteProxySessionOutputError>) -> Void)
```

### deleteRoom(input:completion:)

Deletes a chat room in an Amazon Chime Enterprise account.

``` swift
func deleteRoom(input: DeleteRoomInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRoomOutputResponse, DeleteRoomOutputError>) -> Void)
```

### deleteRoomMembership(input:completion:)

Removes a member from a chat room in an Amazon Chime Enterprise account.

``` swift
func deleteRoomMembership(input: DeleteRoomMembershipInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRoomMembershipOutputResponse, DeleteRoomMembershipOutputError>) -> Void)
```

### deleteSipMediaApplication(input:completion:)

Deletes a SIP media application.

``` swift
func deleteSipMediaApplication(input: DeleteSipMediaApplicationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSipMediaApplicationOutputResponse, DeleteSipMediaApplicationOutputError>) -> Void)
```

### deleteSipRule(input:completion:)

Deletes a SIP rule. You must disable a SIP rule before you can delete it.

``` swift
func deleteSipRule(input: DeleteSipRuleInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSipRuleOutputResponse, DeleteSipRuleOutputError>) -> Void)
```

### deleteVoiceConnector(input:completion:)

Deletes the specified Amazon Chime Voice Connector. Any phone numbers associated with the Amazon Chime Voice Connector must be disassociated from it before it can be deleted.

``` swift
func deleteVoiceConnector(input: DeleteVoiceConnectorInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVoiceConnectorOutputResponse, DeleteVoiceConnectorOutputError>) -> Void)
```

### deleteVoiceConnectorEmergencyCallingConfiguration(input:completion:)

Deletes the emergency calling configuration details from the specified Amazon Chime Voice Connector.

``` swift
func deleteVoiceConnectorEmergencyCallingConfiguration(input: DeleteVoiceConnectorEmergencyCallingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVoiceConnectorEmergencyCallingConfigurationOutputResponse, DeleteVoiceConnectorEmergencyCallingConfigurationOutputError>) -> Void)
```

### deleteVoiceConnectorGroup(input:completion:)

Deletes the specified Amazon Chime Voice Connector group. Any VoiceConnectorItems and phone numbers associated with the group must be removed before it can be deleted.

``` swift
func deleteVoiceConnectorGroup(input: DeleteVoiceConnectorGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVoiceConnectorGroupOutputResponse, DeleteVoiceConnectorGroupOutputError>) -> Void)
```

### deleteVoiceConnectorOrigination(input:completion:)

Deletes the origination settings for the specified Amazon Chime Voice Connector. If emergency calling is configured for the Amazon Chime Voice Connector, it must be deleted prior to deleting the origination settings.

``` swift
func deleteVoiceConnectorOrigination(input: DeleteVoiceConnectorOriginationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVoiceConnectorOriginationOutputResponse, DeleteVoiceConnectorOriginationOutputError>) -> Void)
```

### deleteVoiceConnectorProxy(input:completion:)

Deletes the proxy configuration from the specified Amazon Chime Voice Connector.

``` swift
func deleteVoiceConnectorProxy(input: DeleteVoiceConnectorProxyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVoiceConnectorProxyOutputResponse, DeleteVoiceConnectorProxyOutputError>) -> Void)
```

### deleteVoiceConnectorStreamingConfiguration(input:completion:)

Deletes the streaming configuration for the specified Amazon Chime Voice Connector.

``` swift
func deleteVoiceConnectorStreamingConfiguration(input: DeleteVoiceConnectorStreamingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVoiceConnectorStreamingConfigurationOutputResponse, DeleteVoiceConnectorStreamingConfigurationOutputError>) -> Void)
```

### deleteVoiceConnectorTermination(input:completion:)

Deletes the termination settings for the specified Amazon Chime Voice Connector. If emergency calling is configured for the Amazon Chime Voice Connector, it must be deleted prior to deleting the termination settings.

``` swift
func deleteVoiceConnectorTermination(input: DeleteVoiceConnectorTerminationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVoiceConnectorTerminationOutputResponse, DeleteVoiceConnectorTerminationOutputError>) -> Void)
```

### deleteVoiceConnectorTerminationCredentials(input:completion:)

Deletes the specified SIP credentials used by your equipment to authenticate during call termination.

``` swift
func deleteVoiceConnectorTerminationCredentials(input: DeleteVoiceConnectorTerminationCredentialsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVoiceConnectorTerminationCredentialsOutputResponse, DeleteVoiceConnectorTerminationCredentialsOutputError>) -> Void)
```

### describeAppInstance(input:completion:)

Returns the full details of an AppInstance.

``` swift
func describeAppInstance(input: DescribeAppInstanceInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAppInstanceOutputResponse, DescribeAppInstanceOutputError>) -> Void)
```

### describeAppInstanceAdmin(input:completion:)

Returns the full details of an AppInstanceAdmin.

``` swift
func describeAppInstanceAdmin(input: DescribeAppInstanceAdminInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAppInstanceAdminOutputResponse, DescribeAppInstanceAdminOutputError>) -> Void)
```

### describeAppInstanceUser(input:completion:)

Returns the full details of an AppInstanceUser.

``` swift
func describeAppInstanceUser(input: DescribeAppInstanceUserInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAppInstanceUserOutputResponse, DescribeAppInstanceUserOutputError>) -> Void)
```

### describeChannel(input:completion:)

Returns the full details of a channel in an Amazon Chime AppInstance. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
func describeChannel(input: DescribeChannelInput, completion: @escaping (ClientRuntime.SdkResult<DescribeChannelOutputResponse, DescribeChannelOutputError>) -> Void)
```

### describeChannelBan(input:completion:)

Returns the full details of a channel ban. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
func describeChannelBan(input: DescribeChannelBanInput, completion: @escaping (ClientRuntime.SdkResult<DescribeChannelBanOutputResponse, DescribeChannelBanOutputError>) -> Void)
```

### describeChannelMembership(input:completion:)

Returns the full details of a user's channel membership. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
func describeChannelMembership(input: DescribeChannelMembershipInput, completion: @escaping (ClientRuntime.SdkResult<DescribeChannelMembershipOutputResponse, DescribeChannelMembershipOutputError>) -> Void)
```

### describeChannelMembershipForAppInstanceUser(input:completion:)

Returns the details of a channel based on the membership of the specified AppInstanceUser. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
func describeChannelMembershipForAppInstanceUser(input: DescribeChannelMembershipForAppInstanceUserInput, completion: @escaping (ClientRuntime.SdkResult<DescribeChannelMembershipForAppInstanceUserOutputResponse, DescribeChannelMembershipForAppInstanceUserOutputError>) -> Void)
```

### describeChannelModeratedByAppInstanceUser(input:completion:)

Returns the full details of a channel moderated by the specified AppInstanceUser. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
func describeChannelModeratedByAppInstanceUser(input: DescribeChannelModeratedByAppInstanceUserInput, completion: @escaping (ClientRuntime.SdkResult<DescribeChannelModeratedByAppInstanceUserOutputResponse, DescribeChannelModeratedByAppInstanceUserOutputError>) -> Void)
```

### describeChannelModerator(input:completion:)

Returns the full details of a single ChannelModerator. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
func describeChannelModerator(input: DescribeChannelModeratorInput, completion: @escaping (ClientRuntime.SdkResult<DescribeChannelModeratorOutputResponse, DescribeChannelModeratorOutputError>) -> Void)
```

### disassociatePhoneNumberFromUser(input:completion:)

Disassociates the primary provisioned phone number from the specified Amazon Chime user.

``` swift
func disassociatePhoneNumberFromUser(input: DisassociatePhoneNumberFromUserInput, completion: @escaping (ClientRuntime.SdkResult<DisassociatePhoneNumberFromUserOutputResponse, DisassociatePhoneNumberFromUserOutputError>) -> Void)
```

### disassociatePhoneNumbersFromVoiceConnector(input:completion:)

Disassociates the specified phone numbers from the specified Amazon Chime Voice Connector.

``` swift
func disassociatePhoneNumbersFromVoiceConnector(input: DisassociatePhoneNumbersFromVoiceConnectorInput, completion: @escaping (ClientRuntime.SdkResult<DisassociatePhoneNumbersFromVoiceConnectorOutputResponse, DisassociatePhoneNumbersFromVoiceConnectorOutputError>) -> Void)
```

### disassociatePhoneNumbersFromVoiceConnectorGroup(input:completion:)

Disassociates the specified phone numbers from the specified Amazon Chime Voice Connector group.

``` swift
func disassociatePhoneNumbersFromVoiceConnectorGroup(input: DisassociatePhoneNumbersFromVoiceConnectorGroupInput, completion: @escaping (ClientRuntime.SdkResult<DisassociatePhoneNumbersFromVoiceConnectorGroupOutputResponse, DisassociatePhoneNumbersFromVoiceConnectorGroupOutputError>) -> Void)
```

### disassociateSigninDelegateGroupsFromAccount(input:completion:)

Disassociates the specified sign-in delegate groups from the specified Amazon Chime account.

``` swift
func disassociateSigninDelegateGroupsFromAccount(input: DisassociateSigninDelegateGroupsFromAccountInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateSigninDelegateGroupsFromAccountOutputResponse, DisassociateSigninDelegateGroupsFromAccountOutputError>) -> Void)
```

### getAccount(input:completion:)

Retrieves details for the specified Amazon Chime account, such as account type and supported licenses.

``` swift
func getAccount(input: GetAccountInput, completion: @escaping (ClientRuntime.SdkResult<GetAccountOutputResponse, GetAccountOutputError>) -> Void)
```

### getAccountSettings(input:completion:)

Retrieves account settings for the specified Amazon Chime account ID, such as remote control and dialout settings. For more information about these settings, see [Use the Policies Page](https://docs.aws.amazon.com/chime/latest/ag/policies.html) in the Amazon Chime Administration Guide.

``` swift
func getAccountSettings(input: GetAccountSettingsInput, completion: @escaping (ClientRuntime.SdkResult<GetAccountSettingsOutputResponse, GetAccountSettingsOutputError>) -> Void)
```

### getAppInstanceRetentionSettings(input:completion:)

Gets the retention settings for an AppInstance.

``` swift
func getAppInstanceRetentionSettings(input: GetAppInstanceRetentionSettingsInput, completion: @escaping (ClientRuntime.SdkResult<GetAppInstanceRetentionSettingsOutputResponse, GetAppInstanceRetentionSettingsOutputError>) -> Void)
```

### getAppInstanceStreamingConfigurations(input:completion:)

Gets the streaming settings for an AppInstance.

``` swift
func getAppInstanceStreamingConfigurations(input: GetAppInstanceStreamingConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<GetAppInstanceStreamingConfigurationsOutputResponse, GetAppInstanceStreamingConfigurationsOutputError>) -> Void)
```

### getAttendee(input:completion:)

Gets the Amazon Chime SDK attendee details for a specified meeting ID and attendee ID. For more information about the Amazon Chime SDK, see [Using the Amazon Chime SDK](https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html) in the Amazon Chime Developer Guide .

``` swift
func getAttendee(input: GetAttendeeInput, completion: @escaping (ClientRuntime.SdkResult<GetAttendeeOutputResponse, GetAttendeeOutputError>) -> Void)
```

### getBot(input:completion:)

Retrieves details for the specified bot, such as bot email address, bot type, status, and display name.

``` swift
func getBot(input: GetBotInput, completion: @escaping (ClientRuntime.SdkResult<GetBotOutputResponse, GetBotOutputError>) -> Void)
```

### getChannelMessage(input:completion:)

Gets the full details of a channel message. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
func getChannelMessage(input: GetChannelMessageInput, completion: @escaping (ClientRuntime.SdkResult<GetChannelMessageOutputResponse, GetChannelMessageOutputError>) -> Void)
```

### getEventsConfiguration(input:completion:)

Gets details for an events configuration that allows a bot to receive outgoing events, such as an HTTPS endpoint or Lambda function ARN.

``` swift
func getEventsConfiguration(input: GetEventsConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetEventsConfigurationOutputResponse, GetEventsConfigurationOutputError>) -> Void)
```

### getGlobalSettings(input:completion:)

Retrieves global settings for the administrator's AWS account, such as Amazon Chime Business Calling and Amazon Chime Voice Connector settings.

``` swift
func getGlobalSettings(input: GetGlobalSettingsInput, completion: @escaping (ClientRuntime.SdkResult<GetGlobalSettingsOutputResponse, GetGlobalSettingsOutputError>) -> Void)
```

### getMediaCapturePipeline(input:completion:)

Gets an existing media capture pipeline.

``` swift
func getMediaCapturePipeline(input: GetMediaCapturePipelineInput, completion: @escaping (ClientRuntime.SdkResult<GetMediaCapturePipelineOutputResponse, GetMediaCapturePipelineOutputError>) -> Void)
```

### getMeeting(input:completion:)

Gets the Amazon Chime SDK meeting details for the specified meeting ID. For more information about the Amazon Chime SDK, see [Using the Amazon Chime SDK](https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html) in the Amazon Chime Developer Guide .

``` swift
func getMeeting(input: GetMeetingInput, completion: @escaping (ClientRuntime.SdkResult<GetMeetingOutputResponse, GetMeetingOutputError>) -> Void)
```

### getMessagingSessionEndpoint(input:completion:)

The details of the endpoint for the messaging session.

``` swift
func getMessagingSessionEndpoint(input: GetMessagingSessionEndpointInput, completion: @escaping (ClientRuntime.SdkResult<GetMessagingSessionEndpointOutputResponse, GetMessagingSessionEndpointOutputError>) -> Void)
```

### getPhoneNumber(input:completion:)

Retrieves details for the specified phone number ID, such as associations, capabilities, and product type.

``` swift
func getPhoneNumber(input: GetPhoneNumberInput, completion: @escaping (ClientRuntime.SdkResult<GetPhoneNumberOutputResponse, GetPhoneNumberOutputError>) -> Void)
```

### getPhoneNumberOrder(input:completion:)

Retrieves details for the specified phone number order, such as the order creation timestamp, phone numbers in E.164 format, product type, and order status.

``` swift
func getPhoneNumberOrder(input: GetPhoneNumberOrderInput, completion: @escaping (ClientRuntime.SdkResult<GetPhoneNumberOrderOutputResponse, GetPhoneNumberOrderOutputError>) -> Void)
```

### getPhoneNumberSettings(input:completion:)

Retrieves the phone number settings for the administrator's AWS account, such as the default outbound calling name.

``` swift
func getPhoneNumberSettings(input: GetPhoneNumberSettingsInput, completion: @escaping (ClientRuntime.SdkResult<GetPhoneNumberSettingsOutputResponse, GetPhoneNumberSettingsOutputError>) -> Void)
```

### getProxySession(input:completion:)

Gets the specified proxy session details for the specified Amazon Chime Voice Connector.

``` swift
func getProxySession(input: GetProxySessionInput, completion: @escaping (ClientRuntime.SdkResult<GetProxySessionOutputResponse, GetProxySessionOutputError>) -> Void)
```

### getRetentionSettings(input:completion:)

Gets the retention settings for the specified Amazon Chime Enterprise account. For more information about retention settings, see [Managing Chat Retention Policies](https://docs.aws.amazon.com/chime/latest/ag/chat-retention.html) in the Amazon Chime Administration Guide.

``` swift
func getRetentionSettings(input: GetRetentionSettingsInput, completion: @escaping (ClientRuntime.SdkResult<GetRetentionSettingsOutputResponse, GetRetentionSettingsOutputError>) -> Void)
```

### getRoom(input:completion:)

Retrieves room details, such as the room name, for a room in an Amazon Chime Enterprise account.

``` swift
func getRoom(input: GetRoomInput, completion: @escaping (ClientRuntime.SdkResult<GetRoomOutputResponse, GetRoomOutputError>) -> Void)
```

### getSipMediaApplication(input:completion:)

Retrieves the information for a SIP media application, including name, AWS Region, and endpoints.

``` swift
func getSipMediaApplication(input: GetSipMediaApplicationInput, completion: @escaping (ClientRuntime.SdkResult<GetSipMediaApplicationOutputResponse, GetSipMediaApplicationOutputError>) -> Void)
```

### getSipMediaApplicationLoggingConfiguration(input:completion:)

Returns the logging configuration for the specified SIP media application.

``` swift
func getSipMediaApplicationLoggingConfiguration(input: GetSipMediaApplicationLoggingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetSipMediaApplicationLoggingConfigurationOutputResponse, GetSipMediaApplicationLoggingConfigurationOutputError>) -> Void)
```

### getSipRule(input:completion:)

Retrieves the details of a SIP rule, such as the rule ID, name, triggers, and target endpoints.

``` swift
func getSipRule(input: GetSipRuleInput, completion: @escaping (ClientRuntime.SdkResult<GetSipRuleOutputResponse, GetSipRuleOutputError>) -> Void)
```

### getUser(input:completion:)

Retrieves details for the specified user ID, such as primary email address, license type,and personal meeting PIN. To retrieve user details with an email address instead of a user ID, use the \[ListUsers\] action, and then filter by email address.

``` swift
func getUser(input: GetUserInput, completion: @escaping (ClientRuntime.SdkResult<GetUserOutputResponse, GetUserOutputError>) -> Void)
```

### getUserSettings(input:completion:)

Retrieves settings for the specified user ID, such as any associated phone number settings.

``` swift
func getUserSettings(input: GetUserSettingsInput, completion: @escaping (ClientRuntime.SdkResult<GetUserSettingsOutputResponse, GetUserSettingsOutputError>) -> Void)
```

### getVoiceConnector(input:completion:)

Retrieves details for the specified Amazon Chime Voice Connector, such as timestamps,name, outbound host, and encryption requirements.

``` swift
func getVoiceConnector(input: GetVoiceConnectorInput, completion: @escaping (ClientRuntime.SdkResult<GetVoiceConnectorOutputResponse, GetVoiceConnectorOutputError>) -> Void)
```

### getVoiceConnectorEmergencyCallingConfiguration(input:completion:)

Gets the emergency calling configuration details for the specified Amazon Chime Voice Connector.

``` swift
func getVoiceConnectorEmergencyCallingConfiguration(input: GetVoiceConnectorEmergencyCallingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetVoiceConnectorEmergencyCallingConfigurationOutputResponse, GetVoiceConnectorEmergencyCallingConfigurationOutputError>) -> Void)
```

### getVoiceConnectorGroup(input:completion:)

Retrieves details for the specified Amazon Chime Voice Connector group, such as timestamps,name, and associated VoiceConnectorItems.

``` swift
func getVoiceConnectorGroup(input: GetVoiceConnectorGroupInput, completion: @escaping (ClientRuntime.SdkResult<GetVoiceConnectorGroupOutputResponse, GetVoiceConnectorGroupOutputError>) -> Void)
```

### getVoiceConnectorLoggingConfiguration(input:completion:)

Retrieves the logging configuration details for the specified Amazon Chime Voice Connector. Shows whether SIP message logs are enabled for sending to Amazon CloudWatch Logs.

``` swift
func getVoiceConnectorLoggingConfiguration(input: GetVoiceConnectorLoggingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetVoiceConnectorLoggingConfigurationOutputResponse, GetVoiceConnectorLoggingConfigurationOutputError>) -> Void)
```

### getVoiceConnectorOrigination(input:completion:)

Retrieves origination setting details for the specified Amazon Chime Voice Connector.

``` swift
func getVoiceConnectorOrigination(input: GetVoiceConnectorOriginationInput, completion: @escaping (ClientRuntime.SdkResult<GetVoiceConnectorOriginationOutputResponse, GetVoiceConnectorOriginationOutputError>) -> Void)
```

### getVoiceConnectorProxy(input:completion:)

Gets the proxy configuration details for the specified Amazon Chime Voice Connector.

``` swift
func getVoiceConnectorProxy(input: GetVoiceConnectorProxyInput, completion: @escaping (ClientRuntime.SdkResult<GetVoiceConnectorProxyOutputResponse, GetVoiceConnectorProxyOutputError>) -> Void)
```

### getVoiceConnectorStreamingConfiguration(input:completion:)

Retrieves the streaming configuration details for the specified Amazon Chime Voice Connector. Shows whether media streaming is enabled for sending to Amazon Kinesis. It also shows the retention period, in hours, for the Amazon Kinesis data.

``` swift
func getVoiceConnectorStreamingConfiguration(input: GetVoiceConnectorStreamingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetVoiceConnectorStreamingConfigurationOutputResponse, GetVoiceConnectorStreamingConfigurationOutputError>) -> Void)
```

### getVoiceConnectorTermination(input:completion:)

Retrieves termination setting details for the specified Amazon Chime Voice Connector.

``` swift
func getVoiceConnectorTermination(input: GetVoiceConnectorTerminationInput, completion: @escaping (ClientRuntime.SdkResult<GetVoiceConnectorTerminationOutputResponse, GetVoiceConnectorTerminationOutputError>) -> Void)
```

### getVoiceConnectorTerminationHealth(input:completion:)

Retrieves information about the last time a SIP OPTIONS ping was received from your SIP infrastructure for the specified Amazon Chime Voice Connector.

``` swift
func getVoiceConnectorTerminationHealth(input: GetVoiceConnectorTerminationHealthInput, completion: @escaping (ClientRuntime.SdkResult<GetVoiceConnectorTerminationHealthOutputResponse, GetVoiceConnectorTerminationHealthOutputError>) -> Void)
```

### inviteUsers(input:completion:)

Sends email to a maximum of 50 users, inviting them to the specified Amazon Chime Team account. Only Team account types are currently supported for this action.

``` swift
func inviteUsers(input: InviteUsersInput, completion: @escaping (ClientRuntime.SdkResult<InviteUsersOutputResponse, InviteUsersOutputError>) -> Void)
```

### listAccounts(input:completion:)

Lists the Amazon Chime accounts under the administrator's AWS account. You can filter accounts by account name prefix. To find out which Amazon Chime account a user belongs to, you can filter by the user's email address, which returns one account result.

``` swift
func listAccounts(input: ListAccountsInput, completion: @escaping (ClientRuntime.SdkResult<ListAccountsOutputResponse, ListAccountsOutputError>) -> Void)
```

### listAppInstanceAdmins(input:completion:)

Returns a list of the administrators in the AppInstance.

``` swift
func listAppInstanceAdmins(input: ListAppInstanceAdminsInput, completion: @escaping (ClientRuntime.SdkResult<ListAppInstanceAdminsOutputResponse, ListAppInstanceAdminsOutputError>) -> Void)
```

### listAppInstances(input:completion:)

Lists all Amazon Chime AppInstances created under a single AWS account.

``` swift
func listAppInstances(input: ListAppInstancesInput, completion: @escaping (ClientRuntime.SdkResult<ListAppInstancesOutputResponse, ListAppInstancesOutputError>) -> Void)
```

### listAppInstanceUsers(input:completion:)

List all AppInstanceUsers created under a single AppInstance.

``` swift
func listAppInstanceUsers(input: ListAppInstanceUsersInput, completion: @escaping (ClientRuntime.SdkResult<ListAppInstanceUsersOutputResponse, ListAppInstanceUsersOutputError>) -> Void)
```

### listAttendees(input:completion:)

Lists the attendees for the specified Amazon Chime SDK meeting. For more information about the Amazon Chime SDK, see [Using the Amazon Chime SDK](https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html) in the Amazon Chime Developer Guide.

``` swift
func listAttendees(input: ListAttendeesInput, completion: @escaping (ClientRuntime.SdkResult<ListAttendeesOutputResponse, ListAttendeesOutputError>) -> Void)
```

### listAttendeeTags(input:completion:)

Lists the tags applied to an Amazon Chime SDK attendee resource.

``` swift
func listAttendeeTags(input: ListAttendeeTagsInput, completion: @escaping (ClientRuntime.SdkResult<ListAttendeeTagsOutputResponse, ListAttendeeTagsOutputError>) -> Void)
```

### listBots(input:completion:)

Lists the bots associated with the administrator's Amazon Chime Enterprise account ID.

``` swift
func listBots(input: ListBotsInput, completion: @escaping (ClientRuntime.SdkResult<ListBotsOutputResponse, ListBotsOutputError>) -> Void)
```

### listChannelBans(input:completion:)

Lists all the users banned from a particular channel. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
func listChannelBans(input: ListChannelBansInput, completion: @escaping (ClientRuntime.SdkResult<ListChannelBansOutputResponse, ListChannelBansOutputError>) -> Void)
```

### listChannelMemberships(input:completion:)

Lists all channel memberships in a channel. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
func listChannelMemberships(input: ListChannelMembershipsInput, completion: @escaping (ClientRuntime.SdkResult<ListChannelMembershipsOutputResponse, ListChannelMembershipsOutputError>) -> Void)
```

### listChannelMembershipsForAppInstanceUser(input:completion:)

Lists all channels that a particular AppInstanceUser is a part of. Only an AppInstanceAdmin can call the API with a user ARN that is not their own. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
func listChannelMembershipsForAppInstanceUser(input: ListChannelMembershipsForAppInstanceUserInput, completion: @escaping (ClientRuntime.SdkResult<ListChannelMembershipsForAppInstanceUserOutputResponse, ListChannelMembershipsForAppInstanceUserOutputError>) -> Void)
```

### listChannelMessages(input:completion:)

List all the messages in a channel. Returns a paginated list of ChannelMessages. By default, sorted by creation timestamp in descending order. Redacted messages appear in the results as empty, since they are only redacted, not deleted. Deleted messages do not appear in the results. This action always returns the latest version of an edited message. Also, the x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
func listChannelMessages(input: ListChannelMessagesInput, completion: @escaping (ClientRuntime.SdkResult<ListChannelMessagesOutputResponse, ListChannelMessagesOutputError>) -> Void)
```

### listChannelModerators(input:completion:)

Lists all the moderators for a channel. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
func listChannelModerators(input: ListChannelModeratorsInput, completion: @escaping (ClientRuntime.SdkResult<ListChannelModeratorsOutputResponse, ListChannelModeratorsOutputError>) -> Void)
```

### listChannels(input:completion:)

Lists all Channels created under a single Chime App as a paginated list. You can specify filters to narrow results. Functionality & restrictions

``` swift
func listChannels(input: ListChannelsInput, completion: @escaping (ClientRuntime.SdkResult<ListChannelsOutputResponse, ListChannelsOutputError>) -> Void)
```

  - Use privacy = PUBLIC to retrieve all public channels in the account.

  - Only an AppInstanceAdmin can set privacy = PRIVATE to list the private channels in an account.

The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

### listChannelsModeratedByAppInstanceUser(input:completion:)

A list of the channels moderated by an AppInstanceUser. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
func listChannelsModeratedByAppInstanceUser(input: ListChannelsModeratedByAppInstanceUserInput, completion: @escaping (ClientRuntime.SdkResult<ListChannelsModeratedByAppInstanceUserOutputResponse, ListChannelsModeratedByAppInstanceUserOutputError>) -> Void)
```

### listMediaCapturePipelines(input:completion:)

Returns a list of media capture pipelines.

``` swift
func listMediaCapturePipelines(input: ListMediaCapturePipelinesInput, completion: @escaping (ClientRuntime.SdkResult<ListMediaCapturePipelinesOutputResponse, ListMediaCapturePipelinesOutputError>) -> Void)
```

### listMeetings(input:completion:)

Lists up to 100 active Amazon Chime SDK meetings. For more information about the Amazon Chime SDK, see [Using the Amazon Chime SDK](https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html) in the Amazon Chime Developer Guide.

``` swift
func listMeetings(input: ListMeetingsInput, completion: @escaping (ClientRuntime.SdkResult<ListMeetingsOutputResponse, ListMeetingsOutputError>) -> Void)
```

### listMeetingTags(input:completion:)

Lists the tags applied to an Amazon Chime SDK meeting resource.

``` swift
func listMeetingTags(input: ListMeetingTagsInput, completion: @escaping (ClientRuntime.SdkResult<ListMeetingTagsOutputResponse, ListMeetingTagsOutputError>) -> Void)
```

### listPhoneNumberOrders(input:completion:)

Lists the phone number orders for the administrator's Amazon Chime account.

``` swift
func listPhoneNumberOrders(input: ListPhoneNumberOrdersInput, completion: @escaping (ClientRuntime.SdkResult<ListPhoneNumberOrdersOutputResponse, ListPhoneNumberOrdersOutputError>) -> Void)
```

### listPhoneNumbers(input:completion:)

Lists the phone numbers for the specified Amazon Chime account, Amazon Chime user, Amazon Chime Voice Connector, or Amazon Chime Voice Connector group.

``` swift
func listPhoneNumbers(input: ListPhoneNumbersInput, completion: @escaping (ClientRuntime.SdkResult<ListPhoneNumbersOutputResponse, ListPhoneNumbersOutputError>) -> Void)
```

### listProxySessions(input:completion:)

Lists the proxy sessions for the specified Amazon Chime Voice Connector.

``` swift
func listProxySessions(input: ListProxySessionsInput, completion: @escaping (ClientRuntime.SdkResult<ListProxySessionsOutputResponse, ListProxySessionsOutputError>) -> Void)
```

### listRoomMemberships(input:completion:)

Lists the membership details for the specified room in an Amazon Chime Enterprise account, such as the members' IDs, email addresses, and names.

``` swift
func listRoomMemberships(input: ListRoomMembershipsInput, completion: @escaping (ClientRuntime.SdkResult<ListRoomMembershipsOutputResponse, ListRoomMembershipsOutputError>) -> Void)
```

### listRooms(input:completion:)

Lists the room details for the specified Amazon Chime Enterprise account. Optionally, filter the results by a member ID (user ID or bot ID) to see a list of rooms that the member belongs to.

``` swift
func listRooms(input: ListRoomsInput, completion: @escaping (ClientRuntime.SdkResult<ListRoomsOutputResponse, ListRoomsOutputError>) -> Void)
```

### listSipMediaApplications(input:completion:)

Lists the SIP media applications under the administrator's AWS account.

``` swift
func listSipMediaApplications(input: ListSipMediaApplicationsInput, completion: @escaping (ClientRuntime.SdkResult<ListSipMediaApplicationsOutputResponse, ListSipMediaApplicationsOutputError>) -> Void)
```

### listSipRules(input:completion:)

Lists the SIP rules under the administrator's AWS account.

``` swift
func listSipRules(input: ListSipRulesInput, completion: @escaping (ClientRuntime.SdkResult<ListSipRulesOutputResponse, ListSipRulesOutputError>) -> Void)
```

### listSupportedPhoneNumberCountries(input:completion:)

Lists supported phone number countries.

``` swift
func listSupportedPhoneNumberCountries(input: ListSupportedPhoneNumberCountriesInput, completion: @escaping (ClientRuntime.SdkResult<ListSupportedPhoneNumberCountriesOutputResponse, ListSupportedPhoneNumberCountriesOutputError>) -> Void)
```

### listTagsForResource(input:completion:)

Lists the tags applied to an Amazon Chime SDK meeting resource.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### listUsers(input:completion:)

Lists the users that belong to the specified Amazon Chime account. You can specify an email address to list only the user that the email address belongs to.

``` swift
func listUsers(input: ListUsersInput, completion: @escaping (ClientRuntime.SdkResult<ListUsersOutputResponse, ListUsersOutputError>) -> Void)
```

### listVoiceConnectorGroups(input:completion:)

Lists the Amazon Chime Voice Connector groups for the administrator's AWS account.

``` swift
func listVoiceConnectorGroups(input: ListVoiceConnectorGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListVoiceConnectorGroupsOutputResponse, ListVoiceConnectorGroupsOutputError>) -> Void)
```

### listVoiceConnectors(input:completion:)

Lists the Amazon Chime Voice Connectors for the administrator's AWS account.

``` swift
func listVoiceConnectors(input: ListVoiceConnectorsInput, completion: @escaping (ClientRuntime.SdkResult<ListVoiceConnectorsOutputResponse, ListVoiceConnectorsOutputError>) -> Void)
```

### listVoiceConnectorTerminationCredentials(input:completion:)

Lists the SIP credentials for the specified Amazon Chime Voice Connector.

``` swift
func listVoiceConnectorTerminationCredentials(input: ListVoiceConnectorTerminationCredentialsInput, completion: @escaping (ClientRuntime.SdkResult<ListVoiceConnectorTerminationCredentialsOutputResponse, ListVoiceConnectorTerminationCredentialsOutputError>) -> Void)
```

### logoutUser(input:completion:)

Logs out the specified user from all of the devices they are currently logged into.

``` swift
func logoutUser(input: LogoutUserInput, completion: @escaping (ClientRuntime.SdkResult<LogoutUserOutputResponse, LogoutUserOutputError>) -> Void)
```

### putAppInstanceRetentionSettings(input:completion:)

Sets the amount of time in days that a given AppInstance retains data.

``` swift
func putAppInstanceRetentionSettings(input: PutAppInstanceRetentionSettingsInput, completion: @escaping (ClientRuntime.SdkResult<PutAppInstanceRetentionSettingsOutputResponse, PutAppInstanceRetentionSettingsOutputError>) -> Void)
```

### putAppInstanceStreamingConfigurations(input:completion:)

The data streaming configurations of an AppInstance.

``` swift
func putAppInstanceStreamingConfigurations(input: PutAppInstanceStreamingConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<PutAppInstanceStreamingConfigurationsOutputResponse, PutAppInstanceStreamingConfigurationsOutputError>) -> Void)
```

### putEventsConfiguration(input:completion:)

Creates an events configuration that allows a bot to receive outgoing events sent by Amazon Chime. Choose either an HTTPS endpoint or a Lambda function ARN. For more information, see \[Bot\].

``` swift
func putEventsConfiguration(input: PutEventsConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<PutEventsConfigurationOutputResponse, PutEventsConfigurationOutputError>) -> Void)
```

### putRetentionSettings(input:completion:)

Puts retention settings for the specified Amazon Chime Enterprise account. We recommend using AWS CloudTrail to monitor usage of this API for your account. For more information, see [Logging Amazon Chime API Calls with AWS CloudTrail](https://docs.aws.amazon.com/chime/latest/ag/cloudtrail.html) in the Amazon Chime Administration Guide. To turn off existing retention settings, remove the number of days from the corresponding RetentionDays field in the RetentionSettings object. For more information about retention settings, see [Managing Chat Retention Policies](https://docs.aws.amazon.com/chime/latest/ag/chat-retention.html) in the Amazon Chime Administration Guide.

``` swift
func putRetentionSettings(input: PutRetentionSettingsInput, completion: @escaping (ClientRuntime.SdkResult<PutRetentionSettingsOutputResponse, PutRetentionSettingsOutputError>) -> Void)
```

### putSipMediaApplicationLoggingConfiguration(input:completion:)

Updates the logging configuration for the specified SIP media application.

``` swift
func putSipMediaApplicationLoggingConfiguration(input: PutSipMediaApplicationLoggingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<PutSipMediaApplicationLoggingConfigurationOutputResponse, PutSipMediaApplicationLoggingConfigurationOutputError>) -> Void)
```

### putVoiceConnectorEmergencyCallingConfiguration(input:completion:)

Puts emergency calling configuration details to the specified Amazon Chime Voice Connector, such as emergency phone numbers and calling countries. Origination and termination settings must be enabled for the Amazon Chime Voice Connector before emergency calling can be configured.

``` swift
func putVoiceConnectorEmergencyCallingConfiguration(input: PutVoiceConnectorEmergencyCallingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<PutVoiceConnectorEmergencyCallingConfigurationOutputResponse, PutVoiceConnectorEmergencyCallingConfigurationOutputError>) -> Void)
```

### putVoiceConnectorLoggingConfiguration(input:completion:)

Adds a logging configuration for the specified Amazon Chime Voice Connector. The logging configuration specifies whether SIP message logs are enabled for sending to Amazon CloudWatch Logs.

``` swift
func putVoiceConnectorLoggingConfiguration(input: PutVoiceConnectorLoggingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<PutVoiceConnectorLoggingConfigurationOutputResponse, PutVoiceConnectorLoggingConfigurationOutputError>) -> Void)
```

### putVoiceConnectorOrigination(input:completion:)

Adds origination settings for the specified Amazon Chime Voice Connector. If emergency calling is configured for the Amazon Chime Voice Connector, it must be deleted prior to turning off origination settings.

``` swift
func putVoiceConnectorOrigination(input: PutVoiceConnectorOriginationInput, completion: @escaping (ClientRuntime.SdkResult<PutVoiceConnectorOriginationOutputResponse, PutVoiceConnectorOriginationOutputError>) -> Void)
```

### putVoiceConnectorProxy(input:completion:)

Puts the specified proxy configuration to the specified Amazon Chime Voice Connector.

``` swift
func putVoiceConnectorProxy(input: PutVoiceConnectorProxyInput, completion: @escaping (ClientRuntime.SdkResult<PutVoiceConnectorProxyOutputResponse, PutVoiceConnectorProxyOutputError>) -> Void)
```

### putVoiceConnectorStreamingConfiguration(input:completion:)

Adds a streaming configuration for the specified Amazon Chime Voice Connector. The streaming configuration specifies whether media streaming is enabled for sending to Indonesians. It also sets the retention period, in hours, for the Amazon Kinesis data.

``` swift
func putVoiceConnectorStreamingConfiguration(input: PutVoiceConnectorStreamingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<PutVoiceConnectorStreamingConfigurationOutputResponse, PutVoiceConnectorStreamingConfigurationOutputError>) -> Void)
```

### putVoiceConnectorTermination(input:completion:)

Adds termination settings for the specified Amazon Chime Voice Connector. If emergency calling is configured for the Amazon Chime Voice Connector, it must be deleted prior to turning off termination settings.

``` swift
func putVoiceConnectorTermination(input: PutVoiceConnectorTerminationInput, completion: @escaping (ClientRuntime.SdkResult<PutVoiceConnectorTerminationOutputResponse, PutVoiceConnectorTerminationOutputError>) -> Void)
```

### putVoiceConnectorTerminationCredentials(input:completion:)

Adds termination SIP credentials for the specified Amazon Chime Voice Connector.

``` swift
func putVoiceConnectorTerminationCredentials(input: PutVoiceConnectorTerminationCredentialsInput, completion: @escaping (ClientRuntime.SdkResult<PutVoiceConnectorTerminationCredentialsOutputResponse, PutVoiceConnectorTerminationCredentialsOutputError>) -> Void)
```

### redactChannelMessage(input:completion:)

Redacts message content, but not metadata. The message exists in the back end, but the action returns null content, and the state shows as redacted. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
func redactChannelMessage(input: RedactChannelMessageInput, completion: @escaping (ClientRuntime.SdkResult<RedactChannelMessageOutputResponse, RedactChannelMessageOutputError>) -> Void)
```

### redactConversationMessage(input:completion:)

Redacts the specified message from the specified Amazon Chime conversation.

``` swift
func redactConversationMessage(input: RedactConversationMessageInput, completion: @escaping (ClientRuntime.SdkResult<RedactConversationMessageOutputResponse, RedactConversationMessageOutputError>) -> Void)
```

### redactRoomMessage(input:completion:)

Redacts the specified message from the specified Amazon Chime channel.

``` swift
func redactRoomMessage(input: RedactRoomMessageInput, completion: @escaping (ClientRuntime.SdkResult<RedactRoomMessageOutputResponse, RedactRoomMessageOutputError>) -> Void)
```

### regenerateSecurityToken(input:completion:)

Regenerates the security token for a bot.

``` swift
func regenerateSecurityToken(input: RegenerateSecurityTokenInput, completion: @escaping (ClientRuntime.SdkResult<RegenerateSecurityTokenOutputResponse, RegenerateSecurityTokenOutputError>) -> Void)
```

### resetPersonalPIN(input:completion:)

Resets the personal meeting PIN for the specified user on an Amazon Chime account. Returns the \[User\] object with the updated personal meeting PIN.

``` swift
func resetPersonalPIN(input: ResetPersonalPINInput, completion: @escaping (ClientRuntime.SdkResult<ResetPersonalPINOutputResponse, ResetPersonalPINOutputError>) -> Void)
```

### restorePhoneNumber(input:completion:)

Moves a phone number from the Deletion queue back into the phone number Inventory.

``` swift
func restorePhoneNumber(input: RestorePhoneNumberInput, completion: @escaping (ClientRuntime.SdkResult<RestorePhoneNumberOutputResponse, RestorePhoneNumberOutputError>) -> Void)
```

### searchAvailablePhoneNumbers(input:completion:)

Searches for phone numbers that can be ordered. For US numbers, provide at least one of the following search filters: AreaCode, City, State, or TollFreePrefix. If you provide City, you must also provide State. Numbers outside the US only support the PhoneNumberType filter, which you must use.

``` swift
func searchAvailablePhoneNumbers(input: SearchAvailablePhoneNumbersInput, completion: @escaping (ClientRuntime.SdkResult<SearchAvailablePhoneNumbersOutputResponse, SearchAvailablePhoneNumbersOutputError>) -> Void)
```

### sendChannelMessage(input:completion:)

Sends a message to a particular channel that the member is a part of. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header. Also, STANDARD messages can contain 4KB of data and the 1KB of metadata. CONTROL messages can contain 30 bytes of data and no metadata.

``` swift
func sendChannelMessage(input: SendChannelMessageInput, completion: @escaping (ClientRuntime.SdkResult<SendChannelMessageOutputResponse, SendChannelMessageOutputError>) -> Void)
```

### startMeetingTranscription(input:completion:)

Starts transcription for the specified meetingId.

``` swift
func startMeetingTranscription(input: StartMeetingTranscriptionInput, completion: @escaping (ClientRuntime.SdkResult<StartMeetingTranscriptionOutputResponse, StartMeetingTranscriptionOutputError>) -> Void)
```

### stopMeetingTranscription(input:completion:)

Stops transcription for the specified meetingId.

``` swift
func stopMeetingTranscription(input: StopMeetingTranscriptionInput, completion: @escaping (ClientRuntime.SdkResult<StopMeetingTranscriptionOutputResponse, StopMeetingTranscriptionOutputError>) -> Void)
```

### tagAttendee(input:completion:)

Applies the specified tags to the specified Amazon Chime SDK attendee.

``` swift
func tagAttendee(input: TagAttendeeInput, completion: @escaping (ClientRuntime.SdkResult<TagAttendeeOutputResponse, TagAttendeeOutputError>) -> Void)
```

### tagMeeting(input:completion:)

Applies the specified tags to the specified Amazon Chime SDK meeting.

``` swift
func tagMeeting(input: TagMeetingInput, completion: @escaping (ClientRuntime.SdkResult<TagMeetingOutputResponse, TagMeetingOutputError>) -> Void)
```

### tagResource(input:completion:)

Applies the specified tags to the specified Amazon Chime SDK meeting resource.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagAttendee(input:completion:)

Untags the specified tags from the specified Amazon Chime SDK attendee.

``` swift
func untagAttendee(input: UntagAttendeeInput, completion: @escaping (ClientRuntime.SdkResult<UntagAttendeeOutputResponse, UntagAttendeeOutputError>) -> Void)
```

### untagMeeting(input:completion:)

Untags the specified tags from the specified Amazon Chime SDK meeting.

``` swift
func untagMeeting(input: UntagMeetingInput, completion: @escaping (ClientRuntime.SdkResult<UntagMeetingOutputResponse, UntagMeetingOutputError>) -> Void)
```

### untagResource(input:completion:)

Untags the specified tags from the specified Amazon Chime SDK meeting resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateAccount(input:completion:)

Updates account details for the specified Amazon Chime account. Currently, only account name and default license updates are supported for this action.

``` swift
func updateAccount(input: UpdateAccountInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAccountOutputResponse, UpdateAccountOutputError>) -> Void)
```

### updateAccountSettings(input:completion:)

Updates the settings for the specified Amazon Chime account. You can update settings for remote control of shared screens, or for the dial-out option. For more information about these settings, see [Use the Policies Page](https://docs.aws.amazon.com/chime/latest/ag/policies.html) in the Amazon Chime Administration Guide.

``` swift
func updateAccountSettings(input: UpdateAccountSettingsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAccountSettingsOutputResponse, UpdateAccountSettingsOutputError>) -> Void)
```

### updateAppInstance(input:completion:)

Updates AppInstance metadata.

``` swift
func updateAppInstance(input: UpdateAppInstanceInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAppInstanceOutputResponse, UpdateAppInstanceOutputError>) -> Void)
```

### updateAppInstanceUser(input:completion:)

Updates the details of an AppInstanceUser. You can update names and metadata.

``` swift
func updateAppInstanceUser(input: UpdateAppInstanceUserInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAppInstanceUserOutputResponse, UpdateAppInstanceUserOutputError>) -> Void)
```

### updateBot(input:completion:)

Updates the status of the specified bot, such as starting or stopping the bot from running in your Amazon Chime Enterprise account.

``` swift
func updateBot(input: UpdateBotInput, completion: @escaping (ClientRuntime.SdkResult<UpdateBotOutputResponse, UpdateBotOutputError>) -> Void)
```

### updateChannel(input:completion:)

Update a channel's attributes. Restriction: You can't change a channel's privacy. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
func updateChannel(input: UpdateChannelInput, completion: @escaping (ClientRuntime.SdkResult<UpdateChannelOutputResponse, UpdateChannelOutputError>) -> Void)
```

### updateChannelMessage(input:completion:)

Updates the content of a message. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
func updateChannelMessage(input: UpdateChannelMessageInput, completion: @escaping (ClientRuntime.SdkResult<UpdateChannelMessageOutputResponse, UpdateChannelMessageOutputError>) -> Void)
```

### updateChannelReadMarker(input:completion:)

The details of the time when a user last read messages in a channel. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
func updateChannelReadMarker(input: UpdateChannelReadMarkerInput, completion: @escaping (ClientRuntime.SdkResult<UpdateChannelReadMarkerOutputResponse, UpdateChannelReadMarkerOutputError>) -> Void)
```

### updateGlobalSettings(input:completion:)

Updates global settings for the administrator's AWS account, such as Amazon Chime Business Calling and Amazon Chime Voice Connector settings.

``` swift
func updateGlobalSettings(input: UpdateGlobalSettingsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateGlobalSettingsOutputResponse, UpdateGlobalSettingsOutputError>) -> Void)
```

### updatePhoneNumber(input:completion:)

Updates phone number details, such as product type or calling name, for the specified phone number ID. You can update one phone number detail at a time. For example, you can update either the product type or the calling name in one action. For toll-free numbers, you cannot use the Amazon Chime Business Calling product type. For numbers outside the U.S., you must use the Amazon Chime SIP Media Application Dial-In product type. Updates to outbound calling names can take 72 hours to complete. Pending updates to outbound calling names must be complete before you can request another update.

``` swift
func updatePhoneNumber(input: UpdatePhoneNumberInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePhoneNumberOutputResponse, UpdatePhoneNumberOutputError>) -> Void)
```

### updatePhoneNumberSettings(input:completion:)

Updates the phone number settings for the administrator's AWS account, such as the default outbound calling name. You can update the default outbound calling name once every seven days. Outbound calling names can take up to 72 hours to update.

``` swift
func updatePhoneNumberSettings(input: UpdatePhoneNumberSettingsInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePhoneNumberSettingsOutputResponse, UpdatePhoneNumberSettingsOutputError>) -> Void)
```

### updateProxySession(input:completion:)

Updates the specified proxy session details, such as voice or SMS capabilities.

``` swift
func updateProxySession(input: UpdateProxySessionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateProxySessionOutputResponse, UpdateProxySessionOutputError>) -> Void)
```

### updateRoom(input:completion:)

Updates room details, such as the room name, for a room in an Amazon Chime Enterprise account.

``` swift
func updateRoom(input: UpdateRoomInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRoomOutputResponse, UpdateRoomOutputError>) -> Void)
```

### updateRoomMembership(input:completion:)

Updates room membership details, such as the member role, for a room in an Amazon Chime Enterprise account. The member role designates whether the member is a chat room administrator or a general chat room member. The member role can be updated only for user IDs.

``` swift
func updateRoomMembership(input: UpdateRoomMembershipInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRoomMembershipOutputResponse, UpdateRoomMembershipOutputError>) -> Void)
```

### updateSipMediaApplication(input:completion:)

Updates the details of the specified SIP media application.

``` swift
func updateSipMediaApplication(input: UpdateSipMediaApplicationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSipMediaApplicationOutputResponse, UpdateSipMediaApplicationOutputError>) -> Void)
```

### updateSipMediaApplicationCall(input:completion:)

Allows you to trigger a Lambda function at any time while a call is active, and replace the current actions with new actions returned by the invocation.

``` swift
func updateSipMediaApplicationCall(input: UpdateSipMediaApplicationCallInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSipMediaApplicationCallOutputResponse, UpdateSipMediaApplicationCallOutputError>) -> Void)
```

### updateSipRule(input:completion:)

Updates the details of the specified SIP rule.

``` swift
func updateSipRule(input: UpdateSipRuleInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSipRuleOutputResponse, UpdateSipRuleOutputError>) -> Void)
```

### updateUser(input:completion:)

Updates user details for a specified user ID. Currently, only LicenseType updates are supported for this action.

``` swift
func updateUser(input: UpdateUserInput, completion: @escaping (ClientRuntime.SdkResult<UpdateUserOutputResponse, UpdateUserOutputError>) -> Void)
```

### updateUserSettings(input:completion:)

Updates the settings for the specified user, such as phone number settings.

``` swift
func updateUserSettings(input: UpdateUserSettingsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateUserSettingsOutputResponse, UpdateUserSettingsOutputError>) -> Void)
```

### updateVoiceConnector(input:completion:)

Updates details for the specified Amazon Chime Voice Connector.

``` swift
func updateVoiceConnector(input: UpdateVoiceConnectorInput, completion: @escaping (ClientRuntime.SdkResult<UpdateVoiceConnectorOutputResponse, UpdateVoiceConnectorOutputError>) -> Void)
```

### updateVoiceConnectorGroup(input:completion:)

Updates details of the specified Amazon Chime Voice Connector group, such as the name and Amazon Chime Voice Connector priority ranking.

``` swift
func updateVoiceConnectorGroup(input: UpdateVoiceConnectorGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateVoiceConnectorGroupOutputResponse, UpdateVoiceConnectorGroupOutputError>) -> Void)
```
