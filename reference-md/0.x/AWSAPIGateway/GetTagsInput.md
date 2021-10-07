# GetTagsInput

Gets the Tags collection for a given resource.

``` swift
public struct GetTagsInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(limit:position:resourceArn:)`

``` swift
public init (
        limit: Swift.Int? = nil,
        position: Swift.String? = nil,
        resourceArn: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `limit`

(Not currently supported) The maximum number of returned results per page. The default value is 25 and the maximum value is 500.

``` swift
public var limit: Swift.Int?
```

### `position`

(Not currently supported) The current pagination position in the paged result set.

``` swift
public var position: Swift.String?
```

### `resourceArn`

\[Required\] The ARN of a resource that can be tagged.
This member is required.

``` swift
public var resourceArn: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
