# LightsailClientProtocol

Amazon Lightsail is the easiest way to get started with Amazon Web Services (AWS) for developers who need to build websites or web applications. It includes everything you need to launch your project quickly - instances (virtual private servers), container services, storage buckets, managed databases, SSD-based block storage, static IP addresses, load balancers, content delivery network (CDN) distributions, DNS management of registered domains, and resource snapshots (backups) - for a low, predictable monthly price. You can manage your Lightsail resources using the Lightsail console, Lightsail API, AWS Command Line Interface (AWS CLI), or SDKs. For more information about Lightsail concepts and tasks, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/lightsail-how-to-set-up-access-keys-to-use-sdk-api-cli). This API Reference provides detailed information about the actions, data types, parameters, and errors of the Lightsail service. For more information about the supported AWS Regions, endpoints, and service quotas of the Lightsail service, see [Amazon Lightsail Endpoints and Quotas](https://docs.aws.amazon.com/general/latest/gr/lightsail.html) in the AWS General Reference.

``` swift
public protocol LightsailClientProtocol 
```

## Requirements

### allocateStaticIp(input:completion:)

Allocates a static IP address.

``` swift
func allocateStaticIp(input: AllocateStaticIpInput, completion: @escaping (ClientRuntime.SdkResult<AllocateStaticIpOutputResponse, AllocateStaticIpOutputError>) -> Void)
```

### attachCertificateToDistribution(input:completion:)

Attaches an SSL/TLS certificate to your Amazon Lightsail content delivery network (CDN) distribution. After the certificate is attached, your distribution accepts HTTPS traffic for all of the domains that are associated with the certificate. Use the CreateCertificate action to create a certificate that you can attach to your distribution. Only certificates created in the us-east-1 AWS Region can be attached to Lightsail distributions. Lightsail distributions are global resources that can reference an origin in any AWS Region, and distribute its content globally. However, all distributions are located in the us-east-1 Region.

``` swift
func attachCertificateToDistribution(input: AttachCertificateToDistributionInput, completion: @escaping (ClientRuntime.SdkResult<AttachCertificateToDistributionOutputResponse, AttachCertificateToDistributionOutputError>) -> Void)
```

### attachDisk(input:completion:)

Attaches a block storage disk to a running or stopped Lightsail instance and exposes it to the instance with the specified disk name. The attach disk operation supports tag-based access control via resource tags applied to the resource identified by disk name. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func attachDisk(input: AttachDiskInput, completion: @escaping (ClientRuntime.SdkResult<AttachDiskOutputResponse, AttachDiskOutputError>) -> Void)
```

### attachInstancesToLoadBalancer(input:completion:)

Attaches one or more Lightsail instances to a load balancer. After some time, the instances are attached to the load balancer and the health check status is available. The attach instances to load balancer operation supports tag-based access control via resource tags applied to the resource identified by load balancer name. For more information, see the [Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func attachInstancesToLoadBalancer(input: AttachInstancesToLoadBalancerInput, completion: @escaping (ClientRuntime.SdkResult<AttachInstancesToLoadBalancerOutputResponse, AttachInstancesToLoadBalancerOutputError>) -> Void)
```

### attachLoadBalancerTlsCertificate(input:completion:)

Attaches a Transport Layer Security (TLS) certificate to your load balancer. TLS is just an updated, more secure version of Secure Socket Layer (SSL). Once you create and validate your certificate, you can attach it to your load balancer. You can also use this API to rotate the certificates on your account. Use the AttachLoadBalancerTlsCertificate action with the non-attached certificate, and it will replace the existing one and become the attached certificate. The AttachLoadBalancerTlsCertificate operation supports tag-based access control via resource tags applied to the resource identified by load balancer name. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func attachLoadBalancerTlsCertificate(input: AttachLoadBalancerTlsCertificateInput, completion: @escaping (ClientRuntime.SdkResult<AttachLoadBalancerTlsCertificateOutputResponse, AttachLoadBalancerTlsCertificateOutputError>) -> Void)
```

### attachStaticIp(input:completion:)

Attaches a static IP address to a specific Amazon Lightsail instance.

``` swift
func attachStaticIp(input: AttachStaticIpInput, completion: @escaping (ClientRuntime.SdkResult<AttachStaticIpOutputResponse, AttachStaticIpOutputError>) -> Void)
```

### closeInstancePublicPorts(input:completion:)

Closes ports for a specific Amazon Lightsail instance. The CloseInstancePublicPorts action supports tag-based access control via resource tags applied to the resource identified by instanceName. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func closeInstancePublicPorts(input: CloseInstancePublicPortsInput, completion: @escaping (ClientRuntime.SdkResult<CloseInstancePublicPortsOutputResponse, CloseInstancePublicPortsOutputError>) -> Void)
```

### copySnapshot(input:completion:)

Copies a manual snapshot of an instance or disk as another manual snapshot, or copies an automatic snapshot of an instance or disk as a manual snapshot. This operation can also be used to copy a manual or automatic snapshot of an instance or a disk from one AWS Region to another in Amazon Lightsail. When copying a manual snapshot, be sure to define the source region, source snapshot name, and target snapshot name parameters. When copying an automatic snapshot, be sure to define the source region, source resource name, target snapshot name, and either the restore date or the use latest restorable auto snapshot parameters.

``` swift
func copySnapshot(input: CopySnapshotInput, completion: @escaping (ClientRuntime.SdkResult<CopySnapshotOutputResponse, CopySnapshotOutputError>) -> Void)
```

### createBucket(input:completion:)

Creates an Amazon Lightsail bucket. A bucket is a cloud storage resource available in the Lightsail object storage service. Use buckets to store objects such as data and its descriptive metadata. For more information about buckets, see [Buckets in Amazon Lightsail](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/buckets-in-amazon-lightsail) in the Amazon Lightsail Developer Guide.

``` swift
func createBucket(input: CreateBucketInput, completion: @escaping (ClientRuntime.SdkResult<CreateBucketOutputResponse, CreateBucketOutputError>) -> Void)
```

### createBucketAccessKey(input:completion:)

Creates a new access key for the specified Amazon Lightsail bucket. Access keys consist of an access key ID and corresponding secret access key. Access keys grant full programmatic access to the specified bucket and its objects. You can have a maximum of two access keys per bucket. Use the \[GetBucketAccessKeys\] action to get a list of current access keys for a specific bucket. For more information about access keys, see [Creating access keys for a bucket in Amazon Lightsail](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-creating-bucket-access-keys) in the Amazon Lightsail Developer Guide. The secretAccessKey value is returned only in response to the CreateBucketAccessKey action. You can get a secret access key only when you first create an access key; you cannot get the secret access key later. If you lose the secret access key, you must create a new access key.

``` swift
func createBucketAccessKey(input: CreateBucketAccessKeyInput, completion: @escaping (ClientRuntime.SdkResult<CreateBucketAccessKeyOutputResponse, CreateBucketAccessKeyOutputError>) -> Void)
```

### createCertificate(input:completion:)

Creates an SSL/TLS certificate for an Amazon Lightsail content delivery network (CDN) distribution and a container service. After the certificate is valid, use the AttachCertificateToDistribution action to use the certificate and its domains with your distribution. Or use the UpdateContainerService action to use the certificate and its domains with your container service. Only certificates created in the us-east-1 AWS Region can be attached to Lightsail distributions. Lightsail distributions are global resources that can reference an origin in any AWS Region, and distribute its content globally. However, all distributions are located in the us-east-1 Region.

``` swift
func createCertificate(input: CreateCertificateInput, completion: @escaping (ClientRuntime.SdkResult<CreateCertificateOutputResponse, CreateCertificateOutputError>) -> Void)
```

### createCloudFormationStack(input:completion:)

Creates an AWS CloudFormation stack, which creates a new Amazon EC2 instance from an exported Amazon Lightsail snapshot. This operation results in a CloudFormation stack record that can be used to track the AWS CloudFormation stack created. Use the get cloud formation stack records operation to get a list of the CloudFormation stacks created. Wait until after your new Amazon EC2 instance is created before running the create cloud formation stack operation again with the same export snapshot record.

``` swift
func createCloudFormationStack(input: CreateCloudFormationStackInput, completion: @escaping (ClientRuntime.SdkResult<CreateCloudFormationStackOutputResponse, CreateCloudFormationStackOutputError>) -> Void)
```

### createContactMethod(input:completion:)

Creates an email or SMS text message contact method. A contact method is used to send you notifications about your Amazon Lightsail resources. You can add one email address and one mobile phone number contact method in each AWS Region. However, SMS text messaging is not supported in some AWS Regions, and SMS text messages cannot be sent to some countries/regions. For more information, see [Notifications in Amazon Lightsail](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications).

``` swift
func createContactMethod(input: CreateContactMethodInput, completion: @escaping (ClientRuntime.SdkResult<CreateContactMethodOutputResponse, CreateContactMethodOutputError>) -> Void)
```

### createContainerService(input:completion:)

Creates an Amazon Lightsail container service. A Lightsail container service is a compute resource to which you can deploy containers. For more information, see [Container services in Amazon Lightsail](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-container-services) in the Lightsail Dev Guide.

``` swift
func createContainerService(input: CreateContainerServiceInput, completion: @escaping (ClientRuntime.SdkResult<CreateContainerServiceOutputResponse, CreateContainerServiceOutputError>) -> Void)
```

### createContainerServiceDeployment(input:completion:)

Creates a deployment for your Amazon Lightsail container service. A deployment specifies the containers that will be launched on the container service and their settings, such as the ports to open, the environment variables to apply, and the launch command to run. It also specifies the container that will serve as the public endpoint of the deployment and its settings, such as the HTTP or HTTPS port to use, and the health check configuration. You can deploy containers to your container service using container images from a public registry like Docker Hub, or from your local machine. For more information, see [Creating container images for your Amazon Lightsail container services](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-creating-container-images) in the Amazon Lightsail Developer Guide.

``` swift
func createContainerServiceDeployment(input: CreateContainerServiceDeploymentInput, completion: @escaping (ClientRuntime.SdkResult<CreateContainerServiceDeploymentOutputResponse, CreateContainerServiceDeploymentOutputError>) -> Void)
```

### createContainerServiceRegistryLogin(input:completion:)

Creates a temporary set of log in credentials that you can use to log in to the Docker process on your local machine. After you're logged in, you can use the native Docker commands to push your local container images to the container image registry of your Amazon Lightsail account so that you can use them with your Lightsail container service. The log in credentials expire 12 hours after they are created, at which point you will need to create a new set of log in credentials. You can only push container images to the container service registry of your Lightsail account. You cannot pull container images or perform any other container image management actions on the container service registry. After you push your container images to the container image registry of your Lightsail account, use the RegisterContainerImage action to register the pushed images to a specific Lightsail container service. This action is not required if you install and use the Lightsail Control (lightsailctl) plugin to push container images to your Lightsail container service. For more information, see [Pushing and managing container images on your Amazon Lightsail container services](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-pushing-container-images) in the Amazon Lightsail Developer Guide.

``` swift
func createContainerServiceRegistryLogin(input: CreateContainerServiceRegistryLoginInput, completion: @escaping (ClientRuntime.SdkResult<CreateContainerServiceRegistryLoginOutputResponse, CreateContainerServiceRegistryLoginOutputError>) -> Void)
```

### createDisk(input:completion:)

Creates a block storage disk that can be attached to an Amazon Lightsail instance in the same Availability Zone (e.g., us-east-2a). The create disk operation supports tag-based access control via request tags. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func createDisk(input: CreateDiskInput, completion: @escaping (ClientRuntime.SdkResult<CreateDiskOutputResponse, CreateDiskOutputError>) -> Void)
```

### createDiskFromSnapshot(input:completion:)

Creates a block storage disk from a manual or automatic snapshot of a disk. The resulting disk can be attached to an Amazon Lightsail instance in the same Availability Zone (e.g., us-east-2a). The create disk from snapshot operation supports tag-based access control via request tags and resource tags applied to the resource identified by disk snapshot name. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func createDiskFromSnapshot(input: CreateDiskFromSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<CreateDiskFromSnapshotOutputResponse, CreateDiskFromSnapshotOutputError>) -> Void)
```

### createDiskSnapshot(input:completion:)

Creates a snapshot of a block storage disk. You can use snapshots for backups, to make copies of disks, and to save data before shutting down a Lightsail instance. You can take a snapshot of an attached disk that is in use; however, snapshots only capture data that has been written to your disk at the time the snapshot command is issued. This may exclude any data that has been cached by any applications or the operating system. If you can pause any file systems on the disk long enough to take a snapshot, your snapshot should be complete. Nevertheless, if you cannot pause all file writes to the disk, you should unmount the disk from within the Lightsail instance, issue the create disk snapshot command, and then remount the disk to ensure a consistent and complete snapshot. You may remount and use your disk while the snapshot status is pending. You can also use this operation to create a snapshot of an instance's system volume. You might want to do this, for example, to recover data from the system volume of a botched instance or to create a backup of the system volume like you would for a block storage disk. To create a snapshot of a system volume, just define the instance name parameter when issuing the snapshot command, and a snapshot of the defined instance's system volume will be created. After the snapshot is available, you can create a block storage disk from the snapshot and attach it to a running instance to access the data on the disk. The create disk snapshot operation supports tag-based access control via request tags. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func createDiskSnapshot(input: CreateDiskSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<CreateDiskSnapshotOutputResponse, CreateDiskSnapshotOutputError>) -> Void)
```

### createDistribution(input:completion:)

Creates an Amazon Lightsail content delivery network (CDN) distribution. A distribution is a globally distributed network of caching servers that improve the performance of your website or web application hosted on a Lightsail instance. For more information, see [Content delivery networks in Amazon Lightsail](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-content-delivery-network-distributions).

``` swift
func createDistribution(input: CreateDistributionInput, completion: @escaping (ClientRuntime.SdkResult<CreateDistributionOutputResponse, CreateDistributionOutputError>) -> Void)
```

### createDomain(input:completion:)

Creates a domain resource for the specified domain (e.g., example.com). The create domain operation supports tag-based access control via request tags. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func createDomain(input: CreateDomainInput, completion: @escaping (ClientRuntime.SdkResult<CreateDomainOutputResponse, CreateDomainOutputError>) -> Void)
```

### createDomainEntry(input:completion:)

Creates one of the following domain name system (DNS) records in a domain DNS zone: Address (A), canonical name (CNAME), mail exchanger (MX), name server (NS), start of authority (SOA), service locator (SRV), or text (TXT). The create domain entry operation supports tag-based access control via resource tags applied to the resource identified by domain name. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func createDomainEntry(input: CreateDomainEntryInput, completion: @escaping (ClientRuntime.SdkResult<CreateDomainEntryOutputResponse, CreateDomainEntryOutputError>) -> Void)
```

### createInstances(input:completion:)

Creates one or more Amazon Lightsail instances. The create instances operation supports tag-based access control via request tags. For more information, see the [Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func createInstances(input: CreateInstancesInput, completion: @escaping (ClientRuntime.SdkResult<CreateInstancesOutputResponse, CreateInstancesOutputError>) -> Void)
```

### createInstancesFromSnapshot(input:completion:)

Creates one or more new instances from a manual or automatic snapshot of an instance. The create instances from snapshot operation supports tag-based access control via request tags and resource tags applied to the resource identified by instance snapshot name. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func createInstancesFromSnapshot(input: CreateInstancesFromSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<CreateInstancesFromSnapshotOutputResponse, CreateInstancesFromSnapshotOutputError>) -> Void)
```

### createInstanceSnapshot(input:completion:)

Creates a snapshot of a specific virtual private server, or instance. You can use a snapshot to create a new instance that is based on that snapshot. The create instance snapshot operation supports tag-based access control via request tags. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func createInstanceSnapshot(input: CreateInstanceSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<CreateInstanceSnapshotOutputResponse, CreateInstanceSnapshotOutputError>) -> Void)
```

### createKeyPair(input:completion:)

Creates an SSH key pair. The create key pair operation supports tag-based access control via request tags. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func createKeyPair(input: CreateKeyPairInput, completion: @escaping (ClientRuntime.SdkResult<CreateKeyPairOutputResponse, CreateKeyPairOutputError>) -> Void)
```

### createLoadBalancer(input:completion:)

Creates a Lightsail load balancer. To learn more about deciding whether to load balance your application, see [Configure your Lightsail instances for load balancing](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/configure-lightsail-instances-for-load-balancing). You can create up to 5 load balancers per AWS Region in your account. When you create a load balancer, you can specify a unique name and port settings. To change additional load balancer settings, use the UpdateLoadBalancerAttribute operation. The create load balancer operation supports tag-based access control via request tags. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func createLoadBalancer(input: CreateLoadBalancerInput, completion: @escaping (ClientRuntime.SdkResult<CreateLoadBalancerOutputResponse, CreateLoadBalancerOutputError>) -> Void)
```

### createLoadBalancerTlsCertificate(input:completion:)

Creates an SSL/TLS certificate for an Amazon Lightsail load balancer. TLS is just an updated, more secure version of Secure Socket Layer (SSL). The CreateLoadBalancerTlsCertificate operation supports tag-based access control via resource tags applied to the resource identified by load balancer name. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func createLoadBalancerTlsCertificate(input: CreateLoadBalancerTlsCertificateInput, completion: @escaping (ClientRuntime.SdkResult<CreateLoadBalancerTlsCertificateOutputResponse, CreateLoadBalancerTlsCertificateOutputError>) -> Void)
```

### createRelationalDatabase(input:completion:)

Creates a new database in Amazon Lightsail. The create relational database operation supports tag-based access control via request tags. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func createRelationalDatabase(input: CreateRelationalDatabaseInput, completion: @escaping (ClientRuntime.SdkResult<CreateRelationalDatabaseOutputResponse, CreateRelationalDatabaseOutputError>) -> Void)
```

### createRelationalDatabaseFromSnapshot(input:completion:)

Creates a new database from an existing database snapshot in Amazon Lightsail. You can create a new database from a snapshot in if something goes wrong with your original database, or to change it to a different plan, such as a high availability or standard plan. The create relational database from snapshot operation supports tag-based access control via request tags and resource tags applied to the resource identified by relationalDatabaseSnapshotName. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func createRelationalDatabaseFromSnapshot(input: CreateRelationalDatabaseFromSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<CreateRelationalDatabaseFromSnapshotOutputResponse, CreateRelationalDatabaseFromSnapshotOutputError>) -> Void)
```

### createRelationalDatabaseSnapshot(input:completion:)

Creates a snapshot of your database in Amazon Lightsail. You can use snapshots for backups, to make copies of a database, and to save data before deleting a database. The create relational database snapshot operation supports tag-based access control via request tags. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func createRelationalDatabaseSnapshot(input: CreateRelationalDatabaseSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<CreateRelationalDatabaseSnapshotOutputResponse, CreateRelationalDatabaseSnapshotOutputError>) -> Void)
```

### deleteAlarm(input:completion:)

Deletes an alarm. An alarm is used to monitor a single metric for one of your resources. When a metric condition is met, the alarm can notify you by email, SMS text message, and a banner displayed on the Amazon Lightsail console. For more information, see [Alarms in Amazon Lightsail](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms).

``` swift
func deleteAlarm(input: DeleteAlarmInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAlarmOutputResponse, DeleteAlarmOutputError>) -> Void)
```

### deleteAutoSnapshot(input:completion:)

Deletes an automatic snapshot of an instance or disk. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots).

``` swift
func deleteAutoSnapshot(input: DeleteAutoSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAutoSnapshotOutputResponse, DeleteAutoSnapshotOutputError>) -> Void)
```

### deleteBucket(input:completion:)

Deletes a Amazon Lightsail bucket. When you delete your bucket, the bucket name is released and can be reused for a new bucket in your account or another AWS account.

``` swift
func deleteBucket(input: DeleteBucketInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBucketOutputResponse, DeleteBucketOutputError>) -> Void)
```

### deleteBucketAccessKey(input:completion:)

Deletes an access key for the specified Amazon Lightsail bucket. We recommend that you delete an access key if the secret access key is compromised. For more information about access keys, see [Creating access keys for a bucket in Amazon Lightsail](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-creating-bucket-access-keys) in the Amazon Lightsail Developer Guide.

``` swift
func deleteBucketAccessKey(input: DeleteBucketAccessKeyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBucketAccessKeyOutputResponse, DeleteBucketAccessKeyOutputError>) -> Void)
```

### deleteCertificate(input:completion:)

Deletes an SSL/TLS certificate for your Amazon Lightsail content delivery network (CDN) distribution. Certificates that are currently attached to a distribution cannot be deleted. Use the DetachCertificateFromDistribution action to detach a certificate from a distribution.

``` swift
func deleteCertificate(input: DeleteCertificateInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCertificateOutputResponse, DeleteCertificateOutputError>) -> Void)
```

### deleteContactMethod(input:completion:)

Deletes a contact method. A contact method is used to send you notifications about your Amazon Lightsail resources. You can add one email address and one mobile phone number contact method in each AWS Region. However, SMS text messaging is not supported in some AWS Regions, and SMS text messages cannot be sent to some countries/regions. For more information, see [Notifications in Amazon Lightsail](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications).

``` swift
func deleteContactMethod(input: DeleteContactMethodInput, completion: @escaping (ClientRuntime.SdkResult<DeleteContactMethodOutputResponse, DeleteContactMethodOutputError>) -> Void)
```

### deleteContainerImage(input:completion:)

Deletes a container image that is registered to your Amazon Lightsail container service.

``` swift
func deleteContainerImage(input: DeleteContainerImageInput, completion: @escaping (ClientRuntime.SdkResult<DeleteContainerImageOutputResponse, DeleteContainerImageOutputError>) -> Void)
```

### deleteContainerService(input:completion:)

Deletes your Amazon Lightsail container service.

``` swift
func deleteContainerService(input: DeleteContainerServiceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteContainerServiceOutputResponse, DeleteContainerServiceOutputError>) -> Void)
```

### deleteDisk(input:completion:)

Deletes the specified block storage disk. The disk must be in the available state (not attached to a Lightsail instance). The disk may remain in the deleting state for several minutes. The delete disk operation supports tag-based access control via resource tags applied to the resource identified by disk name. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func deleteDisk(input: DeleteDiskInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDiskOutputResponse, DeleteDiskOutputError>) -> Void)
```

### deleteDiskSnapshot(input:completion:)

Deletes the specified disk snapshot. When you make periodic snapshots of a disk, the snapshots are incremental, and only the blocks on the device that have changed since your last snapshot are saved in the new snapshot. When you delete a snapshot, only the data not needed for any other snapshot is removed. So regardless of which prior snapshots have been deleted, all active snapshots will have access to all the information needed to restore the disk. The delete disk snapshot operation supports tag-based access control via resource tags applied to the resource identified by disk snapshot name. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func deleteDiskSnapshot(input: DeleteDiskSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDiskSnapshotOutputResponse, DeleteDiskSnapshotOutputError>) -> Void)
```

### deleteDistribution(input:completion:)

Deletes your Amazon Lightsail content delivery network (CDN) distribution.

``` swift
func deleteDistribution(input: DeleteDistributionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDistributionOutputResponse, DeleteDistributionOutputError>) -> Void)
```

### deleteDomain(input:completion:)

Deletes the specified domain recordset and all of its domain records. The delete domain operation supports tag-based access control via resource tags applied to the resource identified by domain name. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func deleteDomain(input: DeleteDomainInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDomainOutputResponse, DeleteDomainOutputError>) -> Void)
```

### deleteDomainEntry(input:completion:)

Deletes a specific domain entry. The delete domain entry operation supports tag-based access control via resource tags applied to the resource identified by domain name. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func deleteDomainEntry(input: DeleteDomainEntryInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDomainEntryOutputResponse, DeleteDomainEntryOutputError>) -> Void)
```

### deleteInstance(input:completion:)

Deletes an Amazon Lightsail instance. The delete instance operation supports tag-based access control via resource tags applied to the resource identified by instance name. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func deleteInstance(input: DeleteInstanceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteInstanceOutputResponse, DeleteInstanceOutputError>) -> Void)
```

### deleteInstanceSnapshot(input:completion:)

Deletes a specific snapshot of a virtual private server (or instance). The delete instance snapshot operation supports tag-based access control via resource tags applied to the resource identified by instance snapshot name. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func deleteInstanceSnapshot(input: DeleteInstanceSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<DeleteInstanceSnapshotOutputResponse, DeleteInstanceSnapshotOutputError>) -> Void)
```

### deleteKeyPair(input:completion:)

Deletes a specific SSH key pair. The delete key pair operation supports tag-based access control via resource tags applied to the resource identified by key pair name. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func deleteKeyPair(input: DeleteKeyPairInput, completion: @escaping (ClientRuntime.SdkResult<DeleteKeyPairOutputResponse, DeleteKeyPairOutputError>) -> Void)
```

### deleteKnownHostKeys(input:completion:)

Deletes the known host key or certificate used by the Amazon Lightsail browser-based SSH or RDP clients to authenticate an instance. This operation enables the Lightsail browser-based SSH or RDP clients to connect to the instance after a host key mismatch. Perform this operation only if you were expecting the host key or certificate mismatch or if you are familiar with the new host key or certificate on the instance. For more information, see [Troubleshooting connection issues when using the Amazon Lightsail browser-based SSH or RDP client](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-troubleshooting-browser-based-ssh-rdp-client-connection).

``` swift
func deleteKnownHostKeys(input: DeleteKnownHostKeysInput, completion: @escaping (ClientRuntime.SdkResult<DeleteKnownHostKeysOutputResponse, DeleteKnownHostKeysOutputError>) -> Void)
```

### deleteLoadBalancer(input:completion:)

Deletes a Lightsail load balancer and all its associated SSL/TLS certificates. Once the load balancer is deleted, you will need to create a new load balancer, create a new certificate, and verify domain ownership again. The delete load balancer operation supports tag-based access control via resource tags applied to the resource identified by load balancer name. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func deleteLoadBalancer(input: DeleteLoadBalancerInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLoadBalancerOutputResponse, DeleteLoadBalancerOutputError>) -> Void)
```

### deleteLoadBalancerTlsCertificate(input:completion:)

Deletes an SSL/TLS certificate associated with a Lightsail load balancer. The DeleteLoadBalancerTlsCertificate operation supports tag-based access control via resource tags applied to the resource identified by load balancer name. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func deleteLoadBalancerTlsCertificate(input: DeleteLoadBalancerTlsCertificateInput, completion: @escaping (ClientRuntime.SdkResult<DeleteLoadBalancerTlsCertificateOutputResponse, DeleteLoadBalancerTlsCertificateOutputError>) -> Void)
```

### deleteRelationalDatabase(input:completion:)

Deletes a database in Amazon Lightsail. The delete relational database operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func deleteRelationalDatabase(input: DeleteRelationalDatabaseInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRelationalDatabaseOutputResponse, DeleteRelationalDatabaseOutputError>) -> Void)
```

### deleteRelationalDatabaseSnapshot(input:completion:)

Deletes a database snapshot in Amazon Lightsail. The delete relational database snapshot operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func deleteRelationalDatabaseSnapshot(input: DeleteRelationalDatabaseSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRelationalDatabaseSnapshotOutputResponse, DeleteRelationalDatabaseSnapshotOutputError>) -> Void)
```

### detachCertificateFromDistribution(input:completion:)

Detaches an SSL/TLS certificate from your Amazon Lightsail content delivery network (CDN) distribution. After the certificate is detached, your distribution stops accepting traffic for all of the domains that are associated with the certificate.

``` swift
func detachCertificateFromDistribution(input: DetachCertificateFromDistributionInput, completion: @escaping (ClientRuntime.SdkResult<DetachCertificateFromDistributionOutputResponse, DetachCertificateFromDistributionOutputError>) -> Void)
```

### detachDisk(input:completion:)

Detaches a stopped block storage disk from a Lightsail instance. Make sure to unmount any file systems on the device within your operating system before stopping the instance and detaching the disk. The detach disk operation supports tag-based access control via resource tags applied to the resource identified by disk name. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func detachDisk(input: DetachDiskInput, completion: @escaping (ClientRuntime.SdkResult<DetachDiskOutputResponse, DetachDiskOutputError>) -> Void)
```

### detachInstancesFromLoadBalancer(input:completion:)

Detaches the specified instances from a Lightsail load balancer. This operation waits until the instances are no longer needed before they are detached from the load balancer. The detach instances from load balancer operation supports tag-based access control via resource tags applied to the resource identified by load balancer name. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func detachInstancesFromLoadBalancer(input: DetachInstancesFromLoadBalancerInput, completion: @escaping (ClientRuntime.SdkResult<DetachInstancesFromLoadBalancerOutputResponse, DetachInstancesFromLoadBalancerOutputError>) -> Void)
```

### detachStaticIp(input:completion:)

Detaches a static IP from the Amazon Lightsail instance to which it is attached.

``` swift
func detachStaticIp(input: DetachStaticIpInput, completion: @escaping (ClientRuntime.SdkResult<DetachStaticIpOutputResponse, DetachStaticIpOutputError>) -> Void)
```

### disableAddOn(input:completion:)

Disables an add-on for an Amazon Lightsail resource. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots).

``` swift
func disableAddOn(input: DisableAddOnInput, completion: @escaping (ClientRuntime.SdkResult<DisableAddOnOutputResponse, DisableAddOnOutputError>) -> Void)
```

### downloadDefaultKeyPair(input:completion:)

Downloads the default SSH key pair from the user's account.

``` swift
func downloadDefaultKeyPair(input: DownloadDefaultKeyPairInput, completion: @escaping (ClientRuntime.SdkResult<DownloadDefaultKeyPairOutputResponse, DownloadDefaultKeyPairOutputError>) -> Void)
```

### enableAddOn(input:completion:)

Enables or modifies an add-on for an Amazon Lightsail resource. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots).

``` swift
func enableAddOn(input: EnableAddOnInput, completion: @escaping (ClientRuntime.SdkResult<EnableAddOnOutputResponse, EnableAddOnOutputError>) -> Void)
```

### exportSnapshot(input:completion:)

Exports an Amazon Lightsail instance or block storage disk snapshot to Amazon Elastic Compute Cloud (Amazon EC2). This operation results in an export snapshot record that can be used with the create cloud formation stack operation to create new Amazon EC2 instances. Exported instance snapshots appear in Amazon EC2 as Amazon Machine Images (AMIs), and the instance system disk appears as an Amazon Elastic Block Store (Amazon EBS) volume. Exported disk snapshots appear in Amazon EC2 as Amazon EBS volumes. Snapshots are exported to the same Amazon Web Services Region in Amazon EC2 as the source Lightsail snapshot. The export snapshot operation supports tag-based access control via resource tags applied to the resource identified by source snapshot name. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags). Use the get instance snapshots or get disk snapshots operations to get a list of snapshots that you can export to Amazon EC2.

``` swift
func exportSnapshot(input: ExportSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<ExportSnapshotOutputResponse, ExportSnapshotOutputError>) -> Void)
```

### getActiveNames(input:completion:)

Returns the names of all active (not deleted) resources.

``` swift
func getActiveNames(input: GetActiveNamesInput, completion: @escaping (ClientRuntime.SdkResult<GetActiveNamesOutputResponse, GetActiveNamesOutputError>) -> Void)
```

### getAlarms(input:completion:)

Returns information about the configured alarms. Specify an alarm name in your request to return information about a specific alarm, or specify a monitored resource name to return information about all alarms for a specific resource. An alarm is used to monitor a single metric for one of your resources. When a metric condition is met, the alarm can notify you by email, SMS text message, and a banner displayed on the Amazon Lightsail console. For more information, see [Alarms in Amazon Lightsail](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms).

``` swift
func getAlarms(input: GetAlarmsInput, completion: @escaping (ClientRuntime.SdkResult<GetAlarmsOutputResponse, GetAlarmsOutputError>) -> Void)
```

### getAutoSnapshots(input:completion:)

Returns the available automatic snapshots for an instance or disk. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots).

``` swift
func getAutoSnapshots(input: GetAutoSnapshotsInput, completion: @escaping (ClientRuntime.SdkResult<GetAutoSnapshotsOutputResponse, GetAutoSnapshotsOutputError>) -> Void)
```

### getBlueprints(input:completion:)

Returns the list of available instance images, or blueprints. You can use a blueprint to create a new instance already running a specific operating system, as well as a preinstalled app or development stack. The software each instance is running depends on the blueprint image you choose. Use active blueprints when creating new instances. Inactive blueprints are listed to support customers with existing instances and are not necessarily available to create new instances. Blueprints are marked inactive when they become outdated due to operating system updates or new application releases.

``` swift
func getBlueprints(input: GetBlueprintsInput, completion: @escaping (ClientRuntime.SdkResult<GetBlueprintsOutputResponse, GetBlueprintsOutputError>) -> Void)
```

### getBucketAccessKeys(input:completion:)

Returns the existing access key IDs for the specified Amazon Lightsail bucket. This action does not return the secret access key value of an access key. You can get a secret access key only when you create it from the response of the \[CreateBucketAccessKey\] action. If you lose the secret access key, you must create a new access key.

``` swift
func getBucketAccessKeys(input: GetBucketAccessKeysInput, completion: @escaping (ClientRuntime.SdkResult<GetBucketAccessKeysOutputResponse, GetBucketAccessKeysOutputError>) -> Void)
```

### getBucketBundles(input:completion:)

Returns the bundles that you can apply to a Amazon Lightsail bucket. The bucket bundle specifies the monthly cost, storage quota, and data transfer quota for a bucket. Use the \[UpdateBucketBundle\] action to update the bundle for a bucket.

``` swift
func getBucketBundles(input: GetBucketBundlesInput, completion: @escaping (ClientRuntime.SdkResult<GetBucketBundlesOutputResponse, GetBucketBundlesOutputError>) -> Void)
```

### getBucketMetricData(input:completion:)

Returns the data points of a specific metric for an Amazon Lightsail bucket. Metrics report the utilization of a bucket. View and collect metric data regularly to monitor the number of objects stored in a bucket (including object versions) and the storage space used by those objects.

``` swift
func getBucketMetricData(input: GetBucketMetricDataInput, completion: @escaping (ClientRuntime.SdkResult<GetBucketMetricDataOutputResponse, GetBucketMetricDataOutputError>) -> Void)
```

### getBuckets(input:completion:)

Returns information about one or more Amazon Lightsail buckets. For more information about buckets, see [Buckets in Amazon Lightsail](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/buckets-in-amazon-lightsail) in the Amazon Lightsail Developer Guide..

``` swift
func getBuckets(input: GetBucketsInput, completion: @escaping (ClientRuntime.SdkResult<GetBucketsOutputResponse, GetBucketsOutputError>) -> Void)
```

### getBundles(input:completion:)

Returns the list of bundles that are available for purchase. A bundle describes the specs for your virtual private server (or instance).

``` swift
func getBundles(input: GetBundlesInput, completion: @escaping (ClientRuntime.SdkResult<GetBundlesOutputResponse, GetBundlesOutputError>) -> Void)
```

### getCertificates(input:completion:)

Returns information about one or more Amazon Lightsail SSL/TLS certificates. To get a summary of a certificate, ommit includeCertificateDetails from your request. The response will include only the certificate Amazon Resource Name (ARN), certificate name, domain name, and tags.

``` swift
func getCertificates(input: GetCertificatesInput, completion: @escaping (ClientRuntime.SdkResult<GetCertificatesOutputResponse, GetCertificatesOutputError>) -> Void)
```

### getCloudFormationStackRecords(input:completion:)

Returns the CloudFormation stack record created as a result of the create cloud formation stack operation. An AWS CloudFormation stack is used to create a new Amazon EC2 instance from an exported Lightsail snapshot.

``` swift
func getCloudFormationStackRecords(input: GetCloudFormationStackRecordsInput, completion: @escaping (ClientRuntime.SdkResult<GetCloudFormationStackRecordsOutputResponse, GetCloudFormationStackRecordsOutputError>) -> Void)
```

### getContactMethods(input:completion:)

Returns information about the configured contact methods. Specify a protocol in your request to return information about a specific contact method. A contact method is used to send you notifications about your Amazon Lightsail resources. You can add one email address and one mobile phone number contact method in each AWS Region. However, SMS text messaging is not supported in some AWS Regions, and SMS text messages cannot be sent to some countries/regions. For more information, see [Notifications in Amazon Lightsail](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications).

``` swift
func getContactMethods(input: GetContactMethodsInput, completion: @escaping (ClientRuntime.SdkResult<GetContactMethodsOutputResponse, GetContactMethodsOutputError>) -> Void)
```

### getContainerAPIMetadata(input:completion:)

Returns information about Amazon Lightsail containers, such as the current version of the Lightsail Control (lightsailctl) plugin.

``` swift
func getContainerAPIMetadata(input: GetContainerAPIMetadataInput, completion: @escaping (ClientRuntime.SdkResult<GetContainerAPIMetadataOutputResponse, GetContainerAPIMetadataOutputError>) -> Void)
```

### getContainerImages(input:completion:)

Returns the container images that are registered to your Amazon Lightsail container service. If you created a deployment on your Lightsail container service that uses container images from a public registry like Docker Hub, those images are not returned as part of this action. Those images are not registered to your Lightsail container service.

``` swift
func getContainerImages(input: GetContainerImagesInput, completion: @escaping (ClientRuntime.SdkResult<GetContainerImagesOutputResponse, GetContainerImagesOutputError>) -> Void)
```

### getContainerLog(input:completion:)

Returns the log events of a container of your Amazon Lightsail container service. If your container service has more than one node (i.e., a scale greater than 1), then the log events that are returned for the specified container are merged from all nodes on your container service. Container logs are retained for a certain amount of time. For more information, see [Amazon Lightsail endpoints and quotas](https://docs.aws.amazon.com/general/latest/gr/lightsail.html) in the AWS General Reference.

``` swift
func getContainerLog(input: GetContainerLogInput, completion: @escaping (ClientRuntime.SdkResult<GetContainerLogOutputResponse, GetContainerLogOutputError>) -> Void)
```

### getContainerServiceDeployments(input:completion:)

Returns the deployments for your Amazon Lightsail container service A deployment specifies the settings, such as the ports and launch command, of containers that are deployed to your container service. The deployments are ordered by version in ascending order. The newest version is listed at the top of the response. A set number of deployments are kept before the oldest one is replaced with the newest one. For more information, see [Amazon Lightsail endpoints and quotas](https://docs.aws.amazon.com/general/latest/gr/lightsail.html) in the AWS General Reference.

``` swift
func getContainerServiceDeployments(input: GetContainerServiceDeploymentsInput, completion: @escaping (ClientRuntime.SdkResult<GetContainerServiceDeploymentsOutputResponse, GetContainerServiceDeploymentsOutputError>) -> Void)
```

### getContainerServiceMetricData(input:completion:)

Returns the data points of a specific metric of your Amazon Lightsail container service. Metrics report the utilization of your resources. Monitor and collect metric data regularly to maintain the reliability, availability, and performance of your resources.

``` swift
func getContainerServiceMetricData(input: GetContainerServiceMetricDataInput, completion: @escaping (ClientRuntime.SdkResult<GetContainerServiceMetricDataOutputResponse, GetContainerServiceMetricDataOutputError>) -> Void)
```

### getContainerServicePowers(input:completion:)

Returns the list of powers that can be specified for your Amazon Lightsail container services. The power specifies the amount of memory, the number of vCPUs, and the base price of the container service.

``` swift
func getContainerServicePowers(input: GetContainerServicePowersInput, completion: @escaping (ClientRuntime.SdkResult<GetContainerServicePowersOutputResponse, GetContainerServicePowersOutputError>) -> Void)
```

### getContainerServices(input:completion:)

Returns information about one or more of your Amazon Lightsail container services.

``` swift
func getContainerServices(input: GetContainerServicesInput, completion: @escaping (ClientRuntime.SdkResult<GetContainerServicesOutputResponse, GetContainerServicesOutputError>) -> Void)
```

### getDisk(input:completion:)

Returns information about a specific block storage disk.

``` swift
func getDisk(input: GetDiskInput, completion: @escaping (ClientRuntime.SdkResult<GetDiskOutputResponse, GetDiskOutputError>) -> Void)
```

### getDisks(input:completion:)

Returns information about all block storage disks in your AWS account and region.

``` swift
func getDisks(input: GetDisksInput, completion: @escaping (ClientRuntime.SdkResult<GetDisksOutputResponse, GetDisksOutputError>) -> Void)
```

### getDiskSnapshot(input:completion:)

Returns information about a specific block storage disk snapshot.

``` swift
func getDiskSnapshot(input: GetDiskSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<GetDiskSnapshotOutputResponse, GetDiskSnapshotOutputError>) -> Void)
```

### getDiskSnapshots(input:completion:)

Returns information about all block storage disk snapshots in your AWS account and region.

``` swift
func getDiskSnapshots(input: GetDiskSnapshotsInput, completion: @escaping (ClientRuntime.SdkResult<GetDiskSnapshotsOutputResponse, GetDiskSnapshotsOutputError>) -> Void)
```

### getDistributionBundles(input:completion:)

Returns the bundles that can be applied to your Amazon Lightsail content delivery network (CDN) distributions. A distribution bundle specifies the monthly network transfer quota and monthly cost of your dsitribution.

``` swift
func getDistributionBundles(input: GetDistributionBundlesInput, completion: @escaping (ClientRuntime.SdkResult<GetDistributionBundlesOutputResponse, GetDistributionBundlesOutputError>) -> Void)
```

### getDistributionLatestCacheReset(input:completion:)

Returns the timestamp and status of the last cache reset of a specific Amazon Lightsail content delivery network (CDN) distribution.

``` swift
func getDistributionLatestCacheReset(input: GetDistributionLatestCacheResetInput, completion: @escaping (ClientRuntime.SdkResult<GetDistributionLatestCacheResetOutputResponse, GetDistributionLatestCacheResetOutputError>) -> Void)
```

### getDistributionMetricData(input:completion:)

Returns the data points of a specific metric for an Amazon Lightsail content delivery network (CDN) distribution. Metrics report the utilization of your resources, and the error counts generated by them. Monitor and collect metric data regularly to maintain the reliability, availability, and performance of your resources.

``` swift
func getDistributionMetricData(input: GetDistributionMetricDataInput, completion: @escaping (ClientRuntime.SdkResult<GetDistributionMetricDataOutputResponse, GetDistributionMetricDataOutputError>) -> Void)
```

### getDistributions(input:completion:)

Returns information about one or more of your Amazon Lightsail content delivery network (CDN) distributions.

``` swift
func getDistributions(input: GetDistributionsInput, completion: @escaping (ClientRuntime.SdkResult<GetDistributionsOutputResponse, GetDistributionsOutputError>) -> Void)
```

### getDomain(input:completion:)

Returns information about a specific domain recordset.

``` swift
func getDomain(input: GetDomainInput, completion: @escaping (ClientRuntime.SdkResult<GetDomainOutputResponse, GetDomainOutputError>) -> Void)
```

### getDomains(input:completion:)

Returns a list of all domains in the user's account.

``` swift
func getDomains(input: GetDomainsInput, completion: @escaping (ClientRuntime.SdkResult<GetDomainsOutputResponse, GetDomainsOutputError>) -> Void)
```

### getExportSnapshotRecords(input:completion:)

Returns all export snapshot records created as a result of the export snapshot operation. An export snapshot record can be used to create a new Amazon EC2 instance and its related resources with the \[CreateCloudFormationStack\] action.

``` swift
func getExportSnapshotRecords(input: GetExportSnapshotRecordsInput, completion: @escaping (ClientRuntime.SdkResult<GetExportSnapshotRecordsOutputResponse, GetExportSnapshotRecordsOutputError>) -> Void)
```

### getInstance(input:completion:)

Returns information about a specific Amazon Lightsail instance, which is a virtual private server.

``` swift
func getInstance(input: GetInstanceInput, completion: @escaping (ClientRuntime.SdkResult<GetInstanceOutputResponse, GetInstanceOutputError>) -> Void)
```

### getInstanceAccessDetails(input:completion:)

Returns temporary SSH keys you can use to connect to a specific virtual private server, or instance. The get instance access details operation supports tag-based access control via resource tags applied to the resource identified by instance name. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func getInstanceAccessDetails(input: GetInstanceAccessDetailsInput, completion: @escaping (ClientRuntime.SdkResult<GetInstanceAccessDetailsOutputResponse, GetInstanceAccessDetailsOutputError>) -> Void)
```

### getInstanceMetricData(input:completion:)

Returns the data points for the specified Amazon Lightsail instance metric, given an instance name. Metrics report the utilization of your resources, and the error counts generated by them. Monitor and collect metric data regularly to maintain the reliability, availability, and performance of your resources.

``` swift
func getInstanceMetricData(input: GetInstanceMetricDataInput, completion: @escaping (ClientRuntime.SdkResult<GetInstanceMetricDataOutputResponse, GetInstanceMetricDataOutputError>) -> Void)
```

### getInstancePortStates(input:completion:)

Returns the firewall port states for a specific Amazon Lightsail instance, the IP addresses allowed to connect to the instance through the ports, and the protocol.

``` swift
func getInstancePortStates(input: GetInstancePortStatesInput, completion: @escaping (ClientRuntime.SdkResult<GetInstancePortStatesOutputResponse, GetInstancePortStatesOutputError>) -> Void)
```

### getInstances(input:completion:)

Returns information about all Amazon Lightsail virtual private servers, or instances.

``` swift
func getInstances(input: GetInstancesInput, completion: @escaping (ClientRuntime.SdkResult<GetInstancesOutputResponse, GetInstancesOutputError>) -> Void)
```

### getInstanceSnapshot(input:completion:)

Returns information about a specific instance snapshot.

``` swift
func getInstanceSnapshot(input: GetInstanceSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<GetInstanceSnapshotOutputResponse, GetInstanceSnapshotOutputError>) -> Void)
```

### getInstanceSnapshots(input:completion:)

Returns all instance snapshots for the user's account.

``` swift
func getInstanceSnapshots(input: GetInstanceSnapshotsInput, completion: @escaping (ClientRuntime.SdkResult<GetInstanceSnapshotsOutputResponse, GetInstanceSnapshotsOutputError>) -> Void)
```

### getInstanceState(input:completion:)

Returns the state of a specific instance. Works on one instance at a time.

``` swift
func getInstanceState(input: GetInstanceStateInput, completion: @escaping (ClientRuntime.SdkResult<GetInstanceStateOutputResponse, GetInstanceStateOutputError>) -> Void)
```

### getKeyPair(input:completion:)

Returns information about a specific key pair.

``` swift
func getKeyPair(input: GetKeyPairInput, completion: @escaping (ClientRuntime.SdkResult<GetKeyPairOutputResponse, GetKeyPairOutputError>) -> Void)
```

### getKeyPairs(input:completion:)

Returns information about all key pairs in the user's account.

``` swift
func getKeyPairs(input: GetKeyPairsInput, completion: @escaping (ClientRuntime.SdkResult<GetKeyPairsOutputResponse, GetKeyPairsOutputError>) -> Void)
```

### getLoadBalancer(input:completion:)

Returns information about the specified Lightsail load balancer.

``` swift
func getLoadBalancer(input: GetLoadBalancerInput, completion: @escaping (ClientRuntime.SdkResult<GetLoadBalancerOutputResponse, GetLoadBalancerOutputError>) -> Void)
```

### getLoadBalancerMetricData(input:completion:)

Returns information about health metrics for your Lightsail load balancer. Metrics report the utilization of your resources, and the error counts generated by them. Monitor and collect metric data regularly to maintain the reliability, availability, and performance of your resources.

``` swift
func getLoadBalancerMetricData(input: GetLoadBalancerMetricDataInput, completion: @escaping (ClientRuntime.SdkResult<GetLoadBalancerMetricDataOutputResponse, GetLoadBalancerMetricDataOutputError>) -> Void)
```

### getLoadBalancers(input:completion:)

Returns information about all load balancers in an account.

``` swift
func getLoadBalancers(input: GetLoadBalancersInput, completion: @escaping (ClientRuntime.SdkResult<GetLoadBalancersOutputResponse, GetLoadBalancersOutputError>) -> Void)
```

### getLoadBalancerTlsCertificates(input:completion:)

Returns information about the TLS certificates that are associated with the specified Lightsail load balancer. TLS is just an updated, more secure version of Secure Socket Layer (SSL). You can have a maximum of 2 certificates associated with a Lightsail load balancer. One is active and the other is inactive.

``` swift
func getLoadBalancerTlsCertificates(input: GetLoadBalancerTlsCertificatesInput, completion: @escaping (ClientRuntime.SdkResult<GetLoadBalancerTlsCertificatesOutputResponse, GetLoadBalancerTlsCertificatesOutputError>) -> Void)
```

### getOperation(input:completion:)

Returns information about a specific operation. Operations include events such as when you create an instance, allocate a static IP, attach a static IP, and so on.

``` swift
func getOperation(input: GetOperationInput, completion: @escaping (ClientRuntime.SdkResult<GetOperationOutputResponse, GetOperationOutputError>) -> Void)
```

### getOperations(input:completion:)

Returns information about all operations. Results are returned from oldest to newest, up to a maximum of 200. Results can be paged by making each subsequent call to GetOperations use the maximum (last) statusChangedAt value from the previous request.

``` swift
func getOperations(input: GetOperationsInput, completion: @escaping (ClientRuntime.SdkResult<GetOperationsOutputResponse, GetOperationsOutputError>) -> Void)
```

### getOperationsForResource(input:completion:)

Gets operations for a specific resource (e.g., an instance or a static IP).

``` swift
func getOperationsForResource(input: GetOperationsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<GetOperationsForResourceOutputResponse, GetOperationsForResourceOutputError>) -> Void)
```

### getRegions(input:completion:)

Returns a list of all valid regions for Amazon Lightsail. Use the include availability zones parameter to also return the Availability Zones in a region.

``` swift
func getRegions(input: GetRegionsInput, completion: @escaping (ClientRuntime.SdkResult<GetRegionsOutputResponse, GetRegionsOutputError>) -> Void)
```

### getRelationalDatabase(input:completion:)

Returns information about a specific database in Amazon Lightsail.

``` swift
func getRelationalDatabase(input: GetRelationalDatabaseInput, completion: @escaping (ClientRuntime.SdkResult<GetRelationalDatabaseOutputResponse, GetRelationalDatabaseOutputError>) -> Void)
```

### getRelationalDatabaseBlueprints(input:completion:)

Returns a list of available database blueprints in Amazon Lightsail. A blueprint describes the major engine version of a database. You can use a blueprint ID to create a new database that runs a specific database engine.

``` swift
func getRelationalDatabaseBlueprints(input: GetRelationalDatabaseBlueprintsInput, completion: @escaping (ClientRuntime.SdkResult<GetRelationalDatabaseBlueprintsOutputResponse, GetRelationalDatabaseBlueprintsOutputError>) -> Void)
```

### getRelationalDatabaseBundles(input:completion:)

Returns the list of bundles that are available in Amazon Lightsail. A bundle describes the performance specifications for a database. You can use a bundle ID to create a new database with explicit performance specifications.

``` swift
func getRelationalDatabaseBundles(input: GetRelationalDatabaseBundlesInput, completion: @escaping (ClientRuntime.SdkResult<GetRelationalDatabaseBundlesOutputResponse, GetRelationalDatabaseBundlesOutputError>) -> Void)
```

### getRelationalDatabaseEvents(input:completion:)

Returns a list of events for a specific database in Amazon Lightsail.

``` swift
func getRelationalDatabaseEvents(input: GetRelationalDatabaseEventsInput, completion: @escaping (ClientRuntime.SdkResult<GetRelationalDatabaseEventsOutputResponse, GetRelationalDatabaseEventsOutputError>) -> Void)
```

### getRelationalDatabaseLogEvents(input:completion:)

Returns a list of log events for a database in Amazon Lightsail.

``` swift
func getRelationalDatabaseLogEvents(input: GetRelationalDatabaseLogEventsInput, completion: @escaping (ClientRuntime.SdkResult<GetRelationalDatabaseLogEventsOutputResponse, GetRelationalDatabaseLogEventsOutputError>) -> Void)
```

### getRelationalDatabaseLogStreams(input:completion:)

Returns a list of available log streams for a specific database in Amazon Lightsail.

``` swift
func getRelationalDatabaseLogStreams(input: GetRelationalDatabaseLogStreamsInput, completion: @escaping (ClientRuntime.SdkResult<GetRelationalDatabaseLogStreamsOutputResponse, GetRelationalDatabaseLogStreamsOutputError>) -> Void)
```

### getRelationalDatabaseMasterUserPassword(input:completion:)

Returns the current, previous, or pending versions of the master user password for a Lightsail database. The GetRelationalDatabaseMasterUserPassword operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName.

``` swift
func getRelationalDatabaseMasterUserPassword(input: GetRelationalDatabaseMasterUserPasswordInput, completion: @escaping (ClientRuntime.SdkResult<GetRelationalDatabaseMasterUserPasswordOutputResponse, GetRelationalDatabaseMasterUserPasswordOutputError>) -> Void)
```

### getRelationalDatabaseMetricData(input:completion:)

Returns the data points of the specified metric for a database in Amazon Lightsail. Metrics report the utilization of your resources, and the error counts generated by them. Monitor and collect metric data regularly to maintain the reliability, availability, and performance of your resources.

``` swift
func getRelationalDatabaseMetricData(input: GetRelationalDatabaseMetricDataInput, completion: @escaping (ClientRuntime.SdkResult<GetRelationalDatabaseMetricDataOutputResponse, GetRelationalDatabaseMetricDataOutputError>) -> Void)
```

### getRelationalDatabaseParameters(input:completion:)

Returns all of the runtime parameters offered by the underlying database software, or engine, for a specific database in Amazon Lightsail. In addition to the parameter names and values, this operation returns other information about each parameter. This information includes whether changes require a reboot, whether the parameter is modifiable, the allowed values, and the data types.

``` swift
func getRelationalDatabaseParameters(input: GetRelationalDatabaseParametersInput, completion: @escaping (ClientRuntime.SdkResult<GetRelationalDatabaseParametersOutputResponse, GetRelationalDatabaseParametersOutputError>) -> Void)
```

### getRelationalDatabases(input:completion:)

Returns information about all of your databases in Amazon Lightsail.

``` swift
func getRelationalDatabases(input: GetRelationalDatabasesInput, completion: @escaping (ClientRuntime.SdkResult<GetRelationalDatabasesOutputResponse, GetRelationalDatabasesOutputError>) -> Void)
```

### getRelationalDatabaseSnapshot(input:completion:)

Returns information about a specific database snapshot in Amazon Lightsail.

``` swift
func getRelationalDatabaseSnapshot(input: GetRelationalDatabaseSnapshotInput, completion: @escaping (ClientRuntime.SdkResult<GetRelationalDatabaseSnapshotOutputResponse, GetRelationalDatabaseSnapshotOutputError>) -> Void)
```

### getRelationalDatabaseSnapshots(input:completion:)

Returns information about all of your database snapshots in Amazon Lightsail.

``` swift
func getRelationalDatabaseSnapshots(input: GetRelationalDatabaseSnapshotsInput, completion: @escaping (ClientRuntime.SdkResult<GetRelationalDatabaseSnapshotsOutputResponse, GetRelationalDatabaseSnapshotsOutputError>) -> Void)
```

### getStaticIp(input:completion:)

Returns information about an Amazon Lightsail static IP.

``` swift
func getStaticIp(input: GetStaticIpInput, completion: @escaping (ClientRuntime.SdkResult<GetStaticIpOutputResponse, GetStaticIpOutputError>) -> Void)
```

### getStaticIps(input:completion:)

Returns information about all static IPs in the user's account.

``` swift
func getStaticIps(input: GetStaticIpsInput, completion: @escaping (ClientRuntime.SdkResult<GetStaticIpsOutputResponse, GetStaticIpsOutputError>) -> Void)
```

### importKeyPair(input:completion:)

Imports a public SSH key from a specific key pair.

``` swift
func importKeyPair(input: ImportKeyPairInput, completion: @escaping (ClientRuntime.SdkResult<ImportKeyPairOutputResponse, ImportKeyPairOutputError>) -> Void)
```

### isVpcPeered(input:completion:)

Returns a Boolean value indicating whether your Lightsail VPC is peered.

``` swift
func isVpcPeered(input: IsVpcPeeredInput, completion: @escaping (ClientRuntime.SdkResult<IsVpcPeeredOutputResponse, IsVpcPeeredOutputError>) -> Void)
```

### openInstancePublicPorts(input:completion:)

Opens ports for a specific Amazon Lightsail instance, and specifies the IP addresses allowed to connect to the instance through the ports, and the protocol. The OpenInstancePublicPorts action supports tag-based access control via resource tags applied to the resource identified by instanceName. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func openInstancePublicPorts(input: OpenInstancePublicPortsInput, completion: @escaping (ClientRuntime.SdkResult<OpenInstancePublicPortsOutputResponse, OpenInstancePublicPortsOutputError>) -> Void)
```

### peerVpc(input:completion:)

Peers the Lightsail VPC with the user's default VPC.

``` swift
func peerVpc(input: PeerVpcInput, completion: @escaping (ClientRuntime.SdkResult<PeerVpcOutputResponse, PeerVpcOutputError>) -> Void)
```

### putAlarm(input:completion:)

Creates or updates an alarm, and associates it with the specified metric. An alarm is used to monitor a single metric for one of your resources. When a metric condition is met, the alarm can notify you by email, SMS text message, and a banner displayed on the Amazon Lightsail console. For more information, see [Alarms in Amazon Lightsail](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms). When this action creates an alarm, the alarm state is immediately set to INSUFFICIENT\_DATA. The alarm is then evaluated and its state is set appropriately. Any actions associated with the new state are then executed. When you update an existing alarm, its state is left unchanged, but the update completely overwrites the previous configuration of the alarm. The alarm is then evaluated with the updated configuration.

``` swift
func putAlarm(input: PutAlarmInput, completion: @escaping (ClientRuntime.SdkResult<PutAlarmOutputResponse, PutAlarmOutputError>) -> Void)
```

### putInstancePublicPorts(input:completion:)

Opens ports for a specific Amazon Lightsail instance, and specifies the IP addresses allowed to connect to the instance through the ports, and the protocol. This action also closes all currently open ports that are not included in the request. Include all of the ports and the protocols you want to open in your PutInstancePublicPortsrequest. Or use the OpenInstancePublicPorts action to open ports without closing currently open ports. The PutInstancePublicPorts action supports tag-based access control via resource tags applied to the resource identified by instanceName. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func putInstancePublicPorts(input: PutInstancePublicPortsInput, completion: @escaping (ClientRuntime.SdkResult<PutInstancePublicPortsOutputResponse, PutInstancePublicPortsOutputError>) -> Void)
```

### rebootInstance(input:completion:)

Restarts a specific instance. The reboot instance operation supports tag-based access control via resource tags applied to the resource identified by instance name. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func rebootInstance(input: RebootInstanceInput, completion: @escaping (ClientRuntime.SdkResult<RebootInstanceOutputResponse, RebootInstanceOutputError>) -> Void)
```

### rebootRelationalDatabase(input:completion:)

Restarts a specific database in Amazon Lightsail. The reboot relational database operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func rebootRelationalDatabase(input: RebootRelationalDatabaseInput, completion: @escaping (ClientRuntime.SdkResult<RebootRelationalDatabaseOutputResponse, RebootRelationalDatabaseOutputError>) -> Void)
```

### registerContainerImage(input:completion:)

Registers a container image to your Amazon Lightsail container service. This action is not required if you install and use the Lightsail Control (lightsailctl) plugin to push container images to your Lightsail container service. For more information, see [Pushing and managing container images on your Amazon Lightsail container services](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-pushing-container-images) in the Amazon Lightsail Developer Guide.

``` swift
func registerContainerImage(input: RegisterContainerImageInput, completion: @escaping (ClientRuntime.SdkResult<RegisterContainerImageOutputResponse, RegisterContainerImageOutputError>) -> Void)
```

### releaseStaticIp(input:completion:)

Deletes a specific static IP from your account.

``` swift
func releaseStaticIp(input: ReleaseStaticIpInput, completion: @escaping (ClientRuntime.SdkResult<ReleaseStaticIpOutputResponse, ReleaseStaticIpOutputError>) -> Void)
```

### resetDistributionCache(input:completion:)

Deletes currently cached content from your Amazon Lightsail content delivery network (CDN) distribution. After resetting the cache, the next time a content request is made, your distribution pulls, serves, and caches it from the origin.

``` swift
func resetDistributionCache(input: ResetDistributionCacheInput, completion: @escaping (ClientRuntime.SdkResult<ResetDistributionCacheOutputResponse, ResetDistributionCacheOutputError>) -> Void)
```

### sendContactMethodVerification(input:completion:)

Sends a verification request to an email contact method to ensure it's owned by the requester. SMS contact methods don't need to be verified. A contact method is used to send you notifications about your Amazon Lightsail resources. You can add one email address and one mobile phone number contact method in each AWS Region. However, SMS text messaging is not supported in some AWS Regions, and SMS text messages cannot be sent to some countries/regions. For more information, see [Notifications in Amazon Lightsail](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications). A verification request is sent to the contact method when you initially create it. Use this action to send another verification request if a previous verification request was deleted, or has expired. Notifications are not sent to an email contact method until after it is verified, and confirmed as valid.

``` swift
func sendContactMethodVerification(input: SendContactMethodVerificationInput, completion: @escaping (ClientRuntime.SdkResult<SendContactMethodVerificationOutputResponse, SendContactMethodVerificationOutputError>) -> Void)
```

### setIpAddressType(input:completion:)

Sets the IP address type for an Amazon Lightsail resource. Use this action to enable dual-stack for a resource, which enables IPv4 and IPv6 for the specified resource. Alternately, you can use this action to disable dual-stack, and enable IPv4 only.

``` swift
func setIpAddressType(input: SetIpAddressTypeInput, completion: @escaping (ClientRuntime.SdkResult<SetIpAddressTypeOutputResponse, SetIpAddressTypeOutputError>) -> Void)
```

### setResourceAccessForBucket(input:completion:)

Sets the Amazon Lightsail resources that can access the specified Lightsail bucket. Lightsail buckets currently support setting access for Lightsail instances in the same AWS Region.

``` swift
func setResourceAccessForBucket(input: SetResourceAccessForBucketInput, completion: @escaping (ClientRuntime.SdkResult<SetResourceAccessForBucketOutputResponse, SetResourceAccessForBucketOutputError>) -> Void)
```

### startInstance(input:completion:)

Starts a specific Amazon Lightsail instance from a stopped state. To restart an instance, use the reboot instance operation. When you start a stopped instance, Lightsail assigns a new public IP address to the instance. To use the same IP address after stopping and starting an instance, create a static IP address and attach it to the instance. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/lightsail-create-static-ip). The start instance operation supports tag-based access control via resource tags applied to the resource identified by instance name. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func startInstance(input: StartInstanceInput, completion: @escaping (ClientRuntime.SdkResult<StartInstanceOutputResponse, StartInstanceOutputError>) -> Void)
```

### startRelationalDatabase(input:completion:)

Starts a specific database from a stopped state in Amazon Lightsail. To restart a database, use the reboot relational database operation. The start relational database operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func startRelationalDatabase(input: StartRelationalDatabaseInput, completion: @escaping (ClientRuntime.SdkResult<StartRelationalDatabaseOutputResponse, StartRelationalDatabaseOutputError>) -> Void)
```

### stopInstance(input:completion:)

Stops a specific Amazon Lightsail instance that is currently running. When you start a stopped instance, Lightsail assigns a new public IP address to the instance. To use the same IP address after stopping and starting an instance, create a static IP address and attach it to the instance. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/lightsail-create-static-ip). The stop instance operation supports tag-based access control via resource tags applied to the resource identified by instance name. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func stopInstance(input: StopInstanceInput, completion: @escaping (ClientRuntime.SdkResult<StopInstanceOutputResponse, StopInstanceOutputError>) -> Void)
```

### stopRelationalDatabase(input:completion:)

Stops a specific database that is currently running in Amazon Lightsail. The stop relational database operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func stopRelationalDatabase(input: StopRelationalDatabaseInput, completion: @escaping (ClientRuntime.SdkResult<StopRelationalDatabaseOutputResponse, StopRelationalDatabaseOutputError>) -> Void)
```

### tagResource(input:completion:)

Adds one or more tags to the specified Amazon Lightsail resource. Each resource can have a maximum of 50 tags. Each tag consists of a key and an optional value. Tag keys must be unique per resource. For more information about tags, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags). The tag resource operation supports tag-based access control via request tags and resource tags applied to the resource identified by resource name. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### testAlarm(input:completion:)

Tests an alarm by displaying a banner on the Amazon Lightsail console. If a notification trigger is configured for the specified alarm, the test also sends a notification to the notification protocol (Email and/or SMS) configured for the alarm. An alarm is used to monitor a single metric for one of your resources. When a metric condition is met, the alarm can notify you by email, SMS text message, and a banner displayed on the Amazon Lightsail console. For more information, see [Alarms in Amazon Lightsail](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms).

``` swift
func testAlarm(input: TestAlarmInput, completion: @escaping (ClientRuntime.SdkResult<TestAlarmOutputResponse, TestAlarmOutputError>) -> Void)
```

### unpeerVpc(input:completion:)

Unpeers the Lightsail VPC from the user's default VPC.

``` swift
func unpeerVpc(input: UnpeerVpcInput, completion: @escaping (ClientRuntime.SdkResult<UnpeerVpcOutputResponse, UnpeerVpcOutputError>) -> Void)
```

### untagResource(input:completion:)

Deletes the specified set of tag keys and their values from the specified Amazon Lightsail resource. The untag resource operation supports tag-based access control via request tags and resource tags applied to the resource identified by resource name. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateBucket(input:completion:)

Updates an existing Amazon Lightsail bucket. Use this action to update the configuration of an existing bucket, such as versioning, public accessibility, and the AWS accounts that can access the bucket.

``` swift
func updateBucket(input: UpdateBucketInput, completion: @escaping (ClientRuntime.SdkResult<UpdateBucketOutputResponse, UpdateBucketOutputError>) -> Void)
```

### updateBucketBundle(input:completion:)

Updates the bundle, or storage plan, of an existing Amazon Lightsail bucket. A bucket bundle specifies the monthly cost, storage space, and data transfer quota for a bucket. You can update a bucket's bundle only one time within a monthly AWS billing cycle. To determine if you can update a bucket's bundle, use the \[GetBuckets\] action. The ableToUpdateBundle parameter in the response will indicate whether you can currently update a bucket's bundle. Update a bucket's bundle if it's consistently going over its storage space or data transfer quota, or if a bucket's usage is consistently in the lower range of its storage space or data transfer quota. Due to the unpredictable usage fluctuations that a bucket might experience, we strongly recommend that you update a bucket's bundle only as a long-term strategy, instead of as a short-term, monthly cost-cutting measure. Choose a bucket bundle that will provide the bucket with ample storage space and data transfer for a long time to come.

``` swift
func updateBucketBundle(input: UpdateBucketBundleInput, completion: @escaping (ClientRuntime.SdkResult<UpdateBucketBundleOutputResponse, UpdateBucketBundleOutputError>) -> Void)
```

### updateContainerService(input:completion:)

Updates the configuration of your Amazon Lightsail container service, such as its power, scale, and public domain names.

``` swift
func updateContainerService(input: UpdateContainerServiceInput, completion: @escaping (ClientRuntime.SdkResult<UpdateContainerServiceOutputResponse, UpdateContainerServiceOutputError>) -> Void)
```

### updateDistribution(input:completion:)

Updates an existing Amazon Lightsail content delivery network (CDN) distribution. Use this action to update the configuration of your existing distribution.

``` swift
func updateDistribution(input: UpdateDistributionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDistributionOutputResponse, UpdateDistributionOutputError>) -> Void)
```

### updateDistributionBundle(input:completion:)

Updates the bundle of your Amazon Lightsail content delivery network (CDN) distribution. A distribution bundle specifies the monthly network transfer quota and monthly cost of your dsitribution. Update your distribution's bundle if your distribution is going over its monthly network transfer quota and is incurring an overage fee. You can update your distribution's bundle only one time within your monthly AWS billing cycle. To determine if you can update your distribution's bundle, use the GetDistributions action. The ableToUpdateBundle parameter in the result will indicate whether you can currently update your distribution's bundle.

``` swift
func updateDistributionBundle(input: UpdateDistributionBundleInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDistributionBundleOutputResponse, UpdateDistributionBundleOutputError>) -> Void)
```

### updateDomainEntry(input:completion:)

Updates a domain recordset after it is created. The update domain entry operation supports tag-based access control via resource tags applied to the resource identified by domain name. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func updateDomainEntry(input: UpdateDomainEntryInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDomainEntryOutputResponse, UpdateDomainEntryOutputError>) -> Void)
```

### updateLoadBalancerAttribute(input:completion:)

Updates the specified attribute for a load balancer. You can only update one attribute at a time. The update load balancer attribute operation supports tag-based access control via resource tags applied to the resource identified by load balancer name. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func updateLoadBalancerAttribute(input: UpdateLoadBalancerAttributeInput, completion: @escaping (ClientRuntime.SdkResult<UpdateLoadBalancerAttributeOutputResponse, UpdateLoadBalancerAttributeOutputError>) -> Void)
```

### updateRelationalDatabase(input:completion:)

Allows the update of one or more attributes of a database in Amazon Lightsail. Updates are applied immediately, or in cases where the updates could result in an outage, are applied during the database's predefined maintenance window. The update relational database operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func updateRelationalDatabase(input: UpdateRelationalDatabaseInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRelationalDatabaseOutputResponse, UpdateRelationalDatabaseOutputError>) -> Void)
```

### updateRelationalDatabaseParameters(input:completion:)

Allows the update of one or more parameters of a database in Amazon Lightsail. Parameter updates don't cause outages; therefore, their application is not subject to the preferred maintenance window. However, there are two ways in which parameter updates are applied: dynamic or pending-reboot. Parameters marked with a dynamic apply type are applied immediately. Parameters marked with a pending-reboot apply type are applied only after the database is rebooted using the reboot relational database operation. The update relational database parameters operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the [Amazon Lightsail Developer Guide](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags).

``` swift
func updateRelationalDatabaseParameters(input: UpdateRelationalDatabaseParametersInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRelationalDatabaseParametersOutputResponse, UpdateRelationalDatabaseParametersOutputError>) -> Void)
```
