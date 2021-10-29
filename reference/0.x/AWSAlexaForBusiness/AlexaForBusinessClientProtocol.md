# AlexaForBusinessClientProtocol

Alexa for Business helps you use Alexa in your organization. Alexa for Business provides you with the tools to manage Alexa devices, enroll your users, and assign skills, at scale. You can build your own context-aware voice skills using the Alexa Skills Kit and the Alexa for Business API operations. You can also make these available as private skills for your organization. Alexa for Business makes it efficient to voice-enable your products and services, thus providing context-aware voice experiences for your customers. Device makers building with the Alexa Voice Service (AVS) can create fully integrated solutions, register their products with Alexa for Business, and manage them as shared devices in their organization.

``` swift
public protocol AlexaForBusinessClientProtocol 
```

## Requirements

### approveSkill(input:completion:)

Associates a skill with the organization under the customer's AWS account. If a skill is private, the user implicitly accepts access to this skill during enablement.

``` swift
func approveSkill(input: ApproveSkillInput, completion: @escaping (ClientRuntime.SdkResult<ApproveSkillOutputResponse, ApproveSkillOutputError>) -> Void)
```

### associateContactWithAddressBook(input:completion:)

Associates a contact with a given address book.

``` swift
func associateContactWithAddressBook(input: AssociateContactWithAddressBookInput, completion: @escaping (ClientRuntime.SdkResult<AssociateContactWithAddressBookOutputResponse, AssociateContactWithAddressBookOutputError>) -> Void)
```

### associateDeviceWithNetworkProfile(input:completion:)

Associates a device with the specified network profile.

``` swift
func associateDeviceWithNetworkProfile(input: AssociateDeviceWithNetworkProfileInput, completion: @escaping (ClientRuntime.SdkResult<AssociateDeviceWithNetworkProfileOutputResponse, AssociateDeviceWithNetworkProfileOutputError>) -> Void)
```

### associateDeviceWithRoom(input:completion:)

Associates a device with a given room. This applies all the settings from the room profile to the device, and all the skills in any skill groups added to that room. This operation requires the device to be online, or else a manual sync is required.

``` swift
func associateDeviceWithRoom(input: AssociateDeviceWithRoomInput, completion: @escaping (ClientRuntime.SdkResult<AssociateDeviceWithRoomOutputResponse, AssociateDeviceWithRoomOutputError>) -> Void)
```

### associateSkillGroupWithRoom(input:completion:)

Associates a skill group with a given room. This enables all skills in the associated skill group on all devices in the room.

``` swift
func associateSkillGroupWithRoom(input: AssociateSkillGroupWithRoomInput, completion: @escaping (ClientRuntime.SdkResult<AssociateSkillGroupWithRoomOutputResponse, AssociateSkillGroupWithRoomOutputError>) -> Void)
```

### associateSkillWithSkillGroup(input:completion:)

Associates a skill with a skill group.

``` swift
func associateSkillWithSkillGroup(input: AssociateSkillWithSkillGroupInput, completion: @escaping (ClientRuntime.SdkResult<AssociateSkillWithSkillGroupOutputResponse, AssociateSkillWithSkillGroupOutputError>) -> Void)
```

### associateSkillWithUsers(input:completion:)

Makes a private skill available for enrolled users to enable on their devices.

``` swift
func associateSkillWithUsers(input: AssociateSkillWithUsersInput, completion: @escaping (ClientRuntime.SdkResult<AssociateSkillWithUsersOutputResponse, AssociateSkillWithUsersOutputError>) -> Void)
```

### createAddressBook(input:completion:)

Creates an address book with the specified details.

``` swift
func createAddressBook(input: CreateAddressBookInput, completion: @escaping (ClientRuntime.SdkResult<CreateAddressBookOutputResponse, CreateAddressBookOutputError>) -> Void)
```

### createBusinessReportSchedule(input:completion:)

Creates a recurring schedule for usage reports to deliver to the specified S3 location with a specified daily or weekly interval.

``` swift
func createBusinessReportSchedule(input: CreateBusinessReportScheduleInput, completion: @escaping (ClientRuntime.SdkResult<CreateBusinessReportScheduleOutputResponse, CreateBusinessReportScheduleOutputError>) -> Void)
```

### createConferenceProvider(input:completion:)

Adds a new conference provider under the user's AWS account.

``` swift
func createConferenceProvider(input: CreateConferenceProviderInput, completion: @escaping (ClientRuntime.SdkResult<CreateConferenceProviderOutputResponse, CreateConferenceProviderOutputError>) -> Void)
```

### createContact(input:completion:)

Creates a contact with the specified details.

``` swift
func createContact(input: CreateContactInput, completion: @escaping (ClientRuntime.SdkResult<CreateContactOutputResponse, CreateContactOutputError>) -> Void)
```

### createGatewayGroup(input:completion:)

Creates a gateway group with the specified details.

``` swift
func createGatewayGroup(input: CreateGatewayGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateGatewayGroupOutputResponse, CreateGatewayGroupOutputError>) -> Void)
```

### createNetworkProfile(input:completion:)

Creates a network profile with the specified details.

``` swift
func createNetworkProfile(input: CreateNetworkProfileInput, completion: @escaping (ClientRuntime.SdkResult<CreateNetworkProfileOutputResponse, CreateNetworkProfileOutputError>) -> Void)
```

### createProfile(input:completion:)

Creates a new room profile with the specified details.

``` swift
func createProfile(input: CreateProfileInput, completion: @escaping (ClientRuntime.SdkResult<CreateProfileOutputResponse, CreateProfileOutputError>) -> Void)
```

### createRoom(input:completion:)

Creates a room with the specified details.

``` swift
func createRoom(input: CreateRoomInput, completion: @escaping (ClientRuntime.SdkResult<CreateRoomOutputResponse, CreateRoomOutputError>) -> Void)
```

### createSkillGroup(input:completion:)

Creates a skill group with a specified name and description.

``` swift
func createSkillGroup(input: CreateSkillGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateSkillGroupOutputResponse, CreateSkillGroupOutputError>) -> Void)
```

### createUser(input:completion:)

Creates a user.

``` swift
func createUser(input: CreateUserInput, completion: @escaping (ClientRuntime.SdkResult<CreateUserOutputResponse, CreateUserOutputError>) -> Void)
```

### deleteAddressBook(input:completion:)

Deletes an address book by the address book ARN.

``` swift
func deleteAddressBook(input: DeleteAddressBookInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAddressBookOutputResponse, DeleteAddressBookOutputError>) -> Void)
```

### deleteBusinessReportSchedule(input:completion:)

Deletes the recurring report delivery schedule with the specified schedule ARN.

``` swift
func deleteBusinessReportSchedule(input: DeleteBusinessReportScheduleInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBusinessReportScheduleOutputResponse, DeleteBusinessReportScheduleOutputError>) -> Void)
```

### deleteConferenceProvider(input:completion:)

Deletes a conference provider.

``` swift
func deleteConferenceProvider(input: DeleteConferenceProviderInput, completion: @escaping (ClientRuntime.SdkResult<DeleteConferenceProviderOutputResponse, DeleteConferenceProviderOutputError>) -> Void)
```

### deleteContact(input:completion:)

Deletes a contact by the contact ARN.

``` swift
func deleteContact(input: DeleteContactInput, completion: @escaping (ClientRuntime.SdkResult<DeleteContactOutputResponse, DeleteContactOutputError>) -> Void)
```

### deleteDevice(input:completion:)

Removes a device from Alexa For Business.

``` swift
func deleteDevice(input: DeleteDeviceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDeviceOutputResponse, DeleteDeviceOutputError>) -> Void)
```

### deleteDeviceUsageData(input:completion:)

When this action is called for a specified shared device, it allows authorized users to delete the device's entire previous history of voice input data and associated response data. This action can be called once every 24 hours for a specific shared device.

``` swift
func deleteDeviceUsageData(input: DeleteDeviceUsageDataInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDeviceUsageDataOutputResponse, DeleteDeviceUsageDataOutputError>) -> Void)
```

### deleteGatewayGroup(input:completion:)

Deletes a gateway group.

``` swift
func deleteGatewayGroup(input: DeleteGatewayGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteGatewayGroupOutputResponse, DeleteGatewayGroupOutputError>) -> Void)
```

### deleteNetworkProfile(input:completion:)

Deletes a network profile by the network profile ARN.

``` swift
func deleteNetworkProfile(input: DeleteNetworkProfileInput, completion: @escaping (ClientRuntime.SdkResult<DeleteNetworkProfileOutputResponse, DeleteNetworkProfileOutputError>) -> Void)
```

### deleteProfile(input:completion:)

Deletes a room profile by the profile ARN.

``` swift
func deleteProfile(input: DeleteProfileInput, completion: @escaping (ClientRuntime.SdkResult<DeleteProfileOutputResponse, DeleteProfileOutputError>) -> Void)
```

### deleteRoom(input:completion:)

Deletes a room by the room ARN.

``` swift
func deleteRoom(input: DeleteRoomInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRoomOutputResponse, DeleteRoomOutputError>) -> Void)
```

### deleteRoomSkillParameter(input:completion:)

Deletes room skill parameter details by room, skill, and parameter key ID.

``` swift
func deleteRoomSkillParameter(input: DeleteRoomSkillParameterInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRoomSkillParameterOutputResponse, DeleteRoomSkillParameterOutputError>) -> Void)
```

### deleteSkillAuthorization(input:completion:)

Unlinks a third-party account from a skill.

``` swift
func deleteSkillAuthorization(input: DeleteSkillAuthorizationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSkillAuthorizationOutputResponse, DeleteSkillAuthorizationOutputError>) -> Void)
```

### deleteSkillGroup(input:completion:)

Deletes a skill group by skill group ARN.

``` swift
func deleteSkillGroup(input: DeleteSkillGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSkillGroupOutputResponse, DeleteSkillGroupOutputError>) -> Void)
```

### deleteUser(input:completion:)

Deletes a specified user by user ARN and enrollment ARN.

``` swift
func deleteUser(input: DeleteUserInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUserOutputResponse, DeleteUserOutputError>) -> Void)
```

### disassociateContactFromAddressBook(input:completion:)

Disassociates a contact from a given address book.

``` swift
func disassociateContactFromAddressBook(input: DisassociateContactFromAddressBookInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateContactFromAddressBookOutputResponse, DisassociateContactFromAddressBookOutputError>) -> Void)
```

### disassociateDeviceFromRoom(input:completion:)

Disassociates a device from its current room. The device continues to be connected to the Wi-Fi network and is still registered to the account. The device settings and skills are removed from the room.

``` swift
func disassociateDeviceFromRoom(input: DisassociateDeviceFromRoomInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateDeviceFromRoomOutputResponse, DisassociateDeviceFromRoomOutputError>) -> Void)
```

### disassociateSkillFromSkillGroup(input:completion:)

Disassociates a skill from a skill group.

``` swift
func disassociateSkillFromSkillGroup(input: DisassociateSkillFromSkillGroupInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateSkillFromSkillGroupOutputResponse, DisassociateSkillFromSkillGroupOutputError>) -> Void)
```

### disassociateSkillFromUsers(input:completion:)

Makes a private skill unavailable for enrolled users and prevents them from enabling it on their devices.

``` swift
func disassociateSkillFromUsers(input: DisassociateSkillFromUsersInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateSkillFromUsersOutputResponse, DisassociateSkillFromUsersOutputError>) -> Void)
```

### disassociateSkillGroupFromRoom(input:completion:)

Disassociates a skill group from a specified room. This disables all skills in the skill group on all devices in the room.

``` swift
func disassociateSkillGroupFromRoom(input: DisassociateSkillGroupFromRoomInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateSkillGroupFromRoomOutputResponse, DisassociateSkillGroupFromRoomOutputError>) -> Void)
```

### forgetSmartHomeAppliances(input:completion:)

Forgets smart home appliances associated to a room.

``` swift
func forgetSmartHomeAppliances(input: ForgetSmartHomeAppliancesInput, completion: @escaping (ClientRuntime.SdkResult<ForgetSmartHomeAppliancesOutputResponse, ForgetSmartHomeAppliancesOutputError>) -> Void)
```

### getAddressBook(input:completion:)

Gets address the book details by the address book ARN.

``` swift
func getAddressBook(input: GetAddressBookInput, completion: @escaping (ClientRuntime.SdkResult<GetAddressBookOutputResponse, GetAddressBookOutputError>) -> Void)
```

### getConferencePreference(input:completion:)

Retrieves the existing conference preferences.

``` swift
func getConferencePreference(input: GetConferencePreferenceInput, completion: @escaping (ClientRuntime.SdkResult<GetConferencePreferenceOutputResponse, GetConferencePreferenceOutputError>) -> Void)
```

### getConferenceProvider(input:completion:)

Gets details about a specific conference provider.

``` swift
func getConferenceProvider(input: GetConferenceProviderInput, completion: @escaping (ClientRuntime.SdkResult<GetConferenceProviderOutputResponse, GetConferenceProviderOutputError>) -> Void)
```

### getContact(input:completion:)

Gets the contact details by the contact ARN.

``` swift
func getContact(input: GetContactInput, completion: @escaping (ClientRuntime.SdkResult<GetContactOutputResponse, GetContactOutputError>) -> Void)
```

### getDevice(input:completion:)

Gets the details of a device by device ARN.

``` swift
func getDevice(input: GetDeviceInput, completion: @escaping (ClientRuntime.SdkResult<GetDeviceOutputResponse, GetDeviceOutputError>) -> Void)
```

### getGateway(input:completion:)

Retrieves the details of a gateway.

``` swift
func getGateway(input: GetGatewayInput, completion: @escaping (ClientRuntime.SdkResult<GetGatewayOutputResponse, GetGatewayOutputError>) -> Void)
```

### getGatewayGroup(input:completion:)

Retrieves the details of a gateway group.

``` swift
func getGatewayGroup(input: GetGatewayGroupInput, completion: @escaping (ClientRuntime.SdkResult<GetGatewayGroupOutputResponse, GetGatewayGroupOutputError>) -> Void)
```

### getInvitationConfiguration(input:completion:)

Retrieves the configured values for the user enrollment invitation email template.

``` swift
func getInvitationConfiguration(input: GetInvitationConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetInvitationConfigurationOutputResponse, GetInvitationConfigurationOutputError>) -> Void)
```

### getNetworkProfile(input:completion:)

Gets the network profile details by the network profile ARN.

``` swift
func getNetworkProfile(input: GetNetworkProfileInput, completion: @escaping (ClientRuntime.SdkResult<GetNetworkProfileOutputResponse, GetNetworkProfileOutputError>) -> Void)
```

### getProfile(input:completion:)

Gets the details of a room profile by profile ARN.

``` swift
func getProfile(input: GetProfileInput, completion: @escaping (ClientRuntime.SdkResult<GetProfileOutputResponse, GetProfileOutputError>) -> Void)
```

### getRoom(input:completion:)

Gets room details by room ARN.

``` swift
func getRoom(input: GetRoomInput, completion: @escaping (ClientRuntime.SdkResult<GetRoomOutputResponse, GetRoomOutputError>) -> Void)
```

### getRoomSkillParameter(input:completion:)

Gets room skill parameter details by room, skill, and parameter key ARN.

``` swift
func getRoomSkillParameter(input: GetRoomSkillParameterInput, completion: @escaping (ClientRuntime.SdkResult<GetRoomSkillParameterOutputResponse, GetRoomSkillParameterOutputError>) -> Void)
```

### getSkillGroup(input:completion:)

Gets skill group details by skill group ARN.

``` swift
func getSkillGroup(input: GetSkillGroupInput, completion: @escaping (ClientRuntime.SdkResult<GetSkillGroupOutputResponse, GetSkillGroupOutputError>) -> Void)
```

### listBusinessReportSchedules(input:completion:)

Lists the details of the schedules that a user configured. A download URL of the report associated with each schedule is returned every time this action is called. A new download URL is returned each time, and is valid for 24 hours.

``` swift
func listBusinessReportSchedules(input: ListBusinessReportSchedulesInput, completion: @escaping (ClientRuntime.SdkResult<ListBusinessReportSchedulesOutputResponse, ListBusinessReportSchedulesOutputError>) -> Void)
```

### listConferenceProviders(input:completion:)

Lists conference providers under a specific AWS account.

``` swift
func listConferenceProviders(input: ListConferenceProvidersInput, completion: @escaping (ClientRuntime.SdkResult<ListConferenceProvidersOutputResponse, ListConferenceProvidersOutputError>) -> Void)
```

### listDeviceEvents(input:completion:)

Lists the device event history, including device connection status, for up to 30 days.

``` swift
func listDeviceEvents(input: ListDeviceEventsInput, completion: @escaping (ClientRuntime.SdkResult<ListDeviceEventsOutputResponse, ListDeviceEventsOutputError>) -> Void)
```

### listGatewayGroups(input:completion:)

Retrieves a list of gateway group summaries. Use GetGatewayGroup to retrieve details of a specific gateway group.

``` swift
func listGatewayGroups(input: ListGatewayGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListGatewayGroupsOutputResponse, ListGatewayGroupsOutputError>) -> Void)
```

### listGateways(input:completion:)

Retrieves a list of gateway summaries. Use GetGateway to retrieve details of a specific gateway. An optional gateway group ARN can be provided to only retrieve gateway summaries of gateways that are associated with that gateway group ARN.

``` swift
func listGateways(input: ListGatewaysInput, completion: @escaping (ClientRuntime.SdkResult<ListGatewaysOutputResponse, ListGatewaysOutputError>) -> Void)
```

### listSkills(input:completion:)

Lists all enabled skills in a specific skill group.

``` swift
func listSkills(input: ListSkillsInput, completion: @escaping (ClientRuntime.SdkResult<ListSkillsOutputResponse, ListSkillsOutputError>) -> Void)
```

### listSkillsStoreCategories(input:completion:)

Lists all categories in the Alexa skill store.

``` swift
func listSkillsStoreCategories(input: ListSkillsStoreCategoriesInput, completion: @escaping (ClientRuntime.SdkResult<ListSkillsStoreCategoriesOutputResponse, ListSkillsStoreCategoriesOutputError>) -> Void)
```

### listSkillsStoreSkillsByCategory(input:completion:)

Lists all skills in the Alexa skill store by category.

``` swift
func listSkillsStoreSkillsByCategory(input: ListSkillsStoreSkillsByCategoryInput, completion: @escaping (ClientRuntime.SdkResult<ListSkillsStoreSkillsByCategoryOutputResponse, ListSkillsStoreSkillsByCategoryOutputError>) -> Void)
```

### listSmartHomeAppliances(input:completion:)

Lists all of the smart home appliances associated with a room.

``` swift
func listSmartHomeAppliances(input: ListSmartHomeAppliancesInput, completion: @escaping (ClientRuntime.SdkResult<ListSmartHomeAppliancesOutputResponse, ListSmartHomeAppliancesOutputError>) -> Void)
```

### listTags(input:completion:)

Lists all tags for the specified resource.

``` swift
func listTags(input: ListTagsInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsOutputResponse, ListTagsOutputError>) -> Void)
```

### putConferencePreference(input:completion:)

Sets the conference preferences on a specific conference provider at the account level.

``` swift
func putConferencePreference(input: PutConferencePreferenceInput, completion: @escaping (ClientRuntime.SdkResult<PutConferencePreferenceOutputResponse, PutConferencePreferenceOutputError>) -> Void)
```

### putInvitationConfiguration(input:completion:)

Configures the email template for the user enrollment invitation with the specified attributes.

``` swift
func putInvitationConfiguration(input: PutInvitationConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<PutInvitationConfigurationOutputResponse, PutInvitationConfigurationOutputError>) -> Void)
```

### putRoomSkillParameter(input:completion:)

Updates room skill parameter details by room, skill, and parameter key ID. Not all skills have a room skill parameter.

``` swift
func putRoomSkillParameter(input: PutRoomSkillParameterInput, completion: @escaping (ClientRuntime.SdkResult<PutRoomSkillParameterOutputResponse, PutRoomSkillParameterOutputError>) -> Void)
```

### putSkillAuthorization(input:completion:)

Links a user's account to a third-party skill provider. If this API operation is called by an assumed IAM role, the skill being linked must be a private skill. Also, the skill must be owned by the AWS account that assumed the IAM role.

``` swift
func putSkillAuthorization(input: PutSkillAuthorizationInput, completion: @escaping (ClientRuntime.SdkResult<PutSkillAuthorizationOutputResponse, PutSkillAuthorizationOutputError>) -> Void)
```

### registerAVSDevice(input:completion:)

Registers an Alexa-enabled device built by an Original Equipment Manufacturer (OEM) using Alexa Voice Service (AVS).

``` swift
func registerAVSDevice(input: RegisterAVSDeviceInput, completion: @escaping (ClientRuntime.SdkResult<RegisterAVSDeviceOutputResponse, RegisterAVSDeviceOutputError>) -> Void)
```

### rejectSkill(input:completion:)

Disassociates a skill from the organization under a user's AWS account. If the skill is a private skill, it moves to an AcceptStatus of PENDING. Any private or public skill that is rejected can be added later by calling the ApproveSkill API.

``` swift
func rejectSkill(input: RejectSkillInput, completion: @escaping (ClientRuntime.SdkResult<RejectSkillOutputResponse, RejectSkillOutputError>) -> Void)
```

### resolveRoom(input:completion:)

Determines the details for the room from which a skill request was invoked. This operation is used by skill developers. To query ResolveRoom from an Alexa skill, the skill ID needs to be authorized. When the skill is using an AWS Lambda function, the skill is automatically authorized when you publish your skill as a private skill to your AWS account. Skills that are hosted using a custom web service must be manually authorized. To get your skill authorized, contact AWS Support with your AWS account ID that queries the ResolveRoom API and skill ID.

``` swift
func resolveRoom(input: ResolveRoomInput, completion: @escaping (ClientRuntime.SdkResult<ResolveRoomOutputResponse, ResolveRoomOutputError>) -> Void)
```

### revokeInvitation(input:completion:)

Revokes an invitation and invalidates the enrollment URL.

``` swift
func revokeInvitation(input: RevokeInvitationInput, completion: @escaping (ClientRuntime.SdkResult<RevokeInvitationOutputResponse, RevokeInvitationOutputError>) -> Void)
```

### searchAddressBooks(input:completion:)

Searches address books and lists the ones that meet a set of filter and sort criteria.

``` swift
func searchAddressBooks(input: SearchAddressBooksInput, completion: @escaping (ClientRuntime.SdkResult<SearchAddressBooksOutputResponse, SearchAddressBooksOutputError>) -> Void)
```

### searchContacts(input:completion:)

Searches contacts and lists the ones that meet a set of filter and sort criteria.

``` swift
func searchContacts(input: SearchContactsInput, completion: @escaping (ClientRuntime.SdkResult<SearchContactsOutputResponse, SearchContactsOutputError>) -> Void)
```

### searchDevices(input:completion:)

Searches devices and lists the ones that meet a set of filter criteria.

``` swift
func searchDevices(input: SearchDevicesInput, completion: @escaping (ClientRuntime.SdkResult<SearchDevicesOutputResponse, SearchDevicesOutputError>) -> Void)
```

### searchNetworkProfiles(input:completion:)

Searches network profiles and lists the ones that meet a set of filter and sort criteria.

``` swift
func searchNetworkProfiles(input: SearchNetworkProfilesInput, completion: @escaping (ClientRuntime.SdkResult<SearchNetworkProfilesOutputResponse, SearchNetworkProfilesOutputError>) -> Void)
```

### searchProfiles(input:completion:)

Searches room profiles and lists the ones that meet a set of filter criteria.

``` swift
func searchProfiles(input: SearchProfilesInput, completion: @escaping (ClientRuntime.SdkResult<SearchProfilesOutputResponse, SearchProfilesOutputError>) -> Void)
```

### searchRooms(input:completion:)

Searches rooms and lists the ones that meet a set of filter and sort criteria.

``` swift
func searchRooms(input: SearchRoomsInput, completion: @escaping (ClientRuntime.SdkResult<SearchRoomsOutputResponse, SearchRoomsOutputError>) -> Void)
```

### searchSkillGroups(input:completion:)

Searches skill groups and lists the ones that meet a set of filter and sort criteria.

``` swift
func searchSkillGroups(input: SearchSkillGroupsInput, completion: @escaping (ClientRuntime.SdkResult<SearchSkillGroupsOutputResponse, SearchSkillGroupsOutputError>) -> Void)
```

### searchUsers(input:completion:)

Searches users and lists the ones that meet a set of filter and sort criteria.

``` swift
func searchUsers(input: SearchUsersInput, completion: @escaping (ClientRuntime.SdkResult<SearchUsersOutputResponse, SearchUsersOutputError>) -> Void)
```

### sendAnnouncement(input:completion:)

Triggers an asynchronous flow to send text, SSML, or audio announcements to rooms that are identified by a search or filter.

``` swift
func sendAnnouncement(input: SendAnnouncementInput, completion: @escaping (ClientRuntime.SdkResult<SendAnnouncementOutputResponse, SendAnnouncementOutputError>) -> Void)
```

### sendInvitation(input:completion:)

Sends an enrollment invitation email with a URL to a user. The URL is valid for 30 days or until you call this operation again, whichever comes first.

``` swift
func sendInvitation(input: SendInvitationInput, completion: @escaping (ClientRuntime.SdkResult<SendInvitationOutputResponse, SendInvitationOutputError>) -> Void)
```

### startDeviceSync(input:completion:)

Resets a device and its account to the known default settings. This clears all information and settings set by previous users in the following ways:

``` swift
func startDeviceSync(input: StartDeviceSyncInput, completion: @escaping (ClientRuntime.SdkResult<StartDeviceSyncOutputResponse, StartDeviceSyncOutputError>) -> Void)
```

  - Bluetooth - This unpairs all bluetooth devices paired with your echo device.

  - Volume - This resets the echo device's volume to the default value.

  - Notifications - This clears all notifications from your echo device.

  - Lists - This clears all to-do items from your echo device.

  - Settings - This internally syncs the room's profile (if the device is assigned to a room), contacts, address books, delegation access for account linking, and communications (if enabled on the room profile).

### startSmartHomeApplianceDiscovery(input:completion:)

Initiates the discovery of any smart home appliances associated with the room.

``` swift
func startSmartHomeApplianceDiscovery(input: StartSmartHomeApplianceDiscoveryInput, completion: @escaping (ClientRuntime.SdkResult<StartSmartHomeApplianceDiscoveryOutputResponse, StartSmartHomeApplianceDiscoveryOutputError>) -> Void)
```

### tagResource(input:completion:)

Adds metadata tags to a specified resource.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:completion:)

Removes metadata tags from a specified resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateAddressBook(input:completion:)

Updates address book details by the address book ARN.

``` swift
func updateAddressBook(input: UpdateAddressBookInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAddressBookOutputResponse, UpdateAddressBookOutputError>) -> Void)
```

### updateBusinessReportSchedule(input:completion:)

Updates the configuration of the report delivery schedule with the specified schedule ARN.

``` swift
func updateBusinessReportSchedule(input: UpdateBusinessReportScheduleInput, completion: @escaping (ClientRuntime.SdkResult<UpdateBusinessReportScheduleOutputResponse, UpdateBusinessReportScheduleOutputError>) -> Void)
```

### updateConferenceProvider(input:completion:)

Updates an existing conference provider's settings.

``` swift
func updateConferenceProvider(input: UpdateConferenceProviderInput, completion: @escaping (ClientRuntime.SdkResult<UpdateConferenceProviderOutputResponse, UpdateConferenceProviderOutputError>) -> Void)
```

### updateContact(input:completion:)

Updates the contact details by the contact ARN.

``` swift
func updateContact(input: UpdateContactInput, completion: @escaping (ClientRuntime.SdkResult<UpdateContactOutputResponse, UpdateContactOutputError>) -> Void)
```

### updateDevice(input:completion:)

Updates the device name by device ARN.

``` swift
func updateDevice(input: UpdateDeviceInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDeviceOutputResponse, UpdateDeviceOutputError>) -> Void)
```

### updateGateway(input:completion:)

Updates the details of a gateway. If any optional field is not provided, the existing corresponding value is left unmodified.

``` swift
func updateGateway(input: UpdateGatewayInput, completion: @escaping (ClientRuntime.SdkResult<UpdateGatewayOutputResponse, UpdateGatewayOutputError>) -> Void)
```

### updateGatewayGroup(input:completion:)

Updates the details of a gateway group. If any optional field is not provided, the existing corresponding value is left unmodified.

``` swift
func updateGatewayGroup(input: UpdateGatewayGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateGatewayGroupOutputResponse, UpdateGatewayGroupOutputError>) -> Void)
```

### updateNetworkProfile(input:completion:)

Updates a network profile by the network profile ARN.

``` swift
func updateNetworkProfile(input: UpdateNetworkProfileInput, completion: @escaping (ClientRuntime.SdkResult<UpdateNetworkProfileOutputResponse, UpdateNetworkProfileOutputError>) -> Void)
```

### updateProfile(input:completion:)

Updates an existing room profile by room profile ARN.

``` swift
func updateProfile(input: UpdateProfileInput, completion: @escaping (ClientRuntime.SdkResult<UpdateProfileOutputResponse, UpdateProfileOutputError>) -> Void)
```

### updateRoom(input:completion:)

Updates room details by room ARN.

``` swift
func updateRoom(input: UpdateRoomInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRoomOutputResponse, UpdateRoomOutputError>) -> Void)
```

### updateSkillGroup(input:completion:)

Updates skill group details by skill group ARN.

``` swift
func updateSkillGroup(input: UpdateSkillGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSkillGroupOutputResponse, UpdateSkillGroupOutputError>) -> Void)
```
