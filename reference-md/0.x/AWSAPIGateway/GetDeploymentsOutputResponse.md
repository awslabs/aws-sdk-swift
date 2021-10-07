# GetDeploymentsOutputResponse

Represents a collection resource that contains zero or more references to your existing deployments, and links that guide you on how to interact with your collection. The collection offers a paginated view of the contained deployments.

<div class="remarks">To create a new deployment of a RestApi, make a POST request against this resource. To view, update, or delete an existing
deployment, make a GET, PATCH, or DELETE request, respectively, on a specified Deployment resource.</div>
<div class="seeAlso">
<a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/how-to-deploy-api.html">Deploying an API,
<a href="https:​//docs.aws.amazon.com/cli/latest/reference/apigateway/get-deployment.html">AWS CLI,
<a href="https:​//aws.amazon.com/tools/">AWS SDKs
</div>

``` swift
public struct GetDeploymentsOutputResponse: Swift.Equatable 
```

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(items:position:)`

``` swift
public init (
        items: [ApiGatewayClientTypes.Deployment]? = nil,
        position: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `items`

The current page of elements from this collection.

``` swift
public var items: [ApiGatewayClientTypes.Deployment]?
```

### `position`

The current pagination position in the paged result set.

``` swift
public var position: Swift.String?
```
