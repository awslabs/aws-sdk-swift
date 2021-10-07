# ApiGatewayClientTypes.Deployment

An immutable representation of a RestApi resource that can be called by users using Stages. A deployment must be associated with a Stage for it to be callable over the Internet.

<div class="remarks">To create a deployment, call POST on the Deployments resource of a RestApi.
To view, update, or delete a deployment, call GET, PATCH, or DELETE on the specified deployment resource (/restapis/{restapi\_id}/deployments/{deployment\_id}).</div>
<div class="seeAlso">RestApi, Deployments, Stage,
<a href="https:​//docs.aws.amazon.com/cli/latest/reference/apigateway/get-deployment.html">AWS CLI,
<a href="https:​//aws.amazon.com/tools/">AWS SDKs
</div>

``` swift
public struct Deployment: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.Codable`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(from:)`

``` swift
public init (from decoder: Swift.Decoder) throws 
```

### `init(apiSummary:createdDate:description:id:)`

``` swift
public init (
            apiSummary: [Swift.String:[Swift.String:ApiGatewayClientTypes.MethodSnapshot]]? = nil,
            createdDate: ClientRuntime.Date? = nil,
            description: Swift.String? = nil,
            id: Swift.String? = nil
        )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `apiSummary`

A summary of the RestApi at the date and time that the deployment resource was created.

``` swift
public var apiSummary: [Swift.String:[Swift.String:ApiGatewayClientTypes.MethodSnapshot]]?
```

### `createdDate`

The date and time that the deployment resource was created.

``` swift
public var createdDate: ClientRuntime.Date?
```

### `description`

The description for the deployment resource.

``` swift
public var description: Swift.String?
```

### `id`

The identifier for the deployment resource.

``` swift
public var id: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
