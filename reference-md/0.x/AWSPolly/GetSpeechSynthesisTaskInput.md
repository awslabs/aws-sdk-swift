# GetSpeechSynthesisTaskInput

``` swift
public struct GetSpeechSynthesisTaskInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(taskId:)`

``` swift
public init (
        taskId: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `taskId`

The Amazon Polly generated identifier for a speech synthesis task.
This member is required.

``` swift
public var taskId: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
