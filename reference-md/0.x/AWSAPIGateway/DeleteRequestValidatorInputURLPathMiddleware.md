# DeleteRequestValidatorInputURLPathMiddleware

``` swift
public struct DeleteRequestValidatorInputURLPathMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = DeleteRequestValidatorInput
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<DeleteRequestValidatorOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<DeleteRequestValidatorOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "DeleteRequestValidatorInputURLPathMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: DeleteRequestValidatorInput,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<DeleteRequestValidatorOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
