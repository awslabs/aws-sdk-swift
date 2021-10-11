# S3OutpostsClientProtocol

Amazon S3 on Outposts provides access to S3 on Outposts operations.

``` swift
public protocol S3OutpostsClientProtocol 
```

## Requirements

### createEndpoint(input:​completion:​)

Amazon S3 on Outposts Access Points simplify managing data access at scale for shared datasets in S3 on Outposts.
S3 on Outposts uses endpoints to connect to Outposts buckets so that you can perform actions within your
virtual private cloud (VPC). For more information, see <a href="https:​//docs.aws.amazon.com/AmazonS3/latest/userguide/AccessingS3Outposts.html">
Accessing S3 on Outposts using VPC only access points.
This action creates an endpoint and associates it with the specified Outposts.

``` swift
func createEndpoint(input: CreateEndpointInput, completion: @escaping (ClientRuntime.SdkResult<CreateEndpointOutputResponse, CreateEndpointOutputError>) -> Void)
```

``` 
        It can take up to 5 minutes for this action to complete.


    Related actions include:



              <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_s3outposts_DeleteEndpoint.html">DeleteEndpoint




              <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_s3outposts_ListEndpoints.html">ListEndpoints
```

### deleteEndpoint(input:​completion:​)

Amazon S3 on Outposts Access Points simplify managing data access at scale for shared datasets in S3 on Outposts.
S3 on Outposts uses endpoints to connect to Outposts buckets so that you can perform actions within your
virtual private cloud (VPC). For more information, see <a href="https:​//docs.aws.amazon.com/AmazonS3/latest/userguide/AccessingS3Outposts.html">
Accessing S3 on Outposts using VPC only access points.
This action deletes an endpoint.

``` swift
func deleteEndpoint(input: DeleteEndpointInput, completion: @escaping (ClientRuntime.SdkResult<DeleteEndpointOutputResponse, DeleteEndpointOutputError>) -> Void)
```

``` 
        It can take up to 5 minutes for this action to complete.


    Related actions include:



              <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_s3outposts_CreateEndpoint.html">CreateEndpoint




              <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_s3outposts_ListEndpoints.html">ListEndpoints
```

### listEndpoints(input:​completion:​)

Amazon S3 on Outposts Access Points simplify managing data access at scale for shared datasets in S3 on Outposts.
S3 on Outposts uses endpoints to connect to Outposts buckets so that you can perform actions within your
virtual private cloud (VPC). For more information, see <a href="https:​//docs.aws.amazon.com/AmazonS3/latest/userguide/AccessingS3Outposts.html">
Accessing S3 on Outposts using VPC only access points.
This action lists endpoints associated with the Outposts.

``` swift
func listEndpoints(input: ListEndpointsInput, completion: @escaping (ClientRuntime.SdkResult<ListEndpointsOutputResponse, ListEndpointsOutputError>) -> Void)
```

``` 
    Related actions include:



              <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_s3outposts_CreateEndpoint.html">CreateEndpoint




              <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_s3outposts_DeleteEndpoint.html">DeleteEndpoint
```
