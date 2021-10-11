# CloudHsmV2ClientLogHandlerFactory

``` swift
public struct CloudHsmV2ClientLogHandlerFactory: ClientRuntime.SDKLogHandlerFactory 
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
public var label = "CloudHsmV2Client"
```

## Methods

### `construct(label:)`

``` swift
public func construct(label: String) -> LogHandler 
```
