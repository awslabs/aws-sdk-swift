# UpdateBasePathMappingInputURLPathMiddleware

``` swift
public struct UpdateBasePathMappingInputURLPathMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = UpdateBasePathMappingInput
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<UpdateBasePathMappingOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<UpdateBasePathMappingOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "UpdateBasePathMappingInputURLPathMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: UpdateBasePathMappingInput,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<UpdateBasePathMappingOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
