# CustomerProfilesClientProtocol

<fullname>Amazon Connect Customer Profiles</fullname>
Welcome to the Amazon Connect Customer Profiles API Reference. This guide provides information
about the Amazon Connect Customer Profiles API, including supported operations, data types,
parameters, and schemas.
Amazon Connect Customer Profiles is a unified customer profile for your contact center that has
pre-built connectors powered by AppFlow that make it easy to combine customer information
from third party applications, such as Salesforce (CRM), ServiceNow (ITSM), and your
enterprise resource planning (ERP), with contact history from your Amazon Connect contact
center.
If you're new to Amazon Connect , you might find it helpful to also review the <a href="https:​//docs.aws.amazon.com/connect/latest/adminguide/what-is-amazon-connect.html">Amazon Connect Administrator Guide.

``` swift
public protocol CustomerProfilesClientProtocol 
```

## Requirements

### addProfileKey(input:​completion:​)

Associates a new key value with a specific profile, such as a Contact Trace Record (CTR)
ContactId.
A profile object can have a single unique key and any number of additional keys that can
be used to identify the profile that it belongs to.

``` swift
func addProfileKey(input: AddProfileKeyInput, completion: @escaping (ClientRuntime.SdkResult<AddProfileKeyOutputResponse, AddProfileKeyOutputError>) -> Void)
```

### createDomain(input:​completion:​)

Creates a domain, which is a container for all customer data, such as customer profile
attributes, object types, profile keys, and encryption keys. You can create multiple
domains, and each domain can have multiple third-party integrations.
Each Amazon Connect instance can be associated with only one domain. Multiple Amazon Connect instances can
be associated with one domain.
Use this API or <a href="https:​//docs.aws.amazon.com/customerprofiles/latest/APIReference/API_UpdateDomain.html">UpdateDomain to
enable <a href="https:​//docs.aws.amazon.com/customerprofiles/latest/APIReference/API_GetMatches.html">identity
resolution:​ set Matching to true.

``` swift
func createDomain(input: CreateDomainInput, completion: @escaping (ClientRuntime.SdkResult<CreateDomainOutputResponse, CreateDomainOutputError>) -> Void)
```

### createProfile(input:​completion:​)

Creates a standard profile.
A standard profile represents the following attributes for a customer profile in a
domain.

``` swift
func createProfile(input: CreateProfileInput, completion: @escaping (ClientRuntime.SdkResult<CreateProfileOutputResponse, CreateProfileOutputError>) -> Void)
```

### deleteDomain(input:​completion:​)

Deletes a specific domain and all of its customer data, such as customer profile
attributes and their related objects.

``` swift
func deleteDomain(input: DeleteDomainInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDomainOutputResponse, DeleteDomainOutputError>) -> Void)
```

### deleteIntegration(input:​completion:​)

Removes an integration from a specific domain.

``` swift
func deleteIntegration(input: DeleteIntegrationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteIntegrationOutputResponse, DeleteIntegrationOutputError>) -> Void)
```

### deleteProfile(input:​completion:​)

Deletes the standard customer profile and all data pertaining to the profile.

``` swift
func deleteProfile(input: DeleteProfileInput, completion: @escaping (ClientRuntime.SdkResult<DeleteProfileOutputResponse, DeleteProfileOutputError>) -> Void)
```

### deleteProfileKey(input:​completion:​)

Removes a searchable key from a customer profile.

``` swift
func deleteProfileKey(input: DeleteProfileKeyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteProfileKeyOutputResponse, DeleteProfileKeyOutputError>) -> Void)
```

### deleteProfileObject(input:​completion:​)

Removes an object associated with a profile of a given ProfileObjectType.

``` swift
func deleteProfileObject(input: DeleteProfileObjectInput, completion: @escaping (ClientRuntime.SdkResult<DeleteProfileObjectOutputResponse, DeleteProfileObjectOutputError>) -> Void)
```

### deleteProfileObjectType(input:​completion:​)

Removes a ProfileObjectType from a specific domain as well as removes all the
ProfileObjects of that type. It also disables integrations from this specific
ProfileObjectType. In addition, it scrubs all of the fields of the standard profile that
were populated from this ProfileObjectType.

``` swift
func deleteProfileObjectType(input: DeleteProfileObjectTypeInput, completion: @escaping (ClientRuntime.SdkResult<DeleteProfileObjectTypeOutputResponse, DeleteProfileObjectTypeOutputError>) -> Void)
```

### getDomain(input:​completion:​)

Returns information about a specific domain.

``` swift
func getDomain(input: GetDomainInput, completion: @escaping (ClientRuntime.SdkResult<GetDomainOutputResponse, GetDomainOutputError>) -> Void)
```

### getIntegration(input:​completion:​)

Returns an integration for a domain.

``` swift
func getIntegration(input: GetIntegrationInput, completion: @escaping (ClientRuntime.SdkResult<GetIntegrationOutputResponse, GetIntegrationOutputError>) -> Void)
```

### getMatches(input:​completion:​)

This API is in preview release for Amazon Connect and subject to change.
Before calling this API, use <a href="https:​//docs.aws.amazon.com/customerprofiles/latest/APIReference/API_CreateDomain.html">CreateDomain or
<a href="https:​//docs.aws.amazon.com/customerprofiles/latest/APIReference/API_UpdateDomain.html">UpdateDomain to
enable identity resolution:​ set Matching to true.
GetMatches returns potentially matching profiles, based on the results of the latest run
of a machine learning process.

``` swift
func getMatches(input: GetMatchesInput, completion: @escaping (ClientRuntime.SdkResult<GetMatchesOutputResponse, GetMatchesOutputError>) -> Void)
```

``` 
        Amazon Connect starts a batch process every Saturday at 12AM UTC to identify matching profiles.
        The results are returned up to seven days after the Saturday run.


     Amazon Connect uses the following profile attributes to identify matches:


           PhoneNumber


           HomePhoneNumber


           BusinessPhoneNumber


           MobilePhoneNumber


           EmailAddress


           PersonalEmailAddress


           BusinessEmailAddress


           FullName


           BusinessName


     For example, two or more profiles—with spelling mistakes such as John Doe and Jhn Doe, or different casing
     email addresses such as JOHN_DOE@ANYCOMPANY.COM and
        johndoe@anycompany.com, or different phone number
     formats such as 555-010-0000 and +1-555-010-0000—can be detected as belonging to the same customer John Doe and merged into a unified profile.
```

### getProfileObjectType(input:​completion:​)

Returns the object types for a specific domain.

``` swift
func getProfileObjectType(input: GetProfileObjectTypeInput, completion: @escaping (ClientRuntime.SdkResult<GetProfileObjectTypeOutputResponse, GetProfileObjectTypeOutputError>) -> Void)
```

### getProfileObjectTypeTemplate(input:​completion:​)

Returns the template information for a specific object type.
A template is a predefined ProfileObjectType, such as “Salesforce-Account” or
“Salesforce-Contact.” When a user sends a ProfileObject, using the PutProfileObject API,
with an ObjectTypeName that matches one of the TemplateIds, it uses the mappings from the
template.

``` swift
func getProfileObjectTypeTemplate(input: GetProfileObjectTypeTemplateInput, completion: @escaping (ClientRuntime.SdkResult<GetProfileObjectTypeTemplateOutputResponse, GetProfileObjectTypeTemplateOutputError>) -> Void)
```

### listAccountIntegrations(input:​completion:​)

Lists all of the integrations associated to a specific URI in the AWS account.

``` swift
func listAccountIntegrations(input: ListAccountIntegrationsInput, completion: @escaping (ClientRuntime.SdkResult<ListAccountIntegrationsOutputResponse, ListAccountIntegrationsOutputError>) -> Void)
```

### listDomains(input:​completion:​)

Returns a list of all the domains for an AWS account that have been created.

``` swift
func listDomains(input: ListDomainsInput, completion: @escaping (ClientRuntime.SdkResult<ListDomainsOutputResponse, ListDomainsOutputError>) -> Void)
```

### listIntegrations(input:​completion:​)

Lists all of the integrations in your domain.

``` swift
func listIntegrations(input: ListIntegrationsInput, completion: @escaping (ClientRuntime.SdkResult<ListIntegrationsOutputResponse, ListIntegrationsOutputError>) -> Void)
```

### listProfileObjects(input:​completion:​)

Returns a list of objects associated with a profile of a given ProfileObjectType.

``` swift
func listProfileObjects(input: ListProfileObjectsInput, completion: @escaping (ClientRuntime.SdkResult<ListProfileObjectsOutputResponse, ListProfileObjectsOutputError>) -> Void)
```

### listProfileObjectTypes(input:​completion:​)

Lists all of the templates available within the service.

``` swift
func listProfileObjectTypes(input: ListProfileObjectTypesInput, completion: @escaping (ClientRuntime.SdkResult<ListProfileObjectTypesOutputResponse, ListProfileObjectTypesOutputError>) -> Void)
```

### listProfileObjectTypeTemplates(input:​completion:​)

Lists all of the template information for object types.

``` swift
func listProfileObjectTypeTemplates(input: ListProfileObjectTypeTemplatesInput, completion: @escaping (ClientRuntime.SdkResult<ListProfileObjectTypeTemplatesOutputResponse, ListProfileObjectTypeTemplatesOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

Displays the tags associated with an Amazon Connect Customer Profiles resource. In Connect
Customer Profiles, domains, profile object types, and integrations can be tagged.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### mergeProfiles(input:​completion:​)

This API is in preview release for Amazon Connect and subject to change.
Runs an AWS Lambda job that does the following:​

<ol>

``` swift
func mergeProfiles(input: MergeProfilesInput, completion: @escaping (ClientRuntime.SdkResult<MergeProfilesOutputResponse, MergeProfilesOutputError>) -> Void)
```

``` 
           All the profileKeys in the ProfileToBeMerged will be moved to the
           main profile.


           All the objects in the ProfileToBeMerged will be moved to the main
           profile.


           All the ProfileToBeMerged will be deleted at the end.


           All the profileKeys in the ProfileIdsToBeMerged will be moved to the
           main profile.


           Standard fields are merged as follows:
           <ol>

                 Fields are always "union"-ed if there are no conflicts in standard fields or
                 attributeKeys.


                 When there are conflicting fields:

                 <ol>

                       If no SourceProfileIds entry is specified, the main
                       Profile value is always taken.


                       If a SourceProfileIds entry is specified, the specified
                       profileId is always taken, even if it is a NULL value.

                 </ol>

           </ol>

     </ol>
     You can use MergeProfiles together with <a href="https://docs.aws.amazon.com/customerprofiles/latest/APIReference/API_GetMatches.html">GetMatches, which
     returns potentially matching profiles, or use it with the results of another matching
     system. After profiles have been merged, they cannot be separated (unmerged).
```

### putIntegration(input:​completion:​)

Adds an integration between the service and a third-party service, which includes
Amazon AppFlow and Amazon Connect.
An integration can belong to only one domain.

``` swift
func putIntegration(input: PutIntegrationInput, completion: @escaping (ClientRuntime.SdkResult<PutIntegrationOutputResponse, PutIntegrationOutputError>) -> Void)
```

### putProfileObject(input:​completion:​)

Adds additional objects to customer profiles of a given ObjectType.
When adding a specific profile object, like a Contact Trace Record (CTR), an inferred
profile can get created if it is not mapped to an existing profile. The resulting profile
will only have a phone number populated in the standard ProfileObject. Any additional CTRs
with the same phone number will be mapped to the same inferred profile.
When a ProfileObject is created and if a ProfileObjectType already exists for the
ProfileObject, it will provide data to a standard profile depending on the
ProfileObjectType definition.
PutProfileObject needs an ObjectType, which can be created using
PutProfileObjectType.

``` swift
func putProfileObject(input: PutProfileObjectInput, completion: @escaping (ClientRuntime.SdkResult<PutProfileObjectOutputResponse, PutProfileObjectOutputError>) -> Void)
```

### putProfileObjectType(input:​completion:​)

Defines a ProfileObjectType.

``` swift
func putProfileObjectType(input: PutProfileObjectTypeInput, completion: @escaping (ClientRuntime.SdkResult<PutProfileObjectTypeOutputResponse, PutProfileObjectTypeOutputError>) -> Void)
```

### searchProfiles(input:​completion:​)

Searches for profiles within a specific domain name using name, phone number, email
address, account number, or a custom defined index.

``` swift
func searchProfiles(input: SearchProfilesInput, completion: @escaping (ClientRuntime.SdkResult<SearchProfilesOutputResponse, SearchProfilesOutputError>) -> Void)
```

### tagResource(input:​completion:​)

Assigns one or more tags (key-value pairs) to the specified Amazon Connect Customer Profiles
resource. Tags can help you organize and categorize your resources. You can also use them
to scope user permissions by granting a user permission to access or change only resources
with certain tag values. In Connect Customer Profiles, domains, profile object types, and
integrations can be tagged.
Tags don't have any semantic meaning to AWS and are interpreted strictly as strings of
characters.
You can use the TagResource action with a resource that already has tags. If you specify
a new tag key, this tag is appended to the list of tags associated with the resource. If
you specify a tag key that is already associated with the resource, the new tag value that
you specify replaces the previous value for that tag.
You can associate as many as 50 tags with a resource.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:​completion:​)

Removes one or more tags from the specified Amazon Connect Customer Profiles resource. In Connect
Customer Profiles, domains, profile object types, and integrations can be tagged.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateDomain(input:​completion:​)

Updates the properties of a domain, including creating or selecting a dead letter queue
or an encryption key.
After a domain is created, the name can’t be changed.
Use this API or <a href="https:​//docs.aws.amazon.com/customerprofiles/latest/APIReference/API_CreateDomain.html">CreateDomain to
enable <a href="https:​//docs.aws.amazon.com/customerprofiles/latest/APIReference/API_GetMatches.html">identity
resolution:​ set Matching to true.

``` swift
func updateDomain(input: UpdateDomainInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDomainOutputResponse, UpdateDomainOutputError>) -> Void)
```

### updateProfile(input:​completion:​)

Updates the properties of a profile. The ProfileId is required for updating a customer
profile.
When calling the UpdateProfile API, specifying an empty string value means that any
existing value will be removed. Not specifying a string value means that any value already
there will be kept.

``` swift
func updateProfile(input: UpdateProfileInput, completion: @escaping (ClientRuntime.SdkResult<UpdateProfileOutputResponse, UpdateProfileOutputError>) -> Void)
```
