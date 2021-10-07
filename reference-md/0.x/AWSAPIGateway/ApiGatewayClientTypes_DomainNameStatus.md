# ApiGatewayClientTypes.DomainNameStatus

``` swift
public enum DomainNameStatus: Swift.Equatable, Swift.RawRepresentable, Swift.CaseIterable, Swift.Codable, Swift.Hashable 
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

### `available`

``` swift
case available
```

### `pending`

``` swift
case pending
```

### `pendingCertificateReimport`

``` swift
case pendingCertificateReimport
```

### `pendingOwnershipVerification`

``` swift
case pendingOwnershipVerification
```

### `updating`

``` swift
case updating
```

### `sdkUnknown`

``` swift
case sdkUnknown(Swift.String)
```

## Properties

### `allCases`

``` swift
public static var allCases: [DomainNameStatus] 
```

### `rawValue`

``` swift
public var rawValue: Swift.String 
```
