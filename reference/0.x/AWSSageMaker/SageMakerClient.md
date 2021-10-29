# SageMakerClient

``` swift
public class SageMakerClient 
```

## Inheritance

[`SageMakerClientProtocol`](/aws-sdk-swift/reference/0.x/AWSSageMaker/SageMakerClientProtocol)

## Initializers

### `init(config:)`

``` swift
public init(config: AWSClientRuntime.AWSClientConfiguration) 
```

### `init(region:)`

``` swift
public convenience init(region: Swift.String? = nil) throws 
```

## Properties

### `clientName`

``` swift
public static let clientName = "SageMakerClient"
```

## Methods

### `addAssociation(input:completion:)`

Creates an association between the source and the destination. A source can be associated with multiple destinations, and a destination can be associated with multiple sources. An association is a lineage tracking entity. For more information, see [Amazon SageMaker ML Lineage Tracking](https://docs.aws.amazon.com/sagemaker/latest/dg/lineage-tracking.html).

``` swift
public func addAssociation(input: AddAssociationInput, completion: @escaping (ClientRuntime.SdkResult<AddAssociationOutputResponse, AddAssociationOutputError>) -> Void)
```

### `addTags(input:completion:)`

Adds or overwrites one or more tags for the specified Amazon SageMaker resource. You can add tags to notebook instances, training jobs, hyperparameter tuning jobs, batch transform jobs, models, labeling jobs, work teams, endpoint configurations, and endpoints. Each tag consists of a key and an optional value. Tag keys must be unique per resource. For more information about tags, see For more information, see [Amazon Web Services Tagging Strategies](https://aws.amazon.com/answers/account-management/aws-tagging-strategies/). Tags that you add to a hyperparameter tuning job by calling this API are also added to any training jobs that the hyperparameter tuning job launches after you call this API, but not to training jobs that the hyperparameter tuning job launched before you called this API. To make sure that the tags associated with a hyperparameter tuning job are also added to all training jobs that the hyperparameter tuning job launches, add the tags when you first create the tuning job by specifying them in the Tags parameter of \[CreateHyperParameterTuningJob\] Tags that you add to a SageMaker Studio Domain or User Profile by calling this API are also added to any Apps that the Domain or User Profile launches after you call this API, but not to Apps that the Domain or User Profile launched before you called this API. To make sure that the tags associated with a Domain or User Profile are also added to all Apps that the Domain or User Profile launches, add the tags when you first create the Domain or User Profile by specifying them in the Tags parameter of \[CreateDomain\] or \[CreateUserProfile\].

``` swift
public func addTags(input: AddTagsInput, completion: @escaping (ClientRuntime.SdkResult<AddTagsOutputResponse, AddTagsOutputError>) -> Void)
```

### `associateTrialComponent(input:completion:)`

Associates a trial component with a trial. A trial component can be associated with multiple trials. To disassociate a trial component from a trial, call the \[DisassociateTrialComponent\] API.

``` swift
public func associateTrialComponent(input: AssociateTrialComponentInput, completion: @escaping (ClientRuntime.SdkResult<AssociateTrialComponentOutputResponse, AssociateTrialComponentOutputError>) -> Void)
```

### `createAction(input:completion:)`

Creates an action. An action is a lineage tracking entity that represents an action or activity. For example, a model deployment or an HPO job. Generally, an action involves at least one input or output artifact. For more information, see [Amazon SageMaker ML Lineage Tracking](https://docs.aws.amazon.com/sagemaker/latest/dg/lineage-tracking.html).

``` swift
public func createAction(input: CreateActionInput, completion: @escaping (ClientRuntime.SdkResult<CreateActionOutputResponse, CreateActionOutputError>) -> Void)
```

### `createAlgorithm(input:completion:)`

Create a machine learning algorithm that you can use in Amazon SageMaker and list in the Amazon Web Services Marketplace.

``` swift
public func createAlgorithm(input: CreateAlgorithmInput, completion: @escaping (ClientRuntime.SdkResult<CreateAlgorithmOutputResponse, CreateAlgorithmOutputError>) -> Void)
```

### `createApp(input:completion:)`

Creates a running app for the specified UserProfile. Supported apps are JupyterServer and KernelGateway. This operation is automatically invoked by Amazon SageMaker Studio upon access to the associated Domain, and when new kernel configurations are selected by the user. A user may have multiple Apps active simultaneously.

``` swift
public func createApp(input: CreateAppInput, completion: @escaping (ClientRuntime.SdkResult<CreateAppOutputResponse, CreateAppOutputError>) -> Void)
```

### `createAppImageConfig(input:completion:)`

Creates a configuration for running a SageMaker image as a KernelGateway app. The configuration specifies the Amazon Elastic File System (EFS) storage volume on the image, and a list of the kernels in the image.

``` swift
public func createAppImageConfig(input: CreateAppImageConfigInput, completion: @escaping (ClientRuntime.SdkResult<CreateAppImageConfigOutputResponse, CreateAppImageConfigOutputError>) -> Void)
```

### `createArtifact(input:completion:)`

Creates an artifact. An artifact is a lineage tracking entity that represents a URI addressable object or data. Some examples are the S3 URI of a dataset and the ECR registry path of an image. For more information, see [Amazon SageMaker ML Lineage Tracking](https://docs.aws.amazon.com/sagemaker/latest/dg/lineage-tracking.html).

``` swift
public func createArtifact(input: CreateArtifactInput, completion: @escaping (ClientRuntime.SdkResult<CreateArtifactOutputResponse, CreateArtifactOutputError>) -> Void)
```

### `createAutoMLJob(input:completion:)`

Creates an Autopilot job. Find the best-performing model after you run an Autopilot job by calling . For information about how to use Autopilot, see [Automate Model Development with Amazon SageMaker Autopilot](https://docs.aws.amazon.com/sagemaker/latest/dg/autopilot-automate-model-development.html).

``` swift
public func createAutoMLJob(input: CreateAutoMLJobInput, completion: @escaping (ClientRuntime.SdkResult<CreateAutoMLJobOutputResponse, CreateAutoMLJobOutputError>) -> Void)
```

### `createCodeRepository(input:completion:)`

Creates a Git repository as a resource in your Amazon SageMaker account. You can associate the repository with notebook instances so that you can use Git source control for the notebooks you create. The Git repository is a resource in your Amazon SageMaker account, so it can be associated with more than one notebook instance, and it persists independently from the lifecycle of any notebook instances it is associated with. The repository can be hosted either in [Amazon Web Services CodeCommit](https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html) or in any other Git repository.

``` swift
public func createCodeRepository(input: CreateCodeRepositoryInput, completion: @escaping (ClientRuntime.SdkResult<CreateCodeRepositoryOutputResponse, CreateCodeRepositoryOutputError>) -> Void)
```

### `createCompilationJob(input:completion:)`

Starts a model compilation job. After the model has been compiled, Amazon SageMaker saves the resulting model artifacts to an Amazon Simple Storage Service (Amazon S3) bucket that you specify. If you choose to host your model using Amazon SageMaker hosting services, you can use the resulting model artifacts as part of the model. You can also use the artifacts with Amazon Web Services IoT Greengrass. In that case, deploy them as an ML resource. In the request body, you provide the following:

``` swift
public func createCompilationJob(input: CreateCompilationJobInput, completion: @escaping (ClientRuntime.SdkResult<CreateCompilationJobOutputResponse, CreateCompilationJobOutputError>) -> Void)
```

  - A name for the compilation job

  - Information about the input model artifacts

  - The output location for the compiled model and the device (target) that the model runs on

  - The Amazon Resource Name (ARN) of the IAM role that Amazon SageMaker assumes to perform the model compilation job.

You can also provide a Tag to track the model compilation job's resource use and costs. The response body contains the CompilationJobArn for the compiled job. To stop a model compilation job, use \[StopCompilationJob\]. To get information about a particular model compilation job, use \[DescribeCompilationJob\]. To get information about multiple model compilation jobs, use \[ListCompilationJobs\].

### `createContext(input:completion:)`

Creates a context. A context is a lineage tracking entity that represents a logical grouping of other tracking or experiment entities. Some examples are an endpoint and a model package. For more information, see [Amazon SageMaker ML Lineage Tracking](https://docs.aws.amazon.com/sagemaker/latest/dg/lineage-tracking.html).

``` swift
public func createContext(input: CreateContextInput, completion: @escaping (ClientRuntime.SdkResult<CreateContextOutputResponse, CreateContextOutputError>) -> Void)
```

### `createDataQualityJobDefinition(input:completion:)`

Creates a definition for a job that monitors data quality and drift. For information about model monitor, see [Amazon SageMaker Model Monitor](https://docs.aws.amazon.com/sagemaker/latest/dg/model-monitor.html).

``` swift
public func createDataQualityJobDefinition(input: CreateDataQualityJobDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<CreateDataQualityJobDefinitionOutputResponse, CreateDataQualityJobDefinitionOutputError>) -> Void)
```

### `createDeviceFleet(input:completion:)`

Creates a device fleet.

``` swift
public func createDeviceFleet(input: CreateDeviceFleetInput, completion: @escaping (ClientRuntime.SdkResult<CreateDeviceFleetOutputResponse, CreateDeviceFleetOutputError>) -> Void)
```

### `createDomain(input:completion:)`

Creates a Domain used by Amazon SageMaker Studio. A domain consists of an associated Amazon Elastic File System (EFS) volume, a list of authorized users, and a variety of security, application, policy, and Amazon Virtual Private Cloud (VPC) configurations. An Amazon Web Services account is limited to one domain per region. Users within a domain can share notebook files and other artifacts with each other. EFS storage When a domain is created, an EFS volume is created for use by all of the users within the domain. Each user receives a private home directory within the EFS volume for notebooks, Git repositories, and data files. SageMaker uses the Amazon Web Services Key Management Service (Amazon Web Services KMS) to encrypt the EFS volume attached to the domain with an Amazon Web Services managed key by default. For more control, you can specify a customer managed key. For more information, see [Protect Data at Rest Using Encryption](https://docs.aws.amazon.com/sagemaker/latest/dg/encryption-at-rest.html). VPC configuration All SageMaker Studio traffic between the domain and the EFS volume is through the specified VPC and subnets. For other Studio traffic, you can specify the AppNetworkAccessType parameter. AppNetworkAccessType corresponds to the network access type that you choose when you onboard to Studio. The following options are available:

``` swift
public func createDomain(input: CreateDomainInput, completion: @escaping (ClientRuntime.SdkResult<CreateDomainOutputResponse, CreateDomainOutputError>) -> Void)
```

  - PublicInternetOnly - Non-EFS traffic goes through a VPC managed by Amazon SageMaker, which allows internet access. This is the default value.

  - VpcOnly - All Studio traffic is through the specified VPC and subnets. Internet access is disabled by default. To allow internet access, you must specify a NAT gateway. When internet access is disabled, you won't be able to run a Studio notebook or to train or host models unless your VPC has an interface endpoint to the SageMaker API and runtime or a NAT gateway and your security groups allow outbound connections.

NFS traffic over TCP on port 2049 needs to be allowed in both inbound and outbound rules in order to launch a SageMaker Studio app successfully. For more information, see [Connect SageMaker Studio Notebooks to Resources in a VPC](https://docs.aws.amazon.com/sagemaker/latest/dg/studio-notebooks-and-internet-access.html).

### `createEdgePackagingJob(input:completion:)`

Starts a SageMaker Edge Manager model packaging job. Edge Manager will use the model artifacts from the Amazon Simple Storage Service bucket that you specify. After the model has been packaged, Amazon SageMaker saves the resulting artifacts to an S3 bucket that you specify.

``` swift
public func createEdgePackagingJob(input: CreateEdgePackagingJobInput, completion: @escaping (ClientRuntime.SdkResult<CreateEdgePackagingJobOutputResponse, CreateEdgePackagingJobOutputError>) -> Void)
```

### `createEndpoint(input:completion:)`

Creates an endpoint using the endpoint configuration specified in the request. Amazon SageMaker uses the endpoint to provision resources and deploy models. You create the endpoint configuration with the \[CreateEndpointConfig\] API. Use this API to deploy models using Amazon SageMaker hosting services. For an example that calls this method when deploying a model to Amazon SageMaker hosting services, see the [Create Endpoint example notebook.](https://github.com/aws/amazon-sagemaker-examples/blob/master/sagemaker-fundamentals/create-endpoint/create_endpoint.ipynb) You must not delete an EndpointConfig that is in use by an endpoint that is live or while the UpdateEndpoint or CreateEndpoint operations are being performed on the endpoint. To update an endpoint, you must create a new EndpointConfig. The endpoint name must be unique within an Amazon Web Services Region in your Amazon Web Services account. When it receives the request, Amazon SageMaker creates the endpoint, launches the resources (ML compute instances), and deploys the model(s) on them. When you call \[CreateEndpoint\], a load call is made to DynamoDB to verify that your endpoint configuration exists. When you read data from a DynamoDB table supporting [Eventually Consistent Reads](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadConsistency.html), the response might not reflect the results of a recently completed write operation. The response might include some stale data. If the dependent entities are not yet in DynamoDB, this causes a validation error. If you repeat your read request after a short time, the response should return the latest data. So retry logic is recommended to handle these possible issues. We also recommend that customers call \[DescribeEndpointConfig\] before calling \[CreateEndpoint\] to minimize the potential impact of a DynamoDB eventually consistent read. When Amazon SageMaker receives the request, it sets the endpoint status to Creating. After it creates the endpoint, it sets the status to InService. Amazon SageMaker can then process incoming requests for inferences. To check the status of an endpoint, use the \[DescribeEndpoint\] API. If any of the models hosted at this endpoint get model data from an Amazon S3 location, Amazon SageMaker uses Amazon Web Services Security Token Service to download model artifacts from the S3 path you provided. Amazon Web Services STS is activated in your IAM user account by default. If you previously deactivated Amazon Web Services STS for a region, you need to reactivate Amazon Web Services STS for that region. For more information, see [Activating and Deactivating Amazon Web Services STS in an Amazon Web Services Region](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html) in the Amazon Web Services Identity and Access Management User Guide. To add the IAM role policies for using this API operation, go to the [IAM console](https://console.aws.amazon.com/iam/), and choose Roles in the left navigation pane. Search the IAM role that you want to grant access to use the \[CreateEndpoint\] and \[CreateEndpointConfig\] API operations, add the following policies to the role.

``` swift
public func createEndpoint(input: CreateEndpointInput, completion: @escaping (ClientRuntime.SdkResult<CreateEndpointOutputResponse, CreateEndpointOutputError>) -> Void)
```

  - Option 1: For a full Amazon SageMaker access, search and attach the AmazonSageMakerFullAccess policy.

  - Option 2: For granting a limited access to an IAM role, paste the following Action elements manually into the JSON file of the IAM role: "Action": \["sagemaker:CreateEndpoint", "sagemaker:CreateEndpointConfig"\]"Resource": \["arn:aws:sagemaker:region:account-id:endpoint/endpointName""arn:aws:sagemaker:region:account-id:endpoint-config/endpointConfigName"\] For more information, see [Amazon SageMaker API Permissions: Actions, Permissions, and Resources Reference](https://docs.aws.amazon.com/sagemaker/latest/dg/api-permissions-reference.html).

### `createEndpointConfig(input:completion:)`

Creates an endpoint configuration that Amazon SageMaker hosting services uses to deploy models. In the configuration, you identify one or more models, created using the CreateModel API, to deploy and the resources that you want Amazon SageMaker to provision. Then you call the \[CreateEndpoint\] API. Use this API if you want to use Amazon SageMaker hosting services to deploy models into production. In the request, you define a ProductionVariant, for each model that you want to deploy. Each ProductionVariant parameter also describes the resources that you want Amazon SageMaker to provision. This includes the number and type of ML compute instances to deploy. If you are hosting multiple models, you also assign a VariantWeight to specify how much traffic you want to allocate to each model. For example, suppose that you want to host two models, A and B, and you assign traffic weight 2 for model A and 1 for model B. Amazon SageMaker distributes two-thirds of the traffic to Model A, and one-third to model B. When you call \[CreateEndpoint\], a load call is made to DynamoDB to verify that your endpoint configuration exists. When you read data from a DynamoDB table supporting [Eventually Consistent Reads](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadConsistency.html), the response might not reflect the results of a recently completed write operation. The response might include some stale data. If the dependent entities are not yet in DynamoDB, this causes a validation error. If you repeat your read request after a short time, the response should return the latest data. So retry logic is recommended to handle these possible issues. We also recommend that customers call \[DescribeEndpointConfig\] before calling \[CreateEndpoint\] to minimize the potential impact of a DynamoDB eventually consistent read.

``` swift
public func createEndpointConfig(input: CreateEndpointConfigInput, completion: @escaping (ClientRuntime.SdkResult<CreateEndpointConfigOutputResponse, CreateEndpointConfigOutputError>) -> Void)
```

### `createExperiment(input:completion:)`

Creates an SageMaker experiment. An experiment is a collection of trials that are observed, compared and evaluated as a group. A trial is a set of steps, called trial components, that produce a machine learning model. The goal of an experiment is to determine the components that produce the best model. Multiple trials are performed, each one isolating and measuring the impact of a change to one or more inputs, while keeping the remaining inputs constant. When you use SageMaker Studio or the SageMaker Python SDK, all experiments, trials, and trial components are automatically tracked, logged, and indexed. When you use the Amazon Web Services SDK for Python (Boto), you must use the logging APIs provided by the SDK. You can add tags to experiments, trials, trial components and then use the \[Search\] API to search for the tags. To add a description to an experiment, specify the optional Description parameter. To add a description later, or to change the description, call the \[UpdateExperiment\] API. To get a list of all your experiments, call the \[ListExperiments\] API. To view an experiment's properties, call the \[DescribeExperiment\] API. To get a list of all the trials associated with an experiment, call the \[ListTrials\] API. To create a trial call the \[CreateTrial\] API.

``` swift
public func createExperiment(input: CreateExperimentInput, completion: @escaping (ClientRuntime.SdkResult<CreateExperimentOutputResponse, CreateExperimentOutputError>) -> Void)
```

### `createFeatureGroup(input:completion:)`

Create a new FeatureGroup. A FeatureGroup is a group of Features defined in the FeatureStore to describe a Record. The FeatureGroup defines the schema and features contained in the FeatureGroup. A FeatureGroup definition is composed of a list of Features, a RecordIdentifierFeatureName, an EventTimeFeatureName and configurations for its OnlineStore and OfflineStore. Check [Amazon Web Services service quotas](https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html) to see the FeatureGroups quota for your Amazon Web Services account. You must include at least one of OnlineStoreConfig and OfflineStoreConfig to create a FeatureGroup.

``` swift
public func createFeatureGroup(input: CreateFeatureGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateFeatureGroupOutputResponse, CreateFeatureGroupOutputError>) -> Void)
```

### `createFlowDefinition(input:completion:)`

Creates a flow definition.

``` swift
public func createFlowDefinition(input: CreateFlowDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<CreateFlowDefinitionOutputResponse, CreateFlowDefinitionOutputError>) -> Void)
```

### `createHumanTaskUi(input:completion:)`

Defines the settings you will use for the human review workflow user interface. Reviewers will see a three-panel interface with an instruction area, the item to review, and an input area.

``` swift
public func createHumanTaskUi(input: CreateHumanTaskUiInput, completion: @escaping (ClientRuntime.SdkResult<CreateHumanTaskUiOutputResponse, CreateHumanTaskUiOutputError>) -> Void)
```

### `createHyperParameterTuningJob(input:completion:)`

Starts a hyperparameter tuning job. A hyperparameter tuning job finds the best version of a model by running many training jobs on your dataset using the algorithm you choose and values for hyperparameters within ranges that you specify. It then chooses the hyperparameter values that result in a model that performs the best, as measured by an objective metric that you choose.

``` swift
public func createHyperParameterTuningJob(input: CreateHyperParameterTuningJobInput, completion: @escaping (ClientRuntime.SdkResult<CreateHyperParameterTuningJobOutputResponse, CreateHyperParameterTuningJobOutputError>) -> Void)
```

### `createImage(input:completion:)`

Creates a custom SageMaker image. A SageMaker image is a set of image versions. Each image version represents a container image stored in Amazon Container Registry (ECR). For more information, see [Bring your own SageMaker image](https://docs.aws.amazon.com/sagemaker/latest/dg/studio-byoi.html).

``` swift
public func createImage(input: CreateImageInput, completion: @escaping (ClientRuntime.SdkResult<CreateImageOutputResponse, CreateImageOutputError>) -> Void)
```

### `createImageVersion(input:completion:)`

Creates a version of the SageMaker image specified by ImageName. The version represents the Amazon Container Registry (ECR) container image specified by BaseImage.

``` swift
public func createImageVersion(input: CreateImageVersionInput, completion: @escaping (ClientRuntime.SdkResult<CreateImageVersionOutputResponse, CreateImageVersionOutputError>) -> Void)
```

### `createLabelingJob(input:completion:)`

Creates a job that uses workers to label the data objects in your input dataset. You can use the labeled data to train machine learning models. You can select your workforce from one of three providers:

``` swift
public func createLabelingJob(input: CreateLabelingJobInput, completion: @escaping (ClientRuntime.SdkResult<CreateLabelingJobOutputResponse, CreateLabelingJobOutputError>) -> Void)
```

  - A private workforce that you create. It can include employees, contractors, and outside experts. Use a private workforce when want the data to stay within your organization or when a specific set of skills is required.

  - One or more vendors that you select from the Amazon Web Services Marketplace. Vendors provide expertise in specific areas.

  - The Amazon Mechanical Turk workforce. This is the largest workforce, but it should only be used for public data or data that has been stripped of any personally identifiable information.

You can also use automated data labeling to reduce the number of data objects that need to be labeled by a human. Automated data labeling uses active learning to determine if a data object can be labeled by machine or if it needs to be sent to a human worker. For more information, see [Using Automated Data Labeling](https://docs.aws.amazon.com/sagemaker/latest/dg/sms-automated-labeling.html). The data objects to be labeled are contained in an Amazon S3 bucket. You create a manifest file that describes the location of each object. For more information, see [Using Input and Output Data](https://docs.aws.amazon.com/sagemaker/latest/dg/sms-data.html). The output can be used as the manifest file for another labeling job or as training data for your machine learning models. You can use this operation to create a static labeling job or a streaming labeling job. A static labeling job stops if all data objects in the input manifest file identified in ManifestS3Uri have been labeled. A streaming labeling job runs perpetually until it is manually stopped, or remains idle for 10 days. You can send new data objects to an active (InProgress) streaming labeling job in real time. To learn how to create a static labeling job, see [Create a Labeling Job (API) ](https://docs.aws.amazon.com/sagemaker/latest/dg/sms-create-labeling-job-api.html) in the Amazon SageMaker Developer Guide. To learn how to create a streaming labeling job, see [Create a Streaming Labeling Job](https://docs.aws.amazon.com/sagemaker/latest/dg/sms-streaming-create-job.html).

### `createModel(input:completion:)`

Creates a model in Amazon SageMaker. In the request, you name the model and describe a primary container. For the primary container, you specify the Docker image that contains inference code, artifacts (from prior training), and a custom environment map that the inference code uses when you deploy the model for predictions. Use this API to create a model if you want to use Amazon SageMaker hosting services or run a batch transform job. To host your model, you create an endpoint configuration with the CreateEndpointConfig API, and then create an endpoint with the CreateEndpoint API. Amazon SageMaker then deploys all of the containers that you defined for the model in the hosting environment. For an example that calls this method when deploying a model to Amazon SageMaker hosting services, see [Deploy the Model to Amazon SageMaker Hosting Services (Amazon Web Services SDK for Python (Boto 3)).](https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html#ex1-deploy-model-boto) To run a batch transform using your model, you start a job with the CreateTransformJob API. Amazon SageMaker uses your model and your dataset to get inferences which are then saved to a specified S3 location. In the CreateModel request, you must define a container with the PrimaryContainer parameter. In the request, you also provide an IAM role that Amazon SageMaker can assume to access model artifacts and docker image for deployment on ML compute hosting instances or for batch transform jobs. In addition, you also use the IAM role to manage permissions the inference code needs. For example, if the inference code access any other Amazon Web Services resources, you grant necessary permissions via this role.

``` swift
public func createModel(input: CreateModelInput, completion: @escaping (ClientRuntime.SdkResult<CreateModelOutputResponse, CreateModelOutputError>) -> Void)
```

### `createModelBiasJobDefinition(input:completion:)`

Creates the definition for a model bias job.

``` swift
public func createModelBiasJobDefinition(input: CreateModelBiasJobDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<CreateModelBiasJobDefinitionOutputResponse, CreateModelBiasJobDefinitionOutputError>) -> Void)
```

### `createModelExplainabilityJobDefinition(input:completion:)`

Creates the definition for a model explainability job.

``` swift
public func createModelExplainabilityJobDefinition(input: CreateModelExplainabilityJobDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<CreateModelExplainabilityJobDefinitionOutputResponse, CreateModelExplainabilityJobDefinitionOutputError>) -> Void)
```

### `createModelPackage(input:completion:)`

Creates a model package that you can use to create Amazon SageMaker models or list on Amazon Web Services Marketplace, or a versioned model that is part of a model group. Buyers can subscribe to model packages listed on Amazon Web Services Marketplace to create models in Amazon SageMaker. To create a model package by specifying a Docker container that contains your inference code and the Amazon S3 location of your model artifacts, provide values for InferenceSpecification. To create a model from an algorithm resource that you created or subscribed to in Amazon Web Services Marketplace, provide a value for SourceAlgorithmSpecification. There are two types of model packages:

``` swift
public func createModelPackage(input: CreateModelPackageInput, completion: @escaping (ClientRuntime.SdkResult<CreateModelPackageOutputResponse, CreateModelPackageOutputError>) -> Void)
```

  - Versioned - a model that is part of a model group in the model registry.

  - Unversioned - a model package that is not part of a model group.

### `createModelPackageGroup(input:completion:)`

Creates a model group. A model group contains a group of model versions.

``` swift
public func createModelPackageGroup(input: CreateModelPackageGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateModelPackageGroupOutputResponse, CreateModelPackageGroupOutputError>) -> Void)
```

### `createModelQualityJobDefinition(input:completion:)`

Creates a definition for a job that monitors model quality and drift. For information about model monitor, see [Amazon SageMaker Model Monitor](https://docs.aws.amazon.com/sagemaker/latest/dg/model-monitor.html).

``` swift
public func createModelQualityJobDefinition(input: CreateModelQualityJobDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<CreateModelQualityJobDefinitionOutputResponse, CreateModelQualityJobDefinitionOutputError>) -> Void)
```

### `createMonitoringSchedule(input:completion:)`

Creates a schedule that regularly starts Amazon SageMaker Processing Jobs to monitor the data captured for an Amazon SageMaker Endoint.

``` swift
public func createMonitoringSchedule(input: CreateMonitoringScheduleInput, completion: @escaping (ClientRuntime.SdkResult<CreateMonitoringScheduleOutputResponse, CreateMonitoringScheduleOutputError>) -> Void)
```

### `createNotebookInstance(input:completion:)`

Creates an Amazon SageMaker notebook instance. A notebook instance is a machine learning (ML) compute instance running on a Jupyter notebook. In a CreateNotebookInstance request, specify the type of ML compute instance that you want to run. Amazon SageMaker launches the instance, installs common libraries that you can use to explore datasets for model training, and attaches an ML storage volume to the notebook instance. Amazon SageMaker also provides a set of example notebooks. Each notebook demonstrates how to use Amazon SageMaker with a specific algorithm or with a machine learning framework. After receiving the request, Amazon SageMaker does the following:

``` swift
public func createNotebookInstance(input: CreateNotebookInstanceInput, completion: @escaping (ClientRuntime.SdkResult<CreateNotebookInstanceOutputResponse, CreateNotebookInstanceOutputError>) -> Void)
```

  - Creates a network interface in the Amazon SageMaker VPC.

  - (Option) If you specified SubnetId, Amazon SageMaker creates a network interface in your own VPC, which is inferred from the subnet ID that you provide in the input. When creating this network interface, Amazon SageMaker attaches the security group that you specified in the request to the network interface that it creates in your VPC.

  - Launches an EC2 instance of the type specified in the request in the Amazon SageMaker VPC. If you specified SubnetId of your VPC, Amazon SageMaker specifies both network interfaces when launching this instance. This enables inbound traffic from your own VPC to the notebook instance, assuming that the security groups allow it.

After creating the notebook instance, Amazon SageMaker returns its Amazon Resource Name (ARN). You can't change the name of a notebook instance after you create it. After Amazon SageMaker creates the notebook instance, you can connect to the Jupyter server and work in Jupyter notebooks. For example, you can write code to explore a dataset that you can use for model training, train a model, host models by creating Amazon SageMaker endpoints, and validate hosted models. For more information, see [How It Works](https://docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html).

### `createNotebookInstanceLifecycleConfig(input:completion:)`

Creates a lifecycle configuration that you can associate with a notebook instance. A lifecycle configuration is a collection of shell scripts that run when you create or start a notebook instance. Each lifecycle configuration script has a limit of 16384 characters. The value of the $PATH environment variable that is available to both scripts is /sbin:bin:/usr/sbin:/usr/bin. View CloudWatch Logs for notebook instance lifecycle configurations in log group /aws/sagemaker/NotebookInstances in log stream \[notebook-instance-name\]/\[LifecycleConfigHook\]. Lifecycle configuration scripts cannot run for longer than 5 minutes. If a script runs for longer than 5 minutes, it fails and the notebook instance is not created or started. For information about notebook instance lifestyle configurations, see [Step 2.1: (Optional) Customize a Notebook Instance](https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html).

``` swift
public func createNotebookInstanceLifecycleConfig(input: CreateNotebookInstanceLifecycleConfigInput, completion: @escaping (ClientRuntime.SdkResult<CreateNotebookInstanceLifecycleConfigOutputResponse, CreateNotebookInstanceLifecycleConfigOutputError>) -> Void)
```

### `createPipeline(input:completion:)`

Creates a pipeline using a JSON pipeline definition.

``` swift
public func createPipeline(input: CreatePipelineInput, completion: @escaping (ClientRuntime.SdkResult<CreatePipelineOutputResponse, CreatePipelineOutputError>) -> Void)
```

### `createPresignedDomainUrl(input:completion:)`

Creates a URL for a specified UserProfile in a Domain. When accessed in a web browser, the user will be automatically signed in to Amazon SageMaker Studio, and granted access to all of the Apps and files associated with the Domain's Amazon Elastic File System (EFS) volume. This operation can only be called when the authentication mode equals IAM. The IAM role or user used to call this API defines the permissions to access the app. Once the presigned URL is created, no additional permission is required to access this URL. IAM authorization policies for this API are also enforced for every HTTP request and WebSocket frame that attempts to connect to the app. You can restrict access to this API and to the URL that it returns to a list of IP addresses, Amazon VPCs or Amazon VPC Endpoints that you specify. For more information, see [Connect to SageMaker Studio Through an Interface VPC Endpoint](https://docs.aws.amazon.com/sagemaker/latest/dg/studio-interface-endpoint.html) . The URL that you get from a call to CreatePresignedDomainUrl has a default timeout of 5 minutes. You can configure this value using ExpiresInSeconds. If you try to use the URL after the timeout limit expires, you are directed to the Amazon Web Services console sign-in page.

``` swift
public func createPresignedDomainUrl(input: CreatePresignedDomainUrlInput, completion: @escaping (ClientRuntime.SdkResult<CreatePresignedDomainUrlOutputResponse, CreatePresignedDomainUrlOutputError>) -> Void)
```

### `createPresignedNotebookInstanceUrl(input:completion:)`

Returns a URL that you can use to connect to the Jupyter server from a notebook instance. In the Amazon SageMaker console, when you choose Open next to a notebook instance, Amazon SageMaker opens a new tab showing the Jupyter server home page from the notebook instance. The console uses this API to get the URL and show the page. The IAM role or user used to call this API defines the permissions to access the notebook instance. Once the presigned URL is created, no additional permission is required to access this URL. IAM authorization policies for this API are also enforced for every HTTP request and WebSocket frame that attempts to connect to the notebook instance. You can restrict access to this API and to the URL that it returns to a list of IP addresses that you specify. Use the NotIpAddress condition operator and the aws:SourceIP condition context key to specify the list of IP addresses that you want to have access to the notebook instance. For more information, see [Limit Access to a Notebook Instance by IP Address](https://docs.aws.amazon.com/sagemaker/latest/dg/security_iam_id-based-policy-examples.html#nbi-ip-filter). The URL that you get from a call to \[CreatePresignedNotebookInstanceUrl\] is valid only for 5 minutes. If you try to use the URL after the 5-minute limit expires, you are directed to the Amazon Web Services console sign-in page.

``` swift
public func createPresignedNotebookInstanceUrl(input: CreatePresignedNotebookInstanceUrlInput, completion: @escaping (ClientRuntime.SdkResult<CreatePresignedNotebookInstanceUrlOutputResponse, CreatePresignedNotebookInstanceUrlOutputError>) -> Void)
```

### `createProcessingJob(input:completion:)`

Creates a processing job.

``` swift
public func createProcessingJob(input: CreateProcessingJobInput, completion: @escaping (ClientRuntime.SdkResult<CreateProcessingJobOutputResponse, CreateProcessingJobOutputError>) -> Void)
```

### `createProject(input:completion:)`

Creates a machine learning (ML) project that can contain one or more templates that set up an ML pipeline from training to deploying an approved model.

``` swift
public func createProject(input: CreateProjectInput, completion: @escaping (ClientRuntime.SdkResult<CreateProjectOutputResponse, CreateProjectOutputError>) -> Void)
```

### `createStudioLifecycleConfig(input:completion:)`

Creates a new Studio Lifecycle Configuration.

``` swift
public func createStudioLifecycleConfig(input: CreateStudioLifecycleConfigInput, completion: @escaping (ClientRuntime.SdkResult<CreateStudioLifecycleConfigOutputResponse, CreateStudioLifecycleConfigOutputError>) -> Void)
```

### `createTrainingJob(input:completion:)`

Starts a model training job. After training completes, Amazon SageMaker saves the resulting model artifacts to an Amazon S3 location that you specify. If you choose to host your model using Amazon SageMaker hosting services, you can use the resulting model artifacts as part of the model. You can also use the artifacts in a machine learning service other than Amazon SageMaker, provided that you know how to use them for inference. In the request body, you provide the following:

``` swift
public func createTrainingJob(input: CreateTrainingJobInput, completion: @escaping (ClientRuntime.SdkResult<CreateTrainingJobOutputResponse, CreateTrainingJobOutputError>) -> Void)
```

  - AlgorithmSpecification - Identifies the training algorithm to use.

  - HyperParameters - Specify these algorithm-specific parameters to enable the estimation of model parameters during training. Hyperparameters can be tuned to optimize this learning process. For a list of hyperparameters for each training algorithm provided by Amazon SageMaker, see [Algorithms](https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html).

  - InputDataConfig - Describes the training dataset and the Amazon S3, EFS, or FSx location where it is stored.

  - OutputDataConfig - Identifies the Amazon S3 bucket where you want Amazon SageMaker to save the results of model training.

  - ResourceConfig - Identifies the resources, ML compute instances, and ML storage volumes to deploy for model training. In distributed training, you specify more than one instance.

  - EnableManagedSpotTraining - Optimize the cost of training machine learning models by up to 80% by using Amazon EC2 Spot instances. For more information, see [Managed Spot Training](https://docs.aws.amazon.com/sagemaker/latest/dg/model-managed-spot-training.html).

  - RoleArn - The Amazon Resource Name (ARN) that Amazon SageMaker assumes to perform tasks on your behalf during model training. You must grant this role the necessary permissions so that Amazon SageMaker can successfully complete model training.

  - StoppingCondition - To help cap training costs, use MaxRuntimeInSeconds to set a time limit for training. Use MaxWaitTimeInSeconds to specify how long a managed spot training job has to complete.

  - Environment - The environment variables to set in the Docker container.

  - RetryStrategy - The number of times to retry the job when the job fails due to an InternalServerError.

For more information about Amazon SageMaker, see [How It Works](https://docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html).

### `createTransformJob(input:completion:)`

Starts a transform job. A transform job uses a trained model to get inferences on a dataset and saves these results to an Amazon S3 location that you specify. To perform batch transformations, you create a transform job and use the data that you have readily available. In the request body, you provide the following:

``` swift
public func createTransformJob(input: CreateTransformJobInput, completion: @escaping (ClientRuntime.SdkResult<CreateTransformJobOutputResponse, CreateTransformJobOutputError>) -> Void)
```

  - TransformJobName - Identifies the transform job. The name must be unique within an Amazon Web Services Region in an Amazon Web Services account.

  - ModelName - Identifies the model to use. ModelName must be the name of an existing Amazon SageMaker model in the same Amazon Web Services Region and Amazon Web Services account. For information on creating a model, see \[CreateModel\].

  - TransformInput - Describes the dataset to be transformed and the Amazon S3 location where it is stored.

  - TransformOutput - Identifies the Amazon S3 location where you want Amazon SageMaker to save the results from the transform job.

  - TransformResources - Identifies the ML compute instances for the transform job.

For more information about how batch transformation works, see [Batch Transform](https://docs.aws.amazon.com/sagemaker/latest/dg/batch-transform.html).

### `createTrial(input:completion:)`

Creates an SageMaker trial. A trial is a set of steps called trial components that produce a machine learning model. A trial is part of a single SageMaker experiment. When you use SageMaker Studio or the SageMaker Python SDK, all experiments, trials, and trial components are automatically tracked, logged, and indexed. When you use the Amazon Web Services SDK for Python (Boto), you must use the logging APIs provided by the SDK. You can add tags to a trial and then use the \[Search\] API to search for the tags. To get a list of all your trials, call the \[ListTrials\] API. To view a trial's properties, call the \[DescribeTrial\] API. To create a trial component, call the \[CreateTrialComponent\] API.

``` swift
public func createTrial(input: CreateTrialInput, completion: @escaping (ClientRuntime.SdkResult<CreateTrialOutputResponse, CreateTrialOutputError>) -> Void)
```

### `createTrialComponent(input:completion:)`

Creates a trial component, which is a stage of a machine learning trial. A trial is composed of one or more trial components. A trial component can be used in multiple trials. Trial components include pre-processing jobs, training jobs, and batch transform jobs. When you use SageMaker Studio or the SageMaker Python SDK, all experiments, trials, and trial components are automatically tracked, logged, and indexed. When you use the Amazon Web Services SDK for Python (Boto), you must use the logging APIs provided by the SDK. You can add tags to a trial component and then use the \[Search\] API to search for the tags.

``` swift
public func createTrialComponent(input: CreateTrialComponentInput, completion: @escaping (ClientRuntime.SdkResult<CreateTrialComponentOutputResponse, CreateTrialComponentOutputError>) -> Void)
```

### `createUserProfile(input:completion:)`

Creates a user profile. A user profile represents a single user within a domain, and is the main way to reference a "person" for the purposes of sharing, reporting, and other user-oriented features. This entity is created when a user onboards to Amazon SageMaker Studio. If an administrator invites a person by email or imports them from SSO, a user profile is automatically created. A user profile is the primary holder of settings for an individual user and has a reference to the user's private Amazon Elastic File System (EFS) home directory.

``` swift
public func createUserProfile(input: CreateUserProfileInput, completion: @escaping (ClientRuntime.SdkResult<CreateUserProfileOutputResponse, CreateUserProfileOutputError>) -> Void)
```

### `createWorkforce(input:completion:)`

Use this operation to create a workforce. This operation will return an error if a workforce already exists in the Amazon Web Services Region that you specify. You can only create one workforce in each Amazon Web Services Region per Amazon Web Services account. If you want to create a new workforce in an Amazon Web Services Region where a workforce already exists, use the API operation to delete the existing workforce and then use CreateWorkforce to create a new workforce. To create a private workforce using Amazon Cognito, you must specify a Cognito user pool in CognitoConfig. You can also create an Amazon Cognito workforce using the Amazon SageMaker console. For more information, see [ Create a Private Workforce (Amazon Cognito)](https://docs.aws.amazon.com/sagemaker/latest/dg/sms-workforce-create-private.html). To create a private workforce using your own OIDC Identity Provider (IdP), specify your IdP configuration in OidcConfig. Your OIDC IdP must support groups because groups are used by Ground Truth and Amazon A2I to create work teams. For more information, see [ Create a Private Workforce (OIDC IdP)](https://docs.aws.amazon.com/sagemaker/latest/dg/sms-workforce-create-private-oidc.html).

``` swift
public func createWorkforce(input: CreateWorkforceInput, completion: @escaping (ClientRuntime.SdkResult<CreateWorkforceOutputResponse, CreateWorkforceOutputError>) -> Void)
```

### `createWorkteam(input:completion:)`

Creates a new work team for labeling your data. A work team is defined by one or more Amazon Cognito user pools. You must first create the user pools before you can create a work team. You cannot create more than 25 work teams in an account and region.

``` swift
public func createWorkteam(input: CreateWorkteamInput, completion: @escaping (ClientRuntime.SdkResult<CreateWorkteamOutputResponse, CreateWorkteamOutputError>) -> Void)
```

### `deleteAction(input:completion:)`

Deletes an action.

``` swift
public func deleteAction(input: DeleteActionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteActionOutputResponse, DeleteActionOutputError>) -> Void)
```

### `deleteAlgorithm(input:completion:)`

Removes the specified algorithm from your account.

``` swift
public func deleteAlgorithm(input: DeleteAlgorithmInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAlgorithmOutputResponse, DeleteAlgorithmOutputError>) -> Void)
```

### `deleteApp(input:completion:)`

Used to stop and delete an app.

``` swift
public func deleteApp(input: DeleteAppInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAppOutputResponse, DeleteAppOutputError>) -> Void)
```

### `deleteAppImageConfig(input:completion:)`

Deletes an AppImageConfig.

``` swift
public func deleteAppImageConfig(input: DeleteAppImageConfigInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAppImageConfigOutputResponse, DeleteAppImageConfigOutputError>) -> Void)
```

### `deleteArtifact(input:completion:)`

Deletes an artifact. Either ArtifactArn or Source must be specified.

``` swift
public func deleteArtifact(input: DeleteArtifactInput, completion: @escaping (ClientRuntime.SdkResult<DeleteArtifactOutputResponse, DeleteArtifactOutputError>) -> Void)
```

### `deleteAssociation(input:completion:)`

Deletes an association.

``` swift
public func deleteAssociation(input: DeleteAssociationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAssociationOutputResponse, DeleteAssociationOutputError>) -> Void)
```

### `deleteCodeRepository(input:completion:)`

Deletes the specified Git repository from your account.

``` swift
public func deleteCodeRepository(input: DeleteCodeRepositoryInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCodeRepositoryOutputResponse, DeleteCodeRepositoryOutputError>) -> Void)
```

### `deleteContext(input:completion:)`

Deletes an context.

``` swift
public func deleteContext(input: DeleteContextInput, completion: @escaping (ClientRuntime.SdkResult<DeleteContextOutputResponse, DeleteContextOutputError>) -> Void)
```

### `deleteDataQualityJobDefinition(input:completion:)`

Deletes a data quality monitoring job definition.

``` swift
public func deleteDataQualityJobDefinition(input: DeleteDataQualityJobDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDataQualityJobDefinitionOutputResponse, DeleteDataQualityJobDefinitionOutputError>) -> Void)
```

### `deleteDeviceFleet(input:completion:)`

Deletes a fleet.

``` swift
public func deleteDeviceFleet(input: DeleteDeviceFleetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDeviceFleetOutputResponse, DeleteDeviceFleetOutputError>) -> Void)
```

### `deleteDomain(input:completion:)`

Used to delete a domain. If you onboarded with IAM mode, you will need to delete your domain to onboard again using SSO. Use with caution. All of the members of the domain will lose access to their EFS volume, including data, notebooks, and other artifacts.

``` swift
public func deleteDomain(input: DeleteDomainInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDomainOutputResponse, DeleteDomainOutputError>) -> Void)
```

### `deleteEndpoint(input:completion:)`

Deletes an endpoint. Amazon SageMaker frees up all of the resources that were deployed when the endpoint was created. Amazon SageMaker retires any custom KMS key grants associated with the endpoint, meaning you don't need to use the [RevokeGrant](http://docs.aws.amazon.com/kms/latest/APIReference/API_RevokeGrant.html) API call.

``` swift
public func deleteEndpoint(input: DeleteEndpointInput, completion: @escaping (ClientRuntime.SdkResult<DeleteEndpointOutputResponse, DeleteEndpointOutputError>) -> Void)
```

### `deleteEndpointConfig(input:completion:)`

Deletes an endpoint configuration. The DeleteEndpointConfig API deletes only the specified configuration. It does not delete endpoints created using the configuration. You must not delete an EndpointConfig in use by an endpoint that is live or while the UpdateEndpoint or CreateEndpoint operations are being performed on the endpoint. If you delete the EndpointConfig of an endpoint that is active or being created or updated you may lose visibility into the instance type the endpoint is using. The endpoint must be deleted in order to stop incurring charges.

``` swift
public func deleteEndpointConfig(input: DeleteEndpointConfigInput, completion: @escaping (ClientRuntime.SdkResult<DeleteEndpointConfigOutputResponse, DeleteEndpointConfigOutputError>) -> Void)
```

### `deleteExperiment(input:completion:)`

Deletes an SageMaker experiment. All trials associated with the experiment must be deleted first. Use the \[ListTrials\] API to get a list of the trials associated with the experiment.

``` swift
public func deleteExperiment(input: DeleteExperimentInput, completion: @escaping (ClientRuntime.SdkResult<DeleteExperimentOutputResponse, DeleteExperimentOutputError>) -> Void)
```

### `deleteFeatureGroup(input:completion:)`

Delete the FeatureGroup and any data that was written to the OnlineStore of the FeatureGroup. Data cannot be accessed from the OnlineStore immediately after DeleteFeatureGroup is called. Data written into the OfflineStore will not be deleted. The Amazon Web Services Glue database and tables that are automatically created for your OfflineStore are not deleted.

``` swift
public func deleteFeatureGroup(input: DeleteFeatureGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFeatureGroupOutputResponse, DeleteFeatureGroupOutputError>) -> Void)
```

### `deleteFlowDefinition(input:completion:)`

Deletes the specified flow definition.

``` swift
public func deleteFlowDefinition(input: DeleteFlowDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFlowDefinitionOutputResponse, DeleteFlowDefinitionOutputError>) -> Void)
```

### `deleteHumanTaskUi(input:completion:)`

Use this operation to delete a human task user interface (worker task template). To see a list of human task user interfaces (work task templates) in your account, use . When you delete a worker task template, it no longer appears when you call ListHumanTaskUis.

``` swift
public func deleteHumanTaskUi(input: DeleteHumanTaskUiInput, completion: @escaping (ClientRuntime.SdkResult<DeleteHumanTaskUiOutputResponse, DeleteHumanTaskUiOutputError>) -> Void)
```

### `deleteImage(input:completion:)`

Deletes a SageMaker image and all versions of the image. The container images aren't deleted.

``` swift
public func deleteImage(input: DeleteImageInput, completion: @escaping (ClientRuntime.SdkResult<DeleteImageOutputResponse, DeleteImageOutputError>) -> Void)
```

### `deleteImageVersion(input:completion:)`

Deletes a version of a SageMaker image. The container image the version represents isn't deleted.

``` swift
public func deleteImageVersion(input: DeleteImageVersionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteImageVersionOutputResponse, DeleteImageVersionOutputError>) -> Void)
```

### `deleteModel(input:completion:)`

Deletes a model. The DeleteModel API deletes only the model entry that was created in Amazon SageMaker when you called the CreateModel API. It does not delete model artifacts, inference code, or the IAM role that you specified when creating the model.

``` swift
public func deleteModel(input: DeleteModelInput, completion: @escaping (ClientRuntime.SdkResult<DeleteModelOutputResponse, DeleteModelOutputError>) -> Void)
```

### `deleteModelBiasJobDefinition(input:completion:)`

Deletes an Amazon SageMaker model bias job definition.

``` swift
public func deleteModelBiasJobDefinition(input: DeleteModelBiasJobDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteModelBiasJobDefinitionOutputResponse, DeleteModelBiasJobDefinitionOutputError>) -> Void)
```

### `deleteModelExplainabilityJobDefinition(input:completion:)`

Deletes an Amazon SageMaker model explainability job definition.

``` swift
public func deleteModelExplainabilityJobDefinition(input: DeleteModelExplainabilityJobDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteModelExplainabilityJobDefinitionOutputResponse, DeleteModelExplainabilityJobDefinitionOutputError>) -> Void)
```

### `deleteModelPackage(input:completion:)`

Deletes a model package. A model package is used to create Amazon SageMaker models or list on Amazon Web Services Marketplace. Buyers can subscribe to model packages listed on Amazon Web Services Marketplace to create models in Amazon SageMaker.

``` swift
public func deleteModelPackage(input: DeleteModelPackageInput, completion: @escaping (ClientRuntime.SdkResult<DeleteModelPackageOutputResponse, DeleteModelPackageOutputError>) -> Void)
```

### `deleteModelPackageGroup(input:completion:)`

Deletes the specified model group.

``` swift
public func deleteModelPackageGroup(input: DeleteModelPackageGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteModelPackageGroupOutputResponse, DeleteModelPackageGroupOutputError>) -> Void)
```

### `deleteModelPackageGroupPolicy(input:completion:)`

Deletes a model group resource policy.

``` swift
public func deleteModelPackageGroupPolicy(input: DeleteModelPackageGroupPolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteModelPackageGroupPolicyOutputResponse, DeleteModelPackageGroupPolicyOutputError>) -> Void)
```

### `deleteModelQualityJobDefinition(input:completion:)`

Deletes the secified model quality monitoring job definition.

``` swift
public func deleteModelQualityJobDefinition(input: DeleteModelQualityJobDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteModelQualityJobDefinitionOutputResponse, DeleteModelQualityJobDefinitionOutputError>) -> Void)
```

### `deleteMonitoringSchedule(input:completion:)`

Deletes a monitoring schedule. Also stops the schedule had not already been stopped. This does not delete the job execution history of the monitoring schedule.

``` swift
public func deleteMonitoringSchedule(input: DeleteMonitoringScheduleInput, completion: @escaping (ClientRuntime.SdkResult<DeleteMonitoringScheduleOutputResponse, DeleteMonitoringScheduleOutputError>) -> Void)
```

### `deleteNotebookInstance(input:completion:)`

Deletes an Amazon SageMaker notebook instance. Before you can delete a notebook instance, you must call the StopNotebookInstance API. When you delete a notebook instance, you lose all of your data. Amazon SageMaker removes the ML compute instance, and deletes the ML storage volume and the network interface associated with the notebook instance.

``` swift
public func deleteNotebookInstance(input: DeleteNotebookInstanceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteNotebookInstanceOutputResponse, DeleteNotebookInstanceOutputError>) -> Void)
```

### `deleteNotebookInstanceLifecycleConfig(input:completion:)`

Deletes a notebook instance lifecycle configuration.

``` swift
public func deleteNotebookInstanceLifecycleConfig(input: DeleteNotebookInstanceLifecycleConfigInput, completion: @escaping (ClientRuntime.SdkResult<DeleteNotebookInstanceLifecycleConfigOutputResponse, DeleteNotebookInstanceLifecycleConfigOutputError>) -> Void)
```

### `deletePipeline(input:completion:)`

Deletes a pipeline if there are no running instances of the pipeline. To delete a pipeline, you must stop all running instances of the pipeline using the StopPipelineExecution API. When you delete a pipeline, all instances of the pipeline are deleted.

``` swift
public func deletePipeline(input: DeletePipelineInput, completion: @escaping (ClientRuntime.SdkResult<DeletePipelineOutputResponse, DeletePipelineOutputError>) -> Void)
```

### `deleteProject(input:completion:)`

Delete the specified project.

``` swift
public func deleteProject(input: DeleteProjectInput, completion: @escaping (ClientRuntime.SdkResult<DeleteProjectOutputResponse, DeleteProjectOutputError>) -> Void)
```

### `deleteStudioLifecycleConfig(input:completion:)`

Deletes the Studio Lifecycle Configuration. In order to delete the Lifecycle Configuration, there must be no running apps using the Lifecycle Configuration. You must also remove the Lifecycle Configuration from UserSettings in all Domains and UserProfiles.

``` swift
public func deleteStudioLifecycleConfig(input: DeleteStudioLifecycleConfigInput, completion: @escaping (ClientRuntime.SdkResult<DeleteStudioLifecycleConfigOutputResponse, DeleteStudioLifecycleConfigOutputError>) -> Void)
```

### `deleteTags(input:completion:)`

Deletes the specified tags from an Amazon SageMaker resource. To list a resource's tags, use the ListTags API. When you call this API to delete tags from a hyperparameter tuning job, the deleted tags are not removed from training jobs that the hyperparameter tuning job launched before you called this API. When you call this API to delete tags from a SageMaker Studio Domain or User Profile, the deleted tags are not removed from Apps that the SageMaker Studio Domain or User Profile launched before you called this API.

``` swift
public func deleteTags(input: DeleteTagsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTagsOutputResponse, DeleteTagsOutputError>) -> Void)
```

### `deleteTrial(input:completion:)`

Deletes the specified trial. All trial components that make up the trial must be deleted first. Use the \[DescribeTrialComponent\] API to get the list of trial components.

``` swift
public func deleteTrial(input: DeleteTrialInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTrialOutputResponse, DeleteTrialOutputError>) -> Void)
```

### `deleteTrialComponent(input:completion:)`

Deletes the specified trial component. A trial component must be disassociated from all trials before the trial component can be deleted. To disassociate a trial component from a trial, call the \[DisassociateTrialComponent\] API.

``` swift
public func deleteTrialComponent(input: DeleteTrialComponentInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTrialComponentOutputResponse, DeleteTrialComponentOutputError>) -> Void)
```

### `deleteUserProfile(input:completion:)`

Deletes a user profile. When a user profile is deleted, the user loses access to their EFS volume, including data, notebooks, and other artifacts.

``` swift
public func deleteUserProfile(input: DeleteUserProfileInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUserProfileOutputResponse, DeleteUserProfileOutputError>) -> Void)
```

### `deleteWorkforce(input:completion:)`

Use this operation to delete a workforce. If you want to create a new workforce in an Amazon Web Services Region where a workforce already exists, use this operation to delete the existing workforce and then use to create a new workforce. If a private workforce contains one or more work teams, you must use the operation to delete all work teams before you delete the workforce. If you try to delete a workforce that contains one or more work teams, you will recieve a ResourceInUse error.

``` swift
public func deleteWorkforce(input: DeleteWorkforceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteWorkforceOutputResponse, DeleteWorkforceOutputError>) -> Void)
```

### `deleteWorkteam(input:completion:)`

Deletes an existing work team. This operation can't be undone.

``` swift
public func deleteWorkteam(input: DeleteWorkteamInput, completion: @escaping (ClientRuntime.SdkResult<DeleteWorkteamOutputResponse, DeleteWorkteamOutputError>) -> Void)
```

### `deregisterDevices(input:completion:)`

Deregisters the specified devices. After you deregister a device, you will need to re-register the devices.

``` swift
public func deregisterDevices(input: DeregisterDevicesInput, completion: @escaping (ClientRuntime.SdkResult<DeregisterDevicesOutputResponse, DeregisterDevicesOutputError>) -> Void)
```

### `describeAction(input:completion:)`

Describes an action.

``` swift
public func describeAction(input: DescribeActionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeActionOutputResponse, DescribeActionOutputError>) -> Void)
```

### `describeAlgorithm(input:completion:)`

Returns a description of the specified algorithm that is in your account.

``` swift
public func describeAlgorithm(input: DescribeAlgorithmInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAlgorithmOutputResponse, DescribeAlgorithmOutputError>) -> Void)
```

### `describeApp(input:completion:)`

Describes the app.

``` swift
public func describeApp(input: DescribeAppInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAppOutputResponse, DescribeAppOutputError>) -> Void)
```

### `describeAppImageConfig(input:completion:)`

Describes an AppImageConfig.

``` swift
public func describeAppImageConfig(input: DescribeAppImageConfigInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAppImageConfigOutputResponse, DescribeAppImageConfigOutputError>) -> Void)
```

### `describeArtifact(input:completion:)`

Describes an artifact.

``` swift
public func describeArtifact(input: DescribeArtifactInput, completion: @escaping (ClientRuntime.SdkResult<DescribeArtifactOutputResponse, DescribeArtifactOutputError>) -> Void)
```

### `describeAutoMLJob(input:completion:)`

Returns information about an Amazon SageMaker AutoML job.

``` swift
public func describeAutoMLJob(input: DescribeAutoMLJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAutoMLJobOutputResponse, DescribeAutoMLJobOutputError>) -> Void)
```

### `describeCodeRepository(input:completion:)`

Gets details about the specified Git repository.

``` swift
public func describeCodeRepository(input: DescribeCodeRepositoryInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCodeRepositoryOutputResponse, DescribeCodeRepositoryOutputError>) -> Void)
```

### `describeCompilationJob(input:completion:)`

Returns information about a model compilation job. To create a model compilation job, use \[CreateCompilationJob\]. To get information about multiple model compilation jobs, use \[ListCompilationJobs\].

``` swift
public func describeCompilationJob(input: DescribeCompilationJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCompilationJobOutputResponse, DescribeCompilationJobOutputError>) -> Void)
```

### `describeContext(input:completion:)`

Describes a context.

``` swift
public func describeContext(input: DescribeContextInput, completion: @escaping (ClientRuntime.SdkResult<DescribeContextOutputResponse, DescribeContextOutputError>) -> Void)
```

### `describeDataQualityJobDefinition(input:completion:)`

Gets the details of a data quality monitoring job definition.

``` swift
public func describeDataQualityJobDefinition(input: DescribeDataQualityJobDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDataQualityJobDefinitionOutputResponse, DescribeDataQualityJobDefinitionOutputError>) -> Void)
```

### `describeDevice(input:completion:)`

Describes the device.

``` swift
public func describeDevice(input: DescribeDeviceInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDeviceOutputResponse, DescribeDeviceOutputError>) -> Void)
```

### `describeDeviceFleet(input:completion:)`

A description of the fleet the device belongs to.

``` swift
public func describeDeviceFleet(input: DescribeDeviceFleetInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDeviceFleetOutputResponse, DescribeDeviceFleetOutputError>) -> Void)
```

### `describeDomain(input:completion:)`

The description of the domain.

``` swift
public func describeDomain(input: DescribeDomainInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDomainOutputResponse, DescribeDomainOutputError>) -> Void)
```

### `describeEdgePackagingJob(input:completion:)`

A description of edge packaging jobs.

``` swift
public func describeEdgePackagingJob(input: DescribeEdgePackagingJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEdgePackagingJobOutputResponse, DescribeEdgePackagingJobOutputError>) -> Void)
```

### `describeEndpoint(input:completion:)`

Returns the description of an endpoint.

``` swift
public func describeEndpoint(input: DescribeEndpointInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEndpointOutputResponse, DescribeEndpointOutputError>) -> Void)
```

### `describeEndpointConfig(input:completion:)`

Returns the description of an endpoint configuration created using the CreateEndpointConfig API.

``` swift
public func describeEndpointConfig(input: DescribeEndpointConfigInput, completion: @escaping (ClientRuntime.SdkResult<DescribeEndpointConfigOutputResponse, DescribeEndpointConfigOutputError>) -> Void)
```

### `describeExperiment(input:completion:)`

Provides a list of an experiment's properties.

``` swift
public func describeExperiment(input: DescribeExperimentInput, completion: @escaping (ClientRuntime.SdkResult<DescribeExperimentOutputResponse, DescribeExperimentOutputError>) -> Void)
```

### `describeFeatureGroup(input:completion:)`

Use this operation to describe a FeatureGroup. The response includes information on the creation time, FeatureGroup name, the unique identifier for each FeatureGroup, and more.

``` swift
public func describeFeatureGroup(input: DescribeFeatureGroupInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFeatureGroupOutputResponse, DescribeFeatureGroupOutputError>) -> Void)
```

### `describeFlowDefinition(input:completion:)`

Returns information about the specified flow definition.

``` swift
public func describeFlowDefinition(input: DescribeFlowDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFlowDefinitionOutputResponse, DescribeFlowDefinitionOutputError>) -> Void)
```

### `describeHumanTaskUi(input:completion:)`

Returns information about the requested human task user interface (worker task template).

``` swift
public func describeHumanTaskUi(input: DescribeHumanTaskUiInput, completion: @escaping (ClientRuntime.SdkResult<DescribeHumanTaskUiOutputResponse, DescribeHumanTaskUiOutputError>) -> Void)
```

### `describeHyperParameterTuningJob(input:completion:)`

Gets a description of a hyperparameter tuning job.

``` swift
public func describeHyperParameterTuningJob(input: DescribeHyperParameterTuningJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeHyperParameterTuningJobOutputResponse, DescribeHyperParameterTuningJobOutputError>) -> Void)
```

### `describeImage(input:completion:)`

Describes a SageMaker image.

``` swift
public func describeImage(input: DescribeImageInput, completion: @escaping (ClientRuntime.SdkResult<DescribeImageOutputResponse, DescribeImageOutputError>) -> Void)
```

### `describeImageVersion(input:completion:)`

Describes a version of a SageMaker image.

``` swift
public func describeImageVersion(input: DescribeImageVersionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeImageVersionOutputResponse, DescribeImageVersionOutputError>) -> Void)
```

### `describeLabelingJob(input:completion:)`

Gets information about a labeling job.

``` swift
public func describeLabelingJob(input: DescribeLabelingJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeLabelingJobOutputResponse, DescribeLabelingJobOutputError>) -> Void)
```

### `describeModel(input:completion:)`

Describes a model that you created using the CreateModel API.

``` swift
public func describeModel(input: DescribeModelInput, completion: @escaping (ClientRuntime.SdkResult<DescribeModelOutputResponse, DescribeModelOutputError>) -> Void)
```

### `describeModelBiasJobDefinition(input:completion:)`

Returns a description of a model bias job definition.

``` swift
public func describeModelBiasJobDefinition(input: DescribeModelBiasJobDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeModelBiasJobDefinitionOutputResponse, DescribeModelBiasJobDefinitionOutputError>) -> Void)
```

### `describeModelExplainabilityJobDefinition(input:completion:)`

Returns a description of a model explainability job definition.

``` swift
public func describeModelExplainabilityJobDefinition(input: DescribeModelExplainabilityJobDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeModelExplainabilityJobDefinitionOutputResponse, DescribeModelExplainabilityJobDefinitionOutputError>) -> Void)
```

### `describeModelPackage(input:completion:)`

Returns a description of the specified model package, which is used to create Amazon SageMaker models or list them on Amazon Web Services Marketplace. To create models in Amazon SageMaker, buyers can subscribe to model packages listed on Amazon Web Services Marketplace.

``` swift
public func describeModelPackage(input: DescribeModelPackageInput, completion: @escaping (ClientRuntime.SdkResult<DescribeModelPackageOutputResponse, DescribeModelPackageOutputError>) -> Void)
```

### `describeModelPackageGroup(input:completion:)`

Gets a description for the specified model group.

``` swift
public func describeModelPackageGroup(input: DescribeModelPackageGroupInput, completion: @escaping (ClientRuntime.SdkResult<DescribeModelPackageGroupOutputResponse, DescribeModelPackageGroupOutputError>) -> Void)
```

### `describeModelQualityJobDefinition(input:completion:)`

Returns a description of a model quality job definition.

``` swift
public func describeModelQualityJobDefinition(input: DescribeModelQualityJobDefinitionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeModelQualityJobDefinitionOutputResponse, DescribeModelQualityJobDefinitionOutputError>) -> Void)
```

### `describeMonitoringSchedule(input:completion:)`

Describes the schedule for a monitoring job.

``` swift
public func describeMonitoringSchedule(input: DescribeMonitoringScheduleInput, completion: @escaping (ClientRuntime.SdkResult<DescribeMonitoringScheduleOutputResponse, DescribeMonitoringScheduleOutputError>) -> Void)
```

### `describeNotebookInstance(input:completion:)`

Returns information about a notebook instance.

``` swift
public func describeNotebookInstance(input: DescribeNotebookInstanceInput, completion: @escaping (ClientRuntime.SdkResult<DescribeNotebookInstanceOutputResponse, DescribeNotebookInstanceOutputError>) -> Void)
```

### `describeNotebookInstanceLifecycleConfig(input:completion:)`

Returns a description of a notebook instance lifecycle configuration. For information about notebook instance lifestyle configurations, see [Step 2.1: (Optional) Customize a Notebook Instance](https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html).

``` swift
public func describeNotebookInstanceLifecycleConfig(input: DescribeNotebookInstanceLifecycleConfigInput, completion: @escaping (ClientRuntime.SdkResult<DescribeNotebookInstanceLifecycleConfigOutputResponse, DescribeNotebookInstanceLifecycleConfigOutputError>) -> Void)
```

### `describePipeline(input:completion:)`

Describes the details of a pipeline.

``` swift
public func describePipeline(input: DescribePipelineInput, completion: @escaping (ClientRuntime.SdkResult<DescribePipelineOutputResponse, DescribePipelineOutputError>) -> Void)
```

### `describePipelineDefinitionForExecution(input:completion:)`

Describes the details of an execution's pipeline definition.

``` swift
public func describePipelineDefinitionForExecution(input: DescribePipelineDefinitionForExecutionInput, completion: @escaping (ClientRuntime.SdkResult<DescribePipelineDefinitionForExecutionOutputResponse, DescribePipelineDefinitionForExecutionOutputError>) -> Void)
```

### `describePipelineExecution(input:completion:)`

Describes the details of a pipeline execution.

``` swift
public func describePipelineExecution(input: DescribePipelineExecutionInput, completion: @escaping (ClientRuntime.SdkResult<DescribePipelineExecutionOutputResponse, DescribePipelineExecutionOutputError>) -> Void)
```

### `describeProcessingJob(input:completion:)`

Returns a description of a processing job.

``` swift
public func describeProcessingJob(input: DescribeProcessingJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeProcessingJobOutputResponse, DescribeProcessingJobOutputError>) -> Void)
```

### `describeProject(input:completion:)`

Describes the details of a project.

``` swift
public func describeProject(input: DescribeProjectInput, completion: @escaping (ClientRuntime.SdkResult<DescribeProjectOutputResponse, DescribeProjectOutputError>) -> Void)
```

### `describeStudioLifecycleConfig(input:completion:)`

Describes the Studio Lifecycle Configuration.

``` swift
public func describeStudioLifecycleConfig(input: DescribeStudioLifecycleConfigInput, completion: @escaping (ClientRuntime.SdkResult<DescribeStudioLifecycleConfigOutputResponse, DescribeStudioLifecycleConfigOutputError>) -> Void)
```

### `describeSubscribedWorkteam(input:completion:)`

Gets information about a work team provided by a vendor. It returns details about the subscription with a vendor in the Amazon Web Services Marketplace.

``` swift
public func describeSubscribedWorkteam(input: DescribeSubscribedWorkteamInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSubscribedWorkteamOutputResponse, DescribeSubscribedWorkteamOutputError>) -> Void)
```

### `describeTrainingJob(input:completion:)`

Returns information about a training job. Some of the attributes below only appear if the training job successfully starts. If the training job fails, TrainingJobStatus is Failed and, depending on the FailureReason, attributes like TrainingStartTime, TrainingTimeInSeconds, TrainingEndTime, and BillableTimeInSeconds may not be present in the response.

``` swift
public func describeTrainingJob(input: DescribeTrainingJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTrainingJobOutputResponse, DescribeTrainingJobOutputError>) -> Void)
```

### `describeTransformJob(input:completion:)`

Returns information about a transform job.

``` swift
public func describeTransformJob(input: DescribeTransformJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTransformJobOutputResponse, DescribeTransformJobOutputError>) -> Void)
```

### `describeTrial(input:completion:)`

Provides a list of a trial's properties.

``` swift
public func describeTrial(input: DescribeTrialInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTrialOutputResponse, DescribeTrialOutputError>) -> Void)
```

### `describeTrialComponent(input:completion:)`

Provides a list of a trials component's properties.

``` swift
public func describeTrialComponent(input: DescribeTrialComponentInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTrialComponentOutputResponse, DescribeTrialComponentOutputError>) -> Void)
```

### `describeUserProfile(input:completion:)`

Describes a user profile. For more information, see CreateUserProfile.

``` swift
public func describeUserProfile(input: DescribeUserProfileInput, completion: @escaping (ClientRuntime.SdkResult<DescribeUserProfileOutputResponse, DescribeUserProfileOutputError>) -> Void)
```

### `describeWorkforce(input:completion:)`

Lists private workforce information, including workforce name, Amazon Resource Name (ARN), and, if applicable, allowed IP address ranges ([CIDRs](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html)). Allowable IP address ranges are the IP addresses that workers can use to access tasks. This operation applies only to private workforces.

``` swift
public func describeWorkforce(input: DescribeWorkforceInput, completion: @escaping (ClientRuntime.SdkResult<DescribeWorkforceOutputResponse, DescribeWorkforceOutputError>) -> Void)
```

### `describeWorkteam(input:completion:)`

Gets information about a specific work team. You can see information such as the create date, the last updated date, membership information, and the work team's Amazon Resource Name (ARN).

``` swift
public func describeWorkteam(input: DescribeWorkteamInput, completion: @escaping (ClientRuntime.SdkResult<DescribeWorkteamOutputResponse, DescribeWorkteamOutputError>) -> Void)
```

### `disableSagemakerServicecatalogPortfolio(input:completion:)`

Disables using Service Catalog in SageMaker. Service Catalog is used to create SageMaker projects.

``` swift
public func disableSagemakerServicecatalogPortfolio(input: DisableSagemakerServicecatalogPortfolioInput, completion: @escaping (ClientRuntime.SdkResult<DisableSagemakerServicecatalogPortfolioOutputResponse, DisableSagemakerServicecatalogPortfolioOutputError>) -> Void)
```

### `disassociateTrialComponent(input:completion:)`

Disassociates a trial component from a trial. This doesn't effect other trials the component is associated with. Before you can delete a component, you must disassociate the component from all trials it is associated with. To associate a trial component with a trial, call the \[AssociateTrialComponent\] API. To get a list of the trials a component is associated with, use the \[Search\] API. Specify ExperimentTrialComponent for the Resource parameter. The list appears in the response under Results.TrialComponent.Parents.

``` swift
public func disassociateTrialComponent(input: DisassociateTrialComponentInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateTrialComponentOutputResponse, DisassociateTrialComponentOutputError>) -> Void)
```

### `enableSagemakerServicecatalogPortfolio(input:completion:)`

Enables using Service Catalog in SageMaker. Service Catalog is used to create SageMaker projects.

``` swift
public func enableSagemakerServicecatalogPortfolio(input: EnableSagemakerServicecatalogPortfolioInput, completion: @escaping (ClientRuntime.SdkResult<EnableSagemakerServicecatalogPortfolioOutputResponse, EnableSagemakerServicecatalogPortfolioOutputError>) -> Void)
```

### `getDeviceFleetReport(input:completion:)`

Describes a fleet.

``` swift
public func getDeviceFleetReport(input: GetDeviceFleetReportInput, completion: @escaping (ClientRuntime.SdkResult<GetDeviceFleetReportOutputResponse, GetDeviceFleetReportOutputError>) -> Void)
```

### `getModelPackageGroupPolicy(input:completion:)`

Gets a resource policy that manages access for a model group. For information about resource policies, see [Identity-based policies and resource-based policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_identity-vs-resource.html) in the Amazon Web Services Identity and Access Management User Guide..

``` swift
public func getModelPackageGroupPolicy(input: GetModelPackageGroupPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetModelPackageGroupPolicyOutputResponse, GetModelPackageGroupPolicyOutputError>) -> Void)
```

### `getSagemakerServicecatalogPortfolioStatus(input:completion:)`

Gets the status of Service Catalog in SageMaker. Service Catalog is used to create SageMaker projects.

``` swift
public func getSagemakerServicecatalogPortfolioStatus(input: GetSagemakerServicecatalogPortfolioStatusInput, completion: @escaping (ClientRuntime.SdkResult<GetSagemakerServicecatalogPortfolioStatusOutputResponse, GetSagemakerServicecatalogPortfolioStatusOutputError>) -> Void)
```

### `getSearchSuggestions(input:completion:)`

An auto-complete API for the search functionality in the Amazon SageMaker console. It returns suggestions of possible matches for the property name to use in Search queries. Provides suggestions for HyperParameters, Tags, and Metrics.

``` swift
public func getSearchSuggestions(input: GetSearchSuggestionsInput, completion: @escaping (ClientRuntime.SdkResult<GetSearchSuggestionsOutputResponse, GetSearchSuggestionsOutputError>) -> Void)
```

### `listActions(input:completion:)`

Lists the actions in your account and their properties.

``` swift
public func listActions(input: ListActionsInput, completion: @escaping (ClientRuntime.SdkResult<ListActionsOutputResponse, ListActionsOutputError>) -> Void)
```

### `listAlgorithms(input:completion:)`

Lists the machine learning algorithms that have been created.

``` swift
public func listAlgorithms(input: ListAlgorithmsInput, completion: @escaping (ClientRuntime.SdkResult<ListAlgorithmsOutputResponse, ListAlgorithmsOutputError>) -> Void)
```

### `listAppImageConfigs(input:completion:)`

Lists the AppImageConfigs in your account and their properties. The list can be filtered by creation time or modified time, and whether the AppImageConfig name contains a specified string.

``` swift
public func listAppImageConfigs(input: ListAppImageConfigsInput, completion: @escaping (ClientRuntime.SdkResult<ListAppImageConfigsOutputResponse, ListAppImageConfigsOutputError>) -> Void)
```

### `listApps(input:completion:)`

Lists apps.

``` swift
public func listApps(input: ListAppsInput, completion: @escaping (ClientRuntime.SdkResult<ListAppsOutputResponse, ListAppsOutputError>) -> Void)
```

### `listArtifacts(input:completion:)`

Lists the artifacts in your account and their properties.

``` swift
public func listArtifacts(input: ListArtifactsInput, completion: @escaping (ClientRuntime.SdkResult<ListArtifactsOutputResponse, ListArtifactsOutputError>) -> Void)
```

### `listAssociations(input:completion:)`

Lists the associations in your account and their properties.

``` swift
public func listAssociations(input: ListAssociationsInput, completion: @escaping (ClientRuntime.SdkResult<ListAssociationsOutputResponse, ListAssociationsOutputError>) -> Void)
```

### `listAutoMLJobs(input:completion:)`

Request a list of jobs.

``` swift
public func listAutoMLJobs(input: ListAutoMLJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListAutoMLJobsOutputResponse, ListAutoMLJobsOutputError>) -> Void)
```

### `listCandidatesForAutoMLJob(input:completion:)`

List the candidates created for the job.

``` swift
public func listCandidatesForAutoMLJob(input: ListCandidatesForAutoMLJobInput, completion: @escaping (ClientRuntime.SdkResult<ListCandidatesForAutoMLJobOutputResponse, ListCandidatesForAutoMLJobOutputError>) -> Void)
```

### `listCodeRepositories(input:completion:)`

Gets a list of the Git repositories in your account.

``` swift
public func listCodeRepositories(input: ListCodeRepositoriesInput, completion: @escaping (ClientRuntime.SdkResult<ListCodeRepositoriesOutputResponse, ListCodeRepositoriesOutputError>) -> Void)
```

### `listCompilationJobs(input:completion:)`

Lists model compilation jobs that satisfy various filters. To create a model compilation job, use \[CreateCompilationJob\]. To get information about a particular model compilation job you have created, use \[DescribeCompilationJob\].

``` swift
public func listCompilationJobs(input: ListCompilationJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListCompilationJobsOutputResponse, ListCompilationJobsOutputError>) -> Void)
```

### `listContexts(input:completion:)`

Lists the contexts in your account and their properties.

``` swift
public func listContexts(input: ListContextsInput, completion: @escaping (ClientRuntime.SdkResult<ListContextsOutputResponse, ListContextsOutputError>) -> Void)
```

### `listDataQualityJobDefinitions(input:completion:)`

Lists the data quality job definitions in your account.

``` swift
public func listDataQualityJobDefinitions(input: ListDataQualityJobDefinitionsInput, completion: @escaping (ClientRuntime.SdkResult<ListDataQualityJobDefinitionsOutputResponse, ListDataQualityJobDefinitionsOutputError>) -> Void)
```

### `listDeviceFleets(input:completion:)`

Returns a list of devices in the fleet.

``` swift
public func listDeviceFleets(input: ListDeviceFleetsInput, completion: @escaping (ClientRuntime.SdkResult<ListDeviceFleetsOutputResponse, ListDeviceFleetsOutputError>) -> Void)
```

### `listDevices(input:completion:)`

A list of devices.

``` swift
public func listDevices(input: ListDevicesInput, completion: @escaping (ClientRuntime.SdkResult<ListDevicesOutputResponse, ListDevicesOutputError>) -> Void)
```

### `listDomains(input:completion:)`

Lists the domains.

``` swift
public func listDomains(input: ListDomainsInput, completion: @escaping (ClientRuntime.SdkResult<ListDomainsOutputResponse, ListDomainsOutputError>) -> Void)
```

### `listEdgePackagingJobs(input:completion:)`

Returns a list of edge packaging jobs.

``` swift
public func listEdgePackagingJobs(input: ListEdgePackagingJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListEdgePackagingJobsOutputResponse, ListEdgePackagingJobsOutputError>) -> Void)
```

### `listEndpointConfigs(input:completion:)`

Lists endpoint configurations.

``` swift
public func listEndpointConfigs(input: ListEndpointConfigsInput, completion: @escaping (ClientRuntime.SdkResult<ListEndpointConfigsOutputResponse, ListEndpointConfigsOutputError>) -> Void)
```

### `listEndpoints(input:completion:)`

Lists endpoints.

``` swift
public func listEndpoints(input: ListEndpointsInput, completion: @escaping (ClientRuntime.SdkResult<ListEndpointsOutputResponse, ListEndpointsOutputError>) -> Void)
```

### `listExperiments(input:completion:)`

Lists all the experiments in your account. The list can be filtered to show only experiments that were created in a specific time range. The list can be sorted by experiment name or creation time.

``` swift
public func listExperiments(input: ListExperimentsInput, completion: @escaping (ClientRuntime.SdkResult<ListExperimentsOutputResponse, ListExperimentsOutputError>) -> Void)
```

### `listFeatureGroups(input:completion:)`

List FeatureGroups based on given filter and order.

``` swift
public func listFeatureGroups(input: ListFeatureGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListFeatureGroupsOutputResponse, ListFeatureGroupsOutputError>) -> Void)
```

### `listFlowDefinitions(input:completion:)`

Returns information about the flow definitions in your account.

``` swift
public func listFlowDefinitions(input: ListFlowDefinitionsInput, completion: @escaping (ClientRuntime.SdkResult<ListFlowDefinitionsOutputResponse, ListFlowDefinitionsOutputError>) -> Void)
```

### `listHumanTaskUis(input:completion:)`

Returns information about the human task user interfaces in your account.

``` swift
public func listHumanTaskUis(input: ListHumanTaskUisInput, completion: @escaping (ClientRuntime.SdkResult<ListHumanTaskUisOutputResponse, ListHumanTaskUisOutputError>) -> Void)
```

### `listHyperParameterTuningJobs(input:completion:)`

Gets a list of \[HyperParameterTuningJobSummary\] objects that describe the hyperparameter tuning jobs launched in your account.

``` swift
public func listHyperParameterTuningJobs(input: ListHyperParameterTuningJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListHyperParameterTuningJobsOutputResponse, ListHyperParameterTuningJobsOutputError>) -> Void)
```

### `listImageVersions(input:completion:)`

Lists the versions of a specified image and their properties. The list can be filtered by creation time or modified time.

``` swift
public func listImageVersions(input: ListImageVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListImageVersionsOutputResponse, ListImageVersionsOutputError>) -> Void)
```

### `listImages(input:completion:)`

Lists the images in your account and their properties. The list can be filtered by creation time or modified time, and whether the image name contains a specified string.

``` swift
public func listImages(input: ListImagesInput, completion: @escaping (ClientRuntime.SdkResult<ListImagesOutputResponse, ListImagesOutputError>) -> Void)
```

### `listLabelingJobs(input:completion:)`

Gets a list of labeling jobs.

``` swift
public func listLabelingJobs(input: ListLabelingJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListLabelingJobsOutputResponse, ListLabelingJobsOutputError>) -> Void)
```

### `listLabelingJobsForWorkteam(input:completion:)`

Gets a list of labeling jobs assigned to a specified work team.

``` swift
public func listLabelingJobsForWorkteam(input: ListLabelingJobsForWorkteamInput, completion: @escaping (ClientRuntime.SdkResult<ListLabelingJobsForWorkteamOutputResponse, ListLabelingJobsForWorkteamOutputError>) -> Void)
```

### `listModelBiasJobDefinitions(input:completion:)`

Lists model bias jobs definitions that satisfy various filters.

``` swift
public func listModelBiasJobDefinitions(input: ListModelBiasJobDefinitionsInput, completion: @escaping (ClientRuntime.SdkResult<ListModelBiasJobDefinitionsOutputResponse, ListModelBiasJobDefinitionsOutputError>) -> Void)
```

### `listModelExplainabilityJobDefinitions(input:completion:)`

Lists model explainability job definitions that satisfy various filters.

``` swift
public func listModelExplainabilityJobDefinitions(input: ListModelExplainabilityJobDefinitionsInput, completion: @escaping (ClientRuntime.SdkResult<ListModelExplainabilityJobDefinitionsOutputResponse, ListModelExplainabilityJobDefinitionsOutputError>) -> Void)
```

### `listModelPackageGroups(input:completion:)`

Gets a list of the model groups in your Amazon Web Services account.

``` swift
public func listModelPackageGroups(input: ListModelPackageGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListModelPackageGroupsOutputResponse, ListModelPackageGroupsOutputError>) -> Void)
```

### `listModelPackages(input:completion:)`

Lists the model packages that have been created.

``` swift
public func listModelPackages(input: ListModelPackagesInput, completion: @escaping (ClientRuntime.SdkResult<ListModelPackagesOutputResponse, ListModelPackagesOutputError>) -> Void)
```

### `listModelQualityJobDefinitions(input:completion:)`

Gets a list of model quality monitoring job definitions in your account.

``` swift
public func listModelQualityJobDefinitions(input: ListModelQualityJobDefinitionsInput, completion: @escaping (ClientRuntime.SdkResult<ListModelQualityJobDefinitionsOutputResponse, ListModelQualityJobDefinitionsOutputError>) -> Void)
```

### `listModels(input:completion:)`

Lists models created with the CreateModel API.

``` swift
public func listModels(input: ListModelsInput, completion: @escaping (ClientRuntime.SdkResult<ListModelsOutputResponse, ListModelsOutputError>) -> Void)
```

### `listMonitoringExecutions(input:completion:)`

Returns list of all monitoring job executions.

``` swift
public func listMonitoringExecutions(input: ListMonitoringExecutionsInput, completion: @escaping (ClientRuntime.SdkResult<ListMonitoringExecutionsOutputResponse, ListMonitoringExecutionsOutputError>) -> Void)
```

### `listMonitoringSchedules(input:completion:)`

Returns list of all monitoring schedules.

``` swift
public func listMonitoringSchedules(input: ListMonitoringSchedulesInput, completion: @escaping (ClientRuntime.SdkResult<ListMonitoringSchedulesOutputResponse, ListMonitoringSchedulesOutputError>) -> Void)
```

### `listNotebookInstanceLifecycleConfigs(input:completion:)`

Lists notebook instance lifestyle configurations created with the \[CreateNotebookInstanceLifecycleConfig\] API.

``` swift
public func listNotebookInstanceLifecycleConfigs(input: ListNotebookInstanceLifecycleConfigsInput, completion: @escaping (ClientRuntime.SdkResult<ListNotebookInstanceLifecycleConfigsOutputResponse, ListNotebookInstanceLifecycleConfigsOutputError>) -> Void)
```

### `listNotebookInstances(input:completion:)`

Returns a list of the Amazon SageMaker notebook instances in the requester's account in an Amazon Web Services Region.

``` swift
public func listNotebookInstances(input: ListNotebookInstancesInput, completion: @escaping (ClientRuntime.SdkResult<ListNotebookInstancesOutputResponse, ListNotebookInstancesOutputError>) -> Void)
```

### `listPipelineExecutionSteps(input:completion:)`

Gets a list of PipeLineExecutionStep objects.

``` swift
public func listPipelineExecutionSteps(input: ListPipelineExecutionStepsInput, completion: @escaping (ClientRuntime.SdkResult<ListPipelineExecutionStepsOutputResponse, ListPipelineExecutionStepsOutputError>) -> Void)
```

### `listPipelineExecutions(input:completion:)`

Gets a list of the pipeline executions.

``` swift
public func listPipelineExecutions(input: ListPipelineExecutionsInput, completion: @escaping (ClientRuntime.SdkResult<ListPipelineExecutionsOutputResponse, ListPipelineExecutionsOutputError>) -> Void)
```

### `listPipelineParametersForExecution(input:completion:)`

Gets a list of parameters for a pipeline execution.

``` swift
public func listPipelineParametersForExecution(input: ListPipelineParametersForExecutionInput, completion: @escaping (ClientRuntime.SdkResult<ListPipelineParametersForExecutionOutputResponse, ListPipelineParametersForExecutionOutputError>) -> Void)
```

### `listPipelines(input:completion:)`

Gets a list of pipelines.

``` swift
public func listPipelines(input: ListPipelinesInput, completion: @escaping (ClientRuntime.SdkResult<ListPipelinesOutputResponse, ListPipelinesOutputError>) -> Void)
```

### `listProcessingJobs(input:completion:)`

Lists processing jobs that satisfy various filters.

``` swift
public func listProcessingJobs(input: ListProcessingJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListProcessingJobsOutputResponse, ListProcessingJobsOutputError>) -> Void)
```

### `listProjects(input:completion:)`

Gets a list of the projects in an Amazon Web Services account.

``` swift
public func listProjects(input: ListProjectsInput, completion: @escaping (ClientRuntime.SdkResult<ListProjectsOutputResponse, ListProjectsOutputError>) -> Void)
```

### `listStudioLifecycleConfigs(input:completion:)`

Lists the Studio Lifecycle Configurations in your Amazon Web Services Account.

``` swift
public func listStudioLifecycleConfigs(input: ListStudioLifecycleConfigsInput, completion: @escaping (ClientRuntime.SdkResult<ListStudioLifecycleConfigsOutputResponse, ListStudioLifecycleConfigsOutputError>) -> Void)
```

### `listSubscribedWorkteams(input:completion:)`

Gets a list of the work teams that you are subscribed to in the Amazon Web Services Marketplace. The list may be empty if no work team satisfies the filter specified in the NameContains parameter.

``` swift
public func listSubscribedWorkteams(input: ListSubscribedWorkteamsInput, completion: @escaping (ClientRuntime.SdkResult<ListSubscribedWorkteamsOutputResponse, ListSubscribedWorkteamsOutputError>) -> Void)
```

### `listTags(input:completion:)`

Returns the tags for the specified Amazon SageMaker resource.

``` swift
public func listTags(input: ListTagsInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsOutputResponse, ListTagsOutputError>) -> Void)
```

### `listTrainingJobs(input:completion:)`

Lists training jobs. When StatusEquals and MaxResults are set at the same time, the MaxResults number of training jobs are first retrieved ignoring the StatusEquals parameter and then they are filtered by the StatusEquals parameter, which is returned as a response. For example, if ListTrainingJobs is invoked with the following parameters: { ... MaxResults: 100, StatusEquals: InProgress ... } First, 100 trainings jobs with any status, including those other than InProgress, are selected (sorted according to the creation time, from the most current to the oldest). Next, those with a status of InProgress are returned. You can quickly test the API using the following Amazon Web Services CLI code. aws sagemaker list-training-jobs --max-results 100 --status-equals InProgress

``` swift
public func listTrainingJobs(input: ListTrainingJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListTrainingJobsOutputResponse, ListTrainingJobsOutputError>) -> Void)
```

### `listTrainingJobsForHyperParameterTuningJob(input:completion:)`

Gets a list of \[TrainingJobSummary\] objects that describe the training jobs that a hyperparameter tuning job launched.

``` swift
public func listTrainingJobsForHyperParameterTuningJob(input: ListTrainingJobsForHyperParameterTuningJobInput, completion: @escaping (ClientRuntime.SdkResult<ListTrainingJobsForHyperParameterTuningJobOutputResponse, ListTrainingJobsForHyperParameterTuningJobOutputError>) -> Void)
```

### `listTransformJobs(input:completion:)`

Lists transform jobs.

``` swift
public func listTransformJobs(input: ListTransformJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListTransformJobsOutputResponse, ListTransformJobsOutputError>) -> Void)
```

### `listTrialComponents(input:completion:)`

Lists the trial components in your account. You can sort the list by trial component name or creation time. You can filter the list to show only components that were created in a specific time range. You can also filter on one of the following:

``` swift
public func listTrialComponents(input: ListTrialComponentsInput, completion: @escaping (ClientRuntime.SdkResult<ListTrialComponentsOutputResponse, ListTrialComponentsOutputError>) -> Void)
```

  - ExperimentName

  - SourceArn

  - TrialName

### `listTrials(input:completion:)`

Lists the trials in your account. Specify an experiment name to limit the list to the trials that are part of that experiment. Specify a trial component name to limit the list to the trials that associated with that trial component. The list can be filtered to show only trials that were created in a specific time range. The list can be sorted by trial name or creation time.

``` swift
public func listTrials(input: ListTrialsInput, completion: @escaping (ClientRuntime.SdkResult<ListTrialsOutputResponse, ListTrialsOutputError>) -> Void)
```

### `listUserProfiles(input:completion:)`

Lists user profiles.

``` swift
public func listUserProfiles(input: ListUserProfilesInput, completion: @escaping (ClientRuntime.SdkResult<ListUserProfilesOutputResponse, ListUserProfilesOutputError>) -> Void)
```

### `listWorkforces(input:completion:)`

Use this operation to list all private and vendor workforces in an Amazon Web Services Region. Note that you can only have one private workforce per Amazon Web Services Region.

``` swift
public func listWorkforces(input: ListWorkforcesInput, completion: @escaping (ClientRuntime.SdkResult<ListWorkforcesOutputResponse, ListWorkforcesOutputError>) -> Void)
```

### `listWorkteams(input:completion:)`

Gets a list of private work teams that you have defined in a region. The list may be empty if no work team satisfies the filter specified in the NameContains parameter.

``` swift
public func listWorkteams(input: ListWorkteamsInput, completion: @escaping (ClientRuntime.SdkResult<ListWorkteamsOutputResponse, ListWorkteamsOutputError>) -> Void)
```

### `putModelPackageGroupPolicy(input:completion:)`

Adds a resouce policy to control access to a model group. For information about resoure policies, see [Identity-based policies and resource-based policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_identity-vs-resource.html) in the Amazon Web Services Identity and Access Management User Guide..

``` swift
public func putModelPackageGroupPolicy(input: PutModelPackageGroupPolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutModelPackageGroupPolicyOutputResponse, PutModelPackageGroupPolicyOutputError>) -> Void)
```

### `registerDevices(input:completion:)`

Register devices.

``` swift
public func registerDevices(input: RegisterDevicesInput, completion: @escaping (ClientRuntime.SdkResult<RegisterDevicesOutputResponse, RegisterDevicesOutputError>) -> Void)
```

### `renderUiTemplate(input:completion:)`

Renders the UI template so that you can preview the worker's experience.

``` swift
public func renderUiTemplate(input: RenderUiTemplateInput, completion: @escaping (ClientRuntime.SdkResult<RenderUiTemplateOutputResponse, RenderUiTemplateOutputError>) -> Void)
```

### `retryPipelineExecution(input:completion:)`

Retry the execution of the pipeline.

``` swift
public func retryPipelineExecution(input: RetryPipelineExecutionInput, completion: @escaping (ClientRuntime.SdkResult<RetryPipelineExecutionOutputResponse, RetryPipelineExecutionOutputError>) -> Void)
```

### `search(input:completion:)`

Finds Amazon SageMaker resources that match a search query. Matching resources are returned as a list of SearchRecord objects in the response. You can sort the search results by any resource property in a ascending or descending order. You can query against the following value types: numeric, text, Boolean, and timestamp.

``` swift
public func search(input: SearchInput, completion: @escaping (ClientRuntime.SdkResult<SearchOutputResponse, SearchOutputError>) -> Void)
```

### `sendPipelineExecutionStepFailure(input:completion:)`

Notifies the pipeline that the execution of a callback step failed, along with a message describing why. When a callback step is run, the pipeline generates a callback token and includes the token in a message sent to Amazon Simple Queue Service (Amazon SQS).

``` swift
public func sendPipelineExecutionStepFailure(input: SendPipelineExecutionStepFailureInput, completion: @escaping (ClientRuntime.SdkResult<SendPipelineExecutionStepFailureOutputResponse, SendPipelineExecutionStepFailureOutputError>) -> Void)
```

### `sendPipelineExecutionStepSuccess(input:completion:)`

Notifies the pipeline that the execution of a callback step succeeded and provides a list of the step's output parameters. When a callback step is run, the pipeline generates a callback token and includes the token in a message sent to Amazon Simple Queue Service (Amazon SQS).

``` swift
public func sendPipelineExecutionStepSuccess(input: SendPipelineExecutionStepSuccessInput, completion: @escaping (ClientRuntime.SdkResult<SendPipelineExecutionStepSuccessOutputResponse, SendPipelineExecutionStepSuccessOutputError>) -> Void)
```

### `startMonitoringSchedule(input:completion:)`

Starts a previously stopped monitoring schedule. By default, when you successfully create a new schedule, the status of a monitoring schedule is scheduled.

``` swift
public func startMonitoringSchedule(input: StartMonitoringScheduleInput, completion: @escaping (ClientRuntime.SdkResult<StartMonitoringScheduleOutputResponse, StartMonitoringScheduleOutputError>) -> Void)
```

### `startNotebookInstance(input:completion:)`

Launches an ML compute instance with the latest version of the libraries and attaches your ML storage volume. After configuring the notebook instance, Amazon SageMaker sets the notebook instance status to InService. A notebook instance's status must be InService before you can connect to your Jupyter notebook.

``` swift
public func startNotebookInstance(input: StartNotebookInstanceInput, completion: @escaping (ClientRuntime.SdkResult<StartNotebookInstanceOutputResponse, StartNotebookInstanceOutputError>) -> Void)
```

### `startPipelineExecution(input:completion:)`

Starts a pipeline execution.

``` swift
public func startPipelineExecution(input: StartPipelineExecutionInput, completion: @escaping (ClientRuntime.SdkResult<StartPipelineExecutionOutputResponse, StartPipelineExecutionOutputError>) -> Void)
```

### `stopAutoMLJob(input:completion:)`

A method for forcing the termination of a running job.

``` swift
public func stopAutoMLJob(input: StopAutoMLJobInput, completion: @escaping (ClientRuntime.SdkResult<StopAutoMLJobOutputResponse, StopAutoMLJobOutputError>) -> Void)
```

### `stopCompilationJob(input:completion:)`

Stops a model compilation job. To stop a job, Amazon SageMaker sends the algorithm the SIGTERM signal. This gracefully shuts the job down. If the job hasn't stopped, it sends the SIGKILL signal. When it receives a StopCompilationJob request, Amazon SageMaker changes the \[CompilationJobSummary$CompilationJobStatus\] of the job to Stopping. After Amazon SageMaker stops the job, it sets the \[CompilationJobSummary$CompilationJobStatus\] to Stopped.

``` swift
public func stopCompilationJob(input: StopCompilationJobInput, completion: @escaping (ClientRuntime.SdkResult<StopCompilationJobOutputResponse, StopCompilationJobOutputError>) -> Void)
```

### `stopEdgePackagingJob(input:completion:)`

Request to stop an edge packaging job.

``` swift
public func stopEdgePackagingJob(input: StopEdgePackagingJobInput, completion: @escaping (ClientRuntime.SdkResult<StopEdgePackagingJobOutputResponse, StopEdgePackagingJobOutputError>) -> Void)
```

### `stopHyperParameterTuningJob(input:completion:)`

Stops a running hyperparameter tuning job and all running training jobs that the tuning job launched. All model artifacts output from the training jobs are stored in Amazon Simple Storage Service (Amazon S3). All data that the training jobs write to Amazon CloudWatch Logs are still available in CloudWatch. After the tuning job moves to the Stopped state, it releases all reserved resources for the tuning job.

``` swift
public func stopHyperParameterTuningJob(input: StopHyperParameterTuningJobInput, completion: @escaping (ClientRuntime.SdkResult<StopHyperParameterTuningJobOutputResponse, StopHyperParameterTuningJobOutputError>) -> Void)
```

### `stopLabelingJob(input:completion:)`

Stops a running labeling job. A job that is stopped cannot be restarted. Any results obtained before the job is stopped are placed in the Amazon S3 output bucket.

``` swift
public func stopLabelingJob(input: StopLabelingJobInput, completion: @escaping (ClientRuntime.SdkResult<StopLabelingJobOutputResponse, StopLabelingJobOutputError>) -> Void)
```

### `stopMonitoringSchedule(input:completion:)`

Stops a previously started monitoring schedule.

``` swift
public func stopMonitoringSchedule(input: StopMonitoringScheduleInput, completion: @escaping (ClientRuntime.SdkResult<StopMonitoringScheduleOutputResponse, StopMonitoringScheduleOutputError>) -> Void)
```

### `stopNotebookInstance(input:completion:)`

Terminates the ML compute instance. Before terminating the instance, Amazon SageMaker disconnects the ML storage volume from it. Amazon SageMaker preserves the ML storage volume. Amazon SageMaker stops charging you for the ML compute instance when you call StopNotebookInstance. To access data on the ML storage volume for a notebook instance that has been terminated, call the StartNotebookInstance API. StartNotebookInstance launches another ML compute instance, configures it, and attaches the preserved ML storage volume so you can continue your work.

``` swift
public func stopNotebookInstance(input: StopNotebookInstanceInput, completion: @escaping (ClientRuntime.SdkResult<StopNotebookInstanceOutputResponse, StopNotebookInstanceOutputError>) -> Void)
```

### `stopPipelineExecution(input:completion:)`

Stops a pipeline execution. Callback Step A pipeline execution won't stop while a callback step is running. When you call StopPipelineExecution on a pipeline execution with a running callback step, SageMaker Pipelines sends an additional Amazon SQS message to the specified SQS queue. The body of the SQS message contains a "Status" field which is set to "Stopping". You should add logic to your Amazon SQS message consumer to take any needed action (for example, resource cleanup) upon receipt of the message followed by a call to SendPipelineExecutionStepSuccess or SendPipelineExecutionStepFailure. Only when SageMaker Pipelines receives one of these calls will it stop the pipeline execution. Lambda Step A pipeline execution can't be stopped while a lambda step is running because the Lambda function invoked by the lambda step can't be stopped. If you attempt to stop the execution while the Lambda function is running, the pipeline waits for the Lambda function to finish or until the timeout is hit, whichever occurs first, and then stops. If the Lambda function finishes, the pipeline execution status is Stopped. If the timeout is hit the pipeline execution status is Failed.

``` swift
public func stopPipelineExecution(input: StopPipelineExecutionInput, completion: @escaping (ClientRuntime.SdkResult<StopPipelineExecutionOutputResponse, StopPipelineExecutionOutputError>) -> Void)
```

### `stopProcessingJob(input:completion:)`

Stops a processing job.

``` swift
public func stopProcessingJob(input: StopProcessingJobInput, completion: @escaping (ClientRuntime.SdkResult<StopProcessingJobOutputResponse, StopProcessingJobOutputError>) -> Void)
```

### `stopTrainingJob(input:completion:)`

Stops a training job. To stop a job, Amazon SageMaker sends the algorithm the SIGTERM signal, which delays job termination for 120 seconds. Algorithms might use this 120-second window to save the model artifacts, so the results of the training is not lost. When it receives a StopTrainingJob request, Amazon SageMaker changes the status of the job to Stopping. After Amazon SageMaker stops the job, it sets the status to Stopped.

``` swift
public func stopTrainingJob(input: StopTrainingJobInput, completion: @escaping (ClientRuntime.SdkResult<StopTrainingJobOutputResponse, StopTrainingJobOutputError>) -> Void)
```

### `stopTransformJob(input:completion:)`

Stops a transform job. When Amazon SageMaker receives a StopTransformJob request, the status of the job changes to Stopping. After Amazon SageMaker stops the job, the status is set to Stopped. When you stop a transform job before it is completed, Amazon SageMaker doesn't store the job's output in Amazon S3.

``` swift
public func stopTransformJob(input: StopTransformJobInput, completion: @escaping (ClientRuntime.SdkResult<StopTransformJobOutputResponse, StopTransformJobOutputError>) -> Void)
```

### `updateAction(input:completion:)`

Updates an action.

``` swift
public func updateAction(input: UpdateActionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateActionOutputResponse, UpdateActionOutputError>) -> Void)
```

### `updateAppImageConfig(input:completion:)`

Updates the properties of an AppImageConfig.

``` swift
public func updateAppImageConfig(input: UpdateAppImageConfigInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAppImageConfigOutputResponse, UpdateAppImageConfigOutputError>) -> Void)
```

### `updateArtifact(input:completion:)`

Updates an artifact.

``` swift
public func updateArtifact(input: UpdateArtifactInput, completion: @escaping (ClientRuntime.SdkResult<UpdateArtifactOutputResponse, UpdateArtifactOutputError>) -> Void)
```

### `updateCodeRepository(input:completion:)`

Updates the specified Git repository with the specified values.

``` swift
public func updateCodeRepository(input: UpdateCodeRepositoryInput, completion: @escaping (ClientRuntime.SdkResult<UpdateCodeRepositoryOutputResponse, UpdateCodeRepositoryOutputError>) -> Void)
```

### `updateContext(input:completion:)`

Updates a context.

``` swift
public func updateContext(input: UpdateContextInput, completion: @escaping (ClientRuntime.SdkResult<UpdateContextOutputResponse, UpdateContextOutputError>) -> Void)
```

### `updateDeviceFleet(input:completion:)`

Updates a fleet of devices.

``` swift
public func updateDeviceFleet(input: UpdateDeviceFleetInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDeviceFleetOutputResponse, UpdateDeviceFleetOutputError>) -> Void)
```

### `updateDevices(input:completion:)`

Updates one or more devices in a fleet.

``` swift
public func updateDevices(input: UpdateDevicesInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDevicesOutputResponse, UpdateDevicesOutputError>) -> Void)
```

### `updateDomain(input:completion:)`

Updates the default settings for new user profiles in the domain.

``` swift
public func updateDomain(input: UpdateDomainInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDomainOutputResponse, UpdateDomainOutputError>) -> Void)
```

### `updateEndpoint(input:completion:)`

Deploys the new EndpointConfig specified in the request, switches to using newly created endpoint, and then deletes resources provisioned for the endpoint using the previous EndpointConfig (there is no availability loss). When Amazon SageMaker receives the request, it sets the endpoint status to Updating. After updating the endpoint, it sets the status to InService. To check the status of an endpoint, use the \[DescribeEndpoint\] API. You must not delete an EndpointConfig in use by an endpoint that is live or while the UpdateEndpoint or CreateEndpoint operations are being performed on the endpoint. To update an endpoint, you must create a new EndpointConfig. If you delete the EndpointConfig of an endpoint that is active or being created or updated you may lose visibility into the instance type the endpoint is using. The endpoint must be deleted in order to stop incurring charges.

``` swift
public func updateEndpoint(input: UpdateEndpointInput, completion: @escaping (ClientRuntime.SdkResult<UpdateEndpointOutputResponse, UpdateEndpointOutputError>) -> Void)
```

### `updateEndpointWeightsAndCapacities(input:completion:)`

Updates variant weight of one or more variants associated with an existing endpoint, or capacity of one variant associated with an existing endpoint. When it receives the request, Amazon SageMaker sets the endpoint status to Updating. After updating the endpoint, it sets the status to InService. To check the status of an endpoint, use the \[DescribeEndpoint\] API.

``` swift
public func updateEndpointWeightsAndCapacities(input: UpdateEndpointWeightsAndCapacitiesInput, completion: @escaping (ClientRuntime.SdkResult<UpdateEndpointWeightsAndCapacitiesOutputResponse, UpdateEndpointWeightsAndCapacitiesOutputError>) -> Void)
```

### `updateExperiment(input:completion:)`

Adds, updates, or removes the description of an experiment. Updates the display name of an experiment.

``` swift
public func updateExperiment(input: UpdateExperimentInput, completion: @escaping (ClientRuntime.SdkResult<UpdateExperimentOutputResponse, UpdateExperimentOutputError>) -> Void)
```

### `updateImage(input:completion:)`

Updates the properties of a SageMaker image. To change the image's tags, use the \[AddTags\] and \[DeleteTags\] APIs.

``` swift
public func updateImage(input: UpdateImageInput, completion: @escaping (ClientRuntime.SdkResult<UpdateImageOutputResponse, UpdateImageOutputError>) -> Void)
```

### `updateModelPackage(input:completion:)`

Updates a versioned model.

``` swift
public func updateModelPackage(input: UpdateModelPackageInput, completion: @escaping (ClientRuntime.SdkResult<UpdateModelPackageOutputResponse, UpdateModelPackageOutputError>) -> Void)
```

### `updateMonitoringSchedule(input:completion:)`

Updates a previously created schedule.

``` swift
public func updateMonitoringSchedule(input: UpdateMonitoringScheduleInput, completion: @escaping (ClientRuntime.SdkResult<UpdateMonitoringScheduleOutputResponse, UpdateMonitoringScheduleOutputError>) -> Void)
```

### `updateNotebookInstance(input:completion:)`

Updates a notebook instance. NotebookInstance updates include upgrading or downgrading the ML compute instance used for your notebook instance to accommodate changes in your workload requirements.

``` swift
public func updateNotebookInstance(input: UpdateNotebookInstanceInput, completion: @escaping (ClientRuntime.SdkResult<UpdateNotebookInstanceOutputResponse, UpdateNotebookInstanceOutputError>) -> Void)
```

### `updateNotebookInstanceLifecycleConfig(input:completion:)`

Updates a notebook instance lifecycle configuration created with the \[CreateNotebookInstanceLifecycleConfig\] API.

``` swift
public func updateNotebookInstanceLifecycleConfig(input: UpdateNotebookInstanceLifecycleConfigInput, completion: @escaping (ClientRuntime.SdkResult<UpdateNotebookInstanceLifecycleConfigOutputResponse, UpdateNotebookInstanceLifecycleConfigOutputError>) -> Void)
```

### `updatePipeline(input:completion:)`

Updates a pipeline.

``` swift
public func updatePipeline(input: UpdatePipelineInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePipelineOutputResponse, UpdatePipelineOutputError>) -> Void)
```

### `updatePipelineExecution(input:completion:)`

Updates a pipeline execution.

``` swift
public func updatePipelineExecution(input: UpdatePipelineExecutionInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePipelineExecutionOutputResponse, UpdatePipelineExecutionOutputError>) -> Void)
```

### `updateTrainingJob(input:completion:)`

Update a model training job to request a new Debugger profiling configuration.

``` swift
public func updateTrainingJob(input: UpdateTrainingJobInput, completion: @escaping (ClientRuntime.SdkResult<UpdateTrainingJobOutputResponse, UpdateTrainingJobOutputError>) -> Void)
```

### `updateTrial(input:completion:)`

Updates the display name of a trial.

``` swift
public func updateTrial(input: UpdateTrialInput, completion: @escaping (ClientRuntime.SdkResult<UpdateTrialOutputResponse, UpdateTrialOutputError>) -> Void)
```

### `updateTrialComponent(input:completion:)`

Updates one or more properties of a trial component.

``` swift
public func updateTrialComponent(input: UpdateTrialComponentInput, completion: @escaping (ClientRuntime.SdkResult<UpdateTrialComponentOutputResponse, UpdateTrialComponentOutputError>) -> Void)
```

### `updateUserProfile(input:completion:)`

Updates a user profile.

``` swift
public func updateUserProfile(input: UpdateUserProfileInput, completion: @escaping (ClientRuntime.SdkResult<UpdateUserProfileOutputResponse, UpdateUserProfileOutputError>) -> Void)
```

### `updateWorkforce(input:completion:)`

Use this operation to update your workforce. You can use this operation to require that workers use specific IP addresses to work on tasks and to update your OpenID Connect (OIDC) Identity Provider (IdP) workforce configuration. Use SourceIpConfig to restrict worker access to tasks to a specific range of IP addresses. You specify allowed IP addresses by creating a list of up to ten [CIDRs](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html). By default, a workforce isn't restricted to specific IP addresses. If you specify a range of IP addresses, workers who attempt to access tasks using any IP address outside the specified range are denied and get a Not Found error message on the worker portal. Use OidcConfig to update the configuration of a workforce created using your own OIDC IdP. You can only update your OIDC IdP configuration when there are no work teams associated with your workforce. You can delete work teams using the operation. After restricting access to a range of IP addresses or updating your OIDC IdP configuration with this operation, you can view details about your update workforce using the operation. This operation only applies to private workforces.

``` swift
public func updateWorkforce(input: UpdateWorkforceInput, completion: @escaping (ClientRuntime.SdkResult<UpdateWorkforceOutputResponse, UpdateWorkforceOutputError>) -> Void)
```

### `updateWorkteam(input:completion:)`

Updates an existing work team with new member definitions or description.

``` swift
public func updateWorkteam(input: UpdateWorkteamInput, completion: @escaping (ClientRuntime.SdkResult<UpdateWorkteamOutputResponse, UpdateWorkteamOutputError>) -> Void)
```
