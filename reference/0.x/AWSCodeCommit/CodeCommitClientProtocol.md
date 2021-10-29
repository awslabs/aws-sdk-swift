# CodeCommitClientProtocol

AWS CodeCommit This is the AWS CodeCommit API Reference. This reference provides descriptions of the operations and data types for AWS CodeCommit API along with usage examples. You can use the AWS CodeCommit API to work with the following objects: Repositories, by calling the following:

``` swift
public protocol CodeCommitClientProtocol 
```

  - \[BatchGetRepositories\], which returns information about one or more repositories associated with your AWS account.

  - \[CreateRepository\], which creates an AWS CodeCommit repository.

  - \[DeleteRepository\], which deletes an AWS CodeCommit repository.

  - \[GetRepository\], which returns information about a specified repository.

  - \[ListRepositories\], which lists all AWS CodeCommit repositories associated with your AWS account.

  - \[UpdateRepositoryDescription\], which sets or updates the description of the repository.

  - \[UpdateRepositoryName\], which changes the name of the repository. If you change the name of a repository, no other users of that repository can access it until you send them the new HTTPS or SSH URL to use.

Branches, by calling the following:

  - \[CreateBranch\], which creates a branch in a specified repository.

  - \[DeleteBranch\], which deletes the specified branch in a repository unless it is the default branch.

  - \[GetBranch\], which returns information about a specified branch.

  - \[ListBranches\], which lists all branches for a specified repository.

  - \[UpdateDefaultBranch\], which changes the default branch for a repository.

Files, by calling the following:

  - \[DeleteFile\], which deletes the content of a specified file from a specified branch.

  - \[GetBlob\], which returns the base-64 encoded content of an individual Git blob object in a repository.

  - \[GetFile\], which returns the base-64 encoded content of a specified file.

  - \[GetFolder\], which returns the contents of a specified folder or directory.

  - \[PutFile\], which adds or modifies a single file in a specified repository and branch.

Commits, by calling the following:

  - \[BatchGetCommits\], which returns information about one or more commits in a repository.

  - \[CreateCommit\], which creates a commit for changes to a repository.

  - \[GetCommit\], which returns information about a commit, including commit messages and author and committer information.

  - \[GetDifferences\], which returns information about the differences in a valid commit specifier (such as a branch, tag, HEAD, commit ID, or other fully qualified reference).

Merges, by calling the following:

  - \[BatchDescribeMergeConflicts\], which returns information about conflicts in a merge between commits in a repository.

  - \[CreateUnreferencedMergeCommit\], which creates an unreferenced commit between two branches or commits for the purpose of comparing them and identifying any potential conflicts.

  - \[DescribeMergeConflicts\], which returns information about merge conflicts between the base, source, and destination versions of a file in a potential merge.

  - \[GetMergeCommit\], which returns information about the merge between a source and destination commit.

  - \[GetMergeConflicts\], which returns information about merge conflicts between the source and destination branch in a pull request.

  - \[GetMergeOptions\], which returns information about the available merge options between two branches or commit specifiers.

  - \[MergeBranchesByFastForward\], which merges two branches using the fast-forward merge option.

  - \[MergeBranchesBySquash\], which merges two branches using the squash merge option.

  - \[MergeBranchesByThreeWay\], which merges two branches using the three-way merge option.

Pull requests, by calling the following:

  - \[CreatePullRequest\], which creates a pull request in a specified repository.

  - \[CreatePullRequestApprovalRule\], which creates an approval rule for a specified pull request.

  - \[DeletePullRequestApprovalRule\], which deletes an approval rule for a specified pull request.

  - \[DescribePullRequestEvents\], which returns information about one or more pull request events.

  - \[EvaluatePullRequestApprovalRules\], which evaluates whether a pull request has met all the conditions specified in its associated approval rules.

  - \[GetCommentsForPullRequest\], which returns information about comments on a specified pull request.

  - \[GetPullRequest\], which returns information about a specified pull request.

  - \[GetPullRequestApprovalStates\], which returns information about the approval states for a specified pull request.

  - \[GetPullRequestOverrideState\], which returns information about whether approval rules have been set aside (overriden) for a pull request, and if so, the Amazon Resource Name (ARN) of the user or identity that overrode the rules and their requirements for the pull request.

  - \[ListPullRequests\], which lists all pull requests for a repository.

  - \[MergePullRequestByFastForward\], which merges the source destination branch of a pull request into the specified destination branch for that pull request using the fast-forward merge option.

  - \[MergePullRequestBySquash\], which merges the source destination branch of a pull request into the specified destination branch for that pull request using the squash merge option.

  - \[MergePullRequestByThreeWay\]. which merges the source destination branch of a pull request into the specified destination branch for that pull request using the three-way merge option.

  - \[OverridePullRequestApprovalRules\], which sets aside all approval rule requirements for a pull request.

  - \[PostCommentForPullRequest\], which posts a comment to a pull request at the specified line, file, or request.

  - \[UpdatePullRequestApprovalRuleContent\], which updates the structure of an approval rule for a pull request.

  - \[UpdatePullRequestApprovalState\], which updates the state of an approval on a pull request.

  - \[UpdatePullRequestDescription\], which updates the description of a pull request.

  - \[UpdatePullRequestStatus\], which updates the status of a pull request.

  - \[UpdatePullRequestTitle\], which updates the title of a pull request.

Approval rule templates, by calling the following:

  - \[AssociateApprovalRuleTemplateWithRepository\], which associates a template with a specified repository. After the template is associated with a repository, AWS CodeCommit creates approval rules that match the template conditions on every pull request created in the specified repository.

  - \[BatchAssociateApprovalRuleTemplateWithRepositories\], which associates a template with one or more specified repositories. After the template is associated with a repository, AWS CodeCommit creates approval rules that match the template conditions on every pull request created in the specified repositories.

  - \[BatchDisassociateApprovalRuleTemplateFromRepositories\], which removes the association between a template and specified repositories so that approval rules based on the template are not automatically created when pull requests are created in those repositories.

  - \[CreateApprovalRuleTemplate\], which creates a template for approval rules that can then be associated with one or more repositories in your AWS account.

  - \[DeleteApprovalRuleTemplate\], which deletes the specified template. It does not remove approval rules on pull requests already created with the template.

  - \[DisassociateApprovalRuleTemplateFromRepository\], which removes the association between a template and a repository so that approval rules based on the template are not automatically created when pull requests are created in the specified repository.

  - \[GetApprovalRuleTemplate\], which returns information about an approval rule template.

  - \[ListApprovalRuleTemplates\], which lists all approval rule templates in the AWS Region in your AWS account.

  - \[ListAssociatedApprovalRuleTemplatesForRepository\], which lists all approval rule templates that are associated with a specified repository.

  - \[ListRepositoriesForApprovalRuleTemplate\], which lists all repositories associated with the specified approval rule template.

  - \[UpdateApprovalRuleTemplateDescription\], which updates the description of an approval rule template.

  - \[UpdateApprovalRuleTemplateName\], which updates the name of an approval rule template.

  - \[UpdateApprovalRuleTemplateContent\], which updates the content of an approval rule template.

Comments in a repository, by calling the following:

  - \[DeleteCommentContent\], which deletes the content of a comment on a commit in a repository.

  - \[GetComment\], which returns information about a comment on a commit.

  - \[GetCommentReactions\], which returns information about emoji reactions to comments.

  - \[GetCommentsForComparedCommit\], which returns information about comments on the comparison between two commit specifiers in a repository.

  - \[PostCommentForComparedCommit\], which creates a comment on the comparison between two commit specifiers in a repository.

  - \[PostCommentReply\], which creates a reply to a comment.

  - \[PutCommentReaction\], which creates or updates an emoji reaction to a comment.

  - \[UpdateComment\], which updates the content of a comment on a commit in a repository.

Tags used to tag resources in AWS CodeCommit (not Git tags), by calling the following:

  - \[ListTagsForResource\], which gets information about AWS tags for a specified Amazon Resource Name (ARN) in AWS CodeCommit.

  - \[TagResource\], which adds or updates tags for a resource in AWS CodeCommit.

  - \[UntagResource\], which removes tags for a resource in AWS CodeCommit.

Triggers, by calling the following:

  - \[GetRepositoryTriggers\], which returns information about triggers configured for a repository.

  - \[PutRepositoryTriggers\], which replaces all triggers for a repository and can be used to create or delete triggers.

  - \[TestRepositoryTriggers\], which tests the functionality of a repository trigger by sending data to the trigger target.

For information about how to use AWS CodeCommit, see the [AWS CodeCommit User Guide](https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html).

## Requirements

### associateApprovalRuleTemplateWithRepository(input:completion:)

Creates an association between an approval rule template and a specified repository. Then, the next time a pull request is created in the repository where the destination reference (if specified) matches the destination reference (branch) for the pull request, an approval rule that matches the template conditions is automatically created for that pull request. If no destination references are specified in the template, an approval rule that matches the template contents is created for all pull requests in that repository.

``` swift
func associateApprovalRuleTemplateWithRepository(input: AssociateApprovalRuleTemplateWithRepositoryInput, completion: @escaping (ClientRuntime.SdkResult<AssociateApprovalRuleTemplateWithRepositoryOutputResponse, AssociateApprovalRuleTemplateWithRepositoryOutputError>) -> Void)
```

### batchAssociateApprovalRuleTemplateWithRepositories(input:completion:)

Creates an association between an approval rule template and one or more specified repositories.

``` swift
func batchAssociateApprovalRuleTemplateWithRepositories(input: BatchAssociateApprovalRuleTemplateWithRepositoriesInput, completion: @escaping (ClientRuntime.SdkResult<BatchAssociateApprovalRuleTemplateWithRepositoriesOutputResponse, BatchAssociateApprovalRuleTemplateWithRepositoriesOutputError>) -> Void)
```

### batchDescribeMergeConflicts(input:completion:)

Returns information about one or more merge conflicts in the attempted merge of two commit specifiers using the squash or three-way merge strategy.

``` swift
func batchDescribeMergeConflicts(input: BatchDescribeMergeConflictsInput, completion: @escaping (ClientRuntime.SdkResult<BatchDescribeMergeConflictsOutputResponse, BatchDescribeMergeConflictsOutputError>) -> Void)
```

### batchDisassociateApprovalRuleTemplateFromRepositories(input:completion:)

Removes the association between an approval rule template and one or more specified repositories.

``` swift
func batchDisassociateApprovalRuleTemplateFromRepositories(input: BatchDisassociateApprovalRuleTemplateFromRepositoriesInput, completion: @escaping (ClientRuntime.SdkResult<BatchDisassociateApprovalRuleTemplateFromRepositoriesOutputResponse, BatchDisassociateApprovalRuleTemplateFromRepositoriesOutputError>) -> Void)
```

### batchGetCommits(input:completion:)

Returns information about the contents of one or more commits in a repository.

``` swift
func batchGetCommits(input: BatchGetCommitsInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetCommitsOutputResponse, BatchGetCommitsOutputError>) -> Void)
```

### batchGetRepositories(input:completion:)

Returns information about one or more repositories. The description field for a repository accepts all HTML characters and all valid Unicode characters. Applications that do not HTML-encode the description and display it in a webpage can expose users to potentially malicious code. Make sure that you HTML-encode the description field in any application that uses this API to display the repository description on a webpage.

``` swift
func batchGetRepositories(input: BatchGetRepositoriesInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetRepositoriesOutputResponse, BatchGetRepositoriesOutputError>) -> Void)
```

### createApprovalRuleTemplate(input:completion:)

Creates a template for approval rules that can then be associated with one or more repositories in your AWS account. When you associate a template with a repository, AWS CodeCommit creates an approval rule that matches the conditions of the template for all pull requests that meet the conditions of the template. For more information, see \[AssociateApprovalRuleTemplateWithRepository\].

``` swift
func createApprovalRuleTemplate(input: CreateApprovalRuleTemplateInput, completion: @escaping (ClientRuntime.SdkResult<CreateApprovalRuleTemplateOutputResponse, CreateApprovalRuleTemplateOutputError>) -> Void)
```

### createBranch(input:completion:)

Creates a branch in a repository and points the branch to a commit. Calling the create branch operation does not set a repository's default branch. To do this, call the update default branch operation.

``` swift
func createBranch(input: CreateBranchInput, completion: @escaping (ClientRuntime.SdkResult<CreateBranchOutputResponse, CreateBranchOutputError>) -> Void)
```

### createCommit(input:completion:)

Creates a commit for a repository on the tip of a specified branch.

``` swift
func createCommit(input: CreateCommitInput, completion: @escaping (ClientRuntime.SdkResult<CreateCommitOutputResponse, CreateCommitOutputError>) -> Void)
```

### createPullRequest(input:completion:)

Creates a pull request in the specified repository.

``` swift
func createPullRequest(input: CreatePullRequestInput, completion: @escaping (ClientRuntime.SdkResult<CreatePullRequestOutputResponse, CreatePullRequestOutputError>) -> Void)
```

### createPullRequestApprovalRule(input:completion:)

Creates an approval rule for a pull request.

``` swift
func createPullRequestApprovalRule(input: CreatePullRequestApprovalRuleInput, completion: @escaping (ClientRuntime.SdkResult<CreatePullRequestApprovalRuleOutputResponse, CreatePullRequestApprovalRuleOutputError>) -> Void)
```

### createRepository(input:completion:)

Creates a new, empty repository.

``` swift
func createRepository(input: CreateRepositoryInput, completion: @escaping (ClientRuntime.SdkResult<CreateRepositoryOutputResponse, CreateRepositoryOutputError>) -> Void)
```

### createUnreferencedMergeCommit(input:completion:)

Creates an unreferenced commit that represents the result of merging two branches using a specified merge strategy. This can help you determine the outcome of a potential merge. This API cannot be used with the fast-forward merge strategy because that strategy does not create a merge commit. This unreferenced merge commit can only be accessed using the GetCommit API or through git commands such as git fetch. To retrieve this commit, you must specify its commit ID or otherwise reference it.

``` swift
func createUnreferencedMergeCommit(input: CreateUnreferencedMergeCommitInput, completion: @escaping (ClientRuntime.SdkResult<CreateUnreferencedMergeCommitOutputResponse, CreateUnreferencedMergeCommitOutputError>) -> Void)
```

### deleteApprovalRuleTemplate(input:completion:)

Deletes a specified approval rule template. Deleting a template does not remove approval rules on pull requests already created with the template.

``` swift
func deleteApprovalRuleTemplate(input: DeleteApprovalRuleTemplateInput, completion: @escaping (ClientRuntime.SdkResult<DeleteApprovalRuleTemplateOutputResponse, DeleteApprovalRuleTemplateOutputError>) -> Void)
```

### deleteBranch(input:completion:)

Deletes a branch from a repository, unless that branch is the default branch for the repository.

``` swift
func deleteBranch(input: DeleteBranchInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBranchOutputResponse, DeleteBranchOutputError>) -> Void)
```

### deleteCommentContent(input:completion:)

Deletes the content of a comment made on a change, file, or commit in a repository.

``` swift
func deleteCommentContent(input: DeleteCommentContentInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCommentContentOutputResponse, DeleteCommentContentOutputError>) -> Void)
```

### deleteFile(input:completion:)

Deletes a specified file from a specified branch. A commit is created on the branch that contains the revision. The file still exists in the commits earlier to the commit that contains the deletion.

``` swift
func deleteFile(input: DeleteFileInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFileOutputResponse, DeleteFileOutputError>) -> Void)
```

### deletePullRequestApprovalRule(input:completion:)

Deletes an approval rule from a specified pull request. Approval rules can be deleted from a pull request only if the pull request is open, and if the approval rule was created specifically for a pull request and not generated from an approval rule template associated with the repository where the pull request was created. You cannot delete an approval rule from a merged or closed pull request.

``` swift
func deletePullRequestApprovalRule(input: DeletePullRequestApprovalRuleInput, completion: @escaping (ClientRuntime.SdkResult<DeletePullRequestApprovalRuleOutputResponse, DeletePullRequestApprovalRuleOutputError>) -> Void)
```

### deleteRepository(input:completion:)

Deletes a repository. If a specified repository was already deleted, a null repository ID is returned. Deleting a repository also deletes all associated objects and metadata. After a repository is deleted, all future push calls to the deleted repository fail.

``` swift
func deleteRepository(input: DeleteRepositoryInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRepositoryOutputResponse, DeleteRepositoryOutputError>) -> Void)
```

### describeMergeConflicts(input:completion:)

Returns information about one or more merge conflicts in the attempted merge of two commit specifiers using the squash or three-way merge strategy. If the merge option for the attempted merge is specified as FAST\_FORWARD\_MERGE, an exception is thrown.

``` swift
func describeMergeConflicts(input: DescribeMergeConflictsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeMergeConflictsOutputResponse, DescribeMergeConflictsOutputError>) -> Void)
```

### describePullRequestEvents(input:completion:)

Returns information about one or more pull request events.

``` swift
func describePullRequestEvents(input: DescribePullRequestEventsInput, completion: @escaping (ClientRuntime.SdkResult<DescribePullRequestEventsOutputResponse, DescribePullRequestEventsOutputError>) -> Void)
```

### disassociateApprovalRuleTemplateFromRepository(input:completion:)

Removes the association between a template and a repository so that approval rules based on the template are not automatically created when pull requests are created in the specified repository. This does not delete any approval rules previously created for pull requests through the template association.

``` swift
func disassociateApprovalRuleTemplateFromRepository(input: DisassociateApprovalRuleTemplateFromRepositoryInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateApprovalRuleTemplateFromRepositoryOutputResponse, DisassociateApprovalRuleTemplateFromRepositoryOutputError>) -> Void)
```

### evaluatePullRequestApprovalRules(input:completion:)

Evaluates whether a pull request has met all the conditions specified in its associated approval rules.

``` swift
func evaluatePullRequestApprovalRules(input: EvaluatePullRequestApprovalRulesInput, completion: @escaping (ClientRuntime.SdkResult<EvaluatePullRequestApprovalRulesOutputResponse, EvaluatePullRequestApprovalRulesOutputError>) -> Void)
```

### getApprovalRuleTemplate(input:completion:)

Returns information about a specified approval rule template.

``` swift
func getApprovalRuleTemplate(input: GetApprovalRuleTemplateInput, completion: @escaping (ClientRuntime.SdkResult<GetApprovalRuleTemplateOutputResponse, GetApprovalRuleTemplateOutputError>) -> Void)
```

### getBlob(input:completion:)

Returns the base-64 encoded content of an individual blob in a repository.

``` swift
func getBlob(input: GetBlobInput, completion: @escaping (ClientRuntime.SdkResult<GetBlobOutputResponse, GetBlobOutputError>) -> Void)
```

### getBranch(input:completion:)

Returns information about a repository branch, including its name and the last commit ID.

``` swift
func getBranch(input: GetBranchInput, completion: @escaping (ClientRuntime.SdkResult<GetBranchOutputResponse, GetBranchOutputError>) -> Void)
```

### getComment(input:completion:)

Returns the content of a comment made on a change, file, or commit in a repository. Reaction counts might include numbers from user identities who were deleted after the reaction was made. For a count of reactions from active identities, use GetCommentReactions.

``` swift
func getComment(input: GetCommentInput, completion: @escaping (ClientRuntime.SdkResult<GetCommentOutputResponse, GetCommentOutputError>) -> Void)
```

### getCommentReactions(input:completion:)

Returns information about reactions to a specified comment ID. Reactions from users who have been deleted will not be included in the count.

``` swift
func getCommentReactions(input: GetCommentReactionsInput, completion: @escaping (ClientRuntime.SdkResult<GetCommentReactionsOutputResponse, GetCommentReactionsOutputError>) -> Void)
```

### getCommentsForComparedCommit(input:completion:)

Returns information about comments made on the comparison between two commits. Reaction counts might include numbers from user identities who were deleted after the reaction was made. For a count of reactions from active identities, use GetCommentReactions.

``` swift
func getCommentsForComparedCommit(input: GetCommentsForComparedCommitInput, completion: @escaping (ClientRuntime.SdkResult<GetCommentsForComparedCommitOutputResponse, GetCommentsForComparedCommitOutputError>) -> Void)
```

### getCommentsForPullRequest(input:completion:)

Returns comments made on a pull request. Reaction counts might include numbers from user identities who were deleted after the reaction was made. For a count of reactions from active identities, use GetCommentReactions.

``` swift
func getCommentsForPullRequest(input: GetCommentsForPullRequestInput, completion: @escaping (ClientRuntime.SdkResult<GetCommentsForPullRequestOutputResponse, GetCommentsForPullRequestOutputError>) -> Void)
```

### getCommit(input:completion:)

Returns information about a commit, including commit message and committer information.

``` swift
func getCommit(input: GetCommitInput, completion: @escaping (ClientRuntime.SdkResult<GetCommitOutputResponse, GetCommitOutputError>) -> Void)
```

### getDifferences(input:completion:)

Returns information about the differences in a valid commit specifier (such as a branch, tag, HEAD, commit ID, or other fully qualified reference). Results can be limited to a specified path.

``` swift
func getDifferences(input: GetDifferencesInput, completion: @escaping (ClientRuntime.SdkResult<GetDifferencesOutputResponse, GetDifferencesOutputError>) -> Void)
```

### getFile(input:completion:)

Returns the base-64 encoded contents of a specified file and its metadata.

``` swift
func getFile(input: GetFileInput, completion: @escaping (ClientRuntime.SdkResult<GetFileOutputResponse, GetFileOutputError>) -> Void)
```

### getFolder(input:completion:)

Returns the contents of a specified folder in a repository.

``` swift
func getFolder(input: GetFolderInput, completion: @escaping (ClientRuntime.SdkResult<GetFolderOutputResponse, GetFolderOutputError>) -> Void)
```

### getMergeCommit(input:completion:)

Returns information about a specified merge commit.

``` swift
func getMergeCommit(input: GetMergeCommitInput, completion: @escaping (ClientRuntime.SdkResult<GetMergeCommitOutputResponse, GetMergeCommitOutputError>) -> Void)
```

### getMergeConflicts(input:completion:)

Returns information about merge conflicts between the before and after commit IDs for a pull request in a repository.

``` swift
func getMergeConflicts(input: GetMergeConflictsInput, completion: @escaping (ClientRuntime.SdkResult<GetMergeConflictsOutputResponse, GetMergeConflictsOutputError>) -> Void)
```

### getMergeOptions(input:completion:)

Returns information about the merge options available for merging two specified branches. For details about why a merge option is not available, use GetMergeConflicts or DescribeMergeConflicts.

``` swift
func getMergeOptions(input: GetMergeOptionsInput, completion: @escaping (ClientRuntime.SdkResult<GetMergeOptionsOutputResponse, GetMergeOptionsOutputError>) -> Void)
```

### getPullRequest(input:completion:)

Gets information about a pull request in a specified repository.

``` swift
func getPullRequest(input: GetPullRequestInput, completion: @escaping (ClientRuntime.SdkResult<GetPullRequestOutputResponse, GetPullRequestOutputError>) -> Void)
```

### getPullRequestApprovalStates(input:completion:)

Gets information about the approval states for a specified pull request. Approval states only apply to pull requests that have one or more approval rules applied to them.

``` swift
func getPullRequestApprovalStates(input: GetPullRequestApprovalStatesInput, completion: @escaping (ClientRuntime.SdkResult<GetPullRequestApprovalStatesOutputResponse, GetPullRequestApprovalStatesOutputError>) -> Void)
```

### getPullRequestOverrideState(input:completion:)

Returns information about whether approval rules have been set aside (overridden) for a pull request, and if so, the Amazon Resource Name (ARN) of the user or identity that overrode the rules and their requirements for the pull request.

``` swift
func getPullRequestOverrideState(input: GetPullRequestOverrideStateInput, completion: @escaping (ClientRuntime.SdkResult<GetPullRequestOverrideStateOutputResponse, GetPullRequestOverrideStateOutputError>) -> Void)
```

### getRepository(input:completion:)

Returns information about a repository. The description field for a repository accepts all HTML characters and all valid Unicode characters. Applications that do not HTML-encode the description and display it in a webpage can expose users to potentially malicious code. Make sure that you HTML-encode the description field in any application that uses this API to display the repository description on a webpage.

``` swift
func getRepository(input: GetRepositoryInput, completion: @escaping (ClientRuntime.SdkResult<GetRepositoryOutputResponse, GetRepositoryOutputError>) -> Void)
```

### getRepositoryTriggers(input:completion:)

Gets information about triggers configured for a repository.

``` swift
func getRepositoryTriggers(input: GetRepositoryTriggersInput, completion: @escaping (ClientRuntime.SdkResult<GetRepositoryTriggersOutputResponse, GetRepositoryTriggersOutputError>) -> Void)
```

### listApprovalRuleTemplates(input:completion:)

Lists all approval rule templates in the specified AWS Region in your AWS account. If an AWS Region is not specified, the AWS Region where you are signed in is used.

``` swift
func listApprovalRuleTemplates(input: ListApprovalRuleTemplatesInput, completion: @escaping (ClientRuntime.SdkResult<ListApprovalRuleTemplatesOutputResponse, ListApprovalRuleTemplatesOutputError>) -> Void)
```

### listAssociatedApprovalRuleTemplatesForRepository(input:completion:)

Lists all approval rule templates that are associated with a specified repository.

``` swift
func listAssociatedApprovalRuleTemplatesForRepository(input: ListAssociatedApprovalRuleTemplatesForRepositoryInput, completion: @escaping (ClientRuntime.SdkResult<ListAssociatedApprovalRuleTemplatesForRepositoryOutputResponse, ListAssociatedApprovalRuleTemplatesForRepositoryOutputError>) -> Void)
```

### listBranches(input:completion:)

Gets information about one or more branches in a repository.

``` swift
func listBranches(input: ListBranchesInput, completion: @escaping (ClientRuntime.SdkResult<ListBranchesOutputResponse, ListBranchesOutputError>) -> Void)
```

### listPullRequests(input:completion:)

Returns a list of pull requests for a specified repository. The return list can be refined by pull request status or pull request author ARN.

``` swift
func listPullRequests(input: ListPullRequestsInput, completion: @escaping (ClientRuntime.SdkResult<ListPullRequestsOutputResponse, ListPullRequestsOutputError>) -> Void)
```

### listRepositories(input:completion:)

Gets information about one or more repositories.

``` swift
func listRepositories(input: ListRepositoriesInput, completion: @escaping (ClientRuntime.SdkResult<ListRepositoriesOutputResponse, ListRepositoriesOutputError>) -> Void)
```

### listRepositoriesForApprovalRuleTemplate(input:completion:)

Lists all repositories associated with the specified approval rule template.

``` swift
func listRepositoriesForApprovalRuleTemplate(input: ListRepositoriesForApprovalRuleTemplateInput, completion: @escaping (ClientRuntime.SdkResult<ListRepositoriesForApprovalRuleTemplateOutputResponse, ListRepositoriesForApprovalRuleTemplateOutputError>) -> Void)
```

### listTagsForResource(input:completion:)

Gets information about AWS tags for a specified Amazon Resource Name (ARN) in AWS CodeCommit. For a list of valid resources in AWS CodeCommit, see [CodeCommit Resources and Operations](https://docs.aws.amazon.com/codecommit/latest/userguide/auth-and-access-control-iam-access-control-identity-based.html#arn-formats) in the AWS CodeCommit User Guide.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### mergeBranchesByFastForward(input:completion:)

Merges two branches using the fast-forward merge strategy.

``` swift
func mergeBranchesByFastForward(input: MergeBranchesByFastForwardInput, completion: @escaping (ClientRuntime.SdkResult<MergeBranchesByFastForwardOutputResponse, MergeBranchesByFastForwardOutputError>) -> Void)
```

### mergeBranchesBySquash(input:completion:)

Merges two branches using the squash merge strategy.

``` swift
func mergeBranchesBySquash(input: MergeBranchesBySquashInput, completion: @escaping (ClientRuntime.SdkResult<MergeBranchesBySquashOutputResponse, MergeBranchesBySquashOutputError>) -> Void)
```

### mergeBranchesByThreeWay(input:completion:)

Merges two specified branches using the three-way merge strategy.

``` swift
func mergeBranchesByThreeWay(input: MergeBranchesByThreeWayInput, completion: @escaping (ClientRuntime.SdkResult<MergeBranchesByThreeWayOutputResponse, MergeBranchesByThreeWayOutputError>) -> Void)
```

### mergePullRequestByFastForward(input:completion:)

Attempts to merge the source commit of a pull request into the specified destination branch for that pull request at the specified commit using the fast-forward merge strategy. If the merge is successful, it closes the pull request.

``` swift
func mergePullRequestByFastForward(input: MergePullRequestByFastForwardInput, completion: @escaping (ClientRuntime.SdkResult<MergePullRequestByFastForwardOutputResponse, MergePullRequestByFastForwardOutputError>) -> Void)
```

### mergePullRequestBySquash(input:completion:)

Attempts to merge the source commit of a pull request into the specified destination branch for that pull request at the specified commit using the squash merge strategy. If the merge is successful, it closes the pull request.

``` swift
func mergePullRequestBySquash(input: MergePullRequestBySquashInput, completion: @escaping (ClientRuntime.SdkResult<MergePullRequestBySquashOutputResponse, MergePullRequestBySquashOutputError>) -> Void)
```

### mergePullRequestByThreeWay(input:completion:)

Attempts to merge the source commit of a pull request into the specified destination branch for that pull request at the specified commit using the three-way merge strategy. If the merge is successful, it closes the pull request.

``` swift
func mergePullRequestByThreeWay(input: MergePullRequestByThreeWayInput, completion: @escaping (ClientRuntime.SdkResult<MergePullRequestByThreeWayOutputResponse, MergePullRequestByThreeWayOutputError>) -> Void)
```

### overridePullRequestApprovalRules(input:completion:)

Sets aside (overrides) all approval rule requirements for a specified pull request.

``` swift
func overridePullRequestApprovalRules(input: OverridePullRequestApprovalRulesInput, completion: @escaping (ClientRuntime.SdkResult<OverridePullRequestApprovalRulesOutputResponse, OverridePullRequestApprovalRulesOutputError>) -> Void)
```

### postCommentForComparedCommit(input:completion:)

Posts a comment on the comparison between two commits.

``` swift
func postCommentForComparedCommit(input: PostCommentForComparedCommitInput, completion: @escaping (ClientRuntime.SdkResult<PostCommentForComparedCommitOutputResponse, PostCommentForComparedCommitOutputError>) -> Void)
```

### postCommentForPullRequest(input:completion:)

Posts a comment on a pull request.

``` swift
func postCommentForPullRequest(input: PostCommentForPullRequestInput, completion: @escaping (ClientRuntime.SdkResult<PostCommentForPullRequestOutputResponse, PostCommentForPullRequestOutputError>) -> Void)
```

### postCommentReply(input:completion:)

Posts a comment in reply to an existing comment on a comparison between commits or a pull request.

``` swift
func postCommentReply(input: PostCommentReplyInput, completion: @escaping (ClientRuntime.SdkResult<PostCommentReplyOutputResponse, PostCommentReplyOutputError>) -> Void)
```

### putCommentReaction(input:completion:)

Adds or updates a reaction to a specified comment for the user whose identity is used to make the request. You can only add or update a reaction for yourself. You cannot add, modify, or delete a reaction for another user.

``` swift
func putCommentReaction(input: PutCommentReactionInput, completion: @escaping (ClientRuntime.SdkResult<PutCommentReactionOutputResponse, PutCommentReactionOutputError>) -> Void)
```

### putFile(input:completion:)

Adds or updates a file in a branch in an AWS CodeCommit repository, and generates a commit for the addition in the specified branch.

``` swift
func putFile(input: PutFileInput, completion: @escaping (ClientRuntime.SdkResult<PutFileOutputResponse, PutFileOutputError>) -> Void)
```

### putRepositoryTriggers(input:completion:)

Replaces all triggers for a repository. Used to create or delete triggers.

``` swift
func putRepositoryTriggers(input: PutRepositoryTriggersInput, completion: @escaping (ClientRuntime.SdkResult<PutRepositoryTriggersOutputResponse, PutRepositoryTriggersOutputError>) -> Void)
```

### tagResource(input:completion:)

Adds or updates tags for a resource in AWS CodeCommit. For a list of valid resources in AWS CodeCommit, see [CodeCommit Resources and Operations](https://docs.aws.amazon.com/codecommit/latest/userguide/auth-and-access-control-iam-access-control-identity-based.html#arn-formats) in the AWS CodeCommit User Guide.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### testRepositoryTriggers(input:completion:)

Tests the functionality of repository triggers by sending information to the trigger target. If real data is available in the repository, the test sends data from the last commit. If no data is available, sample data is generated.

``` swift
func testRepositoryTriggers(input: TestRepositoryTriggersInput, completion: @escaping (ClientRuntime.SdkResult<TestRepositoryTriggersOutputResponse, TestRepositoryTriggersOutputError>) -> Void)
```

### untagResource(input:completion:)

Removes tags for a resource in AWS CodeCommit. For a list of valid resources in AWS CodeCommit, see [CodeCommit Resources and Operations](https://docs.aws.amazon.com/codecommit/latest/userguide/auth-and-access-control-iam-access-control-identity-based.html#arn-formats) in the AWS CodeCommit User Guide.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateApprovalRuleTemplateContent(input:completion:)

Updates the content of an approval rule template. You can change the number of required approvals, the membership of the approval rule, and whether an approval pool is defined.

``` swift
func updateApprovalRuleTemplateContent(input: UpdateApprovalRuleTemplateContentInput, completion: @escaping (ClientRuntime.SdkResult<UpdateApprovalRuleTemplateContentOutputResponse, UpdateApprovalRuleTemplateContentOutputError>) -> Void)
```

### updateApprovalRuleTemplateDescription(input:completion:)

Updates the description for a specified approval rule template.

``` swift
func updateApprovalRuleTemplateDescription(input: UpdateApprovalRuleTemplateDescriptionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateApprovalRuleTemplateDescriptionOutputResponse, UpdateApprovalRuleTemplateDescriptionOutputError>) -> Void)
```

### updateApprovalRuleTemplateName(input:completion:)

Updates the name of a specified approval rule template.

``` swift
func updateApprovalRuleTemplateName(input: UpdateApprovalRuleTemplateNameInput, completion: @escaping (ClientRuntime.SdkResult<UpdateApprovalRuleTemplateNameOutputResponse, UpdateApprovalRuleTemplateNameOutputError>) -> Void)
```

### updateComment(input:completion:)

Replaces the contents of a comment.

``` swift
func updateComment(input: UpdateCommentInput, completion: @escaping (ClientRuntime.SdkResult<UpdateCommentOutputResponse, UpdateCommentOutputError>) -> Void)
```

### updateDefaultBranch(input:completion:)

Sets or changes the default branch name for the specified repository. If you use this operation to change the default branch name to the current default branch name, a success message is returned even though the default branch did not change.

``` swift
func updateDefaultBranch(input: UpdateDefaultBranchInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDefaultBranchOutputResponse, UpdateDefaultBranchOutputError>) -> Void)
```

### updatePullRequestApprovalRuleContent(input:completion:)

Updates the structure of an approval rule created specifically for a pull request. For example, you can change the number of required approvers and the approval pool for approvers.

``` swift
func updatePullRequestApprovalRuleContent(input: UpdatePullRequestApprovalRuleContentInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePullRequestApprovalRuleContentOutputResponse, UpdatePullRequestApprovalRuleContentOutputError>) -> Void)
```

### updatePullRequestApprovalState(input:completion:)

Updates the state of a user's approval on a pull request. The user is derived from the signed-in account when the request is made.

``` swift
func updatePullRequestApprovalState(input: UpdatePullRequestApprovalStateInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePullRequestApprovalStateOutputResponse, UpdatePullRequestApprovalStateOutputError>) -> Void)
```

### updatePullRequestDescription(input:completion:)

Replaces the contents of the description of a pull request.

``` swift
func updatePullRequestDescription(input: UpdatePullRequestDescriptionInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePullRequestDescriptionOutputResponse, UpdatePullRequestDescriptionOutputError>) -> Void)
```

### updatePullRequestStatus(input:completion:)

Updates the status of a pull request.

``` swift
func updatePullRequestStatus(input: UpdatePullRequestStatusInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePullRequestStatusOutputResponse, UpdatePullRequestStatusOutputError>) -> Void)
```

### updatePullRequestTitle(input:completion:)

Replaces the title of a pull request.

``` swift
func updatePullRequestTitle(input: UpdatePullRequestTitleInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePullRequestTitleOutputResponse, UpdatePullRequestTitleOutputError>) -> Void)
```

### updateRepositoryDescription(input:completion:)

Sets or changes the comment or description for a repository. The description field for a repository accepts all HTML characters and all valid Unicode characters. Applications that do not HTML-encode the description and display it in a webpage can expose users to potentially malicious code. Make sure that you HTML-encode the description field in any application that uses this API to display the repository description on a webpage.

``` swift
func updateRepositoryDescription(input: UpdateRepositoryDescriptionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRepositoryDescriptionOutputResponse, UpdateRepositoryDescriptionOutputError>) -> Void)
```

### updateRepositoryName(input:completion:)

Renames a repository. The repository name must be unique across the calling AWS account. Repository names are limited to 100 alphanumeric, dash, and underscore characters, and cannot include certain characters. The suffix .git is prohibited. For more information about the limits on repository names, see [Limits](https://docs.aws.amazon.com/codecommit/latest/userguide/limits.html) in the AWS CodeCommit User Guide.

``` swift
func updateRepositoryName(input: UpdateRepositoryNameInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRepositoryNameOutputResponse, UpdateRepositoryNameOutputError>) -> Void)
```
