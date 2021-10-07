# PutMethodResponseInputURLPathMiddleware

``` swift
public struct PutMethodResponseInputURLPathMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = PutMethodResponseInput
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<PutMethodResponseOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<PutMethodResponseOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "PutMethodResponseInputURLPathMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: PutMethodResponseInput,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<PutMethodResponseOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
