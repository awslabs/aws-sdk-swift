# UpdateRequestValidatorInputQueryItemMiddleware

``` swift
public struct UpdateRequestValidatorInputQueryItemMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = ClientRuntime.SerializeStepInput<UpdateRequestValidatorInput>
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<UpdateRequestValidatorOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<UpdateRequestValidatorOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "UpdateRequestValidatorInputQueryItemMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: ClientRuntime.SerializeStepInput<UpdateRequestValidatorInput>,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<UpdateRequestValidatorOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
