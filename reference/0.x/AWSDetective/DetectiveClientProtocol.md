# DetectiveClientProtocol

Detective uses machine learning and purpose-built visualizations to help you analyze and
investigate security issues across your Amazon Web Services (AWS) workloads. Detective automatically
extracts time-based events such as login attempts, API calls, and network traffic from
AWS CloudTrail and Amazon Virtual Private Cloud (Amazon VPC) flow logs. It also extracts findings detected by
Amazon GuardDuty.
The Detective API primarily supports the creation and management of behavior graphs. A
behavior graph contains the extracted data from a set of member accounts, and is created
and managed by an administrator account.
Every behavior graph is specific to a Region. You can only use the API to manage graphs
that belong to the Region that is associated with the currently selected endpoint.
A Detective administrator account can use the Detective API to do the following:​

``` swift
public protocol DetectiveClientProtocol 
```

``` 
           Enable and disable Detective. Enabling Detective creates a new behavior graph.


           View the list of member accounts in a behavior graph.


           Add member accounts to a behavior graph.


           Remove member accounts from a behavior graph.


     A member account can use the Detective API to do the following:


           View the list of behavior graphs that they are invited to.


           Accept an invitation to contribute to a behavior graph.


           Decline an invitation to contribute to a behavior graph.


           Remove their account from a behavior graph.


     All API actions are logged as CloudTrail events. See <a href="https://docs.aws.amazon.com/detective/latest/adminguide/logging-using-cloudtrail.html">Logging Detective API Calls with CloudTrail.

        We replaced the term "master account" with the term "administrator account." An
        administrator account is used to centrally manage multiple accounts. In the case of
        Detective, the administrator account manages the accounts in their behavior graph.
```

## Requirements

### acceptInvitation(input:​completion:​)

Accepts an invitation for the member account to contribute data to a behavior graph.
This operation can only be called by an invited member account.
The request provides the ARN of behavior graph.
The member account status in the graph must be INVITED.

``` swift
func acceptInvitation(input: AcceptInvitationInput, completion: @escaping (ClientRuntime.SdkResult<AcceptInvitationOutputResponse, AcceptInvitationOutputError>) -> Void)
```

### createGraph(input:​completion:​)

Creates a new behavior graph for the calling account, and sets that account as the
administrator account. This operation is called by the account that is enabling
Detective.
Before you try to enable Detective, make sure that your account has been enrolled in
Amazon GuardDuty for at least 48 hours. If you do not meet this requirement, you cannot enable
Detective. If you do meet the GuardDuty prerequisite, then when you make the request to enable
Detective, it checks whether your data volume is within the Detective quota. If it exceeds the
quota, then you cannot enable Detective.
The operation also enables Detective for the calling account in the currently selected
Region. It returns the ARN of the new behavior graph.

``` swift
func createGraph(input: CreateGraphInput, completion: @escaping (ClientRuntime.SdkResult<CreateGraphOutputResponse, CreateGraphOutputError>) -> Void)
```

``` 
        CreateGraph triggers a process to create the corresponding data tables for
     the new behavior graph.
     An account can only be the administrator account for one behavior graph within a Region.
     If the same account calls CreateGraph with the same administrator account, it
     always returns the same behavior graph ARN. It does not create a new behavior graph.
```

### createMembers(input:​completion:​)

Sends a request to invite the specified AWS accounts to be member accounts in the
behavior graph. This operation can only be called by the administrator account for a
behavior graph.

``` swift
func createMembers(input: CreateMembersInput, completion: @escaping (ClientRuntime.SdkResult<CreateMembersOutputResponse, CreateMembersOutputError>) -> Void)
```

``` 
        CreateMembers verifies the accounts and then invites the verified accounts.
     The administrator can optionally specify to not send invitation emails to the member
     accounts. This would be used when the administrator manages their member accounts
     centrally.
     The request provides the behavior graph ARN and the list of accounts to invite.
     The response separates the requested accounts into two lists:


           The accounts that CreateMembers was able to start the verification
           for. This list includes member accounts that are being verified, that have passed
           verification and are to be invited, and that have failed verification.


           The accounts that CreateMembers was unable to process. This list
           includes accounts that were already invited to be member accounts in the behavior
           graph.
```

### deleteGraph(input:​completion:​)

Disables the specified behavior graph and queues it to be deleted. This operation
removes the graph from each member account's list of behavior graphs.

``` swift
func deleteGraph(input: DeleteGraphInput, completion: @escaping (ClientRuntime.SdkResult<DeleteGraphOutputResponse, DeleteGraphOutputError>) -> Void)
```

``` 
        DeleteGraph can only be called by the administrator account for a behavior
     graph.
```

### deleteMembers(input:​completion:​)

Deletes one or more member accounts from the administrator account's behavior graph.
This operation can only be called by a Detective administrator account. That account cannot use
DeleteMembers to delete their own account from the behavior graph. To
disable a behavior graph, the administrator account uses the DeleteGraph API
method.

``` swift
func deleteMembers(input: DeleteMembersInput, completion: @escaping (ClientRuntime.SdkResult<DeleteMembersOutputResponse, DeleteMembersOutputError>) -> Void)
```

### disassociateMembership(input:​completion:​)

Removes the member account from the specified behavior graph. This operation can only be
called by a member account that has the ENABLED status.

``` swift
func disassociateMembership(input: DisassociateMembershipInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateMembershipOutputResponse, DisassociateMembershipOutputError>) -> Void)
```

### getMembers(input:​completion:​)

Returns the membership details for specified member accounts for a behavior
graph.

``` swift
func getMembers(input: GetMembersInput, completion: @escaping (ClientRuntime.SdkResult<GetMembersOutputResponse, GetMembersOutputError>) -> Void)
```

### listGraphs(input:​completion:​)

Returns the list of behavior graphs that the calling account is an administrator account
of. This operation can only be called by an administrator account.
Because an account can currently only be the administrator of one behavior graph within
a Region, the results always contain a single behavior graph.

``` swift
func listGraphs(input: ListGraphsInput, completion: @escaping (ClientRuntime.SdkResult<ListGraphsOutputResponse, ListGraphsOutputError>) -> Void)
```

### listInvitations(input:​completion:​)

Retrieves the list of open and accepted behavior graph invitations for the member
account. This operation can only be called by a member account.
Open invitations are invitations that the member account has not responded to.
The results do not include behavior graphs for which the member account declined the
invitation. The results also do not include behavior graphs that the member account
resigned from or was removed from.

``` swift
func listInvitations(input: ListInvitationsInput, completion: @escaping (ClientRuntime.SdkResult<ListInvitationsOutputResponse, ListInvitationsOutputError>) -> Void)
```

### listMembers(input:​completion:​)

Retrieves the list of member accounts for a behavior graph. Does not return member
accounts that were removed from the behavior graph.

``` swift
func listMembers(input: ListMembersInput, completion: @escaping (ClientRuntime.SdkResult<ListMembersOutputResponse, ListMembersOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

Returns the tag values that are assigned to a behavior graph.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### rejectInvitation(input:​completion:​)

Rejects an invitation to contribute the account data to a behavior graph. This operation
must be called by a member account that has the INVITED status.

``` swift
func rejectInvitation(input: RejectInvitationInput, completion: @escaping (ClientRuntime.SdkResult<RejectInvitationOutputResponse, RejectInvitationOutputError>) -> Void)
```

### startMonitoringMember(input:​completion:​)

Sends a request to enable data ingest for a member account that has a status of
ACCEPTED\_BUT\_DISABLED.
For valid member accounts, the status is updated as follows.

``` swift
func startMonitoringMember(input: StartMonitoringMemberInput, completion: @escaping (ClientRuntime.SdkResult<StartMonitoringMemberOutputResponse, StartMonitoringMemberOutputError>) -> Void)
```

``` 
           If Detective enabled the member account, then the new status is
           ENABLED.


           If Detective cannot enable the member account, the status remains
              ACCEPTED_BUT_DISABLED.
```

### tagResource(input:​completion:​)

Applies tag values to a behavior graph.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:​completion:​)

Removes tags from a behavior graph.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```
