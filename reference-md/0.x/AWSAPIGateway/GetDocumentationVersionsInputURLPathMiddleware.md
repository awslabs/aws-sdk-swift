# GetDocumentationVersionsInputURLPathMiddleware

``` swift
public struct GetDocumentationVersionsInputURLPathMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = GetDocumentationVersionsInput
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<GetDocumentationVersionsOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<GetDocumentationVersionsOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "GetDocumentationVersionsInputURLPathMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: GetDocumentationVersionsInput,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<GetDocumentationVersionsOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
