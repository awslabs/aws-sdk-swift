# UpdateClientCertificateInputURLPathMiddleware

``` swift
public struct UpdateClientCertificateInputURLPathMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = UpdateClientCertificateInput
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<UpdateClientCertificateOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<UpdateClientCertificateOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "UpdateClientCertificateInputURLPathMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: UpdateClientCertificateInput,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<UpdateClientCertificateOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
