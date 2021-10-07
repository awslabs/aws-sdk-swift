# FlushStageAuthorizersCacheInputURLPathMiddleware

``` swift
public struct FlushStageAuthorizersCacheInputURLPathMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = FlushStageAuthorizersCacheInput
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<FlushStageAuthorizersCacheOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<FlushStageAuthorizersCacheOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "FlushStageAuthorizersCacheInputURLPathMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: FlushStageAuthorizersCacheInput,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<FlushStageAuthorizersCacheOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
