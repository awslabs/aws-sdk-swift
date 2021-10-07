# DeleteUsagePlanKeyInputURLPathMiddleware

``` swift
public struct DeleteUsagePlanKeyInputURLPathMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = DeleteUsagePlanKeyInput
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<DeleteUsagePlanKeyOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<DeleteUsagePlanKeyOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "DeleteUsagePlanKeyInputURLPathMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: DeleteUsagePlanKeyInput,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<DeleteUsagePlanKeyOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
