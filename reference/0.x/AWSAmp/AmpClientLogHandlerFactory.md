# AmpClientLogHandlerFactory

``` swift
public struct AmpClientLogHandlerFactory: ClientRuntime.SDKLogHandlerFactory 
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
public var label = "AmpClient"
```

## Methods

### `construct(label:)`

``` swift
public func construct(label: String) -> LogHandler 
```
