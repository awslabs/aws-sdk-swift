# CreateVpcLinkInput

Creates a VPC link, under the caller's account in a selected region, in an asynchronous operation that typically takes 2-4 minutes to complete and become operational. The caller must have permissions to create and update VPC Endpoint services.

``` swift
public struct CreateVpcLinkInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(description:name:tags:targetArns:)`

``` swift
public init (
        description: Swift.String? = nil,
        name: Swift.String? = nil,
        tags: [Swift.String:Swift.String]? = nil,
        targetArns: [Swift.String]? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `description`

The description of the VPC link.

``` swift
public var description: Swift.String?
```

### `name`

\[Required\] The name used to label and identify the VPC link.
This member is required.

``` swift
public var name: Swift.String?
```

### `tags`

The key-value map of strings. The valid character set is \[a-zA-Z+-=.\_:​/\]. The tag key can be up to 128 characters and must not start with aws:​. The tag value can be up to 256 characters.

``` swift
public var tags: [Swift.String:Swift.String]?
```

### `targetArns`

\[Required\] The ARN of the network load balancer of the VPC targeted by the VPC link. The network load balancer must be owned by the same AWS account of the API owner.
This member is required.

``` swift
public var targetArns: [Swift.String]?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
