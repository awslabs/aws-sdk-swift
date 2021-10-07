# GetBasePathMappingsInputURLPathMiddleware

``` swift
public struct GetBasePathMappingsInputURLPathMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = GetBasePathMappingsInput
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<GetBasePathMappingsOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<GetBasePathMappingsOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "GetBasePathMappingsInputURLPathMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: GetBasePathMappingsInput,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<GetBasePathMappingsOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
