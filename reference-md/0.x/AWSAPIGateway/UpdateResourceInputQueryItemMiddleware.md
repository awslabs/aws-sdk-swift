# UpdateResourceInputQueryItemMiddleware

``` swift
public struct UpdateResourceInputQueryItemMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = ClientRuntime.SerializeStepInput<UpdateResourceInput>
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<UpdateResourceOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<UpdateResourceOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "UpdateResourceInputQueryItemMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: ClientRuntime.SerializeStepInput<UpdateResourceInput>,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<UpdateResourceOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
