# AppStreamClientProtocol

<fullname>Amazon AppStream 2.0</fullname>
This is the Amazon AppStream 2.0 API Reference. This documentation provides descriptions and syntax for each of the actions and data types in AppStream 2.0. AppStream 2.0 is a fully managed, secure application streaming service that lets you stream desktop applications to users without rewriting applications. AppStream 2.0 manages the AWS resources that are required to host and run your applications, scales automatically, and provides access to your users on demand.

``` swift
public protocol AppStreamClientProtocol 
```

``` 
        You can call the AppStream 2.0 API operations by using an interface VPC endpoint (interface endpoint). For more information, see <a href="https://docs.aws.amazon.com/appstream2/latest/developerguide/access-api-cli-through-interface-vpc-endpoint.html">Access AppStream 2.0 API Operations and CLI Commands Through an Interface VPC Endpoint in the Amazon AppStream 2.0 Administration Guide.


    To learn more about AppStream 2.0, see the following resources:




              <a href="http://aws.amazon.com/appstream2">Amazon AppStream 2.0 product page




              <a href="http://aws.amazon.com/documentation/appstream2">Amazon AppStream 2.0 documentation
```

## Requirements

### associateFleet(input:​completion:​)

Associates the specified fleet with the specified stack.

``` swift
func associateFleet(input: AssociateFleetInput, completion: @escaping (ClientRuntime.SdkResult<AssociateFleetOutputResponse, AssociateFleetOutputError>) -> Void)
```

### batchAssociateUserStack(input:​completion:​)

Associates the specified users with the specified stacks. Users in a user pool cannot be assigned to stacks with fleets that are joined to an Active Directory domain.

``` swift
func batchAssociateUserStack(input: BatchAssociateUserStackInput, completion: @escaping (ClientRuntime.SdkResult<BatchAssociateUserStackOutputResponse, BatchAssociateUserStackOutputError>) -> Void)
```

### batchDisassociateUserStack(input:​completion:​)

Disassociates the specified users from the specified stacks.

``` swift
func batchDisassociateUserStack(input: BatchDisassociateUserStackInput, completion: @escaping (ClientRuntime.SdkResult<BatchDisassociateUserStackOutputResponse, BatchDisassociateUserStackOutputError>) -> Void)
```

### copyImage(input:​completion:​)

Copies the image within the same region or to a new region within the same AWS account. Note that any tags you added to the image will not be copied.

``` swift
func copyImage(input: CopyImageInput, completion: @escaping (ClientRuntime.SdkResult<CopyImageOutputResponse, CopyImageOutputError>) -> Void)
```

### createDirectoryConfig(input:​completion:​)

Creates a Directory Config object in AppStream 2.0. This object includes the configuration information required to join fleets and image builders to Microsoft Active Directory domains.

``` swift
func createDirectoryConfig(input: CreateDirectoryConfigInput, completion: @escaping (ClientRuntime.SdkResult<CreateDirectoryConfigOutputResponse, CreateDirectoryConfigOutputError>) -> Void)
```

### createFleet(input:​completion:​)

Creates a fleet. A fleet consists of streaming instances that run a specified image.

``` swift
func createFleet(input: CreateFleetInput, completion: @escaping (ClientRuntime.SdkResult<CreateFleetOutputResponse, CreateFleetOutputError>) -> Void)
```

### createImageBuilder(input:​completion:​)

Creates an image builder. An image builder is a virtual machine that is used to create an image.
The initial state of the builder is PENDING. When it is ready, the state is RUNNING.

``` swift
func createImageBuilder(input: CreateImageBuilderInput, completion: @escaping (ClientRuntime.SdkResult<CreateImageBuilderOutputResponse, CreateImageBuilderOutputError>) -> Void)
```

### createImageBuilderStreamingURL(input:​completion:​)

Creates a URL to start an image builder streaming session.

``` swift
func createImageBuilderStreamingURL(input: CreateImageBuilderStreamingURLInput, completion: @escaping (ClientRuntime.SdkResult<CreateImageBuilderStreamingURLOutputResponse, CreateImageBuilderStreamingURLOutputError>) -> Void)
```

### createStack(input:​completion:​)

Creates a stack to start streaming applications to users. A stack consists of an associated fleet, user access policies, and storage configurations.

``` swift
func createStack(input: CreateStackInput, completion: @escaping (ClientRuntime.SdkResult<CreateStackOutputResponse, CreateStackOutputError>) -> Void)
```

### createStreamingURL(input:​completion:​)

Creates a temporary URL to start an AppStream 2.0 streaming session for the specified user. A streaming URL enables application streaming to be tested without user setup.

``` swift
func createStreamingURL(input: CreateStreamingURLInput, completion: @escaping (ClientRuntime.SdkResult<CreateStreamingURLOutputResponse, CreateStreamingURLOutputError>) -> Void)
```

### createUpdatedImage(input:​completion:​)

Creates a new image with the latest Windows operating system updates, driver updates, and AppStream 2.0 agent software.

``` swift
func createUpdatedImage(input: CreateUpdatedImageInput, completion: @escaping (ClientRuntime.SdkResult<CreateUpdatedImageOutputResponse, CreateUpdatedImageOutputError>) -> Void)
```

``` 
    For more information, see the "Update an Image by Using
        Managed AppStream 2.0 Image Updates" section in <a href="https://docs.aws.amazon.com/appstream2/latest/developerguide/administer-images.html">Administer Your AppStream 2.0 Images, in the Amazon AppStream 2.0 Administration Guide.
```

### createUsageReportSubscription(input:​completion:​)

Creates a usage report subscription. Usage reports are generated daily.

``` swift
func createUsageReportSubscription(input: CreateUsageReportSubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<CreateUsageReportSubscriptionOutputResponse, CreateUsageReportSubscriptionOutputError>) -> Void)
```

### createUser(input:​completion:​)

Creates a new user in the user pool.

``` swift
func createUser(input: CreateUserInput, completion: @escaping (ClientRuntime.SdkResult<CreateUserOutputResponse, CreateUserOutputError>) -> Void)
```

### deleteDirectoryConfig(input:​completion:​)

Deletes the specified Directory Config object from AppStream 2.0. This object includes the information required to join streaming instances to an Active Directory domain.

``` swift
func deleteDirectoryConfig(input: DeleteDirectoryConfigInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDirectoryConfigOutputResponse, DeleteDirectoryConfigOutputError>) -> Void)
```

### deleteFleet(input:​completion:​)

Deletes the specified fleet.

``` swift
func deleteFleet(input: DeleteFleetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteFleetOutputResponse, DeleteFleetOutputError>) -> Void)
```

### deleteImage(input:​completion:​)

Deletes the specified image. You cannot delete an image when it is in use.
After you delete an image, you cannot provision new capacity using the image.

``` swift
func deleteImage(input: DeleteImageInput, completion: @escaping (ClientRuntime.SdkResult<DeleteImageOutputResponse, DeleteImageOutputError>) -> Void)
```

### deleteImageBuilder(input:​completion:​)

Deletes the specified image builder and releases the capacity.

``` swift
func deleteImageBuilder(input: DeleteImageBuilderInput, completion: @escaping (ClientRuntime.SdkResult<DeleteImageBuilderOutputResponse, DeleteImageBuilderOutputError>) -> Void)
```

### deleteImagePermissions(input:​completion:​)

Deletes permissions for the specified private image. After you delete permissions for an image, AWS accounts to which you previously granted these permissions can no longer use the image.

``` swift
func deleteImagePermissions(input: DeleteImagePermissionsInput, completion: @escaping (ClientRuntime.SdkResult<DeleteImagePermissionsOutputResponse, DeleteImagePermissionsOutputError>) -> Void)
```

### deleteStack(input:​completion:​)

Deletes the specified stack. After the stack is deleted, the application streaming environment provided by the stack is no longer available to users. Also, any reservations made for application streaming sessions for the stack are released.

``` swift
func deleteStack(input: DeleteStackInput, completion: @escaping (ClientRuntime.SdkResult<DeleteStackOutputResponse, DeleteStackOutputError>) -> Void)
```

### deleteUsageReportSubscription(input:​completion:​)

Disables usage report generation.

``` swift
func deleteUsageReportSubscription(input: DeleteUsageReportSubscriptionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUsageReportSubscriptionOutputResponse, DeleteUsageReportSubscriptionOutputError>) -> Void)
```

### deleteUser(input:​completion:​)

Deletes a user from the user pool.

``` swift
func deleteUser(input: DeleteUserInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUserOutputResponse, DeleteUserOutputError>) -> Void)
```

### describeDirectoryConfigs(input:​completion:​)

Retrieves a list that describes one or more specified Directory Config objects for AppStream 2.0, if the names for these objects are provided. Otherwise, all Directory Config objects in the account are described. These objects include the configuration information required to join fleets and image builders to Microsoft Active Directory domains.

``` swift
func describeDirectoryConfigs(input: DescribeDirectoryConfigsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDirectoryConfigsOutputResponse, DescribeDirectoryConfigsOutputError>) -> Void)
```

``` 
    Although the response syntax in this topic includes the account password, this password is not returned in the actual response.
```

### describeFleets(input:​completion:​)

Retrieves a list that describes one or more specified fleets, if the fleet names are provided. Otherwise, all fleets in the account are described.

``` swift
func describeFleets(input: DescribeFleetsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeFleetsOutputResponse, DescribeFleetsOutputError>) -> Void)
```

### describeImageBuilders(input:​completion:​)

Retrieves a list that describes one or more specified image builders, if the image builder names are provided. Otherwise, all image builders in the account are described.

``` swift
func describeImageBuilders(input: DescribeImageBuildersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeImageBuildersOutputResponse, DescribeImageBuildersOutputError>) -> Void)
```

### describeImagePermissions(input:​completion:​)

Retrieves a list that describes the permissions for shared AWS account IDs on a private image that you own.

``` swift
func describeImagePermissions(input: DescribeImagePermissionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeImagePermissionsOutputResponse, DescribeImagePermissionsOutputError>) -> Void)
```

### describeImages(input:​completion:​)

Retrieves a list that describes one or more specified images, if the image names or image ARNs are provided. Otherwise, all images in the account are described.

``` swift
func describeImages(input: DescribeImagesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeImagesOutputResponse, DescribeImagesOutputError>) -> Void)
```

### describeSessions(input:​completion:​)

Retrieves a list that describes the streaming sessions for a specified stack and fleet. If a UserId is provided for the stack and fleet,
only streaming sessions for that user are described. If an authentication type is not provided,
the default is to authenticate users using a streaming URL.

``` swift
func describeSessions(input: DescribeSessionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSessionsOutputResponse, DescribeSessionsOutputError>) -> Void)
```

### describeStacks(input:​completion:​)

Retrieves a list that describes one or more specified stacks, if the stack names are provided. Otherwise, all stacks in the account are described.

``` swift
func describeStacks(input: DescribeStacksInput, completion: @escaping (ClientRuntime.SdkResult<DescribeStacksOutputResponse, DescribeStacksOutputError>) -> Void)
```

### describeUsageReportSubscriptions(input:​completion:​)

Retrieves a list that describes one or more usage report subscriptions.

``` swift
func describeUsageReportSubscriptions(input: DescribeUsageReportSubscriptionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeUsageReportSubscriptionsOutputResponse, DescribeUsageReportSubscriptionsOutputError>) -> Void)
```

### describeUsers(input:​completion:​)

Retrieves a list that describes one or more specified users in the user pool.

``` swift
func describeUsers(input: DescribeUsersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeUsersOutputResponse, DescribeUsersOutputError>) -> Void)
```

### describeUserStackAssociations(input:​completion:​)

Retrieves a list that describes the UserStackAssociation objects. You must specify either or both of the following:​

``` swift
func describeUserStackAssociations(input: DescribeUserStackAssociationsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeUserStackAssociationsOutputResponse, DescribeUserStackAssociationsOutputError>) -> Void)
```

``` 
           The stack name


           The user name (email address of the user associated with the stack) and the authentication type for the user
```

### disableUser(input:​completion:​)

Disables the specified user in the user pool. Users can't sign in to AppStream 2.0 until they are re-enabled. This action does not delete the user.

``` swift
func disableUser(input: DisableUserInput, completion: @escaping (ClientRuntime.SdkResult<DisableUserOutputResponse, DisableUserOutputError>) -> Void)
```

### disassociateFleet(input:​completion:​)

Disassociates the specified fleet from the specified stack.

``` swift
func disassociateFleet(input: DisassociateFleetInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateFleetOutputResponse, DisassociateFleetOutputError>) -> Void)
```

### enableUser(input:​completion:​)

Enables a user in the user pool. After being enabled, users can sign in to AppStream 2.0 and open applications from the stacks to which they are assigned.

``` swift
func enableUser(input: EnableUserInput, completion: @escaping (ClientRuntime.SdkResult<EnableUserOutputResponse, EnableUserOutputError>) -> Void)
```

### expireSession(input:​completion:​)

Immediately stops the specified streaming session.

``` swift
func expireSession(input: ExpireSessionInput, completion: @escaping (ClientRuntime.SdkResult<ExpireSessionOutputResponse, ExpireSessionOutputError>) -> Void)
```

### listAssociatedFleets(input:​completion:​)

Retrieves the name of the fleet that is associated with the specified stack.

``` swift
func listAssociatedFleets(input: ListAssociatedFleetsInput, completion: @escaping (ClientRuntime.SdkResult<ListAssociatedFleetsOutputResponse, ListAssociatedFleetsOutputError>) -> Void)
```

### listAssociatedStacks(input:​completion:​)

Retrieves the name of the stack with which the specified fleet is associated.

``` swift
func listAssociatedStacks(input: ListAssociatedStacksInput, completion: @escaping (ClientRuntime.SdkResult<ListAssociatedStacksOutputResponse, ListAssociatedStacksOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

Retrieves a list of all tags for the specified AppStream 2.0 resource. You can tag AppStream 2.0 image builders, images, fleets, and stacks.
For more information about tags, see <a href="https:​//docs.aws.amazon.com/appstream2/latest/developerguide/tagging-basic.html">Tagging Your Resources in the Amazon AppStream 2.0 Administration Guide.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### startFleet(input:​completion:​)

Starts the specified fleet.

``` swift
func startFleet(input: StartFleetInput, completion: @escaping (ClientRuntime.SdkResult<StartFleetOutputResponse, StartFleetOutputError>) -> Void)
```

### startImageBuilder(input:​completion:​)

Starts the specified image builder.

``` swift
func startImageBuilder(input: StartImageBuilderInput, completion: @escaping (ClientRuntime.SdkResult<StartImageBuilderOutputResponse, StartImageBuilderOutputError>) -> Void)
```

### stopFleet(input:​completion:​)

Stops the specified fleet.

``` swift
func stopFleet(input: StopFleetInput, completion: @escaping (ClientRuntime.SdkResult<StopFleetOutputResponse, StopFleetOutputError>) -> Void)
```

### stopImageBuilder(input:​completion:​)

Stops the specified image builder.

``` swift
func stopImageBuilder(input: StopImageBuilderInput, completion: @escaping (ClientRuntime.SdkResult<StopImageBuilderOutputResponse, StopImageBuilderOutputError>) -> Void)
```

### tagResource(input:​completion:​)

Adds or overwrites one or more tags for the specified AppStream 2.0 resource. You can tag AppStream 2.0 image builders, images, fleets, and stacks.
Each tag consists of a key and an optional value. If a resource already has a tag with the same key,
this operation updates its value.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

``` 
        To list the current tags for your resources, use ListTagsForResource.
            To disassociate tags from your resources, use UntagResource.
    For more information about tags, see <a href="https://docs.aws.amazon.com/appstream2/latest/developerguide/tagging-basic.html">Tagging Your Resources in the Amazon AppStream 2.0 Administration Guide.
```

### untagResource(input:​completion:​)

Disassociates one or more specified tags from the specified AppStream 2.0 resource.
To list the current tags for your resources, use ListTagsForResource.
For more information about tags, see <a href="https:​//docs.aws.amazon.com/appstream2/latest/developerguide/tagging-basic.html">Tagging Your Resources in the Amazon AppStream 2.0 Administration Guide.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateDirectoryConfig(input:​completion:​)

Updates the specified Directory Config object in AppStream 2.0. This object includes the configuration information required to join fleets and image builders to Microsoft Active Directory domains.

``` swift
func updateDirectoryConfig(input: UpdateDirectoryConfigInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDirectoryConfigOutputResponse, UpdateDirectoryConfigOutputError>) -> Void)
```

### updateFleet(input:​completion:​)

Updates the specified fleet.
If the fleet is in the STOPPED state, you can update any attribute except the fleet name.
If the fleet is in the RUNNING state, you can update the DisplayName, ComputeCapacity, ImageARN, ImageName, IdleDisconnectTimeoutInSeconds, and DisconnectTimeoutInSeconds attributes.
If the fleet is in the STARTING or STOPPING state, you can't update it.

``` swift
func updateFleet(input: UpdateFleetInput, completion: @escaping (ClientRuntime.SdkResult<UpdateFleetOutputResponse, UpdateFleetOutputError>) -> Void)
```

### updateImagePermissions(input:​completion:​)

Adds or updates permissions for the specified private image.

``` swift
func updateImagePermissions(input: UpdateImagePermissionsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateImagePermissionsOutputResponse, UpdateImagePermissionsOutputError>) -> Void)
```

### updateStack(input:​completion:​)

Updates the specified fields for the specified stack.

``` swift
func updateStack(input: UpdateStackInput, completion: @escaping (ClientRuntime.SdkResult<UpdateStackOutputResponse, UpdateStackOutputError>) -> Void)
```
