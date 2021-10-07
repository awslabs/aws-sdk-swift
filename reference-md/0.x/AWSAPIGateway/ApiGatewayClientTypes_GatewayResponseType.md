# ApiGatewayClientTypes.GatewayResponseType

``` swift
public enum GatewayResponseType: Swift.Equatable, Swift.RawRepresentable, Swift.CaseIterable, Swift.Codable, Swift.Hashable 
```

## Inheritance

`Swift.CaseIterable`, `Swift.Codable`, `Swift.Equatable`, `Swift.Hashable`, `Swift.RawRepresentable`

## Initializers

### `init?(rawValue:)`

``` swift
public init?(rawValue: Swift.String) 
```

### `init(from:)`

``` swift
public init(from decoder: Swift.Decoder) throws 
```

## Enumeration Cases

### `accessDenied`

``` swift
case accessDenied
```

### `apiConfigurationError`

``` swift
case apiConfigurationError
```

### `authorizerConfigurationError`

``` swift
case authorizerConfigurationError
```

### `authorizerFailure`

``` swift
case authorizerFailure
```

### `badRequestBody`

``` swift
case badRequestBody
```

### `badRequestParameters`

``` swift
case badRequestParameters
```

### `default4xx`

``` swift
case default4xx
```

### `default5xx`

``` swift
case default5xx
```

### `expiredToken`

``` swift
case expiredToken
```

### `integrationFailure`

``` swift
case integrationFailure
```

### `integrationTimeout`

``` swift
case integrationTimeout
```

### `invalidApiKey`

``` swift
case invalidApiKey
```

### `invalidSignature`

``` swift
case invalidSignature
```

### `missingAuthenticationToken`

``` swift
case missingAuthenticationToken
```

### `quotaExceeded`

``` swift
case quotaExceeded
```

### `requestTooLarge`

``` swift
case requestTooLarge
```

### `resourceNotFound`

``` swift
case resourceNotFound
```

### `throttled`

``` swift
case throttled
```

### `unauthorized`

``` swift
case unauthorized
```

### `unsupportedMediaType`

``` swift
case unsupportedMediaType
```

### `wafFiltered`

``` swift
case wafFiltered
```

### `sdkUnknown`

``` swift
case sdkUnknown(Swift.String)
```

## Properties

### `allCases`

``` swift
public static var allCases: [GatewayResponseType] 
```

### `rawValue`

``` swift
public var rawValue: Swift.String 
```
