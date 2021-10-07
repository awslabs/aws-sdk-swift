# ApiGatewayClientTypes.MethodSetting

Specifies the method setting properties.

``` swift
public struct MethodSetting: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.Codable`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(from:)`

``` swift
public init (from decoder: Swift.Decoder) throws 
```

### `init(cacheDataEncrypted:cacheTtlInSeconds:cachingEnabled:dataTraceEnabled:loggingLevel:metricsEnabled:requireAuthorizationForCacheControl:throttlingBurstLimit:throttlingRateLimit:unauthorizedCacheControlHeaderStrategy:)`

``` swift
public init (
            cacheDataEncrypted: Swift.Bool = false,
            cacheTtlInSeconds: Swift.Int = 0,
            cachingEnabled: Swift.Bool = false,
            dataTraceEnabled: Swift.Bool = false,
            loggingLevel: Swift.String? = nil,
            metricsEnabled: Swift.Bool = false,
            requireAuthorizationForCacheControl: Swift.Bool = false,
            throttlingBurstLimit: Swift.Int = 0,
            throttlingRateLimit: Swift.Double = 0.0,
            unauthorizedCacheControlHeaderStrategy: ApiGatewayClientTypes.UnauthorizedCacheControlHeaderStrategy? = nil
        )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `cacheDataEncrypted`

Specifies whether the cached responses are encrypted. The PATCH path for this setting is /{method\_setting\_key}/caching/dataEncrypted, and the value is a Boolean.

``` swift
public var cacheDataEncrypted: Swift.Bool
```

### `cacheTtlInSeconds`

Specifies the time to live (TTL), in seconds, for cached responses. The higher the TTL, the longer the response will be cached. The PATCH path for this setting is /{method\_setting\_key}/caching/ttlInSeconds, and the value is an integer.

``` swift
public var cacheTtlInSeconds: Swift.Int
```

### `cachingEnabled`

Specifies whether responses should be cached and returned for requests. A cache cluster must be enabled on the stage for responses to be cached. The PATCH path for this setting is /{method\_setting\_key}/caching/enabled, and the value is a Boolean.

``` swift
public var cachingEnabled: Swift.Bool
```

### `dataTraceEnabled`

Specifies whether data trace logging is enabled for this method, which affects the log entries pushed to Amazon CloudWatch Logs. The PATCH path for this setting is /{method\_setting\_key}/logging/dataTrace, and the value is a Boolean.

``` swift
public var dataTraceEnabled: Swift.Bool
```

### `loggingLevel`

Specifies the logging level for this method, which affects the log entries pushed to Amazon CloudWatch Logs. The PATCH path for this setting is /{method\_setting\_key}/logging/loglevel, and the available levels are OFF, ERROR, and INFO. Choose ERROR to write only error-level entries to CloudWatch Logs, or choose INFO to include all ERROR events as well as extra informational events.

``` swift
public var loggingLevel: Swift.String?
```

### `metricsEnabled`

Specifies whether Amazon CloudWatch metrics are enabled for this method. The PATCH path for this setting is /{method\_setting\_key}/metrics/enabled, and the value is a Boolean.

``` swift
public var metricsEnabled: Swift.Bool
```

### `requireAuthorizationForCacheControl`

Specifies whether authorization is required for a cache invalidation request. The PATCH path for this setting is /{method\_setting\_key}/caching/requireAuthorizationForCacheControl, and the value is a Boolean.

``` swift
public var requireAuthorizationForCacheControl: Swift.Bool
```

### `throttlingBurstLimit`

Specifies the throttling burst limit. The PATCH path for this setting is /{method\_setting\_key}/throttling/burstLimit, and the value is an integer.

``` swift
public var throttlingBurstLimit: Swift.Int
```

### `throttlingRateLimit`

Specifies the throttling rate limit. The PATCH path for this setting is /{method\_setting\_key}/throttling/rateLimit, and the value is a double.

``` swift
public var throttlingRateLimit: Swift.Double
```

### `unauthorizedCacheControlHeaderStrategy`

Specifies how to handle unauthorized requests for cache invalidation. The PATCH path for this setting is /{method\_setting\_key}/caching/unauthorizedCacheControlHeaderStrategy, and the available values are FAIL\_WITH\_403, SUCCEED\_WITH\_RESPONSE\_HEADER, SUCCEED\_WITHOUT\_RESPONSE\_HEADER.

``` swift
public var unauthorizedCacheControlHeaderStrategy: ApiGatewayClientTypes.UnauthorizedCacheControlHeaderStrategy?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
