# UpdateMethodResponseInputURLPathMiddleware

``` swift
public struct UpdateMethodResponseInputURLPathMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = UpdateMethodResponseInput
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<UpdateMethodResponseOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<UpdateMethodResponseOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "UpdateMethodResponseInputURLPathMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: UpdateMethodResponseInput,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<UpdateMethodResponseOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
