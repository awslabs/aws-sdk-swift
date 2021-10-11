# MTurkClient

``` swift
public class MTurkClient 
```

## Inheritance

[`MTurkClientProtocol`](/aws-sdk-swift/reference/0.x/AWSMTurk/MTurkClientProtocol)

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

### `acceptQualificationRequest(input:completion:)`

The AcceptQualificationRequest operation approves a Worker's request for a Qualification.

``` swift
public func acceptQualificationRequest(input: AcceptQualificationRequestInput, completion: @escaping (ClientRuntime.SdkResult<AcceptQualificationRequestOutputResponse, AcceptQualificationRequestOutputError>) -> Void)
```

Only the owner of the Qualification type can grant a Qualification request for that&#9;type.

A successful request for the AcceptQualificationRequest operation
returns with no errors and an empty body.

### `approveAssignment(input:completion:)`

The ApproveAssignment operation approves the results of a completed assignment.

``` swift
public func approveAssignment(input: ApproveAssignmentInput, completion: @escaping (ClientRuntime.SdkResult<ApproveAssignmentOutputResponse, ApproveAssignmentOutputError>) -> Void)
```

Approving an assignment initiates two payments from the Requester's Amazon.com account

``` 
    The Worker who submitted the results is paid the reward specified in the HIT.




    Amazon Mechanical Turk fees are debited.
```

If the Requester's account does not have adequate funds for these payments,
the call to ApproveAssignment returns an exception, and the approval is not processed.
You can include an optional feedback message with the approval,
which the Worker can see in the Status section of the web site.

You can also call this operation for assignments that were previous rejected
and approve them by explicitly overriding the previous rejection.
This only works on rejected assignments that were submitted within the previous 30 days
and only if the assignment's related HIT has not been deleted.

### `associateQualificationWithWorker(input:completion:)`

The AssociateQualificationWithWorker operation gives a Worker a
Qualification. AssociateQualificationWithWorker does not require that the Worker
submit a Qualification request. It gives the Qualification directly to the Worker.

``` swift
public func associateQualificationWithWorker(input: AssociateQualificationWithWorkerInput, completion: @escaping (ClientRuntime.SdkResult<AssociateQualificationWithWorkerOutputResponse, AssociateQualificationWithWorkerOutputError>) -> Void)
```

You can only assign a Qualification of a Qualification type that you created (using
the CreateQualificationType operation).

``` 
Note: AssociateQualificationWithWorker does not affect any pending Qualification
requests for the Qualification by the Worker. If you assign a Qualification to a
Worker, then later grant a Qualification request made by the Worker, the granting of
the request may modify the Qualification score. To resolve a pending Qualification
request without affecting the Qualification the Worker already has, reject the
request with the RejectQualificationRequest operation.
```

### `createAdditionalAssignmentsForHIT(input:completion:)`

The
CreateAdditionalAssignmentsForHIT
operation increases the maximum number of assignments of an existing HIT.

``` swift
public func createAdditionalAssignmentsForHIT(input: CreateAdditionalAssignmentsForHITInput, completion: @escaping (ClientRuntime.SdkResult<CreateAdditionalAssignmentsForHITOutputResponse, CreateAdditionalAssignmentsForHITOutputError>) -> Void)
```

To extend the maximum number of assignments, specify the number of additional assignments.

``` 
    HITs created with fewer than 10 assignments cannot be extended to have 10 or more assignments. Attempting to add assignments in a way that brings the total number of assignments for a HIT from fewer than 10 assignments to 10 or more
        assignments will result in an
        AWS.MechanicalTurk.InvalidMaximumAssignmentsIncrease
        exception.


    HITs that were created before July 22, 2015 cannot be extended. Attempting to extend HITs that were created before July 22, 2015 will result in an
        AWS.MechanicalTurk.HITTooOldForExtension
        exception.
```

### `createHIT(input:completion:)`

The CreateHIT operation creates a new Human Intelligence Task (HIT).
The new HIT is made available for Workers to find and accept on the Amazon Mechanical
Turk website.

``` swift
public func createHIT(input: CreateHITInput, completion: @escaping (ClientRuntime.SdkResult<CreateHITOutputResponse, CreateHITOutputError>) -> Void)
```

``` 
        This operation allows you to specify a new HIT by passing in values for the properties of the HIT, such as its title, reward amount and number of assignments. When you pass these values to CreateHIT, a new HIT is created for you, with a new HITTypeID. The HITTypeID can be used to create additional HITs in the future without needing to specify common parameters such as the title, description and reward amount each time.
     An alternative way to create HITs is to first generate a HITTypeID using the CreateHITType operation and then call the CreateHITWithHITType operation. This is the recommended best practice for Requesters who are creating large numbers of HITs.


    CreateHIT also supports several ways to provide question data: by providing a value
        for the Question parameter that fully specifies the contents of the HIT, or by providing
        a HitLayoutId and associated HitLayoutParameters.



         If a HIT is created with 10 or more maximum assignments, there is an additional fee. For more information, see
        <a href="https://requester.mturk.com/pricing">Amazon Mechanical Turk Pricing.
```

### `createHITType(input:completion:)`

The CreateHITType operation creates a new HIT type. This operation
allows you to define a standard set of HIT properties to use when creating HITs.
If you register a HIT type with values that match an existing HIT type, the HIT type
ID of the existing type will be returned.

``` swift
public func createHITType(input: CreateHITTypeInput, completion: @escaping (ClientRuntime.SdkResult<CreateHITTypeOutputResponse, CreateHITTypeOutputError>) -> Void)
```

### `createHITWithHITType(input:completion:)`

CreateHITWithHITType also supports several ways to provide question data:​
by providing a value for the Question parameter that fully specifies the contents of the HIT,
or by providing a HitLayoutId and associated HitLayoutParameters.

``` swift
public func createHITWithHITType(input: CreateHITWithHITTypeInput, completion: @escaping (ClientRuntime.SdkResult<CreateHITWithHITTypeOutputResponse, CreateHITWithHITTypeOutputError>) -> Void)
```

``` 
The CreateHITWithHITType operation creates a new Human Intelligence Task (HIT)
using an existing HITTypeID generated by the CreateHITType operation.


This is an alternative way to create HITs from the CreateHIT operation.
This is the recommended best practice for Requesters who are creating large numbers of HITs.
```

``` 
    If a HIT is created with 10 or more maximum assignments, there is an additional fee.
    For more information, see <a href="https://requester.mturk.com/pricing">Amazon Mechanical Turk Pricing.
```

### `createQualificationType(input:completion:)`

The
CreateQualificationType
operation creates a new Qualification type, which is represented by a
QualificationType
data structure.

``` swift
public func createQualificationType(input: CreateQualificationTypeInput, completion: @escaping (ClientRuntime.SdkResult<CreateQualificationTypeOutputResponse, CreateQualificationTypeOutputError>) -> Void)
```

### `createWorkerBlock(input:completion:)`

The CreateWorkerBlock operation allows you to prevent a Worker from working on your HITs. For example, you can block a Worker who is producing poor quality work. You can block up to 100,000 Workers.

``` swift
public func createWorkerBlock(input: CreateWorkerBlockInput, completion: @escaping (ClientRuntime.SdkResult<CreateWorkerBlockOutputResponse, CreateWorkerBlockOutputError>) -> Void)
```

### `deleteHIT(input:completion:)`

The DeleteHIT operation is used to delete HIT that is no longer needed.
Only the Requester who created the HIT can delete it.

``` swift
public func deleteHIT(input: DeleteHITInput, completion: @escaping (ClientRuntime.SdkResult<DeleteHITOutputResponse, DeleteHITOutputError>) -> Void)
```

You can only dispose of HITs that are in the Reviewable state,
with all of their submitted assignments already either approved or rejected.
If you call the DeleteHIT operation on a HIT that is not in the Reviewable state
(for example, that has not expired, or still has active assignments),
or on a HIT that is Reviewable but without all of its submitted assignments
already approved or rejected, the service will return an error.

``` 
        HITs are automatically disposed of after 120 days.




        After you dispose of a HIT, you can no longer approve the HIT's rejected assignments.




        Disposed HITs are not returned in results for the ListHITs operation.




        Disposing HITs can improve the performance of operations such as ListReviewableHITs and ListHITs.
```

### `deleteQualificationType(input:completion:)`

This operation does not revoke Qualifications already assigned
to Workers because the Qualifications might be needed for active HITs.
If there are any pending requests for the Qualification type, Amazon
Mechanical Turk rejects those requests. After you delete a
Qualification type, you can no longer use it to create HITs or HIT
types.

``` swift
public func deleteQualificationType(input: DeleteQualificationTypeInput, completion: @escaping (ClientRuntime.SdkResult<DeleteQualificationTypeOutputResponse, DeleteQualificationTypeOutputError>) -> Void)
```

``` 
The
DeleteQualificationType
deletes a Qualification type and deletes any HIT types that are
associated with the Qualification type.
```

``` 
DeleteQualificationType must wait for all the HITs that use
    the deleted Qualification type to be deleted before completing. It
    may take up to 48 hours before DeleteQualificationType completes and
    the unique name of the Qualification type is available for reuse with
    CreateQualificationType.
```

### `deleteWorkerBlock(input:completion:)`

The DeleteWorkerBlock operation allows you to reinstate a blocked Worker to work on your HITs. This operation reverses the effects of the CreateWorkerBlock operation. You need the Worker ID to use this operation. If the Worker ID is missing or invalid, this operation fails and returns the message “WorkerId is invalid.” If the specified Worker is not blocked, this operation returns successfully.

``` swift
public func deleteWorkerBlock(input: DeleteWorkerBlockInput, completion: @escaping (ClientRuntime.SdkResult<DeleteWorkerBlockOutputResponse, DeleteWorkerBlockOutputError>) -> Void)
```

### `disassociateQualificationFromWorker(input:completion:)`

The &#9;DisassociateQualificationFromWorker
revokes a previously granted Qualification from a user.

``` swift
public func disassociateQualificationFromWorker(input: DisassociateQualificationFromWorkerInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateQualificationFromWorkerOutputResponse, DisassociateQualificationFromWorkerOutputError>) -> Void)
```

You can provide a text message explaining why the Qualification was
revoked. The user who had the Qualification can see this message.

### `getAccountBalance(input:completion:)`

The GetAccountBalance operation retrieves the Prepaid HITs balance in your Amazon Mechanical Turk account if you are a Prepaid Requester.
Alternatively, this operation will retrieve the remaining available AWS Billing usage if you have enabled AWS Billing.
Note:​ If you have enabled AWS Billing and still have a remaining Prepaid HITs balance, this balance can be viewed on the My Account page in the Requester console.

``` swift
public func getAccountBalance(input: GetAccountBalanceInput, completion: @escaping (ClientRuntime.SdkResult<GetAccountBalanceOutputResponse, GetAccountBalanceOutputError>) -> Void)
```

### `getAssignment(input:completion:)`

The GetAssignment operation retrieves the details of the specified Assignment.

``` swift
public func getAssignment(input: GetAssignmentInput, completion: @escaping (ClientRuntime.SdkResult<GetAssignmentOutputResponse, GetAssignmentOutputError>) -> Void)
```

### `getFileUploadURL(input:completion:)`

The
GetFileUploadURL
operation generates and returns a temporary URL. You use the
temporary URL to retrieve a file uploaded by a Worker as an answer to
a FileUploadAnswer question for a HIT. The temporary URL is generated
the instant the GetFileUploadURL operation is called, and is valid
for 60 seconds. You can get a temporary file upload URL any time
until the HIT is disposed. After the HIT is disposed, any uploaded
files are deleted, and cannot be retrieved.

``` swift
public func getFileUploadURL(input: GetFileUploadURLInput, completion: @escaping (ClientRuntime.SdkResult<GetFileUploadURLOutputResponse, GetFileUploadURLOutputError>) -> Void)
```

Pending Deprecation on December 12, 2017. The Answer Specification
structure will no longer  support the FileUploadAnswer
element to be used for the QuestionForm data structure.
Instead, we recommend that Requesters who want to create HITs asking
Workers to upload files to use Amazon S3.

### `getHIT(input:completion:)`

The GetHIT operation retrieves the details of the specified HIT.

``` swift
public func getHIT(input: GetHITInput, completion: @escaping (ClientRuntime.SdkResult<GetHITOutputResponse, GetHITOutputError>) -> Void)
```

### `getQualificationScore(input:completion:)`

Only the owner of a Qualification type can query the value of
a Worker's Qualification of that type.

``` swift
public func getQualificationScore(input: GetQualificationScoreInput, completion: @escaping (ClientRuntime.SdkResult<GetQualificationScoreOutputResponse, GetQualificationScoreOutputError>) -> Void)
```

``` 
The
GetQualificationScore
operation returns the value of a Worker's Qualification for a given
Qualification type.


To get a Worker's Qualification, you must know the Worker's ID. The
Worker's ID is included in the assignment data returned by the
ListAssignmentsForHIT
operation.
```

### `getQualificationType(input:completion:)`

The GetQualificationTypeoperation retrieves information about a Qualification type using its ID.

``` swift
public func getQualificationType(input: GetQualificationTypeInput, completion: @escaping (ClientRuntime.SdkResult<GetQualificationTypeOutputResponse, GetQualificationTypeOutputError>) -> Void)
```

### `listAssignmentsForHIT(input:completion:)`

The
ListAssignmentsForHIT
operation retrieves completed assignments for a HIT. You can use this
operation to retrieve the results for a HIT.

``` swift
public func listAssignmentsForHIT(input: ListAssignmentsForHITInput, completion: @escaping (ClientRuntime.SdkResult<ListAssignmentsForHITOutputResponse, ListAssignmentsForHITOutputError>) -> Void)
```

You can get assignments for a HIT at any time, even if the
HIT is not yet Reviewable. If a HIT requested multiple assignments,
and has received some results but has not yet become Reviewable, you
can still retrieve the partial results with this operation.

Use the AssignmentStatus parameter to control which set of
assignments for a HIT are returned. The ListAssignmentsForHIT
operation
can return submitted assignments awaiting approval, or it can return
assignments that have already been approved or rejected. You can set
AssignmentStatus=Approved,Rejected to get assignments that have
already been approved and rejected together in one result set.

Only the Requester who created the HIT can retrieve the
assignments for that HIT.

Results are sorted and divided into numbered pages and the
operation returns a single page of results. You can use the
parameters
of the operation to control sorting and pagination.

### `listBonusPayments(input:completion:)`

The
ListBonusPayments
operation retrieves the amounts of bonuses you have paid to Workers
for a given HIT or assignment.

``` swift
public func listBonusPayments(input: ListBonusPaymentsInput, completion: @escaping (ClientRuntime.SdkResult<ListBonusPaymentsOutputResponse, ListBonusPaymentsOutputError>) -> Void)
```

### `listHITs(input:completion:)`

The
ListHITs
operation returns all of a Requester's HITs. The operation returns
HITs of any status, except for HITs that have been deleted of with
the DeleteHIT operation or that have been auto-deleted.

``` swift
public func listHITs(input: ListHITsInput, completion: @escaping (ClientRuntime.SdkResult<ListHITsOutputResponse, ListHITsOutputError>) -> Void)
```

### `listHITsForQualificationType(input:completion:)`

The ListHITsForQualificationType operation returns the HITs that use
the given Qualification type for a Qualification requirement.
The operation returns HITs of any status, except for HITs that have been deleted
with the DeleteHIT operation or that have been auto-deleted.

``` swift
public func listHITsForQualificationType(input: ListHITsForQualificationTypeInput, completion: @escaping (ClientRuntime.SdkResult<ListHITsForQualificationTypeOutputResponse, ListHITsForQualificationTypeOutputError>) -> Void)
```

### `listQualificationRequests(input:completion:)`

The
ListQualificationRequests
operation retrieves requests for Qualifications of a particular
Qualification type. The owner of the Qualification type calls this
operation to poll for pending requests, and accepts them using the
AcceptQualification operation.

``` swift
public func listQualificationRequests(input: ListQualificationRequestsInput, completion: @escaping (ClientRuntime.SdkResult<ListQualificationRequestsOutputResponse, ListQualificationRequestsOutputError>) -> Void)
```

### `listQualificationTypes(input:completion:)`

The
ListQualificationTypes
operation returns a list of Qualification types, filtered by
an optional search term.

``` swift
public func listQualificationTypes(input: ListQualificationTypesInput, completion: @escaping (ClientRuntime.SdkResult<ListQualificationTypesOutputResponse, ListQualificationTypesOutputError>) -> Void)
```

### `listReviewPolicyResultsForHIT(input:completion:)`

The ListReviewPolicyResultsForHIT operation retrieves the computed results
and the actions taken in the course of executing your Review Policies for a given HIT.
For information about how to specify Review Policies when you call CreateHIT,
see Review Policies. The ListReviewPolicyResultsForHIT operation can return results for both
Assignment-level and HIT-level review results.

``` swift
public func listReviewPolicyResultsForHIT(input: ListReviewPolicyResultsForHITInput, completion: @escaping (ClientRuntime.SdkResult<ListReviewPolicyResultsForHITOutputResponse, ListReviewPolicyResultsForHITOutputError>) -> Void)
```

### `listReviewableHITs(input:completion:)`

The ListReviewableHITs operation retrieves the HITs with Status equal to
Reviewable or Status equal to Reviewing that belong to the Requester calling the operation.

``` swift
public func listReviewableHITs(input: ListReviewableHITsInput, completion: @escaping (ClientRuntime.SdkResult<ListReviewableHITsOutputResponse, ListReviewableHITsOutputError>) -> Void)
```

### `listWorkerBlocks(input:completion:)`

The ListWorkersBlocks operation retrieves a list of Workers who are blocked from working on your HITs.

``` swift
public func listWorkerBlocks(input: ListWorkerBlocksInput, completion: @escaping (ClientRuntime.SdkResult<ListWorkerBlocksOutputResponse, ListWorkerBlocksOutputError>) -> Void)
```

### `listWorkersWithQualificationType(input:completion:)`

The ListWorkersWithQualificationType operation returns all of the Workers
that have been associated with a given Qualification type.

``` swift
public func listWorkersWithQualificationType(input: ListWorkersWithQualificationTypeInput, completion: @escaping (ClientRuntime.SdkResult<ListWorkersWithQualificationTypeOutputResponse, ListWorkersWithQualificationTypeOutputError>) -> Void)
```

### `notifyWorkers(input:completion:)`

The
NotifyWorkers
operation sends an email to one or more Workers that you specify with
the Worker ID. You can specify up to 100 Worker IDs to send the same
message with a single call to the NotifyWorkers operation. The
NotifyWorkers operation will send a notification email to a Worker
only if you have previously approved or rejected work from the
Worker.

``` swift
public func notifyWorkers(input: NotifyWorkersInput, completion: @escaping (ClientRuntime.SdkResult<NotifyWorkersOutputResponse, NotifyWorkersOutputError>) -> Void)
```

### `rejectAssignment(input:completion:)`

The RejectAssignment operation rejects the results of a completed assignment.

``` swift
public func rejectAssignment(input: RejectAssignmentInput, completion: @escaping (ClientRuntime.SdkResult<RejectAssignmentOutputResponse, RejectAssignmentOutputError>) -> Void)
```

You can include an optional feedback message with the rejection,
which the Worker can see in the Status section of the web site.
When you include a feedback message with the rejection,
it helps the Worker understand why the assignment was rejected,
and can improve the quality of the results the Worker submits in the future.

Only the Requester who created the HIT can reject an assignment for the HIT.

### `rejectQualificationRequest(input:completion:)`

The
RejectQualificationRequest
operation rejects a user's request for a Qualification.

``` swift
public func rejectQualificationRequest(input: RejectQualificationRequestInput, completion: @escaping (ClientRuntime.SdkResult<RejectQualificationRequestOutputResponse, RejectQualificationRequestOutputError>) -> Void)
```

You can provide a text message explaining why the request was
rejected. The Worker who made the request can see this message.

### `sendBonus(input:completion:)`

The
SendBonus
operation issues a payment of money from your account to a Worker.
This payment happens separately from the reward you pay to the Worker
when you approve the Worker's assignment. The SendBonus operation
requires the Worker's ID and the assignment ID as parameters to
initiate payment of the bonus. You must include a message that
explains the reason for the bonus payment, as the Worker may not be
expecting the payment. Amazon Mechanical Turk collects a fee for
bonus payments, similar to the HIT listing fee. This operation fails
if your account does not have enough funds to pay for both the bonus
and the fees.

``` swift
public func sendBonus(input: SendBonusInput, completion: @escaping (ClientRuntime.SdkResult<SendBonusOutputResponse, SendBonusOutputError>) -> Void)
```

### `sendTestEventNotification(input:completion:)`

The SendTestEventNotification operation causes Amazon Mechanical Turk to send
a notification message as if a HIT event occurred, according to the provided
notification specification. This allows you to test notifications without
setting up notifications for a real HIT type and trying to trigger them using the website.
When you call this operation, the service attempts to send the test notification immediately.

``` swift
public func sendTestEventNotification(input: SendTestEventNotificationInput, completion: @escaping (ClientRuntime.SdkResult<SendTestEventNotificationOutputResponse, SendTestEventNotificationOutputError>) -> Void)
```

### `updateExpirationForHIT(input:completion:)`

The UpdateExpirationForHIT operation allows you update the expiration time of a HIT.
If you update it to a time in the past, the HIT will be immediately expired.

``` swift
public func updateExpirationForHIT(input: UpdateExpirationForHITInput, completion: @escaping (ClientRuntime.SdkResult<UpdateExpirationForHITOutputResponse, UpdateExpirationForHITOutputError>) -> Void)
```

### `updateHITReviewStatus(input:completion:)`

The UpdateHITReviewStatus operation updates the status of a HIT.
If the status is Reviewable, this operation can update the status to Reviewing,
or it can revert a Reviewing HIT back to the Reviewable status.

``` swift
public func updateHITReviewStatus(input: UpdateHITReviewStatusInput, completion: @escaping (ClientRuntime.SdkResult<UpdateHITReviewStatusOutputResponse, UpdateHITReviewStatusOutputError>) -> Void)
```

### `updateHITTypeOfHIT(input:completion:)`

The
UpdateHITTypeOfHIT
operation allows you to change the HITType properties of a HIT. This
operation disassociates the HIT from its old HITType properties and
associates it with the new HITType properties. The HIT takes on the
properties of the new HITType in place of the old ones.

``` swift
public func updateHITTypeOfHIT(input: UpdateHITTypeOfHITInput, completion: @escaping (ClientRuntime.SdkResult<UpdateHITTypeOfHITOutputResponse, UpdateHITTypeOfHITOutputError>) -> Void)
```

### `updateNotificationSettings(input:completion:)`

The UpdateNotificationSettings operation creates, updates,
disables or re-enables notifications for a HIT type.
If you call the UpdateNotificationSettings operation for a HIT type that already has a
notification specification, the operation replaces the old specification with a new one.
You can call the UpdateNotificationSettings operation to enable or disable notifications
for the HIT type, without having to modify the notification specification itself by providing
updates to the Active status without specifying a new notification specification.
To change the Active status of a HIT type's notifications,
the HIT type must already have a notification specification,
or one must be provided in the same call to UpdateNotificationSettings.

``` swift
public func updateNotificationSettings(input: UpdateNotificationSettingsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateNotificationSettingsOutputResponse, UpdateNotificationSettingsOutputError>) -> Void)
```

### `updateQualificationType(input:completion:)`

The
UpdateQualificationType
operation modifies the attributes of an existing Qualification type,
which is represented by a QualificationType data structure. Only the
owner of a Qualification type can modify its attributes.

``` swift
public func updateQualificationType(input: UpdateQualificationTypeInput, completion: @escaping (ClientRuntime.SdkResult<UpdateQualificationTypeOutputResponse, UpdateQualificationTypeOutputError>) -> Void)
```

Most attributes of a Qualification type can be changed after
the type has been created. However, the Name and Keywords fields
cannot be modified. The RetryDelayInSeconds parameter can be modified
or added to change the delay or to enable retries, but
RetryDelayInSeconds cannot be used to disable retries.
You can use this operation to update the test for a
Qualification type. The test is updated based on the values specified
for the Test, TestDurationInSeconds and AnswerKey parameters. All
three parameters specify the updated test. If you are updating the
test for a type, you must specify the Test and TestDurationInSeconds
parameters. The AnswerKey parameter is optional; omitting it specifies
that the updated test does not have an answer key.
If you omit the Test parameter, the test for the
Qualification type is unchanged. There is no way to remove a test from
a Qualification type that has one. If the type already has a test, you
cannot update it to be AutoGranted. If the Qualification type does not
have a test and one is provided by an update, the type will henceforth
have a test.
If you want to update the test duration or answer key for an
existing test without changing the questions, you must specify a Test
parameter with the original questions, along with the updated values.
If you provide an updated Test but no AnswerKey, the new test
will not have an answer key. Requests for such Qualifications must be
granted manually.
You can also update the AutoGranted and AutoGrantedValue
attributes of the Qualification type.
