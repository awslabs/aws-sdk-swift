# UpdateRestApiInputHeadersMiddleware

``` swift
public struct UpdateRestApiInputHeadersMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = ClientRuntime.SerializeStepInput<UpdateRestApiInput>
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<UpdateRestApiOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<UpdateRestApiOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "UpdateRestApiInputHeadersMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: ClientRuntime.SerializeStepInput<UpdateRestApiInput>,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<UpdateRestApiOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
