# GetVpcLinkInputURLPathMiddleware

``` swift
public struct GetVpcLinkInputURLPathMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = GetVpcLinkInput
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<GetVpcLinkOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<GetVpcLinkOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "GetVpcLinkInputURLPathMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: GetVpcLinkInput,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<GetVpcLinkOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
