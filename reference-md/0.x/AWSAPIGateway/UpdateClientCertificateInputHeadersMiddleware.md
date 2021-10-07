# UpdateClientCertificateInputHeadersMiddleware

``` swift
public struct UpdateClientCertificateInputHeadersMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = ClientRuntime.SerializeStepInput<UpdateClientCertificateInput>
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
public let id: Swift.String = "UpdateClientCertificateInputHeadersMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: ClientRuntime.SerializeStepInput<UpdateClientCertificateInput>,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<UpdateClientCertificateOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
