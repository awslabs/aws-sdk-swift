# ListSpeechSynthesisTasksInput

``` swift
public struct ListSpeechSynthesisTasksInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(maxResults:nextToken:status:)`

``` swift
public init (
        maxResults: Swift.Int? = nil,
        nextToken: Swift.String? = nil,
        status: PollyClientTypes.TaskStatus? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `maxResults`

Maximum number of speech synthesis tasks returned in a List
operation.

``` swift
public var maxResults: Swift.Int?
```

### `nextToken`

The pagination token to use in the next request to continue the
listing of speech synthesis tasks.

``` swift
public var nextToken: Swift.String?
```

### `status`

Status of the speech synthesis tasks returned in a List
operation

``` swift
public var status: PollyClientTypes.TaskStatus?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
