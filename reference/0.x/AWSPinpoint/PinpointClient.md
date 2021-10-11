# PinpointClient

``` swift
public class PinpointClient 
```

## Inheritance

[`PinpointClientProtocol`](/aws-sdk-swift/reference/0.x/AWSPinpoint/PinpointClientProtocol)

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

### `createApp(input:completion:)`

Creates an application.

``` swift
public func createApp(input: CreateAppInput, completion: @escaping (ClientRuntime.SdkResult<CreateAppOutputResponse, CreateAppOutputError>) -> Void)
```

### `createCampaign(input:completion:)`

Creates a new campaign for an application or updates the settings of an existing campaign for an application.

``` swift
public func createCampaign(input: CreateCampaignInput, completion: @escaping (ClientRuntime.SdkResult<CreateCampaignOutputResponse, CreateCampaignOutputError>) -> Void)
```

### `createEmailTemplate(input:completion:)`

Creates a message template for messages that are sent through the email channel.

``` swift
public func createEmailTemplate(input: CreateEmailTemplateInput, completion: @escaping (ClientRuntime.SdkResult<CreateEmailTemplateOutputResponse, CreateEmailTemplateOutputError>) -> Void)
```

### `createExportJob(input:completion:)`

Creates an export job for an application.

``` swift
public func createExportJob(input: CreateExportJobInput, completion: @escaping (ClientRuntime.SdkResult<CreateExportJobOutputResponse, CreateExportJobOutputError>) -> Void)
```

### `createImportJob(input:completion:)`

Creates an import job for an application.

``` swift
public func createImportJob(input: CreateImportJobInput, completion: @escaping (ClientRuntime.SdkResult<CreateImportJobOutputResponse, CreateImportJobOutputError>) -> Void)
```

### `createInAppTemplate(input:completion:)`

Creates a new message template for messages using the in-app message channel.

``` swift
public func createInAppTemplate(input: CreateInAppTemplateInput, completion: @escaping (ClientRuntime.SdkResult<CreateInAppTemplateOutputResponse, CreateInAppTemplateOutputError>) -> Void)
```

### `createJourney(input:completion:)`

Creates a journey for an application.

``` swift
public func createJourney(input: CreateJourneyInput, completion: @escaping (ClientRuntime.SdkResult<CreateJourneyOutputResponse, CreateJourneyOutputError>) -> Void)
```

### `createPushTemplate(input:completion:)`

Creates a message template for messages that are sent through a push notification channel.

``` swift
public func createPushTemplate(input: CreatePushTemplateInput, completion: @escaping (ClientRuntime.SdkResult<CreatePushTemplateOutputResponse, CreatePushTemplateOutputError>) -> Void)
```

### `createRecommenderConfiguration(input:completion:)`

Creates an Amazon Pinpoint configuration for a recommender model.

``` swift
public func createRecommenderConfiguration(input: CreateRecommenderConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<CreateRecommenderConfigurationOutputResponse, CreateRecommenderConfigurationOutputError>) -> Void)
```

### `createSegment(input:completion:)`

Creates a new segment for an application or updates the configuration, dimension, and other settings for an existing segment that's associated with an application.

``` swift
public func createSegment(input: CreateSegmentInput, completion: @escaping (ClientRuntime.SdkResult<CreateSegmentOutputResponse, CreateSegmentOutputError>) -> Void)
```

### `createSmsTemplate(input:completion:)`

Creates a message template for messages that are sent through the SMS channel.

``` swift
public func createSmsTemplate(input: CreateSmsTemplateInput, completion: @escaping (ClientRuntime.SdkResult<CreateSmsTemplateOutputResponse, CreateSmsTemplateOutputError>) -> Void)
```

### `createVoiceTemplate(input:completion:)`

Creates a message template for messages that are sent through the voice channel.

``` swift
public func createVoiceTemplate(input: CreateVoiceTemplateInput, completion: @escaping (ClientRuntime.SdkResult<CreateVoiceTemplateOutputResponse, CreateVoiceTemplateOutputError>) -> Void)
```

### `deleteAdmChannel(input:completion:)`

Disables the ADM channel for an application and deletes any existing settings for the channel.

``` swift
public func deleteAdmChannel(input: DeleteAdmChannelInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAdmChannelOutputResponse, DeleteAdmChannelOutputError>) -> Void)
```

### `deleteApnsChannel(input:completion:)`

Disables the APNs channel for an application and deletes any existing settings for the channel.

``` swift
public func deleteApnsChannel(input: DeleteApnsChannelInput, completion: @escaping (ClientRuntime.SdkResult<DeleteApnsChannelOutputResponse, DeleteApnsChannelOutputError>) -> Void)
```

### `deleteApnsSandboxChannel(input:completion:)`

Disables the APNs sandbox channel for an application and deletes any existing settings for the channel.

``` swift
public func deleteApnsSandboxChannel(input: DeleteApnsSandboxChannelInput, completion: @escaping (ClientRuntime.SdkResult<DeleteApnsSandboxChannelOutputResponse, DeleteApnsSandboxChannelOutputError>) -> Void)
```

### `deleteApnsVoipChannel(input:completion:)`

Disables the APNs VoIP channel for an application and deletes any existing settings for the channel.

``` swift
public func deleteApnsVoipChannel(input: DeleteApnsVoipChannelInput, completion: @escaping (ClientRuntime.SdkResult<DeleteApnsVoipChannelOutputResponse, DeleteApnsVoipChannelOutputError>) -> Void)
```

### `deleteApnsVoipSandboxChannel(input:completion:)`

Disables the APNs VoIP sandbox channel for an application and deletes any existing settings for the channel.

``` swift
public func deleteApnsVoipSandboxChannel(input: DeleteApnsVoipSandboxChannelInput, completion: @escaping (ClientRuntime.SdkResult<DeleteApnsVoipSandboxChannelOutputResponse, DeleteApnsVoipSandboxChannelOutputError>) -> Void)
```

### `deleteApp(input:completion:)`

Deletes an application.

``` swift
public func deleteApp(input: DeleteAppInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAppOutputResponse, DeleteAppOutputError>) -> Void)
```

### `deleteBaiduChannel(input:completion:)`

Disables the Baidu channel for an application and deletes any existing settings for the channel.

``` swift
public func deleteBaiduChannel(input: DeleteBaiduChannelInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBaiduChannelOutputResponse, DeleteBaiduChannelOutputError>) -> Void)
```

### `deleteCampaign(input:completion:)`

Deletes a campaign from an application.

``` swift
public func deleteCampaign(input: DeleteCampaignInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCampaignOutputResponse, DeleteCampaignOutputError>) -> Void)
```

### `deleteEmailChannel(input:completion:)`

Disables the email channel for an application and deletes any existing settings for the channel.

``` swift
public func deleteEmailChannel(input: DeleteEmailChannelInput, completion: @escaping (ClientRuntime.SdkResult<DeleteEmailChannelOutputResponse, DeleteEmailChannelOutputError>) -> Void)
```

### `deleteEmailTemplate(input:completion:)`

Deletes a message template for messages that were sent through the email channel.

``` swift
public func deleteEmailTemplate(input: DeleteEmailTemplateInput, completion: @escaping (ClientRuntime.SdkResult<DeleteEmailTemplateOutputResponse, DeleteEmailTemplateOutputError>) -> Void)
```

### `deleteEndpoint(input:completion:)`

Deletes an endpoint from an application.

``` swift
public func deleteEndpoint(input: DeleteEndpointInput, completion: @escaping (ClientRuntime.SdkResult<DeleteEndpointOutputResponse, DeleteEndpointOutputError>) -> Void)
```

### `deleteEventStream(input:completion:)`

Deletes the event stream for an application.

``` swift
public func deleteEventStream(input: DeleteEventStreamInput, completion: @escaping (ClientRuntime.SdkResult<DeleteEventStreamOutputResponse, DeleteEventStreamOutputError>) -> Void)
```

### `deleteGcmChannel(input:completion:)`

Disables the GCM channel for an application and deletes any existing settings for the channel.

``` swift
public func deleteGcmChannel(input: DeleteGcmChannelInput, completion: @escaping (ClientRuntime.SdkResult<DeleteGcmChannelOutputResponse, DeleteGcmChannelOutputError>) -> Void)
```

### `deleteInAppTemplate(input:completion:)`

Deletes a message template for messages sent using the in-app message channel.

``` swift
public func deleteInAppTemplate(input: DeleteInAppTemplateInput, completion: @escaping (ClientRuntime.SdkResult<DeleteInAppTemplateOutputResponse, DeleteInAppTemplateOutputError>) -> Void)
```

### `deleteJourney(input:completion:)`

Deletes a journey from an application.

``` swift
public func deleteJourney(input: DeleteJourneyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteJourneyOutputResponse, DeleteJourneyOutputError>) -> Void)
```

### `deletePushTemplate(input:completion:)`

Deletes a message template for messages that were sent through a push notification channel.

``` swift
public func deletePushTemplate(input: DeletePushTemplateInput, completion: @escaping (ClientRuntime.SdkResult<DeletePushTemplateOutputResponse, DeletePushTemplateOutputError>) -> Void)
```

### `deleteRecommenderConfiguration(input:completion:)`

Deletes an Amazon Pinpoint configuration for a recommender model.

``` swift
public func deleteRecommenderConfiguration(input: DeleteRecommenderConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRecommenderConfigurationOutputResponse, DeleteRecommenderConfigurationOutputError>) -> Void)
```

### `deleteSegment(input:completion:)`

Deletes a segment from an application.

``` swift
public func deleteSegment(input: DeleteSegmentInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSegmentOutputResponse, DeleteSegmentOutputError>) -> Void)
```

### `deleteSmsChannel(input:completion:)`

Disables the SMS channel for an application and deletes any existing settings for the channel.

``` swift
public func deleteSmsChannel(input: DeleteSmsChannelInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSmsChannelOutputResponse, DeleteSmsChannelOutputError>) -> Void)
```

### `deleteSmsTemplate(input:completion:)`

Deletes a message template for messages that were sent through the SMS channel.

``` swift
public func deleteSmsTemplate(input: DeleteSmsTemplateInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSmsTemplateOutputResponse, DeleteSmsTemplateOutputError>) -> Void)
```

### `deleteUserEndpoints(input:completion:)`

Deletes all the endpoints that are associated with a specific user ID.

``` swift
public func deleteUserEndpoints(input: DeleteUserEndpointsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUserEndpointsOutputResponse, DeleteUserEndpointsOutputError>) -> Void)
```

### `deleteVoiceChannel(input:completion:)`

Disables the voice channel for an application and deletes any existing settings for the channel.

``` swift
public func deleteVoiceChannel(input: DeleteVoiceChannelInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVoiceChannelOutputResponse, DeleteVoiceChannelOutputError>) -> Void)
```

### `deleteVoiceTemplate(input:completion:)`

Deletes a message template for messages that were sent through the voice channel.

``` swift
public func deleteVoiceTemplate(input: DeleteVoiceTemplateInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVoiceTemplateOutputResponse, DeleteVoiceTemplateOutputError>) -> Void)
```

### `getAdmChannel(input:completion:)`

Retrieves information about the status and settings of the ADM channel for an application.

``` swift
public func getAdmChannel(input: GetAdmChannelInput, completion: @escaping (ClientRuntime.SdkResult<GetAdmChannelOutputResponse, GetAdmChannelOutputError>) -> Void)
```

### `getApnsChannel(input:completion:)`

Retrieves information about the status and settings of the APNs channel for an application.

``` swift
public func getApnsChannel(input: GetApnsChannelInput, completion: @escaping (ClientRuntime.SdkResult<GetApnsChannelOutputResponse, GetApnsChannelOutputError>) -> Void)
```

### `getApnsSandboxChannel(input:completion:)`

Retrieves information about the status and settings of the APNs sandbox channel for an application.

``` swift
public func getApnsSandboxChannel(input: GetApnsSandboxChannelInput, completion: @escaping (ClientRuntime.SdkResult<GetApnsSandboxChannelOutputResponse, GetApnsSandboxChannelOutputError>) -> Void)
```

### `getApnsVoipChannel(input:completion:)`

Retrieves information about the status and settings of the APNs VoIP channel for an application.

``` swift
public func getApnsVoipChannel(input: GetApnsVoipChannelInput, completion: @escaping (ClientRuntime.SdkResult<GetApnsVoipChannelOutputResponse, GetApnsVoipChannelOutputError>) -> Void)
```

### `getApnsVoipSandboxChannel(input:completion:)`

Retrieves information about the status and settings of the APNs VoIP sandbox channel for an application.

``` swift
public func getApnsVoipSandboxChannel(input: GetApnsVoipSandboxChannelInput, completion: @escaping (ClientRuntime.SdkResult<GetApnsVoipSandboxChannelOutputResponse, GetApnsVoipSandboxChannelOutputError>) -> Void)
```

### `getApp(input:completion:)`

Retrieves information about an application.

``` swift
public func getApp(input: GetAppInput, completion: @escaping (ClientRuntime.SdkResult<GetAppOutputResponse, GetAppOutputError>) -> Void)
```

### `getApplicationDateRangeKpi(input:completion:)`

Retrieves (queries) pre-aggregated data for a standard metric that applies to an application.

``` swift
public func getApplicationDateRangeKpi(input: GetApplicationDateRangeKpiInput, completion: @escaping (ClientRuntime.SdkResult<GetApplicationDateRangeKpiOutputResponse, GetApplicationDateRangeKpiOutputError>) -> Void)
```

### `getApplicationSettings(input:completion:)`

Retrieves information about the settings for an application.

``` swift
public func getApplicationSettings(input: GetApplicationSettingsInput, completion: @escaping (ClientRuntime.SdkResult<GetApplicationSettingsOutputResponse, GetApplicationSettingsOutputError>) -> Void)
```

### `getApps(input:completion:)`

Retrieves information about all the applications that are associated with your Amazon Pinpoint account.

``` swift
public func getApps(input: GetAppsInput, completion: @escaping (ClientRuntime.SdkResult<GetAppsOutputResponse, GetAppsOutputError>) -> Void)
```

### `getBaiduChannel(input:completion:)`

Retrieves information about the status and settings of the Baidu channel for an application.

``` swift
public func getBaiduChannel(input: GetBaiduChannelInput, completion: @escaping (ClientRuntime.SdkResult<GetBaiduChannelOutputResponse, GetBaiduChannelOutputError>) -> Void)
```

### `getCampaign(input:completion:)`

Retrieves information about the status, configuration, and other settings for a campaign.

``` swift
public func getCampaign(input: GetCampaignInput, completion: @escaping (ClientRuntime.SdkResult<GetCampaignOutputResponse, GetCampaignOutputError>) -> Void)
```

### `getCampaignActivities(input:completion:)`

Retrieves information about all the activities for a campaign.

``` swift
public func getCampaignActivities(input: GetCampaignActivitiesInput, completion: @escaping (ClientRuntime.SdkResult<GetCampaignActivitiesOutputResponse, GetCampaignActivitiesOutputError>) -> Void)
```

### `getCampaignDateRangeKpi(input:completion:)`

Retrieves (queries) pre-aggregated data for a standard metric that applies to a campaign.

``` swift
public func getCampaignDateRangeKpi(input: GetCampaignDateRangeKpiInput, completion: @escaping (ClientRuntime.SdkResult<GetCampaignDateRangeKpiOutputResponse, GetCampaignDateRangeKpiOutputError>) -> Void)
```

### `getCampaignVersion(input:completion:)`

Retrieves information about the status, configuration, and other settings for a specific version of a campaign.

``` swift
public func getCampaignVersion(input: GetCampaignVersionInput, completion: @escaping (ClientRuntime.SdkResult<GetCampaignVersionOutputResponse, GetCampaignVersionOutputError>) -> Void)
```

### `getCampaignVersions(input:completion:)`

Retrieves information about the status, configuration, and other settings for all versions of a campaign.

``` swift
public func getCampaignVersions(input: GetCampaignVersionsInput, completion: @escaping (ClientRuntime.SdkResult<GetCampaignVersionsOutputResponse, GetCampaignVersionsOutputError>) -> Void)
```

### `getCampaigns(input:completion:)`

Retrieves information about the status, configuration, and other settings for all the campaigns that are associated with an application.

``` swift
public func getCampaigns(input: GetCampaignsInput, completion: @escaping (ClientRuntime.SdkResult<GetCampaignsOutputResponse, GetCampaignsOutputError>) -> Void)
```

### `getChannels(input:completion:)`

Retrieves information about the history and status of each channel for an application.

``` swift
public func getChannels(input: GetChannelsInput, completion: @escaping (ClientRuntime.SdkResult<GetChannelsOutputResponse, GetChannelsOutputError>) -> Void)
```

### `getEmailChannel(input:completion:)`

Retrieves information about the status and settings of the email channel for an application.

``` swift
public func getEmailChannel(input: GetEmailChannelInput, completion: @escaping (ClientRuntime.SdkResult<GetEmailChannelOutputResponse, GetEmailChannelOutputError>) -> Void)
```

### `getEmailTemplate(input:completion:)`

Retrieves the content and settings of a message template for messages that are sent through the email channel.

``` swift
public func getEmailTemplate(input: GetEmailTemplateInput, completion: @escaping (ClientRuntime.SdkResult<GetEmailTemplateOutputResponse, GetEmailTemplateOutputError>) -> Void)
```

### `getEndpoint(input:completion:)`

Retrieves information about the settings and attributes of a specific endpoint for an application.

``` swift
public func getEndpoint(input: GetEndpointInput, completion: @escaping (ClientRuntime.SdkResult<GetEndpointOutputResponse, GetEndpointOutputError>) -> Void)
```

### `getEventStream(input:completion:)`

Retrieves information about the event stream settings for an application.

``` swift
public func getEventStream(input: GetEventStreamInput, completion: @escaping (ClientRuntime.SdkResult<GetEventStreamOutputResponse, GetEventStreamOutputError>) -> Void)
```

### `getExportJob(input:completion:)`

Retrieves information about the status and settings of a specific export job for an application.

``` swift
public func getExportJob(input: GetExportJobInput, completion: @escaping (ClientRuntime.SdkResult<GetExportJobOutputResponse, GetExportJobOutputError>) -> Void)
```

### `getExportJobs(input:completion:)`

Retrieves information about the status and settings of all the export jobs for an application.

``` swift
public func getExportJobs(input: GetExportJobsInput, completion: @escaping (ClientRuntime.SdkResult<GetExportJobsOutputResponse, GetExportJobsOutputError>) -> Void)
```

### `getGcmChannel(input:completion:)`

Retrieves information about the status and settings of the GCM channel for an application.

``` swift
public func getGcmChannel(input: GetGcmChannelInput, completion: @escaping (ClientRuntime.SdkResult<GetGcmChannelOutputResponse, GetGcmChannelOutputError>) -> Void)
```

### `getImportJob(input:completion:)`

Retrieves information about the status and settings of a specific import job for an application.

``` swift
public func getImportJob(input: GetImportJobInput, completion: @escaping (ClientRuntime.SdkResult<GetImportJobOutputResponse, GetImportJobOutputError>) -> Void)
```

### `getImportJobs(input:completion:)`

Retrieves information about the status and settings of all the import jobs for an application.

``` swift
public func getImportJobs(input: GetImportJobsInput, completion: @escaping (ClientRuntime.SdkResult<GetImportJobsOutputResponse, GetImportJobsOutputError>) -> Void)
```

### `getInAppMessages(input:completion:)`

Retrieves the in-app messages targeted for the provided endpoint ID.

``` swift
public func getInAppMessages(input: GetInAppMessagesInput, completion: @escaping (ClientRuntime.SdkResult<GetInAppMessagesOutputResponse, GetInAppMessagesOutputError>) -> Void)
```

### `getInAppTemplate(input:completion:)`

Retrieves the content and settings of a message template for messages sent through the in-app channel.

``` swift
public func getInAppTemplate(input: GetInAppTemplateInput, completion: @escaping (ClientRuntime.SdkResult<GetInAppTemplateOutputResponse, GetInAppTemplateOutputError>) -> Void)
```

### `getJourney(input:completion:)`

Retrieves information about the status, configuration, and other settings for a journey.

``` swift
public func getJourney(input: GetJourneyInput, completion: @escaping (ClientRuntime.SdkResult<GetJourneyOutputResponse, GetJourneyOutputError>) -> Void)
```

### `getJourneyDateRangeKpi(input:completion:)`

Retrieves (queries) pre-aggregated data for a standard engagement metric that applies to a journey.

``` swift
public func getJourneyDateRangeKpi(input: GetJourneyDateRangeKpiInput, completion: @escaping (ClientRuntime.SdkResult<GetJourneyDateRangeKpiOutputResponse, GetJourneyDateRangeKpiOutputError>) -> Void)
```

### `getJourneyExecutionActivityMetrics(input:completion:)`

Retrieves (queries) pre-aggregated data for a standard execution metric that applies to a journey activity.

``` swift
public func getJourneyExecutionActivityMetrics(input: GetJourneyExecutionActivityMetricsInput, completion: @escaping (ClientRuntime.SdkResult<GetJourneyExecutionActivityMetricsOutputResponse, GetJourneyExecutionActivityMetricsOutputError>) -> Void)
```

### `getJourneyExecutionMetrics(input:completion:)`

Retrieves (queries) pre-aggregated data for a standard execution metric that applies to a journey.

``` swift
public func getJourneyExecutionMetrics(input: GetJourneyExecutionMetricsInput, completion: @escaping (ClientRuntime.SdkResult<GetJourneyExecutionMetricsOutputResponse, GetJourneyExecutionMetricsOutputError>) -> Void)
```

### `getPushTemplate(input:completion:)`

Retrieves the content and settings of a message template for messages that are sent through a push notification channel.

``` swift
public func getPushTemplate(input: GetPushTemplateInput, completion: @escaping (ClientRuntime.SdkResult<GetPushTemplateOutputResponse, GetPushTemplateOutputError>) -> Void)
```

### `getRecommenderConfiguration(input:completion:)`

Retrieves information about an Amazon Pinpoint configuration for a recommender model.

``` swift
public func getRecommenderConfiguration(input: GetRecommenderConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetRecommenderConfigurationOutputResponse, GetRecommenderConfigurationOutputError>) -> Void)
```

### `getRecommenderConfigurations(input:completion:)`

Retrieves information about all the recommender model configurations that are associated with your Amazon Pinpoint account.

``` swift
public func getRecommenderConfigurations(input: GetRecommenderConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<GetRecommenderConfigurationsOutputResponse, GetRecommenderConfigurationsOutputError>) -> Void)
```

### `getSegment(input:completion:)`

Retrieves information about the configuration, dimension, and other settings for a specific segment that's associated with an application.

``` swift
public func getSegment(input: GetSegmentInput, completion: @escaping (ClientRuntime.SdkResult<GetSegmentOutputResponse, GetSegmentOutputError>) -> Void)
```

### `getSegmentExportJobs(input:completion:)`

Retrieves information about the status and settings of the export jobs for a segment.

``` swift
public func getSegmentExportJobs(input: GetSegmentExportJobsInput, completion: @escaping (ClientRuntime.SdkResult<GetSegmentExportJobsOutputResponse, GetSegmentExportJobsOutputError>) -> Void)
```

### `getSegmentImportJobs(input:completion:)`

Retrieves information about the status and settings of the import jobs for a segment.

``` swift
public func getSegmentImportJobs(input: GetSegmentImportJobsInput, completion: @escaping (ClientRuntime.SdkResult<GetSegmentImportJobsOutputResponse, GetSegmentImportJobsOutputError>) -> Void)
```

### `getSegmentVersion(input:completion:)`

Retrieves information about the configuration, dimension, and other settings for a specific version of a segment that's associated with an application.

``` swift
public func getSegmentVersion(input: GetSegmentVersionInput, completion: @escaping (ClientRuntime.SdkResult<GetSegmentVersionOutputResponse, GetSegmentVersionOutputError>) -> Void)
```

### `getSegmentVersions(input:completion:)`

Retrieves information about the configuration, dimension, and other settings for all the versions of a specific segment that's associated with an application.

``` swift
public func getSegmentVersions(input: GetSegmentVersionsInput, completion: @escaping (ClientRuntime.SdkResult<GetSegmentVersionsOutputResponse, GetSegmentVersionsOutputError>) -> Void)
```

### `getSegments(input:completion:)`

Retrieves information about the configuration, dimension, and other settings for all the segments that are associated with an application.

``` swift
public func getSegments(input: GetSegmentsInput, completion: @escaping (ClientRuntime.SdkResult<GetSegmentsOutputResponse, GetSegmentsOutputError>) -> Void)
```

### `getSmsChannel(input:completion:)`

Retrieves information about the status and settings of the SMS channel for an application.

``` swift
public func getSmsChannel(input: GetSmsChannelInput, completion: @escaping (ClientRuntime.SdkResult<GetSmsChannelOutputResponse, GetSmsChannelOutputError>) -> Void)
```

### `getSmsTemplate(input:completion:)`

Retrieves the content and settings of a message template for messages that are sent through the SMS channel.

``` swift
public func getSmsTemplate(input: GetSmsTemplateInput, completion: @escaping (ClientRuntime.SdkResult<GetSmsTemplateOutputResponse, GetSmsTemplateOutputError>) -> Void)
```

### `getUserEndpoints(input:completion:)`

Retrieves information about all the endpoints that are associated with a specific user ID.

``` swift
public func getUserEndpoints(input: GetUserEndpointsInput, completion: @escaping (ClientRuntime.SdkResult<GetUserEndpointsOutputResponse, GetUserEndpointsOutputError>) -> Void)
```

### `getVoiceChannel(input:completion:)`

Retrieves information about the status and settings of the voice channel for an application.

``` swift
public func getVoiceChannel(input: GetVoiceChannelInput, completion: @escaping (ClientRuntime.SdkResult<GetVoiceChannelOutputResponse, GetVoiceChannelOutputError>) -> Void)
```

### `getVoiceTemplate(input:completion:)`

Retrieves the content and settings of a message template for messages that are sent through the voice channel.

``` swift
public func getVoiceTemplate(input: GetVoiceTemplateInput, completion: @escaping (ClientRuntime.SdkResult<GetVoiceTemplateOutputResponse, GetVoiceTemplateOutputError>) -> Void)
```

### `listJourneys(input:completion:)`

Retrieves information about the status, configuration, and other settings for all the journeys that are associated with an application.

``` swift
public func listJourneys(input: ListJourneysInput, completion: @escaping (ClientRuntime.SdkResult<ListJourneysOutputResponse, ListJourneysOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Retrieves all the tags (keys and values) that are associated with an application, campaign, message template, or segment.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `listTemplateVersions(input:completion:)`

Retrieves information about all the versions of a specific message template.

``` swift
public func listTemplateVersions(input: ListTemplateVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListTemplateVersionsOutputResponse, ListTemplateVersionsOutputError>) -> Void)
```

### `listTemplates(input:completion:)`

Retrieves information about all the message templates that are associated with your Amazon Pinpoint account.

``` swift
public func listTemplates(input: ListTemplatesInput, completion: @escaping (ClientRuntime.SdkResult<ListTemplatesOutputResponse, ListTemplatesOutputError>) -> Void)
```

### `phoneNumberValidate(input:completion:)`

Retrieves information about a phone number.

``` swift
public func phoneNumberValidate(input: PhoneNumberValidateInput, completion: @escaping (ClientRuntime.SdkResult<PhoneNumberValidateOutputResponse, PhoneNumberValidateOutputError>) -> Void)
```

### `putEventStream(input:completion:)`

Creates a new event stream for an application or updates the settings of an existing event stream for an application.

``` swift
public func putEventStream(input: PutEventStreamInput, completion: @escaping (ClientRuntime.SdkResult<PutEventStreamOutputResponse, PutEventStreamOutputError>) -> Void)
```

### `putEvents(input:completion:)`

Creates a new event to record for endpoints, or creates or updates endpoint data that existing events are associated with.

``` swift
public func putEvents(input: PutEventsInput, completion: @escaping (ClientRuntime.SdkResult<PutEventsOutputResponse, PutEventsOutputError>) -> Void)
```

### `removeAttributes(input:completion:)`

Removes one or more attributes, of the same attribute type, from all the endpoints that are associated with an application.

``` swift
public func removeAttributes(input: RemoveAttributesInput, completion: @escaping (ClientRuntime.SdkResult<RemoveAttributesOutputResponse, RemoveAttributesOutputError>) -> Void)
```

### `sendMessages(input:completion:)`

Creates and sends a direct message.

``` swift
public func sendMessages(input: SendMessagesInput, completion: @escaping (ClientRuntime.SdkResult<SendMessagesOutputResponse, SendMessagesOutputError>) -> Void)
```

### `sendUsersMessages(input:completion:)`

Creates and sends a message to a list of users.

``` swift
public func sendUsersMessages(input: SendUsersMessagesInput, completion: @escaping (ClientRuntime.SdkResult<SendUsersMessagesOutputResponse, SendUsersMessagesOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Adds one or more tags (keys and values) to an application, campaign, message template, or segment.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes one or more tags (keys and values) from an application, campaign, message template, or segment.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateAdmChannel(input:completion:)`

Enables the ADM channel for an application or updates the status and settings of the ADM channel for an application.

``` swift
public func updateAdmChannel(input: UpdateAdmChannelInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAdmChannelOutputResponse, UpdateAdmChannelOutputError>) -> Void)
```

### `updateApnsChannel(input:completion:)`

Enables the APNs channel for an application or updates the status and settings of the APNs channel for an application.

``` swift
public func updateApnsChannel(input: UpdateApnsChannelInput, completion: @escaping (ClientRuntime.SdkResult<UpdateApnsChannelOutputResponse, UpdateApnsChannelOutputError>) -> Void)
```

### `updateApnsSandboxChannel(input:completion:)`

Enables the APNs sandbox channel for an application or updates the status and settings of the APNs sandbox channel for an application.

``` swift
public func updateApnsSandboxChannel(input: UpdateApnsSandboxChannelInput, completion: @escaping (ClientRuntime.SdkResult<UpdateApnsSandboxChannelOutputResponse, UpdateApnsSandboxChannelOutputError>) -> Void)
```

### `updateApnsVoipChannel(input:completion:)`

Enables the APNs VoIP channel for an application or updates the status and settings of the APNs VoIP channel for an application.

``` swift
public func updateApnsVoipChannel(input: UpdateApnsVoipChannelInput, completion: @escaping (ClientRuntime.SdkResult<UpdateApnsVoipChannelOutputResponse, UpdateApnsVoipChannelOutputError>) -> Void)
```

### `updateApnsVoipSandboxChannel(input:completion:)`

Enables the APNs VoIP sandbox channel for an application or updates the status and settings of the APNs VoIP sandbox channel for an application.

``` swift
public func updateApnsVoipSandboxChannel(input: UpdateApnsVoipSandboxChannelInput, completion: @escaping (ClientRuntime.SdkResult<UpdateApnsVoipSandboxChannelOutputResponse, UpdateApnsVoipSandboxChannelOutputError>) -> Void)
```

### `updateApplicationSettings(input:completion:)`

Updates the settings for an application.

``` swift
public func updateApplicationSettings(input: UpdateApplicationSettingsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateApplicationSettingsOutputResponse, UpdateApplicationSettingsOutputError>) -> Void)
```

### `updateBaiduChannel(input:completion:)`

Enables the Baidu channel for an application or updates the status and settings of the Baidu channel for an application.

``` swift
public func updateBaiduChannel(input: UpdateBaiduChannelInput, completion: @escaping (ClientRuntime.SdkResult<UpdateBaiduChannelOutputResponse, UpdateBaiduChannelOutputError>) -> Void)
```

### `updateCampaign(input:completion:)`

Updates the configuration and other settings for a campaign.

``` swift
public func updateCampaign(input: UpdateCampaignInput, completion: @escaping (ClientRuntime.SdkResult<UpdateCampaignOutputResponse, UpdateCampaignOutputError>) -> Void)
```

### `updateEmailChannel(input:completion:)`

Enables the email channel for an application or updates the status and settings of the email channel for an application.

``` swift
public func updateEmailChannel(input: UpdateEmailChannelInput, completion: @escaping (ClientRuntime.SdkResult<UpdateEmailChannelOutputResponse, UpdateEmailChannelOutputError>) -> Void)
```

### `updateEmailTemplate(input:completion:)`

Updates an existing message template for messages that are sent through the email channel.

``` swift
public func updateEmailTemplate(input: UpdateEmailTemplateInput, completion: @escaping (ClientRuntime.SdkResult<UpdateEmailTemplateOutputResponse, UpdateEmailTemplateOutputError>) -> Void)
```

### `updateEndpoint(input:completion:)`

Creates a new endpoint for an application or updates the settings and attributes of an existing endpoint for an application. You can also use this operation to define custom attributes for an endpoint. If an update includes one or more values for a custom attribute, Amazon Pinpoint replaces (overwrites) any existing values with the new values.

``` swift
public func updateEndpoint(input: UpdateEndpointInput, completion: @escaping (ClientRuntime.SdkResult<UpdateEndpointOutputResponse, UpdateEndpointOutputError>) -> Void)
```

### `updateEndpointsBatch(input:completion:)`

Creates a new batch of endpoints for an application or updates the settings and attributes of a batch of existing endpoints for an application. You can also use this operation to define custom attributes for a batch of endpoints. If an update includes one or more values for a custom attribute, Amazon Pinpoint replaces (overwrites) any existing values with the new values.

``` swift
public func updateEndpointsBatch(input: UpdateEndpointsBatchInput, completion: @escaping (ClientRuntime.SdkResult<UpdateEndpointsBatchOutputResponse, UpdateEndpointsBatchOutputError>) -> Void)
```

### `updateGcmChannel(input:completion:)`

Enables the GCM channel for an application or updates the status and settings of the GCM channel for an application.

``` swift
public func updateGcmChannel(input: UpdateGcmChannelInput, completion: @escaping (ClientRuntime.SdkResult<UpdateGcmChannelOutputResponse, UpdateGcmChannelOutputError>) -> Void)
```

### `updateInAppTemplate(input:completion:)`

Updates an existing message template for messages sent through the in-app message channel.

``` swift
public func updateInAppTemplate(input: UpdateInAppTemplateInput, completion: @escaping (ClientRuntime.SdkResult<UpdateInAppTemplateOutputResponse, UpdateInAppTemplateOutputError>) -> Void)
```

### `updateJourney(input:completion:)`

Updates the configuration and other settings for a journey.

``` swift
public func updateJourney(input: UpdateJourneyInput, completion: @escaping (ClientRuntime.SdkResult<UpdateJourneyOutputResponse, UpdateJourneyOutputError>) -> Void)
```

### `updateJourneyState(input:completion:)`

Cancels (stops) an active journey.

``` swift
public func updateJourneyState(input: UpdateJourneyStateInput, completion: @escaping (ClientRuntime.SdkResult<UpdateJourneyStateOutputResponse, UpdateJourneyStateOutputError>) -> Void)
```

### `updatePushTemplate(input:completion:)`

Updates an existing message template for messages that are sent through a push notification channel.

``` swift
public func updatePushTemplate(input: UpdatePushTemplateInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePushTemplateOutputResponse, UpdatePushTemplateOutputError>) -> Void)
```

### `updateRecommenderConfiguration(input:completion:)`

Updates an Amazon Pinpoint configuration for a recommender model.

``` swift
public func updateRecommenderConfiguration(input: UpdateRecommenderConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRecommenderConfigurationOutputResponse, UpdateRecommenderConfigurationOutputError>) -> Void)
```

### `updateSegment(input:completion:)`

Creates a new segment for an application or updates the configuration, dimension, and other settings for an existing segment that's associated with an application.

``` swift
public func updateSegment(input: UpdateSegmentInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSegmentOutputResponse, UpdateSegmentOutputError>) -> Void)
```

### `updateSmsChannel(input:completion:)`

Enables the SMS channel for an application or updates the status and settings of the SMS channel for an application.

``` swift
public func updateSmsChannel(input: UpdateSmsChannelInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSmsChannelOutputResponse, UpdateSmsChannelOutputError>) -> Void)
```

### `updateSmsTemplate(input:completion:)`

Updates an existing message template for messages that are sent through the SMS channel.

``` swift
public func updateSmsTemplate(input: UpdateSmsTemplateInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSmsTemplateOutputResponse, UpdateSmsTemplateOutputError>) -> Void)
```

### `updateTemplateActiveVersion(input:completion:)`

Changes the status of a specific version of a message template to active.

``` swift
public func updateTemplateActiveVersion(input: UpdateTemplateActiveVersionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateTemplateActiveVersionOutputResponse, UpdateTemplateActiveVersionOutputError>) -> Void)
```

### `updateVoiceChannel(input:completion:)`

Enables the voice channel for an application or updates the status and settings of the voice channel for an application.

``` swift
public func updateVoiceChannel(input: UpdateVoiceChannelInput, completion: @escaping (ClientRuntime.SdkResult<UpdateVoiceChannelOutputResponse, UpdateVoiceChannelOutputError>) -> Void)
```

### `updateVoiceTemplate(input:completion:)`

Updates an existing message template for messages that are sent through the voice channel.

``` swift
public func updateVoiceTemplate(input: UpdateVoiceTemplateInput, completion: @escaping (ClientRuntime.SdkResult<UpdateVoiceTemplateOutputResponse, UpdateVoiceTemplateOutputError>) -> Void)
```
