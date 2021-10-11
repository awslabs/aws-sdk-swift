# KinesisAnalyticsClientLogHandlerFactory

``` swift
public struct KinesisAnalyticsClientLogHandlerFactory: ClientRuntime.SDKLogHandlerFactory 
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
public var label = "KinesisAnalyticsClient"
```

## Methods

### `construct(label:)`

``` swift
public func construct(label: String) -> LogHandler 
```
