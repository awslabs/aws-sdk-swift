# FlushStageCacheInputURLPathMiddleware

``` swift
public struct FlushStageCacheInputURLPathMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = FlushStageCacheInput
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<FlushStageCacheOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<FlushStageCacheOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "FlushStageCacheInputURLPathMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: FlushStageCacheInput,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<FlushStageCacheOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
