# GetBasePathMappingInputURLPathMiddleware

``` swift
public struct GetBasePathMappingInputURLPathMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = GetBasePathMappingInput
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<GetBasePathMappingOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<GetBasePathMappingOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "GetBasePathMappingInputURLPathMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: GetBasePathMappingInput,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<GetBasePathMappingOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
