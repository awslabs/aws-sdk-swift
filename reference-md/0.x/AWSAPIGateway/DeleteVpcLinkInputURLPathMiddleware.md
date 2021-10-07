# DeleteVpcLinkInputURLPathMiddleware

``` swift
public struct DeleteVpcLinkInputURLPathMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = DeleteVpcLinkInput
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<DeleteVpcLinkOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<DeleteVpcLinkOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "DeleteVpcLinkInputURLPathMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: DeleteVpcLinkInput,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<DeleteVpcLinkOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
