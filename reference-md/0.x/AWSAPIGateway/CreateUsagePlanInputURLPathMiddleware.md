# CreateUsagePlanInputURLPathMiddleware

``` swift
public struct CreateUsagePlanInputURLPathMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = CreateUsagePlanInput
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<CreateUsagePlanOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<CreateUsagePlanOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "CreateUsagePlanInputURLPathMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: CreateUsagePlanInput,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<CreateUsagePlanOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
