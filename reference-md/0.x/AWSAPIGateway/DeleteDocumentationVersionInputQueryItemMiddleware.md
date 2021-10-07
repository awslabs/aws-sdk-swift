# DeleteDocumentationVersionInputQueryItemMiddleware

``` swift
public struct DeleteDocumentationVersionInputQueryItemMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = ClientRuntime.SerializeStepInput<DeleteDocumentationVersionInput>
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<DeleteDocumentationVersionOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<DeleteDocumentationVersionOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "DeleteDocumentationVersionInputQueryItemMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: ClientRuntime.SerializeStepInput<DeleteDocumentationVersionInput>,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<DeleteDocumentationVersionOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
