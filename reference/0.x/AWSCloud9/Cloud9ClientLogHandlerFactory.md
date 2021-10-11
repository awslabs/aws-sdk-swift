# Cloud9ClientLogHandlerFactory

``` swift
public struct Cloud9ClientLogHandlerFactory: ClientRuntime.SDKLogHandlerFactory 
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
public var label = "Cloud9Client"
```

## Methods

### `construct(label:)`

``` swift
public func construct(label: String) -> LogHandler 
```
