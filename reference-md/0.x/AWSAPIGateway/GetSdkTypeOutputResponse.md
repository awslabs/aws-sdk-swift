# GetSdkTypeOutputResponse

A type of SDK that API Gateway can generate.

``` swift
public struct GetSdkTypeOutputResponse: Swift.Equatable 
```

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(configurationProperties:description:friendlyName:id:)`

``` swift
public init (
        configurationProperties: [ApiGatewayClientTypes.SdkConfigurationProperty]? = nil,
        description: Swift.String? = nil,
        friendlyName: Swift.String? = nil,
        id: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `configurationProperties`

A list of configuration properties of an SdkType.

``` swift
public var configurationProperties: [ApiGatewayClientTypes.SdkConfigurationProperty]?
```

### `description`

The description of an SdkType.

``` swift
public var description: Swift.String?
```

### `friendlyName`

The user-friendly name of an SdkType instance.

``` swift
public var friendlyName: Swift.String?
```

### `id`

The identifier of an SdkType instance.

``` swift
public var id: Swift.String?
```
