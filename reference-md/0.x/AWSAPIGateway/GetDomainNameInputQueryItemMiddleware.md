# GetDomainNameInputQueryItemMiddleware

``` swift
public struct GetDomainNameInputQueryItemMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = ClientRuntime.SerializeStepInput<GetDomainNameInput>
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<GetDomainNameOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<GetDomainNameOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "GetDomainNameInputQueryItemMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: ClientRuntime.SerializeStepInput<GetDomainNameInput>,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<GetDomainNameOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
