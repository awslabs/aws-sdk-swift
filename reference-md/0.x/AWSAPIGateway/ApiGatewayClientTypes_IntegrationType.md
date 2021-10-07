# ApiGatewayClientTypes.IntegrationType

The integration type. The valid value is HTTP for integrating an API method with an HTTP backend; AWS with any AWS service endpoints; MOCK for testing without actually invoking the backend; HTTP\_PROXY for integrating with the HTTP proxy integration; AWS\_PROXY for integrating with the Lambda proxy integration.

``` swift
public enum IntegrationType: Swift.Equatable, Swift.RawRepresentable, Swift.CaseIterable, Swift.Codable, Swift.Hashable 
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

### `aws`

``` swift
case aws
```

### `awsProxy`

``` swift
case awsProxy
```

### `http`

``` swift
case http
```

### `httpProxy`

``` swift
case httpProxy
```

### `mock`

``` swift
case mock
```

### `sdkUnknown`

``` swift
case sdkUnknown(Swift.String)
```

## Properties

### `allCases`

``` swift
public static var allCases: [IntegrationType] 
```

### `rawValue`

``` swift
public var rawValue: Swift.String 
```
