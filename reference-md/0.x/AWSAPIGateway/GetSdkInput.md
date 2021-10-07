# GetSdkInput

Request a new generated client SDK for a RestApi and Stage.

``` swift
public struct GetSdkInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(parameters:restApiId:sdkType:stageName:)`

``` swift
public init (
        parameters: [Swift.String:Swift.String]? = nil,
        restApiId: Swift.String? = nil,
        sdkType: Swift.String? = nil,
        stageName: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `parameters`

A string-to-string key-value map of query parameters sdkType-dependent properties of the SDK. For sdkType of objectivec or swift,  a parameter named classPrefix is required. For sdkType of android, parameters named groupId, artifactId, artifactVersion, and invokerPackage are required. For sdkType of java, parameters named serviceName and javaPackageName are required.

``` swift
public var parameters: [Swift.String:Swift.String]?
```

### `restApiId`

\[Required\] The string identifier of the associated RestApi.
This member is required.

``` swift
public var restApiId: Swift.String?
```

### `sdkType`

\[Required\] The language for the generated SDK. Currently java, javascript, android, objectivec (for iOS), swift (for iOS), and ruby  are supported.
This member is required.

``` swift
public var sdkType: Swift.String?
```

### `stageName`

\[Required\] The name of the Stage that the SDK will use.
This member is required.

``` swift
public var stageName: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
