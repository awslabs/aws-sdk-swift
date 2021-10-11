# KendraClient

``` swift
public class KendraClient 
```

## Inheritance

[`KendraClientProtocol`](/aws-sdk-swift/reference/0.x/AWSKendra/KendraClientProtocol)

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

### `batchDeleteDocument(input:completion:)`

Removes one or more documents from an index. The documents must have
been added with the BatchPutDocument operation.
The documents are deleted asynchronously. You can see the progress of
the deletion by using Amazon Web Services CloudWatch. Any error messages related to the
processing of the batch are sent to you CloudWatch log.

``` swift
public func batchDeleteDocument(input: BatchDeleteDocumentInput, completion: @escaping (ClientRuntime.SdkResult<BatchDeleteDocumentOutputResponse, BatchDeleteDocumentOutputError>) -> Void)
```

### `batchGetDocumentStatus(input:completion:)`

Returns the indexing status for one or more documents submitted
with the <a href="https:​//docs.aws.amazon.com/kendra/latest/dg/API_BatchPutDocument.html">
BatchPutDocument operation.
When you use the BatchPutDocument operation,
documents are indexed asynchronously. You can use the
BatchGetDocumentStatus operation to get the current
status of a list of documents so that you can determine if they have
been successfully indexed.
You can also use the BatchGetDocumentStatus operation
to check the status of the <a href="https:​//docs.aws.amazon.com/kendra/latest/dg/API_BatchDeleteDocument.html">
BatchDeleteDocument operation. When a document is
deleted from the index, Amazon Kendra returns NOT\_FOUND as the
status.

``` swift
public func batchGetDocumentStatus(input: BatchGetDocumentStatusInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetDocumentStatusOutputResponse, BatchGetDocumentStatusOutputError>) -> Void)
```

### `batchPutDocument(input:completion:)`

Adds one or more documents to an index.
The BatchPutDocument operation enables you to ingest
inline documents or a set of documents stored in an Amazon S3 bucket. Use
this operation to ingest your text and unstructured text into an index,
add custom attributes to the documents, and to attach an access control
list to the documents added to the index.
The documents are indexed asynchronously. You can see the progress of
the batch using Amazon Web Services CloudWatch. Any error messages related to processing
the batch are sent to your Amazon Web Services CloudWatch log.

``` swift
public func batchPutDocument(input: BatchPutDocumentInput, completion: @escaping (ClientRuntime.SdkResult<BatchPutDocumentOutputResponse, BatchPutDocumentOutputError>) -> Void)
```

### `clearQuerySuggestions(input:completion:)`

Clears existing query suggestions from an index.
This deletes existing suggestions only, not the queries
in the query log. After you clear suggestions, Amazon Kendra learns
new suggestions based on new queries added to the query log
from the time you cleared suggestions. If you do not see any
new suggestions, then please allow Amazon Kendra to collect
enough queries to learn new suggestions.

``` swift
public func clearQuerySuggestions(input: ClearQuerySuggestionsInput, completion: @escaping (ClientRuntime.SdkResult<ClearQuerySuggestionsOutputResponse, ClearQuerySuggestionsOutputError>) -> Void)
```

### `createDataSource(input:completion:)`

Creates a data source that you use to with an Amazon Kendra index.
You specify a name, data source connector type and description for
your data source. You also specify configuration information such as
document metadata (author, source URI, and so on) and user context
information.

``` swift
public func createDataSource(input: CreateDataSourceInput, completion: @escaping (ClientRuntime.SdkResult<CreateDataSourceOutputResponse, CreateDataSourceOutputError>) -> Void)
```

``` 
        CreateDataSource is a synchronous operation. The
  operation returns 200 if the data source was successfully created.
  Otherwise, an exception is raised.
```

### `createFaq(input:completion:)`

Creates an new set of frequently asked question (FAQ) questions and answers.

``` swift
public func createFaq(input: CreateFaqInput, completion: @escaping (ClientRuntime.SdkResult<CreateFaqOutputResponse, CreateFaqOutputError>) -> Void)
```

### `createIndex(input:completion:)`

Creates a new Amazon Kendra index. Index creation is an asynchronous
operation. To determine if index creation has completed, check the
Status field returned from a call to
DescribeIndex. The Status field is set to
ACTIVE when the index is ready to use.
Once the index is active you can index your documents using the
BatchPutDocument operation or using one of the supported
data sources.

``` swift
public func createIndex(input: CreateIndexInput, completion: @escaping (ClientRuntime.SdkResult<CreateIndexOutputResponse, CreateIndexOutputError>) -> Void)
```

### `createQuerySuggestionsBlockList(input:completion:)`

Creates a block list to exlcude certain queries from suggestions.
Any query that contains words or phrases specified in the block
list is blocked or filtered out from being shown as a suggestion.
You need to provide the file location of your block list text file
in your S3 bucket. In your text file, enter each block word or phrase
on a separate line.
For information on the current quota limits for block lists, see
<a href="https:​//docs.aws.amazon.com/kendra/latest/dg/quotas.html">Quotas
for Amazon Kendra.

``` swift
public func createQuerySuggestionsBlockList(input: CreateQuerySuggestionsBlockListInput, completion: @escaping (ClientRuntime.SdkResult<CreateQuerySuggestionsBlockListOutputResponse, CreateQuerySuggestionsBlockListOutputError>) -> Void)
```

### `createThesaurus(input:completion:)`

Creates a thesaurus for an index. The thesaurus
contains a list of synonyms in Solr format.

``` swift
public func createThesaurus(input: CreateThesaurusInput, completion: @escaping (ClientRuntime.SdkResult<CreateThesaurusOutputResponse, CreateThesaurusOutputError>) -> Void)
```

### `deleteDataSource(input:completion:)`

Deletes an Amazon Kendra data source. An exception is not thrown if the
data source is already being deleted. While the data source is being
deleted, the Status field returned by a call to the
DescribeDataSource operation is set to
DELETING. For more information, see <a href="https:​//docs.aws.amazon.com/kendra/latest/dg/delete-data-source.html">Deleting Data Sources.

``` swift
public func deleteDataSource(input: DeleteDataSourceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDataSourceOutputResponse, DeleteDataSourceOutputError>) -> Void)
```

### `deleteFaq(input:completion:)`

Removes an FAQ from an index.

``` swift
public func deleteFaq(input: DeleteFaqInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFaqOutputResponse, DeleteFaqOutputError>) -> Void)
```

### `deleteIndex(input:completion:)`

Deletes an existing Amazon Kendra index. An exception is not thrown if
the index is already being deleted. While the index is being deleted, the
Status field returned by a call to the
DescribeIndex operation is set to
DELETING.

``` swift
public func deleteIndex(input: DeleteIndexInput, completion: @escaping (ClientRuntime.SdkResult<DeleteIndexOutputResponse, DeleteIndexOutputError>) -> Void)
```

### `deletePrincipalMapping(input:completion:)`

Deletes a group so that all users and sub groups that belong to the group can
no longer access documents only available to that group.
For example, after deleting the group "Summer Interns", all interns who
belonged to that group no longer see intern-only documents in their search
results.
If you want to delete or replace users or sub groups of a group, you need to
use the PutPrincipalMapping operation. For example, if a user in
the group "Engineering" leaves the engineering team and another user takes
their place, you provide an updated list of users or sub groups that belong
to the "Engineering" group when calling PutPrincipalMapping. You
can update your internal list of users or sub groups and input this list
when calling PutPrincipalMapping.

``` swift
public func deletePrincipalMapping(input: DeletePrincipalMappingInput, completion: @escaping (ClientRuntime.SdkResult<DeletePrincipalMappingOutputResponse, DeletePrincipalMappingOutputError>) -> Void)
```

### `deleteQuerySuggestionsBlockList(input:completion:)`

Deletes a block list used for query suggestions for an index.
A deleted block list might not take effect right away. Amazon Kendra
needs to refresh the entire suggestions list to add back the
queries that were previously blocked.

``` swift
public func deleteQuerySuggestionsBlockList(input: DeleteQuerySuggestionsBlockListInput, completion: @escaping (ClientRuntime.SdkResult<DeleteQuerySuggestionsBlockListOutputResponse, DeleteQuerySuggestionsBlockListOutputError>) -> Void)
```

### `deleteThesaurus(input:completion:)`

Deletes an existing Amazon Kendra thesaurus.

``` swift
public func deleteThesaurus(input: DeleteThesaurusInput, completion: @escaping (ClientRuntime.SdkResult<DeleteThesaurusOutputResponse, DeleteThesaurusOutputError>) -> Void)
```

### `describeDataSource(input:completion:)`

Gets information about a Amazon Kendra data source.

``` swift
public func describeDataSource(input: DescribeDataSourceInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDataSourceOutputResponse, DescribeDataSourceOutputError>) -> Void)
```

### `describeFaq(input:completion:)`

Gets information about an FAQ list.

``` swift
public func describeFaq(input: DescribeFaqInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFaqOutputResponse, DescribeFaqOutputError>) -> Void)
```

### `describeIndex(input:completion:)`

Describes an existing Amazon Kendra index

``` swift
public func describeIndex(input: DescribeIndexInput, completion: @escaping (ClientRuntime.SdkResult<DescribeIndexOutputResponse, DescribeIndexOutputError>) -> Void)
```

### `describePrincipalMapping(input:completion:)`

Describes the processing of PUT and DELETE actions
for mapping users to their groups. This includes information on the status of
actions currently processing or yet to be processed, when actions were last updated,
when actions were received by Amazon Kendra, the latest action that should process
and apply after other actions, and useful error messages if an action could
not be processed.

``` swift
public func describePrincipalMapping(input: DescribePrincipalMappingInput, completion: @escaping (ClientRuntime.SdkResult<DescribePrincipalMappingOutputResponse, DescribePrincipalMappingOutputError>) -> Void)
```

### `describeQuerySuggestionsBlockList(input:completion:)`

Describes a block list used for query suggestions for an index.
This is used to check the current settings that are applied to a
block list.

``` swift
public func describeQuerySuggestionsBlockList(input: DescribeQuerySuggestionsBlockListInput, completion: @escaping (ClientRuntime.SdkResult<DescribeQuerySuggestionsBlockListOutputResponse, DescribeQuerySuggestionsBlockListOutputError>) -> Void)
```

### `describeQuerySuggestionsConfig(input:completion:)`

Describes the settings of query suggestions for an index.
This is used to check the current settings applied
to query suggestions.

``` swift
public func describeQuerySuggestionsConfig(input: DescribeQuerySuggestionsConfigInput, completion: @escaping (ClientRuntime.SdkResult<DescribeQuerySuggestionsConfigOutputResponse, DescribeQuerySuggestionsConfigOutputError>) -> Void)
```

### `describeThesaurus(input:completion:)`

Describes an existing Amazon Kendra thesaurus.

``` swift
public func describeThesaurus(input: DescribeThesaurusInput, completion: @escaping (ClientRuntime.SdkResult<DescribeThesaurusOutputResponse, DescribeThesaurusOutputError>) -> Void)
```

### `getQuerySuggestions(input:completion:)`

Fetches the queries that are suggested to your users.

``` swift
public func getQuerySuggestions(input: GetQuerySuggestionsInput, completion: @escaping (ClientRuntime.SdkResult<GetQuerySuggestionsOutputResponse, GetQuerySuggestionsOutputError>) -> Void)
```

### `listDataSourceSyncJobs(input:completion:)`

Gets statistics about synchronizing Amazon Kendra with a data
source.

``` swift
public func listDataSourceSyncJobs(input: ListDataSourceSyncJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListDataSourceSyncJobsOutputResponse, ListDataSourceSyncJobsOutputError>) -> Void)
```

### `listDataSources(input:completion:)`

Lists the data sources that you have created.

``` swift
public func listDataSources(input: ListDataSourcesInput, completion: @escaping (ClientRuntime.SdkResult<ListDataSourcesOutputResponse, ListDataSourcesOutputError>) -> Void)
```

### `listFaqs(input:completion:)`

Gets a list of FAQ lists associated with an index.

``` swift
public func listFaqs(input: ListFaqsInput, completion: @escaping (ClientRuntime.SdkResult<ListFaqsOutputResponse, ListFaqsOutputError>) -> Void)
```

### `listGroupsOlderThanOrderingId(input:completion:)`

Provides a list of groups that are mapped to users before a
given ordering or timestamp identifier.

``` swift
public func listGroupsOlderThanOrderingId(input: ListGroupsOlderThanOrderingIdInput, completion: @escaping (ClientRuntime.SdkResult<ListGroupsOlderThanOrderingIdOutputResponse, ListGroupsOlderThanOrderingIdOutputError>) -> Void)
```

### `listIndices(input:completion:)`

Lists the Amazon Kendra indexes that you have created.

``` swift
public func listIndices(input: ListIndicesInput, completion: @escaping (ClientRuntime.SdkResult<ListIndicesOutputResponse, ListIndicesOutputError>) -> Void)
```

### `listQuerySuggestionsBlockLists(input:completion:)`

Lists the block lists used for query suggestions for an index.
For information on the current quota limits for block lists, see
<a href="https:​//docs.aws.amazon.com/kendra/latest/dg/quotas.html">Quotas
for Amazon Kendra.

``` swift
public func listQuerySuggestionsBlockLists(input: ListQuerySuggestionsBlockListsInput, completion: @escaping (ClientRuntime.SdkResult<ListQuerySuggestionsBlockListsOutputResponse, ListQuerySuggestionsBlockListsOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Gets a list of tags associated with a specified resource. Indexes,
FAQs, and data sources can have tags associated with them.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `listThesauri(input:completion:)`

Lists the Amazon Kendra thesauri associated with an index.

``` swift
public func listThesauri(input: ListThesauriInput, completion: @escaping (ClientRuntime.SdkResult<ListThesauriOutputResponse, ListThesauriOutputError>) -> Void)
```

### `putPrincipalMapping(input:completion:)`

Maps users to their groups. You can also map sub groups to groups.
For example, the group "Company Intellectual Property Teams" includes
sub groups "Research" and "Engineering". These sub groups include their
own list of users or people who work in these teams. Only users who work
in research and engineering, and therefore belong in the intellectual
property group, can see top-secret company documents in their search
results.
You map users to their groups when you want to filter search results
for different users based on their group’s access to documents. For more
information on filtering search results for different users, see
<a href="https:​//docs.aws.amazon.com/kendra/latest/dg/user-context-filter.html">Filtering
on user context.
If more than five PUT actions for a group are currently
processing, a validation exception is thrown.

``` swift
public func putPrincipalMapping(input: PutPrincipalMappingInput, completion: @escaping (ClientRuntime.SdkResult<PutPrincipalMappingOutputResponse, PutPrincipalMappingOutputError>) -> Void)
```

### `query(input:completion:)`

Searches an active index. Use this API to search your documents
using query. The Query operation enables to do faceted
search and to filter results based on document attributes.
It also enables you to provide user context that Amazon Kendra uses
to enforce document access control in the search results.
Amazon Kendra searches your index for text content and question and
answer (FAQ) content. By default the response contains three types of
results.

``` swift
public func query(input: QueryInput, completion: @escaping (ClientRuntime.SdkResult<QueryOutputResponse, QueryOutputError>) -> Void)
```

``` 
           Relevant passages


           Matching FAQs


           Relevant documents


     You can specify that the query return only one type of result using
     the QueryResultTypeConfig parameter.
     Each query returns the 100 most relevant results.
```

### `startDataSourceSyncJob(input:completion:)`

Starts a synchronization job for a data source. If a synchronization
job is already in progress, Amazon Kendra returns a
ResourceInUseException exception.

``` swift
public func startDataSourceSyncJob(input: StartDataSourceSyncJobInput, completion: @escaping (ClientRuntime.SdkResult<StartDataSourceSyncJobOutputResponse, StartDataSourceSyncJobOutputError>) -> Void)
```

### `stopDataSourceSyncJob(input:completion:)`

Stops a running synchronization job. You can't stop a scheduled
synchronization job.

``` swift
public func stopDataSourceSyncJob(input: StopDataSourceSyncJobInput, completion: @escaping (ClientRuntime.SdkResult<StopDataSourceSyncJobOutputResponse, StopDataSourceSyncJobOutputError>) -> Void)
```

### `submitFeedback(input:completion:)`

Enables you to provide feedback to Amazon Kendra to improve the
performance of your index.

``` swift
public func submitFeedback(input: SubmitFeedbackInput, completion: @escaping (ClientRuntime.SdkResult<SubmitFeedbackOutputResponse, SubmitFeedbackOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Adds the specified tag to the specified index, FAQ, or data source
resource. If the tag already exists, the existing value is replaced with
the new value.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes a tag from an index, FAQ, or a data source.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateDataSource(input:completion:)`

Updates an existing Amazon Kendra data source.

``` swift
public func updateDataSource(input: UpdateDataSourceInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDataSourceOutputResponse, UpdateDataSourceOutputError>) -> Void)
```

### `updateIndex(input:completion:)`

Updates an existing Amazon Kendra index.

``` swift
public func updateIndex(input: UpdateIndexInput, completion: @escaping (ClientRuntime.SdkResult<UpdateIndexOutputResponse, UpdateIndexOutputError>) -> Void)
```

### `updateQuerySuggestionsBlockList(input:completion:)`

Updates a block list used for query suggestions for an index.
Updates to a block list might not take effect right away. Amazon Kendra
needs to refresh the entire suggestions list to apply any updates to the
block list. Other changes not related to the block list apply immediately.
If a block list is updating, then you need to wait for the first update to
finish before submitting another update.
Amazon Kendra supports partial updates, so you only need to provide the fields
you want to update.

``` swift
public func updateQuerySuggestionsBlockList(input: UpdateQuerySuggestionsBlockListInput, completion: @escaping (ClientRuntime.SdkResult<UpdateQuerySuggestionsBlockListOutputResponse, UpdateQuerySuggestionsBlockListOutputError>) -> Void)
```

### `updateQuerySuggestionsConfig(input:completion:)`

Updates the settings of query suggestions for an index.
Amazon Kendra supports partial updates, so you only need to provide
the fields you want to update.
If an update is currently processing (i.e. 'happening'), you
need to wait for the update to finish before making another update.
Updates to query suggestions settings might not take effect right away.
The time for your updated settings to take effect depends on the updates
made and the number of search queries in your index.
You can still enable/disable query suggestions at any time.

``` swift
public func updateQuerySuggestionsConfig(input: UpdateQuerySuggestionsConfigInput, completion: @escaping (ClientRuntime.SdkResult<UpdateQuerySuggestionsConfigOutputResponse, UpdateQuerySuggestionsConfigOutputError>) -> Void)
```

### `updateThesaurus(input:completion:)`

Updates a thesaurus file associated with an index.

``` swift
public func updateThesaurus(input: UpdateThesaurusInput, completion: @escaping (ClientRuntime.SdkResult<UpdateThesaurusOutputResponse, UpdateThesaurusOutputError>) -> Void)
```
