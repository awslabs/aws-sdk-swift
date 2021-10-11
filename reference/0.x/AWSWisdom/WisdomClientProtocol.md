# WisdomClientProtocol

All Amazon Connect Wisdom functionality is accessible using the API. For example, you can create an
assistant and a knowledge base.

``` swift
public protocol WisdomClientProtocol 
```

``` 
     Some more advanced features are only accessible using the Wisdom API. For example, you
  can manually manage content by uploading custom files and control their lifecycle.
```

## Requirements

### createAssistant(input:​completion:​)

Creates an Amazon Connect Wisdom assistant.

``` swift
func createAssistant(input: CreateAssistantInput, completion: @escaping (ClientRuntime.SdkResult<CreateAssistantOutputResponse, CreateAssistantOutputError>) -> Void)
```

### createAssistantAssociation(input:​completion:​)

Creates an association between an Amazon Connect Wisdom assistant and another resource. Currently, the
only supported association is with a knowledge base. An assistant can have only a single
association.

``` swift
func createAssistantAssociation(input: CreateAssistantAssociationInput, completion: @escaping (ClientRuntime.SdkResult<CreateAssistantAssociationOutputResponse, CreateAssistantAssociationOutputError>) -> Void)
```

### createContent(input:​completion:​)

Creates Wisdom content. Before to calling this API, use <a href="https:​//docs.aws.amazon.com/wisdom/latest/APIReference/API_StartContentUpload.html">StartContentUpload to
upload an asset.

``` swift
func createContent(input: CreateContentInput, completion: @escaping (ClientRuntime.SdkResult<CreateContentOutputResponse, CreateContentOutputError>) -> Void)
```

### createKnowledgeBase(input:​completion:​)

Creates a knowledge base.

``` swift
func createKnowledgeBase(input: CreateKnowledgeBaseInput, completion: @escaping (ClientRuntime.SdkResult<CreateKnowledgeBaseOutputResponse, CreateKnowledgeBaseOutputError>) -> Void)
```

``` 
        When using this API, you cannot reuse <a href="https://docs.aws.amazon.com/appintegrations/latest/APIReference/Welcome.html">Amazon AppIntegrations
    DataIntegrations with external knowledge bases such as Salesforce and ServiceNow. If you do,
    you'll get an InvalidRequestException error.

        For example, you're programmatically managing your external knowledge base, and you want
    to add or remove one of the fields that is being ingested from Salesforce. Do the
    following:
        <ol>

              Call <a href="https://docs.aws.amazon.com/wisdom/latest/APIReference/API_DeleteKnowledgeBase.html">DeleteKnowledgeBase.


              Call <a href="https://docs.aws.amazon.com/appintegrations/latest/APIReference/API_DeleteDataIntegration.html">DeleteDataIntegration.


              Call <a href="https://docs.aws.amazon.com/appintegrations/latest/APIReference/API_CreateDataIntegration.html">CreateDataIntegration to recreate the DataIntegration or a create different
        one.


              Call CreateKnowledgeBase.

        </ol>
```

### createSession(input:​completion:​)

Creates a session. A session is a contextual container used for generating
recommendations. Amazon Connect creates a new Wisdom session for each contact on which Wisdom is
enabled.

``` swift
func createSession(input: CreateSessionInput, completion: @escaping (ClientRuntime.SdkResult<CreateSessionOutputResponse, CreateSessionOutputError>) -> Void)
```

### deleteAssistant(input:​completion:​)

Deletes an assistant.

``` swift
func deleteAssistant(input: DeleteAssistantInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAssistantOutputResponse, DeleteAssistantOutputError>) -> Void)
```

### deleteAssistantAssociation(input:​completion:​)

Deletes an assistant association.

``` swift
func deleteAssistantAssociation(input: DeleteAssistantAssociationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAssistantAssociationOutputResponse, DeleteAssistantAssociationOutputError>) -> Void)
```

### deleteContent(input:​completion:​)

Deletes the content.

``` swift
func deleteContent(input: DeleteContentInput, completion: @escaping (ClientRuntime.SdkResult<DeleteContentOutputResponse, DeleteContentOutputError>) -> Void)
```

### deleteKnowledgeBase(input:​completion:​)

Deletes the knowledge base.

``` swift
func deleteKnowledgeBase(input: DeleteKnowledgeBaseInput, completion: @escaping (ClientRuntime.SdkResult<DeleteKnowledgeBaseOutputResponse, DeleteKnowledgeBaseOutputError>) -> Void)
```

``` 
        When you use this API to delete an external knowledge base such as Salesforce or
    ServiceNow, you must also delete the <a href="https://docs.aws.amazon.com/appintegrations/latest/APIReference/Welcome.html">Amazon AppIntegrations DataIntegration.
    This is because you can't reuse the DataIntegration after it's been associated with an
    external knowledge base. However, you can delete and recreate it. See <a href="https://docs.aws.amazon.com/appintegrations/latest/APIReference/API_DeleteDataIntegration.html">DeleteDataIntegration and <a href="https://docs.aws.amazon.com/appintegrations/latest/APIReference/API_CreateDataIntegration.html">CreateDataIntegration in the Amazon AppIntegrations API
    Reference.
```

### getAssistant(input:​completion:​)

Retrieves information about an assistant.

``` swift
func getAssistant(input: GetAssistantInput, completion: @escaping (ClientRuntime.SdkResult<GetAssistantOutputResponse, GetAssistantOutputError>) -> Void)
```

### getAssistantAssociation(input:​completion:​)

Retrieves information about an assistant association.

``` swift
func getAssistantAssociation(input: GetAssistantAssociationInput, completion: @escaping (ClientRuntime.SdkResult<GetAssistantAssociationOutputResponse, GetAssistantAssociationOutputError>) -> Void)
```

### getContent(input:​completion:​)

Retrieves content, including a pre-signed URL to download the content.

``` swift
func getContent(input: GetContentInput, completion: @escaping (ClientRuntime.SdkResult<GetContentOutputResponse, GetContentOutputError>) -> Void)
```

### getContentSummary(input:​completion:​)

Retrieves summary information about the content.

``` swift
func getContentSummary(input: GetContentSummaryInput, completion: @escaping (ClientRuntime.SdkResult<GetContentSummaryOutputResponse, GetContentSummaryOutputError>) -> Void)
```

### getKnowledgeBase(input:​completion:​)

Retrieves information about the knowledge base.

``` swift
func getKnowledgeBase(input: GetKnowledgeBaseInput, completion: @escaping (ClientRuntime.SdkResult<GetKnowledgeBaseOutputResponse, GetKnowledgeBaseOutputError>) -> Void)
```

### getRecommendations(input:​completion:​)

Retrieves recommendations for the specified session. To avoid retrieving the same
recommendations in subsequent calls, use <a href="https:​//docs.aws.amazon.com/wisdom/latest/APIReference/API_NotifyRecommendationsReceived.html">NotifyRecommendationsReceived. This API supports long-polling behavior with the
waitTimeSeconds parameter. Short poll is the default behavior and only returns
recommendations already available. To perform a manual query against an assistant, use <a href="https:​//docs.aws.amazon.com/wisdom/latest/APIReference/API_QueryAssistant.html">QueryAssistant.

``` swift
func getRecommendations(input: GetRecommendationsInput, completion: @escaping (ClientRuntime.SdkResult<GetRecommendationsOutputResponse, GetRecommendationsOutputError>) -> Void)
```

### getSession(input:​completion:​)

Retrieves information for a specified session.

``` swift
func getSession(input: GetSessionInput, completion: @escaping (ClientRuntime.SdkResult<GetSessionOutputResponse, GetSessionOutputError>) -> Void)
```

### listAssistantAssociations(input:​completion:​)

Lists information about assistant associations.

``` swift
func listAssistantAssociations(input: ListAssistantAssociationsInput, completion: @escaping (ClientRuntime.SdkResult<ListAssistantAssociationsOutputResponse, ListAssistantAssociationsOutputError>) -> Void)
```

### listAssistants(input:​completion:​)

Lists information about assistants.

``` swift
func listAssistants(input: ListAssistantsInput, completion: @escaping (ClientRuntime.SdkResult<ListAssistantsOutputResponse, ListAssistantsOutputError>) -> Void)
```

### listContents(input:​completion:​)

Lists the content.

``` swift
func listContents(input: ListContentsInput, completion: @escaping (ClientRuntime.SdkResult<ListContentsOutputResponse, ListContentsOutputError>) -> Void)
```

### listKnowledgeBases(input:​completion:​)

Lists the knowledge bases.

``` swift
func listKnowledgeBases(input: ListKnowledgeBasesInput, completion: @escaping (ClientRuntime.SdkResult<ListKnowledgeBasesOutputResponse, ListKnowledgeBasesOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

Lists the tags for the specified resource.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### notifyRecommendationsReceived(input:​completion:​)

Removes the specified recommendations from the specified assistant's queue of newly
available recommendations. You can use this API in conjunction with <a href="https:​//docs.aws.amazon.com/wisdom/latest/APIReference/API_GetRecommendations.html">GetRecommendations and a waitTimeSeconds input for long-polling
behavior and avoiding duplicate recommendations.

``` swift
func notifyRecommendationsReceived(input: NotifyRecommendationsReceivedInput, completion: @escaping (ClientRuntime.SdkResult<NotifyRecommendationsReceivedOutputResponse, NotifyRecommendationsReceivedOutputError>) -> Void)
```

### queryAssistant(input:​completion:​)

Performs a manual search against the specified assistant. To retrieve recommendations for
an assistant, use <a href="https:​//docs.aws.amazon.com/wisdom/latest/APIReference/API_GetRecommendations.html">GetRecommendations.

``` swift
func queryAssistant(input: QueryAssistantInput, completion: @escaping (ClientRuntime.SdkResult<QueryAssistantOutputResponse, QueryAssistantOutputError>) -> Void)
```

### removeKnowledgeBaseTemplateUri(input:​completion:​)

Removes a URI template from a knowledge base.

``` swift
func removeKnowledgeBaseTemplateUri(input: RemoveKnowledgeBaseTemplateUriInput, completion: @escaping (ClientRuntime.SdkResult<RemoveKnowledgeBaseTemplateUriOutputResponse, RemoveKnowledgeBaseTemplateUriOutputError>) -> Void)
```

### searchContent(input:​completion:​)

Searches for content in a specified knowledge base. Can be used to get a specific content
resource by its name.

``` swift
func searchContent(input: SearchContentInput, completion: @escaping (ClientRuntime.SdkResult<SearchContentOutputResponse, SearchContentOutputError>) -> Void)
```

### searchSessions(input:​completion:​)

Searches for sessions.

``` swift
func searchSessions(input: SearchSessionsInput, completion: @escaping (ClientRuntime.SdkResult<SearchSessionsOutputResponse, SearchSessionsOutputError>) -> Void)
```

### startContentUpload(input:​completion:​)

Get a URL to upload content to a knowledge base. To upload content, first make a PUT
request to the returned URL with your file, making sure to include the required headers. Then
use <a href="https:​//docs.aws.amazon.com/wisdom/latest/APIReference/API_CreateContent.html">CreateContent to finalize the content creation process or <a href="https:​//docs.aws.amazon.com/wisdom/latest/APIReference/API_UpdateContent.html">UpdateContent to modify an existing resource. You can only upload content to a
knowledge base of type CUSTOM.

``` swift
func startContentUpload(input: StartContentUploadInput, completion: @escaping (ClientRuntime.SdkResult<StartContentUploadOutputResponse, StartContentUploadOutputError>) -> Void)
```

### tagResource(input:​completion:​)

Adds the specified tags to the specified resource.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:​completion:​)

Removes the specified tags from the specified resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateContent(input:​completion:​)

Updates information about the content.

``` swift
func updateContent(input: UpdateContentInput, completion: @escaping (ClientRuntime.SdkResult<UpdateContentOutputResponse, UpdateContentOutputError>) -> Void)
```

### updateKnowledgeBaseTemplateUri(input:​completion:​)

Updates the template URI of a knowledge base. This is only supported for knowledge bases
of type EXTERNAL. Include a single variable in ${variable} format; this
interpolated by Wisdom using ingested content. For example, if you ingest a Salesforce
article, it has an Id value, and you can set the template URI to
https:​//myInstanceName.lightning.force.com/lightning/r/Knowledge\_\_kav/*${Id}*/view.

``` swift
func updateKnowledgeBaseTemplateUri(input: UpdateKnowledgeBaseTemplateUriInput, completion: @escaping (ClientRuntime.SdkResult<UpdateKnowledgeBaseTemplateUriOutputResponse, UpdateKnowledgeBaseTemplateUriOutputError>) -> Void)
```
