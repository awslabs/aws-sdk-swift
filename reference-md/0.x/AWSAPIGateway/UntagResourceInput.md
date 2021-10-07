# UntagResourceInput

Removes a tag from a given resource.

``` swift
public struct UntagResourceInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(resourceArn:tagKeys:)`

``` swift
public init (
        resourceArn: Swift.String? = nil,
        tagKeys: [Swift.String]? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `resourceArn`

\[Required\] The ARN of a resource that can be tagged.
This member is required.

``` swift
public var resourceArn: Swift.String?
```

### `tagKeys`

\[Required\] The Tag keys to delete.
This member is required.

``` swift
public var tagKeys: [Swift.String]?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
