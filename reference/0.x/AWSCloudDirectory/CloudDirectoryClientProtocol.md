# CloudDirectoryClientProtocol

<fullname>Amazon Cloud Directory</fullname>
Amazon Cloud Directory is a component of the AWS Directory Service that simplifies the
development and management of cloud-scale web, mobile, and IoT applications. This guide
describes the Cloud Directory operations that you can call programmatically and includes
detailed information on data types and errors. For information about Cloud Directory features, see <a href="https:​//aws.amazon.com/directoryservice/">AWS Directory
Service and the <a href="https:​//docs.aws.amazon.com/clouddirectory/latest/developerguide/what_is_cloud_directory.html">Amazon Cloud Directory Developer Guide.

``` swift
public protocol CloudDirectoryClientProtocol 
```

## Requirements

### addFacetToObject(input:​completion:​)

Adds a new Facet to an object. An object can have more than one facet applied on it.

``` swift
func addFacetToObject(input: AddFacetToObjectInput, completion: @escaping (ClientRuntime.SdkResult<AddFacetToObjectOutputResponse, AddFacetToObjectOutputError>) -> Void)
```

### applySchema(input:​completion:​)

Copies the input published schema, at the specified version, into the Directory with the same
name and version as that of the published schema.

``` swift
func applySchema(input: ApplySchemaInput, completion: @escaping (ClientRuntime.SdkResult<ApplySchemaOutputResponse, ApplySchemaOutputError>) -> Void)
```

### attachObject(input:​completion:​)

Attaches an existing object to another object. An object can be accessed in two
ways:​

<ol>

``` swift
func attachObject(input: AttachObjectInput, completion: @escaping (ClientRuntime.SdkResult<AttachObjectOutputResponse, AttachObjectOutputError>) -> Void)
```

``` 
           Using the path


           Using ObjectIdentifier


     </ol>
```

### attachPolicy(input:​completion:​)

Attaches a policy object to a regular object. An object can have a limited number of attached
policies.

``` swift
func attachPolicy(input: AttachPolicyInput, completion: @escaping (ClientRuntime.SdkResult<AttachPolicyOutputResponse, AttachPolicyOutputError>) -> Void)
```

### attachToIndex(input:​completion:​)

Attaches the specified object to the specified index.

``` swift
func attachToIndex(input: AttachToIndexInput, completion: @escaping (ClientRuntime.SdkResult<AttachToIndexOutputResponse, AttachToIndexOutputError>) -> Void)
```

### attachTypedLink(input:​completion:​)

Attaches a typed link to a specified source and target object. For more information, see <a href="https:​//docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed Links.

``` swift
func attachTypedLink(input: AttachTypedLinkInput, completion: @escaping (ClientRuntime.SdkResult<AttachTypedLinkOutputResponse, AttachTypedLinkOutputError>) -> Void)
```

### batchRead(input:​completion:​)

Performs all the read operations in a batch.

``` swift
func batchRead(input: BatchReadInput, completion: @escaping (ClientRuntime.SdkResult<BatchReadOutputResponse, BatchReadOutputError>) -> Void)
```

### batchWrite(input:​completion:​)

Performs all the write operations in a batch. Either all the operations succeed or
none.

``` swift
func batchWrite(input: BatchWriteInput, completion: @escaping (ClientRuntime.SdkResult<BatchWriteOutputResponse, BatchWriteOutputError>) -> Void)
```

### createDirectory(input:​completion:​)

Creates a Directory by copying the published schema into the
directory. A directory cannot be created without a schema.
You can also quickly create a directory using a managed schema, called the
QuickStartSchema. For more information, see <a href="https:​//docs.aws.amazon.com/clouddirectory/latest/developerguide/schemas_managed.html">Managed Schema in the Amazon Cloud Directory Developer Guide.

``` swift
func createDirectory(input: CreateDirectoryInput, completion: @escaping (ClientRuntime.SdkResult<CreateDirectoryOutputResponse, CreateDirectoryOutputError>) -> Void)
```

### createFacet(input:​completion:​)

Creates a new Facet in a schema. Facet creation is allowed only
in development or applied schemas.

``` swift
func createFacet(input: CreateFacetInput, completion: @escaping (ClientRuntime.SdkResult<CreateFacetOutputResponse, CreateFacetOutputError>) -> Void)
```

### createIndex(input:​completion:​)

Creates an index object. See <a href="https:​//docs.aws.amazon.com/clouddirectory/latest/developerguide/indexing_search.html">Indexing and search for more information.

``` swift
func createIndex(input: CreateIndexInput, completion: @escaping (ClientRuntime.SdkResult<CreateIndexOutputResponse, CreateIndexOutputError>) -> Void)
```

### createObject(input:​completion:​)

Creates an object in a Directory. Additionally attaches the object to
a parent, if a parent reference and LinkName is specified. An object is simply a
collection of Facet attributes. You can also use this API call to create a
policy object, if the facet from which you create the object is a policy facet.

``` swift
func createObject(input: CreateObjectInput, completion: @escaping (ClientRuntime.SdkResult<CreateObjectOutputResponse, CreateObjectOutputError>) -> Void)
```

### createSchema(input:​completion:​)

Creates a new schema in a development state. A schema can exist in three
phases:​

``` swift
func createSchema(input: CreateSchemaInput, completion: @escaping (ClientRuntime.SdkResult<CreateSchemaOutputResponse, CreateSchemaOutputError>) -> Void)
```

``` 
              Development: This is a mutable phase of the schema. All new
      schemas are in the development phase. Once the schema is finalized, it can be
      published.



              Published: Published schemas are immutable and have a version
      associated with them.



              Applied: Applied schemas are mutable in a way that allows you
      to add new schema facets. You can also add new, nonrequired attributes to existing schema
      facets. You can apply only published schemas to directories.
```

### createTypedLinkFacet(input:​completion:​)

Creates a TypedLinkFacet. For more information, see <a href="https:​//docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed Links.

``` swift
func createTypedLinkFacet(input: CreateTypedLinkFacetInput, completion: @escaping (ClientRuntime.SdkResult<CreateTypedLinkFacetOutputResponse, CreateTypedLinkFacetOutputError>) -> Void)
```

### deleteDirectory(input:​completion:​)

Deletes a directory. Only disabled directories can be deleted. A deleted directory cannot be undone. Exercise extreme
caution
when deleting directories.

``` swift
func deleteDirectory(input: DeleteDirectoryInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDirectoryOutputResponse, DeleteDirectoryOutputError>) -> Void)
```

### deleteFacet(input:​completion:​)

Deletes a given Facet. All attributes and Rules
that are associated with the facet will be deleted. Only development schema facets are allowed
deletion.

``` swift
func deleteFacet(input: DeleteFacetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFacetOutputResponse, DeleteFacetOutputError>) -> Void)
```

### deleteObject(input:​completion:​)

Deletes an object and its associated attributes. Only objects with no children and no
parents can be deleted. The maximum number of attributes that can be deleted during an object deletion is 30. For more information, see <a href="https:​//docs.aws.amazon.com/clouddirectory/latest/developerguide/limits.html">Amazon Cloud Directory Limits.

``` swift
func deleteObject(input: DeleteObjectInput, completion: @escaping (ClientRuntime.SdkResult<DeleteObjectOutputResponse, DeleteObjectOutputError>) -> Void)
```

### deleteSchema(input:​completion:​)

Deletes a given schema. Schemas in a development and published state can only be deleted.

``` swift
func deleteSchema(input: DeleteSchemaInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSchemaOutputResponse, DeleteSchemaOutputError>) -> Void)
```

### deleteTypedLinkFacet(input:​completion:​)

Deletes a TypedLinkFacet. For more information, see <a href="https:​//docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed Links.

``` swift
func deleteTypedLinkFacet(input: DeleteTypedLinkFacetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTypedLinkFacetOutputResponse, DeleteTypedLinkFacetOutputError>) -> Void)
```

### detachFromIndex(input:​completion:​)

Detaches the specified object from the specified index.

``` swift
func detachFromIndex(input: DetachFromIndexInput, completion: @escaping (ClientRuntime.SdkResult<DetachFromIndexOutputResponse, DetachFromIndexOutputError>) -> Void)
```

### detachObject(input:​completion:​)

Detaches a given object from the parent object. The object that is to be detached from the
parent is specified by the link name.

``` swift
func detachObject(input: DetachObjectInput, completion: @escaping (ClientRuntime.SdkResult<DetachObjectOutputResponse, DetachObjectOutputError>) -> Void)
```

### detachPolicy(input:​completion:​)

Detaches a policy from an object.

``` swift
func detachPolicy(input: DetachPolicyInput, completion: @escaping (ClientRuntime.SdkResult<DetachPolicyOutputResponse, DetachPolicyOutputError>) -> Void)
```

### detachTypedLink(input:​completion:​)

Detaches a typed link from a specified source and target object. For more information, see <a href="https:​//docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed Links.

``` swift
func detachTypedLink(input: DetachTypedLinkInput, completion: @escaping (ClientRuntime.SdkResult<DetachTypedLinkOutputResponse, DetachTypedLinkOutputError>) -> Void)
```

### disableDirectory(input:​completion:​)

Disables the specified directory. Disabled directories cannot be read or written to.
Only enabled directories can be disabled. Disabled directories may be reenabled.

``` swift
func disableDirectory(input: DisableDirectoryInput, completion: @escaping (ClientRuntime.SdkResult<DisableDirectoryOutputResponse, DisableDirectoryOutputError>) -> Void)
```

### enableDirectory(input:​completion:​)

Enables the specified directory. Only disabled directories can be enabled. Once
enabled, the directory can then be read and written to.

``` swift
func enableDirectory(input: EnableDirectoryInput, completion: @escaping (ClientRuntime.SdkResult<EnableDirectoryOutputResponse, EnableDirectoryOutputError>) -> Void)
```

### getAppliedSchemaVersion(input:​completion:​)

Returns current applied schema version ARN, including the minor version in use.

``` swift
func getAppliedSchemaVersion(input: GetAppliedSchemaVersionInput, completion: @escaping (ClientRuntime.SdkResult<GetAppliedSchemaVersionOutputResponse, GetAppliedSchemaVersionOutputError>) -> Void)
```

### getDirectory(input:​completion:​)

Retrieves metadata about a directory.

``` swift
func getDirectory(input: GetDirectoryInput, completion: @escaping (ClientRuntime.SdkResult<GetDirectoryOutputResponse, GetDirectoryOutputError>) -> Void)
```

### getFacet(input:​completion:​)

Gets details of the Facet, such as facet name, attributes, Rules, or ObjectType. You can call this on all kinds of schema
facets -- published, development, or applied.

``` swift
func getFacet(input: GetFacetInput, completion: @escaping (ClientRuntime.SdkResult<GetFacetOutputResponse, GetFacetOutputError>) -> Void)
```

### getLinkAttributes(input:​completion:​)

Retrieves attributes that are associated with a typed link.

``` swift
func getLinkAttributes(input: GetLinkAttributesInput, completion: @escaping (ClientRuntime.SdkResult<GetLinkAttributesOutputResponse, GetLinkAttributesOutputError>) -> Void)
```

### getObjectAttributes(input:​completion:​)

Retrieves attributes within a facet that are associated with an object.

``` swift
func getObjectAttributes(input: GetObjectAttributesInput, completion: @escaping (ClientRuntime.SdkResult<GetObjectAttributesOutputResponse, GetObjectAttributesOutputError>) -> Void)
```

### getObjectInformation(input:​completion:​)

Retrieves metadata about an object.

``` swift
func getObjectInformation(input: GetObjectInformationInput, completion: @escaping (ClientRuntime.SdkResult<GetObjectInformationOutputResponse, GetObjectInformationOutputError>) -> Void)
```

### getSchemaAsJson(input:​completion:​)

Retrieves a JSON representation of the schema. See <a href="https:​//docs.aws.amazon.com/clouddirectory/latest/developerguide/schemas_jsonformat.html#schemas_json">JSON Schema Format for more information.

``` swift
func getSchemaAsJson(input: GetSchemaAsJsonInput, completion: @escaping (ClientRuntime.SdkResult<GetSchemaAsJsonOutputResponse, GetSchemaAsJsonOutputError>) -> Void)
```

### getTypedLinkFacetInformation(input:​completion:​)

Returns the identity attribute order for a specific TypedLinkFacet. For more information, see <a href="https:​//docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed Links.

``` swift
func getTypedLinkFacetInformation(input: GetTypedLinkFacetInformationInput, completion: @escaping (ClientRuntime.SdkResult<GetTypedLinkFacetInformationOutputResponse, GetTypedLinkFacetInformationOutputError>) -> Void)
```

### listAppliedSchemaArns(input:​completion:​)

Lists schema major versions applied to a directory. If SchemaArn is provided, lists the minor version.

``` swift
func listAppliedSchemaArns(input: ListAppliedSchemaArnsInput, completion: @escaping (ClientRuntime.SdkResult<ListAppliedSchemaArnsOutputResponse, ListAppliedSchemaArnsOutputError>) -> Void)
```

### listAttachedIndices(input:​completion:​)

Lists indices attached to the specified object.

``` swift
func listAttachedIndices(input: ListAttachedIndicesInput, completion: @escaping (ClientRuntime.SdkResult<ListAttachedIndicesOutputResponse, ListAttachedIndicesOutputError>) -> Void)
```

### listDevelopmentSchemaArns(input:​completion:​)

Retrieves each Amazon Resource Name (ARN) of schemas in the development
state.

``` swift
func listDevelopmentSchemaArns(input: ListDevelopmentSchemaArnsInput, completion: @escaping (ClientRuntime.SdkResult<ListDevelopmentSchemaArnsOutputResponse, ListDevelopmentSchemaArnsOutputError>) -> Void)
```

### listDirectories(input:​completion:​)

Lists directories created within an account.

``` swift
func listDirectories(input: ListDirectoriesInput, completion: @escaping (ClientRuntime.SdkResult<ListDirectoriesOutputResponse, ListDirectoriesOutputError>) -> Void)
```

### listFacetAttributes(input:​completion:​)

Retrieves attributes attached to the facet.

``` swift
func listFacetAttributes(input: ListFacetAttributesInput, completion: @escaping (ClientRuntime.SdkResult<ListFacetAttributesOutputResponse, ListFacetAttributesOutputError>) -> Void)
```

### listFacetNames(input:​completion:​)

Retrieves the names of facets that exist in a schema.

``` swift
func listFacetNames(input: ListFacetNamesInput, completion: @escaping (ClientRuntime.SdkResult<ListFacetNamesOutputResponse, ListFacetNamesOutputError>) -> Void)
```

### listIncomingTypedLinks(input:​completion:​)

Returns a paginated list of all the incoming TypedLinkSpecifier
information for an object. It also supports filtering by typed link facet and identity
attributes. For more information, see <a href="https:​//docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed Links.

``` swift
func listIncomingTypedLinks(input: ListIncomingTypedLinksInput, completion: @escaping (ClientRuntime.SdkResult<ListIncomingTypedLinksOutputResponse, ListIncomingTypedLinksOutputError>) -> Void)
```

### listIndex(input:​completion:​)

Lists objects attached to the specified index.

``` swift
func listIndex(input: ListIndexInput, completion: @escaping (ClientRuntime.SdkResult<ListIndexOutputResponse, ListIndexOutputError>) -> Void)
```

### listManagedSchemaArns(input:​completion:​)

Lists the major version families of each managed schema. If a major version ARN is provided as SchemaArn, the minor version revisions in that family are listed instead.

``` swift
func listManagedSchemaArns(input: ListManagedSchemaArnsInput, completion: @escaping (ClientRuntime.SdkResult<ListManagedSchemaArnsOutputResponse, ListManagedSchemaArnsOutputError>) -> Void)
```

### listObjectAttributes(input:​completion:​)

Lists all attributes that are associated with an object.

``` swift
func listObjectAttributes(input: ListObjectAttributesInput, completion: @escaping (ClientRuntime.SdkResult<ListObjectAttributesOutputResponse, ListObjectAttributesOutputError>) -> Void)
```

### listObjectChildren(input:​completion:​)

Returns a paginated list of child objects that are associated with a given
object.

``` swift
func listObjectChildren(input: ListObjectChildrenInput, completion: @escaping (ClientRuntime.SdkResult<ListObjectChildrenOutputResponse, ListObjectChildrenOutputError>) -> Void)
```

### listObjectParentPaths(input:​completion:​)

Retrieves all available parent paths for any object type such as node, leaf node,
policy node, and index node objects. For more information about objects, see <a href="https:​//docs.aws.amazon.com/clouddirectory/latest/developerguide/key_concepts_directorystructure.html">Directory Structure.
Use this API to evaluate all parents for an object. The call returns all objects from
the root of the directory up to the requested object. The API returns the number of paths
based on user-defined MaxResults, in case there are multiple paths to the parent.
The order of the paths and nodes returned is consistent among multiple API calls unless the
objects are deleted or moved. Paths not leading to the directory root are ignored from the
target object.

``` swift
func listObjectParentPaths(input: ListObjectParentPathsInput, completion: @escaping (ClientRuntime.SdkResult<ListObjectParentPathsOutputResponse, ListObjectParentPathsOutputError>) -> Void)
```

### listObjectParents(input:​completion:​)

Lists parent objects that are associated with a given object in pagination
fashion.

``` swift
func listObjectParents(input: ListObjectParentsInput, completion: @escaping (ClientRuntime.SdkResult<ListObjectParentsOutputResponse, ListObjectParentsOutputError>) -> Void)
```

### listObjectPolicies(input:​completion:​)

Returns policies attached to an object in pagination fashion.

``` swift
func listObjectPolicies(input: ListObjectPoliciesInput, completion: @escaping (ClientRuntime.SdkResult<ListObjectPoliciesOutputResponse, ListObjectPoliciesOutputError>) -> Void)
```

### listOutgoingTypedLinks(input:​completion:​)

Returns a paginated list of all the outgoing TypedLinkSpecifier
information for an object. It also supports filtering by typed link facet and identity
attributes. For more information, see <a href="https:​//docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed Links.

``` swift
func listOutgoingTypedLinks(input: ListOutgoingTypedLinksInput, completion: @escaping (ClientRuntime.SdkResult<ListOutgoingTypedLinksOutputResponse, ListOutgoingTypedLinksOutputError>) -> Void)
```

### listPolicyAttachments(input:​completion:​)

Returns all of the ObjectIdentifiers to which a given policy is attached.

``` swift
func listPolicyAttachments(input: ListPolicyAttachmentsInput, completion: @escaping (ClientRuntime.SdkResult<ListPolicyAttachmentsOutputResponse, ListPolicyAttachmentsOutputError>) -> Void)
```

### listPublishedSchemaArns(input:​completion:​)

Lists the major version families of each published schema. If a major version ARN is provided as SchemaArn, the minor version revisions in that family are listed instead.

``` swift
func listPublishedSchemaArns(input: ListPublishedSchemaArnsInput, completion: @escaping (ClientRuntime.SdkResult<ListPublishedSchemaArnsOutputResponse, ListPublishedSchemaArnsOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

Returns tags for a resource. Tagging is currently supported only for directories with a
limit of 50 tags per directory. All 50 tags are returned for a given directory with this API
call.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### listTypedLinkFacetAttributes(input:​completion:​)

Returns a paginated list of all attribute definitions for a particular TypedLinkFacet. For more information, see <a href="https:​//docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed Links.

``` swift
func listTypedLinkFacetAttributes(input: ListTypedLinkFacetAttributesInput, completion: @escaping (ClientRuntime.SdkResult<ListTypedLinkFacetAttributesOutputResponse, ListTypedLinkFacetAttributesOutputError>) -> Void)
```

### listTypedLinkFacetNames(input:​completion:​)

Returns a paginated list of TypedLink facet names for a particular schema.
For more information, see <a href="https:​//docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed Links.

``` swift
func listTypedLinkFacetNames(input: ListTypedLinkFacetNamesInput, completion: @escaping (ClientRuntime.SdkResult<ListTypedLinkFacetNamesOutputResponse, ListTypedLinkFacetNamesOutputError>) -> Void)
```

### lookupPolicy(input:​completion:​)

Lists all policies from the root of the Directory to the object
specified. If there are no policies present, an empty list is returned. If policies are
present, and if some objects don't have the policies attached, it returns the ObjectIdentifier
for such objects. If policies are present, it returns ObjectIdentifier, policyId, and
policyType. Paths that don't lead to the root from the target object are ignored. For more
information, see <a href="https:​//docs.aws.amazon.com/clouddirectory/latest/developerguide/key_concepts_directory.html#key_concepts_policies">Policies.

``` swift
func lookupPolicy(input: LookupPolicyInput, completion: @escaping (ClientRuntime.SdkResult<LookupPolicyOutputResponse, LookupPolicyOutputError>) -> Void)
```

### publishSchema(input:​completion:​)

Publishes a development schema with a major version and a recommended minor version.

``` swift
func publishSchema(input: PublishSchemaInput, completion: @escaping (ClientRuntime.SdkResult<PublishSchemaOutputResponse, PublishSchemaOutputError>) -> Void)
```

### putSchemaFromJson(input:​completion:​)

Allows a schema to be updated using JSON upload. Only available for development schemas. See <a href="https:​//docs.aws.amazon.com/clouddirectory/latest/developerguide/schemas_jsonformat.html#schemas_json">JSON Schema Format for more information.

``` swift
func putSchemaFromJson(input: PutSchemaFromJsonInput, completion: @escaping (ClientRuntime.SdkResult<PutSchemaFromJsonOutputResponse, PutSchemaFromJsonOutputError>) -> Void)
```

### removeFacetFromObject(input:​completion:​)

Removes the specified facet from the specified object.

``` swift
func removeFacetFromObject(input: RemoveFacetFromObjectInput, completion: @escaping (ClientRuntime.SdkResult<RemoveFacetFromObjectOutputResponse, RemoveFacetFromObjectOutputError>) -> Void)
```

### tagResource(input:​completion:​)

An API operation for adding tags to a resource.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:​completion:​)

An API operation for removing tags from a resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateFacet(input:​completion:​)

Does the following:​

<ol>

``` swift
func updateFacet(input: UpdateFacetInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFacetOutputResponse, UpdateFacetOutputError>) -> Void)
```

``` 
           Adds new Attributes, Rules, or ObjectTypes.


           Updates existing Attributes, Rules, or ObjectTypes.


           Deletes existing Attributes, Rules, or ObjectTypes.

     </ol>
```

### updateLinkAttributes(input:​completion:​)

Updates a given typed link’s attributes. Attributes to be updated must not contribute to the typed link’s identity, as defined by its IdentityAttributeOrder.

``` swift
func updateLinkAttributes(input: UpdateLinkAttributesInput, completion: @escaping (ClientRuntime.SdkResult<UpdateLinkAttributesOutputResponse, UpdateLinkAttributesOutputError>) -> Void)
```

### updateObjectAttributes(input:​completion:​)

Updates a given object's attributes.

``` swift
func updateObjectAttributes(input: UpdateObjectAttributesInput, completion: @escaping (ClientRuntime.SdkResult<UpdateObjectAttributesOutputResponse, UpdateObjectAttributesOutputError>) -> Void)
```

### updateSchema(input:​completion:​)

Updates the schema name with a new name. Only development schema names can be
updated.

``` swift
func updateSchema(input: UpdateSchemaInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSchemaOutputResponse, UpdateSchemaOutputError>) -> Void)
```

### updateTypedLinkFacet(input:​completion:​)

Updates a TypedLinkFacet. For more information, see <a href="https:​//docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink">Typed Links.

``` swift
func updateTypedLinkFacet(input: UpdateTypedLinkFacetInput, completion: @escaping (ClientRuntime.SdkResult<UpdateTypedLinkFacetOutputResponse, UpdateTypedLinkFacetOutputError>) -> Void)
```

### upgradeAppliedSchema(input:​completion:​)

Upgrades a single directory in-place using the PublishedSchemaArn with schema updates found in MinorVersion. Backwards-compatible minor version upgrades are instantaneously available for readers on all objects in the directory. Note:​ This is a synchronous API call and upgrades only one schema on a given directory per call. To upgrade multiple directories from one schema, you would need to call this API on each directory.

``` swift
func upgradeAppliedSchema(input: UpgradeAppliedSchemaInput, completion: @escaping (ClientRuntime.SdkResult<UpgradeAppliedSchemaOutputResponse, UpgradeAppliedSchemaOutputError>) -> Void)
```

### upgradePublishedSchema(input:​completion:​)

Upgrades a published schema under a new minor version revision using the current contents of DevelopmentSchemaArn.

``` swift
func upgradePublishedSchema(input: UpgradePublishedSchemaInput, completion: @escaping (ClientRuntime.SdkResult<UpgradePublishedSchemaOutputResponse, UpgradePublishedSchemaOutputError>) -> Void)
```
