# ChimeSdkMessagingClientProtocol

The Amazon Chime SDK Messaging APIs in this section allow software developers to send and receive messages in custom messaging applications. These APIs depend on the frameworks provided by the Amazon Chime SDK Identity APIs. For more information about the messaging APIs, see [Amazon Chime SDK messaging](https://docs.aws.amazon.com/chime/latest/APIReference/API_Operations_Amazon_Chime_SDK_Messaging)

``` swift
public protocol ChimeSdkMessagingClientProtocol 
```

## Requirements

### batchCreateChannelMembership(input:completion:)

Adds a specified number of users to a channel.

``` swift
func batchCreateChannelMembership(input: BatchCreateChannelMembershipInput, completion: @escaping (ClientRuntime.SdkResult<BatchCreateChannelMembershipOutputResponse, BatchCreateChannelMembershipOutputError>) -> Void)
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

### getChannelMessage(input:completion:)

Gets the full details of a channel message. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
func getChannelMessage(input: GetChannelMessageInput, completion: @escaping (ClientRuntime.SdkResult<GetChannelMessageOutputResponse, GetChannelMessageOutputError>) -> Void)
```

### getMessagingSessionEndpoint(input:completion:)

The details of the endpoint for the messaging session.

``` swift
func getMessagingSessionEndpoint(input: GetMessagingSessionEndpointInput, completion: @escaping (ClientRuntime.SdkResult<GetMessagingSessionEndpointOutputResponse, GetMessagingSessionEndpointOutputError>) -> Void)
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

### redactChannelMessage(input:completion:)

Redacts message content, but not metadata. The message exists in the back end, but the action returns null content, and the state shows as redacted. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header.

``` swift
func redactChannelMessage(input: RedactChannelMessageInput, completion: @escaping (ClientRuntime.SdkResult<RedactChannelMessageOutputResponse, RedactChannelMessageOutputError>) -> Void)
```

### sendChannelMessage(input:completion:)

Sends a message to a particular channel that the member is a part of. The x-amz-chime-bearer request header is mandatory. Use the AppInstanceUserArn of the user that makes the API call as the value in the header. Also, STANDARD messages can contain 4KB of data and the 1KB of metadata. CONTROL messages can contain 30 bytes of data and no metadata.

``` swift
func sendChannelMessage(input: SendChannelMessageInput, completion: @escaping (ClientRuntime.SdkResult<SendChannelMessageOutputResponse, SendChannelMessageOutputError>) -> Void)
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
