# CreateAuthorizerInputBodyMiddleware

``` swift
public struct CreateAuthorizerInputBodyMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = ClientRuntime.SerializeStepInput<CreateAuthorizerInput>
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<CreateAuthorizerOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<CreateAuthorizerOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "CreateAuthorizerInputBodyMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: ClientRuntime.SerializeStepInput<CreateAuthorizerInput>,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<CreateAuthorizerOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
