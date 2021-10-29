# SesV2ClientProtocol

Amazon SES API v2 [Amazon SES](http://aws.amazon.com/ses) is an Amazon Web Services service that you can use to send email messages to your customers. If you're new to Amazon SES API v2, you might find it helpful to review the [Amazon Simple Email Service Developer Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/). The Amazon SES Developer Guide provides information and code samples that demonstrate how to use Amazon SES API v2 features programmatically.

``` swift
public protocol SesV2ClientProtocol 
```

## Requirements

### createConfigurationSet(input:completion:)

Create a configuration set. Configuration sets are groups of rules that you can apply to the emails that you send. You apply a configuration set to an email by specifying the name of the configuration set when you call the Amazon SES API v2. When you apply a configuration set to an email, all of the rules in that configuration set are applied to the email.

``` swift
func createConfigurationSet(input: CreateConfigurationSetInput, completion: @escaping (ClientRuntime.SdkResult<CreateConfigurationSetOutputResponse, CreateConfigurationSetOutputError>) -> Void)
```

### createConfigurationSetEventDestination(input:completion:)

Create an event destination. Events include message sends, deliveries, opens, clicks, bounces, and complaints. Event destinations are places that you can send information about these events to. For example, you can send event data to Amazon SNS to receive notifications when you receive bounces or complaints, or you can use Amazon Kinesis Data Firehose to stream data to Amazon S3 for long-term storage. A single configuration set can include more than one event destination.

``` swift
func createConfigurationSetEventDestination(input: CreateConfigurationSetEventDestinationInput, completion: @escaping (ClientRuntime.SdkResult<CreateConfigurationSetEventDestinationOutputResponse, CreateConfigurationSetEventDestinationOutputError>) -> Void)
```

### createContact(input:completion:)

Creates a contact, which is an end-user who is receiving the email, and adds them to a contact list.

``` swift
func createContact(input: CreateContactInput, completion: @escaping (ClientRuntime.SdkResult<CreateContactOutputResponse, CreateContactOutputError>) -> Void)
```

### createContactList(input:completion:)

Creates a contact list.

``` swift
func createContactList(input: CreateContactListInput, completion: @escaping (ClientRuntime.SdkResult<CreateContactListOutputResponse, CreateContactListOutputError>) -> Void)
```

### createCustomVerificationEmailTemplate(input:completion:)

Creates a new custom verification email template. For more information about custom verification email templates, see [Using Custom Verification Email Templates](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-verify-address-custom.html) in the Amazon SES Developer Guide. You can execute this operation no more than once per second.

``` swift
func createCustomVerificationEmailTemplate(input: CreateCustomVerificationEmailTemplateInput, completion: @escaping (ClientRuntime.SdkResult<CreateCustomVerificationEmailTemplateOutputResponse, CreateCustomVerificationEmailTemplateOutputError>) -> Void)
```

### createDedicatedIpPool(input:completion:)

Create a new pool of dedicated IP addresses. A pool can include one or more dedicated IP addresses that are associated with your Amazon Web Services account. You can associate a pool with a configuration set. When you send an email that uses that configuration set, the message is sent from one of the addresses in the associated pool.

``` swift
func createDedicatedIpPool(input: CreateDedicatedIpPoolInput, completion: @escaping (ClientRuntime.SdkResult<CreateDedicatedIpPoolOutputResponse, CreateDedicatedIpPoolOutputError>) -> Void)
```

### createDeliverabilityTestReport(input:completion:)

Create a new predictive inbox placement test. Predictive inbox placement tests can help you predict how your messages will be handled by various email providers around the world. When you perform a predictive inbox placement test, you provide a sample message that contains the content that you plan to send to your customers. Amazon SES then sends that message to special email addresses spread across several major email providers. After about 24 hours, the test is complete, and you can use the GetDeliverabilityTestReport operation to view the results of the test.

``` swift
func createDeliverabilityTestReport(input: CreateDeliverabilityTestReportInput, completion: @escaping (ClientRuntime.SdkResult<CreateDeliverabilityTestReportOutputResponse, CreateDeliverabilityTestReportOutputError>) -> Void)
```

### createEmailIdentity(input:completion:)

Starts the process of verifying an email identity. An identity is an email address or domain that you use when you send email. Before you can use an identity to send email, you first have to verify it. By verifying an identity, you demonstrate that you're the owner of the identity, and that you've given Amazon SES API v2 permission to send email from the identity. When you verify an email address, Amazon SES sends an email to the address. Your email address is verified as soon as you follow the link in the verification email. When you verify a domain without specifying the DkimSigningAttributes object, this operation provides a set of DKIM tokens. You can convert these tokens into CNAME records, which you then add to the DNS configuration for your domain. Your domain is verified when Amazon SES detects these records in the DNS configuration for your domain. This verification method is known as [Easy DKIM](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html). Alternatively, you can perform the verification process by providing your own public-private key pair. This verification method is known as Bring Your Own DKIM (BYODKIM). To use BYODKIM, your call to the CreateEmailIdentity operation has to include the DkimSigningAttributes object. When you specify this object, you provide a selector (a component of the DNS record name that identifies the public key to use for DKIM authentication) and a private key. When you verify a domain, this operation provides a set of DKIM tokens, which you can convert into CNAME tokens. You add these CNAME tokens to the DNS configuration for your domain. Your domain is verified when Amazon SES detects these records in the DNS configuration for your domain. For some DNS providers, it can take 72 hours or more to complete the domain verification process. Additionally, you can associate an existing configuration set with the email identity that you're verifying.

``` swift
func createEmailIdentity(input: CreateEmailIdentityInput, completion: @escaping (ClientRuntime.SdkResult<CreateEmailIdentityOutputResponse, CreateEmailIdentityOutputError>) -> Void)
```

### createEmailIdentityPolicy(input:completion:)

Creates the specified sending authorization policy for the given identity (an email address or a domain). This API is for the identity owner only. If you have not verified the identity, this API will return an error. Sending authorization is a feature that enables an identity owner to authorize other senders to use its identities. For information about using sending authorization, see the [Amazon SES Developer Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html). You can execute this operation no more than once per second.

``` swift
func createEmailIdentityPolicy(input: CreateEmailIdentityPolicyInput, completion: @escaping (ClientRuntime.SdkResult<CreateEmailIdentityPolicyOutputResponse, CreateEmailIdentityPolicyOutputError>) -> Void)
```

### createEmailTemplate(input:completion:)

Creates an email template. Email templates enable you to send personalized email to one or more destinations in a single API operation. For more information, see the [Amazon SES Developer Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-personalized-email-api.html). You can execute this operation no more than once per second.

``` swift
func createEmailTemplate(input: CreateEmailTemplateInput, completion: @escaping (ClientRuntime.SdkResult<CreateEmailTemplateOutputResponse, CreateEmailTemplateOutputError>) -> Void)
```

### createImportJob(input:completion:)

Creates an import job for a data destination.

``` swift
func createImportJob(input: CreateImportJobInput, completion: @escaping (ClientRuntime.SdkResult<CreateImportJobOutputResponse, CreateImportJobOutputError>) -> Void)
```

### deleteConfigurationSet(input:completion:)

Delete an existing configuration set. Configuration sets are groups of rules that you can apply to the emails you send. You apply a configuration set to an email by including a reference to the configuration set in the headers of the email. When you apply a configuration set to an email, all of the rules in that configuration set are applied to the email.

``` swift
func deleteConfigurationSet(input: DeleteConfigurationSetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteConfigurationSetOutputResponse, DeleteConfigurationSetOutputError>) -> Void)
```

### deleteConfigurationSetEventDestination(input:completion:)

Delete an event destination. Events include message sends, deliveries, opens, clicks, bounces, and complaints. Event destinations are places that you can send information about these events to. For example, you can send event data to Amazon SNS to receive notifications when you receive bounces or complaints, or you can use Amazon Kinesis Data Firehose to stream data to Amazon S3 for long-term storage.

``` swift
func deleteConfigurationSetEventDestination(input: DeleteConfigurationSetEventDestinationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteConfigurationSetEventDestinationOutputResponse, DeleteConfigurationSetEventDestinationOutputError>) -> Void)
```

### deleteContact(input:completion:)

Removes a contact from a contact list.

``` swift
func deleteContact(input: DeleteContactInput, completion: @escaping (ClientRuntime.SdkResult<DeleteContactOutputResponse, DeleteContactOutputError>) -> Void)
```

### deleteContactList(input:completion:)

Deletes a contact list and all of the contacts on that list.

``` swift
func deleteContactList(input: DeleteContactListInput, completion: @escaping (ClientRuntime.SdkResult<DeleteContactListOutputResponse, DeleteContactListOutputError>) -> Void)
```

### deleteCustomVerificationEmailTemplate(input:completion:)

Deletes an existing custom verification email template. For more information about custom verification email templates, see [Using Custom Verification Email Templates](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-verify-address-custom.html) in the Amazon SES Developer Guide. You can execute this operation no more than once per second.

``` swift
func deleteCustomVerificationEmailTemplate(input: DeleteCustomVerificationEmailTemplateInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCustomVerificationEmailTemplateOutputResponse, DeleteCustomVerificationEmailTemplateOutputError>) -> Void)
```

### deleteDedicatedIpPool(input:completion:)

Delete a dedicated IP pool.

``` swift
func deleteDedicatedIpPool(input: DeleteDedicatedIpPoolInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDedicatedIpPoolOutputResponse, DeleteDedicatedIpPoolOutputError>) -> Void)
```

### deleteEmailIdentity(input:completion:)

Deletes an email identity. An identity can be either an email address or a domain name.

``` swift
func deleteEmailIdentity(input: DeleteEmailIdentityInput, completion: @escaping (ClientRuntime.SdkResult<DeleteEmailIdentityOutputResponse, DeleteEmailIdentityOutputError>) -> Void)
```

### deleteEmailIdentityPolicy(input:completion:)

Deletes the specified sending authorization policy for the given identity (an email address or a domain). This API returns successfully even if a policy with the specified name does not exist. This API is for the identity owner only. If you have not verified the identity, this API will return an error. Sending authorization is a feature that enables an identity owner to authorize other senders to use its identities. For information about using sending authorization, see the [Amazon SES Developer Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html). You can execute this operation no more than once per second.

``` swift
func deleteEmailIdentityPolicy(input: DeleteEmailIdentityPolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteEmailIdentityPolicyOutputResponse, DeleteEmailIdentityPolicyOutputError>) -> Void)
```

### deleteEmailTemplate(input:completion:)

Deletes an email template. You can execute this operation no more than once per second.

``` swift
func deleteEmailTemplate(input: DeleteEmailTemplateInput, completion: @escaping (ClientRuntime.SdkResult<DeleteEmailTemplateOutputResponse, DeleteEmailTemplateOutputError>) -> Void)
```

### deleteSuppressedDestination(input:completion:)

Removes an email address from the suppression list for your account.

``` swift
func deleteSuppressedDestination(input: DeleteSuppressedDestinationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSuppressedDestinationOutputResponse, DeleteSuppressedDestinationOutputError>) -> Void)
```

### getAccount(input:completion:)

Obtain information about the email-sending status and capabilities of your Amazon SES account in the current Amazon Web Services Region.

``` swift
func getAccount(input: GetAccountInput, completion: @escaping (ClientRuntime.SdkResult<GetAccountOutputResponse, GetAccountOutputError>) -> Void)
```

### getBlacklistReports(input:completion:)

Retrieve a list of the blacklists that your dedicated IP addresses appear on.

``` swift
func getBlacklistReports(input: GetBlacklistReportsInput, completion: @escaping (ClientRuntime.SdkResult<GetBlacklistReportsOutputResponse, GetBlacklistReportsOutputError>) -> Void)
```

### getConfigurationSet(input:completion:)

Get information about an existing configuration set, including the dedicated IP pool that it's associated with, whether or not it's enabled for sending email, and more. Configuration sets are groups of rules that you can apply to the emails you send. You apply a configuration set to an email by including a reference to the configuration set in the headers of the email. When you apply a configuration set to an email, all of the rules in that configuration set are applied to the email.

``` swift
func getConfigurationSet(input: GetConfigurationSetInput, completion: @escaping (ClientRuntime.SdkResult<GetConfigurationSetOutputResponse, GetConfigurationSetOutputError>) -> Void)
```

### getConfigurationSetEventDestinations(input:completion:)

Retrieve a list of event destinations that are associated with a configuration set. Events include message sends, deliveries, opens, clicks, bounces, and complaints. Event destinations are places that you can send information about these events to. For example, you can send event data to Amazon SNS to receive notifications when you receive bounces or complaints, or you can use Amazon Kinesis Data Firehose to stream data to Amazon S3 for long-term storage.

``` swift
func getConfigurationSetEventDestinations(input: GetConfigurationSetEventDestinationsInput, completion: @escaping (ClientRuntime.SdkResult<GetConfigurationSetEventDestinationsOutputResponse, GetConfigurationSetEventDestinationsOutputError>) -> Void)
```

### getContact(input:completion:)

Returns a contact from a contact list.

``` swift
func getContact(input: GetContactInput, completion: @escaping (ClientRuntime.SdkResult<GetContactOutputResponse, GetContactOutputError>) -> Void)
```

### getContactList(input:completion:)

Returns contact list metadata. It does not return any information about the contacts present in the list.

``` swift
func getContactList(input: GetContactListInput, completion: @escaping (ClientRuntime.SdkResult<GetContactListOutputResponse, GetContactListOutputError>) -> Void)
```

### getCustomVerificationEmailTemplate(input:completion:)

Returns the custom email verification template for the template name you specify. For more information about custom verification email templates, see [Using Custom Verification Email Templates](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-verify-address-custom.html) in the Amazon SES Developer Guide. You can execute this operation no more than once per second.

``` swift
func getCustomVerificationEmailTemplate(input: GetCustomVerificationEmailTemplateInput, completion: @escaping (ClientRuntime.SdkResult<GetCustomVerificationEmailTemplateOutputResponse, GetCustomVerificationEmailTemplateOutputError>) -> Void)
```

### getDedicatedIp(input:completion:)

Get information about a dedicated IP address, including the name of the dedicated IP pool that it's associated with, as well information about the automatic warm-up process for the address.

``` swift
func getDedicatedIp(input: GetDedicatedIpInput, completion: @escaping (ClientRuntime.SdkResult<GetDedicatedIpOutputResponse, GetDedicatedIpOutputError>) -> Void)
```

### getDedicatedIps(input:completion:)

List the dedicated IP addresses that are associated with your Amazon Web Services account.

``` swift
func getDedicatedIps(input: GetDedicatedIpsInput, completion: @escaping (ClientRuntime.SdkResult<GetDedicatedIpsOutputResponse, GetDedicatedIpsOutputError>) -> Void)
```

### getDeliverabilityDashboardOptions(input:completion:)

Retrieve information about the status of the Deliverability dashboard for your account. When the Deliverability dashboard is enabled, you gain access to reputation, deliverability, and other metrics for the domains that you use to send email. You also gain the ability to perform predictive inbox placement tests. When you use the Deliverability dashboard, you pay a monthly subscription charge, in addition to any other fees that you accrue by using Amazon SES and other Amazon Web Services services. For more information about the features and cost of a Deliverability dashboard subscription, see [Amazon SES Pricing](http://aws.amazon.com/ses/pricing/).

``` swift
func getDeliverabilityDashboardOptions(input: GetDeliverabilityDashboardOptionsInput, completion: @escaping (ClientRuntime.SdkResult<GetDeliverabilityDashboardOptionsOutputResponse, GetDeliverabilityDashboardOptionsOutputError>) -> Void)
```

### getDeliverabilityTestReport(input:completion:)

Retrieve the results of a predictive inbox placement test.

``` swift
func getDeliverabilityTestReport(input: GetDeliverabilityTestReportInput, completion: @escaping (ClientRuntime.SdkResult<GetDeliverabilityTestReportOutputResponse, GetDeliverabilityTestReportOutputError>) -> Void)
```

### getDomainDeliverabilityCampaign(input:completion:)

Retrieve all the deliverability data for a specific campaign. This data is available for a campaign only if the campaign sent email by using a domain that the Deliverability dashboard is enabled for.

``` swift
func getDomainDeliverabilityCampaign(input: GetDomainDeliverabilityCampaignInput, completion: @escaping (ClientRuntime.SdkResult<GetDomainDeliverabilityCampaignOutputResponse, GetDomainDeliverabilityCampaignOutputError>) -> Void)
```

### getDomainStatisticsReport(input:completion:)

Retrieve inbox placement and engagement rates for the domains that you use to send email.

``` swift
func getDomainStatisticsReport(input: GetDomainStatisticsReportInput, completion: @escaping (ClientRuntime.SdkResult<GetDomainStatisticsReportOutputResponse, GetDomainStatisticsReportOutputError>) -> Void)
```

### getEmailIdentity(input:completion:)

Provides information about a specific identity, including the identity's verification status, sending authorization policies, its DKIM authentication status, and its custom Mail-From settings.

``` swift
func getEmailIdentity(input: GetEmailIdentityInput, completion: @escaping (ClientRuntime.SdkResult<GetEmailIdentityOutputResponse, GetEmailIdentityOutputError>) -> Void)
```

### getEmailIdentityPolicies(input:completion:)

Returns the requested sending authorization policies for the given identity (an email address or a domain). The policies are returned as a map of policy names to policy contents. You can retrieve a maximum of 20 policies at a time. This API is for the identity owner only. If you have not verified the identity, this API will return an error. Sending authorization is a feature that enables an identity owner to authorize other senders to use its identities. For information about using sending authorization, see the [Amazon SES Developer Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html). You can execute this operation no more than once per second.

``` swift
func getEmailIdentityPolicies(input: GetEmailIdentityPoliciesInput, completion: @escaping (ClientRuntime.SdkResult<GetEmailIdentityPoliciesOutputResponse, GetEmailIdentityPoliciesOutputError>) -> Void)
```

### getEmailTemplate(input:completion:)

Displays the template object (which includes the subject line, HTML part and text part) for the template you specify. You can execute this operation no more than once per second.

``` swift
func getEmailTemplate(input: GetEmailTemplateInput, completion: @escaping (ClientRuntime.SdkResult<GetEmailTemplateOutputResponse, GetEmailTemplateOutputError>) -> Void)
```

### getImportJob(input:completion:)

Provides information about an import job.

``` swift
func getImportJob(input: GetImportJobInput, completion: @escaping (ClientRuntime.SdkResult<GetImportJobOutputResponse, GetImportJobOutputError>) -> Void)
```

### getSuppressedDestination(input:completion:)

Retrieves information about a specific email address that's on the suppression list for your account.

``` swift
func getSuppressedDestination(input: GetSuppressedDestinationInput, completion: @escaping (ClientRuntime.SdkResult<GetSuppressedDestinationOutputResponse, GetSuppressedDestinationOutputError>) -> Void)
```

### listConfigurationSets(input:completion:)

List all of the configuration sets associated with your account in the current region. Configuration sets are groups of rules that you can apply to the emails you send. You apply a configuration set to an email by including a reference to the configuration set in the headers of the email. When you apply a configuration set to an email, all of the rules in that configuration set are applied to the email.

``` swift
func listConfigurationSets(input: ListConfigurationSetsInput, completion: @escaping (ClientRuntime.SdkResult<ListConfigurationSetsOutputResponse, ListConfigurationSetsOutputError>) -> Void)
```

### listContactLists(input:completion:)

Lists all of the contact lists available.

``` swift
func listContactLists(input: ListContactListsInput, completion: @escaping (ClientRuntime.SdkResult<ListContactListsOutputResponse, ListContactListsOutputError>) -> Void)
```

### listContacts(input:completion:)

Lists the contacts present in a specific contact list.

``` swift
func listContacts(input: ListContactsInput, completion: @escaping (ClientRuntime.SdkResult<ListContactsOutputResponse, ListContactsOutputError>) -> Void)
```

### listCustomVerificationEmailTemplates(input:completion:)

Lists the existing custom verification email templates for your account in the current Amazon Web Services Region. For more information about custom verification email templates, see [Using Custom Verification Email Templates](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-verify-address-custom.html) in the Amazon SES Developer Guide. You can execute this operation no more than once per second.

``` swift
func listCustomVerificationEmailTemplates(input: ListCustomVerificationEmailTemplatesInput, completion: @escaping (ClientRuntime.SdkResult<ListCustomVerificationEmailTemplatesOutputResponse, ListCustomVerificationEmailTemplatesOutputError>) -> Void)
```

### listDedicatedIpPools(input:completion:)

List all of the dedicated IP pools that exist in your Amazon Web Services account in the current Region.

``` swift
func listDedicatedIpPools(input: ListDedicatedIpPoolsInput, completion: @escaping (ClientRuntime.SdkResult<ListDedicatedIpPoolsOutputResponse, ListDedicatedIpPoolsOutputError>) -> Void)
```

### listDeliverabilityTestReports(input:completion:)

Show a list of the predictive inbox placement tests that you've performed, regardless of their statuses. For predictive inbox placement tests that are complete, you can use the GetDeliverabilityTestReport operation to view the results.

``` swift
func listDeliverabilityTestReports(input: ListDeliverabilityTestReportsInput, completion: @escaping (ClientRuntime.SdkResult<ListDeliverabilityTestReportsOutputResponse, ListDeliverabilityTestReportsOutputError>) -> Void)
```

### listDomainDeliverabilityCampaigns(input:completion:)

Retrieve deliverability data for all the campaigns that used a specific domain to send email during a specified time range. This data is available for a domain only if you enabled the Deliverability dashboard for the domain.

``` swift
func listDomainDeliverabilityCampaigns(input: ListDomainDeliverabilityCampaignsInput, completion: @escaping (ClientRuntime.SdkResult<ListDomainDeliverabilityCampaignsOutputResponse, ListDomainDeliverabilityCampaignsOutputError>) -> Void)
```

### listEmailIdentities(input:completion:)

Returns a list of all of the email identities that are associated with your Amazon Web Services account. An identity can be either an email address or a domain. This operation returns identities that are verified as well as those that aren't. This operation returns identities that are associated with Amazon SES and Amazon Pinpoint.

``` swift
func listEmailIdentities(input: ListEmailIdentitiesInput, completion: @escaping (ClientRuntime.SdkResult<ListEmailIdentitiesOutputResponse, ListEmailIdentitiesOutputError>) -> Void)
```

### listEmailTemplates(input:completion:)

Lists the email templates present in your Amazon SES account in the current Amazon Web Services Region. You can execute this operation no more than once per second.

``` swift
func listEmailTemplates(input: ListEmailTemplatesInput, completion: @escaping (ClientRuntime.SdkResult<ListEmailTemplatesOutputResponse, ListEmailTemplatesOutputError>) -> Void)
```

### listImportJobs(input:completion:)

Lists all of the import jobs.

``` swift
func listImportJobs(input: ListImportJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListImportJobsOutputResponse, ListImportJobsOutputError>) -> Void)
```

### listSuppressedDestinations(input:completion:)

Retrieves a list of email addresses that are on the suppression list for your account.

``` swift
func listSuppressedDestinations(input: ListSuppressedDestinationsInput, completion: @escaping (ClientRuntime.SdkResult<ListSuppressedDestinationsOutputResponse, ListSuppressedDestinationsOutputError>) -> Void)
```

### listTagsForResource(input:completion:)

Retrieve a list of the tags (keys and values) that are associated with a specified resource. A tag is a label that you optionally define and associate with a resource. Each tag consists of a required tag key and an optional associated tag value. A tag key is a general label that acts as a category for more specific tag values. A tag value acts as a descriptor within a tag key.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### putAccountDedicatedIpWarmupAttributes(input:completion:)

Enable or disable the automatic warm-up feature for dedicated IP addresses.

``` swift
func putAccountDedicatedIpWarmupAttributes(input: PutAccountDedicatedIpWarmupAttributesInput, completion: @escaping (ClientRuntime.SdkResult<PutAccountDedicatedIpWarmupAttributesOutputResponse, PutAccountDedicatedIpWarmupAttributesOutputError>) -> Void)
```

### putAccountDetails(input:completion:)

Update your Amazon SES account details.

``` swift
func putAccountDetails(input: PutAccountDetailsInput, completion: @escaping (ClientRuntime.SdkResult<PutAccountDetailsOutputResponse, PutAccountDetailsOutputError>) -> Void)
```

### putAccountSendingAttributes(input:completion:)

Enable or disable the ability of your account to send email.

``` swift
func putAccountSendingAttributes(input: PutAccountSendingAttributesInput, completion: @escaping (ClientRuntime.SdkResult<PutAccountSendingAttributesOutputResponse, PutAccountSendingAttributesOutputError>) -> Void)
```

### putAccountSuppressionAttributes(input:completion:)

Change the settings for the account-level suppression list.

``` swift
func putAccountSuppressionAttributes(input: PutAccountSuppressionAttributesInput, completion: @escaping (ClientRuntime.SdkResult<PutAccountSuppressionAttributesOutputResponse, PutAccountSuppressionAttributesOutputError>) -> Void)
```

### putConfigurationSetDeliveryOptions(input:completion:)

Associate a configuration set with a dedicated IP pool. You can use dedicated IP pools to create groups of dedicated IP addresses for sending specific types of email.

``` swift
func putConfigurationSetDeliveryOptions(input: PutConfigurationSetDeliveryOptionsInput, completion: @escaping (ClientRuntime.SdkResult<PutConfigurationSetDeliveryOptionsOutputResponse, PutConfigurationSetDeliveryOptionsOutputError>) -> Void)
```

### putConfigurationSetReputationOptions(input:completion:)

Enable or disable collection of reputation metrics for emails that you send using a particular configuration set in a specific Amazon Web Services Region.

``` swift
func putConfigurationSetReputationOptions(input: PutConfigurationSetReputationOptionsInput, completion: @escaping (ClientRuntime.SdkResult<PutConfigurationSetReputationOptionsOutputResponse, PutConfigurationSetReputationOptionsOutputError>) -> Void)
```

### putConfigurationSetSendingOptions(input:completion:)

Enable or disable email sending for messages that use a particular configuration set in a specific Amazon Web Services Region.

``` swift
func putConfigurationSetSendingOptions(input: PutConfigurationSetSendingOptionsInput, completion: @escaping (ClientRuntime.SdkResult<PutConfigurationSetSendingOptionsOutputResponse, PutConfigurationSetSendingOptionsOutputError>) -> Void)
```

### putConfigurationSetSuppressionOptions(input:completion:)

Specify the account suppression list preferences for a configuration set.

``` swift
func putConfigurationSetSuppressionOptions(input: PutConfigurationSetSuppressionOptionsInput, completion: @escaping (ClientRuntime.SdkResult<PutConfigurationSetSuppressionOptionsOutputResponse, PutConfigurationSetSuppressionOptionsOutputError>) -> Void)
```

### putConfigurationSetTrackingOptions(input:completion:)

Specify a custom domain to use for open and click tracking elements in email that you send.

``` swift
func putConfigurationSetTrackingOptions(input: PutConfigurationSetTrackingOptionsInput, completion: @escaping (ClientRuntime.SdkResult<PutConfigurationSetTrackingOptionsOutputResponse, PutConfigurationSetTrackingOptionsOutputError>) -> Void)
```

### putDedicatedIpInPool(input:completion:)

Move a dedicated IP address to an existing dedicated IP pool. The dedicated IP address that you specify must already exist, and must be associated with your Amazon Web Services account. The dedicated IP pool you specify must already exist. You can create a new pool by using the CreateDedicatedIpPool operation.

``` swift
func putDedicatedIpInPool(input: PutDedicatedIpInPoolInput, completion: @escaping (ClientRuntime.SdkResult<PutDedicatedIpInPoolOutputResponse, PutDedicatedIpInPoolOutputError>) -> Void)
```

### putDedicatedIpWarmupAttributes(input:completion:)

``` swift
func putDedicatedIpWarmupAttributes(input: PutDedicatedIpWarmupAttributesInput, completion: @escaping (ClientRuntime.SdkResult<PutDedicatedIpWarmupAttributesOutputResponse, PutDedicatedIpWarmupAttributesOutputError>) -> Void)
```

### putDeliverabilityDashboardOption(input:completion:)

Enable or disable the Deliverability dashboard. When you enable the Deliverability dashboard, you gain access to reputation, deliverability, and other metrics for the domains that you use to send email. You also gain the ability to perform predictive inbox placement tests. When you use the Deliverability dashboard, you pay a monthly subscription charge, in addition to any other fees that you accrue by using Amazon SES and other Amazon Web Services services. For more information about the features and cost of a Deliverability dashboard subscription, see [Amazon SES Pricing](http://aws.amazon.com/ses/pricing/).

``` swift
func putDeliverabilityDashboardOption(input: PutDeliverabilityDashboardOptionInput, completion: @escaping (ClientRuntime.SdkResult<PutDeliverabilityDashboardOptionOutputResponse, PutDeliverabilityDashboardOptionOutputError>) -> Void)
```

### putEmailIdentityConfigurationSetAttributes(input:completion:)

Used to associate a configuration set with an email identity.

``` swift
func putEmailIdentityConfigurationSetAttributes(input: PutEmailIdentityConfigurationSetAttributesInput, completion: @escaping (ClientRuntime.SdkResult<PutEmailIdentityConfigurationSetAttributesOutputResponse, PutEmailIdentityConfigurationSetAttributesOutputError>) -> Void)
```

### putEmailIdentityDkimAttributes(input:completion:)

Used to enable or disable DKIM authentication for an email identity.

``` swift
func putEmailIdentityDkimAttributes(input: PutEmailIdentityDkimAttributesInput, completion: @escaping (ClientRuntime.SdkResult<PutEmailIdentityDkimAttributesOutputResponse, PutEmailIdentityDkimAttributesOutputError>) -> Void)
```

### putEmailIdentityDkimSigningAttributes(input:completion:)

Used to configure or change the DKIM authentication settings for an email domain identity. You can use this operation to do any of the following:

``` swift
func putEmailIdentityDkimSigningAttributes(input: PutEmailIdentityDkimSigningAttributesInput, completion: @escaping (ClientRuntime.SdkResult<PutEmailIdentityDkimSigningAttributesOutputResponse, PutEmailIdentityDkimSigningAttributesOutputError>) -> Void)
```

  - Update the signing attributes for an identity that uses Bring Your Own DKIM (BYODKIM).

  - Update the key length that should be used for Easy DKIM.

  - Change from using no DKIM authentication to using Easy DKIM.

  - Change from using no DKIM authentication to using BYODKIM.

  - Change from using Easy DKIM to using BYODKIM.

  - Change from using BYODKIM to using Easy DKIM.

### putEmailIdentityFeedbackAttributes(input:completion:)

Used to enable or disable feedback forwarding for an identity. This setting determines what happens when an identity is used to send an email that results in a bounce or complaint event. If the value is true, you receive email notifications when bounce or complaint events occur. These notifications are sent to the address that you specified in the Return-Path header of the original email. You're required to have a method of tracking bounces and complaints. If you haven't set up another mechanism for receiving bounce or complaint notifications (for example, by setting up an event destination), you receive an email notification when these events occur (even if this setting is disabled).

``` swift
func putEmailIdentityFeedbackAttributes(input: PutEmailIdentityFeedbackAttributesInput, completion: @escaping (ClientRuntime.SdkResult<PutEmailIdentityFeedbackAttributesOutputResponse, PutEmailIdentityFeedbackAttributesOutputError>) -> Void)
```

### putEmailIdentityMailFromAttributes(input:completion:)

Used to enable or disable the custom Mail-From domain configuration for an email identity.

``` swift
func putEmailIdentityMailFromAttributes(input: PutEmailIdentityMailFromAttributesInput, completion: @escaping (ClientRuntime.SdkResult<PutEmailIdentityMailFromAttributesOutputResponse, PutEmailIdentityMailFromAttributesOutputError>) -> Void)
```

### putSuppressedDestination(input:completion:)

Adds an email address to the suppression list for your account.

``` swift
func putSuppressedDestination(input: PutSuppressedDestinationInput, completion: @escaping (ClientRuntime.SdkResult<PutSuppressedDestinationOutputResponse, PutSuppressedDestinationOutputError>) -> Void)
```

### sendBulkEmail(input:completion:)

Composes an email message to multiple destinations.

``` swift
func sendBulkEmail(input: SendBulkEmailInput, completion: @escaping (ClientRuntime.SdkResult<SendBulkEmailOutputResponse, SendBulkEmailOutputError>) -> Void)
```

### sendCustomVerificationEmail(input:completion:)

Adds an email address to the list of identities for your Amazon SES account in the current Amazon Web Services Region and attempts to verify it. As a result of executing this operation, a customized verification email is sent to the specified address. To use this operation, you must first create a custom verification email template. For more information about creating and using custom verification email templates, see [Using Custom Verification Email Templates](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-verify-address-custom.html) in the Amazon SES Developer Guide. You can execute this operation no more than once per second.

``` swift
func sendCustomVerificationEmail(input: SendCustomVerificationEmailInput, completion: @escaping (ClientRuntime.SdkResult<SendCustomVerificationEmailOutputResponse, SendCustomVerificationEmailOutputError>) -> Void)
```

### sendEmail(input:completion:)

Sends an email message. You can use the Amazon SES API v2 to send the following types of messages:

``` swift
func sendEmail(input: SendEmailInput, completion: @escaping (ClientRuntime.SdkResult<SendEmailOutputResponse, SendEmailOutputError>) -> Void)
```

  - Simple – A standard email message. When you create this type of message, you specify the sender, the recipient, and the message body, and Amazon SES assembles the message for you.

  - Raw – A raw, MIME-formatted email message. When you send this type of email, you have to specify all of the message headers, as well as the message body. You can use this message type to send messages that contain attachments. The message that you specify has to be a valid MIME message.

  - Templated – A message that contains personalization tags. When you send this type of email, Amazon SES API v2 automatically replaces the tags with values that you specify.

### tagResource(input:completion:)

Add one or more tags (keys and values) to a specified resource. A tag is a label that you optionally define and associate with a resource. Tags can help you categorize and manage resources in different ways, such as by purpose, owner, environment, or other criteria. A resource can have as many as 50 tags. Each tag consists of a required tag key and an associated tag value, both of which you define. A tag key is a general label that acts as a category for more specific tag values. A tag value acts as a descriptor within a tag key.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### testRenderEmailTemplate(input:completion:)

Creates a preview of the MIME content of an email when provided with a template and a set of replacement data. You can execute this operation no more than once per second.

``` swift
func testRenderEmailTemplate(input: TestRenderEmailTemplateInput, completion: @escaping (ClientRuntime.SdkResult<TestRenderEmailTemplateOutputResponse, TestRenderEmailTemplateOutputError>) -> Void)
```

### untagResource(input:completion:)

Remove one or more tags (keys and values) from a specified resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateConfigurationSetEventDestination(input:completion:)

Update the configuration of an event destination for a configuration set. Events include message sends, deliveries, opens, clicks, bounces, and complaints. Event destinations are places that you can send information about these events to. For example, you can send event data to Amazon SNS to receive notifications when you receive bounces or complaints, or you can use Amazon Kinesis Data Firehose to stream data to Amazon S3 for long-term storage.

``` swift
func updateConfigurationSetEventDestination(input: UpdateConfigurationSetEventDestinationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateConfigurationSetEventDestinationOutputResponse, UpdateConfigurationSetEventDestinationOutputError>) -> Void)
```

### updateContact(input:completion:)

Updates a contact's preferences for a list. It is not necessary to specify all existing topic preferences in the TopicPreferences object, just the ones that need updating.

``` swift
func updateContact(input: UpdateContactInput, completion: @escaping (ClientRuntime.SdkResult<UpdateContactOutputResponse, UpdateContactOutputError>) -> Void)
```

### updateContactList(input:completion:)

Updates contact list metadata. This operation does a complete replacement.

``` swift
func updateContactList(input: UpdateContactListInput, completion: @escaping (ClientRuntime.SdkResult<UpdateContactListOutputResponse, UpdateContactListOutputError>) -> Void)
```

### updateCustomVerificationEmailTemplate(input:completion:)

Updates an existing custom verification email template. For more information about custom verification email templates, see [Using Custom Verification Email Templates](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-verify-address-custom.html) in the Amazon SES Developer Guide. You can execute this operation no more than once per second.

``` swift
func updateCustomVerificationEmailTemplate(input: UpdateCustomVerificationEmailTemplateInput, completion: @escaping (ClientRuntime.SdkResult<UpdateCustomVerificationEmailTemplateOutputResponse, UpdateCustomVerificationEmailTemplateOutputError>) -> Void)
```

### updateEmailIdentityPolicy(input:completion:)

Updates the specified sending authorization policy for the given identity (an email address or a domain). This API returns successfully even if a policy with the specified name does not exist. This API is for the identity owner only. If you have not verified the identity, this API will return an error. Sending authorization is a feature that enables an identity owner to authorize other senders to use its identities. For information about using sending authorization, see the [Amazon SES Developer Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html). You can execute this operation no more than once per second.

``` swift
func updateEmailIdentityPolicy(input: UpdateEmailIdentityPolicyInput, completion: @escaping (ClientRuntime.SdkResult<UpdateEmailIdentityPolicyOutputResponse, UpdateEmailIdentityPolicyOutputError>) -> Void)
```

### updateEmailTemplate(input:completion:)

Updates an email template. Email templates enable you to send personalized email to one or more destinations in a single API operation. For more information, see the [Amazon SES Developer Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-personalized-email-api.html). You can execute this operation no more than once per second.

``` swift
func updateEmailTemplate(input: UpdateEmailTemplateInput, completion: @escaping (ClientRuntime.SdkResult<UpdateEmailTemplateOutputResponse, UpdateEmailTemplateOutputError>) -> Void)
```
