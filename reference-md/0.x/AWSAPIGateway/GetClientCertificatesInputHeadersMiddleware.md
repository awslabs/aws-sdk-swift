# GetClientCertificatesInputHeadersMiddleware

``` swift
public struct GetClientCertificatesInputHeadersMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = ClientRuntime.SerializeStepInput<GetClientCertificatesInput>
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<GetClientCertificatesOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<GetClientCertificatesOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "GetClientCertificatesInputHeadersMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: ClientRuntime.SerializeStepInput<GetClientCertificatesInput>,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<GetClientCertificatesOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
