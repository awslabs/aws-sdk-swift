# CreateUsagePlanOutputResponse

Represents a usage plan than can specify who can assess associated API stages with specified request limits and quotas.

<div class="remarks">
In a usage plan, you associate an API by specifying the API's Id and a stage name of the specified API. You add plan customers by adding API keys to the plan.
</div>
<div class="seeAlso">
<a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-api-usage-plans.html">Create and Use Usage Plans
</div>

``` swift
public struct CreateUsagePlanOutputResponse: Swift.Equatable 
```

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(apiStages:description:id:name:productCode:quota:tags:throttle:)`

``` swift
public init (
        apiStages: [ApiGatewayClientTypes.ApiStage]? = nil,
        description: Swift.String? = nil,
        id: Swift.String? = nil,
        name: Swift.String? = nil,
        productCode: Swift.String? = nil,
        quota: ApiGatewayClientTypes.QuotaSettings? = nil,
        tags: [Swift.String:Swift.String]? = nil,
        throttle: ApiGatewayClientTypes.ThrottleSettings? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `apiStages`

The associated API stages of a usage plan.

``` swift
public var apiStages: [ApiGatewayClientTypes.ApiStage]?
```

### `description`

The description of a usage plan.

``` swift
public var description: Swift.String?
```

### `id`

The identifier of a UsagePlan resource.

``` swift
public var id: Swift.String?
```

### `name`

The name of a usage plan.

``` swift
public var name: Swift.String?
```

### `productCode`

The AWS Markeplace product identifier to associate with the usage plan as a SaaS product on AWS Marketplace.

``` swift
public var productCode: Swift.String?
```

### `quota`

The maximum number of permitted requests per a given unit time interval.

``` swift
public var quota: ApiGatewayClientTypes.QuotaSettings?
```

### `tags`

The collection of tags. Each tag element is associated with a given resource.

``` swift
public var tags: [Swift.String:Swift.String]?
```

### `throttle`

The request throttle limits of a usage plan.

``` swift
public var throttle: ApiGatewayClientTypes.ThrottleSettings?
```
