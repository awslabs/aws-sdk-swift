# GetDeploymentInput

Requests API Gateway to get information about a Deployment resource.

``` swift
public struct GetDeploymentInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(deploymentId:embed:restApiId:)`

``` swift
public init (
        deploymentId: Swift.String? = nil,
        embed: [Swift.String]? = nil,
        restApiId: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `deploymentId`

\[Required\] The identifier of the Deployment resource to get information about.
This member is required.

``` swift
public var deploymentId: Swift.String?
```

### `embed`

A query parameter to retrieve the specified embedded resources of the returned Deployment resource in the response. In a REST API call, this embed parameter value is a list of comma-separated strings, as in  GET /restapis/{restapi\_id}/deployments/{deployment\_id}?embed=var1,var2. The SDK and other platform-dependent libraries might use a different format for the list. Currently, this request supports only retrieval of the embedded API summary this way. Hence, the parameter value must be a single-valued list containing only the "apisummary" string.  For example, GET /restapis/{restapi\_id}/deployments/{deployment\_id}?embed=apisummary.

``` swift
public var embed: [Swift.String]?
```

### `restApiId`

\[Required\] The string identifier of the associated RestApi.
This member is required.

``` swift
public var restApiId: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
