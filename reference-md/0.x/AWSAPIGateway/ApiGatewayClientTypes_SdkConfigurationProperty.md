# ApiGatewayClientTypes.SdkConfigurationProperty

A configuration property of an SDK type.

``` swift
public struct SdkConfigurationProperty: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.Codable`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(from:)`

``` swift
public init (from decoder: Swift.Decoder) throws 
```

### ``init(`required`:defaultValue:description:friendlyName:name:)``

``` swift
public init (
            `required`: Swift.Bool = false,
            defaultValue: Swift.String? = nil,
            description: Swift.String? = nil,
            friendlyName: Swift.String? = nil,
            name: Swift.String? = nil
        )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `` `required` ``

A boolean flag of an SdkType configuration property to indicate if the associated SDK configuration property is required (true) or not (false).

``` swift
public var `required`: Swift.Bool
```

### `defaultValue`

The default value of an SdkType configuration property.

``` swift
public var defaultValue: Swift.String?
```

### `description`

The description of an SdkType configuration property.

``` swift
public var description: Swift.String?
```

### `friendlyName`

The user-friendly name of an SdkType configuration property.

``` swift
public var friendlyName: Swift.String?
```

### `name`

The name of a an SdkType configuration property.

``` swift
public var name: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
