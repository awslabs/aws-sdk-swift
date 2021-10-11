# ConnectClient

``` swift
public class ConnectClient 
```

## Inheritance

[`ConnectClientProtocol`](/aws-sdk-swift/reference/0.x/AWSConnect/ConnectClientProtocol)

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

### `associateApprovedOrigin(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Associates an approved origin to an Amazon Connect instance.

``` swift
public func associateApprovedOrigin(input: AssociateApprovedOriginInput, completion: @escaping (ClientRuntime.SdkResult<AssociateApprovedOriginOutputResponse, AssociateApprovedOriginOutputError>) -> Void)
```

### `associateBot(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Allows the specified Amazon Connect instance to access the specified Amazon Lex or Amazon Lex V2 bot.

``` swift
public func associateBot(input: AssociateBotInput, completion: @escaping (ClientRuntime.SdkResult<AssociateBotOutputResponse, AssociateBotOutputError>) -> Void)
```

### `associateInstanceStorageConfig(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Associates a storage resource type for the first time. You can only associate one type of
storage configuration in a single call. This means, for example, that you can't define an
instance with multiple S3 buckets for storing chat transcripts.
This API does not create a resource that doesn't exist. It only associates it to the
instance. Ensure that the resource being specified in the storage configuration, like an S3
bucket, exists when being used for association.

``` swift
public func associateInstanceStorageConfig(input: AssociateInstanceStorageConfigInput, completion: @escaping (ClientRuntime.SdkResult<AssociateInstanceStorageConfigOutputResponse, AssociateInstanceStorageConfigOutputError>) -> Void)
```

### `associateLambdaFunction(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Allows the specified Amazon Connect instance to access the specified Lambda function.

``` swift
public func associateLambdaFunction(input: AssociateLambdaFunctionInput, completion: @escaping (ClientRuntime.SdkResult<AssociateLambdaFunctionOutputResponse, AssociateLambdaFunctionOutputError>) -> Void)
```

### `associateLexBot(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Allows the specified Amazon Connect instance to access the specified Amazon Lex bot.

``` swift
public func associateLexBot(input: AssociateLexBotInput, completion: @escaping (ClientRuntime.SdkResult<AssociateLexBotOutputResponse, AssociateLexBotOutputError>) -> Void)
```

### `associateQueueQuickConnects(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Associates a set of quick connects with a queue.

``` swift
public func associateQueueQuickConnects(input: AssociateQueueQuickConnectsInput, completion: @escaping (ClientRuntime.SdkResult<AssociateQueueQuickConnectsOutputResponse, AssociateQueueQuickConnectsOutputError>) -> Void)
```

### `associateRoutingProfileQueues(input:completion:)`

Associates a set of queues with a routing profile.

``` swift
public func associateRoutingProfileQueues(input: AssociateRoutingProfileQueuesInput, completion: @escaping (ClientRuntime.SdkResult<AssociateRoutingProfileQueuesOutputResponse, AssociateRoutingProfileQueuesOutputError>) -> Void)
```

### `associateSecurityKey(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Associates a security key to the instance.

``` swift
public func associateSecurityKey(input: AssociateSecurityKeyInput, completion: @escaping (ClientRuntime.SdkResult<AssociateSecurityKeyOutputResponse, AssociateSecurityKeyOutputError>) -> Void)
```

### `createAgentStatus(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Creates an agent status for the specified Amazon Connect instance.

``` swift
public func createAgentStatus(input: CreateAgentStatusInput, completion: @escaping (ClientRuntime.SdkResult<CreateAgentStatusOutputResponse, CreateAgentStatusOutputError>) -> Void)
```

### `createContactFlow(input:completion:)`

Creates a contact flow for the specified Amazon Connect instance.
You can also create and update contact flows using the <a href="https:​//docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon Connect
Flow language.

``` swift
public func createContactFlow(input: CreateContactFlowInput, completion: @escaping (ClientRuntime.SdkResult<CreateContactFlowOutputResponse, CreateContactFlowOutputError>) -> Void)
```

### `createHoursOfOperation(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Creates hours of operation.

``` swift
public func createHoursOfOperation(input: CreateHoursOfOperationInput, completion: @escaping (ClientRuntime.SdkResult<CreateHoursOfOperationOutputResponse, CreateHoursOfOperationOutputError>) -> Void)
```

### `createInstance(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Initiates an Amazon Connect instance with all the supported channels enabled. It does not attach any
storage, such as Amazon Simple Storage Service (Amazon S3) or Amazon Kinesis. It also does not
allow for any configurations on features, such as Contact Lens for Amazon Connect.
Amazon Connect enforces a limit on the total number of instances that you can create or delete in 30 days.
If you exceed this limit, you will get an error message indicating there has been an excessive number of attempts at creating or deleting instances.
You must wait 30 days before you can restart creating and deleting instances in your account.

``` swift
public func createInstance(input: CreateInstanceInput, completion: @escaping (ClientRuntime.SdkResult<CreateInstanceOutputResponse, CreateInstanceOutputError>) -> Void)
```

### `createIntegrationAssociation(input:completion:)`

Creates an AWS resource association with an Amazon Connect instance.

``` swift
public func createIntegrationAssociation(input: CreateIntegrationAssociationInput, completion: @escaping (ClientRuntime.SdkResult<CreateIntegrationAssociationOutputResponse, CreateIntegrationAssociationOutputError>) -> Void)
```

### `createQueue(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Creates a new queue for the specified Amazon Connect instance.

``` swift
public func createQueue(input: CreateQueueInput, completion: @escaping (ClientRuntime.SdkResult<CreateQueueOutputResponse, CreateQueueOutputError>) -> Void)
```

### `createQuickConnect(input:completion:)`

Creates a quick connect for the specified Amazon Connect instance.

``` swift
public func createQuickConnect(input: CreateQuickConnectInput, completion: @escaping (ClientRuntime.SdkResult<CreateQuickConnectOutputResponse, CreateQuickConnectOutputError>) -> Void)
```

### `createRoutingProfile(input:completion:)`

Creates a new routing profile.

``` swift
public func createRoutingProfile(input: CreateRoutingProfileInput, completion: @escaping (ClientRuntime.SdkResult<CreateRoutingProfileOutputResponse, CreateRoutingProfileOutputError>) -> Void)
```

### `createUseCase(input:completion:)`

Creates a use case for an integration association.

``` swift
public func createUseCase(input: CreateUseCaseInput, completion: @escaping (ClientRuntime.SdkResult<CreateUseCaseOutputResponse, CreateUseCaseOutputError>) -> Void)
```

### `createUser(input:completion:)`

Creates a user account for the specified Amazon Connect instance.
For information about how to create user accounts using the Amazon Connect console, see <a href="https:​//docs.aws.amazon.com/connect/latest/adminguide/user-management.html">Add Users in
the Amazon Connect Administrator Guide.

``` swift
public func createUser(input: CreateUserInput, completion: @escaping (ClientRuntime.SdkResult<CreateUserOutputResponse, CreateUserOutputError>) -> Void)
```

### `createUserHierarchyGroup(input:completion:)`

Creates a new user hierarchy group.

``` swift
public func createUserHierarchyGroup(input: CreateUserHierarchyGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateUserHierarchyGroupOutputResponse, CreateUserHierarchyGroupOutputError>) -> Void)
```

### `deleteHoursOfOperation(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Deletes an hours of operation.

``` swift
public func deleteHoursOfOperation(input: DeleteHoursOfOperationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteHoursOfOperationOutputResponse, DeleteHoursOfOperationOutputError>) -> Void)
```

### `deleteInstance(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Deletes the Amazon Connect instance.
Amazon Connect enforces a limit on the total number of instances that you can create or delete in 30 days.
If you exceed this limit, you will get an error message indicating there has been an excessive number of attempts at creating or deleting instances.
You must wait 30 days before you can restart creating and deleting instances in your account.

``` swift
public func deleteInstance(input: DeleteInstanceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteInstanceOutputResponse, DeleteInstanceOutputError>) -> Void)
```

### `deleteIntegrationAssociation(input:completion:)`

Deletes an AWS resource association from an Amazon Connect instance. The association must not have
any use cases associated with it.

``` swift
public func deleteIntegrationAssociation(input: DeleteIntegrationAssociationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteIntegrationAssociationOutputResponse, DeleteIntegrationAssociationOutputError>) -> Void)
```

### `deleteQuickConnect(input:completion:)`

Deletes a quick connect.

``` swift
public func deleteQuickConnect(input: DeleteQuickConnectInput, completion: @escaping (ClientRuntime.SdkResult<DeleteQuickConnectOutputResponse, DeleteQuickConnectOutputError>) -> Void)
```

### `deleteUseCase(input:completion:)`

Deletes a use case from an integration association.

``` swift
public func deleteUseCase(input: DeleteUseCaseInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUseCaseOutputResponse, DeleteUseCaseOutputError>) -> Void)
```

### `deleteUser(input:completion:)`

Deletes a user account from the specified Amazon Connect instance.
For information about what happens to a user's data when their account is deleted, see
<a href="https:​//docs.aws.amazon.com/connect/latest/adminguide/delete-users.html">Delete Users from
Your Amazon Connect Instance in the Amazon Connect Administrator Guide.

``` swift
public func deleteUser(input: DeleteUserInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUserOutputResponse, DeleteUserOutputError>) -> Void)
```

### `deleteUserHierarchyGroup(input:completion:)`

Deletes an existing user hierarchy group. It must not be associated with any agents or have
any active child groups.

``` swift
public func deleteUserHierarchyGroup(input: DeleteUserHierarchyGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUserHierarchyGroupOutputResponse, DeleteUserHierarchyGroupOutputError>) -> Void)
```

### `describeAgentStatus(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Describes an agent status.

``` swift
public func describeAgentStatus(input: DescribeAgentStatusInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAgentStatusOutputResponse, DescribeAgentStatusOutputError>) -> Void)
```

### `describeContactFlow(input:completion:)`

Describes the specified contact flow.
You can also create and update contact flows using the <a href="https:​//docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon Connect
Flow language.

``` swift
public func describeContactFlow(input: DescribeContactFlowInput, completion: @escaping (ClientRuntime.SdkResult<DescribeContactFlowOutputResponse, DescribeContactFlowOutputError>) -> Void)
```

### `describeHoursOfOperation(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Describes the hours of operation.

``` swift
public func describeHoursOfOperation(input: DescribeHoursOfOperationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeHoursOfOperationOutputResponse, DescribeHoursOfOperationOutputError>) -> Void)
```

### `describeInstance(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Returns the current state of the specified instance identifier. It tracks the instance while
it is being created and returns an error status, if applicable.
If an instance is not created successfully, the instance status reason field returns details
relevant to the reason. The instance in a failed state is returned only for 24 hours after the
CreateInstance API was invoked.

``` swift
public func describeInstance(input: DescribeInstanceInput, completion: @escaping (ClientRuntime.SdkResult<DescribeInstanceOutputResponse, DescribeInstanceOutputError>) -> Void)
```

### `describeInstanceAttribute(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Describes the specified instance attribute.

``` swift
public func describeInstanceAttribute(input: DescribeInstanceAttributeInput, completion: @escaping (ClientRuntime.SdkResult<DescribeInstanceAttributeOutputResponse, DescribeInstanceAttributeOutputError>) -> Void)
```

### `describeInstanceStorageConfig(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Retrieves the current storage configurations for the specified resource type, association
ID, and instance ID.

``` swift
public func describeInstanceStorageConfig(input: DescribeInstanceStorageConfigInput, completion: @escaping (ClientRuntime.SdkResult<DescribeInstanceStorageConfigOutputResponse, DescribeInstanceStorageConfigOutputError>) -> Void)
```

### `describeQueue(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Describes the specified queue.

``` swift
public func describeQueue(input: DescribeQueueInput, completion: @escaping (ClientRuntime.SdkResult<DescribeQueueOutputResponse, DescribeQueueOutputError>) -> Void)
```

### `describeQuickConnect(input:completion:)`

Describes the quick connect.

``` swift
public func describeQuickConnect(input: DescribeQuickConnectInput, completion: @escaping (ClientRuntime.SdkResult<DescribeQuickConnectOutputResponse, DescribeQuickConnectOutputError>) -> Void)
```

### `describeRoutingProfile(input:completion:)`

Describes the specified routing profile.

``` swift
public func describeRoutingProfile(input: DescribeRoutingProfileInput, completion: @escaping (ClientRuntime.SdkResult<DescribeRoutingProfileOutputResponse, DescribeRoutingProfileOutputError>) -> Void)
```

### `describeUser(input:completion:)`

Describes the specified user account. You can find the instance ID in the console (it’s the
final part of the ARN). The console does not display the user IDs. Instead, list the users and
note the IDs provided in the output.

``` swift
public func describeUser(input: DescribeUserInput, completion: @escaping (ClientRuntime.SdkResult<DescribeUserOutputResponse, DescribeUserOutputError>) -> Void)
```

### `describeUserHierarchyGroup(input:completion:)`

Describes the specified hierarchy group.

``` swift
public func describeUserHierarchyGroup(input: DescribeUserHierarchyGroupInput, completion: @escaping (ClientRuntime.SdkResult<DescribeUserHierarchyGroupOutputResponse, DescribeUserHierarchyGroupOutputError>) -> Void)
```

### `describeUserHierarchyStructure(input:completion:)`

Describes the hierarchy structure of the specified Amazon Connect instance.

``` swift
public func describeUserHierarchyStructure(input: DescribeUserHierarchyStructureInput, completion: @escaping (ClientRuntime.SdkResult<DescribeUserHierarchyStructureOutputResponse, DescribeUserHierarchyStructureOutputError>) -> Void)
```

### `disassociateApprovedOrigin(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Revokes access to integrated applications from Amazon Connect.

``` swift
public func disassociateApprovedOrigin(input: DisassociateApprovedOriginInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateApprovedOriginOutputResponse, DisassociateApprovedOriginOutputError>) -> Void)
```

### `disassociateBot(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Revokes authorization from the specified instance to access the specified Amazon Lex or Amazon Lex V2
bot.

``` swift
public func disassociateBot(input: DisassociateBotInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateBotOutputResponse, DisassociateBotOutputError>) -> Void)
```

### `disassociateInstanceStorageConfig(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Removes the storage type configurations for the specified resource type and association
ID.

``` swift
public func disassociateInstanceStorageConfig(input: DisassociateInstanceStorageConfigInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateInstanceStorageConfigOutputResponse, DisassociateInstanceStorageConfigOutputError>) -> Void)
```

### `disassociateLambdaFunction(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Remove the Lambda function from the dropdown options available in the relevant contact flow
blocks.

``` swift
public func disassociateLambdaFunction(input: DisassociateLambdaFunctionInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateLambdaFunctionOutputResponse, DisassociateLambdaFunctionOutputError>) -> Void)
```

### `disassociateLexBot(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Revokes authorization from the specified instance to access the specified Amazon Lex bot.

``` swift
public func disassociateLexBot(input: DisassociateLexBotInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateLexBotOutputResponse, DisassociateLexBotOutputError>) -> Void)
```

### `disassociateQueueQuickConnects(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Disassociates a set of quick connects from a queue.

``` swift
public func disassociateQueueQuickConnects(input: DisassociateQueueQuickConnectsInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateQueueQuickConnectsOutputResponse, DisassociateQueueQuickConnectsOutputError>) -> Void)
```

### `disassociateRoutingProfileQueues(input:completion:)`

Disassociates a set of queues from a routing profile.

``` swift
public func disassociateRoutingProfileQueues(input: DisassociateRoutingProfileQueuesInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateRoutingProfileQueuesOutputResponse, DisassociateRoutingProfileQueuesOutputError>) -> Void)
```

### `disassociateSecurityKey(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Deletes the specified security key.

``` swift
public func disassociateSecurityKey(input: DisassociateSecurityKeyInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateSecurityKeyOutputResponse, DisassociateSecurityKeyOutputError>) -> Void)
```

### `getContactAttributes(input:completion:)`

Retrieves the contact attributes for the specified contact.

``` swift
public func getContactAttributes(input: GetContactAttributesInput, completion: @escaping (ClientRuntime.SdkResult<GetContactAttributesOutputResponse, GetContactAttributesOutputError>) -> Void)
```

### `getCurrentMetricData(input:completion:)`

Gets the real-time metric data from the specified Amazon Connect instance.
For a description of each metric, see <a href="https:​//docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html">Real-time Metrics
Definitions in the Amazon Connect Administrator Guide.

``` swift
public func getCurrentMetricData(input: GetCurrentMetricDataInput, completion: @escaping (ClientRuntime.SdkResult<GetCurrentMetricDataOutputResponse, GetCurrentMetricDataOutputError>) -> Void)
```

### `getFederationToken(input:completion:)`

Retrieves a token for federation.

``` swift
public func getFederationToken(input: GetFederationTokenInput, completion: @escaping (ClientRuntime.SdkResult<GetFederationTokenOutputResponse, GetFederationTokenOutputError>) -> Void)
```

``` 
        This API doesn't support root users. If you try to invoke GetFederationToken with root
credentials, an error message similar to the following one appears:

           Provided identity: Principal: .... User: .... cannot be used for federation with
 Amazon Connect
```

### `getMetricData(input:completion:)`

Gets historical metric data from the specified Amazon Connect instance.

``` swift
public func getMetricData(input: GetMetricDataInput, completion: @escaping (ClientRuntime.SdkResult<GetMetricDataOutputResponse, GetMetricDataOutputError>) -> Void)
```

``` 
     For a description of each historical metric, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/historical-metrics-definitions.html">Historical Metrics
Definitions in the Amazon Connect Administrator Guide.
```

### `listAgentStatuses(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Lists agent statuses.

``` swift
public func listAgentStatuses(input: ListAgentStatusesInput, completion: @escaping (ClientRuntime.SdkResult<ListAgentStatusesOutputResponse, ListAgentStatusesOutputError>) -> Void)
```

### `listApprovedOrigins(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Returns a paginated list of all approved origins associated with the instance.

``` swift
public func listApprovedOrigins(input: ListApprovedOriginsInput, completion: @escaping (ClientRuntime.SdkResult<ListApprovedOriginsOutputResponse, ListApprovedOriginsOutputError>) -> Void)
```

### `listBots(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
For the specified version of Amazon Lex, returns a paginated list of all the Amazon Lex bots currently associated with the
instance.

``` swift
public func listBots(input: ListBotsInput, completion: @escaping (ClientRuntime.SdkResult<ListBotsOutputResponse, ListBotsOutputError>) -> Void)
```

### `listContactFlows(input:completion:)`

Provides information about the contact flows for the specified Amazon Connect instance.
You can also create and update contact flows using the <a href="https:​//docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon Connect
Flow language.
For more information about contact flows, see <a href="https:​//docs.aws.amazon.com/connect/latest/adminguide/concepts-contact-flows.html">Contact Flows in the
Amazon Connect Administrator Guide.

``` swift
public func listContactFlows(input: ListContactFlowsInput, completion: @escaping (ClientRuntime.SdkResult<ListContactFlowsOutputResponse, ListContactFlowsOutputError>) -> Void)
```

### `listHoursOfOperations(input:completion:)`

Provides information about the hours of operation for the specified Amazon Connect instance.
For more information about hours of operation, see <a href="https:​//docs.aws.amazon.com/connect/latest/adminguide/set-hours-operation.html">Set the Hours of Operation for a
Queue in the Amazon Connect Administrator Guide.

``` swift
public func listHoursOfOperations(input: ListHoursOfOperationsInput, completion: @escaping (ClientRuntime.SdkResult<ListHoursOfOperationsOutputResponse, ListHoursOfOperationsOutputError>) -> Void)
```

### `listInstanceAttributes(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Returns a paginated list of all attribute types for the given instance.

``` swift
public func listInstanceAttributes(input: ListInstanceAttributesInput, completion: @escaping (ClientRuntime.SdkResult<ListInstanceAttributesOutputResponse, ListInstanceAttributesOutputError>) -> Void)
```

### `listInstanceStorageConfigs(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.

``` swift
public func listInstanceStorageConfigs(input: ListInstanceStorageConfigsInput, completion: @escaping (ClientRuntime.SdkResult<ListInstanceStorageConfigsOutputResponse, ListInstanceStorageConfigsOutputError>) -> Void)
```

``` 
     Returns a paginated list of storage configs for the identified instance and resource
```

type.

### `listInstances(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Return a list of instances which are in active state, creation-in-progress state, and failed
state. Instances that aren't successfully created (they are in a failed state) are returned only
for 24 hours after the CreateInstance API was invoked.

``` swift
public func listInstances(input: ListInstancesInput, completion: @escaping (ClientRuntime.SdkResult<ListInstancesOutputResponse, ListInstancesOutputError>) -> Void)
```

### `listIntegrationAssociations(input:completion:)`

Provides summary information about the AWS resource associations for the specified Amazon Connect
instance.

``` swift
public func listIntegrationAssociations(input: ListIntegrationAssociationsInput, completion: @escaping (ClientRuntime.SdkResult<ListIntegrationAssociationsOutputResponse, ListIntegrationAssociationsOutputError>) -> Void)
```

### `listLambdaFunctions(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Returns a paginated list of all Lambda functions that display in the dropdown options in the
relevant contact flow blocks.

``` swift
public func listLambdaFunctions(input: ListLambdaFunctionsInput, completion: @escaping (ClientRuntime.SdkResult<ListLambdaFunctionsOutputResponse, ListLambdaFunctionsOutputError>) -> Void)
```

### `listLexBots(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Returns a paginated list of all the Amazon Lex bots currently associated with the
instance.

``` swift
public func listLexBots(input: ListLexBotsInput, completion: @escaping (ClientRuntime.SdkResult<ListLexBotsOutputResponse, ListLexBotsOutputError>) -> Void)
```

### `listPhoneNumbers(input:completion:)`

Provides information about the phone numbers for the specified Amazon Connect instance.
For more information about phone numbers, see <a href="https:​//docs.aws.amazon.com/connect/latest/adminguide/contact-center-phone-number.html">Set Up Phone Numbers for Your
Contact Center in the Amazon Connect Administrator Guide.

``` swift
public func listPhoneNumbers(input: ListPhoneNumbersInput, completion: @escaping (ClientRuntime.SdkResult<ListPhoneNumbersOutputResponse, ListPhoneNumbersOutputError>) -> Void)
```

### `listPrompts(input:completion:)`

Provides information about the prompts for the specified Amazon Connect instance.

``` swift
public func listPrompts(input: ListPromptsInput, completion: @escaping (ClientRuntime.SdkResult<ListPromptsOutputResponse, ListPromptsOutputError>) -> Void)
```

### `listQueueQuickConnects(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Lists the quick connects associated with a queue.

``` swift
public func listQueueQuickConnects(input: ListQueueQuickConnectsInput, completion: @escaping (ClientRuntime.SdkResult<ListQueueQuickConnectsOutputResponse, ListQueueQuickConnectsOutputError>) -> Void)
```

### `listQueues(input:completion:)`

Provides information about the queues for the specified Amazon Connect instance.
If you do not specify a QueueTypes
parameter, both standard and agent queues are returned. This might cause an unexpected truncation
of results if you have more than 1000 agents and you limit the number of results of the API call
in code.
For more information about queues, see <a href="https:​//docs.aws.amazon.com/connect/latest/adminguide/concepts-queues-standard-and-agent.html">Queues:​ Standard and
Agent in the Amazon Connect Administrator Guide.

``` swift
public func listQueues(input: ListQueuesInput, completion: @escaping (ClientRuntime.SdkResult<ListQueuesOutputResponse, ListQueuesOutputError>) -> Void)
```

### `listQuickConnects(input:completion:)`

Provides information about the quick connects for the specified Amazon Connect instance.

``` swift
public func listQuickConnects(input: ListQuickConnectsInput, completion: @escaping (ClientRuntime.SdkResult<ListQuickConnectsOutputResponse, ListQuickConnectsOutputError>) -> Void)
```

### `listRoutingProfileQueues(input:completion:)`

Lists the queues associated with a routing profile.

``` swift
public func listRoutingProfileQueues(input: ListRoutingProfileQueuesInput, completion: @escaping (ClientRuntime.SdkResult<ListRoutingProfileQueuesOutputResponse, ListRoutingProfileQueuesOutputError>) -> Void)
```

### `listRoutingProfiles(input:completion:)`

Provides summary information about the routing profiles for the specified Amazon Connect
instance.
For more information about routing profiles, see <a href="https:​//docs.aws.amazon.com/connect/latest/adminguide/concepts-routing.html">Routing Profiles and <a href="https:​//docs.aws.amazon.com/connect/latest/adminguide/routing-profiles.html">Create a Routing
Profile in the Amazon Connect Administrator Guide.

``` swift
public func listRoutingProfiles(input: ListRoutingProfilesInput, completion: @escaping (ClientRuntime.SdkResult<ListRoutingProfilesOutputResponse, ListRoutingProfilesOutputError>) -> Void)
```

### `listSecurityKeys(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Returns a paginated list of all security keys associated with the instance.

``` swift
public func listSecurityKeys(input: ListSecurityKeysInput, completion: @escaping (ClientRuntime.SdkResult<ListSecurityKeysOutputResponse, ListSecurityKeysOutputError>) -> Void)
```

### `listSecurityProfiles(input:completion:)`

Provides summary information about the security profiles for the specified Amazon Connect
instance.
For more information about security profiles, see <a href="https:​//docs.aws.amazon.com/connect/latest/adminguide/connect-security-profiles.html">Security Profiles in the
Amazon Connect Administrator Guide.

``` swift
public func listSecurityProfiles(input: ListSecurityProfilesInput, completion: @escaping (ClientRuntime.SdkResult<ListSecurityProfilesOutputResponse, ListSecurityProfilesOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Lists the tags for the specified resource.
For sample policies that use tags, see <a href="https:​//docs.aws.amazon.com/connect/latest/adminguide/security_iam_id-based-policy-examples.html">Amazon Connect Identity-Based
Policy Examples in the Amazon Connect Administrator Guide.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `listUseCases(input:completion:)`

Lists the use cases for the integration association.

``` swift
public func listUseCases(input: ListUseCasesInput, completion: @escaping (ClientRuntime.SdkResult<ListUseCasesOutputResponse, ListUseCasesOutputError>) -> Void)
```

### `listUserHierarchyGroups(input:completion:)`

Provides summary information about the hierarchy groups for the specified Amazon Connect
instance.
For more information about agent hierarchies, see <a href="https:​//docs.aws.amazon.com/connect/latest/adminguide/agent-hierarchy.html">Set Up Agent Hierarchies in the
Amazon Connect Administrator Guide.

``` swift
public func listUserHierarchyGroups(input: ListUserHierarchyGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListUserHierarchyGroupsOutputResponse, ListUserHierarchyGroupsOutputError>) -> Void)
```

### `listUsers(input:completion:)`

Provides summary information about the users for the specified Amazon Connect instance.

``` swift
public func listUsers(input: ListUsersInput, completion: @escaping (ClientRuntime.SdkResult<ListUsersOutputResponse, ListUsersOutputError>) -> Void)
```

### `resumeContactRecording(input:completion:)`

When a contact is being recorded, and the recording has been suspended using
SuspendContactRecording, this API resumes recording the call.

``` swift
public func resumeContactRecording(input: ResumeContactRecordingInput, completion: @escaping (ClientRuntime.SdkResult<ResumeContactRecordingOutputResponse, ResumeContactRecordingOutputError>) -> Void)
```

``` 
     Only voice recordings are supported at this time.
```

### `startChatContact(input:completion:)`

Initiates a contact flow to start a new chat for the customer. Response of this API provides
a token required to obtain credentials from the <a href="https:​//docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html">CreateParticipantConnection API in the Amazon Connect Participant Service.

``` swift
public func startChatContact(input: StartChatContactInput, completion: @escaping (ClientRuntime.SdkResult<StartChatContactOutputResponse, StartChatContactOutputError>) -> Void)
```

``` 
     When a new chat contact is successfully created, clients must subscribe to the participant’s
```

connection for the created chat within 5 minutes. This is achieved by invoking <a href="https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html">CreateParticipantConnection with WEBSOCKET and CONNECTION\_CREDENTIALS.

``` 
     A 429 error occurs in two situations:


           API rate limit is exceeded. API TPS throttling returns a TooManyRequests
 exception.


           The <a href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html">quota for concurrent active
  chats is exceeded. Active chat throttling returns a
  LimitExceededException.



     For more information about chat, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/chat.html">Chat in the Amazon Connect Administrator
Guide.
```

### `startContactRecording(input:completion:)`

Starts recording the contact when the agent joins the call. StartContactRecording is a
one-time action. For example, if you use StopContactRecording to stop recording an ongoing call,
you can't use StartContactRecording to restart it. For scenarios where the recording has started
and you want to suspend and resume it, such as when collecting sensitive information (for
example, a credit card number), use SuspendContactRecording and ResumeContactRecording.
You can use this API to override the recording behavior configured in the <a href="https:​//docs.aws.amazon.com/connect/latest/adminguide/set-recording-behavior.html">Set recording
behavior block.
Only voice recordings are supported at this time.

``` swift
public func startContactRecording(input: StartContactRecordingInput, completion: @escaping (ClientRuntime.SdkResult<StartContactRecordingOutputResponse, StartContactRecordingOutputError>) -> Void)
```

### `startOutboundVoiceContact(input:completion:)`

Places an outbound call to a contact, and then initiates the contact flow. It performs the
actions in the contact flow that's specified (in ContactFlowId).

``` swift
public func startOutboundVoiceContact(input: StartOutboundVoiceContactInput, completion: @escaping (ClientRuntime.SdkResult<StartOutboundVoiceContactOutputResponse, StartOutboundVoiceContactOutputError>) -> Void)
```

``` 
     Agents do not initiate the outbound API, which means that they do not dial the contact. If
```

the contact flow places an outbound call to a contact, and then puts the contact in queue, the
call is then routed to the agent, like any other inbound case.

``` 
     There is a 60-second dialing timeout for this operation. If the call is not connected after
```

60 seconds, it fails.

``` 
        UK numbers with a 447 prefix are not allowed by default. Before you can dial these UK
mobile numbers, you must submit a service quota increase request. For more information, see
 <a href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html">Amazon Connect Service Quotas in the Amazon Connect Administrator Guide.


        Campaign calls are not allowed by default. Before you can make a call with
TrafficType = CAMPAIGN, you must submit a service quota increase request. For more information, see
<a href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html">Amazon Connect Service Quotas in the Amazon Connect Administrator Guide.
```

### `startTaskContact(input:completion:)`

Initiates a contact flow to start a new task.

``` swift
public func startTaskContact(input: StartTaskContactInput, completion: @escaping (ClientRuntime.SdkResult<StartTaskContactOutputResponse, StartTaskContactOutputError>) -> Void)
```

### `stopContact(input:completion:)`

Ends the specified contact.

``` swift
public func stopContact(input: StopContactInput, completion: @escaping (ClientRuntime.SdkResult<StopContactOutputResponse, StopContactOutputError>) -> Void)
```

### `stopContactRecording(input:completion:)`

Stops recording a call when a contact is being recorded. StopContactRecording is a one-time
action. If you use StopContactRecording to stop recording an ongoing call, you can't use
StartContactRecording to restart it. For scenarios where the recording has started and you want
to suspend it for sensitive information (for example, to collect a credit card number), and then
restart it, use SuspendContactRecording and ResumeContactRecording.

``` swift
public func stopContactRecording(input: StopContactRecordingInput, completion: @escaping (ClientRuntime.SdkResult<StopContactRecordingOutputResponse, StopContactRecordingOutputError>) -> Void)
```

``` 
     Only voice recordings are supported at this time.
```

### `suspendContactRecording(input:completion:)`

When a contact is being recorded, this API suspends recording the call. For example, you
might suspend the call recording while collecting sensitive information, such as a credit card
number. Then use ResumeContactRecording to restart recording.
The period of time that the recording is suspended is filled with silence in the final
recording.
Only voice recordings are supported at this time.

``` swift
public func suspendContactRecording(input: SuspendContactRecordingInput, completion: @escaping (ClientRuntime.SdkResult<SuspendContactRecordingOutputResponse, SuspendContactRecordingOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Adds the specified tags to the specified resource.
The supported resource types are users, routing profiles, queues, quick connects,
contact flows, agent status, and hours of operation.
For sample policies that use tags, see <a href="https:​//docs.aws.amazon.com/connect/latest/adminguide/security_iam_id-based-policy-examples.html">Amazon Connect Identity-Based
Policy Examples in the Amazon Connect Administrator Guide.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes the specified tags from the specified resource.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateAgentStatus(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Updates agent status.

``` swift
public func updateAgentStatus(input: UpdateAgentStatusInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAgentStatusOutputResponse, UpdateAgentStatusOutputError>) -> Void)
```

### `updateContactAttributes(input:completion:)`

Creates or updates
user-defined contact attributes
associated with the specified contact.
You can create or update user-defined attributes for both ongoing and completed contacts.
For example, while the call is active, you can update the customer's name or the reason the
customer called. You can add notes about steps that the agent took during the call that display
to the next agent that takes the call. You can also update attributes for a contact using data
from your CRM application and save the data with the contact in Amazon Connect. You could also flag calls
for additional analysis, such as legal review or to identify abusive callers.
Contact attributes are available in Amazon Connect for 24 months, and are then deleted. For
information about CTR retention and the maximum size of the CTR attributes section, see <a href="https:​//docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html#feature-limits">Feature
specifications in the Amazon Connect Administrator Guide.

``` swift
public func updateContactAttributes(input: UpdateContactAttributesInput, completion: @escaping (ClientRuntime.SdkResult<UpdateContactAttributesOutputResponse, UpdateContactAttributesOutputError>) -> Void)
```

``` 
        Important: You cannot use the operation to update
```

attributes for contacts that occurred prior to the release of the API, which was September 12,
2018\. You can update attributes only for contacts that started after the release of the API. If
you attempt to update attributes for a contact that occurred prior to the release of the API, a
400 error is returned. This applies also to queued callbacks that were initiated prior to the
release of the API but are still active in your instance.

### `updateContactFlowContent(input:completion:)`

Updates the specified contact flow.
You can also create and update contact flows using the <a href="https:​//docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon Connect
Flow language.

``` swift
public func updateContactFlowContent(input: UpdateContactFlowContentInput, completion: @escaping (ClientRuntime.SdkResult<UpdateContactFlowContentOutputResponse, UpdateContactFlowContentOutputError>) -> Void)
```

### `updateContactFlowName(input:completion:)`

The name of the contact flow.
You can also create and update contact flows using the <a href="https:​//docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon Connect
Flow language.

``` swift
public func updateContactFlowName(input: UpdateContactFlowNameInput, completion: @escaping (ClientRuntime.SdkResult<UpdateContactFlowNameOutputResponse, UpdateContactFlowNameOutputError>) -> Void)
```

### `updateHoursOfOperation(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Updates the hours of operation.

``` swift
public func updateHoursOfOperation(input: UpdateHoursOfOperationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateHoursOfOperationOutputResponse, UpdateHoursOfOperationOutputError>) -> Void)
```

### `updateInstanceAttribute(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Updates the value for the specified attribute type.

``` swift
public func updateInstanceAttribute(input: UpdateInstanceAttributeInput, completion: @escaping (ClientRuntime.SdkResult<UpdateInstanceAttributeOutputResponse, UpdateInstanceAttributeOutputError>) -> Void)
```

### `updateInstanceStorageConfig(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Updates an existing configuration for a resource type. This API is idempotent.

``` swift
public func updateInstanceStorageConfig(input: UpdateInstanceStorageConfigInput, completion: @escaping (ClientRuntime.SdkResult<UpdateInstanceStorageConfigOutputResponse, UpdateInstanceStorageConfigOutputError>) -> Void)
```

### `updateQueueHoursOfOperation(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Updates the hours of operation for the specified queue.

``` swift
public func updateQueueHoursOfOperation(input: UpdateQueueHoursOfOperationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateQueueHoursOfOperationOutputResponse, UpdateQueueHoursOfOperationOutputError>) -> Void)
```

### `updateQueueMaxContacts(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Updates the maximum number of contacts allowed in a queue before it is considered
full.

``` swift
public func updateQueueMaxContacts(input: UpdateQueueMaxContactsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateQueueMaxContactsOutputResponse, UpdateQueueMaxContactsOutputError>) -> Void)
```

### `updateQueueName(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Updates the name and description of a queue. At least Name or Description must be provided.

``` swift
public func updateQueueName(input: UpdateQueueNameInput, completion: @escaping (ClientRuntime.SdkResult<UpdateQueueNameOutputResponse, UpdateQueueNameOutputError>) -> Void)
```

### `updateQueueOutboundCallerConfig(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Updates the outbound caller ID name, number, and outbound whisper flow for a specified
queue.

``` swift
public func updateQueueOutboundCallerConfig(input: UpdateQueueOutboundCallerConfigInput, completion: @escaping (ClientRuntime.SdkResult<UpdateQueueOutboundCallerConfigOutputResponse, UpdateQueueOutboundCallerConfigOutputError>) -> Void)
```

### `updateQueueStatus(input:completion:)`

This API is in preview release for Amazon Connect and is subject to change.
Updates the status of the queue.

``` swift
public func updateQueueStatus(input: UpdateQueueStatusInput, completion: @escaping (ClientRuntime.SdkResult<UpdateQueueStatusOutputResponse, UpdateQueueStatusOutputError>) -> Void)
```

### `updateQuickConnectConfig(input:completion:)`

Updates the configuration settings for the specified quick connect.

``` swift
public func updateQuickConnectConfig(input: UpdateQuickConnectConfigInput, completion: @escaping (ClientRuntime.SdkResult<UpdateQuickConnectConfigOutputResponse, UpdateQuickConnectConfigOutputError>) -> Void)
```

### `updateQuickConnectName(input:completion:)`

Updates the name and description of a quick connect. The request accepts the following data in JSON format. At least Name or Description must be provided.

``` swift
public func updateQuickConnectName(input: UpdateQuickConnectNameInput, completion: @escaping (ClientRuntime.SdkResult<UpdateQuickConnectNameOutputResponse, UpdateQuickConnectNameOutputError>) -> Void)
```

### `updateRoutingProfileConcurrency(input:completion:)`

Updates the channels that agents can handle in the Contact Control Panel (CCP) for a routing
profile.

``` swift
public func updateRoutingProfileConcurrency(input: UpdateRoutingProfileConcurrencyInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRoutingProfileConcurrencyOutputResponse, UpdateRoutingProfileConcurrencyOutputError>) -> Void)
```

### `updateRoutingProfileDefaultOutboundQueue(input:completion:)`

Updates the default outbound queue of a routing profile.

``` swift
public func updateRoutingProfileDefaultOutboundQueue(input: UpdateRoutingProfileDefaultOutboundQueueInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRoutingProfileDefaultOutboundQueueOutputResponse, UpdateRoutingProfileDefaultOutboundQueueOutputError>) -> Void)
```

### `updateRoutingProfileName(input:completion:)`

Updates the name and description of a routing profile. The request accepts the following data in JSON format.
At least Name or Description must be provided.

``` swift
public func updateRoutingProfileName(input: UpdateRoutingProfileNameInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRoutingProfileNameOutputResponse, UpdateRoutingProfileNameOutputError>) -> Void)
```

### `updateRoutingProfileQueues(input:completion:)`

Updates the properties associated with a set of queues for a routing profile.

``` swift
public func updateRoutingProfileQueues(input: UpdateRoutingProfileQueuesInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRoutingProfileQueuesOutputResponse, UpdateRoutingProfileQueuesOutputError>) -> Void)
```

### `updateUserHierarchy(input:completion:)`

Assigns the specified hierarchy group to the specified user.

``` swift
public func updateUserHierarchy(input: UpdateUserHierarchyInput, completion: @escaping (ClientRuntime.SdkResult<UpdateUserHierarchyOutputResponse, UpdateUserHierarchyOutputError>) -> Void)
```

### `updateUserHierarchyGroupName(input:completion:)`

Updates the name of the user hierarchy group.

``` swift
public func updateUserHierarchyGroupName(input: UpdateUserHierarchyGroupNameInput, completion: @escaping (ClientRuntime.SdkResult<UpdateUserHierarchyGroupNameOutputResponse, UpdateUserHierarchyGroupNameOutputError>) -> Void)
```

### `updateUserHierarchyStructure(input:completion:)`

Updates the user hierarchy structure:​ add, remove, and rename user hierarchy levels.

``` swift
public func updateUserHierarchyStructure(input: UpdateUserHierarchyStructureInput, completion: @escaping (ClientRuntime.SdkResult<UpdateUserHierarchyStructureOutputResponse, UpdateUserHierarchyStructureOutputError>) -> Void)
```

### `updateUserIdentityInfo(input:completion:)`

Updates the identity information for the specified user.

``` swift
public func updateUserIdentityInfo(input: UpdateUserIdentityInfoInput, completion: @escaping (ClientRuntime.SdkResult<UpdateUserIdentityInfoOutputResponse, UpdateUserIdentityInfoOutputError>) -> Void)
```

``` 
        We strongly recommend limiting who has the ability to invoke
 UpdateUserIdentityInfo. Someone with that ability can change the login credentials
of other users by changing their email address. This poses a security risk to your organization.
They can change the email address of a user to the attacker's email address, and then reset the
password through email. For more information, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/security-profile-best-practices.html">Best Practices for
 Security Profiles in the Amazon Connect Administrator Guide.
```

### `updateUserPhoneConfig(input:completion:)`

Updates the phone configuration settings for the specified user.

``` swift
public func updateUserPhoneConfig(input: UpdateUserPhoneConfigInput, completion: @escaping (ClientRuntime.SdkResult<UpdateUserPhoneConfigOutputResponse, UpdateUserPhoneConfigOutputError>) -> Void)
```

### `updateUserRoutingProfile(input:completion:)`

Assigns the specified routing profile to the specified user.

``` swift
public func updateUserRoutingProfile(input: UpdateUserRoutingProfileInput, completion: @escaping (ClientRuntime.SdkResult<UpdateUserRoutingProfileOutputResponse, UpdateUserRoutingProfileOutputError>) -> Void)
```

### `updateUserSecurityProfiles(input:completion:)`

Assigns the specified security profiles to the specified user.

``` swift
public func updateUserSecurityProfiles(input: UpdateUserSecurityProfilesInput, completion: @escaping (ClientRuntime.SdkResult<UpdateUserSecurityProfilesOutputResponse, UpdateUserSecurityProfilesOutputError>) -> Void)
```
