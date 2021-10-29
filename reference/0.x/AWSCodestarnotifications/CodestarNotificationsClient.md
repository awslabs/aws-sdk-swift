# CodestarNotificationsClient

``` swift
public class CodestarNotificationsClient 
```

## Inheritance

[`CodestarNotificationsClientProtocol`](/aws-sdk-swift/reference/0.x/AWSCodestarnotifications/CodestarNotificationsClientProtocol)

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
public static let clientName = "CodestarNotificationsClient"
```

## Methods

### `createNotificationRule(input:completion:)`

Creates a notification rule for a resource. The rule specifies the events you want notifications about and the targets (such as SNS topics) where you want to receive them.

``` swift
public func createNotificationRule(input: CreateNotificationRuleInput, completion: @escaping (ClientRuntime.SdkResult<CreateNotificationRuleOutputResponse, CreateNotificationRuleOutputError>) -> Void)
```

### `deleteNotificationRule(input:completion:)`

Deletes a notification rule for a resource.

``` swift
public func deleteNotificationRule(input: DeleteNotificationRuleInput, completion: @escaping (ClientRuntime.SdkResult<DeleteNotificationRuleOutputResponse, DeleteNotificationRuleOutputError>) -> Void)
```

### `deleteTarget(input:completion:)`

Deletes a specified target for notifications.

``` swift
public func deleteTarget(input: DeleteTargetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTargetOutputResponse, DeleteTargetOutputError>) -> Void)
```

### `describeNotificationRule(input:completion:)`

Returns information about a specified notification rule.

``` swift
public func describeNotificationRule(input: DescribeNotificationRuleInput, completion: @escaping (ClientRuntime.SdkResult<DescribeNotificationRuleOutputResponse, DescribeNotificationRuleOutputError>) -> Void)
```

### `listEventTypes(input:completion:)`

Returns information about the event types available for configuring notifications.

``` swift
public func listEventTypes(input: ListEventTypesInput, completion: @escaping (ClientRuntime.SdkResult<ListEventTypesOutputResponse, ListEventTypesOutputError>) -> Void)
```

### `listNotificationRules(input:completion:)`

Returns a list of the notification rules for an AWS account.

``` swift
public func listNotificationRules(input: ListNotificationRulesInput, completion: @escaping (ClientRuntime.SdkResult<ListNotificationRulesOutputResponse, ListNotificationRulesOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Returns a list of the tags associated with a notification rule.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `listTargets(input:completion:)`

Returns a list of the notification rule targets for an AWS account.

``` swift
public func listTargets(input: ListTargetsInput, completion: @escaping (ClientRuntime.SdkResult<ListTargetsOutputResponse, ListTargetsOutputError>) -> Void)
```

### `subscribe(input:completion:)`

Creates an association between a notification rule and an SNS topic so that the associated target can receive notifications when the events described in the rule are triggered.

``` swift
public func subscribe(input: SubscribeInput, completion: @escaping (ClientRuntime.SdkResult<SubscribeOutputResponse, SubscribeOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Associates a set of provided tags with a notification rule.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `unsubscribe(input:completion:)`

Removes an association between a notification rule and an Amazon SNS topic so that subscribers to that topic stop receiving notifications when the events described in the rule are triggered.

``` swift
public func unsubscribe(input: UnsubscribeInput, completion: @escaping (ClientRuntime.SdkResult<UnsubscribeOutputResponse, UnsubscribeOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes the association between one or more provided tags and a notification rule.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateNotificationRule(input:completion:)`

Updates a notification rule for a resource. You can change the events that trigger the notification rule, the status of the rule, and the targets that receive the notifications. To add or remove tags for a notification rule, you must use \[TagResource\] and \[UntagResource\].

``` swift
public func updateNotificationRule(input: UpdateNotificationRuleInput, completion: @escaping (ClientRuntime.SdkResult<UpdateNotificationRuleOutputResponse, UpdateNotificationRuleOutputError>) -> Void)
```
