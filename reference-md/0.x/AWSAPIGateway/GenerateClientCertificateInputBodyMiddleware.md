# GenerateClientCertificateInputBodyMiddleware

``` swift
public struct GenerateClientCertificateInputBodyMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = ClientRuntime.SerializeStepInput<GenerateClientCertificateInput>
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<GenerateClientCertificateOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<GenerateClientCertificateOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "GenerateClientCertificateInputBodyMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: ClientRuntime.SerializeStepInput<GenerateClientCertificateInput>,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<GenerateClientCertificateOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
