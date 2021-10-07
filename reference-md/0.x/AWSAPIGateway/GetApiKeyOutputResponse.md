# GetApiKeyOutputResponse

A resource that can be distributed to callers for executing Method resources that require an API key. API keys can be mapped to any Stage on any RestApi, which indicates that the callers with the API key can make requests to that stage.

<div class="seeAlso">
<a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/how-to-api-keys.html">Use API Keys
</div>

``` swift
public struct GetApiKeyOutputResponse: Swift.Equatable 
```

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(createdDate:customerId:description:enabled:id:lastUpdatedDate:name:stageKeys:tags:value:)`

``` swift
public init (
        createdDate: ClientRuntime.Date? = nil,
        customerId: Swift.String? = nil,
        description: Swift.String? = nil,
        enabled: Swift.Bool = false,
        id: Swift.String? = nil,
        lastUpdatedDate: ClientRuntime.Date? = nil,
        name: Swift.String? = nil,
        stageKeys: [Swift.String]? = nil,
        tags: [Swift.String:Swift.String]? = nil,
        value: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `createdDate`

The timestamp when the API Key was created.

``` swift
public var createdDate: ClientRuntime.Date?
```

### `customerId`

An AWS Marketplace customer identifier , when integrating with the AWS SaaS Marketplace.

``` swift
public var customerId: Swift.String?
```

### `description`

The description of the API Key.

``` swift
public var description: Swift.String?
```

### `enabled`

Specifies whether the API Key can be used by callers.

``` swift
public var enabled: Swift.Bool
```

### `id`

The identifier of the API Key.

``` swift
public var id: Swift.String?
```

### `lastUpdatedDate`

The timestamp when the API Key was last updated.

``` swift
public var lastUpdatedDate: ClientRuntime.Date?
```

### `name`

The name of the API Key.

``` swift
public var name: Swift.String?
```

### `stageKeys`

A list of Stage resources that are associated with the ApiKey resource.

``` swift
public var stageKeys: [Swift.String]?
```

### `tags`

The collection of tags. Each tag element is associated with a given resource.

``` swift
public var tags: [Swift.String:Swift.String]?
```

### `value`

The value of the API Key.

``` swift
public var value: Swift.String?
```
