# ApiGatewayClientTypes.DocumentationPartType

``` swift
public enum DocumentationPartType: Swift.Equatable, Swift.RawRepresentable, Swift.CaseIterable, Swift.Codable, Swift.Hashable 
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

### `api`

``` swift
case api
```

### `authorizer`

``` swift
case authorizer
```

### `method`

``` swift
case method
```

### `model`

``` swift
case model
```

### `pathParameter`

``` swift
case pathParameter
```

### `queryParameter`

``` swift
case queryParameter
```

### `requestBody`

``` swift
case requestBody
```

### `requestHeader`

``` swift
case requestHeader
```

### `resource`

``` swift
case resource
```

### `response`

``` swift
case response
```

### `responseBody`

``` swift
case responseBody
```

### `responseHeader`

``` swift
case responseHeader
```

### `sdkUnknown`

``` swift
case sdkUnknown(Swift.String)
```

## Properties

### `allCases`

``` swift
public static var allCases: [DocumentationPartType] 
```

### `rawValue`

``` swift
public var rawValue: Swift.String 
```
