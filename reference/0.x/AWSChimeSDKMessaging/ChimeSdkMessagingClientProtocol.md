# ChimeSdkMessagingClientProtocol

The Amazon Chime SDK Messaging APIs in this section allow software developers to send
and receive messages in custom messaging applications. These APIs depend on the frameworks
provided by the Amazon Chime SDK Identity APIs. For more information about the messaging
APIs, see <a href="https:​//docs.aws.amazon.com/chime/latest/APIReference/API_Operations_Amazon_Chime_SDK_Messaging">Amazon Chime SDK messaging

``` swift
public protocol ChimeSdkMessagingClientProtocol 
```

## Requirements

### batchCreateChannelMembership(input:​completion:​)

Adds a specified number of users to a channel.

``` swift
func batchCreateChannelMembership(input: BatchCreateChannelMembershipInput, completion: @escaping (ClientRuntime.SdkResult<BatchCreateChannelMembershipOutputResponse, BatchCreateChannelMembershipOutputError>) -> Void)
```

### createChannel(input:​completion:​)

Creates a channel to which you can add users and send messages.

``` swift
func createChannel(input: CreateChannelInput, completion: @escaping (ClientRuntime.SdkResult<CreateChannelOutputResponse, CreateChannelOutputError>) -> Void)
```

``` 
        Restriction: You can't change a channel's
     privacy.


        The x-amz-chime-bearer request header is mandatory. Use the
           AppInstanceUserArn of the user that makes the API call as the value in
        the header.
```

### createChannelBan(input:​completion:​)

Permanently bans a member from a channel. Moderators can't add banned members to a
channel. To undo a ban, you first have to DeleteChannelBan, and then
CreateChannelMembership. Bans are cleaned up when you delete users or
channels.
If you ban a user who is already part of a channel, that user is automatically kicked
from the channel.

``` swift
func createChannelBan(input: CreateChannelBanInput, completion: @escaping (ClientRuntime.SdkResult<CreateChannelBanOutputResponse, CreateChannelBanOutputError>) -> Void)
```

``` 
        The x-amz-chime-bearer request header is mandatory. Use the
           AppInstanceUserArn of the user that makes the API call as the value in
        the header.
```

### createChannelMembership(input:​completion:​)

Adds a user to a channel. The InvitedBy response field is derived from the
request header. A channel member can:​

``` swift
func createChannelMembership(input: CreateChannelMembershipInput, completion: @escaping (ClientRuntime.SdkResult<CreateChannelMembershipOutputResponse, CreateChannelMembershipOutputError>) -> Void)
```

``` 
           List messages


           Send messages


           Receive messages


           Edit their own messages


           Leave the channel



     Privacy settings impact this action as follows:



           Public Channels: You do not need to be a member to list messages, but you must be
           a member to send messages.


           Private Channels: You must be a member to list or send messages.




        The x-amz-chime-bearer request header is mandatory. Use the
           AppInstanceUserArn of the user that makes the API call as the value in
        the header.
```

### createChannelModerator(input:​completion:​)

Creates a new ChannelModerator. A channel moderator can:​

``` swift
func createChannelModerator(input: CreateChannelModeratorInput, completion: @escaping (ClientRuntime.SdkResult<CreateChannelModeratorOutputResponse, CreateChannelModeratorOutputError>) -> Void)
```

``` 
           Add and remove other members of the channel.


           Add and remove other moderators of the channel.


           Add and remove user bans for the channel.


           Redact messages in the channel.


           List messages in the channel.




        The x-amz-chime-bearer request header is mandatory. Use the
           AppInstanceUserArn of the user that makes the API call as the value in
        the header.
```

### deleteChannel(input:​completion:​)

Immediately makes a channel and its memberships inaccessible and marks them for
deletion. This is an irreversible process.

``` swift
func deleteChannel(input: DeleteChannelInput, completion: @escaping (ClientRuntime.SdkResult<DeleteChannelOutputResponse, DeleteChannelOutputError>) -> Void)
```

``` 
        The x-amz-chime-bearer request header is mandatory. Use the
           AppInstanceUserArn of the user that makes the API call as the value in
        the header.
```

### deleteChannelBan(input:​completion:​)

Removes a user from a channel's ban list.

``` swift
func deleteChannelBan(input: DeleteChannelBanInput, completion: @escaping (ClientRuntime.SdkResult<DeleteChannelBanOutputResponse, DeleteChannelBanOutputError>) -> Void)
```

``` 
        The x-amz-chime-bearer request header is mandatory. Use the
           AppInstanceUserArn of the user that makes the API call as the value in
        the header.
```

### deleteChannelMembership(input:​completion:​)

Removes a member from a channel.

``` swift
func deleteChannelMembership(input: DeleteChannelMembershipInput, completion: @escaping (ClientRuntime.SdkResult<DeleteChannelMembershipOutputResponse, DeleteChannelMembershipOutputError>) -> Void)
```

``` 
        The x-amz-chime-bearer request header is mandatory. Use the
           AppInstanceUserArn of the user that makes the API call as the value in
        the header.
```

### deleteChannelMessage(input:​completion:​)

Deletes a channel message. Only admins can perform this action. Deletion makes messages
inaccessible immediately. A background process deletes any revisions created by
UpdateChannelMessage.

``` swift
func deleteChannelMessage(input: DeleteChannelMessageInput, completion: @escaping (ClientRuntime.SdkResult<DeleteChannelMessageOutputResponse, DeleteChannelMessageOutputError>) -> Void)
```

``` 
        The x-amz-chime-bearer request header is mandatory. Use the
           AppInstanceUserArn of the user that makes the API call as the value in
        the header.
```

### deleteChannelModerator(input:​completion:​)

Deletes a channel moderator.

``` swift
func deleteChannelModerator(input: DeleteChannelModeratorInput, completion: @escaping (ClientRuntime.SdkResult<DeleteChannelModeratorOutputResponse, DeleteChannelModeratorOutputError>) -> Void)
```

``` 
        The x-amz-chime-bearer request header is mandatory. Use the
           AppInstanceUserArn of the user that makes the API call as the value in
        the header.
```

### describeChannel(input:​completion:​)

Returns the full details of a channel in an Amazon Chime
AppInstance.

``` swift
func describeChannel(input: DescribeChannelInput, completion: @escaping (ClientRuntime.SdkResult<DescribeChannelOutputResponse, DescribeChannelOutputError>) -> Void)
```

``` 
        The x-amz-chime-bearer request header is mandatory. Use the
           AppInstanceUserArn of the user that makes the API call as the value in
        the header.
```

### describeChannelBan(input:​completion:​)

Returns the full details of a channel ban.

``` swift
func describeChannelBan(input: DescribeChannelBanInput, completion: @escaping (ClientRuntime.SdkResult<DescribeChannelBanOutputResponse, DescribeChannelBanOutputError>) -> Void)
```

``` 
        The x-amz-chime-bearer request header is mandatory. Use the
           AppInstanceUserArn of the user that makes the API call as the value in
        the header.
```

### describeChannelMembership(input:​completion:​)

Returns the full details of a user's channel membership.

``` swift
func describeChannelMembership(input: DescribeChannelMembershipInput, completion: @escaping (ClientRuntime.SdkResult<DescribeChannelMembershipOutputResponse, DescribeChannelMembershipOutputError>) -> Void)
```

``` 
        The x-amz-chime-bearer request header is mandatory. Use the
           AppInstanceUserArn of the user that makes the API call as the value in
        the header.
```

### describeChannelMembershipForAppInstanceUser(input:​completion:​)

Returns the details of a channel based on the membership of the specified
AppInstanceUser.

``` swift
func describeChannelMembershipForAppInstanceUser(input: DescribeChannelMembershipForAppInstanceUserInput, completion: @escaping (ClientRuntime.SdkResult<DescribeChannelMembershipForAppInstanceUserOutputResponse, DescribeChannelMembershipForAppInstanceUserOutputError>) -> Void)
```

``` 
       The x-amz-chime-bearer request header is mandatory. Use the
          AppInstanceUserArn of the user that makes the API call as the value in
       the header.
```

### describeChannelModeratedByAppInstanceUser(input:​completion:​)

Returns the full details of a channel moderated by the specified
AppInstanceUser.

``` swift
func describeChannelModeratedByAppInstanceUser(input: DescribeChannelModeratedByAppInstanceUserInput, completion: @escaping (ClientRuntime.SdkResult<DescribeChannelModeratedByAppInstanceUserOutputResponse, DescribeChannelModeratedByAppInstanceUserOutputError>) -> Void)
```

``` 
        The x-amz-chime-bearer request header is mandatory. Use the
           AppInstanceUserArn of the user that makes the API call as the value in
        the header.
```

### describeChannelModerator(input:​completion:​)

Returns the full details of a single ChannelModerator.

``` swift
func describeChannelModerator(input: DescribeChannelModeratorInput, completion: @escaping (ClientRuntime.SdkResult<DescribeChannelModeratorOutputResponse, DescribeChannelModeratorOutputError>) -> Void)
```

``` 
        The x-amz-chime-bearer request header is mandatory. Use the
           AppInstanceUserArn of the user that makes the API call as the value in
        the header.
```

### getChannelMessage(input:​completion:​)

Gets the full details of a channel message.

``` swift
func getChannelMessage(input: GetChannelMessageInput, completion: @escaping (ClientRuntime.SdkResult<GetChannelMessageOutputResponse, GetChannelMessageOutputError>) -> Void)
```

``` 
        The x-amz-chime-bearer request header is mandatory. Use the
           AppInstanceUserArn of the user that makes the API call as the value in
        the header.
```

### getMessagingSessionEndpoint(input:​completion:​)

The details of the endpoint for the messaging session.

``` swift
func getMessagingSessionEndpoint(input: GetMessagingSessionEndpointInput, completion: @escaping (ClientRuntime.SdkResult<GetMessagingSessionEndpointOutputResponse, GetMessagingSessionEndpointOutputError>) -> Void)
```

### listChannelBans(input:​completion:​)

Lists all the users banned from a particular channel.

``` swift
func listChannelBans(input: ListChannelBansInput, completion: @escaping (ClientRuntime.SdkResult<ListChannelBansOutputResponse, ListChannelBansOutputError>) -> Void)
```

``` 
        The x-amz-chime-bearer request header is mandatory. Use the
           AppInstanceUserArn of the user that makes the API call as the value in
        the header.
```

### listChannelMemberships(input:​completion:​)

Lists all channel memberships in a channel.

``` swift
func listChannelMemberships(input: ListChannelMembershipsInput, completion: @escaping (ClientRuntime.SdkResult<ListChannelMembershipsOutputResponse, ListChannelMembershipsOutputError>) -> Void)
```

``` 
        The x-amz-chime-bearer request header is mandatory. Use the
           AppInstanceUserArn of the user that makes the API call as the value in
        the header.
```

### listChannelMembershipsForAppInstanceUser(input:​completion:​)

Lists all channels that a particular AppInstanceUser is a part of. Only an
AppInstanceAdmin can call the API with a user ARN that is not their own.

``` swift
func listChannelMembershipsForAppInstanceUser(input: ListChannelMembershipsForAppInstanceUserInput, completion: @escaping (ClientRuntime.SdkResult<ListChannelMembershipsForAppInstanceUserOutputResponse, ListChannelMembershipsForAppInstanceUserOutputError>) -> Void)
```

``` 
       The x-amz-chime-bearer request header is mandatory. Use the
          AppInstanceUserArn of the user that makes the API call as the value in
       the header.
```

### listChannelMessages(input:​completion:​)

List all the messages in a channel. Returns a paginated list of
ChannelMessages. By default, sorted by creation timestamp in descending
order.

``` swift
func listChannelMessages(input: ListChannelMessagesInput, completion: @escaping (ClientRuntime.SdkResult<ListChannelMessagesOutputResponse, ListChannelMessagesOutputError>) -> Void)
```

``` 
        Redacted messages appear in the results as empty, since they are only redacted, not
        deleted. Deleted messages do not appear in the results. This action always returns the
        latest version of an edited message.
        Also, the x-amz-chime-bearer request header is mandatory. Use the
           AppInstanceUserArn of the user that makes the API call as the value in
        the header.
```

### listChannelModerators(input:​completion:​)

Lists all the moderators for a channel.

``` swift
func listChannelModerators(input: ListChannelModeratorsInput, completion: @escaping (ClientRuntime.SdkResult<ListChannelModeratorsOutputResponse, ListChannelModeratorsOutputError>) -> Void)
```

``` 
        The x-amz-chime-bearer request header is mandatory. Use the
           AppInstanceUserArn of the user that makes the API call as the value in
        the header.
```

### listChannels(input:​completion:​)

Lists all Channels created under a single Chime App as a paginated list. You can specify
filters to narrow results.

``` swift
func listChannels(input: ListChannelsInput, completion: @escaping (ClientRuntime.SdkResult<ListChannelsOutputResponse, ListChannelsOutputError>) -> Void)
```

``` 
     <p class="title">
        Functionality & restrictions



           Use privacy = PUBLIC to retrieve all public channels in the
           account.


           Only an AppInstanceAdmin can set privacy = PRIVATE to
           list the private channels in an account.




        The x-amz-chime-bearer request header is mandatory. Use the
           AppInstanceUserArn of the user that makes the API call as the value in
        the header.
```

### listChannelsModeratedByAppInstanceUser(input:​completion:​)

A list of the channels moderated by an AppInstanceUser.

``` swift
func listChannelsModeratedByAppInstanceUser(input: ListChannelsModeratedByAppInstanceUserInput, completion: @escaping (ClientRuntime.SdkResult<ListChannelsModeratedByAppInstanceUserOutputResponse, ListChannelsModeratedByAppInstanceUserOutputError>) -> Void)
```

``` 
        The x-amz-chime-bearer request header is mandatory. Use the
           AppInstanceUserArn of the user that makes the API call as the value in
        the header.
```

### redactChannelMessage(input:​completion:​)

Redacts message content, but not metadata. The message exists in the back end, but the
action returns null content, and the state shows as redacted.

``` swift
func redactChannelMessage(input: RedactChannelMessageInput, completion: @escaping (ClientRuntime.SdkResult<RedactChannelMessageOutputResponse, RedactChannelMessageOutputError>) -> Void)
```

``` 
        The x-amz-chime-bearer request header is mandatory. Use the
           AppInstanceUserArn of the user that makes the API call as the value in
        the header.
```

### sendChannelMessage(input:​completion:​)

Sends a message to a particular channel that the member is a part of.

``` swift
func sendChannelMessage(input: SendChannelMessageInput, completion: @escaping (ClientRuntime.SdkResult<SendChannelMessageOutputResponse, SendChannelMessageOutputError>) -> Void)
```

``` 
        The x-amz-chime-bearer request header is mandatory. Use the
           AppInstanceUserArn of the user that makes the API call as the value in
        the header.

        Also, STANDARD messages can contain 4KB of data and the 1KB of metadata.
           CONTROL messages can contain 30 bytes of data and no metadata.
```

### updateChannel(input:​completion:​)

Update a channel's attributes.

``` swift
func updateChannel(input: UpdateChannelInput, completion: @escaping (ClientRuntime.SdkResult<UpdateChannelOutputResponse, UpdateChannelOutputError>) -> Void)
```

``` 
        Restriction: You can't change a channel's privacy.

        The x-amz-chime-bearer request header is mandatory. Use the
           AppInstanceUserArn of the user that makes the API call as the value in
        the header.
```

### updateChannelMessage(input:​completion:​)

Updates the content of a message.

``` swift
func updateChannelMessage(input: UpdateChannelMessageInput, completion: @escaping (ClientRuntime.SdkResult<UpdateChannelMessageOutputResponse, UpdateChannelMessageOutputError>) -> Void)
```

``` 
        The x-amz-chime-bearer request header is mandatory. Use the
           AppInstanceUserArn of the user that makes the API call as the value in
        the header.
```

### updateChannelReadMarker(input:​completion:​)

The details of the time when a user last read messages in a channel.

``` swift
func updateChannelReadMarker(input: UpdateChannelReadMarkerInput, completion: @escaping (ClientRuntime.SdkResult<UpdateChannelReadMarkerOutputResponse, UpdateChannelReadMarkerOutputError>) -> Void)
```

``` 
        The x-amz-chime-bearer request header is mandatory. Use the
           AppInstanceUserArn of the user that makes the API call as the value in
        the header.
```
