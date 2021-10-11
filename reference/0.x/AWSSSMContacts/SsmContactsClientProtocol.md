# SsmContactsClientProtocol

Systems Manager Incident Manager is an incident management console designed to help users
mitigate and recover from incidents affecting their Amazon Web Services-hosted applications.
An incident is any unplanned interruption or reduction in quality of services.
Incident Manager increases incident resolution by notifying responders of impact,
highlighting relevant troubleshooting data, and providing collaboration tools to get
services back up and running. To achieve the primary goal of reducing the
time-to-resolution of critical incidents, Incident Manager automates response plans
and enables responder team escalation.

``` swift
public protocol SsmContactsClientProtocol 
```

## Requirements

### acceptPage(input:​completion:​)

Used to acknowledge an engagement to a contact channel during an incident.

``` swift
func acceptPage(input: AcceptPageInput, completion: @escaping (ClientRuntime.SdkResult<AcceptPageOutputResponse, AcceptPageOutputError>) -> Void)
```

### activateContactChannel(input:​completion:​)

Activates a contact's contact channel. Incident Manager can't engage a contact until the
contact channel has been activated.

``` swift
func activateContactChannel(input: ActivateContactChannelInput, completion: @escaping (ClientRuntime.SdkResult<ActivateContactChannelOutputResponse, ActivateContactChannelOutputError>) -> Void)
```

### createContact(input:​completion:​)

Contacts are either the contacts that Incident Manager engages during an incident or the
escalation plans that Incident Manager uses to engage contacts in phases during an
incident.

``` swift
func createContact(input: CreateContactInput, completion: @escaping (ClientRuntime.SdkResult<CreateContactOutputResponse, CreateContactOutputError>) -> Void)
```

### createContactChannel(input:​completion:​)

A contact channel is the method that Incident Manager uses to engage your contact.

``` swift
func createContactChannel(input: CreateContactChannelInput, completion: @escaping (ClientRuntime.SdkResult<CreateContactChannelOutputResponse, CreateContactChannelOutputError>) -> Void)
```

### deactivateContactChannel(input:​completion:​)

To no longer receive Incident Manager engagements to a contact channel, you can deactivate
the channel.

``` swift
func deactivateContactChannel(input: DeactivateContactChannelInput, completion: @escaping (ClientRuntime.SdkResult<DeactivateContactChannelOutputResponse, DeactivateContactChannelOutputError>) -> Void)
```

### deleteContact(input:​completion:​)

To remove a contact from Incident Manager, you can delete the contact. Deleting a contact
removes them from all escalation plans and related response plans. Deleting an escalation
plan removes it from all related response plans. You will have to recreate the contact and
its contact channels before you can use it again.

``` swift
func deleteContact(input: DeleteContactInput, completion: @escaping (ClientRuntime.SdkResult<DeleteContactOutputResponse, DeleteContactOutputError>) -> Void)
```

### deleteContactChannel(input:​completion:​)

To no longer receive engagements on a contact channel, you can delete the channel from a
contact. Deleting the contact channel removes it from the contact's engagement plan. If you
delete the only contact channel for a contact, you won't be able to engage that contact
during an incident.

``` swift
func deleteContactChannel(input: DeleteContactChannelInput, completion: @escaping (ClientRuntime.SdkResult<DeleteContactChannelOutputResponse, DeleteContactChannelOutputError>) -> Void)
```

### describeEngagement(input:​completion:​)

Incident Manager uses engagements to engage contacts and escalation plans during an incident.
Use this command to describe the engagement that occurred during an incident.

``` swift
func describeEngagement(input: DescribeEngagementInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEngagementOutputResponse, DescribeEngagementOutputError>) -> Void)
```

### describePage(input:​completion:​)

Lists details of the engagement to a contact channel.

``` swift
func describePage(input: DescribePageInput, completion: @escaping (ClientRuntime.SdkResult<DescribePageOutputResponse, DescribePageOutputError>) -> Void)
```

### getContact(input:​completion:​)

Retrieves information about the specified contact or escalation plan.

``` swift
func getContact(input: GetContactInput, completion: @escaping (ClientRuntime.SdkResult<GetContactOutputResponse, GetContactOutputError>) -> Void)
```

### getContactChannel(input:​completion:​)

List details about a specific contact channel.

``` swift
func getContactChannel(input: GetContactChannelInput, completion: @escaping (ClientRuntime.SdkResult<GetContactChannelOutputResponse, GetContactChannelOutputError>) -> Void)
```

### getContactPolicy(input:​completion:​)

Retrieves the resource policies attached to the specified contact or escalation
plan.

``` swift
func getContactPolicy(input: GetContactPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetContactPolicyOutputResponse, GetContactPolicyOutputError>) -> Void)
```

### listContactChannels(input:​completion:​)

Lists all contact channels for the specified contact.

``` swift
func listContactChannels(input: ListContactChannelsInput, completion: @escaping (ClientRuntime.SdkResult<ListContactChannelsOutputResponse, ListContactChannelsOutputError>) -> Void)
```

### listContacts(input:​completion:​)

Lists all contacts and escalation plans in Incident Manager.

``` swift
func listContacts(input: ListContactsInput, completion: @escaping (ClientRuntime.SdkResult<ListContactsOutputResponse, ListContactsOutputError>) -> Void)
```

### listEngagements(input:​completion:​)

Lists all engagements that have happened in an incident.

``` swift
func listEngagements(input: ListEngagementsInput, completion: @escaping (ClientRuntime.SdkResult<ListEngagementsOutputResponse, ListEngagementsOutputError>) -> Void)
```

### listPageReceipts(input:​completion:​)

Lists all of the engagements to contact channels that have been acknowledged.

``` swift
func listPageReceipts(input: ListPageReceiptsInput, completion: @escaping (ClientRuntime.SdkResult<ListPageReceiptsOutputResponse, ListPageReceiptsOutputError>) -> Void)
```

### listPagesByContact(input:​completion:​)

Lists the engagements to a contact's contact channels.

``` swift
func listPagesByContact(input: ListPagesByContactInput, completion: @escaping (ClientRuntime.SdkResult<ListPagesByContactOutputResponse, ListPagesByContactOutputError>) -> Void)
```

### listPagesByEngagement(input:​completion:​)

Lists the engagements to contact channels that occurred by engaging a contact.

``` swift
func listPagesByEngagement(input: ListPagesByEngagementInput, completion: @escaping (ClientRuntime.SdkResult<ListPagesByEngagementOutputResponse, ListPagesByEngagementOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

Lists the tags of an escalation plan or contact.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### putContactPolicy(input:​completion:​)

Adds a resource to the specified contact or escalation plan.

``` swift
func putContactPolicy(input: PutContactPolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutContactPolicyOutputResponse, PutContactPolicyOutputError>) -> Void)
```

### sendActivationCode(input:​completion:​)

Sends an activation code to a contact channel. The contact can use this code to activate
the contact channel in the console or with the ActivateChannel operation.
Incident Manager can't engage a contact channel until it has been activated.

``` swift
func sendActivationCode(input: SendActivationCodeInput, completion: @escaping (ClientRuntime.SdkResult<SendActivationCodeOutputResponse, SendActivationCodeOutputError>) -> Void)
```

### startEngagement(input:​completion:​)

Starts an engagement to a contact or escalation plan. The engagement engages each
contact specified in the incident.

``` swift
func startEngagement(input: StartEngagementInput, completion: @escaping (ClientRuntime.SdkResult<StartEngagementOutputResponse, StartEngagementOutputError>) -> Void)
```

### stopEngagement(input:​completion:​)

Stops an engagement before it finishes the final stage of the escalation plan or
engagement plan. Further contacts aren't engaged.

``` swift
func stopEngagement(input: StopEngagementInput, completion: @escaping (ClientRuntime.SdkResult<StopEngagementOutputResponse, StopEngagementOutputError>) -> Void)
```

### tagResource(input:​completion:​)

Tags a contact or escalation plan. You can tag only contacts and escalation plans in the
first region of your replication set.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:​completion:​)

Removes tags from the specified resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateContact(input:​completion:​)

Updates the contact or escalation plan specified.

``` swift
func updateContact(input: UpdateContactInput, completion: @escaping (ClientRuntime.SdkResult<UpdateContactOutputResponse, UpdateContactOutputError>) -> Void)
```

### updateContactChannel(input:​completion:​)

Updates a contact's contact channel.

``` swift
func updateContactChannel(input: UpdateContactChannelInput, completion: @escaping (ClientRuntime.SdkResult<UpdateContactChannelOutputResponse, UpdateContactChannelOutputError>) -> Void)
```
