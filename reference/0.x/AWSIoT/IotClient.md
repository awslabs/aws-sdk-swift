# IotClient

``` swift
public class IotClient 
```

## Inheritance

[`IotClientProtocol`](/aws-sdk-swift/reference/0.x/AWSIoT/IotClientProtocol)

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

### `acceptCertificateTransfer(input:completion:)`

Accepts a pending certificate transfer. The default state of the certificate is
INACTIVE.
To check for pending certificate transfers, call ListCertificates
to enumerate your certificates.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">AcceptCertificateTransfer action.

``` swift
public func acceptCertificateTransfer(input: AcceptCertificateTransferInput, completion: @escaping (ClientRuntime.SdkResult<AcceptCertificateTransferOutputResponse, AcceptCertificateTransferOutputError>) -> Void)
```

### `addThingToBillingGroup(input:completion:)`

Adds a thing to a billing group.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">AddThingToBillingGroup action.

``` swift
public func addThingToBillingGroup(input: AddThingToBillingGroupInput, completion: @escaping (ClientRuntime.SdkResult<AddThingToBillingGroupOutputResponse, AddThingToBillingGroupOutputError>) -> Void)
```

### `addThingToThingGroup(input:completion:)`

Adds a thing to a thing group.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">AddThingToThingGroup action.

``` swift
public func addThingToThingGroup(input: AddThingToThingGroupInput, completion: @escaping (ClientRuntime.SdkResult<AddThingToThingGroupOutputResponse, AddThingToThingGroupOutputError>) -> Void)
```

### `associateTargetsWithJob(input:completion:)`

Associates a group with a continuous job. The following criteria must be met:​

``` swift
public func associateTargetsWithJob(input: AssociateTargetsWithJobInput, completion: @escaping (ClientRuntime.SdkResult<AssociateTargetsWithJobOutputResponse, AssociateTargetsWithJobOutputError>) -> Void)
```

``` 
            The job must have been created with the targetSelection field set to
                "CONTINUOUS".


            The job status must currently be "IN_PROGRESS".


            The total number of targets associated with a job must not exceed 100.


    Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">AssociateTargetsWithJob action.
```

### `attachPolicy(input:completion:)`

Attaches the specified policy to the specified principal (certificate or other
credential).
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">AttachPolicy action.

``` swift
public func attachPolicy(input: AttachPolicyInput, completion: @escaping (ClientRuntime.SdkResult<AttachPolicyOutputResponse, AttachPolicyOutputError>) -> Void)
```

### `attachPrincipalPolicy(input:completion:)`

Attaches the specified policy to the specified principal (certificate or other
credential).

``` swift
@available(*, deprecated)
    public func attachPrincipalPolicy(input: AttachPrincipalPolicyInput, completion: @escaping (ClientRuntime.SdkResult<AttachPrincipalPolicyOutputResponse, AttachPrincipalPolicyOutputError>) -> Void)
```

``` 
        Note: This action is deprecated. Please use AttachPolicy instead.
     Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">AttachPrincipalPolicy action.
```

### `attachSecurityProfile(input:completion:)`

Associates a Device Defender security profile with a thing group or this account. Each
thing group or account can have up to five security profiles associated with it.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">AttachSecurityProfile action.

``` swift
public func attachSecurityProfile(input: AttachSecurityProfileInput, completion: @escaping (ClientRuntime.SdkResult<AttachSecurityProfileOutputResponse, AttachSecurityProfileOutputError>) -> Void)
```

### `attachThingPrincipal(input:completion:)`

Attaches the specified principal to the specified thing. A principal can be X.509
certificates, IAM users, groups, and roles, Amazon Cognito identities or federated
identities.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">AttachThingPrincipal action.

``` swift
public func attachThingPrincipal(input: AttachThingPrincipalInput, completion: @escaping (ClientRuntime.SdkResult<AttachThingPrincipalOutputResponse, AttachThingPrincipalOutputError>) -> Void)
```

### `cancelAuditMitigationActionsTask(input:completion:)`

Cancels a mitigation action task that is in progress. If the task
is not
in progress, an InvalidRequestException occurs.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CancelAuditMitigationActionsTask action.

``` swift
public func cancelAuditMitigationActionsTask(input: CancelAuditMitigationActionsTaskInput, completion: @escaping (ClientRuntime.SdkResult<CancelAuditMitigationActionsTaskOutputResponse, CancelAuditMitigationActionsTaskOutputError>) -> Void)
```

### `cancelAuditTask(input:completion:)`

Cancels an audit that is in progress. The audit can be either scheduled or on demand. If the audit isn't in progress, an "InvalidRequestException" occurs.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CancelAuditTask action.

``` swift
public func cancelAuditTask(input: CancelAuditTaskInput, completion: @escaping (ClientRuntime.SdkResult<CancelAuditTaskOutputResponse, CancelAuditTaskOutputError>) -> Void)
```

### `cancelCertificateTransfer(input:completion:)`

Cancels a pending transfer for the specified certificate.

``` swift
public func cancelCertificateTransfer(input: CancelCertificateTransferInput, completion: @escaping (ClientRuntime.SdkResult<CancelCertificateTransferOutputResponse, CancelCertificateTransferOutputError>) -> Void)
```

``` 
        Note Only the transfer source account can use this
     operation to cancel a transfer. (Transfer destinations can use RejectCertificateTransfer instead.) After transfer, IoT returns the
     certificate to the source account in the INACTIVE state. After the destination account has
     accepted the transfer, the transfer cannot be cancelled.
     After a certificate transfer is cancelled, the status of the certificate changes from
     PENDING_TRANSFER to INACTIVE.
     Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CancelCertificateTransfer action.
```

### `cancelDetectMitigationActionsTask(input:completion:)`

Cancels a Device Defender ML Detect mitigation action.

``` swift
public func cancelDetectMitigationActionsTask(input: CancelDetectMitigationActionsTaskInput, completion: @escaping (ClientRuntime.SdkResult<CancelDetectMitigationActionsTaskOutputResponse, CancelDetectMitigationActionsTaskOutputError>) -> Void)
```

Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CancelDetectMitigationActionsTask action.

### `cancelJob(input:completion:)`

Cancels a job.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CancelJob action.

``` swift
public func cancelJob(input: CancelJobInput, completion: @escaping (ClientRuntime.SdkResult<CancelJobOutputResponse, CancelJobOutputError>) -> Void)
```

### `cancelJobExecution(input:completion:)`

Cancels the execution of a job for a given thing.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CancelJobExecution action.

``` swift
public func cancelJobExecution(input: CancelJobExecutionInput, completion: @escaping (ClientRuntime.SdkResult<CancelJobExecutionOutputResponse, CancelJobExecutionOutputError>) -> Void)
```

### `clearDefaultAuthorizer(input:completion:)`

Clears the default authorizer.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ClearDefaultAuthorizer action.

``` swift
public func clearDefaultAuthorizer(input: ClearDefaultAuthorizerInput, completion: @escaping (ClientRuntime.SdkResult<ClearDefaultAuthorizerOutputResponse, ClearDefaultAuthorizerOutputError>) -> Void)
```

### `confirmTopicRuleDestination(input:completion:)`

Confirms a topic rule destination. When you create a rule requiring a destination, IoT
sends a confirmation message to the endpoint or base address you specify. The message
includes a token which you pass back when calling ConfirmTopicRuleDestination
to confirm that you own or have access to the endpoint.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ConfirmTopicRuleDestination action.

``` swift
public func confirmTopicRuleDestination(input: ConfirmTopicRuleDestinationInput, completion: @escaping (ClientRuntime.SdkResult<ConfirmTopicRuleDestinationOutputResponse, ConfirmTopicRuleDestinationOutputError>) -> Void)
```

### `createAuditSuppression(input:completion:)`

Creates a Device Defender audit suppression.

``` swift
public func createAuditSuppression(input: CreateAuditSuppressionInput, completion: @escaping (ClientRuntime.SdkResult<CreateAuditSuppressionOutputResponse, CreateAuditSuppressionOutputError>) -> Void)
```

Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateAuditSuppression action.

### `createAuthorizer(input:completion:)`

Creates an authorizer.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateAuthorizer action.

``` swift
public func createAuthorizer(input: CreateAuthorizerInput, completion: @escaping (ClientRuntime.SdkResult<CreateAuthorizerOutputResponse, CreateAuthorizerOutputError>) -> Void)
```

### `createBillingGroup(input:completion:)`

Creates a billing group.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateBillingGroup action.

``` swift
public func createBillingGroup(input: CreateBillingGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateBillingGroupOutputResponse, CreateBillingGroupOutputError>) -> Void)
```

### `createCertificateFromCsr(input:completion:)`

Creates an X.509 certificate using the specified certificate signing
request.

``` swift
public func createCertificateFromCsr(input: CreateCertificateFromCsrInput, completion: @escaping (ClientRuntime.SdkResult<CreateCertificateFromCsrOutputResponse, CreateCertificateFromCsrOutputError>) -> Void)
```

``` 
        Note: The CSR must include a public key that is either an
     RSA key with a length of at least 2048 bits or an ECC key from NIST P-256 or NIST P-384
     curves.

        Note: Reusing the same certificate signing request (CSR)
     results in a distinct certificate.
     Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateCertificateFromCsr action.

     You can create multiple certificates in a batch by creating a directory, copying
     multiple .csr files into that directory, and then specifying that directory on the command
     line. The following commands show how to create a batch of certificates given a batch of
     CSRs.
     Assuming a set of CSRs are located inside of the directory
     my-csr-directory:

     On Linux and OS X, the command is:

     $ ls my-csr-directory/ | xargs -I {} aws iot create-certificate-from-csr
     --certificate-signing-request file://my-csr-directory/{}
     This command lists all of the CSRs in my-csr-directory and pipes each CSR file name
     to the aws iot create-certificate-from-csr Amazon Web Services CLI command to create a certificate for the
     corresponding CSR.
     The aws iot create-certificate-from-csr part of the command can also be run in
     parallel to speed up the certificate creation process:
     $ ls my-csr-directory/ | xargs -P 10 -I {} aws iot create-certificate-from-csr
     --certificate-signing-request file://my-csr-directory/{}
     On Windows PowerShell, the command to create certificates for all CSRs in
     my-csr-directory is:
     > ls -Name my-csr-directory | %{aws iot create-certificate-from-csr
     --certificate-signing-request file://my-csr-directory/$_}
     On a Windows command prompt, the command to create certificates for all CSRs in
     my-csr-directory is:
     > forfiles /p my-csr-directory /c "cmd /c aws iot create-certificate-from-csr
     --certificate-signing-request file://@path"
```

### `createCustomMetric(input:completion:)`

Use this API to define a
Custom
Metric
published by your devices to Device Defender.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateCustomMetric action.

``` swift
public func createCustomMetric(input: CreateCustomMetricInput, completion: @escaping (ClientRuntime.SdkResult<CreateCustomMetricOutputResponse, CreateCustomMetricOutputError>) -> Void)
```

### `createDimension(input:completion:)`

Create a dimension that you can use to limit the scope of a metric used in a security profile for IoT Device Defender.
For example, using a TOPIC\_FILTER dimension, you can narrow down the scope of the metric only to MQTT topics whose name match the pattern specified in the dimension.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateDimension action.

``` swift
public func createDimension(input: CreateDimensionInput, completion: @escaping (ClientRuntime.SdkResult<CreateDimensionOutputResponse, CreateDimensionOutputError>) -> Void)
```

### `createDomainConfiguration(input:completion:)`

Creates a domain configuration.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateDomainConfiguration action.

``` swift
public func createDomainConfiguration(input: CreateDomainConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<CreateDomainConfigurationOutputResponse, CreateDomainConfigurationOutputError>) -> Void)
```

### `createDynamicThingGroup(input:completion:)`

Creates a dynamic thing group.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateDynamicThingGroup action.

``` swift
public func createDynamicThingGroup(input: CreateDynamicThingGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateDynamicThingGroupOutputResponse, CreateDynamicThingGroupOutputError>) -> Void)
```

### `createFleetMetric(input:completion:)`

Creates a fleet metric.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateFleetMetric action.

``` swift
public func createFleetMetric(input: CreateFleetMetricInput, completion: @escaping (ClientRuntime.SdkResult<CreateFleetMetricOutputResponse, CreateFleetMetricOutputError>) -> Void)
```

### `createJob(input:completion:)`

Creates a job.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateJob action.

``` swift
public func createJob(input: CreateJobInput, completion: @escaping (ClientRuntime.SdkResult<CreateJobOutputResponse, CreateJobOutputError>) -> Void)
```

### `createJobTemplate(input:completion:)`

Creates a job template.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateJobTemplate action.

``` swift
public func createJobTemplate(input: CreateJobTemplateInput, completion: @escaping (ClientRuntime.SdkResult<CreateJobTemplateOutputResponse, CreateJobTemplateOutputError>) -> Void)
```

### `createKeysAndCertificate(input:completion:)`

Creates a 2048-bit RSA key pair and issues an X.509 certificate using the issued
public key. You can also call CreateKeysAndCertificate over MQTT from a
device, for more information, see <a href="https:​//docs.aws.amazon.com/iot/latest/developerguide/provision-wo-cert.html#provision-mqtt-api">Provisioning MQTT API.

``` swift
public func createKeysAndCertificate(input: CreateKeysAndCertificateInput, completion: @escaping (ClientRuntime.SdkResult<CreateKeysAndCertificateOutputResponse, CreateKeysAndCertificateOutputError>) -> Void)
```

``` 
        Note This is the only time IoT issues the private key
     for this certificate, so it is important to keep it in a secure location.
     Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateKeysAndCertificate action.
```

### `createMitigationAction(input:completion:)`

Defines an action that can be applied to audit findings by using StartAuditMitigationActionsTask. Only certain types of mitigation actions can be applied to specific check names.
For more information, see <a href="https:​//docs.aws.amazon.com/iot/latest/developerguide/device-defender-mitigation-actions.html">Mitigation actions. Each mitigation action can apply only one type of change.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateMitigationAction action.

``` swift
public func createMitigationAction(input: CreateMitigationActionInput, completion: @escaping (ClientRuntime.SdkResult<CreateMitigationActionOutputResponse, CreateMitigationActionOutputError>) -> Void)
```

### `createOTAUpdate(input:completion:)`

Creates an IoT OTA update on a target group of things or groups.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateOTAUpdate action.

``` swift
public func createOTAUpdate(input: CreateOTAUpdateInput, completion: @escaping (ClientRuntime.SdkResult<CreateOTAUpdateOutputResponse, CreateOTAUpdateOutputError>) -> Void)
```

### `createPolicy(input:completion:)`

Creates an IoT policy.
The created policy is the default version for the policy. This operation creates a
policy version with a version identifier of 1 and sets
1 as the policy's default version.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreatePolicy action.

``` swift
public func createPolicy(input: CreatePolicyInput, completion: @escaping (ClientRuntime.SdkResult<CreatePolicyOutputResponse, CreatePolicyOutputError>) -> Void)
```

### `createPolicyVersion(input:completion:)`

Creates a new version of the specified IoT policy. To update a policy, create a
new policy version. A managed policy can have up to five versions. If the policy has five
versions, you must use DeletePolicyVersion to delete an existing version
before you create a new one.
Optionally, you can set the new version as the policy's default version. The default
version is the operative version (that is, the version that is in effect for the
certificates to which the policy is attached).
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreatePolicyVersion action.

``` swift
public func createPolicyVersion(input: CreatePolicyVersionInput, completion: @escaping (ClientRuntime.SdkResult<CreatePolicyVersionOutputResponse, CreatePolicyVersionOutputError>) -> Void)
```

### `createProvisioningClaim(input:completion:)`

Creates a provisioning claim.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateProvisioningClaim action.

``` swift
public func createProvisioningClaim(input: CreateProvisioningClaimInput, completion: @escaping (ClientRuntime.SdkResult<CreateProvisioningClaimOutputResponse, CreateProvisioningClaimOutputError>) -> Void)
```

### `createProvisioningTemplate(input:completion:)`

Creates a fleet provisioning template.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateProvisioningTemplate action.

``` swift
public func createProvisioningTemplate(input: CreateProvisioningTemplateInput, completion: @escaping (ClientRuntime.SdkResult<CreateProvisioningTemplateOutputResponse, CreateProvisioningTemplateOutputError>) -> Void)
```

### `createProvisioningTemplateVersion(input:completion:)`

Creates a new version of a fleet provisioning template.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateProvisioningTemplateVersion action.

``` swift
public func createProvisioningTemplateVersion(input: CreateProvisioningTemplateVersionInput, completion: @escaping (ClientRuntime.SdkResult<CreateProvisioningTemplateVersionOutputResponse, CreateProvisioningTemplateVersionOutputError>) -> Void)
```

### `createRoleAlias(input:completion:)`

Creates a role alias.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateRoleAlias action.

``` swift
public func createRoleAlias(input: CreateRoleAliasInput, completion: @escaping (ClientRuntime.SdkResult<CreateRoleAliasOutputResponse, CreateRoleAliasOutputError>) -> Void)
```

### `createScheduledAudit(input:completion:)`

Creates a scheduled audit that is run at a specified
time interval.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateScheduledAudit action.

``` swift
public func createScheduledAudit(input: CreateScheduledAuditInput, completion: @escaping (ClientRuntime.SdkResult<CreateScheduledAuditOutputResponse, CreateScheduledAuditOutputError>) -> Void)
```

### `createSecurityProfile(input:completion:)`

Creates a Device Defender security profile.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateSecurityProfile action.

``` swift
public func createSecurityProfile(input: CreateSecurityProfileInput, completion: @escaping (ClientRuntime.SdkResult<CreateSecurityProfileOutputResponse, CreateSecurityProfileOutputError>) -> Void)
```

### `createStream(input:completion:)`

Creates a stream for delivering one or more large files in chunks over MQTT. A stream transports data
bytes in chunks or blocks packaged as MQTT messages from a source like S3. You can have one or more files
associated with a stream.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateStream action.

``` swift
public func createStream(input: CreateStreamInput, completion: @escaping (ClientRuntime.SdkResult<CreateStreamOutputResponse, CreateStreamOutputError>) -> Void)
```

### `createThing(input:completion:)`

Creates a thing record in the registry. If this call is made multiple times using
the same thing name and configuration, the call will succeed. If this call is made with
the same thing name but different configuration a
ResourceAlreadyExistsException is thrown.

``` swift
public func createThing(input: CreateThingInput, completion: @escaping (ClientRuntime.SdkResult<CreateThingOutputResponse, CreateThingOutputError>) -> Void)
```

``` 
		         This is a control plane operation. See <a href="https://docs.aws.amazon.com/iot/latest/developerguide/iot-authorization.html">Authorization for
			information about authorizing control plane actions.
	
	       Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateThing action.
```

### `createThingGroup(input:completion:)`

Create a thing group.

``` swift
public func createThingGroup(input: CreateThingGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateThingGroupOutputResponse, CreateThingGroupOutputError>) -> Void)
```

``` 
		         This is a control plane operation. See <a href="https://docs.aws.amazon.com/iot/latest/developerguide/iot-authorization.html">Authorization for
			information about authorizing control plane actions.
	
	       Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateThingGroup action.
```

### `createThingType(input:completion:)`

Creates a new thing type.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateThingType action.

``` swift
public func createThingType(input: CreateThingTypeInput, completion: @escaping (ClientRuntime.SdkResult<CreateThingTypeOutputResponse, CreateThingTypeOutputError>) -> Void)
```

### `createTopicRule(input:completion:)`

Creates a rule. Creating rules is an administrator-level action. Any user who has
permission to create rules will be able to access data processed by the rule.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateTopicRule action.

``` swift
public func createTopicRule(input: CreateTopicRuleInput, completion: @escaping (ClientRuntime.SdkResult<CreateTopicRuleOutputResponse, CreateTopicRuleOutputError>) -> Void)
```

### `createTopicRuleDestination(input:completion:)`

Creates a topic rule destination. The destination must be confirmed prior to use.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">CreateTopicRuleDestination action.

``` swift
public func createTopicRuleDestination(input: CreateTopicRuleDestinationInput, completion: @escaping (ClientRuntime.SdkResult<CreateTopicRuleDestinationOutputResponse, CreateTopicRuleDestinationOutputError>) -> Void)
```

### `deleteAccountAuditConfiguration(input:completion:)`

Restores the default settings for Device Defender audits for this account. Any
configuration data you entered is deleted and all audit checks are reset to
disabled.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteAccountAuditConfiguration action.

``` swift
public func deleteAccountAuditConfiguration(input: DeleteAccountAuditConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAccountAuditConfigurationOutputResponse, DeleteAccountAuditConfigurationOutputError>) -> Void)
```

### `deleteAuditSuppression(input:completion:)`

Deletes a Device Defender audit suppression.

``` swift
public func deleteAuditSuppression(input: DeleteAuditSuppressionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAuditSuppressionOutputResponse, DeleteAuditSuppressionOutputError>) -> Void)
```

Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteAuditSuppression action.

### `deleteAuthorizer(input:completion:)`

Deletes an authorizer.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteAuthorizer action.

``` swift
public func deleteAuthorizer(input: DeleteAuthorizerInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAuthorizerOutputResponse, DeleteAuthorizerOutputError>) -> Void)
```

### `deleteBillingGroup(input:completion:)`

Deletes the billing group.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteBillingGroup action.

``` swift
public func deleteBillingGroup(input: DeleteBillingGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBillingGroupOutputResponse, DeleteBillingGroupOutputError>) -> Void)
```

### `deleteCACertificate(input:completion:)`

Deletes a registered CA certificate.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteCACertificate action.

``` swift
public func deleteCACertificate(input: DeleteCACertificateInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCACertificateOutputResponse, DeleteCACertificateOutputError>) -> Void)
```

### `deleteCertificate(input:completion:)`

Deletes the specified certificate.
A certificate cannot be deleted if it has a policy or IoT thing attached to it or if
its status is set to ACTIVE. To delete a certificate, first use the DetachPolicy action to detach all policies. Next, use the UpdateCertificate action to set the certificate to the INACTIVE
status.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteCertificate action.

``` swift
public func deleteCertificate(input: DeleteCertificateInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCertificateOutputResponse, DeleteCertificateOutputError>) -> Void)
```

### `deleteCustomMetric(input:completion:)`

Deletes a Device Defender detect custom metric.

``` swift
public func deleteCustomMetric(input: DeleteCustomMetricInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCustomMetricOutputResponse, DeleteCustomMetricOutputError>) -> Void)
```

Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteCustomMetric action.

``` 
  Before you can delete a custom metric, you must first remove the custom metric from all
```

security profiles it's a part of.
The
security
profile associated with the custom metric can be found using the <a href="https://docs.aws.amazon.com/iot/latest/apireference/API_ListSecurityProfiles.html">ListSecurityProfiles
API with metricName set to your custom metric name.

### `deleteDimension(input:completion:)`

Removes the specified dimension from your Amazon Web Services accounts.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteDimension action.

``` swift
public func deleteDimension(input: DeleteDimensionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDimensionOutputResponse, DeleteDimensionOutputError>) -> Void)
```

### `deleteDomainConfiguration(input:completion:)`

Deletes the specified domain configuration.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteDomainConfiguration action.

``` swift
public func deleteDomainConfiguration(input: DeleteDomainConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDomainConfigurationOutputResponse, DeleteDomainConfigurationOutputError>) -> Void)
```

### `deleteDynamicThingGroup(input:completion:)`

Deletes a dynamic thing group.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteDynamicThingGroup action.

``` swift
public func deleteDynamicThingGroup(input: DeleteDynamicThingGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDynamicThingGroupOutputResponse, DeleteDynamicThingGroupOutputError>) -> Void)
```

### `deleteFleetMetric(input:completion:)`

Deletes the specified fleet metric.
Returns successfully with no error if the deletion is successful or you specify a fleet metric that doesn't exist.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteFleetMetric action.

``` swift
public func deleteFleetMetric(input: DeleteFleetMetricInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFleetMetricOutputResponse, DeleteFleetMetricOutputError>) -> Void)
```

### `deleteJob(input:completion:)`

Deletes a job and its related job executions.
Deleting a job may take time, depending on the number of job
executions created for the job and various other factors. While the job
is being deleted, the status of the job will be shown as
"DELETION\_IN\_PROGRESS". Attempting to delete or cancel a job whose status
is already "DELETION\_IN\_PROGRESS" will result in an error.
Only 10 jobs may have status "DELETION\_IN\_PROGRESS" at the same time, or
a LimitExceededException will occur.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteJob action.

``` swift
public func deleteJob(input: DeleteJobInput, completion: @escaping (ClientRuntime.SdkResult<DeleteJobOutputResponse, DeleteJobOutputError>) -> Void)
```

### `deleteJobExecution(input:completion:)`

Deletes a job execution.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteJobExecution action.

``` swift
public func deleteJobExecution(input: DeleteJobExecutionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteJobExecutionOutputResponse, DeleteJobExecutionOutputError>) -> Void)
```

### `deleteJobTemplate(input:completion:)`

Deletes the specified job template.

``` swift
public func deleteJobTemplate(input: DeleteJobTemplateInput, completion: @escaping (ClientRuntime.SdkResult<DeleteJobTemplateOutputResponse, DeleteJobTemplateOutputError>) -> Void)
```

### `deleteMitigationAction(input:completion:)`

Deletes a defined mitigation action from your Amazon Web Services accounts.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteMitigationAction action.

``` swift
public func deleteMitigationAction(input: DeleteMitigationActionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteMitigationActionOutputResponse, DeleteMitigationActionOutputError>) -> Void)
```

### `deleteOTAUpdate(input:completion:)`

Delete an OTA update.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteOTAUpdate action.

``` swift
public func deleteOTAUpdate(input: DeleteOTAUpdateInput, completion: @escaping (ClientRuntime.SdkResult<DeleteOTAUpdateOutputResponse, DeleteOTAUpdateOutputError>) -> Void)
```

### `deletePolicy(input:completion:)`

Deletes the specified policy.
A policy cannot be deleted if it has non-default versions or it is attached to any
certificate.
To delete a policy, use the DeletePolicyVersion action to delete all non-default
versions of the policy; use the DetachPolicy action to detach the policy from any
certificate; and then use the DeletePolicy action to delete the policy.
When a policy is deleted using DeletePolicy, its default version is deleted with
it.

``` swift
public func deletePolicy(input: DeletePolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeletePolicyOutputResponse, DeletePolicyOutputError>) -> Void)
```

``` 
        Because of the distributed nature of Amazon Web Services, it can take up to five minutes after
     a policy is detached before it's ready to be deleted.

     Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeletePolicy action.
```

### `deletePolicyVersion(input:completion:)`

Deletes the specified version of the specified policy. You cannot delete the default
version of a policy using this action. To delete the default version of a policy, use DeletePolicy. To find out which version of a policy is marked as the default
version, use ListPolicyVersions.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeletePolicyVersion action.

``` swift
public func deletePolicyVersion(input: DeletePolicyVersionInput, completion: @escaping (ClientRuntime.SdkResult<DeletePolicyVersionOutputResponse, DeletePolicyVersionOutputError>) -> Void)
```

### `deleteProvisioningTemplate(input:completion:)`

Deletes a fleet provisioning template.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteProvisioningTemplate action.

``` swift
public func deleteProvisioningTemplate(input: DeleteProvisioningTemplateInput, completion: @escaping (ClientRuntime.SdkResult<DeleteProvisioningTemplateOutputResponse, DeleteProvisioningTemplateOutputError>) -> Void)
```

### `deleteProvisioningTemplateVersion(input:completion:)`

Deletes a fleet provisioning template version.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteProvisioningTemplateVersion action.

``` swift
public func deleteProvisioningTemplateVersion(input: DeleteProvisioningTemplateVersionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteProvisioningTemplateVersionOutputResponse, DeleteProvisioningTemplateVersionOutputError>) -> Void)
```

### `deleteRegistrationCode(input:completion:)`

Deletes a CA certificate registration code.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteRegistrationCode action.

``` swift
public func deleteRegistrationCode(input: DeleteRegistrationCodeInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRegistrationCodeOutputResponse, DeleteRegistrationCodeOutputError>) -> Void)
```

### `deleteRoleAlias(input:completion:)`

Deletes a role alias
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteRoleAlias action.

``` swift
public func deleteRoleAlias(input: DeleteRoleAliasInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRoleAliasOutputResponse, DeleteRoleAliasOutputError>) -> Void)
```

### `deleteScheduledAudit(input:completion:)`

Deletes a scheduled audit.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteScheduledAudit action.

``` swift
public func deleteScheduledAudit(input: DeleteScheduledAuditInput, completion: @escaping (ClientRuntime.SdkResult<DeleteScheduledAuditOutputResponse, DeleteScheduledAuditOutputError>) -> Void)
```

### `deleteSecurityProfile(input:completion:)`

Deletes a Device Defender security profile.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteSecurityProfile action.

``` swift
public func deleteSecurityProfile(input: DeleteSecurityProfileInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSecurityProfileOutputResponse, DeleteSecurityProfileOutputError>) -> Void)
```

### `deleteStream(input:completion:)`

Deletes a stream.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteStream action.

``` swift
public func deleteStream(input: DeleteStreamInput, completion: @escaping (ClientRuntime.SdkResult<DeleteStreamOutputResponse, DeleteStreamOutputError>) -> Void)
```

### `deleteThing(input:completion:)`

Deletes the specified thing. Returns successfully with no error if the deletion is
successful or you specify a thing that doesn't exist.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteThing action.

``` swift
public func deleteThing(input: DeleteThingInput, completion: @escaping (ClientRuntime.SdkResult<DeleteThingOutputResponse, DeleteThingOutputError>) -> Void)
```

### `deleteThingGroup(input:completion:)`

Deletes a thing group.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteThingGroup action.

``` swift
public func deleteThingGroup(input: DeleteThingGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteThingGroupOutputResponse, DeleteThingGroupOutputError>) -> Void)
```

### `deleteThingType(input:completion:)`

Deletes the specified thing type. You cannot delete a thing type if it has things
associated with it. To delete a thing type, first mark it as deprecated by calling DeprecateThingType, then remove any associated things by calling UpdateThing to change the thing type on any associated thing, and
finally use DeleteThingType to delete the thing type.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteThingType action.

``` swift
public func deleteThingType(input: DeleteThingTypeInput, completion: @escaping (ClientRuntime.SdkResult<DeleteThingTypeOutputResponse, DeleteThingTypeOutputError>) -> Void)
```

### `deleteTopicRule(input:completion:)`

Deletes the rule.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteTopicRule action.

``` swift
public func deleteTopicRule(input: DeleteTopicRuleInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTopicRuleOutputResponse, DeleteTopicRuleOutputError>) -> Void)
```

### `deleteTopicRuleDestination(input:completion:)`

Deletes a topic rule destination.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteTopicRuleDestination action.

``` swift
public func deleteTopicRuleDestination(input: DeleteTopicRuleDestinationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTopicRuleDestinationOutputResponse, DeleteTopicRuleDestinationOutputError>) -> Void)
```

### `deleteV2LoggingLevel(input:completion:)`

Deletes a logging level.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeleteV2LoggingLevel action.

``` swift
public func deleteV2LoggingLevel(input: DeleteV2LoggingLevelInput, completion: @escaping (ClientRuntime.SdkResult<DeleteV2LoggingLevelOutputResponse, DeleteV2LoggingLevelOutputError>) -> Void)
```

### `deprecateThingType(input:completion:)`

Deprecates a thing type. You can not associate new things with deprecated thing
type.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DeprecateThingType action.

``` swift
public func deprecateThingType(input: DeprecateThingTypeInput, completion: @escaping (ClientRuntime.SdkResult<DeprecateThingTypeOutputResponse, DeprecateThingTypeOutputError>) -> Void)
```

### `describeAccountAuditConfiguration(input:completion:)`

Gets information about the Device Defender audit settings for this account.
Settings include how audit notifications are sent and which audit checks are
enabled or disabled.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeAccountAuditConfiguration action.

``` swift
public func describeAccountAuditConfiguration(input: DescribeAccountAuditConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAccountAuditConfigurationOutputResponse, DescribeAccountAuditConfigurationOutputError>) -> Void)
```

### `describeAuditFinding(input:completion:)`

Gets information about a single audit finding. Properties include the reason for
noncompliance, the severity of the issue,
and the start time
when the audit that returned the
finding.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeAuditFinding action.

``` swift
public func describeAuditFinding(input: DescribeAuditFindingInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAuditFindingOutputResponse, DescribeAuditFindingOutputError>) -> Void)
```

### `describeAuditMitigationActionsTask(input:completion:)`

Gets information about an audit mitigation task that is used to apply mitigation actions to a set of audit findings. Properties include the actions being applied, the audit checks to which they're being applied, the task status, and aggregated task statistics.

``` swift
public func describeAuditMitigationActionsTask(input: DescribeAuditMitigationActionsTaskInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAuditMitigationActionsTaskOutputResponse, DescribeAuditMitigationActionsTaskOutputError>) -> Void)
```

### `describeAuditSuppression(input:completion:)`

Gets information about a Device Defender audit suppression.

``` swift
public func describeAuditSuppression(input: DescribeAuditSuppressionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAuditSuppressionOutputResponse, DescribeAuditSuppressionOutputError>) -> Void)
```

### `describeAuditTask(input:completion:)`

Gets information about a Device Defender audit.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeAuditTask action.

``` swift
public func describeAuditTask(input: DescribeAuditTaskInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAuditTaskOutputResponse, DescribeAuditTaskOutputError>) -> Void)
```

### `describeAuthorizer(input:completion:)`

Describes an authorizer.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeAuthorizer action.

``` swift
public func describeAuthorizer(input: DescribeAuthorizerInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAuthorizerOutputResponse, DescribeAuthorizerOutputError>) -> Void)
```

### `describeBillingGroup(input:completion:)`

Returns information about a billing group.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeBillingGroup action.

``` swift
public func describeBillingGroup(input: DescribeBillingGroupInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBillingGroupOutputResponse, DescribeBillingGroupOutputError>) -> Void)
```

### `describeCACertificate(input:completion:)`

Describes a registered CA certificate.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeCACertificate action.

``` swift
public func describeCACertificate(input: DescribeCACertificateInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCACertificateOutputResponse, DescribeCACertificateOutputError>) -> Void)
```

### `describeCertificate(input:completion:)`

Gets information about the specified certificate.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeCertificate action.

``` swift
public func describeCertificate(input: DescribeCertificateInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCertificateOutputResponse, DescribeCertificateOutputError>) -> Void)
```

### `describeCustomMetric(input:completion:)`

Gets information about a Device Defender detect custom metric.

``` swift
public func describeCustomMetric(input: DescribeCustomMetricInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCustomMetricOutputResponse, DescribeCustomMetricOutputError>) -> Void)
```

Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeCustomMetric action.

### `describeDefaultAuthorizer(input:completion:)`

Describes the default authorizer.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeDefaultAuthorizer action.

``` swift
public func describeDefaultAuthorizer(input: DescribeDefaultAuthorizerInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDefaultAuthorizerOutputResponse, DescribeDefaultAuthorizerOutputError>) -> Void)
```

### `describeDetectMitigationActionsTask(input:completion:)`

Gets information about a Device Defender ML Detect mitigation action.

``` swift
public func describeDetectMitigationActionsTask(input: DescribeDetectMitigationActionsTaskInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDetectMitigationActionsTaskOutputResponse, DescribeDetectMitigationActionsTaskOutputError>) -> Void)
```

Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeDetectMitigationActionsTask action.

### `describeDimension(input:completion:)`

Provides details about a dimension that is defined in your Amazon Web Services accounts.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeDimension action.

``` swift
public func describeDimension(input: DescribeDimensionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDimensionOutputResponse, DescribeDimensionOutputError>) -> Void)
```

### `describeDomainConfiguration(input:completion:)`

Gets summary information about a domain configuration.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeDomainConfiguration action.

``` swift
public func describeDomainConfiguration(input: DescribeDomainConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDomainConfigurationOutputResponse, DescribeDomainConfigurationOutputError>) -> Void)
```

### `describeEndpoint(input:completion:)`

Returns a unique endpoint specific to the Amazon Web Services account making the call.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeEndpoint action.

``` swift
public func describeEndpoint(input: DescribeEndpointInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEndpointOutputResponse, DescribeEndpointOutputError>) -> Void)
```

### `describeEventConfigurations(input:completion:)`

Describes event configurations.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeEventConfigurations action.

``` swift
public func describeEventConfigurations(input: DescribeEventConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEventConfigurationsOutputResponse, DescribeEventConfigurationsOutputError>) -> Void)
```

### `describeFleetMetric(input:completion:)`

Gets information about the specified fleet metric.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeFleetMetric action.

``` swift
public func describeFleetMetric(input: DescribeFleetMetricInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFleetMetricOutputResponse, DescribeFleetMetricOutputError>) -> Void)
```

### `describeIndex(input:completion:)`

Describes a search index.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeIndex action.

``` swift
public func describeIndex(input: DescribeIndexInput, completion: @escaping (ClientRuntime.SdkResult<DescribeIndexOutputResponse, DescribeIndexOutputError>) -> Void)
```

### `describeJob(input:completion:)`

Describes a job.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeJob action.

``` swift
public func describeJob(input: DescribeJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeJobOutputResponse, DescribeJobOutputError>) -> Void)
```

### `describeJobExecution(input:completion:)`

Describes a job execution.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeJobExecution action.

``` swift
public func describeJobExecution(input: DescribeJobExecutionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeJobExecutionOutputResponse, DescribeJobExecutionOutputError>) -> Void)
```

### `describeJobTemplate(input:completion:)`

Returns information about a job template.

``` swift
public func describeJobTemplate(input: DescribeJobTemplateInput, completion: @escaping (ClientRuntime.SdkResult<DescribeJobTemplateOutputResponse, DescribeJobTemplateOutputError>) -> Void)
```

### `describeMitigationAction(input:completion:)`

Gets information about a mitigation action.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeMitigationAction action.

``` swift
public func describeMitigationAction(input: DescribeMitigationActionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeMitigationActionOutputResponse, DescribeMitigationActionOutputError>) -> Void)
```

### `describeProvisioningTemplate(input:completion:)`

Returns information about a fleet provisioning template.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeProvisioningTemplate action.

``` swift
public func describeProvisioningTemplate(input: DescribeProvisioningTemplateInput, completion: @escaping (ClientRuntime.SdkResult<DescribeProvisioningTemplateOutputResponse, DescribeProvisioningTemplateOutputError>) -> Void)
```

### `describeProvisioningTemplateVersion(input:completion:)`

Returns information about a fleet provisioning template version.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeProvisioningTemplateVersion action.

``` swift
public func describeProvisioningTemplateVersion(input: DescribeProvisioningTemplateVersionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeProvisioningTemplateVersionOutputResponse, DescribeProvisioningTemplateVersionOutputError>) -> Void)
```

### `describeRoleAlias(input:completion:)`

Describes a role alias.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeRoleAlias action.

``` swift
public func describeRoleAlias(input: DescribeRoleAliasInput, completion: @escaping (ClientRuntime.SdkResult<DescribeRoleAliasOutputResponse, DescribeRoleAliasOutputError>) -> Void)
```

### `describeScheduledAudit(input:completion:)`

Gets information about a scheduled audit.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeScheduledAudit action.

``` swift
public func describeScheduledAudit(input: DescribeScheduledAuditInput, completion: @escaping (ClientRuntime.SdkResult<DescribeScheduledAuditOutputResponse, DescribeScheduledAuditOutputError>) -> Void)
```

### `describeSecurityProfile(input:completion:)`

Gets information about a Device Defender security profile.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeSecurityProfile action.

``` swift
public func describeSecurityProfile(input: DescribeSecurityProfileInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSecurityProfileOutputResponse, DescribeSecurityProfileOutputError>) -> Void)
```

### `describeStream(input:completion:)`

Gets information about a stream.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeStream action.

``` swift
public func describeStream(input: DescribeStreamInput, completion: @escaping (ClientRuntime.SdkResult<DescribeStreamOutputResponse, DescribeStreamOutputError>) -> Void)
```

### `describeThing(input:completion:)`

Gets information about the specified thing.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeThing action.

``` swift
public func describeThing(input: DescribeThingInput, completion: @escaping (ClientRuntime.SdkResult<DescribeThingOutputResponse, DescribeThingOutputError>) -> Void)
```

### `describeThingGroup(input:completion:)`

Describe a thing group.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeThingGroup action.

``` swift
public func describeThingGroup(input: DescribeThingGroupInput, completion: @escaping (ClientRuntime.SdkResult<DescribeThingGroupOutputResponse, DescribeThingGroupOutputError>) -> Void)
```

### `describeThingRegistrationTask(input:completion:)`

Describes a bulk thing provisioning task.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeThingRegistrationTask action.

``` swift
public func describeThingRegistrationTask(input: DescribeThingRegistrationTaskInput, completion: @escaping (ClientRuntime.SdkResult<DescribeThingRegistrationTaskOutputResponse, DescribeThingRegistrationTaskOutputError>) -> Void)
```

### `describeThingType(input:completion:)`

Gets information about the specified thing type.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DescribeThingType action.

``` swift
public func describeThingType(input: DescribeThingTypeInput, completion: @escaping (ClientRuntime.SdkResult<DescribeThingTypeOutputResponse, DescribeThingTypeOutputError>) -> Void)
```

### `detachPolicy(input:completion:)`

Detaches a policy from the specified target.

``` swift
public func detachPolicy(input: DetachPolicyInput, completion: @escaping (ClientRuntime.SdkResult<DetachPolicyOutputResponse, DetachPolicyOutputError>) -> Void)
```

``` 
        Because of the distributed nature of Amazon Web Services, it can take up to five minutes after
     a policy is detached before it's ready to be deleted.

     Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DetachPolicy action.
```

### `detachPrincipalPolicy(input:completion:)`

Removes the specified policy from the specified certificate.

``` swift
@available(*, deprecated)
    public func detachPrincipalPolicy(input: DetachPrincipalPolicyInput, completion: @escaping (ClientRuntime.SdkResult<DetachPrincipalPolicyOutputResponse, DetachPrincipalPolicyOutputError>) -> Void)
```

``` 
        This action is deprecated. Please use DetachPolicy instead.

     Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DetachPrincipalPolicy action.
```

### `detachSecurityProfile(input:completion:)`

Disassociates a Device Defender security profile from a thing group or from this account.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DetachSecurityProfile action.

``` swift
public func detachSecurityProfile(input: DetachSecurityProfileInput, completion: @escaping (ClientRuntime.SdkResult<DetachSecurityProfileOutputResponse, DetachSecurityProfileOutputError>) -> Void)
```

### `detachThingPrincipal(input:completion:)`

Detaches the specified principal from the specified thing. A principal can be X.509
certificates, IAM users, groups, and roles, Amazon Cognito identities or federated
identities.

``` swift
public func detachThingPrincipal(input: DetachThingPrincipalInput, completion: @escaping (ClientRuntime.SdkResult<DetachThingPrincipalOutputResponse, DetachThingPrincipalOutputError>) -> Void)
```

``` 
		         This call is asynchronous. It might take several seconds for the detachment to
			propagate.
	
	       Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DetachThingPrincipal action.
```

### `disableTopicRule(input:completion:)`

Disables the rule.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">DisableTopicRule action.

``` swift
public func disableTopicRule(input: DisableTopicRuleInput, completion: @escaping (ClientRuntime.SdkResult<DisableTopicRuleOutputResponse, DisableTopicRuleOutputError>) -> Void)
```

### `enableTopicRule(input:completion:)`

Enables the rule.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">EnableTopicRule action.

``` swift
public func enableTopicRule(input: EnableTopicRuleInput, completion: @escaping (ClientRuntime.SdkResult<EnableTopicRuleOutputResponse, EnableTopicRuleOutputError>) -> Void)
```

### `getBehaviorModelTrainingSummaries(input:completion:)`

Returns a Device Defender's ML Detect Security Profile training model's status.

``` swift
public func getBehaviorModelTrainingSummaries(input: GetBehaviorModelTrainingSummariesInput, completion: @escaping (ClientRuntime.SdkResult<GetBehaviorModelTrainingSummariesOutputResponse, GetBehaviorModelTrainingSummariesOutputError>) -> Void)
```

Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetBehaviorModelTrainingSummaries action.

### `getBucketsAggregation(input:completion:)`

Aggregates on indexed data with search queries pertaining to particular fields.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetBucketsAggregation action.

``` swift
public func getBucketsAggregation(input: GetBucketsAggregationInput, completion: @escaping (ClientRuntime.SdkResult<GetBucketsAggregationOutputResponse, GetBucketsAggregationOutputError>) -> Void)
```

### `getCardinality(input:completion:)`

Returns the approximate count of unique values that match the query.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetCardinality action.

``` swift
public func getCardinality(input: GetCardinalityInput, completion: @escaping (ClientRuntime.SdkResult<GetCardinalityOutputResponse, GetCardinalityOutputError>) -> Void)
```

### `getEffectivePolicies(input:completion:)`

Gets a list of the policies that have an effect on the authorization behavior of the
specified device when it connects to the IoT device gateway.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetEffectivePolicies action.

``` swift
public func getEffectivePolicies(input: GetEffectivePoliciesInput, completion: @escaping (ClientRuntime.SdkResult<GetEffectivePoliciesOutputResponse, GetEffectivePoliciesOutputError>) -> Void)
```

### `getIndexingConfiguration(input:completion:)`

Gets the indexing configuration.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetIndexingConfiguration action.

``` swift
public func getIndexingConfiguration(input: GetIndexingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetIndexingConfigurationOutputResponse, GetIndexingConfigurationOutputError>) -> Void)
```

### `getJobDocument(input:completion:)`

Gets a job document.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetJobDocument action.

``` swift
public func getJobDocument(input: GetJobDocumentInput, completion: @escaping (ClientRuntime.SdkResult<GetJobDocumentOutputResponse, GetJobDocumentOutputError>) -> Void)
```

### `getLoggingOptions(input:completion:)`

Gets the logging options.
NOTE:​ use of this command is not recommended. Use GetV2LoggingOptions
instead.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetLoggingOptions action.

``` swift
public func getLoggingOptions(input: GetLoggingOptionsInput, completion: @escaping (ClientRuntime.SdkResult<GetLoggingOptionsOutputResponse, GetLoggingOptionsOutputError>) -> Void)
```

### `getOTAUpdate(input:completion:)`

Gets an OTA update.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetOTAUpdate action.

``` swift
public func getOTAUpdate(input: GetOTAUpdateInput, completion: @escaping (ClientRuntime.SdkResult<GetOTAUpdateOutputResponse, GetOTAUpdateOutputError>) -> Void)
```

### `getPercentiles(input:completion:)`

Groups the aggregated values that match the query into percentile groupings. The default
percentile groupings are:​ 1,5,25,50,75,95,99, although you can specify your own
when you call GetPercentiles. This function returns a value for each
percentile group specified (or the default percentile groupings). The percentile group
"1" contains the aggregated field value that occurs in approximately one percent of the
values that match the query. The percentile group "5" contains the aggregated field value
that occurs in approximately five percent of the values that match the query, and so on.
The result is an approximation, the more values that match the query, the more accurate
the percentile values.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetPercentiles action.

``` swift
public func getPercentiles(input: GetPercentilesInput, completion: @escaping (ClientRuntime.SdkResult<GetPercentilesOutputResponse, GetPercentilesOutputError>) -> Void)
```

### `getPolicy(input:completion:)`

Gets information about the specified policy with the policy document of the default
version.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetPolicy action.

``` swift
public func getPolicy(input: GetPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetPolicyOutputResponse, GetPolicyOutputError>) -> Void)
```

### `getPolicyVersion(input:completion:)`

Gets information about the specified policy version.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetPolicyVersion action.

``` swift
public func getPolicyVersion(input: GetPolicyVersionInput, completion: @escaping (ClientRuntime.SdkResult<GetPolicyVersionOutputResponse, GetPolicyVersionOutputError>) -> Void)
```

### `getRegistrationCode(input:completion:)`

Gets a registration code used to register a CA certificate with IoT.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetRegistrationCode action.

``` swift
public func getRegistrationCode(input: GetRegistrationCodeInput, completion: @escaping (ClientRuntime.SdkResult<GetRegistrationCodeOutputResponse, GetRegistrationCodeOutputError>) -> Void)
```

### `getStatistics(input:completion:)`

Returns the count, average, sum, minimum, maximum, sum of squares, variance,
and standard deviation for the specified aggregated field. If the aggregation field is of type
String, only the count statistic is returned.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetStatistics action.

``` swift
public func getStatistics(input: GetStatisticsInput, completion: @escaping (ClientRuntime.SdkResult<GetStatisticsOutputResponse, GetStatisticsOutputError>) -> Void)
```

### `getTopicRule(input:completion:)`

Gets information about the rule.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetTopicRule action.

``` swift
public func getTopicRule(input: GetTopicRuleInput, completion: @escaping (ClientRuntime.SdkResult<GetTopicRuleOutputResponse, GetTopicRuleOutputError>) -> Void)
```

### `getTopicRuleDestination(input:completion:)`

Gets information about a topic rule destination.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetTopicRuleDestination action.

``` swift
public func getTopicRuleDestination(input: GetTopicRuleDestinationInput, completion: @escaping (ClientRuntime.SdkResult<GetTopicRuleDestinationOutputResponse, GetTopicRuleDestinationOutputError>) -> Void)
```

### `getV2LoggingOptions(input:completion:)`

Gets the fine grained logging options.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">GetV2LoggingOptions action.

``` swift
public func getV2LoggingOptions(input: GetV2LoggingOptionsInput, completion: @escaping (ClientRuntime.SdkResult<GetV2LoggingOptionsOutputResponse, GetV2LoggingOptionsOutputError>) -> Void)
```

### `listActiveViolations(input:completion:)`

Lists the active violations for a given Device Defender security profile.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListActiveViolations action.

``` swift
public func listActiveViolations(input: ListActiveViolationsInput, completion: @escaping (ClientRuntime.SdkResult<ListActiveViolationsOutputResponse, ListActiveViolationsOutputError>) -> Void)
```

### `listAttachedPolicies(input:completion:)`

Lists the policies attached to the specified thing group.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListAttachedPolicies action.

``` swift
public func listAttachedPolicies(input: ListAttachedPoliciesInput, completion: @escaping (ClientRuntime.SdkResult<ListAttachedPoliciesOutputResponse, ListAttachedPoliciesOutputError>) -> Void)
```

### `listAuditFindings(input:completion:)`

Lists the findings (results) of a Device Defender audit or of the audits
performed during a specified time period. (Findings are retained for 90 days.)
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListAuditFindings action.

``` swift
public func listAuditFindings(input: ListAuditFindingsInput, completion: @escaping (ClientRuntime.SdkResult<ListAuditFindingsOutputResponse, ListAuditFindingsOutputError>) -> Void)
```

### `listAuditMitigationActionsExecutions(input:completion:)`

Gets the status of audit mitigation action tasks that were
executed.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListAuditMitigationActionsExecutions action.

``` swift
public func listAuditMitigationActionsExecutions(input: ListAuditMitigationActionsExecutionsInput, completion: @escaping (ClientRuntime.SdkResult<ListAuditMitigationActionsExecutionsOutputResponse, ListAuditMitigationActionsExecutionsOutputError>) -> Void)
```

### `listAuditMitigationActionsTasks(input:completion:)`

Gets a list of audit mitigation action tasks that match the specified filters.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListAuditMitigationActionsTasks action.

``` swift
public func listAuditMitigationActionsTasks(input: ListAuditMitigationActionsTasksInput, completion: @escaping (ClientRuntime.SdkResult<ListAuditMitigationActionsTasksOutputResponse, ListAuditMitigationActionsTasksOutputError>) -> Void)
```

### `listAuditSuppressions(input:completion:)`

Lists your Device Defender audit listings.

``` swift
public func listAuditSuppressions(input: ListAuditSuppressionsInput, completion: @escaping (ClientRuntime.SdkResult<ListAuditSuppressionsOutputResponse, ListAuditSuppressionsOutputError>) -> Void)
```

Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListAuditSuppressions action.

### `listAuditTasks(input:completion:)`

Lists the Device Defender audits that have been performed during a given
time period.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListAuditTasks action.

``` swift
public func listAuditTasks(input: ListAuditTasksInput, completion: @escaping (ClientRuntime.SdkResult<ListAuditTasksOutputResponse, ListAuditTasksOutputError>) -> Void)
```

### `listAuthorizers(input:completion:)`

Lists the authorizers registered in your account.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListAuthorizers action.

``` swift
public func listAuthorizers(input: ListAuthorizersInput, completion: @escaping (ClientRuntime.SdkResult<ListAuthorizersOutputResponse, ListAuthorizersOutputError>) -> Void)
```

### `listBillingGroups(input:completion:)`

Lists the billing groups you have created.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListBillingGroups action.

``` swift
public func listBillingGroups(input: ListBillingGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListBillingGroupsOutputResponse, ListBillingGroupsOutputError>) -> Void)
```

### `listCACertificates(input:completion:)`

Lists the CA certificates registered for your Amazon Web Services account.
The results are paginated with a default page size of 25. You can use the returned
marker to retrieve additional results.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListCACertificates action.

``` swift
public func listCACertificates(input: ListCACertificatesInput, completion: @escaping (ClientRuntime.SdkResult<ListCACertificatesOutputResponse, ListCACertificatesOutputError>) -> Void)
```

### `listCertificates(input:completion:)`

Lists the certificates registered in your Amazon Web Services account.
The results are paginated with a default page size of 25. You can use the returned
marker to retrieve additional results.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListCertificates action.

``` swift
public func listCertificates(input: ListCertificatesInput, completion: @escaping (ClientRuntime.SdkResult<ListCertificatesOutputResponse, ListCertificatesOutputError>) -> Void)
```

### `listCertificatesByCA(input:completion:)`

List the device certificates signed by the specified CA certificate.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListCertificatesByCA action.

``` swift
public func listCertificatesByCA(input: ListCertificatesByCAInput, completion: @escaping (ClientRuntime.SdkResult<ListCertificatesByCAOutputResponse, ListCertificatesByCAOutputError>) -> Void)
```

### `listCustomMetrics(input:completion:)`

Lists your Device Defender detect custom metrics.

``` swift
public func listCustomMetrics(input: ListCustomMetricsInput, completion: @escaping (ClientRuntime.SdkResult<ListCustomMetricsOutputResponse, ListCustomMetricsOutputError>) -> Void)
```

Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListCustomMetrics action.

### `listDetectMitigationActionsExecutions(input:completion:)`

Lists mitigation actions executions for a Device Defender ML Detect Security Profile.

``` swift
public func listDetectMitigationActionsExecutions(input: ListDetectMitigationActionsExecutionsInput, completion: @escaping (ClientRuntime.SdkResult<ListDetectMitigationActionsExecutionsOutputResponse, ListDetectMitigationActionsExecutionsOutputError>) -> Void)
```

Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListDetectMitigationActionsExecutions action.

### `listDetectMitigationActionsTasks(input:completion:)`

List of Device Defender ML Detect mitigation actions tasks.

``` swift
public func listDetectMitigationActionsTasks(input: ListDetectMitigationActionsTasksInput, completion: @escaping (ClientRuntime.SdkResult<ListDetectMitigationActionsTasksOutputResponse, ListDetectMitigationActionsTasksOutputError>) -> Void)
```

Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListDetectMitigationActionsTasks action.

### `listDimensions(input:completion:)`

List the set of dimensions that are defined for your Amazon Web Services accounts.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListDimensions action.

``` swift
public func listDimensions(input: ListDimensionsInput, completion: @escaping (ClientRuntime.SdkResult<ListDimensionsOutputResponse, ListDimensionsOutputError>) -> Void)
```

### `listDomainConfigurations(input:completion:)`

Gets a list of domain configurations for the user. This list is sorted
alphabetically by domain configuration name.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListDomainConfigurations action.

``` swift
public func listDomainConfigurations(input: ListDomainConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<ListDomainConfigurationsOutputResponse, ListDomainConfigurationsOutputError>) -> Void)
```

### `listFleetMetrics(input:completion:)`

Lists all your fleet metrics.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListFleetMetrics action.

``` swift
public func listFleetMetrics(input: ListFleetMetricsInput, completion: @escaping (ClientRuntime.SdkResult<ListFleetMetricsOutputResponse, ListFleetMetricsOutputError>) -> Void)
```

### `listIndices(input:completion:)`

Lists the search indices.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListIndices action.

``` swift
public func listIndices(input: ListIndicesInput, completion: @escaping (ClientRuntime.SdkResult<ListIndicesOutputResponse, ListIndicesOutputError>) -> Void)
```

### `listJobExecutionsForJob(input:completion:)`

Lists the job executions for a job.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListJobExecutionsForJob action.

``` swift
public func listJobExecutionsForJob(input: ListJobExecutionsForJobInput, completion: @escaping (ClientRuntime.SdkResult<ListJobExecutionsForJobOutputResponse, ListJobExecutionsForJobOutputError>) -> Void)
```

### `listJobExecutionsForThing(input:completion:)`

Lists the job executions for the specified thing.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListJobExecutionsForThing action.

``` swift
public func listJobExecutionsForThing(input: ListJobExecutionsForThingInput, completion: @escaping (ClientRuntime.SdkResult<ListJobExecutionsForThingOutputResponse, ListJobExecutionsForThingOutputError>) -> Void)
```

### `listJobTemplates(input:completion:)`

Returns a list of job templates.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListJobTemplates action.

``` swift
public func listJobTemplates(input: ListJobTemplatesInput, completion: @escaping (ClientRuntime.SdkResult<ListJobTemplatesOutputResponse, ListJobTemplatesOutputError>) -> Void)
```

### `listJobs(input:completion:)`

Lists jobs.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListJobs action.

``` swift
public func listJobs(input: ListJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListJobsOutputResponse, ListJobsOutputError>) -> Void)
```

### `listMitigationActions(input:completion:)`

Gets a list of all mitigation actions that match the specified filter criteria.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListMitigationActions action.

``` swift
public func listMitigationActions(input: ListMitigationActionsInput, completion: @escaping (ClientRuntime.SdkResult<ListMitigationActionsOutputResponse, ListMitigationActionsOutputError>) -> Void)
```

### `listOTAUpdates(input:completion:)`

Lists OTA updates.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListOTAUpdates action.

``` swift
public func listOTAUpdates(input: ListOTAUpdatesInput, completion: @escaping (ClientRuntime.SdkResult<ListOTAUpdatesOutputResponse, ListOTAUpdatesOutputError>) -> Void)
```

### `listOutgoingCertificates(input:completion:)`

Lists certificates that are being transferred but not yet accepted.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListOutgoingCertificates action.

``` swift
public func listOutgoingCertificates(input: ListOutgoingCertificatesInput, completion: @escaping (ClientRuntime.SdkResult<ListOutgoingCertificatesOutputResponse, ListOutgoingCertificatesOutputError>) -> Void)
```

### `listPolicies(input:completion:)`

Lists your policies.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListPolicies action.

``` swift
public func listPolicies(input: ListPoliciesInput, completion: @escaping (ClientRuntime.SdkResult<ListPoliciesOutputResponse, ListPoliciesOutputError>) -> Void)
```

### `listPolicyPrincipals(input:completion:)`

Lists the principals associated with the specified policy.

``` swift
@available(*, deprecated)
    public func listPolicyPrincipals(input: ListPolicyPrincipalsInput, completion: @escaping (ClientRuntime.SdkResult<ListPolicyPrincipalsOutputResponse, ListPolicyPrincipalsOutputError>) -> Void)
```

``` 
        Note: This action is deprecated. Please use ListTargetsForPolicy instead.
     Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListPolicyPrincipals action.
```

### `listPolicyVersions(input:completion:)`

Lists the versions of the specified policy and identifies the default
version.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListPolicyVersions action.

``` swift
public func listPolicyVersions(input: ListPolicyVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListPolicyVersionsOutputResponse, ListPolicyVersionsOutputError>) -> Void)
```

### `listPrincipalPolicies(input:completion:)`

Lists the policies attached to the specified principal. If you use an Cognito
identity, the ID must be in <a href="https:​//docs.aws.amazon.com/cognitoidentity/latest/APIReference/API_GetCredentialsForIdentity.html#API_GetCredentialsForIdentity_RequestSyntax">AmazonCognito Identity format.

``` swift
@available(*, deprecated)
    public func listPrincipalPolicies(input: ListPrincipalPoliciesInput, completion: @escaping (ClientRuntime.SdkResult<ListPrincipalPoliciesOutputResponse, ListPrincipalPoliciesOutputError>) -> Void)
```

``` 
        Note: This action is deprecated. Please use ListAttachedPolicies instead.
     Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListPrincipalPolicies action.
```

### `listPrincipalThings(input:completion:)`

Lists the things associated with the specified principal. A principal can be X.509
certificates, IAM users, groups, and roles, Amazon Cognito identities or federated
identities.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListPrincipalThings action.

``` swift
public func listPrincipalThings(input: ListPrincipalThingsInput, completion: @escaping (ClientRuntime.SdkResult<ListPrincipalThingsOutputResponse, ListPrincipalThingsOutputError>) -> Void)
```

### `listProvisioningTemplateVersions(input:completion:)`

A list of fleet provisioning template versions.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListProvisioningTemplateVersions action.

``` swift
public func listProvisioningTemplateVersions(input: ListProvisioningTemplateVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListProvisioningTemplateVersionsOutputResponse, ListProvisioningTemplateVersionsOutputError>) -> Void)
```

### `listProvisioningTemplates(input:completion:)`

Lists the fleet provisioning templates in your Amazon Web Services account.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListProvisioningTemplates action.

``` swift
public func listProvisioningTemplates(input: ListProvisioningTemplatesInput, completion: @escaping (ClientRuntime.SdkResult<ListProvisioningTemplatesOutputResponse, ListProvisioningTemplatesOutputError>) -> Void)
```

### `listRoleAliases(input:completion:)`

Lists the role aliases registered in your account.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListRoleAliases action.

``` swift
public func listRoleAliases(input: ListRoleAliasesInput, completion: @escaping (ClientRuntime.SdkResult<ListRoleAliasesOutputResponse, ListRoleAliasesOutputError>) -> Void)
```

### `listScheduledAudits(input:completion:)`

Lists all of your scheduled audits.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListScheduledAudits action.

``` swift
public func listScheduledAudits(input: ListScheduledAuditsInput, completion: @escaping (ClientRuntime.SdkResult<ListScheduledAuditsOutputResponse, ListScheduledAuditsOutputError>) -> Void)
```

### `listSecurityProfiles(input:completion:)`

Lists the Device Defender security profiles
you've
created. You can filter security profiles by dimension or custom metric.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListSecurityProfiles action.

``` swift
public func listSecurityProfiles(input: ListSecurityProfilesInput, completion: @escaping (ClientRuntime.SdkResult<ListSecurityProfilesOutputResponse, ListSecurityProfilesOutputError>) -> Void)
```

``` 
           dimensionName and metricName cannot be used in the same request.
```

### `listSecurityProfilesForTarget(input:completion:)`

Lists the Device Defender security profiles attached to a target (thing group).
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListSecurityProfilesForTarget action.

``` swift
public func listSecurityProfilesForTarget(input: ListSecurityProfilesForTargetInput, completion: @escaping (ClientRuntime.SdkResult<ListSecurityProfilesForTargetOutputResponse, ListSecurityProfilesForTargetOutputError>) -> Void)
```

### `listStreams(input:completion:)`

Lists all of the streams in your Amazon Web Services account.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListStreams action.

``` swift
public func listStreams(input: ListStreamsInput, completion: @escaping (ClientRuntime.SdkResult<ListStreamsOutputResponse, ListStreamsOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Lists the tags (metadata) you have assigned to the resource.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListTagsForResource action.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `listTargetsForPolicy(input:completion:)`

List targets for the specified policy.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListTargetsForPolicy action.

``` swift
public func listTargetsForPolicy(input: ListTargetsForPolicyInput, completion: @escaping (ClientRuntime.SdkResult<ListTargetsForPolicyOutputResponse, ListTargetsForPolicyOutputError>) -> Void)
```

### `listTargetsForSecurityProfile(input:completion:)`

Lists the targets (thing groups) associated with a given Device Defender security profile.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListTargetsForSecurityProfile action.

``` swift
public func listTargetsForSecurityProfile(input: ListTargetsForSecurityProfileInput, completion: @escaping (ClientRuntime.SdkResult<ListTargetsForSecurityProfileOutputResponse, ListTargetsForSecurityProfileOutputError>) -> Void)
```

### `listThingGroups(input:completion:)`

List the thing groups in your account.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListThingGroups action.

``` swift
public func listThingGroups(input: ListThingGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListThingGroupsOutputResponse, ListThingGroupsOutputError>) -> Void)
```

### `listThingGroupsForThing(input:completion:)`

List the thing groups to which the specified thing belongs.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListThingGroupsForThing action.

``` swift
public func listThingGroupsForThing(input: ListThingGroupsForThingInput, completion: @escaping (ClientRuntime.SdkResult<ListThingGroupsForThingOutputResponse, ListThingGroupsForThingOutputError>) -> Void)
```

### `listThingPrincipals(input:completion:)`

Lists the principals associated with the specified thing. A principal can be X.509
certificates, IAM users, groups, and roles, Amazon Cognito identities or federated
identities.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListThingPrincipals action.

``` swift
public func listThingPrincipals(input: ListThingPrincipalsInput, completion: @escaping (ClientRuntime.SdkResult<ListThingPrincipalsOutputResponse, ListThingPrincipalsOutputError>) -> Void)
```

### `listThingRegistrationTaskReports(input:completion:)`

Information about the thing registration tasks.

``` swift
public func listThingRegistrationTaskReports(input: ListThingRegistrationTaskReportsInput, completion: @escaping (ClientRuntime.SdkResult<ListThingRegistrationTaskReportsOutputResponse, ListThingRegistrationTaskReportsOutputError>) -> Void)
```

### `listThingRegistrationTasks(input:completion:)`

List bulk thing provisioning tasks.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListThingRegistrationTasks action.

``` swift
public func listThingRegistrationTasks(input: ListThingRegistrationTasksInput, completion: @escaping (ClientRuntime.SdkResult<ListThingRegistrationTasksOutputResponse, ListThingRegistrationTasksOutputError>) -> Void)
```

### `listThingTypes(input:completion:)`

Lists the existing thing types.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListThingTypes action.

``` swift
public func listThingTypes(input: ListThingTypesInput, completion: @escaping (ClientRuntime.SdkResult<ListThingTypesOutputResponse, ListThingTypesOutputError>) -> Void)
```

### `listThings(input:completion:)`

Lists your things. Use the attributeName and
attributeValue parameters to filter your things.
For example, calling ListThings with attributeName=Color and
attributeValue=Red retrieves all things in the registry that contain an attribute
Color with the value Red.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListThings action.

``` swift
public func listThings(input: ListThingsInput, completion: @escaping (ClientRuntime.SdkResult<ListThingsOutputResponse, ListThingsOutputError>) -> Void)
```

``` 
		         You will not be charged for calling this API if an Access denied error is returned. You will also not be charged if no attributes or pagination token was provided in request and no pagination token and no results were returned.
```

### `listThingsInBillingGroup(input:completion:)`

Lists the things you have added to the given billing group.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListThingsInBillingGroup action.

``` swift
public func listThingsInBillingGroup(input: ListThingsInBillingGroupInput, completion: @escaping (ClientRuntime.SdkResult<ListThingsInBillingGroupOutputResponse, ListThingsInBillingGroupOutputError>) -> Void)
```

### `listThingsInThingGroup(input:completion:)`

Lists the things in the specified group.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListThingsInThingGroup action.

``` swift
public func listThingsInThingGroup(input: ListThingsInThingGroupInput, completion: @escaping (ClientRuntime.SdkResult<ListThingsInThingGroupOutputResponse, ListThingsInThingGroupOutputError>) -> Void)
```

### `listTopicRuleDestinations(input:completion:)`

Lists all the topic rule destinations in your Amazon Web Services account.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListTopicRuleDestinations action.

``` swift
public func listTopicRuleDestinations(input: ListTopicRuleDestinationsInput, completion: @escaping (ClientRuntime.SdkResult<ListTopicRuleDestinationsOutputResponse, ListTopicRuleDestinationsOutputError>) -> Void)
```

### `listTopicRules(input:completion:)`

Lists the rules for the specific topic.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListTopicRules action.

``` swift
public func listTopicRules(input: ListTopicRulesInput, completion: @escaping (ClientRuntime.SdkResult<ListTopicRulesOutputResponse, ListTopicRulesOutputError>) -> Void)
```

### `listV2LoggingLevels(input:completion:)`

Lists logging levels.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListV2LoggingLevels action.

``` swift
public func listV2LoggingLevels(input: ListV2LoggingLevelsInput, completion: @escaping (ClientRuntime.SdkResult<ListV2LoggingLevelsOutputResponse, ListV2LoggingLevelsOutputError>) -> Void)
```

### `listViolationEvents(input:completion:)`

Lists the Device Defender security profile violations discovered during the given time period.
You can use filters to limit the results to those alerts issued for a particular security profile,
behavior, or thing (device).
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ListViolationEvents action.

``` swift
public func listViolationEvents(input: ListViolationEventsInput, completion: @escaping (ClientRuntime.SdkResult<ListViolationEventsOutputResponse, ListViolationEventsOutputError>) -> Void)
```

### `putVerificationStateOnViolation(input:completion:)`

Set a verification state and provide a description of that verification state on a violation (detect alarm).

``` swift
public func putVerificationStateOnViolation(input: PutVerificationStateOnViolationInput, completion: @escaping (ClientRuntime.SdkResult<PutVerificationStateOnViolationOutputResponse, PutVerificationStateOnViolationOutputError>) -> Void)
```

### `registerCACertificate(input:completion:)`

Registers a CA certificate with IoT. This CA certificate can then be used to sign
device certificates, which can be then registered with IoT. You can register up to 10
CA certificates per Amazon Web Services account that have the same subject field. This enables you to have
up to 10 certificate authorities sign your device certificates. If you have more than one
CA certificate registered, make sure you pass the CA certificate when you register your
device certificates with the RegisterCertificate action.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">RegisterCACertificate action.

``` swift
public func registerCACertificate(input: RegisterCACertificateInput, completion: @escaping (ClientRuntime.SdkResult<RegisterCACertificateOutputResponse, RegisterCACertificateOutputError>) -> Void)
```

### `registerCertificate(input:completion:)`

Registers a device certificate with IoT. If you have more than one CA certificate
that has the same subject field, you must specify the CA certificate that was used to sign
the device certificate being registered.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">RegisterCertificate action.

``` swift
public func registerCertificate(input: RegisterCertificateInput, completion: @escaping (ClientRuntime.SdkResult<RegisterCertificateOutputResponse, RegisterCertificateOutputError>) -> Void)
```

### `registerCertificateWithoutCA(input:completion:)`

Register a certificate that does not have a certificate authority (CA).

``` swift
public func registerCertificateWithoutCA(input: RegisterCertificateWithoutCAInput, completion: @escaping (ClientRuntime.SdkResult<RegisterCertificateWithoutCAOutputResponse, RegisterCertificateWithoutCAOutputError>) -> Void)
```

### `registerThing(input:completion:)`

Provisions a thing in the device registry. RegisterThing calls other IoT control
plane APIs. These calls might exceed your account level <a href="https:​//docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits_iot">
IoT Throttling Limits and cause throttle errors. Please contact <a href="https:​//console.aws.amazon.com/support/home">Amazon Web Services Customer Support to raise
your throttling limits if necessary.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">RegisterThing action.

``` swift
public func registerThing(input: RegisterThingInput, completion: @escaping (ClientRuntime.SdkResult<RegisterThingOutputResponse, RegisterThingOutputError>) -> Void)
```

### `rejectCertificateTransfer(input:completion:)`

Rejects a pending certificate transfer. After IoT rejects a certificate transfer,
the certificate status changes from PENDING\_TRANSFER to
INACTIVE.
To check for pending certificate transfers, call ListCertificates
to enumerate your certificates.
This operation can only be called by the transfer destination. After it is called,
the certificate will be returned to the source's account in the INACTIVE state.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">RejectCertificateTransfer action.

``` swift
public func rejectCertificateTransfer(input: RejectCertificateTransferInput, completion: @escaping (ClientRuntime.SdkResult<RejectCertificateTransferOutputResponse, RejectCertificateTransferOutputError>) -> Void)
```

### `removeThingFromBillingGroup(input:completion:)`

Removes the given thing from the billing group.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">RemoveThingFromBillingGroup action.

``` swift
public func removeThingFromBillingGroup(input: RemoveThingFromBillingGroupInput, completion: @escaping (ClientRuntime.SdkResult<RemoveThingFromBillingGroupOutputResponse, RemoveThingFromBillingGroupOutputError>) -> Void)
```

### `removeThingFromThingGroup(input:completion:)`

Remove the specified thing from the specified group.
You must specify either a thingGroupArn or a
thingGroupName to identify the thing group and
either a thingArn or a thingName to
identify the thing to remove from the thing group.

``` swift
public func removeThingFromThingGroup(input: RemoveThingFromThingGroupInput, completion: @escaping (ClientRuntime.SdkResult<RemoveThingFromThingGroupOutputResponse, RemoveThingFromThingGroupOutputError>) -> Void)
```

``` 
	       Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">RemoveThingFromThingGroup action.
```

### `replaceTopicRule(input:completion:)`

Replaces the rule. You must specify all parameters for the new rule. Creating rules
is an administrator-level action. Any user who has permission to create rules will be able
to access data processed by the rule.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ReplaceTopicRule action.

``` swift
public func replaceTopicRule(input: ReplaceTopicRuleInput, completion: @escaping (ClientRuntime.SdkResult<ReplaceTopicRuleOutputResponse, ReplaceTopicRuleOutputError>) -> Void)
```

### `searchIndex(input:completion:)`

The query search index.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">SearchIndex action.

``` swift
public func searchIndex(input: SearchIndexInput, completion: @escaping (ClientRuntime.SdkResult<SearchIndexOutputResponse, SearchIndexOutputError>) -> Void)
```

### `setDefaultAuthorizer(input:completion:)`

Sets the default authorizer. This will be used if a websocket connection is made
without specifying an authorizer.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">SetDefaultAuthorizer action.

``` swift
public func setDefaultAuthorizer(input: SetDefaultAuthorizerInput, completion: @escaping (ClientRuntime.SdkResult<SetDefaultAuthorizerOutputResponse, SetDefaultAuthorizerOutputError>) -> Void)
```

### `setDefaultPolicyVersion(input:completion:)`

Sets the specified version of the specified policy as the policy's default
(operative) version. This action affects all certificates to which the policy is attached.
To list the principals the policy is attached to, use the ListPrincipalPolicies
action.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">SetDefaultPolicyVersion action.

``` swift
public func setDefaultPolicyVersion(input: SetDefaultPolicyVersionInput, completion: @escaping (ClientRuntime.SdkResult<SetDefaultPolicyVersionOutputResponse, SetDefaultPolicyVersionOutputError>) -> Void)
```

### `setLoggingOptions(input:completion:)`

Sets the logging options.
NOTE:​ use of this command is not recommended. Use SetV2LoggingOptions
instead.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">SetLoggingOptions action.

``` swift
public func setLoggingOptions(input: SetLoggingOptionsInput, completion: @escaping (ClientRuntime.SdkResult<SetLoggingOptionsOutputResponse, SetLoggingOptionsOutputError>) -> Void)
```

### `setV2LoggingLevel(input:completion:)`

Sets the logging level.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">SetV2LoggingLevel action.

``` swift
public func setV2LoggingLevel(input: SetV2LoggingLevelInput, completion: @escaping (ClientRuntime.SdkResult<SetV2LoggingLevelOutputResponse, SetV2LoggingLevelOutputError>) -> Void)
```

### `setV2LoggingOptions(input:completion:)`

Sets the logging options for the V2 logging service.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">SetV2LoggingOptions action.

``` swift
public func setV2LoggingOptions(input: SetV2LoggingOptionsInput, completion: @escaping (ClientRuntime.SdkResult<SetV2LoggingOptionsOutputResponse, SetV2LoggingOptionsOutputError>) -> Void)
```

### `startAuditMitigationActionsTask(input:completion:)`

Starts a task that applies a set of mitigation actions to the specified target.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">StartAuditMitigationActionsTask action.

``` swift
public func startAuditMitigationActionsTask(input: StartAuditMitigationActionsTaskInput, completion: @escaping (ClientRuntime.SdkResult<StartAuditMitigationActionsTaskOutputResponse, StartAuditMitigationActionsTaskOutputError>) -> Void)
```

### `startDetectMitigationActionsTask(input:completion:)`

Starts a Device Defender ML Detect mitigation actions task.

``` swift
public func startDetectMitigationActionsTask(input: StartDetectMitigationActionsTaskInput, completion: @escaping (ClientRuntime.SdkResult<StartDetectMitigationActionsTaskOutputResponse, StartDetectMitigationActionsTaskOutputError>) -> Void)
```

Requires permission to access the <a href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">StartDetectMitigationActionsTask action.

### `startOnDemandAuditTask(input:completion:)`

Starts an on-demand Device Defender audit.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">StartOnDemandAuditTask action.

``` swift
public func startOnDemandAuditTask(input: StartOnDemandAuditTaskInput, completion: @escaping (ClientRuntime.SdkResult<StartOnDemandAuditTaskOutputResponse, StartOnDemandAuditTaskOutputError>) -> Void)
```

### `startThingRegistrationTask(input:completion:)`

Creates a bulk thing provisioning task.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">StartThingRegistrationTask action.

``` swift
public func startThingRegistrationTask(input: StartThingRegistrationTaskInput, completion: @escaping (ClientRuntime.SdkResult<StartThingRegistrationTaskOutputResponse, StartThingRegistrationTaskOutputError>) -> Void)
```

### `stopThingRegistrationTask(input:completion:)`

Cancels a bulk thing provisioning task.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">StopThingRegistrationTask action.

``` swift
public func stopThingRegistrationTask(input: StopThingRegistrationTaskInput, completion: @escaping (ClientRuntime.SdkResult<StopThingRegistrationTaskOutputResponse, StopThingRegistrationTaskOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Adds to or modifies the tags of the given resource. Tags are metadata which can be
used to manage a resource.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">TagResource action.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `testAuthorization(input:completion:)`

Tests if a specified principal is authorized to perform an IoT action on a
specified resource. Use this to test and debug the authorization behavior of devices that
connect to the IoT device gateway.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">TestAuthorization action.

``` swift
public func testAuthorization(input: TestAuthorizationInput, completion: @escaping (ClientRuntime.SdkResult<TestAuthorizationOutputResponse, TestAuthorizationOutputError>) -> Void)
```

### `testInvokeAuthorizer(input:completion:)`

Tests a custom authorization behavior by invoking a specified custom authorizer. Use
this to test and debug the custom authorization behavior of devices that connect to the IoT
device gateway.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">TestInvokeAuthorizer action.

``` swift
public func testInvokeAuthorizer(input: TestInvokeAuthorizerInput, completion: @escaping (ClientRuntime.SdkResult<TestInvokeAuthorizerOutputResponse, TestInvokeAuthorizerOutputError>) -> Void)
```

### `transferCertificate(input:completion:)`

Transfers the specified certificate to the specified Amazon Web Services account.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">TransferCertificate action.

``` swift
public func transferCertificate(input: TransferCertificateInput, completion: @escaping (ClientRuntime.SdkResult<TransferCertificateOutputResponse, TransferCertificateOutputError>) -> Void)
```

``` 
     You can cancel the transfer until it is acknowledged by the recipient.
     No notification is sent to the transfer destination's account. It is up to the caller
     to notify the transfer target.
     The certificate being transferred must not be in the ACTIVE state. You can use the
     UpdateCertificate action to deactivate it.
     The certificate must not have any policies attached to it. You can use the
     DetachPolicy action to detach them.
```

### `untagResource(input:completion:)`

Removes the given tags (metadata) from the resource.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UntagResource action.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateAccountAuditConfiguration(input:completion:)`

Configures or reconfigures the Device Defender audit settings for this account.
Settings include how audit notifications are sent and which audit checks are
enabled or disabled.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateAccountAuditConfiguration action.

``` swift
public func updateAccountAuditConfiguration(input: UpdateAccountAuditConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAccountAuditConfigurationOutputResponse, UpdateAccountAuditConfigurationOutputError>) -> Void)
```

### `updateAuditSuppression(input:completion:)`

Updates a Device Defender audit suppression.

``` swift
public func updateAuditSuppression(input: UpdateAuditSuppressionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAuditSuppressionOutputResponse, UpdateAuditSuppressionOutputError>) -> Void)
```

### `updateAuthorizer(input:completion:)`

Updates an authorizer.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateAuthorizer action.

``` swift
public func updateAuthorizer(input: UpdateAuthorizerInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAuthorizerOutputResponse, UpdateAuthorizerOutputError>) -> Void)
```

### `updateBillingGroup(input:completion:)`

Updates information about the billing group.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateBillingGroup action.

``` swift
public func updateBillingGroup(input: UpdateBillingGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateBillingGroupOutputResponse, UpdateBillingGroupOutputError>) -> Void)
```

### `updateCACertificate(input:completion:)`

Updates a registered CA certificate.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateCACertificate action.

``` swift
public func updateCACertificate(input: UpdateCACertificateInput, completion: @escaping (ClientRuntime.SdkResult<UpdateCACertificateOutputResponse, UpdateCACertificateOutputError>) -> Void)
```

### `updateCertificate(input:completion:)`

Updates the status of the specified certificate. This operation is
idempotent.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateCertificate action.

``` swift
public func updateCertificate(input: UpdateCertificateInput, completion: @escaping (ClientRuntime.SdkResult<UpdateCertificateOutputResponse, UpdateCertificateOutputError>) -> Void)
```

``` 
     Certificates must be in the ACTIVE state to authenticate devices that use
     a certificate to connect to IoT.
     Within a few minutes of updating a certificate from the ACTIVE state to any other
     state, IoT disconnects all devices that used that certificate to connect. Devices cannot
     use a certificate that is not in the ACTIVE state to reconnect.
```

### `updateCustomMetric(input:completion:)`

Updates a
Device Defender detect custom metric.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateCustomMetric action.

``` swift
public func updateCustomMetric(input: UpdateCustomMetricInput, completion: @escaping (ClientRuntime.SdkResult<UpdateCustomMetricOutputResponse, UpdateCustomMetricOutputError>) -> Void)
```

### `updateDimension(input:completion:)`

Updates the definition for a dimension. You
cannot
change the type of a dimension after
it is created (you can delete it and
recreate
it).
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateDimension action.

``` swift
public func updateDimension(input: UpdateDimensionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDimensionOutputResponse, UpdateDimensionOutputError>) -> Void)
```

### `updateDomainConfiguration(input:completion:)`

Updates values stored in the domain configuration. Domain configurations for default
endpoints can't be updated.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateDomainConfiguration action.

``` swift
public func updateDomainConfiguration(input: UpdateDomainConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDomainConfigurationOutputResponse, UpdateDomainConfigurationOutputError>) -> Void)
```

### `updateDynamicThingGroup(input:completion:)`

Updates a dynamic thing group.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateDynamicThingGroup action.

``` swift
public func updateDynamicThingGroup(input: UpdateDynamicThingGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDynamicThingGroupOutputResponse, UpdateDynamicThingGroupOutputError>) -> Void)
```

### `updateEventConfigurations(input:completion:)`

Updates the event configurations.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateEventConfigurations action.

``` swift
public func updateEventConfigurations(input: UpdateEventConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateEventConfigurationsOutputResponse, UpdateEventConfigurationsOutputError>) -> Void)
```

### `updateFleetMetric(input:completion:)`

Updates the data for a fleet metric.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateFleetMetric action.

``` swift
public func updateFleetMetric(input: UpdateFleetMetricInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFleetMetricOutputResponse, UpdateFleetMetricOutputError>) -> Void)
```

### `updateIndexingConfiguration(input:completion:)`

Updates the search configuration.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateIndexingConfiguration action.

``` swift
public func updateIndexingConfiguration(input: UpdateIndexingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateIndexingConfigurationOutputResponse, UpdateIndexingConfigurationOutputError>) -> Void)
```

### `updateJob(input:completion:)`

Updates supported fields of the specified job.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateJob action.

``` swift
public func updateJob(input: UpdateJobInput, completion: @escaping (ClientRuntime.SdkResult<UpdateJobOutputResponse, UpdateJobOutputError>) -> Void)
```

### `updateMitigationAction(input:completion:)`

Updates the definition for the specified mitigation action.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateMitigationAction action.

``` swift
public func updateMitigationAction(input: UpdateMitigationActionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateMitigationActionOutputResponse, UpdateMitigationActionOutputError>) -> Void)
```

### `updateProvisioningTemplate(input:completion:)`

Updates a fleet provisioning template.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateProvisioningTemplate action.

``` swift
public func updateProvisioningTemplate(input: UpdateProvisioningTemplateInput, completion: @escaping (ClientRuntime.SdkResult<UpdateProvisioningTemplateOutputResponse, UpdateProvisioningTemplateOutputError>) -> Void)
```

### `updateRoleAlias(input:completion:)`

Updates a role alias.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateRoleAlias action.

``` swift
public func updateRoleAlias(input: UpdateRoleAliasInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRoleAliasOutputResponse, UpdateRoleAliasOutputError>) -> Void)
```

### `updateScheduledAudit(input:completion:)`

Updates a scheduled audit, including which checks are performed and
how often the audit takes place.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateScheduledAudit action.

``` swift
public func updateScheduledAudit(input: UpdateScheduledAuditInput, completion: @escaping (ClientRuntime.SdkResult<UpdateScheduledAuditOutputResponse, UpdateScheduledAuditOutputError>) -> Void)
```

### `updateSecurityProfile(input:completion:)`

Updates a Device Defender security profile.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateSecurityProfile action.

``` swift
public func updateSecurityProfile(input: UpdateSecurityProfileInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSecurityProfileOutputResponse, UpdateSecurityProfileOutputError>) -> Void)
```

### `updateStream(input:completion:)`

Updates an existing stream. The stream version will be incremented by one.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateStream action.

``` swift
public func updateStream(input: UpdateStreamInput, completion: @escaping (ClientRuntime.SdkResult<UpdateStreamOutputResponse, UpdateStreamOutputError>) -> Void)
```

### `updateThing(input:completion:)`

Updates the data for a thing.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateThing action.

``` swift
public func updateThing(input: UpdateThingInput, completion: @escaping (ClientRuntime.SdkResult<UpdateThingOutputResponse, UpdateThingOutputError>) -> Void)
```

### `updateThingGroup(input:completion:)`

Update a thing group.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateThingGroup action.

``` swift
public func updateThingGroup(input: UpdateThingGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdateThingGroupOutputResponse, UpdateThingGroupOutputError>) -> Void)
```

### `updateThingGroupsForThing(input:completion:)`

Updates the groups to which the thing belongs.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateThingGroupsForThing action.

``` swift
public func updateThingGroupsForThing(input: UpdateThingGroupsForThingInput, completion: @escaping (ClientRuntime.SdkResult<UpdateThingGroupsForThingOutputResponse, UpdateThingGroupsForThingOutputError>) -> Void)
```

### `updateTopicRuleDestination(input:completion:)`

Updates a topic rule destination. You use this to change the status, endpoint URL, or
confirmation URL of the destination.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">UpdateTopicRuleDestination action.

``` swift
public func updateTopicRuleDestination(input: UpdateTopicRuleDestinationInput, completion: @escaping (ClientRuntime.SdkResult<UpdateTopicRuleDestinationOutputResponse, UpdateTopicRuleDestinationOutputError>) -> Void)
```

### `validateSecurityProfileBehaviors(input:completion:)`

Validates a Device Defender security profile behaviors specification.
Requires permission to access the <a href="https:​//docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions">ValidateSecurityProfileBehaviors action.

``` swift
public func validateSecurityProfileBehaviors(input: ValidateSecurityProfileBehaviorsInput, completion: @escaping (ClientRuntime.SdkResult<ValidateSecurityProfileBehaviorsOutputResponse, ValidateSecurityProfileBehaviorsOutputError>) -> Void)
```
