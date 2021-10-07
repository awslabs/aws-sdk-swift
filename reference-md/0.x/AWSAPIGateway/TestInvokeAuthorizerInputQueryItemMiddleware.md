# TestInvokeAuthorizerInputQueryItemMiddleware

``` swift
public struct TestInvokeAuthorizerInputQueryItemMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = ClientRuntime.SerializeStepInput<TestInvokeAuthorizerInput>
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<TestInvokeAuthorizerOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<TestInvokeAuthorizerOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "TestInvokeAuthorizerInputQueryItemMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: ClientRuntime.SerializeStepInput<TestInvokeAuthorizerInput>,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<TestInvokeAuthorizerOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
