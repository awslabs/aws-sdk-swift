# Route53ClientLogHandlerFactory

``` swift
public struct Route53ClientLogHandlerFactory: ClientRuntime.SDKLogHandlerFactory 
```

## Inheritance

`ClientRuntime.SDKLogHandlerFactory`

## Initializers

### `init(logLevel:)`

``` swift
public init(logLevel: ClientRuntime.SDKLogLevel) 
```

## Properties

### `label`

``` swift
public var label = "Route53Client"
```

## Methods

### `construct(label:)`

``` swift
public func construct(label: String) -> LogHandler 
```
