# TestInvokeMethodInputURLPathMiddleware

``` swift
public struct TestInvokeMethodInputURLPathMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = TestInvokeMethodInput
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<TestInvokeMethodOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<TestInvokeMethodOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "TestInvokeMethodInputURLPathMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: TestInvokeMethodInput,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<TestInvokeMethodOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
