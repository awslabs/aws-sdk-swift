# DeleteGatewayResponseInputQueryItemMiddleware

``` swift
public struct DeleteGatewayResponseInputQueryItemMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = ClientRuntime.SerializeStepInput<DeleteGatewayResponseInput>
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<DeleteGatewayResponseOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<DeleteGatewayResponseOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "DeleteGatewayResponseInputQueryItemMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: ClientRuntime.SerializeStepInput<DeleteGatewayResponseInput>,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<DeleteGatewayResponseOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
