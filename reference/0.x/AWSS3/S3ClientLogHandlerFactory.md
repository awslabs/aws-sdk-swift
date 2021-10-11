# S3ClientLogHandlerFactory

``` swift
public struct S3ClientLogHandlerFactory: ClientRuntime.SDKLogHandlerFactory 
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
public var label = "S3Client"
```

## Methods

### `construct(label:)`

``` swift
public func construct(label: String) -> LogHandler 
```
