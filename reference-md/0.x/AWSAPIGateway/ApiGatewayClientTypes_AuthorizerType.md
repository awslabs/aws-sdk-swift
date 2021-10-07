# ApiGatewayClientTypes.AuthorizerType

The authorizer type. Valid values are TOKEN for a Lambda function using a single authorization token submitted in a custom header, REQUEST for a Lambda function using incoming request parameters, and COGNITO\_USER\_POOLS for using an Amazon Cognito user pool.

``` swift
public enum AuthorizerType: Swift.Equatable, Swift.RawRepresentable, Swift.CaseIterable, Swift.Codable, Swift.Hashable 
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

### `cognitoUserPools`

``` swift
case cognitoUserPools
```

### `request`

``` swift
case request
```

### `token`

``` swift
case token
```

### `sdkUnknown`

``` swift
case sdkUnknown(Swift.String)
```

## Properties

### `allCases`

``` swift
public static var allCases: [AuthorizerType] 
```

### `rawValue`

``` swift
public var rawValue: Swift.String 
```
