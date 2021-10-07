# TagResourceInput

Adds or updates a tag on a given resource.

``` swift
public struct TagResourceInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(resourceArn:tags:)`

``` swift
public init (
        resourceArn: Swift.String? = nil,
        tags: [Swift.String:Swift.String]? = nil
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

### `tags`

\[Required\] The key-value map of strings. The valid character set is \[a-zA-Z+-=.\_:​/\]. The tag key can be up to 128 characters and must not start with aws:​. The tag value can be up to 256 characters.
This member is required.

``` swift
public var tags: [Swift.String:Swift.String]?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
