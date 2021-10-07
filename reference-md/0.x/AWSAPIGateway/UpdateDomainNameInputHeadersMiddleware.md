# UpdateDomainNameInputHeadersMiddleware

``` swift
public struct UpdateDomainNameInputHeadersMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = ClientRuntime.SerializeStepInput<UpdateDomainNameInput>
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<UpdateDomainNameOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<UpdateDomainNameOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "UpdateDomainNameInputHeadersMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: ClientRuntime.SerializeStepInput<UpdateDomainNameInput>,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<UpdateDomainNameOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
