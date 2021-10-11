# CodeGuruReviewerClient

``` swift
public class CodeGuruReviewerClient 
```

## Inheritance

[`CodeGuruReviewerClientProtocol`](/aws-sdk-swift/reference/0.x/AWSCodeGuruReviewer/CodeGuruReviewerClientProtocol)

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

### `associateRepository(input:completion:)`

Use to associate an Amazon Web Services CodeCommit repository or a repostory managed by
Amazon Web Services CodeStar Connections with Amazon CodeGuru Reviewer. When you associate a
repository, CodeGuru Reviewer reviews source code changes in the repository's pull requests and provides
automatic recommendations. You can view recommendations using the CodeGuru Reviewer console. For more information, see
<a href="https:​//docs.aws.amazon.com/codeguru/latest/reviewer-ug/recommendations.html">Recommendations in
Amazon CodeGuru Reviewer in the Amazon CodeGuru Reviewer User Guide.

``` swift
public func associateRepository(input: AssociateRepositoryInput, completion: @escaping (ClientRuntime.SdkResult<AssociateRepositoryOutputResponse, AssociateRepositoryOutputError>) -> Void)
```

If you associate a CodeCommit or S3 repository, it must be in the same
Amazon Web Services Region and Amazon Web Services account where its CodeGuru Reviewer code reviews are configured.

Bitbucket and GitHub Enterprise Server repositories are managed by Amazon Web Services CodeStar
Connections to connect to CodeGuru Reviewer. For more information, see <a href="https://docs.aws.amazon.com/codeguru/latest/reviewer-ug/getting-started-associate-repository.html">Associate a repository in
the Amazon CodeGuru Reviewer User Guide.

``` 
You cannot use the CodeGuru Reviewer SDK or the Amazon Web Services CLI to associate a GitHub repository with Amazon CodeGuru Reviewer. To associate
a GitHub repository, use the console. For more information, see
<a href="https://docs.aws.amazon.com/codeguru/latest/reviewer-ug/getting-started-with-guru.html">Getting
started with CodeGuru Reviewer in the CodeGuru Reviewer User Guide.
```

### `createCodeReview(input:completion:)`

Use to create a code review with a <a href="https:​//docs.aws.amazon.com/codeguru/latest/reviewer-api/API_CodeReviewType.html">
CodeReviewType

``` swift
public func createCodeReview(input: CreateCodeReviewInput, completion: @escaping (ClientRuntime.SdkResult<CreateCodeReviewOutputResponse, CreateCodeReviewOutputError>) -> Void)
```

of RepositoryAnalysis. This type of code review analyzes all code under a specified branch in an associated repository.
PullRequest code reviews are automatically triggered by a pull request.

### `describeCodeReview(input:completion:)`

Returns the metadata associated with the code review along with its status.

``` swift
public func describeCodeReview(input: DescribeCodeReviewInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCodeReviewOutputResponse, DescribeCodeReviewOutputError>) -> Void)
```

### `describeRecommendationFeedback(input:completion:)`

Describes the customer feedback for a CodeGuru Reviewer recommendation.

``` swift
public func describeRecommendationFeedback(input: DescribeRecommendationFeedbackInput, completion: @escaping (ClientRuntime.SdkResult<DescribeRecommendationFeedbackOutputResponse, DescribeRecommendationFeedbackOutputError>) -> Void)
```

### `describeRepositoryAssociation(input:completion:)`

Returns a <a href="https:​//docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociation.html">
RepositoryAssociation
object
that contains information about the requested repository association.

``` swift
public func describeRepositoryAssociation(input: DescribeRepositoryAssociationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeRepositoryAssociationOutputResponse, DescribeRepositoryAssociationOutputError>) -> Void)
```

### `disassociateRepository(input:completion:)`

Removes the association between Amazon CodeGuru Reviewer and a repository.

``` swift
public func disassociateRepository(input: DisassociateRepositoryInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateRepositoryOutputResponse, DisassociateRepositoryOutputError>) -> Void)
```

### `listCodeReviews(input:completion:)`

Lists all the code reviews that the customer has created in the past 90 days.

``` swift
public func listCodeReviews(input: ListCodeReviewsInput, completion: @escaping (ClientRuntime.SdkResult<ListCodeReviewsOutputResponse, ListCodeReviewsOutputError>) -> Void)
```

### `listRecommendationFeedback(input:completion:)`

Returns a list of
<a href="https:​//docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RecommendationFeedbackSummary.html">
RecommendationFeedbackSummary

``` swift
public func listRecommendationFeedback(input: ListRecommendationFeedbackInput, completion: @escaping (ClientRuntime.SdkResult<ListRecommendationFeedbackOutputResponse, ListRecommendationFeedbackOutputError>) -> Void)
```

objects that contain customer recommendation feedback for all CodeGuru Reviewer users.

### `listRecommendations(input:completion:)`

Returns the list of all recommendations for a completed code review.

``` swift
public func listRecommendations(input: ListRecommendationsInput, completion: @escaping (ClientRuntime.SdkResult<ListRecommendationsOutputResponse, ListRecommendationsOutputError>) -> Void)
```

### `listRepositoryAssociations(input:completion:)`

Returns a list of <a href="https:​//docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociationSummary.html">
RepositoryAssociationSummary
objects that
contain summary information about a repository association. You can filter the returned list by
<a href="https:​//docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociationSummary.html#reviewer-Type-RepositoryAssociationSummary-ProviderType">
ProviderType
,
<a href="https:​//docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociationSummary.html#reviewer-Type-RepositoryAssociationSummary-Name">
Name
,
<a href="https:​//docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociationSummary.html#reviewer-Type-RepositoryAssociationSummary-State">
State
, and
<a href="https:​//docs.aws.amazon.com/codeguru/latest/reviewer-api/API_RepositoryAssociationSummary.html#reviewer-Type-RepositoryAssociationSummary-Owner">
Owner
.

``` swift
public func listRepositoryAssociations(input: ListRepositoryAssociationsInput, completion: @escaping (ClientRuntime.SdkResult<ListRepositoryAssociationsOutputResponse, ListRepositoryAssociationsOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Returns the list of tags associated with an associated repository resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `putRecommendationFeedback(input:completion:)`

Stores customer feedback for a CodeGuru Reviewer recommendation. When this API is called again with different reactions the previous feedback is overwritten.

``` swift
public func putRecommendationFeedback(input: PutRecommendationFeedbackInput, completion: @escaping (ClientRuntime.SdkResult<PutRecommendationFeedbackOutputResponse, PutRecommendationFeedbackOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Adds one or more tags to an associated repository.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes a tag from an associated repository.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```
