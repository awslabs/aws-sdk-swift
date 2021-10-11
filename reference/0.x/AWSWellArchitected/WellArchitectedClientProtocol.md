# WellArchitectedClientProtocol

<fullname>AWS Well-Architected Tool</fullname>

``` swift
public protocol WellArchitectedClientProtocol 
```

``` 
     This is the AWS Well-Architected Tool API Reference. The AWS Well-Architected Tool API provides programmatic access to the
        <a href="http://aws.amazon.com/well-architected-tool">AWS Well-Architected Tool in the
        <a href="https://console.aws.amazon.com/wellarchitected">AWS Management Console. For information
        about the AWS Well-Architected Tool, see the
        <a href="https://docs.aws.amazon.com/wellarchitected/latest/userguide/intro.html">AWS Well-Architected Tool User Guide.
```

## Requirements

### associateLenses(input:​completion:​)

Associate a lens to a workload.

``` swift
func associateLenses(input: AssociateLensesInput, completion: @escaping (ClientRuntime.SdkResult<AssociateLensesOutputResponse, AssociateLensesOutputError>) -> Void)
```

### createMilestone(input:​completion:​)

Create a milestone for an existing workload.

``` swift
func createMilestone(input: CreateMilestoneInput, completion: @escaping (ClientRuntime.SdkResult<CreateMilestoneOutputResponse, CreateMilestoneOutputError>) -> Void)
```

### createWorkload(input:​completion:​)

Create a new workload.
The owner of a workload can share the workload with other AWS accounts and IAM users
in the same AWS Region. Only the owner of a workload can delete it.
For more information, see <a href="https:​//docs.aws.amazon.com/wellarchitected/latest/userguide/define-workload.html">Defining a Workload in the
AWS Well-Architected Tool User Guide.

``` swift
func createWorkload(input: CreateWorkloadInput, completion: @escaping (ClientRuntime.SdkResult<CreateWorkloadOutputResponse, CreateWorkloadOutputError>) -> Void)
```

### createWorkloadShare(input:​completion:​)

Create a workload share.
The owner of a workload can share it with other AWS accounts and IAM users in the same
AWS Region. Shared access to a workload is not removed until the workload invitation is
deleted.
For more information, see <a href="https:​//docs.aws.amazon.com/wellarchitected/latest/userguide/workloads-sharing.html">Sharing a Workload in the
AWS Well-Architected Tool User Guide.

``` swift
func createWorkloadShare(input: CreateWorkloadShareInput, completion: @escaping (ClientRuntime.SdkResult<CreateWorkloadShareOutputResponse, CreateWorkloadShareOutputError>) -> Void)
```

### deleteWorkload(input:​completion:​)

Delete an existing workload.

``` swift
func deleteWorkload(input: DeleteWorkloadInput, completion: @escaping (ClientRuntime.SdkResult<DeleteWorkloadOutputResponse, DeleteWorkloadOutputError>) -> Void)
```

### deleteWorkloadShare(input:​completion:​)

Delete a workload share.

``` swift
func deleteWorkloadShare(input: DeleteWorkloadShareInput, completion: @escaping (ClientRuntime.SdkResult<DeleteWorkloadShareOutputResponse, DeleteWorkloadShareOutputError>) -> Void)
```

### disassociateLenses(input:​completion:​)

Disassociate a lens from a workload.

``` swift
func disassociateLenses(input: DisassociateLensesInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateLensesOutputResponse, DisassociateLensesOutputError>) -> Void)
```

``` 
        The AWS Well-Architected Framework lens (wellarchitected) cannot be
            removed from a workload.
```

### getAnswer(input:​completion:​)

Get the answer to a specific question in a workload review.

``` swift
func getAnswer(input: GetAnswerInput, completion: @escaping (ClientRuntime.SdkResult<GetAnswerOutputResponse, GetAnswerOutputError>) -> Void)
```

### getLensReview(input:​completion:​)

Get lens review.

``` swift
func getLensReview(input: GetLensReviewInput, completion: @escaping (ClientRuntime.SdkResult<GetLensReviewOutputResponse, GetLensReviewOutputError>) -> Void)
```

### getLensReviewReport(input:​completion:​)

Get lens review report.

``` swift
func getLensReviewReport(input: GetLensReviewReportInput, completion: @escaping (ClientRuntime.SdkResult<GetLensReviewReportOutputResponse, GetLensReviewReportOutputError>) -> Void)
```

### getLensVersionDifference(input:​completion:​)

Get lens version differences.

``` swift
func getLensVersionDifference(input: GetLensVersionDifferenceInput, completion: @escaping (ClientRuntime.SdkResult<GetLensVersionDifferenceOutputResponse, GetLensVersionDifferenceOutputError>) -> Void)
```

### getMilestone(input:​completion:​)

Get a milestone for an existing workload.

``` swift
func getMilestone(input: GetMilestoneInput, completion: @escaping (ClientRuntime.SdkResult<GetMilestoneOutputResponse, GetMilestoneOutputError>) -> Void)
```

### getWorkload(input:​completion:​)

Get an existing workload.

``` swift
func getWorkload(input: GetWorkloadInput, completion: @escaping (ClientRuntime.SdkResult<GetWorkloadOutputResponse, GetWorkloadOutputError>) -> Void)
```

### listAnswers(input:​completion:​)

List of answers.

``` swift
func listAnswers(input: ListAnswersInput, completion: @escaping (ClientRuntime.SdkResult<ListAnswersOutputResponse, ListAnswersOutputError>) -> Void)
```

### listLenses(input:​completion:​)

List the available lenses.

``` swift
func listLenses(input: ListLensesInput, completion: @escaping (ClientRuntime.SdkResult<ListLensesOutputResponse, ListLensesOutputError>) -> Void)
```

### listLensReviewImprovements(input:​completion:​)

List lens review improvements.

``` swift
func listLensReviewImprovements(input: ListLensReviewImprovementsInput, completion: @escaping (ClientRuntime.SdkResult<ListLensReviewImprovementsOutputResponse, ListLensReviewImprovementsOutputError>) -> Void)
```

### listLensReviews(input:​completion:​)

List lens reviews.

``` swift
func listLensReviews(input: ListLensReviewsInput, completion: @escaping (ClientRuntime.SdkResult<ListLensReviewsOutputResponse, ListLensReviewsOutputError>) -> Void)
```

### listMilestones(input:​completion:​)

List all milestones for an existing workload.

``` swift
func listMilestones(input: ListMilestonesInput, completion: @escaping (ClientRuntime.SdkResult<ListMilestonesOutputResponse, ListMilestonesOutputError>) -> Void)
```

### listNotifications(input:​completion:​)

List lens notifications.

``` swift
func listNotifications(input: ListNotificationsInput, completion: @escaping (ClientRuntime.SdkResult<ListNotificationsOutputResponse, ListNotificationsOutputError>) -> Void)
```

### listShareInvitations(input:​completion:​)

List  the workload invitations.

``` swift
func listShareInvitations(input: ListShareInvitationsInput, completion: @escaping (ClientRuntime.SdkResult<ListShareInvitationsOutputResponse, ListShareInvitationsOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

List the tags for a resource.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### listWorkloads(input:​completion:​)

List workloads. Paginated.

``` swift
func listWorkloads(input: ListWorkloadsInput, completion: @escaping (ClientRuntime.SdkResult<ListWorkloadsOutputResponse, ListWorkloadsOutputError>) -> Void)
```

### listWorkloadShares(input:​completion:​)

List the workload shares associated with the workload.

``` swift
func listWorkloadShares(input: ListWorkloadSharesInput, completion: @escaping (ClientRuntime.SdkResult<ListWorkloadSharesOutputResponse, ListWorkloadSharesOutputError>) -> Void)
```

### tagResource(input:​completion:​)

Adds one or more tags to the specified resource.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:​completion:​)

Deletes specified tags from a resource.
To specify multiple tags, use separate tagKeys parameters, for example:​

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

``` 
        DELETE /tags/WorkloadArn?tagKeys=key1&tagKeys=key2
```

### updateAnswer(input:​completion:​)

Update the answer to a specific question in a workload review.

``` swift
func updateAnswer(input: UpdateAnswerInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAnswerOutputResponse, UpdateAnswerOutputError>) -> Void)
```

### updateLensReview(input:​completion:​)

Update lens review.

``` swift
func updateLensReview(input: UpdateLensReviewInput, completion: @escaping (ClientRuntime.SdkResult<UpdateLensReviewOutputResponse, UpdateLensReviewOutputError>) -> Void)
```

### updateShareInvitation(input:​completion:​)

Update a workload invitation.

``` swift
func updateShareInvitation(input: UpdateShareInvitationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateShareInvitationOutputResponse, UpdateShareInvitationOutputError>) -> Void)
```

### updateWorkload(input:​completion:​)

Update an existing workload.

``` swift
func updateWorkload(input: UpdateWorkloadInput, completion: @escaping (ClientRuntime.SdkResult<UpdateWorkloadOutputResponse, UpdateWorkloadOutputError>) -> Void)
```

### updateWorkloadShare(input:​completion:​)

Update a workload share.

``` swift
func updateWorkloadShare(input: UpdateWorkloadShareInput, completion: @escaping (ClientRuntime.SdkResult<UpdateWorkloadShareOutputResponse, UpdateWorkloadShareOutputError>) -> Void)
```

### upgradeLensReview(input:​completion:​)

Upgrade lens review.

``` swift
func upgradeLensReview(input: UpgradeLensReviewInput, completion: @escaping (ClientRuntime.SdkResult<UpgradeLensReviewOutputResponse, UpgradeLensReviewOutputError>) -> Void)
```
