# BudgetsClientProtocol

The AWS Budgets API enables you to use AWS Budgets to plan your service usage, service costs, and instance reservations. The API reference provides descriptions, syntax, and usage examples for each of the actions and data types for AWS Budgets. Budgets provide you with a way to see the following information:

``` swift
public protocol BudgetsClientProtocol 
```

  - How close your plan is to your budgeted amount or to the free tier limits

  - Your usage-to-date, including how much you've used of your Reserved Instances (RIs)

  - Your current estimated charges from AWS, and how much your predicted usage will accrue in charges by the end of the month

  - How much of your budget has been used

AWS updates your budget status several times a day. Budgets track your unblended costs, subscriptions, refunds, and RIs. You can create the following types of budgets:

  - Cost budgets - Plan how much you want to spend on a service.

  - Usage budgets - Plan how much you want to use one or more services.

  - RI utilization budgets - Define a utilization threshold, and receive alerts when your RI usage falls below that threshold. This lets you see if your RIs are unused or under-utilized.

  - RI coverage budgets - Define a coverage threshold, and receive alerts when the number of your instance hours that are covered by RIs fall below that threshold. This lets you see how much of your instance usage is covered by a reservation.

Service Endpoint The AWS Budgets API provides the following endpoint:

  - https://budgets.amazonaws.com

For information about costs that are associated with the AWS Budgets API, see [AWS Cost Management Pricing](https://aws.amazon.com/aws-cost-management/pricing/).

## Requirements

### createBudget(input:completion:)

Creates a budget and, if included, notifications and subscribers. Only one of BudgetLimit or PlannedBudgetLimits can be present in the syntax at one time. Use the syntax that matches your case. The Request Syntax section shows the BudgetLimit syntax. For PlannedBudgetLimits, see the [Examples](https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_budgets_CreateBudget.html#API_CreateBudget_Examples) section.

``` swift
func createBudget(input: CreateBudgetInput, completion: @escaping (ClientRuntime.SdkResult<CreateBudgetOutputResponse, CreateBudgetOutputError>) -> Void)
```

### createBudgetAction(input:completion:)

Creates a budget action.

``` swift
func createBudgetAction(input: CreateBudgetActionInput, completion: @escaping (ClientRuntime.SdkResult<CreateBudgetActionOutputResponse, CreateBudgetActionOutputError>) -> Void)
```

### createNotification(input:completion:)

Creates a notification. You must create the budget before you create the associated notification.

``` swift
func createNotification(input: CreateNotificationInput, completion: @escaping (ClientRuntime.SdkResult<CreateNotificationOutputResponse, CreateNotificationOutputError>) -> Void)
```

### createSubscriber(input:completion:)

Creates a subscriber. You must create the associated budget and notification before you create the subscriber.

``` swift
func createSubscriber(input: CreateSubscriberInput, completion: @escaping (ClientRuntime.SdkResult<CreateSubscriberOutputResponse, CreateSubscriberOutputError>) -> Void)
```

### deleteBudget(input:completion:)

Deletes a budget. You can delete your budget at any time. Deleting a budget also deletes the notifications and subscribers that are associated with that budget.

``` swift
func deleteBudget(input: DeleteBudgetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBudgetOutputResponse, DeleteBudgetOutputError>) -> Void)
```

### deleteBudgetAction(input:completion:)

Deletes a budget action.

``` swift
func deleteBudgetAction(input: DeleteBudgetActionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBudgetActionOutputResponse, DeleteBudgetActionOutputError>) -> Void)
```

### deleteNotification(input:completion:)

Deletes a notification. Deleting a notification also deletes the subscribers that are associated with the notification.

``` swift
func deleteNotification(input: DeleteNotificationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteNotificationOutputResponse, DeleteNotificationOutputError>) -> Void)
```

### deleteSubscriber(input:completion:)

Deletes a subscriber. Deleting the last subscriber to a notification also deletes the notification.

``` swift
func deleteSubscriber(input: DeleteSubscriberInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSubscriberOutputResponse, DeleteSubscriberOutputError>) -> Void)
```

### describeBudget(input:completion:)

Describes a budget. The Request Syntax section shows the BudgetLimit syntax. For PlannedBudgetLimits, see the [Examples](https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_budgets_DescribeBudget.html#API_DescribeBudget_Examples) section.

``` swift
func describeBudget(input: DescribeBudgetInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBudgetOutputResponse, DescribeBudgetOutputError>) -> Void)
```

### describeBudgetAction(input:completion:)

Describes a budget action detail.

``` swift
func describeBudgetAction(input: DescribeBudgetActionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBudgetActionOutputResponse, DescribeBudgetActionOutputError>) -> Void)
```

### describeBudgetActionHistories(input:completion:)

Describes a budget action history detail.

``` swift
func describeBudgetActionHistories(input: DescribeBudgetActionHistoriesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBudgetActionHistoriesOutputResponse, DescribeBudgetActionHistoriesOutputError>) -> Void)
```

### describeBudgetActionsForAccount(input:completion:)

Describes all of the budget actions for an account.

``` swift
func describeBudgetActionsForAccount(input: DescribeBudgetActionsForAccountInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBudgetActionsForAccountOutputResponse, DescribeBudgetActionsForAccountOutputError>) -> Void)
```

### describeBudgetActionsForBudget(input:completion:)

Describes all of the budget actions for a budget.

``` swift
func describeBudgetActionsForBudget(input: DescribeBudgetActionsForBudgetInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBudgetActionsForBudgetOutputResponse, DescribeBudgetActionsForBudgetOutputError>) -> Void)
```

### describeBudgetPerformanceHistory(input:completion:)

Describes the history for DAILY, MONTHLY, and QUARTERLY budgets. Budget history isn't available for ANNUAL budgets.

``` swift
func describeBudgetPerformanceHistory(input: DescribeBudgetPerformanceHistoryInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBudgetPerformanceHistoryOutputResponse, DescribeBudgetPerformanceHistoryOutputError>) -> Void)
```

### describeBudgets(input:completion:)

Lists the budgets that are associated with an account. The Request Syntax section shows the BudgetLimit syntax. For PlannedBudgetLimits, see the [Examples](https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_budgets_DescribeBudgets.html#API_DescribeBudgets_Examples) section.

``` swift
func describeBudgets(input: DescribeBudgetsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBudgetsOutputResponse, DescribeBudgetsOutputError>) -> Void)
```

### describeNotificationsForBudget(input:completion:)

Lists the notifications that are associated with a budget.

``` swift
func describeNotificationsForBudget(input: DescribeNotificationsForBudgetInput, completion: @escaping (ClientRuntime.SdkResult<DescribeNotificationsForBudgetOutputResponse, DescribeNotificationsForBudgetOutputError>) -> Void)
```

### describeSubscribersForNotification(input:completion:)

Lists the subscribers that are associated with a notification.

``` swift
func describeSubscribersForNotification(input: DescribeSubscribersForNotificationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSubscribersForNotificationOutputResponse, DescribeSubscribersForNotificationOutputError>) -> Void)
```

### executeBudgetAction(input:completion:)

Executes a budget action.

``` swift
func executeBudgetAction(input: ExecuteBudgetActionInput, completion: @escaping (ClientRuntime.SdkResult<ExecuteBudgetActionOutputResponse, ExecuteBudgetActionOutputError>) -> Void)
```

### updateBudget(input:completion:)

Updates a budget. You can change every part of a budget except for the budgetName and the calculatedSpend. When you modify a budget, the calculatedSpend drops to zero until AWS has new usage data to use for forecasting. Only one of BudgetLimit or PlannedBudgetLimits can be present in the syntax at one time. Use the syntax that matches your case. The Request Syntax section shows the BudgetLimit syntax. For PlannedBudgetLimits, see the [Examples](https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_budgets_UpdateBudget.html#API_UpdateBudget_Examples) section.

``` swift
func updateBudget(input: UpdateBudgetInput, completion: @escaping (ClientRuntime.SdkResult<UpdateBudgetOutputResponse, UpdateBudgetOutputError>) -> Void)
```

### updateBudgetAction(input:completion:)

Updates a budget action.

``` swift
func updateBudgetAction(input: UpdateBudgetActionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateBudgetActionOutputResponse, UpdateBudgetActionOutputError>) -> Void)
```

### updateNotification(input:completion:)

Updates a notification.

``` swift
func updateNotification(input: UpdateNotificationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateNotificationOutputResponse, UpdateNotificationOutputError>) -> Void)
```

### updateSubscriber(input:completion:)

Updates a subscriber.

``` swift
func updateSubscriber(input: UpdateSubscriberInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSubscriberOutputResponse, UpdateSubscriberOutputError>) -> Void)
```
