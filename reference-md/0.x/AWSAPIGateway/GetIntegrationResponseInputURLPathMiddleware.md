# GetIntegrationResponseInputURLPathMiddleware

``` swift
public struct GetIntegrationResponseInputURLPathMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = GetIntegrationResponseInput
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<GetIntegrationResponseOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<GetIntegrationResponseOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "GetIntegrationResponseInputURLPathMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: GetIntegrationResponseInput,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<GetIntegrationResponseOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
