# StartSpeechSynthesisTaskInputURLPathMiddleware

``` swift
public struct StartSpeechSynthesisTaskInputURLPathMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = StartSpeechSynthesisTaskInput
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<StartSpeechSynthesisTaskOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<StartSpeechSynthesisTaskOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "StartSpeechSynthesisTaskInputURLPathMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: StartSpeechSynthesisTaskInput,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<StartSpeechSynthesisTaskOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
