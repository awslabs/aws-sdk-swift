# FlushStageAuthorizersCacheInputHeadersMiddleware

``` swift
public struct FlushStageAuthorizersCacheInputHeadersMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = ClientRuntime.SerializeStepInput<FlushStageAuthorizersCacheInput>
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
public let id: Swift.String = "FlushStageAuthorizersCacheInputHeadersMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: ClientRuntime.SerializeStepInput<FlushStageAuthorizersCacheInput>,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<FlushStageAuthorizersCacheOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
