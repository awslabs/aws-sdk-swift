# NimbleClientProtocol

``` swift
public protocol NimbleClientProtocol 
```

## Requirements

### acceptEulas(input:​completion:​)

Accept EULAs.

``` swift
func acceptEulas(input: AcceptEulasInput, completion: @escaping (ClientRuntime.SdkResult<AcceptEulasOutputResponse, AcceptEulasOutputError>) -> Void)
```

### createLaunchProfile(input:​completion:​)

Create a launch profile.

``` swift
func createLaunchProfile(input: CreateLaunchProfileInput, completion: @escaping (ClientRuntime.SdkResult<CreateLaunchProfileOutputResponse, CreateLaunchProfileOutputError>) -> Void)
```

### createStreamingImage(input:​completion:​)

Creates a streaming image resource in a studio.

``` swift
func createStreamingImage(input: CreateStreamingImageInput, completion: @escaping (ClientRuntime.SdkResult<CreateStreamingImageOutputResponse, CreateStreamingImageOutputError>) -> Void)
```

### createStreamingSession(input:​completion:​)

Creates a streaming session in a studio. After invoking this operation, you must poll GetStreamingSession until the streaming session is in state READY.

``` swift
func createStreamingSession(input: CreateStreamingSessionInput, completion: @escaping (ClientRuntime.SdkResult<CreateStreamingSessionOutputResponse, CreateStreamingSessionOutputError>) -> Void)
```

### createStreamingSessionStream(input:​completion:​)

Creates a streaming session stream for a streaming session. After invoking this API, invoke GetStreamingSessionStream with the returned streamId to poll the resource until it is in state READY.

``` swift
func createStreamingSessionStream(input: CreateStreamingSessionStreamInput, completion: @escaping (ClientRuntime.SdkResult<CreateStreamingSessionStreamOutputResponse, CreateStreamingSessionStreamOutputError>) -> Void)
```

### createStudio(input:​completion:​)

Create a new Studio. When creating a Studio, two IAM roles must be provided:​ the admin role and the user Role. These roles are assumed by your users when they log in to the Nimble Studio portal. The user role must have the AmazonNimbleStudio-StudioUser managed policy attached for the portal to function properly. The Admin Role must have the AmazonNimbleStudio-StudioAdmin managed policy attached for the portal to function properly. You may optionally specify a KMS key in the StudioEncryptionConfiguration. In Nimble Studio, resource names, descriptions, initialization scripts, and other data you provide are always encrypted at rest using an KMS key. By default, this key is owned by Amazon Web Services and managed on your behalf. You may provide your own KMS key when calling CreateStudio to encrypt this data using a key you own and manage. When providing an KMS key during studio creation, Nimble Studio creates KMS grants in your account to provide your studio user and admin roles access to these KMS keys. If you delete this grant, the studio will no longer be accessible to your portal users. If you delete the studio KMS key, your studio will no longer be accessible.

``` swift
func createStudio(input: CreateStudioInput, completion: @escaping (ClientRuntime.SdkResult<CreateStudioOutputResponse, CreateStudioOutputError>) -> Void)
```

### createStudioComponent(input:​completion:​)

Creates a studio component resource.

``` swift
func createStudioComponent(input: CreateStudioComponentInput, completion: @escaping (ClientRuntime.SdkResult<CreateStudioComponentOutputResponse, CreateStudioComponentOutputError>) -> Void)
```

### deleteLaunchProfile(input:​completion:​)

Permanently delete a launch profile.

``` swift
func deleteLaunchProfile(input: DeleteLaunchProfileInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLaunchProfileOutputResponse, DeleteLaunchProfileOutputError>) -> Void)
```

### deleteLaunchProfileMember(input:​completion:​)

Delete a user from launch profile membership.

``` swift
func deleteLaunchProfileMember(input: DeleteLaunchProfileMemberInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLaunchProfileMemberOutputResponse, DeleteLaunchProfileMemberOutputError>) -> Void)
```

### deleteStreamingImage(input:​completion:​)

Delete streaming image.

``` swift
func deleteStreamingImage(input: DeleteStreamingImageInput, completion: @escaping (ClientRuntime.SdkResult<DeleteStreamingImageOutputResponse, DeleteStreamingImageOutputError>) -> Void)
```

### deleteStreamingSession(input:​completion:​)

Deletes streaming session resource. After invoking this operation, use GetStreamingSession to poll the resource until it transitions to a DELETED state. A streaming session will count against your streaming session quota until it is marked DELETED.

``` swift
func deleteStreamingSession(input: DeleteStreamingSessionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteStreamingSessionOutputResponse, DeleteStreamingSessionOutputError>) -> Void)
```

### deleteStudio(input:​completion:​)

Delete a studio resource.

``` swift
func deleteStudio(input: DeleteStudioInput, completion: @escaping (ClientRuntime.SdkResult<DeleteStudioOutputResponse, DeleteStudioOutputError>) -> Void)
```

### deleteStudioComponent(input:​completion:​)

Deletes a studio component resource.

``` swift
func deleteStudioComponent(input: DeleteStudioComponentInput, completion: @escaping (ClientRuntime.SdkResult<DeleteStudioComponentOutputResponse, DeleteStudioComponentOutputError>) -> Void)
```

### deleteStudioMember(input:​completion:​)

Delete a user from studio membership.

``` swift
func deleteStudioMember(input: DeleteStudioMemberInput, completion: @escaping (ClientRuntime.SdkResult<DeleteStudioMemberOutputResponse, DeleteStudioMemberOutputError>) -> Void)
```

### getEula(input:​completion:​)

Get Eula.

``` swift
func getEula(input: GetEulaInput, completion: @escaping (ClientRuntime.SdkResult<GetEulaOutputResponse, GetEulaOutputError>) -> Void)
```

### getLaunchProfile(input:​completion:​)

Get a launch profile.

``` swift
func getLaunchProfile(input: GetLaunchProfileInput, completion: @escaping (ClientRuntime.SdkResult<GetLaunchProfileOutputResponse, GetLaunchProfileOutputError>) -> Void)
```

### getLaunchProfileDetails(input:​completion:​)

Launch profile details include the launch profile resource and summary information of resources that are used by, or available to, the launch profile. This includes the name and description of all studio components used by the launch profiles, and the name and description of streaming images that can be used with this launch profile.

``` swift
func getLaunchProfileDetails(input: GetLaunchProfileDetailsInput, completion: @escaping (ClientRuntime.SdkResult<GetLaunchProfileDetailsOutputResponse, GetLaunchProfileDetailsOutputError>) -> Void)
```

### getLaunchProfileInitialization(input:​completion:​)

Get a launch profile initialization.

``` swift
func getLaunchProfileInitialization(input: GetLaunchProfileInitializationInput, completion: @escaping (ClientRuntime.SdkResult<GetLaunchProfileInitializationOutputResponse, GetLaunchProfileInitializationOutputError>) -> Void)
```

### getLaunchProfileMember(input:​completion:​)

Get a user persona in launch profile membership.

``` swift
func getLaunchProfileMember(input: GetLaunchProfileMemberInput, completion: @escaping (ClientRuntime.SdkResult<GetLaunchProfileMemberOutputResponse, GetLaunchProfileMemberOutputError>) -> Void)
```

### getStreamingImage(input:​completion:​)

Get streaming image.

``` swift
func getStreamingImage(input: GetStreamingImageInput, completion: @escaping (ClientRuntime.SdkResult<GetStreamingImageOutputResponse, GetStreamingImageOutputError>) -> Void)
```

### getStreamingSession(input:​completion:​)

Gets StreamingSession resource. Invoke this operation to poll for a streaming session state while creating or deleting a session.

``` swift
func getStreamingSession(input: GetStreamingSessionInput, completion: @escaping (ClientRuntime.SdkResult<GetStreamingSessionOutputResponse, GetStreamingSessionOutputError>) -> Void)
```

### getStreamingSessionStream(input:​completion:​)

Gets a StreamingSessionStream for a streaming session. Invoke this operation to poll the resource after invoking CreateStreamingSessionStream. After the StreamingSessionStream changes to the state READY, the url property will contain a stream to be used with the DCV streaming client.

``` swift
func getStreamingSessionStream(input: GetStreamingSessionStreamInput, completion: @escaping (ClientRuntime.SdkResult<GetStreamingSessionStreamOutputResponse, GetStreamingSessionStreamOutputError>) -> Void)
```

### getStudio(input:​completion:​)

Get a Studio resource.

``` swift
func getStudio(input: GetStudioInput, completion: @escaping (ClientRuntime.SdkResult<GetStudioOutputResponse, GetStudioOutputError>) -> Void)
```

### getStudioComponent(input:​completion:​)

Gets a studio component resource.

``` swift
func getStudioComponent(input: GetStudioComponentInput, completion: @escaping (ClientRuntime.SdkResult<GetStudioComponentOutputResponse, GetStudioComponentOutputError>) -> Void)
```

### getStudioMember(input:​completion:​)

Get a user's membership in a studio.

``` swift
func getStudioMember(input: GetStudioMemberInput, completion: @escaping (ClientRuntime.SdkResult<GetStudioMemberOutputResponse, GetStudioMemberOutputError>) -> Void)
```

### listEulaAcceptances(input:​completion:​)

List Eula Acceptances.

``` swift
func listEulaAcceptances(input: ListEulaAcceptancesInput, completion: @escaping (ClientRuntime.SdkResult<ListEulaAcceptancesOutputResponse, ListEulaAcceptancesOutputError>) -> Void)
```

### listEulas(input:​completion:​)

List Eulas.

``` swift
func listEulas(input: ListEulasInput, completion: @escaping (ClientRuntime.SdkResult<ListEulasOutputResponse, ListEulasOutputError>) -> Void)
```

### listLaunchProfileMembers(input:​completion:​)

Get all users in a given launch profile membership.

``` swift
func listLaunchProfileMembers(input: ListLaunchProfileMembersInput, completion: @escaping (ClientRuntime.SdkResult<ListLaunchProfileMembersOutputResponse, ListLaunchProfileMembersOutputError>) -> Void)
```

### listLaunchProfiles(input:​completion:​)

List all the launch profiles a studio.

``` swift
func listLaunchProfiles(input: ListLaunchProfilesInput, completion: @escaping (ClientRuntime.SdkResult<ListLaunchProfilesOutputResponse, ListLaunchProfilesOutputError>) -> Void)
```

### listStreamingImages(input:​completion:​)

List the streaming image resources available to this studio. This list will contain both images provided by Amazon Web Services, as well as streaming images that you have created in your studio.

``` swift
func listStreamingImages(input: ListStreamingImagesInput, completion: @escaping (ClientRuntime.SdkResult<ListStreamingImagesOutputResponse, ListStreamingImagesOutputError>) -> Void)
```

### listStreamingSessions(input:​completion:​)

Lists the streaming image resources in a studio.

``` swift
func listStreamingSessions(input: ListStreamingSessionsInput, completion: @escaping (ClientRuntime.SdkResult<ListStreamingSessionsOutputResponse, ListStreamingSessionsOutputError>) -> Void)
```

### listStudioComponents(input:​completion:​)

Lists the StudioComponents in a studio.

``` swift
func listStudioComponents(input: ListStudioComponentsInput, completion: @escaping (ClientRuntime.SdkResult<ListStudioComponentsOutputResponse, ListStudioComponentsOutputError>) -> Void)
```

### listStudioMembers(input:​completion:​)

Get all users in a given studio membership.

``` swift
func listStudioMembers(input: ListStudioMembersInput, completion: @escaping (ClientRuntime.SdkResult<ListStudioMembersOutputResponse, ListStudioMembersOutputError>) -> Void)
```

### listStudios(input:​completion:​)

List studios in your Amazon Web Services account in the requested Amazon Web Services Region.

``` swift
func listStudios(input: ListStudiosInput, completion: @escaping (ClientRuntime.SdkResult<ListStudiosOutputResponse, ListStudiosOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

Gets the tags for a resource, given its Amazon Resource Names (ARN). This operation supports ARNs for all resource types in Nimble Studio that support tags, including studio, studio component, launch profile, streaming image, and streaming session. All resources that can be tagged will contain an ARN property, so you do not have to create this ARN yourself.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### putLaunchProfileMembers(input:​completion:​)

Add/update users with given persona to launch profile membership.

``` swift
func putLaunchProfileMembers(input: PutLaunchProfileMembersInput, completion: @escaping (ClientRuntime.SdkResult<PutLaunchProfileMembersOutputResponse, PutLaunchProfileMembersOutputError>) -> Void)
```

### putStudioMembers(input:​completion:​)

Add/update users with given persona to studio membership.

``` swift
func putStudioMembers(input: PutStudioMembersInput, completion: @escaping (ClientRuntime.SdkResult<PutStudioMembersOutputResponse, PutStudioMembersOutputError>) -> Void)
```

### startStudioSSOConfigurationRepair(input:​completion:​)

Repairs the SSO configuration for a given studio. If the studio has a valid Amazon Web Services SSO configuration currently associated with it, this operation will fail with a validation error. If the studio does not have a valid Amazon Web Services SSO configuration currently associated with it, then a new Amazon Web Services SSO application is created for the studio and the studio is changed to the READY state. After the Amazon Web Services SSO application is repaired, you must use the Amazon Nimble Studio console to add administrators and users to your studio.

``` swift
func startStudioSSOConfigurationRepair(input: StartStudioSSOConfigurationRepairInput, completion: @escaping (ClientRuntime.SdkResult<StartStudioSSOConfigurationRepairOutputResponse, StartStudioSSOConfigurationRepairOutputError>) -> Void)
```

### tagResource(input:​completion:​)

Creates tags for a resource, given its ARN.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:​completion:​)

Deletes the tags for a resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateLaunchProfile(input:​completion:​)

Update a launch profile.

``` swift
func updateLaunchProfile(input: UpdateLaunchProfileInput, completion: @escaping (ClientRuntime.SdkResult<UpdateLaunchProfileOutputResponse, UpdateLaunchProfileOutputError>) -> Void)
```

### updateLaunchProfileMember(input:​completion:​)

Update a user persona in launch profile membership.

``` swift
func updateLaunchProfileMember(input: UpdateLaunchProfileMemberInput, completion: @escaping (ClientRuntime.SdkResult<UpdateLaunchProfileMemberOutputResponse, UpdateLaunchProfileMemberOutputError>) -> Void)
```

### updateStreamingImage(input:​completion:​)

Update streaming image.

``` swift
func updateStreamingImage(input: UpdateStreamingImageInput, completion: @escaping (ClientRuntime.SdkResult<UpdateStreamingImageOutputResponse, UpdateStreamingImageOutputError>) -> Void)
```

### updateStudio(input:​completion:​)

Update a Studio resource. Currently, this operation only supports updating the displayName of your studio.

``` swift
func updateStudio(input: UpdateStudioInput, completion: @escaping (ClientRuntime.SdkResult<UpdateStudioOutputResponse, UpdateStudioOutputError>) -> Void)
```

### updateStudioComponent(input:​completion:​)

Updates a studio component resource.

``` swift
func updateStudioComponent(input: UpdateStudioComponentInput, completion: @escaping (ClientRuntime.SdkResult<UpdateStudioComponentOutputResponse, UpdateStudioComponentOutputError>) -> Void)
```
