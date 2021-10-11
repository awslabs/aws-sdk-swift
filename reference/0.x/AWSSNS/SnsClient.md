# SnsClient

``` swift
public class SnsClient 
```

## Inheritance

[`SnsClientProtocol`](/aws-sdk-swift/reference/0.x/AWSSNS/SnsClientProtocol)

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

### `addPermission(input:completion:)`

Adds a statement to a topic's access control policy, granting access for the specified
accounts to the specified actions.

``` swift
public func addPermission(input: AddPermissionInput, completion: @escaping (ClientRuntime.SdkResult<AddPermissionOutputResponse, AddPermissionOutputError>) -> Void)
```

### `checkIfPhoneNumberIsOptedOut(input:completion:)`

Accepts a phone number and indicates whether the phone holder has opted out of
receiving SMS messages from your account. You cannot send SMS messages to a number that
is opted out.
To resume sending messages, you can opt in the number by using the
OptInPhoneNumber action.

``` swift
public func checkIfPhoneNumberIsOptedOut(input: CheckIfPhoneNumberIsOptedOutInput, completion: @escaping (ClientRuntime.SdkResult<CheckIfPhoneNumberIsOptedOutOutputResponse, CheckIfPhoneNumberIsOptedOutOutputError>) -> Void)
```

### `confirmSubscription(input:completion:)`

Verifies an endpoint owner's intent to receive messages by validating the token sent
to the endpoint by an earlier Subscribe action. If the token is valid, the
action creates a new subscription and returns its Amazon Resource Name (ARN). This call
requires an AWS signature only when the AuthenticateOnUnsubscribe flag is
set to "true".

``` swift
public func confirmSubscription(input: ConfirmSubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<ConfirmSubscriptionOutputResponse, ConfirmSubscriptionOutputError>) -> Void)
```

### `createPlatformApplication(input:completion:)`

Creates a platform application object for one of the supported push notification
services, such as APNS and GCM (Firebase Cloud Messaging), to which devices and mobile
apps may register. You must specify PlatformPrincipal and
PlatformCredential attributes when using the
CreatePlatformApplication action.

``` swift
public func createPlatformApplication(input: CreatePlatformApplicationInput, completion: @escaping (ClientRuntime.SdkResult<CreatePlatformApplicationOutputResponse, CreatePlatformApplicationOutputError>) -> Void)
```

``` 
        PlatformPrincipal and PlatformCredential are received from
        the notification service.


            For ADM, PlatformPrincipal is client id
                and PlatformCredential is client secret.


            For Baidu, PlatformPrincipal is API key
                and PlatformCredential is secret key.


            For APNS and APNS_SANDBOX,
                    PlatformPrincipal is SSL certificate and
                    PlatformCredential is private key.


            For GCM (Firebase Cloud Messaging), there is no
                    PlatformPrincipal and the PlatformCredential is
                    API key.


            For MPNS, PlatformPrincipal is TLS
                    certificate and PlatformCredential is private
                    key.


            For WNS, PlatformPrincipal is Package Security
                    Identifier and PlatformCredential is secret
                    key.


    You can use the returned PlatformApplicationArn as an attribute for the
            CreatePlatformEndpoint action.
```

### `createPlatformEndpoint(input:completion:)`

Creates an endpoint for a device and mobile app on one of the supported push
notification services, such as GCM (Firebase Cloud Messaging) and APNS.
CreatePlatformEndpoint requires the PlatformApplicationArn
that is returned from CreatePlatformApplication. You can use the returned
EndpointArn to send a message to a mobile app or by the
Subscribe action for subscription to a topic. The
CreatePlatformEndpoint action is idempotent, so if the requester
already owns an endpoint with the same device token and attributes, that endpoint's ARN
is returned without creating a new endpoint. For more information, see <a href="https:​//docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push
Notifications.
When using CreatePlatformEndpoint with Baidu, two attributes must be
provided:​ ChannelId and UserId. The token field must also contain the ChannelId. For
more information, see <a href="https:​//docs.aws.amazon.com/sns/latest/dg/SNSMobilePushBaiduEndpoint.html">Creating an Amazon SNS Endpoint
for Baidu.

``` swift
public func createPlatformEndpoint(input: CreatePlatformEndpointInput, completion: @escaping (ClientRuntime.SdkResult<CreatePlatformEndpointOutputResponse, CreatePlatformEndpointOutputError>) -> Void)
```

### `createSMSSandboxPhoneNumber(input:completion:)`

Adds a destination phone number to an account in the SMS sandbox and sends a
one-time password (OTP) to that phone number.
When you start using Amazon SNS to send SMS messages, your account is in the
SMS sandbox. The SMS sandbox provides a safe environment for
you to try Amazon SNS features without risking your reputation as an SMS sender. While your
account is in the SMS sandbox, you can use all of the features of Amazon SNS. However, you can send
SMS messages only to verified destination phone numbers. For more information, including how to
move out of the sandbox to send messages without restrictions,
see <a href="https:​//docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">SMS sandbox in
the Amazon SNS Developer Guide.

``` swift
public func createSMSSandboxPhoneNumber(input: CreateSMSSandboxPhoneNumberInput, completion: @escaping (ClientRuntime.SdkResult<CreateSMSSandboxPhoneNumberOutputResponse, CreateSMSSandboxPhoneNumberOutputError>) -> Void)
```

### `createTopic(input:completion:)`

Creates a topic to which notifications can be published. Users can create at most
100,000 standard topics (at most 1,000 FIFO topics). For more information, see <a href="https:​//docs.aws.amazon.com/sns/latest/dg/sns-create-topic.html">Creating an Amazon SNS
topic in the Amazon SNS Developer Guide. This action is
idempotent, so if the requester already owns a topic with the specified name, that
topic's ARN is returned without creating a new topic.

``` swift
public func createTopic(input: CreateTopicInput, completion: @escaping (ClientRuntime.SdkResult<CreateTopicOutputResponse, CreateTopicOutputError>) -> Void)
```

### `deleteEndpoint(input:completion:)`

Deletes the endpoint for a device and mobile app from Amazon SNS. This action is
idempotent. For more information, see <a href="https:​//docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push
Notifications.
When you delete an endpoint that is also subscribed to a topic, then you must also
unsubscribe the endpoint from the topic.

``` swift
public func deleteEndpoint(input: DeleteEndpointInput, completion: @escaping (ClientRuntime.SdkResult<DeleteEndpointOutputResponse, DeleteEndpointOutputError>) -> Void)
```

### `deletePlatformApplication(input:completion:)`

Deletes a platform application object for one of the supported push notification
services, such as APNS and GCM (Firebase Cloud Messaging). For more information, see
<a href="https:​//docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS
Mobile Push Notifications.

``` swift
public func deletePlatformApplication(input: DeletePlatformApplicationInput, completion: @escaping (ClientRuntime.SdkResult<DeletePlatformApplicationOutputResponse, DeletePlatformApplicationOutputError>) -> Void)
```

### `deleteSMSSandboxPhoneNumber(input:completion:)`

Deletes an account's verified or pending phone number from the SMS sandbox.
When you start using Amazon SNS to send SMS messages, your account is in the
SMS sandbox. The SMS sandbox provides a safe environment for
you to try Amazon SNS features without risking your reputation as an SMS sender. While your
account is in the SMS sandbox, you can use all of the features of Amazon SNS. However, you can send
SMS messages only to verified destination phone numbers. For more information, including how to
move out of the sandbox to send messages without restrictions,
see <a href="https:​//docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">SMS sandbox in
the Amazon SNS Developer Guide.

``` swift
public func deleteSMSSandboxPhoneNumber(input: DeleteSMSSandboxPhoneNumberInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSMSSandboxPhoneNumberOutputResponse, DeleteSMSSandboxPhoneNumberOutputError>) -> Void)
```

### `deleteTopic(input:completion:)`

Deletes a topic and all its subscriptions. Deleting a topic might prevent some
messages previously sent to the topic from being delivered to subscribers. This action
is idempotent, so deleting a topic that does not exist does not result in an
error.

``` swift
public func deleteTopic(input: DeleteTopicInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTopicOutputResponse, DeleteTopicOutputError>) -> Void)
```

### `getEndpointAttributes(input:completion:)`

Retrieves the endpoint attributes for a device on one of the supported push
notification services, such as GCM (Firebase Cloud Messaging) and APNS. For more
information, see <a href="https:​//docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications.

``` swift
public func getEndpointAttributes(input: GetEndpointAttributesInput, completion: @escaping (ClientRuntime.SdkResult<GetEndpointAttributesOutputResponse, GetEndpointAttributesOutputError>) -> Void)
```

### `getPlatformApplicationAttributes(input:completion:)`

Retrieves the attributes of the platform application object for the supported push
notification services, such as APNS and GCM (Firebase Cloud Messaging). For more
information, see <a href="https:​//docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications.

``` swift
public func getPlatformApplicationAttributes(input: GetPlatformApplicationAttributesInput, completion: @escaping (ClientRuntime.SdkResult<GetPlatformApplicationAttributesOutputResponse, GetPlatformApplicationAttributesOutputError>) -> Void)
```

### `getSMSAttributes(input:completion:)`

Returns the settings for sending SMS messages from your account.
These settings are set with the SetSMSAttributes action.

``` swift
public func getSMSAttributes(input: GetSMSAttributesInput, completion: @escaping (ClientRuntime.SdkResult<GetSMSAttributesOutputResponse, GetSMSAttributesOutputError>) -> Void)
```

### `getSMSSandboxAccountStatus(input:completion:)`

Retrieves the SMS sandbox status for the calling account in the target Region.
When you start using Amazon SNS to send SMS messages, your account is in the
SMS sandbox. The SMS sandbox provides a safe environment for
you to try Amazon SNS features without risking your reputation as an SMS sender. While your
account is in the SMS sandbox, you can use all of the features of Amazon SNS. However, you can send
SMS messages only to verified destination phone numbers. For more information, including how to
move out of the sandbox to send messages without restrictions,
see <a href="https:​//docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">SMS sandbox in
the Amazon SNS Developer Guide.

``` swift
public func getSMSSandboxAccountStatus(input: GetSMSSandboxAccountStatusInput, completion: @escaping (ClientRuntime.SdkResult<GetSMSSandboxAccountStatusOutputResponse, GetSMSSandboxAccountStatusOutputError>) -> Void)
```

### `getSubscriptionAttributes(input:completion:)`

Returns all of the properties of a subscription.

``` swift
public func getSubscriptionAttributes(input: GetSubscriptionAttributesInput, completion: @escaping (ClientRuntime.SdkResult<GetSubscriptionAttributesOutputResponse, GetSubscriptionAttributesOutputError>) -> Void)
```

### `getTopicAttributes(input:completion:)`

Returns all of the properties of a topic. Topic properties returned might differ based
on the authorization of the user.

``` swift
public func getTopicAttributes(input: GetTopicAttributesInput, completion: @escaping (ClientRuntime.SdkResult<GetTopicAttributesOutputResponse, GetTopicAttributesOutputError>) -> Void)
```

### `listEndpointsByPlatformApplication(input:completion:)`

Lists the endpoints and endpoint attributes for devices in a supported push
notification service, such as GCM (Firebase Cloud Messaging) and APNS. The results for
ListEndpointsByPlatformApplication are paginated and return a limited
list of endpoints, up to 100. If additional records are available after the first page
results, then a NextToken string will be returned. To receive the next page, you call
ListEndpointsByPlatformApplication again using the NextToken string
received from the previous call. When there are no more records to return, NextToken
will be null. For more information, see <a href="https:​//docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push
Notifications.
This action is throttled at 30 transactions per second (TPS).

``` swift
public func listEndpointsByPlatformApplication(input: ListEndpointsByPlatformApplicationInput, completion: @escaping (ClientRuntime.SdkResult<ListEndpointsByPlatformApplicationOutputResponse, ListEndpointsByPlatformApplicationOutputError>) -> Void)
```

### `listOriginationNumbers(input:completion:)`

Lists the calling account's dedicated origination numbers and their metadata. For
more information about origination numbers, see <a href="https:​//docs.aws.amazon.com/sns/latest/dg/channels-sms-originating-identities-origination-numbers.html">Origination numbers in the Amazon SNS Developer
Guide.

``` swift
public func listOriginationNumbers(input: ListOriginationNumbersInput, completion: @escaping (ClientRuntime.SdkResult<ListOriginationNumbersOutputResponse, ListOriginationNumbersOutputError>) -> Void)
```

### `listPhoneNumbersOptedOut(input:completion:)`

Returns a list of phone numbers that are opted out, meaning you cannot send SMS
messages to them.
The results for ListPhoneNumbersOptedOut are paginated, and each page
returns up to 100 phone numbers. If additional phone numbers are available after the
first page of results, then a NextToken string will be returned. To receive
the next page, you call ListPhoneNumbersOptedOut again using the
NextToken string received from the previous call. When there are no
more records to return, NextToken will be null.

``` swift
public func listPhoneNumbersOptedOut(input: ListPhoneNumbersOptedOutInput, completion: @escaping (ClientRuntime.SdkResult<ListPhoneNumbersOptedOutOutputResponse, ListPhoneNumbersOptedOutOutputError>) -> Void)
```

### `listPlatformApplications(input:completion:)`

Lists the platform application objects for the supported push notification services,
such as APNS and GCM (Firebase Cloud Messaging). The results for
ListPlatformApplications are paginated and return a limited list of
applications, up to 100. If additional records are available after the first page
results, then a NextToken string will be returned. To receive the next page, you call
ListPlatformApplications using the NextToken string received from the
previous call. When there are no more records to return, NextToken will be
null. For more information, see <a href="https:​//docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push
Notifications.
This action is throttled at 15 transactions per second (TPS).

``` swift
public func listPlatformApplications(input: ListPlatformApplicationsInput, completion: @escaping (ClientRuntime.SdkResult<ListPlatformApplicationsOutputResponse, ListPlatformApplicationsOutputError>) -> Void)
```

### `listSMSSandboxPhoneNumbers(input:completion:)`

Lists the calling account's current verified and pending destination phone numbers
in the SMS sandbox.
When you start using Amazon SNS to send SMS messages, your account is in the
SMS sandbox. The SMS sandbox provides a safe environment for
you to try Amazon SNS features without risking your reputation as an SMS sender. While your
account is in the SMS sandbox, you can use all of the features of Amazon SNS. However, you can send
SMS messages only to verified destination phone numbers. For more information, including how to
move out of the sandbox to send messages without restrictions,
see <a href="https:​//docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">SMS sandbox in
the Amazon SNS Developer Guide.

``` swift
public func listSMSSandboxPhoneNumbers(input: ListSMSSandboxPhoneNumbersInput, completion: @escaping (ClientRuntime.SdkResult<ListSMSSandboxPhoneNumbersOutputResponse, ListSMSSandboxPhoneNumbersOutputError>) -> Void)
```

### `listSubscriptions(input:completion:)`

Returns a list of the requester's subscriptions. Each call returns a limited list of
subscriptions, up to 100. If there are more subscriptions, a NextToken is
also returned. Use the NextToken parameter in a new
ListSubscriptions call to get further results.
This action is throttled at 30 transactions per second (TPS).

``` swift
public func listSubscriptions(input: ListSubscriptionsInput, completion: @escaping (ClientRuntime.SdkResult<ListSubscriptionsOutputResponse, ListSubscriptionsOutputError>) -> Void)
```

### `listSubscriptionsByTopic(input:completion:)`

Returns a list of the subscriptions to a specific topic. Each call returns a limited
list of subscriptions, up to 100. If there are more subscriptions, a
NextToken is also returned. Use the NextToken parameter in
a new ListSubscriptionsByTopic call to get further results.
This action is throttled at 30 transactions per second (TPS).

``` swift
public func listSubscriptionsByTopic(input: ListSubscriptionsByTopicInput, completion: @escaping (ClientRuntime.SdkResult<ListSubscriptionsByTopicOutputResponse, ListSubscriptionsByTopicOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

List all tags added to the specified Amazon SNS topic. For an overview, see <a href="https:​//docs.aws.amazon.com/sns/latest/dg/sns-tags.html">Amazon SNS Tags in the
Amazon Simple Notification Service Developer Guide.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `listTopics(input:completion:)`

Returns a list of the requester's topics. Each call returns a limited list of topics,
up to 100. If there are more topics, a NextToken is also returned. Use the
NextToken parameter in a new ListTopics call to get
further results.
This action is throttled at 30 transactions per second (TPS).

``` swift
public func listTopics(input: ListTopicsInput, completion: @escaping (ClientRuntime.SdkResult<ListTopicsOutputResponse, ListTopicsOutputError>) -> Void)
```

### `optInPhoneNumber(input:completion:)`

Use this request to opt in a phone number that is opted out, which enables you to
resume sending SMS messages to the number.
You can opt in a phone number only once every 30 days.

``` swift
public func optInPhoneNumber(input: OptInPhoneNumberInput, completion: @escaping (ClientRuntime.SdkResult<OptInPhoneNumberOutputResponse, OptInPhoneNumberOutputError>) -> Void)
```

### `publish(input:completion:)`

Sends a message to an Amazon SNS topic, a text message (SMS message) directly to a phone
number, or a message to a mobile platform endpoint (when you specify the
TargetArn).
If you send a message to a topic, Amazon SNS delivers the message to each endpoint that is
subscribed to the topic. The format of the message depends on the notification protocol
for each subscribed endpoint.
When a messageId is returned, the message has been saved and Amazon SNS
will attempt to deliver it shortly.
To use the Publish action for sending a message to a mobile endpoint,
such as an app on a Kindle device or mobile phone, you must specify the EndpointArn for
the TargetArn parameter. The EndpointArn is returned when making a call with the
CreatePlatformEndpoint action.
For more information about formatting messages, see <a href="https:​//docs.aws.amazon.com/sns/latest/dg/mobile-push-send-custommessage.html">Send Custom
Platform-Specific Payloads in Messages to Mobile Devices.

``` swift
public func publish(input: PublishInput, completion: @escaping (ClientRuntime.SdkResult<PublishOutputResponse, PublishOutputError>) -> Void)
```

``` 
        You can publish messages only to topics and endpoints in the same Region.
```

### `removePermission(input:completion:)`

Removes a statement from a topic's access control policy.

``` swift
public func removePermission(input: RemovePermissionInput, completion: @escaping (ClientRuntime.SdkResult<RemovePermissionOutputResponse, RemovePermissionOutputError>) -> Void)
```

### `setEndpointAttributes(input:completion:)`

Sets the attributes for an endpoint for a device on one of the supported push
notification services, such as GCM (Firebase Cloud Messaging) and APNS. For more
information, see <a href="https:​//docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications.

``` swift
public func setEndpointAttributes(input: SetEndpointAttributesInput, completion: @escaping (ClientRuntime.SdkResult<SetEndpointAttributesOutputResponse, SetEndpointAttributesOutputError>) -> Void)
```

### `setPlatformApplicationAttributes(input:completion:)`

Sets the attributes of the platform application object for the supported push
notification services, such as APNS and GCM (Firebase Cloud Messaging). For more
information, see <a href="https:​//docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using Amazon SNS Mobile Push Notifications. For information on configuring
attributes for message delivery status, see <a href="https:​//docs.aws.amazon.com/sns/latest/dg/sns-msg-status.html">Using Amazon SNS Application Attributes for
Message Delivery Status.

``` swift
public func setPlatformApplicationAttributes(input: SetPlatformApplicationAttributesInput, completion: @escaping (ClientRuntime.SdkResult<SetPlatformApplicationAttributesOutputResponse, SetPlatformApplicationAttributesOutputError>) -> Void)
```

### `setSMSAttributes(input:completion:)`

Use this request to set the default settings for sending SMS messages and receiving
daily SMS usage reports.
You can override some of these settings for a single message when you use the
Publish action with the MessageAttributes.entry.N
parameter. For more information, see <a href="https:​//docs.aws.amazon.com/sns/latest/dg/sms_publish-to-phone.html">Publishing to a mobile phone
in the Amazon SNS Developer Guide.

``` swift
public func setSMSAttributes(input: SetSMSAttributesInput, completion: @escaping (ClientRuntime.SdkResult<SetSMSAttributesOutputResponse, SetSMSAttributesOutputError>) -> Void)
```

``` 
        To use this operation, you must grant the Amazon SNS service principal
                (sns.amazonaws.com) permission to perform the
                s3:ListBucket action.
```

### `setSubscriptionAttributes(input:completion:)`

Allows a subscription owner to set an attribute of the subscription to a new
value.

``` swift
public func setSubscriptionAttributes(input: SetSubscriptionAttributesInput, completion: @escaping (ClientRuntime.SdkResult<SetSubscriptionAttributesOutputResponse, SetSubscriptionAttributesOutputError>) -> Void)
```

### `setTopicAttributes(input:completion:)`

Allows a topic owner to set an attribute of the topic to a new value.

``` swift
public func setTopicAttributes(input: SetTopicAttributesInput, completion: @escaping (ClientRuntime.SdkResult<SetTopicAttributesOutputResponse, SetTopicAttributesOutputError>) -> Void)
```

### `subscribe(input:completion:)`

Subscribes an endpoint to an Amazon SNS topic. If the endpoint type is HTTP/S or email, or
if the endpoint and the topic are not in the same account, the endpoint owner must
run the ConfirmSubscription action to confirm the subscription.
You call the ConfirmSubscription action with the token from the
subscription response. Confirmation tokens are valid for three days.
This action is throttled at 100 transactions per second (TPS).

``` swift
public func subscribe(input: SubscribeInput, completion: @escaping (ClientRuntime.SdkResult<SubscribeOutputResponse, SubscribeOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Add tags to the specified Amazon SNS topic. For an overview, see <a href="https:​//docs.aws.amazon.com/sns/latest/dg/sns-tags.html">Amazon SNS Tags in the
Amazon SNS Developer Guide.
When you use topic tags, keep the following guidelines in mind:​

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

``` 
            Adding more than 50 tags to a topic isn't recommended.


            Tags don't have any semantic meaning. Amazon SNS interprets tags as character
                strings.


            Tags are case-sensitive.


            A new tag with a key identical to that of an existing tag overwrites the
                existing tag.


            Tagging actions are limited to 10 TPS per account, per Region. If your
                application requires a higher throughput, file a <a href="https://console.aws.amazon.com/support/home#/case/create?issueType=technical">technical support request.
```

### `unsubscribe(input:completion:)`

Deletes a subscription. If the subscription requires authentication for deletion, only
the owner of the subscription or the topic's owner can unsubscribe, and an Amazon Web Services signature
is required. If the Unsubscribe call does not require authentication and
the requester is not the subscription owner, a final cancellation message is delivered
to the endpoint, so that the endpoint owner can easily resubscribe to the topic if the
Unsubscribe request was unintended.
This action is throttled at 100 transactions per second (TPS).

``` swift
public func unsubscribe(input: UnsubscribeInput, completion: @escaping (ClientRuntime.SdkResult<UnsubscribeOutputResponse, UnsubscribeOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Remove tags from the specified Amazon SNS topic. For an overview, see <a href="https:​//docs.aws.amazon.com/sns/latest/dg/sns-tags.html">Amazon SNS Tags in the
Amazon SNS Developer Guide.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `verifySMSSandboxPhoneNumber(input:completion:)`

Verifies a destination phone number with a one-time password (OTP) for the calling account.
When you start using Amazon SNS to send SMS messages, your account is in the
SMS sandbox. The SMS sandbox provides a safe environment for
you to try Amazon SNS features without risking your reputation as an SMS sender. While your
account is in the SMS sandbox, you can use all of the features of Amazon SNS. However, you can send
SMS messages only to verified destination phone numbers. For more information, including how to
move out of the sandbox to send messages without restrictions,
see <a href="https:​//docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">SMS sandbox in
the Amazon SNS Developer Guide.

``` swift
public func verifySMSSandboxPhoneNumber(input: VerifySMSSandboxPhoneNumberInput, completion: @escaping (ClientRuntime.SdkResult<VerifySMSSandboxPhoneNumberOutputResponse, VerifySMSSandboxPhoneNumberOutputError>) -> Void)
```
