# CreateDocumentationPartInputURLPathMiddleware

``` swift
public struct CreateDocumentationPartInputURLPathMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = CreateDocumentationPartInput
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<CreateDocumentationPartOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<CreateDocumentationPartOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "CreateDocumentationPartInputURLPathMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: CreateDocumentationPartInput,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<CreateDocumentationPartOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
