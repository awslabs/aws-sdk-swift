# UpdateUsageOutputResponse

Represents the usage data of a usage plan.

<div class="remarks"></div>
<div class="seeAlso">
<a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-api-usage-plans.html">Create and Use Usage Plans,
<a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-create-usage-plans-with-console.html#api-gateway-usage-plan-manage-usage">Manage Usage in a Usage Plan
</div>

``` swift
public struct UpdateUsageOutputResponse: Swift.Equatable 
```

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(endDate:items:position:startDate:usagePlanId:)`

``` swift
public init (
        endDate: Swift.String? = nil,
        items: [Swift.String:[[Swift.Int]]]? = nil,
        position: Swift.String? = nil,
        startDate: Swift.String? = nil,
        usagePlanId: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `endDate`

The ending date of the usage data.

``` swift
public var endDate: Swift.String?
```

### `items`

The usage data, as daily logs of used and remaining quotas, over the specified time interval indexed over the API keys in a usage plan. For example, {..., "values" :​ { "{api\_key}" :​ \[ \[0, 100\], \[10, 90\], \[100, 10\]\]}, where {api\_key} stands for an API key value and the daily log entry is of the format \[used quota, remaining quota\].

``` swift
public var items: [Swift.String:[[Swift.Int]]]?
```

### `position`

The current pagination position in the paged result set.

``` swift
public var position: Swift.String?
```

### `startDate`

The starting date of the usage data.

``` swift
public var startDate: Swift.String?
```

### `usagePlanId`

The plan Id associated with this usage data.

``` swift
public var usagePlanId: Swift.String?
```
