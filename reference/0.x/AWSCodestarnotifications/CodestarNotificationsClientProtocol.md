# CodestarNotificationsClientProtocol

This AWS CodeStar Notifications API Reference provides descriptions and usage examples of the
operations and data types for the AWS CodeStar Notifications API. You can use the AWS CodeStar Notifications API
to work with the following objects:​

``` swift
public protocol CodestarNotificationsClientProtocol 
```

``` 
     Notification rules, by calling the following:



              CreateNotificationRule, which creates a notification rule for a
                resource in your account.



              DeleteNotificationRule, which deletes a notification rule.



              DescribeNotificationRule, which provides information about a notification rule.



              ListNotificationRules, which lists the notification rules associated with
      your account.



              UpdateNotificationRule, which changes the name, events, or targets associated with a
      notification rule.



              Subscribe, which subscribes a target to a notification rule.



              Unsubscribe, which removes a target from a notification rule.



     Targets, by calling the following:



              DeleteTarget, which removes a notification rule target (SNS topic) from a
      notification rule.



              ListTargets, which lists the targets associated with a
                notification rule.



     Events, by calling the following:



              ListEventTypes, which lists the event types you can include in
                a notification rule.


     Tags, by calling the following:



              ListTagsForResource, which lists the tags already associated
                with a notification rule in your account.



              TagResource, which associates a tag you provide with a
                notification rule in your account.



              UntagResource, which removes a tag from a notification rule in
                your account.





      For information about how to use AWS CodeStar Notifications, see link in the CodeStarNotifications User Guide.
```

## Requirements

### createNotificationRule(input:​completion:​)

Creates a notification rule for a resource. The rule specifies the events you want
notifications about and the targets (such as SNS topics) where you want to receive
them.

``` swift
func createNotificationRule(input: CreateNotificationRuleInput, completion: @escaping (ClientRuntime.SdkResult<CreateNotificationRuleOutputResponse, CreateNotificationRuleOutputError>) -> Void)
```

### deleteNotificationRule(input:​completion:​)

Deletes a notification rule for a resource.

``` swift
func deleteNotificationRule(input: DeleteNotificationRuleInput, completion: @escaping (ClientRuntime.SdkResult<DeleteNotificationRuleOutputResponse, DeleteNotificationRuleOutputError>) -> Void)
```

### deleteTarget(input:​completion:​)

Deletes a specified target for notifications.

``` swift
func deleteTarget(input: DeleteTargetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTargetOutputResponse, DeleteTargetOutputError>) -> Void)
```

### describeNotificationRule(input:​completion:​)

Returns information about a specified notification rule.

``` swift
func describeNotificationRule(input: DescribeNotificationRuleInput, completion: @escaping (ClientRuntime.SdkResult<DescribeNotificationRuleOutputResponse, DescribeNotificationRuleOutputError>) -> Void)
```

### listEventTypes(input:​completion:​)

Returns information about the event types available for configuring notifications.

``` swift
func listEventTypes(input: ListEventTypesInput, completion: @escaping (ClientRuntime.SdkResult<ListEventTypesOutputResponse, ListEventTypesOutputError>) -> Void)
```

### listNotificationRules(input:​completion:​)

Returns a list of the notification rules for an AWS account.

``` swift
func listNotificationRules(input: ListNotificationRulesInput, completion: @escaping (ClientRuntime.SdkResult<ListNotificationRulesOutputResponse, ListNotificationRulesOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

Returns a list of the tags associated with a notification rule.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### listTargets(input:​completion:​)

Returns a list of the notification rule targets for an AWS account.

``` swift
func listTargets(input: ListTargetsInput, completion: @escaping (ClientRuntime.SdkResult<ListTargetsOutputResponse, ListTargetsOutputError>) -> Void)
```

### subscribe(input:​completion:​)

Creates an association between a notification rule and an SNS topic so that the
associated target can receive notifications when the events described in the rule are
triggered.

``` swift
func subscribe(input: SubscribeInput, completion: @escaping (ClientRuntime.SdkResult<SubscribeOutputResponse, SubscribeOutputError>) -> Void)
```

### tagResource(input:​completion:​)

Associates a set of provided tags with a notification rule.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### unsubscribe(input:​completion:​)

Removes an association between a notification rule and an Amazon SNS topic so that
subscribers to that topic stop receiving notifications when the events described in the
rule are triggered.

``` swift
func unsubscribe(input: UnsubscribeInput, completion: @escaping (ClientRuntime.SdkResult<UnsubscribeOutputResponse, UnsubscribeOutputError>) -> Void)
```

### untagResource(input:​completion:​)

Removes the association between one or more provided tags and a notification
rule.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateNotificationRule(input:​completion:​)

Updates a notification rule for a resource. You can change the events that trigger the
notification rule, the status of the rule, and the targets that receive the
notifications.

``` swift
func updateNotificationRule(input: UpdateNotificationRuleInput, completion: @escaping (ClientRuntime.SdkResult<UpdateNotificationRuleOutputResponse, UpdateNotificationRuleOutputError>) -> Void)
```

``` 
        To add or remove tags for a notification rule, you must use TagResource and UntagResource.
```
