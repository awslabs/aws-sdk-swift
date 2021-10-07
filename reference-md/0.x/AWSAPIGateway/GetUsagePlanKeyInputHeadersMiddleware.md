# GetUsagePlanKeyInputHeadersMiddleware

``` swift
public struct GetUsagePlanKeyInputHeadersMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = ClientRuntime.SerializeStepInput<GetUsagePlanKeyInput>
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<GetUsagePlanKeyOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<GetUsagePlanKeyOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "GetUsagePlanKeyInputHeadersMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: ClientRuntime.SerializeStepInput<GetUsagePlanKeyInput>,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<GetUsagePlanKeyOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
