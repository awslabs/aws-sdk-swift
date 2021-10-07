# CreateApiKeyInputURLPathMiddleware

``` swift
public struct CreateApiKeyInputURLPathMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = CreateApiKeyInput
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<CreateApiKeyOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<CreateApiKeyOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "CreateApiKeyInputURLPathMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: CreateApiKeyInput,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<CreateApiKeyOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
