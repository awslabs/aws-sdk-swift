# CreateModelInputURLPathMiddleware

``` swift
public struct CreateModelInputURLPathMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = CreateModelInput
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<CreateModelOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<CreateModelOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "CreateModelInputURLPathMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: CreateModelInput,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<CreateModelOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
