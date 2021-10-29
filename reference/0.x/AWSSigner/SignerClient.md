# SignerClient

``` swift
public class SignerClient 
```

## Inheritance

[`SignerClientProtocol`](/aws-sdk-swift/reference/0.x/AWSSigner/SignerClientProtocol)

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
public static let clientName = "SignerClient"
```

## Methods

### `addProfilePermission(input:completion:)`

Adds cross-account permissions to a signing profile.

``` swift
public func addProfilePermission(input: AddProfilePermissionInput, completion: @escaping (ClientRuntime.SdkResult<AddProfilePermissionOutputResponse, AddProfilePermissionOutputError>) -> Void)
```

### `cancelSigningProfile(input:completion:)`

Changes the state of an ACTIVE signing profile to CANCELED. A canceled profile is still viewable with the ListSigningProfiles operation, but it cannot perform new signing jobs, and is deleted two years after cancelation.

``` swift
public func cancelSigningProfile(input: CancelSigningProfileInput, completion: @escaping (ClientRuntime.SdkResult<CancelSigningProfileOutputResponse, CancelSigningProfileOutputError>) -> Void)
```

### `describeSigningJob(input:completion:)`

Returns information about a specific code signing job. You specify the job by using the jobId value that is returned by the \[StartSigningJob\] operation.

``` swift
public func describeSigningJob(input: DescribeSigningJobInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSigningJobOutputResponse, DescribeSigningJobOutputError>) -> Void)
```

### `getSigningPlatform(input:completion:)`

Returns information on a specific signing platform.

``` swift
public func getSigningPlatform(input: GetSigningPlatformInput, completion: @escaping (ClientRuntime.SdkResult<GetSigningPlatformOutputResponse, GetSigningPlatformOutputError>) -> Void)
```

### `getSigningProfile(input:completion:)`

Returns information on a specific signing profile.

``` swift
public func getSigningProfile(input: GetSigningProfileInput, completion: @escaping (ClientRuntime.SdkResult<GetSigningProfileOutputResponse, GetSigningProfileOutputError>) -> Void)
```

### `listProfilePermissions(input:completion:)`

Lists the cross-account permissions associated with a signing profile.

``` swift
public func listProfilePermissions(input: ListProfilePermissionsInput, completion: @escaping (ClientRuntime.SdkResult<ListProfilePermissionsOutputResponse, ListProfilePermissionsOutputError>) -> Void)
```

### `listSigningJobs(input:completion:)`

Lists all your signing jobs. You can use the maxResults parameter to limit the number of signing jobs that are returned in the response. If additional jobs remain to be listed, code signing returns a nextToken value. Use this value in subsequent calls to ListSigningJobs to fetch the remaining values. You can continue calling ListSigningJobs with your maxResults parameter and with new values that code signing returns in the nextToken parameter until all of your signing jobs have been returned.

``` swift
public func listSigningJobs(input: ListSigningJobsInput, completion: @escaping (ClientRuntime.SdkResult<ListSigningJobsOutputResponse, ListSigningJobsOutputError>) -> Void)
```

### `listSigningPlatforms(input:completion:)`

Lists all signing platforms available in code signing that match the request parameters. If additional jobs remain to be listed, code signing returns a nextToken value. Use this value in subsequent calls to ListSigningJobs to fetch the remaining values. You can continue calling ListSigningJobs with your maxResults parameter and with new values that code signing returns in the nextToken parameter until all of your signing jobs have been returned.

``` swift
public func listSigningPlatforms(input: ListSigningPlatformsInput, completion: @escaping (ClientRuntime.SdkResult<ListSigningPlatformsOutputResponse, ListSigningPlatformsOutputError>) -> Void)
```

### `listSigningProfiles(input:completion:)`

Lists all available signing profiles in your AWS account. Returns only profiles with an ACTIVE status unless the includeCanceled request field is set to true. If additional jobs remain to be listed, code signing returns a nextToken value. Use this value in subsequent calls to ListSigningJobs to fetch the remaining values. You can continue calling ListSigningJobs with your maxResults parameter and with new values that code signing returns in the nextToken parameter until all of your signing jobs have been returned.

``` swift
public func listSigningProfiles(input: ListSigningProfilesInput, completion: @escaping (ClientRuntime.SdkResult<ListSigningProfilesOutputResponse, ListSigningProfilesOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Returns a list of the tags associated with a signing profile resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `putSigningProfile(input:completion:)`

Creates a signing profile. A signing profile is a code signing template that can be used to carry out a pre-defined signing job. For more information, see <http://docs.aws.amazon.com/signer/latest/developerguide/gs-profile.html>

``` swift
public func putSigningProfile(input: PutSigningProfileInput, completion: @escaping (ClientRuntime.SdkResult<PutSigningProfileOutputResponse, PutSigningProfileOutputError>) -> Void)
```

### `removeProfilePermission(input:completion:)`

Removes cross-account permissions from a signing profile.

``` swift
public func removeProfilePermission(input: RemoveProfilePermissionInput, completion: @escaping (ClientRuntime.SdkResult<RemoveProfilePermissionOutputResponse, RemoveProfilePermissionOutputError>) -> Void)
```

### `revokeSignature(input:completion:)`

Changes the state of a signing job to REVOKED. This indicates that the signature is no longer valid.

``` swift
public func revokeSignature(input: RevokeSignatureInput, completion: @escaping (ClientRuntime.SdkResult<RevokeSignatureOutputResponse, RevokeSignatureOutputError>) -> Void)
```

### `revokeSigningProfile(input:completion:)`

Changes the state of a signing profile to REVOKED. This indicates that signatures generated using the signing profile after an effective start date are no longer valid.

``` swift
public func revokeSigningProfile(input: RevokeSigningProfileInput, completion: @escaping (ClientRuntime.SdkResult<RevokeSigningProfileOutputResponse, RevokeSigningProfileOutputError>) -> Void)
```

### `startSigningJob(input:completion:)`

Initiates a signing job to be performed on the code provided. Signing jobs are viewable by the ListSigningJobs operation for two years after they are performed. Note the following requirements:

``` swift
public func startSigningJob(input: StartSigningJobInput, completion: @escaping (ClientRuntime.SdkResult<StartSigningJobOutputResponse, StartSigningJobOutputError>) -> Void)
```

  - You must create an Amazon S3 source bucket. For more information, see [Create a Bucket](http://docs.aws.amazon.com/AmazonS3/latest/gsg/CreatingABucket.html) in the Amazon S3 Getting Started Guide.

  - Your S3 source bucket must be version enabled.

  - You must create an S3 destination bucket. Code signing uses your S3 destination bucket to write your signed code.

  - You specify the name of the source and destination buckets when calling the StartSigningJob operation.

  - You must also specify a request token that identifies your request to code signing.

You can call the \[DescribeSigningJob\] and the \[ListSigningJobs\] actions after you call StartSigningJob. For a Java example that shows how to use this action, see <http://docs.aws.amazon.com/acm/latest/userguide/>

### `tagResource(input:completion:)`

Adds one or more tags to a signing profile. Tags are labels that you can use to identify and organize your AWS resources. Each tag consists of a key and an optional value. To specify the signing profile, use its Amazon Resource Name (ARN). To specify the tag, use a key-value pair.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes one or more tags from a signing profile. To remove the tags, specify a list of tag keys.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```
