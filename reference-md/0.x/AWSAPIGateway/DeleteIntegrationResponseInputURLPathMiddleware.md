# DeleteIntegrationResponseInputURLPathMiddleware

``` swift
public struct DeleteIntegrationResponseInputURLPathMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = DeleteIntegrationResponseInput
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<DeleteIntegrationResponseOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<DeleteIntegrationResponseOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "DeleteIntegrationResponseInputURLPathMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: DeleteIntegrationResponseInput,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<DeleteIntegrationResponseOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
