# HealthClientProtocol

<fullname>AWS Health</fullname>

``` swift
public protocol HealthClientProtocol 
```

``` 
     The AWS Health API provides programmatic access to the AWS Health information that
     appears in the <a href="https://phd.aws.amazon.com/phd/home#/">AWS Personal Health Dashboard. You
     can use the API operations to get information about AWS Health events that affect your
     AWS services and resources.



              You must have a Business or Enterprise Support plan from <a href="http://aws.amazon.com/premiumsupport/">AWS Support to use the
              AWS Health API. If you call the AWS Health API from an AWS account that
              doesn't have a Business or Enterprise Support plan, you receive a
                 SubscriptionRequiredException error.


              You can use the AWS Health endpoint health.us-east-1.amazonaws.com (HTTPS) to
              call the AWS Health API operations. AWS Health supports a multi-Region
              application architecture and has two regional endpoints in an active-passive
              configuration. You can use the high availability endpoint example to determine
              which AWS Region is active, so that you can get the latest information from the
              API. For more information, see <a href="https://docs.aws.amazon.com/health/latest/ug/health-api.html">Accessing the AWS Health API in the
                 AWS Health User Guide.



     For authentication of requests, AWS Health uses the <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4 Signing
        Process.
     If your AWS account is part of AWS Organizations, you can use the AWS Health organizational
     view feature. This feature provides a centralized view of AWS Health events across all
     accounts in your organization. You can aggregate AWS Health events in real time to
     identify accounts in your organization that are affected by an operational event or get
     notified of security vulnerabilities. Use the organizational view API operations to enable
     this feature and return event information. For more information, see <a href="https://docs.aws.amazon.com/health/latest/ug/aggregate-events.html">Aggregating
        AWS Health events in the AWS Health User Guide.

        When you use the AWS Health API operations to return AWS Health events, see the
        following recommendations:


              Use the <a href="https://docs.aws.amazon.com/health/latest/APIReference/API_Event.html#AWSHealth-Type-Event-eventScopeCode">eventScopeCode parameter to specify whether to return AWS Health
              events that are public or account-specific.


              Use pagination to view all events from the response. For example, if you call
              the DescribeEventsForOrganization operation to get all events in your
              organization, you might receive several page results. Specify the
                 nextToken in the next request to return more results.
```

## Requirements

### describeAffectedAccountsForOrganization(input:​completion:​)

Returns a list of accounts in the organization from AWS Organizations that are affected by the
provided event. For more information about the different types of AWS Health events, see
<a href="https:​//docs.aws.amazon.com/health/latest/APIReference/API_Event.html">Event.
Before you can call this operation, you must first enable AWS Health to work with
AWS Organizations. To do this, call the <a href="https:​//docs.aws.amazon.com/health/latest/APIReference/API_EnableHealthServiceAccessForOrganization.html">EnableHealthServiceAccessForOrganization operation from your organization's
management account.

``` swift
func describeAffectedAccountsForOrganization(input: DescribeAffectedAccountsForOrganizationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAffectedAccountsForOrganizationOutputResponse, DescribeAffectedAccountsForOrganizationOutputError>) -> Void)
```

``` 
        This API operation uses pagination. Specify the nextToken parameter in the next request to return more results.
```

### describeAffectedEntities(input:​completion:​)

Returns a list of entities that have been affected by the specified events, based on the
specified filter criteria. Entities can refer to individual customer resources, groups of
customer resources, or any other construct, depending on the AWS service. Events that
have impact beyond that of the affected entities, or where the extent of impact is unknown,
include at least one entity indicating this.
At least one event ARN is required. Results are sorted by the
lastUpdatedTime of the entity, starting with the most recent.

``` swift
func describeAffectedEntities(input: DescribeAffectedEntitiesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAffectedEntitiesOutputResponse, DescribeAffectedEntitiesOutputError>) -> Void)
```

``` 
              This API operation uses pagination. Specify the nextToken parameter in the next request to return more results.


              This operation supports resource-level permissions. You can use this operation to allow or deny access to specific AWS Health events. For more
              information, see <a href="https://docs.aws.amazon.com/health/latest/ug/security_iam_id-based-policy-examples.html#resource-action-based-conditions">Resource- and action-based conditions in the AWS Health User Guide.
```

### describeAffectedEntitiesForOrganization(input:​completion:​)

Returns a list of entities that have been affected by one or more events for one or more
accounts in your organization in AWS Organizations, based on the filter criteria. Entities can refer
to individual customer resources, groups of customer resources, or any other construct,
depending on the AWS service.
At least one event Amazon Resource Name (ARN) and account ID are required. Results are
sorted by the lastUpdatedTime of the entity, starting with the most
recent.
Before you can call this operation, you must first enable AWS Health to work with
AWS Organizations. To do this, call the <a href="https:​//docs.aws.amazon.com/health/latest/APIReference/API_EnableHealthServiceAccessForOrganization.html">EnableHealthServiceAccessForOrganization
operation from your organization's management account.

``` swift
func describeAffectedEntitiesForOrganization(input: DescribeAffectedEntitiesForOrganizationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAffectedEntitiesForOrganizationOutputResponse, DescribeAffectedEntitiesForOrganizationOutputError>) -> Void)
```

``` 
              This API operation uses pagination. Specify the nextToken parameter in the next request to return more results.


              This operation doesn't support resource-level permissions. You can't use this operation to allow or deny access to specific AWS Health events. For more
              information, see <a href="https://docs.aws.amazon.com/health/latest/ug/security_iam_id-based-policy-examples.html#resource-action-based-conditions">Resource- and action-based conditions in the AWS Health User Guide.
```

### describeEntityAggregates(input:​completion:​)

Returns the number of entities that are affected by each of the specified events. If no
events are specified, the counts of all affected entities are returned.

``` swift
func describeEntityAggregates(input: DescribeEntityAggregatesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEntityAggregatesOutputResponse, DescribeEntityAggregatesOutputError>) -> Void)
```

### describeEventAggregates(input:​completion:​)

Returns the number of events of each event type (issue, scheduled change, and account
notification). If no filter is specified, the counts of all events in each category are
returned.

``` swift
func describeEventAggregates(input: DescribeEventAggregatesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEventAggregatesOutputResponse, DescribeEventAggregatesOutputError>) -> Void)
```

``` 
        This API operation uses pagination. Specify the nextToken parameter in the next request to return more results.
```

### describeEventDetails(input:​completion:​)

Returns detailed information about one or more specified events. Information includes
standard event data (AWS Region, service, and so on, as returned by <a href="https:​//docs.aws.amazon.com/health/latest/APIReference/API_DescribeEvents.html">DescribeEvents), a detailed event description, and possible additional metadata
that depends upon the nature of the event. Affected entities are not included. To retrieve
the entities, use the <a href="https:​//docs.aws.amazon.com/health/latest/APIReference/API_DescribeAffectedEntities.html">DescribeAffectedEntities operation.
If a specified event can't be retrieved, an error message is returned for that
event.

``` swift
func describeEventDetails(input: DescribeEventDetailsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEventDetailsOutputResponse, DescribeEventDetailsOutputError>) -> Void)
```

``` 
        This operation supports resource-level permissions. You can use this operation to allow or deny access to specific AWS Health events. For more
              information, see <a href="https://docs.aws.amazon.com/health/latest/ug/security_iam_id-based-policy-examples.html#resource-action-based-conditions">Resource- and action-based conditions in the AWS Health User Guide.
```

### describeEventDetailsForOrganization(input:​completion:​)

Returns detailed information about one or more specified events for one or more AWS
accounts in your organization. This information includes standard event data (such as the
AWS Region and service), an event description, and (depending on the event) possible
metadata. This operation doesn't return affected entities, such as the resources related to
the event. To return affected entities, use the <a href="https:​//docs.aws.amazon.com/health/latest/APIReference/API_DescribeAffectedEntitiesForOrganization.html">DescribeAffectedEntitiesForOrganization operation.

``` swift
func describeEventDetailsForOrganization(input: DescribeEventDetailsForOrganizationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEventDetailsForOrganizationOutputResponse, DescribeEventDetailsForOrganizationOutputError>) -> Void)
```

``` 
        Before you can call this operation, you must first enable AWS Health to work with
        AWS Organizations. To do this, call the <a href="https://docs.aws.amazon.com/health/latest/APIReference/API_EnableHealthServiceAccessForOrganization.html">EnableHealthServiceAccessForOrganization operation from your organization's
        management account.

     When you call the DescribeEventDetailsForOrganization operation, specify
     the organizationEventDetailFilters object in the request. Depending on the
     AWS Health event type, note the following differences:


           To return event details for a public event, you must specify a null value for the
              awsAccountId parameter. If you specify an account ID for a public
           event, AWS Health returns an error message because public events aren't specific to
           an account.


           To return event details for an event that is specific to an account in your
           organization,  you must specify the awsAccountId parameter in the
           request. If you don't specify an account ID, AWS Health returns an error message
           because the event is specific to an account in your organization.


     For more information, see <a href="https://docs.aws.amazon.com/health/latest/APIReference/API_Event.html">Event.


        This operation doesn't support resource-level permissions. You can't use this operation to allow or deny access to specific AWS Health events. For more
              information, see <a href="https://docs.aws.amazon.com/health/latest/ug/security_iam_id-based-policy-examples.html#resource-action-based-conditions">Resource- and action-based conditions in the AWS Health User Guide.
```

### describeEvents(input:​completion:​)

Returns information about events that meet the specified filter criteria. Events are
returned in a summary form and do not include the detailed description, any additional
metadata that depends on the event type, or any affected resources. To retrieve that
information, use the <a href="https:​//docs.aws.amazon.com/health/latest/APIReference/API_DescribeEventDetails.html">DescribeEventDetails and <a href="https:​//docs.aws.amazon.com/health/latest/APIReference/API_DescribeAffectedEntities.html">DescribeAffectedEntities operations.
If no filter criteria are specified, all events are returned. Results are sorted by
lastModifiedTime, starting with the most recent event.

``` swift
func describeEvents(input: DescribeEventsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEventsOutputResponse, DescribeEventsOutputError>) -> Void)
```

``` 
             When you call the DescribeEvents operation and specify an entity
             for the entityValues parameter, AWS Health might return public
             events that aren't specific to that resource. For example, if you call
                DescribeEvents and specify an ID for an Amazon Elastic Compute Cloud (Amazon EC2)
             instance, AWS Health might return events that aren't specific to that resource or
             service. To get events that are specific to a service, use the
                services parameter in the filter object. For more
             information, see <a href="https://docs.aws.amazon.com/health/latest/APIReference/API_Event.html">Event.


             This API operation uses pagination. Specify the nextToken parameter in the next request to return more results.
```

### describeEventsForOrganization(input:​completion:​)

Returns information about events across your organization in AWS Organizations. You can use
thefilters parameter to specify the events that you want to return. Events
are returned in a summary form and don't include the affected accounts, detailed
description, any additional metadata that depends on the event type, or any affected
resources. To retrieve that information, use the following operations:​

``` swift
func describeEventsForOrganization(input: DescribeEventsForOrganizationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEventsForOrganizationOutputResponse, DescribeEventsForOrganizationOutputError>) -> Void)
```

``` 
              <a href="https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeAffectedAccountsForOrganization.html">DescribeAffectedAccountsForOrganization




              <a href="https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEventDetailsForOrganization.html">DescribeEventDetailsForOrganization




              <a href="https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeAffectedEntitiesForOrganization.html">DescribeAffectedEntitiesForOrganization



     If you don't specify a filter, the
        DescribeEventsForOrganizations returns all events across your organization.
     Results are sorted by lastModifiedTime, starting with the most recent event.
     For more information about the different types of AWS Health events, see <a href="https://docs.aws.amazon.com/health/latest/APIReference/API_Event.html">Event.
     Before you can call this operation, you must first enable AWS Health to work with
     AWS Organizations. To do this, call the <a href="https://docs.aws.amazon.com/health/latest/APIReference/API_EnableHealthServiceAccessForOrganization.html">EnableHealthServiceAccessForOrganization operation from your organization's
     management account.

        This API operation uses pagination. Specify the nextToken parameter in the next request to return more results.
```

### describeEventTypes(input:​completion:​)

Returns the event types that meet the specified filter criteria. You can use this API
operation to find information about the AWS Health event, such as the category, AWS
service, and event code. The metadata for each event appears in the <a href="https:​//docs.aws.amazon.com/health/latest/APIReference/API_EventType.html">EventType object.
If you don't specify a filter criteria, the API operation returns all event types, in no
particular order.

``` swift
func describeEventTypes(input: DescribeEventTypesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEventTypesOutputResponse, DescribeEventTypesOutputError>) -> Void)
```

``` 
        This API operation uses pagination. Specify the nextToken parameter in the next request to return more results.
```

### describeHealthServiceStatusForOrganization(input:​completion:​)

This operation provides status information on enabling or disabling AWS Health to work
with your organization. To call this operation, you must sign in as an IAM user, assume
an IAM role, or sign in as the root user (not recommended) in the organization's
management account.

``` swift
func describeHealthServiceStatusForOrganization(input: DescribeHealthServiceStatusForOrganizationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeHealthServiceStatusForOrganizationOutputResponse, DescribeHealthServiceStatusForOrganizationOutputError>) -> Void)
```

### disableHealthServiceAccessForOrganization(input:​completion:​)

Disables AWS Health from working with AWS Organizations. To call this operation, you must sign
in as an AWS Identity and Access Management (IAM) user, assume an IAM role, or sign in as the root user (not
recommended) in the organization's management account. For more information, see <a href="https:​//docs.aws.amazon.com/health/latest/ug/aggregate-events.html">Aggregating
AWS Health events in the
AWS Health User Guide.
This operation doesn't remove the service-linked role from the management account in your organization. You must use the IAM console, API, or AWS Command Line Interface (AWS CLI) to
remove the service-linked role. For more information, see <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/using-service-linked-roles.html#delete-service-linked-role">Deleting a Service-Linked Role in the
IAM User Guide.

``` swift
func disableHealthServiceAccessForOrganization(input: DisableHealthServiceAccessForOrganizationInput, completion: @escaping (ClientRuntime.SdkResult<DisableHealthServiceAccessForOrganizationOutputResponse, DisableHealthServiceAccessForOrganizationOutputError>) -> Void)
```

``` 
        You can also disable the organizational feature by using the Organizations <a href="https://docs.aws.amazon.com/organizations/latest/APIReference/API_DisableAWSServiceAccess.html">DisableAWSServiceAccess API operation. After you call this operation,
        AWS Health stops aggregating events for all other AWS accounts in your organization.
        If you call the AWS Health API operations for organizational view, AWS Health returns
        an error. AWS Health continues to aggregate health events for your AWS
        account.
```

### enableHealthServiceAccessForOrganization(input:​completion:​)

Enables AWS Health to work with AWS Organizations. You can use the organizational view feature
to aggregate events from all AWS accounts in your organization in a centralized location.
This operation also creates a service-linked role for the management account in the
organization.

``` swift
func enableHealthServiceAccessForOrganization(input: EnableHealthServiceAccessForOrganizationInput, completion: @escaping (ClientRuntime.SdkResult<EnableHealthServiceAccessForOrganizationOutputResponse, EnableHealthServiceAccessForOrganizationOutputError>) -> Void)
```

``` 
        To call this operation, you must meet the following requirements:


              You must have a Business or Enterprise Support plan from <a href="http://aws.amazon.com/premiumsupport/">AWS Support to use the AWS Health
              API. If you call the AWS Health API from an AWS account that doesn't have a
              Business or Enterprise Support plan, you receive a
                 SubscriptionRequiredException error.


              You must have permission to call this operation from the organization's
              management account. For example IAM policies, see <a href="https://docs.aws.amazon.com/health/latest/ug/security_iam_id-based-policy-examples.html">AWS Health
                 identity-based policy examples.



     If you don't have the required support plan, you can instead use the AWS Health console
     to enable the organizational view feature. For more information, see <a href="https://docs.aws.amazon.com/health/latest/ug/aggregate-events.html">Aggregating
        AWS Health events in the AWS Health User Guide.
```
