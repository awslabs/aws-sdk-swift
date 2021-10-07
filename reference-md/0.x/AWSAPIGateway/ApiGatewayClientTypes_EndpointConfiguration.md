# ApiGatewayClientTypes.EndpointConfiguration

The endpoint configuration to indicate the types of endpoints an API (RestApi) or its custom domain name (DomainName) has.

``` swift
public struct EndpointConfiguration: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.Codable`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(from:)`

``` swift
public init (from decoder: Swift.Decoder) throws 
```

### `init(types:vpcEndpointIds:)`

``` swift
public init (
            types: [ApiGatewayClientTypes.EndpointType]? = nil,
            vpcEndpointIds: [Swift.String]? = nil
        )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `types`

A list of endpoint types of an API (RestApi) or its custom domain name (DomainName). For an edge-optimized API and its custom domain name, the endpoint type is "EDGE". For a regional API and its custom domain name, the endpoint type is REGIONAL. For a private API, the endpoint type is PRIVATE.

``` swift
public var types: [ApiGatewayClientTypes.EndpointType]?
```

### `vpcEndpointIds`

A list of VpcEndpointIds of an API (RestApi) against which to create Route53 ALIASes. It is only supported for PRIVATE endpoint type.

``` swift
public var vpcEndpointIds: [Swift.String]?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
