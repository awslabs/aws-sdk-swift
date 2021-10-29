# BudgetsClient

``` swift
public class BudgetsClient 
```

## Inheritance

[`BudgetsClientProtocol`](/aws-sdk-swift/reference/0.x/AWSBudgets/BudgetsClientProtocol)

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
public static let clientName = "BudgetsClient"
```

## Methods

### `createBudget(input:completion:)`

Creates a budget and, if included, notifications and subscribers. Only one of BudgetLimit or PlannedBudgetLimits can be present in the syntax at one time. Use the syntax that matches your case. The Request Syntax section shows the BudgetLimit syntax. For PlannedBudgetLimits, see the [Examples](https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_budgets_CreateBudget.html#API_CreateBudget_Examples) section.

``` swift
public func createBudget(input: CreateBudgetInput, completion: @escaping (ClientRuntime.SdkResult<CreateBudgetOutputResponse, CreateBudgetOutputError>) -> Void)
```

### `createBudgetAction(input:completion:)`

Creates a budget action.

``` swift
public func createBudgetAction(input: CreateBudgetActionInput, completion: @escaping (ClientRuntime.SdkResult<CreateBudgetActionOutputResponse, CreateBudgetActionOutputError>) -> Void)
```

### `createNotification(input:completion:)`

Creates a notification. You must create the budget before you create the associated notification.

``` swift
public func createNotification(input: CreateNotificationInput, completion: @escaping (ClientRuntime.SdkResult<CreateNotificationOutputResponse, CreateNotificationOutputError>) -> Void)
```

### `createSubscriber(input:completion:)`

Creates a subscriber. You must create the associated budget and notification before you create the subscriber.

``` swift
public func createSubscriber(input: CreateSubscriberInput, completion: @escaping (ClientRuntime.SdkResult<CreateSubscriberOutputResponse, CreateSubscriberOutputError>) -> Void)
```

### `deleteBudget(input:completion:)`

Deletes a budget. You can delete your budget at any time. Deleting a budget also deletes the notifications and subscribers that are associated with that budget.

``` swift
public func deleteBudget(input: DeleteBudgetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBudgetOutputResponse, DeleteBudgetOutputError>) -> Void)
```

### `deleteBudgetAction(input:completion:)`

Deletes a budget action.

``` swift
public func deleteBudgetAction(input: DeleteBudgetActionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBudgetActionOutputResponse, DeleteBudgetActionOutputError>) -> Void)
```

### `deleteNotification(input:completion:)`

Deletes a notification. Deleting a notification also deletes the subscribers that are associated with the notification.

``` swift
public func deleteNotification(input: DeleteNotificationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteNotificationOutputResponse, DeleteNotificationOutputError>) -> Void)
```

### `deleteSubscriber(input:completion:)`

Deletes a subscriber. Deleting the last subscriber to a notification also deletes the notification.

``` swift
public func deleteSubscriber(input: DeleteSubscriberInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSubscriberOutputResponse, DeleteSubscriberOutputError>) -> Void)
```

### `describeBudget(input:completion:)`

Describes a budget. The Request Syntax section shows the BudgetLimit syntax. For PlannedBudgetLimits, see the [Examples](https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_budgets_DescribeBudget.html#API_DescribeBudget_Examples) section.

``` swift
public func describeBudget(input: DescribeBudgetInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBudgetOutputResponse, DescribeBudgetOutputError>) -> Void)
```

### `describeBudgetAction(input:completion:)`

Describes a budget action detail.

``` swift
public func describeBudgetAction(input: DescribeBudgetActionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBudgetActionOutputResponse, DescribeBudgetActionOutputError>) -> Void)
```

### `describeBudgetActionHistories(input:completion:)`

Describes a budget action history detail.

``` swift
public func describeBudgetActionHistories(input: DescribeBudgetActionHistoriesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBudgetActionHistoriesOutputResponse, DescribeBudgetActionHistoriesOutputError>) -> Void)
```

### `describeBudgetActionsForAccount(input:completion:)`

Describes all of the budget actions for an account.

``` swift
public func describeBudgetActionsForAccount(input: DescribeBudgetActionsForAccountInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBudgetActionsForAccountOutputResponse, DescribeBudgetActionsForAccountOutputError>) -> Void)
```

### `describeBudgetActionsForBudget(input:completion:)`

Describes all of the budget actions for a budget.

``` swift
public func describeBudgetActionsForBudget(input: DescribeBudgetActionsForBudgetInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBudgetActionsForBudgetOutputResponse, DescribeBudgetActionsForBudgetOutputError>) -> Void)
```

### `describeBudgetPerformanceHistory(input:completion:)`

Describes the history for DAILY, MONTHLY, and QUARTERLY budgets. Budget history isn't available for ANNUAL budgets.

``` swift
public func describeBudgetPerformanceHistory(input: DescribeBudgetPerformanceHistoryInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBudgetPerformanceHistoryOutputResponse, DescribeBudgetPerformanceHistoryOutputError>) -> Void)
```

### `describeBudgets(input:completion:)`

Lists the budgets that are associated with an account. The Request Syntax section shows the BudgetLimit syntax. For PlannedBudgetLimits, see the [Examples](https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_budgets_DescribeBudgets.html#API_DescribeBudgets_Examples) section.

``` swift
public func describeBudgets(input: DescribeBudgetsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBudgetsOutputResponse, DescribeBudgetsOutputError>) -> Void)
```

### `describeNotificationsForBudget(input:completion:)`

Lists the notifications that are associated with a budget.

``` swift
public func describeNotificationsForBudget(input: DescribeNotificationsForBudgetInput, completion: @escaping (ClientRuntime.SdkResult<DescribeNotificationsForBudgetOutputResponse, DescribeNotificationsForBudgetOutputError>) -> Void)
```

### `describeSubscribersForNotification(input:completion:)`

Lists the subscribers that are associated with a notification.

``` swift
public func describeSubscribersForNotification(input: DescribeSubscribersForNotificationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSubscribersForNotificationOutputResponse, DescribeSubscribersForNotificationOutputError>) -> Void)
```

### `executeBudgetAction(input:completion:)`

Executes a budget action.

``` swift
public func executeBudgetAction(input: ExecuteBudgetActionInput, completion: @escaping (ClientRuntime.SdkResult<ExecuteBudgetActionOutputResponse, ExecuteBudgetActionOutputError>) -> Void)
```

### `updateBudget(input:completion:)`

Updates a budget. You can change every part of a budget except for the budgetName and the calculatedSpend. When you modify a budget, the calculatedSpend drops to zero until AWS has new usage data to use for forecasting. Only one of BudgetLimit or PlannedBudgetLimits can be present in the syntax at one time. Use the syntax that matches your case. The Request Syntax section shows the BudgetLimit syntax. For PlannedBudgetLimits, see the [Examples](https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_budgets_UpdateBudget.html#API_UpdateBudget_Examples) section.

``` swift
public func updateBudget(input: UpdateBudgetInput, completion: @escaping (ClientRuntime.SdkResult<UpdateBudgetOutputResponse, UpdateBudgetOutputError>) -> Void)
```

### `updateBudgetAction(input:completion:)`

Updates a budget action.

``` swift
public func updateBudgetAction(input: UpdateBudgetActionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateBudgetActionOutputResponse, UpdateBudgetActionOutputError>) -> Void)
```

### `updateNotification(input:completion:)`

Updates a notification.

``` swift
public func updateNotification(input: UpdateNotificationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateNotificationOutputResponse, UpdateNotificationOutputError>) -> Void)
```

### `updateSubscriber(input:completion:)`

Updates a subscriber.

``` swift
public func updateSubscriber(input: UpdateSubscriberInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSubscriberOutputResponse, UpdateSubscriberOutputError>) -> Void)
```
