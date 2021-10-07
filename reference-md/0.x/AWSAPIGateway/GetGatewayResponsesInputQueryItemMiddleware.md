# GetGatewayResponsesInputQueryItemMiddleware

``` swift
public struct GetGatewayResponsesInputQueryItemMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = ClientRuntime.SerializeStepInput<GetGatewayResponsesInput>
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<GetGatewayResponsesOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<GetGatewayResponsesOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "GetGatewayResponsesInputQueryItemMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: ClientRuntime.SerializeStepInput<GetGatewayResponsesInput>,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<GetGatewayResponsesOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
