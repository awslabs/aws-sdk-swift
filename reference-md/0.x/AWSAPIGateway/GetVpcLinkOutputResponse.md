# GetVpcLinkOutputResponse

An API Gateway VPC link for a RestApi to access resources in an Amazon Virtual Private Cloud (VPC).

<div class="remarks">
To enable access to a resource in an Amazon Virtual Private Cloud through Amazon API Gateway, you, as an API developer, create a VpcLink resource targeted for one or more network load balancers of the VPC and then integrate an API method with a private integration that uses the VpcLink. The private integration has an integration type of HTTP or HTTP\_PROXY and has a connection type of VPC\_LINK. The integration uses the connectionId property to identify the VpcLink used.
</div>

``` swift
public struct GetVpcLinkOutputResponse: Swift.Equatable 
```

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(description:id:name:status:statusMessage:tags:targetArns:)`

``` swift
public init (
        description: Swift.String? = nil,
        id: Swift.String? = nil,
        name: Swift.String? = nil,
        status: ApiGatewayClientTypes.VpcLinkStatus? = nil,
        statusMessage: Swift.String? = nil,
        tags: [Swift.String:Swift.String]? = nil,
        targetArns: [Swift.String]? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `description`

The description of the VPC link.

``` swift
public var description: Swift.String?
```

### `id`

The identifier of the  VpcLink. It is used in an Integration to reference this VpcLink.

``` swift
public var id: Swift.String?
```

### `name`

The name used to label and identify the VPC link.

``` swift
public var name: Swift.String?
```

### `status`

The status of the VPC link. The valid values are AVAILABLE, PENDING, DELETING, or FAILED. Deploying an API will wait if the status is PENDING and will fail if the status is DELETING.

``` swift
public var status: ApiGatewayClientTypes.VpcLinkStatus?
```

### `statusMessage`

A description about the VPC link status.

``` swift
public var statusMessage: Swift.String?
```

### `tags`

The collection of tags. Each tag element is associated with a given resource.

``` swift
public var tags: [Swift.String:Swift.String]?
```

### `targetArns`

The ARN of the network load balancer of the VPC targeted by the VPC link. The network load balancer must be owned by the same AWS account of the API owner.

``` swift
public var targetArns: [Swift.String]?
```
