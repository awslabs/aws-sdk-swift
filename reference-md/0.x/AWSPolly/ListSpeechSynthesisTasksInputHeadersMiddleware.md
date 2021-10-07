# ListSpeechSynthesisTasksInputHeadersMiddleware

``` swift
public struct ListSpeechSynthesisTasksInputHeadersMiddleware: ClientRuntime.Middleware 
```

## Inheritance

`ClientRuntime.Middleware`

## Nested Type Aliases

### `MInput`

``` swift
public typealias MInput = ClientRuntime.SerializeStepInput<ListSpeechSynthesisTasksInput>
```

### `MOutput`

``` swift
public typealias MOutput = ClientRuntime.OperationOutput<ListSpeechSynthesisTasksOutputResponse>
```

### `Context`

``` swift
public typealias Context = ClientRuntime.HttpContext
```

### `MError`

``` swift
public typealias MError = ClientRuntime.SdkError<ListSpeechSynthesisTasksOutputError>
```

## Initializers

### `init()`

``` swift
public init() 
```

## Properties

### `id`

``` swift
public let id: Swift.String = "ListSpeechSynthesisTasksInputHeadersMiddleware"
```

## Methods

### `handle(context:input:next:)`

``` swift
public func handle<H>(context: Context,
                  input: ClientRuntime.SerializeStepInput<ListSpeechSynthesisTasksInput>,
                  next: H) -> Swift.Result<ClientRuntime.OperationOutput<ListSpeechSynthesisTasksOutputResponse>, MError>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context,
    Self.MError == H.MiddlewareError
```
