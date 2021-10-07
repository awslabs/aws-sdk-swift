# CreateDocumentationVersionInputBodyMiddleware

``` swift
public struct CreateDocumentationVersionInputBodyMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = ClientRuntime.SerializeStepInput<CreateDocumentationVersionInput>
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<CreateDocumentationVersionOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<CreateDocumentationVersionOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "CreateDocumentationVersionInputBodyMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: ClientRuntime.SerializeStepInput<CreateDocumentationVersionInput>,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<CreateDocumentationVersionOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
