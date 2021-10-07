# UpdateIntegrationInputURLPathMiddleware

``` swift
public struct UpdateIntegrationInputURLPathMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = UpdateIntegrationInput
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<UpdateIntegrationOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<UpdateIntegrationOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "UpdateIntegrationInputURLPathMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: UpdateIntegrationInput,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<UpdateIntegrationOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
