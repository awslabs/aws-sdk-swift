# ChimeClient

``` swift
public class ChimeClient 
```

## Inheritance

[`ChimeClientProtocol`](/aws-sdk-swift/reference/0.x/AWSChime/ChimeClientProtocol)

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
public static let clientName = "ChimeClient"
```

## Methods

### `associatePhoneNumberWithUser(input:completion:)`

Associates a phone number with the specified Amazon Chime user.

``` swift
public func associatePhoneNumberWithUser(input: AssociatePhoneNumberWithUserInput, completion: @escaping (ClientRuntime.SdkResult<AssociatePhoneNumberWithUserOutputResponse, AssociatePhoneNumberWithUserOutputError>) -> Void)
```

### `associatePhoneNumbersWithVoiceConnector(input:completion:)`

Associates phone numbers with the specified Amazon Chime Voice Connector.

``` swift
public func associatePhoneNumbersWithVoiceConnector(input: AssociatePhoneNumbersWithVoiceConnectorInput, completion: @escaping (ClientRuntime.SdkResult<AssociatePhoneNumbersWithVoiceConnectorOutputResponse, AssociatePhoneNumbersWithVoiceConnectorOutputError>) -> Void)
```

### `associatePhoneNumbersWithVoiceConnectorGroup(input:completion:)`

Associates phone numbers with the specified Amazon Chime Voice Connector group.

``` swift
public func associatePhoneNumbersWithVoiceConnectorGroup(input: AssociatePhoneNumbersWithVoiceConnectorGroupInput, completion: @escaping (ClientRuntime.SdkResult<AssociatePhoneNumbersWithVoiceConnectorGroupOutputResponse, AssociatePhoneNumbersWithVoiceConnectorGroupOutputError>) -> Void)
```

### `associateSigninDelegateGroupsWithAccount(input:completion:)`

Associates the specified sign-in delegate groups with the specified Amazon Chime account.

``` swift
public func associateSigninDelegateGroupsWithAccount(input: AssociateSigninDelegateGroupsWithAccountInput, completion: @escaping (ClientRuntime.SdkResult<AssociateSigninDelegateGroupsWithAccountOutputResponse, AssociateSigninDelegateGroupsWithAccountOutputError>) -> Void)
```

### `batchCreateAttendee(input:completion:)`

Creates up to 100 new attendees for an active Amazon Chime SDK meeting. For more information about the Amazon Chime SDK, see [Using the Amazon Chime SDK](https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html) in the Amazon Chime Developer Guide.

``` swift
public func batchCreateAttendee(input: BatchCreateAttendeeInput, completion: @escaping (ClientRuntime.SdkResult<BatchCreateAttendeeOutputResponse, BatchCreateAttendeeOutputError>) -> Void)
```

### `batchCreateChannelMembership(input:completion:)`

Adds a specified number of users to a channel.

``` swift
public func batchCreateChannelMembership(input: BatchCreateChannelMembershipInput, completion: @escaping (ClientRuntime.SdkResult<BatchCreateChannelMembershipOutputResponse, BatchCreateChannelMembershipOutputError>) -> Void)
```

### `batchCreateRoomMembership(input:completion:)`

Adds up to 50 members to a chat room in an Amazon Chime Enterprise account. Members can be users or bots. The member role designates whether the member is a chat room administrator or a general chat room member.

``` swift
public func batchCreateRoomMembership(input: BatchCreateRoomMembershipInput, completion: @escaping (ClientRuntime.SdkResult<BatchCreateRoomMembershipOutputResponse, BatchCreateRoomMembershipOutputError>) -> Void)
```

### `batchDeletePhoneNumber(input:completion:)`

Moves phone numbers into the Deletion queue. Phone numbers must be disassociated from any users or Amazon Chime Voice Connectors before they can be deleted. Phone numbers remain in the Deletion queue for 7 days before they are deleted permanently.

``` swift
public func batchDeletePhoneNumber(input: BatchDeletePhoneNumberInput, completion: @escaping (ClientRuntime.SdkResult<BatchDeletePhoneNumberOutputResponse, BatchDeletePhoneNumberOutputError>) -> Void)
```

### `batchSuspendUser(input:completion:)`

Suspends up to 50 users from a Team or EnterpriseLWA Amazon Chime account. For more information about different account types, see [Managing Your Amazon Chime Accounts](https://docs.aws.amazon.com/chime/latest/ag/manage-chime-account.html) in the Amazon Chime Administration Guide. Users suspended from a Team account are disassociated from the account,but they can continue to use Amazon Chime as free users. To remove the suspension from suspended Team account users, invite them to the Team account again. You can use the \[InviteUsers\] action to do so. Users suspended from an EnterpriseLWA account are immediately signed out of Amazon Chime and can no longer sign in. To remove the suspension from suspended EnterpriseLWA account users, use the \[BatchUnsuspendUser\] action. To sign out users without suspending them, use the \[LogoutUser\] action.

``` swift
public func batchSuspendUser(input: BatchSuspendUserInput, completion: @escaping (ClientRuntime.SdkResult<BatchSuspendUserOutputResponse, BatchSuspendUserOutputError>) -> Void)
```

### `batchUnsuspendUser(input:completion:)`

Removes the suspension from up to 50 previously suspended users for the specified Amazon Chime EnterpriseLWA account. Only users on EnterpriseLWA accounts can be unsuspended using this action. For more information about different account types, see [ Managing Your Amazon Chime Accounts ](https://docs.aws.amazon.com/chime/latest/ag/manage-chime-account.html) in the account types, in the Amazon Chime Administration Guide. Previously suspended users who are unsuspended using this action are returned to Registered status. Users who are not previously suspended are ignored.

``` swift
public func batchUnsuspendUser(input: BatchUnsuspendUserInput, completion: @escaping (ClientRuntime.SdkResult<BatchUnsuspendUserOutputResponse, BatchUnsuspendUserOutputError>) -> Void)
```

### `batchUpdatePhoneNumber(input:completion:)`

Updates phone number product types or calling names. You can update one attribute at a time for each UpdatePhoneNumberRequestItem. For example, you can update the product type or the calling name. For toll-free numbers, you cannot use the Amazon Chime Business Calling product type. For numbers outside the U.S., you must use the Amazon Chime SIP Media Application Dial-In product type. Updates to outbound calling names can take up to 72 hours to complete. Pending updates to outbound calling names must be complete before you can request another update.

``` swift
public func batchUpdatePhoneNumber(input: BatchUpdatePhoneNumberInput, completion: @escaping (ClientRuntime.SdkResult<BatchUpdatePhoneNumberOutputResponse, BatchUpdatePhoneNumberOutputError>) -> Void)
```

### `batchUpdateUser(input:completion:)`

Updates user details within the \[UpdateUserRequestItem\] object for up to 20 users for the specified Amazon Chime account. Currently, only LicenseType updates are supported for this action.

``` swift
public func batchUpdateUser(input: BatchUpdateUserInput, completion: @escaping (ClientRuntime.SdkResult<BatchUpdateUserOutputResponse, BatchUpdateUserOutputError>) -> Void)
```

### `createAccount(input:completion:)`

Creates an Amazon Chime account under the administrator's AWS account. Only Team account types are currently supported for this action. For more information about different account types, see [Managing Your Amazon Chime Accounts](https://docs.aws.amazon.com/chime/latest/ag/manage-chime-account.html) in the Amazon Chime Administration Guide.

``` swift
public func createAccount(input: CreateAccountInput, completion: @escaping (ClientRuntime.SdkResult<CreateAccountOutputResponse, CreateAccountOutputError>) -> Void)
```

### `createAppInstance(input:completion:)`

Creates an Amazon Chime SDK messaging AppInstance under an AWS account. Only SDK messaging customers use this API. CreateAppInstance supports idempotency behavior as described in the AWS API Standard.

``` swift
public func createAppInstance(input: CreateAppInstanceInput, completion: @escaping (ClientRuntime.SdkResult<CreateAppInstanceOutputResponse, CreateAppInstanceOutputError>) -> Void)
```

### `createAppInstanceAdmin(input:completion:)`

Promotes an AppInstanceUser to an AppInstanceAdmin. The promoted user can perform the following actions.

``` swift
public func createAppInstanceAdmin(input: CreateAppInstanceAdminInput, completion: @escaping (ClientRuntime.SdkResult<CreateAppInstanceAdminOutputResponse, CreateAppInstanceAdminOutputError>) -> Void)
```

  - ChannelModerator actions across all channels in the AppInstance.

  - DeleteChannelMessage actions.

Only an AppInstanceUser can be promoted to an AppInstanceAdmin role.

### `createAppInstanceUser(input:completion:)`

Creates a user under an Amazon Chime AppInstance. The request consists of a unique appInstanceUserId and Name for that user.

``` swift
public func createAppInstanceUser(input: CreateAppInstanceUserInput, completion: @escaping (ClientRuntime.SdkResult<CreateAppInstanceUserOutputResponse, CreateAppInstanceUserOutputError>) -> Void)
```

### `createAttendee(input:completion:)`

Creates a new attendee for an active Amazon Chime SDK meeting. For more information about the Amazon Chime SDK, see [Using the Amazon Chime SDK](https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html) in the Amazon Chime Developer Guide.

``` swift
public func createAttendee(input: CreateAttendeeInput, completion: @escaping (ClientRuntime.SdkResult<CreateAttendeeOutputResponse, CreateAttendeeOutputError>) -> Void)
```

### `createBot(input:completion:)`

Creates a bot for an Amazon Chime Enterprise account.

``` swift
public func createBot(input: CreateBotInput, completion: @escaping (ClientRuntime.SdkResult<CreateBotOutputResponse, CreateBotOutputError>) -> Void)
```

### `createChannel(input:completion:)`

Creates a channel to which you can add users and send messages. Restriction: You can't change a channel's privacy. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
public func createChannel(input: CreateChannelInput, completion: @escaping (ClientRuntime.SdkResult<CreateChannelOutputResponse, CreateChannelOutputError>) -> Void)
```

### `createChannelBan(input:completion:)`

Permanently bans a member from a channel. Moderators can't add banned members to a channel. To undo a ban, you first have to DeleteChannelBan, and then CreateChannelMembership. Bans are cleaned up when you delete users or channels. If you ban a user who is already part of a channel, that user is automatically kicked from the channel. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
public func createChannelBan(input: CreateChannelBanInput, completion: @escaping (ClientRuntime.SdkResult<CreateChannelBanOutputResponse, CreateChannelBanOutputError>) -> Void)
```

### `createChannelMembership(input:completion:)`

Adds a user to a channel. The InvitedBy response field is derived from the request header. A channel member can:

``` swift
public func createChannelMembership(input: CreateChannelMembershipInput, completion: @escaping (ClientRuntime.SdkResult<CreateChannelMembershipOutputResponse, CreateChannelMembershipOutputError>) -> Void)
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

### `createChannelModerator(input:completion:)`

Creates a new ChannelModerator. A channel moderator can:

``` swift
public func createChannelModerator(input: CreateChannelModeratorInput, completion: @escaping (ClientRuntime.SdkResult<CreateChannelModeratorOutputResponse, CreateChannelModeratorOutputError>) -> Void)
```

  - Add and remove other members of the channel.

  - Add and remove other moderators of the channel.

  - Add and remove user bans for the channel.

  - Redact messages in the channel.

  - List messages in the channel.

The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

### `createMediaCapturePipeline(input:completion:)`

Creates a media capture pipeline.

``` swift
public func createMediaCapturePipeline(input: CreateMediaCapturePipelineInput, completion: @escaping (ClientRuntime.SdkResult<CreateMediaCapturePipelineOutputResponse, CreateMediaCapturePipelineOutputError>) -> Void)
```

### `createMeeting(input:completion:)`

Creates a new Amazon Chime SDK meeting in the specified media Region with no initial attendees. For more information about specifying media Regions, see [Amazon Chime SDK Media Regions](https://docs.aws.amazon.com/chime/latest/dg/chime-sdk-meetings-regions.html) in the Amazon Chime Developer Guide . For more information about the Amazon Chime SDK, see [Using the Amazon Chime SDK](https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html) in the Amazon Chime Developer Guide .

``` swift
public func createMeeting(input: CreateMeetingInput, completion: @escaping (ClientRuntime.SdkResult<CreateMeetingOutputResponse, CreateMeetingOutputError>) -> Void)
```

### `createMeetingDialOut(input:completion:)`

Uses the join token and call metadata in a meeting request (From number, To number, and so forth) to initiate an outbound call to a public switched telephone network (PSTN) and join them into a Chime meeting. Also ensures that the From number belongs to the customer. To play welcome audio or implement an interactive voice response (IVR), use the CreateSipMediaApplicationCall action with the corresponding SIP media application ID.

``` swift
public func createMeetingDialOut(input: CreateMeetingDialOutInput, completion: @escaping (ClientRuntime.SdkResult<CreateMeetingDialOutOutputResponse, CreateMeetingDialOutOutputError>) -> Void)
```

### `createMeetingWithAttendees(input:completion:)`

Creates a new Amazon Chime SDK meeting in the specified media Region, with attendees. For more information about specifying media Regions, see [Amazon Chime SDK Media Regions](https://docs.aws.amazon.com/chime/latest/dg/chime-sdk-meetings-regions.html) in the Amazon Chime Developer Guide . For more information about the Amazon Chime SDK, see [Using the Amazon Chime SDK](https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html) in the Amazon Chime Developer Guide .

``` swift
public func createMeetingWithAttendees(input: CreateMeetingWithAttendeesInput, completion: @escaping (ClientRuntime.SdkResult<CreateMeetingWithAttendeesOutputResponse, CreateMeetingWithAttendeesOutputError>) -> Void)
```

### `createPhoneNumberOrder(input:completion:)`

Creates an order for phone numbers to be provisioned. For toll-free numbers, you cannot use the Amazon Chime Business Calling product type. For numbers outside the U.S., you must use the Amazon Chime SIP Media Application Dial-In product type.

``` swift
public func createPhoneNumberOrder(input: CreatePhoneNumberOrderInput, completion: @escaping (ClientRuntime.SdkResult<CreatePhoneNumberOrderOutputResponse, CreatePhoneNumberOrderOutputError>) -> Void)
```

### `createProxySession(input:completion:)`

Creates a proxy session on the specified Amazon Chime Voice Connector for the specified participant phone numbers.

``` swift
public func createProxySession(input: CreateProxySessionInput, completion: @escaping (ClientRuntime.SdkResult<CreateProxySessionOutputResponse, CreateProxySessionOutputError>) -> Void)
```

### `createRoom(input:completion:)`

Creates a chat room for the specified Amazon Chime Enterprise account.

``` swift
public func createRoom(input: CreateRoomInput, completion: @escaping (ClientRuntime.SdkResult<CreateRoomOutputResponse, CreateRoomOutputError>) -> Void)
```

### `createRoomMembership(input:completion:)`

Adds a member to a chat room in an Amazon Chime Enterprise account. A member can be either a user or a bot. The member role designates whether the member is a chat room administrator or a general chat room member.

``` swift
public func createRoomMembership(input: CreateRoomMembershipInput, completion: @escaping (ClientRuntime.SdkResult<CreateRoomMembershipOutputResponse, CreateRoomMembershipOutputError>) -> Void)
```

### `createSipMediaApplication(input:completion:)`

Creates a SIP media application.

``` swift
public func createSipMediaApplication(input: CreateSipMediaApplicationInput, completion: @escaping (ClientRuntime.SdkResult<CreateSipMediaApplicationOutputResponse, CreateSipMediaApplicationOutputError>) -> Void)
```

### `createSipMediaApplicationCall(input:completion:)`

Creates an outbound call to a phone number from the phone number specified in the request, and it invokes the endpoint of the specified sipMediaApplicationId.

``` swift
public func createSipMediaApplicationCall(input: CreateSipMediaApplicationCallInput, completion: @escaping (ClientRuntime.SdkResult<CreateSipMediaApplicationCallOutputResponse, CreateSipMediaApplicationCallOutputError>) -> Void)
```

### `createSipRule(input:completion:)`

Creates a SIP rule which can be used to run a SIP media application as a target for a specific trigger type.

``` swift
public func createSipRule(input: CreateSipRuleInput, completion: @escaping (ClientRuntime.SdkResult<CreateSipRuleOutputResponse, CreateSipRuleOutputError>) -> Void)
```

### `createUser(input:completion:)`

Creates a user under the specified Amazon Chime account.

``` swift
public func createUser(input: CreateUserInput, completion: @escaping (ClientRuntime.SdkResult<CreateUserOutputResponse, CreateUserOutputError>) -> Void)
```

### `createVoiceConnector(input:completion:)`

Creates an Amazon Chime Voice Connector under the administrator's AWS account. You can choose to create an Amazon Chime Voice Connector in a specific AWS Region. Enabling \[CreateVoiceConnectorRequest$RequireEncryption\] configures your Amazon Chime Voice Connector to use TLS transport for SIP signaling and Secure RTP (SRTP) for media. Inbound calls use TLS transport, and unencrypted outbound calls are blocked.

``` swift
public func createVoiceConnector(input: CreateVoiceConnectorInput, completion: @escaping (ClientRuntime.SdkResult<CreateVoiceConnectorOutputResponse, CreateVoiceConnectorOutputError>) -> Void)
```

### `createVoiceConnectorGroup(input:completion:)`

Creates an Amazon Chime Voice Connector group under the administrator's AWS account. You can associate Amazon Chime Voice Connectors with the Amazon Chime Voice Connector group by including VoiceConnectorItems in the request. You can include Amazon Chime Voice Connectors from different AWS Regions in your group. This creates a fault tolerant mechanism for fallback in case of availability events.

``` swift
public func createVoiceConnectorGroup(input: CreateVoiceConnectorGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateVoiceConnectorGroupOutputResponse, CreateVoiceConnectorGroupOutputError>) -> Void)
```

### `deleteAccount(input:completion:)`

Deletes the specified Amazon Chime account. You must suspend all users before deleting Team account. You can use the \[BatchSuspendUser\] action to dodo. For EnterpriseLWA and EnterpriseAD accounts, you must release the claimed domains for your Amazon Chime account before deletion. As soon as you release the domain, all users under that account are suspended. Deleted accounts appear in your Disabled accounts list for 90 days. To restore deleted account from your Disabled accounts list, you must contact AWS Support. After 90 days, deleted accounts are permanently removed from your Disabled accounts list.

``` swift
public func deleteAccount(input: DeleteAccountInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAccountOutputResponse, DeleteAccountOutputError>) -> Void)
```

### `deleteAppInstance(input:completion:)`

Deletes an AppInstance and all associated data asynchronously.

``` swift
public func deleteAppInstance(input: DeleteAppInstanceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAppInstanceOutputResponse, DeleteAppInstanceOutputError>) -> Void)
```

### `deleteAppInstanceAdmin(input:completion:)`

Demotes an AppInstanceAdmin to an AppInstanceUser. This action does not delete the user.

``` swift
public func deleteAppInstanceAdmin(input: DeleteAppInstanceAdminInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAppInstanceAdminOutputResponse, DeleteAppInstanceAdminOutputError>) -> Void)
```

### `deleteAppInstanceStreamingConfigurations(input:completion:)`

Deletes the streaming configurations of an AppInstance.

``` swift
public func deleteAppInstanceStreamingConfigurations(input: DeleteAppInstanceStreamingConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAppInstanceStreamingConfigurationsOutputResponse, DeleteAppInstanceStreamingConfigurationsOutputError>) -> Void)
```

### `deleteAppInstanceUser(input:completion:)`

Deletes an AppInstanceUser.

``` swift
public func deleteAppInstanceUser(input: DeleteAppInstanceUserInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAppInstanceUserOutputResponse, DeleteAppInstanceUserOutputError>) -> Void)
```

### `deleteAttendee(input:completion:)`

Deletes an attendee from the specified Amazon Chime SDK meeting and deletes their JoinToken. Attendees are automatically deleted when a Amazon Chime SDK meeting is deleted. For more information about the Amazon Chime SDK, see [Using the Amazon Chime SDK](https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html) in the Amazon Chime Developer Guide.

``` swift
public func deleteAttendee(input: DeleteAttendeeInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAttendeeOutputResponse, DeleteAttendeeOutputError>) -> Void)
```

### `deleteChannel(input:completion:)`

Immediately makes a channel and its memberships inaccessible and marks them for deletion. This is an irreversible process. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
public func deleteChannel(input: DeleteChannelInput, completion: @escaping (ClientRuntime.SdkResult<DeleteChannelOutputResponse, DeleteChannelOutputError>) -> Void)
```

### `deleteChannelBan(input:completion:)`

Removes a user from a channel's ban list. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
public func deleteChannelBan(input: DeleteChannelBanInput, completion: @escaping (ClientRuntime.SdkResult<DeleteChannelBanOutputResponse, DeleteChannelBanOutputError>) -> Void)
```

### `deleteChannelMembership(input:completion:)`

Removes a member from a channel. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
public func deleteChannelMembership(input: DeleteChannelMembershipInput, completion: @escaping (ClientRuntime.SdkResult<DeleteChannelMembershipOutputResponse, DeleteChannelMembershipOutputError>) -> Void)
```

### `deleteChannelMessage(input:completion:)`

Deletes a channel message. Only admins can perform this action. Deletion makes messages inaccessible immediately. A background process deletes any revisions created by UpdateChannelMessage. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
public func deleteChannelMessage(input: DeleteChannelMessageInput, completion: @escaping (ClientRuntime.SdkResult<DeleteChannelMessageOutputResponse, DeleteChannelMessageOutputError>) -> Void)
```

### `deleteChannelModerator(input:completion:)`

Deletes a channel moderator. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
public func deleteChannelModerator(input: DeleteChannelModeratorInput, completion: @escaping (ClientRuntime.SdkResult<DeleteChannelModeratorOutputResponse, DeleteChannelModeratorOutputError>) -> Void)
```

### `deleteEventsConfiguration(input:completion:)`

Deletes the events configuration that allows a bot to receive outgoing events.

``` swift
public func deleteEventsConfiguration(input: DeleteEventsConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteEventsConfigurationOutputResponse, DeleteEventsConfigurationOutputError>) -> Void)
```

### `deleteMediaCapturePipeline(input:completion:)`

Deletes the media capture pipeline.

``` swift
public func deleteMediaCapturePipeline(input: DeleteMediaCapturePipelineInput, completion: @escaping (ClientRuntime.SdkResult<DeleteMediaCapturePipelineOutputResponse, DeleteMediaCapturePipelineOutputError>) -> Void)
```

### `deleteMeeting(input:completion:)`

Deletes the specified Amazon Chime SDK meeting. The operation deletes all attendees, disconnects all clients, and prevents new clients from joining the meeting. For more information about the Amazon Chime SDK, see [Using the Amazon Chime SDK](https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html) in the Amazon Chime Developer Guide.

``` swift
public func deleteMeeting(input: DeleteMeetingInput, completion: @escaping (ClientRuntime.SdkResult<DeleteMeetingOutputResponse, DeleteMeetingOutputError>) -> Void)
```

### `deletePhoneNumber(input:completion:)`

Moves the specified phone number into the Deletion queue. A phone number must be disassociated from any users or Amazon Chime Voice Connectors before it can be deleted. Deleted phone numbers remain in the Deletion queue for 7 days before they are deleted permanently.

``` swift
public func deletePhoneNumber(input: DeletePhoneNumberInput, completion: @escaping (ClientRuntime.SdkResult<DeletePhoneNumberOutputResponse, DeletePhoneNumberOutputError>) -> Void)
```

### `deleteProxySession(input:completion:)`

Deletes the specified proxy session from the specified Amazon Chime Voice Connector.

``` swift
public func deleteProxySession(input: DeleteProxySessionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteProxySessionOutputResponse, DeleteProxySessionOutputError>) -> Void)
```

### `deleteRoom(input:completion:)`

Deletes a chat room in an Amazon Chime Enterprise account.

``` swift
public func deleteRoom(input: DeleteRoomInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRoomOutputResponse, DeleteRoomOutputError>) -> Void)
```

### `deleteRoomMembership(input:completion:)`

Removes a member from a chat room in an Amazon Chime Enterprise account.

``` swift
public func deleteRoomMembership(input: DeleteRoomMembershipInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRoomMembershipOutputResponse, DeleteRoomMembershipOutputError>) -> Void)
```

### `deleteSipMediaApplication(input:completion:)`

Deletes a SIP media application.

``` swift
public func deleteSipMediaApplication(input: DeleteSipMediaApplicationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSipMediaApplicationOutputResponse, DeleteSipMediaApplicationOutputError>) -> Void)
```

### `deleteSipRule(input:completion:)`

Deletes a SIP rule. You must disable a SIP rule before you can delete it.

``` swift
public func deleteSipRule(input: DeleteSipRuleInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSipRuleOutputResponse, DeleteSipRuleOutputError>) -> Void)
```

### `deleteVoiceConnector(input:completion:)`

Deletes the specified Amazon Chime Voice Connector. Any phone numbers associated with the Amazon Chime Voice Connector must be disassociated from it before it can be deleted.

``` swift
public func deleteVoiceConnector(input: DeleteVoiceConnectorInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVoiceConnectorOutputResponse, DeleteVoiceConnectorOutputError>) -> Void)
```

### `deleteVoiceConnectorEmergencyCallingConfiguration(input:completion:)`

Deletes the emergency calling configuration details from the specified Amazon Chime Voice Connector.

``` swift
public func deleteVoiceConnectorEmergencyCallingConfiguration(input: DeleteVoiceConnectorEmergencyCallingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVoiceConnectorEmergencyCallingConfigurationOutputResponse, DeleteVoiceConnectorEmergencyCallingConfigurationOutputError>) -> Void)
```

### `deleteVoiceConnectorGroup(input:completion:)`

Deletes the specified Amazon Chime Voice Connector group. Any VoiceConnectorItems and phone numbers associated with the group must be removed before it can be deleted.

``` swift
public func deleteVoiceConnectorGroup(input: DeleteVoiceConnectorGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVoiceConnectorGroupOutputResponse, DeleteVoiceConnectorGroupOutputError>) -> Void)
```

### `deleteVoiceConnectorOrigination(input:completion:)`

Deletes the origination settings for the specified Amazon Chime Voice Connector. If emergency calling is configured for the Amazon Chime Voice Connector, it must be deleted prior to deleting the origination settings.

``` swift
public func deleteVoiceConnectorOrigination(input: DeleteVoiceConnectorOriginationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVoiceConnectorOriginationOutputResponse, DeleteVoiceConnectorOriginationOutputError>) -> Void)
```

### `deleteVoiceConnectorProxy(input:completion:)`

Deletes the proxy configuration from the specified Amazon Chime Voice Connector.

``` swift
public func deleteVoiceConnectorProxy(input: DeleteVoiceConnectorProxyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVoiceConnectorProxyOutputResponse, DeleteVoiceConnectorProxyOutputError>) -> Void)
```

### `deleteVoiceConnectorStreamingConfiguration(input:completion:)`

Deletes the streaming configuration for the specified Amazon Chime Voice Connector.

``` swift
public func deleteVoiceConnectorStreamingConfiguration(input: DeleteVoiceConnectorStreamingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVoiceConnectorStreamingConfigurationOutputResponse, DeleteVoiceConnectorStreamingConfigurationOutputError>) -> Void)
```

### `deleteVoiceConnectorTermination(input:completion:)`

Deletes the termination settings for the specified Amazon Chime Voice Connector. If emergency calling is configured for the Amazon Chime Voice Connector, it must be deleted prior to deleting the termination settings.

``` swift
public func deleteVoiceConnectorTermination(input: DeleteVoiceConnectorTerminationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVoiceConnectorTerminationOutputResponse, DeleteVoiceConnectorTerminationOutputError>) -> Void)
```

### `deleteVoiceConnectorTerminationCredentials(input:completion:)`

Deletes the specified SIP credentials used by your equipment to authenticate during call termination.

``` swift
public func deleteVoiceConnectorTerminationCredentials(input: DeleteVoiceConnectorTerminationCredentialsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVoiceConnectorTerminationCredentialsOutputResponse, DeleteVoiceConnectorTerminationCredentialsOutputError>) -> Void)
```

### `describeAppInstance(input:completion:)`

Returns the full details of an AppInstance.

``` swift
public func describeAppInstance(input: DescribeAppInstanceInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAppInstanceOutputResponse, DescribeAppInstanceOutputError>) -> Void)
```

### `describeAppInstanceAdmin(input:completion:)`

Returns the full details of an AppInstanceAdmin.

``` swift
public func describeAppInstanceAdmin(input: DescribeAppInstanceAdminInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAppInstanceAdminOutputResponse, DescribeAppInstanceAdminOutputError>) -> Void)
```

### `describeAppInstanceUser(input:completion:)`

Returns the full details of an AppInstanceUser.

``` swift
public func describeAppInstanceUser(input: DescribeAppInstanceUserInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAppInstanceUserOutputResponse, DescribeAppInstanceUserOutputError>) -> Void)
```

### `describeChannel(input:completion:)`

Returns the full details of a channel in an Amazon Chime AppInstance. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
public func describeChannel(input: DescribeChannelInput, completion: @escaping (ClientRuntime.SdkResult<DescribeChannelOutputResponse, DescribeChannelOutputError>) -> Void)
```

### `describeChannelBan(input:completion:)`

Returns the full details of a channel ban. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
public func describeChannelBan(input: DescribeChannelBanInput, completion: @escaping (ClientRuntime.SdkResult<DescribeChannelBanOutputResponse, DescribeChannelBanOutputError>) -> Void)
```

### `describeChannelMembership(input:completion:)`

Returns the full details of a user's channel membership. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
public func describeChannelMembership(input: DescribeChannelMembershipInput, completion: @escaping (ClientRuntime.SdkResult<DescribeChannelMembershipOutputResponse, DescribeChannelMembershipOutputError>) -> Void)
```

### `describeChannelMembershipForAppInstanceUser(input:completion:)`

Returns the details of a channel based on the membership of the specified AppInstanceUser. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
public func describeChannelMembershipForAppInstanceUser(input: DescribeChannelMembershipForAppInstanceUserInput, completion: @escaping (ClientRuntime.SdkResult<DescribeChannelMembershipForAppInstanceUserOutputResponse, DescribeChannelMembershipForAppInstanceUserOutputError>) -> Void)
```

### `describeChannelModeratedByAppInstanceUser(input:completion:)`

Returns the full details of a channel moderated by the specified AppInstanceUser. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
public func describeChannelModeratedByAppInstanceUser(input: DescribeChannelModeratedByAppInstanceUserInput, completion: @escaping (ClientRuntime.SdkResult<DescribeChannelModeratedByAppInstanceUserOutputResponse, DescribeChannelModeratedByAppInstanceUserOutputError>) -> Void)
```

### `describeChannelModerator(input:completion:)`

Returns the full details of a single ChannelModerator. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
public func describeChannelModerator(input: DescribeChannelModeratorInput, completion: @escaping (ClientRuntime.SdkResult<DescribeChannelModeratorOutputResponse, DescribeChannelModeratorOutputError>) -> Void)
```

### `disassociatePhoneNumberFromUser(input:completion:)`

Disassociates the primary provisioned phone number from the specified Amazon Chime user.

``` swift
public func disassociatePhoneNumberFromUser(input: DisassociatePhoneNumberFromUserInput, completion: @escaping (ClientRuntime.SdkResult<DisassociatePhoneNumberFromUserOutputResponse, DisassociatePhoneNumberFromUserOutputError>) -> Void)
```

### `disassociatePhoneNumbersFromVoiceConnector(input:completion:)`

Disassociates the specified phone numbers from the specified Amazon Chime Voice Connector.

``` swift
public func disassociatePhoneNumbersFromVoiceConnector(input: DisassociatePhoneNumbersFromVoiceConnectorInput, completion: @escaping (ClientRuntime.SdkResult<DisassociatePhoneNumbersFromVoiceConnectorOutputResponse, DisassociatePhoneNumbersFromVoiceConnectorOutputError>) -> Void)
```

### `disassociatePhoneNumbersFromVoiceConnectorGroup(input:completion:)`

Disassociates the specified phone numbers from the specified Amazon Chime Voice Connector group.

``` swift
public func disassociatePhoneNumbersFromVoiceConnectorGroup(input: DisassociatePhoneNumbersFromVoiceConnectorGroupInput, completion: @escaping (ClientRuntime.SdkResult<DisassociatePhoneNumbersFromVoiceConnectorGroupOutputResponse, DisassociatePhoneNumbersFromVoiceConnectorGroupOutputError>) -> Void)
```

### `disassociateSigninDelegateGroupsFromAccount(input:completion:)`

Disassociates the specified sign-in delegate groups from the specified Amazon Chime account.

``` swift
public func disassociateSigninDelegateGroupsFromAccount(input: DisassociateSigninDelegateGroupsFromAccountInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateSigninDelegateGroupsFromAccountOutputResponse, DisassociateSigninDelegateGroupsFromAccountOutputError>) -> Void)
```

### `getAccount(input:completion:)`

Retrieves details for the specified Amazon Chime account, such as account type and supported licenses.

``` swift
public func getAccount(input: GetAccountInput, completion: @escaping (ClientRuntime.SdkResult<GetAccountOutputResponse, GetAccountOutputError>) -> Void)
```

### `getAccountSettings(input:completion:)`

Retrieves account settings for the specified Amazon Chime account ID, such as remote control and dialout settings. For more information about these settings, see [Use the Policies Page](https://docs.aws.amazon.com/chime/latest/ag/policies.html) in the Amazon Chime Administration Guide.

``` swift
public func getAccountSettings(input: GetAccountSettingsInput, completion: @escaping (ClientRuntime.SdkResult<GetAccountSettingsOutputResponse, GetAccountSettingsOutputError>) -> Void)
```

### `getAppInstanceRetentionSettings(input:completion:)`

Gets the retention settings for an AppInstance.

``` swift
public func getAppInstanceRetentionSettings(input: GetAppInstanceRetentionSettingsInput, completion: @escaping (ClientRuntime.SdkResult<GetAppInstanceRetentionSettingsOutputResponse, GetAppInstanceRetentionSettingsOutputError>) -> Void)
```

### `getAppInstanceStreamingConfigurations(input:completion:)`

Gets the streaming settings for an AppInstance.

``` swift
public func getAppInstanceStreamingConfigurations(input: GetAppInstanceStreamingConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<GetAppInstanceStreamingConfigurationsOutputResponse, GetAppInstanceStreamingConfigurationsOutputError>) -> Void)
```

### `getAttendee(input:completion:)`

Gets the Amazon Chime SDK attendee details for a specified meeting ID and attendee ID. For more information about the Amazon Chime SDK, see [Using the Amazon Chime SDK](https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html) in the Amazon Chime Developer Guide .

``` swift
public func getAttendee(input: GetAttendeeInput, completion: @escaping (ClientRuntime.SdkResult<GetAttendeeOutputResponse, GetAttendeeOutputError>) -> Void)
```

### `getBot(input:completion:)`

Retrieves details for the specified bot, such as bot email address, bot type, status, and display name.

``` swift
public func getBot(input: GetBotInput, completion: @escaping (ClientRuntime.SdkResult<GetBotOutputResponse, GetBotOutputError>) -> Void)
```

### `getChannelMessage(input:completion:)`

Gets the full details of a channel message. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
public func getChannelMessage(input: GetChannelMessageInput, completion: @escaping (ClientRuntime.SdkResult<GetChannelMessageOutputResponse, GetChannelMessageOutputError>) -> Void)
```

### `getEventsConfiguration(input:completion:)`

Gets details for an events configuration that allows a bot to receive outgoing events, such as an HTTPS endpoint or Lambda function ARN.

``` swift
public func getEventsConfiguration(input: GetEventsConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetEventsConfigurationOutputResponse, GetEventsConfigurationOutputError>) -> Void)
```

### `getGlobalSettings(input:completion:)`

Retrieves global settings for the administrator's AWS account, such as Amazon Chime Business Calling and Amazon Chime Voice Connector settings.

``` swift
public func getGlobalSettings(input: GetGlobalSettingsInput, completion: @escaping (ClientRuntime.SdkResult<GetGlobalSettingsOutputResponse, GetGlobalSettingsOutputError>) -> Void)
```

### `getMediaCapturePipeline(input:completion:)`

Gets an existing media capture pipeline.

``` swift
public func getMediaCapturePipeline(input: GetMediaCapturePipelineInput, completion: @escaping (ClientRuntime.SdkResult<GetMediaCapturePipelineOutputResponse, GetMediaCapturePipelineOutputError>) -> Void)
```

### `getMeeting(input:completion:)`

Gets the Amazon Chime SDK meeting details for the specified meeting ID. For more information about the Amazon Chime SDK, see [Using the Amazon Chime SDK](https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html) in the Amazon Chime Developer Guide .

``` swift
public func getMeeting(input: GetMeetingInput, completion: @escaping (ClientRuntime.SdkResult<GetMeetingOutputResponse, GetMeetingOutputError>) -> Void)
```

### `getMessagingSessionEndpoint(input:completion:)`

The details of the endpoint for the messaging session.

``` swift
public func getMessagingSessionEndpoint(input: GetMessagingSessionEndpointInput, completion: @escaping (ClientRuntime.SdkResult<GetMessagingSessionEndpointOutputResponse, GetMessagingSessionEndpointOutputError>) -> Void)
```

### `getPhoneNumber(input:completion:)`

Retrieves details for the specified phone number ID, such as associations, capabilities, and product type.

``` swift
public func getPhoneNumber(input: GetPhoneNumberInput, completion: @escaping (ClientRuntime.SdkResult<GetPhoneNumberOutputResponse, GetPhoneNumberOutputError>) -> Void)
```

### `getPhoneNumberOrder(input:completion:)`

Retrieves details for the specified phone number order, such as the order creation timestamp, phone numbers in E.164 format, product type, and order status.

``` swift
public func getPhoneNumberOrder(input: GetPhoneNumberOrderInput, completion: @escaping (ClientRuntime.SdkResult<GetPhoneNumberOrderOutputResponse, GetPhoneNumberOrderOutputError>) -> Void)
```

### `getPhoneNumberSettings(input:completion:)`

Retrieves the phone number settings for the administrator's AWS account, such as the default outbound calling name.

``` swift
public func getPhoneNumberSettings(input: GetPhoneNumberSettingsInput, completion: @escaping (ClientRuntime.SdkResult<GetPhoneNumberSettingsOutputResponse, GetPhoneNumberSettingsOutputError>) -> Void)
```

### `getProxySession(input:completion:)`

Gets the specified proxy session details for the specified Amazon Chime Voice Connector.

``` swift
public func getProxySession(input: GetProxySessionInput, completion: @escaping (ClientRuntime.SdkResult<GetProxySessionOutputResponse, GetProxySessionOutputError>) -> Void)
```

### `getRetentionSettings(input:completion:)`

Gets the retention settings for the specified Amazon Chime Enterprise account. For more information about retention settings, see [Managing Chat Retention Policies](https://docs.aws.amazon.com/chime/latest/ag/chat-retention.html) in the Amazon Chime Administration Guide.

``` swift
public func getRetentionSettings(input: GetRetentionSettingsInput, completion: @escaping (ClientRuntime.SdkResult<GetRetentionSettingsOutputResponse, GetRetentionSettingsOutputError>) -> Void)
```

### `getRoom(input:completion:)`

Retrieves room details, such as the room name, for a room in an Amazon Chime Enterprise account.

``` swift
public func getRoom(input: GetRoomInput, completion: @escaping (ClientRuntime.SdkResult<GetRoomOutputResponse, GetRoomOutputError>) -> Void)
```

### `getSipMediaApplication(input:completion:)`

Retrieves the information for a SIP media application, including name, AWS Region, and endpoints.

``` swift
public func getSipMediaApplication(input: GetSipMediaApplicationInput, completion: @escaping (ClientRuntime.SdkResult<GetSipMediaApplicationOutputResponse, GetSipMediaApplicationOutputError>) -> Void)
```

### `getSipMediaApplicationLoggingConfiguration(input:completion:)`

Returns the logging configuration for the specified SIP media application.

``` swift
public func getSipMediaApplicationLoggingConfiguration(input: GetSipMediaApplicationLoggingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetSipMediaApplicationLoggingConfigurationOutputResponse, GetSipMediaApplicationLoggingConfigurationOutputError>) -> Void)
```

### `getSipRule(input:completion:)`

Retrieves the details of a SIP rule, such as the rule ID, name, triggers, and target endpoints.

``` swift
public func getSipRule(input: GetSipRuleInput, completion: @escaping (ClientRuntime.SdkResult<GetSipRuleOutputResponse, GetSipRuleOutputError>) -> Void)
```

### `getUser(input:completion:)`

Retrieves details for the specified user ID, such as primary email address, license type,and personal meeting PIN. To retrieve user details with an email address instead of a user ID, use the \[ListUsers\] action, and then filter by email address.

``` swift
public func getUser(input: GetUserInput, completion: @escaping (ClientRuntime.SdkResult<GetUserOutputResponse, GetUserOutputError>) -> Void)
```

### `getUserSettings(input:completion:)`

Retrieves settings for the specified user ID, such as any associated phone number settings.

``` swift
public func getUserSettings(input: GetUserSettingsInput, completion: @escaping (ClientRuntime.SdkResult<GetUserSettingsOutputResponse, GetUserSettingsOutputError>) -> Void)
```

### `getVoiceConnector(input:completion:)`

Retrieves details for the specified Amazon Chime Voice Connector, such as timestamps,name, outbound host, and encryption requirements.

``` swift
public func getVoiceConnector(input: GetVoiceConnectorInput, completion: @escaping (ClientRuntime.SdkResult<GetVoiceConnectorOutputResponse, GetVoiceConnectorOutputError>) -> Void)
```

### `getVoiceConnectorEmergencyCallingConfiguration(input:completion:)`

Gets the emergency calling configuration details for the specified Amazon Chime Voice Connector.

``` swift
public func getVoiceConnectorEmergencyCallingConfiguration(input: GetVoiceConnectorEmergencyCallingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetVoiceConnectorEmergencyCallingConfigurationOutputResponse, GetVoiceConnectorEmergencyCallingConfigurationOutputError>) -> Void)
```

### `getVoiceConnectorGroup(input:completion:)`

Retrieves details for the specified Amazon Chime Voice Connector group, such as timestamps,name, and associated VoiceConnectorItems.

``` swift
public func getVoiceConnectorGroup(input: GetVoiceConnectorGroupInput, completion: @escaping (ClientRuntime.SdkResult<GetVoiceConnectorGroupOutputResponse, GetVoiceConnectorGroupOutputError>) -> Void)
```

### `getVoiceConnectorLoggingConfiguration(input:completion:)`

Retrieves the logging configuration details for the specified Amazon Chime Voice Connector. Shows whether SIP message logs are enabled for sending to Amazon CloudWatch Logs.

``` swift
public func getVoiceConnectorLoggingConfiguration(input: GetVoiceConnectorLoggingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetVoiceConnectorLoggingConfigurationOutputResponse, GetVoiceConnectorLoggingConfigurationOutputError>) -> Void)
```

### `getVoiceConnectorOrigination(input:completion:)`

Retrieves origination setting details for the specified Amazon Chime Voice Connector.

``` swift
public func getVoiceConnectorOrigination(input: GetVoiceConnectorOriginationInput, completion: @escaping (ClientRuntime.SdkResult<GetVoiceConnectorOriginationOutputResponse, GetVoiceConnectorOriginationOutputError>) -> Void)
```

### `getVoiceConnectorProxy(input:completion:)`

Gets the proxy configuration details for the specified Amazon Chime Voice Connector.

``` swift
public func getVoiceConnectorProxy(input: GetVoiceConnectorProxyInput, completion: @escaping (ClientRuntime.SdkResult<GetVoiceConnectorProxyOutputResponse, GetVoiceConnectorProxyOutputError>) -> Void)
```

### `getVoiceConnectorStreamingConfiguration(input:completion:)`

Retrieves the streaming configuration details for the specified Amazon Chime Voice Connector. Shows whether media streaming is enabled for sending to Amazon Kinesis. It also shows the retention period, in hours, for the Amazon Kinesis data.

``` swift
public func getVoiceConnectorStreamingConfiguration(input: GetVoiceConnectorStreamingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetVoiceConnectorStreamingConfigurationOutputResponse, GetVoiceConnectorStreamingConfigurationOutputError>) -> Void)
```

### `getVoiceConnectorTermination(input:completion:)`

Retrieves termination setting details for the specified Amazon Chime Voice Connector.

``` swift
public func getVoiceConnectorTermination(input: GetVoiceConnectorTerminationInput, completion: @escaping (ClientRuntime.SdkResult<GetVoiceConnectorTerminationOutputResponse, GetVoiceConnectorTerminationOutputError>) -> Void)
```

### `getVoiceConnectorTerminationHealth(input:completion:)`

Retrieves information about the last time a SIP OPTIONS ping was received from your SIP infrastructure for the specified Amazon Chime Voice Connector.

``` swift
public func getVoiceConnectorTerminationHealth(input: GetVoiceConnectorTerminationHealthInput, completion: @escaping (ClientRuntime.SdkResult<GetVoiceConnectorTerminationHealthOutputResponse, GetVoiceConnectorTerminationHealthOutputError>) -> Void)
```

### `inviteUsers(input:completion:)`

Sends email to a maximum of 50 users, inviting them to the specified Amazon Chime Team account. Only Team account types are currently supported for this action.

``` swift
public func inviteUsers(input: InviteUsersInput, completion: @escaping (ClientRuntime.SdkResult<InviteUsersOutputResponse, InviteUsersOutputError>) -> Void)
```

### `listAccounts(input:completion:)`

Lists the Amazon Chime accounts under the administrator's AWS account. You can filter accounts by account name prefix. To find out which Amazon Chime account a user belongs to, you can filter by the user's email address, which returns one account result.

``` swift
public func listAccounts(input: ListAccountsInput, completion: @escaping (ClientRuntime.SdkResult<ListAccountsOutputResponse, ListAccountsOutputError>) -> Void)
```

### `listAppInstanceAdmins(input:completion:)`

Returns a list of the administrators in the AppInstance.

``` swift
public func listAppInstanceAdmins(input: ListAppInstanceAdminsInput, completion: @escaping (ClientRuntime.SdkResult<ListAppInstanceAdminsOutputResponse, ListAppInstanceAdminsOutputError>) -> Void)
```

### `listAppInstanceUsers(input:completion:)`

List all AppInstanceUsers created under a single AppInstance.

``` swift
public func listAppInstanceUsers(input: ListAppInstanceUsersInput, completion: @escaping (ClientRuntime.SdkResult<ListAppInstanceUsersOutputResponse, ListAppInstanceUsersOutputError>) -> Void)
```

### `listAppInstances(input:completion:)`

Lists all Amazon Chime AppInstances created under a single AWS account.

``` swift
public func listAppInstances(input: ListAppInstancesInput, completion: @escaping (ClientRuntime.SdkResult<ListAppInstancesOutputResponse, ListAppInstancesOutputError>) -> Void)
```

### `listAttendeeTags(input:completion:)`

Lists the tags applied to an Amazon Chime SDK attendee resource.

``` swift
public func listAttendeeTags(input: ListAttendeeTagsInput, completion: @escaping (ClientRuntime.SdkResult<ListAttendeeTagsOutputResponse, ListAttendeeTagsOutputError>) -> Void)
```

### `listAttendees(input:completion:)`

Lists the attendees for the specified Amazon Chime SDK meeting. For more information about the Amazon Chime SDK, see [Using the Amazon Chime SDK](https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html) in the Amazon Chime Developer Guide.

``` swift
public func listAttendees(input: ListAttendeesInput, completion: @escaping (ClientRuntime.SdkResult<ListAttendeesOutputResponse, ListAttendeesOutputError>) -> Void)
```

### `listBots(input:completion:)`

Lists the bots associated with the administrator's Amazon Chime Enterprise account ID.

``` swift
public func listBots(input: ListBotsInput, completion: @escaping (ClientRuntime.SdkResult<ListBotsOutputResponse, ListBotsOutputError>) -> Void)
```

### `listChannelBans(input:completion:)`

Lists all the users banned from a particular channel. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
public func listChannelBans(input: ListChannelBansInput, completion: @escaping (ClientRuntime.SdkResult<ListChannelBansOutputResponse, ListChannelBansOutputError>) -> Void)
```

### `listChannelMemberships(input:completion:)`

Lists all channel memberships in a channel. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
public func listChannelMemberships(input: ListChannelMembershipsInput, completion: @escaping (ClientRuntime.SdkResult<ListChannelMembershipsOutputResponse, ListChannelMembershipsOutputError>) -> Void)
```

### `listChannelMembershipsForAppInstanceUser(input:completion:)`

Lists all channels that a particular AppInstanceUser is a part of. Only an AppInstanceAdmin can call the API with a user ARN that is not their own. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
public func listChannelMembershipsForAppInstanceUser(input: ListChannelMembershipsForAppInstanceUserInput, completion: @escaping (ClientRuntime.SdkResult<ListChannelMembershipsForAppInstanceUserOutputResponse, ListChannelMembershipsForAppInstanceUserOutputError>) -> Void)
```

### `listChannelMessages(input:completion:)`

List all the messages in a channel. Returns a paginated list of ChannelMessages. By default, sorted by creation timestamp in descending order. Redacted messages appear in the results as empty, since they are only redacted, not deleted. Deleted messages do not appear in the results. This action always returns the latest version of an edited message. Also, the x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
public func listChannelMessages(input: ListChannelMessagesInput, completion: @escaping (ClientRuntime.SdkResult<ListChannelMessagesOutputResponse, ListChannelMessagesOutputError>) -> Void)
```

### `listChannelModerators(input:completion:)`

Lists all the moderators for a channel. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
public func listChannelModerators(input: ListChannelModeratorsInput, completion: @escaping (ClientRuntime.SdkResult<ListChannelModeratorsOutputResponse, ListChannelModeratorsOutputError>) -> Void)
```

### `listChannels(input:completion:)`

Lists all Channels created under a single Chime App as a paginated list. You can specify filters to narrow results. Functionality & restrictions

``` swift
public func listChannels(input: ListChannelsInput, completion: @escaping (ClientRuntime.SdkResult<ListChannelsOutputResponse, ListChannelsOutputError>) -> Void)
```

  - Use privacy = PUBLIC to retrieve all public channels in the account.

  - Only an AppInstanceAdmin can set privacy = PRIVATE to list the private channels in an account.

The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

### `listChannelsModeratedByAppInstanceUser(input:completion:)`

A list of the channels moderated by an AppInstanceUser. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
public func listChannelsModeratedByAppInstanceUser(input: ListChannelsModeratedByAppInstanceUserInput, completion: @escaping (ClientRuntime.SdkResult<ListChannelsModeratedByAppInstanceUserOutputResponse, ListChannelsModeratedByAppInstanceUserOutputError>) -> Void)
```

### `listMediaCapturePipelines(input:completion:)`

Returns a list of media capture pipelines.

``` swift
public func listMediaCapturePipelines(input: ListMediaCapturePipelinesInput, completion: @escaping (ClientRuntime.SdkResult<ListMediaCapturePipelinesOutputResponse, ListMediaCapturePipelinesOutputError>) -> Void)
```

### `listMeetingTags(input:completion:)`

Lists the tags applied to an Amazon Chime SDK meeting resource.

``` swift
public func listMeetingTags(input: ListMeetingTagsInput, completion: @escaping (ClientRuntime.SdkResult<ListMeetingTagsOutputResponse, ListMeetingTagsOutputError>) -> Void)
```

### `listMeetings(input:completion:)`

Lists up to 100 active Amazon Chime SDK meetings. For more information about the Amazon Chime SDK, see [Using the Amazon Chime SDK](https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html) in the Amazon Chime Developer Guide.

``` swift
public func listMeetings(input: ListMeetingsInput, completion: @escaping (ClientRuntime.SdkResult<ListMeetingsOutputResponse, ListMeetingsOutputError>) -> Void)
```

### `listPhoneNumberOrders(input:completion:)`

Lists the phone number orders for the administrator's Amazon Chime account.

``` swift
public func listPhoneNumberOrders(input: ListPhoneNumberOrdersInput, completion: @escaping (ClientRuntime.SdkResult<ListPhoneNumberOrdersOutputResponse, ListPhoneNumberOrdersOutputError>) -> Void)
```

### `listPhoneNumbers(input:completion:)`

Lists the phone numbers for the specified Amazon Chime account, Amazon Chime user, Amazon Chime Voice Connector, or Amazon Chime Voice Connector group.

``` swift
public func listPhoneNumbers(input: ListPhoneNumbersInput, completion: @escaping (ClientRuntime.SdkResult<ListPhoneNumbersOutputResponse, ListPhoneNumbersOutputError>) -> Void)
```

### `listProxySessions(input:completion:)`

Lists the proxy sessions for the specified Amazon Chime Voice Connector.

``` swift
public func listProxySessions(input: ListProxySessionsInput, completion: @escaping (ClientRuntime.SdkResult<ListProxySessionsOutputResponse, ListProxySessionsOutputError>) -> Void)
```

### `listRoomMemberships(input:completion:)`

Lists the membership details for the specified room in an Amazon Chime Enterprise account, such as the members' IDs, email addresses, and names.

``` swift
public func listRoomMemberships(input: ListRoomMembershipsInput, completion: @escaping (ClientRuntime.SdkResult<ListRoomMembershipsOutputResponse, ListRoomMembershipsOutputError>) -> Void)
```

### `listRooms(input:completion:)`

Lists the room details for the specified Amazon Chime Enterprise account. Optionally, filter the results by a member ID (user ID or bot ID) to see a list of rooms that the member belongs to.

``` swift
public func listRooms(input: ListRoomsInput, completion: @escaping (ClientRuntime.SdkResult<ListRoomsOutputResponse, ListRoomsOutputError>) -> Void)
```

### `listSipMediaApplications(input:completion:)`

Lists the SIP media applications under the administrator's AWS account.

``` swift
public func listSipMediaApplications(input: ListSipMediaApplicationsInput, completion: @escaping (ClientRuntime.SdkResult<ListSipMediaApplicationsOutputResponse, ListSipMediaApplicationsOutputError>) -> Void)
```

### `listSipRules(input:completion:)`

Lists the SIP rules under the administrator's AWS account.

``` swift
public func listSipRules(input: ListSipRulesInput, completion: @escaping (ClientRuntime.SdkResult<ListSipRulesOutputResponse, ListSipRulesOutputError>) -> Void)
```

### `listSupportedPhoneNumberCountries(input:completion:)`

Lists supported phone number countries.

``` swift
public func listSupportedPhoneNumberCountries(input: ListSupportedPhoneNumberCountriesInput, completion: @escaping (ClientRuntime.SdkResult<ListSupportedPhoneNumberCountriesOutputResponse, ListSupportedPhoneNumberCountriesOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Lists the tags applied to an Amazon Chime SDK meeting resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `listUsers(input:completion:)`

Lists the users that belong to the specified Amazon Chime account. You can specify an email address to list only the user that the email address belongs to.

``` swift
public func listUsers(input: ListUsersInput, completion: @escaping (ClientRuntime.SdkResult<ListUsersOutputResponse, ListUsersOutputError>) -> Void)
```

### `listVoiceConnectorGroups(input:completion:)`

Lists the Amazon Chime Voice Connector groups for the administrator's AWS account.

``` swift
public func listVoiceConnectorGroups(input: ListVoiceConnectorGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListVoiceConnectorGroupsOutputResponse, ListVoiceConnectorGroupsOutputError>) -> Void)
```

### `listVoiceConnectorTerminationCredentials(input:completion:)`

Lists the SIP credentials for the specified Amazon Chime Voice Connector.

``` swift
public func listVoiceConnectorTerminationCredentials(input: ListVoiceConnectorTerminationCredentialsInput, completion: @escaping (ClientRuntime.SdkResult<ListVoiceConnectorTerminationCredentialsOutputResponse, ListVoiceConnectorTerminationCredentialsOutputError>) -> Void)
```

### `listVoiceConnectors(input:completion:)`

Lists the Amazon Chime Voice Connectors for the administrator's AWS account.

``` swift
public func listVoiceConnectors(input: ListVoiceConnectorsInput, completion: @escaping (ClientRuntime.SdkResult<ListVoiceConnectorsOutputResponse, ListVoiceConnectorsOutputError>) -> Void)
```

### `logoutUser(input:completion:)`

Logs out the specified user from all of the devices they are currently logged into.

``` swift
public func logoutUser(input: LogoutUserInput, completion: @escaping (ClientRuntime.SdkResult<LogoutUserOutputResponse, LogoutUserOutputError>) -> Void)
```

### `putAppInstanceRetentionSettings(input:completion:)`

Sets the amount of time in days that a given AppInstance retains data.

``` swift
public func putAppInstanceRetentionSettings(input: PutAppInstanceRetentionSettingsInput, completion: @escaping (ClientRuntime.SdkResult<PutAppInstanceRetentionSettingsOutputResponse, PutAppInstanceRetentionSettingsOutputError>) -> Void)
```

### `putAppInstanceStreamingConfigurations(input:completion:)`

The data streaming configurations of an AppInstance.

``` swift
public func putAppInstanceStreamingConfigurations(input: PutAppInstanceStreamingConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<PutAppInstanceStreamingConfigurationsOutputResponse, PutAppInstanceStreamingConfigurationsOutputError>) -> Void)
```

### `putEventsConfiguration(input:completion:)`

Creates an events configuration that allows a bot to receive outgoing events sent by Amazon Chime. Choose either an HTTPS endpoint or a Lambda function ARN. For more information, see \[Bot\].

``` swift
public func putEventsConfiguration(input: PutEventsConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<PutEventsConfigurationOutputResponse, PutEventsConfigurationOutputError>) -> Void)
```

### `putRetentionSettings(input:completion:)`

Puts retention settings for the specified Amazon Chime Enterprise account. We recommend using AWS CloudTrail to monitor usage of this API for your account. For more information, see [Logging Amazon Chime API Calls with AWS CloudTrail](https://docs.aws.amazon.com/chime/latest/ag/cloudtrail.html) in the Amazon Chime Administration Guide. To turn off existing retention settings, remove the number of days from the corresponding RetentionDays field in the RetentionSettings object. For more information about retention settings, see [Managing Chat Retention Policies](https://docs.aws.amazon.com/chime/latest/ag/chat-retention.html) in the Amazon Chime Administration Guide.

``` swift
public func putRetentionSettings(input: PutRetentionSettingsInput, completion: @escaping (ClientRuntime.SdkResult<PutRetentionSettingsOutputResponse, PutRetentionSettingsOutputError>) -> Void)
```

### `putSipMediaApplicationLoggingConfiguration(input:completion:)`

Updates the logging configuration for the specified SIP media application.

``` swift
public func putSipMediaApplicationLoggingConfiguration(input: PutSipMediaApplicationLoggingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<PutSipMediaApplicationLoggingConfigurationOutputResponse, PutSipMediaApplicationLoggingConfigurationOutputError>) -> Void)
```

### `putVoiceConnectorEmergencyCallingConfiguration(input:completion:)`

Puts emergency calling configuration details to the specified Amazon Chime Voice Connector, such as emergency phone numbers and calling countries. Origination and termination settings must be enabled for the Amazon Chime Voice Connector before emergency calling can be configured.

``` swift
public func putVoiceConnectorEmergencyCallingConfiguration(input: PutVoiceConnectorEmergencyCallingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<PutVoiceConnectorEmergencyCallingConfigurationOutputResponse, PutVoiceConnectorEmergencyCallingConfigurationOutputError>) -> Void)
```

### `putVoiceConnectorLoggingConfiguration(input:completion:)`

Adds a logging configuration for the specified Amazon Chime Voice Connector. The logging configuration specifies whether SIP message logs are enabled for sending to Amazon CloudWatch Logs.

``` swift
public func putVoiceConnectorLoggingConfiguration(input: PutVoiceConnectorLoggingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<PutVoiceConnectorLoggingConfigurationOutputResponse, PutVoiceConnectorLoggingConfigurationOutputError>) -> Void)
```

### `putVoiceConnectorOrigination(input:completion:)`

Adds origination settings for the specified Amazon Chime Voice Connector. If emergency calling is configured for the Amazon Chime Voice Connector, it must be deleted prior to turning off origination settings.

``` swift
public func putVoiceConnectorOrigination(input: PutVoiceConnectorOriginationInput, completion: @escaping (ClientRuntime.SdkResult<PutVoiceConnectorOriginationOutputResponse, PutVoiceConnectorOriginationOutputError>) -> Void)
```

### `putVoiceConnectorProxy(input:completion:)`

Puts the specified proxy configuration to the specified Amazon Chime Voice Connector.

``` swift
public func putVoiceConnectorProxy(input: PutVoiceConnectorProxyInput, completion: @escaping (ClientRuntime.SdkResult<PutVoiceConnectorProxyOutputResponse, PutVoiceConnectorProxyOutputError>) -> Void)
```

### `putVoiceConnectorStreamingConfiguration(input:completion:)`

Adds a streaming configuration for the specified Amazon Chime Voice Connector. The streaming configuration specifies whether media streaming is enabled for sending to Indonesians. It also sets the retention period, in hours, for the Amazon Kinesis data.

``` swift
public func putVoiceConnectorStreamingConfiguration(input: PutVoiceConnectorStreamingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<PutVoiceConnectorStreamingConfigurationOutputResponse, PutVoiceConnectorStreamingConfigurationOutputError>) -> Void)
```

### `putVoiceConnectorTermination(input:completion:)`

Adds termination settings for the specified Amazon Chime Voice Connector. If emergency calling is configured for the Amazon Chime Voice Connector, it must be deleted prior to turning off termination settings.

``` swift
public func putVoiceConnectorTermination(input: PutVoiceConnectorTerminationInput, completion: @escaping (ClientRuntime.SdkResult<PutVoiceConnectorTerminationOutputResponse, PutVoiceConnectorTerminationOutputError>) -> Void)
```

### `putVoiceConnectorTerminationCredentials(input:completion:)`

Adds termination SIP credentials for the specified Amazon Chime Voice Connector.

``` swift
public func putVoiceConnectorTerminationCredentials(input: PutVoiceConnectorTerminationCredentialsInput, completion: @escaping (ClientRuntime.SdkResult<PutVoiceConnectorTerminationCredentialsOutputResponse, PutVoiceConnectorTerminationCredentialsOutputError>) -> Void)
```

### `redactChannelMessage(input:completion:)`

Redacts message content, but not metadata. The message exists in the back end, but the action returns null content, and the state shows as redacted. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
public func redactChannelMessage(input: RedactChannelMessageInput, completion: @escaping (ClientRuntime.SdkResult<RedactChannelMessageOutputResponse, RedactChannelMessageOutputError>) -> Void)
```

### `redactConversationMessage(input:completion:)`

Redacts the specified message from the specified Amazon Chime conversation.

``` swift
public func redactConversationMessage(input: RedactConversationMessageInput, completion: @escaping (ClientRuntime.SdkResult<RedactConversationMessageOutputResponse, RedactConversationMessageOutputError>) -> Void)
```

### `redactRoomMessage(input:completion:)`

Redacts the specified message from the specified Amazon Chime channel.

``` swift
public func redactRoomMessage(input: RedactRoomMessageInput, completion: @escaping (ClientRuntime.SdkResult<RedactRoomMessageOutputResponse, RedactRoomMessageOutputError>) -> Void)
```

### `regenerateSecurityToken(input:completion:)`

Regenerates the security token for a bot.

``` swift
public func regenerateSecurityToken(input: RegenerateSecurityTokenInput, completion: @escaping (ClientRuntime.SdkResult<RegenerateSecurityTokenOutputResponse, RegenerateSecurityTokenOutputError>) -> Void)
```

### `resetPersonalPIN(input:completion:)`

Resets the personal meeting PIN for the specified user on an Amazon Chime account. Returns the \[User\] object with the updated personal meeting PIN.

``` swift
public func resetPersonalPIN(input: ResetPersonalPINInput, completion: @escaping (ClientRuntime.SdkResult<ResetPersonalPINOutputResponse, ResetPersonalPINOutputError>) -> Void)
```

### `restorePhoneNumber(input:completion:)`

Moves a phone number from the Deletion queue back into the phone number Inventory.

``` swift
public func restorePhoneNumber(input: RestorePhoneNumberInput, completion: @escaping (ClientRuntime.SdkResult<RestorePhoneNumberOutputResponse, RestorePhoneNumberOutputError>) -> Void)
```

### `searchAvailablePhoneNumbers(input:completion:)`

Searches for phone numbers that can be ordered. For US numbers, provide at least one of the following search filters: AreaCode, City, State, or TollFreePrefix. If you provide City, you must also provide State. Numbers outside the US only support the PhoneNumberType filter, which you must use.

``` swift
public func searchAvailablePhoneNumbers(input: SearchAvailablePhoneNumbersInput, completion: @escaping (ClientRuntime.SdkResult<SearchAvailablePhoneNumbersOutputResponse, SearchAvailablePhoneNumbersOutputError>) -> Void)
```

### `sendChannelMessage(input:completion:)`

Sends a message to a particular channel that the member is a part of. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header. Also, STANDARD messages can contain 4KB of data and the 1KB of metadata. CONTROL messages can contain 30 bytes of data and no metadata.

``` swift
public func sendChannelMessage(input: SendChannelMessageInput, completion: @escaping (ClientRuntime.SdkResult<SendChannelMessageOutputResponse, SendChannelMessageOutputError>) -> Void)
```

### `startMeetingTranscription(input:completion:)`

Starts transcription for the specified meetingId.

``` swift
public func startMeetingTranscription(input: StartMeetingTranscriptionInput, completion: @escaping (ClientRuntime.SdkResult<StartMeetingTranscriptionOutputResponse, StartMeetingTranscriptionOutputError>) -> Void)
```

### `stopMeetingTranscription(input:completion:)`

Stops transcription for the specified meetingId.

``` swift
public func stopMeetingTranscription(input: StopMeetingTranscriptionInput, completion: @escaping (ClientRuntime.SdkResult<StopMeetingTranscriptionOutputResponse, StopMeetingTranscriptionOutputError>) -> Void)
```

### `tagAttendee(input:completion:)`

Applies the specified tags to the specified Amazon Chime SDK attendee.

``` swift
public func tagAttendee(input: TagAttendeeInput, completion: @escaping (ClientRuntime.SdkResult<TagAttendeeOutputResponse, TagAttendeeOutputError>) -> Void)
```

### `tagMeeting(input:completion:)`

Applies the specified tags to the specified Amazon Chime SDK meeting.

``` swift
public func tagMeeting(input: TagMeetingInput, completion: @escaping (ClientRuntime.SdkResult<TagMeetingOutputResponse, TagMeetingOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Applies the specified tags to the specified Amazon Chime SDK meeting resource.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagAttendee(input:completion:)`

Untags the specified tags from the specified Amazon Chime SDK attendee.

``` swift
public func untagAttendee(input: UntagAttendeeInput, completion: @escaping (ClientRuntime.SdkResult<UntagAttendeeOutputResponse, UntagAttendeeOutputError>) -> Void)
```

### `untagMeeting(input:completion:)`

Untags the specified tags from the specified Amazon Chime SDK meeting.

``` swift
public func untagMeeting(input: UntagMeetingInput, completion: @escaping (ClientRuntime.SdkResult<UntagMeetingOutputResponse, UntagMeetingOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Untags the specified tags from the specified Amazon Chime SDK meeting resource.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateAccount(input:completion:)`

Updates account details for the specified Amazon Chime account. Currently, only account name and default license updates are supported for this action.

``` swift
public func updateAccount(input: UpdateAccountInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAccountOutputResponse, UpdateAccountOutputError>) -> Void)
```

### `updateAccountSettings(input:completion:)`

Updates the settings for the specified Amazon Chime account. You can update settings for remote control of shared screens, or for the dial-out option. For more information about these settings, see [Use the Policies Page](https://docs.aws.amazon.com/chime/latest/ag/policies.html) in the Amazon Chime Administration Guide.

``` swift
public func updateAccountSettings(input: UpdateAccountSettingsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAccountSettingsOutputResponse, UpdateAccountSettingsOutputError>) -> Void)
```

### `updateAppInstance(input:completion:)`

Updates AppInstance metadata.

``` swift
public func updateAppInstance(input: UpdateAppInstanceInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAppInstanceOutputResponse, UpdateAppInstanceOutputError>) -> Void)
```

### `updateAppInstanceUser(input:completion:)`

Updates the details of an AppInstanceUser. You can update names and metadata.

``` swift
public func updateAppInstanceUser(input: UpdateAppInstanceUserInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAppInstanceUserOutputResponse, UpdateAppInstanceUserOutputError>) -> Void)
```

### `updateBot(input:completion:)`

Updates the status of the specified bot, such as starting or stopping the bot from running in your Amazon Chime Enterprise account.

``` swift
public func updateBot(input: UpdateBotInput, completion: @escaping (ClientRuntime.SdkResult<UpdateBotOutputResponse, UpdateBotOutputError>) -> Void)
```

### `updateChannel(input:completion:)`

Update a channel's attributes. Restriction: You can't change a channel's privacy. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
public func updateChannel(input: UpdateChannelInput, completion: @escaping (ClientRuntime.SdkResult<UpdateChannelOutputResponse, UpdateChannelOutputError>) -> Void)
```

### `updateChannelMessage(input:completion:)`

Updates the content of a message. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
public func updateChannelMessage(input: UpdateChannelMessageInput, completion: @escaping (ClientRuntime.SdkResult<UpdateChannelMessageOutputResponse, UpdateChannelMessageOutputError>) -> Void)
```

### `updateChannelReadMarker(input:completion:)`

The details of the time when a user last read messages in a channel. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
public func updateChannelReadMarker(input: UpdateChannelReadMarkerInput, completion: @escaping (ClientRuntime.SdkResult<UpdateChannelReadMarkerOutputResponse, UpdateChannelReadMarkerOutputError>) -> Void)
```

### `updateGlobalSettings(input:completion:)`

Updates global settings for the administrator's AWS account, such as Amazon Chime Business Calling and Amazon Chime Voice Connector settings.

``` swift
public func updateGlobalSettings(input: UpdateGlobalSettingsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateGlobalSettingsOutputResponse, UpdateGlobalSettingsOutputError>) -> Void)
```

### `updatePhoneNumber(input:completion:)`

Updates phone number details, such as product type or calling name, for the specified phone number ID. You can update one phone number detail at a time. For example, you can update either the product type or the calling name in one action. For toll-free numbers, you cannot use the Amazon Chime Business Calling product type. For numbers outside the U.S., you must use the Amazon Chime SIP Media Application Dial-In product type. Updates to outbound calling names can take 72 hours to complete. Pending updates to outbound calling names must be complete before you can request another update.

``` swift
public func updatePhoneNumber(input: UpdatePhoneNumberInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePhoneNumberOutputResponse, UpdatePhoneNumberOutputError>) -> Void)
```

### `updatePhoneNumberSettings(input:completion:)`

Updates the phone number settings for the administrator's AWS account, such as the default outbound calling name. You can update the default outbound calling name once every seven days. Outbound calling names can take up to 72 hours to update.

``` swift
public func updatePhoneNumberSettings(input: UpdatePhoneNumberSettingsInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePhoneNumberSettingsOutputResponse, UpdatePhoneNumberSettingsOutputError>) -> Void)
```

### `updateProxySession(input:completion:)`

Updates the specified proxy session details, such as voice or SMS capabilities.

``` swift
public func updateProxySession(input: UpdateProxySessionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateProxySessionOutputResponse, UpdateProxySessionOutputError>) -> Void)
```

### `updateRoom(input:completion:)`

Updates room details, such as the room name, for a room in an Amazon Chime Enterprise account.

``` swift
public func updateRoom(input: UpdateRoomInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRoomOutputResponse, UpdateRoomOutputError>) -> Void)
```

### `updateRoomMembership(input:completion:)`

Updates room membership details, such as the member role, for a room in an Amazon Chime Enterprise account. The member role designates whether the member is a chat room administrator or a general chat room member. The member role can be updated only for user IDs.

``` swift
public func updateRoomMembership(input: UpdateRoomMembershipInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRoomMembershipOutputResponse, UpdateRoomMembershipOutputError>) -> Void)
```

### `updateSipMediaApplication(input:completion:)`

Updates the details of the specified SIP media application.

``` swift
public func updateSipMediaApplication(input: UpdateSipMediaApplicationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSipMediaApplicationOutputResponse, UpdateSipMediaApplicationOutputError>) -> Void)
```

### `updateSipMediaApplicationCall(input:completion:)`

Allows you to trigger a Lambda function at any time while a call is active, and replace the current actions with new actions returned by the invocation.

``` swift
public func updateSipMediaApplicationCall(input: UpdateSipMediaApplicationCallInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSipMediaApplicationCallOutputResponse, UpdateSipMediaApplicationCallOutputError>) -> Void)
```

### `updateSipRule(input:completion:)`

Updates the details of the specified SIP rule.

``` swift
public func updateSipRule(input: UpdateSipRuleInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSipRuleOutputResponse, UpdateSipRuleOutputError>) -> Void)
```

### `updateUser(input:completion:)`

Updates user details for a specified user ID. Currently, only LicenseType updates are supported for this action.

``` swift
public func updateUser(input: UpdateUserInput, completion: @escaping (ClientRuntime.SdkResult<UpdateUserOutputResponse, UpdateUserOutputError>) -> Void)
```

### `updateUserSettings(input:completion:)`

Updates the settings for the specified user, such as phone number settings.

``` swift
public func updateUserSettings(input: UpdateUserSettingsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateUserSettingsOutputResponse, UpdateUserSettingsOutputError>) -> Void)
```

### `updateVoiceConnector(input:completion:)`

Updates details for the specified Amazon Chime Voice Connector.

``` swift
public func updateVoiceConnector(input: UpdateVoiceConnectorInput, completion: @escaping (ClientRuntime.SdkResult<UpdateVoiceConnectorOutputResponse, UpdateVoiceConnectorOutputError>) -> Void)
```

### `updateVoiceConnectorGroup(input:completion:)`

Updates details of the specified Amazon Chime Voice Connector group, such as the name and Amazon Chime Voice Connector priority ranking.

``` swift
public func updateVoiceConnectorGroup(input: UpdateVoiceConnectorGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateVoiceConnectorGroupOutputResponse, UpdateVoiceConnectorGroupOutputError>) -> Void)
```
