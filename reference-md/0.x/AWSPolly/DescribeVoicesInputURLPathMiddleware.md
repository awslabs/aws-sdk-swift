# DescribeVoicesInputURLPathMiddleware

``` swift
public struct DescribeVoicesInputURLPathMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = DescribeVoicesInput
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<DescribeVoicesOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<DescribeVoicesOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "DescribeVoicesInputURLPathMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: DescribeVoicesInput,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<DescribeVoicesOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
