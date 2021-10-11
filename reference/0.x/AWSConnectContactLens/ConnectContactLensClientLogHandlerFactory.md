# ConnectContactLensClientLogHandlerFactory

``` swift
public struct ConnectContactLensClientLogHandlerFactory: ClientRuntime.SDKLogHandlerFactory 
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
public var label = "ConnectContactLensClient"
```

## Methods

### `construct(label:)`

``` swift
public func construct(label: String) -> LogHandler 
```
