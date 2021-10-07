# GetUsagePlanKeysInputURLPathMiddleware

``` swift
public struct GetUsagePlanKeysInputURLPathMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = GetUsagePlanKeysInput
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<GetUsagePlanKeysOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<GetUsagePlanKeysOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "GetUsagePlanKeysInputURLPathMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: GetUsagePlanKeysInput,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<GetUsagePlanKeysOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
